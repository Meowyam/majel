abstract Unix = {
  
  flags startcat = Command ;

  cat
    Command ; Input ;

  fun
    pipe : Command -> Command -> Command ;
    grep : Input -> Command ; 
    ls : Command ;

    search_term : Input ;
}
