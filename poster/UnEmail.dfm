object FrmEmail: TFrmEmail
  Left = 366
  Top = 256
  Width = 463
  Height = 322
  BorderIcons = [biSystemMenu]
  Caption = 'E-mail'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 13
    Top = 87
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label3: TLabel
    Left = 13
    Top = 47
    Width = 56
    Height = 13
    Caption = 'Destinat'#225'rio'
  end
  object Label4: TLabel
    Left = 13
    Top = 127
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object Label5: TLabel
    Left = 13
    Top = 7
    Width = 155
    Height = 13
    Caption = 'Servidor de envio de mensagens'
  end
  object Label1: TLabel
    Left = 13
    Top = 168
    Width = 25
    Height = 13
    Caption = 'Porta'
  end
  object Panel2: TPanel
    Left = 330
    Top = 0
    Width = 117
    Height = 283
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 7
    DesignSize = (
      117
      283)
    object BtnFechar: TBitBtn
      Left = 12
      Top = 253
      Width = 97
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      DragCursor = crDefault
      TabOrder = 1
      OnClick = BtnFecharClick
    end
    object BtnSalvar: TBitBtn
      Left = 12
      Top = 223
      Width = 97
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Enviar'
      DragCursor = crDefault
      TabOrder = 0
      OnClick = BtnSalvarClick
    end
  end
  object CpoRequerSSL: TCheckBox
    Left = 13
    Top = 217
    Width = 287
    Height = 17
    Caption = 'Este Servidor Requer uma conex'#227'o de seguran'#231'a (SSL)'
    TabOrder = 5
  end
  object CpoRequerAutenticacao: TCheckBox
    Left = 13
    Top = 245
    Width = 209
    Height = 17
    Caption = 'Este Servidor Requer Autentica'#231#227'o'
    TabOrder = 6
  end
  object CpoSMTP: TEdit
    Left = 13
    Top = 22
    Width = 265
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
  end
  object CpoDestinatario: TEdit
    Left = 13
    Top = 62
    Width = 265
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
  end
  object CpoUsuario: TEdit
    Left = 13
    Top = 102
    Width = 265
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
  end
  object CpoSenha: TEdit
    Left = 13
    Top = 143
    Width = 164
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    PasswordChar = '*'
    TabOrder = 3
  end
  object CpoPorta: TEdit
    Left = 13
    Top = 184
    Width = 63
    Height = 19
    BiDiMode = bdRightToLeft
    Ctl3D = False
    ParentBiDiMode = False
    ParentCtl3D = False
    TabOrder = 4
  end
end
