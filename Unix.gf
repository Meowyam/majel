abstract Unix = {

  flags startcat = Command ;

  cat
    Command ; Input ;

  fun
--   pipe : Command -> Command -> Command ;
--    grepWhat : Input -> Action -> Command ;
    ls : Input -> Command ;
    all, thisDir : Input ;

--    grep : Command ;
--    search_term : Input ;
}
