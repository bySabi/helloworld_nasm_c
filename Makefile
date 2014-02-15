## Makefile automatic var´s: $@ $< $^
## http://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html

CXX := gcc
CXXFLAGS := -m32
LDFLAGS := -lc
NASMFLAGS := -f elf32

ifeq ($(OS),Windows_NT)
#CXXFLAGS += 
LDFLAGS =
NASMFLAGS := -f win32 --prefix _
endif


all: helloworld

helloworld: main.c hello.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

hello.o: hello.asm
	nasm $(NASMFLAGS) -o $@ $<


clean:
	rm -f *.o helloworld helloworld.exe
