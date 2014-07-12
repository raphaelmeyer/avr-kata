INCLUDEPATH += $$PWD/../cucumber-cpp/include
DEPENDPATH += $$PWD/../cucumber-cpp/include

LIBS += -L$$OUT_PWD/../cucumber-cpp/
LIBS += -lcucumber-cpp
LIBS += -lboost_regex -lboost_system

CONFIG += warn_off

include(../googlemock/gmock.pri)

