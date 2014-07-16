INCLUDEPATH += $$PWD/../googlemock/include/
DEPENDPATH += $$PWD/../googlemock/include/

PRE_TARGETDEPS += $$OUT_PWD/../googlemock/libgmock_main.a

LIBS += -L$$OUT_PWD/../googlemock
LIBS += -lgmock_main -lpthread

include(../googlemock/gmock.pri)

