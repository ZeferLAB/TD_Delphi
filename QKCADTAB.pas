unit QkCadTab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TQk_CadTab = class(TForm)
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
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape1: TQRShape;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
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
  Qk_CadTab: TQk_CadTab;
  x     : Integer;

implementation

Uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_CadTab.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (Dm.Cad_Tab2.Eof) OR (x = 41) then
  begin
    QrShape1.Enabled := True;
    x := 0;
  end
  else
  begin
    x := x + 1;
    QrShape1.Enabled := False;
  end;
  QrLabel9.Caption := '';
  QrLabel9.Caption := StrZero(Dm.Cad_Tab2.FieldByName('tabela').asString, 2) + Trim(Dm.Cad_Tab2.FieldByName('letra').asString);
end;

procedure TQk_CadTab.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x := 0;
end;

end.
