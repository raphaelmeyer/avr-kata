#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <cucumber-cpp/defs.hpp>
#include <thread>
#include <mutex>
#include <functional>

#include <simavr/sim_avr.h>
#include <simavr/sim_elf.h>
#include <simavr/sim_io.h>
#include <simavr/avr_ioport.h>

namespace {

using cucumber::ScenarioScope;
using namespace ::testing;

struct AvrContext {
    AvrContext()
        : avr(nullptr)
        , mcu_name("atmega168")
        , elf_file("../main/main.elf")
        , avr_thread()
        , avr_mutex()
        , running(false)
    {}

    ~AvrContext() {
        running = false;
        avr_thread.join();
    }

    void set_button_pin(uint32_t value) {
        std::lock_guard<std::mutex> lock(avr_mutex);
        avr_raise_irq(avr_io_getirq(avr, AVR_IOCTL_IOPORT_GETIRQ('B'), IOPORT_IRQ_PIN1), value);
    }

    bool led_on() const {
        std::lock_guard<std::mutex> lock(avr_mutex);
        avr_ioport_state_t state;
        avr_ioctl(avr, AVR_IOCTL_IOPORT_GETSTATE('B'), &state);
        return (state.port & 0x01);
    }

    avr_t * avr;
    std::string mcu_name;
    std::string elf_file;
    std::thread avr_thread;
    mutable std::mutex avr_mutex;
    bool running;
};

void simavr_loop(avr_t * avr, std::mutex & mutex, bool const & running) {
    while(running) {
        std::lock_guard<std::mutex> lock(mutex);
        int state = avr_run(avr);
        if(state == cpu_Done || state == cpu_Crashed) {
            break;
        }
    }
}

GIVEN("^the device is powered on$") {
    ScenarioScope<AvrContext> context;

    elf_firmware_t fw;
    elf_read_firmware(context->elf_file.c_str(), &fw);
    strcpy(fw.mmcu, context->mcu_name.c_str());
    fw.frequency = 1000000;

    context->avr = avr_make_mcu_by_name(fw.mmcu);

    ASSERT_THAT(context->avr, NotNull());

    avr_init(context->avr);
    avr_load_firmware(context->avr, &fw);

    context->running = true;
    context->avr_thread = std::thread(
                simavr_loop, context->avr,
                std::ref(context->avr_mutex),
                std::ref(context->running));
}

WHEN("^I press the button(?: again)?$") {
    ScenarioScope<AvrContext> context;

    context->set_button_pin(1);
    std::this_thread::sleep_for(std::chrono::milliseconds(2));
    context->set_button_pin(0);
    std::this_thread::sleep_for(std::chrono::milliseconds(10));
    context->set_button_pin(1);
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    context->set_button_pin(0);
    std::this_thread::sleep_for(std::chrono::milliseconds(10));
    context->set_button_pin(1);
    std::this_thread::sleep_for(std::chrono::milliseconds(2));
    context->set_button_pin(0);
}

THEN("^the LED is turned (on|off)$") {
    ScenarioScope<AvrContext> context;

    REGEX_PARAM(std::string, led_state);
    bool const expected_led_on = (led_state == "on");

    ASSERT_THAT(context->led_on(), Eq(expected_led_on));
}

}

