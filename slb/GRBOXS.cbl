       WORKING-STORAGE SECTION.
       COPY CWBOXS.cpy.

       LINKAGE SECTION.

       01  PARAMETROS-GRBOXS.
           05 GRBOXS-LINE                    PIC  9(002).
           05 GRBOXS-COLUMN                  PIC  9(002).
           05 GRBOXS-TYPE                    PIC  9(001).
           05 GRBOXS-OPTION                  PIC  9(002).
           05 GRBOXS-OPTION-CHAR             PIC  X(001).
           05 GRBOXS-TITLE                   PIC  X(078).
           05 GRBOXS-SCREENS                            .
              10 GRBOXS-CHAR   OCCURS 21     PIC  X(001).
              10 FILLER                      PIC  X(001).
              10 GRBOXS-SCREEN OCCURS 21     PIC  X(078).
           05 GRBOXS-KEY-ON                  PIC  X(001).
           05 GRBOXS-KEY                     PIC  9(002).
           05 FILLER                         PIC  X(071).
           05 GRBOXS-COLOR-SCREENS    COMP-X PIC  9(002).
           05 GRBOXS-COLOR-FRAME      COMP-X PIC  9(002).
           05 GRBOXS-COLOR-SHADE      COMP-X PIC  9(002).
           05 GRBOXS-COLOR-BARR-MENU  COMP-X PIC  9(002).
           05 GRBOXS-ARROW                   PIC  X(001).
           05 GRBOXS-ERASE                   PIC  X(001).

       PROCEDURE DIVISION USING PARAMETROS-GRBOXS.

           MOVE GRBOXS-LINE            TO CWBOXS-LINE
           MOVE GRBOXS-COLUMN          TO CWBOXS-COLUMN
           MOVE GRBOXS-TYPE            TO CWBOXS-TYPE
           MOVE GRBOXS-OPTION          TO CWBOXS-OPTION
           MOVE GRBOXS-OPTION-CHAR     TO CWBOXS-OPTION-CHAR
           MOVE GRBOXS-TITLE           TO CWBOXS-TITLE
           MOVE GRBOXS-CHAR (01)       TO CWBOXS-CHAR (01)
           MOVE GRBOXS-CHAR (02)       TO CWBOXS-CHAR (02)
           MOVE GRBOXS-CHAR (03)       TO CWBOXS-CHAR (03)
           MOVE GRBOXS-CHAR (04)       TO CWBOXS-CHAR (04)
           MOVE GRBOXS-CHAR (05)       TO CWBOXS-CHAR (05)
           MOVE GRBOXS-CHAR (06)       TO CWBOXS-CHAR (06)
           MOVE GRBOXS-CHAR (07)       TO CWBOXS-CHAR (07)
           MOVE GRBOXS-CHAR (08)       TO CWBOXS-CHAR (08)
           MOVE GRBOXS-CHAR (09)       TO CWBOXS-CHAR (09)
           MOVE GRBOXS-CHAR (10)       TO CWBOXS-CHAR (10)
           MOVE GRBOXS-CHAR (11)       TO CWBOXS-CHAR (11)
           MOVE GRBOXS-CHAR (12)       TO CWBOXS-CHAR (12)
           MOVE GRBOXS-CHAR (13)       TO CWBOXS-CHAR (13)
           MOVE GRBOXS-CHAR (14)       TO CWBOXS-CHAR (14)
           MOVE GRBOXS-CHAR (15)       TO CWBOXS-CHAR (15)
           MOVE GRBOXS-CHAR (16)       TO CWBOXS-CHAR (16)
           MOVE GRBOXS-CHAR (17)       TO CWBOXS-CHAR (17)
           MOVE GRBOXS-CHAR (18)       TO CWBOXS-CHAR (18)
           MOVE GRBOXS-CHAR (19)       TO CWBOXS-CHAR (19)
           MOVE GRBOXS-CHAR (20)       TO CWBOXS-CHAR (20)
           MOVE GRBOXS-CHAR (21)       TO CWBOXS-CHAR (21)
           MOVE GRBOXS-SCREEN (01)     TO CWBOXS-TEXT (01)
           MOVE GRBOXS-SCREEN (02)     TO CWBOXS-TEXT (02)
           MOVE GRBOXS-SCREEN (03)     TO CWBOXS-TEXT (03)
           MOVE GRBOXS-SCREEN (04)     TO CWBOXS-TEXT (04)
           MOVE GRBOXS-SCREEN (05)     TO CWBOXS-TEXT (05)
           MOVE GRBOXS-SCREEN (06)     TO CWBOXS-TEXT (06)
           MOVE GRBOXS-SCREEN (07)     TO CWBOXS-TEXT (07)
           MOVE GRBOXS-SCREEN (08)     TO CWBOXS-TEXT (08)
           MOVE GRBOXS-SCREEN (09)     TO CWBOXS-TEXT (09)
           MOVE GRBOXS-SCREEN (10)     TO CWBOXS-TEXT (10)
           MOVE GRBOXS-SCREEN (11)     TO CWBOXS-TEXT (11)
           MOVE GRBOXS-SCREEN (12)     TO CWBOXS-TEXT (12)
           MOVE GRBOXS-SCREEN (13)     TO CWBOXS-TEXT (13)
           MOVE GRBOXS-SCREEN (14)     TO CWBOXS-TEXT (14)
           MOVE GRBOXS-SCREEN (15)     TO CWBOXS-TEXT (15)
           MOVE GRBOXS-SCREEN (16)     TO CWBOXS-TEXT (16)
           MOVE GRBOXS-SCREEN (17)     TO CWBOXS-TEXT (17)
           MOVE GRBOXS-SCREEN (18)     TO CWBOXS-TEXT (18)
           MOVE GRBOXS-SCREEN (19)     TO CWBOXS-TEXT (19)
           MOVE GRBOXS-SCREEN (20)     TO CWBOXS-TEXT (20)
           MOVE GRBOXS-SCREEN (21)     TO CWBOXS-TEXT (21)
           MOVE GRBOXS-KEY-ON          TO CWBOXS-KEY-ON
           MOVE GRBOXS-KEY             TO CWBOXS-KEY
           MOVE GRBOXS-COLOR-SCREENS   TO CWBOXS-COLOR-FRAME
           MOVE GRBOXS-COLOR-FRAME     TO CWBOXS-COLOR-BORDER
           MOVE GRBOXS-COLOR-SHADE     TO CWBOXS-COLOR-SHADE
           MOVE GRBOXS-COLOR-BARR-MENU TO CWBOXS-COLOR-BARR-MENU
           MOVE GRBOXS-ARROW           TO CWBOXS-ARROW
           MOVE GRBOXS-ERASE           TO CWBOXS-ERASE
           CALL "CWBOXS" USING PARAMETROS-CWBOXS
           MOVE CWBOXS-OPTION          TO GRBOXS-OPTION
           MOVE CWBOXS-OPTION-CHAR     TO GRBOXS-OPTION-CHAR
           MOVE CWBOXS-KEY             TO GRBOXS-KEY
           MOVE CWBOXS-ARROW           TO GRBOXS-ARROW
