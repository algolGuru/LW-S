UNIT TreeUnit;
INTERFACE

TYPE 
  Tree = ^NodeType;
  NodeType = RECORD
               TreeWord: STRING;
               CountOfWords: INTEGER;
               LLink, RLink: Tree
             END;

PROCEDURE Insert(VAR Ptr: Tree; Data: STRING; VAR LeavesCounter: INTEGER);

PROCEDURE PrintTree(VAR FOut: TEXT; VAR Ptr: Tree);

PROCEDURE ClearTree(VAR Ptr: Tree);      

IMPLEMENTATION
CONST
  LeavesMax = 10000;

             
VAR
  Root: Tree;

PROCEDURE Insert(VAR Ptr: Tree; Data: STRING; VAR LeavesCounter: INTEGER);
BEGIN                        
  IF LeavesCounter <= LeavesMax
  THEN   
    IF Ptr = NIL
    THEN
      BEGIN
        NEW(Ptr);
        Ptr^.TreeWord := Data;
        Ptr^.CountOfWords := Ptr^.CountOfWords + 1;
        LeavesCounter := LeavesCounter + 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL;
      END
    ELSE
      BEGIN
        IF Ptr^.TreeWord = Data
        THEN
          Ptr^.CountOfWords := Ptr^.CountOfWords + 1
        ELSE
          IF Ptr^.TreeWord > Data
          THEN
            Insert(Ptr^.LLink, Data, LeavesCounter)
          ELSE
            Insert(Ptr^.RLink, Data, LeavesCounter)    
      END  
END;

PROCEDURE PrintTree(VAR FOut: TEXT; VAR Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      PrintTree(FOut, Ptr^.LLink);
      WRITELN(FOut, Ptr^.TreeWord, ' ', Ptr^.CountOfWords);                                   
      PrintTree(FOut, Ptr^.RLink)
    END;
END;  {PrintTree}

PROCEDURE ClearTree(VAR Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      ClearTree(Ptr^.LLink);
      ClearTree(Ptr^.RLink);
      DISPOSE(Ptr);
      Ptr := NIL      
    END;
END;{PrintTree}

BEGIN
  Root := NIL     
END.
