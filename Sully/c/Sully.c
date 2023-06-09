#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

#define MAIN(v) int main(void){char    src_file[10], exec_file[10], exec_cmd[0x1FF]; int     fd, i = v; if (i <= 0){return (0);}sprintf(src_file, "Sully_%d.c", i);if (strcmp(__FILE__, src_file) == 0){i--;}sprintf(src_file, "Sully_%d.c", i);fd = open(src_file, O_WRONLY | O_CREAT | O_TRUNC , S_IRWXU | S_IRWXG | S_IROTH);if (fd < 0)return (1);dprintf(fd, string_programme, 10, 34, string_programme, i);sprintf(exec_file, "Sully_%d", i);sprintf(exec_cmd, "gcc %s -o %s", src_file, exec_file);system(exec_cmd);sprintf(exec_cmd, "./%s", exec_file);system(exec_cmd);close(fd);}
#define string_programme "#include <stdio.h>%1$c#include <string.h>%1$c#include <unistd.h>%1$c#include <fcntl.h>%1$c#include <stdlib.h>%1$c%1$c#define MAIN(v) int main(void){char    src_file[10], exec_file[10], exec_cmd[0x1FF]; int     fd, i = v; if (i <= 0){return (0);}sprintf(src_file, %2$cSully_%%d.c%2$c, i);if (strcmp(__FILE__, src_file) == 0){i--;}sprintf(src_file, %2$cSully_%%d.c%2$c, i);fd = open(src_file, O_WRONLY | O_CREAT | O_TRUNC , S_IRWXU | S_IRWXG | S_IROTH);if (fd < 0)return (1);dprintf(fd, string_programme, 10, 34, string_programme, i);sprintf(exec_file, %2$cSully_%%d%2$c, i);sprintf(exec_cmd, %2$cgcc %%s -o %%s%2$c, src_file, exec_file);system(exec_cmd);sprintf(exec_cmd, %2$c./%%s%2$c, exec_file);system(exec_cmd);close(fd);}%1$c#define string_programme %2$c%3$s%2$c%1$c%1$cMAIN(%4$d)%1$c"

MAIN(5)
