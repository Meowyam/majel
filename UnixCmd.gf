concrete UnixCmd of Unix = open Prelude in {
  lincat
    Command = SS;
    Input = Str;
  lin
    --grep search_term =
    --  { s = "find " ++ search_term } ;
    ls x = {s = "ls " ++ x } ;
    all = "-a" ;
    thisDir = "." ;
    --pipe cmd1 cmd2 = multi cmd1 cmd2;

    --search_term = "string" ;
--   oper
--     multi : SS -> SS -> SS = \x,y -> ss("first " ++ x.s ++ " then " ++ y.s);
-- }

--  grepWhat grep search_term = mkCl
--        grep search_term ;
--     grep search_term =
--       { s = "find " ++ search_term } ;
--     ls = { s = "list all files" } ;
--     pipe cmd1 cmd2 = multi cmd1 cmd2;

--    grep = mkV2 search_V ;
--    search_term = mkN "string" ;
--  oper
--    multi : SS -> SS -> SS = \x,y -> ss("first " ++ x.s ++ " then " ++ y.s);
}
