#include <iostream>
//#include "../lib/dynamic_matrix.h"

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


}

int main() {
  using namespace std;
  cout <<"hello"<<endl;
  cout<<(*get_pointer_variable_to())<<endl;

  return 0;
}

