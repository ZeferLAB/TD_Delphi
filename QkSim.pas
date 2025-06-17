unit QkSim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg, StdCtrls;

type
  TQk_Sim = class(TForm)
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
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
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
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel85: TQRLabel;
    QRLabel2: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel57: TQRLabel;
    QRImage4: TQRImage;
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
  Qk_Sim : TQk_Sim;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_Sim.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
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
 // QrLabel40.Caption := 'XXXXXXXXXXXXXXXXXXXX';
//  QrLabel41.Caption := 'XXXXXXXXXXXXXXXXXXXX';
//  QrLabel42.Caption := 'XXXXXXXXXXXXXXXXXXXX';
//  QrLabel43.Caption := 'XXXXXXXXXXXXXXXXXXXX';
//  QrLabel44.Caption := 'XXXXXXXXXXXXXXXXXXXX';
//  QrLabel45.Caption := 'XXXXXXXXXXXXXXXXXXXX';
//  QrLabel46.Caption := 'XXXXXXXXXXXXXXXXXXXX';
//  QrLabel47.Caption := 'XXXXXXXXXXXXXXXXXXXX';
//  QrLabel48.Caption := 'XXXXXXXXXXXXXXXXXXXX';
//  QrLabel49.Caption := 'XXXXXXXXXXXXXXXXXXXX';
  QrImage1.Picture := NIL;

//  QrImage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
  QrLabel80.Caption := Dm.Join.FieldByName('endereco').asString;
  QrLabel81.Caption := Dm.Join.FieldByName('cidade').asString + ' - ' + Dm.Join.FieldByName('estado').asString;
  QrLabel67.Caption := Copy(Dm.Join.FieldByName('cep').asString, 1,1);
  QrLabel68.Caption := Copy(Dm.Join.FieldByName('cep').asString, 2,1);
  QrLabel69.Caption := Copy(Dm.Join.FieldByName('cep').asString, 3,1);
  QrLabel70.Caption := Copy(Dm.Join.FieldByName('cep').asString, 4,1);
  QrLabel71.Caption := Copy(Dm.Join.FieldByName('cep').asString, 5,1);
  QrLabel72.Caption := Copy(Dm.Join.FieldByName('cep').asString, 6,1);
  QrLabel73.Caption := Copy(Dm.Join.FieldByName('cep').asString, 7,1);
  QrLabel74.Caption := Copy(Dm.Join.FieldByName('cep').asString, 8,1);
  QrLabel9.Caption  := 'São Paulo, ' + DataExtenso(Dm.Join.FieldByName('data_p').asString, False, '');
  QrLabel32.Caption := Dm.Join.FieldByName('nome').asString;
  QrLabel33.Caption := Dm.Join.FieldByName('endereco').asString;
  QrLabel34.Caption := Dm.Join.FieldByName('bairro').asString;
  QrLabel35.Caption := FormataCep(Dm.Join.FieldByName('cep').asString) + StringOfChar(' ', 10) + Dm.Join.FieldByName('cidade').asString + StringOfChar(' ', 10) + Dm.Join.FieldByName('estado').asString;
  QrLabel78.Caption := F_Menu.Label2.Caption;
  QrLabel36.Caption := F_Menu.Label2.Caption;
  QrLabel12.Caption := F_Menu.Label11.Caption;
  QrLabel13.Caption := Dm.Join.FieldByName('protocolo').asString + '/' + Dm.Join.FieldByName('registro').asString + ', em ' + Dm.Join.FieldByName('data_p').asString + '.';
 // QrRdBarra3.Text := 'RZ ' + Dm.Join.FieldByName('rl').asstring + ' BR';
//QrRdBarra3.Text := 'RC ' + Dm.Join.FieldByName('rl').asstring + ' BR';
  QrRdBarra3.Text := F_Menu.Label34.Caption + Dm.Join.FieldByName('rl').asstring + ' BR';


 // if (Trim(Dm.Join.FieldByName('parcelas').asString) <> '') then QrLabel40.Caption := Dm.Join.FieldByName('parcelas').asString;
 // if (Trim(Dm.Join.FieldByName('parc2').asString) <> '')    then QrLabel41.Caption := Dm.Join.FieldByName('parc2').asString;
 // if (Trim(Dm.Join.FieldByName('parc3').asString) <> '')    then QrLabel42.Caption := Dm.Join.FieldByName('parc3').asString;
//  if (Trim(Dm.Join.FieldByName('parc4').asString) <> '')    then QrLabel43.Caption := Dm.Join.FieldByName('parc4').asString;
//  if (Trim(Dm.Join.FieldByName('parc5').asString) <> '')    then QrLabel44.Caption := Dm.Join.FieldByName('parc5').asString;
//  if (Dm.Join.FieldByName('ven_parc').asDateTime > 0)       then QrLabel45.Caption := Dm.Join.FieldByName('ven_parc').asString;
//  if (Dm.Join.FieldByName('ven_parc2').asDateTime > 0)      then QrLabel46.Caption := Dm.Join.FieldByName('ven_parc2').asString;
 // if (Dm.Join.FieldByName('ven_parc3').asDateTime > 0)      then QrLabel47.Caption := Dm.Join.FieldByName('ven_parc3').asString;
//  if (Dm.Join.FieldByName('ven_parc4').asDateTime > 0)      then QrLabel48.Caption := Dm.Join.FieldByName('ven_parc4').asString;
//  if (Dm.Join.FieldByName('ven_parc5').asDateTime > 0)      then QrLabel49.Caption := Dm.Join.FieldByName('ven_parc5').asString;


  if (Dm.Join.FieldByName('a_nome').asString = 'BANCO HSBC S/A') then
  begin
    if (Dm.Join.FieldByName('produto').asString = 'L') then
    begin
      QrLabel1.Caption := 'HSBC LEASING ARRENDAMENTO MERCANTIL S/A';
      QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logohsbcleasing.bmp');
    end
    else
    begin
      QrLabel1.Caption := 'BANCO HSBC S/A';
      QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logobancohsbc.bmp');
    end;
  end;
 { if (Dm.Join.FieldByName('a_nome').asString = 'BANCO DIBENS S/A') then
  begin
    if (Dm.Join.FieldByName('produto').asString = 'L') then
    begin
      QrLabel1.Caption := 'Dibens Leasing S/A';
      QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logobancodibens.bmp');
//    QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logodibensleasing.bmp');
    end
    else
    begin
      QrLabel1.Caption := 'Banco Dibens S/A';
      QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logobancodibens.bmp');
    end;
  end
  else
  begin
    if (Dm.Join.FieldByName('produto').asString = 'L') then
    begin
      QrLabel1.Caption := 'Unibanco Leasing S/A - Arrendamento Mercantil';
      QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logounibancofinanceira.bmp');
//    QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logounibancoleasing.bmp');
    end
    else
    begin
      QrLabel1.Caption := 'Unibanco - União dos Bancos Brasileiros S/A.';
      QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\assinatura\logounibancofinanceira.bmp');
    end;
  end; }

  QrLabel4.Caption := Dm.Join.FieldByName('contrato').asString;
end;

procedure TQk_Sim.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  ende : String;
begin
 { QrRdBarra1.Text := 'RZ ' + Dm.Join.FieldByName('rl').asstring + ' BR';
  QrRdBarra2.Text := 'RZ ' + Dm.Join.FieldByName('rl').asstring + ' BR'; }
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
end;

end.

       
