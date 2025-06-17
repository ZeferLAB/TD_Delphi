unit Manut; 

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, Menus, Grids, DBGrids,
  ToolEdit, CurrEdit;

type
  TF_Manut = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit17: TMaskEdit;
    MaskEdit18: TMaskEdit;
    MaskEdit19: TMaskEdit;
    MaskEdit20: TMaskEdit;
    MaskEdit21: TMaskEdit;
    MaskEdit22: TMaskEdit;
    PopupMenu1: TPopupMenu;
    Incluir1: TMenuItem;
    Corrigir2: TMenuItem;
    Excluir1: TMenuItem;
    Label25: TLabel;
    PopupMenu2: TPopupMenu;
    Alterar1: TMenuItem;
    Panel2: TPanel;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Bevel1: TBevel;
    MaskEdit24: TMaskEdit;
    Label38: TLabel;
    Label39: TLabel;
    MaskEdit25: TMaskEdit;
    Label40: TLabel;
    Label41: TLabel;
    MaskEdit26: TMaskEdit;
    Label42: TLabel;
    Label43: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    MaskEdit27: TMaskEdit;
    ComboBox2: TComboBox;
    MaskEdit28: TMaskEdit;
    ComboBox3: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Label26: TLabel;
    ComboBox7: TComboBox;
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
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    MaskEdit3: TMaskEdit;
    BitBtn5: TBitBtn;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Alterar1Click(Sender: TObject);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8Exit(Sender: TObject);
    procedure MaskEdit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit24Exit(Sender: TObject);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit28KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Carrega_Pessoal(Sender : TObject; Pesquisa : Boolean);
    Procedure Limpar(Sender : TObject);
    Procedure Carrega(Sender : TObject; Pesquisa : Boolean);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit26KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7Exit(Sender: TObject);
    procedure MaskEdit26Exit(Sender: TObject);
    procedure Incluir1Click(Sender: TObject);
    procedure Corrigir2Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure MaskEdit22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Limpa_TelaPessoal(Sender : TOBject);
    procedure MaskEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit27Exit(Sender: TObject);
    procedure MaskEdit28Exit(Sender: TObject);
    procedure MaskEdit17Exit(Sender: TObject);
    procedure MaskEdit22Exit(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure MaskEdit18Exit(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Manut: TF_Manut;
  tipo_   : String;
  val_loc : Currency;
  salvou  : Boolean;

implementation

uses DMTD, Menu, InfComp, End2, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Manut.Limpa_TelaPessoal(Sender : TOBject);
begin
  MaskEdit17.Text := '';
  MaskEdit27.Text := '';
  MaskEdit28.Text := '';
  MaskEdit22.Text := '';
  MaskEdit18.Text := '';
  MaskEdit3.Text  := '';
  MaskEdit19.Text := '';
  MaskEdit20.Text := '';
  MaskEdit21.Text := '';
  MaskEdit25.Text := '';
  ComboBox7.Text  := '';
end;

Procedure TF_Manut.Carrega_Pessoal(Sender : TObject; Pesquisa : Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('SELECT * FROM td_pesso');
    Dm.PessAux.Sql.Add('WHERE');
    Dm.PessAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    Dm.PessAux.Open;
  end;
  MaskEdit17.Text := Dm.PessAux.FieldByName('nome').asString;
  ComboBox1.Text  := Dm.PessAux.FieldByName('tip_doc1').asString;
  MaskEdit27.EditMask := '';
  MaskEdit27.Text := Dm.PessAux.FieldByName('doc1').asString;
  if (ComboBox1.Text = 'CPF') then MaskEdit27.EditMask := '###.###.###-##' else MaskEdit27.EditMask := '##.###.###/####-##';
  ComboBox2.Text  := Dm.PessAux.FieldByName('tip_doc2').asString;
  MaskEdit28.Text := Dm.PessAux.FieldByName('doc2').asString;
  MaskEdit18.Text := Dm.PessAux.FieldByName('endereco').asString;
  MaskEdit3.Text  := Dm.PessAux.FieldByName('numero').asString;
  MaskEdit19.Text := Dm.PessAux.FieldByName('bairro').asString;
  MaskEdit20.Text := Dm.PessAux.FieldByName('cidade').asString;
  MaskEdit21.Text := Dm.PessAux.FieldByName('estado').asString;
  MaskEdit22.EditMask := '';
  MaskEdit22.Text := Dm.PessAux.FieldByName('cep').asString;
  MaskEdit22.EditMask := '#####-###';
  ComboBox7.Text  := Ver_Situacao(Dm.PessAux.FieldByName('situacao').asString, True);
  MaskEdit25.Text := Dm.PessAux.FieldByName('complem').asString;

  if (copy(combobox7.Text,1,1) = 'D') or (copy(combobox7.Text,1,1) = 'E') then
  begin
   maskedit22.enabled := true;
   maskedit18.enabled := true;
   maskedit19.enabled := true;
   maskedit20.enabled := true;
   maskedit21.enabled := true;
   maskedit25.enabled := true;
   MaskEdit3.Visible  := True;
   maskedit22.visible := true;
   maskedit18.visible := true;
   maskedit19.visible := true;
   maskedit20.visible := true;
   maskedit21.visible := true;
   maskedit25.visible := true;
   label20.visible    := true;
   label21.visible    := true;
   label22.visible    := true;
   label23.visible    := true;
   label24.visible    := true;
   label32.visible    := true;   
   label39.visible    := true;
  end
 else
  begin
   maskedit22.enabled := false;
   maskedit18.enabled := false;
   maskedit19.enabled := false;
   maskedit20.enabled := false;
   maskedit21.enabled := false;
   maskedit25.enabled := false;
   MaskEdit3.Visible  := False;
   maskedit22.visible := false;
   maskedit18.visible := false;
   maskedit19.visible := false;
   maskedit20.visible := false;
   maskedit21.visible := false;
   maskedit25.visible := false;
   label20.visible    := false;
   label21.visible    := false;
   label22.visible    := false;
   label23.visible    := false;
   label24.visible    := false;
   label39.visible    := false;
   Label32.Visible    := False;
  end;
end;

Procedure TF_Manut.Limpar(Sender : TObject);
begin
  Dm.PessAux.Close;
  MaskEdit1.Enabled := True;
  maskedit1.text := '';
  maskedit7.text := '';
  maskedit8.text := '';
  maskedit10.text := '';
  maskedit11.text := '';
  maskedit12.text := '';
  maskedit13.text := '';
  maskedit14.text := '';
  maskedit15.text := '';
  maskedit16.text := '';
  maskedit17.text := '';
  maskedit18.text := '';
  MaskEdit3.Text  := '';
  maskedit19.text := '';
  maskedit20.text := '';
  maskedit21.text := '';
  maskedit22.text := '';
  ComboBox7.Text  := '';
  maskedit24.text := '';
  maskedit26.text := '';
  CurrencyEdit1.Value := 0.00;
  CurrencyEdit2.Value := 0.00;
  CurrencyEdit3.Value := 0.00;
  Label33.Visible := False;
  Label33.caption := '0';
  Label29.Visible := False;
  Label29.Caption := '0';
  Label43.Visible := False;
  Label43.Caption := '';
  Label34.caption := '';
  Label42.caption := '';
  Label35.caption := '';
  Label40.caption := '';
  Salvou          := False;
end;

procedure TF_Manut.Carrega(Sender : TObject; Pesquisa : Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT * FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    Dm.Td.Open;
  end;
  Label37.caption     := Dm.Td.FieldByName('data_r').asstring;
  ComboBox3.Text      := Ver_Natureza(Dm.Td.FieldByName('natureza').asstring, True);
//  ComboBox4.Text      := Def_Lan(Dm.Td.FieldByName('lancamento').asstring, True);
  ComboBox5.Text      := Def_Tab(Dm.Td.FieldByName('tabela').asstring, True);
  ComboBox6.Text      := Def_Div(Dm.Td.FieldByName('divisor').asstring, True);


  maskedit7.text      := Dm.Td.FieldByName('microfilme').asstring;
  Label34.caption     := 'R$ ' + StrCurr(Dm.Td.FieldByName('v_mic').ascurrency, 14, True);
  maskedit8.text      := Dm.Td.FieldByName('pag_adic').asstring;
  Label40.caption     := 'R$ ' + StrCurr(Dm.Td.FieldByName('v_pag').ascurrency, 14, True);
  tipo_               := Dm.Td.FieldByName('tipo').asstring;
  maskedit10.text     := Dm.Td.FieldByName('a_nome').asstring;
  maskedit11.text     := Dm.Td.FieldByName('a_endereco').asstring;
  maskedit12.text     := Dm.Td.FieldByName('a_bairro').asstring;
  maskedit13.text     := Dm.Td.FieldByName('a_cidade').asstring;
  maskedit14.text     := Dm.Td.FieldByName('a_estado').asstring;
  maskedit15.text     := Dm.Td.FieldByName('a_telefone').asstring;
  maskedit16.text     := Dm.Td.FieldByName('a_cep').asstring;
  CurrencyEdit1.Value := Dm.Td.FieldByName('valor_base').ascurrency;
  CurrencyEdit3.value := Dm.Td.FieldByName('deposito').ascurrency;
  CurrencyEdit2.Value := Dm.Td.FieldByName('custas').ascurrency;
//  Label33.Visible     := True;
//  Label33.caption     := Dm.Td.FieldByName('protocolo').asstring;
  Label29.Visible     := True;
  Label29.Caption     := Dm.Td.FieldByName('registro').asString;
  MaskEdit24.Text     := Dm.Td.FieldByName('cod_local').asString;
  Label35.Caption     := 'R$ ' + StrCurr(Dm.Td.FieldByName('v_conducao').ascurrency, 14, True);
  Label42.Caption     := 'R$ ' + StrCurr(Dm.Td.FieldByName('v_adc').ascurrency, 14, True);
  MaskEdit26.Text     := Dm.Td.FieldByName('vias_adc').asString;
  val_loc             := Dm.Td.FieldByName('v_conducao').ascurrency;
  Label43.Visible     := True;
  Label43.Caption     := Dm.Td.FieldByName('status').asString;
  Label31.Caption     := Dm.Td.FieldByName('rl').asString;
  MaskEdit2.Text      := Dm.Td.FieldByName('data_p').asString;
  if (Pesquisa) then Dm.Td.Close;
end;

procedure TF_Manut.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then
  begin
    if bitbtn1.enabled then bitbtn1.setfocus else bitbtn2.setfocus;
  end;
end;

procedure TF_Manut.BitBtn3Click(Sender: TObject);
begin
  if (not Salvou) AND (not BitBtn1.Enabled) then
  begin
    Atualiza_His(DateToStr(date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Realizada manutenção do títulos após seu registro.', Trim(MaskEdit1.Text));
    Limpa_TdCert(Label37.Caption, Trim(MaskEdit1.Text));
    Atualiza_TDCert(Label37.Caption, Trim(MaskEdit1.Text));
  end;
  Close;
end;

procedure TF_Manut.BitBtn2Click(Sender: TObject);
begin
  if (not Salvou) AND (not BitBtn1.Enabled) then
  begin
    Atualiza_His(DateToStr(date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Realizada manutenção do títulos após seu registro.', Trim(MaskEdit1.Text));
    Limpa_TdCert(Label37.Caption, Trim(MaskEdit1.Text));
    Atualiza_TDCert(Label37.Caption, Trim(MaskEdit1.Text));
    salvou := True;
  end;  
  Limpar(F_Manut);
  GroupBox3.Enabled := False;
  GroupBox4.Enabled := False;
  GroupBox5.Enabled := False;
  bitbtn1.enabled   := True;
  Panel2.enabled    := False;
  MaskEdit1.Text    := '';
  MaskEdit1.SetFocus;
end;

procedure TF_Manut.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    ShowMessage('Protocolo Auxiliar inválido !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  MaskEdit1.Enabled := False;
  Panel2.enabled    := False;
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
    BitBtn2Click(F_Manut);
    Exit;
  end;
  GroupBox3.Enabled := True;
  GroupBox5.Enabled := True;
  Panel2.Enabled := True;
  Carrega_Pessoal(F_Manut, True);
  Carrega(F_Manut, False);
  Dm.Td.Close;
  BitBtn1.Enabled := False;
  BitBtn5.SetFocus;
end;

procedure TF_Manut.FormActivate(Sender: TObject);
begin
  F_Menu.Vezes.Caption := '0';
  maskedit1.setfocus;
end;

procedure TF_Manut.MaskEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then combobox7.SetFocus;
end;

procedure TF_Manut.MaskEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_Manut.MaskEdit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit20.setfocus;
end;

procedure TF_Manut.MaskEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit21.SetFocus;
end;

procedure TF_Manut.MaskEdit21KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (Label26.Caption = 'I') then
    begin
      if (MessageBox(Handle, PChar('Confirma inclusão ?'), 'INCLUSÃO DE PARTES', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
      begin
        Dm.Td_Pesso.Close;
        Dm.Td_Pesso.Sql.Clear;
        Dm.Td_Pesso.Sql.Add('SELECT * FROM td_pesso');
        Dm.Td_Pesso.Sql.Add('WHERE');
        Dm.Td_Pesso.Sql.Add('recno = 0');
        Dm.Td_Pesso.Open;
        Dm.Td_Pesso.Append;
        Dm.Td_Pesso.FieldByName('data').asString       := Label37.Caption;
        Dm.Td_Pesso.FieldByName('tipo').asString       := tipo_;        
        Dm.Td_Pesso.FieldByName('p_auxiliar').asString := Trim(MaskEdit1.Text);
        Dm.Td_Pesso.FieldByName('protocolo').asString  := Label29.Caption; 
        Dm.Td_Pesso.FieldByName('nome').asString       := Trim(MaskEdit17.Text);
        Dm.Td_Pesso.FieldByName('tip_doc1').asString   := Trim(ComboBox1.Text);
        Dm.Td_Pesso.FieldByName('doc1').asString       := TirarTudo(MaskEdit27.Text, '.', '-', '/');
        Dm.Td_Pesso.FieldByName('tip_doc2').asString   := Trim(ComboBox2.Text);
        Dm.Td_Pesso.FieldByName('doc2').asString       := Trim(MaskEdit28.Text);
        Dm.Td_Pesso.FieldByName('endereco').asString   := Trim(MaskEdit18.Text);
        Dm.Td_Pesso.FieldByName('numero').asString     := Trim(MaskEdit3.Text);
        Dm.Td_Pesso.FieldByName('bairro').asString     := Trim(MaskEdit19.Text);
        Dm.Td_Pesso.FieldByName('cidade').asString     := Trim(MaskEdit20.Text);
        Dm.Td_Pesso.FieldByName('estado').asString     := Trim(MaskEdit21.Text);
        Dm.Td_Pesso.FieldByName('cep').asString        := TirarTudo(MaskEdit22.Text, '-','','');
        Dm.Td_Pesso.FieldByName('situacao').asString   := Trim(Copy(ComboBox7.Text, 1, 3));
        Dm.Td_Pesso.FieldByName('complem').asString    := Trim(MaskEdit25.Text);
        Dm.Td_Pesso.Post;
        Dm.Td_Pesso.Close;
        Carrega_Pessoal(F_Manut, True)
      end
      else Carrega_Pessoal(F_Manut, False);
    end
    else
    begin
      if (Label26.Caption = 'C') then
      begin
        if (MessageBox(Handle, PChar('Confirma correção ?'), 'INCLUSÃO DE PARTES', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
        begin
          Dm.Td_Pesso.Close;
          Dm.Td_Pesso.Sql.Clear;
          Dm.Td_Pesso.Sql.Add('SELECT * FROM td_pesso');
          Dm.Td_Pesso.Sql.Add('WHERE');
          Dm.Td_Pesso.Sql.Add('recno = ' + Dm.PessAux.FieldByName('recno').asString);
          Dm.Td_Pesso.Open;
          Dm.Td_Pesso.Edit;
          Dm.Td_Pesso.FieldByName('data').asString       := Label37.Caption;
          Dm.Td_Pesso.FieldByName('tipo').asString       := tipo_;
          Dm.Td_Pesso.FieldByName('p_auxiliar').asString := Trim(MaskEdit1.Text);
          Dm.Td_Pesso.FieldByName('protocolo').asString  := Label29.Caption;
          Dm.Td_Pesso.FieldByName('nome').asString       := Trim(MaskEdit17.Text);
          Dm.Td_Pesso.FieldByName('tip_doc1').asString   := Trim(ComboBox1.Text);
          Dm.Td_Pesso.FieldByName('doc1').asString       := TirarTudo(MaskEdit27.Text, '.', '-', '/');
          Dm.Td_Pesso.FieldByName('tip_doc2').asString   := Trim(ComboBox2.Text);
          Dm.Td_Pesso.FieldByName('doc2').asString       := Trim(MaskEdit28.Text);
          Dm.Td_Pesso.FieldByName('endereco').asString   := Trim(MaskEdit18.Text);
          Dm.Td_Pesso.FieldByName('numero').asString     := Trim(MaskEdit3.Text);
          Dm.Td_Pesso.FieldByName('bairro').asString     := Trim(MaskEdit19.Text);
          Dm.Td_Pesso.FieldByName('cidade').asString     := Trim(MaskEdit20.Text);
          Dm.Td_Pesso.FieldByName('estado').asString     := Trim(MaskEdit21.Text);
          Dm.Td_Pesso.FieldByName('cep').asString        := TirarTudo(MaskEdit22.Text, '-','','');
          Dm.Td_Pesso.FieldByName('situacao').asString   := Trim(Copy(ComboBox7.Text, 1,3));
          Dm.Td_Pesso.FieldByName('complem').asString    := Trim(MaskEdit25.Text);
          Dm.Td_Pesso.Post;
          Dm.Td_Pesso.Close;
          Carrega_Pessoal(F_Manut, True)
        end;
      end;
    end;
    Label26.Caption   := 'Label26';
    GroupBox3.Enabled := True;
    GroupBox4.Enabled := False;
    DbGrid1.SetFocus;
  end;
end;

procedure TF_Manut.Alterar1Click(Sender: TObject);
begin
  Panel4.Enabled := True;
  MaskEdit10.SetFocus;
end;

procedure TF_Manut.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit11.setfocus;
end;

procedure TF_Manut.MaskEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit12.setfocus;
end;

procedure TF_Manut.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit13.setfocus;
end;

procedure TF_Manut.MaskEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit14.setfocus;
end;

procedure TF_Manut.MaskEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit15.setfocus;
end;

procedure TF_Manut.MaskEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit16.setfocus;
end;

procedure TF_Manut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GroupBox3.Enabled := false;
  GroupBox4.Enabled := false;
  GroupBox5.Enabled := false;
  Panel2.enabled := false;
  bitbtn1.enabled := true; 
end;

procedure TF_Manut.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit24.setfocus;
end;

procedure TF_Manut.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit8.setfocus;
end;

procedure TF_Manut.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit26.setfocus;
end;

procedure TF_Manut.MaskEdit8Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit8.Text)) then MaskEdit8.Text := '0';
end;

procedure TF_Manut.MaskEdit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_Manut.MaskEdit24Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit24.Text)) then MaskEdit24.Text := '0';
{  if (StrToInt(MaskEdit24.Text) > 0) then
  begin
    Funcoes.Abre_LocalClick(Funcoes);
    cod_loc := F_Exame.MaskEdit24.text;
    Tabela.td_local.setorder(1);
    if Tabela.Td_Local.Seek(cod_loc) then
    Begin
      val_loc := tabela.td_local.fieldbyname('valor').ascurrency;
      label35.Caption := currtostr(val_loc);
    end
    else
    begin
      val_loc := 0.00;
      label35.Caption := currtostr(val_loc);
      showmessage('Codigo não Localizado');
      Funcoes.Fecha_LocalClick(Funcoes);
      F_Exame.maskedit24.setfocus;
      exit;
    end;
    Funcoes.Fecha_localClick(Funcoes);
  end
  else val_loc := 0;
  Screen.cursor := CrDefault; }
end;

procedure TF_Manut.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then ComboBox3.SetFocus;
end;

procedure TF_Manut.ComboBox1Exit(Sender: TObject);
begin
  if (Trim(ComboBox1.Text) = 'CPF') then
  begin
    if (MaskEdit27.EditMask <> '###.###.###-##') then MaskEdit27.EditMask := '###.###.###-##';
  end;
  if (Trim(ComboBox1.Text) = 'CNPJ') then
  begin
    if (MaskEdit27.EditMask <> '##.###.###/####-##') then MaskEdit27.EditMask := '##.###.###/####-##';
    ComboBox2.Text := '';
  end;
end;

procedure TF_Manut.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit27.SetFocus;
end;

procedure TF_Manut.MaskEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit17.SetFocus;  //ComboBox2.SetFocus;
end;

procedure TF_Manut.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit28.SetFocus;
end;

procedure TF_Manut.MaskEdit28KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit17.SetFocus;
end;

procedure TF_Manut.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox5.SetFocus;
end;

procedure TF_Manut.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox5.SetFocus;
end;

procedure TF_Manut.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox6.SetFocus;
end;

procedure TF_Manut.ComboBox6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit24.SetFocus;
end;

procedure TF_Manut.MaskEdit26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_Manut.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    CalculoGeral(MaskEdit2.Text, Trim(Copy(ComboBox5.Text, 1,3)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit8.Text), StrToInt(MaskEdit7.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), 0, 'N', True);
    CurrencyEdit2.Value := VrTotG + VrCond + VrTotPagG + VrTotMicG + VrTotAdcG;  
    if (MessageBox(Handle, PChar('Gravar Cálculo ?'), 'EXAME DE TÍTULO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin
      Dm.Td.Close;
      Dm.Td.Sql.Clear;
      Dm.Td.Sql.Add('SELECT v_cartorio, v_estado, v_ipesp, v_sinoreg, v_tribunal, v_conducao, v_total,');
      Dm.Td.Sql.Add('vo_pag, ve_pag, vi_pag, vs_pag, vt_pag, v_pag,');
      Dm.Td.Sql.Add('vo_mic, ve_mic, vi_mic, vs_mic, vt_mic, v_mic,');
      Dm.Td.Sql.Add('vo_adc, ve_adc, vi_adc, vs_adc, vt_adc, v_adc,');
      Dm.Td.Sql.Add('valor_base, custas, microfilme, pag_adic, vias_adc, cod_local,');
      Dm.Td.Sql.Add('natureza, tabela, divisor, lancamento, ext_nat, tipo');
      Dm.Td.Sql.Add('FROM td');
      Dm.Td.Sql.Add('WHERE');
      Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
      Dm.Td.Open;
      if (Dm.Td.RecordCount <> 0) then
      begin
        Dm.Td.Edit;
        Dm.Td.FieldByName('tipo').asString         := tipo_;
        Dm.Td.FieldByName('ext_nat').asString      := Ver_Natureza(IntToStr(StrToInt(Copy(ComboBox3.Text, 1,3))), False);
        Dm.Td.FieldByName('natureza').asInteger    := StrToInt(Copy(ComboBox3.Text, 1,3));
//        Dm.Td.FieldByName('lancamento').asInteger  := StrToInt(Copy(ComboBox4.Text, 1,2));
        Dm.Td.FieldByName('tabela').asString       := Trim(Copy(ComboBox5.Text, 1,3));
        Dm.Td.FieldByName('divisor').asInteger     := StrToInt(Copy(ComboBox6.Text, 1,2));
        Dm.Td.FieldByName('microfilme').asInteger  := StrToInt(MaskEdit7.Text);
        Dm.Td.FieldByName('pag_adic').asInteger    := StrToInt(MaskEdit8.Text);
        Dm.Td.FieldByName('vias_adc').asInteger    := StrToInt(MaskEdit26.Text);
        Dm.Td.FieldByName('cod_local').asInteger   := StrToInt(MaskEdit24.Text);
        Dm.Td.FieldByName('v_cartorio').asCurrency := VrOfiG;
        Dm.Td.FieldByName('v_estado').asCurrency   := VrEstG;
        Dm.Td.FieldByName('v_ipesp').asCurrency    := VrIpeG;
        Dm.Td.FieldByName('v_sinoreg').asCurrency  := VrSinG;
        Dm.Td.FieldByName('v_tribunal').asCurrency := VrTriG;
        Dm.Td.FieldByName('v_conducao').asCurrency := VrCond;
        Dm.Td.FieldByName('v_total').asCurrency    := VrTotG;
        Dm.Td.FieldByName('vo_pag').asCurrency     := VrOfiPagG;
        Dm.Td.FieldByName('ve_pag').asCurrency     := VrEstPagG;
        Dm.Td.FieldByName('vi_pag').asCurrency     := VrIpePagG;
        Dm.Td.FieldByName('vs_pag').asCurrency     := VrSinPagG;
        Dm.Td.FieldByName('vt_pag').asCurrency     := VrTriPagG;
        Dm.Td.FieldByName('v_pag').asCurrency      := VrTotPagG;
        Dm.Td.FieldByName('vo_mic').asCurrency     := VrOfiMicG;
        Dm.Td.FieldByName('ve_mic').asCurrency     := VrEstMicG;
        Dm.Td.FieldByName('vi_mic').asCurrency     := VrIpeMicG;
        Dm.Td.FieldByName('vs_mic').asCurrency     := VrSinMicG;
        Dm.Td.FieldByName('vt_mic').asCurrency     := VrTriMicG;
        Dm.Td.FieldByName('v_mic').asCurrency      := VrTotMicG;
        Dm.Td.FieldByName('vo_adc').asCurrency     := VrOfiAdcG;
        Dm.Td.FieldByName('ve_adc').asCurrency     := VrEstAdcG;
        Dm.Td.FieldByName('vi_adc').asCurrency     := VrIpeAdcG;
        Dm.Td.FieldByName('vs_adc').asCurrency     := VrSinAdcG;
        Dm.Td.FieldByName('vt_adc').asCurrency     := VrTriAdcG;
        Dm.Td.FieldByName('v_adc').asCurrency      := VrTotAdcG;
        Dm.Td.FieldByName('custas').asCurrency     := CurrencyEdit2.Value;
        Dm.Td.FieldByName('valor_base').asCurrency := CurrencyEdit1.Value;
        Dm.Td.Post;
      end;
      Dm.Td.Close;
    end
    else Carrega(F_Manut, True);
    DbGrid1.SetFocus; 
  end;
end;

procedure TF_Manut.MaskEdit7Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit7.Text)) then MaskEdit7.Text := '0';
end;

procedure TF_Manut.MaskEdit26Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit26.Text)) then MaskEdit26.Text := '0';
end;

procedure TF_Manut.Incluir1Click(Sender: TObject);
begin
  Limpa_TelaPessoal(F_Manut);
  GroupBox3.Enabled := False;
  GroupBox4.Enabled := True;
  Label26.Caption   := 'I';
  ComboBox1.SetFocus;
end;

procedure TF_Manut.Corrigir2Click(Sender: TObject);
begin
  GroupBox3.Enabled := False;
  GroupBox4.Enabled := True;
  Label26.Caption   := 'C';
  combobox1.SetFocus;
end;

procedure TF_Manut.Excluir1Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Confirma exclusão ?'), 'INCLUSÃO DE PARTES', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
  begin
    Dm.Td_Pesso.Close;
    Dm.Td_Pesso.Sql.Clear;
    Dm.Td_Pesso.Sql.Add('DELETE FROM td_pesso');
    Dm.Td_Pesso.Sql.Add('WHERE');
    Dm.Td_Pesso.Sql.Add('recno = ' + Dm.PessAux.FieldByName('recno').asString);
    Dm.Td_Pesso.ExecSql;
    Dm.Td_Pesso.Close;
    Carrega_Pessoal(F_Manut, True)
  end;
end;

procedure TF_Manut.MaskEdit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit18.SetFocus;
end;

procedure TF_Manut.ComboBox7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if key = 13 then
 begin
  if (copy(combobox7.Text,1,1) = 'D') or (copy(combobox7.Text,1,1) = 'E') then
  begin
   maskedit22.enabled := true;
   maskedit18.enabled := true;
   maskedit19.enabled := true;
   maskedit20.enabled := true;
   maskedit21.enabled := true;
   maskedit25.enabled := true;
   MaskEdit3.Visible  := True;   
   maskedit22.visible := true;
   maskedit18.visible := true;
   maskedit19.visible := true;
   maskedit20.visible := true;
   maskedit21.visible := true;
   maskedit25.visible := true;
   label20.visible    := true;
   label21.visible    := true;
   label22.visible    := true;
   label23.visible    := true;
   label24.visible    := true;
   label32.visible    := true;   
   label39.visible    := true;
   MaskEdit22.SetFocus;   
  end
 else
  begin
   maskedit22.enabled := false;
   maskedit18.enabled := false;
   maskedit19.enabled := false;
   maskedit20.enabled := false;
   maskedit21.enabled := false;
   maskedit25.enabled := false;
   MaskEdit3.Visible  := False;   
   maskedit22.visible := false;
   maskedit18.visible := false;
   maskedit19.visible := false;
   maskedit20.visible := false;
   maskedit21.visible := false;
   maskedit25.visible := false;
   label20.visible    := false;
   label21.visible    := false;
   label22.visible    := false;
   label23.visible    := false;
   label24.visible    := false;
   label32.visible    := False;   
   label39.visible    := false;


   if (Label26.Caption = 'I') then
    begin
      if (MessageBox(Handle, PChar('Confirma inclusão ?'), 'INCLUSÃO DE PARTES', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
      begin
        Dm.Td_Pesso.Close;
        Dm.Td_Pesso.Sql.Clear;
        Dm.Td_Pesso.Sql.Add('SELECT * FROM td_pesso');
        Dm.Td_Pesso.Sql.Add('WHERE');
        Dm.Td_Pesso.Sql.Add('recno = 0');
        Dm.Td_Pesso.Open;
        Dm.Td_Pesso.Append;
        Dm.Td_Pesso.FieldByName('data').asString       := Label37.Caption;
        Dm.Td_Pesso.FieldByName('tipo').asString       := tipo_;        
        Dm.Td_Pesso.FieldByName('p_auxiliar').asString := Trim(MaskEdit1.Text);
        Dm.Td_Pesso.FieldByName('nome').asString       := Trim(MaskEdit17.Text);
        Dm.Td_Pesso.FieldByName('tip_doc1').asString   := Trim(ComboBox1.Text);
        Dm.Td_Pesso.FieldByName('doc1').asString       := TirarTudo(MaskEdit27.Text, '.', '-', '/');
        Dm.Td_Pesso.FieldByName('tip_doc2').asString   := Trim(ComboBox2.Text);
        Dm.Td_Pesso.FieldByName('doc2').asString       := Trim(MaskEdit28.Text);
        Dm.Td_Pesso.FieldByName('numero').asString     := Trim(MaskEdit3.Text);
        Dm.Td_Pesso.FieldByName('endereco').asString   := Trim(MaskEdit18.Text);
        Dm.Td_Pesso.FieldByName('bairro').asString     := Trim(MaskEdit19.Text);
        Dm.Td_Pesso.FieldByName('cidade').asString     := Trim(MaskEdit20.Text);
        Dm.Td_Pesso.FieldByName('estado').asString     := Trim(MaskEdit21.Text);
        Dm.Td_Pesso.FieldByName('cep').asString        := TirarTudo(MaskEdit22.Text, '-','','');
        Dm.Td_Pesso.FieldByName('situacao').asString   := Trim(Copy(ComboBox7.Text, 1, 3));
        Dm.Td_Pesso.FieldByName('complem').asString    := Trim(MaskEdit25.Text);
        Dm.Td_Pesso.Post;
        Dm.Td_Pesso.Close;
        Carrega_Pessoal(F_Manut, True)
      end
      else Carrega_Pessoal(F_Manut, False);
    end
   else
    begin
      if (Label26.Caption = 'C') then
      begin
        if (MessageBox(Handle, PChar('Confirma correção ?'), 'INCLUSÃO DE PARTES', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
        begin
          Dm.Td_Pesso.Close;
          Dm.Td_Pesso.Sql.Clear;
          Dm.Td_Pesso.Sql.Add('SELECT * FROM td_pesso');
          Dm.Td_Pesso.Sql.Add('WHERE');
          Dm.Td_Pesso.Sql.Add('recno = ' + Dm.PessAux.FieldByName('recno').asString);
          Dm.Td_Pesso.Open;
          Dm.Td_Pesso.Edit;
          Dm.Td_Pesso.FieldByName('data').asString       := Label37.Caption;
          Dm.Td_Pesso.FieldByName('tipo').asString       := tipo_;
          Dm.Td_Pesso.FieldByName('p_auxiliar').asString := Trim(MaskEdit1.Text);
          Dm.Td_Pesso.FieldByName('nome').asString       := Trim(MaskEdit17.Text);
          Dm.Td_Pesso.FieldByName('tip_doc1').asString   := Trim(ComboBox1.Text);
          Dm.Td_Pesso.FieldByName('doc1').asString       := TirarTudo(MaskEdit27.Text, '.', '-', '/');
          Dm.Td_Pesso.FieldByName('tip_doc2').asString   := Trim(ComboBox2.Text);
          Dm.Td_Pesso.FieldByName('doc2').asString       := Trim(MaskEdit28.Text);
          Dm.Td_Pesso.FieldByName('endereco').asString   := Trim(MaskEdit18.Text);
          Dm.Td_Pesso.FieldByName('numero').asString     := Trim(MaskEdit3.Text);
          Dm.Td_Pesso.FieldByName('bairro').asString     := Trim(MaskEdit19.Text);
          Dm.Td_Pesso.FieldByName('cidade').asString     := Trim(MaskEdit20.Text);
          Dm.Td_Pesso.FieldByName('estado').asString     := Trim(MaskEdit21.Text);
          Dm.Td_Pesso.FieldByName('cep').asString        := TirarTudo(MaskEdit22.Text, '-','','');
          Dm.Td_Pesso.FieldByName('situacao').asString   := Trim(Copy(ComboBox7.Text, 1,3));
          Dm.Td_Pesso.FieldByName('complem').asString    := Trim(MaskEdit25.Text);
          Dm.Td_Pesso.Post;
          Dm.Td_Pesso.Close;
          Carrega_Pessoal(F_Manut, True)
        end;
      end;
    end;
    Label26.Caption   := 'Label26';
    GroupBox3.Enabled := True;
    GroupBox4.Enabled := False;
    DbGrid1.SetFocus;
  end;
 end;
end;

procedure TF_Manut.MaskEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    if (MessageBox(Handle, PChar('Confirma correção dos dados do apresentante ?'), 'EXAME DE TÍTULOS', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin
      Dm.Td.Close;
      Dm.Td.Sql.Clear;
      Dm.Td.Sql.Add('SELECT *');
      Dm.Td.Sql.Add('FROM td');
      Dm.Td.Sql.Add('WHERE');
      Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
      Dm.Td.Open;
      if (Dm.Td.RecordCount <> 0) then
      begin
        Dm.Td.Edit;
        Dm.Td.FieldByName('a_nome').asstring     := Trim(MaskEdit10.Text);
        Dm.Td.FieldByName('a_endereco').asstring := Trim(MaskEdit11.Text);
        Dm.Td.FieldByName('a_bairro').asstring   := Trim(MaskEdit12.Text);
        Dm.Td.FieldByName('a_cidade').asstring   := Trim(MaskEdit13.Text);
        Dm.Td.FieldByName('a_estado').asstring   := Trim(Maskedit14.Text);
        Dm.Td.FieldByName('a_telefone').asstring := Trim(MaskEdit15.Text);
        Dm.Td.FieldByName('a_cep').asstring      := Trim(MaskEdit16.Text);
        Dm.Td.Post;
      end;
      Dm.Td.Close;
    end
    else Carrega(F_Manut, True);
    Panel4.Enabled := False;
  end;     
end;

procedure TF_Manut.MaskEdit27Exit(Sender: TObject);
Var
 veril :string;
begin

  veril := CheckCPF(TirarTudo(MaskEdit27.Text, '.', '-', '/'));
  if veril <> TirarTudo(MaskEdit27.Text, '.', '-', '/') then
   begin
    if MessageDlg('Cpf inválido!!->'+veril+ ' Ignora.?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     begin
       maskedit27.setfocus;
     end;
   end;
  if (Label26.Caption = 'I') AND (Trim(MaskEdit17.Text) = '') then
   begin
     Procura_Pessoal('doc1', TirarTudo(MaskEdit27.Text, '.', '-', '/'));
   end;
    Dm.Join.Close;
    Dm.Join.Sql.Clear;
    Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.data_e, a.data_i, a.data_d, a.data_du, a.data_anot,');
    Dm.Join.Sql.Add('a.p_auxiliar, a.protocolo, a.registro, a.tipo, a.natureza, a.ext_nat, a.anotacao,');
    Dm.Join.Sql.Add('a.status, a.identifica, a.identific1, a.identific2, a.identific3, a.microfilme,');
    Dm.Join.Sql.Add('a.tabela, a.contrato,a.data_not1, a.data_not2, a.data_not3, a.cod_ir1, a.cod_ir2, a.cod_ir3,');
    Dm.Join.Sql.Add('b.nome, b.endereco, b.cidade, b.estado, b.cep, b.situacao, b.nome2, b.tip_doc1,');
    Dm.Join.Sql.Add('b.doc1, b.tip_doc2, b.doc2, b.bairro, b.numero, b.complem');
    Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
    Dm.Join.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
    Dm.Join.Sql.Add('WHERE');
    Dm.Join.Sql.Add('(b.doc1 = ' + Chr(39) + TirarTudo(MaskEdit27.Text, '.', '/', '-') + Chr(39)+')');
    Dm.Join.Sql.Add('AND ((a.cod_ir1 = 3) or (a.cod_ir2 = 3) or (a.cod_ir3 = 3))');
    Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
    Dm.Join.Open;
    if (Dm.Join.RecordCount <> 0) then F_End2.showmodal;
    Dm.Join.Close;
end;

procedure TF_Manut.MaskEdit28Exit(Sender: TObject);
begin
  if (Label26.Caption = 'I') AND (Trim(MaskEdit17.Text) = '') then Procura_Pessoal('doc2', Trim(MaskEdit28.Text));
end;

procedure TF_Manut.MaskEdit17Exit(Sender: TObject);
begin
  if (Label26.Caption = 'I') AND (Trim(MaskEdit18.Text) = '') then Procura_Pessoal('nome', Trim(MaskEdit17.Text));
end;

procedure TF_Manut.MaskEdit22Exit(Sender: TObject);
begin
  if (Trim(MaskEdit18.Text) = '') then
  begin
    Busca_Endereco(TirarTudo(MaskEdit22.Text, '-', '',''), '');
    if (Trim(MaskEdit18.Text) <> '') then MaskEdit3.SetFocus else MaskEdit18.SetFocus;
  end;  
end;

procedure TF_Manut.ComboBox5Exit(Sender: TObject);
begin
  if (Trim(Copy(ComboBox5.Text, 1,3)) = '03') then tipo_ := 'N' else tipo_ := 'T'; 
end;

procedure TF_Manut.ComboBox3Exit(Sender: TObject);
begin
  if (Trim(ComboBox3.Text) <> '') then Tipo_ := Copy(ComboBox3.Text, Length(ComboBox3.Text), 1);
end;

procedure TF_Manut.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit25.SetFocus;
end;

procedure TF_Manut.MaskEdit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit19.SetFocus;
end;

procedure TF_Manut.BitBtn5Click(Sender: TObject);
begin
  Application.CreateForm(TF_InfComp, F_InfComp);
  F_InfComp.Label23.Caption := Trim(MaskEdit1.Text);
  F_InfComp.Label25.Caption := Label37.Caption;
  F_InfComp.Label26.Caption := Label31.Caption;
  F_InfComp.ShowModal;
  F_InfComp.Destroy;
  F_InfComp := NIL;
  ComboBox3.SetFocus;
end;

procedure TF_Manut.MaskEdit18Exit(Sender: TObject);
begin
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.data_e, a.data_i, a.data_d, a.data_du, a.data_anot,');
  Dm.Join.Sql.Add('a.p_auxiliar, a.protocolo, a.registro, a.tipo, a.natureza, a.ext_nat, a.anotacao,');
  Dm.Join.Sql.Add('a.status, a.identifica, a.identific1, a.identific2, a.identific3, a.microfilme,');
  Dm.Join.Sql.Add('a.tabela, a.contrato,a.data_not1, a.data_not2, a.data_not3, a.cod_ir1, a.cod_ir2, a.cod_ir3,');
  Dm.Join.Sql.Add('b.nome, b.endereco, b.cidade, b.estado, b.cep, b.situacao, b.nome2, b.tip_doc1,');
  Dm.Join.Sql.Add('b.doc1, b.tip_doc2, b.doc2, b.bairro, b.numero, b.complem');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
  Dm.Join.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('(b.endereco = ' + Chr(39) + F_Manut.Maskedit18.text + Chr(39)+')');
  Dm.Join.Sql.Add('AND ((a.cod_ir1 = 3) or (a.cod_ir2 = 3) or (a.cod_ir3 = 3))');
  Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
  Dm.Join.Open;
  if (Dm.Join.RecordCount <> 0) then F_End2.showmodal;
  Dm.Join.Close;
end;

end.


