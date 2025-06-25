
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WriteLedger.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT LedgerFile ASSIGN TO "ledger.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD LedgerFile.
       01 Ledger-Record.
           05 Name-Out            PIC X(20).
           05 Principal-Out       PIC 9(9)V99.
           05 Rate-Out            PIC 9(3)V99.
           05 Years-Out           PIC 9(4).
           05 Total-Out           PIC 9(9)V99.

       WORKING-STORAGE SECTION.
       01 Name-In                PIC X(20).
       01 Principal              PIC 9(9)V99.
       01 Rate                   PIC 9(3)V99.
       01 Years                  PIC 9(4).
       01 Total                  PIC 9(9)V99.
       01 Response               PIC X.
       01 WS-Display-Line        PIC X(80).
       01 Continue-Flag          PIC X VALUE "Y".

       PROCEDURE DIVISION.
       BEGIN.
           OPEN EXTEND LedgerFile
           PERFORM UNTIL Continue-Flag NOT = "Y"
               DISPLAY "Enter name:" ACCEPT Name-In
               DISPLAY "Enter principal amount:" ACCEPT Principal
               DISPLAY "Enter annual rate (%):" ACCEPT Rate
               DISPLAY "Enter number of years:" ACCEPT Years

               COMPUTE Total = Principal * FUNCTION EXP(Rate / 100 * Years)

               MOVE Name-In        TO Name-Out
               MOVE Principal      TO Principal-Out
               MOVE Rate           TO Rate-Out
               MOVE Years          TO Years-Out
               MOVE Total          TO Total-Out

               WRITE Ledger-Record

               DISPLAY "Add another? (Y/N):" ACCEPT Response
               IF FUNCTION UPPER-CASE(Response) NOT = "Y"
                   MOVE "N" TO Continue-Flag
               END-IF
           END-PERFORM
           CLOSE LedgerFile
           DISPLAY "Ledger updated."
           STOP RUN.
