unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ShellCtrls, StdCtrls,
  ImgList, ExtDlgs, FileCtrl;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    DriveComboBox1: TDriveComboBox;
    Panel2: TPanel;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox: TFileListBox;
    Splitter1: TSplitter;
    ListView: TListView;
    ImageList: TImageList;
    smImage: TImage;
    procedure FormCreate(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
    procedure ListViewData(Sender: TObject; Item: TListItem);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure SetPath();
    function GetTile(FileName: String) : TBitmap;
    function GetLisFileName: string;
  public
    { Public declarations }
    property LisFileName : string read GetLisFileName;
  end;

var
  Form1: TForm1;
const cPicSize = 32;

implementation

uses frmEditor;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  DirectoryListBox1.Align := alClient;
//  DirectoryListBox1.Directory := 'Z:\vmshared\1';
  with ImageList, smImage do begin
    Width := cPicSize;
    Height := cPicSize;
  end;
  ListView.LargeImages := ImageList;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ImageList.Clear;
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

procedure TForm1.DirectoryListBox1Change(Sender: TObject);
var i : integer; fname : string; pic : TBitmap;
begin
  ListView.Items.Count := FileListBox.Count;
  SetPath();
  ImageList.Clear;
  pic := TBitmap.Create;
  try
    for i := 0 to FileListBox.Count - 1 do begin
      fname := FileListBox.Directory + '\' + FileListBox.Items.Strings[i];
      pic.Assign(GetTile(fname));
      ImageList.Add(pic, nil);
    end;
  finally
    pic.Free;
  end;
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

function TForm1.GetTile(FileName: String) : TBitmap;
var
  Pic: TPicture; r : TRect;
begin
  Pic := TPicture.Create;
  try
    Pic.LoadFromFile(FileName);
    // Canvas cleaning
    PatBlt(smImage.Canvas.Handle, 0, 0,
      smImage.ClientWidth, smImage.ClientHeight, WHITENESS);

    r := Rect(1,1,cPicSize,cPicSize);
    smImage.Canvas.StretchDraw(r, Pic.Graphic);
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
