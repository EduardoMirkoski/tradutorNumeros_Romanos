object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Conversor de N'#250'meros Romanos'
  ClientHeight = 476
  ClientWidth = 526
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 81
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 708
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 524
      Height = 79
      Align = alClient
      Alignment = taCenter
      Caption = #13#10'Conversor de n'#250'meros romanos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 303
      ExplicitHeight = 44
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 526
    Height = 395
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 392
    object Label2: TLabel
      Left = 21
      Top = 42
      Width = 121
      Height = 18
      Caption = 'N'#250'mero Decimal:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 20
      Top = 97
      Width = 122
      Height = 18
      Caption = 'N'#250'mero Romano:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edtNumero: TEdit
      Left = 148
      Top = 41
      Width = 180
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 0
      OnChange = edtNumeroChange
      OnKeyPress = edtNumeroKeyPress
    end
    object btnTraduzirParaRomano: TButton
      Left = 344
      Top = 40
      Width = 161
      Height = 25
      Caption = 'Converter para Romano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnTraduzirParaRomanoClick
    end
    object edtRomano: TEdit
      Left = 148
      Top = 98
      Width = 180
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 11
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edtRomanoKeyPress
    end
    object btnTraduzirParaDecimal: TButton
      Left = 344
      Top = 96
      Width = 161
      Height = 25
      Caption = 'Converter para Decimal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnTraduzirParaDecimalClick
    end
    object grdTabela: TStringGrid
      Left = 21
      Top = 168
      Width = 484
      Height = 203
      ColCount = 2
      DefaultColWidth = 242
      DefaultColAlignment = taCenter
      RowCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Touch.ParentTabletOptions = False
      Touch.TabletOptions = []
      RowHeights = (
        24
        24
        24
        24
        24
        24
        24
        24)
    end
  end
  object bllAviso: TBalloonHint
    Left = 344
    Top = 201
  end
end
