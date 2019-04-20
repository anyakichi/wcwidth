CFLAGS += -O3 -Wall -Werror

ifeq ($(shell uname),Linux)
    TARGET=wcwidth.so
else
    TARGET=wcwidth.dylib
endif

all: $(TARGET)

wcwidth.so: wcwidth.o
	$(CC) -shared -o $@ $^ -lc

wcwidth.dylib: wcwidth.o
	$(CC) -dynamiclib -install_name $@ -o $@ $^ -lc

clean:
	rm -rf $(TARGET) *.o
