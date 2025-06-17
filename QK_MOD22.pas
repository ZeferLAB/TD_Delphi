unit QK_MOD22;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, QrAngLbl, qrRDBarra;

type
  TF_Mod22 = class(TForm)
    QuickRep1: TQuickRep;
    Table1: TTable;
    QRSubDetail1: TQRSubDetail;
    QRRDbarra1: TQRRDbarra;
    QRAngledLabel4: TQRAngledLabel;
    QRAngledLabel3: TQRAngledLabel;
    QRAngledLabel2: TQRAngledLabel;
    QRAngledLabel1: TQRAngledLabel;
    QRRDbarra2: TQRRDbarra;
    ChildBand1: TQRChildBand;
    QRLabel61: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
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
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRShape3: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRImage1: TQRImage;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Mod22: TF_Mod22;
  mes : string;

implementation

uses RAV, Menu;

{$R *.DFM}

procedure TF_Mod22.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // QrLabel2.Caption := F_Menu.Label9.Caption;
 // QrLabel3.Caption := F_Menu.Label11.Caption;
 // QrLabel4.Caption := F_Menu.Label7.Caption;
  QRAngledLabel1.Caption := 'DESTINATÁRIO';
  QRAngledLabel2.Caption := Table1.FieldByName('nome').asString;
  QRAngledLabel3.Caption := Table1.FieldByName('endereco').asString + ' - ' + Table1.FieldByName('bairro').asString;
  QRAngledLabel4.Caption := Table1.FieldByName('cidade').asString + '              ' + Table1.FieldByName('cep').asString;
  QrLabel92.Caption := Table1.FieldByName('nome').asString;
  //Verificar digito do Nº RL
 { nrl := 'RZ' + Digi(IntToStr(Table1.FieldByName('rz').AsInteger)) + 'BR';
  QRRDbarra1.Text := nrl;
  QRRDbarra2.Text := nrl; }
end;

procedure TF_Mod22.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel8.Caption  := Table1.FieldByName('nome').asString;
  QrLabel9.Caption  := Table1.FieldByName('endereco').asString + ' - ' + Table1.FieldByName('bairro').asString;
  QrLabel10.Caption := Table1.FieldByName('cep').asString + ' - ' + Table1.FieldByName('cidade').asString + ' - ' +Table1.FieldByName('uf').asString;
 // QrLabel11.Caption := 'CNPJ/CPF:' + Table1.FieldByName('documento').asString;
  mes := ver_mes(copy(f_rav.maskedit1.text,4,2));
  QrLabel6.Caption  := 'São Paulo, ' + copy(f_rav.maskedit1.text,1,2) + ' de ' + mes + ' de ' + copy(f_rav.maskedit1.text,7,4) + '.';
  QrLabel38.Caption := Table1.FieldByName('contrato').asString;
  QrLabel64.Caption := Table1.FieldByName('nome_rem').asString;
  QrLabel50.Caption := Table1.FieldByName('fax_banco').asString; //percentual
  QrLabel51.Caption := Table1.FieldByName('parcelas').asString;
  mes := ver_mes(copy(Table1.FieldByName('data_ven').asString,4,2));
  QrLabel56.Caption := mes;
  QrLabel59.Caption := '/'+ copy(Table1.FieldByName('data_ven').asString,7,4);
  QrLabel24.Caption := Table1.FieldByName('parcelas').asString;
  QrLabel25.Caption := inttostr(Table1.FieldByName('parcelas').asInteger + Table1.FieldByName('parcelas').asInteger);
  QrLabel54.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('vr_total').ascurrency);
  QrLabel66.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('emolumento').ascurrency);
  QrLabel67.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('estado').ascurrency);
  QrLabel68.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ipesp').ascurrency);
  QrLabel69.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('reg_civil').ascurrency);
  QrLabel70.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('trib_just').ascurrency);
  QrLabel71.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ar').ascurrency);
  QrLabel72.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('total').ascurrency);
  QrLabel73.Caption := Table1.FieldByName('data_reg').asString;
  QrLabel91.Caption := Table1.FieldByName('registro').asString;
  QrLabel85.Caption := Table1.FieldByName('nome').asString;
  QrLabel86.Caption := Table1.FieldByName('endereco').asString + ' - ' + Table1.FieldByName('bairro').asString;
  QrLabel87.Caption := Table1.FieldByName('cidade').asString + ' - ' +Table1.FieldByName('uf').asString;
  QrLabel88.Caption := Table1.FieldByName('registro').asString;

  if (F_RAV.RadioButton4.checked = true) then
   begin
   QRLabel75.Caption := '';
   QRLabel76.Caption := '';
   QRLabel77.Caption := '';
   QRLabel78.Caption := '';
   QRLabel80.Caption := '';
   QRLabel81.Caption := '';
   QRLabel82.Caption := '';
   QRLabel83.Caption := '';
  end
  else
  begin
  QrLabel75.Caption := Copy(Table1.FieldByName('cep').asString,1,1);
  QrLabel76.Caption := Copy(Table1.FieldByName('cep').asString,2,1);
  QrLabel77.Caption := Copy(Table1.FieldByName('cep').asString,3,1);
  QrLabel78.Caption := Copy(Table1.FieldByName('cep').asString,4,1);
  QrLabel80.Caption := Copy(Table1.FieldByName('cep').asString,5,1);
  QrLabel81.Caption := Copy(Table1.FieldByName('cep').asString,7,1);
  QrLabel82.Caption := Copy(Table1.FieldByName('cep').asString,8,1);
  QrLabel83.Caption := Copy(Table1.FieldByName('cep').asString,9,1);
  end;
end;

end.
