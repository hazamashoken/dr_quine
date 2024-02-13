V = @
S = -s

DIR = ./srcs/

C_DIR = $(DIR)/C/
ASM_DIR = $(DIR)/ASM/
PY_DIR = $(DIR)/PY/

.PHONY: all
all: test_c test_asm test_py

.PHONY: test_c
test_c:
	$(V)$(MAKE) $(S) -C $(C_DIR) test

.PHONY: test_asm
test_asm:
	$(V)$(MAKE) $(S) -C $(ASM_DIR) test

.PHONY: test_py
test_py:
	$(V)$(MAKE) $(S) -C $(PY_DIR) test

.PHONY: clean
clean:
	$(V)$(MAKE) $(S) -C $(C_DIR) clean
	$(V)$(MAKE) $(S) -C $(ASM_DIR) clean
	$(V)$(MAKE) $(S) -C $(PY_DIR) clean


.PHONY: fclean
fclean: clean
	$(V)$(MAKE) $(S) -C $(C_DIR) fclean
	$(V)$(MAKE) $(S) -C $(ASM_DIR) fclean
	$(V)$(MAKE) $(S) -C $(PY_DIR) fclean

.PHONY: re
re: fclean all
