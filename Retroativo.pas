unit retroativo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Db, Grids, DBGrids, Printers,
  DBCtrls, Menus, ComCtrls, ToolEdit, CurrEdit, RXDBCtrl;

type
  TF_Retroativo = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label5: TLabel;
    MaskEdit6: TMaskEdit;
    Label6: TLabel;
    Label8: TLabel;
    Memo2: TMemo;
    StatusBar1: TStatusBar;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    Label7: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label10: TLabel;
    MaskEdit8: TMaskEdit;
    ComboBox3: TComboBox;
    MaskEdit77: TMaskEdit;
    Label3: TLabel;
    ComboBox10: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    MaskEdit3: TMaskEdit;
    MaskEdit7: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    MaskEdit10: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    MaskEdit12: TMaskEdit;
    Label18: TLabel;
    MaskEdit13: TMaskEdit;
    Label19: TLabel;
    MaskEdit14: TMaskEdit;
    Label26: TLabel;
    MaskEdit15: TMaskEdit;
    OpenDialog1: TOpenDialog;
    BitBtn11: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn9: TBitBtn;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Label25: TLabel;
    Label9: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label32: TLabel;
    Label39: TLabel;
    ComboBox7: TComboBox;
    ComboBox1: TComboBox;
    MaskEdit27: TMaskEdit;
    ComboBox2: TComboBox;
    MaskEdit28: TMaskEdit;
    MaskEdit18: TMaskEdit;
    MaskEdit19: TMaskEdit;
    MaskEdit20: TMaskEdit;
    MaskEdit21: TMaskEdit;
    MaskEdit22: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit25: TMaskEdit;
    Label77: TLabel;
    Label78: TLabel;
    Label76: TLabel;
    MaskEdit11: TMaskEdit;
    MaskEdit16: TMaskEdit;
    ComboBox4: TComboBox;
    MaskEdit23: TMaskEdit;
    Label27: TLabel;
    btNovoParte: TBitBtn;
    btExcluirParte: TBitBtn;
    DBGrid1: TDBGrid;
    RichEdit1: TRichEdit;
    Label2: TLabel;
    TabSheet6: TTabSheet;
    Label11: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label50: TLabel;
    MaskEdit17: TMaskEdit;
    MaskEdit26: TMaskEdit;
    MaskEdit29: TMaskEdit;
    MaskEdit30: TMaskEdit;
    MaskEdit31: TMaskEdit;
    MaskEdit32: TMaskEdit;
    MaskEdit33: TMaskEdit;
    MaskEdit34: TMaskEdit;
    MaskEdit35: TMaskEdit;
    MaskEdit36: TMaskEdit;
    MaskEdit37: TMaskEdit;
    MaskEdit38: TMaskEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    MaskEdit39: TMaskEdit;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    MaskEdit40: TMaskEdit;
    MaskEdit41: TMaskEdit;
    MaskEdit42: TMaskEdit;
    MaskEdit43: TMaskEdit;
    MaskEdit24: TMaskEdit;
    MaskEdit44: TMaskEdit;
    btCorrigirParte: TBitBtn;
    Label48: TLabel;
    MaskEdit45: TMaskEdit;
    Label49: TLabel;
    MaskEdit46: TMaskEdit;
    MaskEdit47: TMaskEdit;
    Label51: TLabel;
    procedure BitBtn8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Atualizar(Sender : TOBject; Clique : Boolean);
    Procedure Carregar;
    Procedure Limpar(Sender : TOBject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Atualizar1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox7KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit27Exit(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit8Exit(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure MaskEdit6Exit(Sender: TObject);
    procedure ComboBox10Change(Sender: TObject);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure MaskEdit24KeyPress(Sender: TObject; var Key: Char);
    procedure btNovoParteClick(Sender: TObject);
    procedure btExcluirParteClick(Sender: TObject);
    procedure MaskEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure btCorrigirParteClick(Sender: TObject);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit47KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    function GravandoAsPartes(Status: String): Boolean;
    procedure GravarAsPartes(Status: String);
    procedure CarregaVariaveisRetroativo;
    procedure novoCadastroParte(protocolo, letra_reg, tipo_reg, p_auxiliar, letra_protoc, data_p, data_r,
              numero_rolo, numero_micfilme, registro_primitivo, seq_averbacao, registro, codnatureza,
              letra_livro, nome_parte_retroativo, contrato, parcelas, parc2, parc3, parc4, parc5, parc6, selo, validador: String;
              val_parc, val_parc2, val_parc3, val_parc4, val_parc5, val_parc6: Currency);
    procedure limpaCamposPartes;
    procedure updateDadosGerais;
    function corrigirRetroativo: boolean;
    function corrigirPessoaRetroativo: boolean;
  public

    { Public declarations }
  end;

var
  F_Retroativo: TF_Retroativo;
  natant    : String;
  bNovoEmSeq: Boolean;
  ven_parc, ven_parc2, ven_parc3, ven_parc4, ven_parc5, ven_parc6, mod_eti, qtde_eti, livro_b, folha_b, data_reti, anotacao: String;
  
implementation

uses PesqNat, Menu, QkNat, PesqRetr, QkRetro, Senha, DMTD, FuncGeral, ProcGeral, Anot,
  DigDup2, InfComp;

{$R *.DFM}

Procedure TF_Retroativo.Carregar;
begin
  if (Dm.Retroativo.Active) and (Dm.Retroativo.RecordCount <> 0) then
  begin
    MaskEdit6.Text      := Dm.Retroativo.FieldByName('protocolo').asString;
    MaskEdit47.Text      := Dm.Retroativo.FieldByName('tra_tra').asString;
    MaskEdit14.Text     := Dm.Retroativo.FieldByName('letra_reg').asString;
    ComboBox10.Text     := Dm.Retroativo.FieldByName('tipo_reg').asString;
    MaskEdit13.Text     := Dm.Retroativo.FieldByName('letra_protoc').asString;
    MaskEdit7.Text      := Dm.Retroativo.FieldByName('numero_rolo').asString;
    MaskEdit3.Text      := Dm.Retroativo.FieldByName('numero_micfilme').asString;
    MaskEdit12.Text     := Dm.Retroativo.FieldByName('registro_primitivo').asString;
    MaskEdit10.Text     := Dm.Retroativo.FieldByName('seq_averbacao').asString;
    MaskEdit15.Text     := Dm.Retroativo.FieldByName('protocolo').asString;
    MaskEdit77.Text     := Dm.Retroativo.FieldByName('data_p').asString;
    ComboBox3.Text      := Dm.Retroativo.FieldByName('ext_nat').AsString;
    MaskEdit8.Text      := Dm.Retroativo.FieldByName('natureza').AsString;
    MaskEdit1.Text      := Dm.Retroativo.FieldByName('nome_parte_retroativo').asString;
    MaskEdit23.Text     := Dm.Retroativo.FieldByName('nome').asString;
    ComboBox7.ItemIndex := ComboBox7.Items.IndexOf(Ver_Situacao(Trim(Dm.Retroativo.FieldByName('situacao').asString),False));
    ComboBox1.Text      := Dm.Retroativo.FieldByName('tip_doc1').asString;
    MaskEdit27.EditMask := '';
    MaskEdit27.Text     := Dm.Retroativo.FieldByName('doc1').asString;
    if (ComboBox1.Text = 'CPF') then
      MaskEdit27.EditMask := '###.###.###-##'
    else
      MaskEdit27.EditMask := '##.###.###/####-##';
    ComboBox2.Text      := Dm.Retroativo.FieldByName('tip_doc2').asString;
    MaskEdit28.Text     := Dm.Retroativo.FieldByName('doc2').asString;
    MaskEdit18.Text     := Dm.Retroativo.FieldByName('endereco').asString;
    MaskEdit19.Text     := Dm.Retroativo.FieldByName('bairro').asString;
    MaskEdit20.Text     := Dm.Retroativo.FieldByName('cidade').asString;
    MaskEdit21.Text     := Dm.Retroativo.FieldByName('estado').asString;
    MaskEdit5.Text      := Dm.Retroativo.FieldByName('data_r').asString;
    MaskEdit4.Text      := Dm.Retroativo.FieldByName('p_auxiliar').asString;
    MaskEdit22.EditMask := '';
    MaskEdit22.Text     := Dm.Retroativo.FieldByName('cep').asString;
    MaskEdit22.EditMask := '#####-###';
    MaskEdit9.Text      := Dm.Retroativo.FieldByName('numero').asString;
    MaskEdit25.Text     := Dm.Retroativo.FieldByName('complem').asString;
    MaskEdit2.Text      := Dm.Retroativo.FieldByName('tp_livro').asString;
    MaskEdit11.Text     := Dm.Retroativo.FieldByName('nacionalidade').AsString;
    MaskEdit16.Text     := Dm.Retroativo.FieldByName('profissao').AsString;
    ComboBox4.ItemIndex := ComboBox4.Items.IndexOf(Dm.Retroativo.FieldByName('estcivil').AsString);
    RichEdit1.Text      := Dm.Retroativo.FieldByName('observacao').AsString;
    MaskEdit8Exit(nil);
    MaskEdit17.Text     := Dm.Retroativo.FieldByName('contrato').AsString;
    MaskEdit24.Text     := Dm.Retroativo.FieldByName('parcelas').AsString;
    MaskEdit26.Text     := Dm.Retroativo.FieldByName('parc2').AsString;
    MaskEdit29.Text     := Dm.Retroativo.FieldByName('parc3').AsString;
    MaskEdit30.Text     := Dm.Retroativo.FieldByName('parc4').AsString;
    MaskEdit31.Text     := Dm.Retroativo.FieldByName('parc5').AsString;
    MaskEdit32.Text     := Dm.Retroativo.FieldByName('parc6').AsString;
    MaskEdit33.Text     := Dm.Retroativo.FieldByName('ven_parc').AsString;
    MaskEdit34.Text     := Dm.Retroativo.FieldByName('ven_parc2').AsString;
    MaskEdit35.Text     := Dm.Retroativo.FieldByName('ven_parc3').AsString;
    MaskEdit36.Text     := Dm.Retroativo.FieldByName('ven_parc4').AsString;
    MaskEdit37.Text     := Dm.Retroativo.FieldByName('ven_parc5').AsString;
    MaskEdit38.Text     := Dm.Retroativo.FieldByName('ven_parc6').AsString;
    CurrencyEdit1.Value := Dm.Retroativo.FieldByName('val_parc').AsCurrency;
    CurrencyEdit2.Value := Dm.Retroativo.FieldByName('val_parc2').AsCurrency;
    CurrencyEdit3.Value := Dm.Retroativo.FieldByName('val_parc3').AsCurrency;
    CurrencyEdit4.Value := Dm.Retroativo.FieldByName('val_parc4').AsCurrency;
    CurrencyEdit5.Value := Dm.Retroativo.FieldByName('val_parc5').AsCurrency;
    CurrencyEdit6.Value := Dm.Retroativo.FieldByName('val_parc6').AsCurrency;
    MaskEdit40.Text     := Dm.Retroativo.FieldByName('mod_eti').AsString;
    MaskEdit41.Text     := Dm.Retroativo.FieldByName('qtde_eti').AsString;
    MaskEdit42.Text     := Dm.Retroativo.FieldByName('livro_b').AsString;
    MaskEdit43.Text     := Dm.Retroativo.FieldByName('folha_b').AsString;
    MaskEdit44.Text     := Dm.Retroativo.FieldByName('data_reti').AsString;
    MaskEdit45.Text     := Dm.Retroativo.FieldByName('selo').AsString;
    MaskEdit46.Text     := Dm.Retroativo.FieldByName('validador').AsString;

    PageControl2.ActivePage := TabSheet4;
  end;
end;

Procedure TF_Retroativo.Limpar(Sender : TObject);
begin
  MaskEdit6.Text      := '';
  MaskEdit77.Text     := '';
  MaskEdit8.Text      := '';
  MaskEdit1.Text      := '';
  MaskEdit2.Text      := '';
  ComboBox7.ItemIndex := -1;
  ComboBox1.Text      := '';
  MaskEdit27.EditMask := '';
  ComboBox2.Text      := '';
  MaskEdit28.Text     := '';
  MaskEdit18.Text     := '';
  MaskEdit19.Text     := '';
  MaskEdit20.Text     := '';
  MaskEdit21.Text     := '';
  MaskEdit22.Text     := '';
  MaskEdit23.Text     := '';
  MaskEdit9.Text      := '';
  MaskEdit25.Text     := '';
  MaskEdit4.Text      := '';
  MaskEdit5.Text      := '';
  MaskEdit27.Text     := '';
  ComboBox3.Text      := '';
  MaskEdit47.Text     := '';
  MaskEdit14.Text     := '';
  ComboBox10.Text     := '';
  MaskEdit13.Text     := '';
  MaskEdit7.Text      := '';
  MaskEdit3.Text      := '';
  MaskEdit12.Text     := '';
  MaskEdit10.Text     := '';
  MaskEdit15.Text     := '';
  ComboBox7.ItemIndex := -1;
  MaskEdit11.Text     := '';
  MaskEdit16.Text     := '';
  ComboBox4.ItemIndex := -1;
  RichEdit1.Text      := '';

  MaskEdit17.Text     := '';
  MaskEdit24.Text     := '';
  MaskEdit26.Text     := '';
  MaskEdit29.Text     := '';
  MaskEdit30.Text     := '';
  MaskEdit31.Text     := '';
  MaskEdit32.Text     := '';
  MaskEdit33.Text     := '';
  MaskEdit34.Text     := '';
  MaskEdit35.Text     := '';
  MaskEdit36.Text     := '';
  MaskEdit37.Text     := '';
  MaskEdit38.Text     := '';
  CurrencyEdit1.Value := 0;
  CurrencyEdit2.Value := 0;
  CurrencyEdit3.Value := 0;
  CurrencyEdit4.Value := 0;
  CurrencyEdit5.Value := 0;
  CurrencyEdit6.Value := 0;
  MaskEdit40.Text     := '';
  MaskEdit41.Text     := '';
  MaskEdit42.Text     := '';
  MaskEdit43.Text     := '';
  MaskEdit44.Text     := '';
  //RichEdit2.Text      := '';
end;

Procedure TF_Retroativo.Atualizar(Sender : TObject; Clique : Boolean);
begin
  if MaskEdit6.Text <> '' then
  begin
    Dm.Retroativo.Close;
    Dm.Retroativo.Sql.Clear;
    Dm.Retroativo.Sql.Add('SELECT * FROM td_cert');
    Dm.Retroativo.Sql.Add(' WHERE protocolo = '+QuotedStr(MaskEdit6.Text)+'');
    Dm.Retroativo.Sql.Add(' ORDER BY recno desc');
    Dm.Retroativo.Open;
    if (Clique) then DbGrid1.ShowHint := False;
    Dm.Retroativo.FindFirst;
    Carregar;
  end;
end;             

procedure TF_Retroativo.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Retroativo.FormActivate(Sender: TObject);
begin
  Atualizar(F_Retroativo, False);
  BitBtn1.SetFocus;
  PageControl1.ActivePage := TabSheet1;
  PageControl2.ActivePage := TabSheet4;
end;

procedure TF_Retroativo.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption = '&Incluir' then
  begin
    BitBtn1.Caption := '&Salvar';
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    //BitBtn8.Enabled := false;
    Panel2.Enabled  := True;
    Dm.Retroativo.close;
    if (Not(bNovoEmSeq)) then
      Limpar(F_retroativo);

    maskedit6.SetFocus;
  end
  else
  begin
    if BitBtn1.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Inclusão de Dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Dm.Edita_Retro.Active := False;
        Dm.Edita_Retro.SQL.Clear;
        Dm.Edita_Retro.SQL.Add('SELECT * FROM td_cert WHERE 1 = 2');
        Dm.Edita_Retro.Active := True;
        Dm.Edita_Retro.Append;
        Dm.Edita_Retro.FieldByName('identifica').asString         := F_menu.label1.caption;
        Dm.Edita_Retro.FieldByName('protocolo').asString          := Trim(MaskEdit6.Text);
        Dm.Edita_Retro.FieldByName('p_auxiliar').asString         := Trim(MaskEdit4.Text);
        Dm.Edita_Retro.FieldByName('tra_tra').asString            := Trim(MaskEdit47.Text);
        Dm.Edita_Retro.FieldByName('letra_reg').asString          := MaskEdit14.Text;
        Dm.Edita_Retro.FieldByName('tipo_reg').asString           := ComboBox10.Text;
        Dm.Edita_Retro.FieldByName('letra_protoc').asString       := MaskEdit13.Text;
        Dm.Edita_Retro.FieldByName('numero_rolo').asString        := MaskEdit7.Text;
        Dm.Edita_Retro.FieldByName('numero_micfilme').asString    := MaskEdit3.Text;
        Dm.Edita_Retro.FieldByName('registro_primitivo').asString := MaskEdit12.Text;
        Dm.Edita_Retro.FieldByName('seq_averbacao').asString      := MaskEdit10.Text;
        Dm.Edita_Retro.FieldByName('registro').asString           := trim(maskedit6.Text);
        if (MaskEdit5.Text <> '  /  /  ') and (ValidData(MaskEdit5.Text)) Then
          Dm.Edita_Retro.FieldByName('data_p').asString           := MaskEdit5.Text;
        if (MaskEdit77.Text <> '  /  /  ') and ValidData(MaskEdit77.Text) Then
          Dm.Edita_Retro.FieldByName('data_r').asString           := MaskEdit77.Text;
        Dm.Edita_Retro.FieldByName('natureza').asString           := MaskEdit8.Text;
        Dm.Edita_Retro.FieldByName('ext_nat').AsString            := Trim(Copy(ComboBox3.Text, 1, 50));
        Dm.Edita_Retro.FieldByName('retro').asString              := 'X';
        Dm.Edita_Retro.FieldByName('tp_livro').asString           := Trim(MaskEdit2.Text);
        Dm.Edita_Retro.FieldByName('nome_parte_retroativo').asString       := Trim(maskedit1.text);
        Dm.Edita_Retro.FieldByName('status').asString             := 'PRONTO';

        Dm.Edita_Retro.FieldByName('situacao').asString           := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));
        Dm.Edita_Retro.FieldByName('tip_doc1').asString           := Trim(ComboBox1.Text);
        Dm.Edita_Retro.FieldByName('doc1').asString               := TirarTudo(MaskEdit27.Text, '.', '-', '/');
        Dm.Edita_Retro.FieldByName('tip_doc2').asString           := Trim(ComboBox2.Text);
        Dm.Edita_Retro.FieldByName('doc2').asString               := Trim(MaskEdit28.Text);
        Dm.Edita_Retro.FieldByName('nome').asString               := Trim(maskedit23.text);
        Dm.Edita_Retro.FieldByName('endereco').asString           := Trim(MaskEdit18.Text);
        Dm.Edita_Retro.FieldByName('bairro').asString             := Trim(MaskEdit19.Text);
        Dm.Edita_Retro.FieldByName('cidade').asString             := Trim(MaskEdit20.Text);
        Dm.Edita_Retro.FieldByName('estado').asString             := Trim(MaskEdit21.Text);
        Dm.Edita_Retro.FieldByName('cep').asString                := TirarTudo(MaskEdit22.Text, '-','','');
        Dm.Edita_Retro.FieldByName('numero').asString             := Trim(MaskEdit9.Text);
        Dm.Edita_Retro.FieldByName('complem').asString            := Trim(MaskEdit25.Text);
        Dm.Edita_Retro.FieldByName('nacionalidade').AsString      := MaskEdit11.Text;
        Dm.Edita_Retro.FieldByName('profissao').AsString          := MaskEdit16.Text;
        Dm.Edita_Retro.FieldByName('estcivil').AsString           := ComboBox4.Text;
        Dm.Edita_Retro.FieldByName('observacao').AsString         := RichEdit1.Text;

        Dm.Edita_Retro.FieldByName('contrato').AsString            := MaskEdit17.Text;
        Dm.Edita_Retro.FieldByName('parcelas').AsString            := MaskEdit24.Text;
        Dm.Edita_Retro.FieldByName('parc2').AsString               := MaskEdit26.Text;
        Dm.Edita_Retro.FieldByName('parc3').AsString               := MaskEdit29.Text;
        Dm.Edita_Retro.FieldByName('parc4').AsString               := MaskEdit30.Text;
        Dm.Edita_Retro.FieldByName('parc5').AsString               := MaskEdit31.Text;
        Dm.Edita_Retro.FieldByName('parc6').AsString               := MaskEdit32.Text;
        if (MaskEdit33.Text <> '  /  /  ') and (ValidData(MaskEdit33.Text)) then
          Dm.Edita_Retro.FieldByName('ven_parc').AsString            := MaskEdit33.Text;
        if (MaskEdit34.Text <> '  /  /  ') and (ValidData(MaskEdit34.Text)) then
          Dm.Edita_Retro.FieldByName('ven_parc2').AsString           := MaskEdit34.Text;
        if (MaskEdit35.Text <> '  /  /  ') and (ValidData(MaskEdit35.Text)) then
          Dm.Edita_Retro.FieldByName('ven_parc3').AsString           := MaskEdit35.Text;
        if (MaskEdit36.Text <> '  /  /  ') and (ValidData(MaskEdit36.Text)) then
          Dm.Edita_Retro.FieldByName('ven_parc4').AsString           := MaskEdit36.Text;
        if (MaskEdit37.Text <> '  /  /  ') and (ValidData(MaskEdit37.Text)) then
          Dm.Edita_Retro.FieldByName('ven_parc5').AsString           := MaskEdit37.Text;
        if (MaskEdit38.Text <> '  /  /  ') and (ValidData(MaskEdit38.Text)) then
          Dm.Edita_Retro.FieldByName('ven_parc6').AsString           := MaskEdit38.Text;
        Dm.Edita_Retro.FieldByName('val_parc').AsCurrency            := CurrencyEdit1.Value;
        Dm.Edita_Retro.FieldByName('val_parc2').AsCurrency           := CurrencyEdit2.Value;
        Dm.Edita_Retro.FieldByName('val_parc3').AsCurrency           := CurrencyEdit3.Value;
        Dm.Edita_Retro.FieldByName('val_parc4').AsCurrency           := CurrencyEdit4.Value;
        Dm.Edita_Retro.FieldByName('val_parc5').AsCurrency           := CurrencyEdit5.Value;
        Dm.Edita_Retro.FieldByName('val_parc6').AsCurrency           := CurrencyEdit6.Value;
        Dm.Edita_Retro.FieldByName('mod_eti').AsString               := MaskEdit40.Text;
        Dm.Edita_Retro.FieldByName('qtde_eti').AsString              := MaskEdit41.Text;
        Dm.Edita_Retro.FieldByName('livro_b').AsString               := MaskEdit42.Text;
        Dm.Edita_Retro.FieldByName('folha_b').AsString               := MaskEdit43.Text;
        if (MaskEdit44.Text <> '  /  /  ') and (ValidData(MaskEdit44.Text)) then
          Dm.Edita_Retro.FieldByName('data_reti').AsString           := MaskEdit44.Text;
        Dm.Edita_Retro.FieldByName('selo').AsString                  := MaskEdit45.Text;
        Dm.Edita_Retro.FieldByName('validador').AsString             := MaskEdit46.Text;

        if GravandoAsPartes('Inclusao') Then
        begin
          Dm.Edita_Retro.post;
        end
        else
          Abort;

        Dm.Edita_Retro.Active := False;
        Dm.Edita_Retro.Active := True;
      end;
      F_retroativo.Panel2.enabled := false;
      BitBtn1.Caption := '&Incluir';
      BitBtn2.Enabled := true;
      BitBtn3.Enabled := true;
      BitBtn4.Enabled := true;
      BitBtn5.Enabled := true;
      BitBtn6.Enabled := true;
      BitBtn7.Enabled := true;
      BitBtn8.Enabled := true;
      BitBtn1.SetFocus;
      bNovoEmSeq:= False;
    end;
    Atualizar(F_Retroativo, False);
    Carregar;
  end;
end;

procedure TF_Retroativo.GravarAsPartes(Status: String);
var
  doc1: String;
begin
{    if Status = 'Inclusao' Then
    begin
      Dm.Edita_Retro.Close;
      Dm.Edita_Retro.Sql.Clear;
      Dm.Edita_Retro.Sql.Add('SELECT * FROM td_pesso where recno = 0');
      Dm.Edita_Retro.Open;

      Dm.Edita_Retro.Append;
      if (MaskEdit77.Text <> '  /  /  ') and (ValidData(MaskEdit77.Text)) then
        Dm.Edita_Retro.FieldByName('data').asString           := MaskEdit77.Text;
      Dm.Edita_Retro.FieldByName('tipo').asString           := 'T';
      Dm.Edita_Retro.FieldByName('p_auxiliar').asString     := Trim(MaskEdit4.Text);
      Dm.Edita_Retro.FieldByName('protocolo').asString      := Trim(MaskEdit6.Text);
      Dm.Edita_Retro.FieldByName('letra_reg').asString := MaskEdit14.Text;
      Dm.Edita_Retro.FieldByName('tipo_reg').asString  := ComboBox10.Text;
      Dm.Edita_Retro.FieldByName('letra_protoc').asString := MaskEdit13.Text;
      Dm.Edita_Retro.FieldByName('numero_rolo').asString:= MaskEdit7.Text;
      Dm.Edita_Retro.FieldByName('numero_micfilme').asString:= MaskEdit3.Text;
      Dm.Edita_Retro.FieldByName('registro_primitivo').asString:= MaskEdit12.Text;
      Dm.Edita_Retro.FieldByName('seq_averbacao').asString:= MaskEdit10.Text;
      Dm.Edita_Retro.FieldByName('registro').asString       := trim(maskedit6.Text);
      Dm.Edita_Retro.FieldByName('nome').asString           := Trim(MaskEdit23.Text);
      Dm.Edita_Retro.FieldByName('tip_doc1').asString       := Trim(ComboBox1.Text);
      Dm.Edita_Retro.FieldByName('doc1').asString           := TirarTudo(MaskEdit27.Text, '.', '-', '/');
      Dm.Edita_Retro.FieldByName('tip_doc2').asString       := Trim(ComboBox2.Text);
      Dm.Edita_Retro.FieldByName('doc2').asString           := Trim(MaskEdit28.Text);
      Dm.Edita_Retro.FieldByName('endereco').asString       := Trim(MaskEdit18.Text);
      Dm.Edita_Retro.FieldByName('bairro').asString         := Trim(MaskEdit19.Text);
      Dm.Edita_Retro.FieldByName('cidade').asString         := Trim(MaskEdit20.Text);
      Dm.Edita_Retro.FieldByName('estado').asString         := Trim(MaskEdit21.Text);
      Dm.Edita_Retro.FieldByName('observacao').asString     := Trim(RichEdit1.Text);
      Dm.Edita_Retro.FieldByName('cep').asString            := TirarTudo(MaskEdit22.Text, '-','','');
      Dm.Edita_Retro.FieldByName('numero').asString         := Trim(MaskEdit9.Text);
      Dm.Edita_Retro.FieldByName('complem').asString        := Trim(MaskEdit25.Text);
      Dm.Edita_Retro.FieldByName('situacao').asString       := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));
      Dm.Edita_Retro.FieldByName('nacionalidade').AsString  := MaskEdit11.Text;
      Dm.Edita_Retro.FieldByName('profissao').AsString      := MaskEdit16.Text;
      Dm.Edita_Retro.FieldByName('estcivil').AsString       := ComboBox4.Text;
      Dm.Edita_Retro.FieldByName('observacao').AsString     := RichEdit1.Text;

      Dm.Edita_Retro.Post;
      Dm.Edita_Retro.Close;
    End
    Else
    Begin
      if (MaskEdit27.Text <> '') and (MaskEdit6.Text <> '') then
      begin
        doc1 := TirarTudo(MaskEdit27.Text, '-','.','/');;
        Dm.Edita_Retro.Close;
        Dm.Edita_Retro.Sql.Clear;
        Dm.Edita_Retro.Sql.Add('SELECT * FROM td_pesso');
        Dm.Edita_Retro.Sql.Add('WHERE');
        Dm.Edita_Retro.Sql.Add('doc1 = '+QuotedStr(doc1)+' and protocolo = '+QuotedStr(MaskEdit6.Text)+' ');
        Dm.Edita_Retro.Open;

        Dm.Edita_Retro.Edit;
        if (MaskEdit77.Text <> '  /  /  ') and (ValidData(MaskEdit77.Text)) then
          Dm.Edita_Retro.FieldByName('data').asString               := MaskEdit77.Text;
        Dm.Edita_Retro.FieldByName('tipo').asString               := 'T';
        Dm.Edita_Retro.FieldByName('letra_reg').asString          := MaskEdit14.Text;
        Dm.Edita_Retro.FieldByName('tipo_reg').asString           := ComboBox10.Text;
        Dm.Edita_Retro.FieldByName('letra_protoc').asString       := MaskEdit13.Text;
        Dm.Edita_Retro.FieldByName('numero_rolo').asString        := MaskEdit7.Text;
        Dm.Edita_Retro.FieldByName('numero_micfilme').asString    := MaskEdit3.Text;
        Dm.Edita_Retro.FieldByName('registro_primitivo').asString := MaskEdit12.Text;
        Dm.Edita_Retro.FieldByName('seq_averbacao').asString      := MaskEdit10.Text;
        Dm.Edita_Retro.FieldByName('p_auxiliar').asString     := Trim(MaskEdit4.Text);
        Dm.Edita_Retro.FieldByName('protocolo').asString      := Trim(MaskEdit6.Text);
        Dm.Edita_Retro.FieldByName('registro').asString       := trim(maskedit6.Text);
        Dm.Edita_Retro.FieldByName('nome').asString           := Trim(MaskEdit1.Text);
        Dm.Edita_Retro.FieldByName('tip_doc1').asString       := Trim(ComboBox1.Text);
        Dm.Edita_Retro.FieldByName('doc1').asString           := TirarTudo(MaskEdit27.Text, '.', '-', '/');
        Dm.Edita_Retro.FieldByName('tip_doc2').asString       := Trim(ComboBox2.Text);
        Dm.Edita_Retro.FieldByName('doc2').asString           := Trim(MaskEdit28.Text);
        Dm.Edita_Retro.FieldByName('endereco').asString       := Trim(MaskEdit18.Text);
        Dm.Edita_Retro.FieldByName('bairro').asString         := Trim(MaskEdit19.Text);
        Dm.Edita_Retro.FieldByName('cidade').asString         := Trim(MaskEdit20.Text);
        Dm.Edita_Retro.FieldByName('estado').asString         := Trim(MaskEdit21.Text);
        Dm.Edita_Retro.FieldByName('observacao').asString     := Trim(RichEdit1.Text);
        Dm.Edita_Retro.FieldByName('cep').asString            := TirarTudo(MaskEdit22.Text, '-','','');
        Dm.Edita_Retro.FieldByName('numero').asString         := Trim(MaskEdit9.Text);
        Dm.Edita_Retro.FieldByName('complem').asString        := Trim(MaskEdit25.Text);            
        Dm.Edita_Retro.FieldByName('nacionalidade').AsString  := MaskEdit11.Text;
        Dm.Edita_Retro.FieldByName('profissao').AsString      := MaskEdit16.Text;
        Dm.Edita_Retro.FieldByName('estcivil').AsString       := ComboBox4.Text;
        Dm.Edita_Retro.FieldByName('observacao').AsString     := RichEdit1.Text;
        Dm.Edita_Retro.FieldByName('situacao').asString       := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));

        Dm.Edita_Retro.Post;
        Dm.Edita_Retro.Close;
      End;
    End;  }
end;

procedure TF_Retroativo.BitBtn2Click(Sender: TObject);
var
  reg, nom : String;
begin
  if (MessageBox(Handle, PChar('Deseja excluir este lançamento ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    //Application.CreateForm(TF_Senha, F_Senha);
    //F_Senha.ShowModal;
    {if (not F_Senha.Senha_Ok) then
    begin
      F_Senha.Destroy;
      ShowMessage('Exclusão Cancelada !');
      Exit;
    end;}
    Dm.Retroativo.Delete;
    Carregar;
  end
  else
  begin
    MessageBox(Handle, PChar('O lançamento não foi excluído'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Retroativo.BitBtn3Click(Sender: TObject);
begin
  if BitBtn3.Caption = '&Correção' then
  begin
    if (Dm.Retroativo.Active) and (Dm.Retroativo.RecordCount <> 0) then
    begin
      BitBtn3.Caption := '&Salvar';
      BitBtn3.Enabled := true;
      BitBtn1.Enabled := false;
      BitBtn2.Enabled := false;
      BitBtn4.Enabled := False;
      BitBtn5.Enabled := false;
      BitBtn6.Enabled := false;
      BitBtn7.Enabled := false;
      BitBtn8.Enabled := false;
      Panel2.enabled := true;
      // MaskEdit6.SetFocus;
      btNovoParte.Enabled     := true;
      btExcluirParte.Enabled  := true;
      btCorrigirParte.Enabled := true
    end;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Correção dos Dados ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        corrigirRetroativo;
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
      end;
      Panel2.enabled  := False;
      BitBtn3.Caption := '&Correção';
      BitBtn3.Enabled := true;      
      BitBtn1.Enabled := True;
      BitBtn2.Enabled := True;
      BitBtn4.Enabled := True;
      BitBtn5.Enabled := True;
      BitBtn6.Enabled := True;
      BitBtn7.Enabled := True;
      BitBtn8.Enabled := True;
      btNovoParte.Caption := 'Novo';
      btNovoParte.Enabled     := false;
      btExcluirParte.Enabled  := false;
      btCorrigirParte.Enabled := false;
      Carregar;
      BitBtn3.SetFocus;
    end;
  end;
end;

function TF_Retroativo.corrigirRetroativo: boolean;
begin
  Dm.Edita_Retro.Active := False;
  Dm.Edita_Retro.SQL.Clear;
  Dm.Edita_Retro.SQL.Add('SELECT * FROM td_cert WHERE recno = ' + chr(39) + Dm.Retroativo.FieldByName('recno').asString + chr(39));
  Dm.Edita_Retro.Active := True;
  Dm.Edita_Retro.edit;
  Dm.Edita_Retro.FieldByName('identifica').asString := F_menu.label1.caption;
  Dm.Edita_Retro.FieldByName('protocolo').asString  := Trim(MaskEdit6.Text);
  Dm.Edita_Retro.FieldByName('tra_tra').asString  := Trim(MaskEdit47.Text);
  Dm.Edita_Retro.FieldByName('letra_reg').asString := MaskEdit14.Text;
  Dm.Edita_Retro.FieldByName('tipo_reg').asString  := ComboBox10.Text;
  Dm.Edita_Retro.FieldByName('letra_protoc').asString := MaskEdit13.Text;
  Dm.Edita_Retro.FieldByName('numero_rolo').asString:= MaskEdit7.Text;
  Dm.Edita_Retro.FieldByName('numero_micfilme').asString:= MaskEdit3.Text;
  Dm.Edita_Retro.FieldByName('registro_primitivo').asString:= MaskEdit12.Text;
  Dm.Edita_Retro.FieldByName('seq_averbacao').asString:= MaskEdit10.Text;
  Dm.Edita_Retro.FieldByName('p_auxiliar').asString  := Trim(MaskEdit4.Text);
  Dm.Edita_Retro.FieldByName('registro').asString   := trim(maskedit6.Text);
  if (MaskEdit5.Text <> '  /  /  ') and (ValidData(MaskEdit5.Text)) then
    Dm.Edita_Retro.FieldByName('data_p').asString     := MaskEdit5.Text;
  if (MaskEdit77.Text <> '  /  /  ') and (ValidData(MaskEdit77.Text)) then
    Dm.Edita_Retro.FieldByName('data_r').asString   := MaskEdit77.Text;
  Dm.Edita_Retro.FieldByName('ext_nat').asString    := Trim(Copy(ComboBox3.Text, 1, 50));
  if MaskEdit8.Text <> '' then
    Dm.Edita_Retro.FieldByName('natureza').asInteger  := StrToInt(MaskEdit8.Text)
  else
    Dm.Edita_Retro.FieldByName('natureza').asInteger  := 0;
  Dm.Edita_Retro.FieldByName('nome').asString       := Trim(maskedit23.text);
  Dm.Edita_Retro.FieldByName('nome_parte_retroativo').asString       := Trim(maskedit1.text);
  Dm.Edita_Retro.FieldByName('situacao').asString   := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));
  Dm.Edita_Retro.FieldByName('tip_doc1').asString   := Trim(ComboBox1.Text);
  Dm.Edita_Retro.FieldByName('doc1').asString       := TirarTudo(MaskEdit27.Text, '.', '-', '/');
  Dm.Edita_Retro.FieldByName('tip_doc2').asString   := Trim(ComboBox2.Text);
  Dm.Edita_Retro.FieldByName('doc2').asString       := Trim(MaskEdit28.Text);
  Dm.Edita_Retro.FieldByName('endereco').asString   := Trim(MaskEdit18.Text);
  Dm.Edita_Retro.FieldByName('status').asString     := 'PRONTO';
  Dm.Edita_Retro.FieldByName('bairro').asString     := Trim(MaskEdit19.Text);
  Dm.Edita_Retro.FieldByName('cidade').asString     := Trim(MaskEdit20.Text);
  Dm.Edita_Retro.FieldByName('estado').asString     := Trim(MaskEdit21.Text);
  Dm.Edita_Retro.FieldByName('cep').asString        := TirarTudo(MaskEdit22.Text, '-','','');
  Dm.Edita_Retro.FieldByName('numero').asString     := Trim(MaskEdit9.Text);
  Dm.Edita_Retro.FieldByName('complem').asString    := Trim(MaskEdit25.Text);
  Dm.Edita_Retro.FieldByName('retro').asString      := 'X';
  Dm.Edita_Retro.FieldByName('tp_livro').asString   := Trim(MaskEdit2.Text);
  Dm.Edita_Retro.FieldByName('situacao').AsString            := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));
  Dm.Edita_Retro.FieldByName('nacionalidade').AsString       := MaskEdit11.Text;
  Dm.Edita_Retro.FieldByName('profissao').AsString           := MaskEdit16.Text;
  Dm.Edita_Retro.FieldByName('estcivil').AsString            := ComboBox4.Text;
  Dm.Edita_Retro.FieldByName('observacao').AsString          := RichEdit1.Text;
  Dm.Edita_Retro.FieldByName('contrato').AsString            := MaskEdit17.Text;
  Dm.Edita_Retro.FieldByName('parcelas').AsString            := MaskEdit24.Text;
  Dm.Edita_Retro.FieldByName('parc2').AsString               := MaskEdit26.Text;
  Dm.Edita_Retro.FieldByName('parc3').AsString               := MaskEdit29.Text;
  Dm.Edita_Retro.FieldByName('parc4').AsString               := MaskEdit30.Text;
  Dm.Edita_Retro.FieldByName('parc5').AsString               := MaskEdit31.Text;
  Dm.Edita_Retro.FieldByName('parc6').AsString               := MaskEdit32.Text;
  if (MaskEdit33.Text <> '  /  /  ') and (ValidData(MaskEdit33.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc').AsString            := MaskEdit33.Text;
  if (MaskEdit34.Text <> '  /  /  ') and (ValidData(MaskEdit34.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc2').AsString           := MaskEdit34.Text;
  if (MaskEdit35.Text <> '  /  /  ') and (ValidData(MaskEdit35.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc3').AsString           := MaskEdit35.Text;
  if (MaskEdit36.Text <> '  /  /  ') and (ValidData(MaskEdit36.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc4').AsString           := MaskEdit36.Text;
  if (MaskEdit37.Text <> '  /  /  ') and (ValidData(MaskEdit37.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc5').AsString           := MaskEdit37.Text;
  if (MaskEdit38.Text <> '  /  /  ') and (ValidData(MaskEdit38.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc6').AsString           := MaskEdit38.Text;
  Dm.Edita_Retro.FieldByName('val_parc').AsCurrency            := CurrencyEdit1.Value;
  Dm.Edita_Retro.FieldByName('val_parc2').AsCurrency           := CurrencyEdit2.Value;
  Dm.Edita_Retro.FieldByName('val_parc3').AsCurrency           := CurrencyEdit3.Value;
  Dm.Edita_Retro.FieldByName('val_parc4').AsCurrency           := CurrencyEdit4.Value;
  Dm.Edita_Retro.FieldByName('val_parc5').AsCurrency           := CurrencyEdit5.Value;
  Dm.Edita_Retro.FieldByName('val_parc6').AsCurrency           := CurrencyEdit6.Value;
  Dm.Edita_Retro.FieldByName('mod_eti').AsString               := MaskEdit40.Text;
  Dm.Edita_Retro.FieldByName('qtde_eti').AsString              := MaskEdit41.Text;
  Dm.Edita_Retro.FieldByName('livro_b').AsString               := MaskEdit42.Text;
  Dm.Edita_Retro.FieldByName('folha_b').AsString               := MaskEdit43.Text;
  if (MaskEdit44.Text <> '  /  /  ') and (ValidData(MaskEdit44.Text)) then
    Dm.Edita_Retro.FieldByName('data_reti').AsString           := MaskEdit44.Text;
  Dm.Edita_Retro.FieldByName('selo').AsString                  := MaskEdit45.Text;
  Dm.Edita_Retro.FieldByName('validador').AsString             := MaskEdit46.Text;

  if GravandoAsPartes('Edicao') Then
  begin
    try
      Dm.Edita_Retro.post;
    finally
      updateDadosGerais;
    end;
  end
  else
    Abort;

  Dm.Edita_Retro.Active := False;
  Dm.Edita_Retro.Active := True;
  Atualizar(F_Retroativo, True);
end;

function TF_Retroativo.corrigirPessoaRetroativo: boolean;
begin
  Dm.Edita_Retro.Active := False;
  Dm.Edita_Retro.SQL.Clear;
  Dm.Edita_Retro.SQL.Add('SELECT * FROM td_cert WHERE recno = ' + chr(39) + Dm.Retroativo.FieldByName('recno').asString + chr(39));
  Dm.Edita_Retro.Active := True;
  Dm.Edita_Retro.edit;
  Dm.Edita_Retro.FieldByName('identifica').asString := F_menu.label1.caption;
  Dm.Edita_Retro.FieldByName('protocolo').asString  := Trim(MaskEdit6.Text);
  Dm.Edita_Retro.FieldByName('tra_tra').asString := MaskEdit47.Text;
  Dm.Edita_Retro.FieldByName('letra_reg').asString := MaskEdit14.Text;
  Dm.Edita_Retro.FieldByName('tipo_reg').asString  := ComboBox10.Text;
  Dm.Edita_Retro.FieldByName('letra_protoc').asString := MaskEdit13.Text;
  Dm.Edita_Retro.FieldByName('numero_rolo').asString:= MaskEdit7.Text;
  Dm.Edita_Retro.FieldByName('numero_micfilme').asString:= MaskEdit3.Text;
  Dm.Edita_Retro.FieldByName('registro_primitivo').asString:= MaskEdit12.Text;
  Dm.Edita_Retro.FieldByName('seq_averbacao').asString:= MaskEdit10.Text;
  Dm.Edita_Retro.FieldByName('p_auxiliar').asString  := Trim(MaskEdit4.Text);
  Dm.Edita_Retro.FieldByName('registro').asString   := trim(maskedit6.Text);
  if (MaskEdit5.Text <> '  /  /  ') and (ValidData(MaskEdit5.Text)) then
    Dm.Edita_Retro.FieldByName('data_p').asString     := MaskEdit5.Text;
  if (MaskEdit77.Text <> '  /  /  ') and (ValidData(MaskEdit77.Text)) then
    Dm.Edita_Retro.FieldByName('data_r').asString   := MaskEdit77.Text;
  Dm.Edita_Retro.FieldByName('ext_nat').asString    := Trim(Copy(ComboBox3.Text, 1, 50));
  Dm.Edita_Retro.FieldByName('natureza').asInteger  := StrToInt(MaskEdit8.Text);
  Dm.Edita_Retro.FieldByName('nome').asString       := Trim(maskedit23.text);
  Dm.Edita_Retro.FieldByName('nome_parte_retroativo').asString       := Trim(maskedit1.text);
  Dm.Edita_Retro.FieldByName('situacao').asString   := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));
  Dm.Edita_Retro.FieldByName('tip_doc1').asString   := Trim(ComboBox1.Text);
  Dm.Edita_Retro.FieldByName('doc1').asString       := TirarTudo(MaskEdit27.Text, '.', '-', '/');
  Dm.Edita_Retro.FieldByName('tip_doc2').asString   := Trim(ComboBox2.Text);
  Dm.Edita_Retro.FieldByName('doc2').asString       := Trim(MaskEdit28.Text);
  Dm.Edita_Retro.FieldByName('endereco').asString   := Trim(MaskEdit18.Text);
  Dm.Edita_Retro.FieldByName('status').asString     := 'PRONTO';
  Dm.Edita_Retro.FieldByName('bairro').asString     := Trim(MaskEdit19.Text);
  Dm.Edita_Retro.FieldByName('cidade').asString     := Trim(MaskEdit20.Text);
  Dm.Edita_Retro.FieldByName('estado').asString     := Trim(MaskEdit21.Text);
  Dm.Edita_Retro.FieldByName('cep').asString        := TirarTudo(MaskEdit22.Text, '-','','');
  Dm.Edita_Retro.FieldByName('numero').asString     := Trim(MaskEdit9.Text);
  Dm.Edita_Retro.FieldByName('complem').asString    := Trim(MaskEdit25.Text);
  Dm.Edita_Retro.FieldByName('retro').asString      := 'X';
  Dm.Edita_Retro.FieldByName('tp_livro').asString   := Trim(MaskEdit2.Text);
  Dm.Edita_Retro.FieldByName('situacao').AsString            := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));
  Dm.Edita_Retro.FieldByName('nacionalidade').AsString       := MaskEdit11.Text;
  Dm.Edita_Retro.FieldByName('profissao').AsString           := MaskEdit16.Text;
  Dm.Edita_Retro.FieldByName('estcivil').AsString            := ComboBox4.Text;
  Dm.Edita_Retro.FieldByName('observacao').AsString          := RichEdit1.Text;
  Dm.Edita_Retro.FieldByName('contrato').AsString            := MaskEdit17.Text;
  Dm.Edita_Retro.FieldByName('parcelas').AsString            := MaskEdit24.Text;
  Dm.Edita_Retro.FieldByName('parc2').AsString               := MaskEdit26.Text;
  Dm.Edita_Retro.FieldByName('parc3').AsString               := MaskEdit29.Text;
  Dm.Edita_Retro.FieldByName('parc4').AsString               := MaskEdit30.Text;
  Dm.Edita_Retro.FieldByName('parc5').AsString               := MaskEdit31.Text;
  Dm.Edita_Retro.FieldByName('parc6').AsString               := MaskEdit32.Text;
  if (MaskEdit33.Text <> '  /  /  ') and (ValidData(MaskEdit33.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc').AsString            := MaskEdit33.Text;
  if (MaskEdit34.Text <> '  /  /  ') and (ValidData(MaskEdit34.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc2').AsString           := MaskEdit34.Text;
  if (MaskEdit35.Text <> '  /  /  ') and (ValidData(MaskEdit35.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc3').AsString           := MaskEdit35.Text;
  if (MaskEdit36.Text <> '  /  /  ') and (ValidData(MaskEdit36.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc4').AsString           := MaskEdit36.Text;
  if (MaskEdit37.Text <> '  /  /  ') and (ValidData(MaskEdit37.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc5').AsString           := MaskEdit37.Text;
  if (MaskEdit38.Text <> '  /  /  ') and (ValidData(MaskEdit38.Text)) then
    Dm.Edita_Retro.FieldByName('ven_parc6').AsString           := MaskEdit38.Text;
  Dm.Edita_Retro.FieldByName('val_parc').AsCurrency            := CurrencyEdit1.Value;
  Dm.Edita_Retro.FieldByName('val_parc2').AsCurrency           := CurrencyEdit2.Value;
  Dm.Edita_Retro.FieldByName('val_parc3').AsCurrency           := CurrencyEdit3.Value;
  Dm.Edita_Retro.FieldByName('val_parc4').AsCurrency           := CurrencyEdit4.Value;
  Dm.Edita_Retro.FieldByName('val_parc5').AsCurrency           := CurrencyEdit5.Value;
  Dm.Edita_Retro.FieldByName('val_parc6').AsCurrency           := CurrencyEdit6.Value;
  Dm.Edita_Retro.FieldByName('mod_eti').AsString               := MaskEdit40.Text;
  Dm.Edita_Retro.FieldByName('qtde_eti').AsString              := MaskEdit41.Text;
  Dm.Edita_Retro.FieldByName('livro_b').AsString               := MaskEdit42.Text;
  Dm.Edita_Retro.FieldByName('folha_b').AsString               := MaskEdit43.Text;
  if (MaskEdit44.Text <> '  /  /  ') and (ValidData(MaskEdit44.Text)) then
    Dm.Edita_Retro.FieldByName('data_reti').AsString           := MaskEdit44.Text;
  Dm.Edita_Retro.FieldByName('selo').AsString                  := MaskEdit45.Text;
  Dm.Edita_Retro.FieldByName('validador').AsString             := MaskEdit46.Text;

  if GravandoAsPartes('Edicao') Then
  begin
    try
      Dm.Edita_Retro.post;
    finally
    end;
  end
  else
    Abort;

  Dm.Edita_Retro.Active := False;
  Dm.Edita_Retro.Active := True;
  Atualizar(F_Retroativo, True);
end;

procedure TF_Retroativo.updateDadosGerais;
begin
  with dm.qryGenerico_Auxiliar2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('update td_cert set');
    SQL.Add('letra_reg = '+QuotedStr(MaskEdit14.Text));
    SQL.Add(',letra_protoc = '+QuotedStr(MaskEdit13.Text));
    SQL.Add(',numero_rolo = '+QuotedStr(MaskEdit7.Text));
    SQL.Add(',numero_micfilme = '+QuotedStr(MaskEdit3.Text));
    SQL.Add(',registro_primitivo = '+QuotedStr(MaskEdit12.Text));
    SQL.Add(',seq_averbacao = '+QuotedStr(MaskEdit10.Text));
    SQL.Add(',tra_tra= '+QuotedStr(MaskEdit47.Text));
    SQL.Add(',tipo_reg = '+QuotedStr(ComboBox10.Text));
    SQL.Add(',registro = '+QuotedStr(MaskEdit15.Text));
    SQL.Add(',tp_livro = '+QuotedStr(MaskEdit2.Text));
    SQL.Add(',nome_parte_retroativo = '+QuotedStr(MaskEdit1.Text));
    if (MaskEdit77.Text <> '') and (MaskEdit77.Text <> '  /  /    ') then
      SQL.Add(',data_r = '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit77.Text))));
    if (MaskEdit5.Text <> '') and (MaskEdit5.Text <> '  /  /    ') then
      SQL.Add(',data_p = '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit5.Text))));
    SQL.Add(',contrato = '+QuotedStr(MaskEdit17.Text));
    SQL.Add(',parcelas = '+QuotedStr(MaskEdit24.Text));
    SQL.Add(',parc2 = '+QuotedStr(MaskEdit26.Text));
    SQL.Add(',parc3 = '+QuotedStr(MaskEdit29.Text));
    SQL.Add(',parc4 = '+QuotedStr(MaskEdit30.Text));
    SQL.Add(',parc5 = '+QuotedStr(MaskEdit31.Text));
    SQL.Add(',parc6 = '+QuotedStr(MaskEdit32.Text));

    if (MaskEdit33.Text <> '  /  /  ') and (ValidData(MaskEdit33.Text)) then
      SQL.Add(', ven_parc = '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit33.Text))));
    if (MaskEdit34.Text <> '  /  /  ') and (ValidData(MaskEdit34.Text)) then
      SQL.Add(', ven_parc2 = '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit34.Text))));
    if (MaskEdit35.Text <> '  /  /  ') and (ValidData(MaskEdit35.Text)) then
      SQL.Add(', ven_parc3 = '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit35.Text))));
    if (MaskEdit36.Text <> '  /  /  ') and (ValidData(MaskEdit36.Text)) then
      SQL.Add(', ven_parc4 = '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit36.Text))));
    if (MaskEdit37.Text <> '  /  /  ') and (ValidData(MaskEdit37.Text)) then
      SQL.Add(', ven_parc5 = '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit37.Text))));
    if (MaskEdit38.Text <> '  /  /  ') and (ValidData(MaskEdit38.Text)) then
      SQL.Add(', ven_parc6 = '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit38.Text))));
    SQL.Add(',val_parc = '+QuotedStr(CurrencyEdit1.Text));
    SQL.Add(',val_parc2 = '+QuotedStr(CurrencyEdit2.Text));
    SQL.Add(',val_parc3 = '+QuotedStr(CurrencyEdit3.Text));
    SQL.Add(',val_parc4 = '+QuotedStr(CurrencyEdit4.Text));
    SQL.Add(',val_parc5 = '+QuotedStr(CurrencyEdit5.Text));
    SQL.Add(',val_parc6 = '+QuotedStr(CurrencyEdit6.Text));
    SQL.Add(',mod_eti = '+QuotedStr(MaskEdit40.Text));
    SQL.Add(',qtde_eti = '+QuotedStr(MaskEdit41.Text));
    SQL.Add(',livro_b = '+QuotedStr(MaskEdit42.Text));
    SQL.Add(',folha_b = '+QuotedStr(MaskEdit43.Text));
    if (MaskEdit44.Text <> '  /  /  ') and (ValidData(MaskEdit44.Text)) then
      SQL.Add(',data_reti = '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit44.Text))));
    SQL.Add(',selo = '+QuotedStr(MaskEdit45.Text));
    SQL.Add(',validador = '+QuotedStr(MaskEdit46.Text));

    SQL.Add('where protocolo = '+QuotedStr(MaskEdit6.Text)+ ' and p_auxiliar = '+QuotedStr(MaskEdit4.Text));
    ExecSQL;
  end;
  Dm.Retroativo.Close;
  Dm.Retroativo.SQL.Clear;
  Dm.Retroativo.SQL.Add('SELECT * FROM td_cert where protocolo = '+QuotedStr(MaskEdit6.Text));
  Dm.Retroativo.Open;
end;

procedure TF_Retroativo.BitBtn5Click(Sender: TObject);
begin
  Dm.Retroativo.Next;
  Carregar;
end;

procedure TF_Retroativo.BitBtn6Click(Sender: TObject);
begin
  Dm.Retroativo.Prior;
  Carregar;
end;

procedure TF_Retroativo.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PesqRetr, F_PesqRetr);
  F_PesqRetr.ShowModal;
  F_PesqRetr.Destroy;
  F_PesqRetr := NIL;
  if (Dm.Retroativo.Active) then
  begin
    DbGrid1.ShowHint := True;
    Carregar;
  end
  else
    Atualizar(F_Retroativo, False);
end;

procedure TF_Retroativo.FormOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [SSALT]) or (key = Vk_F4) then key:= Vk_Clear;
end;

procedure TF_Retroativo.FormDestroy(Sender: TObject);
begin
  Dm.Retroativo.Close;
end;

procedure TF_Retroativo.DBGrid1DblClick(Sender: TObject);
begin
  if (DbGrid1.ShowHint) then Atualizar(F_Retroativo, True);
end;
procedure TF_Retroativo.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Maskedit1.Refresh;
  Maskedit1.UpDate;
  MaskEdit1.Hint := Maskedit1.Text;
  Memo2.Color := clInfoBk;
  Memo2.Text := Maskedit1.Text;
  if key = 13 then
  begin
    PageControl2.ActivePage := TabSheet4;
    if ComboBox1.Enabled then
      ComboBox1.setfocus;
  end;
end;

procedure TF_Retroativo.Atualizar1Click(Sender: TObject);
begin
  Atualizar(F_Retroativo, False);
  Carregar;
end;

procedure TF_Retroativo.DBGrid1CellClick(Column: TColumn);
begin
  Carregar;
end;

procedure TF_Retroativo.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin            
  if key = 13 then
  begin
    if ComboBox10.Text = 'Mic.' then
    Begin
      PageControl1.ActivePage:= TabSheet1;
      MaskEdit7.SetFocus;
    End
    Else
    if ComboBox10.Text = 'Reg.' then
    Begin
      PageControl1.ActivePage:= TabSheet3;
      MaskEdit15.SetFocus;
    End
    Else
    if ComboBox10.Text = 'Av.' then
    Begin
      PageControl1.ActivePage:= TabSheet2;
      MaskEdit12.SetFocus;
    End;
  end;
end;

procedure TF_Retroativo.ComboBox7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (Trim(ComboBox7.Text) = '') then
    begin
      ShowMessage('OBRIGATÓRIO COLOCAR SITUAÇÃO.');
      Combobox7.SetFocus;
      Exit;
    end;
    if (Trim(MaskEdit1.Text) = '') then
    begin
      ShowMessage('OBRIGATÓRIO DIGITAR O NOME DA PARTE.');
      MaskEdit1.SetFocus;
      Exit;
    end;
    MaskEdit22.SetFocus;
  end;
end;

procedure TF_Retroativo.ComboBox7KeyPress(Sender: TObject; var Key: Char);
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

procedure TF_Retroativo.ComboBox1Exit(Sender: TObject);
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

procedure TF_Retroativo.ComboBox1KeyPress(Sender: TObject; var Key: Char);
var
  Found: boolean;
  i,SelSt: Integer;
  TmpStr: string;
begin
  if Key in ['a'..'z'] then Dec(Key,32);
  if Key = #13 then
    MaskEdit27.SetFocus;
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

procedure TF_Retroativo.MaskEdit27Exit(Sender: TObject);
var
  doc1: String;
begin
  if (Trim(ComboBox1.Text) = 'CPF') then
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') <> '') then
    begin
      if (CheckCPF(TirarTudo(MaskEdit27.Text, '.', '/', '-')) <> TirarTudo(MaskEdit27.Text, '.', '/', '-')) then
      begin
        ShowMessage('ATENÇÃO - DOCUMENTO INVÁLIDO !');
      end;
    end;
  end
  else if (TirarTudo(MaskEdit27.Text, '.', '/', '-') <> '') then
  begin
    if (CheckCGC(TirarTudo(MaskEdit27.Text, '.', '/', '-')) <> TirarTudo(MaskEdit27.Text, '.', '/', '-')) then
    begin
      ShowMessage('ATENÇÃO - DOCUMENTO INVÁLIDO !');
    end;
  end;

  if MaskEdit4.Text <> '' Then
  begin
    doc1 := TirarTudo(MaskEdit27.Text, '-','.','/');
    Dm.qryGenerico.Close;
    Dm.qryGenerico.Sql.Clear;
    Dm.qryGenerico.Sql.Add('SELECT * FROM td_pesso');
    Dm.qryGenerico.Sql.Add('WHERE');
    Dm.qryGenerico.Sql.Add('doc1 = ' + Trim(QuotedStr(doc1)));
    Dm.qryGenerico.Open;
    Dm.qryGenerico.FindLast;

    if MaskEdit23.Text = '' Then
      MaskEdit23.Text  := Dm.qryGenerico.FieldByName('nome').asString;
    if ComboBox7.Text = '' Then
      ComboBox7.ItemIndex := ComboBox7.Items.IndexOf(Ver_Situacao(Trim(Dm.qryGenerico.FieldByName('situacao').asString),False));
    if ComboBox2.Text = '' Then
      ComboBox2.Text  := Dm.qryGenerico.FieldByName('tip_doc2').asString;
    if MaskEdit28.Text = '' Then
      MaskEdit28.Text := Dm.qryGenerico.FieldByName('doc2').asString;
    if MaskEdit22.Text = '' Then
      MaskEdit22.Text := Dm.qryGenerico.FieldByName('cep').asString;
    if MaskEdit18.Text = '' Then
      MaskEdit18.Text := Dm.qryGenerico.FieldByName('endereco').asString;
    if MaskEdit9.Text = '' Then
      MaskEdit9.Text  := Dm.qryGenerico.FieldByName('numero').asString;
    if MaskEdit25.Text = '' Then
      MaskEdit25.Text := Dm.qryGenerico.FieldByName('complem').asString;
    if MaskEdit19.Text = '' Then
      MaskEdit19.Text := Dm.qryGenerico.FieldByName('bairro').asString;
    if MaskEdit20.Text = '' Then
      MaskEdit20.Text := Dm.qryGenerico.FieldByName('cidade').asString;
    if MaskEdit21.Text = '' Then
      MaskEdit21.Text := Dm.qryGenerico.FieldByName('estado').asString;
    if MaskEdit11.Text = '' Then
      MaskEdit11.Text := Dm.qryGenerico.FieldByName('nacionalidade').asString;
    if ComboBox4.Text = '' Then
      ComboBox4.ItemIndex := ComboBox4.Items.IndexOf(Dm.qryGenerico.FieldByName('estcivil').AsString);
    if MaskEdit16.Text = '' Then
      MaskEdit16.Text := Dm.qryGenerico.FieldByName('profissao').asString;
    RichEdit1.Text     := Dm.qryGenerico.FieldByName('observacao').asString;
  end;
end;

procedure TF_Retroativo.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  Maskedit1.Refresh;
  Maskedit1.UpDate;
  MaskEdit1.Hint := Maskedit1.Text;
  Memo2.Color := clInfoBk;
  Memo2.Text := Maskedit1.Text;
end;

procedure TF_Retroativo.MaskEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Maskedit1.Refresh;
  Maskedit1.UpDate;
  MaskEdit1.Hint := Maskedit1.Text;
  Memo2.Color := clInfoBk;
  Memo2.Text := Maskedit1.Text;
end;

procedure TF_Retroativo.MaskEdit1Exit(Sender: TObject);
begin
  Memo2.Visible := False;
end;

procedure TF_Retroativo.MaskEdit1Change(Sender: TObject);
begin
  if MaskEdit1.Focused then Memo2.Visible := True;
end;

procedure TF_Retroativo.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Carregar;
end;

function TF_Retroativo.GravandoAsPartes(Status: String): Boolean;
begin
  result:= False;
  try
    Dm.Td_Pesso.Close;
    Dm.Td_Pesso.Sql.Clear;
    Dm.Td_Pesso.Sql.Add('SELECT * FROM td_pesso');
    Dm.Td_Pesso.Sql.Add('WHERE recno = 0');
    Dm.Td_Pesso.Open;
    if Status = 'Inclusao' Then
    Begin
      Dm.Td_Pesso.Append;
      if MaskEdit77.Text <> '  /  /    ' Then
        Dm.Td_Pesso.FieldByName('data').asString             := MaskEdit77.Text;
      Dm.Td_Pesso.FieldByName('tipo').asString               := 'T';
      Dm.Td_Pesso.FieldByName('p_auxiliar').asString         := Trim(MaskEdit4.Text);
      Dm.Td_Pesso.FieldByName('tra_tra').asString            := MaskEdit47.Text;
      Dm.Td_Pesso.FieldByName('letra_reg').asString          := MaskEdit14.Text;
      Dm.Td_Pesso.FieldByName('tipo_reg').asString           := ComboBox10.Text;
      Dm.Td_Pesso.FieldByName('letra_protoc').asString       := MaskEdit13.Text;
      Dm.Td_Pesso.FieldByName('numero_rolo').asString        := MaskEdit7.Text;
      Dm.Td_Pesso.FieldByName('numero_micfilme').asString    := MaskEdit3.Text;
      Dm.Td_Pesso.FieldByName('registro_primitivo').asString := MaskEdit12.Text;
      Dm.Td_Pesso.FieldByName('seq_averbacao').asString      := MaskEdit10.Text;
      Dm.Td_Pesso.FieldByName('protocolo').asString          := Trim(MaskEdit6.Text);
      Dm.Td_Pesso.FieldByName('registro').asString           := Trim(MaskEdit6.Text);
      Dm.Td_Pesso.FieldByName('nome').asString               := Trim(MaskEdit23.Text);
      Dm.Td_Pesso.FieldByName('tip_doc1').asString           := Trim(ComboBox1.Text);
      Dm.Td_Pesso.FieldByName('doc1').asString               := TirarTudo(MaskEdit27.Text, '.', '-', '/');
      Dm.Td_Pesso.FieldByName('tip_doc2').asString           := Trim(ComboBox2.Text);
      Dm.Td_Pesso.FieldByName('doc2').asString               := Trim(MaskEdit28.Text);
      Dm.Td_Pesso.FieldByName('cep').asString                := TirarTudo(MaskEdit22.Text, '-','','');
      Dm.Td_Pesso.FieldByName('endereco').asString           := Trim(MaskEdit18.Text);
      Dm.Td_Pesso.FieldByName('numero').asString             := Trim(MaskEdit9.Text);
      Dm.Td_Pesso.FieldByName('complem').asString            := Trim(MaskEdit25.Text);
      Dm.Td_Pesso.FieldByName('bairro').asString             := Trim(MaskEdit19.Text);
      Dm.Td_Pesso.FieldByName('cidade').asString             := Trim(MaskEdit20.Text);
      Dm.Td_Pesso.FieldByName('estado').asString             := Trim(MaskEdit21.Text);
      Dm.Td_Pesso.FieldByName('observacao').asString         := Trim(RichEdit1.Text);
      Dm.Td_Pesso.FieldByName('situacao').asString           := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));
      Dm.Td_Pesso.FieldByName('nacionalidade').asString      := Trim(MaskEdit11.Text);
      Dm.Td_Pesso.FieldByName('estcivil').asString           := Trim(ComboBox4.Text);
      Dm.Td_Pesso.FieldByName('profissao').asString          := Trim(MaskEdit16.Text);
      Dm.Td_Pesso.Post;
      Dm.Td_Pesso.Close;
    End
    Else
    Begin
      Dm.Td_Pesso.Active := False;
      Dm.Td_Pesso.SQL.Clear;
      Dm.Td_Pesso.SQL.Add('select * from td_pesso where tip_doc1 = '+QuotedStr(ComboBox1.Text)+ ' and doc1 = '+QuotedStr(TirarTudo(MaskEdit27.Text, '.', '-', '/'))+' and protocolo = '+QuotedStr(MaskEdit6.Text) );
      Dm.Td_Pesso.Active := True;
      Dm.Td_Pesso.Last;
      Dm.Td_Pesso.Edit;
      if MaskEdit77.Text <> '  /  /    ' Then
        Dm.Td_Pesso.FieldByName('data').asString             := MaskEdit77.Text;
      Dm.Td_Pesso.FieldByName('tipo').asString               := 'T';
      Dm.Td_Pesso.FieldByName('p_auxiliar').asString         := Trim(MaskEdit4.Text);
      Dm.Td_Pesso.FieldByName('tra_tra').asString            := MaskEdit47.Text;
      Dm.Td_Pesso.FieldByName('letra_reg').asString          := MaskEdit14.Text;
      Dm.Td_Pesso.FieldByName('tipo_reg').asString           := ComboBox10.Text;
      Dm.Td_Pesso.FieldByName('letra_protoc').asString       := MaskEdit13.Text;
      Dm.Td_Pesso.FieldByName('numero_rolo').asString        := MaskEdit7.Text;
      Dm.Td_Pesso.FieldByName('numero_micfilme').asString    := MaskEdit3.Text;
      Dm.Td_Pesso.FieldByName('registro_primitivo').asString := MaskEdit12.Text;
      Dm.Td_Pesso.FieldByName('seq_averbacao').asString      := MaskEdit10.Text;
      Dm.Td_Pesso.FieldByName('registro').asString           := Trim(MaskEdit6.Text);
      Dm.Td_Pesso.FieldByName('nome').asString               := Trim(MaskEdit23.Text);
      Dm.Td_Pesso.FieldByName('tip_doc1').asString           := Trim(ComboBox1.Text);
      Dm.Td_Pesso.FieldByName('doc1').asString               := TirarTudo(MaskEdit27.Text, '.', '-', '/');
      Dm.Td_Pesso.FieldByName('tip_doc2').asString           := Trim(ComboBox2.Text);
      Dm.Td_Pesso.FieldByName('doc2').asString               := Trim(MaskEdit28.Text);
      Dm.Td_Pesso.FieldByName('cep').asString                := TirarTudo(MaskEdit22.Text, '-','','');
      Dm.Td_Pesso.FieldByName('endereco').asString           := Trim(MaskEdit18.Text);
      Dm.Td_Pesso.FieldByName('numero').asString             := Trim(MaskEdit9.Text);
      Dm.Td_Pesso.FieldByName('complem').asString            := Trim(MaskEdit25.Text);
      Dm.Td_Pesso.FieldByName('bairro').asString             := Trim(MaskEdit19.Text);
      Dm.Td_Pesso.FieldByName('cidade').asString             := Trim(MaskEdit20.Text);
      Dm.Td_Pesso.FieldByName('estado').asString             := Trim(MaskEdit21.Text);
      Dm.Td_Pesso.FieldByName('observacao').asString         := Trim(RichEdit1.Text);
      Dm.Td_Pesso.FieldByName('nacionalidade').asString      := Trim(MaskEdit11.Text);
      Dm.Td_Pesso.FieldByName('estcivil').asString           := Trim(ComboBox4.Text);
      Dm.Td_Pesso.FieldByName('profissao').asString          := Trim(MaskEdit16.Text);
      Dm.Td_Pesso.FieldByName('situacao').asString           := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));
      Dm.Td_Pesso.Post;
      Dm.Td_Pesso.Close;
    End;
    result:= True;
  except
    on E: Exception do
       begin
         MessageDlg('Ocorreu um erro ao gravar na tabela das partes ! '+
                    'Tente Novamente ou comunique ao Administrador SISCART!'+#10+#10+E.Message,mtError,[mbOk],0);
         result := False;
       end;
  End;


end;

procedure TF_Retroativo.MaskEdit4Exit(Sender: TObject);
begin
  if (F_Menu.Label39.Caption <> '34377622000155') or (F_Menu.Label39.Caption <> '34.377.622/0001-55') Then  //2º RTD
  Begin
    if MaskEdit4.Text <> '' Then
    Begin
      Dm.Td.Close;
      Dm.Td.Sql.Clear;
      Dm.Td.Sql.Add('SELECT * FROM td');
      Dm.Td.Sql.Add('WHERE');
      Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit4.Text));
      Dm.Td.Open;
      if (MaskEdit4.Text <> '')  Then
      Begin
        if MaskEdit6.Text = '' Then
          MaskEdit6.Text:= Dm.Td.FieldByName('registro').AsString;

        if MaskEdit77.Text = '' Then
          MaskEdit77.Text:= Dm.Td.FieldByName('data_p').AsString;

        if MaskEdit5.Text = '' Then
          MaskEdit5.Text:= Dm.Td.FieldByName('data_r').AsString;

        if MaskEdit8.Text = '' Then
          MaskEdit8.Text:= Dm.Td.FieldByName('ext_nat').AsString;
      End
    End;  
  End;
end;

procedure TF_Retroativo.BitBtn9Click(Sender: TObject);
begin
  if (not Permissao('acesso046')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Anot, F_Anot);
  if (MaskEdit1.Text <> '') then
  begin
       F_Anot.chamada_externa := True;
       F_Anot.MaskEdit1.Text := MaskEdit6.Text;
  end;
  F_Anot.tela := 'retroativo';
  F_Anot.ShowModal;
  F_Anot.Destroy;
  F_Anot := NIL;
end;

procedure TF_Retroativo.FormShow(Sender: TObject);
begin
  Carrega_Natureza('RETROATIVO');
  if (F_Menu.Label39.Caption <> '34377622000155') then
  begin
    BitBtn11.Visible:= False;
    BitBtn13.Visible:= False;
  end;
end;

procedure TF_Retroativo.MaskEdit8Exit(Sender: TObject);
var
  util : String;
  pz   : Integer;
begin
  if (not ValidNumero(MaskEdit8.Text)) OR (MaskEdit8.Text = '0') then
  begin
    MaskEdit8.Text := '0';
    Combobox3.SetFocus;
  end
  else
  begin
    dm.Natureza.close;
    dm.Natureza.sql.clear;
    dm.natureza.sql.add('select * from natureza where cod = ' + MaskEdit8.Text);
    dm.Natureza.Open;
    if dm.Natureza.RecordCount <> 0 then
      ComboBox3.Text := Dm.Natureza.FieldByName('natureza').AsString;
      ComboBox3Exit(sender);
    UpdateWindow(Handle);
  end;
end;


procedure TF_Retroativo.ComboBox3Exit(Sender: TObject);
begin
  if ComboBox3.Text <> '' then
  begin
    dm.Natureza.Close;
    dm.Natureza.sql.Clear;
    dm.natureza.SQL.add('select * from natureza where natureza = "' + trim(copy(ComboBox3.Text, 1, 50)) + '"');
    dm.natureza.Open;
    MaskEdit8.Text := dm.Natureza.FieldByName('cod').AsString;
  end;
end;

procedure TF_Retroativo.BitBtn10Click(Sender: TObject);
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

procedure TF_Retroativo.MaskEdit6Exit(Sender: TObject);
begin
  if MaskEdit6.Text <> '' Then
  Begin
    Dm.Retroativo.Close;
    Dm.Retroativo.Sql.Clear;
    Dm.Retroativo.Sql.Add('SELECT * FROM td_cert where');
    Dm.Retroativo.Sql.Add('protocolo = ' + Trim(MaskEdit6.Text));
    try
      Dm.Retroativo.Open;
    finally
      Carregar;
      if Dm.Retroativo.RecordCount < 0 then
      begin
        BitBtn1.Caption := '&Incluir';
        //if BitBtn3.Caption = '&Correção' then
        BitBtn3Click(Sender);
        //BitBtn3.Caption := '&Salvar';
      end;
      MaskEdit14.SetFocus;
    end;
  End;
end;

procedure TF_Retroativo.ComboBox10Change(Sender: TObject);
begin
  if ComboBox10.Text = 'Mic.' then
    PageControl1.ActivePage:= TabSheet1;

  if ComboBox10.Text = 'Reg.' then
    PageControl1.ActivePage:= TabSheet3;

  if ComboBox10.Text = 'Av.' then
    PageControl1.ActivePage:= TabSheet2;
end;

procedure TF_Retroativo.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_Retroativo.BitBtn11Click(Sender: TObject);
begin
  dm.qryGenerico_Aux.Close;
  dm.qryGenerico_Aux.SQL.Clear;
  dm.qryGenerico_Aux.SQL.Add('SELECT * FROM configur');
  dm.qryGenerico_Aux.Open;

  Winexec(Pchar('C:\WINDOWS\EXPLORER.EXE /n,'+Dm.qryGenerico_Aux.FieldByName('imgmicrofilme_antigo').asString),sw_showNormal);
end;

procedure TF_Retroativo.BitBtn13Click(Sender: TObject);
begin
  dm.qryGenerico_Aux.Close;
  dm.qryGenerico_Aux.SQL.Clear;
  dm.qryGenerico_Aux.SQL.Add('SELECT * FROM configur');
  dm.qryGenerico_Aux.Open;

  Winexec(Pchar('C:\WINDOWS\EXPLORER.EXE /n,'+Dm.qryGenerico_Aux.FieldByName('imgdigregistroantigo').asString),sw_showNormal);
end;

procedure TF_Retroativo.MaskEdit24KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 Then
  Begin
    Key:=#0;
    Perform(Wm_NextDlgCtl,0,0);
  End;
end;

procedure TF_Retroativo.CarregaVariaveisRetroativo;
var
  protocolo, letra_reg, tipo_reg, p_auxiliar, letra_protoc, data_p, data_r,
  numero_rolo, numero_micfilme, registro_primitivo, seq_averbacao, registro,
  codnatureza, letra_livro, nome_parte_retroativo, observacao, contrato, parcelas,
  parc2, parc3, parc4, parc5, parc6, selo, validador: String;
  capital_social, cotas, val_parc, val_parc2, val_parc3, val_parc4, val_parc5, val_parc6: Currency;
begin
  protocolo             := Dm.Retroativo.FieldByName('protocolo').AsString;
  letra_reg             := Dm.Retroativo.FieldByName('letra_reg').AsString;
  tipo_reg              := Dm.Retroativo.FieldByName('tipo_reg').AsString;
  p_auxiliar            := Dm.Retroativo.FieldByName('p_auxiliar').AsString;
  letra_protoc          := Dm.Retroativo.FieldByName('letra_protoc').AsString;
  data_p                := Dm.Retroativo.FieldByName('data_p').AsString;
  data_r                := Dm.Retroativo.FieldByName('data_r').AsString;
  numero_rolo           := Dm.Retroativo.FieldByName('numero_rolo').AsString;
  numero_micfilme       := Dm.Retroativo.FieldByName('numero_micfilme').AsString;
  registro_primitivo    := Dm.Retroativo.FieldByName('registro_primitivo').AsString;
  seq_averbacao         := Dm.Retroativo.FieldByName('seq_averbacao').AsString;
  registro              := Dm.Retroativo.FieldByName('registro').AsString;
  codnatureza           := Dm.Retroativo.FieldByName('natureza').AsString;
  letra_livro           := Dm.Retroativo.FieldByName('tp_livro').AsString;
  nome_parte_retroativo := Dm.Retroativo.FieldByName('nome_parte_retroativo').AsString;
  capital_social        := Dm.Retroativo.FieldByName('sociedadecapital').AsCurrency;
  cotas                 := Dm.Retroativo.FieldByName('sociedadecotas').AsCurrency;

  contrato              :=  Dm.Retroativo.FieldByName('contrato').AsString;
  parcelas              :=  Dm.Retroativo.FieldByName('parcelas').AsString;
  parc2                 :=  Dm.Retroativo.FieldByName('parc2').AsString;
  parc3                 :=  Dm.Retroativo.FieldByName('parc3').AsString;
  parc4                 :=  Dm.Retroativo.FieldByName('parc4').AsString;
  parc5                 :=  Dm.Retroativo.FieldByName('parc5').AsString;
  parc6                 :=  Dm.Retroativo.FieldByName('parc6').AsString;
  ven_parc              :=  Dm.Retroativo.FieldByName('ven_parc').AsString;
  ven_parc2             :=  Dm.Retroativo.FieldByName('ven_parc2').AsString;
  ven_parc3             :=  Dm.Retroativo.FieldByName('ven_parc3').AsString;
  ven_parc4             :=  Dm.Retroativo.FieldByName('ven_parc4').AsString;
  ven_parc5             :=  Dm.Retroativo.FieldByName('ven_parc5').AsString;
  ven_parc6             :=  Dm.Retroativo.FieldByName('ven_parc6').AsString;
  val_parc              :=  Dm.Retroativo.FieldByName('val_parc').AsCurrency;
  val_parc2             :=  Dm.Retroativo.FieldByName('val_parc2').AsCurrency;
  val_parc3             :=  Dm.Retroativo.FieldByName('val_parc3').AsCurrency;
  val_parc4             :=  Dm.Retroativo.FieldByName('val_parc4').AsCurrency;
  val_parc5             :=  Dm.Retroativo.FieldByName('val_parc5').AsCurrency;
  val_parc6             :=  Dm.Retroativo.FieldByName('val_parc6').AsCurrency;
  mod_eti               :=  Dm.Retroativo.FieldByName('mod_eti').AsString;
  qtde_eti              :=  Dm.Retroativo.FieldByName('qtde_eti').AsString;
  livro_b               :=  Dm.Retroativo.FieldByName('livro_b').AsString;
  folha_b               :=  Dm.Retroativo.FieldByName('folha_b').AsString;
  data_reti             :=  Dm.Retroativo.FieldByName('data_reti').AsString;
  anotacao              :=  Dm.Retroativo.FieldByName('anotacao').AsString;
  selo                  :=  Dm.Retroativo.FieldByName('selo').AsString;
  validador             :=  Dm.Retroativo.FieldByName('validador').AsString;

  novoCadastroParte(protocolo, letra_reg, tipo_reg, p_auxiliar,
  letra_protoc, data_p, data_r, numero_rolo, numero_micfilme, registro_primitivo, seq_averbacao,
  registro, codnatureza, letra_livro, nome_parte_retroativo, contrato, parcelas, parc2, parc3,
  parc4, parc5, parc6, selo, validador, val_parc, val_parc2, val_parc3, val_parc4, val_parc5, val_parc6);
end;

procedure TF_Retroativo.novoCadastroParte(protocolo, letra_reg, tipo_reg, p_auxiliar, letra_protoc, data_p, data_r,
              numero_rolo, numero_micfilme, registro_primitivo, seq_averbacao, registro, codnatureza,
              letra_livro, nome_parte_retroativo, contrato, parcelas, parc2, parc3, parc4, parc5, parc6, selo, validador: String;
              val_parc, val_parc2, val_parc3, val_parc4, val_parc5, val_parc6 : Currency);
begin
  Dm.Edita_Retro.Close;
  Dm.Edita_Retro.SQL.Clear;
  Dm.Edita_Retro.SQL.Add('select * from td_cert where recno = 0');
  Dm.Edita_Retro.Open;
  Dm.Edita_Retro.Insert;
  if data_p <> '  /  /    ' then
    Dm.Edita_Retro.FieldByName('data_p').AsString             := data_p;
  if data_r <> '  /  /    ' then
    Dm.Edita_Retro.FieldByName('data_r').AsString             := data_r;
  Dm.Edita_Retro.FieldByName('tipo_reg').AsString             := tipo_reg;
  Dm.Edita_Retro.FieldByName('letra_reg').AsString            := letra_reg;
  if Dm.Edita_Retro.FieldByName('tp_livro').AsString = '' Then
    Dm.Edita_Retro.FieldByName('tp_livro').AsString           := 'A'
  else
    Dm.Edita_Retro.FieldByName('tp_livro').AsString           := letra_livro;
  Dm.Edita_Retro.FieldByName('letra_protoc').AsString         := letra_protoc;
  Dm.Edita_Retro.FieldByName('numero_rolo').AsString          := numero_rolo;
  Dm.Edita_Retro.FieldByName('numero_micfilme').AsString      := numero_micfilme;
  Dm.Edita_Retro.FieldByName('registro_primitivo').AsString   := registro_primitivo;
  Dm.Edita_Retro.FieldByName('seq_averbacao').AsString        := seq_averbacao;
  Dm.Edita_Retro.FieldByName('p_auxiliar').AsString           := p_auxiliar;
  Dm.Edita_Retro.FieldByName('protocolo').AsString            := protocolo;
  Dm.Edita_Retro.FieldByName('registro').AsString             := registro;
  Dm.Edita_Retro.FieldByName('natureza').AsString             := codnatureza;
  Dm.Edita_Retro.FieldByName('nome_parte_retroativo').AsString:= nome_parte_retroativo;
  MaskEdit8Exit(nil);
  ComboBox2.setFocus;

  Dm.Edita_Retro.FieldByName('contrato').AsString            := contrato;
  Dm.Edita_Retro.FieldByName('parcelas').AsString            := parcelas;
  Dm.Edita_Retro.FieldByName('parc2').AsString               := parc2;
  Dm.Edita_Retro.FieldByName('parc3').AsString               := parc3;
  Dm.Edita_Retro.FieldByName('parc4').AsString               := parc4;
  Dm.Edita_Retro.FieldByName('parc5').AsString               := parc5;
  Dm.Edita_Retro.FieldByName('parc6').AsString               := parc6;
  Dm.Edita_Retro.FieldByName('ven_parc').AsString            := ven_parc;
  Dm.Edita_Retro.FieldByName('ven_parc2').AsString           := ven_parc2;
  Dm.Edita_Retro.FieldByName('ven_parc3').AsString           := ven_parc3;
  Dm.Edita_Retro.FieldByName('ven_parc4').AsString           := ven_parc4;
  Dm.Edita_Retro.FieldByName('ven_parc5').AsString           := ven_parc5;
  Dm.Edita_Retro.FieldByName('ven_parc6').AsString           := ven_parc6;
  Dm.Edita_Retro.FieldByName('val_parc').AsCurrency          := val_parc;
  Dm.Edita_Retro.FieldByName('val_parc2').AsCurrency         := val_parc2;
  Dm.Edita_Retro.FieldByName('val_parc3').AsCurrency         := val_parc3;
  Dm.Edita_Retro.FieldByName('val_parc4').AsCurrency         := val_parc4;
  Dm.Edita_Retro.FieldByName('val_parc5').AsCurrency         := val_parc5;
  Dm.Edita_Retro.FieldByName('val_parc6').AsCurrency         := val_parc6;
  Dm.Edita_Retro.FieldByName('mod_eti').AsString             := mod_eti;
  Dm.Edita_Retro.FieldByName('qtde_eti').AsString            := qtde_eti;
  Dm.Edita_Retro.FieldByName('livro_b').AsString             := livro_b;
  Dm.Edita_Retro.FieldByName('folha_b').AsString             := folha_b;
  if data_reti <> '  /  /    ' then
    Dm.Edita_Retro.FieldByName('data_reti').AsString         := data_reti;
  Dm.Edita_Retro.FieldByName('anotacao').AsString            := anotacao;
  Dm.Edita_Retro.FieldByName('selo').AsString                := selo;
  Dm.Edita_Retro.FieldByName('validador').AsString           := validador;
end;

procedure TF_Retroativo.limpaCamposPartes;
begin
  ComboBox1.Text      := '';
  MaskEdit27.Text     := '';
  ComboBox2.Text      := '';
  MaskEdit28.Text     := '';
  MaskEdit23.text     := '';
  ComboBox7.ItemIndex := -1;
  MaskEdit22.Text     := '';
  MaskEdit18.Text     := '';
  MaskEdit9.Text      := '';
  MaskEdit25.Text     := '';
  MaskEdit19.Text     := '';
  MaskEdit20.Text     := '';
  MaskEdit21.Text     := '';
  MaskEdit11.Text     := '';
  ComboBox4.ItemIndex := -1;
  MaskEdit16.Text     := '';
  RichEdit1.Text      := '';
end;

procedure TF_Retroativo.btNovoParteClick(Sender: TObject);
begin
  if btNovoParte.Caption = 'Novo' then
  begin
    btNovoParte.Caption := 'Gravar';
    limpaCamposPartes;
    CarregaVariaveisRetroativo;
    ComboBox1.SetFocus;
  end
  else if btNovoParte.Caption = 'Gravar' then
  begin
    if (MessageBox(Handle, PChar('Deseja gravar os dados da parte?'), 'INCLUSÃO', MB_YESNO + MB_ICONQUESTION) = IDyes) then
    begin
      if MaskEdit6.Text = '' Then
      Begin
        ShowMessage('Campo: Registro, deve ser preenchido!');
        Abort;
      End;

      if MaskEdit8.Text = '' Then
      Begin
        ShowMessage('Campo: Natureza, deve ser preenchido!');
        Abort;
      End;

      if MaskEdit23.Text = '' Then
      Begin
        ShowMessage('Campo: Nome, deve ser preenchido!');
        Abort;
      End;

      if ComboBox7.Text = '' Then
      Begin
        ShowMessage('Campo: Situação, deve ser preenchido!');
        Abort;
      End;

      Dm.Edita_Retro.FieldByName('tip_doc1').asString            := Trim(ComboBox1.Text);
      Dm.Edita_Retro.FieldByName('doc1').asString                := TirarTudo(MaskEdit27.Text, '.', '-', '/');
      Dm.Edita_Retro.FieldByName('tip_doc2').asString            := Trim(ComboBox2.Text);
      Dm.Edita_Retro.FieldByName('doc2').asString                := Trim(MaskEdit28.Text);
      Dm.Edita_Retro.FieldByName('nome').asString                := Trim(maskedit23.text);
      Dm.Edita_Retro.FieldByName('endereco').asString            := Trim(MaskEdit18.Text);
      Dm.Edita_Retro.FieldByName('bairro').asString              := Trim(MaskEdit19.Text);
      Dm.Edita_Retro.FieldByName('cidade').asString              := Trim(MaskEdit20.Text);
      Dm.Edita_Retro.FieldByName('estado').asString              := Trim(MaskEdit21.Text);
      Dm.Edita_Retro.FieldByName('cep').asString                 := TirarTudo(MaskEdit22.Text, '-','','');
      Dm.Edita_Retro.FieldByName('numero').asString              := Trim(MaskEdit9.Text);
      Dm.Edita_Retro.FieldByName('complem').asString             := Trim(MaskEdit25.Text);
      Dm.Edita_Retro.FieldByName('nacionalidade').AsString       := MaskEdit11.Text;
      Dm.Edita_Retro.FieldByName('profissao').AsString           := MaskEdit16.Text;
      Dm.Edita_Retro.FieldByName('estcivil').AsString            := ComboBox4.Text;
      Dm.Edita_Retro.FieldByName('observacao').AsString          := RichEdit1.Text;
      Dm.Edita_Retro.FieldByName('situacao').asString            := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));
      Dm.Edita_Retro.Post;

      if (Dm.Edita_Retro.State = DsInsert) Then
        GravandoAsPartes('Inclusao')
      else
        GravandoAsPartes('Edicao');

      Application.MessageBox('Registro salvo com sucesso!', 'Cadastro de Retroativo', Mb_IconInformation);
      Atualizar(Sender, true);
      btNovoParte.Caption := 'Novo';
    end
    else
    begin
      Atualizar(Sender, true);
      btNovoParte.Caption := 'Novo';
    end;
  end;
end;

procedure TF_Retroativo.btExcluirParteClick(Sender: TObject);
begin
  Dm.Retroativo.Delete;
  Atualizar(Sender, false);
end;

procedure TF_Retroativo.MaskEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then MaskEdit8.SetFocus;
end;

procedure TF_Retroativo.btCorrigirParteClick(Sender: TObject);
begin
  corrigirPessoaRetroativo;
end;

procedure TF_Retroativo.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_Retroativo.MaskEdit47KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit14.SetFocus;
end;

end.


