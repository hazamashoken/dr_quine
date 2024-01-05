V = @

.PHONY: all
all: colleen grace sully

.PHONY: run
test: colleen grace sully

.PHONY: colleen
colleen:
	$(V)python Colleen.py > tmp_Colleen.py
	$(V)diff tmp_Colleen.py Colleen.py && echo -e "Python Colleen: \033[32mOK\033[0m" || echo -e "Python Colleen: \033[31mKO\033[0m"

.PHONY: grace
grace:
	$(V)python Grace.py
	$(V)diff Grace_kid.py Grace.py && echo -e "Python Grace: \033[32mOK\033[0m" || echo -e "Python Grace: \033[31mKO\033[0m"

.PHONY: sully
sully:
	$(V)mkdir -p test
	$(V)cp Sully.py test/Sully.py
	$(V)cd test && python Sully.py
	$(V)diff test/Sully_5.py Sully.py && echo -e "Python Sully: \033[32mOK\033[0m" || echo -e "Python Sully: \033[31mKO\033[0m"
	$(V)diff test/Sully_4.py Sully.py && echo -e "Python Sully: \033[31mKO\033[0m" || echo -e "Python Sully: \033[32mOK\033[0m"
	$(V)diff test/Sully_3.py Sully.py && echo -e "Python Sully: \033[31mKO\033[0m" || echo -e "Python Sully: \033[32mOK\033[0m"
	$(V)diff test/Sully_2.py Sully.py && echo -e "Python Sully: \033[31mKO\033[0m" || echo -e "Python Sully: \033[32mOK\033[0m"
	$(V)diff test/Sully_1.py Sully.py && echo -e "Python Sully: \033[31mKO\033[0m" || echo -e "Python Sully: \033[32mOK\033[0m"
	$(V)diff test/Sully_0.py Sully.py && echo -e "Python Sully: \033[31mKO\033[0m" || echo -e "Python Sully: \033[32mOK\033[0m"

.PHONY: clean
clean:
	$(V)rm -f tmp_Colleen.py
	$(V)rm -f Grace_kid.py
	$(V)rm -f Sully_*.py
	$(V)rm -rf test

.PHONY: fclean
fclean: clean

re: fclean all
