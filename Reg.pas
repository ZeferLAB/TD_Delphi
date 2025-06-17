unit Reg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Mask, Buttons, ExtCtrls, ToolEdit, CurrEdit, Grids,
  DBGrids, jpeg;

type
  TF_Reg = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    GroupBox1: TGroupBox;
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
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label20: TLabel;
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
    Bevel4: TBevel;
    Bevel5: TBevel;
    DBGrid1: TDBGrid;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit9: TMaskEdit;
    Label23: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Carrega(Sender : TObject);
    Procedure Limpar(Sender : TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9Exit(Sender: TObject);
    procedure MaskEdit6Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Reg: TF_Reg;

implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Reg.Carrega(Sender : TObject);
begin

  Maskedit10.text := Dm.td.fieldbyname('a_nome').asstring;
  Maskedit11.text := Dm.td.fieldbyname('a_endereco').asstring;
  Maskedit12.text := Dm.td.fieldbyname('a_bairro').asstring;
  Maskedit13.text := Dm.td.fieldbyname('a_cidade').asstring;
  Maskedit14.text := Dm.td.fieldbyname('a_estado').asstring;
  Maskedit15.text := Dm.td.fieldbyname('a_telefone').asstring;
  Maskedit16.text := Dm.td.fieldbyname('a_cep').asstring;
  label4.Visible  := true;
  Label4.caption  := Dm.td.fieldbyname('status').asstring;

  ComboBox3.Text      := Ver_Natureza(Dm.Td.FieldByName('natureza').asstring, True);
  ComboBox4.Text      := Def_Lan(Dm.Td.FieldByName('lancamento').asstring, True);
  ComboBox5.Text      := Def_Tab(Dm.Td.FieldByName('tabela').asstring, True);
  ComboBox6.Text      := Def_Div(Dm.Td.FieldByName('divisor').asstring, True);
  MaskEdit24.Text     := Dm.Td.FieldByName('qtde_nome').asString;
  Label35.Caption     := ''; //'R$ ' + StrCurr(Dm.Td.FieldByName('v_conducao').ascurrency, 14, True);
  Label42.Caption     := 'R$ ' + StrCurr(Dm.Td.FieldByName('v_adc').ascurrency, 14, True);
  Label40.Caption     := 'R$ ' + StrCurr(Dm.Td.FieldByName('v_pag').ascurrency, 14, True);
  Label34.caption     := 'R$ ' + StrCurr(Dm.Td.FieldByName('v_mic').ascurrency, 14, True);
  MaskEdit7.Text      := Dm.Td.FieldByName('microfilme').asString;
  MaskEdit8.Text      := Dm.Td.FieldByName('pag_adic').asString;
  MaskEdit26.Text     := Dm.Td.FieldByName('vias_adc').asString;

  CurrencyEdit1.Value := Dm.Td.FieldByName('valor_base').ascurrency;
  CurrencyEdit3.value := Dm.Td.FieldByName('deposito').ascurrency;
  CurrencyEdit2.Value := Dm.Td.FieldByName('custas').ascurrency;

  maskedit3.text      := Dm.Td.FieldByName('anotacao').asstring;
  maskedit5.text      := Dm.Td.FieldByName('contrato').asstring;
  maskedit9.text      := Dm.Td.FieldByName('qtde_eti').asstring;
  maskedit6.text      := Dm.Td.FieldByName('mod_eti').asstring;

  Label23.Caption     := Dm.Td.FieldByName('data_r').asString;
  if Dm.Td.FieldByName('daje').asString = '' then Label28.Caption := '' else Label28.Caption := Dm.Td.FieldByName('daje').asString;
end;

procedure TF_Reg.Limpar(Sender : TObject);
begin

  Maskedit10.Text := '';
  Maskedit11.Text := '';
  Maskedit12.Text := '';
  Maskedit13.Text := '';
  Maskedit14.Text := '';
  Maskedit15.Text := '';
  Maskedit16.Text := '';

//  Label4.Visible  := False;

  ComboBox3.Text      := '';
  ComboBox4.Text      := '';
  ComboBox5.Text      := '';
  ComboBox6.Text      := '';
  MaskEdit24.Text     := '';
  Label35.Caption     := '';
  Label42.Caption     := '';
  Label40.Caption     := '';
  Label34.caption     := '';
  MaskEdit7.Text      := '';
  MaskEdit8.Text      := '';
  MaskEdit26.Text     := '';

  CurrencyEdit1.Value := 0;
  CurrencyEdit3.value := 0;
  CurrencyEdit2.Value := 0;

  maskedit3.text      := '';
  maskedit5.text      := '';
  maskedit6.text      := '';
  maskedit9.text      := '';

  Dm.PessAux.Close;
end;

procedure TF_Reg.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Reg.BitBtn2Click(Sender: TObject);
begin
  Limpar(F_Reg);
  if (maskedit1.Text <> '0') or (maskedit1.text <> '') then maskedit1.Text := inttostr(strtoint(maskedit1.text) + 1);
  MaskEdit1.SetFocus;
end;

procedure TF_Reg.BitBtn1Click(Sender: TObject);
begin
  if (not ValidData(MaskEdit2.Text)) then
  begin
    MessageBox(Handle, PChar('Data de baixa inválida !'), 'BAIXA NORMAL', MB_OK + MB_ICONWARNING);
    MaskEdit2.SetFocus;
    Exit;
  end;
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('Protocolo Auxiliar inválido !'), 'BAIXA NORMAL', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Td.Close;
  Dm.Td.Sql.Clear;
  Dm.Td.Sql.Add('SELECT * FROM td');
  Dm.Td.Sql.Add('WHERE');
  Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
  Dm.Td.Open;
  if (Dm.Td.RecordCount = 0) then
  begin
    Dm.Td.Close;
    MessageBox(Handle, PChar('Protocolo não encontrado !'), 'BAIXA NORMAL', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.PessAux.Close;
  Dm.PessAux.Sql.Clear;
  Dm.PessAux.Sql.Add('SELECT * FROM td_pesso');
  Dm.PessAux.Sql.Add('WHERE');
  Dm.PessAux.Sql.Add('p_auxililar = ' + Trim(MaskEdit1.Text));
  Dm.PessAux.Open;
  if (Dm.PessAux.RecordCount = 0) then
  begin
    Dm.PessAux.Close;
    MessageBox(Handle, PChar('Pessoal não encontrado !'), 'BAIXA NORMAL', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Carrega(F_Reg);
  dm.ArqAux.Close;
  dm.ArqAux.sql.Clear;
  dm.ArqAux.sql.add('select count(p_auxiliar) as qtde from td_pesso where p_auxiliar = ' + MaskEdit1.Text);
  dm.ArqAux.Open;

  if (dm.arqaux.FieldByName('qtde').AsString < MaskEdit24.Text) or (dm.arqaux.FieldByName('qtde').AsString > MaskEdit24.Text) then
  begin
    Application.MessageBox('Quantidade de Nomes Incluso não esta de acordo com os nomes Informados!', 'Mensagem do Sistema', mb_ok);
    exit;
  end;
  UpDateWindow(Handle);
  if (Trim(Dm.td.fieldbyname('status').asstring) <> 'RECEPCAO') and (Trim(Dm.td.fieldbyname('status').asstring) <> 'EXAME') then
  Begin
    MessageBox(Handle, PChar('Título baixado como ' + Dm.Td.fieldbyname('status').asstring + '. Para efetuar a baixa o título o mesmo deve estar em EXAME'), 'REGISTRO NORMAL', MB_OK + MB_ICONWARNING);
    Dm.Td.Close;
    MaskEdit1.SetFocus;
    Exit;
  end
  else
  begin
    maskedit3.setfocus;

    {if MessageBox(Handle, PChar('Confirma Baixa de PRONTO ?'), 'BAIXA NORMAL', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes then
    Begin
      protocolooficial := '';
      microfilme       := '';
      if (Dm.Td.fieldbyname('protocolo').asInteger = 0) then
      begin
         gerarprotocolooficial;
      end
      else
      begin
        protocolooficial := Dm.Td.fieldbyname('protocolo').asstring;
        microfilme       := Dm.Td.fieldbyname('registro').asstring;
      end;
      BaixaProt(MaskEdit1.Text, 'T', 'PRONTO', MaskEdit2.Text, protocolooficial, microfilme,'');
      Label4.Visible := True;
      Label4.caption := 'PRONTO';
    end
    else
    begin
      Dm.Td.Close;
      BitBtn2Click(F_Reg);
      Exit;
    end; }
  end;
//  BitBtn2Click(F_Reg);

end;

procedure TF_Reg.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_Reg.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_Reg.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit5.setfocus;
end;

procedure TF_Reg.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit6.setfocus;
end;

procedure TF_Reg.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit9.setfocus;
end;

procedure TF_Reg.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  protocolooficial, microfilme, certifica, rl1 : String;
  fora : boolean;
begin
  if key = 13 then
  begin
    if MessageBox(Handle, PChar('Confirma o REGISTRO ?'), 'BAIXA NORMAL', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes then
    Begin
      protocolooficial := Dm.Td.FieldByName('protocolo').asString;
      microfilme       := '';
      certifica        := '';
      rl1              := '';
      fora             := false;
      ncert            := '';
      if (Dm.Td.fieldbyname('registro').asInteger = 0) then
      begin
        if (Dm.Td.FieldByName('natureza').asInteger = 197)or(Dm.Td.FieldByName('natureza').asInteger = 300) then
        begin
          //Verificando qual região do cep
         { Dm.ArqAux.Close;
          Dm.ArqAux.Sql.Clear;
          Dm.ArqAux.Sql.Add('SELECT cep FROM td_pesso');
          Dm.ArqAux.Sql.Add('WHERE p_auxiliar = ' + Dm.Td.FieldByName('p_auxiliar').asString);
          Dm.ArqAux.Sql.Add('AND situacao     = "D"');
          Dm.ArqAux.Open;
          if Dm.ArqAux.recordcount <> 0 then
          begin
            if strtoint(copy(Dm.ArqAux.fieldbyname('cep').asstring,1,1)) < 2 then fora := false else fora := true;
          end;
          Dm.ArqAux.Close; }
          GerarSequencias(True, Fora, False, False, False, False, 0);
          rl1              := digi(NRL);
          certifica        := NCert;
          microfilme       := NMicro;
          protocolooficial := NMicro;
        end
        else
        begin
          if (Dm.Td.FieldByName('natureza').asInteger = 96) then
          begin
            GerarSequencias(False, Fora, True, False, False, False, 0);
            microfilme       := NMicro;
            certifica        := NCert;
            protocolooficial := NMicro;
          end
          else
          begin
            if (dm.td.FieldByName('tabela').AsString = '1003A') or (dm.td.FieldByName('tabela').AsString = '1003B') then
              GerarSequencias(False, Fora, False, False, True, False, 0)
            else
              GerarSequencias(False, Fora, False, False, False, False, 0);
            microfilme       := NMicro;
            protocolooficial := NMicro;
            certifica        := Trim(MaskEdit3.Text);
          end;
        end;
      end
      else
      begin
        protocolooficial := Dm.Td.fieldbyname('protocolo').asstring;
        rl1              := Dm.Td.FieldByName('rl').asString;
        certifica        := Dm.Td.FieldByName('anotacao').asString;
        microfilme       := Dm.Td.FieldByName('registro').asString;
      end;
      BaixaProt(Label23.Caption, MaskEdit1.Text, 'T', 'PRONTO', MaskEdit2.Text, protocolooficial, microfilme, rl1, Trim(MaskEdit5.Text), certifica, Trim(MaskEdit9.Text), Trim(MaskEdit6.Text), Trim(MaskEdit2.Text), trim(MaskEdit3.Text),'','', Trim(MaskEdit26.Text),'','','','',label28.Caption,'');
      if (Trim(rl1) <> '') then AppendaCodigoRL(rl1, microfilme, certifica, ConvData(MaskEdit2.Text), '11');
      Label4.Visible := True;
      Label4.caption := 'REGISTRADO SOB O N. ' + microfilme;
      BitBtn2.SetFocus;
    end
    else
    begin
      Dm.Td.Close;
      BitBtn2Click(F_Reg);
      Exit;
    end;
    Bitbtn2.SetFocus;
  end;
end;

procedure TF_Reg.MaskEdit9Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit9.Text)) then MaskEdit9.Text := '0';
end;

procedure TF_Reg.MaskEdit6Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit6.Text)) then MaskEdit6.Text := '0';
end;

end.
