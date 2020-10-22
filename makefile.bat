del .\output\*.*

cd .\src
ca65 --cpu 6502 main.asm -o ..\output\main.o
ca65 --cpu 6502 ram_disk.asm -o ..\output\ram_disk.o
ca65 --cpu 6502 gameduino.asm -o ..\output\gameduino.o
ca65 --cpu 6502 spi.asm -o ..\output\spi.o
ca65 --cpu 6502 vectors.asm -o ..\output\vectors.o
ca65 --cpu 6502 acia.asm -o ..\output\acia.o
ca65 --cpu 6502 interrupts.asm -o ..\output\interrupts.o
ca65 --cpu 6502 utils.asm -o ..\output\utils.o



cd ..\output

ld65 -C ..\config\APP_RAM_DISK.cfg -m main.map main.o ram_disk.o utils.o spi.o acia.o gameduino.o interrupts.o vectors.o ..\library\p65.lib -o ..\output\RAM.bin
