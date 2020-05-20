PROGRAM Encryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
CONST
  Len = 20;
  NewCode = [' ' .. 'Z'];
  ValidCode = [' ', 'A' .. 'Z']; 
TYPE
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  Length: INTEGER;
  CodeFile: TEXT;
  ErrorInFile: BOOLEAN;
  
PROCEDURE Initialize(VAR Code: Chiper; VAR ChipperFile: TEXT; VAR Error: BOOLEAN);
VAR
  Ch, CodeCh: CHAR;
{��������� Code ���� ������}
BEGIN {Initialize}
  Error := FALSE;
  WHILE NOT EOF(ChipperFile) AND NOT(Error)
  DO
    BEGIN
      READ(ChipperFile, Ch);
      IF (NOT EOLN(ChipperFile)) AND (Ch IN ValidCode)
      THEN
        BEGIN
          READ(ChipperFile, CodeCh);
          IF CodeCh IN NewCode
          THEN
            Code[Ch] := CodeCh
          ELSE
            Error := TRUE  
        END
      ELSE
        Error := TRUE;     
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
  ErrorInFile := FALSE;
  {���������������� Code}
  ASSIGN(CodeFile, 'ChiperFile.TXT');
  RESET(CodeFile);
  Initialize(Code, CodeFile, ErrorInFile);
  IF NOT(ErrorInFile) 
  THEN
    WHILE NOT(EOF) AND NOT(ErrorInFile)
    DO
      BEGIN
        {������ ������ �  Msg � ����������� ��}
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
        {����������� ������������ ���������}
        IF NOT(ErrorInFile)
        THEN
          BEGIN
            Encode(Msg, Length);
            WRITELN('������ ������� ������ = ', Length)
          END
        ELSE
          WRITELN('Misstake')  
      END
  ELSE
    WRITELN('Misstake')    
END.  {Encryption}

