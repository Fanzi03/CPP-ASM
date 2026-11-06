#include "input_output.h"
#include <stdio.h>

#define clean_buffer while (getchar() != '\n')

void input_double_arr(double *arr, size_t len) {
  for (size_t i = 0; i < len; i++) {
    printf("Enter the number\n");
    scanf("%lf", arr + i);
  }
}
void print_double_arr(double *arr, size_t len) {
  printf("The size of array: %zu\n", len);
  for (size_t i = 0; i < len; i++) {
    printf("%lf ", arr[i]);
  }
}

void print_double_matrix(double *arr, size_t n, size_t m) {
  size_t real_size = n * m;
  for (size_t i = 0; i < real_size; i++) {
    if (i % m == 0 && i != 0)
      putchar('\n');
    printf("%lf ", *(arr + i));
  }
}

void input_int_arr(int *arr, size_t len) {
  for (size_t i = 0; i < len; i++) {
    printf("Enter the number\n");
    scanf("%d", arr + i);
  }
}

void print_int_arr(int *arr, size_t len) {
  printf("The size of array: %zu\n", len);
  for (size_t i = 0; i < len; i++) {
    printf("%d ", arr[i]);
  }
}

void print_int_matrix(int *arr, size_t n, size_t m) {
  size_t real_size = n * m;
  for (size_t i = 0; i < real_size; i++) {
    if (i % m == 0 && i != 0)
      putchar('\n');
    printf("%d ", *(arr + i));
  }
}
