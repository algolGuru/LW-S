PROGRAM CountWords(INPUT, OUTPUT);
USES
  ReadUnit, TreeUnit;
VAR
  Root: Tree;
  Word: STRING;
  FInput, FOutput: TEXT;
  Leaves: INTEGER; 
PROCEDURE GetStatistic(VAR FInput, FOutput: TEXT);
BEGIN
  RESET(FInput);
  REWRITE(FOutput);
  WHILE NOT EOF(FInput)
  DO
    BEGIN
      Word := ReadWord(FInput);
      IF IsFoundWord(Word) = TRUE
      THEN
        Insert(Root, Word, Leaves);
    END;
  PrintTree(FOutput, Root);
  ClearTree(Root)  
END;
BEGIN
  ASSIGN(FInput, 'Fin.txt');
  ASSIGN(FOutput, 'Fout.TXT');
  GetStatistic(FInput, FOutput)                
END.
