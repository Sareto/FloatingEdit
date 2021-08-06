program FloattingEdit;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  FMX.CustomEdit in '..\Comuns\FMX.CustomEdit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
