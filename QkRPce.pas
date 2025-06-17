unit QkRPce;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TQk_RPce = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRShape7: TQRShape;
    QRLabel11: TQRLabel;
    QRShape8: TQRShape;
    QRLabel12: TQRLabel;
    QRShape9: TQRShape;
    QRLabel13: TQRLabel;
    QRShape10: TQRShape;
    QRLabel14: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_RPce: TQk_RPce;
  x, qtde     : Integer;

implementation

Uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_RPce.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qtde := qtde + 1;
end;

procedure TQk_RPce.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x    := 0;
  qtde := 0;
  QrLabel3.Caption := '000';
end;

procedure TQk_RPce.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel2.Caption := '';
  QrLabel3.Caption := '000';  

  if (qtde = 1) then
  begin
    QrLabel2.Caption := 'Total de ' + StrZero(IntToStr(qtde), 4) + ' pedido de certidão.';
  end
  else QrLabel2.Caption := 'Total de ' + StrZero(IntToStr(qtde), 4) + ' pedidos de certidão.';
  qtde := 0;
end;

procedure TQk_RPce.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel3.Caption := StrZero(IntToStr(StrToInt(QrLabel3.Caption) + 1), 3); 
end;

procedure TQk_RPce.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Qk_RPce.QrLabel5.Caption := 'PEDIDOS DE CERTIDÃO RECEPCIONADOS EM ' + Dm.ArqAux.FieldByName('data').asString + '.';
end;

end.
