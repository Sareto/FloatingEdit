unit FMX.CustomEdit;

interface

Uses
  FMX.Edit, System.UITypes, System.Classes, FMX.Controls, FMX.StdCtrls,
  System.SysUtils, System.UIConsts;

Type
  TEdit = class(TCustomEdit)
  private
    posX, posY: Single;
    Function GetControl(aSrc : TControl; aTag : Integer) : TControl;
    procedure Floatting(Sender: TObject);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); Override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); Override;
    procedure DoEnter; Override;
    procedure DoExit; Override;
    procedure SetText(const Value: string); Override;
  public
    property Action;
  published
    property ControlType;
    property OnPresentationNameChoosing;
    { inherited }
    property Cursor default crIBeam;
    property CanFocus default True;
    property CanParentFocus;
    property DisableFocusEffect;
    property KeyboardType;
    property ReturnKeyType;
    property Password;
    property ReadOnly;
    ///<summary>Maxmimum length of text that can be input in the edit field.</summary>
    ///<remarks>On Android due to platform limitations text is truncated only after pressing ENTER key or after losing
    ///focus.</remarks>
    property MaxLength;
    ///<summary>Defines characters which can be input in the edit field. All characters not in FilterChar will be
    ///ignored. Empty FilterChar value means no filtering.</summary>
    ///<remarks>On Android due to platform limitations text is filtered only after pressing ENTER key or after control
    ///losing focus.</remarks>
    property FilterChar;
    property Text;
    property TextSettings;
    property ImeMode;
    property Position;
    property Width;
    property Height;
    property ClipChildren default False;
    property ClipParent default False;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property Locked default False;
    property Hint;
    property HitTest default True;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property TextPrompt;
    property StyleLookup;
    property StyledSettings;
    property TouchTargetExpansion;
    property Visible default True;
    property Caret;
    property KillFocusByReturn;
    property CheckSpelling;
    property ParentShowHint;
    property ShowHint;
    property CharCase default TCustomEditModel.DefaultCharCase;
    { events }
    property OnChange;
    property OnChangeTracking;
    property OnTyping;
    property OnApplyStyleLookup;
    property OnValidating;
    property OnValidate;
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    property OnKeyDown;
    property OnKeyUp;
    property OnCanFocus;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnPainting;
    property OnPaint;
    property OnResize;
    property OnResized;
  end;

implementation

{ TEdit }
procedure TEdit.DoEnter;
begin
  inherited;
  TThread.CreateAnonymousThread(Procedure
  begin
    Floatting(Self);
  end).Start;
end;

procedure TEdit.DoExit;
begin
  inherited;
  TThread.CreateAnonymousThread(Procedure
  begin
    Floatting(Self);
  end).Start;
end;

procedure TEdit.Floatting(Sender: TObject);
var
  ALbl: TLabel;
begin
  ALbl := GetControl((Sender as TEdit), -1) as TLabel;
  if(ALbl <> nil)Then
  begin
    if(ALbl.Position.Y = 0)Then
    begin
      TThread.Synchronize(nil, procedure
      begin
        ALbl.Align       := FMX.Types.TAlignLayout.None;
        ALbl.AnimateFloat('Position.Y',-25,0.2,FMX.Types.TAnimationType.&In,
          FMX.Types.TInterpolationType.Linear);
        Sleep(50);
        ALbl.FontColor   := TalphaColor($FF0E98D7);
        ALbl.Font.Size   := 13;
        ALbl.Opacity     := 1;
      end);
    end
    else
    if(ALbl.Position.Y <> 0) and (trim((sender as tedit).Text)='') and not((Sender as TEdit).IsFocused) Then
    begin
      TThread.Synchronize(nil, procedure
      begin
        ALbl.AnimateFloat('Position.Y',0,0.2,FMX.Types.TAnimationType.&In,
          FMX.Types.TInterpolationType.Linear);
        Sleep(50);
        ALbl.FontColor   := claBlack;
        ALbl.Font.Size   := 16;
        ALbl.Opacity     := 0.5;
        ALbl.Align       := FMX.Types.TAlignLayout.Client;
      end);
    end;
  end;
end;

function TEdit.GetControl(aSrc: TControl; aTag: Integer): TControl;
Var
  X : Integer;
Begin
  Result := Nil;
  If aSrc.Tag = aTag Then
    Result := aSrc
  Else
  Begin
    X := 0;
    While (Result = Nil) And (x < aSrc.ControlsCount) Do
    Begin
      Result := GetControl(aSrc.Controls[x], aTag);
      Inc(x);
    End;
  End;
end;

procedure TEdit.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
begin
  posX := X;
  posY := Y;
end;

procedure TEdit.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if (Abs(posX-x) < 3) and (Abs(posY-Y)<3) then
    inherited MouseDown(Button, Shift, X, Y);
  posX := 0;
  posY := 0;
end;

procedure TEdit.SetText(const Value: string);
begin
  TThread.CreateAnonymousThread(Procedure
  begin
    Floatting(Self);
  end).Start;
  inherited;
end;

end.
