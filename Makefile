.PHONY: all program building lib prepare_dirs clean test

all: program

prepare_dirs:
	@mkdir -p build bin

#lib: prepare_dirs
##	@set -euo pipefail
#	@if [ ! -f "build/libmatrix.a" ]; then \
#		echo "Compile lib..."; \
#		g++ -c -g -ggdb -o build/dynamic_matrix.o lib/dynamic_matrix.cpp;\
#		g++ -c -g -ggdb -o build/input_output.o lib/input_output.cpp;\
#		ar rcs build/libmatrix.a build/input_output.o build/dynamic_matrix.o;\
#		echo "Finish compile lib.";\
#	else\
#		echo "Lib already compiled";\
#	fi

building: prepare_dirs #lib
	@echo "Compile project..."
	nasm -f elf64 -g -F dwarf src/algorithm.asm -o build/algorithm.o
	nasm -f elf64 -g -F dwarf src/try.asm -o build/try.o
	cmake -S . -B build -G Ninja --graphviz=build/scheme.dot
	dot -Tpng -o build/scheme.png build/scheme.dot
	cmake --build build
	mv build/asm bin/asm
#g++ -c -g -ggdb -nostdlib -o build/sim.o lib/sim.cpp
#	ld -m elf_x86_64 -T src/linker.ld -o build/program.bin build/sim.o build/algorithm.o
#g++ build/main.o build/algorithm.o build/try.o -Lbuild/ -lmatrix -o bin/program  -g -m64 -no-pie -z noexecstack -Wall

	@echo "Finish compile."

test: 
	ctest --test-dir build
	
program: building test

clean:
	@echo "Cleaning project..."
	rm -rf build/ 
	rm -f bin/program
	@echo "Done."