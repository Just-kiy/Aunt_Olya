unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtDlgs;

type
  TForm1 = class(TForm)
    Background: TImage;
    BackgrTitle: TShape;
    MainTitle: TLabel;
    MainEdit: TEdit;
    Question: TLabel;
    ResultButt: TButton;
    ResultText: TLabel;
    AdviceText: TLabel;
    UpHint: TLabel;
    SaveScr: TButton;
    procedure MainEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Result(str: string);
    procedure ResultButtClick(Sender: TObject);
    procedure BackgroundMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ResultButtMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SaveScrClick(Sender: TObject);
    procedure TotalExplode();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  count: integer;
  ex : boolean;

implementation

{$R *.dfm}


procedure TForm1.BackgroundMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     UpHint.Visible:=false;
end;


procedure TForm1.MainEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var s : string;
begin
     UpHint.Visible:=true;
     UpHint.Caption:='Говори быстрее, говна кусок!';
     if Key = 13 then
     begin
          s:=MainEdit.Text;
          Result(s);
          MainEdit.Text:='';
          Question.Visible:=false;
          UpHint.Visible:=false;
          BackgrTitle.Visible:=false;
     end;
end;

procedure TForm1.Result(str: string);
var i, u : byte;
    a : array [1..23] of string;
begin
     a[1]:=', говна кусок';
     a[2]:=', пидрилла';
     a[3]:=', псина';
     a[4]:=', ёба';
     a[5]:=', якут';
     a[6]:=', мудозвон сосущий';
     a[7]:=', сука';
     a[8]:=', рыжий кривочлен';
     a[9]:=', щуплый подпиздявчик';
     a[10]:=', рыхлый потеющий лобочек Тёти Оли';
     a[11]:=', неудачник';
     a[12]:=', лошара';
     a[13]:=', шлюха';
     a[14]:=', сперматоблядскаяхуевыебень';
     a[15]:=', детдомовский хуепёздок';
     a[16]:=', подзалупный творожок';
     a[17]:=', Диана';
     a[18]:=', Лейла';
     a[19]:=', Даша';
     a[20]:=', Гриневич';
     a[21]:=', мортышлюшка';
     a[22]:=', Дудрище';
     a[23]:=', задрот ебанный';
     ex := false;
     ResultButt.Visible:=false;
     MainTitle.Visible:=false;
     //Hintbutton.Visible:=false;
     MainEdit.Visible:=False;
     SaveScr.Visible:=true;
     ResultText.Visible:=true;
     AdviceText.Visible:=true;
     i:=random(100);
     u:=random(23)+1;
     if i < 60 then
        begin
             ResultText.Caption:='Нельзя';
             AdviceText.Caption:='Тебе нельзя '+ str + a[u];
        end
     else  begin
                ResultText.Caption:='Можно';
                AdviceText.Caption:='Отличная идея, можешь '+ str + a[u];
     end;
     ResultButt.Visible:=true;

end;

procedure TForm1.ResultButtClick(Sender: TObject);
begin
     ResultText.Caption:='';
     AdviceText.Caption:='';
     ResultButt.Visible:=false;
     MainEdit.Visible:=true;
     MainTitle.Visible:=true;
     Question.Visible:=true;
     BackgrTitle.Visible:=true;
     SaveScr.Visible:=false;
     AdviceText.Visible:=false;
     if ex then Application.Terminate;
     count := count + 1;
end;

procedure TForm1.ResultButtMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     UpHint.Visible:=true;
     case count of
     0..2:  UpHint.Caption:='Нажал быстро, уебок!';
     3:  UpHint.Caption:='Заебал спрашивать, я тебе не мамка, UEBAN!';
     4:  UpHint.Caption:='Тебе поговорить не с кем, ублюдок?!';
     5: UpHint.Caption:='Не трать мое время, лучше лабу пиши!';
     6:UpHint.Caption:='Ты нарываешься, пидр!';
     else begin
               TotalExplode;
               ex := true;
          end;
     end;
end;

procedure TForm1.SaveScrClick(Sender: TObject);
const
  CAPTUREBLT = $40000000;
var  ScreenBM:TBitMap;
     SendJPG:TJPEGImage;
     i:integer;
     tmp : TTimeStamp;
begin
     i := random(1000)+1;
     ScreenBM:=TBitMap.Create;
     SendJPG:=TJPEGImage.Create;
     ScreenBM.Width:=Form1.Width;
     ScreenBM.Height:=Form1.Height;
     BitBlt(ScreenBM.Canvas.Handle, 0, 0, Form1.Width, Form1.Height, GetDC(0), Form1.Top, Form1.Left, SRCCopy);
     SendJPG.Assign(ScreenBM);
     tmp := DateTimeToTimeStamp(Date);
     //SaveScr.Caption:=tmp;
     SendJPG.SaveToFile('Screenshots\SS'+inttostr(tmp.Date)+' '+inttostr(tmp.Time)+'.jpg');
     SendJPG.Free;
     ScreenBM.Free;
end;

procedure TForm1.TotalExplode;
var ZH: TImage;
    i : integer;
begin
          ZH:=TImage.Create(self);
          ZH.Parent:=self;
          ZH.Left:=random(500);
          ZH.Top:=random(300);
          ZH.Height:=240;
          ZH.Width:=180;
          ZH.Picture.LoadFromFile('error_picture_small.jpg');
end;

end.
