NAME= a.out
BINDIR= bin
BINPATH=$(BINDIR)/$(NAME)
ASM= nasm
CC= gcc

SRCDIR= src
SRC_ASM= strlen.S
SRC_C= main.c

OBJDIR= obj
OBJ_C= $(SRC_C:%.c=obj/%.o)
OBJ_ASM= $(SRC_ASM:%.S=obj/%.o)

LD_FLAGS= 
CC_FLAGS= -Wall -Wextra

all: $(BINPATH)

$(NAME): $(BINPATH)

$(OBJ_ASM):$(SRCDIR)/$(SRC_ASM)
	@mkdir -p $(OBJDIR)
	$(ASM) -g -f elf64 -F stabs -o $@ $<

$(OBJ_C):$(SRCDIR)/$(SRC_C)
	@mkdir -p $(OBJDIR)
	$(CC) $(CC_FLAGS) $(LD_FLAGS) -c $< -o $@

$(BINPATH):	$(OBJ_ASM) $(OBJ_C) 
	@mkdir -p $(BINDIR)
	$(CC) $(OBJ_C) $(OBJ_ASM) -o $(BINDIR)/$(NAME) $(CC_FLAGS) $(LD_FLAGS)

.PHONY:	clean, fclean, re
clean:
	rm -rf $(OBJ_C)
	rm -rf $(OBJ_ASM)

fclean:	clean
	rm -rf $(BINDIR)/$(NAME)

re:	fclean all
