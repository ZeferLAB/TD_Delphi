unit QK_DistSaqua;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, StdCtrls;

type
  TFQk_RelDist2 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel16: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape2: TQRShape;
    QRLabel25: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQk_RelDist2: TFQk_RelDist2;
  protini : String;
  tot_reg, ini : Integer;
implementation

uses  Menu, FuncGeral, ProcGeral, DMTD, URelDistrib;

{$R *.DFM}

procedure TFQk_RelDist2.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if protini = '' then protini := dm.ArqAux.FieldByname('registro').AsString;

  QrLabel1.Caption := dm.ArqAux.FieldByname('folha_b').AsString + ' / ' + dm.ArqAux.FieldByname('folha_b_f').AsString;

  dm.Selos.close;
  dm.selos.sql.Clear;
  dm.selos.sql.add('select selo_serie, selo_numero');
  dm.selos.sql.add('from selos');
  dm.selos.sql.add('where');
  dm.selos.sql.add('recibo = ' + dm.ArqAux.FieldByname('registro').AsString);
  dm.Selos.open;

  if dm.selos.RecordCount <> 0 then
    QrLabel22.Caption := dm.selos.FieldByName('selo_serie').AsString + dm.selos.FieldByName('selo_numero').AsString;
  dm.Selos.Close;
  QrLabel20.Caption := trim(StrCurr(dm.ArqAux.FieldByname('v_nome').AsCurrency+
                            dm.ArqAux.FieldByname('v_distrib').AsCurrency+
                            dm.ArqAux.FieldByname('v_infodistrib').AsCurrency +
                            dm.ArqAux.FieldByname('v_leis_dist').AsCurrency , 14, True));

  dm.Td_Pesso.close;
  dm.td_pesso.RequestLive := False;
  dm.td_pesso.SQL.Clear;
  dm.td_pesso.sql.add('select * from ' + F_RelDist.Label6.Caption);
  dm.td_pesso.sql.add('where');
  dm.td_pesso.sql.add('p_auxiliar = ' + dm.ArqAux.FieldByName('p_auxiliar').AsString);
  dm.Td_Pesso.open;
  dm.Td_Pesso.RequestLive := True;

  Inc(tot_reg);
end;

procedure TFQk_RelDist2.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel15.Caption := DataExtenso(DateToStr(date),True,'');
end;

procedure TFQk_RelDist2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  protini := '';
  tot_reg := 0;
end;

procedure TFQk_RelDist2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ini := 0;
end;

procedure TFQk_RelDist2.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRSubDetail1.Height := 24;
  Qrlabel23.Caption := '';

  QRDBText4.Enabled := False;
  QRDBText6.Enabled := False;

  If dm.Td_Pesso.FieldByname('nome').AsString = 'NADA' then
  Begin
    QRDBText7.Enabled := False;
    QRDBText3.Enabled := False;
    QRDBText8.Enabled := False;
    QRDBText1.Enabled := False;
    QRDBText4.Enabled := False;
    QRDBText6.Enabled := False;
  End
  Else
  Begin
    QRDBText7.Enabled := True;
    QRDBText3.Enabled := True;
    QRDBText8.Enabled := True;
    QRDBText1.Enabled := True;

    If (F_Menu.Label7.Caption = 'Nova Friburgo') AND (dm.td_pesso.FieldByname('doc1').AsString = 'N/C') AND (dm.td_pesso.FieldByname('doc2').AsString <> 'N/C') then
    Begin
      QRSubDetail1.Height := 44;
      QRDBText4.Enabled := true;
      QRDBText6.Enabled := True;
      Qrlabel23.Caption := 'Apresentado documento de identidade.';
    End;

  End;
end;

end.
