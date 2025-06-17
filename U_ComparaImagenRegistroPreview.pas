unit U_ComparaImagenRegistroPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, StdCtrls, ExtCtrls;

type
  TF_ComparaImagenRegistroPreview = class(TForm)
    QuickRep1: TQuickRep;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel18: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ComparaImagenRegistroPreview: TF_ComparaImagenRegistroPreview;

implementation

uses U_ComparaImagenRegistro;

{$R *.DFM}

end.
