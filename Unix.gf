abstract Unix = {

  flags startcat = Command ;

  cat
    Command ; [Command]{1} ;
    Option ;
    Flag ; [Flag]{0} ;
    Path ;

-- [Flag]{1} generates
-- BaseFlag : Flag -> ListFlag
-- ConsFlag : Flag -> ListFlag -> ListFlag

  fun
--   pipe : Command -> Command -> Command ;
--    grepWhat : Input -> Action -> Command ;
    addFlag : Command -> [Flag] -> Command;

    ls : Command ;
    all : Flag ;
    long : Flag ;
    thisDir : Path ;
    home : Path ;
    cd : Path -> Command ;
    pipe : [Command] -> Command;
--    search_term : Input ;
}
