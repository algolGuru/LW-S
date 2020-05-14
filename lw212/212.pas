PROGRAM Encryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
CONST
  Len = 20;
  NewCode = ['A' .. 'Z'] + [' ']; 
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  Length: INTEGER;
  CodeFile: TEXT;
  
PROCEDURE Initialize(VAR Code: Chiper; VAR ChipperFile: TEXT);
VAR
  Ch, CodeCh: CHAR;
{��������� Code ���� ������}
BEGIN {Initialize}
  WHILE NOT EOLN(ChipperFile)
  DO
    BEGIN
      IF (NOT EOLN(ChipperFile))
      THEN
        BEGIN
          READ(ChipperFile, Ch);
          IF (NOT EOLN(ChipperFile))
          THEN
            BEGIN
              READ(ChipperFile, CodeCh);
              Code[Ch] := CodeCh
            END 
        END;
      READLN(ChipperFile)  
    END
END;  {Initialize}
 
PROCEDURE Encode(VAR S: Str; VAR Length: INTEGER);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  IF Length > 0 
  THEN
    BEGIN    
      FOR Index := 1 TO Length
      DO
        IF S[Index] IN NewCode
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
      Encode(Msg, Length);
      WRITELN('������ ������� ������ = ', Length)
    END
END.  {Encryption}

