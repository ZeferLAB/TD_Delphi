unit QkUfesp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TQk_Ufesp = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_Ufesp: TQk_Ufesp;
  x     : Integer;

implementation

Uses DMTD;

{$R *.DFM}

procedure TQk_Ufesp.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (Dm.Ufesp.Eof) OR (x = 41) then
  begin
    QrShape1.Enabled := True;
    x := 0;
  end
  else
  begin
    x := x + 1;
    QrShape1.Enabled := False;
  end;
end;

procedure TQk_Ufesp.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x := 0;
end;

end.
