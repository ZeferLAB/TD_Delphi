unit Dev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, ValorPor, WPDefs, WPPrint,
  WpWinCtr, WPRich, ToolEdit, CurrEdit, jpeg;

type
  TF_Dev = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit2: TMaskEdit;
    Label12: TLabel;
    Label20: TLabel;
    Bevel3: TBevel;
    Label21: TLabel;
    Bevel4: TBevel;
    BitBtn4: TBitBtn;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit24: TMaskEdit;
    MaskEdit26: TMaskEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    Label22: TLabel;
    Label23: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    Label24: TLabel;
    ValorPorExtenso1: TValorPorExtenso;
    Label25: TLabel;
    CurrencyEdit9: TCurrencyEdit;
    GroupBox2: TGroupBox;
    MaskEdit3: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    BitBtn5: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    Procedure Carrega(Sender : TOBject);
    Procedure Limpar(Sender : TOBject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Dev: TF_Dev;

implementation

uses Menu, Dep1, DMTD, Func, U_WRecep, FuncGeral, ProcGeral,
  U_ReciboDevolucaoTitulo;

{$R *.DFM}

Procedure TF_Dev.Carrega(Sender : TOBject);
begin
  ComboBox3.Text      := Ver_Natureza(Dm.Td.FieldByName('natureza').asstring, True);
  ComboBox4.Text      := Def_Lan(Dm.Td.FieldByName('lancamento').asstring, True);
  ComboBox5.Text      := Def_Tab(Dm.Td.FieldByName('tabela').asstring, True);
  ComboBox6.Text      := Def_Div(Dm.Td.FieldByName('divisor').asstring, True);

  maskedit7.text      := Dm.Td.FieldByName('microfilme').asstring;
  Label34.caption     := 'R$ ' + StrCurr(Dm.Td.FieldByName('v_mic').ascurrency, 14, True);
  maskedit8.text      := Dm.Td.FieldByName('pag_adic').asstring;
  Label40.caption     := 'R$ ' + StrCurr(Dm.Td.FieldByName('v_pag').ascurrency, 14, True);
  maskedit10.text     := Dm.Td.FieldByName('contato').asstring;
//  maskedit11.text     := Dm.Td.FieldByName('a_endereco').asstring;
//  maskedit12.text     := Dm.Td.FieldByName('a_bairro').asstring;
//  maskedit13.text     := Dm.Td.FieldByName('a_cidade').asstring;
//  maskedit14.text     := Dm.Td.FieldByName('a_estado').asstring;
//  maskedit15.text     := Dm.Td.FieldByName('a_telefone').asstring;
//  MaskEdit16.EditMask := '';
//  maskedit16.text     := Dm.Td.FieldByName('a_cep').asstring;
//  MaskEdit16.EditMask := '99999-999';
  CurrencyEdit1.Value := Dm.Td.FieldByName('valor_base').ascurrency;
  CurrencyEdit3.value := Dm.Td.FieldByName('deposito').ascurrency;
  CurrencyEdit2.Value := Dm.Td.FieldByName('custas').ascurrency;
  MaskEdit24.Text     := Dm.Td.FieldByName('cod_local').asString;
  Label35.Caption     := '';//'R$ ' + StrCurr(Dm.Td.FieldByName('v_conducao').ascurrency, 14, True);
  Label42.Caption     := 'R$ ' + StrCurr(Dm.Td.FieldByName('v_adc').ascurrency, 14, True);
  MaskEdit26.Text     := Dm.Td.FieldByName('vias_adc').asString;
  Label20.Visible     := True;
  Label20.Caption     := Dm.Td.FieldByName('status').asString;
  MaskEdit3.Text      := Dm.Td.FieldByName('nome_ret').asString;
end;

Procedure TF_Dev.Limpar(Sender : TOBject);
begin
  BitBtn4.Enabled   := False;
  MaskEdit1.Enabled := True;
  MaskEdit3.Text := '';
  MaskEdit1.text := '';
  maskedit7.text := '';
  maskedit8.text := '';
  maskedit10.text := '';
  maskedit11.text := '';
  maskedit12.text := '';
  maskedit13.text := '';
  maskedit14.text := '';
  maskedit15.text := '';
  maskedit16.text := '';
  maskedit24.text := '';
  maskedit26.text := '';
  CurrencyEdit1.Value := 0.00;
  CurrencyEdit2.Value := 0.00;
  CurrencyEdit3.Value := 0.00;
  CurrencyEdit4.Value := 0.00;
  CurrencyEdit5.Value := 0.00;
  CurrencyEdit6.Value := 0.00;
  CurrencyEdit7.Value := 0.00;
  CurrencyEdit8.Value := 0.00;
  Label34.caption := '';
  Label42.caption := '';
  Label35.caption := '';
  Label40.caption := '';
  Label20.Visible := False;
  Label21.Visible := False;
  Label22.Caption := '';
  Label23.Caption := '';
  Label24.Caption := '';
end;


Function Mes(Mes : integer): string;
begin
       if Mes = 1  then Result := 'Janeiro'
  else if Mes = 2  then Result := 'Fevereiro'
  else if Mes = 3  then Result := 'Março'
  else if Mes = 4  then Result := 'Abril'
  else if Mes = 5  then Result := 'Maio'
  else if Mes = 6  then Result := 'Junho'
  else if Mes = 7  then Result := 'Julho'
  else if Mes = 8  then Result := 'Agosto'
  else if Mes = 9  then Result := 'Setembro'
  else if Mes = 10 then Result := 'Outubro'
  else if Mes = 11 then Result := 'Novembro'
  else if Mes = 12 then Result := 'Dezembro';
end;

procedure Restituicao;
Var
Parte: String;
begin
  Dm.Td_Pesso.Close;
  Dm.Td_Pesso.Sql.Clear;
  Dm.Td_Pesso.Sql.Add('SELECT nome FROM td_pesso');
  Dm.Td_Pesso.Sql.Add('WHERE');
  Dm.Td_Pesso.Sql.Add('p_auxiliar = ' + Trim(F_Dev.MaskEdit1.Text));
  Dm.Td_Pesso.Sql.Add('and ((situacao = "R") or (situacao = "E") or (situacao="S") or(situacao="B") or (situacao="A") or (situacao="P"))');
  Dm.Td_Pesso.Open;
  if (Dm.Td_Pesso.RecordCount = 0) then
  begin
    Dm.Td_Pesso.Close;
    ShowMessage('Protocolo Auxiliar não encontado !');
    F_Dev.BitBtn2Click(F_Dev);
    Exit;
  end;
  parte := Dm.Td_Pesso.FieldByName('nome').asString;
 Dm.Td_Pesso.Close;
 with F_Dev do
  begin
    F_WRecep.WPRichText1.Clear;
    F_WRecep.WPRichText1.LoadFromFile(F_Menu.Label16.Caption + 'RESTITUI.RTF');

    F_WRecep.WpRichText1.Find('<cartorio>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<cartorio>', F_Menu.Label2.Caption);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<endereco>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<endereco>', F_Menu.Label11.Caption);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<telefone>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<telefone>', F_Menu.Label12.Caption);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<tabeliao>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<tabeliao>', F_Menu.Label5.Caption);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<cargo>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<cargo>', F_Menu.Label13.Caption);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<cidade>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<cidade>', F_Menu.Label7.Caption);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<data_aponta>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<data_aponta>', MaskEdit2.Text);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<hora_aponta>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<hora_aponta>', TimeToStr(Now));
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<nome>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<nome>', MaskEdit10.Text);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<valor>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<valor>', FormatCurr('R$###,###,##0.00', CurrencyEdit4.Value));
      F_WRecep.WpRichText1.Refresh;
    end;

    ValorPorExtenso1.Valor := CurrencyEdit4.Value;

    F_WRecep.WpRichText1.Find('<extenso>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<extenso>', Label25.Caption);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<protocolo>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<protocolo>', copy('000000' + MaskEdit1.Text, length('000000' + MaskEdit1.Text) - 5, 6));
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<dia>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<dia>', copy('00' + copy(MaskEdit2.Text,1,2), length('00' + copy(MaskEdit2.Text,1,2)) - 1, 2));
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<mes>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<mes>', Mes(StrToInt(copy(MaskEdit2.Text,4,2))));
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<ano>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<ano>', copy(MaskEdit2.Text,7,4));
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<funcionario>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<funcionario>', Parte);
      F_WRecep.WpRichText1.Refresh;
    end;
   // F_WRecep.WPRichText1.Print;
   F_WRecep.Showmodal
  end;
end;

procedure Complemento;
Var
Parte: String;
begin
 parte := F_Menu.Label1.caption;
  With F_Dev do
  begin
    F_WRecep.WPRichText1.Clear;
    F_WRecep.WPRichText1.LoadFromFile(F_Menu.Label16.Caption + 'COMPLEME.RTF');

    F_WRecep.WpRichText1.Find('<data_aponta>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<data_aponta>', MaskEdit2.Text);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<hora_aponta>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<hora_aponta>', TimeToStr(Now));
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<nome>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<nome>', MaskEdit10.Text);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<valor>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<valor>', FormatCurr('R$###,###,##0.00', CurrencyEdit4.value));
      F_WRecep.WpRichText1.Refresh;
    end;

    ValorPorExtenso1.Valor := CurrencyEdit4.value;

    F_WRecep.WpRichText1.Find('<extenso>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<extenso>', Label25.Caption);
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<protocolo>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<protocolo>', copy('000000' + MaskEdit1.Text, length('000000' + MaskEdit1.Text) - 5, 6));
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<dia>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<dia>', copy('00' + copy(MaskEdit2.Text,1,2), length('00' + copy(MaskEdit2.Text,1,2)) - 1, 2));
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<mes>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<mes>', Mes(StrToInt(copy(MaskEdit2.Text,4,2))));
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<ano>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<ano>', copy(MaskEdit2.Text,7,4));
      F_WRecep.WpRichText1.Refresh;
    end;

    F_WRecep.WpRichText1.Find('<funcionario>', False);
    if F_WRecep.WpRichText1.Finder.Found then
    begin
      F_WRecep.WpRichText1.Finder.Clear;
      F_WRecep.WpRichText1.Finder.ReplaceAll('<funcionario>',Parte);
      F_WRecep.WpRichText1.Refresh;
    end;
   // F_WRecep.WPRichText1.Print;
   F_WRecep.Showmodal
  end;
end;

procedure TF_Dev.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Dev.BitBtn2Click(Sender: TObject);
begin
  Limpar(F_Dev);
  MaskEdit1.SetFocus;
end;

procedure TF_Dev.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_Dev.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_Dev.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    ShowMessage('Protocolo Auxiliar inválido !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  MaskEdit1.Enabled := False;
  Dm.Td.Close;
  Dm.Td.Sql.Clear;
  Dm.Td.Sql.Add('SELECT * FROM td');
  Dm.Td.Sql.Add('WHERE');
  Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
  Dm.Td.Open;
  if (Dm.Td.RecordCount = 0) then
  begin
    Dm.Td.Close;
    ShowMessage('Protocolo Auxiliar não encontado !');
    BitBtn2Click(F_Dev);
    Exit;
  end;
  Carrega(F_Dev);
  if (Trim(Dm.Td.FieldByName('status').asString) = 'PRONTO')    OR
     (Trim(Dm.Td.FieldByName('status').asString) = 'IRREGULAR') then
  begin
    BitBtn4.Enabled := True;
  end;
  if (Trim(Dm.Td.FieldByName('status').asString) = 'IRREGULAR') then
  begin
    Label21.Visible     := True;
    Label21.Caption     := 'Diferença a ser DEVOLVIDA R$ ' + StrCurr(Dm.Td.fieldbyname('deposito').ascurrency, 14, True);
    Label22.Caption     := 'S';
    Label23.Caption     := 'DEVOLUÇÃO INTEGRAL DO DEPÓSITO';
    CurrencyEdit4.Value := Dm.Td.FieldByName('deposito').asCurrency;
  end;
  if (Trim(Dm.Td.FieldByName('status').asString) = 'PRONTO') then
  begin
    if (Dm.Td.FieldByName('custas').asCurrency > Dm.Td.FieldByName('deposito').asCurrency) then
    begin
      Label21.Visible     := True;
      Label21.Caption     := 'Diferença a ser COBRADA R$ ' + StrCurr((Dm.Td.FieldByName('custas').asCurrency - Dm.Td.FieldByName('deposito').asCurrency), 14, True);
      Label22.Caption     := 'E';
      Label23.Caption     := 'DEVOLUÇÃO COM SALDO A RECEBER';
      CurrencyEdit4.Value := Abs(Dm.Td.FieldByName('custas').asCurrency - Dm.Td.FieldByName('deposito').asCurrency);
    end
    else
    begin
      if (Dm.Td.FieldByName('custas').asCurrency < Dm.Td.FieldByName('deposito').asCurrency) then
      begin
        Label21.Visible     := True;
        Label21.Caption     := 'Diferença a ser DEVOLVIDA R$ ' + StrCurr((Dm.Td.fieldbyname('deposito').ascurrency - Dm.Td.FieldByName('custas').asCurrency), 14, True);
        Label22.Caption     := 'S';
        Label23.Caption     := 'DEVOLUÇÃO COM SALDO A DEVOLVER';
        CurrencyEdit4.Value := Abs(Dm.Td.FieldByName('deposito').asCurrency - Dm.Td.FieldByName('custas').asCurrency);
      end
      else
      begin
        Label21.Visible     := True;
        Label21.Caption     := 'Diferença a ser COBRADA R$ 0,00';
        Label22.Caption     := 'S';
        Label23.Caption     := 'DEVOLUÇÃO SEM DIFERENÇA DE VALOR';
        CurrencyEdit4.Value := 0.00;
      end;
    end;
  end;
  Dm.Td.Close;
//  if (BitBtn4.Enabled) then BitBtn4.SetFocus else BitBtn2.SetFocus;
  if (BitBtn4.Enabled) then MaskEdit3.SetFocus else BitBtn2.SetFocus;
end;

procedure TF_Dev.FormActivate(Sender: TObject);
begin
  MaskEdit2.Text := DateToStr(date);
end;

procedure TF_Dev.BitBtn4Click(Sender: TObject);
var
  tpbx : string;
begin
  if (MessageBox(Handle, PChar('Confirma devolução do título ?'), 'DEVOLUÇÃO DE TÍTULO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
  begin
    Label24.Caption := '';
    {if (CurrencyEdit4.Value > 0) then
    begin
      Application.CreateForm(TF_Dep1, F_Dep1);
      F_Dep1.ShowModal;
      CurrencyEdit5.Value        := F_Dep1.CurrencyEdit1.Value;
      CurrencyEdit6.Value        := F_Dep1.CurrencyEdit2.Value;
      CurrencyEdit7.Value        := F_Dep1.CurrencyEdit3.Value;
      Label24.Caption            := F_Dep1.MaskEdit1.Text;
      F_Dep1.Destroy;
      F_Dep1 := NIL;
    end;
    }
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT data_d, status, deposito, nome_ret FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('p_auxiliar = ' + MaskEdit1.Text);
    Dm.Td.Open;
    if (Dm.Td.RecordCount = 0) then
    begin
      Dm.Td.Close;
      ShowMessage('Problemas para localizar o protocolo auxiliar !');
      ShowMessage('Favor verificar !');
      BitBtn2Click(F_Dev);
      Exit;
    end;
    Dm.Td.Edit;
    Dm.Td.FieldByName('data_d').asString := MaskEdit2.Text;

    if (Trim(Dm.Td.FieldByName('status').asString) = 'IRREGULAR') then
      Dm.Td.FieldByName('status').asString := 'DEVOLVIDO IRREGULAR';

    if (Trim(Dm.Td.FieldByName('status').asString) = 'PRONTO')    then
      Dm.Td.FieldByName('status').asString := 'DEVOLVIDO PRONTO';
    tpbx := '';
    tpbx := Dm.Td.FieldByName('status').asString;

    Dm.Td.FieldByName('nome_ret').asString := MaskEdit3.Text;
    Dm.Td.Post;

  //  Dm.Td.Close;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Baixa de ' + tpbx + ' em ' + MaskEdit2.Text + '.', MaskEdit1.Text);
    //Retirado a pedido do Doutor Renaldo 12/09/2008 - Samuel
     {if (not Atualiza_Caixa(MaskEdit2.Text, '13', Label22.Caption, Label23.Caption, MaskEdit1.Text, Label24.Caption, F_Menu.Label1.Caption, Trim(MaskEdit10.Text), CurrencyEdit4.Value, CurrencyEdit5.Value, CurrencyEdit7.Value, CurrencyEdit6.Value, CurrencyEdit9.Value )) then
      begin
        ShowMessage('Problemas para atualiza o caixa.');
      end;

   if Dm.Td.FieldByName('deposito').asCurrency > 0.00 then
   begin
     if (( Label23.Caption = 'DEVOLUÇÃO COM SALDO A DEVOLVER') or ( Label23.Caption = 'DEVOLUÇÃO INTEGRAL DO DEPÓSITO'))then
     begin
      if (MessageDlg('Impressora pronta?', mtConfirmation, [mbYes, mbNo],0) = mrNo) then Exit;
       Restituicao;
     end;

    if ( Label23.Caption = 'DEVOLUÇÃO COM SALDO A RECEBER') then
     begin
      if (MessageDlg('Impressora pronta?', mtConfirmation, [mbYes, mbNo],0) = mrNo) then Exit;
       Complemento;
     end;
   end;
    }
    Dm.Td.Close;
    ShowMessage('Devolução efetuada com sucesso !');
    BitBtn2Click(F_Dev);
  end;
end;

procedure TF_Dev.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (BitBtn4.Enabled) then BitBtn4.SetFocus else BitBtn2.SetFocus;
  end;  
end;

procedure TF_Dev.BitBtn5Click(Sender: TObject);
begin
  F_ReciboDevolucaoTitulo:= TF_ReciboDevolucaoTitulo.Create(Nil);
  F_ReciboDevolucaoTitulo.Mk_Protocolo.Text:= MaskEdit1.Text;
  F_ReciboDevolucaoTitulo.ShowModal;
  F_ReciboDevolucaoTitulo := NIL;
end;

end.
