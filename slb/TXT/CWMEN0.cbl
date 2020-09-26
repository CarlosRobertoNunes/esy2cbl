       IDENTIFICATION DIVISION.
       PROGRAM-ID.    CWMEN0.
       AUTHOR.        COBOLware Services Ltda.
       DATE-WRITTEN.  09/05/1987.
       SECURITY.      *************************************************
                      *                                               *
                      *   Menu geral                                  *
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA
                      CALL-CONVENTION 66 IS WIN32.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT TEXTO ASSIGN TO DISK
                  ORGANIZATION IS LINE SEQUENTIAL
                  FILE STATUS  IS FS-TEXTO.

       DATA DIVISION.

       FD  TEXTO
           LABEL RECORD IS STANDARD
           VALUE OF FILE-ID IS LB-TEXTO.

       01  TEXTO-REG PIC X(503).

       WORKING-STORAGE SECTION.

       COPY CWBOXS.
       COPY CWBOXC.
       COPY CWLINE.
       COPY CWMOUS.
       COPY CWACTV.
       COPY CWSEND.
       COPY CWBOXW.
       COPY CWTIME.
       COPY CWGETL.
       COPY CWUNIX.
       COPY CWCONF.
       COPY CWLOGD.
       COPY CWACOR.
            05 CWACOR-FUNCAO  PIC  X(001).
               88 CONFIGURAR  VALUE "C" "c" "U" "u".
               88 POR-USUARIO VALUE "U" "u".

       01  AREAS-DE-TRABALHO-1. COPY CWCASE.
           05 CRON                     PIC  X(003) VALUE SPACES.
           05 footline-t.
              10 footline              PIC  9(002) VALUE 23.
           05 cwframe                  PIC  X(018) VALUE SPACES.
LOGON      05 NIVEL-LOGON              PIC  X(001) VALUE SPACES.
Joadir     05 TIT-WORK                 PIC  X(100) VALUE SPACES.
Joadir     05 CWMENUPAGE               PIC  X(003) VALUE SPACES.
Joadir     05 IZ                       PIC  9(002) VALUE 0.
           05 ER-TEXTO.
              10 FS-TEXTO              PIC  X(002) VALUE "00".
              10 LB-TEXTO              PIC  X(255) VALUE SPACES.
           05 CWBORDER                 PIC  X(001) VALUE SPACE.
           05 CWCOMMAREA               PIC  X(010) VALUE SPACES.
           05 LB-FSINI                 PIC  X(255) VALUE SPACES.
           05 FROMGUI                  PIC  X(006) VALUE SPACE.
           05 INISHOW                  PIC  X(003) VALUE SPACES.
           05 CWLEGACYMENU             PIC  X(004) VALUE "OFF".
           05   LEGACY                 PIC  9(002) VALUE 0.
           05   LEGACY-TEXT            PIC  X(034) VALUE SPACES.
           05   L1                     PIC  9(002) VALUE 0.
           05   L2                     PIC  9(002) VALUE 0.
           05 EXTW                     PIC  X(004) VALUE SPACES.
              88 EXTW-OK VALUE 'JPG' 'BMP' 'GIF'.
           05 HOT-KEYS                 PIC  X(034) VALUE SPACES.
           05 COMPUTERNAME             PIC  X(030) VALUE SPACES.
           05 OBS                      PIC  X(035) VALUE SPACES.
           05 CWAUTOSPOOL              PIC  X(003) VALUE SPACE.
           05 ECHOPGM                  PIC  X(002) VALUE SPACE.
           05 OPTS                     PIC  X(018) VALUE SPACES.
           05 ESQUECI                  PIC  X(060) VALUE SPACES.
           05 FSSERVER                 PIC  X(050) VALUE SPACES.
           05 OLD-CWCONF               PIC  X(255) VALUE SPACES.
           05 NEW-CWCONF               PIC  X(255) VALUE SPACES.
           05 CWCOLORBARR              PIC  9(003) VALUE 0.
           05 NUMERO                   PIC  9(018) VALUE 0.
           05 CWNUMERO                 PIC  X(018) VALUE SPACES.
           05 CWLG                     PIC  X(003) VALUE SPACES.
           05 CWCLEAR                  PIC  X(003) VALUE SPACES.
           05 CWLOGP                   PIC  X(008) VALUE SPACES.
           05 CWSAVE                   PIC  X(003) VALUE SPACES.
           05 LENSENHA                 PIC  9(002) VALUE 0.
           05 LEN-LEMBRETE             PIC  9(002) VALUE 0.
           05 ESQUECI-RESPOSTA         PIC  X(030) VALUE SPACES.
           05 MODULO                   PIC  X(025) VALUE SPACES.
           05 CWMENU-HELP              PIC  X(030) VALUE SPACES.
           05 MORE                     PIC  X(001) VALUE SPACE.
           05 MENU-WS                              VALUE SPACES.
              10 WS-OP                 PIC  9(002).
              10 OCCURS 26.
                 15 WS-BOXS-TEXT       PIC  X(078).
                 15 WS-BOXS-CHAR       PIC  X(001).
           05 SARBANE                  PIC  X(003) VALUE SPACES.
           05 HOJE                     PIC  9(008) VALUE 0.
           05 DIAS-SENHA               PIC  9(007) VALUE 0.
           05 EXPIRE                   PIC  9(003) VALUE 0.
           05 EXPIRADA                 PIC  9(001) VALUE 0.
           05 X91-SRCOUT-RESULT        PIC  9(002) COMP-X.
           05 X91-SRCOUT-FUNCTION      PIC  9(002) COMP-X VALUE 47.
           05 FATOR-W           COMP-X PIC  9(002) VALUE 0.
           05 N                        PIC  9(002) VALUE 0.
           05 OPT                      PIC  X(001) VALUE SPACE.
           05 CA-POSI                  PIC  9(004) VALUE 0.
           05 CA-SIZE                  PIC  9(002) VALUE 0.
           05 SENHA-PROV               PIC  9(006) VALUE 0.
           05 MAXUSERS                 PIC  9(006) VALUE 0.
           05 ENTROU                   PIC  9(001) VALUE 0.
           05 RETRY-CWCONF             PIC  9(001) VALUE 0.
           05 MSG-AT.
              10 MSG-AT1               PIC  X(040) VALUE SPACES.
              10 MSG-AT2               PIC  X(040) VALUE SPACES.
              10 MSG-AT3               PIC  X(040) VALUE SPACES.
           05 CWFONE                   PIC  X(043) VALUE SPACES.
           05 PFONE                                VALUE "142800".
              10                       PIC  X(004).
              10 F                     PIC  9(002).
           05 ESPACOS                  PIC  X(078) VALUE SPACES.
           05 B1                       PIC  X(078) VALUE ALL X"B1".
           05 LICENCA-2                PIC  9(009) VALUE 0.
           05 LB7                      PIC  9(001) VALUE 7.
           05 LF1                      PIC  9(001) VALUE 1.
           05 NOFRAME                  PIC  9(001) VALUE 0.
           05 LF4                      PIC  9(001) VALUE 4.
           05 LF7                      PIC  9(001) VALUE 7.
           05 CWLOGO                   PIC  X(011) VALUE SPACES.
           05 SAVE-PROGRAMA            PIC  X(008) VALUE SPACES.
           05 COL-W                    PIC S9(003) VALUE 0.
           05 LOGIN-FLAG               PIC  9(001) VALUE 0.
           05 TTY                      PIC  X(010) VALUE SPACES.
           05 TTY-NOME                 PIC  X(029) VALUE SPACES.
           05 CURDIR                   PIC  X(050) VALUE SPACES.
           05 LICENCA                  PIC  9(006) VALUE 0.
           05 TPI                      PIC  9(001) VALUE 0.
           05 TPC                      PIC  9(002) VALUE 0.
           05 CWMENU-ENV               PIC  X(011) VALUE SPACES.
              88 CWMENU-OLD                        VALUE "OLD".
           05 REVISAO                  PIC  9(002)V99 VALUE 0.
           05 ADM                      PIC  X(001) VALUE SPACE.
           05 FLAG-OPCOES              PIC  X(001) VALUE SPACE.
           05 OPCOES-VALIDAS           PIC  9(004) VALUE 0.
           05 ULTIMA-PAGINA            PIC  9(004) VALUE 9999.
           05 TESTE-CWLINE             PIC  X(001) VALUE "N".
           05 WS-OPCOES                 VALUE SPACES.
              10 WS-OPCAO OCCURS 26.
                 15 WS-NM-OPCAO        PIC  X(034).
                 15 WS-OPCAO-CHAR      PIC  X(001).
           05 LINHA-COMANDO.
              10 BYTE-L OCCURS 200     PIC  X(001).
           05 MAIOR                    PIC  9(002) VALUE 0.
           05 TAMANHO                  PIC  9(002) VALUE 0.
           05 TAMANHO2                 PIC  9(002) VALUE 0.
           05 WS-TAMANHO-OPCAO         PIC  9(002) OCCURS 26.
           05 NOME-C                   PIC  X(030) VALUE SPACES.
           05 WS-POSITION              PIC  9(004) VALUE 0.
           05 SENHA-C                  PIC  X(030) VALUE SPACES.
           05 I-NOME                   PIC  9(002) VALUE 0.
           05 I-SENHA                  PIC  9(002) VALUE 0.
           05 SET-SENHA                PIC  9(001) VALUE 0.
           05 SET-NOME                 PIC  9(001) VALUE 0.
           05 LINES-CWBOXS             PIC  9(002) VALUE 0.
           05 COLUMNS-CWBOXS           PIC  9(002) VALUE 0.
           05 TESTE-CWBOXS.
              10 BYTE-CWBOXS           PIC  X(001) OCCURS 34.
           05 ARROW                    PIC  X(001) VALUE SPACE.
           05 ARROW2                   PIC  X(001) VALUE SPACE.
           05 CHAVE-ATIVACAO           PIC  9(006) VALUE 0.
           05 OP-POP                   PIC  9(002) VALUE 0.
           05 N-POP                    PIC  9(002) VALUE 0.
           05 POPCOR.
              10 CORR-POP OCCURS 26    PIC  9(002).
           05 M-O                      PIC  9(001) VALUE 1.
           05 VEZ-CWCONF               PIC  9(001) VALUE 1.
           05 VALIDADE-ATIVA           PIC  9(008) VALUE 0.
           05 ESTE-LOGIN.
              10 VALIDADE              PIC  9(008) VALUE 0.
              10 LOGIN-HORA            PIC  9(006) VALUE 0.
           05 ULTIMO-LOGIN.
              10 ULTIMO-LOGIN-DATA     PIC  9(008) VALUE 0.
              10 ULTIMO-LOGIN-HORA     PIC  9(006) VALUE 0.
           05 TOLERANCIA.
              10 TOLERANCIA-DATA       PIC  9(008) VALUE 0.
              10 TOLERANCIA-HORA.
                 15 TOLERANCIA-HH      PIC  9(002) VALUE 0.
                 15 TOLERANCIA-MM      PIC  9(002) VALUE 0.
                 15 TOLERANCIA-SS      PIC  9(002) VALUE 0.
           05 VALIDADE2                PIC  9(008) VALUE 0.
           05 REDEFINES VALIDADE2.
              10 VALIDADE2-AA          PIC  9(004).
              10 VALIDADE2-MM          PIC  9(002).
              10 VALIDADE2-DD          PIC  9(002).
           05 EJECT-MODE-OLD           PIC  X(002) VALUE SPACES.
           05 SENHA-ESPECIAL           PIC  X(001) VALUE SPACE.
           05 TP                       PIC  X(001) VALUE SPACE.
           05 IP                       PIC  9(002) VALUE 0.
           05 YP                       PIC  9(002) VALUE 0.
           05 F54                      PIC  9(002) VALUE 0.
           05 HELP-PATH.
              10 FILLER                PIC  X(001) VALUE SPACES.
              10 HELP-PATH-99          PIC  X(099) VALUE SPACES.
      *    05 SIZE-SCREEN              PIC  9(004) VALUE 2000.
           05 ATTRIBUTE-A7             PIC  9(002) COMP-X VALUE 00.
           05 FUNCTION-A7              PIC  9(002) COMP-X VALUE 00.
           05 PARAMETER-A7             PIC  9(002) COMP-X VALUE 00.
           05 CURSOR-POSITION.
              10                       PIC  9(004) COMP-X VALUE 00.
              10                       PIC  9(004) COMP-X VALUE 00.
           05 TESTECHAR                PIC  X(001) VALUE SPACE.
           05 PRINTER-NO               PIC  9(002) COMP-X VALUE 0.
           05 PRINTER-STATUS           PIC  9(002) COMP-X VALUE 0.
           05 PE                       PIC  9(003)        VALUE 0.
           05 OP                       PIC  Z(002)        VALUE 0.
           05 CX                       PIC  9(002) COMP-X VALUE 0.
           05 LX                       PIC  9(002) COMP-X VALUE 0.
           05 VEZ                      PIC  9(001)        VALUE 0.
           05 VEZ-LOAD                 PIC  9(001)        VALUE 0.
           05 HHMMSSDD.
              10 FILLER                PIC X(004).
              10 SS                    PIC 9(002).
              10 DD                    PIC 9(002).
           05 SALVA-CHAVE              PIC  X(032) VALUE SPACES.
           05 SALVA-PAGINA             PIC  9(004) VALUE ZERO.
           05 PAGINAX                  PIC  9(004) VALUE ZERO.
           05 TESTE-OPCAO              PIC  9(003) VALUE ZERO.
           05 SPOOL                    PIC  X(006) VALUE "CWMEN9".
           05 SAVE-TASK                PIC  9(006) VALUE ZERO.
           05 I                        PIC  9(003) VALUE ZERO.
           05 II                       PIC  9(003) VALUE ZERO.
           05 I2                       PIC  9(003) VALUE ZERO.
           05 Y                        PIC  9(003) VALUE ZERO.
           05 yy                       PIC  9(003) VALUE ZERO.
           05 K                        PIC  9(003) VALUE ZERO.
           05 Y2                       PIC  9(003) VALUE ZERO.
           05 QUADRO-L                 PIC  9(001) VALUE ZERO.
           05 QUADRO-U                 PIC  9(001) VALUE ZERO.
           05 FL-EXIT                  PIC  9(001) VALUE ZERO.
              88 FINALIZAR                         VALUE 1.
           05 TABELA-CORES.
              10 COR PIC X(001) OCCURS 256.
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
           05 PROG2                    PIC  X(014) VALUE SPACES.
           05 HORIZONTAL               PIC  X(078) VALUE SPACES.
           05 TE                       PIC  9(002) VALUE ZERO.
           05 TESTE-ESPACO                         VALUE ZEROS.
              10 TEVE-ESPACO OCCURS 3  PIC  9(001).
           05 RODAPE                   PIC  X(068) VALUE SPACES.
           05 RODAPE-2                 PIC  X(068) VALUE SPACES.
           05 RODAPE-MOUSE             PIC  X(069) VALUE SPACES.
           05 SALTO                    PIC  X(001) VALUE X"0C".
           05 CHECK-PASS               PIC  X(006) VALUE SPACES.
           05 CHECK-PASS-3                         VALUE SPACES.
              10 SENHA-X3 OCCURS 6 PIC 9(2) COMP-X.
           05 U                        PIC  9(003) VALUE ZERO.
           05 SENHA-AUTO                           VALUE SPACES.
              10 SENHA-X  OCCURS 30    PIC 9(2) COMP-X.
           05 CHECK-NOME               PIC  X(001) VALUE "N".
              88 NOME-OK                           VALUE "S".
           05 RESPOSTA                 PIC  X(001) VALUE "S".
              88 EXECUTAR                          VALUE "S" "s".
           05 LABEL-WORK.
              10 BYTE-LW      OCCURS 8 PIC X(001).
           05 ER-PRNTER.
              10 FS-PRNTER             PIC  X(002) VALUE "00".
              10 LB-PRNTER                         VALUE "PRN".
                 15 IMPR               PIC  X(008).
                 15 FILLER             PIC  X(247).
           05 LB-PRNTER-2              PIC  X(255).
           05 MSG-E PIC X(30) VALUE "Sistema inoperante".
           05 IGNORA                   PIC  X(065) VALUE "Ignora...".
           05 CWPAGE-TXT               PIC  X(034) VALUE SPACES.
           05 FCW                      PIC  X(100) VALUE SPACES.
           05 FUNCAO-PROGRAMA          PIC  X(034) VALUE
              "Menu geral".
           05 FUNCAO-NOVA              PIC  X(034) VALUE SPACES.
           05 MENU-GERAL               PIC  X(034) VALUE "Menu geral".
           05 FS-CWLOGF                PIC  X(002) VALUE "73".
           05 OLD-LOGNAME              PIC  X(255) VALUE "GR9999.LOG".
           05 USUARIO                  PIC  X(030) VALUE SPACES.
           05 SISTEMA                  PIC  X(030) VALUE SPACES.
           05 USUARIO-P                PIC  X(030) VALUE SPACES.
           05 SISTEMA-P                PIC  X(030) VALUE SPACES.
           05 DATA-DE-HOJE             PIC  X(010) VALUE SPACES.
           05 HORA                     PIC  X(008) VALUE SPACES.
           05 OC                       PIC  9(003) VALUE ZERO.
           05 OCx                      PIC  9(003) VALUE ZERO.
           05 SET-LOG                  PIC  X(001) VALUE SPACE.
           05 OPCAO                    PIC  9(002) VALUE ZERO.
           05 CORRESPONDENCIAS.
              10 CORRESP OCCURS 16 PIC 99.
           05 MAPA-MOUSE.
              10 PIC X(36) VALUE "080309031003110312031303140315031603".
              10 PIC X(36) VALUE "170318031903200308410941104111411241".
              10 PIC X(32) VALUE "13411441154116411741184119412041".
           05 REDEFINES MAPA-MOUSE.
              10 LC-MOUSE OCCURS 26.
                 15 LIN-MOUSE PIC 99.
                 15 COL-MOUSE PIC 99.
           05 OLD-DRIVE      PIC X(001) VALUE SPACE.
           05 OLD-DIRECTORY  PIC X(255) VALUE SPACES.
           05 SIZE-OLD-DIR   PIC 9(002) COMP-X VALUE 255.
           05 NEW-DRIVE      PIC X(001) VALUE SPACE.
           05 NEW-DIRECTORY  PIC X(255) VALUE SPACES.
           05 YEAR-2000      PIC 9(001) VALUE ZERO.
           05 TECLA          PIC 9(003) VALUE ZERO. COPY CWKEYS.
           05 SUBS.
              06 SUBS-X OCCURS 26.
                 10 SUBPROG     PIC X(008).
                 10 SUBREL      PIC X(007).
                 10 SUBPAGINA   PIC X(020).
                 10 SUBOC       PIC 9(002).
           05 CBL-READ-WRITE-SCR-CHARS-ATTR.
              10 SCREEN-POSITION.
                 15 ROW-NUMBER        PIC  9(002) COMP-X VALUE 0.
                 15 COLUMN-NUMBER     PIC  9(002) COMP-X VALUE 0.
              10 CARACTER-BUFFER      PIC X(2000) VALUE SPACES.
              10 ATTRIBUTE-BUFFER     PIC X(2000) VALUE SPACES.
              10 STRING-LENGTH        PIC  9(004) COMP-X VALUE 2000.
              10 STRING-START         PIC  9(004) COMP-X VALUE 1.
           05 SUB-CWCONF.
              10 SM-ATT               PIC  9(004) OCCURS 7.
           05 SUB-CWCONF-2            PIC  X(028) VALUE SPACES.
           05 SM-FIL                  PIC  9(001) VALUE 0.
           05 ERRO-DRIVE     PIC X(020) VALUE "Drive X: n�o existe".
           05 ERRO-DIRECTORY PIC X(070) VALUE "Pasta inacess�vel:".
           05 TIPOS-MENU.
              10 PIC X(14) VALUE "me~Nu cl�ssico".
              10 PIC X(14) VALUE "me~Nu pop-up".
              10 PIC X(14) VALUE "me~Nu button".
              10 PIC X(14) VALUE "me~Nu list".
              10 PIC X(14) VALUE "me~Nu cl�ssico".
           05 REDEFINES TIPOS-MENU.
              10 TIPO-MENU OCCURS 5 PIC X(14).
           05 OPCAO-2                  PIC  9(002) VALUE ZERO.
              88 MUDA-NADA       VALUE 00.
              88 MUDA-COR        VALUE 02.
              88 MUDA-EMPRESA    VALUE 03.
              88 MUDA-POPUP      VALUE 08.
              88 MUDA-MOLDURA    VALUE 09.
              88 MUDA-SENHA      VALUE 13.
              88 MUDA-SISTEMA    VALUE 14.
              88 MUDA-ROTINAS    VALUE 15.
           05 OVERLAYS.
              10 PIC X(024) VALUE "CWMEN15~Arquivos ".
              10 PIC X(024) VALUE "CWMENH3~Cores ".
              10 PIC X(024) VALUE "      6~Empresa ".
              10 PIC X(024) VALUE "CWMENA5~Grupos ".
              10 PIC X(024) VALUE "CWMENB4~Impressoras".
              10 PIC X(024) VALUE "CWMENG@lo~W-level".
              10 PIC X(024) VALUE "CWMEN5@~me~Nsagens ".
              10 PIC X(024) VALUE "      1~Menu ".
              10 PIC X(024) VALUE "      1mol~Dura ".
              10 PIC X(024) VALUE "CWMEN66~Programas ".
              10 PIC X(024) VALUE "CWMENI6~Relator".
              10 PIC X(024) VALUE "CWMEN73re~Lat�rios ".
              10 PIC X(024) VALUE "      0~Senha".
              10 PIC X(024) VALUE "      6sis~Tema ".
              10 PIC X(024) VALUE "CWMEN2@su~Brotinas ".
              10 PIC X(024) VALUE "CWMEN36sup~Orte ".
              10 PIC X(024) VALUE "CWMEN81~Usu�rios ".
           05 REDEFINES OVERLAYS.
              10 OVERLAY-15 OCCURS 17.
                 15 OVERLAY PIC X(006).
                 15 NIVEL   PIC X(001).
                 15 TIPO-CF PIC X(017).
           05 OVERLAYS2.
              10 PIC X(017) VALUE "Arquivos ".
              10 PIC X(017) VALUE "Cores ".
              10 PIC X(017) VALUE "Empresa ".
              10 PIC X(017) VALUE "Grupos ".
              10 PIC X(017) VALUE "Impressoras".
              10 PIC X(017) VALUE "Low-level".
              10 PIC X(017) VALUE "Mensagens ".
              10 PIC X(017) VALUE "Menu ".
              10 PIC X(017) VALUE "Moldura ".
              10 PIC X(017) VALUE "Programas ".
              10 PIC X(017) VALUE "Relator".
              10 PIC X(017) VALUE "Relat�rios ".
              10 PIC X(017) VALUE "Senha ".
              10 PIC X(017) VALUE "Sistema ".
              10 PIC X(017) VALUE "Subrotinas ".
              10 PIC X(017) VALUE "Suporte ".
              10 PIC X(017) VALUE "Usu�rios ".
           05 REDEFINES OVERLAYS2.
              10 OVERLAY-15-2 OCCURS 17.
                 15 TIPO-CF2 PIC X(017).
           05 CW VALUE " BNANKv`qd ".
              10 PIC X.
              10 CK OCCURS 9 PIC 9(2) COMP-5.
              10 PIC X.
           05 REDEFINES CW.
              10 CWs-1              PIC X(001).
              10 CWs-2              PIC X(005).
              10 CWs-3              PIC X(004).
              10 CWs-4              PIC X(001).
           05 CONTROL-COLORS            PIC X(44) VALUE
              "BACKGROUND-COLOR 4,FOREGROUND-COLOR 6, HIGH".
           05 F9-DATA.
              10 F9-TEXTO   PIC X(30) VALUE SPACES.
              10 F9-PROGRAM PIC X(08) VALUE SPACES.
           05 XSDRUN                   PIC  X(007) VALUE SPACES.
           05 CWMENU.
              10 CWMENU-END            PIC  X(008) VALUE SPACES.
              10 CWMENU-AREA01 POINTER.
              10 CWMENU-AREA02 POINTER.
              10 CWMENU-AREA03 POINTER.
              10 CWMENU-AREA04 POINTER.
              10 CWMENU-AREA05 POINTER.
              10 CWMENU-AREA06 POINTER.
              10 CWMENU-AREA07 POINTER.
              10 CWMENU-AREA08 POINTER.
              10 CWMENU-AREA09 POINTER.
              10 CWMENU-AREA10 POINTER.

       01  AREAS-DE-TRABALHO-2.
           05 MSG-1 PIC X(12) VALUE "Configura��o".
           05 MSG-2 PIC X(09) VALUE "Usu�rio: ".
           05 MSG-3 PIC X(70) VALUE "[esc]-Sa�da".
           05 MSG-4 PIC X(18) VALUE "Impress�o em spool".
           05 MSG-5 PIC X(11) VALUE "Relat�rios:".
           05 ERRO-CWCONF    PIC X(030) VALUE "Sistema n�o configurado".
           05 M1                       PIC  X(070) VALUE
           "Op��o     PgUp  PgDn  F1-Help  F3-Config  F5-Spool         E
      -        "sc-Sa�da ".
           05 M1-OFF                   PIC  X(070) VALUE
           "Op��o     PgUp  PgDn  F1-Help  F3-Config                   E
      -        "sc-Sa�da ".
           05 M2                       PIC  X(070) VALUE
           "Op��o     PgUp  PgDn  F1-Menu                              E
      -        "sc-Sa�da ".

       01  AREAS-DE-TRABALHO-3.
           05 M1-MOUSE                 PIC  X(070) VALUE
           "         ������������fffffffffhhhhhhhhhhhjjjjjjjjjj      nee
      -        "eeeeeeeee ".
           05 M1-MOUSE-OFF             PIC  X(070) VALUE
           "         ������������fffffffffhhhhhhhhhhh                 ee
      -        "eeeeeeeee ".
           05 M2-MOUSE                 PIC  X(070) VALUE
           "         ������������fffffffff                            ee
      -        "eeeeeeeee ".

       LINKAGE SECTION.

       01  NOME                     PIC  X(030).
       01  CHECK-NIVEL              PIC  9(001).
       01  TASK                     PIC  9(006).
       01  GRUPO                    PIC  X(022).
       01  PROGRAMA                 PIC  X(008).
       01  REDEFINES PROGRAMA.
           05 PK-X OCCURS 8 COMP-X  PIC  9(002).
       01  PAGINA                   PIC  9(004).
       01  MODO-MENU                PIC  9(001).
           88 CLASSICO-ON                       VALUE 0.
           88 POPUP-ON                          VALUE 1 2.
           88 BUTTON-ON                         VALUE 2.
           88 LIST                              VALUE 3.
       01  CFG                      PIC  9(002).
       01  MAPA.
           05 SAVE-CWLINE-OPTION    PIC  9(003).
           05 LOGON-TYPE            PIC  9(001).
           05 NIVEL-ATUAL           PIC  9(001).
           05 SUB-CHAR              PIC X(2000).
           05 SUB-ATTR              PIC X(2000).
           05 SUB-MENUS OCCURS 5.
              10 SUB-PAGINA         PIC  X(020).
              10 SUB-OPTION         PIC  9(002).
              10 SUB-POSITION       PIC  9(004).
              10 SUB-CHAR-S         PIC X(2000).
              10 SUB-ATTR-S         PIC X(2000).
           05 HELP                  PIC  9(001).
           05 SENHA                 PIC  X(030).
           05 CHECK-SENHA           PIC  X(001).
              88 SENHA-OK                       VALUE "S".

       01  IMPRESSORA               PIC  X(008).
           88 OLD-IMPRESSORA VALUE
                              "PRN" "PRN." "PRN:" "LPT1" "LPT2" "LPT3"
                              "COM1" "COM2".
       01  QUADRO                   PIC  9(002).

       01  RELATORIO                PIC  X(007).

       01  COMMAREA01               PIC X(2000).
       01  COMMAREA02               PIC X(2000).
       01  COMMAREA03               PIC X(2000).
       01  COMMAREA04               PIC X(2000).
       01  COMMAREA05               PIC X(2000).
       01  COMMAREA06               PIC X(2000).
       01  COMMAREA07               PIC X(2000).
       01  COMMAREA08               PIC X(2000).
       01  COMMAREA09               PIC X(2000).
       01  COMMAREA10               PIC X(2000).

       01  CWRUN                    PIC  X(001).
       01  CWRUN-PROGRAM            PIC  X(050).

       SCREEN SECTION.

       01  CWMENUA.
           04 FOREGROUND-COLOR 7
              BACKGROUND-COLOR 0.
              05 LINE 25 COLUMN 01 PIC X(80) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 01 COLUMN 01 PIC X        FROM M-201.
              05 LINE 01 COLUMN 02 PIC X(078)   FROM HORIZONTAL.
              05 LINE 01 COLUMN 80 PIC X        FROM M-187.
              05 LINE 02 COLUMN 01 PIC X        FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (02)
              BACKGROUND-COLOR CWACOR-B (02).
              05 LINE 02 COLUMN 02 PIC X        FROM SPACE.
              05 TEU LINE 02 COLUMN 03 PIC X(037)   FROM USUARIO.
           04 FOREGROUND-COLOR CWACOR-F (12)
              BACKGROUND-COLOR CWACOR-B (12).
              05 TELA-NOME.
                 10 LINE 02 COLUMN 40 PIC X       FROM SPACE.
                 10 LINE 02 COLUMN 41 PIC X(024)  FROM TTY-NOME.
           04 FOREGROUND-COLOR CWACOR-F (14)
              BACKGROUND-COLOR CWACOR-B (14).
              05 LINE 02 COLUMN 64 PIC X(001)   FROM SPACE.
           04 FOREGROUND-COLOR CWACOR-F (03)
              BACKGROUND-COLOR CWACOR-B (03).
              05 LINE 02 COLUMN 65 PIC X(003)   FROM CWTIME-WEEK-CHAR.
           04 FOREGROUND-COLOR CWACOR-F (15)
              BACKGROUND-COLOR CWACOR-B (15).
              05 LINE 02 COLUMN 68 PIC X        FROM SPACE.
           04 FOREGROUND-COLOR CWACOR-F (04)
              BACKGROUND-COLOR CWACOR-B (04).
              05 LINE 02 COLUMN 69 PIC X(010)   FROM DATA-DE-HOJE.
           04 FOREGROUND-COLOR CWACOR-F (16)
              BACKGROUND-COLOR CWACOR-B (16).
              05 LINE 02 COLUMN 79 PIC X        FROM SPACE.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 02 COLUMN 80 PIC X        FROM M-186.
              05 LINE 03 COLUMN 01 PIC X        FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (05)
              BACKGROUND-COLOR CWACOR-B (05).
              05 LINE 03 COLUMN 02 PIC X         FROM SPACE.
              05 TS LINE 03 COLUMN 03 PIC X(037) FROM SISTEMA.
           04 FOREGROUND-COLOR CWACOR-F (13)
              BACKGROUND-COLOR CWACOR-B (13).
              05 TELA-DIR.
                 10 LINE 03 COLUMN 40 PIC X      FROM SPACE.
                 10 LINE 03 COLUMN 41 PIC X(029) FROM CURDIR.
           04 FOREGROUND-COLOR CWACOR-F (17)
              BACKGROUND-COLOR CWACOR-B (17).
              05 LINE 03 COLUMN 70 PIC X(001)   FROM SPACE.
           04 FOREGROUND-COLOR CWACOR-F (06)
              BACKGROUND-COLOR CWACOR-B (06).
              05 LINE 03 COLUMN 71 PIC X(008)   FROM HORA.
           04 FOREGROUND-COLOR CWACOR-F (18)
              BACKGROUND-COLOR CWACOR-B (18).
              05 LINE 03 COLUMN 79 PIC X        FROM SPACE.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 03 COLUMN 80 PIC X        FROM M-186.
              05 LINE 04 COLUMN 01 PIC X        FROM M-204.
              05 LINE 04 COLUMN 02 PIC X(078)   FROM HORIZONTAL.
              05 LINE 04 COLUMN 80 PIC X        FROM M-185.
              05 LINE 05 COLUMN 01 PIC X        FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (07)
              BACKGROUND-COLOR CWACOR-B (07).
              05 LINE 05 COLUMN 02 PIC X        FROM SPACE.
              05 TFP LINE 05 COLUMN 03 PIC X(037) FROM FUNCAO-PROGRAMA.
           04 FOREGROUND-COLOR CWACOR-F (08)
              BACKGROUND-COLOR CWACOR-B (08).
              05 LINE 05 COLUMN 40 PIC X FROM SPACE.
              05 LINE 05 COLUMN 41 PIC X(028) FROM LB-PRNTER-2.
           04 FOREGROUND-COLOR CWACOR-F (08)
              BACKGROUND-COLOR CWACOR-B (08).
           05 LOGO.
              06 LINE 05 COLUMN 69 FOREGROUND-COLOR LF1
                                   BACKGROUND-COLOR LB7
                                   PIC X(1) FROM CWs-1.
              06 LINE 05 COLUMN 70 BACKGROUND-COLOR LB7
                                   FOREGROUND-COLOR LF1
                                   PIC X(5) FROM CWs-2.
              06 LINE 05 COLUMN 75 BACKGROUND-COLOR LB7
                                   FOREGROUND-COLOR LF4
                                   PIC X(4) FROM CWs-3.
              06 LINE 05 COLUMN 79 FOREGROUND-COLOR LF1
                                   BACKGROUND-COLOR LB7
                                   PIC X(1) FROM CWs-4.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 05 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 06 COLUMN 01 PIC   X      FROM M-204.
              05 LINE 06 COLUMN 02 PIC   X(078) FROM HORIZONTAL.
              05 LINE 06 COLUMN 80 PIC   X      FROM M-185.
              05 LINE 07 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 07 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 07 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 08 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 08 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 08 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 09 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 09 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 09 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 10 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 10 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 10 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 11 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 11 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 11 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 12 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 12 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 12 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 13 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 13 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 13 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 14 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 14 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 14 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 15 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 15 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 15 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 16 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 16 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 16 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 17 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 17 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 17 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 18 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 18 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 18 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 19 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 19 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 19 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 20 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 20 COLUMN 02 PIC X(78) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 20 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 21 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 21 COLUMN 02 PIC X(78) FROM SPACES.
           04 BAIXO FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 21 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 22 COLUMN 01 PIC   X      FROM M-204.
              05 LINE 22 COLUMN 02 PIC   X(078) FROM HORIZONTAL.
              05 LINE 22 COLUMN 80 PIC   X      FROM M-185.
              05 LINE 23 COLUMN 01 PIC   X      FROM M-186.
           04 FOREGROUND-COLOR CWACOR-F (10)
              BACKGROUND-COLOR CWACOR-B (10).
              05 LINE 23 COLUMN 02 PIC X(72) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (19)
              BACKGROUND-COLOR CWACOR-B (19).
              05 LINE 23 COLUMN 72 PIC   X FROM SPACE.
           04 FOREGROUND-COLOR CWACOR-F (11)
              BACKGROUND-COLOR CWACOR-B (11).
              05 TPR LINE 23 COLUMN 73 PIC   X(006) FROM PROGRAMA.
           04 FOREGROUND-COLOR CWACOR-F (20)
              BACKGROUND-COLOR CWACOR-B (20).
              05 LINE 23 COLUMN 79 PIC   X      FROM SPACE.
           04 FOREGROUND-COLOR CWACOR-F (01)
              BACKGROUND-COLOR CWACOR-B (01).
              05 LINE 23 COLUMN 80 PIC   X      FROM M-186.
              05 LINE 24 COLUMN 01 PIC   X      FROM M-200.
              05 LINE 24 COLUMN 02 PIC   X(078) FROM HORIZONTAL.
              05 ES
                 LINE 24 COLUMN 80 PIC   X      FROM M-188.

       01  CWMENUC.
           04 FOREGROUND-COLOR CWACOR-F (10)
              BACKGROUND-COLOR CWACOR-B (10).
              05 MSG-OFF LINE 23 COLUMN 02 PIC X(69) FROM SPACES.
           04 FOREGROUND-COLOR CWACOR-F (09)
              BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 21 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 20 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 19 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 18 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 17 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 16 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 15 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 14 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 13 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 12 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 11 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 10 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 09 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 08 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 07 COLUMN 02 PIC X(78) FROM SPACES.

       01  CWMENUB.
      *    04 FOREGROUND-COLOR CWACOR-F (09)
      *       BACKGROUND-COLOR CWACOR-B (09).
           05 LINE 07 COLUMN 02 PIC X(78) FROM SPACES.
           05 LINE 08 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (01).
           05 LINE 08 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (01).
           05 LINE 08 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (14).
           05 LINE 08 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (14).
           05 LINE 09 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (02).
           05 LINE 09 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (02).
           05 LINE 09 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (15).
           05 LINE 09 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (15).
           05 LINE 10 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (03).
           05 LINE 10 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (03).
           05 LINE 10 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (16).
           05 LINE 10 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (16).
           05 LINE 11 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (04).
           05 LINE 11 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (04).
           05 LINE 11 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (17).
           05 LINE 11 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (17).
           05 LINE 12 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (05).
           05 LINE 12 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (05).
           05 LINE 12 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (18).
           05 LINE 12 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (18).
           05 LINE 13 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (06).
           05 LINE 13 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (06).
           05 LINE 13 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (19).
           05 LINE 13 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (19).
           05 LINE 14 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (07).
           05 LINE 14 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (07).
           05 LINE 14 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (20).
           05 LINE 14 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (20).
           05 LINE 15 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (08).
           05 LINE 15 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (08).
           05 LINE 15 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (21).
           05 LINE 15 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (21).
           05 LINE 16 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (09).
           05 LINE 16 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (09).
           05 LINE 16 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (22).
           05 LINE 16 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (22).
           05 LINE 17 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (10).
           05 LINE 17 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (10).
           05 LINE 17 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (23).
           05 LINE 17 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (23).
           05 LINE 18 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (11).
           05 LINE 18 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (11).
           05 LINE 18 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (24).
           05 LINE 18 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (24).
           05 LINE 19 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (12).
           05 LINE 19 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (12).
           05 LINE 19 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (25).
           05 LINE 19 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (25).
           05 LINE 20 COLUMN 03 PIC ZZ     FROM CWCONF-NO-OPCAO (13).
           05 LINE 20 COLUMN 06 PIC X(034) FROM WS-NM-OPCAO (13).
           05 LINE 20 COLUMN 41 PIC ZZ     FROM CWCONF-NO-OPCAO (26).
           05 LINE 20 COLUMN 44 PIC X(034) FROM WS-NM-OPCAO (26).

       01  CWMENUM.
           04 FOREGROUND-COLOR CWACOR-F (10)
              BACKGROUND-COLOR CWACOR-B (10).
              05 LINE footline COLUMN 02 PIC X(69) FROM SPACES.

       01  CWMENUD.
           04 FOREGROUND-COLOR CWACOR-F (10)
              BACKGROUND-COLOR CWACOR-B (10).
              05 LINE footline COLUMN 03 PIC X(69) FROM RODAPE.

       01  CWMENUD-2.
           04 FOREGROUND-COLOR CWACOR-F (10)
              BACKGROUND-COLOR CWACOR-B (10).
              05 LINE footline COLUMN 03 PIC X(69) FROM RODAPE-2.

       01  CWMENUE.
           04 FOREGROUND-COLOR CWACOR-F (10)
              BACKGROUND-COLOR CWACOR-B (10).
              05 LINE footline COLUMN 09 PIC ZZ TO OPCAO.

       01  CWMENUEA1.
           04 FOREGROUND-COLOR CWACOR-F (10)
              BACKGROUND-COLOR CWACOR-B (10).
              05 LINE footline COLUMN 09 PIC  Z TO OPCAO AUTO.

       01  CWMENUEA2.
           04 FOREGROUND-COLOR CWACOR-F (10)
              BACKGROUND-COLOR CWACOR-B (10).
              05 LINE footline COLUMN 09 PIC ZZ TO OPCAO AUTO.

       01  CWMENUF.
           04 FOREGROUND-COLOR CWACOR-F (07)
              BACKGROUND-COLOR CWACOR-B (07).
              05 LINE 05 COLUMN 03 PIC X(037) FROM FUNCAO-PROGRAMA.
           04 FOREGROUND-COLOR CWACOR-F (08)
              BACKGROUND-COLOR CWACOR-B (08).
              05 LINE 05 COLUMN 40 VALUE " ".
              05 LINE 05 COLUMN 41 PIC X(028) FROM LB-PRNTER-2.

       01  CWMENUX.
      *    04 FOREGROUND-COLOR CWACOR-F (09)
      *       BACKGROUND-COLOR CWACOR-B (09).
              05 LINE 08 COLUMN 02 PIC X(78) FROM SPACES.
              05 LINE 10 COLUMN 02 PIC X(78) FROM SPACES.
      *    04 FOREGROUND-COLOR CWACOR-F (10)
      *       BACKGROUND-COLOR CWACOR-B (10).
              05 LINE footline COLUMN 02 PIC X(69) FROM SPACES.

       01  TELA-TPI.
           04 FOREGROUND-COLOR CWACOR-F (11)
              BACKGROUND-COLOR CWACOR-B (11).
           05 LINE 23 COLUMN TPC PIC X FROM TESTECHAR.

       01  TELA-TPC.
           04 FOREGROUND-COLOR CWACOR-F (19)
              BACKGROUND-COLOR CWACOR-B (19).
           05 LINE 23 COLUMN TPC PIC X FROM SPACE.

       01  TELA-TPC2.
           04 FOREGROUND-COLOR CWACOR-F (10)
              BACKGROUND-COLOR CWACOR-B (10).
           05 LINE 23 COLUMN TPC PIC X FROM SPACE.

      *01  TELA-NOME2 REVERSE-VIDEO.
       01  TELA-NOME2 BACKGROUND-COLOR 7 FOREGROUND-COLOR 1.
           05 LINE 13 COLUMN 32 PIC X(30) USING NOME.
           05 LINE 15 COLUMN 32 PIC X(30) FROM SPACES.

       01  WINDOWS BACKGROUND-COLOR 7 FOREGROUND-COLOR 0 HIGH.
           05 LINE 01 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 02 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 03 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 04 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 05 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 06 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 07 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 08 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 09 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 10 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 11 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 12 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 13 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 14 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 15 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 16 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 17 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 18 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 19 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 20 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 21 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 22 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 23 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 24 COLUMN 01 PIC X(80) FROM SPACES.
           05 LINE 25 COLUMN 01 PIC X(80) FROM SPACES.

       PROCEDURE DIVISION USING NOME     CHECK-NIVEL TASK GRUPO MAPA
                                PROGRAMA PAGINA      MODO-MENU  CFG
                                IMPRESSORA QUADRO    RELATORIO
                                COMMAREA01
                                COMMAREA02
                                COMMAREA03
                                COMMAREA04
                                COMMAREA05
                                COMMAREA06
                                COMMAREA07
                                COMMAREA08
                                COMMAREA09
                                COMMAREA10
                                CWRUN CWRUN-PROGRAM.

       ENTRY1.

           DISPLAY "CWCRON" UPON ENVIRONMENT-NAME
           ACCEPT  CRON   FROM ENVIRONMENT-VALUE
           INSPECT CRON
                CONVERTING MINUSCULAS TO MAIUSCULAS
           DISPLAY "CWFRAMEPGM"  UPON ENVIRONMENT-NAME
           ACCEPT   CWFRAME      FROM ENVIRONMENT-VALUE
           DISPLAY "CWFOOTLINE"  UPON ENVIRONMENT-NAME
           IF CWFRAME NOT = SPACES
              MOVE '@' TO NIVEL(9)
              PERFORM AJUSTA
              IF  NUMERO NOT = 0
                  MOVE NUMERO TO footline
              END-IF
              DISPLAY footline-t UPON ENVIRONMENT-VALUE
           ELSE
              DISPLAY '23'       UPON ENVIRONMENT-VALUE
           END-IF
Joadir     DISPLAY "CWMENUPAGE"  UPON ENVIRONMENT-NAME
Joadir     ACCEPT   CWMENUPAGE   FROM ENVIRONMENT-VALUE
Joadir     INSPECT  CWMENUPAGE CONVERTING MINUSCULAS TO MAIUSCULAS
           DISPLAY "CWBORDER" UPON ENVIRONMENT-NAME
           ACCEPT CWBORDER    FROM ENVIRONMENT-VALUE
           IF     CWBORDER    NUMERIC
                  MOVE '@' TO NIVEL (9)
           END-IF
           CALL "CWSQLC" USING "X4"
           DISPLAY "CWAUTOSPOOL" UPON ENVIRONMENT-NAME
           ACCEPT CWAUTOSPOOL FROM ENVIRONMENT-VALUE
           IF  CWAUTOSPOOL = 'ON' OR 'On' OR 'oN' OR 'on'
               CALL "CWSQLC" USING "S"
           ELSE
               CALL "CWSQLC" USING "P"
           END-IF
           DISPLAY "CWINISHOW" UPON ENVIRONMENT-NAME
           ACCEPT INISHOW FROM ENVIRONMENT-VALUE
           INSPECT INISHOW
                   CONVERTING MINUSCULAS TO MAIUSCULAS
           DISPLAY "CWLEGACYMENU" UPON ENVIRONMENT-NAME
           ACCEPT CWLEGACYMENU  FROM ENVIRONMENT-VALUE
           INSPECT CWLEGACYMENU CONVERTING MINUSCULAS TO MAIUSCULAS
           DISPLAY "CWUSERNAME" UPON ENVIRONMENT-NAME
           ACCEPT NOME-C        FROM ENVIRONMENT-VALUE
           DISPLAY SPACES       UPON ENVIRONMENT-VALUE
           DISPLAY "CWPASSWORD" UPON ENVIRONMENT-NAME
           ACCEPT SENHA-C       FROM ENVIRONMENT-VALUE
           DISPLAY SPACES       UPON ENVIRONMENT-VALUE
           DISPLAY "CWGROUP"  UPON ENVIRONMENT-NAME
           ACCEPT CWSAVE    FROM ENVIRONMENT-VALUE
           INSPECT CWSAVE   CONVERTING MINUSCULAS TO MAIUSCULAS
           IF CWSAVE = 'OLD'
             MOVE 'CWMENZ' TO OVERLAY(4)
           END-IF
           MOVE SPACES TO CWSAVE
           DISPLAY "CWMENUECHOPGM"  UPON ENVIRONMENT-NAME
           ACCEPT ECHOPGM  FROM ENVIRONMENT-VALUE
           INSPECT ECHOPGM  CONVERTING MINUSCULAS TO MAIUSCULAS
           DISPLAY "CWCOLORBARR"  UPON ENVIRONMENT-NAME
           PERFORM AJUSTA
           IF  NUMERO NOT = 0
               MOVE NUMERO TO CWCOLORBARR
           END-IF
           DISPLAY "CWLOGP"     UPON ENVIRONMENT-NAME
           ACCEPT CWLOGP        FROM ENVIRONMENT-VALUE
           DISPLAY "CWNOFRAME" UPON ENVIRONMENT-NAME
           ACCEPT CWSAVE    FROM ENVIRONMENT-VALUE
           INSPECT CWSAVE   CONVERTING MINUSCULAS TO MAIUSCULAS
           IF  CWSAVE = "ON"
               MOVE SPACES TO CWSAVE
               MOVE 1      TO NOFRAME
           END-IF
           IF  CRON = 'ON'
               MOVE 1      TO NOFRAME
           END-IF
           DISPLAY "CWSAVE" UPON ENVIRONMENT-NAME
           ACCEPT CWSAVE    FROM ENVIRONMENT-VALUE
           IF   CWSAVE = "ON"
                EXEC COBOLware SAVE (Close-All) END-EXEC
                CANCEL "CWSAVE"
           END-IF
           DISPLAY "OFF"  UPON ENVIRONMENT-VALUE
SC    *    CALL "CWGETL" USING PARAMETROS-CWGETL
           MOVE SPACES TO F9-DATA
           IF   VEZ-LOAD = 1
                GO TO 000-INICIO
           ELSE
                MOVE 1 TO VEZ-LOAD
                DISPLAY "CWPAGE" UPON ENVIRONMENT-NAME
                ACCEPT   CWPAGE-TXT  FROM ENVIRONMENT-VALUE
                IF   CWPAGE-TXT NOT = SPACES
                     MOVE CWPAGE-TXT TO MENU-GERAL FUNCAO-PROGRAMA
                END-IF
           END-IF

           EXEC COBOLware OBJECT (DROP) END-EXEC
           CALL "CBL_CULL_RUN_UNITS"
                ON EXCEPTION
                   CONTINUE
           END-CALL
txt   *    CALL "CWTEXT" USING AREAS-DE-TRABALHO-2
txt   *              LENGTH OF AREAS-DE-TRABALHO-2
           DISPLAY "CWLOGO" UPON ENVIRONMENT-NAME
           ACCEPT   CWLOGO  FROM ENVIRONMENT-VALUE
           INSPECT  CWLOGO  CONVERTING MINUSCULAS TO MAIUSCULAS
           IF  (CWLOGO NOT = SPACES)
           AND (CWLOGO NOT = "OFF")
                ACCEPT CWLOGO FROM ENVIRONMENT-VALUE
           END-IF
           CALL "CWUNIX" USING PARAMETROS-CWUNIX
           IF   CWUNIX-ON
                MOVE ">"   TO MORE
           ELSE
                MOVE X"10" TO MORE
           END-IF
           DISPLAY "CWFONE" UPON ENVIRONMENT-NAME
           ACCEPT   CWFONE  FROM ENVIRONMENT-VALUE

      *    IF   CWGETL-HIGH = 1
      *         PERFORM VARYING I FROM 1 BY 1 UNTIL I > 16
      *                 MOVE TIPO-CF2 (I) TO TIPO-CF (I)
      *         END-PERFORM
      *    END-IF

           IF   CWLOGO = "OFF"
                MOVE SPACES TO CW
           ELSE
                IF   CWLOGO = SPACES
                     PERFORM VARYING COL-W FROM 1 BY 1 UNTIL COL-W > 9
                              ADD 1 TO CK (COL-W)
                     END-PERFORM
                ELSE
                     MOVE CWLOGO TO CW
                END-IF
           END-IF

           ACCEPT  LINHA-COMANDO FROM COMMAND-LINE
           DISPLAY LINHA-COMANDO UPON COMMAND-LINE
           IF   LINHA-COMANDO NOT = SPACES
      *         PERFORM 102-USERPASS THRU 102-99-FIM
                IF  (NOME-C  NOT = SPACES)
                OR  (SENHA-C NOT = SPACES)
                     MOVE 3 TO LOGON-TYPE
                     DISPLAY SPACES UPON COMMAND-LINE
                END-IF
           END-IF

           CALL "CWMOLD" USING TABELA-CORES TABELA-MOLDURA
           DISPLAY "CWMENU"        UPON ENVIRONMENT-NAME
           ACCEPT  CWMENU-ENV      FROM ENVIRONMENT-VALUE
           IF   CWUNIX-ON
                DISPLAY "TTY"      UPON ENVIRONMENT-NAME
                ACCEPT  TTY        FROM ENVIRONMENT-VALUE
                IF TTY EQUAL SPACES
                   DISPLAY "SSH_TTY" UPON ENVIRONMENT-NAME
                   ACCEPT  TTY       FROM ENVIRONMENT-VALUE
                END-IF
                IF   TTY (1: 5) = "/dev/"
                     MOVE TTY (6: ) TO TTY-NOME
                     MOVE TTY-NOME  TO TTY
                END-IF
           END-IF
           PERFORM 250-AJUSTA-TTY-NOME THRU 250-99-FIM
           INSPECT CWMENU-ENV CONVERTING MINUSCULAS TO MAIUSCULAS
           MOVE SAVE-CWLINE-OPTION   TO CWLINE-OPTION
legacy*    MOVE ALL X"B0"            TO M1 (7: 2)
legacy*                                 M2 (7: 2)
legacy*                                 M1-OFF (7: 2)
           SET CWBOXS-TIMEOUT-ENABLE TO TRUE
           SET CWBOXC-TIMEOUT-ENABLE TO TRUE
           SET CWLINE-TIMEOUT-ENABLE TO TRUE
           SET CWSEND-TIMEOUT-ENABLE TO TRUE.

       000-INICIO.

           SET CWSQLC-UPDATE TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO

           MOVE "LG" TO CWCONF-REG
           SET CWSQLC-READ TO TRUE
           SET CWSQLC-EQUAL TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           IF  FS-CWCONF = "00"
               IF   CWCONF-EXPIRE NOT NUMERIC
                    MOVE 0 TO CWCONF-EXPIRE
               END-IF
               MOVE CWCONF-EXPIRE TO EXPIRE
           ELSE
               MOVE 0             TO EXPIRE
           END-IF

           IF   PROGRAMA = "CWMEN8"
                MOVE "PS"              TO CWCONF-REG
                MOVE NOME              TO CWCONF-NOME
                SET CWSQLC-READ        TO TRUE
                SET CWSQLC-EQUAL       TO TRUE
                SET CWSQLC-IGNORE-LOCK TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                IF   FS-CWCONF < "10"
                     IF   CWCONF-PRINTER-DEFAULT = SPACES OR LOW-VALUES
                          MOVE "<Default>" TO CWCONF-PRINTER-DEFAULT
                     END-IF
                     MOVE CWCONF-PRINTER-DEFAULT TO IMPRESSORA
                     PERFORM 170-CHECK-SPOOL THRU 170-99-FIM
                ELSE
                     MOVE "N" TO CHECK-NOME
                END-IF
           END-IF

           PERFORM 800-NEW-PRINTER THRU 800-99-FIM
           PERFORM 251-CURDIR      THRU 251-99-FIM
           PERFORM 166-PERSONAL    THRU 166-99-FIM
           MOVE CWCONF-QUADRO       TO QUADRO-L
           IF   QUADRO = 99
                MOVE QUADRO-L       TO QUADRO
           END-IF
           PERFORM 146-SET-QUADRO

SC         CANCEL "CWGETL"
SC         CALL "CWGETL" USING PARAMETROS-CWGETL
           MOVE CWGETL-END    TO CWMENU-END
           SET  CWMENU-AREA01 TO ADDRESS COMMAREA01
           SET  CWMENU-AREA02 TO ADDRESS COMMAREA02
           SET  CWMENU-AREA03 TO ADDRESS COMMAREA03
           SET  CWMENU-AREA04 TO ADDRESS COMMAREA04
           SET  CWMENU-AREA05 TO ADDRESS COMMAREA05
           SET  CWMENU-AREA06 TO ADDRESS COMMAREA06
           SET  CWMENU-AREA07 TO ADDRESS COMMAREA07
           SET  CWMENU-AREA08 TO ADDRESS COMMAREA08
           SET  CWMENU-AREA09 TO ADDRESS COMMAREA09
           SET  CWMENU-AREA10 TO ADDRESS COMMAREA10
           CALL 'CWSETS' USING X"01" CWMENU
           IF   PROGRAMA = "CWMENU"
                PERFORM 120-TIME
                IF   CWRUN NOT = 1
                     PERFORM 130-GRAVA-CWLOGF  THRU 130-99-FIM
                END-IF
           ELSE
                PERFORM 220-REMOVE-OVERLAYS THRU 220-99-FIM
                MOVE "S" TO CHECK-NOME
                            CHECK-SENHA
                PERFORM 120-TIME
           END-IF.

       050-INICIO.

       100-INICIO.

           IF   FS-CWCONF < "10"
                PERFORM 100-PROCESSAMENTO THRU 100-99-FIM
                        UNTIL FINALIZAR
           ELSE
                DISPLAY ERRO-CWCONF
           END-IF

           MOVE SPACE TO SET-LOG
           CALL "CWGETU" USING NOME TASK PROGRAMA SET-LOG.

       000-FIM.

       100-PROCESSAMENTO.

           IF   CHECK-NOME = "N"
                MOVE SPACES TO LB-PRNTER-2
           END-IF

           IF   CWRUN = 1
                DISPLAY 'CWFROMGUI' UPON ENVIRONMENT-NAME
                ACCEPT  FROMGUI     FROM ENVIRONMENT-VALUE
                IF   FROMGUI = SPACES
                     DISPLAY "CWTEST"      UPON ENVIRONMENT-NAME
                     ACCEPT  LINHA-COMANDO FROM ENVIRONMENT-VALUE
                END-IF
                IF   LINHA-COMANDO = SPACES
                     DISPLAY "CWCMDL" UPON ENVIRONMENT-NAME
                     ACCEPT  LINHA-COMANDO FROM ENVIRONMENT-VALUE
                END-IF
      *         IF LINHA-COMANDO NOT = SPACES
      *            PERFORM 102-USERPASS THRU 102-99-FIM
      *         END-IF
           END-IF

           IF   EXECUTAR
                IF   PROGRAMA NOT = "CWMENU"
                     MOVE "Processamento encerrado" TO FUNCAO-PROGRAMA
                     PERFORM 130-GRAVA-CWLOGF THRU 130-99-FIM
                     MOVE   "CWMENU"                TO PROGRAMA
                     MOVE CWGETL-LOG   TO SET-LOG
                     CALL "CWGETU" USING NOME TASK PROGRAMA SET-LOG
                     IF   HELP = 1
                          MOVE "H E L P" TO FUNCAO-PROGRAMA
                          MOVE  M2       TO RODAPE
                          MOVE  M2-MOUSE TO RODAPE-MOUSE
                     ELSE
                          MOVE MENU-GERAL TO FUNCAO-PROGRAMA
                          PERFORM 10A-RODAPE THRU 10A-99-FIM
                     END-IF
                END-IF
                IF   VEZ = 0
                     MOVE   1         TO VEZ
                     PERFORM 105-GET-COLOR       THRU 105-99-FIM
                     PERFORM 220-REMOVE-OVERLAYS THRU 220-99-FIM
                END-IF
                IF   NOFRAME = 0
                     PERFORM 131-DATE-TIME THRU 131-99-FIM
                     perform exibe-moldura
                END-IF
           END-IF

           DISPLAY "CWLG"       UPON ENVIRONMENT-NAME
           ACCEPT  CWLG         FROM ENVIRONMENT-VALUE
           IF  CWLG = "ON"
               MOVE "N" TO CHECK-NOME
                           CHECK-SENHA
               DISPLAY "OFF" UPON ENVIRONMENT-VALUE
           END-IF
           IF  (NOT NOME-OK)
           OR  (NOT SENHA-OK)
                CALL "CWLOCK" USING "U" NOME TASK
                MOVE 0 TO LOGIN-FLAG
                PERFORM  140-CHECK-NOME THRU 140-99-FIM
                         UNTIL (NOME-OK
                         AND   SENHA-OK)
                         OR    RESPOSTA = "N"
                IF   RESPOSTA = "N"
                     MOVE 1 TO FL-EXIT
                ELSE
                     MOVE CWGETL-LOG  TO SET-LOG
                     CALL "CWGETU" USING NOME TASK PROGRAMA SET-LOG
                     PERFORM 105-GET-COLOR THRU 105-99-FIM
                     IF   NOFRAME = 0
                          PERFORM 131-DATE-TIME THRU 131-99-FIM
                          perform exibe-moldura
                     END-IF
               END-IF
           ELSE
               CALL "CWLOCK" USING "M" NOME TASK PROGRAMA
           END-IF

           IF   CWRUN = 1
                IF   FL-EXIT = 1
                OR  (NOT NOME-OK)
                OR  (NOT SENHA-OK)
                     STOP RUN
                END-IF
                EXEC COBOLware Getsystem
                      USER;NOME
                      GROUP;GRUPO
                END-EXEC
                DISPLAY "CWSARBANE" UPON ENVIRONMENT-NAME
                ACCEPT     SARBANE  FROM ENVIRONMENT-VALUE
                IF   SARBANE NUMERIC
                AND  CHECK-NIVEL = 9
                     EXEC COBOLware Send
                          Message
                   "Privil�gio de super-usu�rio n�o permite executar"
                     END-EXEC
                     STOP RUN
                END-IF
                IF   EXPIRADA = 1
                     EXEC COBOLware Send
                          Message "Senha expirada n�o permite executar"
                     END-EXEC
                     CALL "CWPASS" USING NOME
                     CANCEL "CWPASS"
                     STOP RUN
                END-IF
                INSPECT  CWRUN-PROGRAM
                         CONVERTING MINUSCULAS TO MAIUSCULAS
                MOVE CWRUN-PROGRAM             TO PROGRAMA
      *         MOVE "DESENVOLVIMENTO (CWRUN)" TO NOME
                MOVE SPACES                    TO FUNCAO-PROGRAMA
                IF FROMGUI = SPACES
                   IF CWFRAME = SPACES
                   STRING "Executando " DELIMITED BY SIZE
                        CWRUN-PROGRAM DELIMITED BY SPACE
                        " sem menu" DELIMITED BY SIZE
                        INTO FUNCAO-PROGRAMA
                   END-IF
                ELSE
                   DISPLAY 'CWAPPLICATION' UPON ENVIRONMENT-NAME
                   ACCEPT FUNCAO-PROGRAMA FROM ENVIRONMENT-VALUE
                END-IF
                MOVE CWGETL-LOG  TO SET-LOG
                CALL "CWGETU" USING NOME TASK PROGRAMA SET-LOG
                IF   NOFRAME = 0
                     IF CWFRAME = SPACES
                        DISPLAY TFP
                     ELSE
                        CALL CWFRAME USING 'O' FUNCAO-PROGRAMA
                                               LB-PRNTER-2
                     END-IF
                END-IF
                PERFORM 155-EXIBE-TPR8 THRU 155-99-FIM
                IF   NOFRAME = 0
                     DISPLAY ES
                END-IF
                IF  (GRUPO NOT = SPACES)
                AND (GRUPO NOT = "Acesso sem restri��es")
                AND (GRUPO NOT = "Acesso sem restri��es")
                AND (GRUPO NOT = "Acesso sem restricoes")
                AND (GRUPO NOT = "Acesso irrestrito")
                     SET CWSQLC-UPDATE TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWGRPS-REG
                                         FS-CWGRPS
                                         KGR PGR
                     MOVE "GU"            TO CWGRPS-REG
                     MOVE GRUPO           TO CWGRPS-NOME-GRUPO
                     SET CWSQLC-READ TO TRUE
                     SET CWSQLC-EQUAL TO TRUE
                     SET CWSQLC-IGNORE-LOCK TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWGRPS-REG
                                         FS-CWGRPS
                                         KGR PGR
                     IF   FS-CWGRPS < "09"
                          MOVE CWGRPS-ADM TO ADM
                          MOVE GRUPO      TO CWGRPS-NOME-GRUPO
                          MOVE PROGRAMA   TO CWGRPS-PROG-GRUPO
                          SET CWSQLC-READ TO TRUE
                          SET CWSQLC-EQUAL TO TRUE
                          SET CWSQLC-IGNORE-LOCK TO TRUE
                          CALL "CWCONF" USING CWSQLC
                                              CWGRPS-REG
                                              FS-CWGRPS
                                              KGR PGR
                          IF  (FS-CWGRPS < "09"
                          AND  CWGRPS-ACESSO-GRUPO NOT = SPACE
                          AND  ADM                 NOT = "I")
                          OR  (FS-CWGRPS = "23"
                          AND  ADM                     = "I")
                               MOVE "M�dulo n�o autorizado"
                                 TO CWSEND-MSG
                               CALL "CWSEND" USING PARAMETROS-CWSEND
                               SET CWSQLC-CLOSE TO TRUE
                               CALL "CWCONF" USING CWSQLC
                                                   CWGRPS-REG
                                                   FS-CWGRPS
                                                   KGR PGR
                               STOP RUN
                          END-IF
                     END-IF
                     SET CWSQLC-CLOSE TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWGRPS-REG
                                         FS-CWGRPS
                                         KGR PGR
                END-IF
                CALL "CWLOCK" USING "M" NOME TASK PROGRAMA
                PERFORM 130-GRAVA-CWLOGF THRU 130-99-FIM
                PERFORM 170-CHECK-SPOOL  THRU 170-99-FIM
                GOBACK
           END-IF

           PERFORM 170-CHECK-SPOOL THRU 170-99-FIM

           IF   NIVEL-ATUAL = 0
                MOVE 0 TO OPCAO
                PERFORM 110-ACCEPT-TELA THRU 110-99-FIM
                       UNTIL OPCAO > ZERO
                                OR NOT NOME-OK
                                OR NOT SENHA-OK
           ELSE
                CALL "CBL_WRITE_SCR_CHATTRS" USING SCREEN-POSITION
                                                   SUB-CHAR
                                                   SUB-ATTR
                                                   STRING-LENGTH
                IF   (NOFRAME = 0 AND FROMGUI = SPACES)
                     IF CWFRAME = SPACES
                        DISPLAY TELA-NOME
                     ELSE
                        CALL CWFRAME USING 'N' TTY-NOME CURDIR
                     END-IF
                END-IF
                CALL "CWATCH"
                MOVE "N"           TO SENHA-ESPECIAL
                PERFORM 115-SUBMENU THRU 115-99-FIM
                IF   CWBOXS-OPTION = 0
                     GO TO 100-99-FIM
                END-IF
           END-IF

           IF  NOME-OK
           AND SENHA-OK
           AND (NOT FINALIZAR)
               MOVE CWCONF-PROG  (OC) TO PROGRAMA
               MOVE CWCONF-HELP  (OC) TO RELATORIO
LOGON          MOVE CWCONF-NIVEL (OC) TO NIVEL-LOGON
LOGON          DISPLAY 'CWLOGON-NIVEL' UPON ENVIRONMENT-NAME
LOGON          DISPLAY NIVEL-LOGON     UPON ENVIRONMENT-VALUE
               CALL "CWCODE" USING "D" CWCONF-SIZE-P-99  (OC)
                                       CWCONF-FATOR-P-99 (OC)
                                       PROGRAMA
               CALL "CWMODE" USING "G" PAGINA MODULO CWCONF-TIPO
               CALL "CWMODE" USING "W" PAGINA MODULO CWCONF-TIPO
               CALL "CWVARX" USING PROGRAMA LENGTH OF PROGRAMA
               INSPECT PROGRAMA CONVERTING MINUSCULAS TO MAIUSCULAS
               EVALUATE PROGRAMA
                   WHEN "GRPAGE"
                         MOVE "CWPAGE" TO PROGRAMA
                   WHEN "GRBOXS"
                         MOVE "CWBOXS" TO PROGRAMA
                   WHEN "GRMENU"
                         MOVE "CWMENU" TO PROGRAMA
               END-EVALUATE
               IF   PROGRAMA = "CWPAGE" OR "GRPAGE"
                    MOVE "CWMENU" TO PROGRAMA
                    MOVE PAGINA   TO SALVA-PAGINA
                    MOVE "N"      TO RESPOSTA
                    MOVE 5        TO YP
                    MOVE 0        TO PAGINA
                    PERFORM VARYING IP FROM 20 BY -1
                            UNTIL IP = 0
                            MOVE CWCONF-HELP (OC) (IP: 1) TO TP
                            IF TP NUMERIC
                            AND YP > 1
                                SUBTRACT 1 FROM YP
                                MOVE TP TO PAGINA (YP: 1)
                            END-IF
                    END-PERFORM
                    MOVE PAGINA  TO CWCONF-PAGINA
                    SET CWSQLC-READ TO TRUE
                    SET CWSQLC-EQUAL TO TRUE
                    SET CWSQLC-IGNORE-LOCK TO TRUE
                    CALL "CWCONF" USING CWSQLC
                                        CWCONF-REG
                                        FS-CWCONF
                                        KCO PCO
                    IF   FS-CWCONF = "23"
                         MOVE SPACES TO CWSEND-MSG CWSEND-SCREENS
                         STRING "P�gina n�o existe: " DELIMITED SIZE
                                 PAGINA               DELIMITED SIZE
                                 INTO CWSEND-MSG
                         CALL "CWSEND" USING PARAMETROS-CWSEND
                         MOVE SALVA-PAGINA TO PAGINA
                         MOVE "N" TO RESPOSTA
                    ELSE
                         PERFORM 103-AJUSTA-NM THRU 103-99-FIM
                         MOVE FUNCAO-PROGRAMA TO CWPAGE-TXT
                                                 MENU-GERAL
                         DISPLAY "CWPAGE"     UPON ENVIRONMENT-NAME
                         DISPLAY  CWPAGE-TXT  UPON ENVIRONMENT-VALUE
                         DISPLAY TFP
                    END-IF
                    PERFORM 180-EXIBE-OPCOES THRU 180-99-FIM
                    MOVE 0 TO OPCAO
                    GO TO 100-99-FIM
               END-IF
               PERFORM 101-SENHA-ESPECIAL THRU 101-99-FIM
               IF   RESPOSTA = "N"
                    GO TO 100-99-FIM
               END-IF
               IF   PROGRAMA NOT = "CWBOXS"
                    PERFORM 103-AJUSTA-NM THRU 103-99-FIM
      *        ELSE
                    IF   NIVEL-ATUAL NOT = 0
                         PERFORM TEXT-FUNCAO THRU FIM-TEXT-FUNCAO
                    END-IF
               END-IF
               IF   HELP = 1
               AND (PROGRAMA NOT = "CWMENU")
               AND (PROGRAMA NOT = "CWBOXS")
                    MOVE "CWMEN4" TO PROGRAMA
               END-IF
               IF   PROGRAMA NOT = "CWBOXS"
                    CALL "CWPAGE" USING "!"
                    CANCEL "CWPAGE"
                    IF   NOFRAME = 0
                         perform limpa-tela
                    END-IF
                    PERFORM 155-EXIBE-TPR8 THRU 155-99-FIM
               END-IF
               perform exibe-funcao
               IF   PROGRAMA = "CWBOXS"
                    MOVE 0        TO NIVEL-ATUAL
                    MOVE "CWMENU" TO PROGRAMA
                    MOVE MENU-GERAL TO FUNCAO-PROGRAMA
                    perform exibe-funcao
                    CALL "CWATCH"
                    MOVE "N"              TO RESPOSTA
                    MOVE 5                TO YP
                    MOVE CWCONF-HELP (OC) TO SUB-PAGINA (1)
                    MOVE 1                TO NIVEL-ATUAL
                    MOVE "S"              TO SENHA-ESPECIAL
                    PERFORM 115-SUBMENU THRU 115-99-FIM
                    IF   CWBOXS-OPTION = 0
                         MOVE MENU-GERAL TO FUNCAO-PROGRAMA
                         DISPLAY TFP
                         GO TO 100-99-FIM
                    END-IF
               END-IF
               IF   OPCAO NOT = 0
                    MOVE "S" TO RESPOSTA
               END-IF
               IF  (CWCONF-CHECK (OC) NOT = SPACE)
               AND (CWCONF-CHECK (OC) NOT = "n")
               AND (CWCONF-CHECK (OC) NOT = "N")
               AND (CWCONF-CHECK (OC) NOT = "0")
               AND (CWCONF-CHECK (OC) NOT = X"00")
               AND  HELP = ZERO
               AND (OPCAO NOT = 0)
               AND  TESTE-CWLINE = "N"
                    IF   NOFRAME = 0
                         IF CWFRAME = SPACES
                            DISPLAY CWMENUM
                         ELSE
                            CALL CWFRAME USING 'M'
                                 ON EXCEPTION
                                    DISPLAY CWMENUM
                            END-CALL
                         END-IF
                    END-IF
                    MOVE SPACES TO CWSEND-MSG CWSEND-SCREENS
JR=>                PERFORM 103-AJUSTA-NM THRU 103-99-FIM
                    PERFORM TEST AFTER
                               VARYING U FROM LENGTH OF FUNCAO-PROGRAMA
                                    BY -1
                               UNTIL FUNCAO-PROGRAMA (U: 1) NOT = SPACES
                                  CONTINUE
                    END-PERFORM
                    STRING "Executar "             DELIMITED SIZE
                            FUNCAO-PROGRAMA (1: U) DELIMITED SIZE
                            " ?_"                  DELIMITED SIZE
                            INTO CWSEND-MSG
                    MOVE SPACES      TO CWSEND-SCREENS
                    MOVE "  ~Sim__"  TO CWSEND-SCREEN (1)
                    MOVE "  ~N�o__"  TO CWSEND-SCREEN (2)
                    MOVE 2          TO CWSEND-OPTION
                    CALL "CWSEND" USING PARAMETROS-CWSEND
                    IF   CWSEND-OPTION = 1
                         MOVE "S" TO RESPOSTA
                    ELSE
                         MOVE "N" TO RESPOSTA
                    END-IF
               END-IF
               IF   TESTE-CWLINE = "S"
               AND (NIVEL-ATUAL  = 0)
                    MOVE "N" TO RESPOSTA TESTE-CWLINE
               END-IF
               IF   NOT EXECUTAR
                    MOVE MENU-GERAL TO FUNCAO-PROGRAMA
                    IF   NOFRAME = 0
                         perform exibe-funcao
                    END-IF
               ELSE
                    IF RELATORIO (1:1) = '&'
                       DISPLAY 'CWPOSIT' UPON ENVIRONMENT-NAME
                       MOVE CWCONF-HELP (OC)(2:) TO FCW
                       DISPLAY FCW          UPON ENVIRONMENT-VALUE
                       MOVE SPACES TO FCW
                       STRING SISTEMA ' - ' USUARIO ' - '
                              FUNCAO-PROGRAMA DELIMITED BY SIZE
                              INTO FCW
                       CALL 'CWPACK' USING FCW LENGTH FCW
                       INSPECT FCW CONVERTING ACENTOS-850
                                           TO ACENTOS-WINDOWS
                       DISPLAY 'CWRUNTITLE' UPON ENVIRONMENT-NAME
                       DISPLAY FCW          UPON ENVIRONMENT-VALUE
                    END-IF
                    PERFORM 130-GRAVA-CWLOGF THRU 130-99-FIM
                    MOVE  CWGETL-LOG TO SET-LOG
                    CALL "CWGETU" USING NOME TASK PROGRAMA SET-LOG
                    MOVE  ZERO       TO OPCAO
                    IF HELP = ZERO
                    OR PROGRAMA = "CWMENU" OR "GRMENU"
                       IF (PROGRAMA NOT = "CWMENU")
                       AND(PROGRAMA NOT = "GRMENU")
                          SET CWSQLC-CLOSE TO TRUE
                          CALL "CWCONF" USING CWSQLC
                                              CWCONF-REG
                                              FS-CWCONF
                                              KCO PCO
                          PERFORM 155-EXIBE-TPR8 THRU 155-99-FIM
                          IF XSDRUN NOT = SPACES
                             MOVE XSDRUN   TO PROGRAMA
                             MOVE SPACES   TO XSDRUN
                          END-IF
                          CALL "CWLOCK" USING "M" NOME TASK PROGRAMA
                          IF  CWCONF-HELP (OC) (1: 1) = "$"
                              MOVE CWCONF-HELP (OC) (2: 4) TO CA-POSI
                              MOVE CWCONF-HELP (OC) (7: 2) TO CA-SIZE
                              IF  (CA-POSI NOT = 0)
                              AND (CA-SIZE NOT = 0)
                              MOVE CWCONF-HELP (OC) (10: )
                                  TO COMMAREA01 (CA-POSI: CA-SIZE)
                               END-IF
                          END-IF
                          IF  CWCONF-HELP (OC) (1: 1) = "$"
                              MOVE CWCONF-HELP (OC) (2: 1) TO OPTS
                              DISPLAY "CWOPTS" UPON ENVIRONMENT-NAME
                              DISPLAY OPTS     UPON ENVIRONMENT-VALUE
                          END-IF
                          GOBACK
                       ELSE
                           PERFORM 190-MUDA-PATH  THRU 190-99-FIM
Mollo                      MOVE '990001'    TO CWCONF-CHAVE
Mollo                      SET CWSQLC-READ  TO TRUE
Mollo                      SET CWSQLC-EQUAL TO TRUE
Mollo                      CALL "CWCONF" USING CWSQLC CWCONF-REG
                                                   FS-CWCONF KCO PCO
                       END-IF
                    ELSE
                         DISPLAY "CWMENU-HELP" UPON ENVIRONMENT-NAME
                         ACCEPT   CWMENU-HELP  FROM ENVIRONMENT-VALUE
                         IF   CWMENU-HELP = SPACES
                              EXEC COBOLware HELP
                                   File CWCONF-HELP(OC)
                              END-EXEC
                         ELSE
                              CALL CWMENU-HELP USING PROGRAMA
                              ON EXCEPTION
                                 MOVE SPACES TO CWSEND-SCREENS
                                 STRING 'M�dulo de help "'
                                        DELIMITED BY SIZE
                                        CWMENU-HELP DELIMITED BY SPACE
                                        '" n�o encontrado.'
                                        DELIMITED BY SIZE
                                   INTO CWSEND-MSG
                                 CALL "CWSEND" USING PARAMETROS-CWSEND
                              END-CALL
                              CANCEL CWMENU-HELP
                         END-IF
      *                  MOVE CWCONF-HELP (OC) TO HELP-PATH
      *                  SET CWSQLC-CLOSE TO TRUE
      *                  CALL "CWCONF" USING CWSQLC
      *                                      CWCONF-REG
      *                                      FS-CWCONF
      *                                      KCO PCO
      *                  CALL "CWMEN4" USING HELP-PATH TASK
      *                   ON OVERFLOW
      *                      MOVE SPACES TO CWSEND-SCREENS
      *                      MOVE "Falha no overlay CWMEN4 "
      *                        TO CWSEND-MSG
      *                      CALL "CWSEND" USING PARAMETROS-CWSEND
      *                      END-CALL
      *                   END-CALL
      *                  SET CWSQLC-UPDATE TO TRUE
      *                  CALL "CWCONF" USING CWSQLC
      *                                      CWCONF-REG
      *                                      FS-CWCONF
      *                                      KCO PCO
      *                  PERFORM 220-REMOVE-OVERLAYS THRU 220-99-FIM
      *                  CANCEL "CWMEN4"
                         MOVE "CWMEN4" TO PROGRAMA
                         GOBACK
                    END-IF
               END-IF
           END-IF.

       100-99-FIM. EXIT.

       10A-RODAPE.

           IF   CWGETL-SPOOL = "2"
                MOVE M1-OFF       TO RODAPE
                MOVE M1-MOUSE-OFF TO RODAPE-MOUSE
           ELSE
                MOVE M1       TO RODAPE
                MOVE M1-MOUSE TO RODAPE-MOUSE
           END-IF.

       10A-99-FIM. EXIT.

       101-SENHA-ESPECIAL.

           IF   EXPIRADA = 1
                EXEC COBOLware Send
                     Message
             "Senha expirada n�o permite opera��es, altere sua senha."
                END-EXEC
                CALL "CWPASS" USING NOME
                CANCEL "CWPASS"
                STOP RUN
           END-IF
           DISPLAY "CWSARBANE" UPON ENVIRONMENT-NAME
           ACCEPT     SARBANE  FROM ENVIRONMENT-VALUE
           IF   SARBANE NUMERIC
           AND  CHECK-NIVEL = 9
                EXEC COBOLware Send
                     Message
                     "Privil�gio de super-usu�rio n�o permite opera��es"
                END-EXEC
                MOVE "N" TO RESPOSTA
                GO TO 101-99-FIM
           END-IF
           MOVE CWCONF-PASS (OC) TO CHECK-PASS-3
           CALL "CWCODE" USING "D" CWCONF-SIZE-S-99  (OC)
                                   CWCONF-FATOR-S-99 (OC)
                                   CHECK-PASS-3
           IF   CHECK-PASS-3 = SPACES
                MOVE "S" TO RESPOSTA
                GO TO 101-99-FIM
           END-IF
           INSPECT CHECK-PASS-3 CONVERTING MINUSCULAS TO MAIUSCULAS
           MOVE SPACES TO CHECK-PASS
           MOVE "S"    TO RESPOSTA
           PERFORM UNTIL (CHECK-PASS-3 = CHECK-PASS)
                   OR (NOT EXECUTAR)
                   OR (PROGRAMA     = "CWMENU")
                   OR (PROGRAMA     = "GRMENU")
               IF   CWGETL-AUTOPASS = 1
                    MOVE 6 TO LENSENHA
               ELSE
                    MOVE LENGTH OF CHECK-PASS TO LENSENHA
               END-IF
               EXEC COBOLware BoxDialog
                    LINE   11 COLUMN 22
                    HEADER CWCONF-NM-OPCAO(OC)
                    Caption(1) "Op��o requer senha"
                    Size(1) LENSENHA (Secure(1))
                    Data(1) CHECK-PASS;CHECK-PASS
                    CANCEL ;RESPOSTA
               END-EXEC
               IF   RESPOSTA = "Y"
                    MOVE "N" TO RESPOSTA
                    MOVE 0   TO OPCAO
               ELSE
                    MOVE "S" TO RESPOSTA
                    INSPECT CHECK-PASS CONVERTING MINUSCULAS
                                               TO MAIUSCULAS
                    IF CHECK-PASS-3 NOT = CHECK-PASS
                       EXEC COBOLware Send
                            Message "Senha especial incorreta"
                       END-EXEC
                    END-IF
               END-IF
           END-PERFORM.

       101-99-FIM. EXIT.

      *102-USERPASS.
      *
      *    INSPECT LINHA-COMANDO CONVERTING MINUSCULAS TO MAIUSCULAS
      *    MOVE SPACES TO NOME-C
      *                   SENHA-C
      *    MOVE 0      TO I-NOME
      *                   I-SENHA
      *    PERFORM VARYING I FROM 1 BY 1 UNTIL I > 200
      *            IF  BYTE-L (I) = SPACE
      *                MOVE 0 TO SET-NOME SET-SENHA
      *            END-IF
      *            IF  BYTE-L (I) = "/"
      *                MOVE 0 TO SET-NOME SET-SENHA
      *                ADD 1  TO I
      *                IF   I < 194
      *                     IF   LINHA-COMANDO (I: 7) = "NOFRAME"
      *                          MOVE 1 TO NOFRAME
      *                          DISPLAY "CWSTOP" UPON ENVIRONMENT-NAME
      *                          DISPLAY "OFF"    UPON ENVIRONMENT-VALUE
      *                     END-IF
      *                END-IF
      *                EVALUATE TRUE
      *                    WHEN BYTE-L (I) = "U" OR "u"
      *                         ADD 1 TO I
      *                         IF  BYTE-L (I) = ":"
      *                             MOVE 1 TO SET-NOME
      *                             ADD  1 TO I
      *                         END-IF
      *                    WHEN BYTE-L (I) = "P" OR "p" OR "S" OR "s"
      *                         ADD 1 TO I
      *                         IF  BYTE-L (I) = ":"
      *                             MOVE 1 TO SET-SENHA
      *                             ADD  1 TO I
      *                         END-IF
      *                END-EVALUATE
      *            END-IF
      *            IF   SET-NOME = 1
      *                 ADD  1          TO I-NOME
      *                 MOVE BYTE-L (I) TO NOME-C (I-NOME: 1)
      *                 IF   I-NOME = 30
      *                      MOVE 0 TO I-NOME SET-NOME
      *                 END-IF
      *            END-IF
      *            IF   SET-SENHA = 1
      *                 ADD  1          TO I-SENHA
      *                 MOVE BYTE-L (I) TO SENHA-C (I-SENHA: 1)
      *                 IF   I-SENHA = 30
      *                      MOVE 0 TO I-SENHA SET-SENHA
      *                 END-IF
      *            END-IF
      *    END-PERFORM.
      *
      *102-99-FIM. EXIT.
      *
       103-AJUSTA-NM.

           MOVE WS-NM-OPCAO (OC) TO FUNCAO-NOVA
           MOVE SPACES           TO FUNCAO-PROGRAMA
           MOVE 0                TO Y
           PERFORM VARYING I FROM 1 BY 1
                     UNTIL I > LENGTH OF FUNCAO-PROGRAMA
                   IF   FUNCAO-NOVA (I: 1) NOT = X"7E"
                        ADD 1 TO Y
                        MOVE FUNCAO-NOVA     (I: 1)
                          TO FUNCAO-PROGRAMA (Y: 1)
                   END-IF
           END-PERFORM
           INSPECT FUNCAO-PROGRAMA CONVERTING "_" TO SPACE.

       103-99-FIM. EXIT.

       105-GET-COLOR.

           CANCEL "CWACOR"
           CALL "CWACOR" USING PARAMETROS-CWACOR
                 ON OVERFLOW
                MOVE SPACES TO CWSEND-SCREENS
                MOVE "Falha no overlay CWACOR " TO CWSEND-MSG
                CALL "CWSEND" USING PARAMETROS-CWSEND END-CALL
           END-CALL
           IF   CWLOGO NOT = SPACES
                MOVE CWACOR-F (08) TO LF1 LF4 LF7
                MOVE CWACOR-B (08) TO LB7
           END-IF.

       105-99-FIM. EXIT.

       110-ACCEPT-TELA.

           MOVE "CWMENU" TO PROGRAMA
           IF  CWFRAME = SPACES
               DISPLAY TPR
           ELSE
               CALL CWFRAME USING 'P' PROGRAMA
           END-IF

           MOVE 0 TO TECLA

           IF   LIST
                MOVE PAGINA  TO PAGINAX
                PERFORM 112-MENU-LIST THRU 112-99-FIM
                MOVE PAGINAX TO PAGINA
                GO TO 110-ESC
           END-IF

           PERFORM 180-EXIBE-OPCOES THRU 180-99-FIM

           IF   PAGINA = 1
                MOVE SPACES   TO RODAPE       (10: 6)
                                 RODAPE-MOUSE (10: 6)
           ELSE
                MOVE " PgUp " TO RODAPE       (10: 6)
                MOVE "������" TO RODAPE-MOUSE (10: 6)
           END-IF

           ADD  1                  TO PAGINA
           MOVE PAGINA             TO CWCONF-PAGINA
           SET  CWSQLC-READ        TO TRUE
           SET  CWSQLC-EQUAL       TO TRUE
           SET  CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO

           IF   FS-CWCONF > '09'
                MOVE SPACES   TO RODAPE       (16: 6)
                                 RODAPE-MOUSE (16: 6)
           ELSE
                MOVE " PgDn " TO RODAPE       (16: 6)
                MOVE "������" TO RODAPE-MOUSE (16: 6)
           END-IF

           SUBTRACT 1            FROM PAGINA
           MOVE PAGINA             TO CWCONF-PAGINA
           SET  CWSQLC-READ        TO TRUE
           SET  CWSQLC-EQUAL       TO TRUE
           SET  CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO

           INSPECT RODAPE-MOUSE CONVERTING SPACE TO LOW-VALUE
           MOVE RODAPE-MOUSE TO CWMOUS-LINE (footline) (3: 70)
           IF CWFRAME = SPACES
              DISPLAY CWMENUD
           ELSE
              CALL CWFRAME USING 'R' RODAPE
                   ON EXCEPTION
                      DISPLAY CWMENUD
              END-CALL
           END-IF

           IF  OPCOES-VALIDAS = 0
               IF   ULTIMA-PAGINA = PAGINA
                    SUBTRACT 1 FROM ULTIMA-PAGINA
               END-IF
               EVALUATE TRUE
                        WHEN FLAG-OPCOES = ">"
                         AND PAGINA < ULTIMA-PAGINA
                             SET PAGE-DOWN TO TRUE
                             GO TO 110-ESC
                        WHEN FLAG-OPCOES = "<"
                             IF   PAGINA > 1
                                  SET PAGE-UP   TO TRUE
                             ELSE
                                  MOVE ">" TO FLAG-OPCOES
                                  SET PAGE-DOWN TO TRUE
                             END-IF
                             GO TO 110-ESC
                END-EVALUATE
           END-IF

           IF   NOT POPUP-ON
                IF   CWLEGACYMENU = 'OFF'
                OR   LEGACY > 9
                     CALL "CBL_SET_CSR_POS" USING X"1609"
                     IF   CWUNIX-OFF
                          CALL "CBL_WRITE_SCR_CHARS" USING X"1608"
                                                           X"B0B0"
                                                           X"0002"
                     ELSE
                          CALL "CBL_WRITE_SCR_CHARS" USING X"1608"
                                                           "__"
                                                           X"0002"
                     END-IF
                ELSE
                     CALL "CBL_SET_CSR_POS" USING X"1608"
                     IF   CWUNIX-OFF
                          CALL "CBL_WRITE_SCR_CHARS" USING X"1608"
                                                           X"B0"
                                                           X"0001"
                     ELSE
                          CALL "CBL_WRITE_SCR_CHARS" USING X"1608"
                                                           "_"
                                                           X"0001"
                     END-IF
                END-IF
                SET  CWMOUS-TIMEOUT-ENABLE TO TRUE
                CALL "CWMOUS" USING PARAMETROS-CWMOUS
                IF   CWMOUS-TIMEOUT-ON
                     MOVE 101 TO CWMOUS-KEY
                END-IF
           ELSE
                IF CWFRAME = SPACES
                   CALL "CBL_WRITE_SCR_CHARS" USING X"1602"
                                                    "        "
                                                    X"0008"
                ELSE
                   DISPLAY (footline, 3) "        "
                END-IF
                SUBTRACT 200 FROM CWLINE-OPTION
                IF   ARROW = ">"
                     ADD 1 TO CWLINE-OPTION
                     IF   CWLINE-OPTION > OP-POP
                          MOVE 1 TO CWLINE-OPTION
                     END-IF
                END-IF
                IF   ARROW = "<"
                     SUBTRACT 1 FROM CWLINE-OPTION
                     IF   CWLINE-OPTION = 0
                          MOVE OP-POP TO CWLINE-OPTION
                     END-IF
                END-IF
                IF   ARROW NOT = SPACE
                     COMPUTE CWLINE-OPTION = 300 + CWLINE-OPTION
                     MOVE "S" TO TESTE-CWLINE
                ELSE
                     MOVE "N" TO TESTE-CWLINE
                END-IF
                IF   BUTTON-ON
                     SET CWLINE-BUTTONS  TO TRUE
                     IF   CWUNIX-OFF AND CWFRAME = SPACES
                     CALL "CBL_WRITE_SCR_CHARS" USING X"0601" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"0701" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"0801" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"0901" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"0A01" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"0B01" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"0C01" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"0D01" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"0E01" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"0F01" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"1001" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"1101" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"1201" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"1301" B1 X"004E"
                     CALL "CBL_WRITE_SCR_CHARS" USING X"1401" B1 X"004E"
                     END-IF
                ELSE
                     SET CWLINE-REVERSED TO TRUE
                END-IF
                MOVE "S"         TO CWLINE-MOUSE
                CALL "CWLINE" USING PARAMETROS-CWLINE
                                    PARAMETROS-CWMOUS
                IF   CWLINE-TIMEOUT-ON
                     MOVE 0 TO CWLINE-OPTION
                END-IF
                IF   ARROW NOT = SPACE
                     MOVE CWLINE-OPTION TO CWMOUS-KEY
                END-IF
                MOVE SPACE         TO ARROW
                MOVE CWLINE-OPTION TO OPCAO SAVE-CWLINE-OPTION
           END-IF

           EVALUATE TRUE
              WHEN CWMOUS-KEY = 107
                   STOP RUN
              WHEN CWMOUS-KEY = 255
                   IF   CWLEGACYMENU = 'OFF'
                        ACCEPT CWMENUE
                   ELSE
                        IF   LEGACY < 10
                             ACCEPT CWMENUEA1
                        ELSE
                             ACCEPT CWMENUEA2
                        END-IF
                   END-IF
                   ACCEPT TECLA FROM ESCAPE KEY
              WHEN CWMOUS-KEY > 200
                   COMPUTE OPCAO = CWMOUS-KEY - 200
                   MOVE OPCAO TO OCX
                   IF   POPUP-ON
                        MOVE CORR-POP (OPCAO) TO OPCAO
                   END-IF
              WHEN CWMOUS-KEY > 100
                   COMPUTE TECLA = CWMOUS-KEY - 100
              WHEN POPUP-ON
                   EVALUATE CWMOUS-KEY
                       WHEN 000
                            IF CWLINE-MOUSE = 'S' OR X'1B'
                               SET ESC       TO TRUE
                            END-IF
                       WHEN 059 SET F1        TO TRUE
                       WHEN 060 SET F2        TO TRUE
                       WHEN 061 SET F3        TO TRUE
                       WHEN 062 SET F4        TO TRUE
                       WHEN 063 SET F5        TO TRUE
                       WHEN 064 SET F6        TO TRUE
                       WHEN 065 SET F7        TO TRUE
                       WHEN 066 SET F8        TO TRUE
                       WHEN 067 SET F9        TO TRUE
                       WHEN 068 SET F10       TO TRUE
                       WHEN 081 SET PAGE-DOWN TO TRUE
                       WHEN 073 SET PAGE-UP   TO TRUE
                   END-EVALUATE
              WHEN OTHER
                   MOVE CWMOUS-KEY TO TECLA
           END-EVALUATE

           IF   F5 AND CWGETL-SPOOL = "2"
                MOVE 0 TO TECLA
           END-IF.

       110-ESC.

           IF   ESC
                MOVE 0           TO SUB-OPTION (1)
                                    SUB-OPTION (2)
                                    SUB-OPTION (3)
                                    SUB-OPTION (4)
                                    SUB-OPTION (5)
                MOVE "Sair do sistema ?" TO CWSEND-MSG
                MOVE SPACES      TO CWSEND-SCREENS
                MOVE "__~Sair__" TO CWSEND-SCREEN (1)
                MOVE "_~Voltar_" TO CWSEND-SCREEN (2)
                MOVE 1           TO CWSEND-OPTION
                SET CWSEND-TIMEOUT-ENABLE TO TRUE
                CALL "CWSEND" USING PARAMETROS-CWSEND
                IF   CWSEND-TIMEOUT-ON
                     MOVE 1 TO CWSEND-OPTION
                END-IF
                IF   CWSEND-OPTION = 2 OR 0
                     MOVE 0 TO TECLA
                END-IF
                IF   CWSEND-OPTION = 1
                     CALL "CWLOCK" USING "U" NOME TASK
                END-IF
           END-IF

           IF   ESC
                IF   CWGETL-LOGOUT NOT = SPACES
                     CALL CWGETL-LOGOUT USING COMMAREA01
                                              COMMAREA02
                                              COMMAREA03
                                              COMMAREA04
                                              COMMAREA05
                                              COMMAREA06
                                              COMMAREA07
                                              COMMAREA08
                                              COMMAREA09
                                              COMMAREA10
                          ON OVERFLOW
                             MOVE SPACES TO CWSEND-MSG
                             STRING "Imposs�vel executar o programa "
                                     DELIMITED BY SIZE
                                     CWGETL-LOGOUT DELIMITED BY SPACE
                             INTO CWSEND-MSG
                             CALL "CWSEND" USING PARAMETROS-CWSEND
                             END-CALL
                             STOP RUN
                     END-CALL
                END-IF
                MOVE "CWMENU" TO PROGRAMA
                GOBACK
           END-IF

           MOVE ZERO TO OC

           IF   ESC
           OR   F1
           OR   F3
           OR   F5
           OR   F7
           OR   F8
           OR   F9
      *    OR   F10
           OR   PAGE-DOWN
           OR   PAGE-UP
                MOVE ZERO TO OPCAO
      *         IF   F10
      *              MOVE "L5" TO CWCONF-REG
      *              SET CWSQLC-READ TO TRUE
      *              SET CWSQLC-EQUAL TO TRUE
      *              SET CWSQLC-IGNORE-LOCK TO TRUE
      *              CALL "CWCONF" USING CWSQLC
      *                                  CWCONF-REG
      *                                  FS-CWCONF
      *                                  KCO PCO
      *              MOVE "O produto n�o est� licenciado." TO CWSEND-MSG
      *              MOVE SPACES           TO CWSEND-SCREENS
      *              IF   FS-CWCONF < "10"
      *              AND  CWCONF-LICENCIADO NOT = SPACES
      *                   MOVE CWCONF-LICENCA-X TO LICENCA-2
      *                   MOVE SPACES           TO CWSEND-MSG
      *                   STRING "Licenciado: "
      *                           CWCONF-LICENCIADO DELIMITED BY SIZE
      *                      INTO CWSEND-MSG
      *              END-IF
      *              CALL "CWSEND" USING PARAMETROS-CWSEND
      *         END-IF
           ELSE
                MOVE CWGETL-LOG  TO SET-LOG
                CALL "CWGETU" USING NOME TASK PROGRAMA SET-LOG
                CALL "CWATCH"
                IF   OPCAO NOT = ZERO
                     PERFORM VARYING I FROM 1 BY 1
                             UNTIL I > 26
                             IF   OPCAO = CWCONF-NO-OPCAO (I)
                                  MOVE I  TO OC
                                  MOVE 30 TO I
                             END-IF
                     END-PERFORM
                     IF   OC = ZERO
                          CALL X"E5"
                          CALL "CBL_SET_CSR_POS" USING X"1609"
                          MOVE ZERO TO OPCAO
                          GO TO 110-99-FIM
                     END-IF
                END-IF
           END-IF.

       110-FUNCOES.

           MOVE SPACE TO FLAG-OPCOES

           IF   F7
                CALL "CWLOGD"
                CANCEL "CWLOGD"
           ELSE
           IF   F8
           AND  CHECK-NIVEL = 9
                SET CWSQLC-CLOSE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                CALL "CWMENC"
                     ON OVERFLOW
                        MOVE SPACES TO CWSEND-SCREENS
                        MOVE "Falha no overlay CWMENC " TO CWSEND-MSG
                        CALL "CWSEND" USING PARAMETROS-CWSEND END-CALL
                     END-CALL
                CANCEL "CWMENC"
                SET CWSQLC-UPDATE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           ELSE
           IF   F9
                IF  F9-TEXTO = SPACES
                    DISPLAY "CWMENU-F9"  UPON ENVIRONMENT-NAME
                    MOVE SPACES TO F9-TEXTO F9-PROGRAM
                    ACCEPT F9-TEXTO FROM ENVIRONMENT-VALUE
                    IF  F9-TEXTO NOT = SPACES
                        PERFORM VARYING Y FROM 1 BY 1
                                  UNTIL Y > LENGTH OF F9-TEXTO
                                     OR (F9-PROGRAM NOT = SPACES)
                             IF F9-TEXTO (Y:1) = ","
                                ADD 1 TO Y
                                MOVE F9-TEXTO (Y:) TO F9-PROGRAM
                                SUBTRACT 1 FROM Y
                                MOVE SPACES TO F9-TEXTO (Y:)
                             END-IF
                        END-PERFORM
                    END-IF
                END-IF
                IF   F9-PROGRAM NOT = SPACES
                     perform limpa-tela
                     MOVE F9-TEXTO   TO FUNCAO-PROGRAMA
                     MOVE F9-PROGRAM TO PROGRAMA
                     PERFORM 155-EXIBE-TPR8 THRU 155-99-FIM
                     CALL PROGRAMA USING COMMAREA01
                                         COMMAREA02
                                         COMMAREA03
                                         COMMAREA04
                                         COMMAREA05
                                         COMMAREA06
                                         COMMAREA07
                                         COMMAREA08
                                         COMMAREA09
                                         COMMAREA10
                          ON OVERFLOW
                             MOVE SPACES TO CWSEND-MSG
                             STRING "Imposs�vel executar o programa "
                                     DELIMITED BY SIZE
                                     PROGRAMA DELIMITED BY SPACE
                             INTO CWSEND-MSG
                             CALL "CWSEND" USING PARAMETROS-CWSEND
                     END-CALL
                     CANCEL PROGRAMA
                     MOVE MENU-GERAL TO FUNCAO-PROGRAMA
                     MOVE "CWMENU"   TO PROGRAMA
                ELSE
                     IF   NOT CWUNIX-ON
                     CALL "PC_TEST_PRINTER" USING PRINTER-NO
                                                  PRINTER-STATUS
                     ON   OVERFLOW
                          MOVE 144 TO PRINTER-STATUS
                     END-CALL
                     END-IF
                     IF   PRINTER-STATUS = 144 OR CWUNIX-ON
                          DISPLAY SALTO UPON PRINTER
                     END-IF
                END-IF
           ELSE
           IF   F5
           AND  HELP  = ZERO
                MOVE "Controle de SPOOL" TO FUNCAO-PROGRAMA
                perform exibe-moldura
                perform exibe-funcao
                perform limpa-tela
                PERFORM 155-EXIBE-TPR8 THRU 155-99-FIM
                PERFORM 220-REMOVE-OVERLAYS THRU 220-99-FIM
                CALL SPOOL USING "R0000000.SPL"
                      ON OVERFLOW
                        MOVE SPACES TO CWSEND-SCREENS
                        MOVE "Falha no overlay CWMEN9 " TO CWSEND-MSG
                        CALL "CWSEND" USING PARAMETROS-CWSEND END-CALL
                     END-CALL
                PERFORM 220-REMOVE-OVERLAYS THRU 220-99-FIM
                CANCEL SPOOL
                MOVE MENU-GERAL TO FUNCAO-PROGRAMA
                perform limpa-tela
                perform exibe-funcao
                PERFORM 155-EXIBE-TPR8 THRU 155-99-FIM
           ELSE
           IF   F3
           AND  HELP  = ZERO
                MOVE CWCONF-CHAVE TO SALVA-CHAVE
                SET CWSQLC-CLOSE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE ZERO TO OPCAO-2
                             TECLA
                PERFORM 220-REMOVE-OVERLAYS THRU 220-99-FIM
                PERFORM 150-CWCONFIGURA THRU 150-99-FIM
                PERFORM 220-REMOVE-OVERLAYS THRU 220-99-FIM
                MOVE ZERO TO TECLA
                SET CWSQLC-UPDATE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE "PS" TO CWCONF-REG
                MOVE NOME TO CWCONF-NOME
                SET CWSQLC-READ TO TRUE
                SET CWSQLC-EQUAL TO TRUE
                SET CWSQLC-IGNORE-LOCK TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                IF   FS-CWCONF < "10"
                     IF   CWCONF-PRINTER-DEFAULT = SPACES OR LOW-VALUES
                          MOVE "Spool" TO CWCONF-PRINTER-DEFAULT
                     END-IF
                     MOVE CWCONF-PRINTER-DEFAULT TO IMPRESSORA
                END-IF
                PERFORM 170-CHECK-SPOOL THRU 170-99-FIM
                MOVE SALVA-CHAVE TO CWCONF-CHAVE
                SET CWSQLC-READ TO TRUE
                SET CWSQLC-EQUAL TO TRUE
                SET CWSQLC-IGNORE-LOCK TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                IF  (NOT MUDA-EMPRESA)
                AND (NOT MUDA-SENHA)
                AND (NOT MUDA-SISTEMA)
                AND (NOT MUDA-MOLDURA)
                AND (NOT MUDA-NADA)
                AND (NOT MUDA-COR)
                     MOVE MENU-GERAL          TO FUNCAO-PROGRAMA
                     MOVE "CWMENU"            TO PROGRAMA
                     perform limpa-tela
                     perform exibe-funcao
                     PERFORM 155-EXIBE-TPR8 THRU 155-99-FIM
                END-IF
           ELSE
           IF   F1
                IF   HELP = ZERO
                     MOVE 1 TO HELP
                     MOVE "H E L P" TO FUNCAO-PROGRAMA
                     MOVE  M2       TO RODAPE
                     MOVE  M2-MOUSE TO RODAPE-MOUSE
                     perform exibe-funcao
                ELSE
                     MOVE ZERO TO HELP
                     MOVE MENU-GERAL TO FUNCAO-PROGRAMA
                     PERFORM 10A-RODAPE THRU 10A-99-FIM
                     perform exibe-funcao.

           IF   PAGE-DOWN
                MOVE ">"    TO FLAG-OPCOES
                MOVE PAGINA TO SALVA-PAGINA
                ADD  1             TO PAGINA
                MOVE PAGINA  TO CWCONF-PAGINA
                SET CWSQLC-READ TO TRUE
                SET CWSQLC-EQUAL TO TRUE
                SET CWSQLC-IGNORE-LOCK TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE ZERO TO TESTE-OPCAO
                PERFORM UNTIL TESTE-OPCAO NOT = ZERO
                           OR FS-CWCONF NOT = "00"
                        PERFORM VARYING I FROM 1 BY 1
                                UNTIL I > 26
                                OR FS-CWCONF NOT = "00"
                                OR TESTE-OPCAO NOT = ZERO
                             IF  CWCONF-NIVEL (I) NOT NUMERIC
                                 MOVE 0      TO CWCONF-NIVEL (I)
                             END-IF
                             IF   CWCONF-NIVEL (I) > CHECK-NIVEL
                                  MOVE ZERO TO CWCONF-NO-OPCAO (I)
                             END-IF
                             ADD  CWCONF-NO-OPCAO (I) TO TESTE-OPCAO
                        END-PERFORM
                        IF   ULTIMA-PAGINA = PAGINA
                        AND  TESTE-OPCAO = 0
                             SUBTRACT 1 FROM ULTIMA-PAGINA
                        END-IF
                        IF   TESTE-OPCAO = ZERO
                             ADD  1      TO PAGINA
                             MOVE PAGINA TO CWCONF-PAGINA
                             SET CWSQLC-READ TO TRUE
                             SET CWSQLC-EQUAL TO TRUE
                             SET CWSQLC-IGNORE-LOCK TO TRUE
                             CALL "CWCONF" USING CWSQLC
                                                 CWCONF-REG
                                                 FS-CWCONF
                                                 KCO PCO
                        END-IF
                END-PERFORM
                IF   FS-CWCONF NOT = "00"
                     IF   ULTIMA-PAGINA = 9999
                          COMPUTE ULTIMA-PAGINA = PAGINA - 1
                     END-IF
                     MOVE SALVA-PAGINA TO CWCONF-PAGINA PAGINA
                     SET CWSQLC-READ TO TRUE
                     SET CWSQLC-EQUAL TO TRUE
                     SET CWSQLC-IGNORE-LOCK TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWCONF-REG
                                         FS-CWCONF
                                         KCO PCO
                END-IF
                MOVE ZERO TO OPCAO
           ELSE
                IF   PAGE-UP
                AND  PAGINA > 1
                     MOVE "<"    TO FLAG-OPCOES
                     MOVE PAGINA TO SALVA-PAGINA
                     SUBTRACT 1 FROM PAGINA
                     SET CWSQLC-READ TO TRUE
                     SET CWSQLC-EQUAL TO TRUE
                     SET CWSQLC-IGNORE-LOCK TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWCONF-REG
                                         FS-CWCONF
                                         KCO PCO
                     MOVE ZERO TO TESTE-OPCAO
                     PERFORM UNTIL TESTE-OPCAO NOT = ZERO
                                OR FS-CWCONF NOT = "00"
                                OR PAGINA < 2
                             PERFORM VARYING I FROM 1 BY 1
                                     UNTIL I > 26
                                        OR CWCONF-PAGINA < 2
                                        OR FS-CWCONF NOT = "00"
                                        OR TESTE-OPCAO NOT = ZERO
                                  IF  CWCONF-NIVEL (I) NOT NUMERIC
                                      MOVE 0      TO CWCONF-NIVEL (I)
                                  END-IF
                                  IF   CWCONF-NIVEL (I) > CHECK-NIVEL
                                       MOVE ZERO TO CWCONF-NO-OPCAO (I)
                                  END-IF
                                  ADD CWCONF-NO-OPCAO (I) TO TESTE-OPCAO
                             END-PERFORM
                             IF   TESTE-OPCAO = ZERO
                                  SUBTRACT 1    FROM PAGINA
                                  MOVE PAGINA TO CWCONF-PAGINA
                                  SET CWSQLC-READ TO TRUE
                                  SET CWSQLC-EQUAL TO TRUE
                                  SET CWSQLC-IGNORE-LOCK TO TRUE
                                  CALL "CWCONF" USING CWSQLC
                                                      CWCONF-REG
                                                      FS-CWCONF
                                                      KCO PCO
                             END-IF
                     END-PERFORM
                     IF   FS-CWCONF NOT = "00"
                          MOVE SALVA-PAGINA TO CWCONF-PAGINA
                                               PAGINA
                          SET CWSQLC-READ TO TRUE
                          SET CWSQLC-EQUAL TO TRUE
                          SET CWSQLC-IGNORE-LOCK TO TRUE
                          CALL "CWCONF" USING CWSQLC
                                              CWCONF-REG
                                              FS-CWCONF
                                              KCO PCO
                     END-IF
                END-IF
           END-IF
           PERFORM 131-DATE-TIME THRU 131-99-FIM
           CALL "CWATCH".

       110-99-FIM. EXIT.

       112-MENU-LIST.

           COMPUTE CWBOXC-TYPE = QUADRO - 1
           SET CWBOXC-LOAD   TO TRUE
           MOVE "Selecione:" TO CWBOXC-TITLE
           MOVE  9           TO CWBOXC-LINE
           MOVE 10           TO CWBOXC-COLUMN
           MOVE  0           TO CWBOXC-VERTICAL-LENGTH
           MOVE 1            TO CWBOXC-ORDER
           MOVE 2            TO CWBOXC-RETURN
           MOVE 10           TO CWBOXC-STRING-1-LENGTH
           MOVE  0           TO CWBOXC-STRING-2-LENGTH
           MOVE  6           TO CWBOXC-H-LINE
           MOVE 40           TO CWBOXC-H-COLUMN
           MOVE 15           TO CWBOXC-H-VERTICAL-LENGTH
           MOVE 37           TO CWBOXC-H-HORIZONTAL-LENGTH
           MOVE 46           TO CWBOXC-H-COLOR-BORDER
           MOVE 110          TO CWBOXC-COLOR-FRAME
           MOVE 110          TO CWBOXC-COLOR-BORDER
           MOVE 008          TO CWBOXC-COLOR-SHADE
           MOVE 112          TO CWBOXC-COLOR-BARR-MENU
           MOVE "00"         TO FS-CWCONF
           SET CWSQLC-UPDATE TO TRUE
           CALL "CWCONF" USING CWSQLC CWGRPS-REG FS-CWGRPS KGR PGR
           PERFORM VARYING PAGINA FROM 1 BY 1
                           UNTIL FS-CWCONF > "09"
                   MOVE "99"   TO CWCONF-REG99
                   MOVE PAGINA TO CWCONF-PAGINA
                   SET CWSQLC-READ TO TRUE
                   SET CWSQLC-EQUAL TO TRUE
                   SET CWSQLC-IGNORE-LOCK TO TRUE
                   CALL "CWCONF" USING CWSQLC
                                       CWCONF-REG
                                       FS-CWCONF
                                       KCO PCO
                   PERFORM VARYING I FROM 1 BY 1
                           UNTIL I > 26
                              OR FS-CWCONF NOT = "00"
                     PERFORM 230-CHECK-ACESSO THRU 230-99-FIM
                     IF  CWCONF-NIVEL (I) NOT NUMERIC
                         MOVE 0 TO CWCONF-NIVEL (I)
                     END-IF
                     IF  (CWCONF-NIVEL    (I) NOT > CHECK-NIVEL)
                     AND (CWCONF-NM-OPCAO (I) NOT = SPACES)
                     AND (CWCONF-PROG     (I) NOT = SPACES)
                         IF   TESTECHAR = "/"
                              MOVE CWCONF-NM-OPCAO(I) (3:  )
                                TO CWBOXC-STRING-1
                         ELSE
                              MOVE CWCONF-NM-OPCAO(I)
                                TO CWBOXC-STRING-1
                         END-IF
                         MOVE 0      TO Y
                         MOVE SPACES TO FUNCAO-PROGRAMA
                         PERFORM VARYING K
                                         FROM LENGTH OF FUNCAO-PROGRAMA
                                         BY -1
                                         UNTIL K = 1
                                            OR (CWBOXC-STRING-1 (K: 1)
                                              NOT = SPACE)
                                 CONTINUE
                         END-PERFORM
                         PERFORM VARYING I2 FROM 1 BY 1
                                   UNTIL I2 > K
                                 IF CWBOXC-STRING-1 (I2: 1) NOT = X"7E"
                                    ADD 1 TO Y
                                    MOVE CWBOXC-STRING-1 (I2: 1)
                                      TO FUNCAO-PROGRAMA (Y: 1)
                                 END-IF
                         END-PERFORM
                         INSPECT FUNCAO-PROGRAMA CONVERTING "_" TO SPACE
                         IF   Y > CWBOXC-STRING-1-LENGTH
                              MOVE Y TO CWBOXC-STRING-1-LENGTH
                         END-IF
                         MOVE FUNCAO-PROGRAMA TO CWBOXC-STRING-1
                         MOVE CWCONF-PROG (I) TO PROGRAMA
                         MOVE CWCONF-HELP (I) TO RELATORIO
                         CALL "CWCODE" USING "D" CWCONF-SIZE-P-99  (I)
                                                 CWCONF-FATOR-P-99 (I)
                                                 PROGRAMA
                         CALL "CWVARX" USING PROGRAMA LENGTH OF PROGRAMA
                         INSPECT PROGRAMA CONVERTING
                                          MINUSCULAS TO MAIUSCULAS
Joadir                   IF CWMENUPAGE = 'ALL'
Joadir                   AND (PROGRAMA = 'CWBOXS' OR 'GRBOXS'
Joadir                                OR 'CWPAGE' OR 'GRPAGE')
Joadir                      PERFORM VARYING IZ FROM 1 BY 1
Joadir                            UNTIL(CWCONF-HELP(I)(IZ:1) NUMERIC
Joadir                              AND CWCONF-HELP(I)(IZ:1) NOT = '0')
Joadir                             OR IZ > LENGTH CWCONF-HELP(I)
Joadir                              CONTINUE
Joadir                      END-PERFORM
Joadir                      MOVE SPACES TO TIT-WORK
Joadir                      STRING CWBOXC-STRING-1 '('
Joadir                             DELIMITED BY SIZE
Joadir                             CWCONF-HELP (I)(IZ:)
Joadir                             DELIMITED BY SPACE
Joadir                             ')' DELIMITED BY SIZE
Joadir                             INTO TIT-WORK
Joadir                       EXEC COBOLware Pack
Joadir                            String TIT-WORK
Joadir                            WIDTH Y
Joadir                       END-EXEC
Joadir                       MOVE TIT-WORK TO CWBOXC-STRING-1
Joadir                       IF   Y > CWBOXC-STRING-1-LENGTH
Joadir                            MOVE Y TO CWBOXC-STRING-1-LENGTH
Joadir                       END-IF
Joadir                   END-IF
                         IF ( PROGRAMA NOT = "CWPAGE")
                         AND( PROGRAMA NOT = "GRPAGE")
                              MOVE SPACES TO CWBOXC-H-FILE
                              IF  (PROGRAMA NOT = "CWMENU")
                              AND (PROGRAMA NOT = "GRMENU")
                                   MOVE CWCONF-HELP(I)
                                     TO CWBOXC-H-FILE
                              END-IF
                              MOVE CWCONF-NO-OPCAO (I) TO OPCAO
                              MOVE PAGINA TO CWBOXC-STRING-2 (1: 4)
                              MOVE OPCAO  TO CWBOXC-STRING-2 (5: 2)
                              CALL "CWBOXC" USING PARAMETROS-CWBOXC
                              IF   CWBOXC-VERTICAL-LENGTH < 10
                                   ADD 1 TO CWBOXC-VERTICAL-LENGTH
                              END-IF
                         END-IF
                         MOVE SPACES TO PROGRAMA
                     END-IF
                   END-PERFORM
           END-PERFORM
           SET CWSQLC-CLOSE TO TRUE
           CALL "CWCONF" USING CWSQLC CWGRPS-REG FS-CWGRPS KGR PGR
           MOVE 0                   TO OPCAO
           MOVE "CWMENU"            TO PROGRAMA
           IF   CHECK-NIVEL > 0
                MOVE MSG-1          TO CWBOXC-STRING-1
                MOVE "f3"           TO CWBOXC-STRING-2
                IF   CWBOXC-VERTICAL-LENGTH < 10
                     ADD 1 TO CWBOXC-VERTICAL-LENGTH
                END-IF
                IF   CWBOXC-STRING-1-LENGTH < 12
                     MOVE 12 TO CWBOXC-STRING-1-LENGTH
                END-IF
                CALL "CWBOXC"    USING PARAMETROS-CWBOXC
           END-IF
           IF   CWGETL-SPOOL NOT = "2"
                MOVE "Spool"      TO CWBOXC-STRING-1
                MOVE "f5"         TO CWBOXC-STRING-2
                IF   CWBOXC-VERTICAL-LENGTH < 10
                     ADD 1 TO CWBOXC-VERTICAL-LENGTH
                END-IF
           END-IF
           COMPUTE CWBOXC-HORIZONTAL-LENGTH = CWBOXC-STRING-1-LENGTH + 2
           CALL "CWBOXC"   USING PARAMETROS-CWBOXC
           SET  CWBOXC-POP-UP TO TRUE
           CALL "CBL_WRITE_SCR_CHARS" USING X"1602" ESPACOS X"0044"
           CALL "CWBOXC"  USING PARAMETROS-CWBOXC
           EVALUATE CWBOXC-OPTION
             WHEN SPACES SET ESC TO TRUE
             WHEN "f3"   SET F3  TO TRUE
             WHEN "f5"   SET F5  TO TRUE
             WHEN OTHER
                  MOVE CWBOXC-OPTION (1: 4) TO PAGINA
                  MOVE CWBOXC-OPTION (5: 2) TO OPCAO
                  MOVE "99"   TO CWCONF-REG99
                  MOVE PAGINA TO CWCONF-PAGINA
                  SET CWSQLC-READ TO TRUE
                  SET CWSQLC-EQUAL TO TRUE
                  SET CWSQLC-IGNORE-LOCK TO TRUE
                  CALL "CWCONF" USING CWSQLC
                                      CWCONF-REG
                                      FS-CWCONF
                                      KCO PCO
                  IF   FS-CWCONF NOT = "00"
                       CALL "CWCONF" USING "ISAM"
                       SET ESC TO TRUE
                  ELSE
                       PERFORM VARYING I FROM 1 BY 1
                               UNTIL I > 26
                             CALL "CWVARX" USING CWCONF-NM-OPCAO(I)
                                       LENGTH OF CWCONF-NM-OPCAO(I)
                             MOVE CWCONF-NM-OPCAO(I) TO TESTECHAR
                             IF   TESTECHAR = "/"
                                  MOVE CWCONF-NM-OPCAO (I) (3:  )
                                    TO WS-NM-OPCAO     (I)
                             ELSE
                                  MOVE CWCONF-NM-OPCAO(I)
                                    TO WS-NM-OPCAO    (I)
                             END-IF
                       END-PERFORM
                  END-IF
           END-EVALUATE
           SET  CWBOXC-DELETE  TO TRUE
           CALL "CWBOXC"    USING PARAMETROS-CWBOXC.
           MOVE SPACES         TO CWBOXC-OPTION.

       112-99-FIM. EXIT.

       115-SUBMENU.

           INITIALIZE SUBS
           MOVE SPACES TO F9-DATA

           EVALUATE NIVEL-ATUAL
                    WHEN 1 MOVE 063 TO CWBOXS-COLOR-FRAME
                                       CWBOXS-COLOR-BORDER
                    WHEN 2 MOVE 079 TO CWBOXS-COLOR-FRAME
                                       CWBOXS-COLOR-BORDER
                    WHEN 3 MOVE 095 TO CWBOXS-COLOR-FRAME
                                       CWBOXS-COLOR-BORDER
                    WHEN 4 MOVE 047 TO CWBOXS-COLOR-FRAME
                                       CWBOXS-COLOR-BORDER
                    WHEN 5 MOVE 031 TO CWBOXS-COLOR-FRAME
                                       CWBOXS-COLOR-BORDER
           END-EVALUATE

           IF   HELP = 1
                CALL "CBL_WRITE_SCR_CHARS" USING X"0428"
                "Help                        "   X"001C"
           END-IF

           MOVE SPACES                   TO CWBOXS-TITLE
                                            CWBOXS-ITENS
           MOVE SUB-OPTION (NIVEL-ATUAL) TO CWBOXS-OPTION
      *    MOVE 0                        TO CWBOXS-OPTION
           MOVE 0                        TO Y

           MOVE 0        TO PAGINAX
           MOVE 7        TO SM-FIL
           MOVE 5        TO YP
           INITIALIZE SUB-CWCONF
           PERFORM VARYING IP FROM 20 BY -1
                   UNTIL IP = 0
                      OR SM-FIL < 1
                   IF IP = 20
                   AND SUB-PAGINA (NIVEL-ATUAL) (5:1) = ':'
                       MOVE 4 TO IP
                   END-IF
                   MOVE SUB-PAGINA (NIVEL-ATUAL) (IP: 1) TO TP
                   IF TP NUMERIC
                   AND YP > 1
                       SUBTRACT 1 FROM YP
                       MOVE     TP  TO PAGINAX (YP: 1)
                   ELSE
                       IF   TP = ","
                            MOVE PAGINAX TO SM-ATT (SM-FIL)
                            MOVE 0       TO PAGINAX
                            MOVE 5       TO YP
                            SUBTRACT 1 FROM SM-FIL
                       END-IF
                   END-IF
           END-PERFORM
           IF   SM-FIL NOT = 7
                MOVE PAGINAX TO SM-ATT (SM-FIL)
                IF  SM-FIL NOT = 1
                    COMPUTE U = (SM-FIL - 1) * 4 + 1
                    MOVE SUB-CWCONF (U: )      TO SUB-CWCONF-2
                    MOVE SUB-CWCONF-2          TO SUB-CWCONF
                    INSPECT SUB-CWCONF CONVERTING SPACE
                                               TO ZERO
                END-IF
           END-IF
           IF   SUB-CWCONF NOT = ZEROS
                MOVE SM-ATT (1) TO PAGINAX
           END-IF
           MOVE "SM"    TO CWCONF-REG99
           MOVE PAGINAX TO CWCONF-PAGINA
           SET CWSQLC-READ TO TRUE
           SET CWSQLC-EQUAL TO TRUE
           SET CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           IF   FS-CWCONF > "09"
                MOVE SPACES TO CWSEND-MSG CWSEND-SCREENS
                STRING "P�gina n�o existe: " DELIMITED SIZE
                        CWCONF-PAGINA        DELIMITED SIZE
                        INTO CWSEND-MSG
                CALL "CWSEND" USING PARAMETROS-CWSEND
                MOVE 0 TO CWBOXS-OPTION NIVEL-ATUAL
                MOVE "N" TO RESPOSTA
                perform exibe-moldura
                CALL "CWATCH"
                GO TO 115-99-FIM
           END-IF

           INITIALIZE MENU-WS
           SET CWSQLC-UPDATE TO TRUE
           CALL "CWCONF" USING CWSQLC CWGRPS-REG FS-CWGRPS KGR PGR
           MOVE 0 TO COLUMNS-CWBOXS LEGACY
NOVA>
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 26
                IF  CWCONF-NM-OPCAO (I) = ALL '_'
                    MOVE SPACES TO CWCONF-NM-OPCAO (I)
                    IF CWLEGACYMENU = "SKIP"
                       ADD  1      TO LEGACY
                    END-IF
                    EXIT PERFORM CYCLE
                END-IF
                INSPECT CWCONF-NM-OPCAO (I)
                        CONVERTING X"101A98" TO X"202020"
                MOVE CWCONF-NM-OPCAO (I) TO TESTECHAR
                IF   TESTECHAR = "/"
                     MOVE CWCONF-NM-OPCAO(I) (3:  ) TO WS-NM-OPCAO  (I)
                     MOVE CWCONF-NM-OPCAO(I) (2: 1) TO WS-OPCAO-CHAR(I)
                ELSE
                     MOVE CWCONF-NM-OPCAO(I)        TO WS-NM-OPCAO  (I)
                END-IF
                IF  WS-NM-OPCAO (I) NOT = SPACES
                AND CWCONF-PROG (I) = SPACES
                     MOVE WS-NM-OPCAO (I) TO CWBOXS-TITLE
                END-IF
                PERFORM 230-CHECK-ACESSO THRU 230-99-FIM
                IF  CWCONF-NIVEL (I) NOT NUMERIC
                    MOVE 0      TO CWCONF-NIVEL (I)
                END-IF
                IF   CWLEGACYMENU = "SKIP"
                AND  CWCONF-NO-OPCAO (I) > 50
                     ADD  1     TO LEGACY
                     MOVE SPACE TO CWCONF-PROG     (I)
                     MOVE 0     TO CWCONF-NO-OPCAO (I)
                END-IF
                IF  (CWCONF-NIVEL (I) > CHECK-NIVEL)
                OR  (WS-NM-OPCAO  (I) = SPACES)
                OR  (CWCONF-PROG  (I) = SPACES)
                     CONTINUE
                ELSE
                     ADD  1           TO Y WS-OP LEGACY
                     MOVE Y           TO LINES-CWBOXS
                     CALL "CWVARX" USING WS-NM-OPCAO     (I)
                               LENGTH OF WS-NM-OPCAO     (I)
                     MOVE WS-NM-OPCAO     (I) TO WS-BOXS-TEXT  (Y)
                                                 TESTE-CWBOXS
                     MOVE WS-OPCAO-CHAR   (I) TO WS-BOXS-CHAR  (Y)
                     MOVE I                   TO SUBOC         (Y)
                     MOVE CWCONF-PROG     (I) TO PROGRAMA
                     MOVE CWCONF-HELP     (I) TO RELATORIO
                     CALL "CWCODE" USING "D" CWCONF-SIZE-P-99  (I)
                                             CWCONF-FATOR-P-99 (I)
                                             PROGRAMA
                     CALL "CWVARX" USING PROGRAMA LENGTH OF PROGRAMA
                     INSPECT PROGRAMA CONVERTING
                                      MINUSCULAS TO MAIUSCULAS
                     IF   PROGRAMA = "CWBOXS" OR "GRBOXS"
Joadir                    IF (CWMENUPAGE = 'ON' OR 'ALL')
Joadir                       PERFORM VARYING IZ FROM 1 BY 1
Joadir                             UNTIL(CWCONF-HELP(I)(IZ:1) NUMERIC
Joadir                               AND CWCONF-HELP(I)(IZ:1) NOT = '0')
Joadir                              OR IZ > LENGTH CWCONF-HELP(I)
Joadir                               CONTINUE
Joadir                       END-PERFORM
Joadir                       MOVE SPACES TO TIT-WORK
Joadir                       STRING WS-BOXS-TEXT (Y) '('
Joadir                              DELIMITED BY SIZE
Joadir                              CWCONF-HELP (I)(IZ:)
Joadir                              DELIMITED BY SPACE
Joadir                              ')' DELIMITED BY SIZE
Joadir                              INTO TIT-WORK
Joadir                        EXEC COBOLware Pack
Joadir                             String TIT-WORK
Joadir                        END-EXEC
Joadir                        MOVE TIT-WORK TO WS-BOXS-TEXT (Y)
Joadir                    END-IF
                          MOVE X"1010" TO WS-BOXS-TEXT (Y) (77: 2)
                     END-IF
                     MOVE PROGRAMA            TO SUBPROG   (Y)
                     MOVE RELATORIO           TO SUBREL    (Y)
                     MOVE SPACES              TO PROGRAMA
                     MOVE 5                   TO YP
                     MOVE ALL "0"             TO SUBPAGINA (Y)
                     IF   SUBPROG (Y) = "CWBOXS" OR "GRBOXS"
                          MOVE CWCONF-HELP (I) TO SUBPAGINA (Y)
                     END-IF
                     IF  (CWLEGACYMENU NOT = "OFF")
                     AND (NOT POPUP-ON)
                          MOVE '~' TO LEGACY-TEXT
                          IF LEGACY < 10
                             MOVE LEGACY (2: 1) TO LEGACY-TEXT (2:  1)
                          ELSE
                             MOVE MAIUSCULAS (LEGACY - 9: 1)
                               TO LEGACY-TEXT (2:  1)
                          END-IF
                          MOVE LEGACY-TEXT (2: 1) TO WS-BOXS-CHAR  (Y)
                          MOVE 3                  TO L2
                          PERFORM VARYING L1 FROM 1 BY 1
                                    UNTIL L1 > LENGTH LEGACY-TEXT
                                       OR L2 = LENGTH LEGACY-TEXT
                                  IF WS-BOXS-TEXT (Y) (L1: 1) NOT = '~'
                                     ADD 1 TO L2
                                     MOVE WS-BOXS-TEXT (Y) (L1: 1)
                                       TO LEGACY-TEXT (L2: 1)
                                  END-IF
                          END-PERFORM
                          MOVE LEGACY-TEXT TO WS-BOXS-TEXT (Y)
                     END-IF
                END-IF
           END-PERFORM
           MOVE SPACES TO CWBOXS-ITENS
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > WS-OP
               IF  I < 22
                   IF ECHOPGM = 'ON'
                   AND (SUBPROG (I) (1:2) NOT = "CW")
                      MOVE SPACES TO CWBOXS-TEXT (I)
                      PERFORM VARYING II
                                 FROM LENGTH OF WS-BOXS-TEXT (I)
                                   BY -1 UNTIL II = 1
                                   OR WS-BOXS-TEXT (I) (II:1) <> " "
                              CONTINUE
                      END-PERFORM
                      STRING WS-BOXS-TEXT (I)(1:II)
                                 DELIMITED BY SIZE
                             "(" DELIMITED BY SIZE
                     SUBPROG (I) DELIMITED BY SPACE
                             ")" DELIMITED BY SIZE
                          INTO CWBOXS-TEXT (I)
                   ELSE
                      MOVE WS-BOXS-TEXT (I) TO CWBOXS-TEXT (I)
                   END-IF
                   MOVE CWBOXS-TEXT(I) TO TESTE-CWBOXS
                   PERFORM VARYING U FROM 34 BY -1
                             UNTIL BYTE-CWBOXS (U) NOT = SPACE
                                   OR U = 0
                           CONTINUE
                   END-PERFORM
                   IF   U > COLUMNS-CWBOXS
                        MOVE U TO COLUMNS-CWBOXS
                   END-IF
                   IF  I < 14
                       MOVE WS-BOXS-CHAR (I) TO CWBOXS-CHAR (I)
                   END-IF
               END-IF
           END-PERFORM
           MOVE CWBOXS-TITLE TO TESTE-CWBOXS
           PERFORM VARYING U FROM 34 BY -1
                     UNTIL BYTE-CWBOXS (U) NOT = SPACE
                           OR U = 0
                   CONTINUE
           END-PERFORM
           IF   U > COLUMNS-CWBOXS
                MOVE U TO COLUMNS-CWBOXS
           END-IF
           SET CWSQLC-CLOSE TO TRUE
           CALL "CWCONF" USING CWSQLC CWGRPS-REG FS-CWGRPS KGR PGR

           IF   POPUP-ON
                IF   OPCAO = 0
                     MOVE SUB-OPTION (NIVEL-ATUAL) TO OPCAO
                END-IF
                IF   OCX = 0
                     MOVE OPCAO TO OCX
                END-IF
                IF  (CWLINE-POSITION (OCX) = "0000")
                AND (SUB-POSITION (NIVEL-ATUAL) NOT = "0000")
                     MOVE SUB-POSITION (NIVEL-ATUAL)
                       TO CWLINE-POSITION (OCX)
                END-IF
                MOVE     CWLINE-POSITION-LINE   (OCX) TO CWBOXS-LINE
                MOVE     CWLINE-POSITION-COLUMN (OCX) TO CWBOXS-COLUMN
                MOVE     CWLINE-POSITION        (OCX)
                  TO     SUB-POSITION (NIVEL-ATUAL)
                SUBTRACT 2                            FROM CWBOXS-COLUMN
                COMPUTE N-POP = NIVEL-ATUAL - 1
                PERFORM N-POP TIMES
                        ADD 2  TO CWBOXS-LINE
                        ADD 5  TO CWBOXS-COLUMN
                END-PERFORM
                IF   BUTTON-ON
                     ADD 2 TO CWBOXS-LINE
                     ADD 2 TO CWBOXS-COLUMN
                END-IF
           ELSE
                COMPUTE CWBOXS-LINE  = NIVEL-ATUAL + 6
                COMPUTE CWBOXS-COLUMN = 6 + (8 * NIVEL-ATUAL)
           END-IF.

       115-SUBMENU-POPUP.

           IF   CWBOXS-ITENS NOT = SPACES
                IF  F54 = 0
                    IF   HELP = 0
                         MOVE "F1-Help  F5-Spool         Esc-Retorno"
                           TO RODAPE-2
                    ELSE
                         MOVE "F1-Menu         Esc-Retorno" TO RODAPE-2
                    END-IF
                    IF CWFRAME = SPACES
                       DISPLAY CWMENUD-2
                    ELSE
                       CALL CWFRAME USING 'R' RODAPE-2
                            ON EXCEPTION
                               DISPLAY CWMENUD-2
                       END-CALL
                    END-IF
                END-IF
                MOVE 0           TO F54
                MOVE "N"         TO CWBOXS-ERASE
                MOVE "S"         TO CWBOXS-KEY-ON
                MOVE SPACE       TO CWBOXS-ARROW
                                    ARROW
                IF   LINES-CWBOXS > 13
                     MOVE 13 TO LINES-CWBOXS
                END-IF
                PERFORM UNTIL (CWBOXS-LINE + LINES-CWBOXS) < 20
                        SUBTRACT 1 FROM CWBOXS-LINE
                END-PERFORM
                PERFORM UNTIL (CWBOXS-COLUMN + COLUMNS-CWBOXS) < 72
                      SUBTRACT 1 FROM CWBOXS-COLUMN
                END-PERFORM
                PERFORM 116-AJUSTA-POSICAO THRU 116-99-FIM
                     IF   ARROW2 = ">" OR "<"
                          MOVE 0     TO CWBOXS-OPTION
                                        SUB-OPTION (1)
                                        SUB-OPTION (2)
                                        SUB-OPTION (3)
                                        SUB-OPTION (4)
                                        SUB-OPTION (5)
                          MOVE SPACE TO ARROW2
                     END-IF
                IF   WS-OP < 14
                     CALL "CWBOXS"  USING PARAMETROS-CWBOXS
                ELSE
                     MOVE CWBOXS-TITLE TO CWBOXC-TITLE
                     MOVE 0 TO MAIOR
                     MOVE SPACES TO HOT-KEYS
                     MOVE "*"    TO HOT-KEYS (34:1)
                     PERFORM VARYING I FROM 1 BY 1 UNTIL I > WS-OP
                             PERFORM VARYING Y FROM 34 BY -1
                              UNTIL WS-BOXS-TEXT (I) (Y: 1) NOT = SPACE
                                     CONTINUE
                             END-PERFORM
                             IF   Y > MAIOR
                                  MOVE Y TO MAIOR
                             END-IF
                     END-PERFORM
                     SET CWBOXC-LOAD TO TRUE
                     MOVE 0 TO K
                     ADD  2 TO MAIOR
                     PERFORM VARYING I FROM 1 BY 1 UNTIL I > WS-OP
                        MOVE I (2: 2)                 TO CWBOXC-STRING-1
                        MOVE WS-BOXS-TEXT (I) (1: 34) TO CWBOXC-STRING-2
                        IF   WS-BOXS-TEXT (I) (77: 2) = X"1010"
                             IF  K = 0
                                 ADD  3 TO MAIOR
                                 MOVE 1 TO K
                             END-IF
                             MOVE MORE TO CWBOXC-STRING-2(MAIOR - 2:1)
                        END-IF
                        move cwboxc-string-2 to FUNCAO-NOVA
                        move spaces          to FUNCAO-PROGRAMA
                        MOVE 0                TO Y
                        PERFORM VARYING yy FROM 1 BY 1
                                  UNTIL yy > LENGTH OF FUNCAO-PROGRAMA
                                IF   FUNCAO-NOVA (yy: 1) NOT = X"7E"
                                     ADD 1 TO Y
                                     MOVE FUNCAO-NOVA     (yy: 1)
                                       TO FUNCAO-PROGRAMA (Y: 1)
                                ELSE
                                     MOVE FUNCAO-NOVA (yy + 1: 1)
                                       TO HOT-KEYS (I: 1)
                                          CWBOXC-STRING-1 (3:1)
                                END-IF
                        END-PERFORM
                        INSPECT FUNCAO-PROGRAMA CONVERTING "_" TO SPACE
                        move FUNCAO-PROGRAMA to cwboxc-string-2
                        CALL "CWBOXC"  USING PARAMETROS-CWBOXC
                     END-PERFORM
                     SET CWBOXC-POP-UP  TO TRUE
                     MOVE 1          TO CWBOXC-ORDER
                                        CWBOXC-RETURN
                     MOVE CWBOXS-OPTION TO CWBOXC-OPTION
      *              MOVE WS-BOXS-TEXT (CWBOXS-OPTION) TO CWBOXC-OPTION
                     move cwboxs-LINE   TO CWBOXC-LINE
                     add  1             TO CWBOXC-LINE
                     move cwboxs-COLUMN TO CWBOXC-COLUMN
                     move 13            TO CWBOXC-VERTICAL-LENGTH
                     move 0             to CWBOXC-STRING-1-LENGTH
                     move maior         TO CWBOXC-HORIZONTAL-LENGTH
                                           CWBOXC-STRING-2-LENGTH
                     move cwboxs-COLOR-FRAME     to CWBOXC-COLOR-FRAME
                     move cwboxs-COLOR-BORDER    to CWBOXC-COLOR-BORDER
                     move cwboxs-COLOR-SHADE     to CWBOXC-COLOR-SHADE
                     move cwboxs-COLOR-BARR-MENU
                                              to CWBOXC-COLOR-BARR-MENU
                     SET CWBOXC-FUNCTION-KEY TO TRUE
                     MOVE 0 TO CWBOXC-KEY
                     IF HOT-KEYS NOT = SPACES
                        DISPLAY "CWBOXS" UPON ENVIRONMENT-NAME
                        DISPLAY HOT-KEYS UPON ENVIRONMENT-VALUE
                     END-IF
                     MOVE "S"          TO CWBOXC-KEY-ON
                     CALL "CWBOXC"  USING PARAMETROS-CWBOXC
                     MOVE CWBOXC-KEY   TO CWBOXS-KEY
                     IF HOT-KEYS NOT = SPACES
                        MOVE SPACES TO HOT-KEYS
                        DISPLAY "CWBOXS" UPON ENVIRONMENT-NAME
                        DISPLAY HOT-KEYS UPON ENVIRONMENT-VALUE
                     END-IF
                     IF   CWBOXC-OPTION = SPACES
                          MOVE 0                    TO CWBOXS-OPTION
                     ELSE
                          IF CWBOXC-OPTION = '<' OR ">"
                             MOVE CWBOXC-OPTION TO CWBOXS-ARROW
                             MOVE SPACES TO CWBOXC-OPTION
                             MOVE 0      TO CWBOXS-OPTION
                          ELSE
                             MOVE CWBOXC-OPTION (1: 2) TO CWBOXS-OPTION
                          END-IF
                     END-IF
                     MOVE CWBOXC-KEY-ON TO CWBOXS-KEY-ON
                     MOVE CWBOXC-KEY    TO CWBOXS-KEY
                     SET CWBOXC-DELETE TO TRUE
                     CALL "CWBOXC"  USING PARAMETROS-CWBOXC
                END-IF
                MOVE CWBOXS-ARROW TO ARROW2
                MOVE 112          TO CWBOXS-COLOR-BARR-MENU
                MOVE 8            TO CWBOXS-COLOR-SHADE
                IF   NIVEL-ATUAL = 1
                     MOVE CWBOXS-ARROW TO ARROW
                END-IF
                MOVE CWBOXS-KEY  TO TECLA
                MOVE "Y"         TO CWBOXS-ERASE
                MOVE "N"         TO CWBOXS-KEY-ON
                MOVE 0           TO CWBOXS-KEY
                IF   F5
                OR   F1
                OR   F9
                     CALL "CBL_READ_SCR_CHATTRS" USING SCREEN-POSITION
                                                       CARACTER-BUFFER
                                                       ATTRIBUTE-BUFFER
                                                       STRING-LENGTH
                     MOVE 0 TO CWBOXS-OPTION
                     PERFORM 110-FUNCOES
                     IF   F5
                     OR  (F9 AND (F9-PROGRAM NOT = SPACES))
                          CALL "CBL_WRITE_SCR_CHATTRS" USING
                               SCREEN-POSITION
                               CARACTER-BUFFER
                               ATTRIBUTE-BUFFER
                               STRING-LENGTH
                     END-IF
                     GO TO 115-SUBMENU
                ELSE
                     IF   TECLA NOT = 0
                          GO TO 115-SUBMENU-POPUP
                     END-IF
                END-IF
           ELSE
                MOVE 0 TO CWBOXS-OPTION
           END-IF

           IF   CWBOXS-OPTION = 0
                IF   NIVEL-ATUAL > 1
                     CALL "CBL_WRITE_SCR_CHATTRS"
                           USING SCREEN-POSITION
                                 SUB-CHAR-S (NIVEL-ATUAL - 1)
                                 SUB-ATTR-S (NIVEL-ATUAL - 1)
                                 STRING-LENGTH
                END-IF
                IF   NIVEL-ATUAL > 1
                     SUBTRACT 1 FROM NIVEL-ATUAL
                     GO TO 115-SUBMENU
                ELSE
                     MOVE 0 TO NIVEL-ATUAL
                     MOVE "N" TO RESPOSTA
                     IF   NOFRAME = 0
                          PERFORM 131-DATE-TIME THRU 131-99-FIM
                          perform exibe-moldura
                     END-IF
                     CALL "CWATCH"
                     GO TO 115-99-FIM
                END-IF
           ELSE
                MOVE SUBOC (CWBOXS-OPTION) TO OC
                MOVE CWBOXS-OPTION         TO SUB-OPTION (NIVEL-ATUAL)
                IF  (SUBPROG (CWBOXS-OPTION) = "CWBOXS" OR "GRBOXS")
                OR   SENHA-ESPECIAL = "S"
                     MOVE "S"                     TO RESPOSTA
                     PERFORM 101-SENHA-ESPECIAL THRU 101-99-FIM
                     IF   RESPOSTA = "N"
                          GO TO 115-SUBMENU-POPUP
                     END-IF
                END-IF
                IF   SUBPROG (CWBOXS-OPTION) = "CWBOXS" OR "GRBOXS"
                     ADD 1 TO NIVEL-ATUAL
                     IF   NIVEL-ATUAL > 5
                          MOVE 5  TO NIVEL-ATUAL
                          MOVE 1  TO F54
                          MOVE SPACES TO CWSEND-SCREENS
                          MOVE "N�vel de menus secund�rios > 5"
                            TO CWSEND-MSG
                          CALL "CWSEND" USING PARAMETROS-CWSEND
                     ELSE
                          CALL "CBL_READ_SCR_CHATTRS"
                                USING SCREEN-POSITION
                                      SUB-CHAR-S (NIVEL-ATUAL - 1)
                                      SUB-ATTR-S (NIVEL-ATUAL - 1)
                                      STRING-LENGTH
                          CALL "CWATCH"
                          MOVE SUBPAGINA (CWBOXS-OPTION)
                            TO SUB-PAGINA (NIVEL-ATUAL)
                     END-IF
                     GO TO 115-SUBMENU
                ELSE
                     CALL "CBL_READ_SCR_CHATTRS" USING SCREEN-POSITION
                                                       SUB-CHAR
                                                       SUB-ATTR
                                                       STRING-LENGTH
                     MOVE SUBPROG (CWBOXS-OPTION) TO PROGRAMA
                     MOVE SUBREL  (CWBOXS-OPTION) TO RELATORIO
                     MOVE SUBOC   (CWBOXS-OPTION) TO OC
                     PERFORM TEXT-FUNCAO THRU FIM-TEXT-FUNCAO
                     perform limpa-tela
                     perform exibe-moldura
                     PERFORM 155-EXIBE-TPR8 THRU 155-99-FIM.

           IF   HELP = 1
                CALL "CBL_WRITE_SCR_CHARS" USING X"0428"
                "Help                        "   X"001C"
           END-IF.

       115-99-FIM. EXIT.

       116-AJUSTA-POSICAO.

           IF   SUB-CWCONF NOT = ZEROS
                IF   SM-ATT (2) NOT = 0
                     MOVE SM-ATT (2) TO CWBOXS-LINE
                END-IF
                IF   SM-ATT (3) NOT = 0
                     MOVE SM-ATT (3) TO CWBOXS-COLUMN
                END-IF
                IF   SM-ATT (4) NOT = 0
                     MOVE SM-ATT (4) TO CWBOXS-COLOR-FRAME
                END-IF
                IF   SM-ATT (5) NOT = 0
                     MOVE SM-ATT (5) TO CWBOXS-COLOR-BORDER
                END-IF
                IF   SM-ATT (6) NOT = 0
                     MOVE SM-ATT (6) TO CWBOXS-COLOR-SHADE
                END-IF
                IF   SM-ATT (7) NOT = 0
                     MOVE SM-ATT (7) TO CWBOXS-COLOR-BARR-MENU
                END-IF
           END-IF

           IF   CWCOLORBARR NOT = 0
                MOVE CWCOLORBARR TO CWBOXS-COLOR-BARR-MENU
           END-IF.

       116-99-FIM. EXIT.

       120-TIME.

           SET CWTIME-NORMAL      TO TRUE
           SET CWTIME-TODAY       TO TRUE
           CALL "CWTIME"       USING PARAMETROS-CWTIME
           SET CWTIME-WEEK        TO TRUE
           MOVE CWTIME-DATE-FINAL TO CWTIME-DATE
           CALL "CWTIME"       USING PARAMETROS-CWTIME.

       120-99-FIM. EXIT.

       130-GRAVA-CWLOGF.

           IF FROMGUI NOT = SPACES
              EXIT PARAGRAPH
           END-IF

           PERFORM 131-DATE-TIME THRU 131-99-FIM

           IF ((PROGRAMA (1: 5) = "CWMEN")
           AND (PROGRAMA NOT = "CWMENU"))
           OR ((PROGRAMA (1: 5) = "CWMEN")
           AND  FS-CWLOGF NOT = "73")
           OR   CWGETL-LOG = 0
           OR   HELP = 1
                EXIT PARAGRAPH
           END-IF

           IF  (PROGRAMA = 'CWREL2' OR 'XSDRUN')
           AND  RELATORIO NOT = SPACES
                MOVE PROGRAMA  TO XSDRUN
                MOVE RELATORIO TO PROGRAMA
           END-IF

           CALL "CWGETU" USING NOME TASK PROGRAMA "#"
           MOVE FUNCAO-PROGRAMA    TO OBS
           CALL "CWLOGW" USING "#" OBS.

       130-99-FIM. EXIT.

       131-DATE-TIME.

           SET CWTIME-REVERSED     TO TRUE
           SET CWTIME-TODAY        TO TRUE
           CALL "CWTIME"        USING PARAMETROS-CWTIME
           MOVE CWTIME-DATE-FINAL  TO HOJE
           SET CWTIME-NORMAL       TO TRUE
           SET CWTIME-TODAY        TO TRUE
           CALL "CWTIME"        USING PARAMETROS-CWTIME
           MOVE CWTIME-TIME-FINAL  TO CWTIME-TIME
           SET CWTIME-EDIT         TO TRUE
           MOVE CWTIME-DATE-FINAL  TO CWTIME-DATE
           CALL "CWTIME"        USING PARAMETROS-CWTIME
           MOVE CWTIME-DATE-EDITED TO DATA-DE-HOJE
           MOVE CWTIME-TIME-EDITED TO HORA.

       131-99-FIM. EXIT.

       140-CHECK-NOME.

           MOVE ZERO        TO HELP
           MOVE MENU-GERAL  TO FUNCAO-PROGRAMA
           MOVE SPACES      TO CHECK-PASS-3
           MOVE  CWGETL-LOG TO SET-LOG
           CALL "CWGETU" USING NOME TASK PROGRAMA SET-LOG

           MOVE QUADRO-L TO QUADRO
           PERFORM 146-SET-QUADRO
           PERFORM 105-GET-COLOR THRU 105-99-FIM
           IF   LOGON-TYPE = 1
                MOVE "N"    TO RESPOSTA
                GO TO 140-MASTER
           ELSE
                MOVE SPACES TO RESPOSTA
           END-IF
      *    DISPLAY TELA-NOME
           PERFORM 131-DATE-TIME THRU 131-99-FIM
           IF   NOFRAME = 0
                perform exibe-moldura
           END-IF
           IF   LOGON-TYPE = 3
                MOVE 1 TO LOGON-TYPE
           END-IF.

       LOGIN.

           IF  NOT NOME-OK
           OR  NOT SENHA-OK
               MOVE 1 TO ENTROU
               IF   NOME = "LOGON"
                    MOVE SPACES TO NOME
               END-IF
               MOVE 11 TO CWBOXW-LINE
               MOVE 20 TO CWBOXW-COLUMN
               MOVE 05 TO CWBOXW-VERTICAL-LENGTH
               MOVE 43 TO CWBOXW-HORIZONTAL-LENGTH
               MOVE 62 TO CWBOXW-COLOR-FRAME
                          CWBOXW-COLOR-BORDER
               SET CWBOXW-OPEN TO TRUE
               IF  (NOFRAME = 0 AND FROMGUI = SPACES)
               OR   NOME-C = SPACES
               OR   SENHA-C = SPACES
                    CALL "CWBOXW" USING PARAMETROS-CWBOXW
                    IF CWFRAME = SPACES
                       CALL "CBL_WRITE_SCR_CHARS" USING X"1602"
                                                         MSG-3
                                                         X"0046"
                    ELSE
                       DISPLAY (footline, 3) MSG-3 WITH SIZE 46
                    END-IF
                    CALL "CBL_WRITE_SCR_CHARS" USING X"0C16"
                                                     MSG-2
                                                     X"0009"
                    CALL "CBL_WRITE_SCR_CHARS" USING X"0E16"
                                                      "Senha  :"
                                                      X"0008"
               END-IF
               IF   (NOFRAME = 0 AND FROMGUI = SPACES)
luck           OR   NOME-C = SPACES
luck           OR   SENHA-C = SPACES
                    DISPLAY TELA-NOME2
                    SET CWBOXW-POPUP TO TRUE
               ELSE
                    SET CWBOXW-CLOSE TO TRUE
               END-IF
               IF   (NOFRAME = 0 AND FROMGUI = SPACES)
               OR   NOME-C = SPACES
               OR   SENHA-C = SPACES
                    CALL "CWBOXW" USING PARAMETROS-CWBOXW
               END-IF
               MOVE "N" TO CHECK-SENHA
           END-IF

           PERFORM UNTIL NOME-OK
                      OR RESPOSTA = "N"
                   IF   CHECK-NOME = "+"
                        MOVE "S" TO CHECK-NOME
                   END-IF
                   IF   NOME-C = SPACES
                        MOVE 1     TO PAGINA
                        MOVE 9999  TO ULTIMA-PAGINA
                        MOVE SPACE TO FLAG-OPCOES
                        CALL "CBL_WRITE_SCR_CHARS" USING X"0C16"
                                                         MSG-2
                                                         X"0009"
                        CALL "CBL_SET_CSR_POS" USING X"0C1F"
                        PERFORM 200-ESCAPE THRU 200-99-FIM
                        IF   CWMOUS-KEY NOT = 1
                             ACCEPT NOME AT 1332 WITH UPDATE
                                    BACK 7 FORE 0
                             ACCEPT TECLA FROM ESCAPE KEY
                        ELSE
                             MOVE CWMOUS-KEY TO TECLA
                        END-IF
                   ELSE
                        MOVE NOME-C TO NOME
                        IF  (NOFRAME = 0 AND FROMGUI = SPACES)
                             DISPLAY TELA-NOME2
                        END-IF
                        MOVE SPACES TO NOME-C
                   END-IF
                   IF   ESC
                        MOVE "N" TO RESPOSTA
                   ELSE
                        INSPECT NOME CONVERTING MINUSCULAS TO MAIUSCULAS
                        MOVE "PS" TO CWCONF-REG
                        MOVE NOME TO CWCONF-NOME
                        SET CWSQLC-READ TO TRUE
                        SET CWSQLC-EQUAL TO TRUE
                        SET CWSQLC-IGNORE-LOCK TO TRUE
                        CALL "CWCONF" USING CWSQLC
                                            CWCONF-REG
                                            FS-CWCONF
                                            KCO PCO
                        PERFORM 250-AJUSTA-TTY-NOME THRU 250-99-FIM
                        IF   NOME NOT = SPACES
                        AND  FS-CWCONF = "00"
                             CALL "CWMENL" USING FS-CWCONF
                                                 CWCONF-NOME
                                                 CWCONF-GRUPO
                             CANCEL "CWMENL"
                        END-IF
                        IF   FS-CWCONF NOT = "00"
                        OR   NOME = SPACES
                        OR   NOME = LOW-VALUES
                             MOVE "Informe nome do usu�rio."
                               TO CWSEND-MSG
                             IF   NOME NOT = LOW-VALUES
                             AND  NOME NOT = SPACES
                                  MOVE SPACES TO CWSEND-MSG
                                  PERFORM VARYING I FROM LENGTH NOME
                                              BY -1
                                           UNTIL NOME (I: 1) NOT = SPACE
                                          CONTINUE
                                  END-PERFORM
                                  STRING 'Usu�rio "' DELIMITED BY SIZE
                                        NOME (1: I) DELIMITED BY SIZE
                                  '" n�o autorizado.' DELIMITED BY SIZE
                                                INTO CWSEND-MSG
                             END-IF
                             CALL "CWSEND" USING PARAMETROS-CWSEND
                        ELSE
                             IF   CWCONF-SENHA = SPACES
                                  CALL "CWPASS" USING NOME
                                  CANCEL "CWPASS"
                                  MOVE "PS" TO CWCONF-REG
                                  MOVE NOME TO CWCONF-NOME
                                  SET CWSQLC-READ TO TRUE
                                  SET CWSQLC-EQUAL TO TRUE
                                  CALL "CWCONF" USING CWSQLC
                                                      CWCONF-REG
                                                      FS-CWCONF
                                                      KCO PCO
                                  SET SENHA-OK TO TRUE
                             END-IF
                             MOVE "S"          TO CHECK-NOME
                             MOVE CWCONF-GRUPO TO GRUPO
                             display 'cwsgroup' upon environment-name
                             display grupo      upon environment-value
                             MOVE CWCONF-NIVEL-PS TO CHECK-NIVEL
                             PERFORM 145-VALIDADE THRU 145-99-FIM
                        END-IF
                    END-IF
           END-PERFORM
      *    IF ESC
      *       MOVE "N" TO RESPOSTA
      *       GO TO 140-99-FIM
      *    END-IF
           IF  CWGETL-RETRY > 2
           AND(CWCONF-LOGIN-ERRO NOT LESS CWGETL-RETRY)
               IF  CWCONF-NIVEL-PS = 9
               AND HOJE > CWCONF-LOGIN-LAST
                   MOVE 0 TO CWCONF-LOGIN-ERRO
               ELSE
                   EXEC COBOLware Send
                        Message
                        "Senha expirada por viola��o de seguran�a."
                   END-EXEC
                   MOVE 2 TO EXPIRADA
               END-IF
           END-IF

           IF  CWCONF-BLOQUEADO = 1
               EXEC COBOLware Send
                  Message "Usu�rio bloqueado pelo administrador."
               END-EXEC
               MOVE "N" TO CHECK-NOME
           END-IF

           IF  (NOT NOME-OK)
           AND (RESPOSTA NOT = "N")
               GO TO LOGIN
           END-IF

           IF   (NOFRAME = 0 AND FROMGUI = SPACES)
                IF CWFRAME = SPACES
                   DISPLAY TELA-NOME
                ELSE
                   CALL CWFRAME USING 'N' TTY-NOME CURDIR
                END-IF
           END-IF
           DISPLAY "FSSERVER"  UPON ENVIRONMENT-NAME
           ACCEPT  FSSERVER    FROM ENVIRONMENT-VALUE
           IF  FSSERVER NOT = SPACES
               SET CWSQLC-READ TO TRUE
               SET CWSQLC-EQUAL TO TRUE
               MOVE "PS" TO CWCONF-REG
               MOVE NOME TO CWCONF-NOME
               CALL "CWCONF" USING CWSQLC
                                   CWCONF-REG
                                   FS-CWCONF
                                   KCO PCO
               IF  FS-CWCONF < "10"
                   MOVE CWCONF-SENHA   TO SENHA-AUTO
                   MOVE CWCONF-ESQUECI TO ESQUECI
                   CALL "CWFSPW" USING CWCONF-CHAVE
                                       CWCONF-SENHA
                                       CWCONF-SIZE-PS
                                       CWCONF-FATOR-PS
                                       CWCONF-ESQUECI-SIZE
                                       CWCONF-ESQUECI-FATOR
                                       CWCONF-ESQUECI
                   IF  (CWCONF-SENHA   NOT = SENHA-AUTO)
                   OR  (CWCONF-ESQUECI NOT = ESQUECI)
                        SET CWSQLC-REWRITE TO TRUE
                        CALL "CWCONF" USING CWSQLC
                                            CWCONF-REG
                                            FS-CWCONF
                                            KCO PCO
                   END-IF
               END-IF
           END-IF
           PERFORM UNTIL SENHA-OK
                   OR    RESPOSTA = "N" OR "\"
                   MOVE CWCONF-SENHA TO SENHA-AUTO
                   CALL "CWCODE" USING "D" CWCONF-SIZE-PS
                                           CWCONF-FATOR-PS
                                           SENHA-AUTO
                   INSPECT SENHA-AUTO CONVERTING MINUSCULAS
                                              TO MAIUSCULAS
                   IF   SENHA-C = SPACES
                        CALL "CBL_WRITE_SCR_CHARS" USING X"0E16"
                                                         "Senha  : "
                                                         X"0009"
                        CALL "CBL_SET_CSR_POS" USING X"0E1F"
                        PERFORM 200-ESCAPE THRU 200-99-FIM
                        IF   CWMOUS-KEY NOT = 1
                             MOVE SPACES TO SENHA
                             IF   CWGETL-AUTOPASS = 1
                                   ACCEPT SENHA
                                    AT 1532 WITH SECURE
                                            SIZE CWCONF-SIZE-PS
                                                 AUTO-SKIP
                                    BACK 7 FORE 0
                             ELSE
                                   ACCEPT SENHA
                                    AT 1532 WITH SECURE
                                    BACK 7 FORE 0
                             END-IF
                             ACCEPT TECLA FROM ESCAPE KEY
                        ELSE
                             MOVE CWMOUS-KEY TO TECLA
                        END-IF
                   ELSE
                        MOVE SENHA-C TO SENHA
                        MOVE SPACES  TO SENHA-C
                   END-IF
                   IF   ESC
                        MOVE "\"    TO RESPOSTA
                        MOVE SPACES TO SENHA
                        MOVE "N"    TO CHECK-NOME
                                       CHECK-SENHA
                   ELSE
                   INSPECT SENHA CONVERTING MINUSCULAS TO MAIUSCULAS
                   IF   CWCONF-PRINTER-DEFAULT = SPACES
                   OR   LOW-VALUES
                        MOVE "Spool" TO CWCONF-PRINTER-DEFAULT
                   END-IF
                   SET CWTIME-NORMAL       TO TRUE
                   SET CWTIME-TODAY        TO TRUE
                   CALL "CWTIME"        USING PARAMETROS-CWTIME
                   MOVE 0 TO SENHA-PROV
                   PERFORM VARYING I FROM 1 BY 1 UNTIL I > 30
                           IF   SENHA-X (I) NOT = 32
                                ADD SENHA-X (I) TO SENHA-PROV
                           END-IF
                   END-PERFORM
                   MOVE CWTIME-DATE-FINAL (8: 2) TO N
                   ADD  N                   TO SENHA-PROV
                   MOVE CWTIME-DATE-FINAL (1: 2) TO N
                   ADD  N                   TO SENHA-PROV
                   MOVE CWTIME-TIME-FINAL (1: 2) TO N
                   ADD  N                   TO SENHA-PROV
                   MOVE CWTIME-DATE-FINAL (3: 2) TO N
                   ADD  N                   TO SENHA-PROV
                   COMPUTE SENHA-PROV = (1 / SENHA-PROV) * 100000000
                   IF   SENHA = SENHA-AUTO
                   OR   SENHA (1: 6) = SENHA-PROV
                        IF   SENHA (1: 6) = SENHA-PROV
                             CALL "CWGETU" USING NOME TASK PROGRAMA "$"
                        ELSE
                             CALL "CWGETU" USING NOME TASK PROGRAMA "%"
                        END-IF
                        CALL "CWGETU" USING NOME TASK PROGRAMA "3"
                        MOVE 1                      TO LOGIN-FLAG
                        MOVE CWCONF-PRINTER-DEFAULT TO IMPRESSORA
                        MOVE "S"                    TO CHECK-SENHA
                        MOVE CWCONF-NIVEL-PS        TO CHECK-NIVEL
                        MOVE CWCONF-MODO-MENU       TO MODO-MENU
                        IF   MODO-MENU NOT NUMERIC
                             MOVE 0 TO MODO-MENU
                        END-IF
                        PERFORM 10A-RODAPE THRU 10A-99-FIM
                   ELSE
                    IF   CWCONF-LOGIN-ERRO < 3
                    AND (SENHA NOT = SPACES)
                         ADD 1 TO CWCONF-LOGIN-ERRO
                         SET CWSQLC-REWRITE TO TRUE
                         CALL "CWCONF" USING CWSQLC
                                             CWCONF-REG
                                             FS-CWCONF
                                             KCO PCO
                    END-IF
                    IF   SENHA = SPACES
                         MOVE "Informe sua senha." TO CWSEND-MSG
                         IF   CWCONF-ESQUECI NOT = SPACES
                              MOVE "__~OK"     TO CWSEND-SCREEN(1)
                              MOVE "~Esqueci"  TO CWSEND-SCREEN(2)
                         END-IF
                    ELSE
                         IF CWGETL-RETRY < 3
                            MOVE 0 TO CWCONF-LOGIN-ERRO
                         END-IF
                         PERFORM VARYING I FROM LENGTH NOME
                              BY -1 UNTIL I = 1
                                     OR (NOME (I:1) <> ' ')
                                 CONTINUE
                         END-PERFORM
                         MOVE SPACES TO OBS
                         STRING '"' DELIMITED BY SIZE
                                NOME(1:I) DELIMITED BY SIZE
                               '", com senha incorreta.'
                               DELIMITED BY SIZE
                           INTO OBS
                         CALL "CWLOGW" USING "#" OBS
                         EVALUATE CWCONF-LOGIN-ERRO
                             WHEN 1 THRU (CWGETL-RETRY - 2)
                                  MOVE
               "Senha incorreta, pode ser bloqueada se insistir."
                               TO CWSEND-MSG
                             WHEN (CWGETL-RETRY - 1)
                                  MOVE
                    "Senha incorreta, ser� bloqueada no pr�ximo erro."
                               TO CWSEND-MSG
                             WHEN CWGETL-RETRY
                                  MOVE "Senha incorreta, bloqueada."
                                    TO CWSEND-MSG
                                  MOVE SPACES TO OBS
                                  STRING '"' DELIMITED BY SIZE
                                         NOME(1:I) DELIMITED BY SIZE
                                        '", bloqueado pelo sistema'
                                        DELIMITED BY SIZE
                                    INTO OBS
                                  CALL "CWLOGW" USING "#" OBS
                             WHEN OTHER
                                  MOVE "Senha incorreta." TO CWSEND-MSG
                         END-EVALUATE
                    END-IF
                    CALL "CWSEND" USING PARAMETROS-CWSEND
                    MOVE SPACES TO SENHA SENHA-C
                    MOVE SPACES TO CWSEND-SCREENS
                    IF   CWSEND-OPTION = 2
                         CALL "CWCODE" USING "D" CWCONF-ESQUECI-SIZE
                                                 CWCONF-ESQUECI-FATOR
                                                 CWCONF-ESQUECI
                         PERFORM VARYING LEN-LEMBRETE FROM
                                 LENGTH OF CWCONF-RESPOSTA BY -1
                                 UNTIL CWCONF-RESPOSTA
                                 (LEN-LEMBRETE: 1) <> SPACE
                                  CONTINUE
                         END-PERFORM
                         EXEC COBOLware BoxDialog
                              LINE 11 COLUMN 22
                              HEADER "Lembrete da senha"
                              Caption(1) CWCONF-PERGUNTA
                              Size(1) LEN-LEMBRETE (Secure(1))
                              Data(1) ESQUECI-RESPOSTA;ESQUECI-RESPOSTA
                              Color 23
                         END-EXEC
                         INSPECT ESQUECI-RESPOSTA
                                 CONVERTING MINUSCULAS
                                         TO MAIUSCULAS
                         INSPECT ESQUECI-RESPOSTA
                                 CONVERTING ACENTOS-850
                                         TO ACENTOS-OFF
                         INSPECT CWCONF-RESPOSTA
                                 CONVERTING MINUSCULAS
                                         TO MAIUSCULAS
                         INSPECT CWCONF-RESPOSTA
                                 CONVERTING ACENTOS-850
                                         TO ACENTOS-OFF
                         IF   CWCONF-RESPOSTA = ESQUECI-RESPOSTA
                              CALL "CWCODE" USING "C"
                                                  CWCONF-ESQUECI-SIZE
                                                  CWCONF-ESQUECI-FATOR
                                                  CWCONF-ESQUECI
                              MOVE SPACES TO CWCONF-SENHA
                              SET CWSQLC-REWRITE TO TRUE
                              CALL "CWCONF" USING CWSQLC
                                                  CWCONF-REG
                                                  FS-CWCONF
                                                  KCO PCO
                              CALL "CWPASS" USING NOME
                              CANCEL "CWPASS"
                              SET CWSQLC-READ TO TRUE
                              SET CWSQLC-EQUAL TO TRUE
                              CALL "CWCONF" USING CWSQLC
                                                  CWCONF-REG
                                                  FS-CWCONF
                                                  KCO PCO
                              GO TO LOGIN
                         ELSE
                              EXEC COBOLware Send Message
                              "Resposta errada contate o administrador"
                              END-EXEC
                              SET CWSQLC-CLOSE TO TRUE
                              CALL "CWCONF" USING CWSQLC
                                                  CWCONF-REG
                                                  FS-CWCONF
                                                  KCO PCO
                              STOP RUN
                         END-IF
                    END-IF
                   END-IF
                   END-IF
           END-PERFORM

      *    IF ESC
      *       MOVE "N" TO RESPOSTA
      *       GO TO 140-99-FIM
      *    END-IF

           IF   NOME-OK
           AND  SENHA-OK
BORGH           MOVE 0 TO CWCONF-LOGIN-ERRO
ROGER           IF  CWBOXW-POPUP
ROGER           AND NOFRAME = 1
                    DISPLAY "CWCLEAR" UPON ENVIRONMENT-NAME
                    ACCEPT CWCLEAR  FROM ENVIRONMENT-VALUE
                    INSPECT CWCLEAR CONVERTING MINUSCULAS
                                          TO MAIUSCULAS
                    IF CWCLEAR NOT = "OFF"
                       DISPLAY (1, 1) ERASE
                    END-IF
ROGER           END-IF
                IF  EXPIRADA = 2
                    MOVE 1 TO EXPIRADA
                ELSE
                    MOVE 0 TO EXPIRADA
                END-IF
                MOVE HOJE TO CWCONF-LOGIN-LAST
                IF   CWCONF-DATA-SENHA = 0
                OR   CWCONF-DATA-SENHA = LOW-VALUES
                OR  (CWCONF-DATA-SENHA NOT NUMERIC)
                     MOVE HOJE TO CWCONF-DATA-SENHA
                ELSE
                     IF  EXPIRE NOT = 0
                         EXEC COBOLware Time (Interval) (AAAAMMDD)
                              Date CWCONF-DATA-SENHA
                              Date-Final HOJE
                              DAYS-FINAL;DIAS-SENHA
                         END-EXEC
                         IF   DIAS-SENHA > EXPIRE
                              EXEC COBOLware Send                             ^
           Message "Senha expirada op��es bloqueadas, altere sua senha."
                              END-EXEC
                              MOVE SPACES TO CWCONF-SENHA
                              SET CWSQLC-REWRITE TO TRUE
                              CALL "CWCONF" USING CWSQLC
                                                  CWCONF-REG
                                                  FS-CWCONF
                                                  KCO PCO
      *                       MOVE 1 TO EXPIRADA
                              CALL "CWPASS" USING NOME
                              CANCEL "CWPASS"
                              SET CWSQLC-READ TO TRUE
                              SET CWSQLC-EQUAL TO TRUE
                              CALL "CWCONF" USING CWSQLC
                                                  CWCONF-REG
                                                  FS-CWCONF
                                                  KCO PCO
                         END-IF
                     END-IF
                END-IF
                SET CWSQLC-REWRITE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           END-IF

      *    IF ESC
      *       MOVE "N" TO RESPOSTA
      *       GO TO 140-99-FIM
      *    END-IF

           IF   ENTROU = 1
           AND  NOME-OK
           AND  SENHA-OK
                CALL "CWLOCK" USING "L" NOME TASK
                MOVE 0                  TO ENTROU
           END-IF

           IF   RESPOSTA NOT = "N"
           AND  (NOFRAME = 0 AND FROMGUI = SPACES)
                DISPLAY CWMENUX
           END-IF.

       140-MASTER.

           IF   NOME-OK
           AND  SENHA-OK
           AND  COMMAREA01 = ALL X"B0"
                DISPLAY "CWCOMMAREA"    UPON ENVIRONMENT-NAME
                ACCEPT   CWCOMMAREA    FROM ENVIRONMENT-VALUE
                INSPECT  CWCOMMAREA  CONVERTING MINUSCULAS TO MAIUSCULAS
                IF  CWCOMMAREA = 'SPACES'
                OR  'SPACE'
                OR  'BRANCO'
                OR  'BRANCOS'
                OR  'ESPACOS'
                OR  'ESPACO'
                OR  'BLANK'
                OR  'BLANKS'
                    MOVE SPACES TO COMMAREA01
                                   COMMAREA02
                                   COMMAREA03
                                   COMMAREA04
                                   COMMAREA05
                                   COMMAREA06
                                   COMMAREA07
                                   COMMAREA08
                                   COMMAREA09
                                   COMMAREA10
                ELSE
                    MOVE ALL X"00" TO COMMAREA01
                                      COMMAREA02
                                      COMMAREA03
                                      COMMAREA04
                                      COMMAREA05
                                      COMMAREA06
                                      COMMAREA07
                                      COMMAREA08
                                      COMMAREA09
                                      COMMAREA10
                END-IF
                IF   CWGETL-MASTER NOT = SPACES
                     CALL CWGETL-MASTER USING COMMAREA01
                                              COMMAREA02
                                              COMMAREA03
                                              COMMAREA04
                                              COMMAREA05
                                              COMMAREA06
                                              COMMAREA07
                                              COMMAREA08
                                              COMMAREA09
                                              COMMAREA10
                          ON OVERFLOW
                             MOVE SPACES TO CWSEND-MSG
                             STRING "Imposs�vel executar o programa "
                                     DELIMITED BY SIZE
                                     CWGETL-MASTER DELIMITED BY SPACE
                             INTO CWSEND-MSG
                             CALL "CWSEND" USING PARAMETROS-CWSEND
                             END-CALL
                             STOP RUN
                     END-CALL
                     IF   COMMAREA01 (1: 4) = "ERRO"
                          CANCEL CWGETL-MASTER
                          MOVE ALL X"B0" TO COMMAREA01
                          MOVE SPACE     TO CHECK-NOME
                                            CHECK-SENHA
                          MOVE 0         TO LOGON-TYPE
                          GO TO 140-CHECK-NOME
                     END-IF
                END-IF
           END-IF

           IF   CWGETL-LOGIN NOT = SPACES
           AND  LOGIN-FLAG = 1
                MOVE 0 TO LOGIN-FLAG
                CALL CWGETL-LOGIN USING COMMAREA01
                                        COMMAREA02
                                        COMMAREA03
                                        COMMAREA04
                                        COMMAREA05
                                        COMMAREA06
                                        COMMAREA07
                                        COMMAREA08
                                        COMMAREA09
                                        COMMAREA10
                     ON OVERFLOW
                        MOVE SPACES TO CWSEND-MSG
                        STRING "Imposs�vel executar o programa "
                                DELIMITED BY SIZE
                                CWGETL-LOGIN DELIMITED BY SPACE
                        INTO CWSEND-MSG
                        CALL "CWSEND" USING PARAMETROS-CWSEND
                        END-CALL
                        STOP RUN
                END-CALL
                IF   COMMAREA01 (1: 4) = "ERRO"
                     MOVE SPACE     TO CHECK-NOME
                                       CHECK-SENHA
                     MOVE 0         TO LOGON-TYPE
                     GO TO 140-CHECK-NOME
                 END-IF
ZP               PERFORM 166-PERSONAL    THRU 166-99-FIM
           END-IF.

       140-99-FIM. EXIT.

       145-VALIDADE.

           IF   CWCONF-QUADRO-PS NUMERIC
                MOVE CWCONF-QUADRO-PS TO QUADRO
                PERFORM 146-SET-QUADRO
           END-IF

           IF   CWCONF-NIVEL-PS > 8
                GO TO 145-99-FIM
           END-IF

           MOVE "MX"              TO CWCONF-REGLG
           SET CWSQLC-READ        TO TRUE
           SET CWSQLC-EQUAL       TO TRUE
           SET CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           IF   FS-CWCONF < "10"
                MOVE CWCONF-MAXUSERS TO MAXUSERS
           END-IF

           IF   MAXUSERS NOT = 0
                CALL "CWLOGD" USING PARAMETROS-CWLOGD
                CANCEL "CWLOGD"
                IF   CWLOGD-USERS NOT < MAXUSERS
                     MOVE SPACES TO CWSEND-MSG
                     PERFORM VARYING I FROM 1 BY 1
                             UNTIL MAXUSERS (I: 1) NOT = "0"
                             CONTINUE
                     END-PERFORM
                     IF  MAXUSERS = 1
                         MOVE "Sistema monousu�rio ocupado"
                           TO CWSEND-MSG
                     ELSE
                          STRING "Excedeu o limite licenciado de "
                                  MAXUSERS (I: )
                                  " usu�rios simult�neos"
                                  DELIMITED BY SIZE
                            INTO CWSEND-MSG
                     END-IF
                     MOVE " ~Fechar_" TO CWSEND-SCREEN (1)
                     MOVE "~Detalhes" TO CWSEND-SCREEN (2)
                     PERFORM TEST AFTER UNTIL CWSEND-OPTION NOT = 2
                             CALL "CWSEND" USING PARAMETROS-CWSEND
                             IF   CWSEND-OPTION = 2
                                  CALL "CWLOGD"
                                  CANCEL "CWLOGD"
                             END-IF
                     END-PERFORM
                     MOVE SPACES TO CWSEND-SCREENS
                     MOVE "N"         TO CHECK-NOME
                     GO TO 145-ABORT
                END-IF
           END-IF

           SET CWSQLC-CLOSE TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           SET CWSQLC-UPDATE TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO.

       145-VALIDADE-RETRY.

           MOVE "VD" TO CWCONF-REGLG
           SET CWSQLC-READ TO TRUE
           SET CWSQLC-EQUAL TO TRUE
           SET CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO

           IF   FS-CWCONF < "10"
                SET CWTIME-REVERSED     TO TRUE
                SET CWTIME-TODAY        TO TRUE
                CALL "CWTIME"        USING PARAMETROS-CWTIME
                MOVE CWTIME-DATE-FINAL  TO VALIDADE
                IF  CWCONF-FLAG-2000 NOT = 1
                    MOVE 1                   TO CWCONF-FLAG-2000
                    MOVE CWCONF-OLD-VALIDADE TO CWCONF-VALIDADE
                    ADD  1900                TO CWCONF-VALIDADE
                    MOVE VALIDADE            TO CWCONF-ULTIMO-LOGIN-DATA
                    MOVE 99999999            TO CWCONF-VALIDADE-10
                                                CWCONF-VALIDADE-15
                                                CWCONF-VALIDADE-20
                    MOVE CWTIME-TIME-FINAL   TO CWCONF-ULTIMO-LOGIN-HORA
                    SET CWSQLC-REWRITE TO TRUE
                    CALL "CWCONF" USING CWSQLC
                                        CWCONF-REG
                                        FS-CWCONF
                                        KCO PCO
                END-IF
                MOVE CWTIME-TIME-FINAL        TO LOGIN-HORA
                MOVE CWCONF-VALIDADE          TO VALIDADE2
                MOVE CWCONF-ULTIMO-LOGIN-DATA TO ULTIMO-LOGIN-DATA
                MOVE CWCONF-ULTIMO-LOGIN-HORA TO ULTIMO-LOGIN-HORA
                MOVE CWCONF-VALIDADE          TO VALIDADE-ATIVA
                IF   CWCONF-VALIDADE-10 NOT = 99999999
                     MOVE CWCONF-VALIDADE-10 TO VALIDADE-ATIVA
                END-IF
                IF   CWCONF-VALIDADE-15 NOT = 99999999
                     MOVE CWCONF-VALIDADE-15 TO VALIDADE-ATIVA
                END-IF
                IF   CWCONF-VALIDADE-20 NOT = 99999999
                     MOVE CWCONF-VALIDADE-20 TO VALIDADE-ATIVA
                END-IF
                MOVE ULTIMO-LOGIN TO TOLERANCIA
                PERFORM 75 TIMES
                        IF   TOLERANCIA-MM = 0
                             MOVE 59 TO TOLERANCIA-MM
                             IF   TOLERANCIA-HH = 0
                                  MOVE 23 TO TOLERANCIA-HH
                                  SET CWTIME-REVERSED TO TRUE
                                  SET CWTIME-SUBTRACT-DAYS TO TRUE
                                  MOVE ULTIMO-LOGIN-DATA TO CWTIME-DATE
                                  MOVE 1 TO CWTIME-DAYS
                                  CALL "CWTIME" USING PARAMETROS-CWTIME
                                  MOVE CWTIME-DATE-FINAL
                                    TO TOLERANCIA-DATA
                             ELSE
                                  SUBTRACT 1 FROM TOLERANCIA-HH
                             END-IF
                        ELSE
                             SUBTRACT 1 FROM TOLERANCIA-MM
                        END-IF
                END-PERFORM
                IF   ESTE-LOGIN < TOLERANCIA
                AND  CWCONF-DESTRAVA = "S"
                AND  CWCONF-TENTATIVAS > 2
                     MOVE 0 TO CWCONF-TENTATIVAS
                     MOVE ESTE-LOGIN TO ULTIMO-LOGIN
                     SET CWSQLC-REWRITE TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWCONF-REG
                                         FS-CWCONF
                                         KCO PCO
                END-IF
                IF   ESTE-LOGIN < TOLERANCIA
                     DISPLAY 'COMPUTERNAME' UPON ENVIRONMENT-NAME
                     ACCEPT   COMPUTERNAME  FROM ENVIRONMENT-VALUE
                     IF COMPUTERNAME NOT = SPACES
                        MOVE SPACES TO OBS
                        STRING "Rel�gio/Calend�rio:" DELIMITED BY SIZE
                               COMPUTERNAME         DELIMITED BY SPACE
                          INTO OBS
                        CALL "CWLOGW" USING "#" OBS
                     END-IF
                     MOVE "Viola��o de seguran�a: (Rel�gio/Calend�rio)"
                       TO CWSEND-MSG
                     CALL "CWSEND" USING PARAMETROS-CWSEND
                     MOVE "N"         TO CHECK-NOME
                     IF  CWCONF-DESTRAVA = "S"
                         ADD 1 TO CWCONF-TENTATIVAS
                         SET CWSQLC-REWRITE TO TRUE
                         CALL "CWCONF" USING CWSQLC
                                             CWCONF-REG
                                             FS-CWCONF
                                             KCO PCO
                     END-IF
                     GO TO 145-ABORT
                END-IF
                IF   VALIDADE > VALIDADE-ATIVA
                OR   CWCONF-TRAVADO = "S"
                     MOVE "S" TO CWCONF-TRAVADO
                     SET CWSQLC-REWRITE TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWCONF-REG
                                         FS-CWCONF
                                         KCO PCO
                     MOVE "N"             TO CHECK-NOME
                     IF CWCONF-SENHA-ATIVACAO NUMERIC
                        IF   CWCONF-ULTIMO-LOGIN-DATA NUMERIC
                        AND  ESTE-LOGIN < ULTIMO-LOGIN
                             MOVE CWCONF-VALIDADE
                               TO CWCONF-ULTIMO-LOGIN-DATA
                             MOVE 0 TO CWCONF-ULTIMO-LOGIN-HORA
                             ADD 1 TO VALIDADE2-MM
                             IF VALIDADE2-MM > 12
                                MOVE 1 TO VALIDADE2-MM
                                ADD  1 TO VALIDADE2-AA
                             END-IF
                             MOVE VALIDADE2 TO VALIDADE
                        END-IF
                        PERFORM UNTIL
                                VALIDADE (1: 6) NOT > VALIDADE2 (1: 6)
                                ADD 1 TO VALIDADE2-MM
                                IF VALIDADE2-MM > 12
                                   MOVE 1 TO VALIDADE2-MM
                                   ADD  1 TO VALIDADE2-AA
                                END-IF
                        END-PERFORM
                        MOVE 14 TO CWBOXW-LINE
                        MOVE 26 TO CWBOXW-COLUMN
                        IF   CWCONF-EXIBE-LICENCA = "S"
                             MOVE 07 TO CWBOXW-VERTICAL-LENGTH
                        ELSE
                             MOVE 05 TO CWBOXW-VERTICAL-LENGTH
                        END-IF
                        MOVE 43 TO CWBOXW-HORIZONTAL-LENGTH
                        MOVE 78 TO CWBOXW-COLOR-FRAME
                                   CWBOXW-COLOR-BORDER
                        SET CWBOXW-OPEN TO TRUE
                        CALL "CWBOXW" USING PARAMETROS-CWBOXW
                        MOVE CWCONF-SENHA-ATIVACAO TO LICENCA
                        MOVE SPACES                TO MSG-AT1
                                                      MSG-AT2
                        MOVE 0                     TO CHAVE-ATIVACAO
                        STRING "Prazo de validade vencido em "
                                VALIDADE2-DD "/" VALIDADE2-MM
                                             "/" VALIDADE2-AA
                                       DELIMITED BY SIZE
                                                 INTO MSG-AT1
                        STRING "Licen�a: "
                                LICENCA DELIMITED BY SIZE
                                                 INTO MSG-AT2
                        MOVE SPACES                   TO MSG-AT3
                        move VALIDADE2 to CWCONF-VALIDADE
                        PERFORM UNTIL VALIDADE < VALIDADE2
                                ADD 1 TO VALIDADE2-MM
                                IF VALIDADE2-MM > 12
                                   MOVE 1 TO VALIDADE2-MM
                                   ADD  1 TO VALIDADE2-AA
                                END-IF
                        END-PERFORM
                        STRING  "Chave de ativa��o at� "
                                VALIDADE2-DD "/" VALIDADE2-MM
                                             "/" VALIDADE2-AA ": "
                                       DELIMITED BY SIZE
                                                 INTO MSG-AT3
txt   *                 CALL "CWTEXT" USING MSG-AT LENGTH OF MSG-AT
                        CALL X"E5"
                        IF   CWFONE NOT = SPACES
                             PERFORM VARYING F FROM LENGTH OF CWFONE
                                         BY -1 UNTIL F = 1
                                           OR CWFONE (F: 1) NOT = SPACE
                                     CONTINUE
                             END-PERFORM
                             CALL "CWMSGW" USING PFONE CWFONE
                        END-IF
                        DISPLAY "CWACTF" UPON ENVIRONMENT-NAME
                        MOVE SPACES TO LB-TEXTO
                        ACCEPT LB-TEXTO  FROM ENVIRONMENT-VALUE
                        IF LB-TEXTO = SPACES
                           MOVE '$COBOLWARE/system.key'
                               TO LB-TEXTO
                        END-IF
                        OPEN INPUT TEXTO
                        IF FS-TEXTO = '00'
                           READ TEXTO INTO CHAVE-ATIVACAO(1:)
                           CLOSE TEXTO
                        END-IF
                        IF   CWCONF-EXIBE-LICENCA = "S"
                             CALL "CWMSGW" USING "162940" MSG-AT1
                             CALL "CWMSGW" USING "182940" MSG-AT2
                             CALL "CWMSGW" USING "202940" MSG-AT3
                             IF FS-TEXTO NOT = '00'
                                ACCEPT CHAVE-ATIVACAO AT 2063
                                    WITH UPDATE REVERSE-VIDEO PROMPT
                             END-IF
                        ELSE
                             CALL "CWMSGW" USING "162940" MSG-AT1
                             CALL "CWMSGW" USING "182940" MSG-AT3
                             IF FS-TEXTO NOT = '00'
                                ACCEPT CHAVE-ATIVACAO AT 1863
                                    WITH UPDATE REVERSE-VIDEO PROMPT
                             END-IF
                        END-IF
                        SET CWBOXW-CLOSE TO TRUE
                        CALL "CWBOXW" USING PARAMETROS-CWBOXW
                        IF   CHAVE-ATIVACAO NOT = 0
                             MOVE CWCONF-VALIDADE TO CWACTV-VALIDADE
                             SET CWTIME-REVERSED     TO TRUE
                             SET CWTIME-REVERSE      TO TRUE
                             MOVE CWACTV-VALIDADE    TO CWTIME-DATE
                             CALL "CWTIME"     USING PARAMETROS-CWTIME
                             MOVE CWTIME-DATE-FINAL  TO CWACTV-VALIDADE
                             MOVE CWCONF-SENHA-ATIVACAO TO CWACTV-SENHA
                             CALL "CWACTV" USING PARAMETROS-CWACTV
                             IF   CHAVE-ATIVACAO = CWACTV-ATIVACAO
                             OR   CHAVE-ATIVACAO = CWACTV-ATIVACAO-10
                             OR   CHAVE-ATIVACAO = CWACTV-ATIVACAO-15
                             OR   CHAVE-ATIVACAO = CWACTV-ATIVACAO-20
                                  MOVE "N"            TO CWCONF-TRAVADO
                                  SET  CWTIME-NORMAL  TO TRUE
                                  SET  CWTIME-REVERSE TO TRUE
                                  EVALUATE CHAVE-ATIVACAO
                                      WHEN CWACTV-ATIVACAO
                                           MOVE 99999999
                                             TO CWCONF-VALIDADE-10
                                                CWCONF-VALIDADE-15
                                                CWCONF-VALIDADE-20
                                           MOVE VALIDADE2
                                             TO CWCONF-VALIDADE
                                      WHEN CWACTV-ATIVACAO-10
                                           MOVE 99999999
                                             TO CWCONF-VALIDADE-15
                                                CWCONF-VALIDADE-20
                                           MOVE CWACTV-VALIDADE-10
                                             TO CWTIME-DATE
                                           CALL "CWTIME"
                                          USING PARAMETROS-CWTIME
                                           MOVE CWTIME-DATE-FINAL
                                             TO CWCONF-VALIDADE-10
                                      WHEN CWACTV-ATIVACAO-15
                                           MOVE 99999999
                                             TO CWCONF-VALIDADE-10
                                                CWCONF-VALIDADE-20
                                           MOVE CWACTV-VALIDADE-15
                                             TO CWTIME-DATE
                                           CALL "CWTIME"
                                          USING PARAMETROS-CWTIME
                                           MOVE CWTIME-DATE-FINAL
                                             TO CWCONF-VALIDADE-15
                                      WHEN CWACTV-ATIVACAO-20
                                           MOVE 99999999
                                             TO CWCONF-VALIDADE-10
                                                CWCONF-VALIDADE-15
                                           MOVE CWACTV-VALIDADE-20
                                             TO CWTIME-DATE
                                           CALL "CWTIME"
                                          USING PARAMETROS-CWTIME
                                           MOVE CWTIME-DATE-FINAL
                                             TO CWCONF-VALIDADE-20
                                  END-EVALUATE
                                  SET CWSQLC-REWRITE TO TRUE
                                  CALL "CWCONF" USING CWSQLC
                                                      CWCONF-REG
                                                      FS-CWCONF
                                                      KCO PCO
                                  MOVE "S" TO CHECK-NOME
                                  IF   CHAVE-ATIVACAO NOT =
                                       CWACTV-ATIVACAO
                                       GO TO 145-VALIDADE-RETRY
                                  END-IF
                             ELSE
                                  CALL X"E5"
                                  MOVE SPACES TO CWSEND-SCREENS
                                  MOVE "Chave de ativa��o inv�lida"
                                    TO CWSEND-MSG
                                  CALL "CWSEND" USING PARAMETROS-CWSEND
                                  DELETE FILE TEXTO
                             END-IF
                        END-IF
                     ELSE
                        CALL X"E5"
                        MOVE SPACES TO CWSEND-SCREENS
                        MOVE "Prazo de validade vencido" TO CWSEND-MSG
                        CALL "CWSEND" USING PARAMETROS-CWSEND
                     END-IF
                ELSE
                     MOVE VALIDADE   TO CWCONF-ULTIMO-LOGIN-DATA
                     MOVE LOGIN-HORA TO CWCONF-ULTIMO-LOGIN-HORA
                     SET CWSQLC-REWRITE TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWCONF-REG
                                         FS-CWCONF
                                         KCO PCO
                END-IF
           END-IF.

       145-ABORT.

           SET CWSQLC-CLOSE TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO

           SET CWSQLC-UPDATE TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           MOVE "PS" TO CWCONF-REG
           MOVE NOME TO CWCONF-NOME
           SET CWSQLC-READ TO TRUE
           SET CWSQLC-EQUAL TO TRUE
           SET CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO.

       145-99-FIM. EXIT.

       146-SET-QUADRO.

           MOVE BASE-MOLDURA (QUADRO) TO MOLDURA
           IF CWBORDER NUMERIC
              MOVE CWBORDER TO MOLDURA
           END-IF
           MOVE "M"                   TO SET-LOG
           MOVE TASK                  TO SAVE-TASK
           COMPUTE TASK = QUADRO - 1
           CALL "CWGETU" USING NOME TASK PROGRAMA SET-LOG
           MOVE SAVE-TASK             TO TASK
           MOVE SPACES                TO HORIZONTAL
           INSPECT HORIZONTAL CONVERTING SPACE TO M-205.

       150-CWCONFIGURA.

           MOVE MENU-GERAL    TO FUNCAO-PROGRAMA
           MOVE " Configurar" TO CWBOXS-TITLE
           MOVE 22            TO CWBOXS-LINE
           MOVE 08            TO CWBOXS-COLUMN
           MOVE SPACES        TO CWBOXS-ITENS
           MOVE CFG           TO CWBOXS-OPTION
           MOVE 110           TO CWBOXS-COLOR-FRAME
                                 CWBOXS-COLOR-BORDER
           MOVE "Y"           TO CWBOXS-ERASE
      *    MOVE TIPO-MENU (MODO-MENU + 2) TO TIPO-CF (8) (2: )
           MOVE TIPO-MENU (MODO-MENU + 2) TO TIPO-CF (8)
           COMPUTE CWBOXS-TYPE = QUADRO - 1
           MOVE ZEROS        TO CORRESPONDENCIAS
           MOVE 0            TO Y
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 17
                   IF   NIVEL (I) NOT > CHECK-NIVEL
                        ADD  1           TO Y
                        MOVE TIPO-CF (I) TO CWBOXS-TEXT (Y)
                        MOVE I           TO CORRESP     (Y)
                        SUBTRACT 1     FROM CWBOXS-LINE
                   END-IF
           END-PERFORM

           IF   CWBOXS-OPTION > Y
                MOVE Y TO CWBOXS-OPTION
           END-IF

           SET CWBOXS-EDIT-ON  TO TRUE
           CALL "CWBOXS" USING PARAMETROS-CWBOXS
           IF   CWBOXS-EDIT = 107
                STOP RUN
           END-IF
           IF   CWUNIX-ON
           AND  NOFRAME = 0
                DISPLAY WINDOWS
                perform exibe-moldura
                DISPLAY WINDOWS
                perform exibe-moldura
           END-IF
           IF   CWBOXS-OPTION NOT = 0
                MOVE CORRESP (CWBOXS-OPTION) TO OPCAO-2
                MOVE CWBOXS-OPTION           TO CFG
           IF   MUDA-COR
                IF   CHECK-NIVEL > 7
                     MOVE "G"          TO CWACOR-FUNCAO
                     MOVE "Y"          TO CWBOXS-ERASE
                     MOVE 11           TO CWBOXS-LINE
                                          CWBOXS-COLUMN
                     MOVE 2            TO CWBOXS-OPTION
                     MOVE SPACES       TO CWBOXS-ITENS
                     MOVE "Cores"      TO CWBOXS-TITLE
                     MOVE "Logon"      TO CWBOXS-TEXT   (1)
                                           CWBOXS-CHAR  (1)
                     MOVE "Usu�rio"    TO CWBOXS-TEXT   (2)
                                          CWBOXS-CHAR   (2)
                     MOVE NOME         TO CWBOXS-TEXT   (2) (9: )
                     CALL "CWBOXS"  USING PARAMETROS-CWBOXS
                     EVALUATE CWBOXS-OPTION
                         WHEN 1 MOVE "C" TO CWACOR-FUNCAO
                         WHEN 2 MOVE "U" TO CWACOR-FUNCAO
                     END-EVALUATE
                ELSE
                     MOVE "U" TO CWACOR-FUNCAO
                END-IF
                IF   CWBOXS-OPTION NOT = 0
                CALL "CWMENH" USING PARAMETROS-CWACOR
                      ON OVERFLOW
                         MOVE SPACES TO CWSEND-SCREENS
                         MOVE "Falha no overlay CWMENH " TO CWSEND-MSG
                         CALL "CWSEND" USING PARAMETROS-CWSEND END-CALL
                END-CALL
                CANCEL "CWMENH"
                END-IF
                perform exibe-moldura
           ELSE
           IF   MUDA-MOLDURA
                MOVE "Y"            TO CWBOXS-ERASE
                MOVE 11             TO CWBOXS-LINE
                                       CWBOXS-COLUMN
                MOVE M-O            TO CWBOXS-OPTION
                MOVE SPACES         TO CWBOXS-ITENS
                MOVE "Moldura"      TO CWBOXS-TITLE
                MOVE "Logon(x)"     TO CWBOXS-TEXT   (1)
                                       CWBOXS-CHAR   (1)
                MOVE QUADRO         TO QUADRO-U
                MOVE QUADRO-L       TO QUADRO
                PERFORM 146-SET-QUADRO
                MOVE QUADRO-L       TO CWBOXS-TEXT   (1) (7: 1)
                MOVE "Usu�rio"      TO CWBOXS-TEXT   (2)
                                       CWBOXS-CHAR   (2)
                MOVE NOME           TO CWBOXS-TEXT   (2) (9: )
                MOVE 0              TO CWBOXS-TYPE
                IF   CHECK-NIVEL = 9
                     CALL "CWBOXS" USING PARAMETROS-CWBOXS
                ELSE
                     MOVE 2           TO CWBOXS-OPTION
                END-IF
                MOVE QUADRO-U       TO QUADRO
                PERFORM 146-SET-QUADRO
                IF   CWBOXS-OPTION = 0
                     GO TO 150-CWCONFIGURA
                END-IF
                MOVE CWBOXS-OPTION TO M-O
                SET CWSQLC-UPDATE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                PERFORM TEST AFTER UNTIL FS-CWCONF NOT = "9D"
                        IF   CWBOXS-OPTION = 1
                             MOVE "00" TO CWCONF-REG00
                        ELSE
                             MOVE "PS" TO CWCONF-REG
                             MOVE NOME TO CWCONF-NOME
                        END-IF
                        SET CWSQLC-READ TO TRUE
                        SET CWSQLC-EQUAL TO TRUE
                        SET CWSQLC-LOCK TO TRUE
                        CALL "CWCONF" USING CWSQLC
                                            CWCONF-REG
                                            FS-CWCONF
                                            KCO PCO
                        IF   FS-CWCONF = "9D"
                             CALL "CWCONF" USING "ISAM"
                        END-IF
                END-PERFORM
                IF   CWBOXS-OPTION = 1
                     ADD  1 TO CWCONF-QUADRO
                     IF   CWCONF-QUADRO = 0
                          MOVE 1 TO CWCONF-QUADRO
                     END-IF
                     SET CWSQLC-REWRITE TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWCONF-REG
                                         FS-CWCONF
                                         KCO PCO
                     MOVE CWCONF-QUADRO TO QUADRO-L
                ELSE
                     IF   CWCONF-QUADRO-PS NOT NUMERIC
                          MOVE 0 TO CWCONF-QUADRO-PS
                     END-IF
                     ADD  1 TO CWCONF-QUADRO-PS
                     IF   CWCONF-QUADRO-PS = 0
                          MOVE 1 TO CWCONF-QUADRO-PS
                     END-IF
                     MOVE CWCONF-QUADRO-PS TO QUADRO
                     SET CWSQLC-REWRITE TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWCONF-REG
                                         FS-CWCONF
                                         KCO PCO
                     PERFORM 146-SET-QUADRO
                     perform exibe-moldura
                END-IF
                CALL "CWATCH"
                SET CWSQLC-CLOSE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                GO TO 150-CWCONFIGURA
           ELSE
           IF   MUDA-POPUP
                SET CWSQLC-UPDATE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                PERFORM TEST AFTER UNTIL FS-CWCONF NOT = "9D"
                        MOVE "PS" TO CWCONF-REG
                        MOVE NOME TO CWCONF-NOME
                        SET CWSQLC-READ TO TRUE
                        SET CWSQLC-EQUAL TO TRUE
                        SET CWSQLC-LOCK TO TRUE
                        CALL "CWCONF" USING CWSQLC
                                            CWCONF-REG
                                            FS-CWCONF
                                            KCO PCO
                        IF   FS-CWCONF = "9D"
                             CALL "CWCONF" USING "ISAM"
                        END-IF
                END-PERFORM
                ADD 1 TO MODO-MENU
                IF   MODO-MENU > 3
                     MOVE 0 TO MODO-MENU
                END-IF
                MOVE MODO-MENU TO CWCONF-MODO-MENU
                SET CWSQLC-REWRITE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                SET CWSQLC-CLOSE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                CANCEL "CWMOUS"
           ELSE
           IF   OVERLAY (OPCAO-2) NOT = SPACES
                MOVE    OVERLAY (OPCAO-2)  TO PROGRAMA
                MOVE    TIPO-CF2 (OPCAO-2) TO FUNCAO-PROGRAMA
                INSPECT FUNCAO-PROGRAMA CONVERTING "_" TO SPACE
                MOVE CWGETL-LOG            TO SET-LOG
                CALL "CWGETU" USING NOME TASK PROGRAMA SET-LOG
                perform exibe-funcao
                perform limpa-tela
                MOVE OVERLAY (OPCAO-2) TO PROGRAMA
                EXIT PROGRAM
           ELSE
           IF   MUDA-EMPRESA
                PERFORM 160-LER-00 THRU 160-99-FIM
                EXEC COBOLware BoxDialog
                     LINE 11 COLUMN 22
                     HEADER "Nome da empresa em"
                     Caption(1) "Telas     "
                     Caption(2) "Relat�rios"
                    Data(1) CWCONF-USUARIO  ;CWCONF-USUARIO   Size(1) 30
                    Data(2) CWCONF-USUARIO-P;CWCONF-USUARIO-P Size(2) 30
                     CANCEL OPT
                END-EXEC
                IF   OPT NOT = "Y"
                     PERFORM 165-GRAVA-00 THRU 165-99-FIM
                END-IF
                SET CWSQLC-CLOSE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           END-IF
           IF   MUDA-SENHA
                CALL "CWPASS" USING NOME "m"
                CANCEL "CWPASS"
           END-IF
           IF   MUDA-SISTEMA
                PERFORM 160-LER-00 THRU 160-99-FIM
                EXEC COBOLware BoxDialog
                     LINE 11 COLUMN 22
                     HEADER "Nome do sistema em"
                     Caption(1) "Telas     "
                     Caption(2) "Relat�rios"
                    Data(1) CWCONF-SISTEMA  ;CWCONF-SISTEMA   Size(1) 30
                    Data(2) CWCONF-SISTEMA-P;CWCONF-SISTEMA-P Size(2) 30
                     CANCEL OPT
                END-EXEC
                IF   OPT NOT = "Y"
                     PERFORM 165-GRAVA-00 THRU 165-99-FIM
                END-IF
                SET CWSQLC-CLOSE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           END-IF
           IF  MUDA-EMPRESA
           OR  MUDA-SISTEMA
               IF CWFRAME = SPACES
                  DISPLAY TEU TS
               ELSE
                  CALL CWFRAME USING 'I' USUARIO SISTEMA
                       ON EXCEPTION
                          DISPLAY CWMENUF
                          MOVE SPACES TO CWFRAME
                  END-CALL
               END-IF
           END-IF.

       150-99-FIM. EXIT.

       160-LER-00.

           SET CWSQLC-UPDATE TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           MOVE "00" TO CWCONF-REG00
           SET CWSQLC-READ TO TRUE
           SET CWSQLC-EQUAL TO TRUE
           SET CWSQLC-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC
                               CWCONF-REG
                               FS-CWCONF
                               KCO PCO
           CALL "CWCODE" USING "D" CWCONF-SIZE-U
                                   CWCONF-FATOR-00-U
                                   CWCONF-USUARIO
           CALL "CWCODE" USING "D" CWCONF-SIZE-S
                                   CWCONF-FATOR-00-S
                                   CWCONF-SISTEMA
           CALL "CWCODE" USING "D" CWCONF-SIZE-UP
                                   CWCONF-FATOR-00-UP
                                   CWCONF-USUARIO-P
           CALL "CWCODE" USING "D" CWCONF-SIZE-SP
                                   CWCONF-FATOR-00-SP
                                   CWCONF-SISTEMA-P.

       160-99-FIM. EXIT.

       165-GRAVA-00.

           PERFORM TEST AFTER UNTIL DD NOT EQUAL ZERO
                   ACCEPT HHMMSSDD FROM TIME
                   IF   DD = 0
                        MOVE SS TO DD
                   END-IF
           END-PERFORM
           MOVE LENGTH OF CWCONF-USUARIO TO CWCONF-SIZE-U CWCONF-SIZE-UP
                                            CWCONF-SIZE-S CWCONF-SIZE-SP
           CALL "CWCODE" USING "C" CWCONF-SIZE-U
                                   CWCONF-FATOR-00-U
                                   CWCONF-USUARIO
           CALL "CWCODE" USING "C" CWCONF-SIZE-S
                                   CWCONF-FATOR-00-S
                                   CWCONF-SISTEMA
           CALL "CWCODE" USING "C" CWCONF-SIZE-UP
                                   CWCONF-FATOR-00-UP
                                   CWCONF-USUARIO-P
           CALL "CWCODE" USING "C" CWCONF-SIZE-SP
                                   CWCONF-FATOR-00-SP
                                   CWCONF-SISTEMA-P
           SET CWSQLC-REWRITE TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           PERFORM 166-PERSONAL THRU 166-99-FIM.

       165-99-FIM. EXIT.

       166-PERSONAL.

           MOVE "00" TO CWCONF-REG
           SET CWSQLC-READ TO TRUE
           SET CWSQLC-EQUAL TO TRUE
           SET CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           MOVE CWCONF-USUARIO  TO USUARIO
           CALL "CWCODE" USING "D" CWCONF-SIZE-U
                                   CWCONF-FATOR-00-U
                                   USUARIO
           CALL "CWVARX" USING USUARIO LENGTH OF USUARIO
           MOVE CWCONF-SISTEMA  TO SISTEMA
           CALL "CWCODE" USING "D" CWCONF-SIZE-S
                                   CWCONF-FATOR-00-S
                                   SISTEMA
           CALL "CWVARX" USING SISTEMA LENGTH OF SISTEMA.

       166-99-FIM. EXIT.

       155-EXIBE-TPR8.

             IF   INISHOW = "ON"
                  DISPLAY "CWINI"  UPON ENVIRONMENT-NAME
                  ACCEPT  LB-FSINI FROM ENVIRONMENT-VALUE
                  DISPLAY LB-FSINI AT 2502 WITH SIZE 78
             END-IF
             DISPLAY "CWMENUPGM" UPON ENVIRONMENT-NAME
             DISPLAY  PROGRAMA   UPON ENVIRONMENT-VALUE
             IF   NOFRAME = 1
                  GO TO 155-99-FIM
             END-IF

             IF CWFRAME = SPACES
                DISPLAY BAIXO
             ELSE
                 CALL "CBL_GET_CSR_POS" USING CURSOR-POSITION
                 CALL CWFRAME USING 'P' PROGRAMA
                 CALL "CBL_SET_CSR_POS"  USING CURSOR-POSITION
                 GO TO 155-99-FIM
             END-IF
             MOVE PROGRAMA TO SAVE-PROGRAMA
             IF   PROGRAMA = "CWREL1" OR "CWREL2" OR "CWREL3"
                  MOVE "RELATOR" TO PROGRAMA
             END-IF
             IF  (NOT CWMENU-OLD)
             OR   PROGRAMA (1: 5) = "CWMEN"
             OR   PROGRAMA = "RELATOR"
                  CALL "CBL_GET_CSR_POS" USING CURSOR-POSITION
                  MOVE  8 TO TPI
                  MOVE 78 TO TPC
                  PERFORM UNTIL TPI = 0
                          MOVE PROGRAMA (TPI: 1) TO TESTECHAR
                          IF PROGRAMA (1: 5) = "CWMEN"
                          AND TPI = 6
                              MOVE "U" TO TESTECHAR
                          END-IF
                          IF TESTECHAR NOT = SPACE
                             DISPLAY TELA-TPI
                             SUBTRACT 1 FROM TPC
                          END-IF
                          SUBTRACT 1 FROM TPI
                  END-PERFORM
                  DISPLAY TELA-TPC
                  PERFORM UNTIL TPC < 71
                          SUBTRACT 1 FROM TPC
                          DISPLAY TELA-TPC2
                  END-PERFORM
                  CALL "CBL_SET_CSR_POS"  USING CURSOR-POSITION
             END-IF
             MOVE SAVE-PROGRAMA TO PROGRAMA.

       155-99-FIM. EXIT.

       170-CHECK-SPOOL.

           MOVE "03"       TO CWCONF-REG03
           MOVE IMPRESSORA TO CWCONF-ARQUIVO

           SET CWSQLC-READ        TO TRUE
           SET CWSQLC-EQUAL       TO TRUE
           SET CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO

           MOVE CWCONF-ARQUIVO      TO LB-PRNTER

           IF   FS-CWCONF < "10"
                MOVE "Impressora:" TO LB-PRNTER-2
                MOVE IMPR          TO LB-PRNTER-2 (13: )
           ELSE
                MOVE MSG-4 TO LB-PRNTER-2
          END-IF

          IF   NOFRAME = 0
               IF CWFRAME = SPACES
                  CALL "CBL_WRITE_SCR_CHARS" USING X"0428"
                                                   LB-PRNTER-2
                                                   X"001C"
               ELSE
                  CALL CWFRAME USING 'i' LB-PRNTER-2
               END-IF
          END-IF.

       170-99-FIM. EXIT.

       180-EXIBE-OPCOES.

           MOVE SPACES TO F9-DATA
           MOVE 7      TO CWLINE-LINE
           MOVE 4      TO CWLINE-COLUMN
           MOVE SPACES TO CWLINE-SCREENS
           MOVE "99"   TO CWCONF-REG
           MOVE PAGINA TO CWCONF-PAGINA
           SET CWSQLC-READ TO TRUE
           SET CWSQLC-EQUAL TO TRUE
           SET CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO

           MOVE LOW-VALUES TO PARAMETROS-CWMOUS
           MOVE SPACES     TO WS-OPCOES

           SET CWSQLC-UPDATE TO TRUE
           CALL "CWCONF" USING CWSQLC CWGRPS-REG FS-CWGRPS KGR PGR
           MOVE 0 TO LEGACY
           PERFORM VARYING I FROM 1 BY 1
                   UNTIL I > 26
                      OR FS-CWCONF NOT = "00"
                If  CWCONF-NM-OPCAO (I) = ALL '_'
                    MOVE SPACES TO CWCONF-NM-OPCAO (I)
                    IF  CWLEGACYMENU = "SKIP"
                        ADD  50 TO CWCONF-NO-OPCAO (I)
                        ADD  1  TO LEGACY
                    END-IF
                END-IF
                MOVE CWCONF-NM-OPCAO (I) TO TESTECHAR
                CALL "CWVARX" USING CWCONF-NM-OPCAO (I)
                          LENGTH OF CWCONF-NM-OPCAO (I)
                IF   TESTECHAR = "/"
                     MOVE CWCONF-NM-OPCAO(I) (3:  ) TO WS-NM-OPCAO  (I)
                     MOVE CWCONF-NM-OPCAO(I) (2: 1) TO WS-OPCAO-CHAR(I)
                ELSE
                     MOVE CWCONF-NM-OPCAO(I)        TO WS-NM-OPCAO  (I)
                END-IF
                IF   NOT POPUP-ON
                     MOVE 0      TO Y2
                     MOVE SPACES TO FUNCAO-PROGRAMA
                     PERFORM VARYING I2 FROM 1 BY 1
                               UNTIL I2 > LENGTH OF FUNCAO-PROGRAMA
                             IF WS-NM-OPCAO (I) (I2: 1) NOT = X"7E"
                                ADD 1 TO Y2
                                MOVE WS-NM-OPCAO (I) (I2: 1)
                                  TO FUNCAO-PROGRAMA (Y2: 1)
                             END-IF
                     END-PERFORM
                     MOVE FUNCAO-PROGRAMA TO WS-NM-OPCAO (I)
                     INSPECT FUNCAO-PROGRAMA CONVERTING "_" TO SPACE
                END-IF
                PERFORM 230-CHECK-ACESSO THRU 230-99-FIM
Joadi2          IF   CWMENUPAGE = 'ALL'
Joadir               MOVE CWCONF-PROG (I) TO PROGRAMA
Joadir               CALL "CWCODE" USING "D" CWCONF-SIZE-P-99  (I)
Joadir                                       CWCONF-FATOR-P-99 (I)
Joadir                                       PROGRAMA
Joadir               IF  (PROGRAMA = 'CWBOXS' OR 'GRBOXS'
Joadir                            OR 'CWPAGE' OR 'GRPAGE')
Joadir                  PERFORM VARYING IZ FROM 1 BY 1
Joadir                        UNTIL(CWCONF-HELP(I)(IZ:1) NUMERIC
Joadir                          AND CWCONF-HELP(I)(IZ:1) NOT = '0')
Joadir                         OR IZ > LENGTH CWCONF-HELP(I)
Joadir                          CONTINUE
Joadir                  END-PERFORM
Joadir                  MOVE SPACES TO TIT-WORK
Joadir                  STRING  WS-NM-OPCAO (I)'('
Joadir                         DELIMITED BY SIZE
Joadir                         CWCONF-HELP (I)(IZ:)
Joadir                         DELIMITED BY SPACE
Joadir                         ')' DELIMITED BY SIZE
Joadir                         INTO TIT-WORK
Joadir                   EXEC COBOLware Pack
Joadir                        String TIT-WORK
Joadir                        WIDTH Y
Joadir                   END-EXEC
Joadir                   MOVE TIT-WORK TO WS-NM-OPCAO (I)
Joadir               END-IF
Joadir          END-IF
                IF   CWCONF-NIVEL (I) NOT NUMERIC
                     MOVE 0 TO CWCONF-NIVEL (I)
pop             ELSE
pop                  ADD 1 TO LEGACY
                END-IF
                IF  (CWCONF-NIVEL (I) > CHECK-NIVEL)
                OR  (WS-NM-OPCAO  (I) = SPACES)
                     MOVE ALL " "  TO WS-NM-OPCAO (I)
                     MOVE ZERO     TO CWCONF-NO-OPCAO (I)
                ELSE
                     ADD  CWCONF-NO-OPCAO (I) TO TESTE-OPCAO
                     IF   CWCONF-NO-OPCAO (I) NOT = 0
                          MOVE LIN-MOUSE  (I) TO LX
                          MOVE COL-MOUSE  (I) TO CX
                          PERFORM VARYING Y FROM 34 BY -1
                                  UNTIL CWCONF-NM-OPCAO (I) (Y: 1)
                                        NOT = SPACE
                          END-PERFORM
                          IF   CWCONF-NO-OPCAO (I) < 10
                               ADD 2 TO Y
                               ADD 1 TO CX
                          ELSE
                               ADD 3 TO Y
                          END-IF
                          IF  NOT POPUP-ON
                              IF   CWCONF-NO-OPCAO (I) NOT NUMERIC
                                   MOVE 0 TO CWCONF-NO-OPCAO (I)
                              ELSE
                                   PERFORM Y TIMES
                                      MOVE CWCONF-NO-OPCAO (I)
                                               TO CWMOUS-POSIT (LX CX)
                                      ADD  200 TO CWMOUS-POSIT (LX CX)
                                      ADD  1   TO CX
                                   END-PERFORM
                              END-IF
                          END-IF
                     END-IF
                END-IF
           END-PERFORM
           INITIALIZE POPCOR
           IF   POPUP-ON
           AND  FS-CWCONF = "00"
                MOVE 0 TO OP-POP MAIOR
                PERFORM VARYING I FROM 1 BY 1 UNTIL I > 26
                        IF   CWCONF-NO-OPCAO (I) NOT NUMERIC
                             MOVE 0 TO CWCONF-NO-OPCAO (I)
                        END-IF
                        IF  (WS-NM-OPCAO (I) NOT = SPACES)
                        AND (CWCONF-PROG (I) NOT = SPACES)
                            IF   CWCONF-HELP (I) (1: 5) = "0000 "
                                 MOVE "9999" TO CWLINE-POSITION(I)
                            END-IF
                            ADD 1 TO OP-POP
                            MOVE WS-NM-OPCAO     (I)
                              TO CWLINE-SCREEN   (OP-POP)
                                 LINHA-COMANDO
                            MOVE WS-OPCAO-CHAR   (I)
                              TO CWLINE-CHAR     (OP-POP)
                            MOVE CWCONF-NO-OPCAO (I)
                              TO CORR-POP        (OP-POP)
                            IF BUTTON-ON
                               PERFORM VARYING TAMANHO FROM 34 BY -1
                                       UNTIL BYTE-L (TAMANHO) NOT = " "
                                       CONTINUE
                               END-PERFORM
                               PERFORM VARYING TAMANHO2
                                          FROM TAMANHO BY -1
                                       UNTIL TAMANHO2 = 1
                                       IF   BYTE-L (TAMANHO2) = "~"
                                            SUBTRACT 1 FROM TAMANHO
                                       END-IF
                               END-PERFORM
                               MOVE TAMANHO TO WS-TAMANHO-OPCAO (OP-POP)
                               IF   TAMANHO > MAIOR
                                    MOVE TAMANHO TO MAIOR
                               END-IF
                            END-IF
                        END-IF
                END-PERFORM
                PERFORM VARYING I FROM 1 BY 1
                          UNTIL I > 26
                             OR CWLINE-SCREEN (I) = SPACES
                             OR (NOT BUTTON-ON)
                        IF   WS-TAMANHO-OPCAO (I) < MAIOR
                             MOVE CWLINE-SCREEN (I) TO LINHA-COMANDO
                             MOVE SPACES            TO CWLINE-SCREEN (I)
                             COMPUTE Y =
                             ((MAIOR - WS-TAMANHO-OPCAO (I)) / 2) + 1
                             MOVE LINHA-COMANDO TO CWLINE-SCREEN (I)
                                                   (Y: )
                             INSPECT CWLINE-SCREEN (I) (1: MAIOR)
                                 CONVERTING " " TO "_"
                        END-IF
                END-PERFORM
           ELSE
                PERFORM VARYING I FROM 1 BY 1 UNTIL I > 26
                        IF  (CWCONF-NO-OPCAO (I) NOT NUMERIC)
                        OR   CWCONF-NO-OPCAO (I) > 50
                             MOVE 0 TO CWCONF-NO-OPCAO (I)
                        END-IF
                END-PERFORM
           END-IF

           IF   NOT POPUP-ON
                DISPLAY CWMENUB
           ELSE
                perform limpa-tela
           END-IF
           PERFORM 155-EXIBE-TPR8 THRU 155-99-FIM
           SET CWSQLC-CLOSE TO TRUE
           CALL "CWCONF" USING CWSQLC CWGRPS-REG FS-CWGRPS KGR PGR.

       180-99-FIM. EXIT.

       190-MUDA-PATH.

           MOVE    "73"                TO FS-CWLOGF
           PERFORM 130-GRAVA-CWLOGF  THRU 130-99-FIM
           MOVE    "00"                TO FS-CWLOGF
           MOVE MENU-GERAL             TO FUNCAO-PROGRAMA
           MOVE  CWCONF-HELP (OC)      TO HELP-PATH
           SET CWSQLC-CLOSE TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           PERFORM 220-REMOVE-OVERLAYS THRU 220-99-FIM
           MOVE    0                TO VEZ

           IF   HELP-PATH (1: 1) = "!"
                CANCEL 'CWATTR'
                CALL   'CWATTR'
                MOVE SPACES TO CWSEND-MSG
                               CWSEND-SCREENS
                STRING 'Vari�vel de ambiente ' DELIMITED BY SIZE
                                  HELP-PATH-99 DELIMITED BY SPACE
                       ' n�o configurada'      DELIMITED BY SIZE
                INTO CWSEND-MSG
                DISPLAY HELP-PATH-99 UPON ENVIRONMENT-NAME
                MOVE SPACES TO  HELP-PATH
                ACCEPT  HELP-PATH   FROM ENVIRONMENT-VALUE
                IF HELP-PATH = SPACES
                   CALL "CWSEND" USING PARAMETROS-CWSEND
                END-IF
           END-IF

           IF   HELP-PATH (1: 1) = "$"
                DISPLAY "CWCONF"  UPON ENVIRONMENT-NAME
                ACCEPT OLD-CWCONF FROM ENVIRONMENT-VALUE
                MOVE HELP-PATH (2: ) TO NEW-CWCONF
                DISPLAY NEW-CWCONF UPON ENVIRONMENT-VALUE
                SET CWSQLC-OPEN TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                IF   FS-CWCONF NOT = "00"
                     IF   FS-CWCONF = "30" OR "35"
                          MOVE SPACES      TO CWSEND-SCREENS
                          MOVE ERRO-CWCONF TO CWSEND-MSG
                          CALL "CWSEND" USING PARAMETROS-CWSEND
                     ELSE
                          CALL "CWCONF" USING "ISAM"
                     END-IF
                     DISPLAY "CWCONF"   UPON ENVIRONMENT-NAME
                     DISPLAY OLD-CWCONF UPON ENVIRONMENT-VALUE
                     PERFORM 000-INICIO THRU 050-INICIO
                     GO TO 190-99-FIM
                END-IF
                SET CWSQLC-CLOSE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                CANCEL 'CWLOGW'
                GO TO 190-RETRY
           END-IF
           IF   CWUNIX-OFF
                CALL "PC_READ_DRIVE"  USING OLD-DRIVE
                                            PRINTER-STATUS
           END-IF
           CALL "CBL_READ_DIR"   USING OLD-DIRECTORY
                                       SIZE-OLD-DIR
           MOVE OLD-DIRECTORY       TO NEW-DIRECTORY
           IF   CWUNIX-OFF
                MOVE "\"            TO OLD-DIRECTORY
           ELSE
                MOVE "/"            TO OLD-DIRECTORY
           END-IF
           MOVE NEW-DIRECTORY       TO OLD-DIRECTORY (2: )
           MOVE HELP-PATH (2: 1)    TO NEW-DRIVE

           IF   CWUNIX-ON
           OR  (NEW-DRIVE NOT = ":")
                MOVE HELP-PATH TO NEW-DIRECTORY
                                  ERRO-DIRECTORY (20: )
           ELSE
                IF   NEW-DRIVE = ":"
                     MOVE HELP-PATH (3: )    TO NEW-DIRECTORY
                                                ERRO-DIRECTORY (20: )
                     MOVE HELP-PATH (1: 1)   TO NEW-DRIVE
                                                ERRO-DRIVE (7: 1)
                     CALL "PC_SET_DRIVE"  USING NEW-DRIVE
                                      RETURNING RETURN-CODE
                     IF   RETURN-CODE NOT = 0
                          MOVE ERRO-DRIVE TO CWSEND-MSG
                          MOVE SPACES TO CWSEND-SCREENS
                          CALL "CWSEND" USING PARAMETROS-CWSEND
                          GO TO 190-99-FIM
                     END-IF
                     CANCEL "CWGETS"
                     CANCEL "CWGETL"
                END-IF
           END-IF

           IF   NEW-DIRECTORY NOT = SPACES
                CANCEL "CWGETS"
                CANCEL "CWGETL"
                INSPECT NEW-DIRECTORY CONVERTING X"20" TO X"00"
                CALL "CBL_CHANGE_DIR" USING NEW-DIRECTORY
                                  RETURNING RETURN-CODE
                IF   RETURN-CODE = 0
                     MOVE 0 TO RETRY-CWCONF
                     CALL "CWLOCK" USING "U" NOME TASK
                     CALL "CWLOCK" USING "M" NOME TASK PROGRAMA
                     IF  FSSERVER = SPACES
                         CANCEL 'CWLOGW'
                     END-IF
                ELSE
                     IF   CWUNIX-OFF
                          CALL "PC_SET_DRIVE"   USING OLD-DRIVE
                     END-IF
                     INSPECT OLD-DIRECTORY CONVERTING X"20" TO X"00"
                     CALL "CBL_CHANGE_DIR" USING OLD-DIRECTORY
                     INSPECT ERRO-DIRECTORY CONVERTING X"00" TO X"20"
                     MOVE 70              TO Y
                     PERFORM TEST AFTER
                            UNTIL Y = 1
                               OR ERRO-DIRECTORY (Y: 1) NOT = SPACES
                             SUBTRACT 1 FROM Y
                     END-PERFORM
                     ADD 2 TO Y
                     MOVE SPACES TO CWSEND-SCREENS
                     MOVE ERRO-DIRECTORY TO CWSEND-MSG
                     CALL "CWSEND" USING PARAMETROS-CWSEND
                     PERFORM 000-INICIO THRU 050-INICIO
                     GO TO 190-99-FIM
                END-IF
           END-IF.

       190-RETRY.

           IF   CHECK-PASS-3 = SPACES
                SET CWSQLC-UPDATE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                IF   FS-CWCONF NOT = "00"
                     IF   RETRY-CWCONF = 0
                     AND (FS-CWCONF = "30" OR "35")
                          CALL "CW3050"
                          GO TO 190-RETRY
                     END-IF
                     IF   CWUNIX-OFF
                          CALL "PC_SET_DRIVE"   USING OLD-DRIVE
                     END-IF
                     INSPECT OLD-DIRECTORY CONVERTING X"20" TO X"00"
                     CALL "CBL_CHANGE_DIR" USING OLD-DIRECTORY
                     MOVE SPACES TO CWSEND-SCREENS
                     MOVE ERRO-CWCONF TO CWSEND-MSG
                     CALL "CWSEND" USING PARAMETROS-CWSEND
                ELSE
                     MOVE 1    TO PAGINA
                     MOVE 0    TO SALVA-PAGINA
                                  RETRY-CWCONF
                     MOVE "PS" TO CWCONF-REG
                     MOVE NOME TO CWCONF-NOME
                     SET CWSQLC-READ TO TRUE
                     SET CWSQLC-EQUAL TO TRUE
                     SET CWSQLC-IGNORE-LOCK TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWCONF-REG
                                         FS-CWCONF
                                         KCO PCO
                     IF   FS-CWCONF > "09"
                     OR   CWCONF-BLOQUEADO = 1
                          MOVE SPACES TO CWSEND-MSG
                          STRING "Acesso do usu�rio " DELIMITED SIZE
                                  NOME                DELIMITED SPACE
                                  " n�o permitido !"  DELIMITED SIZE
                                  INTO CWSEND-MSG
                          MOVE 1            TO CWSEND-OPTION
                          MOVE "~Retorna"   TO CWSEND-SCREEN (1)
                          MOVE "~Encerra"   TO CWSEND-SCREEN (2)
                          MOVE " ~Outro"   TO CWSEND-SCREEN (3)
                          PERFORM TEST AFTER UNTIL CWSEND-OPTION NOT = 0
                                  CALL "CWSEND" USING PARAMETROS-CWSEND
                          END-PERFORM
                          EVALUATE CWSEND-OPTION
                              WHEN 1 SET CWSQLC-CLOSE TO TRUE
                                     CALL "CWCONF" USING CWSQLC
                                                         CWCONF-REG
                                                         FS-CWCONF
                                                         KCO PCO
                                     IF   HELP-PATH (1: 1) = "$"
                                          DISPLAY "CWCONF"
                                             UPON ENVIRONMENT-NAME
                                          DISPLAY OLD-CWCONF
                                             UPON ENVIRONMENT-VALUE
                                     ELSE
                                     IF   CWUNIX-OFF
                                          CALL "PC_SET_DRIVE"
                                             USING OLD-DRIVE
                                     END-IF
                                     CALL "CBL_CHANGE_DIR" USING
                                                           OLD-DIRECTORY
                                     END-IF
                                     GO TO 190-RETRY
                              WHEN 2 SET CWSQLC-CLOSE TO TRUE
                                     CALL "CWCONF" USING CWSQLC
                                                         CWCONF-REG
                                                         FS-CWCONF
                                                         KCO PCO
                                     IF   HELP-PATH (1: 1) NOT = "$"
                                     IF   CWUNIX-OFF
                                          CALL "PC_SET_DRIVE" USING
                                                              OLD-DRIVE
                                     END-IF
                                     CALL "CBL_CHANGE_DIR" USING
                                                           OLD-DIRECTORY
                                     END-IF
                                     STOP RUN
                              WHEN 3 MOVE "N" TO CHECK-NOME
                                                 CHECK-SENHA
                                     MOVE "LOGON" TO NOME
                                     CALL "CWTASK" USING "1" TASK
                                     CANCEL "CWTASK"
Mollo                                CALL "CWGETU" USING NOME TASK
Mollo                                                    PROGRAMA '9'
                          END-EVALUATE
                     ELSE
                         MOVE CWCONF-NIVEL-PS  TO CHECK-NIVEL
                         MOVE CWCONF-GRUPO     TO GRUPO
                         display 'cwsgroup' upon environment-name
                         display grupo     upon environment-value
                         MOVE CWCONF-MODO-MENU TO MODO-MENU
                         PERFORM 10A-RODAPE THRU 10A-99-FIM
                         CALL "CWTASK" USING "1" TASK
                         CANCEL "CWTASK"
Mollo                    CALL "CWGETU" USING NOME TASK PROGRAMA '9'
Mollo                    CANCEL 'CWGETL'
Mollo                    CALL "CWGETL" USING PARAMETROS-CWGETL
                         MOVE CWCONF-SENHA TO SENHA-AUTO
                         CALL "CWCODE" USING "D" CWCONF-SIZE-PS
                                                 CWCONF-FATOR-PS
                                                 SENHA-AUTO
                         INSPECT SENHA-AUTO
                                 CONVERTING MINUSCULAS TO MAIUSCULAS
                         IF   SENHA NOT = SENHA-AUTO
                              MOVE "N"  TO CHECK-SENHA
                              MOVE "+"  TO CHECK-NOME
                              MOVE NOME TO NOME-C
                         END-IF
                     END-IF
                END-IF
                PERFORM 220-REMOVE-OVERLAYS THRU 220-99-FIM
                SET CWSQLC-CLOSE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           ELSE
                CALL CHECK-PASS-3
                     ON OVERFLOW
                        MOVE SPACES TO CWSEND-MSG
                        STRING "Menu secund�rio n�o dispon�vel "
                               CHECK-PASS-3 DELIMITED BY SIZE
                               INTO CWSEND-MSG
                     CALL "CWSEND" USING PARAMETROS-CWSEND
                     END-CALL
                END-CALL
                CANCEL CHECK-PASS-3
                IF   CWUNIX-OFF
                     CALL "PC_SET_DRIVE"       USING OLD-DRIVE
                END-IF
                INSPECT OLD-DIRECTORY CONVERTING X"20" TO X"00"
                CALL "CBL_CHANGE_DIR"     USING OLD-DIRECTORY
            END-IF.

            MOVE   0             TO RETURN-CODE
            PERFORM 000-INICIO THRU 050-INICIO.

       190-99-FIM. EXIT.

       200-ESCAPE.

           CALL "CBL_GET_CSR_POS" USING CURSOR-POSITION
           IF CWFRAME = SPACES
              CALL "CBL_WRITE_SCR_CHARS" USING X"1602" MSG-3 X"0046"
           ELSE
              DISPLAY (footline, 3) MSG-3 WITH SIZE 46
           END-IF
           CALL "CBL_SET_CSR_POS" USING CURSOR-POSITION
           MOVE LOW-VALUES  TO PARAMETROS-CWMOUS
           MOVE ALL X"01" TO CWMOUS-LINE (footline) (03: 11)
           SET CWMOUS-TIMEOUT-ENABLE TO TRUE
           CALL "CWMOUS" USING PARAMETROS-CWMOUS
           IF   CWMOUS-TIMEOUT-ON
                MOVE 1 TO CWMOUS-KEY
           END-IF.

       200-99-FIM. EXIT.

       220-REMOVE-OVERLAYS.

           EXEC COBOLware OBJECT (DROP) END-EXEC
           COPY CWOVRL.

       220-99-FIM. EXIT.

       230-CHECK-ACESSO.

           IF  GRUPO = SPACES
               display 'cwsgroup' upon environment-name
               accept  grupo     from environment-value
           END-IF

           IF   I = 1
                MOVE 0                 TO OPCOES-VALIDAS
                MOVE "GU"              TO CWGRPS-REG
                MOVE GRUPO             TO CWGRPS-NOME-GRUPO
                SET CWSQLC-READ        TO TRUE
                SET CWSQLC-EQUAL       TO TRUE
                SET CWSQLC-IGNORE-LOCK TO TRUE
                CALL "CWCONF" USING CWSQLC CWGRPS-REG FS-CWGRPS KGR PGR
                IF   FS-CWGRPS < "09"
                     MOVE CWGRPS-ADM TO ADM
                END-IF
           END-IF

           IF  (GRUPO NOT = SPACES)
           AND (GRUPO NOT = "Acesso sem restri��es")
           AND (GRUPO NOT = "Acesso sem restri��es")
           AND (GRUPO NOT = "Acesso sem restricoes")
           AND (GRUPO NOT = "Acesso irrestrito")
           AND (CWCONF-PROG (I) NOT = SPACES)
                MOVE "GU"            TO CWGRPS-REG
                MOVE GRUPO           TO CWGRPS-NOME-GRUPO
                MOVE CWCONF-PROG (I) TO CWGRPS-PROG-GRUPO
                CALL "CWCODE" USING "D" CWCONF-SIZE-P-99  (I)
                                        CWCONF-FATOR-P-99 (I)
                                        CWGRPS-PROG-GRUPO
                CALL "CWVARX" USING CWGRPS-PROG-GRUPO
                          LENGTH OF CWGRPS-PROG-GRUPO
                INSPECT CWGRPS-REG CONVERTING MINUSCULAS TO MAIUSCULAS
                CALL "CWVARX" USING CWGRPS-PROG-GRUPO
                          LENGTH OF CWGRPS-PROG-GRUPO
                IF   CWGRPS-PROG-GRUPO = SPACES
                     MOVE SPACES TO CWCONF-PROG    (I)
                                    CWCONF-NM-OPCAO(I)
                     GO TO SKIP-VAR1
                END-IF
                IF   CWGRPS-PROG-GRUPO = "CWMENU" OR 'GRMENU'
                     ADD 1 TO OPCOES-VALIDAS
                     GO TO 230-99-FIM
                END-IF
                IF   CWGRPS-PROG-GRUPO = "CWBOXS" OR "GRBOXS"
                                      OR "CWPAGE" OR 'GRPAGE'
                     IF CWGRPS-PROG-GRUPO = "CWPAGE" OR 'GRPAGE'
                        MOVE ";"          TO CWGRPS-PROG-GRUPO (1: 1)
                     ELSE
                        MOVE ":"          TO CWGRPS-PROG-GRUPO (1: 1)
                     END-IF
                     MOVE CWCONF-HELP (I) TO CWGRPS-PROG-GRUPO (2: )
                     CALL "CWPAGE" USING CWGRPS-PROG-GRUPO
                                         GRUPO CHECK-NIVEL
                                         CWCONF-PROG (I)
                ELSE
                     IF   CWGRPS-PROG-GRUPO = "CWREL2" OR "XSDRUN"
                     AND (CWCONF-HELP (I) NOT = SPACES)
                          MOVE "*"  TO CWGRPS-PROG-GRUPO (1: 1)
                          MOVE CWCONF-HELP (I)
                            TO CWGRPS-PROG-GRUPO (2: )
                          INSPECT CWGRPS-PROG-GRUPO (2: )
                                  CONVERTING MINUSCULAS TO MAIUSCULAS
                     END-IF
                END-IF
                SET CWSQLC-READ TO TRUE
                SET CWSQLC-EQUAL TO TRUE
                SET CWSQLC-IGNORE-LOCK TO TRUE
                CALL "CWCONF" USING CWSQLC CWGRPS-REG FS-CWGRPS KGR PGR
                IF  (FS-CWGRPS < "09"
                AND  CWGRPS-ACESSO-GRUPO NOT = SPACE
                AND  ADM                 NOT = "I")
                OR  (FS-CWGRPS = "23"
                AND  ADM                     = "I")
                     MOVE SPACES TO WS-NM-OPCAO (I)
                                    CWCONF-PROG (I)
                     IF   CWLEGACYMENU = "SKIP"
                          ADD  50 TO CWCONF-NO-OPCAO (I)
                     ELSE
                          MOVE 0  TO CWCONF-NO-OPCAO (I)
                     END-IF
                ELSE
                     IF   FS-CWGRPS > "09"
                     AND  FS-CWGRPS NOT = "23"
                          CALL "CWCONF" USING "ISAM"
                     END-IF
                END-IF
          ELSE
                IF  CWCONF-PROG (I) NOT = SPACES
                    MOVE CWCONF-PROG (I) TO CWGRPS-PROG-GRUPO
                    CALL "CWCODE" USING "D" CWCONF-SIZE-P-99  (I)
                                            CWCONF-FATOR-P-99 (I)
                                            CWGRPS-PROG-GRUPO
                    CALL "CWVARX" USING CWGRPS-PROG-GRUPO
                              LENGTH OF CWGRPS-PROG-GRUPO
                    IF   CWGRPS-PROG-GRUPO = SPACES
                         MOVE SPACES TO CWCONF-PROG    (I)
                                        CWCONF-NM-OPCAO(I)
                    END-IF
                END-IF
           END-IF.

       SKIP-VAR1.

           IF   CWCONF-HELP (I) = "F9" OR "f9"
                MOVE CWCONF-NM-OPCAO (I) TO F9-TEXTO
                MOVE CWCONF-PROG     (I) TO F9-PROGRAM
                CALL "CWCODE" USING "D" CWCONF-SIZE-P-99  (I)
                                        CWCONF-FATOR-P-99 (I)
                                        F9-PROGRAM
                MOVE SPACES TO CWCONF-PROG (I)
                               CWCONF-NM-OPCAO (I)
                               CWCONF-HELP     (I)
           END-IF

           IF   CWCONF-PROG (I) NOT = SPACES
                ADD 1 TO OPCOES-VALIDAS
                IF   CWCONF-TIPO = "99"
                     PERFORM VARYING Y FROM 1 BY 1 UNTIL Y > 34
                             OR WS-NM-OPCAO (I) (Y: 1) = ":"
                                CONTINUE
                     END-PERFORM
                     MOVE SPACES TO EXTW
                     PERFORM VARYING Y2 FROM Y BY 1 UNTIL Y2 > 34
                                                        OR Y > 34
                             IF WS-NM-OPCAO (I) (Y2: 1) = "."
                                ADD 1 TO Y2
                                MOVE WS-NM-OPCAO (I) (Y2: )
                                  TO EXTW
                                INSPECT EXTW CONVERTING
                                        ';'  TO SPACE
                                INSPECT EXTW CONVERTING
                                        MINUSCULAS TO MAIUSCULAS
                                IF NOT EXTW-OK
                                   MOVE 34 TO Y
                                END-IF
                             END-IF
                     END-PERFORM
                     IF  Y < 34
                     AND EXTW-OK
                         ADD 1 TO Y
                         IF   WS-NM-OPCAO(i) (Y: ) NOT = SPACES
                              SUBTRACT 1 FROM Y
                              MOVE SPACES TO WS-NM-OPCAO(i) (Y: )
                              IF    CWCONF-HELP (I) (5:1) = ":"
                                    MOVE SPACES TO CWCONF-HELP(I)(5:)
                              END-IF
                         END-IF
                     END-IF
                 END-IF
           END-IF
           IF   I = 26
           AND  OPCOES-VALIDAS = 0
           AND  FLAG-OPCOES = SPACE
                MOVE ">" TO FLAG-OPCOES
           END-IF.

       230-99-FIM. EXIT.

       250-AJUSTA-TTY-NOME.

           MOVE SPACES TO TTY-NOME

           IF  (FS-CWCONF NOT = "00")
           OR   NOME = SPACES
           OR   NOME = LOW-VALUES
                IF   TTY = SPACES
                     MOVE "LOGON" TO TTY-NOME
                ELSE
                     STRING "LOGON(" DELIMITED BY SIZE
                                TTY  DELIMITED BY SPACE
                                ")"  DELIMITED BY SIZE
                       INTO TTY-NOME
                END-IF
           ELSE
                IF   TTY = SPACES
                     MOVE NOME TO TTY-NOME
                ELSE
                     PERFORM VARYING I FROM LENGTH OF NOME BY -1
                                       UNTIL NOME (I: 1) NOT = SPACE
                             CONTINUE
                     END-PERFORM
                     STRING NOME (1: I) DELIMITED BY SIZE
                                   "("  DELIMITED BY SIZE
                                   TTY  DELIMITED BY SPACE
                                   ")"  DELIMITED BY SIZE
                       INTO TTY-NOME
                END-IF
           END-IF
           PERFORM 251-CURDIR THRU 251-99-FIM
           ON 1 GO TO 250-99-FIM.
           IF   NOFRAME = 0
                IF CWFRAME = SPACES
                   PERFORM 131-DATE-TIME THRU 131-99-FIM
                   DISPLAY TELA-NOME
                           TELA-DIR
                ELSE
                   CALL CWFRAME USING 'N' TTY-NOME CURDIR
                END-IF
           END-IF.

       250-99-FIM. EXIT.

       251-CURDIR.

           MOVE SPACES TO CURDIR OLD-DIRECTORY
           CALL "CBL_READ_DIR"   USING OLD-DIRECTORY
                                       SIZE-OLD-DIR
           IF   CWUNIX-OFF
                CALL "PC_READ_DRIVE"  USING OLD-DRIVE
                                            PRINTER-STATUS
                STRING OLD-DRIVE DELIMITED BY SIZE
                       ":\" DELIMITED BY SIZE
                       OLD-DIRECTORY DELIMITED BY SPACE
                INTO CURDIR
           ELSE
                MOVE OLD-DIRECTORY TO CURDIR
           END-IF
           INSPECT CURDIR CONVERTING X"00" TO SPACE
           CALL "CWSETS" USING "S" "DIR" CURDIR.
rofer      CANCEL "CWGETL"
rofer      CALL "CWGETL" USING PARAMETROS-CWGETL
           IF   CWGETL-DIR NOT = 1
                MOVE SPACES TO CURDIR
           END-IF.

       251-99-FIM. EXIT.

       800-NEW-PRINTER.

           MOVE "00" TO CWCONF-REG
           SET CWSQLC-READ TO TRUE
           SET CWSQLC-EQUAL TO TRUE
           SET CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO

           MOVE CWCONF-EJECT-MODE-OLD TO EJECT-MODE-OLD
           MOVE "02PRN" TO CWCONF-REG
           SET CWSQLC-READ TO TRUE
           SET CWSQLC-EQUAL TO TRUE
           SET CWSQLC-IGNORE-LOCK TO TRUE
           CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
           IF   FS-CWCONF < "10"
                SET CWSQLC-CLOSE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                SET CWSQLC-UPDATE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE CWCONF-LABEL TO IMPRESSORA
                SET CWSQLC-DELETE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                MOVE "PS" TO CWCONF-REG
                SET CWSQLC-START TO TRUE
                SET CWSQLC-NOT-LESS TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                PERFORM TEST AFTER UNTIL CWCONF-TIPO NOT = "PS"
                                      OR FS-CWCONF = "10"
                        SET CWSQLC-READ TO TRUE
                        SET CWSQLC-NEXT TO TRUE
                        SET CWSQLC-IGNORE-LOCK TO TRUE
                        CALL "CWCONF" USING CWSQLC
                                            CWCONF-REG
                                            FS-CWCONF
                                            KCO PCO
                        IF   FS-CWCONF < "10"
                        AND  CWCONF-TIPO = "PS"
                             IF   IMPRESSORA = SPACES OR LOW-VALUES
                                  MOVE "Spool" TO IMPRESSORA
                             END-IF
                             MOVE IMPRESSORA
                               TO CWCONF-PRINTER-DEFAULT
                             MOVE SPACES TO CWCONF-PATH-SPOOL
                             SET CWSQLC-REWRITE TO TRUE
                             CALL "CWCONF" USING CWSQLC
                                                 CWCONF-REG
                                                 FS-CWCONF
                                                 KCO PCO
                        END-IF
                END-PERFORM
                IF   OLD-IMPRESSORA
                     MOVE "03"           TO CWCONF-REG03
                     MOVE EJECT-MODE-OLD TO CWCONF-EJECT-MODE-OLD
                     MOVE IMPRESSORA     TO CWCONF-ARQUIVO CWCONF-LABEL
                     SET CWSQLC-WRITE TO TRUE
                     CALL "CWCONF" USING CWSQLC
                                         CWCONF-REG
                                         FS-CWCONF
                                         KCO PCO
                END-IF
                SET CWSQLC-CLOSE TO TRUE
                CALL "CWCONF" USING CWSQLC CWCONF-REG FS-CWCONF KCO PCO
                SET CWSQLC-UPDATE TO TRUE
                CALL "CWCONF" USING CWSQLC
                                    CWCONF-REG
                                    FS-CWCONF
                                    KCO PCO.

       800-99-FIM. EXIT.

       AJUSTA.

           MOVE SPACES TO CWNUMERO
           MOVE 0      TO NUMERO
           ACCEPT CWNUMERO FROM ENVIRONMENT-VALUE
           MOVE 18 TO II
           PERFORM VARYING I FROM LENGTH OF CWNUMERO BY -1
                   UNTIL I = 0
                   IF  CWNUMERO (I: 1) NUMERIC
                       MOVE CWNUMERO (I: 1)
                         TO   NUMERO (II: 1)
                       SUBTRACT 1 FROM II
                   END-IF
           END-PERFORM.

       FIM-AJUSTA. EXIT.

       TEXT-FUNCAO.

           MOVE SPACES TO FUNCAO-PROGRAMA
           MOVE 0      TO II
           PERFORM VARYING I FROM 1 BY 1
                     UNTIL I > LENGTH OF CWBOXS-TEXT (CWBOXS-OPTION)
                   IF CWBOXS-TEXT (CWBOXS-OPTION) (I:1) NOT = X'7E'
                      ADD 1 TO II
                      MOVE CWBOXS-TEXT (CWBOXS-OPTION) (I:1)
                        TO FUNCAO-PROGRAMA (II: 1)
                   END-IF
           END-PERFORM
           INSPECT FUNCAO-PROGRAMA CONVERTING "_" TO SPACE.

       FIM-TEXT-FUNCAO. EXIT.
       exibe-moldura.

           IF CWFRAME = SPACES
              DISPLAY CWMENUA
           ELSE
              CALL CWFRAME USING 'F'
                   ON EXCEPTION
                      DISPLAY CWMENUA
                      MOVE SPACES TO CWFRAME
              END-CALL
           END-IF.

       fim-exibe-moldura. exit.
       limpa-tela.

           IF CWFRAME = SPACES
              DISPLAY CWMENUC
           ELSE
              CALL CWFRAME USING 'E'
                   ON EXCEPTION
                      DISPLAY CWMENUC
                      MOVE SPACES TO CWFRAME
              END-CALL
           END-IF.

       fim-limpa-tela. exit.
       exibe-funcao.

           IF CWFRAME = SPACES
              DISPLAY CWMENUF
           ELSE
              CALL CWFRAME USING 'O' FUNCAO-PROGRAMA LB-PRNTER-2
                   ON EXCEPTION
                      DISPLAY CWMENUF
                      MOVE SPACES TO CWFRAME
              END-CALL
           END-IF.

       fim-exibe-funcao. exit.
       END PROGRAM CWMEN0.

