unit QK_VER1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QrAngLbl, Db, DBTables, qrRDBarra;

type
  TF_ModVer = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRAngledLabel1: TQRAngledLabel;
    QRAngledLabel2: TQRAngledLabel;
    QRAngledLabel3: TQRAngledLabel;
    QRAngledLabel4: TQRAngledLabel;
    Table1: TTable;
    QRRDbarra1: TQRRDbarra;
    QRRDbarra2: TQRRDbarra;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ModVer: TF_ModVer;
  calc : Integer;
  b    : Integer;
  d    : Integer;
  r    : Integer;
  nrl  : String;


implementation

uses Menu;

{$R *.DFM}


Function Digi(digito : String) : String;
var
  base : String;
  calc : Integer;
  x    : Integer;
  b    : Integer;
  d    : Integer;
  r    : Integer;
  rest : Integer;
  dig  : Integer;
Begin
  base   := '86423597';    // valor fixo informado pelo correio.
  b      := 0;
  d      := 0;
  r      := 0;
  calc   := 0;
  for X := 1 to Length(base) do
  Begin
    b := StrToInt(Copy(base,x,1));
    d := StrToInt(Copy(digito,x,1));
    r := (b * d);
    Calc := Calc + r;
  End;
  Rest := (Calc Mod 11);
  if rest = 0 then dig := 5;
  if rest = 1 then dig := 0;
  if ((rest <> 0) AND ( rest <> 1)) then dig := (11 - rest);
  Result := (digito+ IntToStr(dig));
End;


end.
