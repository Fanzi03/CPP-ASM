.PHONY: all program lib prepare_dirs clean

all: program

prepare_dirs:
	@mkdir -p build bin

lib: prepare_dirs
#	@set -euo pipefail
	@if [ ! -f "build/libmatrix.a" ]; then \
		echo "Compile lib..."; \
		g++ -c -g -ggdb -o build/dynamic_matrix.o lib/dynamic_matrix.cpp;\
		g++ -c -g -ggdb -o build/input_output.o lib/input_output.cpp;\
		ar rcs build/libmatrix.a build/input_output.o build/dynamic_matrix.o;\
		echo "Finish compile lib.";\
	else\
		echo "Lib already compiled";\
	fi

program: prepare_dirs lib
	@echo "Compile project..."
	g++ -c -g -ggdb -o build/main.o src/main.cpp
	nasm -f elf64 -g -F dwarf src/algorithm.asm -o build/algorithm.o
	g++ build/main.o build/algorithm.o -Lbuild/ -lmatrix -o bin/program  -g -m64 -no-pie -z noexecstack -Wall
	@echo "Finish compile."

clean:
	@echo "Cleaning project..."
	rm -f build/*.o build/*.so build/*.a
	rm -f bin/program
	@echo "Done."