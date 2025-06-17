unit QkCNeg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, jpeg;

type
  TQk_CNeg = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRRichText1: TQRRichText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel36: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_CNeg: TQk_CNeg;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQk_CNeg.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel7.Caption  := '';
  QrLabel9.Caption  := '';
  QrLabel10.Caption := '';
  QrLabel11.Caption := '';
  QrLabel12.Caption := '';
  QrLabel15.Caption := '';
  QrLabel33.Caption := '';
  QrLabel18.Caption := '';
  QrLabel22.Caption := '';
  QrLabel25.Caption := '';
  QrLabel27.Caption := '';

  QrLabel7.Caption  := Dm.ArqAux.FieldByName('empresa').asString;
  QrLabel9.Caption  := Dm.ArqAux.FieldByName('nome').asString;
  QrLabel10.Caption := Dm.ArqAux.FieldByName('endereco').asString;
  QrLabel11.Caption := Dm.ArqAux.FieldByName('bairro').asString;
  QrLabel12.Caption := Dm.ArqAux.FieldByName('cep').asString;
  QrLabel15.Caption := Copy(StrZero(Dm.ArqAux.FieldByName('indexador').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.ArqAux.FieldByName('indexador').asString, 6), 4,3);
  QrLabel33.Caption := Copy(StrZero(Dm.ArqAux.FieldByName('anotacao').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.ArqAux.FieldByName('anotacao').asString, 6), 4,3);
  QrLabel18.Caption := Copy(StrZero(Dm.ArqAux.FieldByName('p_auxiliar').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.ArqAux.FieldByName('p_auxiliar').asString, 6), 4,3);
  QrLabel22.Caption := Dm.ArqAux.FieldByName('rl').asString;
  QrLabel25.Caption := Dm.ArqAux.FieldByName('ocorrencia').asString;
{  Dm.Arqaux1.Close;
  Dm.Arqaux1.Sql.Clear;
  Dm.Arqaux1.Sql.Add('select situacao, numreg from acertifi where numreg = '+ Dm.arqaux.fieldbyname('indexador').asString);
  Dm.ArqAux1.Open;
  QrLabel25.Caption :=  Ver_Ocorrencia(dm.arqaux1.FieldByname('situacao').asString);
  Dm.Arqaux1.Close;}
  if (Trim(Dm.ArqAux.FieldByName('contrato').asString) <> '') then
  begin
    QrLabel31.Enabled := True;
  end
  else QrLabel31.Enabled := False;
  if (Trim(Dm.ArqAux.FieldByName('parcela1').asString) = '') then
  begin
    QrLabel32.Enabled := False;
  end
  else QrLabel32.Enabled := True;
  if (Trim(Dm.ArqAux.FieldByName('parcela2').asString) = '') then
  begin
    QrLabel34.Enabled := False;
  end
  else QrLabel34.Enabled := True;
  if (Trim(Dm.ArqAux.FieldByName('parcela3').asString) = '') then
  begin
    QrLabel35.Enabled := False;
  end
  else QrLabel35.Enabled := True;
  QrLabel27.Caption := StringOfChar('_', Length(QrLabel26.Caption));  
end;

end.

