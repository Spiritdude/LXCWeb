#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main(int n, char *argv[]) {
   setuid(0);
   if(1) {
      system("./lxcweb");
   } else {
      if(fork()==0) {
         execl("./lxcweb",0);
         exit(0);
      } else {
         wait(0);
      }
   }
   return(0);
}
