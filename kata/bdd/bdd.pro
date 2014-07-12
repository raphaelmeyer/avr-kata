TEMPLATE = app

CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

OTHER_FILES += \
    features/Button.feature

SOURCES += \
    source/steps.cc

LIBS += -lsimavr

include(../common.pri)
include(../cucumber-cpp/cucumber-cpp.pri)

