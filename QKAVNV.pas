unit QkAvNV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, Db, DBTables;

type
  TQk_AvNV = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRImage1: TQRImage;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_AvNV: TQk_AvNV;

implementation

Uses DMTD;

{$R *.DFM}

procedure TQk_AvNV.QRBand1BeforePrint(Sender: TQRCustomBand;
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
