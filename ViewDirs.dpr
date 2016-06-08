program ViewDirs;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  frmEditor in 'frmEditor.pas' {FormEditor};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormEditor, FormEditor);
  Application.Run;
end.
