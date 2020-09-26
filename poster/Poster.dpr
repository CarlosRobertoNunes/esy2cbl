program Poster;

uses
  ExceptionLog,
  Forms,
  UnMenu in 'UnMenu.pas' {FrmPrintFile},
  UnConversor in 'UnConversor.pas' {FrmConversor},
  UnSobre in 'UnSobre.pas' {FrmSobre},
  UnEmail in 'UnEmail.pas' {FrmEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'COBOLware Poster 1.2';
  Application.CreateForm(TFrmPrintFile, FrmPrintFile);
  Application.CreateForm(TFrmEmail, FrmEmail);
  Application.Run;
end.
