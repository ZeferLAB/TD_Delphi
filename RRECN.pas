unit RRecN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers, QuickRpt, Qrctrls;

type
  TF_RRecN = class(TForm)
    QuickRep1: TQuickRep;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape2: TQRShape;
    QRLabel18: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel17: TQRLabel;
    QRShape11: TQRShape;
    QRLabel14: TQRLabel;
    QRShape12: TQRShape;
    QRLabel19: TQRLabel;
    QRShape13: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RRecN: TF_RRecN;
  col1, col, lin, pulo : Integer;
  dia, mes, ano, prot : String;
  old_font : String;

implementation

uses Func, Tabelas;

{$R *.DFM}
Function Alinha(Sentido, Tamanho, Cadeia : String) : String;
var
  branco : String;
  tam, tam1 : Integer;
Begin
  branco := '                                                            ';
  if sentido = 'D' then
  begin
    tam := strtoint(tamanho);
    tam1 := strtoint(tamanho) - 1;
    result := copy(branco,1,tam) + cadeia;
    result := copy(result, length(result) - tam1, tam);
  end
  else
  begin
    result := copy(cadeia + branco,1,tam);
  end;
end;

Procedure Cabec;
Begin
  with F_RRecN do
  begin
    Printer.Canvas.Font.Name := old_font;
    Printer.Canvas.Font.Size := 16;
    Printer.Canvas.TextOut(col + 250, lin, '2º OFICIAL DE REGISTRO DE TÍTULOS E DOCUMENTOS');
    lin := lin + pulo + 30;
    Printer.Canvas.TextOut(col + 650, lin, 'SÃO JOSÉ DOS CAMPOS - SP');
    lin := lin + pulo + 20;
    Printer.Canvas.Rectangle(col, lin, col + 2700 , lin + 1);
    Printer.Canvas.Font.Size := 10;
    lin := lin + pulo - 20;
    Printer.Canvas.TextOut(col + 400, lin, 'PRAÇA SEBASTIÃO HUMEL, 148 - CENTRO - TELEFONE (12) - 3942-4303');
    lin := lin + pulo;
    Printer.Canvas.Font.Size := 12;
    Printer.Canvas.TextOut(col + 900, lin, 'AMILTON ALVARES');
    lin := lin + pulo;
    Printer.Canvas.TextOut(col + 890,lin, 'OFICIAL DELEGADO');
    lin := lin + (pulo * 2);
    Printer.Canvas.Font.Size := 14;
    Printer.Canvas.TextOut(col + 800, lin, 'RECIBO DE NOTIFICAÇÃO');
    lin := lin + (pulo * 2);
    Printer.Canvas.Font.Size := 11;
    Printer.Canvas.TextOut(col, lin, 'Registro por microfilme sob nº ' + tabela.td.fieldbyname('protocolo').asstring);
    lin := lin + (pulo * 2);
    Printer.Canvas.Font.Size := 10;
  end;
end;

end.
