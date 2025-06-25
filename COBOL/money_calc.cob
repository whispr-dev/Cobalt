
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MONEY-CALC.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 AMOUNT-ONE       PIC S9(5)V99 COMP-3.
       01 AMOUNT-TWO       PIC S9(5)V99 COMP-3.
       01 SUM-RESULT       PIC S9(6)V99 COMP-3.
       01 DIFF-RESULT      PIC S9(6)V99 COMP-3.
       01 DISPLAY-SUM      PIC Z(6).99.
       01 DISPLAY-DIFF     PIC -Z(6).99.
       01 INPUT-AMT        PIC X(10).

       PROCEDURE DIVISION.

       MAIN.

           DISPLAY "Enter first amount (e.g., 123.45): "
           ACCEPT INPUT-AMT
           MOVE FUNCTION NUMVAL(INPUT-AMT) TO AMOUNT-ONE

           DISPLAY "Enter second amount (e.g., 67.89): "
           ACCEPT INPUT-AMT
           MOVE FUNCTION NUMVAL(INPUT-AMT) TO AMOUNT-TWO

           ADD AMOUNT-ONE TO AMOUNT-TWO GIVING SUM-RESULT
           SUBTRACT AMOUNT-TWO FROM AMOUNT-ONE GIVING DIFF-RESULT

           MOVE SUM-RESULT TO DISPLAY-SUM
           MOVE DIFF-RESULT TO DISPLAY-DIFF

           DISPLAY "------------------------------"
           DISPLAY "TOTAL:       $" DISPLAY-SUM
           DISPLAY "DIFFERENCE:  $" DISPLAY-DIFF
           DISPLAY "------------------------------"

           STOP RUN.
