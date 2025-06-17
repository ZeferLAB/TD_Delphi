unit QNotAber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TQk_NotAber = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_NotAber: TQk_NotAber;
  x, qtde     : Integer;

implementation

Uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_NotAber.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qtde := qtde + 1;
end;

procedure TQk_NotAber.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x    := 0;
  qtde := 0;
  QrLabel3.Caption := '000';
end;

procedure TQk_NotAber.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel2.Caption := '';
  QrLabel3.Caption := '000';  

  if (qtde = 1) then
  begin
    QrLabel2.Caption := 'Total de ' + StrZero(IntToStr(qtde), 4) + ' notificação certificada.';
  end
  else QrLabel2.Caption := 'Total de ' + StrZero(IntToStr(qtde), 4) + ' notificações certificadas.';
  qtde := 0;
end;

procedure TQk_NotAber.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel3.Caption := StrZero(IntToStr(StrToInt(QrLabel3.Caption) + 1), 3); 
end;

end.
