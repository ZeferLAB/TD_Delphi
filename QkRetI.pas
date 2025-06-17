unit QkRetI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRExport;

type
  TQk_RetI = class(TForm)
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
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
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
  Qk_RetI: TQk_RetI;
  x, qtde     : Integer;

implementation

Uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_RetI.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (Trim(Dm.ArqAux.FieldByName('destinatario').asString) <> '') then qtde := qtde + 1;
  x    := x + 1;
  if (Dm.ArqAux.Eof) OR (x = 30) then
  begin
    QrShape1.Enabled := True;
    x := 0;
  end
  else
  begin
    QrShape1.Enabled := False;
    x :=  x + 1;   
  end;
  if (Dm.ArqAux.FieldByName('traco').asString = 'S') then QrShape1.Enabled := True;  
end;

procedure TQk_RetI.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x    := 0;
  qtde := 0;
  QrLabel3.Caption := '000';
end;

procedure TQk_RetI.QRBand3BeforePrint(Sender: TQRCustomBand;
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

procedure TQk_RetI.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel3.Caption := StrZero(IntToStr(StrToInt(QrLabel3.Caption) + 1), 3); 
end;

end.
