========================================================================
    Line64 
========================================================================

Line64 is designed for running ELF excutable in Windows environment.
Unlike the previous Edition of Line which is Line32, Line64 is running amd64 opcode and most of the function call is fastcall convention, so Line64 can't use ELF lazy binding. It must keep got orignal.
And there are some problem for loading default ELF64 excutable's address which is 0x400000 in windows, so if you want to use this ELFloader, you must set the base address of ELF excutable up to 0x800000 or some other address that won't cause windows VirtualAlloc fail. When you compile the ELF excutables, you must set the -fno-stack-protector flag, because the FS segment register in windows different from it in linux.
A sample makefile looks like below.
/*
all:
	gcc testlib.c -o testlib64 -Wl,-Ttext-segment=0x800000 -fno-stack-protector
clean:
	rm testlib64
*/
Line64 can not load FULL RELRO excutables now.
Line64 can not load statically linked excutable since linux syscalls are different from windows syscalls.
The project source code is tested on vs2015, it is working well.
The source code of the tested ELF excutable can be found below.
/*
*/
