unit Calc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, Buttons, DBCtrls;

type
  TF_Calc = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    DBEdit2: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Calc: TF_Calc;

implementation

{$R *.DFM}

procedure TF_Calc.BitBtn1Click(Sender: TObject);
begin
  label2.caption := 'X';
  Maskedit2.setfocus;
end;

procedure TF_Calc.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  Begin
    bitbtn5.setfocus;
  end;
end;

procedure TF_Calc.BitBtn5Click(Sender: TObject);
begin
 // tabela.apoio.fieldbyname('valor').ascurrency := tabela.apoio.fieldbyname('distrib').ascurrency;
  close;
end;

procedure TF_Calc.FormActivate(Sender: TObject);
begin
  bitbtn5.setfocus;
end;

procedure TF_Calc.MaskEdit2Exit(Sender: TObject);
begin
  //if label2.caption = 'X' then tabela.apoio.fieldbyname('distrib').ascurrency := tabela.apoio.fieldbyname('valor').ascurrency * strtoint(maskedit2.text);
  //if label2.caption = '/' then tabela.apoio.fieldbyname('distrib').ascurrency := tabela.apoio.fieldbyname('valor').ascurrency / strtoint(maskedit2.text);
  //if label2.caption = '+' then tabela.apoio.fieldbyname('distrib').ascurrency := tabela.apoio.fieldbyname('valor').ascurrency + strtoint(maskedit2.text);
 // if label2.caption = '-' then tabela.apoio.fieldbyname('distrib').ascurrency := tabela.apoio.fieldbyname('valor').ascurrency - strtoint(maskedit2.text);
end;

procedure TF_Calc.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn5.setfocus;
  if key = 27 then close;  
end;

procedure TF_Calc.BitBtn2Click(Sender: TObject);
begin
  label2.caption := '/';
  Maskedit2.setfocus;
end;

procedure TF_Calc.BitBtn3Click(Sender: TObject);
begin
  label2.caption := '+';
  Maskedit2.setfocus;
end;

procedure TF_Calc.BitBtn4Click(Sender: TObject);
begin
  label2.caption := '-';
  Maskedit2.setfocus;
end;

procedure TF_Calc.BitBtn1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
end;

procedure TF_Calc.BitBtn2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
end;

procedure TF_Calc.BitBtn3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
end;

procedure TF_Calc.BitBtn4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
end;

procedure TF_Calc.BitBtn5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
end;

procedure TF_Calc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
end;

end.
