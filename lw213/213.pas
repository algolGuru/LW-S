PROGRAM Decryption(INPUT, OUTPUT);
{Ïåðåâîäèò ñèìâîëû èç INPUT â êîä ñîãëàñíî Chiper 
  è ïå÷àòàåò íîâûå ñèìâîëû â OUTPUT}
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
{ïðèñâîèòü Code øèôð çàìåíû}
BEGIN {Initialize}
  Error := FALSE;
  WHILE NOT EOF(ChiperFile) AND (NOT(Error)) 
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
        END
      ELSE
        Error := TRUE;
      READLN(ChiperFile)  
    END
END;  {Initialize}
 
PROCEDURE Decode(VAR S: Str; VAR Length: INTEGER);
{âûâîäèò ñèìâîëû èç Code, ñîîòâòåòñâóþùèå ñèìâîëàì èç S}
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
  {Èíèöèàëèçèðîâàòü Code}
  ASSIGN(CodeFile, 'ChiperFile.TXT');
  RESET(CodeFile);
  Initialize(Code, CodeFile, ErrorInFile);
  WHILE NOT EOF
  DO
    BEGIN
      {÷èòàòü ñòðîêó â  Msg è ðàñïå÷àòàòü åå}
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
      {Ðàñïå÷àòàòü êîäèðîâàííîå ñîîáùåíèå}
      IF NOT(ErrorInFile)
      THEN
        BEGIN
          Decode(Msg, Length);
          WRITELN('äëèííà âõîäíîé ñòðîêè = ', Length)
        END 
      ELSE
        WRITELN('Misstake')          
    END
END.  {Encryption}

