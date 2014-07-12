TEMPLATE = lib

CONFIG += staticlib warn_off
CONFIG -= qt

INCLUDEPATH += include

SOURCES += \
    src/ContextManager.cpp \
    src/CukeCommands.cpp \
    src/CukeEngine.cpp \
    src/CukeEngineImpl.cpp \
    src/HookRegistrar.cpp \
    src/main.cpp \
    src/Regex.cpp \
    src/Scenario.cpp \
    src/StepManager.cpp \
    src/Table.cpp \
    src/Tag.cpp \
    src/connectors/wire/WireProtocol.cpp \
    src/connectors/wire/WireProtocolCommands.cpp \
    src/connectors/wire/WireServer.cpp \
    src/drivers/GTestDriver.cpp

HEADERS += \
    include/cucumber-cpp/defs.hpp \
    include/cucumber-cpp/deprecated-defs.hpp

include(../common.pri)
include(../googlemock/gmock.pri)

