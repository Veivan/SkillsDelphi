object Form1: TForm1
  Left = 243
  Top = 116
  Width = 870
  Height = 580
  Caption = 'Explorer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 265
    Top = 41
    Height = 505
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 41
    Align = alTop
    TabOrder = 0
    object ShellComboBox1: TShellComboBox
      Left = 8
      Top = 11
      Width = 145
      Height = 22
      Root = 'rfMyComputer'
      ShellTreeView = ShellTreeView1
      ShellListView = ShellListView1
      UseShellImages = True
      DropDownCount = 8
      TabOrder = 0
    end
    object DriveComboBox1: TDriveComboBox
      Left = 584
      Top = 16
      Width = 145
      Height = 19
      DirList = DirectoryListBox1
      TabOrder = 1
    end
  end
  object ShellTreeView1: TShellTreeView
    Left = 0
    Top = 41
    Width = 265
    Height = 505
    ObjectTypes = [otFolders]
    Root = 'rfMyComputer'
    ShellComboBox = ShellComboBox1
    ShellListView = ShellListView1
    UseShellImages = True
    Align = alLeft
    AutoRefresh = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 1
    OnChange = ShellTreeView1Change
  end
  object ShellListView1: TShellListView
    Left = 268
    Top = 41
    Width = 301
    Height = 505
    ObjectTypes = [otNonFolders]
    Root = 'rfMyComputer'
    ShellTreeView = ShellTreeView1
    ShellComboBox = ShellComboBox1
    Sorted = True
    OnDblClick = ShellListView1DblClick
    ReadOnly = False
    HideSelection = False
    TabOrder = 2
  end
  object FileListBox1: TFileListBox
    Left = 584
    Top = 160
    Width = 145
    Height = 97
    ItemHeight = 16
    Mask = '*.dcu;*.dfm'
    ShowGlyphs = True
    TabOrder = 3
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 584
    Top = 48
    Width = 145
    Height = 97
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 4
  end
  object Button1: TButton
    Left = 736
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
end
