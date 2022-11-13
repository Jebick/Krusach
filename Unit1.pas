unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.MPlayer,
  Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg, Vcl.Menus,ShellAPI;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4, Unit5, Unit6;


procedure TForm1.Image1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
Form5.showmodal;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
Image4.Visible:=True;
Image5.Visible:=True;
Image6.Visible:=True;

end;

procedure TForm1.Image4Click(Sender: TObject);
begin
 Form4.showmodal;
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
 Form2.showmodal;
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
 Form3.showmodal;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
ShellExecute(0,PChar('open'),PChar('Delphihelp.chm'),nil,nil,sw_show);
end;

end.
