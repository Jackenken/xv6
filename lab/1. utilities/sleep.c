//
// Created by jacken on 2023/1/2.
//

#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
    if(argc!=2){
        printf("Usage: sleep [seconds]");
    } else{
        sleep(atoi(argv[1]));
    }
    exit(0);
}


