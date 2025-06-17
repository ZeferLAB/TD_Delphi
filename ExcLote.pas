unit ExcLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_ExcLote = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ExcLote: TF_ExcLote;

implementation

uses Menu, DigDup2;

{$R *.DFM}

procedure TF_ExcLote.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ExcLote.BitBtn2Click(Sender: TObject);
begin
  F_ExcLote.Maskedit1.Text := '';
  F_ExcLote.Maskedit2.Text := '';
  F_ExcLote.Maskedit1.SetFocus;
end;

procedure TF_ExcLote.FormActivate(Sender: TObject);
begin
  F_ExcLote.Maskedit1.Text := '';
  F_ExcLote.Maskedit2.Text := '';
  F_ExcLote.Maskedit1.SetFocus;
end;

procedure TF_ExcLote.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    F_ExcLote.Maskedit2.Text := F_ExcLote.Maskedit1.Text;
    F_ExcLote.BitBtn1.SetFocus;
  end;
end;

procedure TF_ExcLote.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_ExcLote.BitBtn1.SetFocus;
end;

procedure TF_ExcLote.BitBtn1Click(Sender: TObject);
var
  arq, sub, cam1, cam2, img : String;
  prot_inicial, prot_final, prot_atual, extensao : integer;

begin
  if (not ValidNumero(F_ExcLote.MaskEdit1.Text)) or (not ValidNumero(F_ExcLote.MaskEdit2.Text)) then
  begin
    showmessage('Intervalo de Protocolos Inválido !!!');
    F_ExcLote.Maskedit1.SetFocus;
    Exit;
  end;
  { Nome da imagem }
  arq := strzero(F_ExcLote.Maskedit1.Text,6);
  { Definindo subdiretório }
  sub := F_menu.DefineSub(F_ExcLote.Maskedit1.Text);
  { Carregando caminho das imagens }
  cam1 := F_Menu.Label17.Caption;
  cam2 := F_Menu.Label17.Caption;
  if right(cam1,1) <> '\' then cam1 := cam1 + '\';
  if Assigned(F_DigDup2) then
  begin

    if F_DigDup2.MaskEdit4.Text = 'B' then
    begin
      cam1 := F_Menu.Label17.Caption + 'livroB\';
      cam2 := F_Menu.Label17.Caption + 'livroB\'
    end
    else
    begin
      cam1 := F_Menu.Label17.Caption + 'livroC\';
      cam2 := F_Menu.Label17.Caption + 'livroC\'
    end;

    if right(cam1,1) <> '\' then cam1 := cam1 + '\';
//  if label7.caption = 'certifi' then cam1 := cam1 + 'CERTIF\';
//  if label7.caption = 'certifi' then cam2 := cam2 + '\CERTIF';

    if F_DigDup2.label7.caption = 'certifi' then cam1 := cam1 + 'CERTIF\';
    if F_DigDup2.label7.caption = 'certifi' then cam2 := cam2 + '\CERTIF';
  end
  else
  begin
    if F_DigDup2.label7.caption = 'certifi' then cam1 := cam1 + 'CERTIF\';
    if F_DigDup2.label7.caption = 'certifi' then cam2 := cam2 + '\CERTIF';
  end;
  img  := cam1 + sub + arq + '.001';

  if messagedlg('Iniciar Rotina de Exclusão ?', mtconfirmation, [mbyes, mbno],0)= Mryes then
  begin
    prot_inicial := StrToInt(F_ExcLote.Maskedit1.Text);
    prot_final   := StrToInt(F_ExcLote.Maskedit2.Text);
    prot_atual   := prot_inicial;
    extensao     := 1;
    while (prot_atual >= prot_inicial) and (prot_atual <= prot_final) do
    begin
      img  := cam1 + sub + strzero(IntToStr(prot_atual),6) + '.' + strzero(IntToStr(extensao),3);
      if FileExists(img) then
      begin
        DeleteFile(img);
        extensao := extensao + 1;
      end
      else
      begin
        extensao   := 1;
        prot_atual := prot_atual + 1;
      end;
    end;
    Showmessage('Rotina de Exclusão Concluída !!!');
  end;
  F_ExcLote.BitBtn2Click(F_ExcLote);
end;

end.
