## Makefile automatic var´s: $@ $< $^
## http://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html

CXX := gcc
CXXFLAGS := -m32
LDFLAGS := -lc
NASMARCH := elf32

all: helloworld

helloworld: main.c hello.o
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^

hello.o: hello.asm
	nasm -f $(NASMARCH) -o $@ $<


clean:
	rm -f *.o helloworld helloworld.exe
