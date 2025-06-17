unit QkRpa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, StdCtrls;

type
  TQk_Rpa = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRShape1: TQRShape;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape2: TQRShape;
    QRLabel15: TQRLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel19: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    Label4: TLabel;
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
  Qk_Rpa: TQk_Rpa;
  x, qdetit, pag : Integer;
  pritit, ultit : String;

implementation

Uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_Rpa.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  linha : String;
begin
  QrLabel10.Caption := '';

  if label4.caption = 'COM MOV' then
    begin
      if (pritit = '') then pritit := Dm.ArqAux.FieldByName('p_auxiliar').asString;
      ultit := Dm.ArqAux.FieldByName('p_auxiliar').asString;
      QrLabel10.Caption := StrBranco(Def_Lan(Dm.ArqAux.FieldByName('lancamento').asString, False), 10, 'D');
      qdetit := qdetit + 1;      
    end
  else
    begin
      QrDbText1.Enabled := False;
      QrDbText2.Enabled := False;
      QrDbText3.Enabled := False;
      QrDbText4.Enabled := False;
    end;

  if (Dm.ArqAux.Eof) OR (x = 28) then
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

procedure TQk_Rpa.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x      := 0;
  qdetit := 0;
  pritit := '';
  ultit  := '';
  pag    := StrToInt(Label3.Caption);  
end;

procedure TQk_Rpa.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel13.Caption := '';
  QrLabel14.Caption := '';

  if (qdetit = 0) then
  begin
    QrLabel13.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, não tendo recepcionado nenhum título.';
  end
  else
  begin
    if (qdetit = 1) then
    begin
      QrLabel13.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, recepcionando ' + IntToStr(qdetit) + ' título numerado de ' + pritit + ' a ' + ultit + '.';
    end
    else QrLabel13.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, recepcionando ' + IntToStr(qdetit) + ' títulos numerados de ' + pritit + ' a ' + ultit + '.';
  end;
  QrLabel14.Caption := DataExtenso(Label5.Caption, True, '') + ' ' + F_Menu.Label5.Caption + ' - ' + F_Menu.Label13.Caption + '________________________________.';
end;

procedure TQk_Rpa.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  pag := pag + 1;
  QrLabel15.Caption := 'Livro nº ' + Trim(Label1.Caption) + ' Folha nº ' + StrZero(IntToStr(pag), 3);

  QrLabel19.Caption := '';
  QrLabel19.Caption := DataExtenso(Label5.Caption, False, '');

end;

end.

