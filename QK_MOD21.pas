unit QK_MOD21;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, StdCtrls, ValorPor,
  NcsAlignment, ComCtrls;

type
  TF_Mod21 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    Table1: TTable;
    QRImage1: TQRImage;
    QRLabel61: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    ValorPorExtenso1: TValorPorExtenso;
    QRLabel64: TQRLabel;
    Label1: TLabel;
    QRLabel65: TQRLabel;
    Label2: TLabel;
    ValorPorExtenso2: TValorPorExtenso;
    QRImage2: TQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Mod21: TF_Mod21;
  mes : string;
  tam, x : Integer;

implementation

uses RAV, Menu;

{$R *.DFM}

procedure TF_Mod21.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{
  Qrlabel51.Enabled := False;
  Qrlabel53.Enabled := False;
  Qrlabel54.Enabled := False;
  Qrlabel64.Enabled := False;
  Qrlabel55.Enabled := False;
  Qrlabel56.Enabled := False;
  Qrlabel57.Enabled := False;
  Qrlabel58.Enabled := False;
  Qrlabel62.Enabled := False;
}
  mes := ver_mes(copy(f_rav.maskedit1.text,4,2));
  QrLabel6.Caption  := 'Santo André, ' + copy(f_rav.maskedit1.text,1,2) + ' de ' + mes + ' de ' + copy(f_rav.maskedit1.text,7,4) + '.';
  QrLabel43.Caption := 'Diadema, ' + copy(f_rav.maskedit1.text,1,2) + ' de ' + mes + ' de ' + copy(f_rav.maskedit1.text,7,4) + '.';
  QrLabel8.Caption  := Table1.FieldByName('nome').asString;
  QrLabel9.Caption  := Table1.FieldByName('endereco').asString + ' - ' + Table1.FieldByName('bairro').asString;
  QrLabel10.Caption := Table1.FieldByName('cep').asString + ' - ' + Table1.FieldByName('cidade').asString + Table1.FieldByName('uf').asString;
  QrLabel11.Caption := 'CNPJ/CPF:' + Table1.FieldByName('documento').asString;
  QrLabel23.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('vr_total').ascurrency);
  QrLabel74.Caption := Table1.FieldByName('protocolo').asString;
  QrLabel73.Caption := Table1.FieldByName('data_reg').asString;
  QrLabel47.Caption := Table1.FieldByName('fax_banco').asString + '%';
  QrLabel16.Caption := Trim(Table1.FieldByName('parcelas').asString) + ' parcela(s) vencida(s),';
  QrLabel66.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('emolumento').ascurrency);
  QrLabel67.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('estado').ascurrency);
  QrLabel68.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ipesp').ascurrency);
  QrLabel69.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('reg_civil').ascurrency);
  QrLabel70.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('trib_just').ascurrency);
  QrLabel71.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ar').ascurrency);
  QrLabel72.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('total').ascurrency);
  QrLabel54.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('vr_venc').ascurrency);
  QrLabel56.Caption := Table1.FieldByName('data_cel').asString;
  QrLabel61.Caption := Table1.FieldByName('contrato').asString;
  QrLabel63.Caption := Table1.FieldByName('nome_rem').asString;
  ValorPorExtenso1.valor := Table1.FieldByName('vr_venc').ascurrency;
  QrLabel64.Caption := '(' + label1.Caption + ')';
  ValorPorExtenso2.valor := Table1.FieldByName('vr_total').ascurrency;
  QrLabel65.Caption := '(' + label2.Caption + '),';


{
  RichEdit1.Clear;
  RichEdit1.Lines.Add(Qrlabel51.Caption + ' ' + Qrlabel53.Caption + ' ' + Qrlabel54.Caption);
  RichEdit1.Lines.Add('');
  RichEdit1.Lines.Add(Qrlabel64.Caption + ' ' + Qrlabel55.Caption);
  RichEdit1.Lines.Add('');
  RichEdit1.Lines.Add(Qrlabel56.Caption + ' ' + Qrlabel57.Caption);
  RichEdit1.Lines.Add('');
  RichEdit1.Lines.Add(Qrlabel58.Caption);
  RichEdit1.Lines.Add('');
  RichEdit1.Lines.Add(Qrlabel62.Caption);
}
{
  RichEdit1.Lines.Add(Qrlabel51.Caption + ' ' + Qrlabel53.Caption + ' ' + Qrlabel54.Caption + ' ' + Qrlabel64.Caption + ' ' + Qrlabel55.Caption + ' ' + Qrlabel56.Caption + ' ' + Qrlabel57.Caption + ' ' + Qrlabel58.Caption + ' ' + Qrlabel62.Caption);
  Edit1.text := Qrlabel51.Caption + ' ' + Qrlabel53.Caption + ' ' + Qrlabel54.Caption + ' ' + Qrlabel64.Caption + ' ' + Qrlabel55.Caption + ' ' + Qrlabel56.Caption + ' ' + Qrlabel57.Caption + ' ' + Qrlabel58.Caption + ' ' + Qrlabel62.Caption;
  tam := Length(Edit1.Text);

  QrRichText1.Lines.Add(Copy(Edit1.Text,1,80));
  QrRichText1.Lines.Add(Copy(Edit1.Text,81,80));
  QrRichText1.Lines.Add(Copy(Edit1.Text,161,80));
  QrRichText1.Lines.Add(Copy(Edit1.Text,241,80));
  QrRichText1.Lines.Add(Copy(Edit1.Text,321,80));
  QrRichText1.Lines.Add(Copy(Edit1.Text,401,80));
  QrRichText1.Lines.Add(Copy(Edit1.Text,481,80));
}
{
  edit2.Text := Copy(Edit1.Text,1,80);
  NcsAlignment1.Text := edit2.Text;
  QrRichText1.Lines.Add(NcsAlignment1.Result);
  edit2.Text := Copy(Edit1.Text,81,80);
  NcsAlignment1.Text := edit2.Text;
  QrRichText1.Lines.Add(NcsAlignment1.Result);
  edit2.Text := Copy(Edit1.Text,161,80);
  NcsAlignment1.Text := edit2.Text;
  QrRichText1.Lines.Add(NcsAlignment1.Result);
  edit2.Text := Copy(Edit1.Text,241,80);
  NcsAlignment1.Text := edit2.Text;
  QrRichText1.Lines.Add(NcsAlignment1.Result);
  edit2.Text := Copy(Edit1.Text,321,80);
  NcsAlignment1.Text := edit2.Text;
  QrRichText1.Lines.Add(NcsAlignment1.Result);
  edit2.Text := Copy(Edit1.Text,401,80);
  NcsAlignment1.Text := edit2.Text;
  QrRichText1.Lines.Add(NcsAlignment1.Result);
  edit2.Text := Copy(Edit1.Text,481,80);
  NcsAlignment1.Text := edit2.Text;
  QrRichText1.Lines.Add(NcsAlignment1.Result);
}
{
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    if (Length(RichEdit1.Lines.Strings[x]) > 80) then
    begin
      NcsAlignment1.Text := RichEdit1.Lines.Strings[x];
      QrRichText1.Lines.Add(NcsAlignment1.Result);
    end
    else QrRichText1.Lines.Add(RichEdit1.Lines.Strings[x]);
  end;
}
{
  NcsAlignment1.Text := Qrlabel51.Caption + ' ' + Qrlabel53.Caption + ' ' + Qrlabel54.Caption;
  Edit1.text := NcsAlignment1.Result;
  QRRichText1.Lines.Clear;
  QRRichText1.Lines.Add(edit1.Text);

  NcsAlignment1.Width := 70;
  NcsAlignment1.Text := Qrlabel64.Caption + ' ' + Qrlabel55.Caption + ' ' + Qrlabel56.Caption;
  Edit1.text := NcsAlignment1.Result;
  QRRichText2.Lines.Clear;
  QRRichText2.Lines.Add(edit1.Text);

  NcsAlignment1.Width := 114;
  NcsAlignment1.Text := Qrlabel57.Caption;
  Edit1.text := NcsAlignment1.Result;
  QRRichText3.Lines.Clear;
  QRRichText3.Lines.Add(edit1.Text);

  NcsAlignment1.Text := Qrlabel58.Caption;
  Edit1.text := NcsAlignment1.Result;
  QRRichText4.Lines.Clear;
  QRRichText4.Lines.Add(edit1.Text);

  QRRichText5.Lines.Add(Qrlabel62.Caption);
}
{
  NcsAlignment1.Text := Qrlabel62.Caption;
  Edit1.text := NcsAlignment1.Result;
  QRRichText5.Lines.Clear;
  QRRichText5.Lines.Add(edit1.Text);
}


{
  QRmemo1.Lines.Add(Qrlabel51.Caption + ' ' + Qrlabel53.Caption + ' ' + Qrlabel54.Caption);
  QRmemo2.Lines.Add(Qrlabel64.Caption + ' ' + Qrlabel55.Caption + ' ' + Qrlabel56.Caption);
  QRmemo3.Lines.Add(Qrlabel57.Caption);
  QRmemo4.Lines.Add(Qrlabel58.Caption);
  QRmemo4.Lines.Add(Qrlabel62.Caption);
}

//  QRmemo1.Lines.Clear;
//  QRmemo1.Lines.Add(Qrlabel51.Caption + ' ' + Qrlabel53.Caption + ' ' + Qrlabel54.Caption + ' ' + Qrlabel64.Caption + ' ' + Qrlabel55.Caption + ' ' + Qrlabel56.Caption + ' ' + Qrlabel57.Caption + ' ' + Qrlabel58.Caption + ' ' + Qrlabel62.Caption);
{
  QRRichText1.Lines.Clear;
  QRRichText1.Font.Size := 9;
  QRRichText1.Lines.Add(Qrlabel51.Caption + ' ' + Qrlabel53.Caption + ' ' + Qrlabel54.Caption + ' ' + Qrlabel64.Caption);
  QRRichText1.Font.Size := 5;
  QRRichText1.Lines.Add('');
  QRRichText1.Font.Size := 9;
  QRRichText1.Lines.Add(Qrlabel55.Caption + ' ' + Qrlabel56.Caption + ' ' + Qrlabel57.Caption);
  QRRichText1.Font.Size := 5;
  QRRichText1.Lines.Add('');
  QRRichText1.Font.Size := 9;
  QRRichText1.Lines.Add(Qrlabel57.Caption + ' ' + Qrlabel58.Caption + ' ' + Qrlabel62.Caption);
  QRRichText1.Font.Size := 5;
  QRRichText1.Lines.Add('');
  QRRichText1.Font.Size := 9;
}

{
  Qrlabel51.Caption := '';
  Qrlabel53.Caption := '';
  Qrlabel54.Caption := '';
  Qrlabel64.Caption := '';
  Qrlabel55.Caption := '';
  Qrlabel56.Caption := '';
  Qrlabel57.Caption := '';
  Qrlabel58.Caption := '';
  Qrlabel62.Caption := '';
}
end;

end.
