object frmMain: TfrmMain
  Left = 272
  Top = 167
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Pult'
  ClientHeight = 547
  ClientWidth = 844
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    844
    547)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 464
    Top = 8
    Width = 160
    Height = 19
    Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074' '#1076#1086#1084#1077': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 464
    Top = 32
    Width = 165
    Height = 19
    Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1074' '#1097#1080#1090#1082#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 640
    Top = 8
    Width = 9
    Height = 19
    Caption = '0'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 640
    Top = 32
    Width = 9
    Height = 19
    Caption = '0'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 464
    Top = 56
    Width = 95
    Height = 19
    Caption = #1050#1086#1085#1090#1088#1086#1083#1083#1077#1088':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbTime: TLabel
    Left = 640
    Top = 3
    Width = 193
    Height = 86
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '00:00:00 1 '#1084#1072#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TPanel
    Left = 16
    Top = 8
    Width = 201
    Height = 65
    Cursor = crHandPoint
    BevelInner = bvRaised
    Caption = #1042#1089#1077' '#1076#1086#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Panel1Click
  end
  object Button2: TPanel
    Left = 232
    Top = 8
    Width = 201
    Height = 65
    Cursor = crHandPoint
    BevelInner = bvRaised
    Caption = #1044#1086#1084' '#1087#1091#1089#1090#1086#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Panel1Click
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 88
    Width = 816
    Height = 217
    Anchors = [akLeft, akTop, akRight]
    Caption = #1069#1090#1072#1078' 1'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object Set_Button_1: TPanel
      Tag = 161
      Left = 16
      Top = 24
      Width = 185
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1057#1074#1077#1090' '#1089#1077#1085#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Panel1Click
    end
    object Set_Button_2: TPanel
      Tag = 162
      Left = 216
      Top = 24
      Width = 185
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1057#1074#1077#1090' '#1087#1088#1080#1093#1086#1078#1072#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Panel1Click
    end
    object Set_Button_3: TPanel
      Tag = 163
      Left = 416
      Top = 24
      Width = 185
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1057#1074#1077#1090' '#1082#1091#1093#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Panel1Click
    end
    object Set_Button_4: TPanel
      Tag = 164
      Left = 616
      Top = 24
      Width = 185
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1057#1074#1077#1090' '#1074#1072#1085#1085#1072#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Panel1Click
    end
    object Set_Button_6: TPanel
      Tag = 166
      Left = 216
      Top = 120
      Width = 185
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1057#1074#1077#1090' '#1075#1086#1089#1090#1080#1085#1085#1072#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Panel1Click
    end
    object Set_Button_5: TPanel
      Tag = 165
      Left = 16
      Top = 120
      Width = 185
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1057#1074#1077#1090' '#1083#1077#1089#1090#1085#1080#1094#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Panel1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 312
    Width = 816
    Height = 225
    Anchors = [akLeft, akTop, akRight]
    Caption = #1069#1090#1072#1078' 2'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    object Set_Button_7: TPanel
      Tag = 177
      Left = 16
      Top = 24
      Width = 185
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1057#1074#1077#1090' '#1089#1087#1072#1083#1100#1085#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Panel1Click
    end
    object Set_Button_11: TPanel
      Tag = 181
      Left = 16
      Top = 128
      Width = 185
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1057#1074#1077#1090' '#1083#1077#1089#1090#1085#1080#1094#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Panel1Click
    end
    object Set_Button_8: TPanel
      Tag = 178
      Left = 216
      Top = 24
      Width = 185
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1057#1074#1077#1090' '#1082#1072#1073#1080#1085#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Panel1Click
    end
    object Set_Button_9: TPanel
      Tag = 179
      Left = 416
      Top = 24
      Width = 185
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1057#1074#1077#1090' '#1076#1077#1090#1089#1082#1072#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Panel1Click
    end
    object Set_Button_10: TPanel
      Tag = 180
      Left = 616
      Top = 24
      Width = 185
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1057#1074#1077#1090' '#1073#1072#1083#1082#1086#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Panel1Click
    end
    object Button14: TPanel
      Left = 416
      Top = 128
      Width = 385
      Height = 81
      Cursor = crHandPoint
      BevelInner = bvRaised
      Caption = #1042#1099#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1105
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Panel1Click
    end
  end
  object cbControllers: TComboBox
    Left = 640
    Top = 56
    Width = 129
    Height = 21
    AutoComplete = False
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvRaised
    Style = csDropDownList
    Ctl3D = False
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 5
    TabStop = False
  end
  object Button3: TButton
    Left = 772
    Top = 56
    Width = 61
    Height = 21
    Caption = #1086#1073#1085#1086#1074#1080#1090#1100
    Default = True
    TabOrder = 1
    OnClick = Button3Click
  end
  object TcpServer: TTcpServer
    LocalHost = '192.168.1.39'
    LocalPort = '738'
    Left = 776
    Top = 248
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 728
    Top = 248
  end
end
