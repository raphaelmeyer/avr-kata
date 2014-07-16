#ifndef DIGITALOUTPUT_H
#define DIGITALOUTPUT_H

enum class Port
{
    A,
    B,
    C,
    D
};

enum class Pin
{
    P0,
    P1,
    P2
};

template<Port port, Pin pin>
class DigitalOutput
{

};

#endif // DIGITALOUTPUT_H
