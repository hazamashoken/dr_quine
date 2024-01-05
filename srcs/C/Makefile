V = @

DEBUG = -g

NAME_COLLEEN =  Colleen
NAME_GRACE = Grace
NAME_SULLY = Sully

DIR = .

C_DIR = $(DIR)/
ASM_DIR = $(DIR)/

C_SRC_COLLEEN = Colleen.c
C_SRC_GRACE = Grace.c
C_SRC_SULLY = Sully.c

CC = clang

CFLAGS = -Wall -Wextra -Werror -MMD $(DEBUG)

C_SRCS_COLLEEN = $(addprefix $(C_DIR), $(C_SRC_COLLEEN))
C_SRCS_GRACE = $(addprefix $(C_DIR), $(C_SRC_GRACE))
C_SRCS_SULLY = $(addprefix $(C_DIR), $(C_SRC_SULLY))

C_OBJ_COLLEEN = $(C_SRCS_COLLEEN:.c=.o)
C_OBJ_GRACE = $(C_SRCS_GRACE:.c=.o)
C_OBJ_SULLY = $(C_SRCS_SULLY:.c=.o)

C_OBJ = $(C_OBJ_COLLEEN) $(C_OBJ_GRACE) $(C_OBJ_SULLY)


DEPEND = $(C_SRCS_COLLEEN:.c=.d) $(C_SRCS_GRACE:.c=.d) $(C_SRCS_SULLY:.c=.d)

.PHONY: all
all: $(C_DIR)/$(NAME_COLLEEN) \
	$(C_DIR)/$(NAME_GRACE) \
	$(C_DIR)/$(NAME_SULLY) \

.PHONY: test
test: test_c
	$(V)echo -e "Mandatory Test Done!\n"

test_bonus: test

.PHONY: test_c
test_c: re
	$(V)./$(C_DIR)/$(NAME_COLLEEN) > tmp_C_Colleen
	$(V)diff tmp_C_Colleen $(C_SRCS_COLLEEN) && echo -e "C Colleen: \033[32mOK\033[0m" || echo -e "C Colleen: \033[31mKO\033[0m"

	$(V)./$(C_DIR)/$(NAME_GRACE)
	$(V)diff Grace_kid.c $(C_SRCS_GRACE) && echo -e "C Grace: \033[32mOK\033[0m" || echo -e "C Grace: \033[31mKO\033[0m"

	$(v)mkdir -p test
	$(v)mkdir -p test/$(C_DIR)
	$(V)cp ./$(C_DIR)/$(NAME_SULLY) ./test/$(C_DIR)/$(NAME_SULLY)
	$(V)cd ./test/$(C_DIR) && ./$(NAME_SULLY)
	$(V)diff ./test/$(C_DIR)Sully_5.c $(C_SRCS_SULLY) && echo -e "C Sully: \033[32mOK\033[0m" || echo -e "C Sully: \033[31mKO\033[0m"
	$(V)diff ./test/$(C_DIR)Sully_4.c $(C_SRCS_SULLY) && echo -e "C Sully: \033[31mKO\033[0m" || echo -e "C Sully: \033[32mOK\033[0m"
	$(V)diff ./test/$(C_DIR)Sully_3.c $(C_SRCS_SULLY) && echo -e "C Sully: \033[31mKO\033[0m" || echo -e "C Sully: \033[32mOK\033[0m"
	$(V)diff ./test/$(C_DIR)Sully_2.c $(C_SRCS_SULLY) && echo -e "C Sully: \033[31mKO\033[0m" || echo -e "C Sully: \033[32mOK\033[0m"
	$(V)diff ./test/$(C_DIR)Sully_1.c $(C_SRCS_SULLY) && echo -e "C Sully: \033[31mKO\033[0m" || echo -e "C Sully: \033[32mOK\033[0m"
	$(V)diff ./test/$(C_DIR)Sully_0.c $(C_SRCS_SULLY) && echo -e "C Sully: \033[31mKO\033[0m" || echo -e "C Sully: \033[32mOK\033[0m"


$(C_DIR)/$(NAME_COLLEEN): $(C_OBJ_COLLEEN)
	$(V)$(CC) $(CFLAGS) -o $(C_DIR)/$(NAME_COLLEEN) $(C_OBJ_COLLEEN)

$(C_DIR)/$(NAME_GRACE): $(C_OBJ_GRACE)
	$(V)$(CC) $(CFLAGS) -o $(C_DIR)/$(NAME_GRACE) $(C_OBJ_GRACE)

$(C_DIR)/$(NAME_SULLY): $(C_OBJ_SULLY)
	$(V)$(CC) $(CFLAGS) -o $(C_DIR)/$(NAME_SULLY) $(C_OBJ_SULLY)


%.o: %.c
	$(V)$(CC) $(CFLAGS) -c $< -o $@


.PHONY: clean
clean:
	$(V)rm -rf $(ASM_OBJ) $(C_OBJ) $(DEPEND)
	$(V)rm -rf test tmp_C_Colleen Grace_kid.c

.PHONY: fclean
fclean: clean
	$(V)rm -rf $(C_DIR)/$(NAME_COLLEEN) $(C_DIR)/$(NAME_GRACE) $(C_DIR)/$(NAME_SULLY)
	$(V)rm -rf $(ASM_DIR)/$(NAME_COLLEEN) $(ASM_DIR)/$(NAME_GRACE) $(ASM_DIR)/$(NAME_SULLY)

.PHONY: re
re: fclean all