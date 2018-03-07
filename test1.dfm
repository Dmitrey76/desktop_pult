object Form1: TForm1
  Left = 396
  Top = 344
  Width = 639
  Height = 231
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 136
    Top = 136
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 264
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 136
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '161'
  end
  object CheckBox1: TCheckBox
    Left = 136
    Top = 112
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 2
  end
  object TcpClient1: TTcpClient
    RemoteHost = '192.168.1.39'
    RemotePort = '738'
    OnConnect = TcpClient1Connect
    OnReceive = TcpClient1Receive
    OnSend = TcpClient1Send
    Left = 24
    Top = 16
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 96
    Top = 16
  end
end
