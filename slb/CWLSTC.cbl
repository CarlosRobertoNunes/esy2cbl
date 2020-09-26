       IDENTIFICATION DIVISION.
       PROGRAM-ID.    CWLSTC.
       AUTHOR.        COBOLware Services Ltda.
       DATE-WRITTEN.  02/07/2002.
       SECURITY.      *************************************************
                      *                                               *
                      *  Listagem da configuracao                     *
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT USERWK ASSIGN TO DISK
                  ORGANIZATION  IS LINE SEQUENTIAL
                  FILE STATUS   IS FS-USERWK.

       DATA DIVISION.
       FILE SECTION.

       FD   USERWK
            VALUE OF FILE-ID LB-USERWK.

       01   USERWK-REG PIC X(030).

       WORKING-STORAGE SECTION.

       01  AREAS-DE-TRABALHO.
           05 ER-USERWK.
              10 FS-USERWK             PIC  X(002) VALUE "00".
              10 LB-USERWK             PIC  X(255) VALUE SPACES.
           05 SALVA-REG                PIC  X(032) VALUE SPACES.
           05 TMP                      PIC  X(255) VALUE SPACES.
           05 TMP-LB                   PIC  X(012) VALUE "CWL00000.TMP".
           05 X                        PIC  9(002) VALUE 0.
           05 Y                        PIC  9(002) VALUE 0.
           05 Z                        PIC  9(002) VALUE 0.
           05 CADEIA-ASCII.
              10 ASCII-I OCCURS 50 COMP-X PIC  9(002).
           05 TABELA-ATRIBUTOS.
              10 PIC X(13) VALUE "6/.      \ a:".
              10 PIC X(13) VALUE "8/.      \ b:".
              10 PIC X(13) VALUE "Azul     \ c:".
              10 PIC X(13) VALUE "Carta    \ d:".
              10 PIC X(13) VALUE "Condensar\ e:".
              10 PIC X(13) VALUE "Draft    \ f:".
              10 PIC X(13) VALUE "Expandir \ g:".
              10 PIC X(13) VALUE "Italico  \ h:".
              10 PIC X(13) VALUE "Negrito  \ i:".
              10 PIC X(13) VALUE "Normal   \ j:".
              10 PIC X(13) VALUE "Paisagem \ k:".
              10 PIC X(13) VALUE "Reset    \ l:".
              10 PIC X(13) VALUE "Sublinhar\ n:".
              10 PIC X(13) VALUE "Verde    \ o:".
              10 PIC X(13) VALUE "Vermelho \ p:".
           05 REDEFINES TABELA-ATRIBUTOS.
              10 ATRIBUTO PIC X(13) OCCURS 15.
           05 MINUSCULAS PIC X(26) VALUE "abcdefghijklmnopqrstuvwxyz".
           05 MAIUSCULAS PIC X(26) VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
           05 ACENTOS     PIC X(36) VALUE
              "������������������������������������".
           05 SEM-ACENTOS PIC X(36) VALUE
              "aeiouaeiouaouaeocaEIOUAEIOUAOUAeOCoa".
           05 NOME                     PIC  X(030) VALUE SPACES.
           05 TASK                     PIC  9(006) VALUE 0.
           05 PROGRAMA                 PIC  X(008) VALUE SPACES.
           05 BARRA                    PIC  X(001) VALUE SPACE.
           05 TAB-USUARIO.
              10 PIC X(25) VALUE "0 - DIGITADOR I".
              10 PIC X(25) VALUE "1 - DIGITADOR II".
              10 PIC X(25) VALUE "2 - OPERADOR".
              10 PIC X(25) VALUE "3 - USUARIO".
              10 PIC X(25) VALUE "4 - PROGRAMADOR".
              10 PIC X(25) VALUE "5 - GERENTE DE PRODUCAO".
              10 PIC X(25) VALUE "6 - ANALISTA DE SISTEMAS".
              10 PIC X(25) VALUE "7 - CHEFE DE EQUIPE".
              10 PIC X(25) VALUE "8 - GERENTE DE SISTEMAS".
              10 PIC X(25) VALUE "9 - SUPER USUARIO".
           05 FILLER REDEFINES TAB-USUARIO.
              10 TBU PIC X(25) OCCURS 10.

       01  LINHAS-DE-IMPRESSAO-CLIC.
       02  LINHA-01.
           05 FILLER                         PIC  X(036) VALUE
              "ARQUIVO                        LABEL".
       02  LINHA-02.
           05 CLIC-ARQUIVO                   PIC  X(030) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-LABEL                     PIC  X(050) VALUE SPACES.
       02  LINHA-03.
           05 FILLER                         PIC  X(055) VALUE
              "GRUPO                 PROGRAMA MODO            ACESSO A".
           05 FILLER                         PIC  X(044) VALUE
              "LTERACAO CONSULTA EXCLUSAO INCLUSAO USUARIOS".
       02  LINHA-04.
           05 CLIC-NOME-GRUPO                PIC  X(030) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-ADM                       PIC  X(008) VALUE SPACES.
           05 FILLER                         PIC  X(052) VALUE SPACES.
           05 CLIC-USUARIOS                  PIC  X(030) VALUE SPACES.
       02  LINHA-05.
           05 FILLER                         PIC  X(022) VALUE SPACES.
           05 CLIC-PROG-GRUPO                PIC  X(008) VALUE SPACES.
           05 FILLER                         PIC  X(017) VALUE SPACES.
           05 CLIC-ACESSO-GRUPO              PIC  X(001) VALUE SPACE.
           05 FILLER                         PIC  X(006) VALUE SPACES.
           05 CLIC-ALTERACAO-GRUPO           PIC  X(001) VALUE SPACE.
           05 FILLER                         PIC  X(009) VALUE SPACES.
           05 CLIC-CONSULTA-GRUPO            PIC  X(001) VALUE SPACE.
           05 FILLER                         PIC  X(008) VALUE SPACES.
           05 CLIC-EXCLUSAO-GRUPO            PIC  X(001) VALUE SPACE.
           05 FILLER                         PIC  X(008) VALUE SPACES.
           05 CLIC-INCLUSAO-GRUPO            PIC  X(001) VALUE SPACE.
           05 FILLER                         PIC  X(008) VALUE SPACES.
           05 CLIC-USUARIOS2                 PIC  X(030) VALUE SPACES.
       02  LINHA-06.
           05 FILLER                         PIC  X(055) VALUE
              "IMPRESSORA                     DEVICE                  ".
           05 FILLER                         PIC  X(046) VALUE
              "                           PREPARO      ESTILO".
       02  LINHA-07.
           05 CLIC-IMPRESSORA                PIC  X(030) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-DEVICE                    PIC  X(050) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-PREPARO                   PIC  X(012) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-ESTILO                    PIC  X(030) VALUE SPACES.
       02  LINHA-08.
           05 FILLER                         PIC  X(078) VALUE SPACES.
           05 CLIC-ASCII-TEXTO               PIC  X(014) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-ASC BLANK ZERO OCCURS 10  PIC  999B.
       02  LINHA-09.
           05 FILLER                         PIC  X(050) VALUE
              "ESTILO                         ATRIBUTO     STRING".
       02  LINHA-10.
           05 CLIC-ESTILO2                   PIC  X(030) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-ATRIBUTO                  PIC  X(013) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-STRING OCCURS 16          PIC  999B.
       02  LINHA-11.
           05 FILLER                         PIC  X(055) VALUE
              "PAGINA OPCAO CONFIRMA NIVEL FUNCAO                     ".
           05 FILLER                         PIC  X(033) VALUE
              "        PROGRAMA HELP/PAGINA/PATH".
       02  LINHA-12.
           05 FILLER                         PIC  X(002) VALUE SPACES.
           05 CLIC-PAGINA                    PIC  Z(004) VALUE ZEROS.
           05 FILLER                         PIC  X(004) VALUE SPACES.
           05 CLIC-OPCAO                     PIC  Z(002) VALUE ZEROS.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-CONFIRMA                  PIC  X(001) VALUE SPACE.
           05 FILLER                         PIC  X(008) VALUE SPACES.
           05 CLIC-NIVEL                     PIC  Z(001) VALUE ZERO.
           05 FILLER                         PIC  X(005) VALUE SPACES.
           05 CLIC-FUNCAO                    PIC  X(034) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-PROGRAMA                  PIC  X(008) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-HELP                      PIC  X(020) VALUE SPACES.
       02  LINHA-13.
           05 FILLER                         PIC  X(055) VALUE
              "JOB     MODULO/PARAMETRO                               ".
           05 FILLER                         PIC  X(033) VALUE
              "    TIPO OK      NAO OK  MENSAGEM".
       02  LINHA-14.
           05 CLIC-JOB                       PIC  X(007) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-MODULO                    PIC  X(050) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-TIPO                      PIC  X(003) VALUE SPACES.
           05 FILLER                         PIC  X(002) VALUE SPACES.
           05 CLIC-OK                        PIC  X(007) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-NAO-OK                    PIC  X(007) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-MENSAGEM                  PIC  X(050) VALUE SPACES.
       02  LINHA-15.
           05 FILLER                         PIC  X(008) VALUE SPACES.
           05 CLIC-PARAMETRO                 PIC  X(060) VALUE SPACES.
       02  LINHA-16.
           05 FILLER                         PIC  X(055) VALUE
              "RELATORIO COMPRIME DESCOMPRIME FORMULARIO        LINHAS".
           05 FILLER                         PIC  X(009) VALUE
              " SAIDA PA".
           05 FILLER                         PIC  X(002) VALUE "DR".
           05 FILLER                         PIC  X(032) VALUE
              "AO    COLUNAS TABULADAS/APAGADAS".
       02  LINHA-17.
           05 CLIC-RELATORIO                 PIC  X(007) VALUE SPACES.
           05 FILLER                         PIC  X(003) VALUE SPACES.
           05 CLIC-PROGRAMA-ASC1 BLANK ZERO  PIC  9(003) VALUE ZEROS.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-PROGRAMA-ASC2 BLANK ZERO  PIC  9(003) VALUE ZEROS.
           05 FILLER                         PIC  X(002) VALUE SPACES.
           05 CLIC-DESPROG-ASC1 BLANK ZERO   PIC  9(003) VALUE ZEROS.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-DESPROG-ASC2 BLANK ZERO   PIC  9(003) VALUE ZEROS.
           05 FILLER                         PIC  X(005) VALUE SPACES.
           05 CLIC-TIPO-FORM                 PIC  X(020) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-SIZE-PAGE                 PIC  Z(003) VALUE ZEROS.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-SAIDA                     PIC  X(015) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-TAB OCCURS 12 BLANK ZERO  PIC  999B.
       02  LINHA-18.
           05 CLIC-NAME-REPORT               PIC  X(023) VALUE SPACES.
           05 FILLER                         PIC  X(049) VALUE SPACES.
           05 CLIC-APA OCCURS 12 BLANK ZERO  PIC  999B.
       02  LINHA-19.
           05 FILLER                         PIC  X(020) VALUE SPACES.
           05 CLIC-REP-TXT                   PIC  X(009) VALUE SPACES.
           05 FILLER                         PIC  X(002) VALUE ": ".
           05 CLIC-REP                       PIC  X(086) VALUE SPACES.
       02  LINHA-20.
           05 FILLER                         PIC  X(055) VALUE
              "USUARIO                        NIVEL                   ".
           05 FILLER                         PIC  X(054) VALUE
              "  GRUPO                  PATH SPOOL                   ".
           05 FILLER                         PIC  X(012) VALUE
              "  IMPRESSORA".
       02  LINHA-21.
           05 CLIC-NOME                      PIC  X(030) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-NIVEL-PS                  PIC  X(025) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-GRUPO                     PIC  X(022) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-PATH-SPOOL                PIC  X(030) VALUE SPACES.
           05 FILLER                         PIC  X(001) VALUE SPACE.
           05 CLIC-PRINTER-DEFAULT           PIC  X(008) VALUE SPACES.

       COPY CWBOXS.
       COPY CWIMPR.
       COPY CWUNIX.
       COPY CWCONF.

       SCREEN SECTION.

       PROCEDURE DIVISION.

       000-INICIO.

           PERFORM 800-INICIAIS      THRU 800-99-FIM
           PERFORM 100-PROCESSAMENTO THRU 100-99-FIM
           PERFORM 900-FINAIS        THRU 900-99-FIM.

       000-99-FIM. GOBACK.

       100-PROCESSAMENTO.

           MOVE "CONFIGURACAO"                  TO CWIMPR-TITLE
           MOVE 10                              TO CWBOXS-LINE
                                                   CWBOXS-COLUMN
           MOVE "N"                             TO CWBOXS-ERASE
           MOVE "Listar_configura��o_de:"       TO CWBOXS-TITLE
           MOVE "~Arquivos"                     TO CWBOXS-TEXT (1)
           MOVE "~Grupos de usu�rios"           TO CWBOXS-TEXT (2)
           MOVE "~Impressoras/modelos"          TO CWBOXS-TEXT (3)
           MOVE "impressoras/~Estilos"          TO CWBOXS-TEXT (4)
           MOVE "~Programas do menu principal"  TO CWBOXS-TEXT (5)
           MOVE "programas do menu ~Secund�rio" TO CWBOXS-TEXT (6)
           MOVE "programas em ~Jobs"            TO CWBOXS-TEXT (7)
           MOVE "~Relat�rios"                   TO CWBOXS-TEXT (8)
           MOVE "~Usu�rios"                     TO CWBOXS-TEXT (9)
           CALL "CWBOXS" USING PARAMETROS-CWBOXS
           EVALUATE CWBOXS-OPTION
            WHEN 1
                SET CWIMPR-SIZE-080 TO TRUE
                MOVE "ARQUIVOS"     TO CWIMPR-SUB-TITLE
                MOVE "Config/Arquivos" TO CWIMPR-NOTE
                MOVE "02" TO CWCONF-REG
                SET CWSQLC-START TO TRUE
                SET CWSQLC-NOT-LESS TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE LINHA-01  TO CWIMPR-HEADER-1
                MOVE "CWLSTCA" TO CWIMPR-REPORT
                PERFORM UNTIL FS-CWCONF > "09"
                           OR (CWCONF-TIPO NOT = "02")
                           OR CWIMPR-END-PRINT
                        SET CWSQLC-READ        TO TRUE
                        SET CWSQLC-NEXT        TO TRUE
                        SET CWSQLC-IGNORE-LOCK TO TRUE
                        CALL "CWCONF" USING CWSQLC CWCONF-REG
                                      FS-CWCONF KCO PCO
                             IF   FS-CWCONF < "10"
                             AND  CWCONF-TIPO = "02"
                                  MOVE CWCONF-ARQUIVO TO CLIC-ARQUIVO
                                  MOVE CWCONF-LABEL   TO CLIC-LABEL
                                  MOVE LINHA-02       TO CWIMPR-DETAIL
                                  CALL "CWIMPR" USING PARAMETROS-CWIMPR
                             END-IF
                END-PERFORM
            WHEN 2
                CALL "CWGETU" USING NOME TASK PROGRAMA '?'
                CALL "CWUNIX" USING PARAMETROS-CWUNIX
                DISPLAY "TEMP"         UPON ENVIRONMENT-NAME
                ACCEPT  TMP            FROM ENVIRONMENT-VALUE
                IF   TMP = SPACES
                     DISPLAY "TMP"     UPON ENVIRONMENT-NAME
                     ACCEPT  TMP       FROM ENVIRONMENT-VALUE
                END-IF
                MOVE TASK (2: 5)  TO TMP-LB (4: 5)
                IF   TMP NOT = SPACE
                     IF   CWUNIX-ON
                          MOVE "/" TO BARRA
                     ELSE
                          MOVE "\" TO BARRA
                     END-IF
                     MOVE SPACES TO LB-USERWK
                     STRING TMP    DELIMITED BY SPACE
                            BARRA  DELIMITED BY SIZE
                            TMP-LB DELIMITED BY SPACE
                       INTO LB-USERWK
                ELSE
                     MOVE TMP-LB TO LB-USERWK
                END-IF
                MOVE "GRUPOS" TO CWIMPR-SUB-TITLE
                MOVE "Config/Grupos" TO CWIMPR-NOTE
                MOVE "GU"     TO CWCONF-REG
                SET CWSQLC-START       TO TRUE
                SET CWSQLC-NOT-LESS    TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE LINHA-03  TO CWIMPR-HEADER-1
                MOVE "CWLSTCB" TO CWIMPR-REPORT
                PERFORM UNTIL FS-CWCONF > "09"
                     OR (CWCONF-TIPO NOT = "GU")
                     OR CWIMPR-END-PRINT
                  SET CWSQLC-READ        TO TRUE
                  SET CWSQLC-NEXT        TO TRUE
                  SET CWSQLC-IGNORE-LOCK TO TRUE
                  CALL "CWCONF" USING CWSQLC CWCONF-REG
                                      FS-CWCONF KCO PCO
                       IF   FS-CWCONF < "10"
                       AND  CWCONF-TIPO = "GU"
                            IF CWCONF-PROG-GRUPO = SPACES
                               PERFORM 151-CLEAR-USERWK THRU 151-99-FIM
                               MOVE CWCONF-NOME-GRUPO
                                                   TO CLIC-NOME-GRUPO
                               PERFORM 150-GERA-USERWK THRU 150-99-FIM
                               READ USERWK INTO CLIC-USUARIOS
                               IF   CWCONF-ADM = "I"
                                    MOVE "LIBERAR" TO CLIC-ADM
                               ELSE
                                    MOVE "BLOQUEAR" TO CLIC-ADM
                               END-IF
                               MOVE LINHA-04       TO CWIMPR-DETAIL
                               CALL "CWIMPR" USING PARAMETROS-CWIMPR
                            ELSE
                               MOVE CWCONF-PROG-GRUPO
                                                   TO CLIC-PROG-GRUPO
                               IF CWCONF-ACESSO-GRUPO NOT = SPACE
                                  MOVE "*" TO CLIC-ACESSO-GRUPO
                               ELSE
                                  MOVE SPACES TO CLIC-ACESSO-GRUPO
                               END-IF
                               IF CWCONF-ALTERACAO-GRUPO NOT = SPACE
                                  MOVE "*" TO CLIC-ALTERACAO-GRUPO
                               ELSE
                                  MOVE SPACES TO CLIC-ALTERACAO-GRUPO
                               END-IF
                               IF CWCONF-CONSULTA-GRUPO NOT = SPACE
                                  MOVE "*" TO CLIC-CONSULTA-GRUPO
                               ELSE
                                  MOVE SPACES TO CLIC-CONSULTA-GRUPO
                               END-IF
                               IF CWCONF-EXCLUSAO-GRUPO NOT = SPACE
                                  MOVE "*" TO CLIC-EXCLUSAO-GRUPO
                               ELSE
                                  MOVE SPACES TO CLIC-EXCLUSAO-GRUPO
                               END-IF
                               IF CWCONF-INCLUSAO-GRUPO NOT = SPACE
                                  MOVE "*" TO CLIC-INCLUSAO-GRUPO
                               ELSE
                                  MOVE SPACES TO CLIC-INCLUSAO-GRUPO
                               END-IF
                               READ USERWK INTO CLIC-USUARIOS2
                               IF  FS-USERWK NOT = "00"
                                   MOVE SPACES TO CLIC-USUARIOS2
                               END-IF
                               MOVE LINHA-05       TO CWIMPR-DETAIL
                               MOVE SPACES         TO LINHA-05
                               CALL "CWIMPR" USING PARAMETROS-CWIMPR
                            END-IF
                       END-IF
                END-PERFORM
                PERFORM 151-CLEAR-USERWK THRU 151-99-FIM
            WHEN 3
                MOVE "IMPRESSORAS/MODELOS"  TO CWIMPR-SUB-TITLE
                MOVE "Config/Impressoras" TO CWIMPR-NOTE
                MOVE "03" TO CWCONF-REG
                SET CWSQLC-START TO TRUE
                SET CWSQLC-NOT-LESS TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE LINHA-06  TO CWIMPR-HEADER-1
                MOVE "CWLSTCC" TO CWIMPR-REPORT
                PERFORM UNTIL FS-CWCONF > "09"
                           OR (CWCONF-TIPO NOT = "03")
                           OR CWIMPR-END-PRINT
                             SET CWSQLC-READ        TO TRUE
                             SET CWSQLC-NEXT        TO TRUE
                             SET CWSQLC-IGNORE-LOCK TO TRUE
                             CALL "CWCONF" USING CWSQLC CWCONF-REG
                                                 FS-CWCONF KCO PCO
                             IF  FS-CWCONF < "10"
                             AND CWCONF-TIPO = "03"
                                 MOVE CWCONF-ARQUIVO TO CLIC-IMPRESSORA
                                 MOVE CWCONF-LABEL   TO CLIC-DEVICE
                                 EVALUATE CWCONF-EJECT-MODE
                                     WHEN "01"
                                          MOVE "FIM" TO CLIC-PREPARO
                                     WHEN "10"
                                           MOVE "INICIO" TO CLIC-PREPARO
                                     WHEN "11"
                                           MOVE "INICIO E FIM"
                                             TO CLIC-PREPARO
                                     WHEN OTHER MOVE "S/PREPARO"
                                                 TO CLIC-PREPARO
                                 END-EVALUATE
                                 MOVE CWCONF-ESTILO  TO CLIC-ESTILO
                                 MOVE LINHA-07       TO CWIMPR-DETAIL
                                 CALL "CWIMPR" USING PARAMETROS-CWIMPR
                                 MOVE SPACES      TO LINHA-08
                                 IF   CWCONF-ASCII = X"FF"
                                      IF CWCONF-CADEIA-ASCII-INICIAL
                                         NOT = LOW-VALUES
                                        MOVE CWCONF-CADEIA-ASCII-INICIAL
                                          TO CADEIA-ASCII
                                         MOVE "ASCII INICIAL:"
                                           TO CLIC-ASCII-TEXTO
                                         PERFORM 110-PRINT-ASCII
                                            THRU 110-99-FIM
                                      END-IF
                                      IF CWCONF-CADEIA-ASCII-FINAL
                                         NOT = LOW-VALUES
                                         MOVE "  ASCII FINAL:"
                                           TO CLIC-ASCII-TEXTO
                                         MOVE CWCONF-CADEIA-ASCII-FINAL
                                           TO CADEIA-ASCII
                                         PERFORM 110-PRINT-ASCII
                                            THRU 110-99-FIM
                                      END-IF
                                 END-IF
                             END-IF
                END-PERFORM
            WHEN 4
                MOVE "IMPRESSORAS/ESTILOS"  TO CWIMPR-SUB-TITLE
                MOVE "Config/Estilos" TO CWIMPR-NOTE
                MOVE "ES" TO CWCONF-REG
                SET CWSQLC-START TO TRUE
                SET CWSQLC-NOT-LESS TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE LINHA-09  TO CWIMPR-HEADER-1
                MOVE "CWLSTCD" TO CWIMPR-REPORT
                PERFORM UNTIL FS-CWCONF > "09"
                           OR (CWCONF-TIPO NOT = "ES")
                           OR CWIMPR-END-PRINT
                        SET CWSQLC-READ        TO TRUE
                        SET CWSQLC-NEXT        TO TRUE
                        SET CWSQLC-IGNORE-LOCK TO TRUE
                        CALL "CWCONF" USING CWSQLC CWCONF-REG
                                            FS-CWCONF KCO PCO
                             IF   FS-CWCONF < "10"
                             AND  CWCONF-TIPO = "ES"
                                  MOVE SPACES         TO LINHA-10
                                  MOVE CWCONF-ARQUIVO TO CLIC-ESTILO2
                                  PERFORM 120-PRINT-ESTILO
                                     THRU 120-99-FIM
                                      VARYING Z FROM 1 BY 1 UNTIL Z > 15
                             END-IF
                END-PERFORM
            WHEN 5
                MOVE "PROGRAMAS/MENU PRINCIPAL" TO CWIMPR-SUB-TITLE
                MOVE "Config/Programas" TO CWIMPR-NOTE
                MOVE "99"               TO CWCONF-REG
                SET CWSQLC-START TO TRUE
                SET CWSQLC-NOT-LESS TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE LINHA-11  TO CWIMPR-HEADER-1
                MOVE "CWLSTCE" TO CWIMPR-REPORT
                PERFORM UNTIL FS-CWCONF > "09"
                           OR (CWCONF-TIPO NOT = "99")
                           OR CWIMPR-END-PRINT
                        SET CWSQLC-READ        TO TRUE
                        SET CWSQLC-NEXT        TO TRUE
                        SET CWSQLC-IGNORE-LOCK TO TRUE
                        CALL "CWCONF" USING CWSQLC CWCONF-REG
                                            FS-CWCONF KCO PCO
                             IF   FS-CWCONF < "10"
                             AND  CWCONF-TIPO = "99"
                                  MOVE CWCONF-PAGINA TO CLIC-PAGINA
                                  PERFORM 130-PRINT-PROGRAM
                                     THRU 130-99-FIM
                                          VARYING Z FROM 1 BY 1
                                            UNTIL Z > 26
                             END-IF
                END-PERFORM
            WHEN 6
                MOVE "PROGRAMAS/MENU SECUNDARIO" TO CWIMPR-SUB-TITLE
                MOVE "Config/Programas" TO CWIMPR-NOTE
                MOVE "SM"               TO CWCONF-REG
                SET CWSQLC-START TO TRUE
                SET CWSQLC-NOT-LESS TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE LINHA-11  TO CWIMPR-HEADER-1
                MOVE "CWLSTCF" TO CWIMPR-REPORT
                PERFORM UNTIL FS-CWCONF > "09"
                           OR (CWCONF-TIPO NOT = "SM")
                           OR CWIMPR-END-PRINT
                        SET CWSQLC-READ        TO TRUE
                        SET CWSQLC-NEXT        TO TRUE
                        SET CWSQLC-IGNORE-LOCK TO TRUE
                        CALL "CWCONF" USING CWSQLC CWCONF-REG
                                            FS-CWCONF KCO PCO
                             IF   FS-CWCONF < "10"
                             AND  CWCONF-TIPO = "SM"
                                  MOVE CWCONF-PAGINA TO CLIC-PAGINA
                                  PERFORM 130-PRINT-PROGRAM
                                     THRU 130-99-FIM
                                          VARYING Z FROM 1 BY 1
                                            UNTIL Z > 26
                             END-IF
                END-PERFORM
            WHEN 7
                MOVE "PROGRAMAS/JOBS" TO CWIMPR-SUB-TITLE
                MOVE "Config/Jobs"    TO CWIMPR-NOTE
                MOVE "JB"              TO CWCONF-REG
                SET CWSQLC-START TO TRUE
                SET CWSQLC-NOT-LESS TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE LINHA-13  TO CWIMPR-HEADER-1
                MOVE "CWLSTCG" TO CWIMPR-REPORT
                PERFORM UNTIL FS-CWCONF > "09"
                           OR (CWCONF-TIPO NOT = "JB")
                           OR CWIMPR-END-PRINT
                        SET CWSQLC-READ        TO TRUE
                        SET CWSQLC-NEXT        TO TRUE
                        SET CWSQLC-IGNORE-LOCK TO TRUE
                        CALL "CWCONF" USING CWSQLC CWCONF-REG
                                            FS-CWCONF KCO PCO
                             IF   FS-CWCONF < "10"
                             AND  CWCONF-TIPO = "JB"
                                  MOVE CWCONF-JOB TO CLIC-JOB
                                  MOVE CWCONF-JOB-MODULO TO CLIC-MODULO
                                  IF  CWCONF-JOB-BINARIO
                                      MOVE "BINARIO" TO CLIC-TIPO
                                  ELSE
                                      MOVE "COBOL"   TO CLIC-TIPO
                                  END-IF
                                  MOVE CWCONF-JOB-PROXIMO-RC-OK
                                    TO CLIC-OK
                                  MOVE CWCONF-JOB-PROXIMO-NAO-OK
                                    TO CLIC-NAO-OK
                                  MOVE CWCONF-JOB-PARAMETRO
                                    TO CLIC-PARAMETRO
                                  MOVE CWCONF-JOB-MENSAGEM
                                    TO CLIC-MENSAGEM
                                  MOVE LINHA-14       TO CWIMPR-DETAIL
                                  CALL "CWIMPR" USING PARAMETROS-CWIMPR
                                  IF NOT CWIMPR-END-PRINT
                                  AND(CWCONF-JOB-PARAMETRO NOT = SPACES)
                                      MOVE LINHA-15
                                        TO CWIMPR-DETAIL
                                      CALL "CWIMPR"
                                      USING PARAMETROS-CWIMPR
                                  END-IF
                             END-IF
                END-PERFORM
            WHEN 8
                MOVE "RELATORIOS"        TO CWIMPR-SUB-TITLE
                MOVE "Config/Relat�rios" TO CWIMPR-NOTE
                MOVE "94"                TO CWCONF-REG
                SET CWSQLC-START TO TRUE
                SET CWSQLC-NOT-LESS TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE LINHA-16  TO CWIMPR-HEADER-1
                MOVE "CWLSTCH" TO CWIMPR-REPORT
                PERFORM UNTIL FS-CWCONF > "09"
                           OR (CWCONF-TIPO NOT = "94")
                           OR CWIMPR-END-PRINT
                        SET CWSQLC-READ        TO TRUE
                        SET CWSQLC-NEXT        TO TRUE
                        SET CWSQLC-IGNORE-LOCK TO TRUE
                        CALL "CWCONF" USING CWSQLC CWCONF-REG
                                            FS-CWCONF KCO PCO
                             IF   FS-CWCONF < "10"
                             AND  CWCONF-TIPO = "94"
                                  PERFORM 140-PRINT-REPORT
                                     THRU 140-99-FIM
                             END-IF
                END-PERFORM
            WHEN 9
                MOVE "USUARIOS"          TO CWIMPR-SUB-TITLE
                MOVE "Config/Usu�rios"   TO CWIMPR-NOTE
                MOVE "PS"                TO CWCONF-REG
                SET CWSQLC-START TO TRUE
                SET CWSQLC-NOT-LESS TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE LINHA-20  TO CWIMPR-HEADER-1
                MOVE "CWLSTCI" TO CWIMPR-REPORT
                PERFORM UNTIL FS-CWCONF > "09"
                           OR (CWCONF-TIPO NOT = "PS")
                           OR CWIMPR-END-PRINT
                        SET CWSQLC-READ        TO TRUE
                        SET CWSQLC-NEXT        TO TRUE
                        SET CWSQLC-IGNORE-LOCK TO TRUE
                        CALL "CWCONF" USING CWSQLC CWCONF-REG
                                            FS-CWCONF KCO PCO
                             IF   FS-CWCONF < "10"
                             AND  CWCONF-TIPO = "PS"
                                  MOVE CWCONF-NOME
                                    TO CLIC-NOME
                                  MOVE CWCONF-NIVEL-PS TO X
                                  ADD  1               TO X
                                  MOVE TBU (X)
                                    TO CLIC-NIVEL-PS
                                  MOVE CWCONF-GRUPO
                                    TO CLIC-GRUPO
                                  INSPECT CLIC-GRUPO
                                          CONVERTING ACENTOS
                                                  TO SEM-ACENTOS
                                  MOVE CWCONF-PATH-SPOOL
                                    TO CLIC-PATH-SPOOL
                                  MOVE CWCONF-PRINTER-DEFAULT
                                    TO CLIC-PRINTER-DEFAULT
                                  MOVE LINHA-21       TO CWIMPR-DETAIL
                                  CALL "CWIMPR" USING PARAMETROS-CWIMPR
                             END-IF
                END-PERFORM
           END-EVALUATE

           IF   NOT CWIMPR-END-PRINT
                SET CWIMPR-CLOSE TO TRUE
                CALL "CWIMPR" USING PARAMETROS-CWIMPR
           END-IF.

       100-99-FIM. EXIT.

       110-PRINT-ASCII.

           MOVE 0 TO Y
           PERFORM VARYING X FROM 1 BY 1 UNTIL X > 50
                   IF  ASCII-I (X) NOT = 0
                       ADD  1              TO Y
                       MOVE ASCII-I (X) TO CLIC-ASC (Y)
                       IF   Y = 10
                            MOVE 0        TO Y
                            MOVE LINHA-08 TO CWIMPR-DETAIL
                            MOVE SPACES   TO LINHA-08
                            IF   NOT CWIMPR-END-PRINT
                                 CALL "CWIMPR" USING PARAMETROS-CWIMPR
                            END-IF
                       END-IF
                   END-IF
           END-PERFORM

           IF  (NOT CWIMPR-END-PRINT)
           AND (LINHA-08 NOT = SPACES)
               MOVE LINHA-08    TO CWIMPR-DETAIL
               MOVE SPACES      TO LINHA-08
               CALL "CWIMPR" USING PARAMETROS-CWIMPR
           END-IF.

       110-99-FIM. EXIT.

       120-PRINT-ESTILO.

           MOVE 0 TO Y
           PERFORM VARYING X FROM 1 BY 1 UNTIL X > 16
                   IF  CWCONF-ASC (Z X) NUMERIC
                   AND CWCONF-ASC (Z X) NOT = 0
                       ADD  1                TO Y
                       MOVE CWCONF-ASC (Z X) TO CLIC-STRING (Y)
                       IF   Y = 16
                            MOVE 0            TO Y
                            MOVE ATRIBUTO (Z) TO CLIC-ATRIBUTO
                            MOVE LINHA-10     TO CWIMPR-DETAIL
                            MOVE SPACES       TO LINHA-10
                            IF   NOT CWIMPR-END-PRINT
                                 CALL "CWIMPR" USING PARAMETROS-CWIMPR
                            END-IF
                       END-IF
                   END-IF
           END-PERFORM

           IF  (NOT CWIMPR-END-PRINT)
           AND (LINHA-10 NOT = SPACES)
               MOVE ATRIBUTO (Z) TO CLIC-ATRIBUTO
               MOVE LINHA-10     TO CWIMPR-DETAIL
               MOVE SPACES       TO LINHA-10
               CALL "CWIMPR" USING PARAMETROS-CWIMPR
           END-IF.

       120-99-FIM. EXIT.

       130-PRINT-PROGRAM.

           IF   CWCONF-NM-OPCAO (Z) NOT = SPACES
                MOVE CWCONF-NO-OPCAO (Z) TO CLIC-OPCAO
                MOVE CWCONF-CHECK    (Z) TO CLIC-CONFIRMA
                MOVE CWCONF-NIVEL    (Z) TO CLIC-NIVEL
                MOVE CWCONF-NM-OPCAO (Z) TO CLIC-FUNCAO
                MOVE CWCONF-PROG     (Z) TO CLIC-PROGRAMA
                MOVE CWCONF-HELP     (Z) TO CLIC-HELP
                IF   CLIC-PROGRAMA NOT = SPACES
                     CALL "CWCODE" USING "D" CWCONF-SIZE-P-99  (Z)
                                             CWCONF-FATOR-P-99 (Z)
                                             CLIC-PROGRAMA
                     INSPECT CLIC-PROGRAMA
                             CONVERTING MINUSCULAS TO MAIUSCULAS
                END-IF
                INSPECT CLIC-FUNCAO
                        CONVERTING ACENTOS    TO SEM-ACENTOS
                MOVE LINHA-12     TO CWIMPR-DETAIL
                CALL "CWIMPR"  USING PARAMETROS-CWIMPR
                MOVE SPACES       TO LINHA-12
           END-IF.

       130-99-FIM. EXIT.

       140-PRINT-REPORT.

            MOVE CWCONF-RELATORIO          TO CLIC-RELATORIO
            MOVE CWCONF-NAME-REPORT        TO CLIC-NAME-REPORT
            MOVE CWCONF-PROGRAMA-ASCII1    TO CLIC-PROGRAMA-ASC1
            MOVE CWCONF-PROGRAMA-ASCII2    TO CLIC-PROGRAMA-ASC2
            MOVE CWCONF-DESPROGRAMA-ASCII1 TO CLIC-DESPROG-ASC1
            MOVE CWCONF-DESPROGRAMA-ASCII2 TO CLIC-DESPROG-ASC2
            MOVE CWCONF-TIPO-FORM          TO CLIC-TIPO-FORM
            MOVE CWCONF-SIZE-PAGE          TO CLIC-SIZE-PAGE
            MOVE CWCONF-SAIDA              TO CLIC-SAIDA
            MOVE CWCONF-INICIO-AP (1)      TO CLIC-TAB (01)
            MOVE CWCONF-FIM-AP    (1)      TO CLIC-TAB (02)
            MOVE CWCONF-INICIO-AP (2)      TO CLIC-TAB (03)
            MOVE CWCONF-FIM-AP    (2)      TO CLIC-TAB (04)
            MOVE CWCONF-INICIO-AP (3)      TO CLIC-TAB (05)
            MOVE CWCONF-FIM-AP    (3)      TO CLIC-TAB (06)
            MOVE CWCONF-INICIO-AP (4)      TO CLIC-TAB (07)
            MOVE CWCONF-FIM-AP    (4)      TO CLIC-TAB (08)
            MOVE CWCONF-INICIO-AP (5)      TO CLIC-TAB (09)
            MOVE CWCONF-FIM-AP    (5)      TO CLIC-TAB (10)
            MOVE CWCONF-INICIO-AP (6)      TO CLIC-TAB (11)
            MOVE CWCONF-FIM-AP    (6)      TO CLIC-TAB (12)
            MOVE CWCONF-INICIO-TB (1)      TO CLIC-APA (01)
            MOVE CWCONF-FIM-TB    (1)      TO CLIC-APA (02)
            MOVE CWCONF-INICIO-TB (2)      TO CLIC-APA (03)
            MOVE CWCONF-FIM-TB    (2)      TO CLIC-APA (04)
            MOVE CWCONF-INICIO-TB (3)      TO CLIC-APA (05)
            MOVE CWCONF-FIM-TB    (3)      TO CLIC-APA (06)
            MOVE CWCONF-INICIO-TB (4)      TO CLIC-APA (07)
            MOVE CWCONF-FIM-TB    (4)      TO CLIC-APA (08)
            MOVE CWCONF-INICIO-TB (5)      TO CLIC-APA (09)
            MOVE CWCONF-FIM-TB    (5)      TO CLIC-APA (10)
            MOVE CWCONF-INICIO-TB (6)      TO CLIC-APA (11)
            MOVE CWCONF-FIM-TB    (6)      TO CLIC-APA (12)
            MOVE LINHA-17                  TO CWIMPR-DETAIL
            CALL "CWIMPR"               USING PARAMETROS-CWIMPR
            IF   NOT CWIMPR-END-PRINT
            AND((CWCONF-CAMPOS-TB NOT = ALL "0")
             OR (CLIC-NAME-REPORT NOT = SPACES))
                 MOVE LINHA-18             TO CWIMPR-DETAIL
                 CALL "CWIMPR"          USING PARAMETROS-CWIMPR
            END-IF
            IF   CWCONF-TITLE NOT = SPACE
            AND (NOT CWIMPR-END-PRINT)
                MOVE "   TITULO"  TO CLIC-REP-TXT
                MOVE CWCONF-TITLE TO CLIC-REP
                MOVE LINHA-19     TO CWIMPR-DETAIL
                CALL "CWIMPR"  USING PARAMETROS-CWIMPR
            END-IF
            IF   CWCONF-SUB-TITLE NOT = SPACE
            AND (NOT CWIMPR-END-PRINT)
                MOVE "SUBTITULO"      TO CLIC-REP-TXT
                MOVE CWCONF-SUB-TITLE TO CLIC-REP
                MOVE LINHA-19         TO CWIMPR-DETAIL
                CALL "CWIMPR"      USING PARAMETROS-CWIMPR
            END-IF
            IF   CWCONF-EMPRESA-ALT  NOT = SPACE
            AND (NOT CWIMPR-END-PRINT)
                MOVE "  EMPRESA"        TO CLIC-REP-TXT
                MOVE CWCONF-EMPRESA-ALT TO CLIC-REP
                MOVE LINHA-19           TO CWIMPR-DETAIL
                CALL "CWIMPR"        USING PARAMETROS-CWIMPR
            END-IF
            IF   CWCONF-SISTEMA-ALT  NOT = SPACE
            AND (NOT CWIMPR-END-PRINT)
                MOVE "  SISTEMA"        TO CLIC-REP-TXT
                MOVE CWCONF-SISTEMA-ALT TO CLIC-REP
                MOVE LINHA-19           TO CWIMPR-DETAIL
                CALL "CWIMPR"        USING PARAMETROS-CWIMPR
            END-IF.

       140-99-FIM. EXIT.

       150-GERA-USERWK.

           MOVE CWCONF-REG TO SALVA-REG
           OPEN OUTPUT USERWK
           MOVE "PS" TO CWCONF-REG
           SET CWSQLC-NOT-LESS TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           PERFORM UNTIL FS-CWCONF > "09"
                OR (CWCONF-TIPO NOT = "PS")
                OR CWIMPR-END-PRINT
                   SET CWSQLC-READ        TO TRUE
                   SET CWSQLC-NEXT        TO TRUE
                   SET CWSQLC-IGNORE-LOCK TO TRUE
                   CALL "CWCONF" USING CWSQLC CWCONF-REG
                                       FS-CWCONF KCO PCO
                   IF   FS-CWCONF < "10"
                   AND  CWCONF-TIPO = "PS"
                   AND  CWCONF-GRUPO = CLIC-NOME-GRUPO
                        WRITE USERWK-REG FROM CWCONF-NOME
                   END-IF
           END-PERFORM
           CLOSE USERWK
           OPEN INPUT USERWK
           MOVE SALVA-REG TO CWCONF-REG
           SET CWSQLC-NOT-LESS TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           SET CWSQLC-READ        TO TRUE
           SET CWSQLC-NEXT        TO TRUE
           SET CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO.

       150-99-FIM. EXIT.

       151-CLEAR-USERWK.

           ON 1 GO TO 151-99-FIM.

           PERFORM UNTIL FS-USERWK NOT = "00"
                      OR CWIMPR-END-PRINT
                   READ USERWK INTO CLIC-USUARIOS2
                   IF  FS-USERWK = "00"
                       MOVE LINHA-05       TO CWIMPR-DETAIL
                       MOVE SPACES         TO LINHA-05
                       CALL "CWIMPR" USING PARAMETROS-CWIMPR
                   END-IF
           END-PERFORM
           CLOSE USERWK
           DELETE FILE USERWK.

       151-99-FIM. EXIT.

       800-INICIAIS.

           MOVE '"' TO ATRIBUTO(1)(3:1)
                       ATRIBUTO(2)(3:1)
           CANCEL "CWFILE"
           SET CWSQLC-OPEN TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO.

       800-99-FIM. EXIT.

       900-FINAIS.

           SET CWSQLC-CLOSE TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO.

       900-99-FIM. EXIT.

       END PROGRAM CWLSTC.
