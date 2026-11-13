cmake_minimum_required(VERSION 3.14)
project(asm VERSION 0.0.1 LANGUAGES CXX)

option(ENABLE_TESTS "Build and run tests" ON)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "-no-pie -Wall")
#set(SOURCE src/try.s )

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

if(ENABLE_TESTS)
  include(FetchContent)
  FetchContent_Declare(
      googletest
      GIT_REPOSITORY https://github.com/google/googletest.git
      GIT_TAG        v1.16.0
  )
  FetchContent_MakeAvailable(googletest)

  enable_testing()
  add_subdirectory(tests)

#  add_test(NAME array_test COMMAND test_array)
endif()
