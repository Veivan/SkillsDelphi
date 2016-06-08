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
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    FFileName : string;
    AX, AY : Integer;
    doDraw : boolean;
  public
    { Public declarations }
    constructor CreateExt(AFileName: string);
  end;

var
  FormEditor: TFormEditor;

implementation

{$R *.dfm}

constructor TFormEditor.CreateExt(AFileName: string);
begin
  inherited Create(nil);
  FFileName := AFileName;
end;

procedure TFormEditor.FormCreate(Sender: TObject);
  var Pic: TPicture;
begin
  Pic := TPicture.Create;
  try
    Pic.LoadFromFile(FFileName);
    Image1.Canvas.Draw(1,1,Pic.Graphic);
  finally
    Pic.Free;
  end;
end;

procedure TFormEditor.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //Image1.Canvas.MoveTo(X,Y);
  FormEditor.Canvas.MoveTo(X,Y);
  AX := X;
  AY := Y;
  doDraw := true;
end;

procedure TFormEditor.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var r : Trect;
begin
  //Image1.Canvas.LineTo(X,Y);
  //Image1.Canvas.Rectangle(X,Y, X+ 50,Y + 50);
  r := Rect(AX,AY,X,Y);
  //Image1.Canvas.Brush.Color := clBlack;
  //Image1.Canvas.FrameRect(r);
  FormEditor.Canvas.Brush.Color := clBlack;
  FormEditor.Canvas.FrameRect(r);
  doDraw := false;
end;

procedure TFormEditor.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
  var r : Trect;
begin
  if not doDraw then Exit;

//  FormEditor.Canvas.fillrect(FormEditor.Canvas.cliprect);
//  InValidateRect(FormEditor.handle,NIL,True);
  PatBlt(FormEditor.Canvas.Handle, 0, 0,
    FormEditor.ClientWidth, FormEditor.ClientHeight, WHITENESS);
  Image1.Repaint;

  r := Rect(AX,AY, X,Y);
  FormEditor.Canvas.Brush.Color := clBlack;
  FormEditor.Canvas.FrameRect(r);
end;

end.
