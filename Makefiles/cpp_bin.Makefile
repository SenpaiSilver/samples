NAME= a.out
BINDIR= bin
CC= g++

SRCDIR= src
SRC= main.cpp

OBJDIR= obj
OBJ= $(SRC:%.cpp=obj/%.o)

LD_FLAGS= -ldl
CC_FLAGS= -Wall -Wextra

$(OBJDIR)/%.o:$(SRCDIR)/%.cpp
	@mkdir -p $(OBJDIR)
	$(CC) $(CC_FLAGS) $(LD_FLAGS) -c $^ -o $@

all:	$(NAME)

$(NAME):	$(OBJ)
	@mkdir -p $(BINDIR)
	$(CC) $(OBJ) -o $(BINDIR)/$(NAME) $(CC_FLAGS) $(LD_FLAGS)

.PHONY:	clean, fclean, re
clean:
	rm -rf $(OBJ)
	#@rm -rf $(OBJDIR)

fclean:	clean
	rm -rf $(NAME)
	#@rm -rf $(BINDIR)

re:	fclean all
