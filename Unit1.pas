unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, System.UIConsts,
  FMX.ScrollBox, FMX.Memo, FMX.ISIcones, FMX.DateTimeCtrls, FMX.Layouts,
  FMX.CustomEdit;

type
  TForm1 = class(TForm)
    lytNovoEditar: TLayout;
    Scroll: TVertScrollBox;
    Layout1: TLayout;
    Edit1: TEdit;
    Label4: TLabel;
    Layout2: TLayout;
    Label5: TLabel;
    TimeEdit1: TTimeEdit;
    Layout3: TLayout;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    Layout4: TLayout;
    Edit2: TEdit;
    Label7: TLabel;
    ISIcone3: TISIcone;
    Layout5: TLayout;
    Edit3: TEdit;
    Label8: TLabel;
    Layout6: TLayout;
    Edit4: TEdit;
    Label9: TLabel;
    procedure ISIcone3Tap(Sender: TObject; const Point: TPointF);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ISIcone3Tap(Sender: TObject; const Point: TPointF);
begin
  edit2.Text := 'Um texto qualquer';
end;

end.
