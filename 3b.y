%{
#include<stdio.h>
%}
%token NUM ID
% left '+'-'
% left '*'/'
%%
exp:e {printf("valid expression\n");printf("result %d\n"$1); return 0}
e:e'+'e {$$=$1+$3;}
|e'-'e {$$=$1-$3;}
|e'*'e {$$=$1*$3;}
|e'/'e {$$=$1/$3;}
|'('e')' {$$=$2;}
|NUM {$$=$1;}
%%
int main()
{
printf("enter an arthmetic expression\n");
yyparse();
return(0);
}
int yyerror()
{
printf("/nInvalid expressio\n");
return 0;
}
