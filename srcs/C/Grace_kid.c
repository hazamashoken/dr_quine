# include <stdio.h>
# include <fcntl.h>
# include <unistd.h>
// One comment

# define ONE "# include <stdio.h>%2$c# include <fcntl.h>%2$c# include <unistd.h>%2$c// One comment%2$c%2$c# define ONE %3$c%1$s%3$c%2$c%2$c# define TWO return(0);%2$c%2$c# define THREE int main(void) { int fd = open(%3$cGrace_kid.c%3$c, O_RDWR | O_CREAT | O_TRUNC, 0644); dprintf(fd, ONE, ONE, 10, 34); close(fd); TWO}%2$c%2$cTHREE%2$c"

# define TWO return(0);

# define THREE int main(void) { int fd = open("Grace_kid.c", O_RDWR | O_CREAT | O_TRUNC, 0644); dprintf(fd, ONE, ONE, 10, 34); close(fd); TWO}

THREE
