%{
#include<stdio.h>
int ext(int);
int a[]={0,0,0,0},valid=1,opnd=0,top=-1,i;
%}
%x oper
%%
["("] {top++;}
[a-zA-Z0-9]+ {BEGIN oper; opnd++;}
<oper>"+" {if(valid) {valid=0,i=0;} else ext(0);}
<oper>"-" {if(valid) {valid=0,i=1;} else ext(0);}
<oper>"*" {if(valid) {valid=0,i=2;} else ext(0);}
<oper>"/" {if(valid) {valid=0,i=3;} else ext(0);}
<oper>"(" {top++;}
<oper>")" {top--;}
<oper>[a-zA-Z0-9]+ {opnd++; if(valid==0){valid=1; a[i]++;} else ext(0);}
<oper>\n {if(valid==1 && top==-1) {printf("Valid Expression\n"); return 0;}
          else ext(0);}
.\n ext(0);
%%
int yywrap(){}
int ext(int x)
{ printf("\nInvalid Expression %d\n",x); 
  exit(0);
}
int main()
{
printf("Enter an Arithmetic expression\n");
yylex();
printf("number of operands = %d\n",opnd);
printf("number of + = %d\n",a[0]);
printf("number of - = %d\n",a[1]);
printf("number of * = %d\n",a[2]);
printf("number of / = %d\n",a[3]);
return 0;
}
