unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ShellCtrls, StdCtrls, FileCtrl,
  ShellApi, ShlObj, ImgList;

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
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure ListViewDblClick(Sender: TObject);
    procedure ListViewData(Sender: TObject; Item: TListItem);
  private
    { Private declarations }
    FIShellFolder,
    FIDesktopFolder: IShellFolder;

    procedure SetPath();
    function GetIcon(FileName: String) : TIcon;
  public
    { Public declarations }
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

procedure TForm1.ListViewData(Sender: TObject; Item: TListItem);
begin
  if (Item.Index > FileListBox.Count) then Exit;
  Item.Caption := FileListBox.Items.Strings[Item.Index];
  Item.ImageIndex := Item.Index;
  if ListView.ViewStyle <> vsReport then Exit;

end;

procedure TForm1.ListViewDblClick(Sender: TObject);
begin
  if ListView.Selected <> nil then begin
    Application.CreateForm(TFormEditor, FormEditor);
    FormEditor.ShowModal;
  end;
end;

procedure TForm1.DirectoryListBox1Change(Sender: TObject);
var i : integer; fname : string; icon : TIcon;
begin
  ImageList.Clear;
  for i := 0 to FileListBox.Count - 1 do begin
    fname := FileListBox.Directory + '\' + FileListBox.Items.Strings[i];
//    icon := GetIcon(fname);
//    ImageList.AddIcon(icon);
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
      ListView.Selected.MakeVisible(False);
    end;
  finally
    ListView.Items.EndUpdate;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  icon:TIcon; w : integer;  FileName: string; h : hIcon;  IconIndex : word;
begin
//  ShowMessage(FileListBox.Directory + ' ' + FileListBox.Items.Strings[0]);
  FileName := FileListBox.Directory + '\' + FileListBox.Items.Strings[0];
  icon.Handle:=ExtractIcon(Application.Handle,PChar(FileName),0);
  IconIndex := 0;
 h := ExtractAssociatedIcon(hInstance,
'z:\vmshared\1\IMG_9879.JPG',
IconIndex);

icon.LoadFromFile('z:\vmshared\1\IMG_9879.JPG');
Form1.Canvas.Draw(32, 32, icon);
//DrawIcon(Form1.Canvas.Handle,10,10,h);
end;

function TForm1.GetIcon(FileName: String) : TIcon;
var
  icon:TIcon;
  Icon32,Icon16:HICON;
  i:integer;
begin
  try
  icon.Handle:=ExtractIcon(hInstance,PChar(FileName),0);
    i:=0;
    while Integer(ExtractIconEx(PChar(FileName),i,Icon16,Icon32,1))>0 do begin
      inc(i);
      icon:=TIcon.Create;
      icon.Handle:=Icon16;
    end;
  except
    on e:Exception do
  end;
  Result := icon;
end;

end.
