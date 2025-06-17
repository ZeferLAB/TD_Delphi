unit QkAviso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TQk_Aviso = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRRichText1: TQRRichText;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel16: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_Aviso: TQk_Aviso;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_Aviso.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  ende : String;
begin
  ende := '';
  ende := '';
  ende := Dm.Join.FieldByName('endereco').asString;
  if (Trim(Dm.Join.FieldByName('numero').asString) <> '') then
  begin
    ende := ende + ' Nº ' + Dm.Join.FieldByName('numero').asString;
  end;
  ende := Trim(ende) + Trim(Dm.Join.FieldByName('complem').asString) + ' ';
  if (Trim(Dm.Join.FieldByName('bairro').asString) <> '') then
  begin
    ende := Trim(ende) + ' ' + Trim(Dm.Join.FieldByName('bairro').asString);
  end;
  if (Trim(Dm.Join.FieldByName('cidade').asString) <> '') then
  begin
    ende := Trim(ende) + ' ' + Trim(Dm.Join.FieldByName('cidade').asString) + ' - ' + Trim(Dm.Join.FieldByName('estado').asString);
  end;

  QrLabel10.Caption := '';
  QrLabel18.Caption := '';
  QrLabel14.Caption := '';

  QrLabel10.Caption := ende;
  QrLabel14.Caption := Copy(StrZero(Dm.Join.FieldByName('registro').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.Join.FieldByName('registro').asString, 6), 4,3);
  QrLabel18.Caption := Copy(StrZero(Dm.Join.FieldByName('p_auxiliar').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.Join.FieldByName('p_auxiliar').asString, 6), 4,3);
end;

end.

