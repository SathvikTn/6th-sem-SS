%{
#include<stdio.h>
int wc=0,cc=0,lc=0,bc=0;
char infile[25];
%}
word [^" "\t\n0-9]+
eol [\n]
spc [^a-zA-Z0=0" "\t\n]+
%%
{word} {wc++;cc+=yyleng}
{spc} {cc+=yyleng}
{eol} {lc++;cc++}
{" "} {bc++;cc++}
{\t} {bc+=8;cc++}
. {cc++}
%%
int yywrap(){}
int main()
{
printf("\n Read the input file");
scanf("%s",infile);
yyin=fopen(infile,"r");
yyleng();
printf("No. of chars=%d\n",cc);
printf("No. of words=%d\n",wc);
printf("No. of blank spaces=%d\n",bc);
printf("No. of lines=%d\n",lc);
return 0;
fclose(yyin);
}
