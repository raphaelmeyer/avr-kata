TEMPLATE = subdirs

SUBDIRS = \
    application \
    googlemock \
    cucumber-cpp \
    tdd \
    main \
    bdd

cucumber-cpp.depends += googlemock
tdd.depends += application googlemock
main.depends += application
bdd.depends += main cucumber-cpp

# BDD target

launch-wireserver.depends = sub-bdd
launch-wireserver.commands = cd $$OUT_PWD/bdd && ./bdd &

run-bdd.depends = launch-wireserver
run-bdd.commands = cd $$PWD/bdd && cucumber

QMAKE_EXTRA_TARGETS += launch-wireserver
QMAKE_EXTRA_TARGETS += run-bdd

# Flash firmware to hw target

flash.depends = sub-main
flash.commands = avrdude -c usbasp -p atmega168 -U flash:w:$$OUT_PWD/main/main.hex:i

QMAKE_EXTRA_TARGETS += flash

