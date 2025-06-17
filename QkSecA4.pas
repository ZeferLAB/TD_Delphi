unit QkSecA4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg, StdCtrls,
  ValorPor;

type
  TQk_SecA4 = class(TForm)
    QuickRep1: TQuickRep;
    Label1: TLabel;
    ValorPorExtenso1: TValorPorExtenso;
    ValorPorExtenso2: TValorPorExtenso;
    Label2: TLabel;
    QRSubDetail1: TQRSubDetail;
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
    QRLabel78: TQRLabel;
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
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel88: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRLabel89: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
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
  Qk_SecA4 : TQk_SecA4;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_SecA4.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 { QrLabel11.Caption := 'CNPJ/CPF:' + Table1.FieldByName('documento').asString;
  QrLabel23.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('vr_total').ascurrency) +  StringOfChar('*',23);
  QrLabel74.Caption := Table1.FieldByName('registro').asString;
  QrLabel73.Caption := Table1.FieldByName('data_reg').asString;
  QrLabel47.Caption := Table1.FieldByName('fax_banco').asString + '%';
  QrLabel16.Caption := Trim(Table1.FieldByName('parcelas').asString) + ' parcela(s)';
  QrLabel66.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('emolumento').ascurrency);
  QrLabel67.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('estado').ascurrency);
  QrLabel68.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ipesp').ascurrency);
  QrLabel69.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('reg_civil').ascurrency);
  QrLabel70.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('trib_just').ascurrency);
  QrLabel71.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('ar').ascurrency);
  QrLabel72.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('total').ascurrency);
  QrLabel54.Caption := formatcurr('###,###,##0.00',Table1.FieldByName('vr_total').ascurrency);
  QrLabel56.Caption := Table1.FieldByName('data_cel').asString;
  QrLabel61.Caption := Table1.FieldByName('contrato').asString;
  QrLabel63.Caption := Table1.FieldByName('nome_rem').asString;
  ValorPorExtenso1.valor := Table1.FieldByName('vr_total').ascurrency;
  QrLabel64.Caption := '(' + label1.Caption + Copy(StringOfChar('*', 75), 1, (75 - length(label1.Caption)) ) + '),';
  ValorPorExtenso2.valor := Table1.FieldByName('vr_total').ascurrency;
  QrLabel65.Caption := '(' + label2.Caption + Copy(StringOfChar('*', 87), 1, (87 - length(label2.Caption)) ) + '),';
  QrLabel86.Caption := Table1.FieldByName('nome').asString;
  QrLabel87.Caption := Table1.FieldByName('endereco').asString + ' - ' + Table1.FieldByName('bairro').asString;
  QrLabel88.Caption := Table1.FieldByName('cidade').asString + ' - ' +Table1.FieldByName('uf').asString;
  QrLabel90.Caption := Table1.FieldByName('registro').asString;  }





//////////////////////////////////////////////////////////////////////////
  QrLabel13.Caption := '';
  QrLabel12.Caption := '';
  QrLabel78.Caption := '';


  QrLabel9.Caption  := '';
  QrLabel32.Caption := '';
  QrLabel33.Caption := '';
  QrLabel34.Caption := '';
  QrLabel35.Caption := '';
  QrLabel36.Caption := '';

  
//  QrImage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
     QrLabel9.Caption  := 'Santo André, ' + DataExtenso(Dm.Join.FieldByName('data_p').asString, False, '');
     QrLabel32.Caption := Dm.Join.FieldByName('nome').asString;
     QrLabel33.Caption := Dm.Join.FieldByName('endereco').asString;
     QrLabel34.Caption := Dm.Join.FieldByName('bairro').asString;
     QrLabel35.Caption := FormataCep(Dm.Join.FieldByName('cep').asString) + StringOfChar(' ', 10) + Dm.Join.FieldByName('cidade').asString + StringOfChar(' ', 10) + Dm.Join.FieldByName('estado').asString;
     QrLabel92.Caption := Dm.Join.FieldByName('doc1').asString;
     QrLabel95.Caption := Dm.Join.FieldByName('contrato').asString;
     QrLabel97.Caption := Dm.Join.FieldByName('grupo').asString;
     QrLabel99.Caption := Dm.Join.FieldByName('cota').asString;
     QrLabel44.Caption := Trim(Dm.Join.FieldByName('parcelas').asString) + ' parcela(s)';
     QrLabel47.Caption := formatcurr('###,###,##0.00',Dm.Join.FieldByName('val_parc').ascurrency) +  StringOfChar('*',23);
     QrLabel49.Caption := Dm.Join.FieldByName('porcentagem').asString +  ' %';
     ValorPorExtenso1.valor := Dm.Join.FieldByName('val_parc').ascurrency;
     ValorPorExtenso2.valor := Dm.Join.FieldByName('val_parc').ascurrency;
     QrLabel65.Caption := '(' + label2.Caption + Copy(StringOfChar('*', 87), 1, (87 - length(label2.Caption)) ) + '),';
     QrLabel64.Caption := '(' + label1.Caption + Copy(StringOfChar('*', 75), 1, (75 - length(label1.Caption)) ) + '),';
     QrLabel56.Caption := formatcurr('###,###,##0.00',Dm.Join.FieldByName('val_parc').ascurrency); 
     QrLabel58.Caption := Dm.Join.FieldByName('data_apuracao').asString;
     QrLabel78.Caption := F_Menu.Label29.Caption;
     QrLabel36.Caption := F_Menu.Label9.Caption;
     QrLabel12.Caption := F_Menu.Label11.Caption;
     QrLabel13.Caption := Dm.Join.FieldByName('protocolo').asString + '/' + Dm.Join.FieldByName('registro').asString + ', em ' + Dm.Join.FieldByName('data_p').asString + '.';
     QrLabel63.Caption := Dm.Join.FieldByName('a_nome').asString;

end;

procedure TQk_SecA4.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  ende : String;
begin


end;

end.


