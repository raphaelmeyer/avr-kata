TEMPLATE = app

CONFIG += testcase console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
    gpio_test.cc

include(../common.pri)
include(../application/application.pri)
include(../googlemock/gmock_main.pri)

