       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIEVE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-START       PIC 9(5).
       01 WS-END         PIC 9(5).
       01 WS-TEMP        PIC 9(5).
       01 WS-I           PIC 9(5).
       01 WS-J           PIC 9(5).
       01 WS-COUNT       PIC 9(5) VALUE 0.
       01 WS-OUT         PIC Z(4)9.
       01 WS-MSG         PIC X(40).
       01 IS-PRIME.
          05 PRIME-FLAG  PIC 9 OCCURS 1000 TIMES.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY "Podaj poczatek przedzialu: " WITH NO ADVANCING.
           ACCEPT WS-START.
           DISPLAY "Podaj koniec przedzialu: " WITH NO ADVANCING.
           ACCEPT WS-END.

           IF WS-START > WS-END
               MOVE WS-START TO WS-TEMP
               MOVE WS-END   TO WS-START
               MOVE WS-TEMP  TO WS-END
               DISPLAY "(Zamienilem kolejnosc: teraz ["
                       WS-START ", " WS-END "])"
           END-IF.

           PERFORM SIEVE-PARA.

           DISPLAY "Liczby pierwsze w przedziale ["
                   WS-START ", " WS-END "]:"
           PERFORM PRINT-PARA.
           DISPLAY "Znaleziono: " WS-COUNT.
           STOP RUN.

       SIEVE-PARA.
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > WS-END
               MOVE 1 TO PRIME-FLAG(WS-I)
           END-PERFORM.
           MOVE 0 TO PRIME-FLAG(1).
           MOVE 0 TO PRIME-FLAG(2)   *> w COBOL tablice startują od 1,
                                     *> więc indeks 1 = liczba 0, 2 = liczba 1
           MOVE 1 TO PRIME-FLAG(3).  *> liczba 2 jest pierwsza

           PERFORM VARYING WS-I FROM 2 BY 1
                   UNTIL WS-I * WS-I > WS-END
               IF PRIME-FLAG(WS-I + 1) = 1
                   COMPUTE WS-J = WS-I * WS-I
                   PERFORM UNTIL WS-J > WS-END
                       MOVE 0 TO PRIME-FLAG(WS-J + 1)
                       ADD WS-I TO WS-J
                   END-PERFORM
               END-IF
           END-PERFORM.

       PRINT-PARA.
           PERFORM VARYING WS-I FROM WS-START BY 1
                   UNTIL WS-I > WS-END
               IF WS-I >= 2 AND PRIME-FLAG(WS-I + 1) = 1
                   MOVE WS-I TO WS-OUT
                   DISPLAY WS-OUT " " WITH NO ADVANCING
                   ADD 1 TO WS-COUNT
               END-IF
           END-PERFORM.
           DISPLAY " ".
