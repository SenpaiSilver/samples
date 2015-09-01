NAME= a.out
BINDIR= bin
ASM= nasm

SRCDIR= src
SRC= main.S

OBJDIR= obj
OBJ= $(SRC:%.S=obj/%.o)

LD_FLAGS= 
CC_FLAGS= -Wall -Wextra

$(OBJDIR)/%.o:$(SRCDIR)/%.S
	@mkdir -p $(OBJDIR)
	$(ASM) -f elf64 -o $@ $^

all:	$(NAME)

$(NAME):	$(OBJ)
	@mkdir -p $(BINDIR)
	ld -o $(BINDIR)/$(NAME) $(OBJ)

.PHONY:	clean, fclean, re
clean:
	rm -rf $(OBJ)

fclean:	clean
	rm -rf $(NAME)

re:	fclean all
