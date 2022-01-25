%{
  #include "y.tab.h"
  extern int yylval;
%}

%%

[0-9]+      { yylval = atoi(yytext); return T_Int;}
"+"         { return ADD_OP;  }
"-"         { return MIN_OP;  }
"*"         { return MUL_OP;  }
"/"         { return DIV_OP;  }
"("         { return LP; }
")"         { return RP; }
"\n"        { return yytext[0]; }
[ \t]+      {}
.           { return yytext[0]; }
%%
