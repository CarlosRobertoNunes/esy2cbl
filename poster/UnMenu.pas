unit UnMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, DB, ppDBPipe, DBClient, ppBands, inifiles,
  ppClass, ppPrnabl, ppCtrls, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, MidasLib, ComCtrls, Gauges,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, ComObj, ActiveX,
  IdMessageClient, IdSMTP, IdMessage, Menus, Printers, ZReport, //RDprint,
  ZRCtrls, OleServer, WordXP, ppTypes, ShellApi, {SendMail,}Registry, ZRPrntr,
  ppStrtch, ppMemo, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
  IdIntercept, IdExplicitTLSClientServerBase, IdSMTPBase, IdIOHandlerStack,
  IdSSL, WinInet, IdAttachmentFile, ppDesignLayer, ppParameter;

type
  TFrmPrintFile = class(TForm)
    Label5: TLabel;
    LbFormato: TLabel;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1idx: TIntegerField;
    ClientDataSet1Linha: TStringField;
    ppDBPipeline1: TppDBPipeline;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sobre1: TMenuItem;
    DataSource1: TDataSource;
    ppReport80_132: TppReport;
    ppDetailBand3: TppDetailBand;
    ppLinhaRelatorio: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppReport220: TppReport;
    ppDetailBand1: TppDetailBand;
    ppLinhaRelatorio2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    IdMessage1: TIdMessage;
    Localizar1: TMenuItem;
    OpenDialog1: TOpenDialog;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Memo1: TMemo;
    BtnFechar: TBitBtn;
    ZReport1: TZReport;
    ZReport1Detail: TZRBand;
    ZRLabel1: TZRLabel;
    ZReport1Group: TZRGroup;
    zrvLinha: TZRField;
    zrvidx: TZRField;
    Memo2: TMemo;
    RichEdit2: TRichEdit;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP1: TIdSMTP;
    procedure FormShow(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure ppDBPipeline1Next(Sender: TObject);
    procedure Localizar1Click(Sender: TObject); 
    procedure Sobre1Click(Sender: TObject);
    procedure IdSMTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeraPDF;
    procedure EnviarEmail;
    procedure ConfiguracaoInicial;
    procedure ImprimeMatricial;
  end;

  function ConverteStr(texto: string): string;
  function GetOrCreateObject (const ClassName: string): IDispatch;

var
  FrmPrintFile: TFrmPrintFile;
  TXT : TextFile;
  ArqConfig, ArqOrigem, ArqDestino, ArqTemp, LinhaAux, LinhaAux2: String;
  SizeRel:integer;
  Imprime:Boolean;
  i2,Contador,NroLinhasArq:integer;
  bCancela:Boolean;
  ArqIni : TIniFile;
  Stream : TMemoryStream;
  Localizar:Boolean=False;
  sTituloSistema:string;
  ErroEmail:integer;
  iGrupoAnt:integer;
  iFontSize : integer;
  Registro : TRegistry;

  //Campos para o envio de email
  ImpressaoDireta, Reenviar, Email:Boolean;

  sServidor, sUsuario, sSenha, sEnderecoEmail, sAssunto, sTexto,
  sFonte, sSender,sOutputFormat, sQuiet,sQuietWhenSendError,sOrientation,
  sFontSize, sTitle,sAttach, sKeepInfile, sKeepOutFileWhenEmail, sFontTexto,
  sEraseAttachs,sEraseText,sSMTPPort,sPrinterMode, sRequerSSL, sRequerAutenticacao,
  sDefaultSenderSoftware, sSpacing, sKeepIni,sPageHeight : String;

implementation

uses StrUtils, UnConversor, ppPrintr, UnSobre, UnEmail, ZREscape;

{$R *.dfm}

function GetOrCreateObject (const ClassName: string): IDispatch;
var
  ClassID: TGUID;
  Unknown: IUnknown;
begin
  ClassID := ProgIDToClassID (ClassName);
  if Succeeded (GetActiveObject (ClassID, nil, Unknown)) then
  OleCheck (Unknown.QueryInterface (IDispatch, Result))
  else
  Result := CreateOleObject (ClassName);
end;


procedure TFrmPrintFile.ConfiguracaoInicial;
begin
  try
    if AnsiUpperCase(sQuiet) <> 'YES' then
    begin
      FrmConversor:=TFrmConversor.Create(Application);
      FrmConversor.Gauge1.Progress:=0;
      FrmConversor.Show;
      Application.ProcessMessages;
    end;

    //Formata arquivo destino
    if (AnsiUpperCase(sOutputFormat) = 'PDF') or
       (AnsiUpperCase(sOutputFormat) = 'RTF') or
       (AnsiUpperCase(sOutputFormat) = 'HTML') or
       (AnsiUpperCase(sOutputFormat) = 'DOC') or
       (ImpressaoDireta) then
    begin
      GeraPDF;  //Gera os formatos

      if Email then EnviarEmail;

      if AnsiUpperCase(sKeepInfile) <> 'YES' then
        if FileExists(ArqOrigem) then DeleteFile(ArqOrigem);
    end
    else
    if (copy(sPrinterMode,1,4) = 'TEXT') then
      ImprimeMatricial
    else
    if Email then
    begin
      ArqDestino:=ArqOrigem;
      EnviarEmail;
    end;

    if AnsiUpperCase(sQuiet) <> 'YES' then
      FrmConversor.Close;

  finally
    Application.Terminate;
    Abort;
  end;

end;

procedure TFrmPrintFile.FormShow(Sender: TObject);
var i:integer;
    H : HWnd;
begin

  ErroEmail:=0;
  iGrupoAnt:=0;
  Email:=False;
  bCancela:=False;
  ImpressaoDireta:=False;

  if Length(ParamStr(1)) > 0 then
    ArqConfig:=ParamStr(1)
  else begin
    if not Localizar then
      ArqConfig:=ChangeFileExt(ExtractFileName(Application.ExeName), '.INI');
  end;

  sTituloSistema:='COBOLware Poster 1.2';
  LbFormato.Caption:=ChangeFileExt(ExtractFileName(Application.ExeName), '') + ' ' + ArqConfig;
  FrmPrintFile.Caption:=sTituloSistema;
  Application.ProcessMessages;

  if (copy(ArqConfig,2,1) <> ':') then
    ArqConfig:=GetCurrentDir + '\'+ArqConfig;

  if not FileExists(ArqConfig) then
    ArqConfig:=ChangeFileExt(ArqConfig, '.TXT');

  if FileExists(ArqConfig) then
  begin
    ArqIni := TIniFile.Create(ArqConfig);
    Try
      ArqOrigem:=UpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('INFILE'), '' ));
      ArqDestino:=UpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('OUTFILE'), '' ));

      if (copy(ArqDestino,1,3) = 'LPT') or
         (copy(ArqDestino,1,7) = 'PRINTER') or
         (copy(ArqDestino,1,7) = 'PREVIEW') or
         (copy(ArqDestino,1,4) = 'VIEW') or
         (copy(ArqDestino,1,2) = '\\') then
         ImpressaoDireta:=True;
         // OutFile=LPTx: ou PRINTER ou \\compartilhamento\imprrssora

      for i:=1 to length(ArqDestino) do
        if (ArqDestino[i] = '@') and (not Email) then Email:=True;

      if (not FileExists(ArqOrigem)) and
         (Trim(ArqOrigem) <> '')  then
        ArqOrigem:=ChangeFileExt(ArqOrigem, '.TXT');

      sEnderecoEmail:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('OUTFILE'), '');
      sAssunto:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('SUBJECT'), '');
      sServidor:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('SMTPSERVER'), '');
      sSender:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('SENDER'), '');
      sUsuario:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('USER'), '');
      sSenha:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('PASSWORD'), '');
      sRequerSSL := ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('SSL'), '');
      sRequerAutenticacao := ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('AUTHENTICATION'), '');
      sTexto:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('TEXT'), '');
      sFontTexto:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('TEXTFONT'), '');
      sAttach:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('ATTACH'), '');
      sTitle:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('TITLE'), '');
      sKeepIni:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('KEEPINI'), '');
      sKeepInfile:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                                 AnsiUpperCase('KEEPINFILE'), ''));

      sPageHeight:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                                 AnsiUpperCase('PAGEHEIGHT'), ''));

      // Acrescentado por C�ssio Osnir Louzada
      sFontSize:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                                 AnsiUpperCase('FONTSIZE'), ''));
      Try
        iFontSize := StrtoInt(sFontSize);
      Except
        iFontSize := 0;
      end;

      if iFontSize > 0 then
         ZReport1.Font.Size:=iFontSize;
      // Fim Acrescentado por C�ssio Osnir Louzada


      sKeepOutFileWhenEmail:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                                           AnsiUpperCase('KEEPOUTFILEWHENEMAIL'), ''));

      sFonte:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                            AnsiUpperCase('FONT'), ''));

      sOutputFormat:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                                   AnsiUpperCase('OUTPUTFORMAT'), ''));

      sQuiet:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                            AnsiUpperCase('QUIET'), ''));

      sQuietWhenSendError:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                                         AnsiUpperCase('QUIETWHENSENDERROR'), ''));

      sOrientation:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                                  AnsiUpperCase('ORIENTATION'), ''));

      sFontSize:=ArqIni.ReadString(AnsiUpperCase('CONFIG'), AnsiUpperCase('FONTSIZE'), '');

      sEraseAttachs:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                                   AnsiUpperCase('ERASEATTACHS'), ''));

      sEraseText:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                                AnsiUpperCase('ERASETEXT'), ''));

      sSMTPPort:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                               AnsiUpperCase('SMTPPORT'), ''));

      if Trim(sSMTPPort) = '' then
      begin
        sRequerSSL          := 'NO';
        sRequerAutenticacao := 'NO';
        sSMTPPort           := '25';
      end;

      sPrinterMode:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                                  AnsiUpperCase('PRINTERMODE'), ''));

      sDefaultSenderSoftware:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                                            AnsiUpperCase('DEFAULTSENDERSOFTWARE'), ''));

      sSpacing:=AnsiUpperCase(ArqIni.ReadString(AnsiUpperCase('CONFIG'),
                              AnsiUpperCase('SPACING'), ''));

      //  TextFont=Fonte do corpo do e-mail

      if ImpressaoDireta then sQuiet:= 'YES';

      if AnsiUpperCase(sQuiet) = 'YES' then
      begin
        LockWindowUpdate(FrmPrintFile.Handle);
        H := FindWindow(Nil,'Poster');
        if H <> 0 then ShowWindow(H,SW_HIDE);
        LockWindowUpdate(0);
      end;

      if Length(sTitle) <> 0 then
        sTituloSistema:=sTitle;

      if (copy(ArqOrigem,2,1) <> ':') and
         (Trim(ArqOrigem) <> '') then
         ArqOrigem:=GetCurrentDir + '\'+ArqOrigem;

      //Se for emitido por email, assume pdf o nome do arquivo origem
      if (Length(ArqDestino) = 0) or (Email) then
         ArqDestino:=ArqOrigem;

      if (not ImpressaoDireta) and
         (Trim(ArqDestino) <> '')  then
      begin
        if AnsiUpperCase(sOutputFormat) = 'PDF' then
           ArqDestino:=ChangeFileExt(ArqDestino, '.PDF');
        if AnsiUpperCase(sOutputFormat) = 'RTF' then
           ArqDestino:=ChangeFileExt(ArqDestino, '.RTF');
        if AnsiUpperCase(sOutputFormat) = 'HTML' then
           ArqDestino:=ChangeFileExt(ArqDestino, '.HTML');
        if AnsiUpperCase(sOutputFormat) = 'DOC' then
           ArqDestino:=ChangeFileExt(ArqDestino, '.DOC');
      end;

    finally
      ArqIni.Free;
    end;

    //Exclui o arquivo de configura��o. POSTER.INI
    if AnsiUpperCase(sKeepIni) <> 'YES' then
      if FileExists(ArqConfig) then DeleteFile(ArqConfig);

    ConfiguracaoInicial;
  end
  else begin
    if AnsiUpperCase(sQuiet) <> 'YES' then
      FrmPrintFile.Visible:=True;
  end;

  if AnsiUpperCase(sQuiet) <> 'YES' then
  begin
    Application.ProcessMessages;
    BtnFechar.SetFocus;
  end
  else begin
    Application.Terminate;
    Abort;
  end;

end;

//------------------------------------------------------------------------
procedure SetDefaultPrinter(PrinterName: String);
var
  I: Integer;
  Device : PChar;
  Driver : Pchar;
  Port : Pchar;
  HdeviceMode: Thandle;
  aPrinter : TPrinter;
begin
  Printer.PrinterIndex := -1;
  getmem(Device, 255);
  getmem(Driver, 255);
  getmem(Port, 255);
  aPrinter := TPrinter.create;
  for I := 0 to Printer.printers.Count-1 do
  begin
    if AnsiUpperCase(Printer.printers[i]) = AnsiUpperCase(PrinterName) then
    begin
      aprinter.printerindex := i;
      aPrinter.getprinter
      (device, driver, port, HdeviceMode);
      StrCat(Device, ',');
      StrCat(Device, Driver );
      StrCat(Device, Port );
      WriteProfileString('windows', 'device', Device);
      StrCopy( Device, 'windows' );
      SendMessage(HWND_BROADCAST, WM_WININICHANGE,
      0, Longint(@Device));
    end;
  end;
  Freemem(Device, 255);
  Freemem(Driver, 255);
  Freemem(Port, 255);
  aPrinter.Free;
end;

//------------------------------------------------------------------------------

procedure TFrmPrintFile.EnviarEmail;
var sArqAnexo:array [1..10] of string;
    sCorpoEmail:array [1..10] of string;
    j,i,i2:integer;
    sAux:string;
    email:string;
    sNomeExeOriginal:string;
    sTituloAux,sChaveReg:string;
begin

  //Adiciona o Poster.exe na lista de processos que n�o ser�o
  //afetados pela regra de bloqueio de firewall - exemplo VirusScan
  Registro := TRegistry.Create;
  try
    with Registro do
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKey('\SOFTWARE\Network Associates\TVD\Shared Components\On Access Scanner\BehaviourBlocking', false)
      then begin
        if ValueExists('PortBlockWhiteList_0') then
        begin
          sChaveReg:=Readstring('PortBlockWhiteList_0');
          //Adiciona o nome da aplica��o no valor da chave do registro
          sTituloAux:=UpperCase(Application.Title+ '.exe');
          if Pos(sTituloAux,UpperCase(sChaveReg)) = 0 then
          begin
            WriteString('PortBlockWhiteList_0', sChaveReg + ','+ Application.Title + '.exe');
          end;
        end;
      end;
    end;
  finally
    Registro.CloseKey;
    Registro.Free;
  end;
  Application.ProcessMessages;
  //--------------------------------------------------------------------
  

  try
    if AnsiUpperCase(sQuiet) <> 'YES' then
    begin
      FrmConversor.Gauge1.Progress:=0;
      FrmConversor.LbAguarde.Caption:='Enviando E-mail.';
      Application.ProcessMessages;
    end;

    if Length(sServidor) = 0 then
    begin
      sServidor:='mail.cobolware.com';
      sUsuario:='spool@cobolware.com';
      sSenha:='cobol';
    end;

    if Length(sSender) = 0 then
      sSender := 'spool@cobolware.com';

    if Length(sFontTexto) = 0 then
      sFontTexto:='Terminal';

    //Formata os Anexos
    for i:=1 to 10 do sArqAnexo[i]:='';
    i2:=1; //posi��o do vetor

    if Length(sAttach) <> 0 then
    begin
      for i:=1 to length(sAttach) do
      begin
        if copy(sAttach,i,1) = chr(ord(#32)) then inc(i2);
        sArqAnexo[i2]:=sArqAnexo[i2]+copy(sAttach,i,1);
      end;
    end
    else sArqAnexo[i2]:=ArqDestino;

    //Formata o Corpo do Email
    Memo1.Lines.Clear;
    if FileExists(sTexto) then
    begin
      AssignFile(TXT,sTexto);
      Reset(TXT);

      while not Eof(TXT) do
      begin
        Application.ProcessMessages;
        ReadLn(TXT,LinhaAux);
        Memo1.Lines.Add(LinhaAux);
      end;
      CloseFile(TXT);
    end
    else begin
      if Length(sTexto) <> 0 then
      begin
        for i:=1 to 10 do sCorpoEmail[i]:='';
        i2:=1; //posi��o do vetor
        for i:=1 to length(sTexto) do
        begin
          if copy(sTexto,i,1) = '^' then inc(i2);
          sCorpoEmail[i2]:=sCorpoEmail[i2]+copy(sTexto,i,1);
          Delete(sCorpoEmail[i2],Pos('^',sCorpoEmail[i2]),1);
        end;
        for i:=1 to i2 do
          Memo1.Lines.Add(sCorpoEmail[i]);
      end;
    end;

    //-----------------------------------------------------------------------
    //Envia pelo email padr�o do cliente
    //-----------------------------------------------------------------------
//    DefaultSenderSoftware=ON - Envio de e-mail com o software padr�o
    //if AnsiUpperCase(sDefaultSenderSoftware) = 'ON' then
//    begin
//      with MAPIMail1 do
//      begin
//        Subject := sAssunto;
//        Body := Memo1.Lines.Text;
//        SenderName:=sSender;
//        Recipients.Add('smtp:'+sServidor);
//        Recipients.Add(sEnderecoEmail);
//        Recipients.Add('user:'+sUsuario);
//        Recipients.Add('password:'+sSenha);
//        for i:=1 to i2 do
//          Attachments.Add(trim(sArqAnexo[i2]));
//        EditDialog := True;
//        Send;
//      end;
//    end;

    //-----------------------------------------------------------------------
    //Envia pelo email pelo Poster
    //-----------------------------------------------------------------------
    //sNomeExeOriginal:=Application.Title;
    //Application.Title:='Outlook.exe';

    with IdSMTP1 do
    begin
      if Connected then Disconnect;
      Host        := sServidor;
      Username    := sUsuario;
      Password    := sSenha;
      Port        := StrToInt(sSMTPPort);
      IOHandler  := nil;

      { Rodrigo - 18/03/13 - Necessita SSL para envio de E-Mail.
        Vers�o da Bliblioteca Indy utilizada 10.5.1              }

      if AnsiUpperCase(sRequerAutenticacao) = AnsiUpperCase('YES') then
        AuthType := atDefault
      else
        AuthType := atNone;

      if AnsiUpperCase(sRequerSSL) = AnsiUpperCase('YES') then
      begin
        IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode := sslmClient;


        if (Host = 'smtp.live.com') or (Host = 'smtp.mail.yahoo.com.br') or (Host = 'smtp.yahoo.com.br')  then
          IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvTLSv1
        else
          IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvSSLv23;

        IOHandler := IdSSLIOHandlerSocketOpenSSL1;
        UseTLS    := utUseExplicitTLS;


      end;


      Connect();

    end;

    with IdMessage1 do
    begin
      From.Address := sSender;
      Sender.Name    := From.Address;
      Sender.Address    := From.Address;
      Recipients.EMailAddresses := sEnderecoEmail;
      Subject      := sAssunto;
      Body.Text    := Memo1.Lines.Text;

      MessageParts.Clear;
      for i:=1 to i2 do
        if trim(sArqAnexo[i]) <> '' then
          TIdAttachmentFile.Create(MessageParts,trim(sArqAnexo[i]));

      if AnsiUpperCase(sQuiet) <> 'YES' then
      begin
        Stream := TMemoryStream.Create;
        SaveToStream(Stream);
        FrmConversor.Gauge1.MaxValue := Stream.Size;
        Application.ProcessMessages;
      end;

      if AnsiUpperCase(sRequerAutenticacao) = AnsiUpperCase('YES') then
        IdSMTP1.Authenticate;

      IdSMTP1.Send(IdMessage1);
      IdSMTP1.Disconnect;

      if AnsiUpperCase(sQuiet) <> 'YES' then
      begin
        FrmConversor.Gauge1.Progress:=Stream.Size;
        Stream.Free;
      end;
      //Application.Title:=sNomeExeOriginal;
    end;

    if AnsiUpperCase(sQuiet) <> 'YES' then
      if Localizar then
      MessageDlg('E-Mail enviado com sucesso!',mtInformation, [mbOk], 0);

      //smtp: mail.mksnet.com.br

  except
    on e:exception do
    begin

      if (ErroEmail = 0) and (Length(sUsuario) <> 0) then
      begin
        ErroEmail:=1;

        // verifica se no servidor tem n�mero do IP ou m�scara
        for i:=1 to length(sServidor) do
        begin
          sAux:=copy(sServidor,i,1);
          if (sAux[1] in ['0'..'9']) then
          begin
            ErroEmail:=2;
          end;
        end;

        // Se n�o encontrar dom�nio no usu�rio, aplica o do servidor
        // caso o dom�nio for um IP, n�o aplica
        if (Pos('@',sUsuario) = 0) and (ErroEmail = 1) then
        begin
          sUsuario:=sUsuario + '@' + copy(sServidor, Pos('.',sServidor) + 1,Length(sServidor));
          EnviarEmail;
        end;
      end;

      if AnsiUpperCase(sQuietWhenSendError) <> 'YES' then
      begin
        MessageDlg(
          'Falha no envio de e-mail.'+ #13+#13+
          'Poss�veis causas:'+ #13+#13+
          '- Computador n�o conectado � Internet.'+#13+
          '- Envio de massa bloqueado por Anti-v�rus ou FireWall'+#13+
          '- Senha Incorreta'+ #13+
          '- Servidor smtp inexistente ou fora do ar'+ #13+
          '- Usu�rio Inexistente'  +#13+ #13 + e.message
          ,mtError, [mbOk], 0);
        Reenviar:=False;
        Application.CreateForm(TFrmEmail,FrmEmail);
        FrmEmail.ShowModal;
        if Reenviar then EnviarEmail;
      end;
    end;
  end;

  //Exclui o arquivo texto do corpo do email
  if (AnsiUpperCase(sEraseText) = 'YES') and FileExists(sTexto) then
     DeleteFile(sTexto);

  //Exclui os arquivo anexos do email
  if (AnsiUpperCase(sEraseAttachs) = 'YES') and
     (Length(sAttach) <> 0) then
  begin
      for i:=1 to i2 do
      begin
        if FileExists(sArqAnexo[i]) then
          DeleteFile(sArqAnexo[i]);
      end;
  end;

  if AnsiUpperCase(sKeepOutFileWhenEmail) <> 'YES' then
    if FileExists(ArqDestino) then DeleteFile(ArqDestino);
end;

procedure TFrmPrintFile.IdSMTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  if AnsiUpperCase(sQuiet) <> 'YES' then
  begin
    Application.ProcessMessages;
    FrmConversor.Gauge1.Progress:=AWorkCount;
  end;
end;

procedure TFrmPrintFile.ppDBPipeline1Next(Sender: TObject);
begin
  Inc(Contador);
  if AnsiUpperCase(sQuiet) <> 'YES' then
  begin
    if FrmConversor.Gauge1.Progress < 100 then
    begin
      if Trunc((Contador * 100) / NroLinhasArq) > FrmConversor.Gauge1.Progress
      then
        FrmConversor.Gauge1.Progress:= Trunc((Contador * 100) / NroLinhasArq)
      else begin
        if (contador mod 1000) = 0 then
          FrmConversor.Gauge1.Progress:=FrmConversor.Gauge1.Progress + 1;
      end;
    end;
  end;
end;

procedure TFrmPrintFile.BtnFecharClick(Sender: TObject);
begin
  Application.Terminate;
  Abort;
end;

function ConverteStr(texto: string): string;
var i: Integer;
begin
  if Length(trim(texto)) > 0 then
  begin
    OemToChar(Pchar(texto),Pchar(texto));
    for i := 1 To Length(texto) Do
    begin
      Case texto[i] Of
        '�': texto[i] := '�';  '�': texto[i] := '�';  '�': texto[i] := '�';
        '�': texto[i] := 'o';  '�': texto[i] := '�';  '�': texto[i] := '�';
        '�': texto[i] := 'e';  '�': texto[i] := 'i';  '�': texto[i] := '�';
        '�': texto[i] := 'u';  '�': texto[i] := 'a';  '�': texto[i] := '�';
        '�': texto[i] := 'i';  '�': texto[i] := 'o';  '�': texto[i] := '�';
        '�': texto[i] := 'a';  '�': texto[i] := 'e';  '�': texto[i] := '�';
        '�': texto[i] := 'o';  '�': texto[i] := 'u';  '�': texto[i] := '�';
        '�': texto[i] := 'o';  '�': texto[i] := 'n';  '�': texto[i] := '�';
        '�': texto[i] := '�';  '�': texto[i] := '�';  '�': texto[i] := '�';
        '�': texto[i] := '�';  '�': texto[i] := 'U';  '�': texto[i] := '�';
        '�': texto[i] := 'E';  '�': texto[i] := 'I';  '�': texto[i] := '�';
        '�': texto[i] := 'U';  '�': texto[i] := 'A';  '�': texto[i] := '�';
        '�': texto[i] := 'I';  '�': texto[i] := 'O';  '�': texto[i] := 'U';
        '�': texto[i] := 'A';  '�': texto[i] := 'E';  '�': texto[i] := '�';
        '�': texto[i] := 'O';  '�': texto[i] := 'U';  '�': texto[i] := '�';
        '�': texto[i] := 'O';  '�': texto[i] := 'N';  '�': texto[i] := '�';
        '�': texto[i] := 'o';  '�': texto[i] := 'a';
      end; //case
    end;
  end;
  result := texto;
end;


procedure TFrmPrintFile.Localizar1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    ArqConfig:=OpenDialog1.FileName;
    Localizar:=True;
    FrmPrintFile.OnShow(Sender);
  end;
end;

procedure TFrmPrintFile.Sobre1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmSobre,FrmSobre);
  FrmSobre.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TFrmPrintFile.ImprimeMatricial;
var
  sUltimoEstilo, sLinhaAux, sImpressoraPadraoAnt,sImpressoraAux:string;
  i, Cont, iQuantMicroAvancos, iLinha,iMaxLinhas:integer;
  Matricial:TextFile;

  procedure ExcluiEstilo(sEstilo:string;iTam:integer);
  begin
    delete(LinhaAux,Pos(sEstilo,LinhaAux),iTam);
  end;

begin

  if AnsiUpperCase(sQuiet) <> 'YES' then
  begin
    Application.ProcessMessages;
    FrmConversor.LbAguarde.Caption:=
    'De ' + ExtractFileName(ArqOrigem) +
    ' para ' + ExtractFileName(ArqDestino);
  end;

  // Carrega o arquivo TXT
  Try
    // Calculo o tamanho do relat�rio e o n� de linhas do arquivo para Gauge
    i:=0;
    SizeRel:=0;

    AssignFile(TXT,ArqOrigem);
    Reset(TXT);
    while not Eof(TXT) do
    begin
      Application.ProcessMessages;
      ReadLn(TXT,LinhaAux);
      inc(i);
      if i < 60 then
      begin
        if Length(TrimRight(LinhaAux)) > SizeRel then
          SizeRel:=Length(TrimRight(LinhaAux));
      end
      else break;
    end;
    CloseFile(TXT);
 
    {Selecion�vel:
    OutFile=Printer

    Padr�o
    OutFile=Printer:Default

    Espec�fica:
    OutFile=Printer:HP LaserJet 1200 Series PCL}

    //guarda a impressora padr�o
    sImpressoraPadraoAnt:=Printer.Printers[Printer.PrinterIndex];

    if (copy(UpperCase(ArqDestino),1,3) = 'LPT') or  
      (copy(ArqDestino,1,2) = '\\') then
    begin
      SetDefaultPrinter(ArqDestino); //muda a impressora como padr�o
      AssignPrn(Matricial);//imprime na padr�o
    end
    else
    if pos('PRINTER:',UpperCase(ArqDestino) ) > 0 then
    begin
      sImpressoraAux:=copy(ArqDestino,pos('PRINTER:',UpperCase(ArqDestino)) + 8,30);
      SetDefaultPrinter(sImpressoraAux); //muda a impressora como padr�o
      AssignPrn(Matricial);//imprime na padr�o
    end
    else
    if pos('PRINTER',UpperCase(ArqDestino) ) > 0 then
    begin
      PrinterSetupDialog1.Execute;
      AssignPrn(Matricial); //AssignPrn usa a impressora padr�o do windows
    end
    else
      AssignPrn(Matricial); //AssignPrn usa a impressora padr�o do windows

    Rewrite(Matricial);

    //compacta se for maior que 90 colunas
    if SizeRel > 200 then
      Write(Matricial,#27'M'#15)
    else
    if SizeRel > 90 then
      Write(Matricial,#15);

    //Controla o Espa�amento entre Linhas no relat�rio
    if AnsiUpperCase(sSpacing) = '1' then  //Microavan�o
      Write(Matricial,#27'1')
    else
    if AnsiUpperCase(sSpacing) = '8' then //Oitavos
      Write(Matricial,#27'0')
    else
    if AnsiUpperCase(sSpacing) = '6' then  //Sextos
      Write(Matricial,#27'2');

    AssignFile(TXT,ArqOrigem);
    Reset(TXT);

    iMaxLinhas:=StrToIntDef(sPageHeight,0);
    iLinha:=0;

    while not Eof(TXT) do
    begin
      ReadLn(TXT,LinhaAux);
      Application.ProcessMessages;

      iQuantMicroAvancos:=0;

      inc(iLinha);
      if iMaxLinhas > 0 then
      begin
        ExcluiEstilo(chr(ord(#12)),1); //Quebra de P�gina
        if iLinha > iMaxLinhas then
        begin
          WriteLn(Matricial,#12); //Salto de P�gina
          iLinha:=0;
        end;
      end;

      //Se for matricial, verifica se existe formata��o no
      //espa�o entre linhas durante a impress�o.
      if (copy(sPrinterMode,1,4) = 'TEXT') then
      begin
        if pos('\a', LinhaAux) > 0 then
        begin
          ExcluiEstilo('\a',2); //Sextos
          sUltimoEstilo:=#27#2;
        end
        else
        if pos('\b', LinhaAux) > 0 then
        begin
          ExcluiEstilo('\b',2); //Oitavos
          sUltimoEstilo:=#27#0;
        end
        else
        if pos('\m', LinhaAux) > 0 then
        begin
          while (pos('\m', LinhaAux) > 0) do
          begin
            Application.ProcessMessages;
            inc(iQuantMicroAvancos);
            ExcluiEstilo('\m',2); //microavan�os
          end;
          sUltimoEstilo:= #27#1;
        end;
        LinhaAux:=sUltimoEstilo + LinhaAux;
      end;


      ExcluiEstilo('\c',2);
      ExcluiEstilo('\d',2);
      ExcluiEstilo('\e',2);
      ExcluiEstilo('\f',2);
      ExcluiEstilo('\g',2);
      ExcluiEstilo('\h',2);
      ExcluiEstilo('\i',2);
      ExcluiEstilo('\j',2);
      ExcluiEstilo('\k',2);
      ExcluiEstilo('\l',2);
      ExcluiEstilo('\n',2);
      ExcluiEstilo('\m',2);
      ExcluiEstilo('\o',2);
      ExcluiEstilo('\p',2);

      WriteLn(Matricial,LinhaAux);

      if iQuantMicroAvancos > 0 then
      begin
        Write(Matricial,#27#1);
        for i:=1 to iQuantMicroAvancos do
          WriteLn(Matricial,#27#1);
      end;
    end;
  except
    begin
       if AnsiUpperCase(sQuiet) <> 'YES' then
          ShowMessage('Erro na carga do Arquivo: ' + ArqOrigem);
       Application.Terminate;
       Abort;
    end;
  end;
  System.CloseFile(TXT);

  if SizeRel > 200 then
    Write(Matricial,#27'P') //NORMAL
  else
  if SizeRel > 90 then
    Write(Matricial,#18); //NORMAL

  System.CloseFile(Matricial);
  SetDefaultPrinter(sImpressoraPadraoAnt); //devolve a padr�o
end;


//------------------------------------------------------------------------

procedure TFrmPrintFile.GeraPDF;
var
  iLinhasPaginas, i, Cont, IdxAux:integer;
  NomeAux1, NomeAux2:string;
  sTamFonte:integer;
  MSWord: Variant;
  sAvancoLinha, sUltimoEstilo, sLinhaAux, sImpPadraoAnt:string;
  bImpressoraGrafica:Boolean;
  iQuantAux, iQuantMicroAvancos:integer;
  htmlfile:TextFile;

  procedure ExcluiEstilo(sEstilo:string;iTam:integer);
  begin
    delete(LinhaAux,Pos(sEstilo,LinhaAux),iTam);
  end;

begin
  if AnsiUpperCase(sQuiet) <> 'YES' then
  begin
    Application.ProcessMessages;
    FrmConversor.LbAguarde.Caption:=
    'De ' + ExtractFileName(ArqOrigem) +
    ' para ' + ExtractFileName(ArqDestino);
  end;

  // Carrega o arquivo TXT
  Try
    AssignFile(TXT,ArqOrigem);
    Reset(TXT);

    // Calculo o tamanho do relat�rio e o n� de linhas do arquivo para Gauge
    i:=0;
    SizeRel:=0;
    NroLinhasArq:=0;

    while not Eof(TXT) do
    begin
      Application.ProcessMessages;
      ReadLn(TXT,LinhaAux);
      inc(i);
      if i < 60 then
        if Length(TrimRight(LinhaAux)) > SizeRel then
          SizeRel:=Length(TrimRight(LinhaAux));
      inc(NroLinhasArq);
    end;
    CloseFile(TXT);

    if SizeRel > 200 then
    begin
      ppLinhaRelatorio2.Font.Size:=6;
    end
    else
    if SizeRel > 90 then begin
      ppLinhaRelatorio.Font.Size:=7;
    end
    else begin
      ppLinhaRelatorio.Font.Size:=11;
      ppLinhaRelatorio.Left:=5;
    end;

    // Acrescentado por C�ssio Louzada
    if iFontSize > 0 then
       ppLinhaRelatorio.Font.Size:=iFontSize;
    // Fim Acrescentado por C�ssio Louzada


    sTamFonte:=ppLinhaRelatorio.Font.Size;

    if Length(sFonte) = 0 then
      sfonte:='Courier New';

    ppLinhaRelatorio.Font.Name:=sFonte;
    ppLinhaRelatorio2.Font.Name:=sFonte;

    if SizeRel > 220 then
      ppLinhaRelatorio2.Font.Size:=5;

    // Acrescentado por C�ssio Louzada
    if iFontSize > 0 then
       ppLinhaRelatorio2.Font.Size:=iFontSize;
    // Fim Acrescentado por C�ssio Louzada


    AssignFile(TXT,ArqOrigem);
    Reset(TXT);

    ClientDataSet1.Close;
    ClientDataSet1.Open;
    ClientDataSet1.EmptyDataSet;
    ClientDataSet1.IndexFieldNames:='idx';
    IdxAux:=1;
    Cont:=0;

    if AnsiUpperCase(sQuiet) <> 'YES' then
      FrmConversor.Gauge1.Progress:=0;

    sUltimoEstilo:='';
    iLinhasPaginas:=0;

    while not Eof(TXT) do
    begin
      Application.ProcessMessages;

      ReadLn(TXT,LinhaAux);
      Imprime:=True;
      inc(Cont);

      if IdxAux = 1 then inc(iLinhasPaginas);

      if AnsiUpperCase(sQuiet) <> 'YES' then
        FrmConversor.Gauge1.Progress:=Trunc((Cont * 50) / NroLinhasArq);

      Application.ProcessMessages;

      if bCancela then
      begin
        Application.Terminate;
        Abort;
      end;

      for i:=1 to 10 do
      begin
        if Copy(LinhaAux,i,1) = chr(ord(#12)) then
        begin
          inc(IdxAux);
          Imprime:=False;
          break;
        end;
      end;

      LinhaAux2:=LinhaAux;

      //ExcluiEstilo(chr(ord(#12)),1); //Quebra de P�gina
      ExcluiEstilo(chr(ord(#15)),1); //Condensado
      ExcluiEstilo(chr(ord(#18)),1); //Draft
      ExcluiEstilo(chr(ord(#14)),1); //Expandido
      iQuantMicroAvancos:=0;

      //Se for matricial, verifica se existe formata��o no
      //espa�o entre linhas durante a impress�o.
      if (copy(sPrinterMode,1,4) = 'TEXT') then
      begin
        if pos('\a', LinhaAux) > 0 then
        begin
          ExcluiEstilo('\a',2); //Sextos
          sUltimoEstilo:=ZReport1.Options.Escapes.Space16 + #8;
        end
        else
        if pos('\b', LinhaAux) > 0 then
        begin
          ExcluiEstilo('\b',2); //Oitavos
          sUltimoEstilo:=ZReport1.Options.Escapes.Space18 + #8;
        end
        else
        if pos('\m', LinhaAux) > 0 then
        begin
          while (pos('\m', LinhaAux) > 0) do
          begin
            Application.ProcessMessages;
            inc(iQuantMicroAvancos);
            ExcluiEstilo('\m',2); //microavan�os
          end;
          sUltimoEstilo:= ZReport1.Options.Escapes.Space772 + #8;
        end;
        LinhaAux:=sUltimoEstilo + LinhaAux;
        LinhaAux2:=LinhaAux;
      end;

      ExcluiEstilo('\c',2);
      ExcluiEstilo('\d',2);
      ExcluiEstilo('\e',2);
      ExcluiEstilo('\f',2);
      ExcluiEstilo('\g',2);
      ExcluiEstilo('\h',2);
      ExcluiEstilo('\i',2);
      ExcluiEstilo('\j',2);
      ExcluiEstilo('\k',2);
      ExcluiEstilo('\l',2);
      ExcluiEstilo('\n',2);
      ExcluiEstilo('\m',2);
      ExcluiEstilo('\o',2);
      ExcluiEstilo('\p',2);

      if AnsiUpperCase(sOutputFormat) = 'HTML' then
      begin
        if not Imprime then
        begin
          ClientDataSet1.Append;
          ClientDataSet1idx.Value:=IdxAux;
          ClientDataSet1Linha.Value:='<hr>';
          ClientDataSet1.Post;
        end
        else begin
          ClientDataSet1.Append;
          ClientDataSet1idx.Value:=IdxAux;
          ClientDataSet1Linha.Value:=copy(ConverteStr(LinhaAux),1,sizerel);
          ClientDataSet1.Post;
        end;
      end
      else begin
        ClientDataSet1.Append;
        ClientDataSet1idx.Value:=IdxAux;
        ClientDataSet1Linha.Value:=copy(ConverteStr(LinhaAux),1,sizerel);
        ClientDataSet1.Post;

        if iQuantMicroAvancos > 0 then
        begin
          for i:=1 to iQuantMicroAvancos do
          begin
            ClientDataSet1.Append;
            ClientDataSet1idx.Value:=IdxAux;
            ClientDataSet1Linha.Value:='.';
            ClientDataSet1.Post;
          end;
        end;
      end;

      //Verifica nas 10 �ltimas colunas da linha, se ocorre salto de p�gina
      for i:=10 to Length(LinhaAux2) do
      begin
        if Copy(LinhaAux2,i,1) = chr(ord(#12)) then
        begin
          inc(IdxAux); //Muda o grupo

          if AnsiUpperCase(sOutputFormat) = 'HTML' then
          begin
            ClientDataSet1.Append;
            ClientDataSet1idx.Value:=IdxAux;
            ClientDataSet1Linha.Value:='<hr>';
            ClientDataSet1.Post;
          end;

          if Length(TrimRight(LinhaAux2)) > SizeRel then
          begin
            ClientDataSet1.Append;
            ClientDataSet1idx.Value:=IdxAux;
            ClientDataSet1Linha.Value:=
              ConverteStr(copy(LinhaAux2,i,Length(TrimRight(LinhaAux2))));
            ClientDataSet1.Post;
          end;

          break;
        end;
      end;
    end;
  except
    begin
       if AnsiUpperCase(sQuiet) <> 'YES' then
       begin
         MessageDlg('Erro na carga do Arquivo: ' + ArqOrigem,mtError, [mbOk], 0);
       end;
       Application.Terminate;
       Abort;
    end;
  end;
  CloseFile(TXT);
  ClientDataSet1.First;
  Contador:=0;

  //Controla o Espa�amento entre Linhas no relat�rio
  if AnsiUpperCase(sSpacing) = '1' then  //Microavan�o
  begin
    ZReport1.Options.LineSpacing:=zrd772; //Microavan�os - adicionar ZRPrntr no uses
    ppDetailBand1.Height:=3.2; //Laser - 220 colunas
    ppDetailBand3.Height:=4.2; //Laser - 132 colunas
  end
  else
  if AnsiUpperCase(sSpacing) = '8' then //Oitavos
  begin
    ZReport1.Options.LineSpacing:=zrd18; //Oitavos - adicionar ZRPrntr no uses
    ppDetailBand1.Height:=3.5; //Laser - 220 colunas
    ppDetailBand3.Height:=4.5; //Laser - 132 colunas
  end
  else
  //if AnsiUpperCase(sSpacing) = '6' then  //Sextos
  begin
    ZReport1.Options.LineSpacing:=zrd16; //Sextos - adicionar ZRPrntr no uses
    ppDetailBand1.Height:=3.2; //Laser - 220 colunas
    ppDetailBand3.Height:=4.2; //Laser - 132 colunas
  end;

  if ImpressaoDireta then
  begin
    iGrupoAnt:=0;

    if (copy(ArqDestino,1,7) = 'PREVIEW') or
       (copy(ArqDestino,1,4) = 'VIEW') then
    begin
       //Visualiza em tela
       if SizeRel > 200 then
       begin
         ppReport220.DeviceType:=dtScreen;
         ppReport220.ShowPrintDialog := True;
         ppReport220.ModalPreview := True;
         ppReport220.Print;
       end
       else begin
         ppReport80_132.DeviceType:=dtScreen;
         ppReport80_132.ShowPrintDialog := True;
         ppReport80_132.ModalPreview := True;
         ppReport80_132.Print;
       end;
    end
    else begin
      //guarda a impressora padr�o
      sImpPadraoAnt:=Printer.Printers[Printer.PrinterIndex];

      if (copy(UpperCase(ArqDestino),1,3) = 'LPT') or  
         (copy(ArqDestino,1,2) = '\\') then
         SetDefaultPrinter(ArqDestino);

      if (pos('PRINTER:',UpperCase(ArqDestino) ) > 0) then
        SetDefaultPrinter(copy(ArqDestino,pos('PRINTER:',UpperCase(ArqDestino)) + 8,30));

      if SizeRel > 200 then
      begin
        ppReport220.DeviceType:=dtPrinter;
        if (pos('PRINTER',UpperCase(ArqDestino)) > 0) and
           (pos('PRINTER:',UpperCase(ArqDestino)) = 0) then
          ppReport220.ShowPrintDialog := True
        else
          ppReport220.ShowPrintDialog := False;
        ppReport220.Print;
      end
      else begin
        ppReport80_132.DeviceType:=dtPrinter;
        if (pos('PRINTER',UpperCase(ArqDestino)) > 0) and
           (pos('PRINTER:',UpperCase(ArqDestino)) = 0) then
          ppReport80_132.ShowPrintDialog := True
        else
          ppReport80_132.ShowPrintDialog := False;
        ppReport80_132.Print;
      end;
      SetDefaultPrinter(sImpPadraoAnt);//devolve a padr�o
    end;
  end
  else begin

    //Este mesmo utilit�rio pode ser usado por multiusu�rios
    //e com isso, para evitar conflito, ser� feito uma c�pia
   //qdo da gera��o do pdf para evitar viola��o de compartilhamento

    if AnsiUpperCase(sOutputFormat) = 'PDF' then
       ppReport220.DeviceType:=dtPDF;
    if AnsiUpperCase(sOutputFormat) = 'RTF' then
       ppReport220.DeviceType:=dtRTF;

    ppReport80_132.DeviceType:=ppReport220.DeviceType;

    ArqTemp:=ChangeFileExt(ArqOrigem,'.aux');

    //Html
    if AnsiUpperCase(sOutputFormat) = 'HTML' then
    begin
      AssignFile(HtmlFile, ArqTemp);
      Rewrite(HtmlFile);
      writeln(htmlfile, '<html><head>' + #13#10+ //inicio do arquivo html
        '<title> Spool </title>' + #13#10+
        '</head>' + #13#10+ '<body bgcolor="#FFFFFF">' +
        #13#10+ '<table border =1> <PRE>' + #13#10);

      with ClientDataSet1 do
      begin
        First;
        while not eof do
        begin
          Application.ProcessMessages;
          if pos('<hr>',ClientDataSet1Linha.asstring) = 0 then
          begin
            ClientDataSet1.Edit;
            ClientDataSet1Linha.asstring:=
              StringReplace(ClientDataSet1Linha.asstring,'<','&lt;',[rfReplaceAll]);
            ClientDataSet1Linha.asstring:=
              StringReplace(ClientDataSet1Linha.asstring,'>','&gt;',[rfReplaceAll]);
          end;
          write(htmlfile, ClientDataSet1Linha.asstring + #13#10 );
          Next;
        end;
        First;
      end;
      writeln(htmlfile, '</PRE></body></html>'); {Finaliza o arquivo html}
      CloseFile(htmlfile);
    end
    else

    if AnsiUpperCase(sOutputFormat) = 'DOC' then
    begin
      if SizeRel > 200 then
      begin
        ppDetailBand1.Height:=4.1;
        ppReport220.DeviceType:=dtRTF;
        ppReport220.TextFileName:=ArqTemp;
        ppReport220.Print;
      end
      else begin
        ppDetailBand3.Height:=4.4;
        ppReport80_132.DeviceType:= dtRTF;
        ppReport80_132.TextFileName:=ArqTemp;
        ppReport80_132.Print;
      end;
      ArqDestino:=ChangeFileExt(ArqDestino, '.DOC');

      //-----------------------------------------------------------------------

    end
    else begin
      if SizeRel > 200 then
      begin
        ppDetailBand1.Height:=4.1;
        ppReport220.TextFileName:=ArqTemp;
        ppReport220.Print;
      end
      else begin
        ppDetailBand3.Height:=4.4;
        ppReport80_132.TextFileName:=ArqTemp;
        ppReport80_132.PrinterSetup.DocumentName := ArqTemp;
        ppReport80_132.Print;
      end;
    end;
  end;

  if AnsiUpperCase(sQuiet) <> 'YES' then
    FrmConversor.Gauge1.Progress:=100;

  if FileExists(ArqDestino) then DeleteFile(ArqDestino);
  RenameFile(ArqTemp,ArqDestino);
  if FileExists(ArqTemp) then DeleteFile(ArqTemp);
end;

end.
