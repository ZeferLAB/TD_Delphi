unit U_ImpDajeEmitidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TF_ImpDajeEmitidos = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
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
    QRSysData1: TQRSysData;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel43: TQRLabel;
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
  F_ImpDajeEmitidos: TF_ImpDajeEmitidos;

  daje, emol, tx_fi, df_pb, fecom : Currency;
  qtd : Integer;

implementation

uses DM, Menu, U_DajeEmitidos;

{$R *.DFM}

procedure TF_ImpDajeEmitidos.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If (F_DajeEmitidos.ComboBox1.Text = 'GERAL') then
  Begin
    QRLabel42.Enabled := True;
    QRDBText8.Enabled := True;
  End;

  QRLabel12.Caption := '';
  QRLabel13.Caption := '';
  QRLabel15.Caption := '';
  QRLabel18.Caption := '';
  QRLabel20.Caption := '';
  QRLabel22.Caption := '';
  QRLabel24.Caption := '';
  QRLabel26.Caption := '';

  QRLabel12.Caption := Dm_Notas.Aux2.FieldByName('serie_daje').AsString + ' ' + Dm_Notas.Aux2.FieldByName('numero_daje').AsString;

  If (Dm_Notas.Aux2.FieldByName('tipo_doc').AsString = 'CPF') then
    QRLabel13.Caption := Dm_Notas.Aux2.FieldByName('tipo_doc').AsString + ' ' + ConvDoc(Dm_Notas.Aux2.FieldByName('doc').AsString, '2', 'CPF')
  Else
    QRLabel13.Caption := Dm_Notas.Aux2.FieldByName('tipo_doc').AsString + ' ' + ConvDoc(Dm_Notas.Aux2.FieldByName('doc').AsString, '2', 'CNPJ');

  QRLabel15.Caption := FormatCurr('R$ ###,###,##0.00', Dm_Notas.Aux2.FieldByName('vr_declarado').AsCurrency);
  QRLabel18.Caption := FormatCurr('R$ ###,###,##0.00', Dm_Notas.Aux2.FieldByName('vr_daje').AsCurrency);
  QRLabel20.Caption := FormatCurr('R$ ###,###,##0.00', Dm_Notas.Aux2.FieldByName('emol_daje').AsCurrency);
  QRLabel22.Caption := FormatCurr('R$ ###,###,##0.00', Dm_Notas.Aux2.FieldByName('tx_fisca_daje').AsCurrency);
  QRLabel24.Caption := FormatCurr('R$ ###,###,##0.00', Dm_Notas.Aux2.FieldByName('def_pub_daje').AsCurrency);
  QRLabel26.Caption := FormatCurr('R$ ###,###,##0.00', Dm_Notas.Aux2.FieldByName('fecom_daje').AsCurrency);

  qtd   := qtd   + Dm_Notas.Aux2.FieldByName('qtd').AsInteger;
  daje  := daje  + Dm_Notas.Aux2.FieldByName('vr_daje').AsCurrency;
  emol  := emol  + Dm_Notas.Aux2.FieldByName('emol_daje').AsCurrency;
  tx_fi := tx_fi + Dm_Notas.Aux2.FieldByName('tx_fisca_daje').AsCurrency;
  df_pb := df_pb + Dm_Notas.Aux2.FieldByName('def_pub_daje').AsCurrency;
  fecom := fecom + Dm_Notas.Aux2.FieldByName('fecom_daje').AsCurrency;
end;

procedure TF_ImpDajeEmitidos.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qtd   := 0;
  daje  := 0;
  emol  := 0;
  tx_fi := 0;
  df_pb := 0;
  fecom := 0;
end;

procedure TF_ImpDajeEmitidos.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel33.Caption := IntToStr(qtd);
  QRLabel34.Caption := FormatCurr('R$ ###,###,##0.00', daje);
  QRLabel35.Caption := FormatCurr('R$ ###,###,##0.00', emol);
  QRLabel36.Caption := FormatCurr('R$ ###,###,##0.00', tx_fi);
  QRLabel37.Caption := FormatCurr('R$ ###,###,##0.00', fecom);
  QRLabel38.Caption := FormatCurr('R$ ###,###,##0.00', df_pb);
end;

procedure TF_ImpDajeEmitidos.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If (F_DajeEmitidos.ComboBox1.Text <> 'GERAL') then
  Begin
    QRLabel43.Enabled := True;
    QRLabel43.Caption := 'Usuário: ' + F_DajeEmitidos.ComboBox1.Text;
  End;
end;

end.
