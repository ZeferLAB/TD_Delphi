unit U_QkRelTitulosProtocolados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, StdCtrls, ExtCtrls;

type
  TF_QkRelTitulosProtocolados = class(TForm)
    QuickRep1: TQuickRep;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_QkRelTitulosProtocolados: TF_QkRelTitulosProtocolados;

implementation

{$R *.DFM}

uses FuncGeral, DMTD;

procedure TF_QkRelTitulosProtocolados.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel4.Caption := Ver_Natureza(Dm.qryRelTitulosPrenotados.fieldByName('natureza').asstring, False);

  If ValidData(Dm.qryRelTitulosPrenotados.fieldByName('Daje').asstring) then
    QRLabel5.Caption := 'Nota emitida em: ' + Dm.qryRelTitulosPrenotados.fieldByName('Daje').asstring
  Else
    QRLabel5.Caption := Dm.qryRelTitulosPrenotados.fieldByName('Daje').asstring

end;

end.
