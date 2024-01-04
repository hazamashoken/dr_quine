#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

#define CODE "#include <stdio.h>%3$c#include <fcntl.h>%3$c#include <unistd.h>%3$c%3$c#include <stdlib.h>%3$c%3$c#define CODE %4$c%1$s%4$c%3$c%3$cint main(void)%3$c{%3$c%2$cint = %5$i;%3$c%2$cif (i <= 0) return 0;%3$c%2$cchar filename[20];%3$c%2$csprintf(filename, %4$cSully_%%i.c%4$c, i);%3$c%2$cint fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, 0644);%3$c%2$cdprintf(fd, CODE, CODE, 9, 10, 34, i - 1);%3$c%2$cclose(fd);%3$c%2$cchar cmd_str[100];%3$c%2$csprintf(cmd_str, %4$cclang -o Sully %%s%4$c, filename);%3$c%2$csystem(cmd_str);%3$c%2$csystem(%4$c./Sully%4$c);%3$c%2$creturn (0);%3$c}%3$c"

int main(void)
{
	int i = 5;
	if (i <= 0) return 0;
	char filename[20];
	sprintf(filename, "Sully_%i.c", i);
	int fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, 0644);
	dprintf(fd, CODE, CODE, 9, 10, 34, i - 1);
	close(fd);
	char cmd_str[100];
	sprintf(cmd_str, "clang -o Sully %s", filename);
	system(cmd_str);
	system("./Sully");
	return (0);
}
