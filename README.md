# Collection of scripts to turn bash into IDE

### BashIDE

This script creates a tmux session with two windows. The first window is split horizontally into two panes, with the left pane opening nvim and the right pane navigating to a build folder and running a cmake build command. The second window is named "Git" and runs a "git status" command. The script then attaches to the tmux session and selects the "Editor" window.

### lscd

This bash script takes a directory path as an argument and performs the following actions:

1. Changes the current working directory to the directory path provided.
1. Lists all the files and folders in the directory with numbers.
1. Prompts the user to either navigate into the corresponding directory or type "new" to create a new project.
If the user chooses "new", asks for a new project name creates three directories "src", "test", and "build" in the current directory, and populates them with the main.cpp file containing a "Hello, World!" program, test.cpp file containing a skeleton test case using Google Test framework, and a CMakeLists.txt file to build the project.
1. If the user chooses a directory number, the script checks if the selected item is a directory and navigates into it. Then it calls the bashIDE.sh script to open the selected directory in the VSCode editor.
1. If the user enters an invalid input, the script displays an error message and exits.

Usage: `./bashNavigator.sh /path/to/directory`

### addNewHpp

This script is used to generate a new C++ header file and a corresponding Google Test suite. It takes one command line argument, which is the name of the class or function being tested. The script creates a header file with the given name in the `./src directory`, and a test suite header file with the same name in the ./test directory. It also updates the `./test/test.cpp` file to include the newly created test suite. The TODO comments in the generated files should be replaced with actual implementation code and test cases.

Usage: `./create_test.sh [input_string]`

Example: `./create_test.sh MyFunction`

### cmakeMaker

This Bash script generates a CMakeLists.txt file for a new C++ project, including the Google Test framework. The name of the project is expected as the first argument when executing the script.

The script starts by checking if the project name argument is provided. If not, it prints a usage message and exits with an error code.

Next, the script creates the CMakeLists.txt file by echoing the required configuration to the file. The content includes the minimum required version of CMake, setting the project name, C++ standard, build type, and enabling the export of compilation commands.

