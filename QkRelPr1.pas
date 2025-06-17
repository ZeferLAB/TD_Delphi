unit QkRelPr1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TQk_RelPro1 = class(TForm)
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
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape3: TQRShape;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape19: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape20: TQRShape;
    QRLabel30: TQRLabel;
    QRSysData1: TQRSysData;
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
  Qk_RelPro1: TQk_RelPro1;
  x, qtde, ate_3, mais_3, andam     : Integer;

implementation

Uses DMTD, Menu , RelPro1, FuncGeral;

{$R *.DFM}

procedure TQk_RelPro1.QRBand2BeforePrint(Sender: TQRCustomBand;
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
   end;  }
end;

procedure TQk_RelPro1.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x      := 0;
  qtde   := 0;
  ate_3  := 0;
  mais_3 := 0;
  andam  := 0;
  QrLabel3.Caption := '000';
end;

procedure TQk_RelPro1.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin     
  QrLabel3.Caption := '000';  
  qtde := 0;
 // qrlabel29.caption := inttostr(tot_pos);
  qrlabel30.caption := inttostr(tot_neg);
 // qrlabel31.caption := inttostr(ate_3);
 // qrlabel32.caption := inttostr(mais_3);
 // qrlabel33.caption := inttostr(andam); 
end;

procedure TQk_RelPro1.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel3.Caption := StrZero(IntToStr(StrToInt(QrLabel3.Caption) + 1), 3); 
end;

end.
