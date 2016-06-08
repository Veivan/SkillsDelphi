object FormEditor: TFormEditor
  Left = 261
  Top = 149
  Width = 870
  Height = 580
  Caption = 'Editor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 41
    Height = 546
    Align = alLeft
    Bands = <>
    Vertical = True
    object SpeedButton3: TSpeedButton
      Left = 8
      Top = 8
      Width = 23
      Height = 22
    end
    object SpeedButton4: TSpeedButton
      Left = 8
      Top = 40
      Width = 23
      Height = 22
    end
  end
  object Panel1: TPanel
    Left = 41
    Top = 0
    Width = 821
    Height = 546
    Align = alClient
    TabOrder = 1
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 819
      Height = 392
      Align = alTop
      Center = True
      Proportional = True
      OnMouseDown = Image1MouseDown
      OnMouseMove = Image1MouseMove
      OnMouseUp = Image1MouseUp
    end
    object Button1: TButton
      Left = 30
      Top = 504
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 126
      Top = 504
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 336
    Top = 16
  end
end
