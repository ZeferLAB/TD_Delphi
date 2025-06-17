unit QR_RecNN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, Db, DBTables;

type
  TF_QRE = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_QRE: TF_QRE;

implementation

Uses DMTD;

{$R *.DFM}

procedure TF_QRE.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  endereco : String;  
begin
  QrLabel16.Caption := Dm.ArqAux.FieldByName('protocolo').asString;
  QrLabel21.Caption := Dm.ArqAux.FieldByName('nome').asString;
  QrLabel22.Caption := Dm.ArqAux.FieldByName('endereco').asString;
  endereco := '';
  if (Trim(Dm.ArqAux.FieldByName('bairro').asString) <> '') then
  begin
     endereco := Trim(Dm.ArqAux.FieldByName('bairro').asString);
  end;
  if (Trim(Dm.ArqAux.FieldByName('cidade').asString) <> '') then
  begin
     endereco := endereco + ' - ' + Trim(Dm.ArqAux.FieldByName('cidade').asString);
  end;
  if (Trim(Dm.ArqAux.FieldByName('uf').asString) <> '') then
  begin
     endereco := endereco + ' -  UF: ' + Trim(Dm.ArqAux.FieldByName('uf').asString);
  end;
  if (Trim(Dm.ArqAux.FieldByName('cep').asString) <> '') then
  begin
     endereco := endereco + ' - CEP: ' + Trim(Dm.ArqAux.FieldByName('cep').asString);
  end;
  QrLabel23.Caption := endereco;
end;

end.
