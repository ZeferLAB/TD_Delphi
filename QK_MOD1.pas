unit QK_MOD1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, jpeg, QrAngLbl, qrRDBarra;

type
  Tf_mod01 = class(TForm)
    QuickRep1: TQuickRep;
    Table1: TTable;
    QRChildBand1: TQRChildBand;
    QRImage3: TQRImage;
    QRLabel80: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape2: TQRShape;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape3: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel79: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRRDbarra1: TQRRDbarra;
    QRAngledLabel4: TQRAngledLabel;
    QRAngledLabel3: TQRAngledLabel;
    QRAngledLabel2: TQRAngledLabel;
    QRAngledLabel1: TQRAngledLabel;
    QRRDbarra2: TQRRDbarra;
    QRLabel92: TQRLabel;
    ChildBand1: TQRChildBand;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_mod01: Tf_mod01;
  mes : string;

implementation

uses RAV, Menu;

{$R *.DFM}


procedure Tf_mod01.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  mes := ver_mes(copy(f_rav.maskedit1.text,4,2));
  QrLabel5.Caption  := Table1.FieldByName('protocolo').asString;
  QrLabel6.Caption  := 'Diadema, ' + copy(f_rav.maskedit1.text,1,2) + ' de ' + mes + ' de ' + copy(f_rav.maskedit1.text,7,4) + '.';
  QrLabel43.Caption := 'Diadema, ' + copy(f_rav.maskedit1.text,1,2) + ' de ' + mes + ' de ' + copy(f_rav.maskedit1.text,7,4) + '.';
  QrLabel8.Caption  := Table1.FieldByName('nome').asString;
  QrLabel9.Caption  := Table1.FieldByName('endereco').asString + ' - ' + Table1.FieldByName('bairro').asString;
  QrLabel10.Caption := Table1.FieldByName('cep').asString + ' - ' + Table1.FieldByName('cidade').asString + Table1.FieldByName('uf').asString;
  QrLabel11.Caption := 'CNPJ/CPF:' + Table1.FieldByName('documento').asString;
  QrLabel17.Caption := Table1.FieldByName('contrato').asString;
  QrLabel18.Caption := Table1.FieldByName('data_cel').asString;
  QrLabel19.Caption := Table1.FieldByName('parcelas').asString;
  QrLabel20.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('vr_venc').ascurrency);
  QrLabel21.Caption := Table1.FieldByName('data_ven').asString;
  QrLabel23.Caption := Table1.FieldByName('data_ven').asString;
  QrLabel74.Caption := Table1.FieldByName('protocolo').asString;
  QrLabel73.Caption := Table1.FieldByName('data_reg').asString;
  QrLabel66.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('emolumento').ascurrency);
  QrLabel67.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('estado').ascurrency);
  QrLabel68.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ipesp').ascurrency);
  QrLabel69.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('reg_civil').ascurrency);
  QrLabel70.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('trib_just').ascurrency);
  QrLabel71.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ar').ascurrency);
  QrLabel72.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('total').ascurrency);
  QrLabel47.Caption := Table1.FieldByName('banco').asString;
  QrLabel75.Caption := Table1.FieldByName('agencia').asString;
  QrLabel76.Caption := Table1.FieldByName('end_banco').asString;
  QrLabel50.Caption := Table1.FieldByName('cid_banco').asString;
  QrLabel77.Caption := Table1.FieldByName('tel_banco').asString;
  QrLabel78.Caption := Table1.FieldByName('open_contr').asString + Table1.FieldByName('contrato').asString;
  QrLabel59.Caption := Table1.FieldByName('nosso_num').asString;
  QrLabel63.Caption := Table1.FieldByName('nosso_num').asString;
end;

end.
