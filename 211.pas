PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
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
  
PROCEDURE Initialize(VAR Code: Chiper);
{присвоить Code шифр замены}
BEGIN {Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  Code[' '] := '%'
END;  {Initialize}
 
PROCEDURE Encode(VAR S: Str; VAR Length: INTEGER);
{выводит символы из Code, соотвтетсвующие символам из S}
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
  {Инициализировать Code}
  Initialize(Code);
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
          WRITE(Msg[Length])
        END;
      READLN;
      WRITELN;
      {Распечатать кодированное сообщение}
      Encode(Msg, Length);
      WRITELN('длинна входной строки = ', Length)
    END
END.  {Encryption}

