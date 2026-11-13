#include <iostream>
#include <dynamic_matrix.h>
#include "chill.h"

extern "C" {
/*
  registers
    args: rdi, rsi, rdx, rcx, r8, r9
    return rax
    save: rbx, rbp, r12-15
*/
int max(int a, int b);
double get_average(int *arr, size_t size);
int sum(int a, int b);
int _sub(int a, int b);
int sum_matrix(int **matrix, size_t n, size_t m);
void* make_arr(size_t n, size_t size);
int* make_int_arr_with_init_value(size_t n, int value);
int* get_pointer_variable_to();
void** multiplie_matrixies(
  void **matrix1, size_t n1, size_t m1,
  void **matrix2, size_t n2, size_t m2,
  size_t size 
);
}

int main() {
  using namespace std;
  cout <<"hello"<<endl;
  cout<<(*get_pointer_variable_to())<<endl;


 multiplie_matrixies(NULL, 0, 0, NULL, 0,0 ,0);
  init(1,1,4);

  return 0;
}



