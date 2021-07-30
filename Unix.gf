abstract Unix = {

  flags startcat = Command ;

  cat
    Command ; [Command]{0} ;
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
    cd : Path -> Command ;
    pipe : [Command] -> Command;
--    search_term : Input ;
}
