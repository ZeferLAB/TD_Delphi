unit U_CadRetoativo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ToolEdit,
  RXDBCtrl, Mask, DBCtrls, ExtCtrls, FuncGeral, Anot, ProcGeral;

type
  TF_CadRetoativo = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    btNovo: TBitBtn;
    btCancelar: TBitBtn;
    btExcluir: TBitBtn;
    btFechar: TBitBtn;
    BitBtn6: TBitBtn;
    btAlterar: TBitBtn;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label16: TLabel;
    ComboBox1: TComboBox;
    EdPesq: TEdit;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    Retroativo: TQuery;
    Ds_Retroativo: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label25: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ComboBox7: TComboBox;
    BitBtn9: TBitBtn;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox1: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label32: TLabel;
    Label39: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    ComboBox2: TComboBox;
    DBEdit6: TDBEdit;
    ComboBox3: TComboBox;
    DBEdit7: TDBEdit;
    ComboBox4: TDBComboBox;
    Retroativorecno: TIntegerField;
    Retroativodata_r: TDateField;
    Retroativodata_p: TDateField;
    Retroativodata_e: TDateField;
    Retroativodata_d: TDateField;
    Retroativodata_i: TDateField;
    Retroativodata_du: TDateField;
    Retroativodata_anot: TDateField;
    Retroativop_auxiliar: TIntegerField;
    Retroativoprotocolo: TIntegerField;
    Retroativoregistro: TIntegerField;
    Retroativotipo: TStringField;
    Retroativotabela: TStringField;
    Retroativolancamento: TIntegerField;
    Retroativonatureza: TIntegerField;
    Retroativoext_nat: TStringField;
    Retroativomicrofilme: TStringField;
    Retroativoanotacao: TMemoField;
    Retroativostatus: TStringField;
    Retroativoidentifica: TStringField;
    Retroativoidentific1: TStringField;
    Retroativoidentific2: TStringField;
    Retroativoidentific3: TStringField;
    Retroativonome: TStringField;
    Retroativotip_doc1: TStringField;
    Retroativodoc1: TStringField;
    Retroativotip_doc2: TStringField;
    Retroativodoc2: TStringField;
    Retroativop_cpff: TStringField;
    Retroativop_rgg: TStringField;
    Retroativoendereco: TStringField;
    Retroativobairro: TStringField;
    Retroativocidade: TStringField;
    Retroativoestado: TStringField;
    Retroativocep: TStringField;
    Retroativosituacao: TStringField;
    Retroativonome2: TStringField;
    Retroativolivro: TStringField;
    Retroativofolha: TStringField;
    Retroativonumero: TStringField;
    Retroativopasta: TStringField;
    Retroativoanotacao10: TStringField;
    Retroativoanotacao20: TStringField;
    Retroativoanotacao30: TStringField;
    Retroativodestina: TStringField;
    Retroativopos_cert: TStringField;
    Retroativocontrato: TStringField;
    Retroativorl: TStringField;
    Retroativodata_not1: TDateField;
    Retroativodata_not2: TDateField;
    Retroativodata_not3: TDateField;
    Retroativocod_ir1: TDateField;
    Retroativocod_ir2: TDateField;
    Retroativocod_ir3: TDateField;
    Retroativosit_not1: TStringField;
    Retroativosit_not2: TStringField;
    Retroativosit_not3: TStringField;
    Retroativocomplem: TStringField;
    Retroativodata_tra: TDateField;
    Retroativodatad1: TDateField;
    Retroativodatad2: TDateField;
    Retroativodatad3: TDateField;
    Retroativodt_nent_db: TDateField;
    Retroativodt_nent_rt: TDateField;
    Retroativonome3: TMemoField;
    Retroativohora1: TStringField;
    Retroativohora2: TStringField;
    Retroativohora3: TStringField;
    Retroativodedouro: TStringField;
    Retroativodia: TDateField;
    Retroativoh: TStringField;
    Retroativotra_tra: TStringField;
    Retroativodt_ent_db: TDateField;
    Retroativodt_ent_ret: TDateField;
    Retroativotramit: TIntegerField;
    Retroativorecibo: TIntegerField;
    Retroativoretro: TStringField;
    Retroativotp_livro: TStringField;
    Retroativoaverba: TStringField;
    DBEdit4: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Retroativo_Pessoal: TQuery;
    BitBtn1: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure TabSheet1Show(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure HabilitaDesabilitaBotoes(Tipo: String);
    procedure GravarAsPartes(Status: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadRetoativo: TF_CadRetoativo;

implementation

uses DMTD, DigDup2;

{$R *.DFM}

procedure TF_CadRetoativo.BitBtn5Click(Sender: TObject);
begin
{Nome
Documento
Protocolo
Nº de Registro
}
   if ComboBox1.Text = '' Then
   Begin
     Retroativo.Close;
     Retroativo.SQL.Clear;
     Retroativo.SQL.Add('SELECT * FROM td_cert where recno <= 50 order by data_p desc');
     Retroativo.Open;
   End;

  if EdPesq.Text <> '' Then
  Begin

    if ComboBox1.ItemIndex = 0 Then
    Begin
      if RadioButton1.Checked then
      begin
        Retroativo.Close;
        Retroativo.SQL.Clear;
        Retroativo.SQL.Add('SELECT * FROM td_cert where nome = '+QuotedStr(EdPesq.Text)+'');
        Retroativo.Open;
      end
      else
      if RadioButton2.Checked then
      begin
        Retroativo.Close;
        Retroativo.SQL.Clear;
        Retroativo.SQL.Add('SELECT * FROM td_cert where nome like '''+(EdPesq.Text)+'%''');
        Retroativo.Open;
      end
      else
      if RadioButton3.Checked then
      begin
        Retroativo.Close;
        Retroativo.SQL.Clear;
        Retroativo.SQL.Add('SELECT * FROM td_cert where nome like ''%'+(EdPesq.Text)+'%''');
        Retroativo.Open;
      end   
    End;

    if ComboBox1.ItemIndex = 1 Then
    Begin
      if RadioButton1.Checked then
      begin
        Retroativo.Close;
        Retroativo.SQL.Clear;
        Retroativo.SQL.Add('SELECT * FROM td_cert where doc1 = '''+(EdPesq.Text)+'''');
        Retroativo.Open;
      end
      else
      if RadioButton2.Checked then
      begin
        Retroativo.Close;
        Retroativo.SQL.Clear;
        Retroativo.SQL.Add('SELECT * FROM td_cert where doc1 like '''+(EdPesq.Text)+'%''');
        Retroativo.Open;
      End
      else
      if RadioButton3.Checked then
      begin
        Retroativo.Close;
        Retroativo.SQL.Clear;
        Retroativo.SQL.Add('SELECT * FROM td_cert where doc1 like ''%'+(EdPesq.Text)+'%''');
        Retroativo.Open;
      End;
    End;

    if ComboBox1.ItemIndex = 2 Then
    Begin
      Retroativo.Close;
      Retroativo.SQL.Clear;
      Retroativo.SQL.Add('SELECT * FROM td_cert where p_auxiliar = '''+(EdPesq.Text)+'''');
      Retroativo.Open;
    End;

    if ComboBox1.ItemIndex = 3 Then
    Begin
      Retroativo.Close;
      Retroativo.SQL.Clear;
      Retroativo.SQL.Add('SELECT * FROM td_cert where protocolo = '''+(EdPesq.Text)+'''');
      Retroativo.Open;
    End;

  End;

end;

procedure TF_CadRetoativo.btNovoClick(Sender: TObject);
begin
  if btNovo.Caption = 'Novo' Then
  Begin
    DBEdit3.SetFocus;
    btNovo.Caption := 'Gravar';
    Retroativo.Insert;
    ComboBox4.Text:= '';
    ComboBox7.Text:= '';
    DBEdit4.Text  := '';
    
    HabilitaDesabilitaBotoes('I');
  End
  Else
  if btNovo.Caption = 'Gravar' Then
  Begin

    if DBEdit1.Text = '' Then
    Begin
      ShowMessage('Campo: Registro, deve ser preenchido!');
      Abort;
    End;

    if DBEdit4.Text = '' Then
    Begin
      ShowMessage('Campo: Natureza, deve ser preenchido!');
      Abort;
    End;

    if DBEdit5.Text = '' Then
    Begin
      ShowMessage('Campo: Nome, deve ser preenchido!');
      Abort;
    End;

    if ComboBox7.Text = '' Then
    Begin
      ShowMessage('Campo: Situação, deve ser preenchido!');
      Abort;
    End;

    ComboBox7.Text      := Ver_Situacao(Trim(Retroativo.FieldByName('situacao').asString),False);
    ComboBox4.Text      := Retroativo.FieldByName('ext_nat').AsString;
    DBEdit4.Text        := Retroativo.FieldByName('natureza').AsString;


    if (Retroativo.State = DsInsert) Then
    Begin
      GravarAsPartes('Inclusao');
    End
    Else
    Begin
      GravarAsPartes('Edicao');
    End;



    Retroativo.Post;
    ComboBox4.Text:= '';
    ComboBox7.Text:= '';
    DBEdit4.Text  := '';
    Application.MessageBox('Registro salvo com sucesso!', 'Cadastro de Retroativo', Mb_IconInformation);
    btNovo.Caption := 'Novo';
    HabilitaDesabilitaBotoes('C'); 

  End

end;

procedure TF_CadRetoativo.btAlterarClick(Sender: TObject);
begin
  btNovo.Caption := 'Gravar';
  Retroativo.Edit;
  HabilitaDesabilitaBotoes('A');
end;

procedure TF_CadRetoativo.btCancelarClick(Sender: TObject);
begin
  btNovo.Caption := 'Novo';
  Retroativo.Cancel;
  Retroativo.FieldByName('natureza').AsString   := Trim(DBEdit4.Text);
  HabilitaDesabilitaBotoes('C');
end;

procedure TF_CadRetoativo.btExcluirClick(Sender: TObject);
begin
  if Application.MessageBox( Pchar('Deseja excluir o registro?'),PChar(F_CadRetoativo.Caption),MB_ICONQUESTION + MB_YESNO ) = Id_yes then
  begin
    Retroativo.Delete;
    HabilitaDesabilitaBotoes('E');
  end;
end;

procedure TF_CadRetoativo.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TF_CadRetoativo.BitBtn9Click(Sender: TObject);
begin
  if (not Permissao('acesso046')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Anot, F_Anot);
  if (DBEdit5.Text <> '') then
  begin
    F_Anot.chamada_externa := True;
    F_Anot.MaskEdit1.Text := DBEdit1.Text;
  end;
  F_Anot.ShowModal;
  F_Anot.Destroy;
  F_Anot := NIL;
end;

procedure TF_CadRetoativo.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePage:= TabSheet1;
  ComboBox7.Text      := Ver_Situacao(Trim(Retroativo.FieldByName('situacao').asString),False);
  ComboBox4.Text      := Retroativo.FieldByName('ext_nat').AsString;
  DBEdit4.Text        := Retroativo.FieldByName('natureza').AsString;
end;

procedure TF_CadRetoativo.DBEdit4Exit(Sender: TObject);
var
  util : String;
  pz   : Integer;
begin
  if (not ValidNumero(DBEdit3.Text)) OR (DBEdit3.Text = '0') then
  begin
    DBEdit3.Text := '0';
    Combobox3.SetFocus;
  end
  else
  begin
    dm.Natureza.close;                    
    dm.Natureza.sql.clear;
    dm.natureza.sql.add('select * from natureza where cod = ' + DBEdit3.Text);
    dm.Natureza.Open;
    if dm.Natureza.RecordCount <> 0 then
      ComboBox4.Text := Dm.Natureza.FieldByName('natureza').AsString;
      ComboBox4Exit(sender);
    UpdateWindow(Handle);
  end;
end;

procedure TF_CadRetoativo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Retroativo.Close;
end;

procedure TF_CadRetoativo.FormShow(Sender: TObject);
begin
  Retroativo.Open;
  //Retroativo.FieldByName('cep').EditMask := '##.###-###';
  Carrega_Natureza('RETROATIVO');
  HabilitaDesabilitaBotoes('C');
end;


procedure TF_CadRetoativo.ComboBox2Exit(Sender: TObject);
begin
  if (Trim(ComboBox2.Text) = 'CPF') then
  begin
    if (Retroativo.FieldByName('doc1').EditMask <> '###.###.###-##') then
      Retroativo.FieldByName('doc1').EditMask := '###.###.###-##';
  end;
  if (Trim(ComboBox2.Text) = 'CNPJ') then
  begin
    if (Retroativo.FieldByName('doc1').EditMask <> '##.###.###/####-##') then
      Retroativo.FieldByName('doc1').EditMask := '##.###.###/####-##';
    ComboBox2.Text := '';
  end;
end;

procedure TF_CadRetoativo.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
end;

procedure TF_CadRetoativo.ComboBox4Exit(Sender: TObject);
begin
  if ComboBox4.Text <> '' then
  begin
    dm.Natureza.Close;
    dm.Natureza.sql.Clear;
    dm.natureza.SQL.add('select * from natureza where natureza = "' + trim(copy(ComboBox4.Text, 1, 50)) + '"');
    dm.natureza.Open;
    DBEdit4.Text := dm.Natureza.FieldByName('cod').AsString;
  end  
end;

procedure TF_CadRetoativo.DBEdit3Exit(Sender: TObject);
begin
  if DBEdit3.Text <> '' Then
  Begin
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT * FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('p_auxiliar = ' + Trim(DBEdit3.Text));
    Dm.Td.Open;

    if (DBEdit3.Text <> '') Then
    Begin
      if Retroativo.State in ([DsInsert, DsEdit]) Then
      Begin
        Retroativo.FieldByName('registro').AsString:= Dm.Td.FieldByName('registro').AsString;
        Retroativo.FieldByName('data_p').AsString:= Dm.Td.FieldByName('data_p').AsString;
        Retroativo.FieldByName('data_r').AsString:= Dm.Td.FieldByName('data_r').AsString;
        Retroativo.FieldByName('ext_nat').AsString:= Dm.Td.FieldByName('ext_nat').AsString;
      End;
    End
  End;
  
end;

procedure TF_CadRetoativo.HabilitaDesabilitaBotoes(Tipo: String);
begin
  if (Tipo = 'I') OR (Tipo = 'A') Then
  Begin
    btNovo.Enabled:= True;
    btExcluir.Enabled:= False;
    btAlterar.Enabled:= False;
    btCancelar.Enabled:= True;
  End;

  if (Tipo = 'E') OR (Tipo = 'C') Then
  Begin
    btNovo.Enabled    := True;
    btExcluir.Enabled := True;
    btAlterar.Enabled := True;
    btCancelar.Enabled:= False;
  End;

end;

procedure TF_CadRetoativo.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    Perform(Wm_NextDlgCtl,0,0);
  End
end;

procedure TF_CadRetoativo.ComboBox4KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    Perform(Wm_NextDlgCtl,0,0);
  End
end;

procedure TF_CadRetoativo.TabSheet1Show(Sender: TObject);
begin
  DBEdit4.Text        := Retroativo.FieldByName('natureza').AsString;
end;

procedure TF_CadRetoativo.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    Perform(Wm_NextDlgCtl,0,0);
  End
end;

procedure TF_CadRetoativo.GravarAsPartes(Status: String);
begin
    Retroativo_Pessoal.Close;
    Retroativo_Pessoal.Sql.Clear;
    Retroativo_Pessoal.Sql.Add('SELECT * FROM td_pesso');
    Retroativo_Pessoal.Sql.Add('WHERE');
    Retroativo_Pessoal.Sql.Add('recno = 0');
    Retroativo_Pessoal.Open;
    if Status = 'Inclusao' Then
    Begin
      Retroativo_Pessoal.Append;
      Retroativo_Pessoal.FieldByName('data').asString           := DBDateEdit2.Text;
      Retroativo_Pessoal.FieldByName('tipo').asString           := 'T';
      Retroativo_Pessoal.FieldByName('p_auxiliar').asString     := Trim(DBEdit3.Text);
      Retroativo_Pessoal.FieldByName('protocolo').asString      := Trim(DBEdit1.Text);
      Retroativo_Pessoal.FieldByName('registro').asString       := Trim(DBEdit1.Text);
      Retroativo_Pessoal.FieldByName('nome').asString           := Trim(DBEdit5.Text);
      Retroativo_Pessoal.FieldByName('tip_doc1').asString       := Trim(ComboBox2.Text);
      Retroativo_Pessoal.FieldByName('doc1').asString           := TirarTudo(DBEdit6.Text, '.', '-', '/');
      Retroativo_Pessoal.FieldByName('tip_doc2').asString       := Trim(ComboBox1.Text);
      Retroativo_Pessoal.FieldByName('doc2').asString           := Trim(DBEdit7.Text);
      Retroativo_Pessoal.FieldByName('endereco').asString       := Trim(DBEdit8.Text);
      Retroativo_Pessoal.FieldByName('numero').asString         := Trim(DBEdit12.Text);
      Retroativo_Pessoal.FieldByName('bairro').asString         := Trim(DBEdit10.Text);
      Retroativo_Pessoal.FieldByName('cidade').asString         := Trim(DBEdit9.Text);
      Retroativo_Pessoal.FieldByName('estado').asString         := Trim(DBEdit13.Text);
      Retroativo_Pessoal.FieldByName('cep').asString            := TirarTudo(DBEdit14.Text, '-','','');
      Retroativo_Pessoal.FieldByName('situacao').asString       := Ver_Situacao1(Trim(copy(ComboBox4.Text, 1, 50)));
      Retroativo_Pessoal.FieldByName('complem').asString        := Trim(DBEdit11.Text);
      Retroativo_Pessoal.Post;
      Retroativo_Pessoal.Close;
    End
    Else
    Begin
      Retroativo_Pessoal.Edit;
      Retroativo_Pessoal.FieldByName('data').asString           := DBDateEdit2.Text;
      Retroativo_Pessoal.FieldByName('tipo').asString           := 'T';
      Retroativo_Pessoal.FieldByName('p_auxiliar').asString     := Trim(DBEdit3.Text);
      Retroativo_Pessoal.FieldByName('protocolo').asString      := Trim(DBEdit1.Text);
      Retroativo_Pessoal.FieldByName('registro').asString       := Trim(DBEdit1.Text);
      Retroativo_Pessoal.FieldByName('nome').asString           := Trim(DBEdit5.Text);
      Retroativo_Pessoal.FieldByName('tip_doc1').asString       := Trim(ComboBox2.Text);
      Retroativo_Pessoal.FieldByName('doc1').asString           := TirarTudo(DBEdit6.Text, '.', '-', '/');
      Retroativo_Pessoal.FieldByName('tip_doc2').asString       := Trim(ComboBox1.Text);
      Retroativo_Pessoal.FieldByName('doc2').asString           := Trim(DBEdit7.Text);
      Retroativo_Pessoal.FieldByName('endereco').asString       := Trim(DBEdit8.Text);
      Retroativo_Pessoal.FieldByName('numero').asString         := Trim(DBEdit12.Text);
      Retroativo_Pessoal.FieldByName('bairro').asString         := Trim(DBEdit10.Text);
      Retroativo_Pessoal.FieldByName('cidade').asString         := Trim(DBEdit9.Text);
      Retroativo_Pessoal.FieldByName('estado').asString         := Trim(DBEdit13.Text);
      Retroativo_Pessoal.FieldByName('cep').asString            := TirarTudo(DBEdit14.Text, '-','','');
      Retroativo_Pessoal.FieldByName('situacao').asString       := Ver_Situacao1(Trim(copy(ComboBox4.Text, 1, 50)));
      Retroativo_Pessoal.FieldByName('complem').asString        := Trim(DBEdit11.Text);
      Retroativo_Pessoal.Post;
      Retroativo_Pessoal.Close;  
    End;

end;

procedure TF_CadRetoativo.BitBtn1Click(Sender: TObject);
begin
  if (not Permissao('acesso052')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_DigDup2, F_DigDup2);

  F_DigDup2.ShowModal;
  F_DigDup2.Destroy;
  F_DigDup2 := NIL;
end;

end.
