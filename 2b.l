%{
#include<stdio.h>
%}
ws[" "\t\n]
words "and"|"AND"|"or"|"OR"|"but"|"BUT"
%%
{ws}{words}{ws} {printf("Compound sentence\n");exit(0);}
[\n] {return 0;}
. ;
%%
int yywrap(){ }
int main()
{
printf("Enter the sentence\n");
yylex();
printf("simple sentence\n");
return 0;
}

