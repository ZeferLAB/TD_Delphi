unit QKAdvMoresA4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, StdCtrls, jpeg, qrRDBarra;

type
  TQK_AdvMoraisA4 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand3: TQRBand;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRImage3: TQRImage;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel51: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel52: TQRLabel;
    QRMemo2: TQRMemo;
    QRImage2: TQRImage;
    QRLabel30: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel92: TQRLabel;
    QRShape30: TQRShape;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape26: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel34: TQRLabel;
    QRImage4: TQRImage;
    QRLabel95: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QK_AdvMoraisA4: TQK_AdvMoraisA4;

implementation

uses DMTD, Menu;

{$R *.DFM}

procedure TQK_AdvMoraisA4.QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel37.Caption := DM.Join.FieldByName('p_auxiliar').AsString;
   QRLabel82.Caption := DM.Join.FieldByName('registro').AsString;
   QRLabel5.Caption  := FormatDateTime('DD/MM/YYYY', Dm.Join.FieldByName('data_r').AsDateTime);
   QRLabel34.Caption := FormatDateTime('DD/MM/YYYY', Dm.Join.FieldByName('data_r').AsDateTime);

   QrLabel112.Caption := F_Menu.Label2.Caption;
   QRLabel80.Caption  := F_Menu.Label9.Caption;
   QRLabel76.Caption  := F_Menu.Label35.Caption;
   QRLabel92.Caption  := F_Menu.Label7.Caption + ' - ' + F_Menu.Label6.Caption + ' - ' + F_Menu.Label36.Caption;
   QRLabel13.Caption  := FormatDateTime('"São Paulo," dd "de" mmmm "de" yyyy', Dm.Join.FieldByName('data_r').AsDateTime);

   QRLabel15.Caption := DM.Join.FieldByName('nome').AsString;
   QRLabel16.Caption := DM.Join.FieldByName('endereco').AsString;
   QRLabel17.Caption := DM.Join.FieldByName('bairro').AsString;
   QRLabel18.Caption := DM.Join.FieldByName('cidade').AsString + '     ' + DM.Join.FieldByName('estado').AsString;
   QRLabel19.Caption := Copy(DM.Join.FieldByName('cep').AsString, 1, 5) + '-' + Copy(DM.Join.FieldByName('cep').asstring, 6,5);

   QRLabel21.Caption := DM.Join.FieldByName('contrato').AsString;

   QRLabel24.Caption := DM.Join.FieldByName('ven_parc2').AsString;
   QRLabel29.Caption := DM.Join.FieldByName('ven_parc3').AsString;
   QRLabel31.Caption := DM.Join.FieldByName('ven_parc4').AsString;
   QRLabel32.Caption := DM.Join.FieldByName('ven_parc5').AsString;
   QRLabel53.Caption := DM.Join.FieldByName('ven_parc6').AsString;
   QRLabel54.Caption := DM.Join.FieldByName('ven_parc7').AsString;
   QRLabel55.Caption := DM.Join.FieldByName('ven_parc8').AsString;
   QRLabel56.Caption := DM.Join.FieldByName('ven_parc9').AsString;
   QRLabel57.Caption := DM.Join.FieldByName('ven_parc10').AsString;
   QRLabel58.Caption := DM.Join.FieldByName('ven_parc11').AsString;
   QRLabel2.Caption  := DM.Join.FieldByName('ven_parc12').AsString;
   QRLabel4.Caption  := DM.Join.FieldByName('ven_parc13').AsString;
   QRLabel42.Caption := DM.Join.FieldByName('ven_parc14').AsString;
   QRLabel68.Caption := DM.Join.FieldByName('ven_parc15').AsString;
   QRLabel88.Caption := DM.Join.FieldByName('ven_parc16').AsString;
   QRLabel90.Caption := DM.Join.FieldByName('ven_parc17').AsString;

   QRLabel25.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc2').AsCurrency);
   QRLabel59.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc3').AsCurrency);
   QRLabel60.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc4').AsCurrency);
   QRLabel61.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc5').AsCurrency);
   QRLabel62.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc6').AsCurrency);
   QRLabel63.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc7').AsCurrency);
   QRLabel64.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc8').AsCurrency);
   QRLabel65.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc9').AsCurrency);
   QRLabel66.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc10').AsCurrency);
   QRLabel67.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc11').AsCurrency);
   QRLabel3.Caption  := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc12').AsCurrency);
   QRLabel41.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc13').AsCurrency);
   QRLabel43.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc14').AsCurrency);
   QRLabel87.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc15').AsCurrency);
   QRLabel89.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc16').AsCurrency);
   QRLabel91.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('val_parc17').AsCurrency);

   QRLabel6.Caption  := FormatCurr('###,###,##0.00', (DM.Join.FieldByName('v_cartorio').AsCurrency + DM.Join.FieldByName('vo_mic').AsCurrency));
   QRLabel7.Caption  := FormatCurr('###,###,##0.00', (DM.Join.FieldByName('v_estado').AsCurrency + DM.Join.FieldByName('ve_mic').AsCurrency));
   QRLabel8.Caption  := FormatCurr('###,###,##0.00', (DM.Join.FieldByName('v_ipesp').AsCurrency + DM.Join.FieldByName('vi_mic').AsCurrency));
   QRLabel9.Caption  := FormatCurr('###,###,##0.00', (DM.Join.FieldByName('v_sinoreg').AsCurrency + DM.Join.FieldByName('vs_mic').AsCurrency));
   QRLabel10.Caption := FormatCurr('###,###,##0.00', (DM.Join.FieldByName('v_tribunal').AsCurrency + DM.Join.FieldByName('vt_mic').AsCurrency));
   QRLabel11.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('v_conducao').AsCurrency);

   QRLabel12.Caption := 'R$ ' + FormatCurr('###,###,##0.00', DM.Join.FieldByName('custas').AsCurrency);

   QRLabel52.Caption := FormatCurr('###,###,##0.00', DM.Join.FieldByName('tot_parcela').AsCurrency) + ',';
   QRLabel51.Caption := DM.Join.FieldByName('a_nome').AsString;

   if DM.Join.FieldByName('ven_parc3').AsString = '' then
      QRLabel59.Caption := '';
   if DM.Join.FieldByName('ven_parc4').AsString = '' then
      QRLabel60.Caption := '';
   if DM.Join.FieldByName('ven_parc5').AsString = '' then
      QRLabel61.Caption := '';
   if DM.Join.FieldByName('ven_parc6').AsString = '' then
      QRLabel62.Caption := '';
   if DM.Join.FieldByName('ven_parc7').AsString = '' then
      QRLabel63.Caption := '';
   if DM.Join.FieldByName('ven_parc8').AsString = '' then
      QRLabel64.Caption := '';
   if DM.Join.FieldByName('ven_parc9').AsString = '' then
      QRLabel65.Caption := '';
   if DM.Join.FieldByName('ven_parc10').AsString = '' then
      QRLabel66.Caption := '';
   if DM.Join.FieldByName('ven_parc11').AsString = '' then
      QRLabel67.Caption := '';
   if DM.Join.FieldByName('ven_parc12').AsString = '' then
      QRLabel3.Caption := '';
   if DM.Join.FieldByName('ven_parc13').AsString = '' then
      QRLabel41.Caption := '';
   if DM.Join.FieldByName('ven_parc14').AsString = '' then
      QRLabel43.Caption := '';
   if DM.Join.FieldByName('ven_parc15').AsString = '' then
      QRLabel87.Caption := '';
   if DM.Join.FieldByName('ven_parc16').AsString = '' then
      QRLabel89.Caption := '';
   if DM.Join.FieldByName('ven_parc17').AsString = '' then
      QRLabel91.Caption := '';

// If (Copy(DM.Join.FieldByName('a_nome').AsString,1,4) = 'MERC') OR (Copy(DM.Join.FieldByName('a_nome').AsString,1,4) = 'ADET') THEN
// Begin
     QrLabel93.Enabled  := True;
     QrLabel94.Enabled  := True;
     QrLabel95.Enabled  := True;
     QrLabel101.Enabled := True;
// End
// Else
// Begin
//   QrLabel93.Enabled  := False;
//   QrLabel94.Enabled  := False;
//   QrLabel95.Enabled  := False;
//   QrLabel101.Enabled := False;
// End;

end;

end.
