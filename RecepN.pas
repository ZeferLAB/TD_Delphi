unit RecepN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DBCtrls, Printers, Buttons, RDprint, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus;

type
  TF_RecepN = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    MaskEdit16: TMaskEdit;
    Label25: TLabel;
    Label27: TLabel;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RDprint1: TRDprint;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    Label11: TLabel;
    ComboBox3: TComboBox;
    Label12: TLabel;
    ComboBox4: TComboBox;
    Label13: TLabel;
    ComboBox5: TComboBox;
    Label14: TLabel;
    ComboBox6: TComboBox;
    Label38: TLabel;
    MaskEdit24: TMaskEdit;
    Label16: TLabel;
    MaskEdit9: TMaskEdit;
    Label17: TLabel;
    MaskEdit10: TMaskEdit;
    Label41: TLabel;
    MaskEdit26: TMaskEdit;
    BitBtn4: TBitBtn;
    GroupBox4: TGroupBox;
    Label22: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label39: TLabel;
    Label33: TLabel;
    MaskEdit17: TMaskEdit;
    MaskEdit18: TMaskEdit;
    MaskEdit19: TMaskEdit;
    MaskEdit20: TMaskEdit;
    MaskEdit21: TMaskEdit;
    MaskEdit22: TMaskEdit;
    MaskEdit25: TMaskEdit;
    ComboBox1: TComboBox;
    MaskEdit27: TMaskEdit;
    ComboBox2: TComboBox;
    MaskEdit28: TMaskEdit;
    ComboBox7: TComboBox;
    Label34: TLabel;
    MaskEdit11: TMaskEdit;
    DBGrid1: TDBGrid;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    Label35: TLabel;
    PopupMenu1: TPopupMenu;
    Incluir1: TMenuItem;
    Corrigir2: TMenuItem;
    Excluir1: TMenuItem;
    Label36: TLabel;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    Label37: TLabel;
    CurrencyEdit7: TCurrencyEdit;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit21KeyDown(Sender: TObject; var Key: Word;
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
    procedure MaskEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit26KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7Exit(Sender: TObject);
    procedure MaskEdit22Exit(Sender: TObject);
    Procedure Gravar(Sender : TOBject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    Procedure Limpar_Tela(Sender : TOBject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit27Exit(Sender: TObject);
    procedure MaskEdit28Exit(Sender: TObject);
    procedure MaskEdit17Exit(Sender: TObject);
    procedure ComboBox7Enter(Sender: TObject);
    procedure ComboBox7KeyPress(Sender: TObject; var Key: Char);
    Procedure Carrega_Pessoal(Sender : TObject; Pesquisa : Boolean);
    procedure Incluir1Click(Sender: TObject);
    Procedure Limpa_TelaPessoal(Sender : TOBject);
    procedure Corrigir2Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    Procedure Grava_Partes(Sender : TOBject);
    procedure ComboBox3Enter(Sender: TObject);
    procedure ComboBox4Enter(Sender: TObject);
    procedure ComboBox5Enter(Sender: TObject);
    procedure ComboBox6Enter(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure CurrencyEdit3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RecepN: TF_RecepN;
  tipo_, arq : String;
  vezes : String;

implementation

uses DMTD, Menu, Func, Dep1, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_RecepN.Limpa_TelaPessoal(Sender : TOBject);
begin
  MaskEdit17.Text := '';
  MaskEdit27.Text := '';
  MaskEdit28.Text := '';
  MaskEdit22.Text := '';
  MaskEdit18.Text := '';
  MaskEdit19.Text := '';
  MaskEdit20.Text := '';
  MaskEdit21.Text := '';
  MaskEdit25.Text := '';
  ComboBox7.Text  := '';
end;

Procedure TF_RecepN.Carrega_Pessoal(Sender : TObject; Pesquisa : Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('SELECT * FROM ' + arq);
    Dm.PessAux.Sql.Add('ORDER BY situacao');
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
  MaskEdit19.Text := Dm.PessAux.FieldByName('bairro').asString;
  MaskEdit20.Text := Dm.PessAux.FieldByName('cidade').asString;
  MaskEdit21.Text := Dm.PessAux.FieldByName('estado').asString;
  MaskEdit22.EditMask := '';
  MaskEdit22.Text := Dm.PessAux.FieldByName('cep').asString;
  MaskEdit22.EditMask := '#####-###';
  ComboBox7.Text  := Ver_Situacao(Dm.PessAux.FieldByName('situacao').asString, True);
  MaskEdit25.Text := Dm.PessAux.FieldByName('e_mail').asString;   
end;

Procedure TF_RecepN.Grava_Partes(Sender : TOBject);
begin
  if (Trim(Label33.Caption) <> 'C') then
  begin
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('INSERT INTO ' + arq);
    Dm.PessAux.Sql.Add('(nome, tip_doc1, doc1, tip_doc2, doc2,');
    Dm.PessAux.Sql.Add(' endereco, bairro, cidade, estado, cep,');
    Dm.PessAux.Sql.Add(' situacao, e_mail)');
    Dm.PessAux.Sql.Add('VALUES(');
    Dm.PessAux.Sql.Add(Chr(39) + Trim(MaskEdit17.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add(Chr(39) + Trim(ComboBox1.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add(Chr(39) + TirarTudo(MaskEdit27.Text, '.', '-', '/') + Chr(39) + ',');
    Dm.PessAux.Sql.Add(Chr(39) + Trim(ComboBox2.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add(Chr(39) + Trim(MaskEdit28.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add(Chr(39) + Trim(MaskEdit18.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add(Chr(39) + Trim(MaskEdit19.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add(Chr(39) + Trim(MaskEdit20.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add(Chr(39) + Trim(MaskEdit21.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add(Chr(39) + TirarTudo(MaskEdit22.Text, '-','','') + Chr(39) + ',');
    Dm.PessAux.Sql.Add(Chr(39) + Trim(Copy(ComboBox7.Text, 1, 3)) + Chr(39) + ',');
    Dm.PessAux.Sql.Add(Chr(39) + Trim(MaskEdit25.Text) + Chr(39));
    Dm.PessAux.Sql.Add(')');
    Dm.PessAux.ExecSql;
  end;
  if (Trim(Label33.Caption) = 'C') then
  begin
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('UPDATE ' + arq + ' SET');
    Dm.PessAux.Sql.Add('nome     = ' + Chr(39) + Trim(MaskEdit17.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add('tip_doc1 = ' + Chr(39) + Trim(ComboBox1.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add('doc1     = ' + Chr(39) + TirarTudo(MaskEdit27.Text, '.', '-', '/') + Chr(39) + ',');
    Dm.PessAux.Sql.Add('tip_doc2 = ' + Chr(39) + Trim(ComboBox2.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add('doc2     = ' + Chr(39) + Trim(MaskEdit28.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add('endereco = ' + Chr(39) + Trim(MaskEdit18.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add('bairro   = ' + Chr(39) + Trim(MaskEdit19.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add('cidade   = ' + Chr(39) + Trim(MaskEdit20.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add('estado   = ' + Chr(39) + Trim(MaskEdit21.Text) + Chr(39) + ',');
    Dm.PessAux.Sql.Add('cep      = ' + Chr(39) + TirarTudo(MaskEdit22.Text, '-','','') + Chr(39) + ',');
    Dm.PessAux.Sql.Add('situacao = ' + Chr(39) + Trim(Copy(ComboBox7.Text, 1, 3)) + Chr(39) + ',');
    Dm.PessAux.Sql.Add('e_mail   = ' + Chr(39) + Trim(MaskEdit25.Text) + Chr(39));
    Dm.Pessaux.Sql.Add('WHERE');
    Dm.PessAux.Sql.Add('recno = ' + Label36.Caption);
    Dm.PessAux.ExecSql;
  end;
  Carrega_Pessoal(F_RecepN, True);  
  DBGrid1.Enabled := True;  
end;

Procedure TF_RecepN.Limpar_Tela(Sender : TOBject);
begin
  BitBtn4.Enabled     := False;                
  tipo_               := 'T';
  Label35.Caption     := '';
  CurrencyEdit4.Value := 0.00;
  CurrencyEdit5.Value := 0.00;
  CurrencyEdit6.Value := 0.00;
  MaskEdit1.Text      := '';

  GroupBox1.Visible   := False;
  ListBox1.Clear;



  MaskEdit1.Text      := DateToStr(Date);

end;

procedure TF_RecepN.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RecepN.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_RecepN.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_RecepN.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;  
end;

procedure TF_RecepN.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_RecepN.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit11.SetFocus;
end;

procedure TF_RecepN.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_RecepN.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RecepN.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepN.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit26.SetFocus;
end;

procedure TF_RecepN.MaskEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_RecepN.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit19.setfocus;
  if key = 27 then maskedit2.setfocus;
end;

procedure TF_RecepN.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit2.setfocus;
end;

procedure TF_RecepN.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit2.setfocus;
  if key = 13 then maskedit1.setfocus;
end;

Function GerarProtocolo : Boolean;
Begin
  Result := False;
  if (StrToInt(F_RecepN.Label3.Caption) = 0) then
  begin
    Dm.Seq_Bal.Close;
    Dm.Seq_Bal.RequestLive := False;
    Dm.Seq_Bal.Sql.Clear;
    Dm.Seq_Bal.Sql.Add('UPDATE seq_bal SET');
    Dm.Seq_Bal.Sql.Add('protocolo = (protocolo + 1)');
    Dm.Seq_Bal.ExecSql;
    Dm.Seq_Bal.Close;
    Dm.Seq_Bal.RequestLive := True;
    Dm.Seq_Bal.Sql.Clear;
    Dm.Seq_Bal.Sql.Add('SELECT protocolo FROM seq_bal');
    Dm.Seq_Bal.Open;
    F_RecepN.Label3.Caption := StrZero(Dm.Seq_Bal.FieldByName('protocolo').asString, 6);
    Result := True;
    Dm.Seq_Bal.Close;
  end;
end;

Procedure TF_RecepN.Gravar(Sender : TOBject);
begin
  Dm.Td.Close;
  Dm.Td.Sql.Clear;
  Dm.Td.Sql.Add('SELECT * FROM td');
  Dm.Td.Sql.Add('WHERE');
  Dm.Td.Sql.Add('recno = 0');
  Dm.Td.Open;
  Dm.Td.Append;
  Dm.Td.FieldByName('data_r').asString       := MaskEdit1.text;
  Dm.Td.FieldByName('p_auxiliar').asString   := Label3.Caption;
  Label37.Caption := TimeToStr(time);
  Dm.Td.FieldByName('hora_p').asString       := Label37.Caption;
  Dm.Td.FieldByName('status').asString       := 'RECEPCAO';
  Dm.Td.FieldByName('data_entr').asString    := Trim(Maskedit16.text);
  Dm.Td.FieldByName('identifica').asString   := F_Menu.Label1.Caption;
  Dm.Td.FieldByName('a_nome').asstring       := Trim(MaskEdit2.Text);
  Dm.Td.FieldByName('a_endereco').asstring   := Trim(MaskEdit3.Text);
  Dm.Td.FieldByName('a_bairro').asstring     := Trim(MaskEdit4.Text);
  Dm.Td.FieldByName('a_cidade').asstring     := Trim(MaskEdit5.Text);
  Dm.Td.FieldByName('a_estado').asstring     := Trim(Maskedit6.Text);
  Dm.Td.FieldByName('a_telefone').asstring   := Trim(MaskEdit8.Text);
  Dm.Td.FieldByName('a_cep').asstring        := TirarTudo(MaskEdit7.Text, '-', '', '');
  Dm.Td.FieldByName('tipo').asString         := tipo_;
  Dm.Td.FieldByName('ext_nat').asString      := Ver_Natureza(IntToStr(StrToInt(Copy(ComboBox3.Text, 1,3))), False);
  Dm.Td.FieldByName('natureza').asInteger    := StrToInt(Copy(ComboBox3.Text, 1,3));
  Dm.Td.FieldByName('lancamento').asInteger  := StrToInt(Copy(ComboBox4.Text, 1,2));
  Dm.Td.FieldByName('tabela').asString       := Trim(Copy(ComboBox5.Text, 1,3));
  Dm.Td.FieldByName('divisor').asInteger     := StrToInt(Copy(ComboBox6.Text, 1,2));
  Dm.Td.FieldByName('microfilme').asInteger  := StrToInt(MaskEdit9.Text);
  Dm.Td.FieldByName('pag_adic').asInteger    := StrToInt(MaskEdit10.Text);
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
  Dm.Td.FieldByName('deposito').asCurrency   := CurrencyEdit3.Value;
  Dm.Td.Post;
  // Arquivo Temporário dos nomes das partes
  Dm.PessAux.Close;
  Dm.PessAux.Sql.Clear;
  Dm.PessAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.PessAux.Sql.Add('ORDER BY nome');
  Dm.PessAux.Open;
  if (Dm.PessAux.RecordCount <> 0) then
  begin
    //Atualizando Dados das Partes;
    Dm.Td_Pesso.Close;
    Dm.Td_Pesso.Sql.Clear;
    Dm.Td_Pesso.Sql.Add('SELECT * FROM td_pesso');
    Dm.Td_Pesso.Sql.Add('WHERE');
    Dm.Td_Pesso.Sql.Add('recno = 0');
    Dm.Td_Pesso.Open;
    while (not Dm.PessAux.Eof) do
    begin
      Dm.Td_Pesso.Append;
      Dm.Td_Pesso.FieldByName('data').asString       := MaskEdit1.Text;
      Dm.Td_Pesso.FieldByName('tipo').asString       := tipo_;
      Dm.Td_Pesso.FieldByName('p_auxiliar').asString := Trim(Label3.Caption);
      Dm.Td_Pesso.FieldByName('nome').asString       := Dm.PessAux.FieldByName('nome').asString;
      Dm.Td_Pesso.FieldByName('tip_doc1').asString   := Dm.PessAux.FieldByName('tip_doc1').asString;
      Dm.Td_Pesso.FieldByName('doc1').asString       := Dm.PessAux.FieldByName('doc1').asString;
      Dm.Td_Pesso.FieldByName('tip_doc2').asString   := Dm.PessAux.FieldByName('tip_doc2').asString;
      Dm.Td_Pesso.FieldByName('doc2').asString       := Dm.PessAux.FieldByName('doc2').asString;
      Dm.Td_Pesso.FieldByName('endereco').asString   := Dm.PessAux.FieldByName('endereco').asString;
      Dm.Td_Pesso.FieldByName('bairro').asString     := Dm.PessAux.FieldByName('bairro').asString;
      Dm.Td_Pesso.FieldByName('cidade').asString     := Dm.PessAux.FieldByName('cidade').asString;
      Dm.Td_Pesso.FieldByName('estado').asString     := Dm.PessAux.FieldByName('estado').asString;
      Dm.Td_Pesso.FieldByName('cep').asString        := Dm.PessAux.FieldByName('cep').asString;
      Dm.Td_Pesso.FieldByName('situacao').asString   := Dm.PessAux.FieldByName('situacao').asString;
      Dm.Td_Pesso.FieldByName('e_mail').asString     := Dm.PessAux.FieldByName('e_mail').asString;
      Dm.Td_Pesso.Post;
      Dm.PessAux.Next;
    end;
    Dm.Td_Pesso.Close;
  end;
  Dm.PessAux.Close;
  if (not Atualiza_Caixa(MaskEdit1.Text, '10', 'E', 'TÍTULO PARA REGISTRO', Label3.Caption, Label35.Caption, F_Menu.Label1.Caption, Trim(MaskEdit2.Text), CurrencyEdit3.Value, CurrencyEdit4.Value, CurrencyEdit6.Value, CurrencyEdit5.Value, CurrencyEdit7.Value)) then
  begin
    ShowMessage('Problemas para atualiza o caixa.');
  end;
  Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Título recepcionado em ' + MaskEdit1.Text + '.', Label3.Caption);
end;

/// Impressão Laser
{Procedure Imprimir;
var
  x, vias, col, lin, pulo : Integer;
begin
  while true do
  Begin
    if messagedlg('Impressora Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then exit;
    col := 50;
    lin := 100;
    pulo := 60;
    vias := 2;
    Printer.begindoc;
    for x := 1 to vias do
    Begin
      Printer.Canvas.Font.Size := 16;
      Printer.Canvas.TextOut(col + 250, lin, '2º OFICIAL DE REGISTRO DE TÍTULOS E DOCUMENTOS');
      lin := lin + pulo + 30;
      Printer.Canvas.TextOut(col + 500, lin, 'SAO JOSE DOS CAMPOS - SP');
      lin := lin + pulo + 20;
      Printer.Canvas.Rectangle(col, lin, col + 2700 , lin + 1);
      Printer.Canvas.Font.Size := 10;
      lin := lin + pulo - 20;
      Printer.Canvas.TextOut(col + 100, lin, 'RUA PADRE FABIANO, 641 - CENTRO - TELEFONE (19) - 3491-4521 / 3491-1120');
      lin := lin + pulo;
      Printer.Canvas.Font.Size := 12;
      Printer.Canvas.TextOut(col + 800, lin, 'VANDERLEI ALVES DA SILVA');
      lin := lin + pulo;
      Printer.Canvas.TextOut(col + 1050, lin, 'OFICIAL');
      lin := lin + (pulo * 2);
      Printer.Canvas.TextOut(col + 800, lin, 'RECIBO - PROTOCOLO Nº ' + F_RecepN.Label3.caption);
      lin := lin + (pulo * 2);
      Printer.Canvas.TextOut(col, lin, 'Tipo de Documento : ' + F_RecepN.Label21.caption);
      lin := lin + (pulo * 2);
      Printer.Canvas.TextOut(col + 900, lin, 'E N T R E   P A R T E S');
      lin := lin + (pulo * 2);
      Printer.Canvas.Font.Size := 10;
      pulo := 50;
      Printer.Canvas.TextOut(col, lin, 'Apresentante : ' + F_RecepN.Maskedit2.text);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, 'Documentos : ' + F_RecepN.Maskedit9.text + ' / ' + F_RecepN.Maskedit10.text);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, 'Endereço : ' + F_RecepN.Maskedit3.text + ' - ' + F_RecepN.Maskedit8.text);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, 'Cidade : ' + F_RecepN.Maskedit5.text + ' - ' + F_RecepN.Maskedit6.text);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, 'Destinatario : ' + F_RecepN.Maskedit12.text);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, 'Data Prevista para Devolução : ' + F_RecepN.Maskedit16.text);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, 'Depósito Prévio : ' + formatcurr('###,###,##0.00', tabela.apoio.fieldbyname('deposito').ascurrency));
      lin := lin + (pulo * 2);
      Printer.Canvas.TextOut(col, lin, 'Diadema, ' + formatdatetime('dd "de" mmmm "de" yyyy', strtodate(F_RecepN.Maskedit1.text)));
      lin := lin + (pulo * 2);
      Printer.Canvas.TextOut(col, lin, '_________________________________');
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, F_Menu.Label1.caption);
      lin := lin + (pulo * 1);
      Printer.Canvas.Rectangle(col, lin, col + 2700 , lin + 1);
      lin := lin + (pulo * 1) - 20;
      Printer.Canvas.Font.Size := 10;
      Printer.Canvas.TextOut(col, lin, '      Informações e retiradas de documentos só com a apresentação deste protocolo no horário das 10:00 às 17:00 horas.');
      lin := lin + (pulo * 2);
      Printer.Canvas.Font.Size := 6;
      Printer.Canvas.TextOut(col, lin, 'Siscart Informática Ltda');
      pulo := 60;
      lin := lin + (pulo * 3);
    end;
    Printer.Enddoc;
  end;
end;

/// Impressão Matricial
Procedure Imprimir_Matrix;
var
   contlin : integer;
   vias,x : integer;
   dep : currency;
begin
//  while true do
//  Begin
    if messagedlg('Impressora Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then exit;
    vias := 2;
    F_RecepN.rdprint1.abrir;
    contlin := 0;
    for x := 1 to vias do
    Begin
      F_RecepN.rdprint1.impf(contlin + 02,03, '  OFICIAL DE REGISTRO DE TITULOS E DOCUMENTOS DE DIADEMA - SP',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 03,03, 'RUA GRACIOSA, 406 -   CENTRO      TEL. (11) 4056-1987/4057-2813       ',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 04,03, '                 PATRICIA ANDRÉ DE CAMARGO FERRAZ',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 05,03, '                             OFICIAL  ',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 07,03, 'RECIBO - PROTOCOLO Nº ' + F_RecepN.Label3.caption,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 09,03, 'Tipo de Documento : ' + F_RecepN.Label21.caption,[COMP12,NORMAL]);
      if F_RecepN.RadioButton1.Checked = True then
      Begin
        F_RecepN.rdprint1.impf(contlin + 09,37, ' - A.R.', [COMP12,NORMAL]);
      end;
      if F_RecepN.RadioButton2.Checked = True then
      Begin
        F_RecepN.rdprint1.impf(contlin + 09,37, ' - N.T.', [COMP12,NORMAL]);
      end;
      if F_RecepN.RadioButton3.Checked = True then
      Begin
        F_RecepN.rdprint1.impf(contlin + 09,37, ' - O.C.', [COMP12,NORMAL]);
      end;
      F_RecepN.rdprint1.impf(contlin + 09,60, ' TD', [COMP12,Expandido]);
      F_RecepN.rdprint1.impf(contlin + 12,03, 'Apresentante : ' + F_RecepN.Maskedit2.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 13,03, 'CPF : ' + F_RecepN.Maskedit9.text + ' / RG : ' + F_RecepN.Maskedit10.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 14,03, 'Endereço : ' + F_RecepN.Maskedit3.text + ' - Fone : ' + F_RecepN.Maskedit8.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 15,03, 'Cidade : ' + F_RecepN.Maskedit5.text + ' - ' + F_RecepN.Maskedit6.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 16,03, 'Dest./Parte : ' + F_RecepN.Maskedit12.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 17,03, 'Endereço    : ' + F_RecepN.Maskedit19.text,[COMP12,NORMAL]);
      if (Trim(F_RecepN.MaskEdit13.Text) <> '') then
      begin
       F_RecepN.rdprint1.impf(contlin + 18,03, 'Data Prevista para Devoluçao : ' + F_RecepN.Maskedit16.text,[COMP12,NORMAL]);
      end
      else F_RecepN.rdprint1.impf(contlin + 18,03, ' ',[COMP12,NORMAL]);
      F_RecepN.RDprint1.ImpVal(contlin + 19,45,'Depósito Prévio : ' + '##,###,##0.00',tabela.apoio.fieldbyname('deposito').ascurrency,[Normal]);
      F_RecepN.rdprint1.impf(contlin + 20,03, 'Qtde Vias  : ' + F_RecepN.Maskedit21.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 23,42, 'Diadema, ' + F_RecepN.Maskedit1.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 26,45, '___________________________',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 27,50, F_Menu.Label1.caption,[COMP12,NORMAL]);
{
      if (x = 1) then
      begin
        F_RecepN.rdprint1.impf(contlin + 24,45, '___________________________',[COMP12,NORMAL]);
        F_RecepN.rdprint1.impf(contlin + 25,50, F_Menu.Label1.caption,[COMP12,NORMAL]);
      end
      else
      begin
        F_RecepN.rdprint1.impf(contlin + 24,40, StringOfChar('_', Length(F_RecepN.MaskEdit2.Text)),[COMP12,NORMAL]);
        F_RecepN.rdprint1.impf(contlin + 25,40, Trim(F_RecepN.MaskEdit2.Text),[COMP12,NORMAL]);
      end;
//
      F_RecepN.rdprint1.impf(contlin + 28,03, 'Informaçoes e retiradas de documentos só com a apresentaçao deste protocolo no ',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 29,03, '                     horário das 10:00 às 16:30 horas.                          ',[COMP12,NORMAL]);
      Contlin := contlin + 31;

    end;
    F_RecepN.RDPRINT1.FECHAR;
    Screen.cursor := CrDefault;

//  end;

end;


Procedure Imprimir_Not;
var
   contlin : integer;
   vias,x : integer;
   dep : currency;
   cust,loc,tot : String;
begin
//  while true do
//  Begin
    if messagedlg('Impressora Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then exit;
    vias := 2;
    F_RecepN.rdprint1.abrir;
    contlin := 0;
    for x := 1 to vias do
    Begin
      F_RecepN.rdprint1.impf(contlin + 02,03, '  OFICIAL DE REGISTRO DE TITULOS E DOCUMENTOS DE DIADEMA - SP',[COMP12,NORMAL]);
//      F_RecepN.rdprint1.impf(contlin + 03,03, 'RUA TURMALINAS, 77 - JD. DONINI - TEL. (11) 4056-1987/4057-2813       ',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 03,03, 'RUA GRACIOSA, 406 -   CENTRO      TEL. (11) 4056-1987/4057-2813       ',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 04,03, '             PATRICIA ANDRÉ DE CAMARGO FERRAZ',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 05,03, '                            OFICIAL',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 07,03, 'RECIBO - PROTOCOLO Nº ' + F_RecepN.Label3.caption,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 09,03, 'Tipo de Documento : ' + F_RecepN.Label21.caption,[COMP12,NORMAL]);

      if F_RecepN.RadioButton1.Checked = True then
      Begin
        F_RecepN.rdprint1.impf(contlin + 09,37, ' - A.R.', [COMP12,NORMAL]);
      end;
      if F_RecepN.RadioButton2.Checked = True then
      Begin
        F_RecepN.rdprint1.impf(contlin + 09,37, ' - N.T.', [COMP12,NORMAL]);
      end;
      if F_RecepN.RadioButton3.Checked = True then
      Begin
        F_RecepN.rdprint1.impf(contlin + 09,37, ' - O.C.', [COMP12,NORMAL]);
      end;


      F_RecepN.rdprint1.impf(contlin + 09,60, ' TD', [COMP12,NORMAL]);

      loc  := CurrToStr(val_loc);
      cust := CurrToStr(tabela.apoio.fieldbyname('custas').ascurrency-val_loc);

      F_RecepN.rdprint1.impf(contlin + 12,03, 'Apresentante : ' + F_RecepN.Maskedit2.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 13,03, 'CPF : ' + F_RecepN.Maskedit9.text + ' / RG : ' + F_RecepN.Maskedit10.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 14,03, 'Endereço : ' + F_RecepN.Maskedit3.text + ' - Fone : ' + F_RecepN.Maskedit8.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 15,03, 'Cidade : ' + F_RecepN.Maskedit5.text + ' - ' + F_RecepN.Maskedit6.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 16,03, 'Dest./Parte : ' + F_RecepN.Maskedit12.text,[COMP12,NORMAL]);
      F_RecepN.RDprint1.impf(contlin + 16,60, 'CUSTAS/EMOL: ' + cust,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 17,03, 'End./CEP    : ' + F_RecepN.Maskedit19.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 17,60, 'COND.OF....: ' + loc,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 18,03, 'Data Prevista para Devoluçao : ' + F_RecepN.Maskedit16.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 18,60, 'TOTAL......: ' + tabela.apoio.fieldbyname('custas').asString,[COMP12,NORMAL]);
      F_RecepN.RDprint1.ImpVal(contlin + 19,01, 'Depósito Prévio : ' + '##,###,##0.00',tabela.apoio.fieldbyname('deposito').ascurrency,[Normal]);
      F_RecepN.rdprint1.impf(contlin + 23,42, 'Diadema, ' + F_RecepN.Maskedit1.text,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 24,45, '___________________________',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 25,50, F_Menu.Label1.caption,[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 27,03, 'Informaçoes e retiradas de documentos só com a apresentaçao deste protocolo no ',[COMP12,NORMAL]);
      F_RecepN.rdprint1.impf(contlin + 28,03, '                     horário das 10:00 às 16:30 horas.                          ',[COMP12,NORMAL]);
      Contlin := contlin + 30;
    end;
    F_RecepN.RDPRINT1.FECHAR;
    Screen.cursor := CrDefault;
//  end;
end; }


procedure TF_RecepN.MaskEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit21.setfocus;
  if key = 27 then maskedit2.setfocus;
end;

procedure TF_RecepN.MaskEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit19.SetFocus;
end;

procedure TF_RecepN.MaskEdit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit20.SetFocus;
end;

procedure TF_RecepN.BitBtn3Click(Sender: TObject);
begin
  DestroeTabela(arq);
  Close;
end;

procedure TF_RecepN.BitBtn1Click(Sender: TObject);
begin
{  if MaskEdit13.Text <> '3' then
  begin
    imprimir_matrix;
  end
  else
  begin
    imprimir_not;
  end; }
end;

procedure TF_RecepN.MaskEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit21.SetFocus;
end;

procedure TF_RecepN.MaskEdit21KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit25.SetFocus;
end;

procedure TF_RecepN.ComboBox1Exit(Sender: TObject);
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

procedure TF_RecepN.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit27.SetFocus;
end;

procedure TF_RecepN.MaskEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_RecepN.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit28.SetFocus;
end;

procedure TF_RecepN.MaskEdit28KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit17.SetFocus;
end;

procedure TF_RecepN.MaskEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit22.SetFocus;
end;

procedure TF_RecepN.MaskEdit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit18.SetFocus;
end;

procedure TF_RecepN.MaskEdit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox7.SetFocus;
end;

procedure TF_RecepN.ComboBox7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    Grava_Partes(F_RecepN);  
    if (MessageBox(Handle, PChar('Fim das partes ?'), 'INCLUSÃO DAS PARTES', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
    begin
      ComboBox3.SetFocus;
    end
    else
    begin
      Limpa_TelaPessoal(F_RecepN);
      ComboBox1.SetFocus;
    end;
  end;
end;

procedure TF_RecepN.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox4.SetFocus;
end;

procedure TF_RecepN.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox5.SetFocus;
end;

procedure TF_RecepN.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox6.SetFocus;
end;

procedure TF_RecepN.ComboBox6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit24.SetFocus;
end;

procedure TF_RecepN.MaskEdit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit9.SetFocus;
end;

procedure TF_RecepN.MaskEdit26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_RecepN.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    CalculoGeral(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,3)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), 0, 'N', True);
    CurrencyEdit2.Value := VrTotG + VrCond + VrTotPagG + VrTotMicG + VrTotAdcG;
    CurrencyEdit3.SetFocus;
  end;  
end;

procedure TF_RecepN.CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit3.SetFocus;
end;

procedure TF_RecepN.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    BitBtn4.Enabled := True;
    BitBtn4.SetFocus;
  end;
end;

procedure TF_RecepN.MaskEdit7Exit(Sender: TObject);
begin
  if (Trim(MaskEdit3.Text) = '') then
  begin
    Busca_Endereco(TirarTudo(MaskEdit7.Text, '-', '',''), '1');
    if (Trim(MaskEdit3.Text) <> '') then
    begin
      MaskEdit3.AutoSelect := False;
      MaskEdit3.SelStart   := Length(MaskEdit3.Text);
    end
    else MaskEdit3.AutoSelect := True;
  end;
end;

procedure TF_RecepN.MaskEdit22Exit(Sender: TObject);
begin
  if (Trim(MaskEdit18.Text) = '') then
  begin
    Busca_Endereco(TirarTudo(MaskEdit22.Text, '-', '',''), '2');
    if (Trim(MaskEdit18.Text) <> '') then
    begin
      MaskEdit18.AutoSelect := False;
      MaskEdit18.SelStart   := Length(MaskEdit18.Text);
    end
    else MaskEdit18.AutoSelect := True;
  end;
end;

procedure TF_RecepN.BitBtn4Click(Sender: TObject);
var
  x : Integer;
begin
  while (not ValidNumero(vezes)) do
  begin
    vezes := InputBox('CONFIRMAR RECEPÇÃO', 'Gerar esta recepção quantas vezes :', '1');
  end;
  if (StrToInt(vezes) > 0) then
  begin
    for x := 1 to StrToInt(vezes) do
    begin
      if (not GerarProtocolo) then
      begin
        ShowMessage('Problemas para gerar o protocolo auxiliar.');
        ShowMessage('Recepção cancelada.');
        Exit;
      end;
      Gravar(F_RecepN);
      if (F_Menu.Label24.Caption = 'T') then
      begin
        ReciboRec(Funcoes, True, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit2.Text), Trim(MaskEdit3.Text), Trim(Copy(ComboBox3.Text, 7, 50)), MaskEdit16.Text, Label37.Caption, '', '', CurrencyEdit3.Value, CurrencyEdit2.Value, VrEmolumentos, VrEmolAdicional, VrPag, VrViasExcedente, VrMicrofilme, VrDigitalizacao, VrInformatica, VrGravEletronica, VrConferencia,
                            VrDistrib, VrInfoDistrib, VrGravEletrDistrib, VrNomeExc, VrTribunal, VrProcuradoria, VrDefensoria, VrMutua, VrAcoterj, VrSubTotal, VrTotG);
      end
      else ReciboRec(Funcoes, False, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit2.Text), Trim(MaskEdit3.Text), Trim(Copy(ComboBox3.Text, 7, 50)), MaskEdit16.Text, Label37.Caption, '', '', CurrencyEdit3.Value, CurrencyEdit2.Value, VrEmolumentos, VrEmolAdicional, VrPag, VrViasExcedente, VrMicrofilme, VrDigitalizacao, VrInformatica, VrGravEletronica, VrConferencia,
                            VrDistrib, VrInfoDistrib, VrGravEletrDistrib, VrNomeExc, VrTribunal, VrProcuradoria, VrDefensoria, VrMutua, VrAcoterj, VrSubTotal, VrTotG);
//       Funcoes.ReciboTitulos(Funcoes, False, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit2.Text), Trim(MaskEdit3.Text), Trim(Copy(ComboBox3.Text, 7, 50)), MaskEdit16.Text, Label37.Caption, '', '', CurrencyEdit3.Value);
      ListBox1.Items.Add(Label3.Caption);
      Label3.Caption := '000000';
    end;
    BitBtn4.Enabled     := False;
    GroupBox1.Visible := True;
  end
  else ShowMessage('Recepção não gerada !');
  BitBtn2.SetFocus;
end;

procedure TF_RecepN.BitBtn2Click(Sender: TObject);
begin
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '', '') + 'PESSAUX';
  CriaTabela('PESSAUX', arq);
  Limpar_Tela(F_RecepN);
  MaskEdit2.SetFocus;
end;

procedure TF_RecepN.FormActivate(Sender: TObject);
begin
  BitBtn2Click(F_RecepN);
end;

procedure TF_RecepN.MaskEdit27Exit(Sender: TObject);
begin
  if (Label26.Caption <> 'C') then
  begin
    if (Procura_Pessoal('doc1', TirarTudo(MaskEdit27.Text, '.', '-', '/'))) then ComboBox7.SetFocus;
  end;
end;

procedure TF_RecepN.MaskEdit28Exit(Sender: TObject);
begin
  if (Label26.Caption = 'C') then
  begin
    if (Procura_Pessoal('doc2', Trim(MaskEdit28.Text))) then ComboBox7.SetFocus;
  end;
end;

procedure TF_RecepN.MaskEdit17Exit(Sender: TObject);
begin
  if (Label26.Caption <> 'C') then
  begin
    if Procura_Pessoal('nome', Trim(MaskEdit17.Text)) then ComboBox7.SetFocus;
  end;
end;

procedure TF_RecepN.ComboBox7Enter(Sender: TObject);
begin
  SendMessage(ComboBox7.handle, CB_SHOWDROPDOWN, Integer(True), 0);
  if (Trim(ComboBox7.Text) = '') then ComboBox7.Text := ComboBox7.Items.Strings[0];
end;

procedure TF_RecepN.ComboBox7KeyPress(Sender: TObject; var Key: Char);
var
  Found: boolean;
  i,SelSt: Integer;
  TmpStr: string;
begin
  if Key in ['a'..'z'] then Dec(Key,32);
  with (Sender as TComboBox) do
  begin
    SelSt := SelStart;
    if (Key = Chr(vk_Back)) and (SelLength <> 0) then
     TmpStr := Copy(Text,1,SelStart)+Copy(Text,SelLength+SelStart+1,255)
    else if Key = Chr(vk_Back) then
     TmpStr := Copy(Text,1,SelStart-1)+Copy(Text,SelStart+1,255)
    else TmpStr := Copy(Text,1,SelStart)+Key+Copy(Text,SelLength+SelStart+1,255);
    if TmpStr = '' then Exit;
    if (Key = Chr(vk_Back)) and (SelSt > 0) then
     Dec(SelSt)
    else if Key <> Chr(vk_Back) then Inc(SelSt);
    Key := #0;
    if SelSt = 0 then
    begin
      Text:= '';
      Exit;
    end;
    Found := False;
    for i := 1 to Items.Count do
      if UpperCase(Copy(Items[i-1],1,Length(TmpStr))) = UpperCase(TmpStr) then
      begin
        Text := Items[i-1];
        ItemIndex := i-1;
        Found := True;
        Break;
      end;
    if Found then
    begin
      SelStart := SelSt;
      SelLength := Length(Text)-SelSt;
    end
    else Beep;
  end;
end;

procedure TF_RecepN.Incluir1Click(Sender: TObject);
begin
  Limpa_TelaPessoal(F_RecepN);
  DbGrid1.Enabled   := False;
  ComboBox1.SetFocus;
end;

procedure TF_RecepN.Corrigir2Click(Sender: TObject);
begin
  DbGrid1.Enabled := False;
  Label33.Caption := 'C';
  Label36.Caption := Dm.PessAux.FieldByName('recno').asString;
  MaskEdit17.SetFocus;
end;

procedure TF_RecepN.Excluir1Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Confirma exclusão ?'), 'INCLUSÃO DE PARTES', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
  begin
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('DELETE FROM ' + arq);
    Dm.PessAux.Sql.Add('WHERE');
    Dm.PessAux.Sql.Add('recno = ' + Dm.PessAux.FieldByName('recno').asString);
    Dm.PessAux.ExecSql;
    Dm.PessAux.Close;
    Carrega_Pessoal(F_RecepN, True);
  end;
end;

procedure TF_RecepN.ComboBox3Enter(Sender: TObject);
begin
  SendMessage(ComboBox3.handle, CB_SHOWDROPDOWN, Integer(True), 0);
  if (Trim(ComboBox3.Text) = '') then ComboBox3.Text := ComboBox3.Items.Strings[0];
end;

procedure TF_RecepN.ComboBox4Enter(Sender: TObject);
begin
  SendMessage(ComboBox4.handle, CB_SHOWDROPDOWN, Integer(True), 0);
  if (Trim(ComboBox4.Text) = '') then ComboBox4.Text := ComboBox4.Items.Strings[0];
end;

procedure TF_RecepN.ComboBox5Enter(Sender: TObject);
begin
  SendMessage(ComboBox5.handle, CB_SHOWDROPDOWN, Integer(True), 0);
  if (Trim(ComboBox5.Text) = '') then ComboBox5.Text := ComboBox5.Items.Strings[0];
end;

procedure TF_RecepN.ComboBox6Enter(Sender: TObject);
begin
  SendMessage(ComboBox6.handle, CB_SHOWDROPDOWN, Integer(True), 0);
  if (Trim(ComboBox6.Text) = '') then ComboBox6.Text := ComboBox6.Items.Strings[0];
end;

procedure TF_RecepN.ComboBox3Exit(Sender: TObject);
var
  util : String;
  pz   : Integer;
begin
  if (Trim(ComboBox3.Text) <> '') then
  begin
    util := Copy(ComboBox3.Text, Length(ComboBox3.Text), 1);
    pz   := StrToInt(Copy(ComboBox3.Text, (Length(ComboBox3.Text) - 2), 2));
    if (util = 'N') then
    begin
      MaskEdit16.Text := DateToStr(Ver_DiaUtil(StrToDate(MaskEdit1.Text) + pz));
    end
    else MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), pz));
  end
  else MaskEdit16.Text := DateToStr(date);
end;

procedure TF_RecepN.ListBox1DblClick(Sender: TObject);
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT p_auxiliar, data_r, a_nome, a_endereco, natureza, contato');
  Dm.ArqAux.Sql.Add('data_entr, hora_p, deposito, v_emolumentos, v_emoladicional, v_pag,');
  Dm.ArqAux.Sql.Add('v_viaexc, v_mic, v_digitalizacao, v_informatica, v_graveletr,');
  Dm.ArqAux.Sql.Add('v_conferencia, v_distrib, v_infodistrib, v_graveletrdistrib, v_nome,');
  Dm.ArqAux.Sql.Add('v_tribunal, v_procuradoria, v_defensoria, v_mutua, v_acoterj, v_subtotal, v_total');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('p_auxiliar = ' + ListBox1.Items.Strings[ListBox1.ItemIndex]);
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then begin
    if (F_Menu.Label24.Caption = 'T') then begin
      Funcoes.ReciboTitulos(Funcoes, True,
                            Dm.ArqAux.FieldByName('data_r').asString,
                            Dm.ArqAux.FieldByName('p_auxiliar').asString,
                            Dm.ArqAux.FieldByName('a_nome').asString,
                            Dm.ArqAux.FieldByName('a_telefone').asString,
                            Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False),
                            Dm.ArqAux.FieldByName('data_entr').asString,
                            Dm.arqAux.FieldByName('hora_p').asString,
                            Dm.ArqAux.FieldByname('contato').asString,
                            '',
                            Dm.ArqAux.FieldByName('deposito').asCurrency,
                            Dm.ArqAux.FieldByName('v_emolumentos').asCurrency,
                            Dm.ArqAux.FieldByName('v_emoladicional').asCurrency,
                            Dm.ArqAux.FieldByName('v_pag').asCurrency,
                            Dm.ArqAux.FieldByName('v_viaexc').asCurrency,
                            Dm.ArqAux.FieldByName('v_mic').asCurrency,
                            Dm.ArqAux.FieldByName('v_digitalizacao').asCurrency,
                            Dm.ArqAux.FieldByName('v_informatica').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletr').asCurrency,
                            Dm.ArqAux.FieldByName('v_conferencia').asCurrency,
                            Dm.ArqAux.FieldByName('v_distrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_infodistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletrdistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_nome').asCurrency,
                            Dm.ArqAux.FieldByName('v_tribunal').asCurrency,
                            Dm.ArqAux.FieldByName('v_procuradoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_defensoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_mutua').asCurrency,
                            Dm.ArqAux.FieldByName('v_acoterj').asCurrency,
                            Dm.ArqAux.FieldByName('v_subtotal').asCurrency,
                            Dm.ArqAux.FieldByName('v_total').asCurrency);


                               //  emolumento, emoladicional, v_pag, via_excedente, microfilme, digitalizacao,
                               //  informatica, graveletronica, conferencia, distribuicao, infodistrib, graveletrdistrib,
                               //  nomesexc, tribunal, procuradoria, defensoria, mutua, acoterj, subtotal, total : Currency);


    end else begin
      Funcoes.ReciboTitulos(Funcoes, False, Dm.ArqAux.FieldByName('data_r').asString,
                            Dm.ArqAux.FieldByName('p_auxiliar').asString,
                            Dm.ArqAux.FieldByName('a_nome').asString,
                            Dm.ArqAux.FieldByName('a_endereco').asString,
                            Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False),
                            Dm.ArqAux.FieldByName('data_entr').asString,
                            Dm.arqAux.FieldByName('hora_p').asString,
                            Dm.ArqAux.FieldByname('contato').asString,
                            '',
                            Dm.ArqAux.FieldByName('deposito').asCurrency,
                            Dm.ArqAux.FieldByName('v_emolumentos').asCurrency,
                            Dm.ArqAux.FieldByName('v_emoladicional').asCurrency,
                            Dm.ArqAux.FieldByName('v_pag').asCurrency,
                            Dm.ArqAux.FieldByName('v_viaexc').asCurrency,
                            Dm.ArqAux.FieldByName('v_mic').asCurrency,
                            Dm.ArqAux.FieldByName('v_digitalizacao').asCurrency,
                            Dm.ArqAux.FieldByName('v_informatica').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletr').asCurrency,
                            Dm.ArqAux.FieldByName('v_conferencia').asCurrency,
                            Dm.ArqAux.FieldByName('v_distrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_infodistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletrdistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_nome').asCurrency,
                            Dm.ArqAux.FieldByName('v_tribunal').asCurrency,
                            Dm.ArqAux.FieldByName('v_procuradoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_defensoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_mutua').asCurrency,
                            Dm.ArqAux.FieldByName('v_acoterj').asCurrency,
                            Dm.ArqAux.FieldByName('v_subtotal').asCurrency,
                            Dm.ArqAux.FieldByName('v_total').asCurrency);
    end;
  end;
  Dm.ArqAux.Close;
end;

procedure TF_RecepN.CurrencyEdit3Exit(Sender: TObject);
begin
  Application.CreateForm(TF_Dep1, F_Dep1);
  F_Dep1.ShowModal;
  CurrencyEdit4.Value := F_Dep1.CurrencyEdit1.Value;
  CurrencyEdit5.Value := F_Dep1.CurrencyEdit2.Value;
  CurrencyEdit6.Value := F_Dep1.CurrencyEdit3.Value;
  CurrencyEdit3.Value := F_Dep1.CurrencyEdit4.Value;
  Label35.Caption     := F_Dep1.MaskEdit1.Text;
  F_Dep1.Destroy;
  F_Dep1 := NIL;
end;

end.
