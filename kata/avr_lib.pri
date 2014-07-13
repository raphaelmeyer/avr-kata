AVR_F_CPU = 1000000
AVR_MCU = atmega168

avr_gcc.input = $$AVR_SOURCES
avr_gcc.output = ${QMAKE_FILE_BASE}.avr.o
avr_gcc.commands = avr-g++ -mmcu=$$AVR_MCU -Os -DF_CPU=$$AVR_F_CPU $$AVR_INCLUDES -c ${QMAKE_FILE_NAME} -o ${QMAKE_FILE_OUT}
avr_gcc.variable_out = AVR_OBJECTS
avr_gcc.CONFIG += no_link

QMAKE_EXTRA_COMPILERS += avr_gcc

avr_ar.input = AVR_OBJECTS
avr_ar.output = lib$$basename(TARGET)_avr.a
avr_ar.commands = avr-ar -r ${QMAKE_FILE_OUT} ${QMAKE_FILE_IN}
avr_ar.CONFIG += no_link combine target_predeps

QMAKE_EXTRA_COMPILERS += avr_ar

