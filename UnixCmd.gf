concrete UnixCmd of Unix = open Prelude in {
  lincat
    Command = {s : Str};
    Path, Command, Flag = {s : Str};
    [Flag] = {s : Str; isEmpty : IsEmpty};
    [Command] = {s : Str; isEmpty : IsEmpty};
  param
    IsEmpty = Empty | NonEmpty ;
  lin
    --grep search_term =
    --  { s = "find " ++ search_term } ;
    addFlag c f = {s = c.s ++ f.s} ;
    ls = {s = "ls"} ;
    all = {s = "-a"} ;
    long = {s = "-l"} ;
    thisDir = {s = "."} ;
    home = {s = "~"};
    cd x = {s = "cd" ++ x.s} ;
    pipe x = {s = x.s} ;
    --pipe x y = {s = x.s ++ "|" ++ y.s} ;

    BaseFlag = {s = []; isEmpty = Empty} ;
    ConsFlag f fs = {s = f.s ++ fs.s; isEmpty = NonEmpty} ;

    BaseCommand f = {s = f.s; isEmpty = Empty} ;
    ConsCommand f fs =
      let sep : Str = case fs.isEmpty of {
        Empty => [] ;
        NonEmpty => " | " };
      in {s = f.s ++ sep ++ fs.s ; isEmpty = NonEmpty} ;



    --todo: -al instead of -a -l
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
