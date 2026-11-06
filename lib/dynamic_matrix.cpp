#include "dynamic_matrix.h"
#include "input_output.h"
#include <stdio.h>
#include <stdlib.h>

void **init(size_t n, size_t m, size_t size) {
  void **A =(void**) malloc(n * sizeof(&size));
  for (size_t i = 0; i < n; i++)
    A[i] = calloc(m, size);
  return A;
}
void **clear(void **A, size_t n) {
  for (size_t i = 0; i < n; i++)
    free(A[i]);
  free(A);
  return NULL;
}

void input_int_matrix(int **A, size_t n, size_t m) {
  for (size_t i = 0; i < n; i++) {
    input_int_arr(A[i], m);
  }
}
void input_double_matrix(double **A, size_t n, size_t m) {
  for (size_t i = 0; i < n; i++) {
    input_double_arr(A[i], m);
  }
}

void output_int_matrix(int **A, size_t n, size_t m) {
  for (size_t i = 0; i < n; i++) {
    putchar('\n');
    for (size_t j = 0; j < m; j++) {
      printf("%d ", A[i][j]);
    }
  }
}
void output_double_matrix(double **A, size_t n, size_t m) {
  for (size_t i = 0; i < n; i++) {
    putchar('\n');
    for (size_t j = 0; j < m; j++) {
      printf("%lf ", A[i][j]);
    }
  }
}
