#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

#define CODE "#include <stdio.h>%3$c#include <fcntl.h>%3$c#include <unistd.h>%3$c#include <stdlib.h>%3$c#include <string.h>%3$c%3$c#define CODE %4$c%1$s%4$c%3$c%3$cint main(void)%3$c{%3$c%2$cint i = %5$i;%3$c%2$cif (i <= 0) return 0;%3$c%2$cchar filename[20];%3$c%2$cchar execname[20];%3$c%2$csprintf(filename, %4$cSully_%%i.c%4$c, i);%3$c%2$cif (strstr(__FILE__, filename)) i--;%3$c%2$csprintf(filename, %4$cSully_%%i.c%4$c, i);%3$c%2$csprintf(execname, %4$c./Sully_%%i%4$c, i);%3$c%2$cint fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, 0644);%3$c%2$cdprintf(fd, CODE, CODE, 9, 10, 34, i);%3$c%2$cclose(fd);%3$c%2$cchar cmd_str[100];%3$c%2$csprintf(cmd_str, %4$cclang -o %%s %%s%4$c, execname, filename);%3$c%2$csystem(cmd_str);%3$c%2$csystem(execname);%3$c%2$creturn (0);%3$c}%3$c"

int main(void)
{
	int i = 5;
	if (i <= 0) return 0;
	char filename[20];
	char execname[20];
	sprintf(filename, "Sully_%i.c", i);
	if (strstr(__FILE__, filename)) i--;
	sprintf(filename, "Sully_%i.c", i);
	sprintf(execname, "./Sully_%i", i);
	int fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, 0644);
	dprintf(fd, CODE, CODE, 9, 10, 34, i);
	close(fd);
	char cmd_str[100];
	sprintf(cmd_str, "clang -o %s %s", execname, filename);
	system(cmd_str);
	system(execname);
	return (0);
}
