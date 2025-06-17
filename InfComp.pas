unit InfComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ToolEdit, CurrEdit, ComCtrls;

type
  TF_InfComp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
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
    Label20: TLabel;
    Label21: TLabel;
    MaskEdit15: TMaskEdit;
    Label22: TLabel;
    MaskEdit16: TMaskEdit;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    MaskEdit17: TMaskEdit;
    Label28: TLabel;
    MaskEdit18: TMaskEdit;
    Label29: TLabel;
    MaskEdit19: TMaskEdit;
    Label30: TLabel;
    MaskEdit20: TMaskEdit;
    RichEdit1: TRichEdit;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit15Exit(Sender: TObject);
    procedure MaskEdit16Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit17Exit(Sender: TObject);
    procedure MaskEdit21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_InfComp: TF_InfComp;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_InfComp.FormActivate(Sender: TObject);
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT contrato, mod_eti, qtde_eti, anotacao,');
  Dm.ArqAux.Sql.Add('parcelas, parc2, parc3, parc4, parc5, parc6,');
  Dm.ArqAux.Sql.Add('val_parc, val_parc2, val_parc3, val_parc4, val_parc5, val_parc6,');
  Dm.ArqAux.Sql.Add('ven_parc, ven_parc2, ven_parc3, ven_parc4, ven_parc5, ven_parc6,');
  Dm.ArqAux.Sql.Add('data_impr, data_reti, livro_b, folha_b, folha_b_f');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    data_r     = ' + Chr(39) + ConvData(Label25.Caption) + Chr(39));
  Dm.ArqAux.Sql.Add('AND p_auxiliar = ' + Label23.Caption);
  Dm.ArqAux.Open;
  MaskEdit1.Text      := Dm.ArqAux.FieldByName('contrato').asString; 
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
//  MaskEdit14.Text     := Dm.ArqAux.FieldByName('anotacao').asString;
  RichEdit1.Text      := Dm.ArqAux.FieldByName('anotacao').asString;
  MaskEdit15.Text     := Dm.ArqAux.FieldByName('mod_eti').asString;
  MaskEdit16.Text     := Dm.ArqAux.FieldByName('qtde_eti').asString;
  MaskEdit17.Text     := Dm.ArqAux.FieldByName('data_impr').asString;
  MaskEdit19.Text     := Dm.ArqAux.FieldByName('livro_b').asString;
  MaskEdit20.Text     := Dm.ArqAux.FieldByName('folha_b').asString;

  if Dm.ArqAux.FieldByName('data_reti').asString = '' then
    MaskEdit18.Text     := label25.caption
  else
    MaskEdit18.Text     := Dm.ArqAux.FieldByName('data_reti').asString;

  if (Trim(MaskEdit15.Text) = '') then MaskEdit15.Text := '0';
  if (Trim(MaskEdit16.Text) = '') then MaskEdit16.Text := '0';
  CurrencyEdit1.Value := Dm.ArqAux.FieldByName('val_parc').asCurrency;
  CurrencyEdit2.Value := Dm.ArqAux.FieldByName('val_parc2').asCurrency;
  CurrencyEdit3.Value := Dm.ArqAux.FieldByName('val_parc3').asCurrency;
  CurrencyEdit4.Value := Dm.ArqAux.FieldByName('val_parc4').asCurrency;
  CurrencyEdit5.Value := Dm.ArqAux.FieldByName('val_parc5').asCurrency;
  CurrencyEdit6.Value := Dm.ArqAux.FieldByName('val_parc6').asCurrency;
  Dm.ArqAux.Close;
  MaskEdit1.SetFocus;
end;

procedure TF_InfComp.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
  if key = 13 then MaskEdit17.SetFocus;
end;

procedure TF_InfComp.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_InfComp.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_InfComp.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_InfComp.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit9.SetFocus;
end;

procedure TF_InfComp.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit2.SetFocus;
end;

procedure TF_InfComp.CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_InfComp.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_InfComp.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit3.SetFocus;
end;

procedure TF_InfComp.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_InfComp.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit11.SetFocus;
end;

procedure TF_InfComp.MaskEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit4.SetFocus;
end;

procedure TF_InfComp.CurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_InfComp.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit12.SetFocus;
end;

procedure TF_InfComp.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit5.SetFocus;
end;

procedure TF_InfComp.CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_InfComp.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit13.SetFocus;
end;

procedure TF_InfComp.MaskEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit6.SetFocus;
end;

procedure TF_InfComp.CurrencyEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit15.SetFocus;
end;

procedure TF_InfComp.MaskEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit15.SetFocus;
end;

procedure TF_InfComp.MaskEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit16.SetFocus;
end;

procedure TF_InfComp.MaskEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit18.SetFocus;
end;

procedure TF_InfComp.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_InfComp.BitBtn1Click(Sender: TObject);
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('UPDATE td SET');
  Dm.ArqAux.Sql.Add('contrato  = ' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('parcelas = ' + Chr(39) + Trim(MaskEdit2.Text) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('parc2    = ' + Chr(39) + Trim(MaskEdit3.Text) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('parc3    = ' + Chr(39) + Trim(MaskEdit4.Text) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('parc4    = ' + Chr(39) + Trim(MaskEdit5.Text) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('parc5    = ' + Chr(39) + Trim(MaskEdit6.Text) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('parc6    = ' + Chr(39) + Trim(MaskEdit7.Text) + Chr(39) + ',');
  //
  if MaskEdit8.Text <> '  /  /    ' then
   begin
    if (ValidData(MaskEdit8.Text))  then
     Dm.ArqAux.Sql.Add('ven_parc  = ' + Chr(39) + ConvData(MaskEdit8.Text) + Chr(39) + ',')
    else
     Dm.ArqAux.Sql.Add('ven_parc  = NULL' + ',');
   end;
  //
  if MaskEdit9.Text <> '  /  /    ' then
   begin
    if (ValidData(MaskEdit9.Text))  then
     Dm.ArqAux.Sql.Add('ven_parc2 = ' + Chr(39) + ConvData(MaskEdit9.Text) + Chr(39) + ',')
    else
     Dm.ArqAux.Sql.Add('ven_parc2 = NULL' + ',');
   end;
   //
  if MaskEdit10.Text <> '  /  /    ' then
   begin
    if (ValidData(MaskEdit10.Text)) then
     Dm.ArqAux.Sql.Add('ven_parc3 = ' + Chr(39) + ConvData(MaskEdit10.Text) + Chr(39) + ',')
    else
     Dm.ArqAux.Sql.Add('ven_parc3 = NULL' + ',');
   end;
   //
  if MaskEdit11.Text <> '  /  /    ' then
   begin
    if (ValidData(MaskEdit11.Text)) then
     Dm.ArqAux.Sql.Add('ven_parc4 = ' + Chr(39) + ConvData(MaskEdit11.Text) + Chr(39) + ',')
    else
     Dm.ArqAux.Sql.Add('ven_parc4 = NULL' + ',');
   end;
   //
  if MaskEdit12.Text <> '  /  /    ' then
   begin
    if (ValidData(MaskEdit12.Text)) then
     Dm.ArqAux.Sql.Add('ven_parc5 = ' + Chr(39) + ConvData(MaskEdit12.Text) + Chr(39) + ',')
    else
     Dm.ArqAux.Sql.Add('ven_parc5 = NULL' + ',');
    end;
   //
   if MaskEdit13.Text <> '  /  /    ' then
    begin
     if (ValidData(MaskEdit13.Text)) then
      Dm.ArqAux.Sql.Add('ven_parc6 = ' + Chr(39) + ConvData(MaskEdit13.Text) + Chr(39) + ',')
     else
      Dm.ArqAux.Sql.Add('ven_parc6 = NULL' + ',');
    end;
    //
    if MaskEdit17.Text <> '  /  /    ' then
     begin
      if (ValidData(MaskEdit17.Text)) then
       Dm.ArqAux.Sql.Add('data_impr = ' + Chr(39) + ConvData(MaskEdit17.Text) + Chr(39) + ',')
      else
       Dm.ArqAux.Sql.Add('data_impr = NULL' + ',');
     end;
     //
     if MaskEdit18.Text <> '  /  /    ' then
      begin
       if (ValidData(MaskEdit18.Text)) then
        Dm.ArqAux.Sql.Add('data_reti = ' + Chr(39) + ConvData(MaskEdit18.Text) + Chr(39) + ',')
       else
        Dm.ArqAux.Sql.Add('data_reti = NULL' + ',');
      end;
      //
  Dm.ArqAux.Sql.Add('val_parc  = ' + Chr(39) + StrCurrPesq(CurrencyEdit1.Value) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('val_parc2 = ' + Chr(39) + StrCurrPesq(CurrencyEdit2.Value) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('val_parc3 = ' + Chr(39) + StrCurrPesq(CurrencyEdit3.Value) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('val_parc4 = ' + Chr(39) + StrCurrPesq(CurrencyEdit4.Value) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('val_parc5 = ' + Chr(39) + StrCurrPesq(CurrencyEdit5.Value) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('val_parc6 = ' + Chr(39) + StrCurrPesq(CurrencyEdit6.Value) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('anotacao  = ' + Chr(39) + Trim(RichEdit1.Text) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('mod_eti   = ' + #39 + Trim(MaskEdit15.Text) + #39 + ',');
  Dm.ArqAux.Sql.Add('livro_b   = ' + #39 + MaskEdit19.Text + #39 + ',');
  Dm.ArqAux.Sql.Add('folha_b   = ' + #39 + MaskEdit20.Text + #39 + ',');
//  Dm.ArqAux.Sql.Add('folha_b_f = ' + MaskEdit21.Text + ',');

  Dm.ArqAux.Sql.Add('qtde_eti  = ' + #39 + Trim(MaskEdit16.Text) + #39);
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('p_auxiliar = ' + Label23.Caption);
  try
    Dm.ArqAux.ExecSql;
  except
    ShowMessage('Problemas para efetuar gravação !');
  end;  
  Dm.ArqAux.Close;
{
  // Atualizando Tabela de controle de RLs
  if (Trim(Label26.Caption) <> '') then
  begin
    Dm.Acertifi.Close;
    Dm.Acertifi.Sql.Clear;
    Dm.Acertifi.Sql.Add('UPDATE acertifi SET');
    Dm.Acertifi.Sql.Add('numcerti = ' + Chr(39) + Trim(MaskEdit14.Text) + Chr(39));
    Dm.Acertifi.Sql.Add('WHERE');
    Dm.Acertifi.Sql.Add('codigo_barra = ' + Chr(39) + Label26.Caption + Chr(39));
    Dm.Acertifi.ExecSQL;
  end;
  //******************
}
  Close;
end;

procedure TF_InfComp.MaskEdit15Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit15.Text)) then MaskEdit15.Text := '0';
end;

procedure TF_InfComp.MaskEdit16Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit16.Text)) then MaskEdit16.Text := '0';
end;

procedure TF_InfComp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure TF_InfComp.MaskEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_InfComp.MaskEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then RichEdit1.SetFocus;
end;

procedure TF_InfComp.MaskEdit17Exit(Sender: TObject);
begin
  if (not ValidData(MaskEdit17.Text)) then
  begin
    ShowMessage('Campo Obrigatório - Favor Preencher');
    MaskEdit17.SetFocus;
    Exit;
  end;
end;

procedure TF_InfComp.MaskEdit21KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then BitBtn1.SetFocus;
end;

end.


