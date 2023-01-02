//
// Created by jacken on 2023/1/2.
//
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char *argv[]) {
    int p1[2];
    int p2[2];
    pipe(p1);
    pipe(p2);
    int pid =fork();
    if(pid==-1){
        printf("fork failed!");
        exit(1);
    }
    if ( pid== 0) {
        close(p1[0]);
        char* s = ": received ping\n";
        char buf[100]={0};
        write(p1[1],s,strlen(s));
        close(p1[1]);
        close(p2[1]);
        read(p2[0],buf,sizeof(buf));
        printf("%d%s",getpid(),buf);
        close(p2[0]);
        exit(0);
    } else {
        close(p1[1]);
        char* s = ": received pong\n";
        char buf[100]={0};
        read(p1[0],buf,sizeof(buf));
        printf("%d%s",getpid(),buf);
        close(p1[0]);
        close(p2[0]);
        write(p2[1],s,strlen(s));
        close(p2[1]);
        wait(0);// this sentence is very important!!!
    }
    exit(0);
}
