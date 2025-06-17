unit Maval27;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg;

type
  TF_Maval27 = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRShape1: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
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
    QRDBText52: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRRDbarra1: TQRRDbarra;
    QRAngledDBText1: TQRAngledDBText;
    QRAngledLabel1: TQRAngledLabel;
    QRAngledDBText2: TQRAngledDBText;
    QRAngledLabel2: TQRAngledLabel;
    QRAngledLabel3: TQRAngledLabel;
    QRAngledDBText4: TQRAngledDBText;
    QRAngledLabel4: TQRAngledLabel;
    QRAngledDBText5: TQRAngledDBText;
    QRAngledLabel5: TQRAngledLabel;
    QRAngledDBText6: TQRAngledDBText;
    QRAngledLabel6: TQRAngledLabel;
    QRAngledDBText7: TQRAngledDBText;
    QRRDbarra2: TQRRDbarra;
    QRAngledDBText3: TQRAngledDBText;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape12: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel79: TQRLabel;
    QRImage3: TQRImage;
    QRShape13: TQRShape;
    QRLabel78: TQRLabel;
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
    QRLabel10: TQRLabel;
    QRRichText2: TQRRichText;
    QRLabel43: TQRLabel;
    QRRichText1: TQRRichText;
    QRLabel44: TQRLabel;
    QRImage1: TQRImage;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Maval27 : TF_Maval27;
  leasing   : Boolean;
  parcela1,parcela2,parcela3,parcela4,parcela5,parcela6, linha, parc1, parc2, parc3, parc4, parc5, parc6 : String;

implementation

uses DMTD, Menu;

{$R *.DFM}

procedure TF_Maval27.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Qrlabel4.caption := dm.arqaux.fieldbyname('endereco').asstring + ' - ' + dm.arqaux.fieldbyname('bairro').asstring;
  qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
  qrimage3.Picture.LoadFromFile('s:\td\assinatura\simcred.jpg');
  if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;

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

procedure TF_Maval27.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrRdBarra1.Text := 'RL' + dm.arqaux.fieldbyname('rld').asstring + 'BR';
  QrRdBarra2.Text := 'RL' + dm.arqaux.fieldbyname('rld').asstring + 'BR';
end;

end.


