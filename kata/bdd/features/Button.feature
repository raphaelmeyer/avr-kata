#language: en

Feature: LED toogle button

    As The Cheat
    I want a button to turn a LED on and off
    In order throw lightswitch raves

Scenario: Initial state

    Given the device is powered on
    Then the LED is turned off


Scenario: Turn LED on

    Given the device is powered on
    When I press the button
    Then the LED is turned on


Scenario: Turn LED off

    Given the device is powered on
    When I press the button
    And I press the button again
    Then the LED is turned off






