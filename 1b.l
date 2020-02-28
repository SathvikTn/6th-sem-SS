%{
#include<stdio.h>
int cc=0,nw=0;
%}
%x CMNT
%x CMNT1 
%%


"/*" {BEGIN CMNT;}

<CMNT>. ;
<CMNT>\n ;


<CMNT>"*/" {BEGIN 0;cc++;} 
"//" {BEGIN CMNT1;}
<CMNT1>. ;
<CMNT1>\n ; {BEGIN 0;nw++;}
%%
int yywrap(){}

int main(int argc,char *argv[])
{
if(argc!=3)
{
printf("Usage:%s<src_file><dest_file>\n",argv[0]);
return 0;
}
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("The number of comments:%d/n",cc);

return 0;

}



















