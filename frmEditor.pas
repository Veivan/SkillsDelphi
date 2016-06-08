unit frmEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Jpeg, ExtDlgs, StdCtrls, Buttons, ToolWin, ComCtrls;

type
  TFormEditor = class(TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    CoolBar1: TCoolBar;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditor: TFormEditor;

implementation

{$R *.dfm}

procedure TFormEditor.FormCreate(Sender: TObject);
begin
//  Image1.Picture.LoadFromFile('c:\1\IMG_9879.JPG');
end;

procedure TFormEditor.Button1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TFormEditor.Button2Click(Sender: TObject);
  var Pic: TPicture;
begin
  Pic:=TPicture.Create;
  Pic.LoadFromFile('c:\1\IMG_9879.JPG');
  Image1.Canvas.Draw(1,1,Pic.Graphic);
end;

procedure TFormEditor.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Image1.Canvas.MoveTo(X,Y);
end;

procedure TFormEditor.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var r : Trect;
begin
  Image1.Canvas.LineTo(X,Y);
  //Image1.Canvas.Rectangle(X,Y, X+ 50,Y + 50);

    r := Rect(X,Y,X+100,Y+100);
   Image1.Canvas.Brush.Color := clBlack;
  Image1.Canvas.FrameRect(r);
  Image1.Canvas.FrameRect(r);

end;

procedure TFormEditor.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
//
end;

end.
