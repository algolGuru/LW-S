PROGRAM InsertionSort(INPUT, OUTPUT);
{Сортирует символы из INPUT}
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
  Index := 0;
  Prev := 0;
  Curr := 0;
  First := 0;
  WGILE NOT EOLN 
  DO
    BEGIN
      Index :=    
        
    END;
END.













































  First := 0;
  Curr := 0;
  Prev := 0;
  Index := 0;
  WHILE NOT EOLN
  DO
    BEGIN
      Index := Index + 1;
      If Index > Max 
      THEN
        WRITELN('Пиздец ты даун чел')
      ELSE
        BEGIN
          Read(Arr[Index].Key);
          Curr := First;
          Prev := 0;
          Found := FALSE;
          WHILE Curr <> 0 AND NOT Found
          DO
            BEGIN
              IF Arr[Index].Key <= Arr[Curr].Key
              THEN
                Found := TRUE
              ELSE
                BEGIN
                  Prev := Curr;
                  Curr := Arr[Curr].Next;                
                END; 
            END;
          Arr[Index].Next := Curr;
          IF Prev = 0
          THEN
            First := Index
          ELSE
            Arr[Prev].Next := Index;                   
        END;
        
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
          
  
