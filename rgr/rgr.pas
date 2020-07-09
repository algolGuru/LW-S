PROGRAM CountWords(INPUT, OUTPUT);
USES
  ReadUnit, TreeUnit;
VAR
  Root: Tree;
  Word: STRING;
  FInput, FOutput: TEXT;
  Leaves: INTEGER; 
PROCEDURE GetStatistic(VAR FInput, FOutput: TEXT);
BEGIN {GetStatistic}
  RESET(FInput);
  REWRITE(FOutput);
  WHILE NOT EOF(FInput)
  DO
    BEGIN
      Word := ReadWord(FInput);
      IF NOT(WordIsEmpty(Word))
      THEN
        Insert(Root, Word, Leaves);
    END;
  PrintTree(FOutput, Root);
  ClearTree(Root)  
END; {GetStatistic}
BEGIN {CountWords}
  ASSIGN(FInput, 'Fin.txt');
  ASSIGN(FOutput, 'Fout.TXT');
  GetStatistic(FInput, FOutput)                
END. {CountWords}
