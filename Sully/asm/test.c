#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdbool.h>


int main(void){
	char    src_file[10], exec_file[10], exec_cmd[0x1FF];
	int     fd, i = v;  //replace with 5
	if (i <= 0){return (0);}

	sprintf(src_file, "Sully_%d.c", i);

	if (strcmp(__FILE__, src_file) == 0){i--;}

	sprintf(src_file, "Sully_%d.c", i);

	fd = open(src_file, O_WRONLY | O_CREAT | O_TRUNC , S_IRWXU | S_IRWXG | S_IROTH);

	if (fd < 0)return (1);


	dprintf(fd, string_programme, 10, 34, string_programme, i);



	sprintf(exec_file, "Sully_%d", i);

	sprintf(exec_cmd, "gcc %s -o %s", src_file, exec_file);

	system(exec_cmd);

	sprintf(exec_cmd, "./%s", exec_file);

	system(exec_cmd);

	close(fd);

}
