%{
  #include<stdio.h>
  int idc=0;
%}

e [=][ ]*[0-9]+
ws [ \t]*
id [_a-z][_a-zA-Z0-9]*
dcln "int"|"float"|"char"|"double"|"short"|"long"|"unsigned"

%x defn
%%
{dcln} {BEGIN defn;}
<defn>{ws}{id}{ws}\, {idc++;}
<defn>{ws}{id}{ws}\; {BEGIN 0; idc++;}
<defn>{ws}{id}{ws}{e}{ws}\, {idc++;}
<defn>{ws}{id}{ws}{e}{ws}\; {BEGIN 0;idc++;}
<*>\n ;
<*>. ;
%%

int yywrap(){}
void main(int argc, char *argv[])
{
	if(argc==2){
		yyin = fopen(argv[1], "r");
		yylex();
		printf("number of identifiers=%d\n", idc);
		}
	else{
		printf("\nUsage:%s <src_file>\n", argv[0]);
		}
}

