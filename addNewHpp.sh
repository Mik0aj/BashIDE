#!/bin/bash

# Get input string from command line argument
input_string="$1"

# Create header file in ./src directory
src_file="./src/${input_string}.hpp"
echo "#pragma once" > "$src_file"
echo "// TODO: Implement ${input_string}.hpp" >> "$src_file"

# Create header file in ./test directory
test_file="./test/${input_string}Suite.hpp"
echo "#pragma once" > "$test_file"
echo "#include <gtest/gtest.h>" >> "$test_file"
echo "#include \"../src/${input_string}.hpp\"" >> "$test_file"
echo "TEST(${input_string}Suite, ExampleOne)" >> "$test_file"
echo "{" >> "$test_file"
echo "    // TODO: Add test case logic" >> "$test_file"
echo "    return 0;" >> "$test_file"
echo "}" >> "$test_file"

# Update ./test/test.cpp to include the newly created test suite as the second line
test_cpp_file="./test/test.cpp"
if ! grep -q "#include \"${input_string}Suite.hpp\"" "$test_cpp_file"; then
    sed -i "2s@^@#include \"${input_string}Suite.hpp\"\n@" "$test_cpp_file"
    echo "    // TODO: Add test suite initialization" >> "$test_cpp_file"
fi
