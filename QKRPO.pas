unit QkRpo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, StdCtrls;

type
  TQk_Rpo = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRLabel15: TQRLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRShape7: TQRShape;
    QRLabel10: TQRLabel;
    QRShape8: TQRShape;
    QRLabel17: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel18: TQRLabel;
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
  Qk_Rpo: TQk_Rpo;
  x, qdetit, pag : Integer;
  pritit, ultit : String;

implementation

Uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_Rpo.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  linha : String;
begin
  if (Label4.Caption = 'COM MOV') then
  begin
    if (pritit = '') then pritit := Dm.ArqAux.FieldByName('protocolo').asString;
    ultit := Dm.ArqAux.FieldByName('protocolo').asString;
    qdetit := qdetit + 1;
  end
  else
  begin
    QrDbText1.Enabled := False;
    QrDbText2.Enabled := False;
    QrDbText3.Enabled := False;
    QrDbText4.Enabled := False;
  end;
  if (Dm.ArqAux.FieldByName('registro').asInteger = 0) then
  begin
    QrDbText2.Enabled := False;
  end
  else QrDbText2.Enabled := True;
  x := x + 1;
  if (x = 28) then
  begin
    QrShape1.Enabled := True;
    x := 0;
  end
  else QrShape1.Enabled := False;  
end;

procedure TQk_Rpo.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x      := 0;
  qdetit := 0;
  pritit := '';
  ultit  := '';
  pag    := StrToInt(Label3.Caption);
end;

procedure TQk_Rpo.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel13.Caption := '';

  if (qdetit = 0) then
  begin
    QrLabel13.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, não tendo recepcionado nenhum título.';
  end
  else
  begin
    if (qdetit = 1) then
    begin
      QrLabel13.Caption := 'Certifico que, a hora legal encerrei o expediente, tendo sido recepcionados ' + IntToStr(qdetit) + ' documento protocolado de número  ' + pritit + ' a ' + ultit + '.';
    end
    else QrLabel13.Caption := 'Certifico que, a hora legal encerrei o expediente, tendo sido recepcionados ' + IntToStr(qdetit) + ' documentos protocolados de números ' + pritit + ' a ' + ultit + '.';
  end;
end;

procedure TQk_Rpo.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  pag := pag + 1;
  QrLabel15.Caption := 'Livro nº ' + Trim(Label1.Caption) + '-' + Trim(Label2.Caption) + ' Folha nº ' + StrZero(IntTostr(pag), 3);
end;

end.

