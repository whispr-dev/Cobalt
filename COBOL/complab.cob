
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMP-LAB.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       *> DISPLAY NUMERIC: human-readable
       01 NUM-DISPLAY        PIC 9(5) VALUE 12345.

       *> BINARY NUMERIC: fast, compact
       01 NUM-COMP           PIC 9(5) COMP VALUE 12345.

       *> PACKED DECIMAL: precise, space-efficient money
       01 NUM-COMP-3         PIC 9(5) COMP-3 VALUE 12345.

       *> Arithmetic results
       01 RESULT-DISPLAY     PIC 9(6).
       01 RESULT-COMP        PIC 9(6) COMP.
       01 RESULT-COMP-3      PIC 9(6) COMP-3.

       PROCEDURE DIVISION.

           DISPLAY "---- STORAGE SIZES (IN BYTES) ----".
           DISPLAY "DISPLAY   : " FUNCTION LENGTH(NUM-DISPLAY).
           DISPLAY "COMP      : " FUNCTION LENGTH(NUM-COMP).
           DISPLAY "COMP-3    : " FUNCTION LENGTH(NUM-COMP-3).

           DISPLAY "---- ORIGINAL VALUES ----".
           DISPLAY "DISPLAY   : " NUM-DISPLAY.
           DISPLAY "COMP      : " NUM-COMP.
           DISPLAY "COMP-3    : " NUM-COMP-3.

           ADD 11111 TO NUM-DISPLAY GIVING RESULT-DISPLAY.
           ADD 11111 TO NUM-COMP    GIVING RESULT-COMP.
           ADD 11111 TO NUM-COMP-3  GIVING RESULT-COMP-3.

           DISPLAY "---- AFTER ADDING 11111 ----".
           DISPLAY "DISPLAY   : " RESULT-DISPLAY.
           DISPLAY "COMP      : " RESULT-COMP.
           DISPLAY "COMP-3    : " RESULT-COMP-3.

           STOP RUN.

