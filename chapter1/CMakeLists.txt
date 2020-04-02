cmake_minimum_required(VERSION 3.13)
set(CMAKE_CXX_COMPILER g++)
project(
    hello
    VERSION 1.0
    LANGUAGES CXX
)
add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/hello.o
    COMMAND nasm -f elf64 -g -F dwarf ${CMAKE_SOURCE_DIR}/hello.asm -o ${CMAKE_CURRENT_BINARY_DIR}/hello.o
    DEPENDS hello.asm
)
add_executable(hello ${CMAKE_CURRENT_BINARY_DIR}/hello.o)
set_target_properties(hello PROPERTIES LINKER_LANGUAGE CXX)
target_compile_options(hello PRIVATE -no-pie)

