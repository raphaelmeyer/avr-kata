INCLUDEPATH += $$PWD/../googlemock/include
DEPENDPATH += $$PWD/../googlemock/include

PRE_TARGETDEPS += $$OUT_PWD/../googlemock/libgmock.a

LIBS += -L$$OUT_PWD/../googlemock
LIBS += -lgmock -lpthread

