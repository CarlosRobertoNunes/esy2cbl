       IDENTIFICATION DIVISION.
       PROGRAM-ID.    CWLINE.
       AUTHOR.        COBOLware Services Ltda.
       DATE-WRITTEN.  20/06/1996.
       SECURITY.      *************************************************
                      *                                               *
                      *  Menu em linha/buttons                        *
                      *                                               *
                      *************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  AREAS-DE-TRABALHO. COPY CWCASE.
frango     05 JANPOS.
frango        10 JANLIN               PIC  9(002) VALUE 0.
frango        10 JANCOL               PIC  9(002) VALUE 0.
           05 CWGETL                  PIC  X(003) VALUE SPACES.
           05 LETRA                   PIC  X(001) VALUE SPACE.
           05 TESTE-F                 PIC  X(034) VALUE SPACES.
           05 TESTE2                  PIC  X(018) VALUE SPACES.
           05 TESTE3                  PIC  X(018) VALUE SPACES.
           05 F                       PIC  9(002) VALUE 0.
           05 F1                      PIC  9(002) VALUE 0.
           05 FN                      PIC  9(002) VALUE 0.
           05 X                        PIC  9(002) VALUE 0.
           05 MULTI-USER               PIC  9(001) VALUE 0.
           05 TMP                      PIC  X(003) VALUE SPACES.
           05 SALVA-TELA.
              10 DADOS                PIC  X(2000).
              10 ATTRIBUTOS           PIC  X(2000).
              10 LENGTH-SAVE          PIC  9(004) COMP-X VALUE 2000.
           05 SAVE-T                  PIC  9(004) COMP-X.
           05 CONTA-LOOP              PIC  9(004) VALUE 0.
           05 TEXTO                   PIC  9(002) COMP-X VALUE 0.
           05 FUNDO                   PIC  9(002) COMP-X VALUE 0.
           05 REVERSO                 PIC  9(002) COMP-X VALUE 0.
           05 TESTE                   PIC  X(001) VALUE SPACE.
           05 MODO                    PIC  9(001) VALUE ZERO.
           05 SO                      PIC  9(002) VALUE ZERO.
           05 TP                      PIC  X(001) VALUE SPACE.
           05 AP                      PIC  9(002) COMP-X.
              88 AMARELO VALUE 014 030 046 062 078 094 110 126 142 158
                               174 190 206 222 238 254.
           05 HORA-A                  PIC  X(006) VALUE SPACES.
           05 HORA-B                  PIC  X(006) VALUE SPACES.
           05 SEGUNDOS                PIC  9(004) VALUE 0.
           05 LX                      PIC  9(004) COMP-X.
           05 CX                      PIC  9(004) COMP-X.
           05 CL                      PIC  9(003) VALUE 0.
           05 CHX                     PIC  9(003) VALUE 0.
           05 FLAG                    PIC  9(002) COMP-X VALUE 0.
           05 ACESO                   PIC  9(002) COMP-X VALUE 0.
           05 SAVE-ATTRIBUTE-BUFFER2  PIC  X(080) VALUE SPACES.
           05 START-STRING            PIC  9(002) COMP-X VALUE 0.
           05 TIPO                    PIC  9(001) VALUE 0.
           05 Y                COMP-X PIC  9(008) VALUE ZERO.
           05 K                       PIC  9(002) VALUE ZERO.
           05 K2                      PIC  9(002) VALUE ZERO.
           05 NEW-ITEM                PIC  X(034) VALUE SPACES.
           05 I                       PIC  9(004) COMP-X.
           05 T                       PIC  9(004) COMP-X.
           05 ATTR-LOW                PIC  X(040) VALUE LOW-VALUES.
           05 ATTR-HIGH               PIC  X(040) VALUE LOW-VALUES.
           05 ATTR-LOW-DISA           PIC  X(040) VALUE LOW-VALUES.
           05 ATTR-HIGH-DISA          PIC  X(040) VALUE LOW-VALUES.
           05 ATTR-REV.
              10 AB OCCURS 40         PIC  9(002) COMP-X.
           05 OPT-B                   PIC  9(003) VALUE 0.
           05 OP                      PIC  9(003) VALUE 0.
           05 BUTTON-TYPE             PIC  X(001) VALUE SPACES.
      *    05 TEXTO                   PIC  X(040) VALUE SPACES.
           05 TEXTO-TOP               PIC  X(040) VALUE SPACES.
           05 TEXTO-MID               PIC  X(040) VALUE SPACES.
           05 TEXTO-BOT               PIC  X(040) VALUE SPACES.
           05 ATTRIB-TOP              PIC  X(040) VALUE SPACES.
           05 ATTRIB-MID              PIC  X(040) VALUE SPACES.
           05 REDEFINES ATTRIB-MID.
              15 MID-X OCCURS 40      PIC  9(002) COMP-X.
           05 ATTRIB-BOT              PIC  X(040) VALUE SPACES.
           05 VEZ                     PIC  9(001) VALUE 1.
           05 TAMANHO                 PIC  9(002) VALUE 0.
           05 MOUSE-LIN               PIC  9(002) VALUE 0.
           05 MOUSE-COL               PIC  9(002) VALUE 0.
           05 TABELA.
              10 LINHA                PIC  9(002) VALUE 0.
              10 COLUNA               PIC  9(002) VALUE 0.
              10 LIMITE               PIC  9(003) VALUE 0.
              10 OPCOES               PIC  9(002) VALUE 0.
              10 OPCAO-NUM            PIC  9(002) VALUE 0.
              10 OPCAO OCCURS 26.
                 15 OPCAO-TXT.
                    20 BYTE-TXT OCCURS 38
                                       PIC X(001).
                 15 POS.
                    20 POS-LIN        PIC 9(02).
                    20 POS-COL        PIC 9(02).
                 15 LENG              PIC 9(02).
              10 OPCOES-CHAR                             VALUE SPACES.
                 15 CHAR OCCURS 26    PIC  X(001).
              10 REDEFINES OPCOES-CHAR.
                 15 CHAR-X OCCURS 26  PIC  9(002) COMP-X.
              10 TECLAS-FUNCAO                    VALUE LOW-VALUES.
                 15 FUNCAO OCCURS 26  PIC  9(002) COMP-X.
           05 KEY-STATUS              PIC  9(002) COMP-X VALUE 0.
           05 MOUSE-READ-TYPE         PIC  9(002) COMP-X VALUE 0.
           05 MOUSE-HANDLE            PIC  9(008) COMP-X VALUE 1.
           05 MOUSE-BUTTONS           PIC  9(002) COMP-X VALUE 3.
           05 MOUSE-POSITION-S        PIC  X(008).
           05 MOUSE-POSITION-A        PIC  X(008).
           05 MOUSE-POSITION.
              10 ROW-MOUSE            PIC  9(004) COMP-X VALUE 0.
              10 COLUMN-MOUSE         PIC  9(004) COMP-X VALUE 0.
           05 MOUSE-DATA.
              10 MOUSE-EVENT-TYPE     PIC  9(004) COMP-X.
              10 MOUSE-EVENT-TIME     PIC  9(008) COMP-X.
              10 MOUSE-EVENT-ROW      PIC  9(004) COMP-X.
              10 MOUSE-EVENT-COL      PIC  9(004) COMP-X.
           05 CBL-READ-WRITE-SCR-ATTRS.
              10 SCREEN-POSITION.
                 15 ROW-NUMBER        PIC  9(002) COMP-X VALUE 0.
                 15 COLUMN-NUMBER     PIC  9(002) COMP-X VALUE 0.
              10 SP.
                 15                   PIC  9(002) COMP-X VALUE 0.
                 15 CP                PIC  9(002) COMP-X VALUE 0.
              10 ATTRIBUTE-BUFFER     PIC  X(001) VALUE SPACES.
              10 STRING-LENGTH        PIC  9(004) COMP-X VALUE 0.
              10 SL                   PIC  9(004) COMP-X VALUE 0.
              10 SALVA-ATTRIBUTE      PIC  X(001) VALUE SPACES.
              10 SCREEN-POSITION2.
                 15 ROW-NUMBER2       PIC  9(002) COMP-X VALUE 0.
                 15 COLUMN-NUMBER2    PIC  9(002) COMP-X VALUE 0.
              10 ATTRIBUTE-BUFFER2    PIC  X(080) VALUE SPACES.
              10 REDEFINES ATTRIBUTE-BUFFER2.
                 25 MID-X2 OCCURS 40   PIC  9(002) COMP-X.
              10 STRING-LENGTH2       PIC  9(004) COMP-X VALUE 0.
              10 SALVA-ATTRIBUTE2     PIC  X(001) VALUE SPACES.
           05 CURPOS.
              10 CURPOS-LIN           PIC  9(002) VALUE 24.
              10 CURPOS-COL           PIC  9(002) VALUE 01.
           05 CARACTER                PIC  X(001).
           05 CARACTER-X REDEFINES CARACTER
                                      PIC  9(002) COMP-X.
           05 TECLA                   PIC  9(003). COPY CWEDIT.
           05 MATRIZ-CONTROL.
              10 MATRIZ-LINE OCCURS 25.
                 15 MATRIZ-POSIT OCCURS 80 PIC  9(002) COMP-X.
              10 MATRIZ-KEY                PIC  9(002) COMP-X.
           05 SALVA-CURSOR.
              15                       PIC  9(002) COMP-X VALUE 0.
              15                       PIC  9(002) COMP-X VALUE 0.
           05 MOVE-CURSOR.
              15 MOVE-LIN              PIC  9(002) COMP-X VALUE 0.
              15 MOVE-COL              PIC  9(002) COMP-X VALUE 0.
           05 X91-RESULT        COMP-X PIC  9(002) VALUE 0.
           05 X91-FUNCTION      COMP-X PIC  9(002) VALUE 16.
           05 X91-PARAMETER     COMP-X PIC  9(002) VALUE 0.
           05 TABELA-CORES.
              10 COR          PIC X(1) OCCURS 256.
           05 TABELA-MOLDURA.
              10 BASE-MOLDURA PIC X(8) OCCURS 9.
           05 MOLDURA                              VALUE SPACES.
              10 M-201                 PIC  X(001).
              10 M-205                 PIC  X(001).
              10 M-187                 PIC  X(001).
              10 M-186                 PIC  X(001).
              10 M-204                 PIC  X(001).
              10 M-185                 PIC  X(001).
              10 M-200                 PIC  X(001).
              10 M-188                 PIC  X(001).
           05 MM-205               PIC  X(80) VALUE SPACES.

       01  TECLAS.
           05 PIC X(021) VALUE "ESC               027".
           05 PIC X(021) VALUE "F1                059".
           05 PIC X(021) VALUE "F2                060".
           05 PIC X(021) VALUE "F3                061".
           05 PIC X(021) VALUE "F4                062".
           05 PIC X(021) VALUE "F5                063".
           05 PIC X(021) VALUE "F6                064".
           05 PIC X(021) VALUE "F7                065".
           05 PIC X(021) VALUE "F8                066".
           05 PIC X(021) VALUE "F9                067".
           05 PIC X(021) VALUE "F10               068".
           05 PIC X(021) VALUE "SHIFT-F1          084".
           05 PIC X(021) VALUE "SHIFT-F2          085".
           05 PIC X(021) VALUE "SHIFT-F3          086".
           05 PIC X(021) VALUE "SHIFT-F4          087".
           05 PIC X(021) VALUE "SHIFT-F5          088".
           05 PIC X(021) VALUE "SHIFT-F6          089".
           05 PIC X(021) VALUE "SHIFT-F7          090".
           05 PIC X(021) VALUE "SHIFT-F8          091".
           05 PIC X(021) VALUE "SHIFT-F9          092".
           05 PIC X(021) VALUE "SHIFT-F10         093".
           05 PIC X(021) VALUE "CONTROL-F1        094".
           05 PIC X(021) VALUE "CONTROL-F2        095".
           05 PIC X(021) VALUE "CONTROL-F3        096".
           05 PIC X(021) VALUE "CONTROL-F4        097".
           05 PIC X(021) VALUE "CONTROL-F5        098".
           05 PIC X(021) VALUE "CONTROL-F6        099".
           05 PIC X(021) VALUE "CONTROL-F7        100".
           05 PIC X(021) VALUE "CONTROL-F8        101".
           05 PIC X(021) VALUE "CONTROL-F9        102".
           05 PIC X(021) VALUE "CONTROL-F10       103".
           05 PIC X(021) VALUE "ALT-F1            104".
           05 PIC X(021) VALUE "ALT-F2            105".
           05 PIC X(021) VALUE "ALT-F3            106".
           05 PIC X(021) VALUE "ALT-F4            107".
           05 PIC X(021) VALUE "ALT-F5            108".
           05 PIC X(021) VALUE "ALT-F6            109".
           05 PIC X(021) VALUE "ALT-F7            110".
           05 PIC X(021) VALUE "ALT-F8            111".
           05 PIC X(021) VALUE "ALT-F9            112".
           05 PIC X(021) VALUE "ALT-F10           113".
           05 PIC X(021) VALUE "ALT-1             241".
           05 PIC X(021) VALUE "ALT-2             242".
           05 PIC X(021) VALUE "ALT-3             243".
           05 PIC X(021) VALUE "ALT-4             244".
           05 PIC X(021) VALUE "ALT-5             245".
           05 PIC X(021) VALUE "ALT-6             246".
           05 PIC X(021) VALUE "ALT-7             247".
           05 PIC X(021) VALUE "ALT-8             248".
           05 PIC X(021) VALUE "ALT-9             249".
           05 PIC X(021) VALUE "ALT-0             250".
           05 PIC X(021) VALUE "PAGE-UP           073".
           05 PIC X(021) VALUE "PAGE-DOWN         081".
           05 PIC X(021) VALUE "CONTROL-PAGE-UP   132".
           05 PIC X(021) VALUE "CONTROL-PAGE-DOWN 118".
           05 PIC X(021) VALUE "ALT-A             265".
           05 PIC X(021) VALUE "ALT-B             266".
           05 PIC X(021) VALUE "ALT-C             267".
           05 PIC X(021) VALUE "ALT-D             268".
           05 PIC X(021) VALUE "ALT-E             269".
           05 PIC X(021) VALUE "ALT-F             270".
           05 PIC X(021) VALUE "ALT-G             271".
           05 PIC X(021) VALUE "ALT-H             272".
           05 PIC X(021) VALUE "ALT-I             273".
           05 PIC X(021) VALUE "ALT-J             274".
           05 PIC X(021) VALUE "ALT-K             275".
           05 PIC X(021) VALUE "ALT-L             276".
           05 PIC X(021) VALUE "ALT-M             277".
           05 PIC X(021) VALUE "ALT-N             278".
           05 PIC X(021) VALUE "ALT-O             279".
           05 PIC X(021) VALUE "ALT-P             280".
           05 PIC X(021) VALUE "ALT-Q             281".
           05 PIC X(021) VALUE "ALT-R             282".
           05 PIC X(021) VALUE "ALT-S             283".
           05 PIC X(021) VALUE "ALT-T             284".
           05 PIC X(021) VALUE "ALT-U             285".
           05 PIC X(021) VALUE "ALT-V             286".
           05 PIC X(021) VALUE "ALT-W             287".
           05 PIC X(021) VALUE "ALT-X             288".
           05 PIC X(021) VALUE "ALT-Y             289".
           05 PIC X(021) VALUE "ALT-Z             290".
           05 PIC X(021) VALUE "F11               133".
           05 PIC X(021) VALUE "F12               134".
           05 PIC X(021) VALUE "SHIFT-F11         135".
           05 PIC X(021) VALUE "SHIFT-F12         136".
           05 PIC X(021) VALUE "CONTROL-F11       137".
           05 PIC X(021) VALUE "CONTROL-F12       138".
           05 PIC X(021) VALUE "ALT-F11           139".
           05 PIC X(021) VALUE "ALT-F12           140".
       01  REDEFINES TECLAS.
           05 OCCURS 89.
              10 TECLA-NOME PIC X(018).
              10 TECLA-COD  PIC 9(003).
       COPY CWGETL.
       COPY CWUNIX.

       LINKAGE SECTION.

       01  PARAMETROS-CWLINE.
           05 CWLINE-LINE                    PIC  9(002).
           05 CWLINE-COLUMN                  PIC  9(002).
           05 CWLINE-LINE-END                PIC  9(002).
           05 CWLINE-COLUMN-END              PIC  9(002).
           05 CWLINE-TYPE                    PIC  X(001).
              88 CWLINE-BUTTONS                          VALUE "B" "b".
              88 CWLINE-REVERSED                         VALUE "R" "r".
              88 CWLINE-BUTTONS-NODEF                    VALUE "b".
              88 CWLINE-REVERSED-NODEF                   VALUE "r".
              88 CWLINE-NODEF                            VALUE "r" "b".
           05 CWLINE-SCREENS.
              10 CWLINE-CHAR   OCCURS 26     PIC  X(001).
              10 CWLINE-SCREEN OCCURS 26     PIC  X(034).
           05 CWLINE-POSITION  OCCURS 26.
              15 CWLINE-POSITION-LINE        PIC  9(002).
              15 CWLINE-POSITION-COLUMN      PIC  9(002).
           05 CWLINE-COLOR.
              10 CWLINE-COLOR-LOW            PIC  9(002) COMP-X.
              10 CWLINE-COLOR-HIGH           PIC  9(002) COMP-X.
           05 CWLINE-OPTION                  PIC  9(003).
           05 CWLINE-OPTION-CHAR             PIC  X(001).
           05 CWLINE-MOUSE                   PIC  X(001).
              88 CWLINE-SMALL                            VALUE "M".
           05 CWLINE-KEY REDEFINES CWLINE-MOUSE PIC  9(002) COMP-X.
           05 CWLINE-TIMEOUT-STATUS          PIC  9(001).
              88 CWLINE-TIMEOUT-ENABLE                   VALUE 1 5.
              88 CWLINE-TIMEOUT-RETRY                    VALUE 5.
              88 CWLINE-TIMEOUT-DISABLE                  VALUE 0.
           05 CWLINE-TIMEOUT-RETURN          PIC  9(001).
              88 CWLINE-TIMEOUT-ON                       VALUE 1.
              88 CWLINE-TIMEOUT-OFF                      VALUE 0.

       01  PARAMETROS-CWMOUS.
           05 CWMOUS-CONTROL.
              10 CWMOUS-LINE OCCURS 50.
                 15 CWMOUS-POSIT OCCURS 80 PIC  9(002) COMP-X.
              10 CWMOUS-MODE               PIC  9(002) COMP-X.
              10 CWMOUS-KEY                PIC  9(002) COMP-X.
              10 CWMOUS-BUTTON             PIC  9(002) COMP-X.
           05 CWMOUS-CURSOR-POSITION.
              10 CWMOUS-CURSOR-LIN         PIC  9(002).
              10 CWMOUS-CURSOR-COL         PIC  9(002).

       PROCEDURE DIVISION USING PARAMETROS-CWLINE PARAMETROS-CWMOUS.

       000-INICIO.

           CALL "CBL_GET_CSR_POS" USING SALVA-CURSOR
           SET CWLINE-TIMEOUT-OFF TO TRUE
           IF   VEZ = 1
                DISPLAY "CWMULTI"      UPON ENVIRONMENT-NAME
                ACCEPT  TMP            FROM ENVIRONMENT-VALUE
                INSPECT TMP (1: 2) CONVERTING MINUSCULAS TO MAIUSCULAS
                IF   TMP (1: 2) = "ON"
                     MOVE 1 TO MULTI-USER
                END-IF
                CALL "CWMOLD" USING TABELA-CORES TABELA-MOLDURA
                DISPLAY "CWGETL" UPON ENVIRONMENT-NAME
                ACCEPT   CWGETL  FROM ENVIRONMENT-VALUE
                IF CWGETL NOT = 'OFF'
                   CALL "CWGETL" USING PARAMETROS-CWGETL
                ELSE
                   MOVE 1 TO CWGETL-MOUSE
                END-IF
      *         IF   CWLINE-COLOR = X"707F"
      *              MOVE 0 TO CWGETL-HIGH
      *         END-IF
                CALL "CWUNIX" USING PARAMETROS-CWUNIX
                IF   CWUNIX-ON
                     MOVE 1 TO MULTI-USER
                END-IF
                MOVE BASE-MOLDURA (2) TO MOLDURA
                INSPECT MM-205 CONVERTING SPACE TO M-205
                MOVE 2 TO VEZ
                COMPUTE CL  = CWLINE-COLOR-LOW  + 1
                COMPUTE CHX = CWLINE-COLOR-HIGH + 1
                INSPECT ATTR-LOW       CONVERTING X"00" TO COR (CL)
                INSPECT ATTR-HIGH      CONVERTING X"00" TO COR (CHX)
                INSPECT ATTR-LOW-DISA  CONVERTING X"00" TO COR (CL + 16)
                INSPECT ATTR-HIGH-DISA CONVERTING X"00" TO COR(CHX + 16)
           END-IF
           INITIALIZE            TABELA
frango     DISPLAY 'WINPOS'      UPON ENVIRONMENT-NAME
frango     ACCEPT  JANPOS        FROM ENVIRONMENT-VALUE
frango     add JANLIN to CWLINE-LINE   CWLINE-LINE-END
frango     add JANCOL to CWLINE-COLUMN CWLINE-COLUMN-END
frango     DISPLAY '0000'        UPON ENVIRONMENT-VALUE
           MOVE CWLINE-LINE   TO LINHA  ROW-NUMBER
           MOVE CWLINE-COLUMN TO COLUNA COLUMN-NUMBER
           IF   CWLINE-BUTTONS and (not CWLINE-small)
                ADD  1 TO LINHA ROW-NUMBER
           END-IF
           SUBTRACT 1                     FROM ROW-NUMBER COLUMN-NUMBER
           SUBTRACT 2                     FROM COLUMN-NUMBER
           MOVE 1                           TO STRING-LENGTH
           CALL "CBL_READ_SCR_ATTRS"     USING SCREEN-POSITION
                                               SALVA-ATTRIBUTE
                                               STRING-LENGTH
           MOVE 0                           TO OPCOES
                                               TAMANHO

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 40
                   MOVE SALVA-ATTRIBUTE TO ATTR-REV (I: 1)
                   COMPUTE FUNDO = AB (I) / 16
                   COMPUTE TEXTO = AB (I) - (FUNDO * 16)
                   COMPUTE REVERSO = FUNDO + (TEXTO * 16)
                   IF   REVERSO = AB (I)
                        MOVE 112     TO AB (I)
                   ELSE
                        MOVE REVERSO TO AB (I)
                   END-IF
           END-PERFORM

           PERFORM VARYING OPCAO-NUM FROM 1 BY 1
                           UNTIL OPCAO-NUM > 26
                              OR LINHA > CWLINE-LINE-END
                   PERFORM 020-CHECK-FUNCTION-KEY THRU 020-99-FIM
                   IF   CWLINE-SCREEN (OPCAO-NUM) NOT = SPACES

                        MOVE SPACES TO NEW-ITEM
                        MOVE 0      TO K2
                        PERFORM VARYING K FROM 1 BY 1 UNTIL K > 34
                                IF   CWLINE-SCREEN (OPCAO-NUM)
                                                        (K: 1) = X"7E"
                                     ADD 1 TO K
                                     MOVE CWLINE-SCREEN (OPCAO-NUM)
                                                             (K: 1)
                                       TO CWLINE-CHAR (OPCAO-NUM)
                                END-IF
                                ADD  1 TO K2
                                MOVE CWLINE-SCREEN (OPCAO-NUM) (K: 1)
                                  TO NEW-ITEM (K2: 1)
                        END-PERFORM
                        MOVE NEW-ITEM TO CWLINE-SCREEN (OPCAO-NUM)

                        ADD  1 TO OPCOES
                        MOVE CWLINE-SCREEN (OPCAO-NUM)
                          TO OPCAO-TXT (OPCOES)
                        IF   NOT CWLINE-BUTTONS
                             INSPECT OPCAO-TXT(OPCOES)
                                     CONVERTING "_" TO " "
                        END-IF
                        MOVE CWLINE-CHAR (OPCAO-NUM) TO CHAR (OPCOES)
                        IF   CHAR-X (OPCOES) > 96 AND < 123
                             SUBTRACT 32 FROM CHAR-X (OPCOES)
                        END-IF
                        PERFORM VARYING TAMANHO FROM 34 BY -1
                                UNTIL BYTE-TXT (OPCOES TAMANHO)
                                      NOT = SPACE
                                      CONTINUE
                        END-PERFORM
                        IF   CWLINE-BUTTONS and (not CWLINE-small)
                             ADD 3 TO TAMANHO
                        END-IF
                        COMPUTE LENG (OPCOES) = TAMANHO + 1
                        MOVE LINHA  TO POS-LIN   (OPCOES)
                        MOVE COLUNA TO POS-COL   (OPCOES)
                        COMPUTE LIMITE = POS-COL (OPCOES)
                                       + LENG    (OPCOES)
                                       + 1
                        IF   LIMITE > CWLINE-COLUMN-END
                             ADD  1             TO LINHA
                                                   POS-LIN (OPCOES)
                             IF   CWLINE-BUTTONS and (not CWLINE-small)
                                  ADD  3        TO LINHA
                                                   POS-LIN (OPCOES)
                             END-IF
                             MOVE CWLINE-COLUMN TO COLUNA
                                                   POS-COL (OPCOES)
                             COMPUTE LIMITE = LENG (OPCOES)
                                            + CWLINE-COLUMN + 1
                        END-IF
                        COMPUTE COLUNA = LIMITE + 1
                        IF   LINHA > CWLINE-LINE-END
                             SUBTRACT 1 FROM OPCOES
                        END-IF
                        INSPECT OPCAO-TXT (OPCAO-NUM)
                                CONVERTING "_" TO " "
                   END-IF
           END-PERFORM
           MOVE LOW-VALUES TO MATRIZ-CONTROL
           CALL X"91" USING X91-RESULT X91-FUNCTION X91-PARAMETER
           IF   X91-PARAMETER = 2
                MOVE 0 TO CWMOUS-KEY
           END-IF
           MOVE    1            TO MODO
           PERFORM MONTA-TELA THRU FIM-MONTA-TELA

           IF   CWLINE-OPTION > 300
                PERFORM DESTAQUE-OFF THRU FIM-DESTAQUE-OFF
                IF   CWLINE-BUTTONS and (not CWLINE-small)
                     COMPUTE OPT-B = CWLINE-OPTION - 300
                     MOVE "P"       TO BUTTON-TYPE
                     MOVE  2        TO MODO
                     PERFORM EXIBE-BUTTON
                     MOVE  1        TO MODO
                END-IF
                SUBTRACT 100 FROM CWLINE-OPTION
                GO TO 000-99-FIM
           END-IF
           CALL "CBL_SET_CSR_POS" USING X"FFFF"
           IF   CWLINE-OPTION = 0
           OR   CWLINE-OPTION > OPCOES
                MOVE 1             TO OPCAO-NUM MATRIZ-KEY
           ELSE
                MOVE CWLINE-OPTION TO OPCAO-NUM MATRIZ-KEY
           END-IF
           IF   CWLINE-BUTTONS and (not CWLINE-small)
                COMPUTE ROW-NUMBER    = POS-LIN
                                        (OPCAO-NUM) - 1
                COMPUTE COLUMN-NUMBER = POS-COL
                                        (OPCAO-NUM)
                COMPUTE STRING-LENGTH = LENG(OPCAO-NUM) - 2
                CALL "CBL_WRITE_SCR_N_ATTR" USING
                                            SCREEN-POSITION
                                            ATTR-HIGH
                                            STRING-LENGTH
           ELSE
                COMPUTE ROW-NUMBER    = POS-LIN
                                        (OPCAO-NUM) - 1
                COMPUTE COLUMN-NUMBER = POS-COL
                                        (OPCAO-NUM) - 2
                COMPUTE STRING-LENGTH = LENG(OPCAO-NUM)
                                        + 1
                CALL "CBL_WRITE_SCR_N_ATTR" USING
                                            SCREEN-POSITION
                                            ATTR-REV
                                            STRING-LENGTH
           END-IF
           MOVE SCREEN-POSITION         TO SP
           MOVE CWLINE-CHAR (OPCAO-NUM) TO TP
           MOVE STRING-LENGTH           TO SL
           PERFORM DESTAQUE THRU FIM-DESTAQUE

           IF   CWGETL-MOUSE = 1
                CALL "CBL_INIT_MOUSE" USING MOUSE-HANDLE
                                            MOUSE-BUTTONS
                CALL "CBL_GET_MOUSE_POSITION"
                      USING MOUSE-HANDLE
                            MOUSE-POSITION
                  ON   OVERFLOW
                      CONTINUE
                END-CALL
                MOVE MOUSE-POSITION   TO MOUSE-POSITION-A
                                         MOUSE-POSITION-S
           END-IF
           MOVE 0 TO TECLA CARACTER
           IF  CWLINE-TIMEOUT-RETRY
               MOVE 5 TO CWGETL-TIMEOUT
           END-IF
           IF   CWGETL-TIMEOUT NOT = 0
           AND  CWLINE-TIMEOUT-ENABLE
                ACCEPT HORA-A FROM TIME
                MOVE 0 TO SEGUNDOS
           END-IF
           MOVE 0 TO CONTA-LOOP
           PERFORM TEST AFTER UNTIL EDIT-ENTER
                                 OR EDIT-ESC
              INITIALIZE MOUSE-POSITION
              PERFORM TEST AFTER UNTIL KEY-STATUS   > 0
                                    OR ROW-MOUSE    > 0
                                    OR COLUMN-MOUSE > 0
                      ADD 1 TO CONTA-LOOP
                      IF   CONTA-LOOP = 1
                      OR   CWUNIX-WINDOWS
                           CALL "CWATCH"
                      END-IF
                      CALL "CBL_GET_KBD_STATUS" USING KEY-STATUS
                      IF   MULTI-USER = 1
                           MOVE 1 TO KEY-STATUS
                      END-IF
                IF   CWGETL-MOUSE = 1
                     CALL "CBL_GET_MOUSE_POSITION" USING MOUSE-HANDLE
                                                         MOUSE-POSITION
                     ON   EXCEPTION
                          CONTINUE
                     END-CALL
                     IF MOUSE-POSITION-A NOT = MOUSE-POSITION
                        MOVE 0 TO SEGUNDOS CONTA-LOOP
                     END-IF
                     MOVE MOUSE-POSITION TO MOUSE-POSITION-A
                     IF  ROW-MOUSE > 25
                         INITIALIZE MOUSE-POSITION
                     END-IF
                END-IF
                IF   CWGETL-TIMEOUT NOT = 0
                AND  CWLINE-TIMEOUT-ENABLE
                     ACCEPT HORA-B FROM TIME
                     IF   HORA-B NOT = HORA-A
                          MOVE HORA-B TO HORA-A
                          ADD 1 TO SEGUNDOS
                          IF   SEGUNDOS NOT < CWGETL-TIMEOUT
                               PERFORM DESTAQUE-OFF
                                  THRU FIM-DESTAQUE-OFF
                               MOVE 1 TO KEY-STATUS
                               SET CWLINE-TIMEOUT-ON TO TRUE
                               SET EDIT-ESC TO TRUE
                               IF   CWLINE-TIMEOUT-RETRY
                                    SET EDIT-ENTER TO TRUE
                               END-IF
                          END-IF
                     END-IF
                END-IF
              END-PERFORM
              INITIALIZE MOUSE-DATA
              IF   CWGETL-MOUSE = 1
                   CALL "CBL_READ_MOUSE_EVENT" USING MOUSE-HANDLE
                                                     MOUSE-DATA
                                                     MOUSE-READ-TYPE
                   ON   EXCEPTION
                        CONTINUE
                   END-CALL
              END-IF
              ADD 1 TO ROW-MOUSE COLUMN-MOUSE
              MOVE 0 TO TIPO
              if MOUSE-POSITION = MOUSE-POSITION-s
              and key-status = 0
              AND MOUSE-EVENT-TYPE = 0
                  move 2 to key-status
              end-if
              move MOUSE-POSITION to MOUSE-POSITION-s
              EVALUATE TRUE
                  WHEN (MATRIZ-POSIT (ROW-MOUSE COLUMN-MOUSE) = 0)
                   AND X91-PARAMETER = 1
                   AND KEY-STATUS = 0
                   AND MOUSE-EVENT-TYPE > 1
                       SET EDIT-ESC TO TRUE
                       PERFORM DESTAQUE-OFF THRU FIM-DESTAQUE-OFF
                  WHEN X91-PARAMETER = 2
                   AND (MATRIZ-POSIT (ROW-MOUSE COLUMN-MOUSE) = 0)
                   AND (CWMOUS-POSIT (ROW-MOUSE COLUMN-MOUSE) = 0)
                   AND KEY-STATUS = 0
                   AND MOUSE-EVENT-TYPE > 1
                       SET EDIT-ESC TO TRUE
                       PERFORM DESTAQUE-OFF THRU FIM-DESTAQUE-OFF
                  WHEN CWLINE-TIMEOUT-ON
                       CONTINUE
                  WHEN (MATRIZ-POSIT (ROW-MOUSE COLUMN-MOUSE) NOT = 0)
                   AND KEY-STATUS = 0
                       CALL "CBL_READ_SCR_CHATTRS" USING X"0000"
                                                         DADOS
                                                         ATTRIBUTOS
                                                         LENGTH-SAVE
                       PERFORM APAGAR
                       MOVE MATRIZ-POSIT (ROW-MOUSE COLUMN-MOUSE)
                         TO MATRIZ-KEY
                       IF   MOUSE-EVENT-TYPE > 1
                            PERFORM DESTAQUE-OFF THRU FIM-DESTAQUE-OFF
                            IF   MOUSE-EVENT-TYPE = 2 OR 3
                                 SET EDIT-ENTER  TO TRUE
                                 MOVE "P"        TO BUTTON-TYPE
                                 IF  CWLINE-BUTTONS
                                 and (not CWLINE-small)
                                     MOVE MATRIZ-KEY TO OPT-B
                                     MOVE 2 TO MODO
                                     PERFORM EXIBE-BUTTON
                                     PERFORM CHECK-BUTTON
                                        THRU FIM-CHECK-BUTTON
                                     MOVE 1 TO MODO
                                 END-IF
                            ELSE
                                 SET EDIT-ESC TO TRUE
                            END-IF
                            MOVE 0 TO MOUSE-EVENT-TYPE
                       END-IF
                       IF  TIPO = 4
                           MOVE 0 TO TIPO
                       ELSE
                           MOVE 2 TO TIPO
                       END-IF
                  WHEN X91-PARAMETER = 2
                   AND KEY-STATUS = 0
                       PERFORM SET-REVERSO THRU FIM-SET-REVERSO
                       MOVE 3 TO TIPO
                  WHEN KEY-STATUS = 1
                       MOVE 0 TO TECLA CARACTER SEGUNDOS
                       PERFORM APAGAR
                       CALL "CWKBDC" USING CURPOS CARACTER TECLA
                       PERFORM 030-ALT THRU 030-99-FIM
                       EVALUATE TRUE
                         WHEN EDIT-ENTER
                            MOVE SPACE TO CARACTER
                            PERFORM DESTAQUE-OFF THRU FIM-DESTAQUE-OFF
                            SET EDIT-ENTER TO TRUE
                            IF  CWLINE-BUTTONS and (not CWLINE-small)
                                MOVE MATRIZ-KEY TO OPT-B
                                MOVE "P"        TO BUTTON-TYPE
                                MOVE 2          TO MODO
                                PERFORM EXIBE-BUTTON
                                MOVE 1          TO MODO
                            END-IF
                         WHEN EDIT-ESC
                            MOVE SPACE TO CARACTER
                         WHEN OTHER
                             IF   CARACTER-X > 96 AND < 123
                                  SUBTRACT 32 FROM CARACTER-X
                             END-IF
                             IF CARACTER NOT = SPACE
                                PERFORM VARYING I FROM 1 BY 1
                                   UNTIL I > 26
                                   IF CARACTER = CHAR (I)
                             OR ((TECLA NOT = 0) AND TECLA = FUNCAO (I))
                                      MOVE I  TO MATRIZ-KEY
                                      SET EDIT-ENTER TO TRUE
                                      PERFORM DESTAQUE-OFF
                                         THRU FIM-DESTAQUE-OFF
                                      MOVE 27 TO I
                                      PERFORM CHECK-POSITION
                                      IF  CWLINE-BUTTONS
                                      and (not CWLINE-small)
                                          MOVE MATRIZ-KEY TO OPT-B
                                          MOVE "P"        TO BUTTON-TYPE
                                          MOVE 2          TO MODO
                                          PERFORM EXIBE-BUTTON
                                          MOVE 1 TO MODO
                                      END-IF
                                   END-IF
                                END-PERFORM
                             END-IF
                       END-EVALUATE
                       EVALUATE TRUE
                                WHEN EDIT-ESC OR EDIT-ENTER
                                     MOVE OPCAO-NUM TO MATRIZ-KEY
                                     MOVE 0         TO TIPO
                                     IF   X91-PARAMETER = 2
                                          ADD 200 TO MATRIZ-KEY
                                     END-IF
                                WHEN EDIT-CURSOR-DOWN
                                  OR EDIT-CURSOR-RIGHT
                                  OR EDIT-TAB
                                     move 0 to x
                                     COMPUTE MATRIZ-KEY = OPCAO-NUM + 1
                                     IF   MATRIZ-KEY > OPCOES
                                          MOVE 1 TO MATRIZ-KEY
                                     END-IF
                                     MOVE 1 TO TIPO
                                     perform until x > 26
                                          or cwline-position(matriz-key)
                                             not = "9999"

                                     add 1 to matriz-key x
                                     IF   MATRIZ-KEY > OPCOES
                                          MOVE 1 TO MATRIZ-KEY
                                     END-IF
                                     end-perform
                                WHEN EDIT-CURSOR-UP
                                  OR EDIT-CURSOR-LEFT
                                  OR EDIT-SHIFT-TAB
                                     COMPUTE MATRIZ-KEY = OPCAO-NUM - 1
                                     IF   MATRIZ-KEY = 0
                                          MOVE OPCOES TO MATRIZ-KEY
                                     END-IF
                                     move 0 to x
                                     MOVE 1 TO TIPO
                                     perform until x > 26
                                          or cwline-position(matriz-key)
                                             not = "9999"
                                     subtract 1 from matriz-key
                                     add 1 to x
                                     IF   MATRIZ-KEY = 0
                                          MOVE OPCOES TO MATRIZ-KEY
                                     END-IF
                                     end-perform
                                WHEN OTHER
                                     IF   X91-PARAMETER = 2
                                          MOVE TECLA TO CWMOUS-KEY
                                          MOVE 0     TO MATRIZ-KEY
                                          SET EDIT-ENTER TO TRUE
                                          PERFORM DESTAQUE-OFF
                                             THRU FIM-DESTAQUE-OFF
                                          IF   NOT CWLINE-BUTTONS
                                          CALL "CBL_WRITE_SCR_N_ATTR"
                                               USING SCREEN-POSITION
                                                      SALVA-ATTRIBUTE
                                                     STRING-LENGTH
00    *                                   MOVE SCREEN-POSITION TO SP
00    *                                   MOVE CWLINE-CHAR (OPCAO-NUM)
00    *                                                        TO TP
00    *                                   MOVE STRING-LENGTH   TO SL
00    *                                   PERFORM DESTAQUE
00    *                                      THRU FIM-DESTAQUE
                                          END-IF
                                     END-IF
                       END-EVALUATE
              END-EVALUATE
              IF  (OPCAO-NUM NOT = MATRIZ-KEY)
              AND (TIPO = 1 OR 2)
                  PERFORM CHECK-POSITION
              END-IF
              if  key-status = 2
                  move 0 to key-status
              end-if
           END-PERFORM

           IF   EDIT-ENTER
                MOVE MATRIZ-KEY TO CWLINE-OPTION OP
                IF   OP > 200
                     SUBTRACT 200 FROM OP
                END-IF
                IF   OP NOT = 0
                     MOVE CHAR (OP) TO CWLINE-OPTION-CHAR
                END-IF
                IF   X91-PARAMETER = 2
                     IF   TIPO = 2
                     AND  CWMOUS-KEY = 0
                          MOVE POS-LIN (MATRIZ-KEY) TO ROW-MOUSE
                          MOVE POS-COL (MATRIZ-KEY) TO COLUMN-MOUSE
                          MOVE CWMOUS-POSIT (ROW-MOUSE COLUMN-MOUSE)
                            TO CWMOUS-KEY
                     END-IF
                     IF   CWMOUS-KEY = 0
                          MOVE CWLINE-OPTION TO CWMOUS-KEY
                     END-IF
                END-IF
           ELSE
                MOVE 0          TO CWLINE-OPTION
                IF   X91-PARAMETER = 2
                     MOVE 0 TO CWMOUS-KEY
                END-IF
           END-IF
           MOVE 0 TO ACESO
           IF   CWGETL-MOUSE = 1
                CALL "CBL_TERM_MOUSE" USING MOUSE-HANDLE
                                            MOUSE-BUTTONS
           END-IF
           CALL "CBL_SET_CSR_POS" USING SALVA-CURSOR.

           IF  CWLINE-TIMEOUT-RETRY
               CALL "CWGETL" USING PARAMETROS-CWGETL
           END-IF
           IF  KEY-STATUS NOT = 0
               MOVE TECLA
                 TO CWLINE-KEY
           END-IF
frango     subtract JANLIN from CWLINE-LINE    CWLINE-LINE-END
frango     subtract JANCOL from CWLINE-COLUMN  CWLINE-COLUMN-END
frango     DISPLAY 'WINPOS'      UPON ENVIRONMENT-NAME
frango     DISPLAY JANPOS        UPON ENVIRONMENT-VALUE
           CALL "CWATCH".

       000-99-FIM. GOBACK.

       CHECK-BUTTON.

           IF   MULTI-USER = 1
           OR  (KEY-STATUS NOT = 0)
                GO TO FIM-CHECK-BUTTON
           END-IF

           MOVE MOUSE-EVENT-TYPE TO SAVE-T
           MOVE 0 TO CONTA-LOOP
           PERFORM UNTIL MOUSE-EVENT-TYPE = 0
              ADD 1 TO CONTA-LOOP
              IF   CONTA-LOOP = 1
              OR   CWUNIX-WINDOWS
                   CALL "CWATCH"
              END-IF
              MOVE 1 TO MOUSE-READ-TYPE
              CALL "CBL_READ_MOUSE_EVENT" USING
                                          MOUSE-HANDLE
                                          MOUSE-DATA
                                          MOUSE-READ-TYPE
              ON   OVERFLOW
                   CONTINUE
              END-CALL
              CALL "CBL_GET_MOUSE_POSITION"
                    USING MOUSE-HANDLE
                          MOUSE-POSITION
                ON   OVERFLOW
                     CONTINUE
              END-CALL
              ADD 1 TO ROW-MOUSE COLUMN-MOUSE
              IF   MOUSE-POSITION-S NOT = MOUSE-POSITION
                   MOVE 0 TO SEGUNDOS
                   IF  MATRIZ-POSIT(ROW-MOUSE COLUMN-MOUSE) = MATRIZ-KEY
                   AND BUTTON-TYPE = "D"
                       MOVE "P" TO BUTTON-TYPE
                       PERFORM EXIBE-BUTTON
                   ELSE
                       IF  MATRIZ-POSIT(ROW-MOUSE COLUMN-MOUSE)
                           NOT = MATRIZ-KEY
                       AND BUTTON-TYPE = "P"
                           MOVE "D" TO BUTTON-TYPE
                           PERFORM EXIBE-BUTTON
                       END-IF
                   END-IF
              END-IF
           END-PERFORM

           MOVE 0 TO MOUSE-READ-TYPE
           IF  MATRIZ-POSIT(ROW-MOUSE COLUMN-MOUSE) NOT = MATRIZ-KEY
               MOVE "D" TO BUTTON-TYPE
      *        PERFORM EXIBE-BUTTON
               MOVE 0 TO MATRIZ-KEY OPT-B TECLA
                         ROW-MOUSE
                         COLUMN-MOUSE
               MOVE 4 TO TIPO
               CALL "CBL_WRITE_SCR_CHATTRS" USING X"0000"
                                                  DADOS
                                                  ATTRIBUTOS
                                                  LENGTH-SAVE
                CALL "CWATCH"
           ELSE
               MOVE SAVE-T TO MOUSE-EVENT-TYPE
               MOVE "P" TO BUTTON-TYPE
               PERFORM EXIBE-BUTTON
           END-IF.

       FIM-CHECK-BUTTON. EXIT.

       MONTA-TELA.

           MOVE 0          TO OPCAO-NUM
           PERFORM OPCOES TIMES
                   ADD 1 TO OPCAO-NUM
                   IF   CWLINE-BUTTONS and (not CWLINE-small)
                        MOVE OPCAO-NUM TO OPT-B
                        MOVE "D"       TO BUTTON-TYPE
                        PERFORM EXIBE-BUTTON
                   ELSE
                        MOVE LENG (OPCAO-NUM) TO STRING-LENGTH
                        COMPUTE ROW-NUMBER    = POS-LIN
                                                (OPCAO-NUM) - 1
                        COMPUTE COLUMN-NUMBER = POS-COL
                                                (OPCAO-NUM) - 1
                        CALL "CBL_WRITE_SCR_CHARS" USING SCREEN-POSITION
                                                   OPCAO-TXT (OPCAO-NUM)
                                                   STRING-LENGTH
                        COMPUTE COLUMN-NUMBER = POS-COL
                                                (OPCAO-NUM) - 2
                        COMPUTE STRING-LENGTH = LENG(OPCAO-NUM)
                                                + 1
                        CALL "CBL_WRITE_SCR_N_ATTR" USING
                                               SCREEN-POSITION
                                               SALVA-ATTRIBUTE
                                               STRING-LENGTH
                        MOVE SCREEN-POSITION         TO SP
                        MOVE CWLINE-CHAR (OPCAO-NUM) TO TP
                        MOVE STRING-LENGTH           TO SL
                        PERFORM DESTAQUE THRU FIM-DESTAQUE
                   END-IF
                   IF  CWLINE-POSITION (OPCAO-NUM) = "9999"
                       EXIT PERFORM CYCLE
                   END-IF
                   MOVE POS-LIN (OPCAO-NUM)
                     TO CWLINE-POSITION-LINE   (OPCAO-NUM)
                   MOVE POS-COL (OPCAO-NUM)
                     TO CWLINE-POSITION-COLUMN (OPCAO-NUM)
                   MOVE POS-LIN (OPCAO-NUM) TO MOUSE-LIN
                   COMPUTE MOUSE-COL = POS-COL (OPCAO-NUM)
                                     - 1
                   COMPUTE LIMITE = MOUSE-COL + LENG (OPCAO-NUM)
                   PERFORM VARYING MOUSE-COL
                      FROM MOUSE-COL BY 1
                     UNTIL MOUSE-COL > LIMITE
                           MOVE OPCAO-NUM TO MATRIZ-POSIT
                                             (MOUSE-LIN MOUSE-COL)
                           IF   X91-PARAMETER = 2
                                COMPUTE CWMOUS-POSIT
                                        (MOUSE-LIN MOUSE-COL) =
                                MATRIZ-POSIT
                                        (MOUSE-LIN MOUSE-COL) + 200
                           END-IF
                   END-PERFORM
           END-PERFORM.

       FIM-MONTA-TELA. EXIT.

       DESTAQUE-OFF.

         IF   CWGETL-HIGH = 1
              MOVE    2            TO MODO
              MOVE    OPCAO-NUM    TO SO
              PERFORM MONTA-TELA THRU FIM-MONTA-TELA
              MOVE    SO           TO OPCAO-NUM
              MOVE    1            TO MODO
         END-IF.

       FIM-DESTAQUE-OFF. EXIT.

       DESTAQUE.

      *    if MOUSE-POSITION = MOUSE-POSITION-s
      *         GO TO FIM-DESTAQUE
      *    end-if
           move MOUSE-POSITION to MOUSE-POSITION-s
           IF   TP = SPACE
           OR   MODO = 2
           OR  (CWGETL-HIGH NOT = 1)
                GO TO FIM-DESTAQUE
           END-IF
           PERFORM SL TIMES
                   ADD 1 TO CP
                   CALL "CBL_READ_SCR_CHARS" USING SP TESTE X"0001"
                   IF   TESTE = TP
                        CALL "CBL_READ_SCR_ATTRS" USING SP AP X"0001"
                        IF   CWLINE-BUTTONS and (not CWLINE-small)
                             IF  AP < 127
                                 ADD 1 TO AP
                             ELSE
                                 SUBTRACT 1 FROM AP
                             END-IF
                        ELSE
SC    *                      ADD 8 TO AP
                             IF AMARELO
                                ADD 1 TO AP
                             ELSE
                                ADD 8 TO AP
                             END-IF
                        END-IF
                        CALL "CBL_WRITE_SCR_ATTRS" USING SP AP X"0001"
                        EXIT PERFORM
                   END-IF
           END-PERFORM.

       FIM-DESTAQUE. EXIT.

       CHECK-POSITION.

           IF   CWLINE-BUTTONS and (not CWLINE-small)
                COMPUTE ROW-NUMBER    = POS-LIN
                                        (OPCAO-NUM) - 1
                COMPUTE COLUMN-NUMBER = POS-COL
                                        (OPCAO-NUM)
                COMPUTE STRING-LENGTH = LENG(OPCAO-NUM) - 2
                IF   CWLINE-POSITION (OPCAO-NUM) = "9999"
                     CALL "CBL_WRITE_SCR_N_ATTR" USING
                                                 SCREEN-POSITION
                                                 ATTR-LOW-DISA
                                                 STRING-LENGTH
                ELSE
                     CALL "CBL_WRITE_SCR_N_ATTR" USING
                                                 SCREEN-POSITION
                                                 ATTR-LOW
                                                 STRING-LENGTH
                END-IF
                MOVE SCREEN-POSITION         TO SP
                MOVE CWLINE-CHAR (OPCAO-NUM) TO TP
                MOVE STRING-LENGTH           TO SL
                PERFORM DESTAQUE THRU FIM-DESTAQUE
                MOVE MATRIZ-KEY TO OPCAO-NUM
                COMPUTE ROW-NUMBER    = POS-LIN
                                        (OPCAO-NUM) - 1
                COMPUTE COLUMN-NUMBER = POS-COL
                                        (OPCAO-NUM)
                COMPUTE STRING-LENGTH = LENG(OPCAO-NUM) - 2
                IF   CWLINE-POSITION (OPCAO-NUM) = "9999"
                     CALL "CBL_WRITE_SCR_N_ATTR" USING
                                                 SCREEN-POSITION
                                                 ATTR-HIGH-DISA
                                                 STRING-LENGTH
                ELSE
                     CALL "CBL_WRITE_SCR_N_ATTR" USING
                                                 SCREEN-POSITION
                                                 ATTR-HIGH
                                                 STRING-LENGTH
                END-IF
                MOVE SCREEN-POSITION         TO SP
                MOVE CWLINE-CHAR (OPCAO-NUM) TO TP
                MOVE STRING-LENGTH           TO SL
                PERFORM DESTAQUE THRU FIM-DESTAQUE
           ELSE
                COMPUTE ROW-NUMBER    = POS-LIN
                                        (OPCAO-NUM) - 1
                COMPUTE COLUMN-NUMBER = POS-COL
                                        (OPCAO-NUM) - 2
                COMPUTE STRING-LENGTH = LENG(OPCAO-NUM) + 1
                CALL "CBL_WRITE_SCR_N_ATTR" USING SCREEN-POSITION
                                                  SALVA-ATTRIBUTE
                                                  STRING-LENGTH
                MOVE SCREEN-POSITION         TO SP
                MOVE CWLINE-CHAR (OPCAO-NUM) TO TP
                MOVE STRING-LENGTH           TO SL
                PERFORM DESTAQUE THRU FIM-DESTAQUE
                MOVE MATRIZ-KEY TO OPCAO-NUM
                COMPUTE ROW-NUMBER    = POS-LIN
                                        (OPCAO-NUM) - 1
                COMPUTE COLUMN-NUMBER = POS-COL
                                        (OPCAO-NUM) - 2
                COMPUTE STRING-LENGTH = LENG(OPCAO-NUM) + 1
                CALL "CBL_WRITE_SCR_N_ATTR" USING SCREEN-POSITION
                                                  ATTR-REV
                                                  STRING-LENGTH
                MOVE SCREEN-POSITION         TO SP
                MOVE CWLINE-CHAR (OPCAO-NUM) TO TP
                MOVE STRING-LENGTH           TO SL
                PERFORM DESTAQUE THRU FIM-DESTAQUE
           END-IF

           COMPUTE CURPOS-LIN = ROW-NUMBER    + 1
           COMPUTE CURPOS-COL = COLUMN-NUMBER + 2
           IF   CWUNIX-ON
                COMPUTE MOVE-LIN = CURPOS-LIN - 1
                COMPUTE MOVE-COL = CURPOS-COL - 1
                CALL "CBL_SET_CSR_POS" USING MOVE-CURSOR
           ELSE
                CALL "CBL_SET_CSR_POS" USING X"FFFF"
           END-IF.

       FIM-CHECK-POSITION. EXIT.

       SET-REVERSO.

           IF  (CWMOUS-POSIT (ROW-MOUSE COLUMN-MOUSE) NOT = 0)
           AND (MOUSE-EVENT-TYPE > 1)
                MOVE CWMOUS-POSIT (ROW-MOUSE COLUMN-MOUSE) TO MATRIZ-KEY
                IF   MOUSE-EVENT-TYPE = 2 OR 3
                     SET EDIT-ENTER TO TRUE
                     PERFORM DESTAQUE-OFF THRU FIM-DESTAQUE-OFF
                ELSE
                     SET EDIT-ESC TO TRUE
                END-IF
                GO TO FIM-SET-REVERSO
           END-IF
           MOVE 0 TO MOUSE-EVENT-TYPE

           IF  ACESO NOT = CWMOUS-POSIT (ROW-MOUSE COLUMN-MOUSE)
               PERFORM APAGAR
           END-IF
           IF   CWMOUS-POSIT (ROW-MOUSE COLUMN-MOUSE) = ACESO OR 0
                GO TO FIM-SET-REVERSO
           END-IF
           MOVE CWMOUS-POSIT (ROW-MOUSE COLUMN-MOUSE) TO ACESO
           COMPUTE LX                    = ROW-MOUSE
           COMPUTE CX                    = COLUMN-MOUSE
           MOVE    CWMOUS-POSIT (LX CX) TO FLAG
           COMPUTE ROW-NUMBER2           = LX - 1
           COMPUTE COLUMN-NUMBER2        = CX - 1
           MOVE    0                    TO STRING-LENGTH2

           PERFORM VARYING CX FROM CX BY -1
                   UNTIL CX < 2
                      OR CWMOUS-POSIT (LX CX) NOT = FLAG
                   CONTINUE
           END-PERFORM

           IF   CWMOUS-POSIT (LX CX) NOT = FLAG
                ADD 1 TO CX
           END-IF

           COMPUTE START-STRING = CX - 1

           PERFORM VARYING CX FROM CX BY 1
                   UNTIL CX > 79
                      OR CWMOUS-POSIT (LX CX) NOT = FLAG
                         ADD 1 TO STRING-LENGTH2
           END-PERFORM

           MOVE START-STRING             TO COLUMN-NUMBER2

           CALL "CBL_READ_SCR_ATTRS"  USING SCREEN-POSITION2
                                            ATTRIBUTE-BUFFER2
                                            STRING-LENGTH2

           MOVE ATTRIBUTE-BUFFER2        TO SAVE-ATTRIBUTE-BUFFER2
           MOVE ATTR-LOW                 TO ATTRIBUTE-BUFFER2

           CALL "CBL_WRITE_SCR_ATTRS" USING SCREEN-POSITION2
                                            ATTRIBUTE-BUFFER2
                                            STRING-LENGTH2
           IF  FLAG NOT = 0
               MOVE SCREEN-POSITION2        TO SP
               MOVE CWLINE-CHAR (FLAG)      TO TP
               MOVE STRING-LENGTH2          TO SL
               PERFORM DESTAQUE THRU FIM-DESTAQUE
           END-IF.

       FIM-SET-REVERSO. EXIT.

       APAGAR.

           IF   ACESO NOT = 0
                MOVE 0 TO SEGUNDOS
                CALL "CBL_WRITE_SCR_ATTRS" USING SCREEN-POSITION2
                                                 SAVE-ATTRIBUTE-BUFFER2
                                                 STRING-LENGTH2
                MOVE 0 TO ACESO
           END-IF.

       FIM-APAGAR. EXIT.

       EXIBE-BUTTON.

           COMPUTE ROW-NUMBER2    = POS-LIN (OPT-B) - 2
           COMPUTE COLUMN-NUMBER2 = POS-COL (OPT-B) - 1
           MOVE LENG       (OPT-B) TO TAMANHO
                                      STRING-LENGTH2
           MOVE M-201              TO TEXTO-TOP
           MOVE MM-205             TO TEXTO-TOP (2: )
           MOVE M-187              TO TEXTO-TOP (TAMANHO: )
           MOVE M-186              TO TEXTO-MID
           MOVE OPCAO-TXT (OPT-B)  TO TEXTO-MID (3: )
           MOVE M-186              TO TEXTO-MID (TAMANHO: )
           MOVE M-200              TO TEXTO-BOT
           MOVE MM-205             TO TEXTO-BOT (2: )
           MOVE M-188              TO TEXTO-BOT (TAMANHO: )

           SUBTRACT 1 FROM TAMANHO


           IF   CWLINE-POSITION (OPT-B) = "9999"
                IF  BUTTON-TYPE = "D"
                    MOVE ATTR-LOW-disa         TO ATTRIB-TOP
                                                  ATTRIB-MID
                                                  ATTRIB-BOT
                    MOVE ATTR-HIGH-disa        TO ATTRIB-TOP (1:TAMANHO)
                                                  ATTRIB-MID (1: 1)
                                                  ATTRIB-BOT (1: 1)
                ELSE
                    MOVE ATTR-HIGH-disa       TO ATTRIB-TOP
                                                 ATTRIB-MID
                                                 ATTRIB-BOT
                    MOVE ATTR-LOW-disa        TO ATTRIB-TOP (1:TAMANHO)
                                                 ATTRIB-MID (1: 1)
                                                 ATTRIB-BOT (1: 1)
                END-IF
           ELSE
                IF  BUTTON-TYPE = "D"
                    MOVE ATTR-LOW              TO ATTRIB-TOP
                                                  ATTRIB-MID
                                                  ATTRIB-BOT
                    MOVE ATTR-HIGH             TO ATTRIB-TOP (1:TAMANHO)
                                                  ATTRIB-MID (1: 1)
                                                  ATTRIB-BOT (1: 1)
                ELSE
                    MOVE ATTR-HIGH            TO ATTRIB-TOP
                                                 ATTRIB-MID
                                                 ATTRIB-BOT
                    MOVE ATTR-LOW             TO ATTRIB-TOP (1:TAMANHO)
                                                 ATTRIB-MID (1: 1)
                                                 ATTRIB-BOT (1: 1)
                END-IF
           END-IF

           CALL "CBL_WRITE_SCR_CHATTRS" USING SCREEN-POSITION2
                                              TEXTO-TOP
                                              ATTRIB-TOP
                                              STRING-LENGTH2
           ADD 1 TO ROW-NUMBER2
           CALL "CBL_WRITE_SCR_CHATTRS" USING SCREEN-POSITION2
                                              TEXTO-MID
                                              ATTRIB-MID
                                              STRING-LENGTH2
           MOVE SCREEN-POSITION2        TO SP
           MOVE CWLINE-CHAR (OPT-B)     TO TP
           MOVE STRING-LENGTH2          TO SL
           PERFORM DESTAQUE THRU FIM-DESTAQUE

           ADD 1 TO ROW-NUMBER2
           CALL "CBL_WRITE_SCR_CHATTRS" USING SCREEN-POSITION2
                                              TEXTO-BOT
                                              ATTRIB-BOT
                                              STRING-LENGTH2.

       FIM-EXIBE-BUTTON. EXIT.

       020-CHECK-FUNCTION-KEY.

           MOVE CWLINE-SCREEN (OPCAO-NUM) TO TESTE-F
           INSPECT TESTE-F CONVERTING MINUSCULAS TO MAIUSCULAS
           MOVE SPACES TO TESTE2
           STRING TESTE-F DELIMITED BY SPACE INTO TESTE2
           IF TESTE2 (1: 5) = 'CTRL-'
              MOVE 'CONTROL-'  TO TESTE3
              MOVE TESTE2 (6:) TO TESTE3(9:)
              MOVE TESTE3      TO TESTE2
           END-IF
           IF TESTE2 (1: 2) = 'PF'
              MOVE 'F'  TO TESTE3
              MOVE TESTE2 (3:) TO TESTE3(2:)
              MOVE TESTE3      TO TESTE2
           END-IF
           IF TESTE2 (1: 2) = 'PG'
              MOVE 'PAGE'      TO TESTE3
              MOVE TESTE2 (5:) TO TESTE3(5:)
              MOVE TESTE3      TO TESTE2
           END-IF
           IF TESTE2 (1:10) = "CONTROL-PG"
              MOVE 'CONTROL-PAGE'  TO TESTE3
              MOVE TESTE2 (11:) TO TESTE3(13:)
              MOVE TESTE3      TO TESTE2
           END-IF
           PERFORM TEST AFTER UNTIL TESTE2 (1:2) NOT = 'F0'
                   MOVE TESTE2 TO TESTE3
                   IF TESTE2 (1:2) = 'F0'
                      MOVE 'F' TO TESTE3
                      MOVE TESTE2 (3:1) TO TESTE3
                      MOVE TESTE3 TO TESTE2
                   END-IF
           END-PERFORM
           PERFORM VARYING T FROM 1 BY 1 UNTIL T > 89
                                            OR FUNCAO (OPCAO-NUM) > ZERO
                   IF   TESTE2 = TECLA-NOME (T)
                        MOVE TECLA-COD (T) TO FUNCAO (OPCAO-NUM)
                   END-IF
           END-PERFORM.

       020-99-FIM. EXIT.

       030-ALT.

           MOVE SPACE TO LETRA
           EVALUATE TRUE
               WHEN EDIT-ALT-0           MOVE "0" TO LETRA
               WHEN EDIT-ALT-1           MOVE "1" TO LETRA
               WHEN EDIT-ALT-2           MOVE "2" TO LETRA
               WHEN EDIT-ALT-3           MOVE "3" TO LETRA
               WHEN EDIT-ALT-4           MOVE "4" TO LETRA
               WHEN EDIT-ALT-5           MOVE "5" TO LETRA
               WHEN EDIT-ALT-6           MOVE "6" TO LETRA
               WHEN EDIT-ALT-7           MOVE "7" TO LETRA
               WHEN EDIT-ALT-8           MOVE "8" TO LETRA
               WHEN EDIT-ALT-9           MOVE "9" TO LETRA
               WHEN EDIT-ALT-A           MOVE "A" TO LETRA
               WHEN EDIT-ALT-B           MOVE "B" TO LETRA
               WHEN EDIT-ALT-C           MOVE "C" TO LETRA
               WHEN EDIT-ALT-D           MOVE "D" TO LETRA
               WHEN EDIT-ALT-E           MOVE "E" TO LETRA
               WHEN EDIT-ALT-EQUAL       MOVE "=" TO LETRA
               WHEN EDIT-ALT-F           MOVE "F" TO LETRA
               WHEN EDIT-ALT-G           MOVE "G" TO LETRA
               WHEN EDIT-ALT-H           MOVE "H" TO LETRA
               WHEN EDIT-ALT-I           MOVE "I" TO LETRA
               WHEN EDIT-ALT-J           MOVE "J" TO LETRA
               WHEN EDIT-ALT-K           MOVE "K" TO LETRA
               WHEN EDIT-ALT-L           MOVE "L" TO LETRA
               WHEN EDIT-ALT-M           MOVE "M" TO LETRA
               WHEN EDIT-ALT-TRACE       MOVE "-" TO LETRA
               WHEN EDIT-ALT-N           MOVE "N" TO LETRA
               WHEN EDIT-ALT-O           MOVE "O" TO LETRA
               WHEN EDIT-ALT-P           MOVE "P" TO LETRA
               WHEN EDIT-ALT-Q           MOVE "Q" TO LETRA
               WHEN EDIT-ALT-R           MOVE "R" TO LETRA
               WHEN EDIT-ALT-S           MOVE "S" TO LETRA
               WHEN EDIT-ALT-T           MOVE "T" TO LETRA
               WHEN EDIT-ALT-U           MOVE "U" TO LETRA
               WHEN EDIT-ALT-V           MOVE "V" TO LETRA
               WHEN EDIT-ALT-W           MOVE "W" TO LETRA
               WHEN EDIT-ALT-X           MOVE "X" TO LETRA
               WHEN EDIT-ALT-Y           MOVE "Y" TO LETRA
               WHEN EDIT-ALT-Z           MOVE "Z" TO LETRA
           END-EVALUATE

           IF LETRA NOT = SPACE
              MOVE SPACE TO CARACTER
              PERFORM VARYING I FROM 1 BY 1 UNTIL I > OPCOES
                      IF LETRA = CHAR (I)
                         MOVE LETRA TO CARACTER
                         EXIT PERFORM
                      END-IF
              END-PERFORM
              IF SPACE = CARACTER
                 CALL X"E5"
              END-IF
           END-IF.

       030-99-FIM. EXIT.
       END PROGRAM CWLINE.
