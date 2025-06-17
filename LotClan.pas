unit LotClan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, NcsAlignment, Mask;

type
  TF_LotClan = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    NcsAlignment1: TNcsAlignment;
    RichEdit14: TRichEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    btnJustificar: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    RichEdit2: TRichEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure btnJustificarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_LotClan: TF_LotClan;

implementation

uses U_Certidao, DMTD;

{$R *.DFM}

procedure TF_LotClan.BitBtn1Click(Sender: TObject);
begin
  F_Certidao.mens_lote1  := RichEdit14.Lines.Strings[0];
  F_Certidao.mens_lote2  := RichEdit14.Lines.Strings[1];
  F_Certidao.mens_lote3  := RichEdit14.Lines.Strings[2];
  F_Certidao.mens_lote4  := RichEdit14.Lines.Strings[3];
  F_Certidao.mens_lote5  := RichEdit14.Lines.Strings[4];
  F_Certidao.mens_lote6  := RichEdit14.Lines.Strings[5];
  F_Certidao.mens_lote7  := RichEdit14.Lines.Strings[6];
  F_Certidao.mens_lote8  := RichEdit14.Lines.Strings[7];
  F_Certidao.mens_lote9  := RichEdit14.Lines.Strings[8];
  F_Certidao.mens_lote10 := RichEdit14.Lines.Strings[9];
  F_Certidao.mens_lote11 := RichEdit14.Lines.Strings[10];
  F_Certidao.mens_lote12 := RichEdit14.Lines.Strings[11];
  F_Certidao.mens_lote13 := RichEdit14.Lines.Strings[12];

  F_Certidao.mens_lote14 := RichEdit14.Lines.Strings[13];
  F_Certidao.mens_lote15 := RichEdit14.Lines.Strings[14];
  F_Certidao.mens_lote16 := RichEdit14.Lines.Strings[15];
  F_Certidao.mens_lote17 := RichEdit14.Lines.Strings[16];
  F_Certidao.mens_lote18 := RichEdit14.Lines.Strings[17];
  F_Certidao.mens_lote19 := RichEdit14.Lines.Strings[18];
  F_Certidao.mens_lote20 := RichEdit14.Lines.Strings[19];

  Close;
end;

procedure TF_LotClan.FormActivate(Sender: TObject);
begin
  F_LotClan.ComboBox1.Clear;
  DM.qryCertificados.Close;
  DM.qryCertificados.Sql.Clear;
  DM.qryCertificados.Sql.Add('SELECT * FROM certificos ORDER BY descricao');
  DM.qryCertificados.Open;
  DM.qryCertificados.FindFirst;
  While not DM.qryCertificados.Eof do
  begin
    F_LotClan.ComboBox1.Items.Add(DM.qryCertificados.fieldbyname('descricao').asString);
    DM.qryCertificados.next;
  end;
  DM.qryCertificados.Close;


  F_Certidao.mens_lote1  := '';
  F_Certidao.mens_lote2  := '';
  F_Certidao.mens_lote3  := '';
  F_Certidao.mens_lote4  := '';
  F_Certidao.mens_lote5  := '';
  F_Certidao.mens_lote6  := '';
  F_Certidao.mens_lote7  := '';
  F_Certidao.mens_lote8  := '';
  F_Certidao.mens_lote9  := '';
  F_Certidao.mens_lote10 := '';
  F_Certidao.mens_lote11 := '';
  F_Certidao.mens_lote12 := '';
  F_Certidao.mens_lote13 := '';


{
  F_LotClan.RichEdit14.Lines.Add('CERTIDÃO   NEGATIVA  DE ÔNUS  REAIS:- Certifico e dou fé, que o');
  F_LotClan.RichEdit14.Lines.Add('imóvel  constante   da   presente   matrícula,   está  LIVRE  E');
  F_LotClan.RichEdit14.Lines.Add('DESEMBARAÇADO DE TODOS E QUAISQUER ÔNUS, AÇÕES REAIS E PESSOAIS');
  F_LotClan.RichEdit14.Lines.Add('REIPERSECUTÓRIAS, RECONHECIDOS EM  LEI,  ATÉ ÀS  10:00 HORAS DE');
  F_LotClan.RichEdit14.Lines.Add('HOJE. O referido é verdade e dou fé.- Guarapari-ES, ');
  F_LotClan.RichEdit14.Lines.Add('O Oficial.- ');
}
end;

procedure TF_LotClan.ComboBox1Change(Sender: TObject);
begin
  DM.qryCertificados.Close;
  DM.qryCertificados.Sql.Clear;
  DM.qryCertificados.Sql.Add('SELECT * FROM certificos WHERE descricao = ' + #39 + Trim(F_LotClan.ComboBox1.Text) + #39);
  DM.qryCertificados.Open;
  if DM.qryCertificados.RecordCount <> 0 then
    F_LotClan.RichEdit14.Text := DM.qryCertificados.FieldByName('texto').AsString
  else
    F_LotClan.RichEdit14.Text := '';
  DM.qryCertificados.Close;
end;

procedure TF_LotClan.btnJustificarClick(Sender: TObject);
var
  x : Integer;
begin
  NcsAlignment1.Width := 65;
  RichEdit2.Clear;
  for x := 0 to RichEdit14.Lines.Count do
  Begin
    Edit1.Text := RichEdit14.Lines.Strings[x];
    if (pos(Copy(Edit1.Text, length(edit1.text), 1), '.:') = 0) and (length(edit1.Text) > (65/2)) then
    Begin
      NcsAlignment1.Text := Edit1.Text;
      Edit2.text := NcsAlignment1.Result;
    end
    else
    begin
      Edit2.Text := Edit1.Text;
    end;
    RichEdit2.Lines.Add(Edit2.Text);
  end;

  RichEdit14.Clear;
  for x := 0 to RichEdit2.Lines.Count do RichEdit14.Lines.Add(RichEdit2.Lines.strings[x]);

end;

procedure TF_LotClan.BitBtn2Click(Sender: TObject);
begin
    //Como adicionar uma linha formatada (cor, negrito, etc) num RichEdit
    //Richedit14.SelAttributes.Color:=clBLue; // Cor Azul
    //Richedit14.SelAttributes.Style:=[fsBold,fsUnderline]; // Negrito e sublinhado
    //Richedit1.Lines.Add('Linha'); // Adiciona linha
    //Richedit1.SelAttributes.Style:=[]; // Volta ao estilo normal
    //Richedit1.SelAttributes.Color:=clBlack; // Volta à cor normal

    Richedit14.SelAttributes.Style:=[fsBold]; // Só negritar

end;

procedure TF_LotClan.BitBtn3Click(Sender: TObject);
begin
     Richedit14.SelAttributes.Style:=[]; // Volta ao estilo normal
end;

end.
