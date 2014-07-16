#include <gmock/gmock.h>

#include "digitaloutput.h"

unsigned char DDRB = 0;
unsigned char PORTB = 0;

TEST(A_Digital_Output, set_pin_as_output_on_creation)
{
    DigitalOutput<Port::B, Pin::P0> port_B_pin_0;
    ASSERT_TRUE(DDRB & (1 << 0));

    DigitalOutput<Port::B, Pin::P1> port_B_pin_1;
    ASSERT_TRUE(DDRB & (1 << 1));
}

TEST(A_Digital_Output, set_pin_low_on_creation)
{
    DigitalOutput<Port::B, Pin::P2> port_B_pin_2;
    ASSERT_FALSE(PORTB & (1 << 2));
}

