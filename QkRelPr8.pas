unit QkRelPr8;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, qrRDBarra;

type
  TQk_RelPro8 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape22: TQRShape;
    QRShape24: TQRShape;
    QRSysData1: TQRSysData;
    QRShape17: TQRShape;
    QRShape27: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRRDbarra2: TQRRDbarra;
    QRLabel12: TQRLabel;
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
  Qk_RelPro8: TQk_RelPro8;
  x, qtde, ate_3, mais_3, andam     : Integer;

implementation

Uses DMTD, Menu , RelPro8, FuncGeral;

{$R *.DFM}

procedure TQk_RelPro8.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qtde := qtde + 1;
 { if ((Dm.ArqAux.FieldByName('dias_uteis').asstring >= inttostr(1)) and (Dm.ArqAux.FieldByName('dias_uteis').asstring <= inttostr(3))) then
   begin
    qrlabel23.caption := 'S';
    ate_3 := ate_3 + 1;
   end;
  if Dm.ArqAux.FieldByName('dias_uteis').asstring > inttostr(3) then
   begin
    qrlabel23.caption := 'N';
    mais_3 := mais_3 + 1;
   end;
  if Dm.ArqAux.FieldByName('data_prov1').asstring = '' then
   begin
    qrlabel23.caption := 'A';
    andam := andam + 1;
   end;   }

   QrRdBarra2.Text := '';
   QrRdBarra2.Text := F_Menu.Label34.Caption + Dm.ArqAux.FieldByName('rl').asstring + 'BR';

end;

procedure TQk_RelPro8.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x      := 0;
  qtde   := 0;
  ate_3  := 0;
  mais_3 := 0;
  andam  := 0;
  QrLabel3.Caption := '000';
end;

procedure TQk_RelPro8.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin     
  QrLabel11.Caption := '';
  QrLabel3.Caption := '000';  

  if (qtde = 1) then
  begin
    QrLabel11.Caption := 'Total de ' + StrZero(IntToStr(qtde), 4) + ' notificação certificada.';
  end
  else QrLabel11.Caption := 'Total de ' + StrZero(IntToStr(qtde), 4) + ' notificações certificadas.';
  qtde := 0;
end;

procedure TQk_RelPro8.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel3.Caption := StrZero(IntToStr(StrToInt(QrLabel3.Caption) + 1), 3);

  if F_Menu.Label34.Caption <> '' then
   QRLabel12.Caption := F_Menu.Label34.Caption
  else
   QRLabel12.Caption := 'RC';
end;

end.
