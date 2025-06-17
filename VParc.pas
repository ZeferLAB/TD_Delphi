unit VParc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ToolEdit, CurrEdit, DBCtrls;

type
  TF_VParc = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    Label6: TLabel;
    MaskEdit6: TMaskEdit;
    Label7: TLabel;
    MaskEdit7: TMaskEdit;
    Label8: TLabel;
    MaskEdit8: TMaskEdit;
    Label9: TLabel;
    MaskEdit9: TMaskEdit;
    Label10: TLabel;
    MaskEdit10: TMaskEdit;
    Label11: TLabel;
    MaskEdit11: TMaskEdit;
    Label12: TLabel;
    MaskEdit12: TMaskEdit;
    Label13: TLabel;
    MaskEdit13: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    BitBtn3: TBitBtn;
    Label24: TLabel;
    DBText1: TDBText;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label20: TLabel;
    MaskEdit14: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_VParc: TF_VParc;

implementation

uses DMTD, Menu, Pesq;

{$R *.DFM}

procedure TF_VParc.FormActivate(Sender: TObject);
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT parcelas, parc2, parc3, parc4, parc5, parc6,');
  Dm.ArqAux.Sql.Add('val_parc, val_parc2, val_parc3, val_parc4, val_parc5, val_parc6,');
  Dm.ArqAux.Sql.Add('ven_parc, ven_parc2, ven_parc3, ven_parc4, ven_parc5, ven_parc6,');
  Dm.ArqAux.Sql.Add('grupo, cota');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
//  Dm.ArqAux.Sql.Add('p_auxiliar = ' + F_Pesq.Label16.Caption);
  Dm.ArqAux.Sql.Add('p_auxiliar = ' + Dm.Td_Cert.FieldByName('p_auxiliar').asString);
  Dm.ArqAux.Open;
  MaskEdit1.Text      := Dm.ArqAux.FieldByName('grupo').asString;
  MaskEdit14.Text     := Dm.ArqAux.FieldByName('cota').asString;
  MaskEdit2.Text      := Dm.ArqAux.FieldByName('parcelas').asString;
  MaskEdit3.Text      := Dm.ArqAux.FieldByName('parc2').asString;
  MaskEdit4.Text      := Dm.ArqAux.FieldByName('parc3').asString;
  MaskEdit5.Text      := Dm.ArqAux.FieldByName('parc4').asString;
  MaskEdit6.Text      := Dm.ArqAux.FieldByName('parc5').asString;
  MaskEdit7.Text      := Dm.ArqAux.FieldByName('parc6').asString;
  MaskEdit8.Text      := Dm.ArqAux.FieldByName('ven_parc').asString;
  MaskEdit9.Text      := Dm.ArqAux.FieldByName('ven_parc2').asString;
  MaskEdit10.Text     := Dm.ArqAux.FieldByName('ven_parc3').asString;
  MaskEdit11.Text     := Dm.ArqAux.FieldByName('ven_parc4').asString;
  MaskEdit12.Text     := Dm.ArqAux.FieldByName('ven_parc5').asString;
  MaskEdit13.Text     := Dm.ArqAux.FieldByName('ven_parc6').asString; 
  CurrencyEdit1.Value := Dm.ArqAux.FieldByName('val_parc').asCurrency;
  CurrencyEdit2.Value := Dm.ArqAux.FieldByName('val_parc2').asCurrency;
  CurrencyEdit3.Value := Dm.ArqAux.FieldByName('val_parc3').asCurrency;
  CurrencyEdit4.Value := Dm.ArqAux.FieldByName('val_parc4').asCurrency;
  CurrencyEdit5.Value := Dm.ArqAux.FieldByName('val_parc5').asCurrency;
  CurrencyEdit6.Value := Dm.ArqAux.FieldByName('val_parc6').asCurrency;
  Dm.ArqAux.Close;
  BitBtn3.SetFocus;
end;

procedure TF_VParc.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_VParc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

end.


