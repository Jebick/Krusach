unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.MPlayer,
  Vcl.OleCtrls, WMPLib_TLB, SHDocVw, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TForm4 = class(TForm)
    WindowsMediaPlayer1: TWindowsMediaPlayer;
    WebBrowser1: TWebBrowser;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image7: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
   private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}


procedure TForm4.FormCreate(Sender: TObject);
begin
 WebBrowser1.Hide;
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
 Close
end;

procedure TForm4.Image2Click(Sender: TObject);
begin
WebBrowser1.Show;
WebBrowser1.Navigate(extractfilepath(paramstr(0))+'Прикол.htm');
end;

procedure TForm4.Image3Click(Sender: TObject);
begin
WebBrowser1.Hide;
end;

end.
