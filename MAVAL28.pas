unit Maval28;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg, StdCtrls,
  ComCtrls, NcsAlignment;

type
  TF_maval28 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel44: TQRLabel;
    QRImage1: TQRImage;
    QRLabel62: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape12: TQRShape;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRLabel31: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel77: TQRLabel;
    QRShape13: TQRShape;
    QRLabel78: TQRLabel;
    QRLabel10: TQRLabel;
    QRRichText2: TQRRichText;
    QRLabel43: TQRLabel;
    QRRichText1: TQRRichText;
    QRLabel79: TQRLabel;
    QRImage2: TQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_maval28: TF_maval28;

implementation

uses DMTD, menu;

{$R *.DFM}

procedure TF_maval28.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  QrLabel1.Caption  := '';
  QrLabel6.Caption  := '';
  QrLabel8.Caption  := '';
  QrLabel32.Caption := '';
  QrLabel34.Caption := '';
  QrLabel38.Caption := '';
  QrLabel40.Caption := '';
  QrLabel41.Caption := '';
  QrLabel42.Caption := '';
  QrLabel50.Caption := '';
  QrLabel79.Caption := '';

  QrLabel1.Caption  := 'Rio de Janeiro, ' + DataExtenso(Dm.ArqAux.FieldByName('data').asString, False, '');

  //endereço residencial
  QrLabel6.Caption  := Dm.ArqAux.FieldByName('nome').asString;
  QrLabel8.Caption  := Dm.ArqAux.FieldByName('endereco').asString;
  QrLabel32.Caption := Dm.ArqAux.FieldByName('bairro').asString;
  QrLabel34.Caption := Dm.ArqAux.FieldByName('cidade').asString;
  if (Trim(Dm.ArqAux.FieldByName('cep').asString) <> '') then QrLabel38.Caption := FormataCep(Dm.ArqAux.FieldByName('cep').asString);
  // nº do contrato
  QrLabel50.Caption := Dm.ArqAux.FieldByName('contrato').asString;
  //Mudança de Texto
  if (Dm.ArqAux.FieldByName('produto').asString = 'C') then
  begin
    QrLabel40.Caption := 'no  prazo  acima,  constituíra  V.Sa.   em';
    QrLabel41.Caption := 'mora para os efeitos legais, o que implicará no vencimento antecipado de todo o contrato e  na  adoção  das';
    QrLabel42.Caption := 'medidas judiciais pertinentes.';
  end
  else if (Dm.ArqAux.FieldByName('produto').asString = 'L') then
  begin
    QrLabel40.Caption := 'no  prazo  acima,  implicará na RECISÃO';
    QrLabel41.Caption := 'do contrato de arrendamento mercantil em epígrafe, ficando V.Sa. obrigado(a) a restituir  o(s)  bem(s)  objeto';
    QrLabel42.Caption := 'do contrato, além das medidas judiciais pertinentes.';
  end;
  //Imagem Dibens
  if (Copy(Dm.ArqAux.FieldByName('arquivo').asString, 1,4) = 'SDIB') then
  begin
    QrImage1.Picture.LoadFromFile('S:\td\Assinatura\Dibens.JPG');
    if (Dm.ArqAux.FieldByName('produto').asString = 'B') then
    begin
      QrLabel79.Caption := 'BANCO DIBENS S/A';
    end
    else QrLabel79.Caption := 'DIBENS LEASING S.A ARRENDAMENTO MERCANTIL';
  end // Imagem Unibanco
  else if (Copy(Dm.ArqAux.FieldByName('arquivo').asString, 1,4) = 'SUNI') then
  begin
    QrImage1.Picture.LoadFromFile('S:\td\Assinatura\logo unibanco.JPG');
    if (Dm.ArqAux.FieldByName('produto').asString = 'B') then
    begin
      QrLabel79.Caption := 'UNIBANCO UNIÃO DE BANCOS BRASILEIROS S/A';
    end
    else QrLabel79.Caption := 'UNIBANCO LEASING S.A. ARRENDAMENTO MERCANTIL';
  end;
  Qrlabel79.caption := Dm.ArqAux.FieldByName('banco').asString;
end;

end.
