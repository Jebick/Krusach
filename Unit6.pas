unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Gauges, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm6 = class(TForm)
    Image1: TImage;
    Gauge1: TGauge;
    Timer1: TTimer;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Timer1Timer(Sender: TObject);
begin
gauge1.progress:= gauge1.progress+1;
label1.caption:='Загрузка, подождите...' + inttostr(gauge1.progress);
if gauge1.progress=100 then
begin
  Timer1.enabled:=false;
  Form6.close;
end;
end;
end.
