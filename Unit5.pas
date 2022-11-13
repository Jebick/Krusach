unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TForm5 = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Label1: TLabel;
    Image1: TImage;
    Image7: TImage;
    Image2: TImage;
    procedure RadioGroup1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  f: text;
  s: string;
  Nvern, ball: integer;


implementation

{$R *.dfm}




procedure TForm5.FormCreate(Sender: TObject);
begin
ball:=0; //���������� ���������� ������ 0
end;

procedure TForm5.Image1Click(Sender: TObject);
begin
begin
//���� ������ ������� ������ � �� ��������� ����� �����
if (RadioGroup2.ItemIndex>-1) and (not Eof(f)) then begin
if RadioGroup2.ItemIndex = Nvern-1 then ball:=ball+1; //���� ��������� ������� �������������
RadioGroup2.Items.Clear; //������ ������� ������ �� ���� ������������
Repeat //� ��������� ���� ��� ���������� �������
if (s[1]='-') then begin
delete(s,1,1);
RadioGroup2.Caption:=s;
end
else if s[1]='*' then begin
delete(s,1,1);
Nvern:=StrToInt(s);
end
else RadioGroup2.Items.Add(s);
readln(f,s);
Label1.Caption:=IntToStr(ball);
until (s[1]='-') or (Eof(f));
end
//���� ����� ����� ���������, ������ ������� �����������
Else if Eof(f) then begin
delete(s,1,1);
Nvern:=StrToInt(s);
if RadioGroup2.ItemIndex = Nvern-1 then ball:=ball+1;
Label1.Caption:=IntToStr(ball); //����� ���������� ������
CloseFile(f);
RadioGroup1.Enabled:=True;
end;
end;

end;

procedure TForm5.Image2Click(Sender: TObject);
begin
Close
end;

procedure TForm5.RadioGroup1Click(Sender: TObject);
begin
RadioGroup1.Enabled:=false; //����� �������� ���������� ����������
RadioGroup2.Enabled:=true; //��������� ���������� ���� � ��������
Image1.Enabled:=true; //������ �����
case RadioGroup1.ItemIndex of //� ����������� �� ���������� �������� ���������� f
0: AssignFile( f ,'variant1.txt', CP_UTF8);//����������� � ������� �������
1: AssignFile( f ,'variant2.txt', CP_UTF8);
end;
reset(f); //��������� ���� ��� ������
readln(f,s); //��������� ������ ������ �� �����
repeat
if (s[1]='-') then begin //���� ������ ������ ������ �-� ������ ��� ������
delete(s,1,1);
RadioGroup2.Caption:=s;
end
else if s[1]='*' then begin //���� ���� ������ �*� ������ ��� ����� ������� ������
delete(s,1,1);
Nvern:=StrToInt(s);
end
else RadioGroup2.Items.Add(s); //����� ��� ������� ������
readln(f,s); //��������� ��������� ������ �� �����
until (s[1]='-') or (Eof(f)); //���������� � ����������� ��������� ������� � RadiGroup �� ��� ���

// ���� �� ��������� ��������� ������ ��� ����� �����
end;

end.
