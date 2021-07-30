concrete UnixEng of Unix = open Prelude in {
  lincat
    Command = {s: Str};
    Path, Flag = {s : Str};
    [Flag] = {s : Str; isEmpty : IsEmpty};
    [Command] = {s : Str; isEmpty : IsEmpty};
  param
    IsEmpty = Empty | NonEmpty ;
  lin
    addFlag c f = {s = c.s ++ f.s} ;
    ls = {s = "list"} ;
    all = {s = "all"} ;
    long = {s = "long listing"} ;
    thisDir = {s = "this directory"} ;
    home = {s = "home directory"} ;
    cd x = {s = "change directory to " ++ x.s} ;
    pipe x = {s = x.s} ;

    BaseFlag = {s = [] ; isEmpty = Empty} ;
    ConsFlag f fs =
      let sep : Str = case fs.isEmpty of {
        Empty => [] ;
        NonEmpty => " and " };
      in {s = f.s ++ sep ++ fs.s ; isEmpty = NonEmpty} ;

    BaseCommand f = {s = f.s; isEmpty = Empty} ;
    ConsCommand f fs =
      let sep : Str = case fs.isEmpty of {
        Empty => [] ;
        NonEmpty => "then" };
      in {s = f.s ++ sep ++ fs.s ; isEmpty = NonEmpty} ;

-- todo: use rgl

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
