#include <stdio.h>
#include <fcntl.h>
#define string_programme "#include <stdio.h>%1$c#include <fcntl.h>%1$c#define string_programme %2$c%3$s%2$c%1$c#define MAIN() int    main(){int fd = open(%2$cGrace_kid.c%2$c, O_WRONLY | O_CREAT | O_TRUNC , S_IRWXU | S_IRWXG | S_IROTH); if (fd < 0){return (1);}dprintf(fd, string_programme, 10, 34, string_programme);return (0);}%1$c%1$c//Commentaire%1$c%1$cMAIN()"
#define MAIN() int    main(){int fd = open("Grace_kid.c", O_WRONLY | O_CREAT | O_TRUNC , S_IRWXU | S_IRWXG | S_IROTH); if (fd < 0){return (1);}dprintf(fd, string_programme, 10, 34, string_programme);return (0);}

//Commentaire

MAIN()