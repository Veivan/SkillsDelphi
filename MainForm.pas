unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ShellCtrls, StdCtrls, FileCtrl,
  ShellApi, ShlObj, ImgList, ExtDlgs;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DriveComboBox1: TDriveComboBox;
    Panel2: TPanel;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox: TFileListBox;
    Splitter1: TSplitter;
    Button1: TButton;
    ListView: TListView;
    ImageList: TImageList;
    OpenPictureDialog1: TOpenPictureDialog;
    smImage: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
    procedure ListViewData(Sender: TObject; Item: TListItem);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FIShellFolder,
    FIDesktopFolder: IShellFolder;

    procedure SetPath();
    function GetTile(FileName: String) : TBitmap;
    function GetLisFileName: string;
    procedure ClearImageList();
  public
    { Public declarations }
    property LisFileName : string read GetLisFileName;
  end;

var
  Form1: TForm1;

implementation

uses frmEditor;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  //DirectoryListBox1.Align := alClient;
  DirectoryListBox1.Directory := 'Z:\vmshared\1';
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearImageList();
end;

procedure TForm1.ListViewData(Sender: TObject; Item: TListItem);
begin
  if (Item.Index > FileListBox.Count) then Exit;
  Item.Caption := FileListBox.Items.Strings[Item.Index];
  Item.ImageIndex := Item.Index;
end;

procedure TForm1.ListViewDblClick(Sender: TObject);
begin
  if ListView.Selected <> nil then begin
    FormEditor := TFormEditor.CreateExt(LisFileName);
    FormEditor.ShowModal;
  end;
end;

procedure TForm1.ClearImageList;
var i : integer; icon : TIcon; pic : TBitmap;
begin
 // for pic in ImageList.GetEnumerator do
//   pic.Free;
   for i := ImageList.Count - 1 downto 0 do begin
    //ImageList.GetIcon(i, icon);
    ImageList.GetBitmap(i, pic);
    pic.Free;
  end;
  ImageList.Clear;
end;

procedure TForm1.DirectoryListBox1Change(Sender: TObject);
var i : integer; fname : string; icon : TIcon;  pic : TBitmap;
begin
  ClearImageList();
  for i := 0 to FileListBox.Count - 1 do begin
    fname := FileListBox.Directory + '\' + FileListBox.Items.Strings[i];
    pic := TBitmap.Create;
    pic := GetTile(fname);
    ImageList.Add(pic, nil);
  end;
  ListView.LargeImages := ImageList;
  ListView.Items.Count := FileListBox.Count;
  SetPath();
  ListView.Repaint;
end;

procedure TForm1.SetPath;
begin
  ListView.Items.BeginUpdate;
  try
    if ListView.Items.Count > 0 then
    begin
      ListView.Selected := ListView.Items[0];
      ListView.Selected.Focused := True;
      ListView.Selected.MakeVisible(false);
    end;
  finally
    ListView.Items.EndUpdate;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  icon:TIcon; w : integer;  FileName: string; h : hIcon;  IconIndex : word;
    Pic: TPicture;
  b : TBitmap;

begin
//  ShowMessage(FileListBox.Directory + ' ' + FileListBox.Items.Strings[0]);

  if OpenPictureDialog1.Execute then begin
    Pic := TPicture.Create;
    b := TBitmap.Create;
    try
      Pic.LoadFromFile(OpenPictureDialog1.FileName);
      smImage.Canvas.Draw(1,1,Pic.Graphic);
      b := smImage.Picture.Bitmap;
      b.SaveToFile('z:\vmshared\1\qq.bmp');
      ListView.Canvas.Draw(32, 32, b);
    finally
      Pic.Free;
    end;
  end;
end;

function TForm1.GetTile(FileName: String) : TBitmap;
var
  Pic: TPicture;
  b : TBitmap;
begin
  Pic := TPicture.Create;
  try
    Pic.LoadFromFile(FileName);
    smImage.Canvas.Draw(1,1,Pic.Graphic);
  finally
    Pic.Free;
  end;
  Result := smImage.Picture.Bitmap;
end;

function TForm1.GetLisFileName: string;
begin
  Result := FileListBox.Directory + '\' + ListView.Selected.Caption;
end;

end.
