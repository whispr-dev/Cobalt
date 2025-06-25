
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRANSACTIONS-READER.

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
           05 TRANS-ID       PIC 9(5).
           05 TRANS-AMOUNT   PIC 9(7)V99.

       WORKING-STORAGE SECTION.
       01  WS-FILE-STATUS        PIC XX.
       01  TOTAL-AMOUNT          PIC 9(9)V99 VALUE 0.
       01  EOF-FLAG              PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       BEGIN.
           OPEN INPUT TRANSACTION-FILE
           PERFORM UNTIL EOF-FLAG = 'Y'
               READ TRANSACTION-FILE
                   AT END
                       MOVE 'Y' TO EOF-FLAG
                   NOT AT END
                       DISPLAY "Trnsctn #" TRANS-ID " = " TRANS-AMOUNT
                       ADD TRANS-AMOUNT TO TOTAL-AMOUNT
               END-READ
           END-PERFORM
           CLOSE TRANSACTION-FILE
           DISPLAY "Total Amount = " TOTAL-AMOUNT
           STOP RUN.
