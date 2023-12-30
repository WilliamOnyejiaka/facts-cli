cmake_minimum_required(VERSION 3.12)
project(MyProject)

# Directories
set(SRC_DIR src)
set(INC_DIR include)
set(BIN_DIR bin)

# Source files
file(GLOB_RECURSE C_SOURCES ${SRC_DIR}/*.c)
file(GLOB_RECURSE CPP_SOURCES ${SRC_DIR}/*.cpp)

# Include directories
include_directories(${INC_DIR})

# Output executable
set(TARGET myprogram)

# Set C and C++ standards
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)

# Find Boost
find_package(Boost REQUIRED COMPONENTS system thread)
# find_package(Boost REQUIRED)

# Find OpenSSL
find_package(OpenSSL REQUIRED)

# Find CppRestSDK
find_package(cpprestsdk REQUIRED)

# Create executable
add_executable(${TARGET} ${C_SOURCES} ${CPP_SOURCES})

# Link libraries
target_link_libraries(${TARGET} Boost::system Boost::thread OpenSSL::SSL OpenSSL::Crypto cpprestsdk::cpprest)
