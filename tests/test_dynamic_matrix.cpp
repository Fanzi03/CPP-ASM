#include "assert.h"
#include "iostream"
#include <dynamic_matrix.h>
#include <gtest/gtest.h>

TEST(TestArray, BasicAssertion){
    EXPECT_EQ(sizeof(init(1,1,sizeof(int))), sizeof(int*));
}