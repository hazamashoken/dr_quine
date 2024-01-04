V = @

NAME_COLLEEN =  Colleen
NAME_GRACE = Grace
NAME_SULLY = Sully

DIR = srcs

C_DIR = $(DIR)/C/
ASM_DIR = $(DIR)/ASM/

C_SRC_COLLEEN = Colleen.c
C_SRC_GRACE = Grace.c
C_SRC_SULLY = Sully.c


# Uncomment to use ASM
# ASM_SRC_COLLEEN = Colleen.s
# ASM_SRC_GRACE = Grace.s
# ASM_SRC_SULLY = Sully.s


AS = nasm
CC = gcc

CFLAGS = -Wall -Wextra -Werror -MMD -g
ASFLAGS = -f elf64

C_SRCS_COLLEEN = $(addprefix $(C_DIR), $(C_SRC_COLLEEN))
C_SRCS_GRACE = $(addprefix $(C_DIR), $(C_SRC_GRACE))
C_SRCS_SULLY = $(addprefix $(C_DIR), $(C_SRC_SULLY))

C_OBJ_COLLEEN = $(C_SRCS_COLLEEN:.c=.o)
C_OBJ_GRACE = $(C_SRCS_GRACE:.c=.o)
C_OBJ_SULLY = $(C_SRCS_SULLY:.c=.o)

C_OBJ = $(C_OBJ_COLLEEN) $(C_OBJ_GRACE) $(C_OBJ_SULLY)


ASM_SRCS_COLLEEN = $(addprefix $(ASM_DIR), $(ASM_SRC_COLLEEN))
ASM_SRCS_GRACE = $(addprefix $(ASM_DIR), $(ASM_SRC_GRACE))
ASM_SRCS_SULLY = $(addprefix $(ASM_DIR), $(ASM_SRC_SULLY))

ASM_OBJ_COLLEEN = $(ASM_SRCS_COLLEEN:.s=.o)
ASM_OBJ_GRACE = $(ASM_SRCS_GRACE:.s=.o)
ASM_OBJ_SULLY = $(ASM_SRCS_SULLY:.s=.o)

ASM_OBJ = $(ASM_OBJ_COLLEEN) $(ASM_OBJ_GRACE) $(ASM_OBJ_SULLY)

DEPEND = $(C_SRCS_COLLEEN:.c=.d) $(C_SRCS_GRACE:.c=.d) $(C_SRCS_SULLY:.c=.d)

.PHONY: all
all: $(NAME_COLLEEN) # $(NAME_GRACE) $(NAME_SULLY)

.PHONY: test
test: all
	$(V)./$(NAME_COLLEEN) > tmp_Colleen
	-$(V)diff tmp_Colleen $(C_SRCS_COLLEEN) && echo -e "Colleen: \033[32mOK\033[0m" || echo -e "Colleen: \033[31mKO\033[0m"
	$(V)rm -f tmp_Colleen

$(NAME_COLLEEN): $(ASM_OBJ_COLLEEN) $(C_OBJ_COLLEEN)
	$(V)$(CC) $(CFLAGS) -o $(NAME_COLLEEN) $(ASM_OBJ_COLLEEN) $(C_OBJ_COLLEEN)

$(NAME_GRACE): $(ASM_OBJ_GRACE) $(C_OBJ_GRACE)
	$(V)$(CC) $(CFLAGS) -o $(NAME_GRACE) $(ASM_OBJ_GRACE) $(C_OBJ_GRACE)

$(NAME_SULLY): $(ASM_OBJ_SULLY) $(C_OBJ_SULLY)
	$(V)$(CC) $(CFLAGS) -o $(NAME_SULLY) $(ASM_OBJ_SULLY) $(C_OBJ_SULLY)

.PHONY: clean
clean:
	$(V)rm -rf $(ASM_OBJ) $(C_OBJ) $(DEPEND)

.PHONY: fclean
fclean: clean
	$(V)rm -rf $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY)

.PHONY: re
re: fclean all