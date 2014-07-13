# Embedded AVR atmega 8bit GPIO kata

## Assignment



## Build and run

The qmake project provides the following make targets.

Run the unit tests:
```
make check
```

Run the feature tests:
```
make run-bdd
```

Download the _firmware_ to the AVR
```
make flash
```

## AVR GPIO cheatsheet

```cpp
#ifdef __AVR
// avr-gcc defines preprocessor variable __AVR
#endif

// set pin PB0 as output, PB7-PB1 as input
DDRB = _BV(PB0);

// set pin PB0 as input, PB7-PB1 as output
DDRB = ~(_BV(PB0));

// clear PB0
PORTB &= ~(_BV(PB0));

// set PB0
PORTB |= _BV(PB0);

// toggle PB0
PORTB ^= _BV(PB0);

// read port
unsigned port = PINB

// check pin PB0
bool state = PINB & _BV(PB0)
```

