unit U_ListagemDeRegistroAverbadoReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TF_ListagemDeRegistroAverbadoReport = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    QRShape4: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ListagemDeRegistroAverbadoReport: TF_ListagemDeRegistroAverbadoReport;

implementation

uses U_ListagemDeRegistroAverbado;

{$R *.DFM}

end.
