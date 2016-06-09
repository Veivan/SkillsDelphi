unit frmEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Jpeg, ExtDlgs, StdCtrls, Buttons, ToolWin, ComCtrls;

type
  TDrawKind = (None, ARect, AEllipse);

  TFormEditor = class(TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    CoolBar: TCoolBar;
    sbRect: TSpeedButton;
    sbEllipse: TSpeedButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbRectClick(Sender: TObject);
    procedure sbEllipseClick(Sender: TObject);
  private
    { Private declarations }
    FFileName : string;
    AX, AY : Integer;
    doDraw : boolean;
    DrawKind : TDrawKind;
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
  DrawKind := None;
  doDraw := false;
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
  if DrawKind = None then Exit;
  doDraw := true;
  X := X + CoolBar.Width;
  AX := X;
  AY := Y;
  FormEditor.Canvas.MoveTo(AX,AY);
end;

procedure TFormEditor.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var r : Trect;
begin
  if DrawKind = None then Exit;
  AX := AX - CoolBar.Width;
  r := Rect(AX,AY,X,Y);
  Image1.Canvas.Pen.Color := clBlack;
  Image1.Canvas.Brush.Style := bsClear;
  case DrawKind of
    ARect :
      Image1.Canvas.Rectangle(r);
    AEllipse :
      Image1.Canvas.Ellipse(r);
  end;
  doDraw := false;
end;

procedure TFormEditor.sbEllipseClick(Sender: TObject);
begin
  DrawKind := AEllipse;
end;

procedure TFormEditor.sbRectClick(Sender: TObject);
begin
  DrawKind := ARect;
end;

procedure TFormEditor.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
  var r : Trect;
begin
  if not doDraw then Exit;
  PatBlt(FormEditor.Canvas.Handle, 0, 0,
    FormEditor.ClientWidth, FormEditor.ClientHeight, WHITENESS);
  Image1.Repaint;

  X := X + CoolBar.Width;
  r := Rect(AX,AY, X,Y);
  FormEditor.Canvas.Pen.Color := clBlack;
  FormEditor.Canvas.Brush.Style := bsClear;
  case DrawKind of
    ARect :
      FormEditor.Canvas.Rectangle(r);
    AEllipse :
      FormEditor.Canvas.Ellipse(r);
  end;
end;

end.
