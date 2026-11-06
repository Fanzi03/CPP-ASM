#!/bin/bash

nasm -f elf64 ./tools/algorithm.asm -o algorithm.o
g++ -Wall algorithm.o main.cpp -no-pie -o program && ./program
