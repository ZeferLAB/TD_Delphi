unit QkCerP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TQk_CerP = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_CerP: TQk_CerP;

implementation

uses DMTD, Menu;

{$R *.DFM}

procedure TQk_CerP.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel9.Caption  := '';
  QrLabel10.Caption := '';
  QrLabel11.Caption := '';
  QrLabel18.Caption := '';
  QrLabel14.Caption := '';
  QrLabel24.Caption := '';

  QrLabel9.Caption  := Dm.ArqAux.FieldByName('nome').asString;
  QrLabel10.Caption := Dm.ArqAux.FieldByName('endereco').asString;;
  QrLabel11.Caption := Dm.ArqAux.FieldByName('cidade').asString;;
  QrLabel14.Caption := Dm.ArqAux.FieldByName('protocolo').asString;;
  QrLabel18.Caption :=  Dm.ArqAux.FieldByName('p_auxiliar').asString;;;
  if (Trim(Dm.ArqAux.FieldByName('certificado').asString) = '') then
  begin
    QrLabel23.Enabled := False;
    QrLabel24.Enabled := False;
  end
  else
  begin
    QrLabel23.Enabled := True;
    QrLabel24.Enabled := True;
    QrLabel24.Caption := Dm.ArqAux.FieldByName('certificado').asString;    
  end;
end;

end.

