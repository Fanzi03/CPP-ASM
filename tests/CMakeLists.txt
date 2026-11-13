add_executable(test_array
    test_main.cc
)

target_link_libraries(
  test_array
  GTest::gtest_main
)

target_include_directories(test_array PRIVATE
    ${PROJECT_SOURCE_DIR}/lib
)

include(GoogleTest)
gtest_discover_tests(test_array)



