%{
    extern int yylval;
    extern char* yytext;
    void yyerror(char* error);
    int yylex();

    void setInt(int i);
    int getInt();
%}

%token T_Int ADD_OP MIN_OP MUL_OP DIV_OP LP RP
%left ADD_OP
%left MIN_OP
%left MUL_OP
%left DIV_OP
%%

S   :   S E  '\n'  { printf(" => %d\n", getInt()); }
    |   E    '\n'  { printf(" => %d\n", getInt()); }
    ;

E   :   E MUL_OP E { $$ = $1 * $3; setInt($$); printf("MUL: %d * %d = %d\n", $1, $3, getInt()); }
    |   E DIV_OP E { $$ = $1 / $3; setInt($$); printf("DIV: %d / %d = %d\n", $1, $3, getInt()); }
    |   E ADD_OP E { $$ = $1 + $3; setInt($$); printf("ADD: %d + %d = %d\n", $1, $3, getInt()); }
    |   E MIN_OP E { $$ = $1 - $3; setInt($$); printf("MIN: %d - %d = %d\n", $1, $3, getInt()); }
    |   F          { $$ = $1; setInt($$); }
    ;

F   :   T_Int
    |   LP E RP    { $$ = $2; setInt($$); }
    ;

%%

int v;
void setInt(int i){
    v = i;
}
int getInt(){
    return v;
}