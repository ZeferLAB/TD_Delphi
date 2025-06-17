unit Faturado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, QrAngLbl, qrRDBarra;

type
  TF_Faturado = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
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
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Faturado: TF_Faturado;
  mes : string;

implementation

Uses DMTD, IMP_FAT, Menu;

{$R *.DFM}

procedure TF_Faturado.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel16.Caption  := Dm.ArqAux.FieldByName('nome').asString;
  QrLabel17.Caption  := Dm.ArqAux.FieldByName('endereco').asString + ' - ' + Dm.ArqAux.FieldByName('bairro').asString;
  QrLabel20.Caption := Dm.ArqAux.FieldByName('cep').asString + ' - ' + Dm.ArqAux.FieldByName('cidade').asString + ' - ' +Dm.ArqAux.FieldByName('uf').asString;
  mes := ver_mes(copy(F_IMPFAT.maskedit1.text,4,2));
  //QrLabel6.Caption  := 'São Paulo, ' + copy(F_IMPFAT.maskedit1.text,1,2) + ' de ' + mes + ' de ' + copy(F_IMPFAT.maskedit1.text,7,4) + '.';
  QrLabel66.Caption := formatcurr('###,###,##0.00',Dm.ArqAux.FieldByName('emolumento').ascurrency);
  QrLabel67.Caption := formatcurr('###,###,##0.00',Dm.ArqAux.FieldByName('estado').ascurrency);
  QrLabel68.Caption := formatcurr('###,###,##0.00',Dm.ArqAux.FieldByName('ipesp').ascurrency);
  QrLabel69.Caption := formatcurr('###,###,##0.00',Dm.ArqAux.FieldByName('reg_civil').ascurrency);
  QrLabel70.Caption := formatcurr('###,###,##0.00',Dm.ArqAux.FieldByName('trib_just').ascurrency);
  QrLabel71.Caption := formatcurr('###,###,##0.00',Dm.ArqAux.FieldByName('ar').ascurrency);
  QrLabel72.Caption := formatcurr('###,###,##0.00',Dm.ArqAux.FieldByName('total').ascurrency);
  QrLabel73.Caption := Dm.ArqAux.FieldByName('data_reg').asString;
  QrLabel74.Caption := Dm.ArqAux.FieldByName('protocolo').asString;
  QrLabel18.Caption := Dm.ArqAux.FieldByName('banco').asString;
  QrLabel19.Caption := Dm.ArqAux.FieldByName('contrato').asString;
  QrLabel15.Caption := Dm.ArqAux.FieldByName('registro').asString;
  QrLabel10.Caption := F_impfat.maskedit4.text;
  QrLabel11.Caption := F_impfat.maskedit5.text;
 end;

end.
