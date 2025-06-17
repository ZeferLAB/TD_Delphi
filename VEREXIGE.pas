unit VerExige;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, WPDefs, WPPrint, WpWinCtr, WPRich;

type
  TF_VerExige = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    WPRichText2: TWPRichText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    Procedure Conta_Exige(Sender : TObject);    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_VerExige: TF_VerExige;
  dir, sub, arq, via, arq_ant : string;
  acabou : Boolean;

implementation

uses Info, DMTD, Menu, FuncGeral;

{$R *.DFM}

Procedure TF_VerExige.Conta_Exige(Sender : TObject);
var
  x, contador : integer;
begin
  { checando se existe exigência }
  sub      := DefSub(Trim(Label3.Caption)) + '\';
  x        := 1;
  contador := 0;
  while x <= 9 do
  begin
    arq      := '';
    arq      := 'E' + Label3.Caption + '_' + IntToStr(x) + '.rtf';
    if FileExists(dir + sub + arq) then
    begin
      contador := contador + 1;
      x := x + 1;
    end
    else x := x + 10;
  end;
  Label2.Caption := '01/' + StrZero(IntToStr(contador), 2);
end;

procedure TF_VerExige.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_VerExige.FormActivate(Sender: TObject);
begin
  dir := F_Menu.Label18.Caption;
  conta_exige(F_VerExige);
  arq := 'E' + Label3.Caption + '_1' + '.rtf';
  via := copy(arq,length(arq) - 4,1);
  sub := DefSub(Trim(Label3.Caption)) + '\';  
  if FileExists(dir + sub + arq) then
  begin
    { loading... }
    WpRichText2.LoadFromFile(dir + sub + arq);
    WpRichText2.Refresh;
    WpRichText2.MovePosition(WpmHome, False);
    WpRichText2.SetFocus;
  end;
  arq := '';
end;

procedure TF_VerExige.BitBtn1Click(Sender: TObject);
begin
  arq_ant  := arq;
  arq      := '';
  arq      := 'E' + Label3.Caption + '_' + IntToStr(StrToInt(Copy(Label2.Caption, 1,2)) + 1) + '.rtf';
  if FileExists(dir + sub + arq) then
  begin
    Label2.Caption := StrZero(IntToStr(StrToInt(Copy(Label2.Caption, 1,2)) + 1), 2) + '/' + StrZero(Copy(Label2.Caption, 4,2), 2);
    WPRichText2.Clear;
    WpRichText2.LoadFromFile(dir + sub + arq);
    WpRichText2.Refresh;
    WpRichText2.MovePosition(WpmHome, False);
    WpRichText2.SetFocus;    
  end
  else
  begin
    arq := arq_ant;
    ShowMessage('FIM DAS EXIGÊNCIAS !');
    Exit;
  end;
end;

procedure TF_VerExige.BitBtn2Click(Sender: TObject);
begin
  if (StrToInt(Copy(Label2.Caption, 1,2)) < 1) then
  begin
    ShowMessage('EXIGÊNCIA INVÁLIDA !');
    Exit;
  end;
  arq_ant  := arq;
  arq      := '';
  arq      := 'E' + Label3.Caption + '_' + IntToStr(StrToInt(Copy(Label2.Caption, 1,2)) - 1) + '.rtf';
  if FileExists(dir + sub + arq) then
  begin
    Label2.Caption := StrZero(IntToStr(StrToInt(Copy(Label2.Caption, 1,2)) - 1), 2) + '/' + StrZero(Copy(Label2.Caption, 4,2), 2);
    WPRichText2.Clear;
    WpRichText2.LoadFromFile(dir + sub + arq);
    WpRichText2.Refresh;
    WpRichText2.MovePosition(WpmHome, False);
    WpRichText2.SetFocus;    
  end
  else
  begin
    arq := arq_ant;
    ShowMessage('EXIGÊNCIA NÃO ENCONTRADA !');
    Exit;
  end;
end;

end.
