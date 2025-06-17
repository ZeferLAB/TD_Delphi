unit QkScaA4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg, StdCtrls, RxGIF;

type
  TQk_ScaA4 = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRDBText11: TQRDBText;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRLabel31: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRImage3: TQRImage;
    QRLabel78: TQRLabel;
    QRLabel80: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel81: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape1: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel11: TQRLabel;
    Label1: TLabel;
    QRLabel8: TQRLabel;
    QRShape12: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel17: TQRLabel;
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
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape23: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape24: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRShape25: TQRShape;
    QRRDbarra3: TQRRDbarra;
    QRLabel75: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel55: TQRLabel;
    QRShape30: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel62: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel13: TQRLabel;
    QRImage4: TQRImage;
    QRRichText1: TQRRichText;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_ScaA4 : TQk_ScaA4;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_ScaA4.QRSubDetail1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  ende : string;
begin
  QrLabel13.Caption  := '';
  QrLabel4.Caption   := '';
  QrLabel12.Caption  := '';
  QrLabel78.Caption  := '';
  QrLabel80.Caption  := '';
  QrLabel81.Caption  := '';
  QrLabel9.Caption   := '';
  QrLabel32.Caption  := '';
  QrLabel33.Caption  := '';
  QrLabel34.Caption  := '';
  QrLabel35.Caption  := '';
  QrLabel36.Caption  := '';
  QrLabel40.Caption  := '                    ';
  QrLabel41.Caption  := '                    ';
  QrLabel42.Caption  := '                    ';
  QrLabel43.Caption  := '                    ';
  QrLabel44.Caption  := '                    ';
  QrLabel45.Caption  := '                    ';
  QrLabel46.Caption  := '                    ';
  QrLabel47.Caption  := '                    ';
  QrLabel48.Caption  := '                    ';
  QrLabel49.Caption  := '                    ';
  QrLabel86.Caption  := '                    ';
  QrLabel87.Caption  := '                    ';
  QrLabel88.Caption  := '                    ';
  QrLabel89.Caption  := '                    ';
  QrLabel90.Caption  := '                    ';
  QrLabel94.Caption  := '                    ';
  QrLabel95.Caption  := '                    ';
  QrLabel96.Caption  := '                    ';
  QrLabel97.Caption  := '                    ';
  QrLabel98.Caption  := '                    ';
  QrLabel99.Caption  := '                    ';
  QrLabel100.Caption := '                    ';
  QrLabel101.Caption := '                    ';
  QrLabel102.Caption := '                    ';
  QrLabel103.Caption := '                    ';
  QrLabel104.Caption := '                    ';
  QrLabel105.Caption := '                    ';
  QrLabel106.Caption := '                    ';
  QrLabel107.Caption := '                    ';
  QrLabel108.Caption := '                    ';
  QrLabel109.Caption := '                    ';
  QrLabel110.Caption := '                    ';
  QrLabel111.Caption := '                    ';
  QrLabel112.Caption := '                    ';
  QrLabel113.Caption := '                    ';
  QrLabel114.Caption := '                    ';
  QrLabel115.Caption := '                    ';
  QrLabel116.Caption := '                    ';
  QrLabel117.Caption := '                    ';
  QrLabel118.Caption := '                    ';
  QrLabel119.Caption := '                    ';
  QrLabel120.Caption := '                    ';
  QrLabel121.Caption := '                    ';
  QrLabel122.Caption := '                    ';
  QrLabel123.Caption := '                    ';
  QrLabel127.Caption := '                    ';

  QrLabel124.Caption := Dm.Join.FieldByName('nome').asString;

  ende := '';
  ende := Dm.Join.FieldByName('endereco').asString;
  if (Trim(Dm.Join.FieldByName('numero').asString) <> '') then
  begin
    ende := ende + '  Nº ' + Dm.Join.FieldByName('numero').asString;
  end;
  ende := Trim(ende) + ' ' + Trim(Dm.Join.FieldByName('complem').asString) + ' ';

  QrLabel80.Caption  := Trim(ende);
  //QrLabel80.Caption  := Dm.Join.FieldByName('endereco').asString +','+ Dm.Join.FieldByName('numero').asString +'  '+ Trim(Dm.Join.FieldByName('complem').asString);
  QrLabel125.Caption := Dm.Join.FieldByName('bairro').asString;
  QrLabel81.Caption  := Dm.Join.FieldByName('cidade').asString + ' - ' + Dm.Join.FieldByName('estado').asString;
  QrLabel67.Caption  := Copy(Dm.Join.FieldByName('cep').asString, 1,1);
  QrLabel68.Caption  := Copy(Dm.Join.FieldByName('cep').asString, 2,1);
  QrLabel69.Caption  := Copy(Dm.Join.FieldByName('cep').asString, 3,1);
  QrLabel70.Caption  := Copy(Dm.Join.FieldByName('cep').asString, 4,1);
  QrLabel71.Caption  := Copy(Dm.Join.FieldByName('cep').asString, 5,1);
  QrLabel72.Caption  := Copy(Dm.Join.FieldByName('cep').asString, 6,1);
  QrLabel73.Caption  := Copy(Dm.Join.FieldByName('cep').asString, 7,1);
  QrLabel74.Caption  := Copy(Dm.Join.FieldByName('cep').asString, 8,1);
  QrLabel9.Caption   := 'Cotia, ' + DataExtenso(Dm.Join.FieldByName('data_p').asString, False, '');

  QrLabel4.Caption  := Dm.Join.FieldByName('grupo').asString +'/'+ Dm.Join.FieldByName('cota').asString;
  QrLabel32.Caption := Dm.Join.FieldByName('nome').asString;
  QrLabel33.Caption := Trim(ende);
  //QrLabel33.Caption := Dm.Join.FieldByName('endereco').asString +','+ Dm.Join.FieldByName('numero').asString+'  '+Trim(Dm.Join.FieldByName('complem').asString);
  QrLabel34.Caption := Dm.Join.FieldByName('bairro').asString;
  QrLabel35.Caption := FormataCep(Dm.Join.FieldByName('cep').asString) + StringOfChar(' ', 10) + Dm.Join.FieldByName('cidade').asString + StringOfChar(' ', 10) + Dm.Join.FieldByName('estado').asString;
  QrLabel78.Caption := F_Menu.Label2.Caption;
  QrLabel36.Caption := F_Menu.Label2.Caption;
  QrLabel12.Caption := F_Menu.Label11.Caption;

  QrLabel13.Caption := Dm.Join.FieldByName('protocolo').asString + '/' + Dm.Join.FieldByName('registro').asString + ', em ' + Dm.Join.FieldByName('data_p').asString + '.';

//QrRdBarra3.Text   := 'RC ' + Dm.Join.FieldByName('rl').asstring + ' BR';
  QrRdBarra3.Text   := F_Menu.Label34.Caption + Dm.Join.FieldByName('rl').asstring + ' BR';

  //Nº das parcelas
  if (Trim(Dm.Join.FieldByName('parcelas').asString) <> '') then QrLabel40.Caption  := Dm.Join.FieldByName('parcelas').asString;
  if (Trim(Dm.Join.FieldByName('parc2').asString)    <> '') then QrLabel41.Caption  := Dm.Join.FieldByName('parc2').asString;
  if (Trim(Dm.Join.FieldByName('parc3').asString)    <> '') then QrLabel42.Caption  := Dm.Join.FieldByName('parc3').asString;
  if (Trim(Dm.Join.FieldByName('parc4').asString)    <> '') then QrLabel43.Caption  := Dm.Join.FieldByName('parc4').asString;
  if (Trim(Dm.Join.FieldByName('parc5').asString)    <> '') then QrLabel44.Caption  := Dm.Join.FieldByName('parc5').asString;
  if (Trim(Dm.Join.FieldByName('parc6').asString)    <> '') then QrLabel94.Caption  := Dm.Join.FieldByName('parc6').asString;
  if (Trim(Dm.Join.FieldByName('parc7').asString)    <> '') then QrLabel97.Caption  := Dm.Join.FieldByName('parc7').asString;
  if (Trim(Dm.Join.FieldByName('parc8').asString)    <> '') then QrLabel100.Caption := Dm.Join.FieldByName('parc8').asString;
  if (Trim(Dm.Join.FieldByName('parc9').asString)    <> '') then QrLabel103.Caption := Dm.Join.FieldByName('parc9').asString;
  if (Trim(Dm.Join.FieldByName('parc10').asString)   <> '') then QrLabel106.Caption := Dm.Join.FieldByName('parc10').asString;
  if (Trim(Dm.Join.FieldByName('parc11').asString)   <> '') then QrLabel109.Caption := Dm.Join.FieldByName('parc11').asString;
  if (Trim(Dm.Join.FieldByName('parc12').asString)   <> '') then QrLabel112.Caption := Dm.Join.FieldByName('parc12').asString;
  if (Trim(Dm.Join.FieldByName('parc13').asString)   <> '') then QrLabel115.Caption := Dm.Join.FieldByName('parc13').asString;
  if (Trim(Dm.Join.FieldByName('parc14').asString)   <> '') then QrLabel118.Caption := Dm.Join.FieldByName('parc14').asString;
  if (Trim(Dm.Join.FieldByName('parc15').asString)   <> '') then QrLabel121.Caption := Dm.Join.FieldByName('parc15').asString;

  //Vencimento das Parcelas
  if (Dm.Join.FieldByName('ven_parc').asDateTime   > 0)     then QrLabel45.Caption  := Dm.Join.FieldByName('ven_parc').asString;
  if (Dm.Join.FieldByName('ven_parc2').asDateTime  > 0)     then QrLabel46.Caption  := Dm.Join.FieldByName('ven_parc2').asString;
  if (Dm.Join.FieldByName('ven_parc3').asDateTime  > 0)     then QrLabel47.Caption  := Dm.Join.FieldByName('ven_parc3').asString;
  if (Dm.Join.FieldByName('ven_parc4').asDateTime  > 0)     then QrLabel48.Caption  := Dm.Join.FieldByName('ven_parc4').asString;
  if (Dm.Join.FieldByName('ven_parc5').asDateTime  > 0)     then QrLabel49.Caption  := Dm.Join.FieldByName('ven_parc5').asString;
  if (Dm.Join.FieldByName('ven_parc6').asDateTime  > 0)     then QrLabel95.Caption  := Dm.Join.FieldByName('ven_parc6').asString;
  if (Dm.Join.FieldByName('ven_parc7').asDateTime  > 0)     then QrLabel98.Caption  := Dm.Join.FieldByName('ven_parc7').asString;
  if (Dm.Join.FieldByName('ven_parc8').asDateTime  > 0)     then QrLabel101.Caption := Dm.Join.FieldByName('ven_parc8').asString;
  if (Dm.Join.FieldByName('ven_parc9').asDateTime  > 0)     then QrLabel104.Caption := Dm.Join.FieldByName('ven_parc9').asString;
  if (Dm.Join.FieldByName('ven_parc10').asDateTime > 0)     then QrLabel107.Caption := Dm.Join.FieldByName('ven_parc10').asString;
  if (Dm.Join.FieldByName('ven_parc11').asDateTime > 0)     then QrLabel110.Caption := Dm.Join.FieldByName('ven_parc11').asString;
  if (Dm.Join.FieldByName('ven_parc12').asDateTime > 0)     then QrLabel113.Caption := Dm.Join.FieldByName('ven_parc12').asString;
  if (Dm.Join.FieldByName('ven_parc13').asDateTime > 0)     then QrLabel116.Caption := Dm.Join.FieldByName('ven_parc13').asString;
  if (Dm.Join.FieldByName('ven_parc14').asDateTime > 0)     then QrLabel119.Caption := Dm.Join.FieldByName('ven_parc14').asString;
  if (Dm.Join.FieldByName('ven_parc15').asDateTime > 0)     then QrLabel122.Caption := Dm.Join.FieldByName('ven_parc15').asString;


  //Valor das Parcelas
  if (Dm.Join.FieldByName('val_parc').asCurrency   > 0)     then QrLabel86.Caption  := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc').asCurrency));
  if (Dm.Join.FieldByName('val_parc2').asCurrency  > 0)     then QrLabel87.Caption  := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc2').asCurrency));
  if (Dm.Join.FieldByName('val_parc3').asCurrency  > 0)     then QrLabel88.Caption  := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc3').asCurrency));
  if (Dm.Join.FieldByName('val_parc4').asCurrency  > 0)     then QrLabel89.Caption  := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc4').asCurrency));
  if (Dm.Join.FieldByName('val_parc5').asCurrency  > 0)     then QrLabel90.Caption  := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc5').asCurrency));
  if (Dm.Join.FieldByName('val_parc6').asCurrency  > 0)     then QrLabel96.Caption  := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc6').asCurrency));
  if (Dm.Join.FieldByName('val_parc7').asCurrency  > 0)     then QrLabel99.Caption  := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc7').asCurrency));
  if (Dm.Join.FieldByName('val_parc8').asCurrency  > 0)     then QrLabel102.Caption := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc8').asCurrency));
  if (Dm.Join.FieldByName('val_parc9').asCurrency  > 0)     then QrLabel105.Caption := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc9').asCurrency));
  if (Dm.Join.FieldByName('val_parc10').asCurrency > 0)     then QrLabel108.Caption := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc10').asCurrency));
  if (Dm.Join.FieldByName('val_parc11').asCurrency > 0)     then QrLabel111.Caption := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc11').asCurrency));
  if (Dm.Join.FieldByName('val_parc12').asCurrency > 0)     then QrLabel114.Caption := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc12').asCurrency));
  if (Dm.Join.FieldByName('val_parc13').asCurrency > 0)     then QrLabel117.Caption := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc13').asCurrency));
  if (Dm.Join.FieldByName('val_parc14').asCurrency > 0)     then QrLabel120.Caption := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc14').asCurrency));
  if (Dm.Join.FieldByName('val_parc15').asCurrency > 0)     then QrLabel123.Caption := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc15').asCurrency));


  QrLabel127.Caption := formatcurr('###,###,##0.00',(Dm.Join.FieldByName('val_parc').asCurrency  + Dm.Join.FieldByName('val_parc2').asCurrency + Dm.Join.FieldByName('val_parc3').asCurrency +
                                                     Dm.Join.FieldByName('val_parc4').asCurrency + Dm.Join.FieldByName('val_parc5').asCurrency + Dm.Join.FieldByName('val_parc6').asCurrency + Dm.Join.FieldByName('val_parc7').asCurrency +
                                                     Dm.Join.FieldByName('val_parc8').asCurrency + Dm.Join.FieldByName('val_parc9').asCurrency + Dm.Join.FieldByName('val_parc10').asCurrency + Dm.Join.FieldByName('val_parc11').asCurrency +
                                                     Dm.Join.FieldByName('val_parc12').asCurrency + Dm.Join.FieldByName('val_parc13').asCurrency + Dm.Join.FieldByName('val_parc14').asCurrency + Dm.Join.FieldByName('val_parc15').asCurrency));
end;                                                     

end.


