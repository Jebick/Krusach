unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TForm5 = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Label1: TLabel;
    Image7: TImage;
    Image1: TImage;
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
ball:=0; //изначально количество баллов 0
end;

procedure TForm5.Image1Click(Sender: TObject);
begin
Close
end;

procedure TForm5.Image2Click(Sender: TObject);
begin
begin
//Если выбран вариант ответа и не достигнут конец файла
if (RadioGroup2.ItemIndex>-1) and (not Eof(f)) then begin
if RadioGroup2.ItemIndex = Nvern-1 then ball:=ball+1; //Если выбранный вариант соответствует
RadioGroup2.Items.Clear; //номеру верного ответа то балл прибавляется
Repeat //и очищается поле для следующего вопроса
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
//Если конец файла достигнут, значит вопросы закончились
Else if Eof(f) then begin
delete(s,1,1);
Nvern:=StrToInt(s);
Image2.Enabled:=True;
if RadioGroup2.ItemIndex = Nvern-1 then ball:=ball+1;
Label1.Caption:=IntToStr(ball); //Вывод количества баллов
CloseFile(f);
RadioGroup1.Enabled:=true;
end;
end;
end;

procedure TForm5.RadioGroup1Click(Sender: TObject);
begin
RadioGroup1.Enabled:=false; //Выбор варианта становится недоступен
RadioGroup2.Enabled:=true; //Доступным становится поле с вопросом
Image2.Enabled:=true; //Кнопка Далее
case RadioGroup1.ItemIndex of //В зависимости от выбранного варианта переменная f
0: AssignFile( f ,'C:\Users\home\Desktop\Proect\variant1.txt', CP_UTF8);//связывается с разными файлами
1: AssignFile( f ,'C:\Users\home\Desktop\Proect\variant2.txt', CP_UTF8);
end;
reset(f); //Открываем файл для чтения
readln(f,s); //Считываем первую строку из файла
repeat
if (s[1]='-') then begin //Если первый символ строки ‘-‘ значит это вопрос
delete(s,1,1);
RadioGroup2.Caption:=s;
end
else if s[1]='*' then begin //Если перв символ ‘*’ значит это номер верного ответа
delete(s,1,1);
Nvern:=StrToInt(s);
end
else RadioGroup2.Items.Add(s); //Иначе это вариант ответа
readln(f,s); //Считываем следующую строку из файла
until (s[1]='-') or (Eof(f)); //Считывание и отправление вариантов ответов в RadiGroup до тех пор
// пока не достигнут следующий вопрос или конец файла
end;

end.
