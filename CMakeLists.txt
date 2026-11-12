cmake_minimum_required(VERSION 3.14)
project(asm VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "-no-pie -Wall")

add_library(array STATIC
  lib/input_output.cpp
  lib/dynamic_matrix.cpp
)

target_include_directories(array PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}/lib
)

add_executable(asm
  src/main.cpp
  src/core/chill.cpp
  build/try.o
  build/algorithm.o
)

target_include_directories(asm PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/src/core
)

target_link_libraries(
  asm PRIVATE array
)

## GoogleTest requires at least C++17
#
#include(FetchContent)
#FetchContent_Declare(
#  googletest
#  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
#)
## For Windows: Prevent overriding the parent project's compiler/linker settings
#set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
#FetchContent_MakeAvailable(googletest)
#
#
#enable_testing()
#
#add_executable(
#  /test/main
#  /test/main.cc
#)
#target_link_libraries(
#  main
#  GTest::gtest_main
#)
#
#include(GoogleTest)
#gtest_discover_tests(main)