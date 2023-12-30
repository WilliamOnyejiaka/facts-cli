# Compiler
CXX := g++

# Directories
SRC_DIR := src
INC_DIR := include
BIN_DIR := bin

# Source and Header file lists
C_SRCS := $(wildcard $(SRC_DIR)/*.c) $(wildcard $(SRC_DIR)/utils/*.c) $(wildcard $(SRC_DIR)/modules/*.c)
CPP_SRCS := $(wildcard $(SRC_DIR)/*.cpp) $(wildcard $(SRC_DIR)/utils/*.cpp) $(wildcard $(SRC_DIR)/modules/*.cpp)
INCS := $(wildcard $(INC_DIR)/*.h) $(wildcard $(INC_DIR)/utils/*.h) $(wildcard $(INC_DIR)/modules/*.h)

# Object files
C_OBJS := $(patsubst $(SRC_DIR)/%.c, $(BIN_DIR)/%.o, $(C_SRCS))
CPP_OBJS := $(patsubst $(SRC_DIR)/%.cpp, $(BIN_DIR)/%.o, $(CPP_SRCS))

# Compiler flags
# CFLAGS := -I$(INC_DIR)
CXXFLAGS := -std=c++11 -I$(INC_DIR)

# Output executable
TARGET := app

all: $(TARGET)

$(TARGET): $(C_OBJS) $(CPP_OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $(BIN_DIR)/$@ -lcpprest -lcrypto

$(BIN_DIR)/%.o: $(SRC_DIR)/%.c $(INCS)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp $(INCS)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BIN_DIR)

.PHONY: all clean
