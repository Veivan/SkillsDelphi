object Form1: TForm1
  Left = 461
  Top = 155
  Caption = 'Explorer'
  ClientHeight = 462
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 189
    Top = 41
    Height = 421
    ExplicitLeft = 524
    ExplicitTop = 120
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 509
    Height = 41
    Align = alTop
    TabOrder = 0
    object DriveComboBox1: TDriveComboBox
      Left = 8
      Top = 12
      Width = 145
      Height = 19
      DirList = DirectoryListBox1
      TabOrder = 0
    end
    object Button1: TButton
      Left = 356
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 189
    Height = 421
    Align = alLeft
    TabOrder = 1
    object smImage: TImage
      Left = 44
      Top = 304
      Width = 32
      Height = 32
      Center = True
      Proportional = True
      Visible = False
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 4
      Top = 48
      Width = 145
      Height = 97
      FileList = FileListBox
      TabOrder = 0
      OnChange = DirectoryListBox1Change
    end
    object FileListBox: TFileListBox
      Left = 8
      Top = 176
      Width = 145
      Height = 97
      Mask = '*.jpg;*.bmp;*.gif;*.ico'
      ShowGlyphs = True
      TabOrder = 1
    end
  end
  object ListView: TListView
    Left = 192
    Top = 41
    Width = 317
    Height = 421
    Align = alClient
    Columns = <
      item
        Caption = 'Name'
      end>
    OwnerData = True
    ReadOnly = True
    TabOrder = 2
    OnData = ListViewData
    OnDblClick = ListViewDblClick
  end
  object ImageList: TImageList
    Left = 108
    Top = 45
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 272
    Top = 20
  end
end
