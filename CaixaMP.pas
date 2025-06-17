unit CaixaMP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls;

type
  TF_CaixaMP = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    Label5: TLabel;
    MaskEdit3: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CaixaMP: TF_CaixaMP;

implementation

{$R *.DFM}

procedure TF_CaixaMP.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit2.setfocus;
  if key = 27 then close;
end;

procedure TF_CaixaMP.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit3.setfocus;
  if key = 27 then maskedit1.setfocus;  
end;

procedure TF_CaixaMP.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
  if key = 27 then maskedit1.setfocus;  
end;

procedure TF_CaixaMP.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TF_CaixaMP.BitBtn1Click(Sender: TObject);
var
  prot, usu, dia, mes, ano : String;
  reg : Integer;
begin
//  reg := tabela.caixa.recno;
{  if copy(maskedit1.text,4,2) <> '  ' then
  begin
    usu := maskedit2.text;
    dia := copy(maskedit1.text,1,2);
    mes := copy(maskedit1.text,4,2);
    ano := copy(maskedit1.text,7,4);
    tabela.caixa.setorder(1);
    if not tabela.caixa.seek(ano + mes + dia + usu) then
    begin
      tabela.caixa.go(reg);
      showmessage('Movimento não localizado');
      maskedit1.setfocus;
      exit;
    end
    else close;
  end
  else
  begin
    if maskedit3.text <> '' then
    begin
      prot := '      ' + maskedit3.text;
      prot := copy(prot, length(prot) - 5, 6);
      tabela.caixa.setorder(2);
      if not tabela.caixa.seek(prot) then
      begin
        tabela.caixa.go(reg);
        showmessage('Protocolo não localizado');
        maskedit3.setfocus;
        exit;
      end
      else close;
    end;
  end; }
end;

end.
