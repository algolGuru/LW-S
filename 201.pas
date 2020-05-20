PROGRAM Print(INPUT, OUTPUT);{Print}
CONST
  Min = 1;
  RowSize = 5;
  ColSize = 5;
  Max = RowSize * ColSize;
TYPE
  Matrix = SET OF Min .. Max;
VAR 
  Ch: CHAR;
  MainMatrix: Matrix;
PROCEDURE PrintSymbol(VAR ChoosedMatrix: Matrix);{PrintSymbol}
VAR
  I: INTEGER;
BEGIN
  IF ChoosedMatrix <> []
  THEN
    BEGIN
      FOR I := Min TO Max
      DO
        BEGIN
          IF (I IN ChoosedMatrix)
          THEN
            WRITE('#')
          ELSE
            WRITE(' ');
          IF (I MOD RowSize) = 0
          THEN
            WRITELN
        END
    END 
END;{PrintSymbol}
PROCEDURE FindSymbol(VAR ChoosedMatrix: Matrix);{WriteSymbol}
VAR
  Ch: CHAR; 
BEGIN
  WRITELN('Input your symbol');
  IF NOT EOLN
  THEN
    READ(Ch);  
    CASE Ch OF
      'A', 'a': ChoosedMatrix := [3, 7, 9, 11, 12, 13, 14, 15, 16, 20, 21, 25];
      'B', 'b': ChoosedMatrix := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24, 25]; 
      'C', 'c': ChoosedMatrix := [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25];
      'D', 'd': ChoosedMatrix := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];                         
      'M', 'm': ChoosedMatrix := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25]; 
      'H', 'h': ChoosedMatrix := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
      'I', 'i': ChoosedMatrix := [1, 2, 3, 4, 5, 8, 13, 18, 21, 22, 23, 24, 25];
      'L', 'l': ChoosedMatrix := [1, 6, 11, 16, 21, 22, 23, 24, 25]; 
      'Z', 'z': ChoosedMatrix := [1, 2, 3, 4, 5, 9, 12, 16, 21, 22, 23, 24, 25];
      ELSE
        WRITELN('Char not found')
    END                       
END;{WriteSymbol}
BEGIN
  MainMatrix := [Min .. Max];
  FindSymbol(MainMatrix);
  PrintSymbol(MainMatrix)
END.{Print}    
