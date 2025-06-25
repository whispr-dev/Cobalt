
       IDENTIFICATION DIVISION.
       PROGRAM-ID. READLEDGER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT LEDGER-FILE ASSIGN TO "ledger.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD LEDGER-FILE.
       01 LEDGER-ENTRY.
           05 L-NAME         PIC X(20).
           05 L-PRINC        PIC 9(10)V99.
           05 L-RATE         PIC 9(2)V99.
           05 L-YEARS        PIC 9(4).
           05 L-TOTAL        PIC 9(8)V99.

       WORKING-STORAGE SECTION.
       01 WS-EOF             PIC X VALUE "N".
           88 EOF            VALUE "Y".
           88 NOT-EOF        VALUE "N".

       01 FILLER.
           05 WS-NAME        PIC X(20).
           05 WS-PRINC       PIC ZZ,ZZZ,ZZ9.99.
           05 WS-RATE        PIC Z9.99.
           05 WS-YEARS       PIC Z(4).
           05 WS-TOTAL       PIC ZZ,ZZZ,ZZ9.99.

       PROCEDURE DIVISION.
       BEGIN.
           OPEN INPUT LEDGER-FILE
           DISPLAY "--------------------------------------------------------------------------"
           DISPLAY "| NAME               | PRINCIPAL | RATE  | YRS  | TOTAL            |"
           DISPLAY "--------------------------------------------------------------------------"
           PERFORM UNTIL EOF
               READ LEDGER-FILE
                   AT END
                       SET EOF TO TRUE
                   NOT AT END
                       MOVE L-NAME  TO WS-NAME
                       MOVE L-PRINC TO WS-PRINC
                       MOVE L-RATE  TO WS-RATE
                       MOVE L-YEARS TO WS-YEARS
                       MOVE L-TOTAL TO WS-TOTAL
                       DISPLAY "| " WS-NAME " | "
                               WS-PRINC " | "
                               WS-RATE  " | "
                               WS-YEARS " | "
                               WS-TOTAL " |"
           END-PERFORM
           DISPLAY "--------------------------------------------------------------------------"
           CLOSE LEDGER-FILE
           STOP RUN.
