object FormEditor: TFormEditor
  Left = 261
  Top = 149
  Caption = 'Editor'
  ClientHeight = 443
  ClientWidth = 494
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
  object Image1: TImage
    Left = 41
    Top = 0
    Width = 453
    Height = 443
    Align = alClient
    Center = True
    Proportional = True
    Transparent = True
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
    ExplicitLeft = 68
    ExplicitTop = 8
    ExplicitWidth = 337
    ExplicitHeight = 293
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 41
    Height = 443
    Align = alLeft
    Bands = <>
    Vertical = True
    ExplicitHeight = 546
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
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 336
    Top = 16
  end
end
