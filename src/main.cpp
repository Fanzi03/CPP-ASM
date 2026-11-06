#include <iostream>
#include "../lib/dynamic_matrix.h"
//#include "../lib/input_output.h"

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
}

int main() {
  using namespace std;

  cout<< "Enter two elements that are n and m"<<endl;
  size_t a, b;
  cin >> a;
  cin >> b;
  
  
  int **matrix = (int**)init(a,b, sizeof(int));

  input_int_matrix(matrix,a,b);

  cout << sum_matrix(matrix, a, b) << endl;

  return 0;
}
