.PHONY: all program prepare_dirs clean

all: program

prepare_dirs:
	@mkdir -p build bin

program: prepare_dirs
	@echo "Compile project..."
	g++ -c -g -ggdb -o build/main.o src/main.cpp
	nasm -f elf64 -g -F dwarf src/algorithm.asm -o build/algorithm.o
	g++ -o bin/program build/main.o build/algorithm.o -m64 -no-pie -z noexecstack
	@echo "Finish compile."

clean:
	@echo "Cleaning project..."
	rm -f build/*.o
	rm -f bin/program
	@echo "Done."