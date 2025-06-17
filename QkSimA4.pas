unit QkSimA4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg, StdCtrls;

type
  TQk_SimA4 = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    Label1: TLabel;
    QRLabel9: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape1: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRImage3: TQRImage;
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
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRLabel31: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRImage4: TQRImage;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_SimA4 : TQk_SimA4;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_SimA4.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel1.Caption  := '';
  QrLabel4.Caption  := '';
  QrLabel13.Caption := '';
  QrLabel12.Caption := '';
  QrLabel78.Caption := '';
  QrLabel9.Caption  := '';
  QrLabel32.Caption := '';
  QrLabel33.Caption := '';
  QrLabel34.Caption := '';
  QrLabel35.Caption := '';
  QrLabel36.Caption := '';
 // QrLabel40.Caption := 'XXXXXXXXXXXXXXXXXXXX';
 // QrLabel41.Caption := 'XXXXXXXXXXXXXXXXXXXX';
 // QrLabel42.Caption := 'XXXXXXXXXXXXXXXXXXXX';
  //QrLabel43.Caption := 'XXXXXXXXXXXXXXXXXXXX';
  //QrLabel44.Caption := 'XXXXXXXXXXXXXXXXXXXX';
  //QrLabel45.Caption := 'XXXXXXXXXXXXXXXXXXXX';
  //QrLabel46.Caption := 'XXXXXXXXXXXXXXXXXXXX';
 //QrLabel47.Caption := 'XXXXXXXXXXXXXXXXXXXX';
 //QrLabel48.Caption := 'XXXXXXXXXXXXXXXXXXXX';
 // QrLabel49.Caption := 'XXXXXXXXXXXXXXXXXXXX';
  QrImage1.Picture := NIL;



//  QrImage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
  QrLabel9.Caption  := 'São Paulo, ' + DataExtenso(Dm.Join.FieldByName('data_p').asString, False, '');
  QrLabel32.Caption := Dm.Join.FieldByName('nome').asString;
  QrLabel33.Caption := Dm.Join.FieldByName('endereco').asString;
  QrLabel34.Caption := Dm.Join.FieldByName('bairro').asString;
  QrLabel35.Caption := FormataCep(Dm.Join.FieldByName('cep').asString) + StringOfChar(' ', 10) + Dm.Join.FieldByName('cidade').asString + StringOfChar(' ', 10) + Dm.Join.FieldByName('estado').asString;
  QrLabel78.Caption := F_Menu.Label29.Caption;
  QrLabel36.Caption := F_Menu.Label9.Caption;
  QrLabel12.Caption := F_Menu.Label11.Caption;
  QrLabel13.Caption := Dm.Join.FieldByName('protocolo').asString + '/' + Dm.Join.FieldByName('registro').asString + ', em ' + Dm.Join.FieldByName('data_p').asString + '.';


//  if (Trim(Dm.Join.FieldByName('parcelas').asString) <> '') then QrLabel40.Caption := Dm.Join.FieldByName('parcelas').asString;
//  if (Trim(Dm.Join.FieldByName('parc2').asString) <> '')    then QrLabel41.Caption := Dm.Join.FieldByName('parc2').asString;
//  if (Trim(Dm.Join.FieldByName('parc3').asString) <> '')    then QrLabel42.Caption := Dm.Join.FieldByName('parc3').asString;
//  if (Trim(Dm.Join.FieldByName('parc4').asString) <> '')    then QrLabel43.Caption := Dm.Join.FieldByName('parc4').asString;
// if (Trim(Dm.Join.FieldByName('parc5').asString) <> '')    then QrLabel44.Caption := Dm.Join.FieldByName('parc5').asString;
//  if (Dm.Join.FieldByName('ven_parc').asDateTime > 0)       then QrLabel45.Caption := Dm.Join.FieldByName('ven_parc').asString;
//  if (Dm.Join.FieldByName('ven_parc2').asDateTime > 0)      then QrLabel46.Caption := Dm.Join.FieldByName('ven_parc2').asString;
//  if (Dm.Join.FieldByName('ven_parc3').asDateTime > 0)      then QrLabel47.Caption := Dm.Join.FieldByName('ven_parc3').asString;
//  if (Dm.Join.FieldByName('ven_parc4').asDateTime > 0)      then QrLabel48.Caption := Dm.Join.FieldByName('ven_parc4').asString;
//  if (Dm.Join.FieldByName('ven_parc5').asDateTime > 0)      then QrLabel49.Caption := Dm.Join.FieldByName('ven_parc5').asString;

  if (Dm.Join.FieldByName('a_nome').asString = 'BANCO HSBC S/A') then
  begin
    if (Dm.Join.FieldByName('produto').asString = 'L') then
    begin
      QrLabel1.Caption := 'HSBC LEASING ARRENDAMENTO MERCANTIL S/A';
      QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logohsbcleasing.bmp');
    end
    else
    begin
      QrLabel1.Caption := 'BANCO HSBC S/A';
      QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logobancohsbc.bmp');
    end;
  end;
 { else
  begin
    if (Dm.Join.FieldByName('produto').asString = 'L') then
    begin
      QrLabel1.Caption := 'Unibanco Leasing S/A - Arrendamento Mercantil';
      QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logounibancoleasing.bmp');
    end
    else
    begin
      QrLabel1.Caption := 'Unibanco - União dos Bancos Brasileiros S/A.';
      QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logounibancofinanceira.bmp');
    end;
  end;  }
  QrLabel4.Caption := Dm.Join.FieldByName('contrato').asString; 
end;

end.


