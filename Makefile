V = @

DEBUG = -g

NAME_COLLEEN =  Colleen
NAME_GRACE = Grace
NAME_SULLY = Sully

DIR = srcs

C_DIR = $(DIR)/C/
ASM_DIR = $(DIR)/ASM/

C_SRC_COLLEEN = Colleen.c
C_SRC_GRACE = Grace.c
C_SRC_SULLY = Sully.c

ASM_SRC_COLLEEN = Colleen.s
ASM_SRC_GRACE = Grace.s
ASM_SRC_SULLY = Sully.s


AS = nasm
CC = clang

CFLAGS = -Wall -Wextra -Werror -MMD $(DEBUG)
ASFLAGS = -f elf64 $(DEBUG)

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
all: $(C_DIR)/$(NAME_COLLEEN) \
	$(ASM_DIR)/$(NAME_COLLEEN) \
	$(C_DIR)/$(NAME_GRACE) \
	$(ASM_DIR)/$(NAME_GRACE) \
	$(C_DIR)/$(NAME_SULLY) \
	$(ASM_DIR)/$(NAME_SULLY)

.PHONY: test
test: test_c test_asm
	$(V)echo -e "Mandatory Test Done!\n"

test_bonus: test

.PHONY: test_c
test_c: re
	$(V)./$(C_DIR)/$(NAME_COLLEEN) > tmp_C_Colleen
	$(V)diff tmp_C_Colleen $(C_SRCS_COLLEEN) && echo -e "C Colleen: \033[32mOK\033[0m" || echo -e "C Colleen: \033[31mKO\033[0m"
	$(V)rm -f tmp_C_Colleen

	$(V)./$(C_DIR)/$(NAME_GRACE)
	$(V)diff Grace_kid.c $(C_SRCS_GRACE) && echo -e "C Grace: \033[32mOK\033[0m" || echo -e "C Grace: \033[31mKO\033[0m"
	$(V)rm -f Grace_kid.c

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
	$(V)rm -rf ./test/$(C_DIR)

.PHONY: test_asm
test_asm: re
	$(V)./$(ASM_DIR)/$(NAME_COLLEEN) > tmp_ASM_Colleen
	-$(V)diff tmp_ASM_Colleen $(ASM_SRCS_COLLEEN) && echo -e "ASM Colleen: \033[32mOK\033[0m" || echo -e "ASM Colleen: \033[31mKO\033[0m"
	$(V)rm -f tmp_ASM_Colleen

	$(V)./$(ASM_DIR)/$(NAME_GRACE)
	-$(V)diff Grace_kid.s $(ASM_SRCS_GRACE) && echo -e "ASM Grace: \033[32mOK\033[0m" || echo -e "ASM Grace: \033[31mKO\033[0m"
	$(V)rm -f Grace_kid.s

	$(v)mkdir -p test
	$(v)mkdir -p test/$(ASM_DIR)
	$(V)cp ./$(ASM_DIR)/$(NAME_SULLY) ./test/$(ASM_DIR)/$(NAME_SULLY)
	$(V)cd ./test/$(ASM_DIR) && ./$(NAME_SULLY)
	$(V)diff ./test/$(ASM_DIR)Sully_5.s $(ASM_SRCS_SULLY) && echo -e "ASM Sully: \033[32mOK\033[0m" || echo -e "ASM Sully: \033[31mKO\033[0m"
	$(V)diff ./test/$(ASM_DIR)Sully_4.s $(ASM_SRCS_SULLY) && echo -e "ASM Sully: \033[31mKO\033[0m" || echo -e "ASM Sully: \033[32mOK\033[0m"
	$(V)diff ./test/$(ASM_DIR)Sully_3.s $(ASM_SRCS_SULLY) && echo -e "ASM Sully: \033[31mKO\033[0m" || echo -e "ASM Sully: \033[32mOK\033[0m"
	$(V)diff ./test/$(ASM_DIR)Sully_2.s $(ASM_SRCS_SULLY) && echo -e "ASM Sully: \033[31mKO\033[0m" || echo -e "ASM Sully: \033[32mOK\033[0m"
	$(V)diff ./test/$(ASM_DIR)Sully_1.s $(ASM_SRCS_SULLY) && echo -e "ASM Sully: \033[31mKO\033[0m" || echo -e "ASM Sully: \033[32mOK\033[0m"
	$(V)diff ./test/$(ASM_DIR)Sully_0.s $(ASM_SRCS_SULLY) && echo -e "ASM Sully: \033[31mKO\033[0m" || echo -e "ASM Sully: \033[32mOK\033[0m"
	$(V)rm -rf ./test/$(ASM_DIR)

$(C_DIR)/$(NAME_COLLEEN): $(C_OBJ_COLLEEN)
	$(V)$(CC) $(CFLAGS) -o $(C_DIR)/$(NAME_COLLEEN) $(C_OBJ_COLLEEN)

$(C_DIR)/$(NAME_GRACE): $(C_OBJ_GRACE)
	$(V)$(CC) $(CFLAGS) -o $(C_DIR)/$(NAME_GRACE) $(C_OBJ_GRACE)

$(C_DIR)/$(NAME_SULLY): $(C_OBJ_SULLY)
	$(V)$(CC) $(CFLAGS) -o $(C_DIR)/$(NAME_SULLY) $(C_OBJ_SULLY)

$(ASM_DIR)/$(NAME_COLLEEN): $(ASM_OBJ_COLLEEN)
	$(V)$(CC) $(CFLAGS) -o $(ASM_DIR)/$(NAME_COLLEEN) $(ASM_OBJ_COLLEEN)

$(ASM_DIR)/$(NAME_GRACE): $(ASM_OBJ_GRACE)
	$(V)$(CC) $(CFLAGS) -o $(ASM_DIR)/$(NAME_GRACE) $(ASM_OBJ_GRACE)

$(ASM_DIR)/$(NAME_SULLY): $(ASM_OBJ_SULLY)
	$(V)$(CC) $(CFLAGS) -o $(ASM_DIR)/$(NAME_SULLY) $(ASM_OBJ_SULLY)

%.o: %.c
	$(V)$(CC) $(CFLAGS) -c $< -o $@

%.o: %.s
	$(V)$(AS) $(ASFLAGS) $< -o $@

.PHONY: clean
clean:
	$(V)rm -rf $(ASM_OBJ) $(C_OBJ) $(DEPEND)
	$(V)rm -rf test

.PHONY: fclean
fclean: clean
	$(V)rm -rf $(C_DIR)/$(NAME_COLLEEN) $(C_DIR)/$(NAME_GRACE) $(C_DIR)/$(NAME_SULLY)
	$(V)rm -rf $(ASM_DIR)/$(NAME_COLLEEN) $(ASM_DIR)/$(NAME_GRACE) $(ASM_DIR)/$(NAME_SULLY)

.PHONY: re
re: fclean all