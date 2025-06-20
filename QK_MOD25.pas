unit QK_MOD25;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, QrAngLbl, qrRDBarra;

type
  TF_Mod25 = class(TForm)
    QuickRep1: TQuickRep;
    Table1: TTable;
    v: TQRChildBand;
    QRImage1: TQRImage;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
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
    QRShape3: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel79: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRRDbarra1: TQRRDbarra;
    QRAngledLabel4: TQRAngledLabel;
    QRAngledLabel3: TQRAngledLabel;
    QRAngledLabel2: TQRAngledLabel;
    QRAngledLabel1: TQRAngledLabel;
    QRRDbarra2: TQRRDbarra;
    QRLabel92: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel26: TQRLabel;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    procedure vBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Mod25: TF_Mod25;
  mes : string;

implementation

uses RAV, Menu;

{$R *.DFM}

procedure TF_Mod25.vBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel8.Caption  := Table1.FieldByName('nome').asString;
  QrLabel9.Caption  := Table1.FieldByName('endereco').asString + ' - ' + Table1.FieldByName('bairro').asString;
  QrLabel10.Caption := Table1.FieldByName('cep').asString + ' - ' + Table1.FieldByName('cidade').asString + ' - ' +Table1.FieldByName('uf').asString;
 // QrLabel11.Caption := 'CNPJ/CPF:' + Table1.FieldByName('documento').asString;
  mes := ver_mes(copy(f_rav.maskedit1.text,4,2));
  QrLabel6.Caption  := 'Diadema, ' + copy(f_rav.maskedit1.text,1,2) + ' de ' + mes + ' de ' + copy(f_rav.maskedit1.text,7,4) + '.';
  QrLabel66.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('emolumento').ascurrency);
  QrLabel67.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('estado').ascurrency);
  QrLabel68.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ipesp').ascurrency);
  QrLabel69.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('reg_civil').ascurrency);
  QrLabel70.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('trib_just').ascurrency);
  QrLabel71.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ar').ascurrency);
  QrLabel72.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('total').ascurrency);
  QrLabel73.Caption := Table1.FieldByName('data_reg').asString;
  QrLabel74.Caption := Table1.FieldByName('registro').asString;
  QrLabel16.caption := Table1.FieldByName('end_banco').asString +',   '+ Table1.FieldByName('bai_banco').asString+ ' -  '+Table1.FieldByName('cep_banco').asString +' -  '+Table1.FieldByName('cid_banco').asString+' -  '+ Table1.FieldByName('est_banco').asString+' - TEL. '+Table1.FieldByName('tel_banco').asString+' - FAX  '+ Table1.FieldByName('fax_banco').asString ;
  QrLabel4.caption  := Table1.FieldByName('banco').asString +' - '+ Table1.FieldByName('cid_banco').asString+' - ' + Table1.FieldByName('est_banco').asString ;
  QrLabel11.caption  := 'C.N.P.J.    '+ Table1.FieldByName('cpf_banco').asString;
  QrLabel14.caption  := Table1.FieldByName('empresa').asString  + ',';
  QrLabel19.caption  := Table1.FieldByName('p_v_mora').asString;
  QrLabel17.caption  := copy(Table1.FieldByName('contrato').asString,1,88);
  QrLabel26.caption  := copy(Table1.FieldByName('contrato').asString,89,200);
  QrLabel18.caption  := formatcurr('R$###,###,##0.00',Table1.FieldByName('vr_total').ascurrency);
  QrLabel22.caption  := Table1.FieldByName('parcelas').asString;
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

procedure TF_Mod25.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // QrLabel2.Caption := F_Menu.Label9.Caption;
 // QrLabel3.Caption := F_Menu.Label11.Caption;
 // QrLabel4.Caption := F_Menu.Label7.Caption;
  QRAngledLabel1.Caption := 'DESTINAT�RIO';
  QRAngledLabel2.Caption := Table1.FieldByName('nome').asString;
  QRAngledLabel3.Caption := Table1.FieldByName('endereco').asString + ' - ' + Table1.FieldByName('bairro').asString;
  QRAngledLabel4.Caption := Table1.FieldByName('cidade').asString + '              ' + Table1.FieldByName('cep').asString;
  QrLabel92.Caption := Table1.FieldByName('nome').asString;
  //Verificar digito do N� RL
 { nrl := 'RZ' + Digi(IntToStr(Table1.FieldByName('rz').AsInteger)) + 'BR';
  QRRDbarra1.Text := nrl;
  QRRDbarra2.Text := nrl; }
end;

end.
