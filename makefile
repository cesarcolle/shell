DOBJ=obj
DINC=inc
DSRC=src
FLAGS=-Wall
OBJ=$(DOBJ)/file_processing.o $(DOBJ)/shell.o $(DOBJ)/environs_processing.o $(DOBJ)/parsing.o $(DOBJ)/main.o

shell.exe:$(OBJ)
	gcc $(FLAGS) $(OBJ) -o shell.exe

$(DOBJ)/file_processing.o:
	gcc $(FLAGS) -c $(DSRC)/file_processing.c -o $(DOBJ)/file_processing.o

$(DOBJ)/shell.o: $(DOBJ)/file_processing.o $(DOBJ)/environs_processing.o $(DOBJ)/parsing.o $(DINC)/shell.h
	gcc $(FLAGS) -c $(DSRC)/shell.c -o $(DOBJ)/shell.o

$(DOBJ)/environs_processing.o:
	gcc $(FLAGS) -c $(DSRC)/environs_processing.c -o $(DOBJ)/environs_processing.o

$(DOBJ)/parsing.o:
	gcc $(FLAGS) -c $(DSRC)/parsing.c -o $(DOBJ)/parsing.o

$(DOBJ)/main.o:
	gcc $(FLAGS) -c $(DSRC)/main.c -o $(DOBJ)/main.o

create_library:
	ar -r lib_shell.a $(OBJ)

open:
	gedit ./$(DSRC)/* ./$(DINC)/* makefile 

clean:
	rm -f *.out
	rm -f *.exe
	rm -f *~
	rm -f ./$(DSRC)/*~
	rm -f ./$(DINC)/*~
	rm -f ./$(DOBJ)/*
	
