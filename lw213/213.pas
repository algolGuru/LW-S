PROGRAM Decryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
CONST
  Len = 20;
  NewCode = ['A' .. 'Z'] + [' ']; 
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY [CHAR] OF ' ' .. 'Z';
VAR
  Msg: Str;
  Code: Chiper;
  Length: INTEGER;
  CodeFile: TEXT;
  
PROCEDURE Initialize(VAR Code: Chiper; VAR ChiperFile: TEXT);
VAR
  Ch, CodeCh: CHAR;
{��������� Code ���� ������}
BEGIN {Initialize}
  WHILE NOT EOLN(ChiperFile)
  DO
    BEGIN
      IF (NOT EOLN(ChiperFile))
      THEN
        BEGIN
          READ(ChiperFile, Ch);
          IF (NOT EOLN(ChiperFile))
          THEN
            BEGIN
              READ(ChiperFile, CodeCh);
              Code[CodeCh] := Ch
            END 
        END;
      READLN(ChiperFile)  
    END
END;  {Initialize}
 
PROCEDURE Decode(VAR S: Str; VAR Length: INTEGER);
{������� ������� �� Code, ��������������� �������� �� S}
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
  {���������������� Code}
  ASSIGN(CodeFile, 'ChiperFile.TXT');
  RESET(CodeFile);
  Initialize(Code, CodeFile);
  WHILE NOT EOF
  DO
    BEGIN
      {������ ������ �  Msg � ����������� ��}
      Length := 0;
      WHILE NOT EOLN AND (Length < Len)
      DO
        BEGIN
          Length := Length + 1;
          READ(Msg[Length]);
          WRITE(Msg[Length])
        END;
      READLN;
      WRITELN;
      {����������� ������������ ���������}
      Decode(Msg, Length);
      WRITELN('������ ������� ������ = ', Length)
    END
END.  {Encryption}

