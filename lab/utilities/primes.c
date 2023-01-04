//
// Created by jacken on 2023/1/2.
//



#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
void plines(int* p1);
int main(int argc, char *argv[]) {

    int p[2];
    int pp = pipe(p);
    int pid =fork();
    if(pid==-1){
        printf("fork failed!");
        exit(1);
    }
    if(pp==-1){
        printf("pipe failed!");
        exit(0);
    }
    if (pid== 0){
        plines(p);
    } else {
        close(p[0]);
        int num=1;
        while (num++<=35) {
            write(p[1], &num, sizeof(num) );
        }
        close(p[1]);
        wait(0);
    }
    exit(0);
}

void plines(int* p1){
    int buf=1;
    close(p1[1]);
    int first = 1;
    int p2[2];
    int pp = pipe(p2);
    if(pp==-1){
//        printf("pipe failed!");
        exit(0);
    }
    int pid=fork();
    if (pid==-1){
//        printf("fork failed!");
        exit(1);
    }
    if(pid==0){
        plines(p2); // can return ?
    } else {
        close(p2[0]);
        while (read(p1[0], &buf, sizeof(buf)) != 0) {
            if (first == 1) {
                first = buf;
                printf("prime %d\n", buf);
            } else {
                //  send
                if (buf % first != 0) {
                    write(p2[1], &buf, sizeof(buf));
                }
            }
        }
        close(p1[0]);
        close(p2[1]);
        wait(0);
    }
    exit(0);
}
