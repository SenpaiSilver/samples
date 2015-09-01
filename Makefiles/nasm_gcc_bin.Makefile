NAME= a.out
BINDIR= bin
ASM= nasm
CC= gcc

SRCDIR= src
SRC_ASM= strlen.S
SRC_C= main.c
#SRC= main.c strlen.S

OBJDIR= obj
OBJ_C= $(SRC_C:%.c=obj/%.o)
OBJ_ASM= $(SRC_ASM:%.S=obj/%.o)
OBJ= $(patsubst %.c,obj/%.o,$(patsubst %.S,obj/%.o,$(SRC)))


LD_FLAGS= 
CC_FLAGS= -Wall -Wextra

$(OBJDIR)/%.o:$(SRCDIR)/%.S
	@mkdir -p $(OBJDIR)
	$(ASM) -f elf64 -o $@ $<

$(OBJDIR)/%.o:$(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CC_FLAGS) $(LD_FLAGS) -c $^ -o $@

all:	$(NAME)

$(NAME):	$(OBJ_C) $(OBJ_ASM)
	@mkdir -p $(BINDIR)
	$(CC) $(OBJ_C) $(OBJ_ASM) -o $(BINDIR)/$(NAME) $(CC_FLAGS) $(LD_FLAGS)
	#ld $(OBJ_C) $(OBJ_ASM) -o $(BINDIR)/$(NAME)

.PHONY:	clean, fclean, re
clean:
	rm -rf $(OBJ_C)
	rm -rf $(OBJ_ASM)

fclean:	clean
	rm -rf $(NAME)

re:	fclean all
