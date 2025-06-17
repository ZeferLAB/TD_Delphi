unit QkCNotB2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, NcsAlignment, StdCtrls, ComCtrls;

type
  TQk_CNotB2 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRRichText2: TQRRichText;
    RichEdit1: TRichEdit;
    Alinha: TNcsAlignment;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRRichText3: TQRRichText;
    QRRichText1: TQRRichText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_CNotB2: TQk_CNotB2;

implementation

uses DMTD, Menu, RCNotB, FuncGeral;

{$R *.DFM}

procedure TQk_CNotB2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  x : Integer;
  arq : String;
begin
  QrLabel7.Caption  := '';
  QrLabel9.Caption  := '';
  QrLabel10.Caption := '';
  QrLabel11.Caption := '';
  QrLabel12.Caption := '';
  QrLabel14.Caption := '';
  QrLabel18.Caption := '';
  QrLabel27.Enabled := False;
  QrLabel28.Enabled := False;
  QrLabel29.Enabled := False;
  QrLabel25.Enabled := False;
  QrLabel31.Enabled := False;
  QrLabel32.Enabled := False;
  QrLabel35.Enabled := False;
  QrLabel34.Enabled := False;
  QrLabel33.Enabled := False;  

  // Assinaturas
  if (Trim(F_RCNotB.ComboBox2.Text) = '') then
  begin
    QrLabel27.Enabled := True;
    QrLabel28.Enabled := True;
    QrLabel29.Enabled := True;
    QrLabel28.Caption := F_RCNotB.ComboBox1.Text;
    QrLabel29.Caption := F_RCNotB.ComboBox3.Text;
  end
  else
  begin
    QrLabel25.Enabled := True;
    QrLabel31.Enabled := True;
    QrLabel32.Enabled := True;
    QrLabel31.Caption := F_RCNotB.ComboBox1.Text;
    QrLabel32.Caption := F_RCNotB.ComboBox3.Text;
    QrLabel35.Enabled := True;
    QrLabel34.Enabled := True;     
    QrLabel33.Enabled := True;
    QrLabel34.Caption := F_RCNotB.ComboBox2.Text;
    QrLabel33.Caption := F_RCNotB.ComboBox4.Text;
  end;
  RichEdit1.Lines.Clear;
  QrRichText2.Lines.Clear;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'CERTNOT';
  if (Dm.ArqAux.FieldByName('situacao').asString = 'POSITIVA') then
  begin
    DM.ArqAux1.close;
    DM.ArqAux1.Sql.Clear;
    DM.ArqAux1.Sql.Add('select observacao from ' + arq + ' where p_auxiliar = ' + Chr(39) + Trim(Dm.ArqAux.FieldByName('p_auxiliar').asString) + Chr(39) + ' and nome = ' + Chr(39) + Trim(Dm.ArqAux.FieldByName('nome').asString) + Chr(39));
    DM.ArqAux1.OPen;
    RichEdit1.Lines.Add(Dm.ArqAux1.FieldByName('observacao').asString);
  end
  else
  begin
    DM.ArqAux1.close;
    DM.ArqAux1.Sql.Clear;
    DM.ArqAux1.Sql.Add('select observacao from ' + arq + ' where p_auxiliar = '  + Chr(39) + trim(Dm.ArqAux.FieldByName('p_auxiliar').asString) + Chr(39) + ' and nome = ' + Chr(39) + Trim(Dm.ArqAux.FieldByName('nome').asString) + Chr(39));
    DM.ArqAux1.OPen;
    RichEdit1.Lines.add(Dm.ArqAux1.FieldByName('observacao').asString);
  end;

  QrRichText3.Enabled := True;
  QrLabel7.Caption  := Dm.ArqAux.FieldByName('empresa').asString;
  QrLabel9.Caption  := Dm.ArqAux.FieldByName('nome').asString;
  QrLabel10.Caption := Dm.ArqAux.FieldByName('endereco').asString;
  QrLabel11.Caption := Dm.ArqAux.FieldByName('bairro').asString;
  QrLabel12.Caption := Dm.ArqAux.FieldByName('cep').asString;
  QrLabel14.Caption := Copy(StrZero(Dm.ArqAux.FieldByName('indexador').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.ArqAux.FieldByName('indexador').asString, 6), 4,3);
  QrLabel18.Caption := Copy(StrZero(Dm.ArqAux.FieldByName('p_auxiliar').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.ArqAux.FieldByName('p_auxiliar').asString, 6), 4,3);

  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    if (Length(RichEdit1.Lines.Strings[x]) < 50) then
    begin
      QrRichText2.Lines.Add(RichEdit1.Lines.Strings[x]);
    end
    else
    begin
      Alinha.Text := (RichEdit1.Lines.Strings[x]);
      QrRichText2.Lines.Add(Alinha.Result);
    end;
  end;
end;

end.

