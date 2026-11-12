#include "chill.h"
#include "iostream"
//#include "../../lib/dynamic_matrix.h"

void **multiplie_matrixies(
    void **matrix1, size_t n1, size_t m1,
    void **matrix2, size_t n2, size_t m2,
    size_t size)
{
    using namespace std;
    if (n1 != m2)
    {
        cout << "wrong size" << endl;
        return NULL;
    }
    
    //void** result = init(n1, m2, size);
    
    /*
    for(size_t i = 0; i < n1; i++){
        for(size_t j = 0; j < n1; j++){
            for(size_t k = 0; k < m1; )                    

        }
    }
        */
    return NULL;
}