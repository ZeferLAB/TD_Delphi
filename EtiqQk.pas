unit EtiqQk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TF_Etiq = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Etiq: TF_Etiq;

implementation


Uses Retq, Menu, DMTD;

{$R *.DFM}

procedure TF_Etiq.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

{ F_Etiq.QrLabel1.Caption:= FormatCurr('###,###,##0.00',Dm.ArqAux.fieldbyname('cartorio').ascurrency);
  F_Etiq.QrLabel3.Caption:= FormatCurr('###,###,##0.00',Dm.ArqAux.fieldbyname('estado').ascurrency);
  F_Etiq.QrLabel4.Caption:= FormatCurr('###,###,##0.00',Dm.ArqAux.fieldbyname('ipesp').ascurrency);
  F_Etiq.QrLabel6.Caption:= FormatCurr('###,###,##0.00',Dm.ArqAux.fieldbyname('reg_civil').ascurrency);
  F_Etiq.QrLabel13.Caption:= FormatCurr('###,###,##0.00',Dm.ArqAux.fieldbyname('tribunal').ascurrency);
  F_Etiq.QrLabel14.Caption:= FormatCurr('###,###,##0.00',Dm.ArqAux.fieldbyname('conducao').ascurrency);
  F_Etiq.QrLabel16.Caption:= FormatCurr('###,###,##0.00',Dm.ArqAux.fieldbyname('total').ascurrency);
  }

  if Dm.ArqAux.fieldbyname('v_ar').ascurrency > 0 then begin
    F_Etiq.QrLabel11.Caption:= 'AR';
    F_Etiq.QrLabel12.Caption:= 'Total';
//  F_Etiq.QrLabel15.Caption:= FormatCurr('###,###,##0.00',Dm.ArqAux.fieldbyname('ar').ascurrency);
//  F_Etiq.QrLabel16.Caption:= FormatCurr('###,###,##0.00',Dm.ArqAux.fieldbyname('total').ascurrency);
  end else begin
    F_Etiq.QrLabel11.Caption:= 'Total';
    F_Etiq.QrLabel12.Caption:= '';
//  F_Etiq.QrLabel15.Caption:= FormatCurr('###,###,##0.00',Dm.ArqAux.fieldbyname('total').ascurrency);
//  F_Etiq.QrLabel16.Caption:= '';
  end;
end;

end.
