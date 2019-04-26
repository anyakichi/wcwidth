CFLAGS += -O3 -Wall -Wextra -Werror -fPIC
LDFLAGS = -ldl

ifeq ($(shell uname),Linux)
    TARGET = libwcwidth.so
else
    TARGET = libwcwidth.dylib
endif

all: $(TARGET)

libwcwidth.so: wcwidth.o
	$(CC) -shared -o $@ $^ $(LDFLAGS)

libwcwidth.dylib: wcwidth.o
	$(CC) -dynamiclib -install_name $@ -o $@ $^ $(LDFLAGS)

clean:
	rm -rf $(TARGET) *.o
