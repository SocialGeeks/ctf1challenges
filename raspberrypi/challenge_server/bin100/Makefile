BIN=bin100
OBJ=$(patsubst %.c, %.o, $(wildcard *.c))

$(BIN) : $(OBJ)
	$(CC) -o $@ $^

%.o : %.c
	$(CC) -o $@ -c $<

.PHONY : clean

clean : 
	$(RM) $(OBJ) $(BIN)
