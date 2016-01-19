NAME= a.out
BINDIR= bin
CC= gcc

SRCDIR= src
SRC= main.c

OBJDIR= obj
OBJ= $(SRC:%.c=obj/%.o)

LD_FLAGS= 
CC_FLAGS= -Wall -Wextra

$(OBJDIR)/%.o:$(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CC_FLAGS) $(LD_FLAGS) -c $^ -o $@

all:	$(BINDIR)/$(NAME)

$(NAME):	$(BINDIR)/$(NAME)

$(BINDIR)/$(NAME):	$(OBJ)
	@mkdir -p $(BINDIR)
	$(CC) $(OBJ) -o $(BINDIR)/$(NAME) $(CC_FLAGS) $(LD_FLAGS)

.PHONY:	clean, fclean, re
clean:
	rm -rf $(OBJ)

fclean:	clean
	rm -rf $(NAME)

re:	fclean all
