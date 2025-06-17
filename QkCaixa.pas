unit QkCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, StdCtrls;

type
  TQk_Caixa = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRBand2: TQRBand;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape15: TQRShape;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRShape7: TQRShape;
    QRLabel11: TQRLabel;
    QRShape8: TQRShape;
    QRShape16: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape17: TQRShape;
    QRBand3: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape18: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape19: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel51: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRRichText1: TQRRichText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    Label1: TLabel;
    QRLabel45: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_Caixa: TQk_Caixa;
  x : Integer;


implementation

Uses DMTD, Menu, CaixaF, FuncGeral;

{$R *.DFM}

procedure TQk_Caixa.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel44.Caption := '';
  Try
    Dm.ArqAux2.Close;
    Dm.ArqAux2.Sql.Clear;
    Dm.ArqAux2.Sql.Add('select recibo from td where p_auxiliar = ' + Dm.ArqAux.FieldByname('protocolo').AsString);
    Dm.ArqAux2.Open;
    QrLabel44.Caption := Dm.ArqAux2.FieldByname('recibo').AsString;
    Dm.ArqAux2.Close;

    If QrLabel44.Caption = '' then
    Begin
      Dm.ArqAux2.Close;
      Dm.ArqAux2.Sql.Clear;
      Dm.ArqAux2.Sql.Add('select recibo from certidao where nr_protoc = ' + Dm.ArqAux.FieldByname('protocolo').AsString);
      Dm.ArqAux2.Open;
      QrLabel44.Caption := Dm.ArqAux2.FieldByname('recibo').AsString;
      Dm.ArqAux2.Close;
    End;

  Except
  End;
  If NOT ValidNumero(QrLabel44.Caption) then QrLabel44.Caption := Dm.ArqAux.FieldByname('protocolo').AsString;

  QrDbText1.Enabled := False;
  QrDbText9.Enabled := False;
  QrShape15.Enabled := False;

//QrDbText2.Enabled := True;
  QrDbText3.Enabled := True;
  QrDbText4.Enabled := True;
  QrDbText5.Enabled := True;
  QrDbText6.Enabled := True;
  QrDbText7.Enabled := True;
  QrDbText8.Enabled := True;
  QrShape9.Enabled  := True;
  QrShape10.Enabled := True;
  QrShape11.Enabled := True;
  QrShape12.Enabled := True;
  QrShape13.Enabled := True;
  QrShape14.Enabled := True;
  if (Dm.ArqAux.FieldByName('cabecalho').asString = 'S') then
  begin
    QrDbText1.Enabled := True;
    QrShape15.Enabled := True;
    QrDbText2.Enabled := False;
    QrDbText3.Enabled := False;
    QrDbText4.Enabled := False;
    QrDbText5.Enabled := False;
    QrDbText6.Enabled := False;
    QrDbText7.Enabled := False;
    QrDbText8.Enabled := False;
    QrShape9.Enabled   := False;
    QrShape10.Enabled  := False;
    QrShape11.Enabled  := False;
    QrShape12.Enabled  := False;
    QrShape13.Enabled  := False;
    QrShape14.Enabled  := False;
  end;
  
  if (Dm.ArqAux.FieldByName('rodape').asString = 'S') then
  begin
    QrShape15.Enabled  := True;
    QrShape9.Enabled   := False;
    QrDbText9.Enabled  := True;  
  end;

  if (x = 52) then
  begin
    x := 0;
    QrShape15.Enabled := True;
  end
  else x := x + 1;
  if (Dm.ArqAux.FieldByName('traco').asString = 'S') then QrShape15.Enabled := True;

  if (Dm.ArqAux.FieldByName('valor_di').asCurrency <= 0) then QrDbText4.Enabled := False;
  if (Dm.ArqAux.FieldByName('valor_ch').asCurrency <= 0) then QrDbText5.Enabled := False;
  if (Dm.ArqAux.FieldByName('valor_de').asCurrency <= 0) then QrDbText6.Enabled := False;
  if (Dm.ArqAux.FieldByName('valor_to').asCurrency <= 0) then QrDbText7.Enabled := False;
end;

procedure TQk_Caixa.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x := 0;
end;

procedure TQk_Caixa.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tot : Currency;  
begin
  Dm.CaixaIn.Close;
  Dm.CaixaIn.RequestLive := False;
  Dm.CaixaIn.Sql.Clear;
  Dm.CaixaIn.Sql.Add('SELECT  data, SUM(dinheiro) dinheiro, SUM(cheque) cheque, SUM(moeda) moeda, sum(faturado) as faturado,');
  Dm.CaixaIn.Sql.Add('SUM(despesas) despesas,  SUM(cheque_canc) chqcanc, esp_despesas');
  Dm.CaixaIn.Sql.Add('FROM caixaind');
  Dm.CaixaIn.Sql.Add('WHERE');
  Dm.CaixaIn.Sql.Add('data = ' + Chr(39) + ConvData(F_CaixaF.MaskEdit1.Text) + Chr(39));
  Dm.CaixaIn.Sql.Add('GROUP BY data');
  Dm.CaixaIn.Open;
  QrLabel28.Caption := Trim(StrCurr(Dm.CaixaIn.FieldByName('dinheiro').asCurrency, 14, True));
  QrLabel30.Caption := Trim(StrCurr(Dm.CaixaIn.FieldByName('cheque').asCurrency, 14, True));
  QrLabel33.Caption := Trim(StrCurr((Dm.CaixaIn.FieldByName('cheque').asCurrency+Dm.CaixaIn.FieldByName('dinheiro').asCurrency+Dm.CaixaIn.FieldByName('faturado').asCurrency), 14, True));
  QrLabel35.Caption := Trim(StrCurr(Dm.CaixaIn.FieldByName('moeda').asCurrency, 14, True));
  QrLabel37.Caption := Trim(StrCurr(Dm.CaixaIn.FieldByName('despesas').asCurrency, 14, True));
  QrLabel39.Caption := Trim(StrCurr(Dm.CaixaIn.FieldByName('chqcanc').asCurrency, 14, True));
  QRLabel55.Caption := Trim(StrCurr(Dm.CaixaIn.FieldByName('faturado').asCurrency, 14, True));
  tot := 0.00;
  tot := (Dm.CaixaIn.FieldByName('cheque').asCurrency + Dm.CaixaIn.FieldByName('dinheiro').asCurrency +
          Dm.CaixaIn.FieldByName('moeda').asCurrency  +
          Dm.CaixaIn.FieldByName('faturado').asCurrency) - (Dm.CaixaIn.FieldByName('despesas').asCurrency + Dm.CaixaIn.FieldByName('chqcanc').asCurrency);

{ tot := (Dm.CaixaIn.FieldByName('cheque').asCurrency + Dm.CaixaIn.FieldByName('dinheiro').asCurrency +
          Dm.CaixaIn.FieldByName('moeda').asCurrency  + Dm.CaixaIn.FieldByName('despesas').asCurrency +
          Dm.CaixaIn.FieldByName('chqcanc').asCurrency + Dm.CaixaIn.FieldByName('faturado').asCurrency);}

  QrLabel41.Caption := Trim(StrCurr(tot, 14, True));
  QRRichText1.Lines.Clear;
  QRRichText1.Lines.Add(Dm.Caixain.FieldByName('esp_despesas').AsString);


  QrLabel13.Caption := Trim(StrCurr(SomaValores(Label1.Caption, 'valor_ch', '30', '', 8), 14, True));
  QrLabel19.Caption := Trim(StrCurr(SomaValores(Label1.Caption, 'valor_di', '20', '', 0), 14, True));
  QrLabel15.Caption := Trim(StrCurr(SomaValores(Label1.Caption, 'valor_ch', '20', '', 0), 14, True));
  QRLabel53.Caption := Trim(StrCurr(SomaValores(Label1.Caption, 'valor_fat', '20', '', 0), 14, True));
  QRLabel17.Caption := Trim(StrCurr(SomaValores(Label1.Caption, 'valor_de', '20', '', 0), 14, True));
  QrLabel22.Caption := Trim(StrCurr(StrToCurr(TirarTudo(QrLabel19.Caption, '.','','')) + StrToCurr(TirarTudo(QrLabel15.Caption, '.','','')) + StrToCurr(TirarTudo(QrLabel53.Caption, '.','','')), 14, True));
  QrLabel24.Caption := Trim(StrCurr(SomaValores(Label1.Caption, 'valor_di', '30', '', 0), 14, True));

  QrLabel26.Caption := Trim(StrCurr(StrToCurr(TirarTudo(QrLabel22.Caption, '.','','')) + StrToCurr(TirarTudo(QRLabel17.Caption, '.','','')) - StrToCurr(TirarTudo(QrLabel24.Caption, '.','','')), 14, True));

  QrLabel50.Caption := Trim(StrCurr(Abs(StrToCurr(TirarTudo(QrLabel26.Caption, '.','','')) + (StrToCurr(TirarTudo(QrLabel41.Caption, '.','','')))), 14, True));


{ dm.qr_cartorio.close;
  dm.qr_cartorio.RequestLive := False;
  dm.qr_cartorio.sql.Clear;
  dm.qr_cartorio.sql.add('select count(codigo) as qtde from catorios');
  dm.qr_cartorio.open;
  dm.qr_cartorio.RequestLive := True;
  QRLabel43.Caption := Trim(StrCurr((Dm.CaixaIn.FieldByName('dinheiro').asCurrency / dm.qr_cartorio.FieldByName('qtde').AsCurrency) , 14, True));}
  Dm.CaixaIn.Close;

end;

end.


