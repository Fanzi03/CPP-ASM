#pragma once
#include <stddef.h>

void **init(size_t n, size_t m, size_t size);
void **clear(void **A, size_t n);
void input_int_matrix(int **A, size_t n, size_t m);
void input_double_matrix(double **A, size_t n, size_t m);
void output_int_matrix(int **A, size_t n, size_t m);
void output_double_matrix(double **A, size_t n, size_t m);
