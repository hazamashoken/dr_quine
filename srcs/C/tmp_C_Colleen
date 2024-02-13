# include <stdio.h>
// Comment outside

char *code(void)
{
	return "# include <stdio.h>%3$c// Comment outside%3$c%3$cchar *code(void)%3$c{%3$c%2$creturn %4$c%1s%4$c;%3$c}%3$c%3$cint main(void)%3$c{%3$c%2$c// Comment inside%3$c%2$cprintf(code(), code(), 9, 10, 34);%3$c%2$creturn 0;%3$c}%3$c";
}

int main(void)
{
	// Comment inside
	printf(code(), code(), 9, 10, 34);
	return 0;
}
