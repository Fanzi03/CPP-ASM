#include <iostream>

/*
  registers
    args: rdi, rsi, rdx, rcx, r8, r9
    return rax
    save: rbx, rbp, r12-15
*/
// extern "C" int max(int a, int b);
extern "C" {
double get_average(int *arr, size_t size);
int sum(int a, int b);
}

int main() {
  using namespace std;

  int a, b;
  cin >> a;
  cin >> b;

  cout << sum(a, b) << endl;

  return 0;
}
