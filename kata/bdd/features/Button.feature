#language: en

Feature: Toogle button

    As a geek
    I want a button to turn a LED on and off
    In order to impress girls


Scenario: Turn LED on

    Given the device is running
    And the LED is turned off
    When I press the button
    Then the LED shall be turned on


Scenario: Turn LED off

    Given the device is running
    And the LED is turned on
    When I press the button
    Then the LED shall be turned off






