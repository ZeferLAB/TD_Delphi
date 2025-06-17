unit CAIXAI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ToolEdit, CurrEdit, Mask, ExtCtrls;

type
  TF_CaixaI = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    Label25: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit18: TMaskEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit19: TMaskEdit;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label22: TLabel;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit17: TMaskEdit;
    Label26: TLabel;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CaixaI: TF_CaixaI;
  tot_entr_reg_din, tot_entr_cer_din, tot_saida_reg_din, tot_saida_cer_din, tot_compl_dep_din, tot_rentr_reg_din : Currency;
  tot_entr_reg_chq, tot_entr_cer_chq, tot_saida_reg_chq, tot_saida_cer_chq, tot_compl_dep_chq, tot_rentr_reg_chq : Currency;
  tot_ret_reg_din, tot_ret_reg_chq, tot_ret_cer_din, tot_ret_cer_chq : Currency;
  tot_entradas, tot_saidas, tot_saldo : Currency;
  cdin,cche,cfun,cdes,ccan,ctot,cari : string;
  em_caixa, tot_entr_quebra, tot_saida_quebra, tot_despesas, val_abert_d : Currency;
  pulo, linha, coluna : Integer;
  Nom_Cart, End_Cart, Bai_Cart, Fon_Cart, Cid_Cart, Est_Cart, Ofi_Cart, Car_Cart, Fax_Cart, Cep_Cart, Mens1, Mens2, Mens3, Mens4 : String;
  dia,mes,ano, dataseek : string;

implementation

uses RELCAI, DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_CaixaI.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_caixai.ComboBox1.SetFocus;
  if key = 27 then close;
end;

procedure TF_CaixaI.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
   begin
    if ComboBox1.Text = '' then
     begin
      ShowMessage('Informar o nome do usuário')
     end
     else
     begin
      bitbtn1.setfocus;
     end;
   end;
end;

procedure TF_CaixaI.BitBtn4Click(Sender: TObject);
begin
  Dm.Caixa.Close;
  Dm.Caixa.Sql.Clear;
  Dm.Caixa.Sql.Add('SELECT * FROM caixa');
  Dm.Caixa.Sql.Add('WHERE');
  Dm.Caixa.Sql.Add('recno = 0');
  Dm.Caixa.Open;
  Dm.Caixa.Append;
  Dm.Caixa.FieldByName('data').AsString       := F_caixai.MaskEdit1.Text;
  Dm.Caixa.FieldByName('historico').AsString  := 'ABERTURA DE CAIXA';
  Dm.Caixa.FieldByName('operacao').asString   := 'A';
  Dm.Caixa.FieldByName('codc').asString       := '0';
  Dm.Caixa.FieldByName('identifica').AsString := F_caixai.Combobox1.Text;
  Dm.Caixa.FieldByName('val_abert').AsString  := F_caixai.CurrencyEdit1.text;
  Dm.Caixa.Post;
  Dm.Caixa.Close;
end;

procedure TF_CaixaI.BitBtn5Click(Sender: TObject);
begin
  Dm.Caixa.Close;
  Dm.Caixa.Sql.Clear;
  Dm.Caixa.Sql.Add('SELECT * FROM caixa');
  Dm.Caixa.Sql.Add('WHERE');
  Dm.Caixa.Sql.Add('    data       = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.Caixa.Sql.Add('AND identifica = ' + Chr(39) + Trim(ComboBox1.Text) + Chr(39));
  Dm.Caixa.Sql.Add('AND operacao   = "A"');
  Dm.Caixa.Open;
  Dm.Caixa.Edit;
  Dm.Caixa.FieldByName('data').AsString         := F_caixai.MaskEdit1.Text;
  Dm.Caixa.FieldByName('identifica').AsString   := F_caixai.Combobox1.Text;
  Dm.Caixa.FieldByName('val_abert').AsString    := F_caixai.CurrencyEdit1.text;
  Dm.Caixa.Post;
  Dm.Caixa.Close;
end;

procedure TF_CaixaI.BitBtn3Click(Sender: TObject);
begin
  Panel4.visible := false;
  Close;
end;

procedure TF_CaixaI.BitBtn2Click(Sender: TObject);
var
  col, pulo, x : Integer;
  vazio : String[100];
begin
  Application.CreateForm(TF_RelCai, F_RelCai);

     F_RelCai.QrLabel5.Caption  := F_CaixaI.MaskEdit1.Text;
     F_RelCai.QrLabel6.Caption  := F_CaixaI.ComboBox1.Text;
     F_RelCai.QrLabel26.Caption := F_CaixaI.CurrencyEdit1.Text;

     //Entradas
     F_RelCai.QrLabel28.Caption := FormatCurr('###,###,##0.00',tot_entr_cer_chq);
     F_RelCai.QrLabel27.Caption := FormatCurr('###,###,##0.00',tot_entr_cer_din);
     F_RelCai.QrLabel35.Caption := FormatCurr('###,###,##0.00',(tot_entr_cer_din + tot_entr_cer_chq));

     F_RelCai.QrLabel32.Caption := FormatCurr('###,###,##0.00',tot_entr_reg_chq);
     F_RelCai.QrLabel31.Caption := FormatCurr('###,###,##0.00',tot_entr_reg_din);
     F_RelCai.QrLabel36.Caption := FormatCurr('###,###,##0.00',(tot_entr_reg_chq + tot_entr_reg_din));

     F_RelCai.QrLabel37.Caption := FormatCurr('###,###,##0.00',(tot_entr_cer_din + tot_entr_reg_din));
     F_RelCai.QrLabel38.Caption := FormatCurr('###,###,##0.00',(tot_entr_cer_chq + tot_entr_reg_chq));
//     F_RelCai.QrLabel39.Caption := FormatCurr('###,###,##0.00',(tot_entr_cer_dep + tot_entr_reg_dep));
     F_RelCai.QrLabel40.Caption := FormatCurr('###,###,##0.00',(tot_entr_cer_din + tot_entr_reg_din + tot_entr_reg_chq + tot_entr_cer_chq ));

     // Saídas
     F_RelCai.QrLabel41.Caption := FormatCurr('###,###,##0.00',(tot_saida_reg_din + tot_saida_cer_din));
     F_RelCai.QrLabel42.Caption := FormatCurr('###,###,##0.00',(tot_saida_reg_chq + tot_saida_cer_chq));
//     F_RelCai.QrLabel42.Caption := FormatCurr('###,###,##0.00',tot_saida_reg_dep);
     F_RelCai.QrLabel47.Caption := FormatCurr('###,###,##0.00',(tot_saida_reg_din + tot_saida_reg_chq + tot_saida_cer_din + tot_saida_cer_chq));

     // Saldo
     F_RelCai.QrLabel49.Caption  := F_CaixaI.Maskedit1.Text;
     F_RelCai.QrLabel50.Caption := FormatCurr('###,###,##0.00',((tot_entr_cer_din + tot_entr_cer_chq + tot_entr_reg_din + tot_entr_reg_chq + tot_entr_quebra + val_abert_d) - (tot_saida_cer_din + tot_saida_reg_din + tot_despesas + tot_saida_quebra )));

     F_RelCai.QuickRep1.Preview;

  F_RelCai.Destroy;
  F_RelCai := NIL;
end;

procedure TF_CaixaI.BitBtn1Click(Sender: TObject);
var
  usu : String;
begin
  Dm.Caixa.Close;
  Dm.Caixa.Sql.Clear;
  Dm.Caixa.Sql.Add('SELECT * FROM caixa');
  Dm.Caixa.Sql.Add('WHERE');
  Dm.Caixa.Sql.Add('data = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  if (Trim(ComboBox1.Text) <> 'GERAL') then Dm.Caixa.Sql.Add('AND identifica = ' + Chr(39) + Trim(ComboBox1.Text) + Chr(39));
  Dm.Caixa.Open;
  if (Dm.Caixa.RecordCount = 0) then
  begin
    Dm.Caixa.Close;
    Panel4.Visible := false;
    showmessage('Movimento não Localizado');
    MaskEdit1.setfocus;
    BitBtn2.Enabled := false;
    exit;
  end;
  MaskEdit14.Text   := '';
  val_abert_d       := 0;
  tot_entr_reg_din  := 0;
  tot_entr_cer_din  := 0;
  tot_saida_reg_din := 0;
  tot_saida_cer_din := 0;
  tot_compl_dep_din := 0;
  tot_entr_reg_chq  := 0;
  tot_entr_cer_chq  := 0;
  tot_saida_reg_chq := 0;
  tot_saida_cer_chq := 0;
  tot_compl_dep_chq := 0;
  tot_rentr_reg_din := 0;
  tot_rentr_reg_chq := 0;
  tot_entr_quebra   := 0;
  tot_saida_quebra  := 0;
  tot_despesas      := 0;
  tot_ret_reg_din   := 0;
  tot_ret_reg_chq   := 0;
  tot_ret_cer_din   := 0;
  tot_ret_cer_chq   := 0;
  tot_saidas        := 0;
  tot_entradas      := 0;
  tot_saldo         := 0;
  currencyedit1.text := currtostr(Dm.Caixa.FieldByName('val_abert').AsCurrency);
  val_abert_d := Dm.Caixa.FieldByName('val_abert').AsCurrency;
  While (not Dm.Caixa.Eof) do
  Begin
    { Entradas }
    if (Dm.Caixa.FieldByName('operacao').asString = 'E') then
    Begin
      tot_entr_reg_din := tot_entr_reg_din + Dm.Caixa.FieldByName('valor_di').asCurrency;
      tot_entr_reg_chq := tot_entr_reg_chq + Dm.Caixa.FieldByName('valor_ch').asCurrency;
      { Certidoes }
      if (Dm.Caixa.FieldByName('codc').asString = '5') then
      Begin
        if (Dm.Caixa.FieldByName('valor_di').asCurrency > 0) or (Dm.Caixa.FieldByName('valor_ch').asCurrency > 0) then
        begin
          tot_entr_cer_din := tot_entr_cer_din + Dm.Caixa.FieldByName('valor_di').asCurrency;
          tot_entr_cer_chq := tot_entr_cer_chq + Dm.Caixa.FieldByName('valor_ch').asCurrency;
        end;
      end;
      { Fim }
      if (Dm.Caixa.FieldByName('codc').asString = '99') then tot_entr_quebra := Dm.Caixa.FieldByName('valor').asCurrency + tot_entr_quebra;
    end;
    { Saidas }
    if Dm.Caixa.FieldByName('operacao').asString = 'S' then
     Begin
      if (Dm.Caixa.FieldByName('codc').asString = '22') or  //DEVOLUÇÃO TOTAL DO DEPÓSITO
         (Dm.Caixa.FieldByName('codc').asString = '23')then //DEVOLUÇÃO PARCIAL DO DEPÓSITO
       Begin
        if Dm.Caixa.FieldByName('cheque').asString = '' then
          tot_saida_reg_din := tot_saida_reg_din + Dm.Caixa.FieldByName('valor').asCurrency
        else
          tot_saida_reg_chq := tot_saida_reg_chq + Dm.Caixa.FieldByName('valor').asCurrency;
       end;
      if Dm.Caixa.FieldByName('codc').asString = '4' then
       Begin
        if Dm.Caixa.FieldByName('cheque').asString = '' then
          tot_saida_cer_din := tot_saida_cer_din + Dm.Caixa.FieldByName('valor').asCurrency
        else
          tot_saida_cer_chq := tot_saida_cer_chq + Dm.Caixa.FieldByName('valor').asCurrency;
       end;
      if (Dm.Caixa.FieldByName('codc').asString = '99') then
       tot_saida_quebra := Dm.Caixa.FieldByName('valor').asCurrency + tot_saida_quebra;
      if (Dm.Caixa.FieldByName('codc').asString = '55') then
       tot_despesas := Dm.Caixa.FieldByName('valor').asCurrency + tot_despesas;
     end;
    if (Dm.Caixa.FieldByName('operacao').asString = 'A') then
    begin
      CurrencyEdit1.Value := CurrencyEdit1.Value + Dm.Caixa.FieldByName('val_abert').asCurrency;
    end; 
    Dm.caixa.next;
  end;
  tot_entradas := tot_entr_reg_din + tot_entr_reg_chq + tot_rentr_reg_din + tot_rentr_reg_chq + tot_compl_dep_din + tot_compl_dep_chq + tot_ret_reg_din + tot_ret_reg_chq;
  tot_entradas := tot_entradas + tot_entr_cer_din + tot_entr_cer_chq + tot_ret_cer_din + tot_ret_cer_chq;
  tot_saidas := tot_saida_reg_din + tot_saida_reg_chq;
  tot_saidas := tot_saidas + tot_saida_cer_din + tot_saida_cer_chq;
  tot_saldo := tot_entradas - (tot_saidas + tot_despesas);
  MaskEdit2.text := FormatCurr('###,###,##0.00',tot_entr_reg_chq);
  MaskEdit3.text := FormatCurr('###,###,##0.00',tot_entr_reg_din);
  MaskEdit4.text := FormatCurr('###,###,##0.00',(tot_entr_reg_chq + tot_entr_reg_din + tot_entr_quebra));
  MaskEdit5.text := FormatCurr('###,###,##0.00',tot_entr_cer_chq);
  MaskEdit15.text:= FormatCurr('###,###,##0.00',tot_entr_cer_din);
  MaskEdit6.text := FormatCurr('###,###,##0.00',tot_saida_reg_chq);
  MaskEdit7.text := FormatCurr('###,###,##0.00',tot_saida_reg_din);
  MaskEdit8.text := FormatCurr('###,###,##0.00',(tot_saida_reg_din + tot_saida_quebra + tot_saida_reg_chq));
  MaskEdit9.text := FormatCurr('###,###,##0.00',(tot_saida_cer_chq));
  MaskEdit16.text:= FormatCurr('###,###,##0.00',(tot_saida_cer_din));
  MaskEdit10.text := FormatCurr('###,###,##0.00',(tot_entr_cer_din + tot_entr_cer_chq + tot_entr_reg_din + tot_entr_reg_chq + tot_entr_quebra));
  MaskEdit11.text := FormatCurr('###,###,##0.00',(tot_saida_cer_din + tot_saida_reg_din + tot_saida_quebra));
  {enio}
  MaskEdit12.text := FormatCurr('###,###,##0.00',((tot_entr_cer_din + tot_entr_cer_chq + tot_entr_reg_din + tot_entr_reg_chq + tot_entr_quebra + val_abert_d) - (tot_saida_cer_din + tot_saida_reg_din + tot_despesas + tot_saida_quebra )));

  MaskEdit17.text := FormatCurr('###,###,##0.00',tot_despesas);
  MaskEdit18.text := FormatCurr('###,###,##0.00',tot_entr_quebra);
  MaskEdit19.text := FormatCurr('###,###,##0.00',tot_saida_quebra);
  Panel4.Visible := True;
  bitbtn2.enabled := true;
  maskedit13.enabled := true;
  maskedit14.enabled := true;
  MaskEdit13.Setfocus;
end;

procedure TF_CaixaI.MaskEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    em_caixa := StrToCurr(MaskEdit13.Text);
    MaskEdit13.text := FormatCurr('###,###,##0.00',em_caixa);
    MaskEdit14.text := FormatCurr('###,###,##0.00',em_caixa - abs((tot_saida_cer_din +  tot_saida_reg_din + tot_despesas + tot_saida_quebra) - (tot_entr_cer_din + tot_entr_cer_chq + tot_entr_reg_din + tot_entr_reg_chq + tot_entr_quebra)));
    BitBtn2.Enabled := True;
    BitBtn2.SetFocus;
  end;
end;

procedure TF_CaixaI.MaskEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn4.SetFocus;
end;

procedure TF_CaixaI.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(Date);
end;

end.
