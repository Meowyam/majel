concrete UnixE of Unix = open Prelude in {
  lincat
    Command = SS;
    Input = Str;
  lin
    grep search_term =
      { s = "find " ++ search_term } ;
    ls = { s = "list all files" } ;
    pipe cmd1 cmd2 = multi cmd1 cmd2;

    search_term = "string" ;
  oper
    multi : SS -> SS -> SS = \x,y -> ss("first " ++ x.s ++ " then " ++ y.s);
}
