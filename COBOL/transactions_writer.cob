
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRANSACTIONS-WRITER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TRANSACTION-FILE ASSIGN TO "transactions.dat"
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  TRANSACTION-FILE.
       01  TRANSACTION-RECORD.
           05 TRANS-ID        PIC 9(5).
           05 TRANS-AMOUNT    PIC 9(7)V99.

       WORKING-STORAGE SECTION.
       01  WS-FILE-STATUS     PIC XX.
       01  WS-TRANS-ID        PIC 9(5) VALUE 0.
       01  WS-AMOUNT          PIC 9(7)V99.
       01  MAX-TRANSACTIONS   PIC 9(2) VALUE 5.

       PROCEDURE DIVISION.
       MAIN-LOOP.
           OPEN OUTPUT TRANSACTION-FILE
           PERFORM UNTIL WS-TRANS-ID >= MAX-TRANSACTIONS
               ADD 1 TO WS-TRANS-ID
               DISPLAY "Enter amount for transaction #" WS-TRANS-ID ": "
               ACCEPT WS-AMOUNT
               MOVE WS-TRANS-ID TO TRANS-ID
               MOVE WS-AMOUNT TO TRANS-AMOUNT
               WRITE TRANSACTION-RECORD
           END-PERFORM
           CLOSE TRANSACTION-FILE
           DISPLAY "Transactions written."
           STOP RUN.
