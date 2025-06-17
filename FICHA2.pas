unit ficha2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids, Printers, DBCtrls,
  jpeg;

type
  TF_Fich2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Label13: TLabel;
    MaskEdit13: TMaskEdit;
    BitBtn4: TBitBtn;
    ComboBox1: TComboBox;
    MaskEdit27: TMaskEdit;
    Label2: TLabel;
    MaskEdit12: TMaskEdit;
    Label14: TLabel;
    MaskEdit14: TMaskEdit;
    Label15: TLabel;
    ComboBox2: TComboBox;
    SpeedButton1: TSpeedButton;
    MaskEdit15: TMaskEdit;
    Label16: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    ComboBox3: TComboBox;
    MaskEdit16: TMaskEdit;
    Label17: TLabel;
    MaskEdit17: TMaskEdit;
    Label18: TLabel;
    MaskEdit18: TMaskEdit;
    Label19: TLabel;
    MaskEdit19: TMaskEdit;
    Label20: TLabel;
    ComboBox9: TComboBox;
    procedure BitBtn8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
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
    procedure MaskEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Gravar(Sender : TOBject; Modo : Integer);
    Procedure Carregar(Sender : TOBject; Pesquisa : Boolean);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit13Exit(Sender: TObject);
    Procedure Busca_Cliente(Sender : TObject);
    procedure MaskEdit12Exit(Sender: TObject);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MaskEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Fich2: TF_Fich2;
  empant : String;

implementation

uses DMTD, Menu, PesqEsc, clientes, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Fich2.Busca_Cliente(Sender : TObject);
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM escrit');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('codigo = ' + MaskEdit13.Text);
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    MaskEdit2.Text := Dm.ArqAux.FieldByName('escritorio').asString;
    MaskEdit3.Text := Busca_Codigo('escrit', 'cod_ag');     
  end
  else
  begin
    ShowMessage('CLIENTE NÃO ENCONTRADO !');
    MaskEdit3.Text := '1';
  end;  
  Dm.ArqAux.Close;
end;

Procedure TF_Fich2.Gravar(Sender : TOBject; Modo : Integer);
begin
  if (not ValidNumero(Copy(ComboBox2.Text, 1,3))) then
  begin
    ShowMessage('Código de cliente inválido - Gravação abortada !');
    ComboBox2.SetFocus;
    Exit;
  end;
  if (Modo = 0) then
  begin
    Dm.Escrit.Close;
    Dm.Escrit.Sql.Clear;
    Dm.Escrit.Sql.Add('SELECT * FROM escrit');
    Dm.Escrit.Sql.Add('WHERE');
    Dm.Escrit.Sql.Add('    codigo     = ' + Trim(MaskEdit13.Text));
    Dm.Escrit.Sql.Add('AND escritorio = ' + Chr(39) + Trim(MaskEdit2.Text) + Chr(39));
    Dm.Escrit.Sql.Add('AND agencia    = ' + Chr(39) + Trim(MaskEdit4.Text) + Chr(39));
    Dm.Escrit.Open;
    if (Dm.Escrit.RecordCount <> 0) then
    begin
      MessageBox(Handle, PChar('ATENÇÃO - EMPRESA/FILIAL JÁ CADASTRADA !'), 'INCLUSÃO', MB_OK + MB_ICONWARNING);
      Carregar(F_Fich2, False);
      Exit;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Inclusa a empresa ' + Trim(MaskEdit2.Text), '0');
    Dm.Escrit.Append;
  end
  else Dm.Escrit.Edit;
  Dm.Escrit.FieldByName('codigo').asInteger    := StrToInt(MaskEdit13.Text);
  Dm.Escrit.FieldByName('maladireta').asString := Trim(MaskEdit1.Text);
  Dm.Escrit.FieldByName('escritorio').asString := Trim(MaskEdit2.Text);
  Dm.Escrit.FieldByName('ncliente').asInteger  := StrToInt(Copy(ComboBox2.Text, 1,3));
  Dm.Escrit.FieldByName('tip_doc').asString    := Trim(ComboBox1.Text);
  Dm.Escrit.FieldByName('doc').asString        := TirarTudo(MaskEdit27.Text, '.', '/', '-');
  Dm.Escrit.FieldByName('agencia').asString    := Trim(MaskEdit4.Text);
  Dm.Escrit.FieldByName('endereco').asString   := Trim(MaskEdit5.Text);
  Dm.Escrit.FieldByName('bairro').asString     := Trim(MaskEdit6.Text);
  Dm.Escrit.FieldByName('cep').asString        := TirarTudo(MaskEdit7.Text, '-', '','');
  Dm.Escrit.FieldByName('cidade').asString     := Trim(MaskEdit8.Text);
  Dm.Escrit.FieldByName('estado').asString     := Trim(MaskEdit9.Text);
  Dm.Escrit.FieldByName('tel').asString        := Trim(MaskEdit10.Text);
  Dm.Escrit.FieldByName('fax').asString        := Trim(MaskEdit11.Text);
  Dm.Escrit.FieldByName('cod_mod').asInteger   := StrToInt(MaskEdit12.Text);
  Dm.Escrit.FieldByName('cod_ag').asInteger    := StrToInt(MaskEdit3.Text);
  Dm.Escrit.FieldByName('contato').asString    := Trim(MaskEdit14.Text);
  Dm.Escrit.FieldByName('fatura').asString     := Trim(MaskEdit15.Text);

  Dm.Escrit.FieldByName('profissao').asString    := Trim(MASKEDIT18.Text);
  Dm.Escrit.FieldByName('estado_civil').asString := Trim(ComboBox9.Text);
  Dm.Escrit.FieldByName('nacionalidade').asString:= Trim(MASKEDIT19.Text);
  Dm.Escrit.FieldByName('tip_doc_outro').asString:= Trim(ComboBox3.Text);
  Dm.Escrit.FieldByName('doc_outro').asString    := Trim(MaskEdit16.Text);
  Dm.Escrit.FieldByName('numero').asString       := Trim(MASKEDIT17.Text);



  Dm.Escrit.Post;
  if (modo = 0) then Carregar(F_Fich2, True);
end;

Procedure TF_Fich2.Carregar(Sender : TOBject; Pesquisa : Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.Escrit.Close;
    Dm.Escrit.Sql.Clear;
    Dm.Escrit.Sql.Add('SELECT * FROM escrit');
    Dm.Escrit.Sql.Add('ORDER BY codigo');
    Dm.Escrit.Open;
  end;
  if dm.Escrit.RecordCount = 0 then exit;
  MaskEdit1.Text      := Dm.Escrit.FieldByName('maladireta').asString;
  MaskEdit2.Text      := Dm.Escrit.FieldByName('escritorio').asString;
  MaskEdit4.Text      := Dm.Escrit.FieldByName('agencia').asString;
  MaskEdit5.Text      := Dm.Escrit.FieldByName('endereco').asString;
  MaskEdit6.Text      := Dm.Escrit.FieldByName('bairro').asString;
  MaskEdit7.EditMask  := '';
  MaskEdit7.Text      := Dm.Escrit.FieldByName('cep').asString;
  MaskEdit7.EditMask  := '99999-999';
  ComboBox1.Text      := Dm.Escrit.FieldByName('tip_doc').asString;
  MaskEdit27.EditMask := '';
  MaskEdit27.Text     := Dm.Escrit.FieldByName('doc').asString;
  if (ComboBox1.Text = 'CPF') then MaskEdit27.EditMask := '###.###.###-##' else MaskEdit27.EditMask := '##.###.###/####-##';
  MaskEdit8.Text      := Dm.Escrit.FieldByName('cidade').asString;
  MaskEdit9.Text      := Dm.Escrit.FieldByName('estado').asString;
  MaskEdit10.Text     := Dm.Escrit.FieldByName('tel').asString;
  MaskEdit11.Text     := Dm.Escrit.FieldByName('fax').asString;
  MaskEdit12.Text     := Dm.Escrit.FieldByName('cod_mod').asString;
  MaskEdit13.Text     := Dm.Escrit.FieldByName('codigo').asString;
  MaskEdit3.Text      := Dm.Escrit.FieldByName('cod_ag').asString;
  MaskEdit14.Text     := Dm.Escrit.FieldByName('contato').asString;
  MaskEdit15.Text     := Dm.Escrit.FieldByName('fatura').asString;
  ComboBox2.Text      := BuscaNomeEmpresa(Dm.Escrit.FieldByName('ncliente').asString, True);

  MASKEDIT18.Text     :=Dm.Escrit.FieldByName('profissao').asString;
  ComboBox9.Text      :=Dm.Escrit.FieldByName('estado_civil').asString;
  MASKEDIT19.Text     :=Dm.Escrit.FieldByName('nacionalidade').asString;
  ComboBox3.Text      :=Dm.Escrit.FieldByName('tip_doc_outro').asString;
  MaskEdit16.Text     :=Dm.Escrit.FieldByName('doc_outro').asString;
  MASKEDIT17.Text     :=Dm.Escrit.FieldByName('numero').asString;

end;

procedure TF_Fich2.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Fich2.FormActivate(Sender: TObject);
begin
  Carregar(F_Fich2, True);
  BitBtn1.SetFocus;
end;

procedure TF_Fich2.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption = '&Incluir' then
  begin
    BitBtn1.Caption := '&Salvar';
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := false;
    BitBtn4.Enabled := false;    
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn8.Enabled := false;
    Panel3.Enabled     := True;
    MaskEdit13.Enabled := True;
    MaskEdit3.Enabled  := True;
    MaskEdit13.SetFocus;
  end
  else
  begin
    if BitBtn1.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma inclusão de dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_Fich2, 0);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Alterada a empresa de ' + empant + ' para ' + Trim(MaskEdit2.Text), '0');
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da alteração da natureza ' + empant + ' para ' + Trim(MaskEdit2.Text), '0');
        Carregar(F_Fich2, False);
      end;
      BitBtn1.Caption := '&Incluir';
      BitBtn2.Enabled := true;
      BitBtn3.Enabled := true;
      BitBtn4.Enabled := True;      
      BitBtn5.Enabled := true;
      BitBtn6.Enabled := true;  
      BitBtn8.Enabled := true;
      Panel3.Enabled  := False;
      BitBtn1.SetFocus;
    end;
  end;  
end;

procedure TF_Fich2.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir os dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão da empresa ' + Trim(MaskEdit2.Text), '0');
    Dm.Escrit.Delete;
    Carregar(F_Fich2, False);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);  
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão da empresa ' + Trim(MaskEdit2.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Fich2.BitBtn3Click(Sender: TObject);
begin
  if BitBtn3.Caption = '&Correção' then
  begin
     BitBtn3.Caption := '&Salvar';
     BitBtn1.Enabled := false;
     BitBtn2.Enabled := false;
     BitBtn4.Enabled := false;     
     BitBtn5.Enabled := false;
     BitBtn6.Enabled := false;
     BitBtn8.Enabled := false;
     Panel3.Enabled  := True;
     empant := '';
     empant := MaskEdit2.Text;
     MaskEdit13.Enabled := False;
     MaskEdit3.Enabled  := False;
     MaskEdit12.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma correçã dos dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_Fich2, 1);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Alterada a empresa de ' + empant + ' para ' + Trim(MaskEdit2.Text), '0');
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da alteração da empresa ' + empant + ' para ' + Trim(MaskEdit2.Text), '0');
        Carregar(F_Fich2, False);
      end;
      BitBtn3.Caption := '&Correção';
      BitBtn1.Enabled := true;
      BitBtn2.Enabled := true;
      BitBtn4.Enabled := True;      
      BitBtn5.Enabled := true;
      BitBtn6.Enabled := true; 
      BitBtn8.Enabled := true;
      Panel3.Enabled  := False;
      BitBtn3.SetFocus;
    end;
  end;  
end;

procedure TF_Fich2.BitBtn5Click(Sender: TObject);
begin
  Dm.Escrit.Next;
  Carregar(F_Fich2, False);
end;

procedure TF_Fich2.BitBtn6Click(Sender: TObject);
begin
  Dm.Escrit.Prior;
  Carregar(F_Fich2, False);  
end;

procedure TF_Fich2.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_Fich2.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox9.SetFocus;
end;

procedure TF_Fich2.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit12.SetFocus;
end;

procedure TF_Fich2.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit19.SetFocus;
end;

procedure TF_Fich2.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit17.SetFocus;
end;

procedure TF_Fich2.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit15.SetFocus;
end;

procedure TF_Fich2.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_Fich2.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit9.SetFocus;
end;

procedure TF_Fich2.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_Fich2.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit11.SetFocus;
end;

procedure TF_Fich2.MaskEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if (BitBtn1.Enabled) then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

procedure TF_Fich2.MaskEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_Fich2.ComboBox1Exit(Sender: TObject);
begin
  if (Trim(ComboBox1.Text) = 'CPF') then
  begin
    if (MaskEdit27.EditMask <> '###.###.###-##') then MaskEdit27.EditMask := '###.###.###-##';
  end;
  if (Trim(ComboBox1.Text) = 'CNPJ') then
  begin
    if (MaskEdit27.EditMask <> '##.###.###/####-##') then MaskEdit27.EditMask := '##.###.###/####-##';
  end;
end;

procedure TF_Fich2.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit27.SetFocus;
end;

procedure TF_Fich2.MaskEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox3.SetFocus;
end;

procedure TF_Fich2.MaskEdit13Exit(Sender: TObject);
begin
  MaskEdit13.Text := Trim(MaskEdit13.Text);
  if (not ValidNumero(MaskEdit13.Text)) OR (MaskEdit13.Text = '0') then
  begin
    MaskEdit13.Text := '0';
    MaskEdit13.Text := Busca_Codigo('escrit', 'codigo');
    MaskEdit3.Text  := '1';
  end
  else Busca_Cliente(F_Fich2);
end;

procedure TF_Fich2.MaskEdit12Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit12.Text)) then MaskEdit12.Text := '0';
end;

procedure TF_Fich2.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Fich2.MaskEdit7Exit(Sender: TObject);
begin
  if (TirarTudo(MaskEdit7.Text, '-', '','') <> '') AND (Trim(MaskEdit4.Text) = '') then Busca_Endereco(TirarTudo(MaskEdit7.Text, '-', '',''), '');
end;

procedure TF_Fich2.MaskEdit4Exit(Sender: TObject);
begin
  if (Trim(MaskEdit4.Text) <> '') then
  begin
    MaskEdit4.Text := TiraAcento(MaskEdit4.Text);
  end;
end;

procedure TF_Fich2.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
{  if key = 13 then
  begin
    MaskEdit4.SetFocus;
    if (F_Menu.Label1.Caption = 'SISCART') then
    begin
      if (MessageBox(Handle, PChar('Gravar Tudo ?'), 'Notas', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES) then
      begin
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('UPDATE escrit SET');
        Dm.ArqAux.Sql.Add('ncliente = ' + Chr(39) + Copy(ComboBox2.Text, 1,3) + Chr(39));
        Dm.ArqAux.Sql.Add('where');
        Dm.ArqAux.Sql.Add('codigo = ' + Trim(MaskEdit13.Text));
        Dm.ArqAux.ExecSql;
      end;
    end;
  end;}
end;

procedure TF_Fich2.ComboBox2Exit(Sender: TObject);
begin
  if (not ValidNumero(Copy(ComboBox2.Text, 1,3))) then
  begin
    ShowMessage('Código de cliente inválido !');
    ComboBox2.SetFocus;
    Exit;
  end;
end;

procedure TF_Fich2.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PesqEsc, F_PesqEsc);
  F_PesqEsc.ShowModal;
  F_PesqEsc.Destroy;
  F_PesqEsc := NIL;
  if (Dm.Escrit.Active) then
  begin
    DbGrid1.ShowHint := True;
    Carregar(F_Fich2, False);
  end
  else Carregar(F_Fich2, True);
end;

procedure TF_Fich2.DBGrid1DblClick(Sender: TObject);
begin
  Carregar(F_Fich2, True);
end;

procedure TF_Fich2.SpeedButton1Click(Sender: TObject);
begin
 Application.CreateForm(TF_Clientes, F_Clientes);
 F_Clientes.Showmodal;
 F_Fich2.ComboBox2.Clear;
 Carrega_CliEmp;
 F_Clientes.Destroy;
end;

procedure TF_Fich2.MaskEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_Fich2.ComboBox9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_Fich2.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit16.SetFocus;
end;

procedure TF_Fich2.MaskEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit14.SetFocus;
end;

procedure TF_Fich2.MaskEdit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit18.SetFocus;
end;

procedure TF_Fich2.MaskEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_Fich2.MaskEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

end.

