unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ShellCtrls, StdCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    ShellComboBox1: TShellComboBox;
    ShellTreeView1: TShellTreeView;
    ShellListView1: TShellListView;
    Splitter1: TSplitter;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Button1: TButton;
    procedure ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure ShellListView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses frmEditor;

{$R *.dfm}

procedure TForm1.ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  //ShowMessage(Node.GetNamePath);
  //FileListBox1.Directory := Node.GetNamePath;
end;

procedure TForm1.ShellListView1DblClick(Sender: TObject);
var fedit : TForm;
begin
  Application.CreateForm(TFormEditor, FormEditor);
  FormEditor.ShowModal;
 // FileListBox1.Items;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage(FileListBox1.Directory + ' ' + FileListBox1.Items.Strings[0]);

end;

end.
