UNIT ReadUnit;

INTERFACE

FUNCTION ReadWord(VAR FIn: TEXT): STRING; {collects the word}
     
FUNCTION WordIsEmpty(VAR Word: STRING): BOOLEAN; {Checks the read word for empty space}

IMPLEMENTATION
CONST
  Symbols = ['A' .. 'Z'] + ['a' .. 'z'] + ['À' .. 'ß'] + ['à' .. 'ÿ'];
  UpperCaseSymbols = ['A' .. 'Z'] + ['À' .. 'ß'];
  
PROCEDURE SymbolToLower(VAR Ch: CHAR);
BEGIN {SymbolToLower}
  IF Ch IN UpperCaseSymbols
  THEN
    Ch := chr(ord(Ch) + 32) 
END; {SymbolToLower}

FUNCTION WordIsEmpty(VAR Word: STRING): BOOLEAN;
BEGIN {IsFoundWord}
  IF Word = ''
  THEN
    WordIsEmpty := TRUE
  ELSE
    WordIsEmpty := FALSE
END; {IsFoundWord}

FUNCTION ReadWord(VAR FIn: TEXT): STRING;
VAR {ReadWord}
  Ch: CHAR;
  Word: STRING; 
BEGIN
  Word := '';
  IF NOT EOF(Fin)
  THEN
    READ(Fin, Ch);
  IF (Ch = '¸') OR (Ch = '¨')
      THEN
        Ch := 'å';     
  IF Ch IN Symbols
  THEN
    SymbolToLower(Ch);
  IF (Ch IN Symbols) AND (Ch <> ' ')
  THEN  
    Word := Word + Ch;  
  WHILE NOT(EOF(Fin)) AND (Ch IN Symbols)
  DO
    BEGIN
      READ(Fin, Ch);
      IF (Ch = '¸') OR (Ch = '¨')
      THEN
        Ch := 'å';      
      IF Ch IN UpperCaseSymbols
      THEN
        SymbolToLower(Ch);
      IF (Ch IN Symbols) AND (Ch <> ' ')
      THEN        
        Word := Word + Ch;
    END; 
    ReadWord := Word   
END; {ReadWord}
  
BEGIN     
END.
