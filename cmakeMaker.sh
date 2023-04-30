#!/bin/bash

# Check if project name is provided
if [ -z "$1" ]
  then
    echo "Usage: $0 project_name"
    exit 1
fi

# Create CMakeLists.txt file
echo "cmake_minimum_required(VERSION 3.10)

# Set project name
project($1)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Add test files
set(TEST_FILES
	test.cpp
	)

# Include Google Test
find_package(GTest REQUIRED)

# Add executable
add_executable(${PROJECT_NAME} main.cpp)

# Add testing executable
add_executable(${TEST_FILES}_test tests.cpp)
target_link_libraries(tests gtest gtest_main gmock)" > CMakeLists.txt

echo "Created CMakeLists.txt for project '$1' with Google Test."

