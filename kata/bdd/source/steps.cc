#include <gtest/gtest.h>
#include <cucumber-cpp/defs.hpp>

#include <simavr/sim_avr.h>

namespace {

GIVEN("^the device is running$") {
    avr_t * avr = avr_make_mcu_by_name("atmega168");
    avr_init(avr);
    // ...
}

GIVEN("^the LED is turned (on|off)$") {
    pending();
}

WHEN("^I press the button$") {
    pending();
}

THEN("^the LED shall be turned (on|off)$") {
    pending();
}

}

