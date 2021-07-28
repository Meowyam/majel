concrete UnixEng of Unix = open SyntaxEng,ParadigmsEng in {
  lincat
    Command = Imp;
    Option = NP;
  lin
    ls x = mkImp (mkVP (mkV2 "list") x);
    thisDir = mkNP (mkN "contents of this directory") ;
    all = mkNP (mkN "all") ;

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
