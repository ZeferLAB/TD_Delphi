unit QR_AvNN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables;

type
  TF_QAvNN = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    QRLabel18: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel12: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel13: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_QAvNN: TF_QAvNN;

implementation

Uses DMTD;

{$R *.DFM}

procedure TF_QAvNN.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  endereco : String;  
begin
  QrLabel3.Caption  := Dm.ArqAux.FieldByName('protocolo').asString;
  QrLabel47.Caption := Dm.ArqAux.FieldByName('nome').asString;
  QrLabel46.Caption := Dm.ArqAUx.FieldByName('nome_rem').asString;
  endereco := '';
  endereco := Trim(Dm.ArqAux.FieldByName('endereco').asString);
  if (Trim(Dm.ArqAux.FieldByName('bairro').asString) <> '') then
  begin
     endereco := endereco + ' - ' + Trim(Dm.ArqAux.FieldByName('bairro').asString);
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
  QrLabel49.Caption := endereco;
end;

end.
