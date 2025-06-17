unit QkWocA4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg, StdCtrls;

type
  TQk_WocA4 = class(TForm)
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
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRRichText2: TQRRichText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel43: TQRLabel;
    QRRichText1: TQRRichText;
    QRRichText3: TQRRichText;
    QRLabel5: TQRLabel;
    QRRichText4: TQRRichText;
    QRRichText5: TQRRichText;
    QRImage4: TQRImage;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_WocA4 : TQk_WocA4;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_WocA4.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  ende2 : String;
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
  QRRichText1.Enabled := false;
  QRRichText2.Enabled := false;
  QRRichText3.Enabled := true;
  QRRichText4.Enabled := false;
  QRRichText5.Enabled := false;
  QRLabel5.Enabled    := false;  


  //QrLabel9.Caption  := 'São José do Rio Preto, ' + DataExtenso(Dm.Join.FieldByName('data_p').asString, False, '');

  if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- S.J. do Rio Preto-SP') then
  QrLabel9.Caption  := 'São José do Rio Preto, ' + DataExtenso(Dm.Join.FieldByName('data_p').asString, False, '');

  if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- Presidente Prudente-SP') then
  QrLabel9.Caption  := 'Presidente Prudente, ' + DataExtenso(Dm.Join.FieldByName('data_p').asString, False, '');

  if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- Palmas-TO') then
  QrLabel9.Caption  := 'Palmas, ' + DataExtenso(Dm.Join.FieldByName('data_p').asString, False, '');

  QrLabel32.Caption := Dm.Join.FieldByName('nome').asString;
  ende2 := '';
  ende2 := Dm.Join.FieldByName('endereco').asString;
  if (Trim(Dm.Join.FieldByName('numero').asString) <> '') then
  begin
    ende2 := ende2 + ' Nº ' + Dm.Join.FieldByName('numero').asString;
  end;
  ende2 := Trim(ende2) + ' ' + Trim(Dm.Join.FieldByName('complem').asString) + ' ';

 // QrLabel33.Caption := Dm.Join.FieldByName('endereco').asString;
  QrLabel33.Caption := ende2;
  QrLabel34.Caption := Dm.Join.FieldByName('bairro').asString;
  QrLabel35.Caption := FormataCep(Dm.Join.FieldByName('cep').asString) + StringOfChar(' ', 10) + Dm.Join.FieldByName('cidade').asString + StringOfChar(' ', 10) + Dm.Join.FieldByName('estado').asString;
  QrLabel78.Caption := F_Menu.Label2.Caption;
  QrLabel36.Caption := F_Menu.Label2.Caption;
  QrLabel12.Caption := F_Menu.Label11.Caption;
  QrLabel13.Caption := Dm.Join.FieldByName('protocolo').asString + '/' + Dm.Join.FieldByName('registro').asString + ', em ' + Dm.Join.FieldByName('data_p').asString + '.';

  if (Dm.Join.FieldByName('financeira').asString = 'CIA ITAULEASING DE ARREND MERCANTIL') then
   begin
    QrLabel3.Caption    := 'Ref.: Contrato de Arrendamento Mercantil Nº';
    QRRichText1.Enabled := true;
   end
   else
   begin
    QrLabel3.Caption    := 'Ref.: Contrato de Parcelamento Nº';
    QRRichText2.Enabled := true;
    QRLabel5.Enabled    := true;
    QRLabel5.Caption    := Dm.Join.FieldByName('ven_parc').asString;
   end;

  if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- S.J. do Rio Preto-SP') then
   begin
    QRRichText3.Enabled := true;
    QRRichText4.Enabled := false;
    QRRichText5.Enabled := false;
   end;

  if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- Presidente Prudente-SP') then
   begin
    QRRichText3.Enabled := false;
    QRRichText4.Enabled := true;
    QRRichText5.Enabled := false;
   end;

   if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- Palmas-TO') then
   begin
    QRRichText3.Enabled := false;
    QRRichText4.Enabled := false;
    QRRichText5.Enabled := true;
   end;

  QrLabel4.Caption  := Dm.Join.FieldByName('contrato').asString;
  QrLabel41.Caption := Dm.Join.FieldByName('dt_contr').asString;
  QrLabel42.Caption := Dm.Join.FieldByName('parcelas').asString;
  QrLabel43.Caption := Dm.Join.FieldByName('ven_parc').asString;

  QrLabel1.caption := Dm.Join.FieldByName('financeira').asString;

end;

end.


