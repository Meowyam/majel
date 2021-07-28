abstract Unix = {

  flags startcat = Command ;

  cat
    Command ; Option ;

  fun
--   pipe : Command -> Command -> Command ;
--    grepWhat : Input -> Action -> Command ;
    ls : Option -> Command ;
    all, thisDir : Option ;

--    grep : Command ;
--    search_term : Input ;
}
