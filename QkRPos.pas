unit QkRPos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, qrRDBarra, DBTables, StrUtils;

type
  TQk_RPos = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText3: TQRDBText;
    QRRDbarra2: TQRRDbarra;
    QRLabel13: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_RPos: TQk_RPos;
  x, qtde     : Integer;

implementation

Uses DMTD, Menu, Config, FuncGeral;

{$R *.DFM}

procedure TQk_RPos.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  ende : String;  
begin
  qtde  := qtde + 1;
  QrLabel11.Caption := '';
  QrLabel12.Caption := '';
 // QrLabel13.Caption := '';
  QrRdBarra2.Text   := '';
  ende  := '';
  ende  := Dm.Join.FieldByName('endereco').asString;
  if (Trim(Dm.Join.FieldByName('numero').asString) <> '') then
  begin
    ende := ende + ' Nº ' + Dm.Join.FieldByName('numero').asString;
  end;
  if (Trim(Dm.Join.FieldByName('complem').asString) <> '') then
  begin
    ende := ende + ' ' + Dm.Join.FieldByName('complem').asString;
  end;
  if (Trim(Dm.Join.FieldByName('bairro').asString) <> '') then
  begin
    ende := Trim(ende) + ' ' + Dm.Join.FieldByName('bairro').asString;
  end;
  QrLabel11.Caption := ende;
  QrLabel12.Caption := FormataCep(Dm.Join.FieldByName('cep').asString);
 // QrLabel13.Caption := Dm.Join.FieldByName('rl').asString;
//QrRdBarra2.Text := 'RC' + Dm.Join.FieldByName('rl').asstring + 'BR';
  QrRdBarra2.Text := F_Menu.Label34.Caption + Dm.Join.FieldByName('rl').asstring + 'BR';

  QrShape1.Enabled  := False;
  if (x = 23) then
  begin
    QrShape1.Enabled := True;
    x := 0;
  end
  else x := x + 1;
end;

procedure TQk_RPos.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x    := 0;
  qtde := 0;
end;

procedure TQk_RPos.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel2.Caption := '';

  if (qtde = 1) then
  begin
    QrLabel2.Caption := 'Total de ' + StrZero(IntToStr(qtde), 4) + ' notificação enviada.';
  end
  else QrLabel2.Caption := 'Total de ' + StrZero(IntToStr(qtde), 4) + ' notificações enviadas.';
  qtde := 0;
end;

procedure TQk_RPos.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   if F_Menu.Label34.Caption <> '' then
      QRLabel7.Caption := F_Menu.Label34.Caption
   else
      QRLabel7.Caption := 'RC';

   QrLabel13.Caption :=  Dm.Join.FieldByName('a_nome').asstring

end;

end.
