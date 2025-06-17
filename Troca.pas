unit Troca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, ToolEdit, CurrEdit, jpeg;

type
  TF_Troca = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel3: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    Label16: TLabel;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    SpeedButton1: TSpeedButton;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label17: TLabel;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    Label18: TLabel;
    Label19: TLabel;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
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
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Limpa_Tela(Sender : TOBject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Troca: TF_Troca;
  prot : String;

implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Troca.Limpa_Tela(Sender : TOBject);
begin
  label3.caption := '';
  label5.caption := '';
  label7.caption := '';
  label9.caption := '';
  maskedit1.text := '';
  maskedit2.text := '';
  maskedit3.text := '';
  maskedit4.text := '';
  maskedit5.text := '';
  maskedit6.text := '';
  maskedit7.text := '';
  maskedit8.text := '';
  maskedit9.text := '';
end;

procedure TF_Troca.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_Troca.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Troca.BitBtn2Click(Sender: TObject);
begin
  Limpa_Tela(F_Troca);
  Panel3.Enabled    := False;
  MaskEdit1.Enabled := True;
  MaskEdit1.SetFocus;
end;

procedure TF_Troca.BitBtn1Click(Sender: TObject);
begin
  if (Trim(MaskEdit1.Text) = '') then
  begin
    MessageBox(Handle, PChar('Protocolo auxiliar inválido.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
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
    MessageBox(Handle, PChar('Protocolo auxiliar não localizado.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
    BitBtn2Click(F_Troca);
    Exit;
  end;
  Label3.caption      := Dm.Td.FieldByName('status').asstring;
  Label5.caption      := Dm.Td.FieldByName('data_r').asstring;
  Label7.caption      := Dm.Td.FieldByName('a_nome').asstring;
  Label9.caption      := Ver_Natureza(Dm.Td.FieldByName('natureza').asstring, False);
  Maskedit2.text      := Dm.Td.FieldByName('p_auxiliar').asstring;
  Maskedit4.text      := Dm.Td.FieldByName('protocolo').asstring;
  Maskedit8.text      := Dm.Td.FieldByName('registro').asstring;
  Maskedit6.text      := Dm.Td.FieldByName('data_r').asstring;
  CurrencyEdit1.Value := Dm.Td.FieldByName('deposito').asCurrency;
  Maskedit10.text     := Dm.Td.FieldByName('daje').asstring;
  Maskedit8.text      := Dm.Td.FieldByName('dajepost').asstring;
  Maskedit14.text     := Dm.Td.FieldByName('dajevias').asstring;
  Maskedit12.text     := Dm.Td.FieldByName('data_p').asstring;  
  Dm.Td.Close;
  Panel3.Enabled := True;
  MaskEdit3.SetFocus;
end;

procedure TF_Troca.BitBtn5Click(Sender: TObject);
begin
  Panel1.enabled := True;
  Panel2.enabled := True;
  Panel3.visible := False;
  bitbtn3.setfocus;
end;

procedure TF_Troca.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_Troca.BitBtn5Click(F_Troca);
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_Troca.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_Troca.BitBtn5Click(F_Troca);
  if key = 13 then maskedit5.setfocus;
end;

procedure TF_Troca.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_Troca.BitBtn5Click(F_Troca);
  if key = 13 then maskedit5.setfocus;
end;

procedure TF_Troca.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_Troca.BitBtn5Click(F_Troca);
  if key = 13 then maskedit7.setfocus;
end;

procedure TF_Troca.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_Troca.BitBtn5Click(F_Troca);
  if key = 13 then maskedit7.setfocus;
end;

procedure TF_Troca.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_Troca.BitBtn5Click(F_Troca);
  if key = 13 then MaskEdit13.SetFocus;
end;

procedure TF_Troca.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit15.setfocus;
end;

procedure TF_Troca.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit2.SetFocus;
end;

procedure TF_Troca.CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit11.SetFocus;
end;

procedure TF_Troca.SpeedButton1Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Iniciar rotina de troca ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDNo) then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - CANCELADA EXECUÇÃO DA ROTINA DE TROCA.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
    BitBtn2Click(F_Troca);
    Exit;
  end;
  // Troca do protocolo oficial
  if (Trim(MaskEdit5.Text) <> '') AND (ValidNumero(MaskEdit5.Text)) then
  begin
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT protocolo FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('protocolo = ' + Trim(MaskEdit5.Text));
    Dm.Td.Open;
    if (Dm.Td.RecordCount <> 0) then
    begin
      Dm.Td.Close;
      MessageBox(Handle, PChar('ATENÇÃO - PROTOCOLO OFICIAL ENCONTRADO.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('OPÇÃO DE TROCA INVÁLIDA.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      Exit;
    end;
    Dm.Td.Close;
    // Tabela TD
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td SET');
    Dm.ArqAux.Sql.Add('  protocolo = ' + Trim(MaskEdit5.Text));
    Dm.ArqAux.Sql.Add(', registro = ' + Trim(MaskEdit5.Text));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do protocolo oficial nº ' + Trim(MaskEdit4.Text) + ' para o protocolo oficial nº ' + Trim(MaskEdit5.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do protocolo oficial nº ' + Trim(MaskEdit4.Text) + ' para o protocolo oficial nº ' + Trim(MaskEdit5.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
    end;
    //Tabela Td_Pesso
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td_pesso SET');
    Dm.ArqAux.Sql.Add('protocolo = ' + Trim(MaskEdit5.Text));
    Dm.ArqAux.Sql.Add(', registro = ' + Trim(MaskEdit5.Text));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do protocolo oficial nº ' + Trim(MaskEdit4.Text) + ' para o protocolo oficial nº ' + Trim(MaskEdit5.Text) + '(TABELA TD_PESSO).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do protocolo oficial nº ' + Trim(MaskEdit4.Text) + ' para o protocolo oficial nº ' + Trim(MaskEdit5.Text) + '(TABELA TD_PESSO).', Trim(MaskEdit1.Text));
    end;
    //Tabela TD_Cert
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td_cert SET');
    Dm.ArqAux.Sql.Add('protocolo = ' + Trim(MaskEdit5.Text));
    Dm.ArqAux.Sql.Add(', registro = ' + Trim(MaskEdit5.Text));    
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));

    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do protocolo oficial nº ' + Trim(MaskEdit4.Text) + ' para o protocolo oficial nº ' + Trim(MaskEdit5.Text) + '(TABELA TD_CERT).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do protocolo oficial nº ' + Trim(MaskEdit4.Text) + ' para o protocolo oficial nº ' + Trim(MaskEdit5.Text) + '(TABELA TD_CERT).', Trim(MaskEdit1.Text));
    end;
  end;
  //troca do nº do microfilme(registro)
  //Não usa microfilme na Bahia
  {if (Trim(MaskEdit9.Text) <> '') AND (ValidNumero(MaskEdit9.Text)) then
  begin
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT registro FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('registro = ' + Trim(MaskEdit9.Text));
    Dm.Td.Open;
    if (Dm.Td.RecordCount <> 0) then
    begin
      Dm.Td.Close;
      MessageBox(Handle, PChar('ATENÇÃO - Nº DE MICROFILME ENCONTRADO.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('OPÇÃO DE TROCA INVÁLIDA.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      Exit;
    end;
    // Tabela TD
    Dm.Td.Close;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td SET');
    Dm.ArqAux.Sql.Add('registro = ' + Trim(MaskEdit9.Text));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do microfilme nº ' + Trim(MaskEdit4.Text) + ' para o microfilme nº ' + Trim(MaskEdit9.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do microfilme nº ' + Trim(MaskEdit8.Text) + ' para o microfilme nº ' + Trim(MaskEdit9.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
    end;
    //Tabela Td_Pesso
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td_pesso SET');
    Dm.ArqAux.Sql.Add('registro = ' + Trim(MaskEdit9.Text));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do microfilme nº ' + Trim(MaskEdit4.Text) + ' para o microfilme nº ' + Trim(MaskEdit9.Text) + '(TABELA TD_PESSO).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do microfilme nº ' + Trim(MaskEdit8.Text) + ' para o microfilme nº ' + Trim(MaskEdit9.Text) + '(TABELA TD_PESSO).', Trim(MaskEdit1.Text));
    end;
    //Tabela TD_Cert
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td_cert SET');
    Dm.ArqAux.Sql.Add('registro = ' + Trim(MaskEdit9.Text));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do microfilme nº ' + Trim(MaskEdit4.Text) + ' para o microfilme nº ' + Trim(MaskEdit9.Text) + '(TABELA TD_CERT).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do microfilme nº ' + Trim(MaskEdit8.Text) + ' para o microfilme nº ' + Trim(MaskEdit9.Text) + '(TABELA TD_CERT).', Trim(MaskEdit1.Text));
    end;
  end;}

  // troca da data de recepção
  if (ValidData(MaskEdit7.Text)) then
  begin
    // Tabela TD
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td SET');
    Dm.ArqAux.Sql.Add('data_r = ' + Chr(39) + ConvData(MaskEdit7.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca da data de recepção do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + Trim(MaskEdit6.Text) + ' para a data ' + Trim(MaskEdit7.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca da data de recepção do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + Trim(MaskEdit6.Text) + ' para a data ' + Trim(MaskEdit7.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
    end;
      //Tabela Td_Pesso
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td_pesso SET');
    Dm.ArqAux.Sql.Add('data  = ' + Chr(39) + ConvData(MaskEdit7.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca da data de recepção do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + Trim(MaskEdit6.Text) + ' para a data ' + Trim(MaskEdit7.Text) + '(TABELA TD_PESSO).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca da data de recepção do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + Trim(MaskEdit6.Text) + ' para a data ' + Trim(MaskEdit7.Text) + '(TABELA TD_PESSO).', Trim(MaskEdit1.Text));
    end;
    //Tabela TD_Cert
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td_cert SET');
    Dm.ArqAux.Sql.Add('data_r = ' + Chr(39) + ConvData(MaskEdit7.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca da data de recepção do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + Trim(MaskEdit6.Text) + ' para a data ' + Trim(MaskEdit7.Text) + '(TABELA TD_CERT).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca da data de recepção do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + Trim(MaskEdit6.Text) + ' para a data ' + Trim(MaskEdit7.Text) + '(TABELA TD_CERT).', Trim(MaskEdit1.Text));
    end;
  end;
  // troca do valor do depósito
  if (CurrencyEdit2.Value > 0) then
  begin
    // Tabela TD
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td SET');
    Dm.ArqAux.Sql.Add('deposito = ' + StrCurrPesq(CurrencyEdit2.Value));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Trocado valor do depósito do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + CurrencyEdit1.DisplayText  + ' para ' + CurrencyEdit2.DisplayText + '(TABELA TD).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do valor do depósito do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + CurrencyEdit1.DisplayText  + ' para ' + CurrencyEdit2.DisplayText + '(TABELA TD).', Trim(MaskEdit1.Text));
    end;
  end;
  // ATENÇÃO - esta deve ser a Última rotina a ser executada
  // Troca do protocolo auxiliar
  if (Trim(MaskEdit3.Text) <> '') AND (ValidNumero(MaskEdit3.Text)) then
  begin
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT p_auxiliar FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit3.Text));
    Dm.Td.Open;
    if (Dm.Td.RecordCount <> 0) then
    begin
      Dm.Td.Close;
      MessageBox(Handle, PChar('ATENÇÃO - PROTOCOLO AUXILIAR ENCONTRADO.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('OPÇÃO DE TROCA INVÁLIDA.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      Exit;      
    end;
    Dm.Td.Close;    
    // Tabela TD
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td SET');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit3.Text));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' para o protocolo auxiliar nº ' + Trim(MaskEdit3.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' para o protocolo auxiliar nº ' + Trim(MaskEdit3.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
    end;
    //Tabela Td_Pesso
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td_pesso SET');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit3.Text));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' para o protocolo auxiliar nº ' + Trim(MaskEdit3.Text) + '(TABELA TD_PESSO).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' para o protocolo auxiliar nº ' + Trim(MaskEdit3.Text) + '(TABELA TD_PESSO).', Trim(MaskEdit1.Text));
    end;
    //Tabela TD_Cert
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td_cert SET');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit3.Text));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' para o protocolo auxiliar nº ' + Trim(MaskEdit3.Text) + '(TABELA TD_CERT).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' para o protocolo auxiliar nº ' + Trim(MaskEdit3.Text) + '(TABELA TD_CERT).', Trim(MaskEdit1.Text));
    end;
  end;
  If ValidNumero(MaskEdit11.Text) then
  Begin
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT p_auxiliar FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('daje = ' + QuotedStr(Trim(MaskEdit11.Text)));
    Dm.Td.Open;
    if (Dm.Td.RecordCount <> 0) then
    begin
      Dm.Td.Close;
      MessageBox(Handle, PChar('ATENÇÃO - DAJE ENCONTRADO.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('OPÇÃO DE TROCA INVÁLIDA.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      Exit;      
    end
    else
    begin
      // Tabela TD
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('UPDATE td SET');
      Dm.ArqAux.Sql.Add('daje = ' + QuotedStr(Trim(MaskEdit11.Text)));
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
      try
        Dm.ArqAux.ExecSql;

        DM.Selos.Close;
        DM.Selos.Sql.Clear;
        DM.Selos.Sql.Add('SELECT * FROM selos WHERE recibo = ' + QuotedStr(MaskEdit1.Text));
        DM.Selos.Open;
        if DM.Selos.RecordCount = 0 then
        begin
          showmessage('Protocolo não localizado.');
          DM.Selos.Close;
          Exit;
        end
        else
        begin
          Dm.ArqAux.Close;
          Dm.ArqAux.Sql.Clear;
          Dm.ArqAux.Sql.Add('UPDATE selos SET');
          Dm.ArqAux.Sql.Add(' daje        = ' + QuotedStr(Trim(MaskEdit11.Text)));
          if Trim(MaskEdit3.Text) <> '' then
            Dm.ArqAux.Sql.Add(', recibo   = ' + QuotedStr(MaskEdit3.Text));
          if Trim(MaskEdit5.Text) <> '' then
            Dm.ArqAux.Sql.Add(', registro = ' + QuotedStr(MaskEdit5.Text));
          if (ValidData(MaskEdit7.Text)) then
            Dm.ArqAux.Sql.Add(', data     = ' + QuotedStr(ConvData(MaskEdit7.Text)));
          Dm.ArqAux.Sql.Add(' WHERE id    = ' + Dm.Selos.FieldByName('id').AsString);
          Dm.ArqAux.ExecSQL;
        end;

        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do DAJE nº ' + Trim(MaskEdit10.Text) + ' para o DAJE nº ' + Trim(MaskEdit11.Text) + '(TABELA TD).', Trim(MaskEdit11.Text));
      except
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do DAJE nº ' + Trim(MaskEdit10.Text) + ' para o DAJE nº ' + Trim(MaskEdit11.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
      end;
    END;
  End;

  If ValidNumero(MaskEdit9.Text) then
  Begin
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT p_auxiliar FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('dajepost = ' + QuotedStr(Trim(MaskEdit9.Text)));
    Dm.Td.Open;
    if (Dm.Td.RecordCount <> 0) then
    begin
      Dm.Td.Close;
      MessageBox(Handle, PChar('ATENÇÃO - DAJE ENCONTRADO.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('OPÇÃO DE TROCA INVÁLIDA.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      Exit;      
    end
    else
    begin
      // Tabela TD
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('UPDATE td SET');
      Dm.ArqAux.Sql.Add('dajepost = ' + QuotedStr(Trim(MaskEdit9.Text)));
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
      try
        Dm.ArqAux.ExecSql;

        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do DAJE de Postagem nº ' + Trim(MaskEdit8.Text) + ' para o DAJE de Postagem nº ' + Trim(MaskEdit9.Text) + '(TABELA TD).', Trim(MaskEdit9.Text));
      except
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do DAJE de Postagem nº ' + Trim(MaskEdit8.Text) + ' para o DAJE de Postagem nº ' + Trim(MaskEdit9.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
      end;
    END;
  End;
  If ValidNumero(MaskEdit15.Text) then
  Begin
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT p_auxiliar FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('dajevias = ' + QuotedStr(Trim(MaskEdit15.Text)));
    Dm.Td.Open;
    if (Dm.Td.RecordCount <> 0) then
    begin
      Dm.Td.Close;
      MessageBox(Handle, PChar('ATENÇÃO - DAJE ENCONTRADO.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('OPÇÃO DE TROCA INVÁLIDA.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
      Exit;      
    end
    else
    begin
      // Tabela TD
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('UPDATE td SET');
      Dm.ArqAux.Sql.Add('dajevias = ' + QuotedStr(Trim(MaskEdit15.Text)));
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
      try
        Dm.ArqAux.ExecSql;

        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca do DAJE de Vias Adicionais nº ' + Trim(MaskEdit14.Text) + ' para o DAJE de Vias Adicionais nº ' + Trim(MaskEdit15.Text) + '(TABELA TD).', Trim(MaskEdit15.Text));
      except
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do DAJE de Vias Adicionais nº ' + Trim(MaskEdit14.Text) + ' para o DAJE de Vias Adicionais nº ' + Trim(MaskEdit15.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
      end;
    END;
  End;

  // troca da data de registro
  if (ValidData(MaskEdit13.Text)) then
  begin
    // Tabela TD
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td SET');
    Dm.ArqAux.Sql.Add('data_p = ' + Chr(39) + ConvData(MaskEdit13.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca da data de registro do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + Trim(MaskEdit12.Text) + ' para a data ' + Trim(MaskEdit13.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca da data de registro do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + Trim(MaskEdit12.Text) + ' para a data ' + Trim(MaskEdit13.Text) + '(TABELA TD).', Trim(MaskEdit1.Text));
    end;
    //Tabela TD_Cert
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td_cert SET');
    Dm.ArqAux.Sql.Add('data_p = ' + Chr(39) + ConvData(MaskEdit13.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Troca da data de registro do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + Trim(MaskEdit12.Text) + ' para a data ' + Trim(MaskEdit13.Text) + '(TABELA TD_CERT).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Problemas para efetuar a troca da data de registro do protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ' de ' + Trim(MaskEdit12.Text) + ' para a data ' + Trim(MaskEdit13.Text) + '(TABELA TD_CERT).', Trim(MaskEdit1.Text));
    end;
  end;
  ShowMessage('Fim das Trocas');
  BitBtn2.SetFocus;
end;

procedure TF_Troca.FormActivate(Sender: TObject);
begin
  Limpa_Tela(F_Troca);
  MaskEdit1.SetFocus;
end;

procedure TF_Troca.MaskEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit9.SetFocus;
end;

procedure TF_Troca.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit11.SetFocus;
end;

procedure TF_Troca.MaskEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit2.setfocus;
end;

procedure TF_Troca.MaskEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then SpeedButton1.Click;
end;

end.
