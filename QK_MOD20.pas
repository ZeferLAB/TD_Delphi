unit QK_MOD20;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, jpeg, Qrctrls, QuickRpt, ExtCtrls;

type
  TF_Mod20 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRShape4: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel78: TQRLabel;
    Table1: TTable;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape2: TQRShape;
    QRShape7: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape3: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRShape10: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRShape11: TQRShape;
    QRLabel75: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRImage1: TQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Mod20: TF_Mod20;

implementation

uses RAV, Menu;


{$R *.DFM}

procedure TF_Mod20.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  mes := ver_mes(copy(f_rav.maskedit1.text,4,2));
  QrLabel45.Caption := Table1.FieldByName('protocolo').asString;
  QrLabel6.Caption  := 'Diadema, ' + copy(f_rav.maskedit1.text,1,2) + ' de ' + mes + ' de ' + copy(f_rav.maskedit1.text,7,4) + '.';
  QrLabel8.Caption  := Table1.FieldByName('nome').asString;
  QrLabel9.Caption  := Table1.FieldByName('endereco').asString + ' - ' + Table1.FieldByName('bairro').asString;
  QrLabel10.Caption := Table1.FieldByName('cep').asString + ' - ' + Table1.FieldByName('cidade').asString + Table1.FieldByName('uf').asString;
 // QrLabel11.Caption := 'CNPJ/CPF:' + Table1.FieldByName('documento').asString;
//  QrLabel17.Caption := Table1.FieldByName('contrato').asString;

 if Copy(Table1.FieldByName('nosso_num').asString,1,2)= '89'then
   QrLabel17.Caption := 'GRUPO ' + Copy(Table1.FieldByName('nosso_num').asString,3,3) + ' COTA ' + Copy(Table1.FieldByName('nosso_num').asString,6,3)
  else
   QrLabel17.Caption := 'GRUPO ' + Copy(Table1.FieldByName('nosso_num').asString,3,4) + ' COTA ' + Copy(Table1.FieldByName('nosso_num').asString,7,3);


  QrLabel18.Caption := Table1.FieldByName('data_cel').asString;

  if Copy(Table1.FieldByName('nosso_num').asString,1,2)= '89'then
   QrLabel19.Caption := Copy(Table1.FieldByName('nosso_num').asString,9,3)
  else
   QrLabel19.Caption := '0'+ Copy(Table1.FieldByName('nosso_num').asString,10,2);

  if Copy(Table1.FieldByName('nosso_num').asString,1,2)= '89'then
   QrLabel34.Caption := Copy(Table1.FieldByName('nossonum2').asString,9,3)
  else
   QrLabel34.Caption := '0'+ Copy(Table1.FieldByName('nossonum2').asString,10,2);


  if Copy(Table1.FieldByName('nosso_num').asString,1,2)= '89'then
   QrLabel40.Caption := Copy(Table1.FieldByName('nossonum3').asString,9,3)
  else
   QrLabel40.Caption := '0'+ Copy(Table1.FieldByName('nossonum3').asString,10,2);



  QrLabel20.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('vr_venc').ascurrency);
  QrLabel35.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('valor2').ascurrency);
  QrLabel39.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('valor3').ascurrency);
  QrLabel36.Caption := Table1.FieldByName('nosso_num').asString;
  QrLabel37.Caption := Table1.FieldByName('nossonum2').asString;
  QrLabel38.Caption := Table1.FieldByName('nossonum3').asString;

   if Copy(Table1.FieldByName('nosso_num').asString,1,12)= '000000000000'then
   begin
    QrLabel19.Caption := '--------';
    QrLabel20.Caption := '--------';
    QrLabel36.Caption := '--------';
   end;

  if Copy(Table1.FieldByName('nossonum2').asString,1,12)= '000000000000'then
   begin
    QrLabel34.Caption := '--------';
    QrLabel35.Caption := '--------';
    QrLabel37.Caption := '--------';
   end;
  if Copy(Table1.FieldByName('nossonum3').asString,1,12)= '000000000000'then
   begin
    QrLabel40.Caption := '--------';
    QrLabel39.Caption := '--------';
    QrLabel38.Caption := '--------';
   end;
 // QrLabel21.Caption := Table1.FieldByName('data_ven').asString;
  QrLabel84.Caption := Table1.FieldByName('protocolo').asString;
  QrLabel83.Caption := Table1.FieldByName('data_reg').asString;
  QrLabel68.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('emolumento').ascurrency);
  QrLabel69.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('estado').ascurrency);
  QrLabel70.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ipesp').ascurrency);
  QrLabel71.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('reg_civil').ascurrency);
  QrLabel72.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('trib_just').ascurrency);
  QrLabel73.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ar').ascurrency);
  QrLabel74.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('total').ascurrency);

  
 // QrLabel76.Caption := Table1.FieldByName('end_banco').asString;
 // QrLabel50.Caption := Table1.FieldByName('cid_banco').asString;
 // QrLabel77.Caption := Table1.FieldByName('tel_banco').asString;
  QrLabel78.Caption := Table1.FieldByName('open_contr').asString + '/ '+Table1.FieldByName('contrato').asString;
 // QrLabel5.Caption  := Table1.FieldByName('nosso_num').asString;
end;

end.
