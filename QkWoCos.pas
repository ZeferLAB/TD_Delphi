unit QkWoCos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg, StdCtrls;

type
  TQk_WoCos = class(TForm)
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
    QRChildBand1: TQRChildBand;
    QRLabel77: TQRLabel;
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
    QRLabel13: TQRLabel;
    Label1: TLabel;
    QRAngledLabel1: TQRAngledLabel;
    QRAngledLabel2: TQRAngledLabel;
    QRAngledLabel3: TQRAngledLabel;
    QRAngledLabel4: TQRAngledLabel;
    QRRDbarra1: TQRRDbarra;
    QRRDbarra2: TQRRDbarra;
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
    QRSysData1: TQRSysData;
    QRLabel85: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRRichText3: TQRRichText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRRichText1: TQRRichText;
    QRRichText2: TQRRichText;
    QRRichText4: TQRRichText;
    QRRichText5: TQRRichText;
    QRImage2: TQRImage;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_WoCos : TQk_WoCos;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_WoCos.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  ende2 : String;
begin
  QrLabel1.Caption  := '';
  QrLabel4.Caption  := '';
  QrLabel13.Caption := '';
  QrLabel12.Caption := '';
  QrLabel78.Caption := '';
  QrLabel80.Caption := '';
  QrLabel81.Caption := '';
  QrLabel9.Caption  := '';
  QrLabel32.Caption := '';
  QrLabel33.Caption := '';
  QrLabel34.Caption := '';
  QrLabel35.Caption := '';
  QrLabel36.Caption := '';
  QRRichText1.Enabled := false;
  QRRichText2.Enabled := false;
  QRLabel5.Enabled    := false;
  QRRichText3.Enabled := false;
  QRRichText4.Enabled := false;
  QRRichText5.Enabled := false;

  ende2 := '';
  ende2 := Dm.Join.FieldByName('endereco').asString;
  if (Trim(Dm.Join.FieldByName('numero').asString) <> '') then
  begin
    ende2 := ende2 + ' Nº ' + Dm.Join.FieldByName('numero').asString;
  end;
  ende2 := Trim(ende2) + ' ' + Trim(Dm.Join.FieldByName('complem').asString) + ' ';

  QrLabel80.Caption := ende2;
  QrLabel81.Caption := Dm.Join.FieldByName('cidade').asString + ' - ' + Dm.Join.FieldByName('estado').asString;
  QrLabel67.Caption := Copy(Dm.Join.FieldByName('cep').asString, 1,1);
  QrLabel68.Caption := Copy(Dm.Join.FieldByName('cep').asString, 2,1);
  QrLabel69.Caption := Copy(Dm.Join.FieldByName('cep').asString, 3,1);
  QrLabel70.Caption := Copy(Dm.Join.FieldByName('cep').asString, 4,1);
  QrLabel71.Caption := Copy(Dm.Join.FieldByName('cep').asString, 5,1);
  QrLabel72.Caption := Copy(Dm.Join.FieldByName('cep').asString, 6,1);
  QrLabel73.Caption := Copy(Dm.Join.FieldByName('cep').asString, 7,1);
  QrLabel74.Caption := Copy(Dm.Join.FieldByName('cep').asString, 8,1);

  if (Dm.Join.FieldByName('financeira').asString = 'CIA ITAULEASING DE ARREND MERCANTIL') then
   begin
    QrLabel3.Caption    := 'Ref.: Contrato de Arrendamento Mercantil Nº';
    QRRichText1.Enabled := true;
   end
   else
   begin
    QrLabel3.Caption    := 'Ref.: Contrato de Parcelamento Nº';
    QRRichText2.Enabled := true;
    QRLabel5.Enabled    := true;
    QRLabel5.Caption    := Dm.Join.FieldByName('ven_parc').asString;
   end;

  QrLabel4.Caption  := Dm.Join.FieldByName('contrato').asString;
  QrLabel41.Caption := Dm.Join.FieldByName('dt_contr').asString;
  QrLabel42.Caption := Dm.Join.FieldByName('parcelas').asString;
  QrLabel43.Caption := Dm.Join.FieldByName('ven_parc').asString;


  if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- S.J. do Rio Preto-SP') then
  QrLabel9.Caption  := 'São José do Rio Preto, ' + DataExtenso(Dm.Join.FieldByName('data_p').asString, False, '');

  if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- Presidente Prudente-SP') then
  QrLabel9.Caption  := 'Presidente Prudente, ' + DataExtenso(Dm.Join.FieldByName('data_p').asString, False, '');


  if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- Palmas-TO') then
  QrLabel9.Caption  := 'Palmas, ' + DataExtenso(Dm.Join.FieldByName('data_p').asString, False, '');

  QrLabel32.Caption := Dm.Join.FieldByName('nome').asString;
  QrLabel33.Caption := ende2;
  QrLabel34.Caption := Dm.Join.FieldByName('bairro').asString;
  QrLabel35.Caption := FormataCep(Dm.Join.FieldByName('cep').asString) + StringOfChar(' ', 10) + Dm.Join.FieldByName('cidade').asString + StringOfChar(' ', 10) + Dm.Join.FieldByName('estado').asString;
  QrLabel78.Caption := F_Menu.Label2.Caption;
  QrLabel36.Caption := F_Menu.Label2.Caption;
  QrLabel12.Caption := F_Menu.Label11.Caption;
  QrLabel13.Caption := Dm.Join.FieldByName('protocolo').asString + '/' + Dm.Join.FieldByName('registro').asString + ', em ' + Dm.Join.FieldByName('data_p').asString + '.';
 // QrRdBarra3.Text   := 'RZ ' + Dm.Join.FieldByName('rl').asstring + ' BR';
//QrRdBarra3.Text   := 'RC ' + Dm.Join.FieldByName('rl').asstring + ' BR';
  QrRdBarra3.Text   := F_Menu.Label34.Caption + Dm.Join.FieldByName('rl').asstring + ' BR';

  QrLabel1.caption := Dm.Join.FieldByName('financeira').asString;

  if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- S.J. do Rio Preto-SP') then
   begin
    QRRichText3.Enabled := true;
    QRRichText4.Enabled := false;
    QRRichText5.Enabled := false;
   end;

  if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- Presidente Prudente-SP') then
   begin
    QRRichText3.Enabled := false;
    QRRichText4.Enabled := true;
    QRRichText5.Enabled := false;
   end;

   if (Dm.Join.FieldByName('agencia').asString = 'W.O.Costa- Palmas-TO') then
   begin
    QRRichText3.Enabled := false;
    QRRichText4.Enabled := false;
    QRRichText5.Enabled := true;
   end;


end;

procedure TQk_WoCos.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  ende : String;
begin
 { QrRdBarra1.Text := 'RZ ' + Dm.Join.FieldByName('rl').asstring + ' BR';
  QrRdBarra2.Text := 'RZ ' + Dm.Join.FieldByName('rl').asstring + ' BR';}
//QrRdBarra1.Text := 'RC ' + Dm.Join.FieldByName('rl').asstring + ' BR';
//QrRdBarra2.Text := 'RC ' + Dm.Join.FieldByName('rl').asstring + ' BR';

  QrRdBarra1.Text := F_Menu.Label34.Caption + Dm.Join.FieldByName('rl').asstring + ' BR';
  QrRdBarra2.Text := F_Menu.Label34.Caption + Dm.Join.FieldByName('rl').asstring + ' BR';

  QRAngledLabel1.Caption := '';
  QRAngledLabel2.Caption := '';
  QRAngledLabel3.Caption := '';
  QRAngledLabel4.Caption := '';

  ende := '';
  ende := Dm.Join.FieldByName('endereco').asString;
  if (Trim(Dm.Join.FieldByName('numero').asString) <> '') then
  begin
    ende := ende + ' Nº ' + Dm.Join.FieldByName('numero').asString;
  end;
  ende := Trim(ende) + ' ' + Trim(Dm.Join.FieldByName('complem').asString) + ' ';
  QRAngledLabel1.Caption := Dm.Join.FieldByName('nome').asString;
  QRAngledLabel2.Caption := Trim(ende);
  QRAngledLabel3.Caption := Trim(Dm.Join.FieldByName('bairro').asString);
  QRAngledLabel4.Caption := 'CEP : ' + FormataCep(Dm.Join.FieldByName('cep').asString) + ' - ' + Trim(Dm.Join.FieldByName('cidade').asString) + ' / ' + Trim(Dm.Join.FieldByName('estado').asString);

  QrLabel64.caption := Dm.Join.FieldByName('protocolo').asString;
end;

end.


