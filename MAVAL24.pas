unit Maval24;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg;

type
  TQk_Merca = class(TForm)
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
    QRImage1: TQRImage;
    QRChildBand1: TQRChildBand;
    QRRDbarra1: TQRRDbarra;
    QRAngledDBText1: TQRAngledDBText;
    QRAngledLabel1: TQRAngledLabel;
    QRAngledDBText2: TQRAngledDBText;
    QRAngledLabel2: TQRAngledLabel;
    QRAngledLabel3: TQRAngledLabel;
    QRAngledDBText4: TQRAngledDBText;
    QRAngledLabel4: TQRAngledLabel;
    QRAngledLabel5: TQRAngledLabel;
    QRAngledDBText6: TQRAngledDBText;
    QRAngledLabel6: TQRAngledLabel;
    QRRDbarra2: TQRRDbarra;
    QRAngledDBText3: TQRAngledDBText;
    QRImage2: TQRImage;
    QRLabel4: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape12: TQRShape;
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
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel79: TQRLabel;
    QRImage3: TQRImage;
    QRShape13: TQRShape;
    QRLabel78: TQRLabel;
    QRRichText1: TQRRichText;
    QRRichText2: TQRRichText;
    QRLabel10: TQRLabel;
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
  Qk_Merca : TQk_Merca;

implementation

uses DMTD, Menu;

{$R *.DFM}

procedure TQk_Merca.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Qrlabel4.caption := dm.arqaux.fieldbyname('endereco').asstring + ' - ' + dm.arqaux.fieldbyname('bairro').asstring;
  qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
  if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;

  QrLabel1.Caption  := '';
  QrLabel6.Caption  := '';
  QrLabel8.Caption  := '';
  QrLabel32.Caption := '';
  QrLabel34.Caption := '';
  QrLabel36.Caption := '';
  QrLabel38.Caption := '';
  QrLabel40.Caption := '';
  QrLabel42.Caption := '';
  QrLabel44.Caption := '';
  QrLabel46.Caption := '';
  QrLabel48.Caption := '';
  QrLabel50.Caption := '';
  QrLabel51.Caption := '';
  
  QrLabel55.Caption := '';
  QrLabel56.Caption := '';
  QrLabel57.Caption := '';
  QrLabel58.Caption := '';
  QrLabel59.Caption := '';
  QrLabel60.Caption := '';
  QrLabel61.Caption := '';
  QrLabel63.Caption := '';
  QrLabel64.Caption := '';
  QrLabel65.Caption := '';
  QrLabel66.Caption := '';
  QrLabel67.Caption := '';
  QrLabel68.Caption := '';
  QrLabel69.Caption := '';
  QrLabel70.Caption := '';
  QrLabel71.Caption := '';
  QrLabel72.Caption := '';
  QrLabel73.Caption := '';
  QrLabel76.Caption := '';


  QrLabel1.Caption  := 'São Paulo, ' + DataExtenso(Dm.ArqAux.FieldByName('data').asString, False, '');

  //endereço residencial
  QrLabel6.Caption  := Dm.ArqAux.FieldByName('nome').asString;
  QrLabel8.Caption  := Dm.ArqAux.FieldByName('endereco').asString;
  QrLabel32.Caption := Dm.ArqAux.FieldByName('bairro').asString;
  QrLabel34.Caption := Dm.ArqAux.FieldByName('cidade').asString;
  QrLabel36.Caption := Dm.ArqAux.FieldByName('uf').asString;
  if (Trim(Dm.ArqAux.FieldByName('cep').asString) <> '') then QrLabel38.Caption := FormataCep(Dm.ArqAux.FieldByName('cep').asString);
  //endereço comercial
  QrLabel40.Caption := Dm.ArqAux.FieldByName('endere2').asString;
  QrLabel42.Caption := Dm.ArqAux.FieldByName('bairro2').asString;
  QrLabel44.Caption := Dm.ArqAux.FieldByName('cidade2').asString;
  if (Trim(Dm.ArqAux.FieldByName('cep2').asString) <> '') then QrLabel46.Caption := FormataCep(Dm.ArqAux.FieldByName('cep2').asString); 
  QrLabel48.Caption := Dm.ArqAux.FieldByName('uf2').asString;
  // nº do contrato
  QrLabel50.Caption := Dm.ArqAux.FieldByName('contrato').asString;
  // Parcelas, Valores e Datas de Vencimento.
  if (Trim(Dm.ArqAux.FieldByName('parc2').asString) <> '') then
  begin
    QrLabel51.Caption := 'PARCELAS VENCIDAS :';
  end
  else QrLabel51.Caption := 'PARCELA VENCIDA :';
  QrLabel55.Caption := Dm.ArqAux.FieldByName('parcelas').asString;
  QrLabel56.Caption := 'R$' + Trim(Dm.ArqAux.FieldByName('vr_venc').asString);
  QrLabel57.Caption := Dm.ArqAux.FieldByName('data_ven').asString;
  QrLabel58.Caption := Dm.ArqAux.FieldByName('parc2').asString;
  if (Trim(Dm.ArqAux.FieldByName('val_parc2').asString) <> '') AND
     (Trim(Dm.ArqAux.FieldByName('val_parc2').asString) <> '0,00') then
  begin
    QrLabel59.Caption := 'R$' + Trim(Dm.ArqAux.FieldByName('val_parc2').asString);
  end;
  QrLabel60.Caption := Dm.ArqAux.FieldByName('ven_parc2').asString;
  QrLabel61.Caption := Dm.ArqAux.FieldByName('parc3').asString;
  if (Trim(Dm.ArqAux.FieldByName('val_parc3').asString) <> '') AND
     (Trim(Dm.ArqAux.FieldByName('val_parc3').asString) <> '0,00') then
  begin
    QrLabel63.Caption := 'R$' + Trim(Dm.ArqAux.FieldByName('val_parc3').asString);
  end;
  QrLabel64.Caption := Dm.ArqAux.FieldByName('ven_parc3').asString;
  QrLabel65.Caption := Dm.ArqAux.FieldByName('parc4').asString;
  if (Trim(Dm.ArqAux.FieldByName('val_parc4').asString) <> '') AND
     (Trim(Dm.ArqAux.FieldByName('val_parc4').asString) <> '0,00') then
  begin
    QrLabel66.Caption := 'R$' + Trim(Dm.ArqAux.FieldByName('val_parc4').asString);
  end;
  QrLabel67.Caption := Dm.ArqAux.FieldByName('ven_parc4').asString;
  QrLabel68.Caption := Dm.ArqAux.FieldByName('parc5').asString;
  if (Trim(Dm.ArqAux.FieldByName('val_parc5').asString) <> '') AND
     (Trim(Dm.ArqAux.FieldByName('val_parc5').asString) <> '0,00') then
  begin
    QrLabel69.Caption := 'R$' + Trim(Dm.ArqAux.FieldByName('val_parc5').asString);
  end;
  QrLabel70.Caption := Dm.ArqAux.FieldByName('ven_parc5').asString;
  QrLabel71.Caption := Dm.ArqAux.FieldByName('parc6').asString;
  if (Trim(Dm.ArqAux.FieldByName('val_parc6').asString) <> '')     AND
     (Trim(Dm.ArqAux.FieldByName('val_parc6').asString) <> '0,00') then
  begin
    QrLabel72.Caption := 'R$' + Trim(Dm.ArqAux.FieldByName('val_parc6').asString);
  end;
  QrLabel73.Caption := Dm.ArqAux.FieldByName('ven_parc6').asString;
  QrLabel76.Caption := Dm.ArqAux.FieldByName('banco').asString;
end;

procedure TQk_Merca.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrRdBarra1.Text := 'RZ' + Dm.Join.FieldByName('rl').asstring + 'BR';
  QrRdBarra2.Text := 'RZ' + Dm.Join.FieldByName('rl').asstring + 'BR';

  QrLabel4.Caption  := '';
  QrLabel10.Caption := '';
  QrLabel4.Caption  := Dm.Join.FieldByName('endereco').asString;
  QrLabel10.Caption := FormataCep(Dm.Join.FieldByName('cep').asString);
end;

end.


