UNIT ReadUnit;

INTERFACE

FUNCTION ReadWord(VAR FIn: TEXT): STRING;

FUNCTION IsFoundWord(VAR Word: STRING): BOOLEAN;      

IMPLEMENTATION
CONST
  Symbols = ['A' .. 'Z'] + ['a' .. 'z'] + ['À' .. 'ß'] + ['à' .. 'ÿ'];
  UpperCaseSymbols = ['A' .. 'Z'] + ['À' .. 'ß'];
  
PROCEDURE SymbolToLower(VAR Ch: CHAR);
BEGIN
  IF Ch IN UpperCaseSymbols
  THEN
    Ch := chr(ord(Ch) + 32) 
END;

FUNCTION IsFoundWord(VAR Word: STRING): BOOLEAN;
BEGIN
  IF Word <> ''
  THEN
    IsFoundWord := TRUE
  ELSE
    IsFoundWord := FALSE    
END;

FUNCTION ReadWord(VAR FIn: TEXT): STRING;
VAR
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
END;
  
BEGIN     
END.
