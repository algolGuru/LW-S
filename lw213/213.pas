PROGRAM Decryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
  NewCode = [' ' .. 'Z'];
  ValidCode = [' ', 'A' .. 'Z']; 
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY [CHAR] OF ' ' .. 'Z';
VAR
  Msg: Str;
  Code: Chiper;
  Length: INTEGER;
  CodeFile: TEXT;
  ErrorInFile: BOOLEAN;
  
PROCEDURE Initialize(VAR Code: Chiper; VAR ChiperFile: TEXT;  VAR Error: BOOLEAN);
VAR
  Ch, CodeCh: CHAR;
{присвоить Code шифр замены}
BEGIN {Initialize}
  Error := FALSE;
  WHILE NOT EOLN(ChiperFile) AND (NOT(Error)) 
  DO
    BEGIN
      READ(ChiperFile, Ch);
      IF (NOT EOLN(ChiperFile)) AND (Ch IN ValidCode)
      THEN
        BEGIN
          READ(ChiperFile, CodeCh);
          IF CodeCh IN NewCode
          THEN
            Code[CodeCh] := Ch
          ELSE
            Error := TRUE     
        END; 
      READLN(ChiperFile)  
    END
END;  {Initialize}
 
PROCEDURE Decode(VAR S: Str; VAR Length: INTEGER);
{выводит символы из Code, соотвтетсвующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  IF Length > 0 
  THEN
    BEGIN    
      FOR Index := 1 TO Length
      DO
        IF Code[S[Index]] IN NewCode
        THEN
          WRITE(Code[S[Index]])
        ELSE 
          WRITE(S[Index]);
      WRITELN
    END
END;  {Encode}
 
BEGIN {Encryption}
  ErrorInFile := FALSE;
  {Инициализировать Code}
  ASSIGN(CodeFile, 'ChiperFile.TXT');
  RESET(CodeFile);
  Initialize(Code, CodeFile, ErrorInFile);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в  Msg и распечатать ее}
      Length := 0;
      WHILE NOT EOLN AND (Length < Len)
      DO
        BEGIN
          Length := Length + 1;
          READ(Msg[Length]);
          IF Msg[Length] IN ValidCode
          THEN
            WRITE(Msg[Length])
          ELSE
            ErrorInFile := TRUE 
        END;
      READLN;
      WRITELN;
      {Распечатать кодированное сообщение}
      IF NOT(ErrorInFile)
      THEN
        BEGIN
          Decode(Msg, Length);
          WRITELN('длинна входной строки = ', Length)
        END 
      ELSE
        WRITELN('Misstake')          
    END
END.  {Encryption}

