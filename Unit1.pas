unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, System.UIConsts;

type
  TForm1 = class(TForm)
    edtCNPJCPF: TEdit;
    imgLimpaCPF: TImage;
    lblCnpjCpf: TLabel;
    procedure edtCNPJCPFChangeTracking(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}


//Adicione o ChangeTracking para todos os edits que vc quer esse feito
//Deixe a extrutura como esta no edit do form
procedure TForm1.edtCNPJCPFChangeTracking(Sender: TObject);
var
  i: integer;
begin
  try
    For i:=0 to (sender as tedit).ChildrenCount - 1 do
    Begin
      if(((sender as tedit).Children[i]) is TLabel)then
      begin
        if(trim((sender as tedit).Text)<>'')Then
        begin
          if((((Sender as tEdit).Children[i]) as TLabel).Position.Y = 0)Then
          begin
            (((Sender as tEdit).Children[i]) as TLabel).AnimateFloat('Position.Y',-22,0.2,TAnimationType.&In, TInterpolationType.Linear);
            Sleep(100);
            (((Sender as tEdit).Children[i]) as TLabel).FontColor   := TalphaColor($FF0E98D7);
            (((Sender as tEdit).Children[i]) as TLabel).Font.Size   := 11;
            (((Sender as tEdit).Children[i]) as TLabel).Opacity     := 1;
            (((Sender as tEdit).Children[i]) as TLabel).Position.Y  := -22;
          end;
        end
        else
        begin
          (((Sender as tEdit).Children[i]) as TLabel).AnimateFloat('Position.Y',0,0.2,TAnimationType.&In, TInterpolationType.Linear);
          Sleep(100);
          (((Sender as tEdit).Children[i]) as TLabel).FontColor   := claBlack;
          (((Sender as tEdit).Children[i]) as TLabel).Font.Size   := 16;
          (((Sender as tEdit).Children[i]) as TLabel).Opacity     := 0.5;
          (((Sender as tEdit).Children[i]) as TLabel).Position.Y  := 0;
        end;
      end;
    End;
  except

  end;
end;

end.
