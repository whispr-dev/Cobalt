
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PIC-LAB.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  TEXT-FIELD            PIC X(10) VALUE "FRENLY".
       01  ALPHA-ONLY            PIC A(6)   VALUE "HUSKLY".
       01  NUMERIC-FIELD         PIC 9(5)   VALUE 123.
       01  DECIMAL-FIELD         PIC 9(4)V99 VALUE 4321.89.
       01  SIGNED-FIELD          PIC S9(4)  VALUE -42.
       01  BINARY-FIELD          PIC 9(4) COMP VALUE 9999.
       01  PACKED-FIELD          PIC 9(4) COMP-3 VALUE 1234.

       01  TEMP-TEXT.
           05 TEMP-CHAR OCCURS 10 TIMES PIC X.
       01  RIGHT-JUSTIFIED-TEXT.
           05 RJ-CHAR   OCCURS 10 TIMES PIC X.

       01  TEMP-LEN              PIC 99.
       01  START-POS             PIC 99.
       01  IDX                   PIC 99.

       PROCEDURE DIVISION.

           MOVE "LEFT" TO TEMP-TEXT.
           MOVE FUNCTION LENGTH(
               FUNCTION TRIM(TEMP-TEXT TRAILING)
           ) TO TEMP-LEN.
           COMPUTE START-POS = 11 - TEMP-LEN.

           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 10
               MOVE SPACE TO RJ-CHAR(IDX)
           END-PERFORM.

           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > TEMP-LEN
               MOVE TEMP-CHAR(IDX) TO RJ-CHAR(START-POS)
               ADD 1 TO START-POS
           END-PERFORM.

           DISPLAY "TEXT-FIELD:           >" TEXT-FIELD "<".
           DISPLAY "ALPHA-ONLY (A):       >" ALPHA-ONLY "<".
           DISPLAY "NUMERIC-FIELD:        >" NUMERIC-FIELD "<".
           DISPLAY "DECIMAL-FIELD:        >" DECIMAL-FIELD "<".
           DISPLAY "SIGNED-FIELD:         >" SIGNED-FIELD "<".

           DISPLAY "JUSTIFIED TEXT:       >" RIGHT-JUSTIFIED-TEXT "<".

           DISPLAY "BINARY-FIELD (COMP):  >" BINARY-FIELD "<".
           DISPLAY "PACKED-FIELD (C-3):   >" PACKED-FIELD "<".

           STOP RUN.
