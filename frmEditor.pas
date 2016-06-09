unit frmEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Jpeg, ExtDlgs, StdCtrls, Buttons, ToolWin, ComCtrls;

type
  TDrawKind = (eNone, eRect, eEllipse);

  TFormEditor = class(TForm)
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
    procedure DrawImage(ACanvas : TCanvas; ARect : TRect);
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
  var Pic: TPicture; r : TRect;  k : double;
begin
  DrawKind := eNone;
  doDraw := false;
  Pic := TPicture.Create;
  try
    Pic.LoadFromFile(FFileName);
    k := Image1.ClientWidth / Pic.Graphic.Width;
    r := Rect(1,1, Round(Pic.Graphic.Width * k), Round(Pic.Graphic.Height * k));
    Image1.Canvas.StretchDraw(r, Pic.Graphic);
  finally
    Pic.Free;
  end;
end;

procedure TFormEditor.Image1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if DrawKind = eNone then Exit;
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
  if DrawKind = eNone then Exit;
  AX := AX - CoolBar.Width;
  r := Rect(AX,AY,X,Y);
  DrawImage(Image1.Canvas, r);
  doDraw := false;
end;

procedure TFormEditor.sbEllipseClick(Sender: TObject);
begin
  DrawKind := eEllipse;
end;

procedure TFormEditor.sbRectClick(Sender: TObject);
begin
  DrawKind := eRect;
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
  DrawImage(FormEditor.Canvas, r);
end;

procedure TFormEditor.DrawImage(ACanvas: TCanvas; ARect: TRect);
begin
  ACanvas.Pen.Color := clBlack;
  ACanvas.Pen.Width := 2;
  ACanvas.Brush.Style := bsClear;
  case self.DrawKind of
    eRect :
      ACanvas.Rectangle(ARect);
    eEllipse :
      ACanvas.Ellipse(ARect);
  end;
end;


end.
