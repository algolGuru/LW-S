PROGRAM InsertionSort(INPUT, OUTPUT);
{��������� ������� �� INPUT}
CONST
  Max = 16;
  ListEnd = 0;
TYPE
  RecArray = ARRAY [1 .. Max] OF 
               RECORD
                 Key: CHAR;
                 Next: 0 .. Max;
               END;
  Range = 0 .. Max;             
VAR
  Arr: RecArray;
  First, Index: Range;
  Prev, Curr: Range;  
  Extra: CHAR;
  Found: BOOLEAN;
BEGIN {InsertionSort}
  First := 0;
  Index := 0;
  WHILE NOT EOLN      
  DO
    BEGIN  {WHILE}
      {�������� ������ � ������, ���� ��������� ������������, 
      ����� ������������ � �������� �� ������}
      Index := Index + 1;
      IF Index <= Max
      THEN
        BEGIN
          READ(Arr[Index].Key);
          {��������� Arr[Index] � ��������� ������}
          Prev := 0;
          Curr := First;
          {����� �������� Prev � Curr, ���� ���������� ����� ���
	  Arr[Prev].Key  <= Arr[Index].Key <= Arr[Curr].Key}
          Found := FALSE;
          WHILE (Curr <> 0) AND NOT Found
          DO
            IF Arr[Index].Key > Arr[Curr].Key
            THEN
              BEGIN
                Prev := Curr;
                Curr := Arr[Curr].Next
              END
            ELSE
              Found := True;
          Arr[Index].Next := Curr;
          IF Prev = 0  {������ ������� � ������}
          THEN
            First := Index
          ELSE
            Arr[Prev].Next := Index
        END
      ELSE
        BEGIN
          READ(Extra);
          WRITELN('��������� ��������: ', Extra, '. ����������.');
        END
    END; {WHILE}
  {������ ������ ������� � Arr[First]}
  Index := First;
  WHILE Index <> 0
  DO
    BEGIN
      WRITE(Arr[Index].Key);  
      Index := Arr[Index].Next
    END;
  WRITELN
END.  {InsertionSort}
