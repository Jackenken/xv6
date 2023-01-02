//
// Created by jacken on 2023/1/1.
//

//#include <stdio.h>
void debugout(char *s1,char *s2);
void debugprint(char *s, int i);

void
debugout(char *s1,char *s2)
{
//  \e represents converting the  meaning
// [31m represents red
// [0m represents closing the color.
    printf("\e[31mdebug:\e[0m%s:%s\n", s1,s2);
}
void
debugprint(char *s, int i)
{
//  \e represents converting the  meaning
// [31m represents red
// [0m represents closing the color.
    printf("\e[31mdebug:\e[0m%s:%d\n", s,i);
}

