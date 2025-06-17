unit RecepR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DBCtrls, Printers, Buttons, RDprint, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, RpCon, RpConDS, RpBase, RpSystem,
  RpDefine, RpRave, ComCtrls, jpeg, Db, DBTables;

type
  TF_RecepR = class(TForm)
    PrintDialog1: TPrintDialog;
    RvSystem1: TRvSystem;
    ControlBar1: TControlBar;
    Label36: TLabel;
    RvDataSetConnection1: TRvDataSetConnection;
    RvDataSetConnection2: TRvDataSetConnection;
    RvSystem2: TRvSystem;
    RvProject2: TRvProject;
    RvProject3: TRvProject;
    RvSystem3: TRvSystem;
    RvDataSetConnection3: TRvDataSetConnection;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    RichEdit4: TRichEdit;
    RichEdit5: TRichEdit;
    RichEdit6: TRichEdit;
    RichEdit7: TRichEdit;
    RichEdit8: TRichEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox4: TGroupBox;
    Label22: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label32: TLabel;
    Label40: TLabel;
    Label43: TLabel;
    Label4: TLabel;
    Label52: TLabel;
    MaskEdit17: TMaskEdit;
    MaskEdit18: TMaskEdit;
    MaskEdit19: TMaskEdit;
    ComboBox1: TComboBox;
    MaskEdit27: TMaskEdit;
    ComboBox7: TComboBox;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit12: TMaskEdit;
    ComboBox8: TComboBox;
    MkEmail: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Panel3: TPanel;
    Label35: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label38: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label41: TLabel;
    Label37: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label39: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label50: TLabel;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    MaskEdit16: TMaskEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    ComboBox3: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    MaskEdit24: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit26: TMaskEdit;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    MaskEdit4: TMaskEdit;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    ComboBox4: TComboBox;
    ComboBox9: TComboBox;
    MaskEdit5: TMaskEdit;
    ComboBox10: TComboBox;
    MaskEdit6: TMaskEdit;
    CurrencyEdit9: TCurrencyEdit;
    MaskEdit11: TMaskEdit;
    CurrencyEdit10: TCurrencyEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    GroupBox2: TGroupBox;
    CheckBox4: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    MaskEdit15: TMaskEdit;
    MaskEdit20: TMaskEdit;
    btImprimir: TBitBtn;
    Memo1: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label25: TLabel;
    Label34: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit8: TMaskEdit;
    TabSheet2: TTabSheet;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label51: TLabel;
    spbPesquisa: TSpeedButton;
    Label5: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    mkDataInicial: TMaskEdit;
    mkDataFinal: TMaskEdit;
    MkProtocolo: TMaskEdit;
    DtsPesquisaRecep: TDataSource;
    qryPesquisaRecep: TQuery;
    RvProject1: TRvProject;
    RvProject4: TRvProject;
    RvSystem4: TRvSystem;
    RvDataSetConnection4: TRvDataSetConnection;
    Memo2: TMemo;
    Memo3: TMemo;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit28KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox7KeyDown(Sender: TObject; var Key: Word;
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
    Procedure Gravar(Sender : TOBject);
    Procedure Gravar_New(Sender : TOBject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    Procedure Limpar_Tela(Sender : TOBject);
    Procedure Habilitar_Tela(Habilita : Boolean);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit17Exit(Sender: TObject);
    procedure ComboBox7Enter(Sender: TObject);
    procedure ComboBox7KeyPress(Sender: TObject; var Key: Char);
    Procedure Limpa_TelaPessoal(Sender : TOBject);
    procedure ComboBox5Enter(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure CurrencyEdit3Exit(Sender: TObject);
    Procedure BuscaTextoCombo(Sender : TObject; Combo : Integer);
    procedure ComboBox1Exit(Sender: TObject);
    procedure MaskEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Enter(Sender: TObject);
    procedure MaskEdit27Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit24Exit(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox5KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox6KeyPress(Sender: TObject; var Key: Char);
    procedure CurrencyEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox10Exit(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure MaskEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure MaskEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure MaskEdit10Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure MkEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spbPesquisaClick(Sender: TObject);
    procedure MkProtocolo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure mkDataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mkDataFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabSheet2Show(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MkProtocoloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    NaoInserirRecepcao: Boolean;
    ndaje, sdaje, ndajepost, ndajevias, serie_dajeVias : String;
    Function Gera_Recibo : Integer;

  end;

var
  F_RecepR: TF_RecepR;
  tipo_, arq       : String;
  codcli           : String;
  qcartorio        : String;
  num_rec          : Integer;
  vdajepost        : Currency;
  qtdPagina        : Integer;
  valorDoDajeConformeTabela: Currency;
  bNaoExibirDataDeEntregaNoReciboDeProtocolo: Boolean;

implementation

uses DMTD, Menu, Func, Dep1, U_Autent, TRecep, Alerta2, FuncGeral, ProcGeral,
  New_CalcT, Daje, DajePost, DajeVias, U_DAJE_TJ, Exame;

{$R *.DFM}

function trunca2casa( valor:currency ):currency;
var
  vv : String;
begin
  vv := formatcurr('###,###,###,###,#0.0000',valor);
  vv := Copy(vv,1,length(vv) - 2);
  result := strtocurr(vv);
end;

Procedure Grava_TDPedid;
begin
{  DM.ArqAux.Close;
  DM.ArqAux.Sql.Clear;
  DM.ArqAux.Sql.Add('SELECT * FROM ' + F_RecepR.Label40.Caption);
  DM.ArqAux.Open;

  DM.ArqAux.FindFirst;

  while not DM.ArqAux.Eof do
  begin
    DM.TD_Pedid.Close;
    DM.TD_Pedid.Sql.Clear;
    DM.TD_Pedid.Sql.Add('INSERT INTO td_pedid (data_r, p_auxiliar, recibo, cod_lae, tabela, item, subitem, descricao, valor_unit,');
    DM.TD_Pedid.Sql.Add(' qtde, valor_calc, tipo_prot)');
    DM.TD_Pedid.Sql.Add(' VALUES (');
    DM.TD_Pedid.Sql.Add(QuotedStr(ConvData(F_RecepR.MaskEdit1.Text)) + ', ');
    DM.TD_Pedid.Sql.Add(F_RecepR.Label3.Caption + ', ');
    DM.TD_Pedid.Sql.Add(F_RecepR.MaskEdit8.Text + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('codigo').AsString)     + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('tabela').AsString)     + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('item_tab').AsString)   + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('subitem').AsString)    + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('descr_tab').AsString)  + ', ');
    DM.TD_Pedid.Sql.Add(TrocaVirgulaporPonto(CurrToStr(DM.ArqAux.fieldbyname('valor_unit').AsCurrency)) + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('qtde').AsString)       + ', ');
    DM.TD_Pedid.Sql.Add(TrocaVirgulaporPonto(CurrToStr(DM.ArqAux.fieldbyname('valor_calc').AsCurrency)) + ', ');
    DM.TD_Pedid.Sql.Add('"T" )');
    DM.TD_Pedid.ExecSQL;
    DM.ArqAux.Next;
  end;  }
end;


Procedure TF_RecepR.BuscaTextoCombo(Sender : TObject; Combo : Integer);
var
  x : Integer;
begin

  {
  // Mostrando clientes.
  if (Combo = 1) then
  begin
    x := 0;
    while x <= (F_RecepR.ComboBox2.Items.Count - 1) do
    begin
      if (Copy(F_RecepR.ComboBox2.Items.Strings[x], 1, 3) = F_RecepR.MaskEdit2.Text) then
      begin
        F_RecepR.ComboBox2.Text := F_RecepR.ComboBox2.Items.Strings[x];
        x := F_RecepR.ComboBox2.Items.Count;
      end;
      x := x + 1;
    end;
  end;
  // mostrando filiais
  if (Combo = 2) then
  begin
    x := 0;
    while x <= (F_RecepR.ComboBox8.Items.Count - 1) do
    begin
      if (Copy(F_RecepR.ComboBox8.Items.Strings[x], 1, 3) = F_RecepR.MaskEdit3.Text) then
      begin
        F_RecepR.ComboBox8.Text := F_RecepR.ComboBox8.Items.Strings[x];
        x := F_RecepR.ComboBox8.Items.Count;
      end;
      x := x + 1;
    end;
  end;
  // mostrando naturezas
  if (Combo = 3) then
  begin
    x := 0;
    while x <= (F_RecepR.ComboBox3.Items.Count - 1) do
    begin
      if (Copy(F_RecepR.ComboBox3.Items.Strings[x], 1, 3) = F_RecepR.MaskEdit4.Text) then
      begin
        F_RecepR.ComboBox3.Text := F_RecepR.ComboBox3.Items.Strings[x];
        x := F_RecepR.ComboBox3.Items.Count;
      end;
      x := x + 1;
    end;
  end;
  UpdateWindow(Handle);
  }

end;

Procedure Abre_Configur;
begin
  DM.Configur.Close;
  DM.Configur.Sql.Clear;
  DM.Configur.Sql.Add('select * from configur');
  DM.Configur.Open;
end;


Function TF_RecepR.Gera_Recibo : Integer;
Begin
  If F_Menu.Label7.Caption <> 'Saquarema' then
  Begin
    DM.Configur.close;
    DM.Configur.sql.clear;
    DM.Configur.sql.add('select * from configur');
    DM.Configur.open;

    result := DM.Configur.fieldbyname('recibo').asinteger + 1;

    DM.Configur.close;
    DM.Configur.sql.clear;
    DM.Configur.sql.add('UPDATE configur set recibo = ' + QuotedStr((IntToStr(result))));
    DM.Configur.ExecSQL;
  End
  Else
  Begin
    DM.CaixaPJ.close;
    DM.CaixaPJ.sql.clear;
    DM.CaixaPJ.sql.add('select * from configur');
    DM.CaixaPJ.open;

    result := DM.CaixaPJ.fieldbyname('recibo').asinteger + 1;

    DM.CaixaPJ.close;
    DM.CaixaPJ.sql.clear;
    DM.CaixaPJ.sql.add('UPDATE configur set recibo = ' + QuotedStr((IntToStr(result))));
    DM.CaixaPJ.ExecSQL;
  End;
end;


Procedure TF_RecepR.Limpa_TelaPessoal(Sender : TOBject);
begin
  MaskEdit17.Text := '';
  MaskEdit27.Text := '';
  MaskEdit18.Text := '';
  MaskEdit2.Text := '';
  MaskEdit19.Text := '';
  MaskEdit12.Text := '';
  ComboBox7.Text  := '';
  MkEmail.Text    := '';
  Memo1.Lines.Clear;
end;

Procedure TF_RecepR.Limpar_Tela(Sender : TOBject);
begin
  //MaskEdit2.Text       := '0';
  //ComboBox2.Text       := '';
  //MaskEdit3.Text       := '0';
  //ComboBox8.Text       := '';
  MaskEdit27.Text      := '';
  MaskEdit7.Text       := '';
  MaskEdit17.Text      := '';
  MaskEdit18.Text      := '';
  MaskEdit2.Text       := '';
  MaskEdit19.Text      := '';
  MaskEdit12.Text      := '';
  MaskEdit4.Text       := '0';
  ComboBox3.Text       := '';
  MaskEdit20.Text      := '0';
  MaskEdit10.Text      := '0';
  MaskEdit15.Text      := '0';
  MaskEdit13.Text      := '0';
  CurrencyEdit1.Value  := 0.00;
  MaskEdit14.Text      := '0';
  CurrencyEdit2.Value  := 0.00;
  CurrencyEdit3.Value  := 0.00;
  CurrencyEdit10.Value := 0.00;

  BitBtn4.Enabled     := False;
  Label3.Caption      := '000000';
  MaskEdit8.Text      := '000000';
  //CodCli              := '0';
  tipo_               := 'T';
  Label35.Caption     := '';
  CurrencyEdit4.Value := 0.00;
  CurrencyEdit5.Value := 0.00;
  CurrencyEdit6.Value := 0.00;
  CurrencyEdit7.Value := 0.00;
  CurrencyEdit8.Value := 0.00;
  CurrencyEdit10.Value:= 0.00;
  Label6.Caption      := 'R$ 0,00';
  GroupBox1.Visible   := False;
  GroupBox4.Enabled   := True;
  MaskEdit5.Text      := '0';
  MaskEdit6.Text      := '';
  MaskEdit6.Visible   := False;
  Label33.Visible     := False;
  ComboBox9.Text      := '';
  ComboBox5.Text      := '4.1 - REGISTRO / AVERB. INTEGRAL COM VALOR';
  MaskEdit6.Text      := '';
  MaskEdit13.Text     := '0';
  MaskEdit14.Text     := '0';
  MkEmail.Text        := '';
  ListBox1.Clear;
  if (F_Menu.Label15.Caption = 'T') then MaskEdit1.Enabled := True else MaskEdit1.Enabled := False;
end;

Procedure TF_RecepR.Habilitar_Tela(Habilita : Boolean);
begin
  MaskEdit1.Enabled      := Habilita;
  //MaskEdit2.Enabled      := Habilita;
  //ComboBox2.Enabled      := Habilita;
  //MaskEdit3.Enabled      := Habilita;
  //ComboBox8.Enabled      := Habilita;
  ComboBox1.Enabled      := Habilita;
  MaskEdit27.Enabled     := Habilita;
  ComboBox11.Enabled     := Habilita;
  MaskEdit7.Enabled      := Habilita;
  MaskEdit17.Enabled     := Habilita;
  ComboBox7.Enabled      := Habilita;
  MaskEdit18.Enabled     := Habilita;
  MaskEdit2.Enabled      := Habilita;
  MaskEdit19.Enabled     := Habilita;
  MaskEdit12.Enabled     := Habilita;
  MaskEdit4.Enabled      := Habilita;
  ComboBox3.Enabled      := Habilita;
  ComboBox10.Enabled     := Habilita;
  ComboBox5.Enabled      := Habilita;
  MaskEdit20.Enabled     := Habilita;
  ComboBox6.Enabled      := Habilita;
  GroupBox2.Enabled      := Habilita;
  MaskEdit10.Enabled     := Habilita;
  MaskEdit15.Enabled     := Habilita;
  MaskEdit13.Enabled     := Habilita;
  CurrencyEdit1.Enabled  := Habilita;
  MaskEdit14.Enabled     := Habilita;
  CurrencyEdit2.Enabled  := Habilita;
  CurrencyEdit3.Enabled  := Habilita;
  CurrencyEdit10.Enabled := Habilita;
  BitBtn4.Enabled        := Habilita;
end;

procedure TF_RecepR.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then //MaskEdit2.SetFocus;
end;

procedure TF_RecepR.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit17.SetFocus;
end;

procedure TF_RecepR.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    //if (F_Menu.Label26.Caption = 'F') then MaskEdit2.SetFocus else ComboBox1.SetFocus;
  end
end;

procedure TF_RecepR.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit8.SetFocus;
end;

procedure TF_RecepR.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit15.SetFocus;
end;

Function GerarProtocolo : Boolean;
var
  geraprot : Boolean;
Begin
  Result := False;
  if (StrToInt(F_RecepR.Label3.Caption) = 0) then
  begin
    //verificando se o sistema está travado
    geraprot := False;
    while (not geraprot) do
    begin
      Dm.Seq_Bal.Close;
      Dm.Seq_Bal.Sql.Clear;
      if F_Menu.Label37.Caption = 'D' then
        Dm.Seq_Bal.Sql.Add('SELECT trava FROM seq_bal where cartorio = "D"')
      else
      Dm.Seq_Bal.Sql.Add('SELECT trava FROM seq_bal where cartorio = "' + qcartorio + '"');
      Dm.Seq_Bal.Open;
      if (Dm.Seq_Bal.FieldByName('trava').asString = 'N') then
      begin
        geraprot := True;
      end
      else ShowMessage('AGUARDE, VERIFICANDO CONFIGURAÇÕES...');
      Dm.Seq_Bal.Close;
    end;
    Dm.Seq_Bal.Close;
    Dm.Seq_Bal.RequestLive := False;
    Dm.Seq_Bal.Sql.Clear;
    if F_Menu.Label37.Caption = 'D' then
      Dm.Seq_Bal.Sql.Add('SELECT (oficial + 1) as oficial FROM seq_bal where cartorio = ''D''')
    else
      Dm.Seq_Bal.Sql.Add('SELECT (oficial + 1) as oficial FROM seq_bal where cartorio = "' + qcartorio + '"');
    Dm.Seq_Bal.Open;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT * FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + QuotedStr(Dm.Seq_Bal.FieldByName('oficial').AsString));
    Dm.ArqAux.Open;
    if Dm.ArqAux.RecordCount = 0 then
    begin
      Dm.Seq_Bal.Close;
      Dm.Seq_Bal.RequestLive := False;
      Dm.Seq_Bal.Sql.Clear;
      Dm.Seq_Bal.Sql.Add('UPDATE seq_bal SET');
      Dm.Seq_Bal.Sql.Add('oficial = (oficial + 1)');
      if F_Menu.Label37.Caption = 'D' then
      dm.Seq_Bal.sql.add('where cartorio = "D"')
      else
      dm.Seq_Bal.sql.add('where cartorio = "' + qcartorio + '"');
      Dm.Seq_Bal.ExecSql;
      Dm.Seq_Bal.Close;
      Dm.Seq_Bal.RequestLive := True;
      Dm.Seq_Bal.Sql.Clear;
      if F_Menu.Label37.Caption = 'D' then
      Dm.Seq_Bal.Sql.Add('SELECT oficial FROM seq_bal where cartorio = ''D''')
      else
      Dm.Seq_Bal.Sql.Add('SELECT oficial FROM seq_bal where cartorio = "' + qcartorio + '"');
      Dm.Seq_Bal.Open;
      F_RecepR.Label3.Caption := StrZero(Dm.Seq_Bal.FieldByName('oficial').asString, 6);
      Result := True;
      Dm.Seq_Bal.Close;
    end
    else
    begin
      ShowMessage('Por favor, verifique a sequência do protocolo ' + Dm.Seq_Bal.FieldByName('oficial').AsString + ', DUPLICIDADE!');
      Result := False;
    end;
  end;
end;

Procedure TF_RecepR.Gravar(Sender : TOBject);
var
  x: Integer;
begin
  Dm.Td.Append;
  Dm.Td.FieldByName('data_r').asString               := MaskEdit1.text;
  Dm.Td.FieldByName('p_auxiliar').asString           := Label3.Caption;
  DM.TD.FieldByName('recibo').AsString               := trim(MaskEdit8.Text);
  Dm.Td.FieldByName('ncliente').asInteger            := StrToInt(CodCli);
  Dm.Td.FieldByName('cod_cli').asstring              := CodCli;
  Dm.Td.FieldByName('cod_port').asstring             := CodCli;
  //Label37.Caption                                    := TimeToStr(time);
  Dm.Td.FieldByName('hora_p').asString               := TimeToStr(time);
  Dm.Td.FieldByName('status').asString               := 'RECEPCAO';
  Dm.Td.FieldByName('data_entr').asString            := Trim(Maskedit16.text);
  Dm.Td.FieldByName('identifica').asString           := F_Menu.Label1.Caption;
  Dm.Td.FieldByName('a_nome').asstring               := Trim(MaskEdit17.Text);
  //Dm.Td.FieldByName('a_cidade').asString             := Trim(Copy(ComboBox8.Text, 7, 100));
  //Dm.Td.FieldByName('agencia').asString              := Trim(Copy(ComboBox8.Text, 7, 100));
  Dm.Td.FieldByName('a_telefone').asstring           := Trim(MaskEdit18.Text);
  Dm.Td.FieldByName('celular').asstring              := Trim(MaskEdit2.Text);


  Dm.Td.FieldByName('contato').asstring              := Trim(MaskEdit19.Text);
  Dm.Td.FieldByName('a_cpff').asstring               := Trim(MaskEdit12.Text);
  Dm.Td.FieldByName('tip_doc').asString              := Trim(ComboBox1.Text);
  Dm.Td.FieldByName('doc').asString                  := TirarTudo(MaskEdit27.Text, '.', '/', '-');
  Dm.Td.FieldByName('tipo').asString                 := tipo_;
  Dm.Td.FieldByName('ext_nat').asString              := Trim(Copy(ComboBox3.Text, 1, 50));
  Dm.Td.FieldByName('natureza').asInteger            := StrToInt(MaskEdit4.Text);
  Dm.Td.FieldByName('tabela').asString               := Trim(Copy(ComboBox5.Text, 1,5));
  Dm.Td.FieldByName('divisor').asInteger             := StrToInt(Copy(ComboBox6.Text, 1,2));
  Dm.Td.FieldByName('v_total').asCurrency            := VrTotG;
  dm.td.FieldByName('v_doi').AsCurrency              := VrDoi;
  dm.td.FieldByName('v_doi_info').AsCurrency         := VrDoiInfo;
  dm.td.FieldByName('v_tribunal').AsCurrency         := calc_vfetj;//VrTribunal;
  dm.td.FieldByName('v_emolumentos').AsCurrency      := calc_emol;
  dm.td.FieldByName('v_procuradoria').AsCurrency     := VrProcuradoria;
  dm.td.FieldByName('v_defensoria').AsCurrency       := VrDefensoria;
  dm.td.FieldByName('v_mutua').AsCurrency            := VrMutua;
  dm.td.FieldByName('v_acoterj').AsCurrency          := VrAcoterj;
  dm.td.FieldByName('v_distrib').AsCurrency          := VrDistrib;
  dm.td.FieldByName('v_subtotal').AsCurrency         := VrSubTotal;
  Dm.Td.FieldByName('custas').asCurrency             := CurrencyEdit2.Value;
  Dm.Td.FieldByName('valor_base').asCurrency         := CurrencyEdit1.Value;
  Dm.Td.FieldByName('deposito').asCurrency           := CurrencyEdit3.Value;
  dm.td.FieldByName('doi').AsString                  := ComboBox4.Text;
  dm.td.FieldByName('qtd_doi').AsString              := MaskEdit11.Text;

  if ComboBox4.Text = 'S' then
  begin
    dm.td.FieldByName('v_doi').AsCurrency             := VrDoi;
    dm.td.FieldByName('v_doi_info').AsCurrency        := VrDoiInfo;
  end;

  dm.td.FieldByName('v_guia').AsCurrency             := VrGuia;
  dm.td.FieldByName('v_guia_info').AsCurrency        := VrGuiaInfo;

  if F_Menu.Label37.Caption = 'D' then
    //Distribuicao para qual cartório
  dm.td.FieldByName('cartorio').AsString             := qcartorio
  else
  dm.td.FieldByName('cartorio').AsString             := F_Menu.Label37.Caption;
  dm.TD.FieldByName('anotacao').AsString             := '';//MaskEdit6.Text;
  dm.td.FieldByName('tipo_reg').AsString             := ComboBox10.Text;
  dm.TD.FieldByName('livro').AsString                := MaskEdit13.Text;
  dm.td.FieldByName('folha').AsString                := MaskEdit14.Text;
  dm.td.FieldByName('email_apresentante').AsString   := MkEmail.Text;

  Dm.Td.Post;

  // Atualizando Td_Pesso
  Dm.Td_Pesso.Append;
  Dm.Td_Pesso.FieldByName('data').asString           := MaskEdit1.Text;
  Dm.Td_Pesso.FieldByName('tipo').asString           := tipo_;
  Dm.Td_Pesso.FieldByName('p_auxiliar').asString     := Trim(Label3.Caption);
  Dm.Td_Pesso.FieldByName('recibo').asString         := Trim(MaskEdit8.Text);
  Dm.Td_Pesso.FieldByName('nome').asString           := Trim(MaskEdit17.Text);
  Dm.Td_Pesso.FieldByName('tip_doc1').asString       := Trim(ComboBox1.Text);
  Dm.Td_Pesso.FieldByName('doc1').asString           := TirarTudo(MaskEdit27.Text, '.', '/', '-');
  Dm.Td_Pesso.FieldByName('tip_doc2').asString       := Trim(ComboBox11.Text);
  Dm.Td_Pesso.FieldByName('doc2').asString           := MaskEdit7.Text;

  Dm.Td_Pesso.FieldByName('situacao').asString       := Ver_Situacao1(Trim(ComboBox7.Text));
  dm.Td_Pesso.FieldByName('cartorio').AsString       := F_Menu.Label37.Caption;
  Dm.Td_Pesso.Post;

  //*************
  if F_Menu.Label37.Caption = 'D' then
  begin
    if (not Guarda_Mov(qcartorio, MaskEdit1.text, Label3.Caption, Trim(Copy(ComboBox5.Text, 1,5)), MaskEdit4.Text, CurrencyEdit2.Value)) then
    ShowMessage('Problemas para atualizar a Distribuicao.');
  end;

  if (not Atualiza_Caixa(MaskEdit1.Text, '10', 'E', 'TÍTULO PARA REGISTRO', Label3.Caption, Label35.Caption, F_Menu.Label1.Caption, Trim(MaskEdit17.Text), CurrencyEdit3.Value, CurrencyEdit4.Value, CurrencyEdit6.Value, CurrencyEdit5.Value, CurrencyEdit9.Value)) then
  begin
    ShowMessage('Problemas para atualizar o caixa.');
  end;

  Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Título recepcionado em ' + MaskEdit1.Text + '.', Label3.Caption);
end;

Procedure TF_RecepR.Gravar_New(Sender : TOBject);
var
  x: Integer;
  LivroProtocolo, FolhaProtocolo: Integer;
begin

  LivroProtocolo:= 0;
  FolhaProtocolo:= 0;

  Dm.Td.Append;
  Dm.Td.FieldByName('data_r').asString               := MaskEdit1.text;
  Dm.Td.FieldByName('p_auxiliar').asString           := Label3.Caption;
  DM.TD.FieldByName('recibo').AsString               := trim(MaskEdit8.Text);
  Dm.Td.FieldByName('ncliente').asInteger            := StrToInt(CodCli);
  Dm.Td.FieldByName('cod_cli').asstring              := CodCli;
  Dm.Td.FieldByName('cod_port').asstring             := CodCli;
  //Label37.Caption                                    := TimeToStr(time);
  Dm.Td.FieldByName('hora_p').asString               := TimeToStr(time);
  Dm.Td.FieldByName('status').asString               := 'RECEPCAO';
  Dm.Td.FieldByName('data_entr').asString            := Trim(Maskedit16.text);
  Dm.Td.FieldByName('identifica').asString           := F_Menu.Label1.Caption;
  Dm.Td.FieldByName('a_nome').asstring               := Trim(MaskEdit17.Text);
  //Dm.Td.FieldByName('a_cidade').asString             := Trim(Copy(ComboBox8.Text, 7, 100));
  //Dm.Td.FieldByName('agencia').asString              := Trim(Copy(ComboBox8.Text, 7, 100));
  Dm.Td.FieldByName('a_telefone').asstring           := Trim(MaskEdit18.Text);
  Dm.Td.FieldByName('celular').asstring              := Trim(MaskEdit2.Text);

  Dm.Td.FieldByName('contato').asstring              := Trim(MaskEdit19.Text);
  Dm.Td.FieldByName('a_cpff').asstring               := Trim(MaskEdit12.Text);
  Dm.Td.FieldByName('tip_doc').asString              := Trim(ComboBox1.Text);
  Dm.Td.FieldByName('doc').asString                  := TirarTudo(MaskEdit27.Text, '.', '/', '-');
  Dm.Td.FieldByName('tipo').asString                 := tipo_;
  Dm.Td.FieldByName('ext_nat').asString              := Trim(Copy(ComboBox3.Text, 1, 50));
  Dm.Td.FieldByName('natureza').asInteger            := StrToInt(MaskEdit4.Text);
  Dm.Td.FieldByName('tabela').asString               := Trim(Copy(ComboBox5.Text, 1,4));
  Dm.Td.FieldByName('divisor').asInteger             := StrToInt(Copy(ComboBox6.Text, 1,2));

  Dm.Td.FieldByName('qtde_nome').AsInteger           := qtd_nom;
  Dm.Td.FieldByName('v_nome').AsCurrency             := tot_nomexc;
  dm.td.FieldByName('v_infodistrib').AsCurrency      := VrTrib_nom + VrDefen_nom + VrProcu_nom;

  Dm.Td.FieldByName('pag_adic').AsString             := MaskEdit10.Text;  //qtd_pg;
  Dm.Td.FieldByName('v_pag').AsCurrency              := v_qtd_pg;
  Dm.Td.FieldByName('vias_adc').AsString             := MaskEdit15.Text;  //qtd_pg;

  dm.td.FieldByName('v_emolumentos').AsCurrency      := calc_emol;
  dm.td.FieldByName('v_tribunal').AsCurrency         := calc_vfetj;//VrTribunal;
  dm.td.FieldByName('v_procuradoria').AsCurrency     := VrProcuradoria;
  dm.td.FieldByName('v_defensoria').AsCurrency       := VrDefensoria;
  dm.td.FieldByName('v_mutua').AsCurrency            := VrMutua;
  dm.td.FieldByName('v_acoterj').AsCurrency          := VrAcoterj;
  dm.td.FieldByName('v_distrib').AsCurrency          := VrDistrib;
  dm.td.FieldByName('v_leis_dist').AsCurrency        := VrTrib_DIST + VrDefen_DIST + VrProcu_DIST;
  dm.td.FieldByName('v_subtotal').AsCurrency         := VrSubTotal;
  dm.td.FieldByName('v_total').AsCurrency            := VrTotG;
  Dm.Td.FieldByName('custas').asCurrency             := CurrencyEdit2.Value;
  Dm.Td.FieldByName('valor_base').asCurrency         := CurrencyEdit1.Value;
  Dm.Td.FieldByName('deposito').asCurrency           := CurrencyEdit3.Value;
  Dm.Td.FieldByName('v_cus_ter').asCurrency          := CurrencyEdit8.Value;
  dm.td.FieldByName('doi').AsString                  := ComboBox4.Text;
  dm.td.FieldByName('qtd_doi').AsString              := MaskEdit11.Text;

  if (F_Menu.livroAutomatico) and (v_chk_17) Then  //Informa se o sistema irá gerar sequencia automática
  begin
    {if (F_Menu.Label39.Caption = '28.287.131/0001-10') or (F_Menu.Label39.Caption = '28287131000110') or
      (F_Menu.Label39.Caption = '28.508.639/0001-00') or (F_Menu.Label39.Caption = '28508639000100') or
      (F_Menu.Label39.Caption = '27.215.296/0001-14') or (F_Menu.Label39.Caption = '27215296000114') or
      (F_Menu.Label39.Caption = '29.603.272/0001-68') or (F_Menu.Label39.Caption = '29603272000168') or
      (F_Menu.Label39.Caption = '29.603.272/0001-68') or (F_Menu.Label39.Caption = '29603272000168') or
      (F_Menu.Label39.Caption = '28.664.048/0001-13') or (F_Menu.Label39.Caption = '28664048000113') or
      (F_Menu.Label39.Caption = '01.221.489/0001-94') or (F_Menu.Label39.Caption = '01221489000194') or
      (F_Menu.Label39.Caption = '27.400.369/0001-48') or (F_Menu.Label39.Caption = '27400369000148') or
      (F_Menu.Label39.Caption = '27.251.207/0001-95') or (F_Menu.Label39.Caption = '27251207000195') or
      (F_Menu.Label39.Caption = '28.344.918/0001-77') or (F_Menu.Label39.Caption = '28344918000177') or
      (F_Menu.Label39.Caption = '29.649.551/0001-62') or (F_Menu.Label39.Caption = '29649551000162') or
      (F_Menu.Label39.Caption = '27.282.471/0001-96') or (F_Menu.Label39.Caption = '27282471000196') or
      (F_Menu.Label39.Caption = '27.146.890/0001-09') or (F_Menu.Label39.Caption = '27146890000109') or
      (F_Menu.Label39.Caption = '28.344.918/0001-77') or (F_Menu.Label39.Caption = '28344918000177') Then
    Begin }
      if F_Menu.Label54.Caption = '1-Produção' Then
      begin

        if (MaskEdit13.Text = '0') and (MaskEdit14.Text = '0') Then
          Dm.GerarNumeroFolhaAutomatico(0, strtoint(Label3.Caption), True, False, True, False, False, LivroProtocolo, FolhaProtocolo);  // Colocar para pegar a informação de livro automatico ou não da configur

        MaskEdit13.Text:= IntToStr(LivroProtocolo);
        MaskEdit14.Text:= IntToStr(FolhaProtocolo);
      end
    //end;
  end;

  dm.td.FieldByName('livro').AsString                := MaskEdit13.Text;
  dm.td.FieldByName('folha').AsString                := MaskEdit14.Text;

  if CheckBox1.Checked then dm.td.FieldByName('lva').AsString := 'X';
  if CheckBox2.Checked then dm.td.FieldByName('lvb').AsString := 'X';
  if CheckBox3.Checked then dm.td.FieldByName('lvc').AsString := 'X';
  if CheckBox4.Checked then dm.td.FieldByName('lvd').AsString := 'X';

  if ComboBox4.Text = 'S' then
  begin
    dm.td.FieldByName('v_doi').AsCurrency             := VrDoi;
    dm.td.FieldByName('v_doi_info').AsCurrency        := VrDoiInfo;
  end;

  dm.td.FieldByName('v_guia').AsCurrency             := VrGuia;
  dm.td.FieldByName('v_guia_info').AsCurrency        := VrGuiaInfo;

  if F_Menu.Label37.Caption = 'D' then
    //Distribuicao para qual cartório
  dm.td.FieldByName('cartorio').AsString             := qcartorio
  else
  dm.td.FieldByName('cartorio').AsString             := F_Menu.Label37.Caption;
  dm.TD.FieldByName('anotacao').AsString             := '';//MaskEdit6.Text;
  dm.td.FieldByName('tipo_reg').AsString             := ComboBox10.Text;
  Dm.Td.FieldByName('daje').asString                 := ndaje;
  Dm.Td.FieldByName('serie_daje').asString           := sdaje;
  Dm.Td.FieldByName('dajepost').asString             := ndajepost;
  Dm.Td.FieldByName('qtdpost').asString              := MaskEdit20.Text;
  Dm.Td.FieldByName('valordajepost').AsCurrency      := vdajepost;
  Dm.Td.FieldByName('dajevias').asString             := ndajevias;
  Dm.Td.FieldByName('serie_vias').asString           := serie_dajeVias;
  dm.td.FieldByName('email_apresentante').AsString   := MkEmail.Text;

  Dm.Td.Post;

  Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Foi realizado a recepção do título protocolo nº: '+Label3.Caption+', Apresentante: '+MaskEdit19.Text+', Parte: '+MaskEdit17.Text, Label3.Caption);

  // Atualizando Td_Pesso
  Dm.Td_Pesso.Append;
  Dm.Td_Pesso.FieldByName('data').asString           := MaskEdit1.Text;
  Dm.Td_Pesso.FieldByName('tipo').asString           := tipo_;
  Dm.Td_Pesso.FieldByName('p_auxiliar').asString     := Trim(Label3.Caption);
  Dm.Td_Pesso.FieldByName('recibo').asString         := Trim(MaskEdit8.Text);
  Dm.Td_Pesso.FieldByName('nome').asString           := Trim(MaskEdit17.Text);
  Dm.Td_Pesso.FieldByName('tip_doc1').asString       := Trim(ComboBox1.Text);
  Dm.Td_Pesso.FieldByName('doc1').asString           := TirarTudo(MaskEdit27.Text, '.', '/', '-');
  Dm.Td_Pesso.FieldByName('tip_doc2').asString       := Trim(ComboBox11.Text);
  Dm.Td_Pesso.FieldByName('doc2').asString           := MaskEdit7.Text;

  Dm.Td_Pesso.FieldByName('situacao').asString       := Ver_Situacao1(Trim(ComboBox7.Text));
  dm.Td_Pesso.FieldByName('cartorio').AsString       := F_Menu.Label37.Caption;
  Dm.Td_Pesso.Post;

  //Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Foi adicionado na recepção do título a parte: '+Label3.Caption+', Parte: '+Trim(MaskEdit17.Text)+ ', Documento: '+Trim(ComboBox1.Text) +': '+MaskEdit27.Text, MaskEdit1.Text);

  Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Foi incluído a parte: '+Trim(MaskEdit17.Text)+', Documento: '+Trim(ComboBox1.Text)+'-'+TirarTudo(MaskEdit27.Text, '.', '-', '/')+', Situação: '+ComboBox7.Text, Label3.Caption);

  //*************
  if F_Menu.Label37.Caption = 'D' then
  begin
    if (not Guarda_Mov(qcartorio, MaskEdit1.text, Label3.Caption, Trim(Copy(ComboBox5.Text, 1,5)), MaskEdit4.Text, CurrencyEdit2.Value)) then
    ShowMessage('Problemas para atualizar a Distribuicao.');
  end;                                                                                                                                                   //CurrencyEdit3.Value, CurrencyEdit4.Value

  If CurrencyEdit4.Value > 0 then CurrencyEdit4.Value := CurrencyEdit2.Value;

  if (not Atualiza_Caixa(MaskEdit1.Text, '10', 'E', 'TÍTULO PARA REGISTRO', Label3.Caption, Label35.Caption, F_Menu.Label1.Caption, Trim(MaskEdit19.Text), CurrencyEdit2.Value, CurrencyEdit4.Value, CurrencyEdit6.Value, CurrencyEdit5.Value, CurrencyEdit9.Value)) then
  begin
    ShowMessage('Problemas para atualizar o caixa.');
  end;
  //// 2º

  If strtoint(MaskEdit15.Text) >= 1 Then
  Begin
    dm.qryGenerico.Close;
    dm.qryGenerico.SQL.Clear;
    dm.qryGenerico.SQL.Add('select * from selos where daje = '+QuotedStr(Strzero(ndajevias, 6))+' and serie_daje = '+QuotedStr(serie_dajeVias)+'' );
    dm.qryGenerico.Open;

    if dm.qryGenerico.RecordCount <= 0 Then
    Begin
      If strtoint(MaskEdit15.Text) >= 1 Then
      Begin
        Dm.Selos.close;
        Dm.Selos.SQL.Clear;
        Dm.Selos.SQL.add('INSERT INTO selos (recibo, daje, serie_daje, data, tp_prot) VALUES (');
        Dm.Selos.sql.add(QuotedStr(Label3.Caption) + ',');
        Dm.Selos.sql.add(QuotedStr(Strzero(ndajevias, 6))     + ',');
        Dm.Selos.sql.add(QuotedStr(Strzero(serie_dajeVias, 3))     + ',');
        Dm.Selos.sql.add(QuotedStr(ConvData(MaskEdit1.Text)) + ', "T")');
        Dm.Selos.ExecSQL;

        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Foi adicionado na recepção de título o daje: '+Strzero(serie_dajeVias, 3)+' '+Strzero(ndajevias, 6), Label3.Caption);


      End
      Else
      Begin
        Application.MessageBox('O Daje informado ja está em uso!', 'Mensagem do Sistema', mb_ok);
      End;
      if strtoint(MaskEdit15.Text) > 1 Then
      Begin
        Application.CreateForm(TF_DajeVias, F_DajeVias);
        F_DajeVias.x:= 1;
        F_DajeVias.TelaDeExame:= False;
        F_DajeVias.ShowModal;
        F_DajeVias.MaskEdit1.Clear;
        F_DajeVias.Destroy;
        F_DajeVias := Nil;
      End;
    End;
  End;


  //Gravação dos itens utilizados no calculo do título.
//  If Copy(ComboBox6.Text,1,2) <> '06' then
//    Grava_TDPedid;

  //Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Título recepcionado em ' + MaskEdit1.Text + '.', Label3.Caption);
end;


procedure TF_RecepR.MaskEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RecepR.BitBtn3Click(Sender: TObject);
begin
  if (F_Exame <> Nil) Then
  Begin
    sProtocolo:= Label3.Caption;
    if (sProtocolo <> '000000') and (sProtocolo <> '') Then
    Begin
      if (MessageBox(Handle, PChar('Deseja exibir o protocolo gerado na tela de exame ?'), 'Titulos e Documentos', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      Begin
        F_Exame.MaskEdit1.Enabled:= True;
        F_Exame.MaskEdit1.Text:= sProtocolo;
        F_Exame.BitBtn1.Click;
        sProtocolo:= '';
      End;
    End;
  End
  Else
  sProtocolo:= '';

  Close;
end;

procedure TF_RecepR.btImprimirClick(Sender: TObject);
var
  DtCalc, iddaje, atribuicao: String;
  sair   : Boolean;
  emo_vex, bus_vex, con_vex, inf_exc, gui_exc, sub_vex,
  lei20_vex, lei05_vex, lei05a_vex, tot_vex, emol_tit,
  fetj_tit, fund_tit, funp_tit, tota_tit : Currency;
begin
  {if TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27215296000114' then
  begin
    RvProject1.Close;
    RvProject1.SetProjectFile(ExtractFileDir(Application.ExeName) +'\Rave\RecRecep.rav');
    RvProject1.StoreRAV := true;
  end
  else
  begin
    RvProject1.Close;
    RvProject1.SetProjectFile(ExtractFileDir(Application.ExeName)+'\Rave\RecRecep_old.rav');
    RvProject1.StoreRAV := true;
  end;}

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM td');
  Dm.ArqAux.Sql.Add(' where p_auxiliar = '+QuotedStr(Label3.Caption)+' ');
  Dm.ArqAux.Open;

  Dm.ArqAux2.Close;
  Dm.ArqAux2.Sql.Clear;
  Dm.ArqAux2.Sql.Add('select * from daje where numero_daje = ' +QuotedStr(Dm.ArqAux.fieldbyname('daje').AsString)+ ' and serie_daje = ' + QuotedStr(Dm.ArqAux.fieldbyname('serie_daje').AsString));
  Dm.ArqAux2.Open;
  iddaje := Dm.ArqAux2.fieldbyname('iddaje_tj').AsString;
  atribuicao := Dm.ArqAux2.fieldbyname('atribuicao').AsString;

  Dm.ArqAux2.Close;
  Dm.ArqAux2.Sql.Clear;
  Dm.ArqAux2.Sql.Add('SELECT * FROM td_pedid');
  Dm.ArqAux2.Sql.Add('where p_auxiliar = '+QuotedStr(Label3.Caption)+' ');
  Dm.ArqAux2.Open;
  DM.ArqAux2.FindFirst;

  if (DM.Config_Adm.FieldByName('chk_08').AsBoolean) then
  begin
    {while not DM.ArqAux2.Eof do
    begin
      F_RecepR.RichEdit1.Lines.Add(DM.ArqAux2.fieldbyname('tabela').AsString + '.' + DM.ArqAux2.fieldbyname('item').AsString + ' ' + DM.ArqAux2.fieldbyname('subitem').AsString);
      F_RecepR.RichEdit2.Lines.Add(DM.ArqAux2.fieldbyname('descricao').AsString);
      F_RecepR.RichEdit3.Lines.Add(DM.ArqAux2.fieldbyname('qtde').AsString + ' x');
      F_RecepR.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.fieldbyname('valor_calc').AsCurrency));
      DM.ArqAux2.Next;
    end;  }

    RvDataSetConnection1.DataSet := dm.ArqAux;



    if F_Menu.Label39.Caption <> '34377622000155' Then
    begin
      RvProject4.SetParam('nome_cart', F_Menu.Label29.Caption);
      if F_Menu.Label50.Caption <> '' then
        RvProject4.SetParam('site', 'Site: '+F_Menu.Label50.Caption);
      RvProject4.SetParam('email_cartorio', 'Email:'+ F_Menu.Label55.Caption);
      RvProject4.SetParam('cnpj_cart',  F_Menu.Label39.Caption);
      RvProject4.SetParam('end_cart',   F_Menu.Label11.Caption + '  Cidade: '+F_Menu.Label7.Caption + ' Estado: '+ F_Menu.Label6.Caption);
      RvProject4.SetParam('fone_cart',  F_Menu.Label12.Caption);
      RvProject4.SetParam('usuario',    F_Menu.Label25.Caption);
      RvProject4.SetParam('doc_usu',    F_Menu.Label38.Caption);
      RvProject4.SetParam('data_entrada', 'Entrada: ' +MaskEdit1.Text);
      // adriel

      if MkEmail.Text <> '' then
        RvProject4.SetParam('email',  'Email: ' + MkEmail.Text);

      if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then //1 RTD
      begin
        RvProject4.SetParam('data_entr', 'Entrega: ' +MaskEdit16.Text);
      end;

      RvProject4.setParam('mensagemhorario', '');
      if (F_Menu.Label39.Caption = '15.258.382/0001-25') then //RI Simoes Filho
        RvProject4.setParam('mensagemhorario', 'APRESENTAR ESTE PROTOCOLO PARA RETIRADA DO DOCUMENTO - RESULTADO ATÉ ÀS 14H');

      RvProject4.SetParam('Descricao',  copy(F_RecepR.Combobox5.text,1,4));
      RvProject4.SetParam('Descricao2', F_RecepR.Combobox3.text);
      RvProject4.SetParam('Descricao3', '1');
      RvProject4.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
      RvProject4.SetParam('telefone',  MaskEdit18.Text);
      if (F_Menu.Label39.Caption = '27357717000141') or (F_Menu.Label39.Caption = '27.357.717/0001-41') then
        RvProject4.SetParam('observacao', Memo3.Text)
      Else
        RvProject4.SetParam('observacao', Memo1.Text);
      if ((F_menu.LbCnpj.Caption= '15.258.382/0001-25') or (F_menu.LbCnpj.Caption= '15258382000125')) then
      begin
        RvProject4.SetParam('observacao2', Memo2.Text);
      end
      else
      begin
        if (F_Menu.Label39.Caption = '27357717000141') or (F_Menu.Label39.Caption = '27.357.717/0001-41') then
        begin
          RvProject4.SetParam('observacao2', Memo3.Text);
        end else
        begin
          RvProject4.SetParam('observacao2', Memo1.Text);
        end;

      end;


      RvProject4.SetParam('atribuicao', atribuicao);
      RvProject4.setParam('daje', 'DAJE Nº '+ DM.ArqAux.fieldbyname('daje').AsString +' SÉRIE Nº '+ DM.ArqAux.fieldbyname('serie_daje').AsString +' EMISSOR Nº '+  iddaje);

      Dm.qryGenerico.Close;
      Dm.qryGenerico.Sql.Clear;
      Dm.qryGenerico.Sql.Add('select fmmpba, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_pge, vr_daje, status, numero_daje_complementar, serie_daje_complementar from daje where serie_daje = :serie_daje and numero_daje = :numero_daje and status <> '+QuotedStr('Isento')+'');
      Dm.qryGenerico.ParamByName('serie_daje').AsString:=  Dm.ArqAux.FieldByName('serie_daje').AsString;
      Dm.qryGenerico.ParamByName('numero_daje').AsString:= Dm.ArqAux.FieldByName('daje').AsString;
      Dm.qryGenerico.Open;

      dm.qryGenerico_Aux.Close;
      dm.qryGenerico_Aux.SQL.Clear;
      dm.qryGenerico_Aux.SQL.Add('select serie_daje_complementar, numero_daje_complementar, fmmpba, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_declarado, vr_daje,vr_pge, fmmpba from daje ');
      dm.qryGenerico_Aux.SQL.Add('where serie_daje      = ' + QuotedStr(Dm.qryGenerico.FieldByName('serie_daje_complementar').asString));
      dm.qryGenerico_Aux.SQL.Add('and numero_daje = ' + QuotedStr(Dm.qryGenerico.FieldByName('numero_daje_complementar').asString) +' and status <> '+QuotedStr('Isento')+'');
      dm.qryGenerico_Aux.Open;

      if Dm.qryGenerico.FieldByName('status').AsString = 'Isento' then
      begin
        RvProject4.SetParam('emol_tit', FormatCurr('###,###,##0.00', 0.00));
        RvProject4.SetParam('fetj_tit', FormatCurr('###,###,##0.00', 0.00));
        RvProject4.SetParam('fund_tit', FormatCurr('###,###,##0.00', 0.00));
        RvProject4.SetParam('funp_tit', FormatCurr('###,###,##0.00', 0.00));
        RvProject4.SetParam('nome_exc', FormatCurr('###,###,##0.00', 0.00));
        RvProject4.SetParam('tota_tit', FormatCurr('###,###,##0.00', 0.00));
      end
      else
      begin
        if not dm.qryGenerico.IsEmpty Then
        begin
          if True {(TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27215296000114')} then  //Valença
          begin
           if not dm.qryGenerico_Aux.isempty Then
           begin
            RvProject4.SetParam('emol',        FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency + DM.qryGenerico_Aux.fieldbyname('emol_daje').AsCurrency)    );
             RvProject4.SetParam('tx_fiscal',   FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency+DM.qryGenerico_Aux.fieldbyname('tx_fisca_daje').AsCurrency));
             RvProject4.SetParam('fecom',       FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency+DM.qryGenerico_Aux.fieldbyname('fecom_daje').AsCurrency)   );
             RvProject4.SetParam('def_publica', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency+DM.qryGenerico_Aux.fieldbyname('def_pub_daje').AsCurrency) );
             RvProject4.SetParam('pge',         FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_pge').AsCurrency+DM.qryGenerico_Aux.fieldbyname('vr_pge').AsCurrency)       );
             RvProject4.SetParam('vr_daje',     FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency+DM.qryGenerico_Aux.fieldbyname('vr_daje').AsCurrency)      );
             RvProject4.SetParam('fmmpba',     FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('fmmpba').AsCurrency+DM.qryGenerico_Aux.fieldbyname('fmmpba').AsCurrency)      );
           end
           else
           begin
             RvProject4.SetParam('emol',        FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency)    );
             RvProject4.SetParam('tx_fiscal',   FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
             RvProject4.SetParam('fecom',       FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency)   );
             RvProject4.SetParam('def_publica', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency) );
             RvProject4.SetParam('pge',         FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_pge').AsCurrency)       );
             RvProject4.SetParam('vr_daje',     FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency)      );
             RvProject4.SetParam('fmmpba',     FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('fmmpba').AsCurrency)      );
           end;

            RvProject4.SetParam('situacao',    ComboBox7.Text);
          end
          else if (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27357717000141') or
                  (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '28224408000166') or
                  (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '28275286000137') or
                  (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27400369000148') or
                  (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27215776000185') or
                  (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27282471000196') then
          begin
            RvProject4.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency));
            RvProject4.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('fmmpba').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('vr_pge').AsCurrency));

            RvProject4.SetParam('emol',        FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency)    );
            RvProject4.SetParam('tx_fiscal',   FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
            RvProject4.SetParam('fecom',       FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency)   );
            RvProject4.SetParam('def_publica', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency) );
            RvProject4.SetParam('pge',         FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_pge').AsCurrency)       );
            RvProject4.SetParam('vr_daje',     FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency)      );
            RvProject4.SetParam('fmmpba',     FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('fmmpba').AsCurrency)      );

          end
        else
        begin
          if (Not(PermiteRecepcaoSemDAJE)) then
          begin
            RvProject4.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('fmmpba').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency));


            RvProject4.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
          end
          else
          begin
            RvProject4.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
            RvProject4.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
          end;
        end;

          if (Not(PermiteRecepcaoSemDAJE)) then
          begin
            RvProject4.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('fmmpba').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
          end
          else
          begin
            RvProject4.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency + Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
          end;

        End
        else
        Begin
          if (Not(PermiteRecepcaoSemDAJE)) then
          Begin
            RvProject4.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
            RvProject4.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
            RvProject4.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency + Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));

            {RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('emol_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('fecom_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('def_pub_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('vr_pge').AsCurrency));



            RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('tx_fisca_daje').AsCurrency));


            RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('emol_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('fecom_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('def_pub_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('vr_pge').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('tx_fisca_daje').AsCurrency));}
          End
          Else
          Begin
            RvProject4.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
            RvProject4.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
            RvProject4.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency + Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
          End;

        End;

        RvProject4.SetParam('fund_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_defensoria').AsCurrency));
        RvProject4.SetParam('funp_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency));
        RvProject4.SetParam('nome_exc', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

        {RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_tribunal').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_defensoria').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_mutua').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_acoterj').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_distrib').AsCurrency)); }
      End;
      if  not dm.qryGenerico_Aux.IsEmpty Then
          RvProject4.SetParam('tota_tit', FormatCurr('###,###,##0.00',  Dm.qryGenerico.fieldbyname('vr_daje').AsCurrency +   Dm.qryGenerico_aux.fieldbyname('vr_daje').AsCurrency ));

      RvProject4.ExecuteReport('report2');  //RECIBO TITULOS
    End
    Else if F_Menu.Label39.Caption <> '34377622000155' Then
    begin
      RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
      if F_Menu.Label50.Caption <> '' then
        RvProject1.SetParam('site', 'Site: '+F_Menu.Label50.Caption);
      RvProject1.SetParam('email_cartorio', 'Email:'+ F_Menu.Label55.Caption);
      RvProject1.SetParam('cnpj_cart',  F_Menu.Label39.Caption);
      RvProject1.SetParam('end_cart',   F_Menu.Label11.Caption + '  Cidade: '+F_Menu.Label7.Caption + ' Estado: '+ F_Menu.Label6.Caption);
      RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
      RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
      RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
      if MkEmail.Text <> '' then
        RvProject1.SetParam('email',  'Email: ' + MkEmail.Text);

      if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then //1 RTD
        RvProject1.SetParam('data_entr', 'Entrega: ' +MaskEdit16.Text);

      RvProject1.SetParam('Descricao',  copy(F_RecepR.Combobox5.text,1,4));
      RvProject1.SetParam('Descricao2', F_RecepR.Combobox3.text);
      RvProject1.SetParam('Descricao3', '1');
      RvProject1.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
      RvProject1.SetParam('telefone',  MaskEdit18.Text);
      RvProject1.SetParam('observacao', Memo1.Text);
      RvProject1.SetParam('atribuicao', atribuicao);
      RvProject1.setParam('daje', 'DAJE Nº '+ DM.ArqAux.fieldbyname('daje').AsString +' SÉRIE Nº '+ DM.ArqAux.fieldbyname('serie_daje').AsString +' EMISSOR Nº '+  iddaje);

      Dm.qryGenerico.Close;
      Dm.qryGenerico.Sql.Clear;
      Dm.qryGenerico.Sql.Add('select emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_pge, vr_daje, status, numero_daje_complementar, serie_daje_complementar from daje where serie_daje = :serie_daje and numero_daje = :numero_daje and status <> '+QuotedStr('Isento')+'');
      Dm.qryGenerico.ParamByName('serie_daje').AsString:=  Dm.ArqAux.FieldByName('serie_daje').AsString;
      Dm.qryGenerico.ParamByName('numero_daje').AsString:= Dm.ArqAux.FieldByName('daje').AsString;
      Dm.qryGenerico.Open;

      dm.qryGenerico_Aux.Close;
      dm.qryGenerico_Aux.SQL.Clear;
      dm.qryGenerico_Aux.SQL.Add('select serie_daje_complementar, numero_daje_complementar, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_declarado, vr_daje, vr_pge from daje ');
      dm.qryGenerico_Aux.SQL.Add('where serie_daje      = ' + QuotedStr(Dm.qryGenerico.FieldByName('serie_daje_complementar').asString));
      dm.qryGenerico_Aux.SQL.Add('and numero_daje = ' + QuotedStr(Dm.qryGenerico.FieldByName('numero_daje_complementar').asString) +' and status <> '+QuotedStr('Isento')+'');
      dm.qryGenerico_Aux.Open;


      if Dm.qryGenerico.FieldByName('status').AsString = 'Isento' then
      begin
        RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', 0.00));
        RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', 0.00));
        RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', 0.00));
        RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', 0.00));
        RvProject1.SetParam('nome_exc', FormatCurr('###,###,##0.00', 0.00));
        RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', 0.00));
      end
      else
      begin
        if dm.qryGenerico_Aux.IsEmpty Then
        begin
        if (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27215296000114') then  //Valença
        begin
          RvProject1.SetParam('emol',        FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency)    );
          RvProject1.SetParam('tx_fiscal',   FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
          RvProject1.SetParam('fecom',       FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency)   );
          RvProject1.SetParam('def_publica', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency) );
          RvProject1.SetParam('pge',         FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_pge').AsCurrency)       );
          RvProject1.SetParam('vr_daje',     FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency)      );
          RvProject1.SetParam('situacao',    ComboBox7.Text);
        end
        else if (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27357717000141') or
                (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '28224408000166') or
                (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '28275286000137') or
                (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27400369000148') or
                (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27215776000185') or
                (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27282471000196') then
        begin
          RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency));
          RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('vr_pge').AsCurrency));
        end
        else
        begin
          if (Not(PermiteRecepcaoSemDAJE)) then
          begin
            RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency));


            RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
          end
          else
          begin
            RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
            RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
          end;
        end;

        if (Not(PermiteRecepcaoSemDAJE)) then
        begin
          RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
        end
        else
        begin
          RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency + Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
        end;

        End
        else
        Begin
          if (Not(PermiteRecepcaoSemDAJE)) then
          Begin
            RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
            RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
            RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency + Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));

            {RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('emol_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('fecom_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('def_pub_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('vr_pge').AsCurrency));



            RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('tx_fisca_daje').AsCurrency));


            RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('emol_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('fecom_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('def_pub_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('vr_pge').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('tx_fisca_daje').AsCurrency));}
          End
          Else
          Begin
            RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
            RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
            RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency + Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
          End;

        End;

        RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_defensoria').AsCurrency));
        RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency));
        RvProject1.SetParam('nome_exc', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

        {RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_tribunal').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_defensoria').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_mutua').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_acoterj').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_distrib').AsCurrency)); }
      End;
      RvProject1.ExecuteReport('report2');  //RECIBO TITULOS
    End
    Else
    Begin
      if (not(ModalidadeAverbacaoCapital)) Then
      Begin
        RvProject2.SetParam('nome_cart', F_Menu.Label29.Caption);
        RvProject2.SetParam('email', 'Site: '+F_Menu.Label50.Caption);
        RvProject2.SetParam('email_cartorio', 'Email:'+ F_Menu.Label55.Caption);
        RvProject2.SetParam('cnpj_cart', F_Menu.Label39.Caption);
        RvProject2.SetParam('end_cart',  F_Menu.Label11.Caption);
        RvProject2.SetParam('fone_cart',  F_Menu.Label12.Caption);
        RvProject2.SetParam('usuario',    F_Menu.Label25.Caption);
        RvProject2.SetParam('doc_usu',    F_Menu.Label38.Caption);
        RvProject2.SetParam('situacao',  ComboBox7.Text);
        RvProject2.SetParam('Descricao',  copy(F_RecepR.Combobox5.text,1,4));
        RvProject2.SetParam('Descricao2', F_RecepR.Combobox3.text);
        RvProject2.SetParam('Descricao3', '1');
        RvProject2.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
        RvProject2.SetParam('telefone',  MaskEdit18.Text);
        RvProject2.SetParam('observacao', Memo1.Text);
        RvProject2.SetParam('situacao',  ComboBox7.Text);
        RvProject2.SetParam('email_apresentante',  MkEmail.Text);
        RvProject2.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
        RvProject2.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_tribunal').AsCurrency));
        RvProject2.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
        if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then //1 RTD
          RvProject2.SetParam('data_entr', 'Entrega: ' +MaskEdit16.Text);

        RvProject2.ExecuteReport('report2');  //RECIBO TITULOS
      End
      Else
      Begin
        RvProject3.SetParam('nome_cart', F_Menu.Label29.Caption);
        RvProject3.SetParam('cnpj_cart', F_Menu.Label39.Caption);
        RvProject3.SetParam('end_cart',  F_Menu.Label11.Caption);
        RvProject3.SetParam('fone_cart',  F_Menu.Label12.Caption);
        RvProject3.SetParam('usuario',    F_Menu.Label25.Caption);
        RvProject3.SetParam('doc_usu',    F_Menu.Label38.Caption);
        RvProject3.SetParam('Descricao',  copy(F_RecepR.Combobox5.text,1,4));
        RvProject3.SetParam('Descricao2', F_RecepR.Combobox3.text);
        RvProject3.SetParam('Descricao3', '1');
        RvProject3.SetParam('sistema', 'TÍTULOS E DOCUMENTOS');
        RvProject3.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
        RvProject3.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency));
        RvProject3.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_tribunal').AsCurrency));
        RvProject3.SetParam('fund_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_defensoria').AsCurrency));
        RvProject3.SetParam('funp_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency));
        RvProject3.SetParam('nome_exc', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_distrib').AsCurrency));
        RvProject3.SetParam('celular',  MaskEdit2.Text);


        DM.qryGenerico.Close;
        DM.qryGenerico.SQL.Clear;
        DM.qryGenerico.Sql.Add('SELECT exibir_prazo_recibo_protocolo FROM tab_ato2 where tabela = :tabela  and item_tab = :item_tab ');
        DM.qryGenerico.Sql.Add('and YEAR(data) = YEAR('+ QuotedStr(ConvData(MaskEdit1.Text))+ ')');
        DM.qryGenerico.ParamByName('tabela').AsString:= Copy(ComboBox5.Text, 1,1);
        DM.qryGenerico.ParamByName('item_tab').AsString:= Copy(ComboBox5.Text, 3,1);
        DM.qryGenerico.Open;

        {if (Not(bNaoExibirDataDeEntregaNoReciboDeProtocolo)) then
          RvProject3.SetParam('DataDeEntrega', 'Data de Entrega: ' +MaskEdit16.Text);}

        //if (Not(bNaoExibirDataDeEntregaNoReciboDeProtocolo)) then
        RvProject3.SetParam('DataDeEntrega', '');


        RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_tribunal').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_defensoria').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_mutua').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_acoterj').AsCurrency +
                                                                     DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

        RvProject3.ExecuteReport('report2');  //RECIBO TITULOS
      End;
    End;
  end;

  if (DM.Configur.FieldByName('chk_11').AsBoolean) then
  begin
    // RECIBO DE VIAS EXCEDENTES - RESENDE
    if (F_RecepR.MaskEdit26.Text <> '0') then
    begin
      Dm.Calculo.Close;
      Dm.Calculo.Sql.Clear;
      Dm.Calculo.Sql.Add('SELECT data FROM cad_cus');
      Dm.Calculo.Sql.Add('GROUP BY data');
      Dm.Calculo.Sql.Add('ORDER BY data DESC');
      Dm.Calculo.Open;
      if (Dm.Calculo.RecordCount = 0) then
      begin
        Dm.Calculo.Close;
        MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
        Exit;
      end;
      while (not Sair) AND (not Dm.Calculo.Eof) do
      begin
        if (StrToDate(MaskEdit1.Text) >= Dm.Calculo.FieldByName('data').asDateTime) then
        begin
          DtCalc := Dm.Calculo.FieldByName('data').AsString;
          Sair   := True;
        end;
        Dm.Calculo.Next;
      end;

      if (F_RecepR.MaskEdit26.Text <> '0') then
      begin
        { Calculo para a Via Excedente }
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''10''');
        Dm.Calculo.Sql.Add('AND item  = ''4''');
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR A TABELA DE VIAS EXCEDENTES !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        emo_vex := Dm.Calculo.FieldByName('v_emolumentos').asCurrency * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;

        { Conferencia }
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''1''');
        Dm.Calculo.Sql.Add('AND item  = ''5''' );
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        con_vex := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;

        //Busca
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''1''');
        Dm.Calculo.Sql.Add('AND item  = ''1''' );
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        bus_vex := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;

        //Informatica
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''1''');
        Dm.Calculo.Sql.Add('AND item  = ''9''');
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        inf_exc := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;
        gui_exc := dm.TabDemais.FieldByName('guia_informatica').AsCurrency  * StrToInt(MaskEdit26.Text);

        sub_vex := emo_vex + con_vex + bus_vex + inf_exc + gui_exc;

        lei20_vex := truncav((sub_vex * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
        lei05_vex := truncav((sub_vex * dm.tabdemais.FieldByName('defensoria').ascurrency) / 100);
        lei05a_vex:= truncav((sub_vex * dm.tabdemais.FieldByName('procuradoria').ascurrency) / 100);

        tot_vex := sub_vex + lei20_vex + lei05_vex + lei05a_vex;
      end;
    end;

    //Recibo Resende
    RvDataSetConnection1.DataSet := dm.ArqAux;

    RvProject1.SetParam('data', F_menu.Label7.caption + formatdatetime('" ," dd "de" mmmm "de" yyyy', date));
    //RvProject1.ExecuteReport('report1'); // RECIBO PRENOTAÇÃO

    RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
    RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
    RvProject1.SetParam('Descricao',  F_RecepR.RichEdit1.Text);
    RvProject1.SetParam('Descricao2', F_RecepR.RichEdit2.Text);
    RvProject1.SetParam('Descricao3', F_RecepR.RichEdit3.Text);
    RvProject1.SetParam('Descricao4', F_RecepR.RichEdit4.Text);
    RvProject1.SetParam('telefone',  MaskEdit18.Text);
    RvProject1.SetParam('observacao', Memo1.Text);
    RvProject1.SetParam('atribuicao', atribuicao);


    emol_tit := DM.ArqAux.fieldbyname('v_subtotal').AsCurrency - sub_vex;
    fetj_tit := DM.ArqAux.fieldbyname('v_tribunal').AsCurrency - lei20_vex;
    fund_tit := DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency - lei05_vex;
    funp_tit := DM.ArqAux.fieldbyname('v_defensoria').AsCurrency - lei05a_vex;
    tota_tit := DM.ArqAux.fieldbyname('v_total').AsCurrency - tot_vex;

    RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', emol_tit));
    RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', fetj_tit));
    RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', fund_tit));
    RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', funp_tit));
    RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', tota_tit));
    if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then //1 RTD
      RvProject1.SetParam('data_entr', 'Entrega: ' +MaskEdit16.Text);

    //RvProject1.ExecuteReport('report2');  //RECIBO TITULOS


    if (F_RecepR.MaskEdit26.Text <> '0') then
    begin
      RvProject1.SetParam('usuario', F_Menu.Label25.Caption);
      RvProject1.SetParam('doc_usu', F_Menu.Label38.Caption);
      RvProject1.SetParam('Descricao',  F_RecepR.RichEdit5.Text);
      RvProject1.SetParam('Descricao2', F_RecepR.RichEdit6.Text);
      RvProject1.SetParam('Descricao3', F_RecepR.RichEdit7.Text);
      RvProject1.SetParam('Descricao4', F_RecepR.RichEdit8.Text);
      RvProject1.SetParam('telefone',  MaskEdit18.Text);
      RvProject1.SetParam('observacao', Memo1.Text);
      RvProject1.SetParam('atribuicao', atribuicao); 
      RvProject1.SetParam('emol', FormatCurr('###,###,##0.00', sub_vex));
      RvProject1.SetParam('fetj', FormatCurr('###,###,##0.00', lei20_vex));
      RvProject1.SetParam('fund', FormatCurr('###,###,##0.00', lei05a_vex));
      RvProject1.SetParam('funp', FormatCurr('###,###,##0.00', lei05_vex));
      RvProject1.SetParam('vtot', FormatCurr('###,###,##0.00', tot_vex));
      RvProject1.ExecuteReport('report3');  //RECIBO VIAS EXCEDENTES
    end;
  end;


end;

procedure TF_RecepR.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit27.SetFocus;
end;

procedure TF_RecepR.MaskEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
  if key = 13 then ComboBox11.SetFocus;
end;

procedure TF_RecepR.MaskEdit28KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit17.SetFocus;
end;

procedure TF_RecepR.MaskEdit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit18.SetFocus;
end;

procedure TF_RecepR.MaskEdit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox7.SetFocus;
end;

procedure TF_RecepR.ComboBox7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit12.SetFocus;
end;

procedure TF_RecepR.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if ComboBox4.Text = 'S' then
    begin
      Label39.Visible    := True;
      MaskEdit11.Visible := True;
      MaskEdit11.SetFocus;
    end
    else
    begin
      Label39.Visible    := False;
      MaskEdit11.Visible := False;
      CurrencyEdit1.SetFocus;
    end;
  end;
end;

procedure TF_RecepR.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 vezes : String;
begin
  if key = 13 then
  Begin
   vezes := '';
   F_menu.vezes.caption := '';
   if copy(combobox5.text,1,2) = '03' then
   Begin
    F_menu.vezes.caption := InputBox('QTDADE DE DESTINATÁRIO', 'Digite a quantidade de destinatários :', '1');
   end;
   if MaskEdit20.Visible then
     MaskEdit20.SetFocus
   else
     ComboBox6.SetFocus;
  end;
end;

procedure TF_RecepR.ComboBox6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CheckBox1.SetFocus;
end;

procedure TF_RecepR.MaskEdit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepR.MaskEdit26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_RecepR.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vr_calc_fim, ufir_min, ufir_max : Currency;
begin
  if key = 13 then CurrencyEdit2.SetFocus;
{
  begin
    RichEdit1.Lines.Clear;
    RichEdit2.Lines.Clear;
    RichEdit3.Lines.Clear;
    RichEdit4.Lines.Clear;
    RichEdit5.Lines.Clear;
    RichEdit6.Lines.Clear;
    RichEdit7.Lines.Clear;
    RichEdit8.Lines.Clear;

    If Copy(ComboBox6.Text,1,2) <> '06' then
    Begin
      if (DM.Config_Adm.FieldByName('chk_01').AsBoolean) then
      begin
        CalculoGeral(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value
      end;

      if (DM.Config_Adm.FieldByName('chk_02').AsBoolean) then //Calculo feito para Resende
      begin
        CalculoGeral2(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      end;

      if (DM.Config_Adm.FieldByName('chk_03').AsBoolean) then //Calculo feito para Itatiaia e Demais Cartórios
      begin
        CalculoGeral3(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      end;

//    if (DM.Config_Adm.FieldByName('chk_08').AsBoolean) then //Calculo Aberto
      if True then //Calculo Aberto
      begin
        Application.CreateForm(TF_NewCalcT, F_NewCalcT);
        F_NewCalcT.CurrencyEdit22.Value := 0.00;
        vr_calc_fim := 0.00;
        ufir_min    := 0.00;
        ufir_max    := 0.00;
        If (Copy(ComboBox5.Text,1,4) = '1001') OR (Copy(ComboBox5.Text,1,5) = '1003A') then
        Begin
          dm.TabDemais.close;
          dm.TabDemais.sql.Clear;
          dm.TabDemais.sql.Add('select ufir_min, ufir_max from cad_tabdemais');
          dm.TabDemais.sql.add('order by data');
          dm.TabDemais.Open;
          dm.TabDemais.FindLast;
          ufir_min := (dm.TabDemais.FieldByName('ufir_min').AsCurrency * 100);
          ufir_max := (dm.TabDemais.FieldByName('ufir_max').AsCurrency * 100);
          If CurrencyEdit1.Value <= ufir_min then
            vr_calc_fim := dm.TabDemais.FieldByName('ufir_min').AsCurrency
          Else If CurrencyEdit1.Value >= ufir_max then
            vr_calc_fim := dm.TabDemais.FieldByName('ufir_max').AsCurrency
          Else
            vr_calc_fim := TruncaV(((CurrencyEdit1.Value * 1) / 100));

          If (Copy(ComboBox5.Text,1,5) = '1003A') then
            vr_calc_fim := TruncaV(vr_calc_fim / 2);

          F_NewCalcT.CurrencyEdit22.Value := vr_calc_fim;

          If (Copy(ComboBox5.Text,1,4) = '1001') then
            F_NewCalcT.MaskEdit1.Text := '6001'
          Else
            F_NewCalcT.MaskEdit1.Text := '6003'

        End;
        F_NewCalcT.ShowModal;
        F_NewCalcT.Destroy;
        F_NewCalcT := Nil;
        If Copy(ComboBox6.Text,1,2) = '05' then
        Begin
          VrSubTotal     := 0;
          VrTotG         := VrTribunal + VrDefensoria + VrProcuradoria + VrMutua + VrAcoterj + VrDistrib +
                            tot_nomexc + VrTrib_DIST + VrDefen_DIST + VrProcu_DIST +
                            VrTrib_nom + VrDefen_nom + VrProcu_nom;
          CurrencyEdit2.Value := VrTotG;
        End;
      end;
    End
    Else
    Begin
      VrTribunal     := 0;
      VrDefensoria   := 0;
      VrProcuradoria := 0;
      VrMutua        := 0;
      VrAcoterj      := 0;
      VrSubTotal     := 0;
      VrDistrib      := 0;
      VrTotG         := 0;
    End;

 //   if (F_Menu.Label26.Caption = 'T') then
 //   begin
      CurrencyEdit3.SetFocus;
 //   end
 //   else
 //   begin
      BitBtn4.Enabled := True;
      BitBtn4.SetFocus;
 //   end;
  end;}    
end;

procedure TF_RecepR.CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit3.SetFocus;
end;

procedure TF_RecepR.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    BitBtn4.Enabled := True;
    BitBtn4.SetFocus;
  end;
end;

procedure TF_RecepR.BitBtn4Click(Sender: TObject);
var
  vezes, vez, DtCalc, iddaje, atribuicao: String;
  x, y : Integer;
  impport : String;
  impporti : integer;
  sair   : Boolean;
  emo_vex, bus_vex, con_vex, inf_exc, gui_exc, sub_vex,
  lei20_vex, lei05_vex, lei05a_vex, tot_vex, emol_tit,
  fetj_tit, fund_tit, funp_tit, tota_tit, nome_exc : Currency;
begin
  if (not ValidNumero(MaskEdit4.Text)) then
  begin
    Application.MessageBox('Natureza Inválida !', 'Mensagem do Sistema', mb_ok);
    MaskEdit4.SetFocus;
    Exit;
  end;
  if trim(MaskEdit19.Text) = '' then
  begin
    Application.MessageBox('Obrigatório Preencher o campo Apresentante!', 'Mensagem do Sistema', mb_ok);
    MaskEdit19.SetFocus;
    exit;
  end;
  if trim(MaskEdit17.Text) = '' then
  begin
    Application.MessageBox('Obrigatório Informar uma das Partes!', 'Mensagem do Sistema', mb_ok);
    MaskEdit17.SetFocus;
    exit
  end;

  vezes := '1';

  if (F_Menu.Label37.Caption = 'D')  then
  begin
    if (trim(ComboBox9.Text) = '') then
    begin
      //Distribuição para qual cartório
      dm.qrmenor.ParamByName('PARTABELA').Value := trim(copy(ComboBox5.Text, 1, 4));
      DM.qrMenor.active := True;

      qcartorio := dm.qrmenor.FieldByName('codigo').asstring;
      dm.qrMenor.Active := False;
      Label9.Caption := qcartorio;
    end
    else
    begin
      qcartorio := ComboBox9.Text;
      Label9.Caption := qcartorio;
    end;
  end
  else
  begin
    qcartorio := F_Menu.label37.Caption;
    Label9.Caption := qcartorio;
  end;

  if (StrToInt(vezes) > 0) and (Label3.Caption = '000000') then
  begin
    if (MessageBox(Handle, PChar('Confirma recepção ? '), 'RECEPÇÃO DE TÍTULOS', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin
      Dm.Td.Close;
      Dm.Td.Sql.Clear;
      Dm.Td.Sql.Add('SELECT * FROM td');
      Dm.Td.Sql.Add('WHERE');
      Dm.Td.Sql.Add('recno = 0');
      Dm.Td.Open;

      Dm.Td_Pesso.Close;
      Dm.Td_Pesso.Sql.Clear;
      Dm.Td_Pesso.Sql.Add('SELECT * FROM td_pesso');
      Dm.Td_Pesso.Sql.Add('WHERE');
      Dm.Td_Pesso.Sql.Add('recno = 0');
      Dm.Td_Pesso.Open;
      GroupBox1.Visible := True;

      ndajepost := '';
      vdajepost := 0.00;
      if StrToInt(MaskEdit20.Text) > 0 then
      begin
        Application.CreateForm(TF_DajePost, F_DajePost);
        F_DajePost.ShowModal;
        ndajepost := F_DajePost.MaskEdit1.Text;
        vdajepost := F_DajePost.CurrencyEdit1.Value;
        F_DajePost.MaskEdit1.Clear;
        F_DajePost.CurrencyEdit1.Clear;
        F_DajePost.Destroy;
        F_DajePost := Nil;
      end;

      ndajevias := '';
      serie_dajeVias:= '';
      if StrToInt(MaskEdit15.Text) > 0 then
      begin
        Application.CreateForm(TF_DajeVias, F_DajeVias);
        F_DajeVias.x:= 1;
        F_DajeVias.TelaDeExame:= False;
        F_DajeVias.ShowModal;
        ndajevias      := F_DajeVias.MaskEdit2.Text;
        serie_dajeVias := F_DajeVias.MaskEdit1.Text;
        F_DajeVias.MaskEdit1.Clear;
        F_DajeVias.Destroy;
        F_DajeVias := Nil;
      end;

      if (not(NaoInserirRecepcao) OR (PermiteRecepcaoSemDAJE)) then
      begin
        if DM.Configur.FieldByName('chk_17').AsString = 'T' then
        begin
          num_rec        := Gera_Recibo;
          MaskEdit8.Text := strzero(inttostr(num_rec),6);
        end;

        Abre_Configur;

        for x := 1 to StrToInt(vezes) do
        begin
          if (not GerarProtocolo) then
          begin
            ShowMessage('Problemas para gerar o protocolo auxiliar.');
            ShowMessage('Recepção cancelada.');
            Limpar_Tela(F_RecepR);
            Habilitar_Tela(False);
            BitBtn2.SetFocus;
            Exit;
          end;

          Gravar_New(F_RecepR);

          if MessageDlg('Deseja imprimir?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            btImprimir.Click;
            Exit;
            if (F_Menu.laser.Caption = '1') then
            begin

              if true then //(F_Menu.Label24.Caption = 'T') then  // opção que esta no cadastro de usuarios
              begin
                Dm.ArqAux.Close;
                Dm.ArqAux.Sql.Clear;
                Dm.ArqAux.Sql.Add('SELECT * FROM td');
                Dm.ArqAux.Sql.Add('WHERE');
                Dm.ArqAux.Sql.Add('p_auxiliar = ' + QuotedStr(Label3.Caption));
                Dm.ArqAux.Open;

                Dm.ArqAux2.Close;
                Dm.ArqAux2.Sql.Clear;
                Dm.ArqAux2.Sql.Add('select * from daje where numero_daje = ' +QuotedStr(Dm.ArqAux.fieldbyname('daje').AsString)+ ' and serie_daje = ' + QuotedStr(Dm.ArqAux.fieldbyname('serie_daje').AsString));
                Dm.ArqAux2.Open;
                iddaje := Dm.ArqAux2.fieldbyname('iddaje_tj').AsString;
                atribuicao := Dm.ArqAux2.fieldbyname('atribuicao').AsString;

                Dm.ArqAux2.Close;
                Dm.ArqAux2.Sql.Clear;
                Dm.ArqAux2.Sql.Add('SELECT * FROM td_pedid');
                Dm.ArqAux2.Sql.Add('WHERE');
                Dm.ArqAux2.Sql.Add('p_auxiliar = ' + QuotedStr(Label3.Caption));
                Dm.ArqAux2.Open;
                DM.ArqAux2.FindFirst;

                if true then //(DM.Config_Adm.FieldByName('chk_08').AsBoolean) then
                begin
                  while not DM.ArqAux2.Eof do
                  begin
                    F_RecepR.RichEdit1.Lines.Add(DM.ArqAux2.fieldbyname('tabela').AsString + '.' + DM.ArqAux2.fieldbyname('item').AsString + ' ' + DM.ArqAux2.fieldbyname('subitem').AsString);
                    F_RecepR.RichEdit2.Lines.Add(DM.ArqAux2.fieldbyname('descricao').AsString);
                    F_RecepR.RichEdit3.Lines.Add(DM.ArqAux2.fieldbyname('qtde').AsString + ' x');
                    F_RecepR.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.fieldbyname('valor_calc').AsCurrency));
                    DM.ArqAux2.Next;
                  end;

                  RvDataSetConnection1.DataSet := dm.ArqAux;
                  RvDataSetConnection3.DataSet := dm.ArqAux;


                  Dm.qryGenerico.Close;
                  Dm.qryGenerico.Sql.Clear;
                  Dm.qryGenerico.Sql.Add('select emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_pge, vr_daje, status, serie_daje_complementar, numero_daje_complementar from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
                  Dm.qryGenerico.ParamByName('serie_daje').AsString:=  Dm.ArqAux.FieldByName('serie_daje').AsString;
                  Dm.qryGenerico.ParamByName('numero_daje').AsString:= Dm.ArqAux.FieldByName('daje').AsString;
                  Dm.qryGenerico.Open;

                  dm.qryGenerico_Aux.Close;
                  dm.qryGenerico_Aux.SQL.Clear;
                  dm.qryGenerico_Aux.SQL.Add('select serie_daje_complementar, numero_daje_complementar, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_declarado, vr_daje, vr_pge from daje ');
                  dm.qryGenerico_Aux.SQL.Add('where serie_daje      = ' + QuotedStr(Dm.qryGenerico.FieldByName('serie_daje_complementar').asString));
                  dm.qryGenerico_Aux.SQL.Add('and numero_daje = ' + QuotedStr(Dm.qryGenerico.FieldByName('numero_daje_complementar').asString) +' and status <> '+QuotedStr('Isento')+'');
                  dm.qryGenerico_Aux.Open;

                  if Dm.qryGenerico.FieldByName('status').AsString = 'Isento' then
                  Begin
                    RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', 0.00));
                    RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', 0.00));
                    RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', 0.00));
                    RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', 0.00));
                    RvProject1.SetParam('nome_exc', FormatCurr('###,###,##0.00', 0.00));
                    RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', 0.00));
                  End
                  Else
                  Begin
                    if dm.qryGenerico_Aux.IsEmpty Then
                    begin
                      if (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27215296000114') then  //Valença
                      begin
                        RvProject1.SetParam('emol',        FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency)    );
                        RvProject1.SetParam('tx_fiscal',   FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
                        RvProject1.SetParam('fecom',       FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency)   );
                        RvProject1.SetParam('def_publica', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency) );
                        RvProject1.SetParam('pge',         FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_pge').AsCurrency)       );
                        RvProject1.SetParam('vr_daje',        FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency)       );
                        RvProject1.SetParam('situacao',    ComboBox7.Text);
                      end
                      else
                      if (F_Menu.Label39.Caption = '27357717000141') or (F_Menu.Label39.Caption = '27.357.717/0001-41') or
                        (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66') or
                        (F_Menu.Label39.Caption = '28275286000137') or (F_Menu.Label39.Caption = '28.275.286/0001-37') or
                        (F_Menu.Label39.Caption = '27400369000148') or (F_Menu.Label39.Caption = '27.400.369/0001-48') or
                        (F_Menu.Label39.Caption = '27215776000185') or (F_Menu.Label39.Caption = '27.215.776/0001-85') or
                        (F_Menu.Label39.Caption = '27282471000196') or (F_Menu.Label39.Caption = '27.282.471/0001-96') Then
                      Begin
                         RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency));
                         RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('vr_pge').AsCurrency));
                      End
                      Else
                      Begin
                        if (Not(PermiteRecepcaoSemDAJE)) then
                        begin
                          RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency));
                          RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));



                          RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('emol_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('fecom_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('def_pub_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('vr_pge').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('tx_fisca_daje').AsCurrency));

                        end
                        else
                        begin
                           Dm.ArqAux.Close;
                           Dm.ArqAux.Sql.Clear;
                           Dm.ArqAux.Sql.Add('SELECT * FROM td');
                           Dm.ArqAux.Sql.Add('WHERE');
                           Dm.ArqAux.Sql.Add('p_auxiliar = ' + QuotedStr(Label3.Caption));
                           Dm.ArqAux.Open;
                           RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
                           RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                           RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency + Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                        end;
                      End;
                  end
                  else
                  Begin
                       if (F_Menu.Label39.Caption = '27357717000141') or (F_Menu.Label39.Caption = '27.357.717/0001-41') or
                         (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66') or
                         (F_Menu.Label39.Caption = '28275286000137') or (F_Menu.Label39.Caption = '28.275.286/0001-37') or
                         (F_Menu.Label39.Caption = '27400369000148') or (F_Menu.Label39.Caption = '27.400.369/0001-48') or
                         (F_Menu.Label39.Caption = '27215776000185') or (F_Menu.Label39.Caption = '27.215.776/0001-85') or
                         (F_Menu.Label39.Caption = '27282471000196') or (F_Menu.Label39.Caption = '27.282.471/0001-96') Then
                       Begin
                         if (Not(PermiteRecepcaoSemDAJE)) then
                         begin
                           RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency));
                           RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('vr_pge').AsCurrency));
                         end
                         else
                         begin
                           RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
                           RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                         end
                       End
                       Else
                       Begin
                         if (Not(PermiteRecepcaoSemDAJE)) then
                         begin
                           RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('emol_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('fecom_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('def_pub_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('vr_pge').AsCurrency));



                           RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('tx_fisca_daje').AsCurrency));

                           RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('emol_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('fecom_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('def_pub_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('vr_pge').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('tx_fisca_daje').AsCurrency));

                         end
                         else
                         begin
                           Dm.ArqAux.Close;
                           Dm.ArqAux.Sql.Clear;
                           Dm.ArqAux.Sql.Add('SELECT * FROM td');
                           Dm.ArqAux.Sql.Add('WHERE');
                           Dm.ArqAux.Sql.Add('p_auxiliar = ' + QuotedStr(Label3.Caption));
                           Dm.ArqAux.Open;

                           RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
                           RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                           RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency + Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                         end

                       End;

                   End;
             End;

                  If cert_vias > 1 then RvProject1.ExecuteReport('report1'); // RECIBO PRENOTAÇÃO

                  If (F_Menu.Label39.Caption <> '34377622000155') and (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') <> '27215296000114') Then
                  Begin
                    If cert_vias > 1 then
                    Begin
                      RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
                      RvProject1.SetParam('cnpj_cart', F_Menu.Label39.Caption);
                      RvProject1.SetParam('site', 'Site: '+F_Menu.Label50.Caption);
                      RvProject1.SetParam('email_cartorio', 'Email:'+ F_Menu.Label55.Caption);
                      if F_Menu.Label39.Caption <> '34377622000155' Then
                        RvProject1.SetParam('end_cart',   F_Menu.Label11.Caption + ', '+F_Menu.Label7.Caption + ', '+ F_Menu.Label6.Caption)
                      else
                      RvProject1.SetParam('end_cart',   F_Menu.Label11.Caption + '  Cidade: '+F_Menu.Label7.Caption + ' Estado: '+ F_Menu.Label6.Caption);
                      RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
                      RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
                      RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
                      if MkEmail.Text <> '' then
                        RvProject1.SetParam('email',  'Email: ' + MkEmail.Text);
                      RvProject1.SetParam('Descricao',  copy(F_RecepR.Combobox5.text,1,4));
                      RvProject1.SetParam('Descricao2', F_RecepR.Combobox3.text);
                      RvProject1.SetParam('Descricao3', '1');
                      RvProject1.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
                      RvProject1.SetParam('situacao',  ComboBox7.Text);
                      RvProject1.SetParam('telefone',  MaskEdit18.Text);
                      RvProject1.SetParam('email_apresentante',  MkEmail.Text);
                      RvProject1.SetParam('observacao', Memo1.Text);
                      RvProject1.SetParam('atribuicao', atribuicao);
                      RvProject1.setParam('daje', 'DAJE Nº '+ DM.ArqAux.fieldbyname('daje').AsString +' SÉRIE Nº '+ DM.ArqAux.fieldbyname('serie_daje').AsString +' EMISSOR Nº '+  iddaje);
                      if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then //1 RTD
                        RvProject1.SetParam('data_entr', 'Entrega: ' +MaskEdit16.Text);

                      Dm.qryGenerico.Close;
                      Dm.qryGenerico.Sql.Clear;
                      Dm.qryGenerico.Sql.Add('select emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_pge, vr_daje, status from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
                      Dm.qryGenerico.ParamByName('serie_daje').AsString:=  Dm.ArqAux.FieldByName('serie_daje').AsString;
                      Dm.qryGenerico.ParamByName('numero_daje').AsString:= Dm.ArqAux.FieldByName('daje').AsString;
                      Dm.qryGenerico.Open;
                      if Dm.qryGenerico.FieldByName('status').AsString = 'Isento' then
                      begin
                        RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', 0.00));
                        RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', 0.00));
                        RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', 0.00));
                        RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', 0.00));
                        RvProject1.SetParam('nome_exc', FormatCurr('###,###,##0.00', 0.00));
                        RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', 0.00));
                      End
                      Else
                      Begin
                        if (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27215296000114') then  //Valença
                        begin
                          RvProject1.SetParam('emol',        FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency)    );
                          RvProject1.SetParam('tx_fiscal',   FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
                          RvProject1.SetParam('fecom',       FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency)   );
                          RvProject1.SetParam('def_publica', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency) );
                          RvProject1.SetParam('pge',         FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_pge').AsCurrency)       );
                          RvProject1.SetParam('vr_daje',        FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency)       );
                          RvProject1.SetParam('situacao',    ComboBox7.Text);
                        end
                        else
                        if (F_Menu.Label39.Caption = '27357717000141') or (F_Menu.Label39.Caption = '27.357.717/0001-41') or
                          (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66') or
                          (F_Menu.Label39.Caption = '28275286000137') or (F_Menu.Label39.Caption = '28.275.286/0001-37') or
                          (F_Menu.Label39.Caption = '27400369000148') or (F_Menu.Label39.Caption = '27.400.369/0001-48') or
                          (F_Menu.Label39.Caption = '27215776000185') or (F_Menu.Label39.Caption = '27.215.776/0001-85') or
                          (F_Menu.Label39.Caption = '27282471000196') or (F_Menu.Label39.Caption = '27.282.471/0001-96') Then
                        Begin
                          RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency));
                          RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('vr_pge').AsCurrency));

                          RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
                        End
                        Else
                        Begin
                          RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                     Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                     Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                     Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency));


                         RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));

                         RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('emol_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('fecom_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('def_pub_daje').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('vr_pge').AsCurrency +
                                                                       Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('tx_fisca_daje').AsCurrency));


                       End;
                       {RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                     Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                     Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                     Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency +
                                                                     Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));}

                      End;

                      RvProject1.ExecuteReport('report2');  //RECIBO TITULOS
                    End
                  Else
                    Begin
                      RvProject2.SetParam('nome_cart', F_Menu.Label29.Caption);
                      RvProject2.SetParam('site', 'Site: '+F_Menu.Label50.Caption);
                      RvProject2.SetParam('email_cartorio', 'Email:'+ F_Menu.Label55.Caption);
                      RvProject2.SetParam('cnpj_cart', F_Menu.Label39.Caption);
                      if F_Menu.Label39.Caption <> '34377622000155' Then
                        RvProject2.SetParam('end_cart',   F_Menu.Label11.Caption + ', '+F_Menu.Label7.Caption + ', '+ F_Menu.Label6.Caption)
                      else
                      RvProject2.SetParam('end_cart',   F_Menu.Label11.Caption + '  Cidade: '+F_Menu.Label7.Caption + ' Estado: '+ F_Menu.Label6.Caption);
                      RvProject2.SetParam('fone_cart',  F_Menu.Label12.Caption);
                      RvProject2.SetParam('usuario',    F_Menu.Label25.Caption);
                      RvProject2.SetParam('doc_usu',    F_Menu.Label38.Caption);
                      if MkEmail.Text <> '' then
                        RvProject2.SetParam('email',  'Email: ' + MkEmail.Text);
                      RvProject2.SetParam('situacao',  ComboBox7.Text);
                      RvProject2.SetParam('Descricao',  copy(F_RecepR.Combobox5.text,1,4));
                      RvProject2.SetParam('Descricao2', F_RecepR.Combobox3.text);
                      RvProject2.SetParam('Descricao3', '1');
                      RvProject2.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
                      RvProject2.SetParam('situacao',  ComboBox7.Text);
                      RvProject2.SetParam('email_apresentante',  MkEmail.Text);
                      RvProject2.SetParam('observacao', Memo1.Text);
                      RvProject2.SetParam('atribuicao', atribuicao);  
                      RvProject2.setParam('daje', 'DAJE Nº '+ DM.ArqAux.fieldbyname('daje').AsString +' SÉRIE Nº '+ DM.ArqAux.fieldbyname('serie_daje').AsString +' EMISSOR Nº '+  iddaje);
                      RvProject2.SetParam('telefone',  MaskEdit18.Text);
                      if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then //1 RTD
                        RvProject2.SetParam('data_entr', 'Entrega: ' +MaskEdit16.Text);

                      Dm.qryGenerico.Close;     
                      Dm.qryGenerico.Sql.Clear;
                      Dm.qryGenerico.Sql.Add('select serie_daje_complementar, numero_daje_complementar, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_pge, vr_daje, status from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
                      Dm.qryGenerico.ParamByName('serie_daje').AsString:=  Dm.ArqAux.FieldByName('serie_daje').AsString;
                      Dm.qryGenerico.ParamByName('numero_daje').AsString:= Dm.ArqAux.FieldByName('daje').AsString;
                      Dm.qryGenerico.Open;

                      dm.qryGenerico_Aux.Close;
                      dm.qryGenerico_Aux.SQL.Clear;
                      dm.qryGenerico_Aux.SQL.Add('select serie_daje_complementar, numero_daje_complementar, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_declarado, vr_daje, vr_pge from daje ');
                      dm.qryGenerico_Aux.SQL.Add('where serie_daje      = ' + QuotedStr(Dm.qryGenerico.FieldByName('serie_daje_complementar').asString));
                      dm.qryGenerico_Aux.SQL.Add('and numero_daje = ' + QuotedStr(Dm.qryGenerico.FieldByName('numero_daje_complementar').asString) +' and status <> '+QuotedStr('Isento')+'');
                      dm.qryGenerico_Aux.Open;

                      if Dm.qryGenerico.FieldByName('status').AsString = 'Isento' then
                      begin
                        RvProject2.SetParam('emol_tit', FormatCurr('###,###,##0.00', 0.00));
                        RvProject2.SetParam('fetj_tit', FormatCurr('###,###,##0.00', 0.00));
                        RvProject2.SetParam('tota_tit', FormatCurr('###,###,##0.00', 0.00));
                      end
                      else
                      begin
                        if (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '27215296000114') then  //Valença
                        begin
                          RvProject2.SetParam('emol',        FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency)    );
                          RvProject2.SetParam('tx_fiscal',   FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
                          RvProject2.SetParam('fecom',       FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency)   );
                          RvProject2.SetParam('def_publica', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency) );
                          RvProject2.SetParam('pge',         FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_pge').AsCurrency)       );
                          RvProject2.SetParam('vr_daje',     FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency)       );
                          RvProject2.SetParam('situacao',    ComboBox7.Text);
                        end
                        else
                        if (F_Menu.Label39.Caption = '27357717000141') or (F_Menu.Label39.Caption = '27.357.717/0001-41') or
                          (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66') or
                          (F_Menu.Label39.Caption = '28275286000137') or (F_Menu.Label39.Caption = '28.275.286/0001-37') or
                          (F_Menu.Label39.Caption = '27400369000148') or (F_Menu.Label39.Caption = '27.400.369/0001-48') or
                          (F_Menu.Label39.Caption = '27215776000185') or (F_Menu.Label39.Caption = '27.215.776/0001-85') or
                          (F_Menu.Label39.Caption = '27282471000196') or (F_Menu.Label39.Caption = '27.282.471/0001-96') Then
                        Begin
                          if (Not(PermiteRecepcaoSemDAJE)) then
                          begin
                            RvProject2.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency));
                            RvProject2.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('vr_pge').AsCurrency));

                           RvProject2.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('emol_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('fecom_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('def_pub_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('vr_pge').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('tx_fisca_daje').AsCurrency));

                          end
                          else
                          begin
                            RvProject2.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
                            RvProject2.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                            RvProject2.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency + Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                          end
                        End
                        Else
                        Begin
                          if (Not(PermiteRecepcaoSemDAJE)) then
                          begin
                            RvProject2.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency));


                            RvProject2.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));

                            RvProject2.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('emol_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('fecom_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('def_pub_daje').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('vr_pge').AsCurrency +
                                                                         Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Aux.fieldbyname('tx_fisca_daje').AsCurrency));

                         end
                         else
                         begin
                            RvProject2.SetParam('emol_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
                            RvProject2.SetParam('fetj_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                            RvProject2.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.ArqAux.fieldbyname('v_emolumentos').AsCurrency + Dm.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                         end
                       End;

                       {RvProject2.SetParam('tota_tit', FormatCurr('###,###,##0.00', Dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                     Dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                     Dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                     Dm.qryGenerico.fieldbyname('vr_pge').AsCurrency +
                                                                     Dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));}
                      End;

                      RvProject2.ExecuteReport('report2');  //RECIBO TITULOS
                    End
                  End
                  Else
                  Begin
                    If cert_vias > 1 then
                    Begin

                      DM.qryGenerico.Close;
                      DM.qryGenerico.SQL.Clear;
                      DM.qryGenerico.Sql.Add('SELECT exibir_prazo_recibo_protocolo FROM tab_ato2 where tabela = :tabela  and item_tab = :item_tab ');
                      DM.qryGenerico.Sql.Add('and YEAR(data) = YEAR('+ QuotedStr(ConvData(MaskEdit1.Text))+ ')');
                      DM.qryGenerico.ParamByName('tabela').AsString:= Copy(ComboBox5.Text, 1,1);
                      DM.qryGenerico.ParamByName('item_tab').AsString:= Copy(ComboBox5.Text, 3,1);
                      DM.qryGenerico.Open; 

                      {if (Not(bNaoExibirDataDeEntregaNoReciboDeProtocolo)) then
                        RvProject3.SetParam('DataDeEntrega', 'Data de Entrega: ' +MaskEdit16.Text);}

                      RvProject3.SetParam('DataDeEntrega', '');

                      Dm.qryGenerico.Close;
                      Dm.qryGenerico.Sql.Clear;
                      Dm.qryGenerico.Sql.Add('select emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
                      Dm.qryGenerico.ParamByName('serie_daje').AsString:=  serie_dajeVias;
                      Dm.qryGenerico.ParamByName('numero_daje').AsString:= ndajevias;
                      Dm.qryGenerico.Open;


                      RvProject3.SetParam('nome_cart', F_Menu.Label29.Caption);
                      RvProject3.SetParam('cnpj_cart', F_Menu.Label39.Caption);
                      RvProject3.SetParam('end_cart',  F_Menu.Label11.Caption);
                      RvProject3.SetParam('fone_cart',  F_Menu.Label12.Caption);
                      RvProject3.SetParam('usuario',    F_Menu.Label25.Caption);
                      RvProject3.SetParam('doc_usu',    F_Menu.Label38.Caption);
                      RvProject3.SetParam('Descricao',  copy(F_RecepR.Combobox5.text,1,4));
                      RvProject3.SetParam('Descricao2', F_RecepR.Combobox3.text);
                      RvProject3.SetParam('Descricao3', '1');
                      RvProject3.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
                      RvProject3.SetParam('situacao',  ComboBox7.Text);
                      RvProject3.SetParam('email',  MkEmail.Text);
                      RvProject3.SetParam('celular',  MaskEdit2.Text);
                      

                      RvProject3.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
                      RvProject3.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                      RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));

                      RvProject3.SetParam('emol_tit2', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency - DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
                      RvProject3.SetParam('fetj_tit2', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));

                      if (serie_dajeVias <> '') and (ndajevias <> '') Then
                      Begin
                        RvProject3.SetParam('daje',        Strzero(sdaje, 3) + Strzero(ndaje, 6));
                        RvProject3.SetParam('daje_new',    Strzero(serie_dajeVias, 3)+ Strzero(ndajevias, 6));

                        //RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency + DM.qryGenerico.fieldbyname('vr_daje').AsCurrency));
                        RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
                      End
                      Else
                      Begin
                        RvProject3.SetParam('daje',    Strzero(sdaje, 3)+ndaje);
                      End;

                      RvProject3.SetParam('sistema',  'Titulos e Documentos');
                      RvProject3.ExecuteReport('report1');  //RECIBO TITULOS
                    End
                    Else
                    Begin

                      DM.qryGenerico.Close;
                      DM.qryGenerico.SQL.Clear;
                      DM.qryGenerico.Sql.Add('SELECT exibir_prazo_recibo_protocolo FROM tab_ato2 where tabela = :tabela  and item_tab = :item_tab ');
                      DM.qryGenerico.Sql.Add('and YEAR(data) = YEAR('+ QuotedStr(ConvData(MaskEdit1.Text))+ ')');
                      DM.qryGenerico.ParamByName('tabela').AsString:= Copy(ComboBox5.Text, 1,1);
                      DM.qryGenerico.ParamByName('item_tab').AsString:= Copy(ComboBox5.Text, 3,1);
                      DM.qryGenerico.Open;

                      //if (Not(bNaoExibirDataDeEntregaNoReciboDeProtocolo)) then
                        //RvProject3.SetParam('DataDeEntrega', 'Data de Entrega: ' +MaskEdit16.Text);

                      RvProject3.SetParam('DataDeEntrega', '');



                      Dm.qryGenerico.Close;
                      Dm.qryGenerico.Sql.Clear;
                      Dm.qryGenerico.Sql.Add('select emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
                      Dm.qryGenerico.ParamByName('serie_daje').AsString:=  serie_dajeVias;
                      Dm.qryGenerico.ParamByName('numero_daje').AsString:= ndajevias;
                      Dm.qryGenerico.Open;

                      RvProject3.SetParam('nome_cart', F_Menu.Label29.Caption);
                      RvProject3.SetParam('cnpj_cart', F_Menu.Label39.Caption);
                      RvProject3.SetParam('end_cart',  F_Menu.Label11.Caption);
                      RvProject3.SetParam('fone_cart',  F_Menu.Label12.Caption);
                      RvProject3.SetParam('usuario',    F_Menu.Label25.Caption);
                      RvProject3.SetParam('doc_usu',    F_Menu.Label38.Caption);
                      RvProject3.SetParam('situacao',  ComboBox7.Text);
                      RvProject3.SetParam('Descricao',  copy(F_RecepR.Combobox5.text,1,4));
                      RvProject3.SetParam('Descricao2', F_RecepR.Combobox3.text);
                      RvProject3.SetParam('Descricao3', '1');
                      RvProject3.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
                      RvProject3.SetParam('situacao',  ComboBox7.Text);
                      RvProject3.SetParam('email',  MkEmail.Text);
                      RvProject3.SetParam('celular',  MaskEdit2.Text);

                      Dm.qryGenerico.Close;
                      Dm.qryGenerico.Sql.Clear;
                      Dm.qryGenerico.Sql.Add('select emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_pge, vr_daje, status from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
                      Dm.qryGenerico.ParamByName('serie_daje').AsString:=  Dm.ArqAux.FieldByName('serie_daje').AsString;
                      Dm.qryGenerico.ParamByName('numero_daje').AsString:= Dm.ArqAux.FieldByName('daje').AsString;
                      Dm.qryGenerico.Open;
                      if Dm.qryGenerico.FieldByName('status').AsString = 'Isento' then
                      begin
                        RvProject3.SetParam('emol_tit', FormatCurr('###,###,##0.00', 0.00));
                        RvProject3.SetParam('fetj_tit', FormatCurr('###,###,##0.00', 0.00));
                        RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', 0.00));
                        RvProject3.SetParam('emol_tit2', FormatCurr('###,###,##0.00', 0.00));
                        RvProject3.SetParam('fetj_tit2', FormatCurr('###,###,##0.00', 0.00));
                      End
                      Else
                      Begin
                        RvProject3.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
                        RvProject3.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                        RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
                        RvProject3.SetParam('emol_tit2', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency - DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
                        RvProject3.SetParam('fetj_tit2', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
                      End;

                      if (serie_dajeVias <> '') and (ndajevias <> '') Then
                      Begin
                        RvProject3.SetParam('daje',        Strzero(sdaje, 3) + ndaje);
                        RvProject3.SetParam('daje_new',    Strzero(serie_dajeVias, 3) + Strzero(ndajevias, 6));
                        //RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency - DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
                        RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
                      End
                      Else
                      Begin
                        RvProject3.SetParam('daje',    Strzero(sdaje, 3)+ndaje);
                      End;  
                      RvProject3.SetParam('sistema',  'Titulos e Documentos');
                      RvProject3.Execute;  //RECIBO TITULOS
                    End;
                  End;

                end;

                if False then
                begin
                  VrTrib_nom  := 0;
                  VrDefen_nom := 0;
                  VrProcu_nom := 0;
                  tot_nomexc  := 0;
                  nome_dist   := 0;
                  v_nome      := 0;

                  // RECIBO DE VIAS EXCEDENTES - RESENDE
                  if (F_RecepR.MaskEdit26.Text <> '0') then
                  begin
                    Dm.Calculo.Close;
                    Dm.Calculo.Sql.Clear;
                    Dm.Calculo.Sql.Add('SELECT data FROM cad_cus');
                    Dm.Calculo.Sql.Add('GROUP BY data');
                    Dm.Calculo.Sql.Add('ORDER BY data DESC');
                    Dm.Calculo.Open;
                    if (Dm.Calculo.RecordCount = 0) then
                    begin
                      Dm.Calculo.Close;
                      MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
                      Exit;
                    end;
                    while (not Sair) AND (not Dm.Calculo.Eof) do
                    begin
                      if (StrToDate(MaskEdit1.Text) >= Dm.Calculo.FieldByName('data').asDateTime) then
                      begin
                        DtCalc := Dm.Calculo.FieldByName('data').AsString;
                        Sair   := True;
                      end;
                      Dm.Calculo.Next;
                    end;


                    { Calculo para a Via Excedente }
                    Dm.Calculo.Close;
                    Dm.Calculo.Sql.Clear;
                    Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
                    Dm.Calculo.Sql.Add('WHERE');
                    Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
                    Dm.Calculo.Sql.Add('AND tabela = ''10''');
                    Dm.Calculo.Sql.Add('AND item  = ''4''');
                    Dm.Calculo.Open;
                    if (Dm.Calculo.RecordCount = 0) then
                    begin
                      Dm.Calculo.Close;
                      MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR A TABELA DE VIAS EXCEDENTES !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
                      Exit;
                    end;
                    emo_vex := Dm.Calculo.FieldByName('v_emolumentos').asCurrency * StrToInt(MaskEdit26.Text);
                    Dm.Calculo.Close;

                    { Conferencia }
                    Dm.Calculo.Close;
                    Dm.Calculo.Sql.Clear;
                    Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
                    Dm.Calculo.Sql.Add('WHERE');
                    Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
                    Dm.Calculo.Sql.Add('AND tabela = ''1''');
                    Dm.Calculo.Sql.Add('AND item  = ''5''' );
                    Dm.Calculo.Open;
                    if (Dm.Calculo.RecordCount = 0) then
                    begin
                      Dm.Calculo.Close;
                      MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
                      Exit;
                    end;
                    con_vex := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
                    Dm.Calculo.Close;

                    //Busca
                    Dm.Calculo.Close;
                    Dm.Calculo.Sql.Clear;
                    Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
                    Dm.Calculo.Sql.Add('WHERE');
                    Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
                    Dm.Calculo.Sql.Add('AND tabela = ''1''');
                    Dm.Calculo.Sql.Add('AND item  = ''1''' );
                    Dm.Calculo.Open;
                    if (Dm.Calculo.RecordCount = 0) then
                    begin
                      Dm.Calculo.Close;
                      MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
                      Exit;
                    end;
                    bus_vex := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
                    Dm.Calculo.Close;

                    //Informatica
                    Dm.Calculo.Close;
                    Dm.Calculo.Sql.Clear;
                    Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
                    Dm.Calculo.Sql.Add('WHERE');
                    Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
                    Dm.Calculo.Sql.Add('AND tabela = ''1''');
                    Dm.Calculo.Sql.Add('AND item  = ''9''');
                    Dm.Calculo.Open;
                    if (Dm.Calculo.RecordCount = 0) then
                    begin
                      Dm.Calculo.Close;
                      MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
                      Exit;
                    end;
                    inf_exc := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
                    Dm.Calculo.Close;
                    gui_exc := dm.TabDemais.FieldByName('guia_informatica').AsCurrency  * StrToInt(MaskEdit26.Text);

                    sub_vex := emo_vex + con_vex + bus_vex + inf_exc + gui_exc;

                    lei20_vex := truncav((sub_vex * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
                    lei05_vex := truncav((sub_vex * dm.tabdemais.FieldByName('defensoria').ascurrency) / 100);
                    lei05a_vex:= truncav((sub_vex * dm.tabdemais.FieldByName('procuradoria').ascurrency) / 100);

                    tot_vex := sub_vex + lei20_vex + lei05_vex + lei05a_vex;
                  end;


                  RvDataSetConnection1.DataSet := dm.ArqAux;


                  RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
                  RvProject1.SetParam('data', F_menu.Label7.caption + formatdatetime('" ," dd "de" mmmm "de" yyyy', date));
                  RvProject1.ExecuteReport('report1'); // RECIBO PRENOTAÇÃO


                  RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
                  RvProject1.SetParam('cnpj_cart', F_Menu.Label39.Caption);
                  RvProject1.SetParam('site', 'Site: '+F_Menu.Label50.Caption);
                  RvProject1.SetParam('email_cartorio', 'Email:'+ F_Menu.Label55.Caption);
                  if F_Menu.Label39.Caption <> '34377622000155' Then
                    RvProject1.SetParam('end_cart',   F_Menu.Label11.Caption + ', '+F_Menu.Label7.Caption + ', '+ F_Menu.Label6.Caption)
                  else
                  RvProject1.SetParam('end_cart',   F_Menu.Label11.Caption + '  Cidade: '+F_Menu.Label7.Caption + ' Estado: '+ F_Menu.Label6.Caption);
                  RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
                  RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
                  RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
                  if MkEmail.Text <> '' then
                    RvProject1.SetParam('email',  'Email: ' + MkEmail.Text);
                  RvProject1.SetParam('Descricao',  F_RecepR.RichEdit1.Text);
                  RvProject1.SetParam('Descricao2', F_RecepR.RichEdit2.Text);
                  RvProject1.SetParam('Descricao3', F_RecepR.RichEdit3.Text);
                  RvProject1.SetParam('Descricao4', F_RecepR.RichEdit4.Text);
                  RvProject1.SetParam('telefone',  MaskEdit18.Text);
                  RvProject1.SetParam('observacao', Memo1.Text);
                  RvProject1.SetParam('atribuicao', atribuicao);
                  RvProject1.SetParam('email_apresentante',  MkEmail.Text);
                  if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then //1 RTD
                    RvProject1.SetParam('DataDeEntrega', 'Entrega: ' +MaskEdit16.Text);

                  emol_tit := DM.ArqAux.fieldbyname('v_subtotal').AsCurrency - sub_vex;
                  fetj_tit := DM.ArqAux.fieldbyname('v_tribunal').AsCurrency - lei20_vex;
                  fund_tit := DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency - lei05_vex;
                  funp_tit := DM.ArqAux.fieldbyname('v_defensoria').AsCurrency - lei05a_vex;
                  tota_tit := DM.ArqAux.fieldbyname('v_total').AsCurrency - tot_vex;


                  if (DM.ArqAux.fieldbyname('v_nome').AsCurrency = 0) then
                  begin
                    nome_dist := DM.ArqAux.fieldbyname('v_distrib').AsCurrency;

                    //Tribunal
                    VrTrib_nom  := trunca2casa((nome_dist * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
                    //Defensoria
                    VrDefen_nom := trunca2casa((nome_dist * dm.tabdemais.FieldByName('defensoria').ascurrency) / 100);
                    //Procuradoria
                    VrProcu_nom := trunca2casa((nome_dist * dm.tabdemais.FieldByName('procuradoria').ascurrency) / 100);

                    tot_nomexc :=  nome_dist + VrTrib_nom + VrDefen_nom + VrProcu_nom;
                  end
                  else
                  begin
                    tot_nomexc := DM.ArqAux.fieldbyname('v_nome').AsCurrency;
                  end;

                  nome_exc := tot_nomexc;

                  RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', emol_tit));
                  RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', fetj_tit));
                  RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', fund_tit));
                  RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', funp_tit));
                  RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', tota_tit));
                  RvProject1.SetParam('nome_exc', FormatCurr('###,###,##0.00', nome_exc +
                                                                               DM.ArqAux.fieldbyname('v_distrib').AsCurrency +
                                                                               DM.ArqAux.fieldbyname('v_leis_dist').AsCurrency));

                  RvProject1.ExecuteReport('report2');  //RECIBO TITULOS


                  if (F_RecepR.MaskEdit26.Text <> '0') then
                  begin
                    RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
                    RvProject1.SetParam('cnpj_cart', F_Menu.Label39.Caption);
                    RvProject1.SetParam('site', 'Site: '+F_Menu.Label50.Caption);
                    RvProject1.SetParam('email_cartorio', 'Email:'+ F_Menu.Label55.Caption);
                    if F_Menu.Label39.Caption <> '34377622000155' Then
                      RvProject1.SetParam('end_cart',   F_Menu.Label11.Caption + ', '+F_Menu.Label7.Caption + ', '+ F_Menu.Label6.Caption)
                    else
                    RvProject1.SetParam('end_cart',   F_Menu.Label11.Caption + '  Cidade: '+F_Menu.Label7.Caption + ' Estado: '+ F_Menu.Label6.Caption);
                    RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
                    RvProject1.SetParam('usuario', F_Menu.Label25.Caption);
                    RvProject1.SetParam('doc_usu', F_Menu.Label38.Caption);
                    if MkEmail.Text <> '' then
                      RvProject1.SetParam('email',  'Email: ' + MkEmail.Text);
                    RvProject1.SetParam('Descricao',  F_RecepR.RichEdit5.Text);
                    RvProject1.SetParam('Descricao2', F_RecepR.RichEdit6.Text);
                    RvProject1.SetParam('Descricao3', F_RecepR.RichEdit7.Text);
                    RvProject1.SetParam('Descricao4', F_RecepR.RichEdit8.Text);
                    RvProject1.SetParam('observacao', Memo1.Text);
                    RvProject1.SetParam('atribuicao', atribuicao);
                    RvProject1.setParam('daje', 'DAJE Nº '+ DM.ArqAux.fieldbyname('daje').AsString +' SÉRIE Nº '+ DM.ArqAux.fieldbyname('serie_daje').AsString +' EMISSOR Nº '+  iddaje);
                    RvProject1.SetParam('telefone',  MaskEdit18.Text);
                    RvProject1.SetParam('email_apresentante',  MkEmail.Text);
                    RvProject1.SetParam('emol', FormatCurr('###,###,##0.00', sub_vex));
                    RvProject1.SetParam('fetj', FormatCurr('###,###,##0.00', lei20_vex));
                    RvProject1.SetParam('fund', FormatCurr('###,###,##0.00', lei05a_vex));
                    RvProject1.SetParam('funp', FormatCurr('###,###,##0.00', lei05_vex));
                    RvProject1.SetParam('vtot', FormatCurr('###,###,##0.00', tot_vex));
                    RvProject1.ExecuteReport('report3');  //RECIBO VIAS EXCEDENTES
                  end;
                end;
              end
              else
              Begin
                ReciboRec(Funcoes, False, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit19.Text), Trim(MaskEdit18.Text), Trim(Copy(ComboBox3.Text, 7, 50)), MaskEdit16.Text, Label37.Caption, Trim(MaskEdit17.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'TD C', False), CurrencyEdit3.Value, CurrencyEdit2.Value, VrEmolumentos, VrEmolAdicional, VrPag, VrViasExcedente, VrMicrofilme, VrDigitalizacao, VrInformatica, VrGravEletronica, VrConferencia,
                            VrDistrib, VrInfoDistrib, VrGravEletrDistrib, VrNomeExc, calc_vfetj, VrProcuradoria, VrDefensoria, VrMutua, VrAcoterj, VrSubTotal, VrTotG);
              end;                                                                   // VrTribunal,
            end
            else
            Begin
              if f_menu.matricial.Caption = '1' then
              begin
                if (F_Menu.Label24.Caption = 'T') then
                begin
                  Funcoes.ReciboTitulos(Funcoes, True, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit17.Text), Trim(MaskEdit18.Text), Trim(Copy(ComboBox3.Text, 7, 50)), MaskEdit16.Text, Label37.Caption, Trim(MaskEdit19.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'TD C', False), CurrencyEdit3.Value,
                                VrEmolumentos, VrEmolAdicional, VrPag, VrViasExcedente, VrMicrofilme, VrDigitalizacao, VrInformatica, VrGravEletronica, VrConferencia,
                                VrDistrib, VrInfoDistrib, VrGravEletrDistrib, VrNomeExc, calc_vfetj, VrProcuradoria, VrDefensoria, VrMutua, VrAcoterj, VrSubTotal, VrTotG);
                end                                                                      //VrTribunal,
                else
                Begin
                  Funcoes.ReciboTitulos(Funcoes, False, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit17.Text), Trim(MaskEdit18.Text), Trim(Copy(ComboBox3.Text, 7, 50)), MaskEdit16.Text, Label37.Caption, Trim(MaskEdit19.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'TD C', False), CurrencyEdit3.Value,
                                VrEmolumentos, VrEmolAdicional, VrPag, VrViasExcedente, VrMicrofilme, VrDigitalizacao, VrInformatica, VrGravEletronica, VrConferencia,
                                VrDistrib, VrInfoDistrib, VrGravEletrDistrib, VrNomeExc, calc_vfetj, VrProcuradoria, VrDefensoria, VrMutua, VrAcoterj, VrSubTotal, VrTotG);
                end;                                                                     //VrTribunal,
              end
              else
              begin
                Application.CreateForm(TF_TelaRecep, F_TelaRecep);
                F_TelaRecep.Label1.Caption := 'Gerar impressão quantas vezes ?';
                F_TelaRecep.ShowModal;
                vez := F_TelaRecep.MaskEdit1.Text;
                F_TelaRecep.Destroy;
                F_TelaRecep := NIL;

                for y := 1 to strtoint(vez) do
                begin
                  impport := Bematech_porta;
                  ReciboRecBem(Funcoes, True, MaskEdit1.Text, Label3.Caption, MaskEdit8.Text, Trim(MaskEdit19.Text), Trim(MaskEdit18.Text), Trim(Copy(ComboBox3.Text, 1, 50)), MaskEdit16.Text, Label37.Caption, Trim(MaskEdit12.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'TD C', False),  Label9.Caption , copy(ComboBox5.text, 1, 5) , MaskEdit24.Text, Maskedit9.text, MaskEdit10.Text, Maskedit26.Text, impport, MaskEdit5.Text, F_Menu.Label1.Caption,
                               CurrencyEdit3.Value, CurrencyEdit2.Value, VrEmolumentos, VrEmolAdicional, VrPag, VrViasExcedente, VrMicrofilme, VrDigitalizacao, Vr_Notpag, VrInformatica, VrGravEletronica, VrConferencia, (VrDoi + VrDoiInfo), VrProcEst, VrPorDist,
                               (VrDistrib+VrTrib_DIST + VrDefen_DIST + VrProcu_DIST + VrTrib_nom + VrDefen_nom + VrProcu_nom+tot_nomexc), VrInfoDistrib, VrGravEletrDistrib, VrNomeExc, calc_vfetj, VrProcuradoria, VrDefensoria, VrMutua, VrAcoterj, VrSubTotal, VrTotG);
                end;                                                                                                                                                                    //VrTribunal, 
              end;
            end;
          end;

          if F_Menu.Label9.Caption = 'D' then
            ListBox1.Items.Add(qcartorio + '  ' + Label3.Caption)
          else
          ListBox1.Items.Add(Label3.Caption);

          ListBox1.ItemIndex := (ListBox1.Items.Count -1);
          {Label3.Caption := '000000';
          MaskEdit8.Text := '000000';}
        end;
      end
      else
      begin
        ShowMessage('Recepção não gerada !');
        Label3.Caption := '000000';
        MaskEdit8.Text := '000000';
      end;
      Dm.Td.Close;
      Dm.Td_Pesso.Close;
      BitBtn4.Enabled     := False;
    end
    else ShowMessage('Recepção não gerada !');
  end
  else ShowMessage('Recepção não gerada !');
  GroupBox4.Enabled := False;
  BitBtn2.SetFocus;

end;

procedure TF_RecepR.BitBtn2Click(Sender: TObject);
var
   Query1:Tquery;
begin
  Limpar_Tela(F_RecepR);

  F_RecepR.RichEdit1.Clear;
  F_RecepR.RichEdit2.Clear;
  F_RecepR.RichEdit3.Clear;
  F_RecepR.RichEdit4.Clear;
  F_RecepR.RichEdit5.Clear;
  F_RecepR.RichEdit6.Clear;
  F_RecepR.RichEdit7.Clear;
  F_RecepR.RichEdit8.Clear;
  btImprimir.Enabled:= False;

  Application.CreateForm(TF_DAJE_TJ, F_DAJE_TJ);
  F_DAJE_TJ.ShowModal;
  ndaje := F_DAJE_TJ.MaskEdit2.Text;
  sdaje := F_DAJE_TJ.MaskEdit1.Text;
  {F_DAJE_TJ.MaskEdit1.Clear;
  F_DAJE_TJ.MaskEdit2.Clear;
  F_DAJE_TJ.Destroy;
  F_DAJE_TJ := Nil;}

  DM.ArqAux.Close;
  DM.ArqAux.Sql.Clear;
  DM.ArqAux.Sql.Add('SELECT p_auxiliar, daje FROM td WHERE (daje = ' + QuotedStr(ndaje));
  DM.ArqAux.Sql.Add(' and serie_daje = ' + QuotedStr(sdaje) + ') or (dajepost = ' + QuotedStr(sdaje+ndaje));
  DM.ArqAux.Sql.Add(') or (dajevias = ' + QuotedStr(sdaje+ndaje) + ')');
  DM.ArqAux.Open;

  DM.ArqAux1.Close;
  DM.ArqAux1.Sql.Clear;
  DM.ArqAux1.Sql.Add('SELECT nr_protoc, daje FROM certidao WHERE daje = ' + QuotedStr(ndaje));
  DM.ArqAux1.Sql.Add(' and serie_daje = ' + QuotedStr(sdaje));
  DM.ArqAux1.Open;

  DM.qryGenerico.Close;
  DM.qryGenerico.Sql.Clear;
  DM.qryGenerico.Sql.Add('SELECT daje.numero_selo,  daje.cod_validacao,  daje.numero_daje,  daje.serie_daje FROM selos ');
  DM.qryGenerico.Sql.Add(' inner join daje on (selos.daje = daje.numero_daje) and selos.serie_daje = daje.serie_daje ');
  DM.qryGenerico.Sql.Add(' where daje.numero_daje = '+QuotedStr(ndaje)+' and daje.serie_daje = '+QuotedStr(sdaje)+' and (daje.numero_selo is not null or daje.numero_selo <> "")');
  DM.qryGenerico.Open;

  if DM.qryGenerico.FieldByName('numero_selo').AsString <> '' then
  begin
    Application.MessageBox('Daje informado ja possui selo vinculado!', 'Recepção de Título', MB_ICONEXCLAMATION);
    Abort;
  end;


  MaskEdit10.Text:= '0';
  if ((DM.ArqAux.RecordCount <> 0)) and (Trim(ndaje) <> '') then
  begin
    MessageBox(0, PChar('Nº de DAJE já relacionado ao protocolo: '+DM.ArqAux.FieldByName('p_auxiliar').AsString+'. Favor Verificar !'), 'ALERTA', MB_OK + MB_ICONWARNING);
    F_RecepR.NaoInserirRecepcao := True;
    Exit;
  end;

  if ((DM.ArqAux1.RecordCount <> 0)) and (Trim(ndaje) <> '') then
  begin
    MessageBox(0, PChar('Nº de DAJE já relacionado na tabela de certidão, recibo: '+DM.ArqAux1.FieldByName('nr_protoc').AsString+'. Favor Verificar !'), 'ALERTA', MB_OK + MB_ICONWARNING);
    F_RecepR.NaoInserirRecepcao := True;
    Exit;
  end;

  if (not(NaoInserirRecepcao) OR (PermiteRecepcaoSemDAJE))  then
  begin
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('SELECT * FROM daje WHERE serie_daje = ' + QuotedStr(F_DAJE_TJ.MaskEdit1.Text));
    DM.ArqAux.Sql.Add(' and numero_daje = ' + QuotedStr(F_DAJE_TJ.MaskEdit2.Text));
    DM.ArqAux.Open;

    if DM.ArqAux.RecordCount <> 0 then
    begin
      ComboBox1.Text := DM.ArqAux.FieldByName('tipo_doc').AsString;
      MaskEdit27.EditMask := '';
      MaskEdit27.Text := DM.ArqAux.FieldByName('doc').AsString;

      if (Trim(ComboBox1.Text) = 'CPF') then MaskEdit27.EditMask := '###.###.###-##';
      if (Trim(ComboBox1.Text) = 'CNPJ') then MaskEdit27.EditMask := '##.###.###/####-##';

      MaskEdit17.Text := DM.ArqAux.FieldByName('contribuinte').AsString;
      MaskEdit10.Text := DM.ArqAux.FieldByName('pags').AsString;

      qtdPagina:= 0;
      qtdPagina:= DM.ArqAux.FieldByName('pags').AsInteger;

      DM.ArqAux1.Close;
      DM.ArqAux1.Sql.Clear;
      DM.ArqAux1.Sql.Add('SELECT ct.tabela, ct.item, ct.descricao, ct.subitem FROM tab_ato2 ta ');
      DM.ArqAux1.Sql.Add('left outer join cad_tab ct on (ct.tabela = ta.tabela and ct.item = ta.item_tab) ');
      DM.ArqAux1.Sql.Add('where ta.cod_ato = ' + DM.ArqAux.FieldByName('cod_ato').AsString);
      DM.ArqAux1.Open;
      if DM.ArqAux1.RecordCount <> 0 then
      begin
        DM.ArqAux1.FindFirst;
        if Dm.ArqAux1.FieldByName('item').AsString <> '' then
          ComboBox5.Text := Dm.ArqAux1.FieldByName('tabela').AsString + '.' + Trim(Dm.ArqAux1.FieldByName('item').AsString) + '.' + Trim(Dm.ArqAux1.FieldByName('subitem').AsString) + ' - ' + Dm.ArqAux1.FieldByName('descricao').AsString
        else
        ComboBox5.Text := Dm.ArqAux1.FieldByName('tabela').AsString + '.' + Trim(Dm.ArqAux1.FieldByName('item').AsString) + ' - ' + Dm.ArqAux1.FieldByName('descricao').AsString;
      end;

      if DM.ArqAux.FieldByName('numero_daje_complementar').AsString = '' then
      begin
        CurrencyEdit1.Value      := DM.ArqAux.FieldByName('vr_declarado').AsCurrency;
        CurrencyEdit2.Value      := DM.ArqAux.FieldByName('vr_daje').AsCurrency;
        CurrencyEdit3.Value      := DM.ArqAux.FieldByName('vr_daje').AsCurrency;
        valorDoDajeConformeTabela:= 0;
        valorDoDajeConformeTabela:= DM.ArqAux.FieldByName('vr_daje').AsCurrency;
      end
      else
      begin
        Query1:= TQuery.Create(nil);
        query1.databasename:=dm.ArqAux.DatabaseName;
        query1.close;
        query1.SQL.Text:='select sum(vr_daje) as total from daje where numero_daje in ('+ndaje+','+DM.ArqAux.FieldByName('numero_daje_complementar').AsString+')';
        query1.open;
        query1.last;
        query1.first;

        currencyEdit1.Value      := query1.FieldByName('total').AsCurrency;
        CurrencyEdit2.Value      := query1.FieldByName('total').AsCurrency;
        CurrencyEdit3.Value      := query1.FieldByName('total').AsCurrency;
        valorDoDajeConformeTabela:= 0;
        valorDoDajeConformeTabela:= query1.FieldByName('total').AsCurrency;
      end;

    end;

    Habilitar_Tela(True);

    if (F_Menu.livroAutomatico) then // Trabalha com livro automatico
    Begin
      MaskEdit13.Enabled:= False;
      MaskEdit14.Enabled:= False;
    End;

    if ComboBox5.Text <> '' Then
    begin                              
      DM.qryGenerico.Close;
      DM.qryGenerico.SQL.Clear;
      DM.qryGenerico.Sql.Add('SELECT exibir_prazo_recibo_protocolo FROM tab_ato2 where tabela = :tabela  and item_tab = :item_tab ');
      DM.qryGenerico.Sql.Add('and YEAR(data) = YEAR('+ QuotedStr(ConvData(MaskEdit1.Text))+ ')');
      DM.qryGenerico.ParamByName('tabela').AsString:= Copy(ComboBox5.Text, 1,1);
      DM.qryGenerico.ParamByName('item_tab').AsString:= Copy(ComboBox5.Text, 3,1);
      DM.qryGenerico.Open;

      bNaoExibirDataDeEntregaNoReciboDeProtocolo:= DM.qryGenerico.FieldByName('exibir_prazo_recibo_protocolo').AsBoolean;

//    MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), StrToInt(F_Menu.Label42.Caption)));

      If prazo_dias_uteis then
        MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), StrToInt(F_Menu.Label42.Caption)))
      Else
        MaskEdit16.Text := DateToStr(StrToDate(MaskEdit1.Text) + StrToInt(F_Menu.Label42.Caption));

    End;

    if not (DM.Configur.FieldByName('chk_17').AsBoolean) then
    begin
      MaskEdit8.SetFocus;
    end
    else
    begin
      if (F_Menu.Label26.Caption = 'F') then
        //MaskEdit2.SetFocus else ComboBox1.SetFocus;
    end;

    Label9.Caption := '0';
  end
  else
  begin
    Habilitar_Tela(False);
    if BitBtn2.Enabled Then
      BitBtn2.SetFocus;
  end;

  F_DAJE_TJ.MaskEdit1.Clear;
  F_DAJE_TJ.MaskEdit2.Clear;
  F_DAJE_TJ.Destroy;
  F_DAJE_TJ := Nil;

  //ComboBox1.SetFocus;
  if TRIM(ComboBox1.Text) = 'CPF' then
    ComboBox1.ItemIndex := 0
  else
    ComboBox1.ItemIndex := 1;
  if MaskEdit27.Enabled Then

    MaskEdit27.SetFocus;

end;

procedure TF_RecepR.FormActivate(Sender: TObject);
begin
  CodCli         := '0';
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(Date);

  if F_Menu.Label37.Caption = 'D' then
  begin
    Label9.Visible  := True;
    Label10.Visible := True;
  end;

  ComboBox9.Clear;
  dm.qr_cartorio.close;
  dm.qr_cartorio.sql.Clear;
  dm.qr_cartorio.sql.add('select * from catorios');
  dm.qr_cartorio.Open;

  //Abrindo Configur
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;

  //Abrindo Config_adm
  Dm.Config_Adm.Close;
  Dm.Config_Adm.Sql.Clear;
  Dm.Config_Adm.Sql.Add('SELECT * FROM config_adm');
  Dm.Config_Adm.Open;

  if not (DM.Configur.FieldByName('chk_17').AsBoolean) then
  begin
    MaskEdit8.Enabled := True;
  end;

  while not dm.qr_cartorio.Eof do
  begin
    ComboBox9.Items.Add(dm.qr_cartorio.FieldByName('codigo').AsString);
    dm.qr_cartorio.Next;
  end;

  if PageControl1.ActivePage = TabSheet1 Then
    BitBtn2.SetFocus;   
  //BitBtn2Click(F_RecepR);
end;

procedure TF_RecepR.MaskEdit17Exit(Sender: TObject);
begin
  if (Label26.Caption <> 'C') then
  begin
   if Procura_Contra('nome', Trim(MaskEdit17.Text)) then
     F_Alerta2.Showmodal;
  end;
  //MaskEdit19.Text := MaskEdit17.Text;
  //MaskEdit12.Text := MasKEdit27.Text;
end;

procedure TF_RecepR.ComboBox7Enter(Sender: TObject);
begin
//  SendMessage(ComboBox7.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RecepR.ComboBox7KeyPress(Sender: TObject; var Key: Char);
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

procedure TF_RecepR.ComboBox5Enter(Sender: TObject);
begin
  SendMessage(ComboBox5.handle, CB_SHOWDROPDOWN, Integer(True), 0);
  if (Trim(ComboBox5.Text) = '') then ComboBox5.Text := ComboBox5.Items.Strings[0];
end;

procedure TF_RecepR.ComboBox3Exit(Sender: TObject);
var
  util : String;
  pz   : Integer;
begin
  if ComboBox3.Text <> '' then
  begin
    dm.Natureza.Close;
    dm.Natureza.sql.Clear;
    dm.natureza.SQL.add('select * from natureza where natureza = "' + trim(copy(ComboBox3.Text, 1, 50)) + '"');
    dm.natureza.Open;
    MaskEdit4.Text := dm.Natureza.FieldByName('cod').AsString;
  //  util := dm.Natureza.FieldByName('uteis').AsString;
  //  pz   := dm.Natureza.FieldByName('prazo').AsInteger;
  //  pz   := pz - 1;
  //  if (util = 'N') then
 //   begin
 //     MaskEdit16.Text := DateToStr(Ver_DiaUtil(StrToDate(MaskEdit1.Text) + pz));
 //   end
 //   else MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), pz));
  end;
//  else MaskEdit16.Text := DateToStr(date);
  {Tipo_ := Copy(ComboBox3.Text, Length(ComboBox3.Text), 1);
  if (Tipo_ = 'N') then
  begin
    ComboBox5.Text  := ComboBox5.Items.Strings[3];
    MaskEdit24.Text := Copy(ComboBox3.Text, (Length(ComboBox3.Text) - 2), 2);
  end
  else
  begin
    ComboBox5.Items.Strings[0];
    MaskEdit24.Text := '1';
  end;

  if (Pos('NOTIFICACAO', ComboBox3.Text) > 0) then
  begin
    ComboBox5.Text  := '4.8 - NOTIFICACAO EXTRAJUDICIAL';
    Label47.Visible := True;
    MaskEdit20.Visible := True;
    if (StrToInt(MaskEdit4.Text) = 197) OR (StrToInt(MaskEdit4.Text) = 300) then MaskEdit24.Text := '1';
  end
  else
  begin
    Label47.Visible := False;
    MaskEdit20.Visible := False;
  end;

  {if (StrToInt(MaskEdit4.Text) = 2) then
  begin
    ComboBox5.Text  := '4.8 - NOTIFICACAO EXTRAJUDICIAL';
    if (StrToInt(MaskEdit4.Text) = 197) OR (StrToInt(MaskEdit4.Text) = 300) then MaskEdit24.Text := '1';
  end;}


 {if (Trim(MaskEdit4.Text) = '0') then MaskEdit4.Text := Copy(ComboBox3.Text, 1,3);
  if (Trim(ComboBox3.Text) <> '') then
  begin
    dm.Natureza.Close;
    dm.Natureza.sql.Clear;
    dm.natureza.SQL.add('select * from natureza where natureza = "' + ComboBox3.Text + '"');
    dm.natureza.Open;

    util := dm.Natureza.FieldByName('uteis').AsString;
    pz   := dm.Natureza.FieldByName('prazo').AsInteger;
    pz   := pz - 1;
    if (util = 'N') then
    begin
      MaskEdit16.Text := DateToStr(Ver_DiaUtil(StrToDate(MaskEdit1.Text) + pz));
    end
    else MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), pz));
  end
  else MaskEdit16.Text := DateToStr(date);
  Tipo_ := Copy(ComboBox3.Text, Length(ComboBox3.Text), 1);
  if (Tipo_ = 'N') then
  begin
    ComboBox5.Text  := ComboBox5.Items.Strings[3];
    MaskEdit24.Text := Copy(ComboBox3.Text, (Length(ComboBox3.Text) - 2), 2);
  end
  else
  begin
    ComboBox5.Items.Strings[0];
    MaskEdit24.Text := '0';
  end;
  if (StrToInt(MaskEdit4.Text) = 2) then
  begin
    ComboBox7.Text  := 'R   - REMETENTE';
    ComboBox5.Text  := '03 - Notificação';
    if (StrToInt(MaskEdit4.Text) = 197) OR (StrToInt(MaskEdit4.Text) = 300) then MaskEdit24.Text := '5';
  end;}
end;

procedure TF_RecepR.ListBox1DblClick(Sender: TObject);
var
  DtCalc, iddaje, atribuicao : String;
  sair   : Boolean;
  emo_vex, bus_vex, con_vex, inf_exc, gui_exc, sub_vex,
  lei20_vex, lei05_vex, lei05a_vex, tot_vex, emol_tit,
  fetj_tit, fund_tit, funp_tit, tota_tit : Currency;
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('p_auxiliar = ' + ListBox1.Items.Strings[ListBox1.ItemIndex]);
  Dm.ArqAux.Open;

  Dm.ArqAux2.Close;
  Dm.ArqAux2.Sql.Clear;
  Dm.ArqAux2.Sql.Add('select * from daje where numero_daje = ' +QuotedStr(Dm.ArqAux.fieldbyname('daje').AsString)+ ' and serie_daje = ' + QuotedStr(Dm.ArqAux.fieldbyname('serie_daje').AsString));
  Dm.ArqAux2.Open;
  iddaje := Dm.ArqAux2.fieldbyname('iddaje_tj').AsString;
  atribuicao := Dm.ArqAux2.fieldbyname('atribuicao').AsString;

  Dm.ArqAux2.Close;
  Dm.ArqAux2.Sql.Clear;
  Dm.ArqAux2.Sql.Add('SELECT * FROM td_pedid');
  Dm.ArqAux2.Sql.Add('WHERE');
  Dm.ArqAux2.Sql.Add('p_auxiliar = ' + ListBox1.Items.Strings[ListBox1.ItemIndex]);
  Dm.ArqAux2.Open;
  DM.ArqAux2.FindFirst;

  if (DM.Config_Adm.FieldByName('chk_08').AsBoolean) then
  begin
    {while not DM.ArqAux2.Eof do
    begin
      F_RecepR.RichEdit1.Lines.Add(DM.ArqAux2.fieldbyname('tabela').AsString + '.' + DM.ArqAux2.fieldbyname('item').AsString + ' ' + DM.ArqAux2.fieldbyname('subitem').AsString);
      F_RecepR.RichEdit2.Lines.Add(DM.ArqAux2.fieldbyname('descricao').AsString);
      F_RecepR.RichEdit3.Lines.Add(DM.ArqAux2.fieldbyname('qtde').AsString + ' x');
      F_RecepR.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.fieldbyname('valor_calc').AsCurrency));
      DM.ArqAux2.Next;
    end;  }

    RvDataSetConnection1.DataSet := dm.ArqAux;

    If F_Menu.Label39.Caption <> '34377622000155' Then
    Begin
      RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
      RvProject1.SetParam('cnpj_cart', F_Menu.Label39.Caption);
      RvProject1.SetParam('site', 'Site: '+F_Menu.Label50.Caption);
      RvProject1.SetParam('email_cartorio', 'Email:'+ F_Menu.Label55.Caption);
      if F_Menu.Label39.Caption <> '34377622000155' Then
        RvProject1.SetParam('end_cart',   F_Menu.Label11.Caption + ', '+F_Menu.Label7.Caption + ', '+ F_Menu.Label6.Caption)
      else
      RvProject1.SetParam('end_cart',   F_Menu.Label11.Caption + '  Cidade: '+F_Menu.Label7.Caption + ' Estado: '+ F_Menu.Label6.Caption);
      RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
      RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
      RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
      if MkEmail.Text <> '' then
        RvProject1.SetParam('email',  'Email: ' + MkEmail.Text);
      RvProject1.SetParam('Descricao',  F_RecepR.RichEdit1.Text);
      RvProject1.SetParam('Descricao2', F_RecepR.RichEdit2.Text);
      RvProject1.SetParam('Descricao3', F_RecepR.RichEdit3.Text);
      RvProject1.SetParam('Descricao4', F_RecepR.RichEdit4.Text);
      RvProject1.SetParam('telefone',  MaskEdit18.Text);
      RvProject1.SetParam('observacao', Memo1.Text);
      RvProject1.SetParam('atribuicao', atribuicao);
      RvProject1.setParam('daje', 'DAJE Nº '+ DM.ArqAux.fieldbyname('daje').AsString +' SÉRIE Nº '+ DM.ArqAux.fieldbyname('serie_daje').AsString +' EMISSOR Nº '+  iddaje);
      RvProject1.SetParam('email_apresentante',  MkEmail.Text);

      if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then //1 RTD
        RvProject1.SetParam('data_entr', 'Entrega: ' +MaskEdit16.Text);

      RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency));
      RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_tribunal').AsCurrency));
      RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_defensoria').AsCurrency));
      RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency));
      RvProject1.SetParam('nome_exc', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

      RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_tribunal').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_defensoria').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_mutua').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_acoterj').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

      RvProject1.ExecuteReport('report2');  //RECIBO TITULOS
    End
    Else
    Begin
      RvProject3.SetParam('nome_cart', F_Menu.Label29.Caption);
      RvProject3.SetParam('cnpj_cart', F_Menu.Label39.Caption);
      RvProject3.SetParam('end_cart',  F_Menu.Label11.Caption);
      RvProject3.SetParam('fone_cart',  F_Menu.Label12.Caption);
      RvProject3.SetParam('usuario',    F_Menu.Label25.Caption);
      RvProject3.SetParam('doc_usu',    F_Menu.Label38.Caption);
      RvProject3.SetParam('Descricao',  F_RecepR.RichEdit1.Text);
      RvProject3.SetParam('Descricao2', F_RecepR.RichEdit2.Text);
      RvProject3.SetParam('Descricao3', F_RecepR.RichEdit3.Text);
      RvProject3.SetParam('Descricao4', F_RecepR.RichEdit4.Text);
      RvProject3.SetParam('celular',  MaskEdit2.Text);



      RvProject3.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency));
      RvProject3.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_tribunal').AsCurrency));
      RvProject3.SetParam('fund_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_defensoria').AsCurrency));
      RvProject3.SetParam('funp_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency));
      RvProject3.SetParam('nome_exc', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

      RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_tribunal').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_defensoria').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_mutua').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_acoterj').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

      RvProject3.ExecuteReport('report2');  //RECIBO TITULOS

    End;
  end;

  if (DM.Configur.FieldByName('chk_11').AsBoolean) then
  begin
    // RECIBO DE VIAS EXCEDENTES - RESENDE
    if (F_RecepR.MaskEdit26.Text <> '0') then
    begin
      Dm.Calculo.Close;
      Dm.Calculo.Sql.Clear;
      Dm.Calculo.Sql.Add('SELECT data FROM cad_cus');
      Dm.Calculo.Sql.Add('GROUP BY data');
      Dm.Calculo.Sql.Add('ORDER BY data DESC');
      Dm.Calculo.Open;
      if (Dm.Calculo.RecordCount = 0) then
      begin
        Dm.Calculo.Close;
        MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
        Exit;
      end;
      while (not Sair) AND (not Dm.Calculo.Eof) do
      begin
        if (StrToDate(MaskEdit1.Text) >= Dm.Calculo.FieldByName('data').asDateTime) then
        begin
          DtCalc := Dm.Calculo.FieldByName('data').AsString;
          Sair   := True;
        end;
        Dm.Calculo.Next;
      end;

      if (F_RecepR.MaskEdit26.Text <> '0') then
      begin
        { Calculo para a Via Excedente }
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''10''');
        Dm.Calculo.Sql.Add('AND item  = ''4''');
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR A TABELA DE VIAS EXCEDENTES !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        emo_vex := Dm.Calculo.FieldByName('v_emolumentos').asCurrency * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;

        { Conferencia }
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''1''');
        Dm.Calculo.Sql.Add('AND item  = ''5''' );
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        con_vex := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;

        //Busca
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''1''');
        Dm.Calculo.Sql.Add('AND item  = ''1''' );
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        bus_vex := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;

        //Informatica
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''1''');
        Dm.Calculo.Sql.Add('AND item  = ''9''');
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        inf_exc := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;
        gui_exc := dm.TabDemais.FieldByName('guia_informatica').AsCurrency  * StrToInt(MaskEdit26.Text);

        sub_vex := emo_vex + con_vex + bus_vex + inf_exc + gui_exc;

        lei20_vex := truncav((sub_vex * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
        lei05_vex := truncav((sub_vex * dm.tabdemais.FieldByName('defensoria').ascurrency) / 100);
        lei05a_vex:= truncav((sub_vex * dm.tabdemais.FieldByName('procuradoria').ascurrency) / 100);

        tot_vex := sub_vex + lei20_vex + lei05_vex + lei05a_vex;
      end;
    end;

    //Recibo Resende
    RvDataSetConnection1.DataSet := dm.ArqAux;

    RvProject1.SetParam('data', F_menu.Label7.caption + formatdatetime('" ," dd "de" mmmm "de" yyyy', date));
    //RvProject1.ExecuteReport('report1'); // RECIBO PRENOTAÇÃO

    RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
    RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
    RvProject1.SetParam('Descricao',  F_RecepR.RichEdit1.Text);
    RvProject1.SetParam('Descricao2', F_RecepR.RichEdit2.Text);
    RvProject1.SetParam('Descricao3', F_RecepR.RichEdit3.Text);
    RvProject1.SetParam('Descricao4', F_RecepR.RichEdit4.Text);
    RvProject1.SetParam('telefone',  MaskEdit18.Text);
    RvProject1.SetParam('observacao', Memo1.Text);

    emol_tit := DM.ArqAux.fieldbyname('v_subtotal').AsCurrency - sub_vex;
    fetj_tit := DM.ArqAux.fieldbyname('v_tribunal').AsCurrency - lei20_vex;
    fund_tit := DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency - lei05_vex;
    funp_tit := DM.ArqAux.fieldbyname('v_defensoria').AsCurrency - lei05a_vex;
    tota_tit := DM.ArqAux.fieldbyname('v_total').AsCurrency - tot_vex;

    RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', emol_tit));
    RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', fetj_tit));
    RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', fund_tit));
    RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', funp_tit));
    RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', tota_tit));

    //RvProject1.ExecuteReport('report2');  //RECIBO TITULOS


    if (F_RecepR.MaskEdit26.Text <> '0') then
    begin
      RvProject1.SetParam('usuario', F_Menu.Label25.Caption);
      RvProject1.SetParam('doc_usu', F_Menu.Label38.Caption);
      RvProject1.SetParam('Descricao',  F_RecepR.RichEdit5.Text);
      RvProject1.SetParam('Descricao2', F_RecepR.RichEdit6.Text);
      RvProject1.SetParam('Descricao3', F_RecepR.RichEdit7.Text);
      RvProject1.SetParam('Descricao4', F_RecepR.RichEdit8.Text);
      RvProject1.SetParam('telefone',  MaskEdit18.Text);
      RvProject1.SetParam('observacao', Memo1.Text);
      RvProject1.SetParam('emol', FormatCurr('###,###,##0.00', sub_vex));
      RvProject1.SetParam('fetj', FormatCurr('###,###,##0.00', lei20_vex));
      RvProject1.SetParam('fund', FormatCurr('###,###,##0.00', lei05a_vex));
      RvProject1.SetParam('funp', FormatCurr('###,###,##0.00', lei05_vex));
      RvProject1.SetParam('vtot', FormatCurr('###,###,##0.00', tot_vex));
      RvProject1.ExecuteReport('report3');  //RECIBO VIAS EXCEDENTES
    end;
  end;


{  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT p_auxiliar, data_r, a_nome, a_telefone, natureza,');
  Dm.ArqAux.Sql.Add('data_entr, hora_p, deposito, contato, custas,');
  Dm.ArqAux.Sql.Add('v_emolumentos, v_emoladicional, v_pag, v_viaexec,');
  Dm.ArqAux.Sql.Add('v_mic, v_digitalizacao, v_informatica, v_graveletr,');
  Dm.ArqAux.Sql.Add('v_conferencia, v_distrib, v_infodistrib, v_infodistrib,');
  dm.ArqAux.sql.add('v_infodistrib, v_graveletrdistrib, v_nome, v_tribunal,');
  dm.ArqAux.sql.add('v_procuradoria, v_defensoria, v_mutua, v_acoterj, v_subtotal, v_total');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('p_auxiliar = ' + ListBox1.Items.Strings[ListBox1.ItemIndex]);
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    if (F_Menu.Label24.Caption = 'T') then
    begin
      if F_menu.laser.caption = '1' then
      Begin
       ReciboRec(Funcoes, True, Dm.ArqAux.FieldByName('data_r').asString,
                            Dm.ArqAux.FieldByName('p_auxiliar').asString,
                            Dm.ArqAux.FieldByName('a_nome').asString,
                            Dm.ArqAux.FieldByName('a_telefone').asString,
                            Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False),
                            Dm.ArqAux.FieldByName('data_entr').asString,
                            Dm.arqAux.FieldByName('hora_p').asString,
                            Dm.ArqAux.FieldByName('contato').asString,
                            Autentica(Dm.ArqAux.FieldByName('p_auxiliar').asString,
                                      Dm.ArqAux.FieldByName('data_r').asString,
                                      StrAsterisco(Trim(StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True)), 14),
                                      'TDR C', False),
                            Dm.ArqAux.FieldByName('deposito').asCurrency,
                            Dm.ArqAux.FieldByName('custas').asCurrency,
                            Dm.ArqAux.FieldByName('v_emolumentos').asCurrency,
                            Dm.ArqAux.FieldByName('v_emoladicional').asCurrency,
                            Dm.ArqAux.FieldByName('v_pag').asCurrency,
                            Dm.ArqAux.FieldByName('v_viaexec').asCurrency,
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
      end
       else
        Funcoes.ReciboTitulos(Funcoes, True, Dm.ArqAux.FieldByName('data_r').asString,
                            Dm.ArqAux.FieldByName('p_auxiliar').asString,
                            Dm.ArqAux.FieldByName('a_nome').asString,
                            Dm.ArqAux.FieldByName('a_telefone').asString,
                            Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False),
                            Dm.ArqAux.FieldByName('data_entr').asString,
                            Dm.arqAux.FieldByName('hora_p').asString,
                            Dm.ArqAux.FieldByName('contato').asString,
                            Autentica(Dm.ArqAux.FieldByName('p_auxiliar').asString,
                                      Dm.ArqAux.FieldByName('data_r').asString,
                                      StrAsterisco(Trim(StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True)), 14),
                                      'TDR C', False),
                            Dm.ArqAux.FieldByName('deposito').asCurrency,
                            Dm.ArqAux.FieldByName('v_emolumentos').asCurrency,
                            Dm.ArqAux.FieldByName('v_emoladicional').asCurrency,
                            Dm.ArqAux.FieldByName('v_pag').asCurrency,
                            Dm.ArqAux.FieldByName('v_viaexec').asCurrency,
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
    end
    else
    begin
      if F_menu.laser.caption = '1' then
      Begin
       ReciboRec(Funcoes, False, Dm.ArqAux.FieldByName('data_r').asString,
                            Dm.ArqAux.FieldByName('p_auxiliar').asString,
                            Dm.ArqAux.FieldByName('a_nome').asString,
                            Dm.ArqAux.FieldByName('a_telefone').asString,
                            Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False),
                            Dm.ArqAux.FieldByName('data_entr').asString,
                            Dm.arqAux.FieldByName('hora_p').asString,
                            Dm.ArqAux.FieldByName('contato').asString,
                            Autentica(Dm.ArqAux.FieldByName('p_auxiliar').asString,
                                      Dm.ArqAux.FieldByName('data_r').asString,
                                      StrAsterisco(Trim(StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True)), 14),
                                      'TDR C', False),
                            Dm.ArqAux.FieldByName('deposito').asCurrency,
                            Dm.ArqAux.FieldByName('custas').asCurrency,
                            Dm.ArqAux.FieldByName('v_emolumentos').asCurrency,
                            Dm.ArqAux.FieldByName('v_emoladicional').asCurrency,
                            Dm.ArqAux.FieldByName('v_pag').asCurrency,
                            Dm.ArqAux.FieldByName('v_viaexec').asCurrency,
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
      end
       else
       Begin
         Funcoes.ReciboTitulos(Funcoes, False, Dm.ArqAux.FieldByName('data_r').asString,
                            Dm.ArqAux.FieldByName('p_auxiliar').asString,
                            Dm.ArqAux.FieldByName('a_nome').asString,
                            Dm.ArqAux.FieldByName('a_telefone').asString,
                            Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False),
                            Dm.ArqAux.FieldByName('data_entr').asString,
                            Dm.arqAux.FieldByName('hora_p').asString,
                            Dm.ArqAux.FieldByName('contato').asString,
                            Autentica(Dm.ArqAux.FieldByName('p_auxiliar').asString,
                                      Dm.ArqAux.FieldByName('data_r').asString,
                                      StrAsterisco(Trim(StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True)), 14),
                                      'TDR C', False),
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

       end
    end;
  end;
  Dm.ArqAux.Close; }
end;

procedure TF_RecepR.CurrencyEdit3Exit(Sender: TObject);
begin
  if f_dep1 = nil then Application.CreateForm(TF_Dep1, F_Dep1);
  F_dep1.CurrencyEdit1.value := currencyedit2.value;
   //F_Dep1.ShowModal;
  CurrencyEdit4.Value := currencyedit2.value;
  //CurrencyEdit4.Value := F_Dep1.CurrencyEdit1.Value;
  CurrencyEdit5.Value := F_Dep1.CurrencyEdit2.Value;
  CurrencyEdit6.Value := F_Dep1.CurrencyEdit3.Value;
  //CurrencyEdit3.Value := F_Dep1.CurrencyEdit4.Value;
  CurrencyEdit3.Value := currencyedit2.value;
  CurrencyEdit9.Value := F_Dep1.CurrencyEdit5.Value;
  Label35.Caption     := F_Dep1.MaskEdit1.Text;
  if CurrencyEdit3.Value < CurrencyEdit2.Value then
  begin
    Application.MessageBox('Valor do Deposito Inferior ao valor das CUSTAS!', 'Mensagem do sistema', mb_ok);
    CurrencyEdit3Exit(sender);
    exit;
  end;

  If CurrencyEdit3.Value > CurrencyEdit2.Value then CurrencyEdit10.Value := (CurrencyEdit3.Value - CurrencyEdit2.Value); 

  F_Dep1.Destroy;
  F_Dep1 := NIL;
  BitBtn4.Enabled := True;
  BitBtn4.SetFocus;
//  MaskEdit8.SetFocus;
end;

procedure TF_RecepR.ComboBox1Exit(Sender: TObject);
begin
  {
  if trim(MaskEdit27.Text)<>'' then
  else begin
  MaskEdit27.EditMask := '';
  MaskEdit27.Clear;
  end;

  if (Trim(ComboBox1.Text) = 'CPF') then
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') = '') then MaskEdit27.EditMask := '###.###.###-##';
  end;
  if (Trim(ComboBox1.Text) = 'CNPJ') then
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') = '') then MaskEdit27.EditMask := '##.###.###/####-##';
    ComboBox11.Text := '';
    MaskEdit7.Text := '';
  end;
  }        
end;

procedure TF_RecepR.MaskEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox7.SetFocus;
end;

procedure TF_RecepR.MaskEdit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit18.SetFocus;
end;

procedure TF_RecepR.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox10.SetFocus;
end;

procedure TF_RecepR.ComboBox1Enter(Sender: TObject);
begin
  //SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RecepR.MaskEdit27Exit(Sender: TObject);
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
  else
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') <> '') then
    begin
      if (CheckCGC(TirarTudo(MaskEdit27.Text, '.', '/', '-')) <> TirarTudo(MaskEdit27.Text, '.', '/', '-')) then
      begin
        ShowMessage('ATENÇÃO - DOCUMENTO INVÁLIDO !');
      end;
    end;
  end;


  if (TirarTudo(MaskEdit27.Text, '.', '-', '/') <> '') then
  begin
    Dm.BuscaPartes.Close;
    Dm.BuscaPartes.Sql.Clear;
    Dm.BuscaPartes.Sql.Add('select celular, a_nome, a_telefone, contato, a_cpff, email_apresentante, tip_doc, doc ');
    Dm.BuscaPartes.Sql.Add('FROM td');
    Dm.BuscaPartes.Sql.Add('WHERE');
    Dm.BuscaPartes.Sql.Add('doc = ' + Chr(39) + TirarTudo(MaskEdit27.Text, '.', '/', '-') + Chr(39) +' or doc = ' + Chr(39) + (MaskEdit27.Text) + Chr(39) +' order by recno desc ');
    Dm.BuscaPartes.Open;
    Dm.BuscaPartes.First;
    if (Dm.BuscaPartes.RecordCount <> 0) then
    begin

      if MaskEdit18.Text = '' Then
        MaskEdit18.Text := Dm.BuscaPartes.FieldByName('a_telefone').asString;

      if MaskEdit19.Text = '' Then
        MaskEdit19.Text := Dm.BuscaPartes.FieldByName('contato').asString;

      if MaskEdit2.Text = '' Then
        MaskEdit2.Text := Dm.BuscaPartes.FieldByName('celular').asString;


      if MaskEdit12.Text = '' Then
        MaskEdit12.Text := Dm.BuscaPartes.FieldByName('a_cpff').asString;

      if MkEmail.Text = '' Then
        MkEmail.Text    := Dm.BuscaPartes.FieldByName('email_apresentante').asString; 


      Dm.BuscaPartes.Close;
      Dm.BuscaPartes.Sql.Clear;
      Dm.BuscaPartes.Sql.Add('select nome, tip_doc1, doc1, tip_doc2, doc2');
      Dm.BuscaPartes.Sql.Add('FROM td_pesso');
      Dm.BuscaPartes.Sql.Add('WHERE');
      Dm.BuscaPartes.Sql.Add('doc1 = ' + Chr(39) + TirarTudo(MaskEdit27.Text, '.', '/', '-') + Chr(39) +' or doc1 = ' + Chr(39) + (MaskEdit27.Text) + Chr(39) +' order by recno desc ');
      Dm.BuscaPartes.Open;
      Dm.BuscaPartes.First;

      ComboBox11.Text := Dm.BuscaPartes.FieldByName('tip_doc2').asString;

      if MaskEdit7.Text = '' Then
        MaskEdit7.Text := Dm.BuscaPartes.FieldByName('doc2').asString;

    end
    else
    begin
//      MaskEdit17.Text := '';
//      MaskEdit18.Text := '';
//      MaskEdit19.Text := '';
    end;
    Dm.BuscaPartes.Close;
  end;

end;

procedure TF_RecepR.MaskEdit4Exit(Sender: TObject);
var
  util : String;
  pz   : Integer;
begin
  if (not ValidNumero(MaskEdit4.Text)) OR (MaskEdit4.Text = '0') then
  begin
    MaskEdit4.Text := '0';
    Combobox3.SetFocus;
  end
  else
  begin
    dm.Natureza.close;
    dm.Natureza.sql.clear;
    dm.natureza.sql.add('select * from natureza where cod = ' + MaskEdit4.Text);
    dm.Natureza.Open;
    if dm.Natureza.RecordCount <> 0 then
      ComboBox3.Text := Dm.Natureza.FieldByName('natureza').AsString;
      ComboBox3Exit(sender);
    UpdateWindow(Handle);
  end;
  if (StrToInt(MaskEdit4.Text) = 197) OR (StrToInt(MaskEdit4.Text) = 96)OR (StrToInt(MaskEdit4.Text) = 300)  then
  begin
    ComboBox5.Text  := '4.8 - NOTIFICACAO EXTRAJUDICIAL';
    MaskEdit5.text := '1';
    if (StrToInt(MaskEdit4.Text) = 197)OR (StrToInt(MaskEdit4.Text) = 300) then MaskEdit24.Text := '1';
  end;
end;

procedure TF_RecepR.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox10.SetFocus;
end;

procedure TF_RecepR.MaskEdit24Exit(Sender: TObject);
begin
{  MaskEdit24.Text := Trim(MaskEdit24.Text);
  if (not ValidNumero(MaskEdit24.Text)) then MaskEdit24.Text := '0';
  if (MaskEdit24.Text <> '0') then
  begin
    Dm.Local.Close;
    Dm.Local.Sql.Clear;
    Dm.Local.Sql.Add('SELECT valor FROM local');
    Dm.Local.Sql.Add('WHERE');
    Dm.Local.Sql.Add('cod = ' + MaskEdit24.Text);
    Dm.Local.Open;
    if (Dm.Local.RecordCount <> 0) then
    begin
      Label6.Caption := 'R$ ' + Trim(StrCurr(Dm.Local.FieldByName('valor').asCurrency, 14, True));
    end;
    Dm.Local.Close;
  end;
  }
end;

procedure TF_RecepR.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT p_auxiliar, data_r, deposito');
    Dm.ArqAux.Sql.Add('FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + ListBox1.Items.Strings[ListBox1.ItemIndex]);
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount <> 0) then
    begin
      Autentica(Dm.ArqAux.FieldByName('p_auxiliar').asString,
                Dm.ArqAux.FieldByName('data_r').asString,
                StrAsterisco(Trim(StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True)), 14),
                'TD C',
                True);
    end;
    Dm.ArqAux.Close;  
  end;
end;

procedure TF_RecepR.ComboBox5KeyPress(Sender: TObject; var Key: Char);
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

procedure TF_RecepR.ComboBox6KeyPress(Sender: TObject; var Key: Char);
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

procedure TF_RecepR.CurrencyEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_RecepR.CurrencyEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepR.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if MaskEdit5.Text = '' then MaskEdit5.Text := '0';
    if (trim(copy(ComboBox5.Text, 1, 5)) = '1002') or
       (trim(copy(ComboBox5.Text, 1, 5)) = '1003B') or
       (trim(copy(ComboBox5.Text, 1, 5)) = '1003D') then
    begin
      if (DM.Config_Adm.FieldByName('chk_01').AsBoolean) then
      begin
        CalculoGeral(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      end;

      if (DM.Config_Adm.FieldByName('chk_02').AsBoolean) then //Calculo feito para Resende
      begin
        CalculoGeral2(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      end;

      if (DM.Config_Adm.FieldByName('chk_03').AsBoolean) then //Calculo feito para Itatiaia e Demais Cartorios
      begin
        CalculoGeral3(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      end;


//      CalculoGeral(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text);
//      CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      if (F_Menu.Label26.Caption = 'T') then
      begin
        CurrencyEdit3.SetFocus;
      end
      else
      begin
        BitBtn4.Enabled := True;
        BitBtn4.SetFocus;
      end;

    end;
    ComboBox4.SetFocus;
  end;
end;

procedure TF_RecepR.ComboBox10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox5.SetFocus;
{  begin
    if Trim(ComboBox10.Text) = 'Reg.' then ComboBox5.SetFocus;
    if (Trim(ComboBox10.Text) = 'Av.') or (Trim(ComboBox10.Text) = 'Conser.')  then
    begin
      Label33.Visible   := True;
      MaskEdit6.Visible := True;
      MaskEdit6.SetFocus;
    end;
  end;
}  
end;

procedure TF_RecepR.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox5.SetFocus;
end;

procedure TF_RecepR.ComboBox11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_RecepR.ComboBox10Exit(Sender: TObject);
begin
  if trim(ComboBox10.Text) = 'Conser.' then
    MaskEdit6.Text := 'Reg. p/ conservação LRP Art. 127, VII'
  else MaskEdit6.Text := '';
end;

procedure TF_RecepR.ComboBox5Exit(Sender: TObject);
begin
   if (trim(copy(ComboBox5.text, 1, 5)) = '1002') or
      (trim(copy(ComboBox5.text, 1, 5)) = '1003B') or
      (trim(copy(ComboBox5.text, 1, 5)) = '1003D') or
      (trim(copy(ComboBox5.text, 1, 5)) = '1006') or
      (trim(copy(ComboBox5.text, 1, 5)) = '1009') then
    begin
      CurrencyEdit1.Value := 0;
    end;

    DM.qryGenerico.Close;
    DM.qryGenerico.SQL.Clear;
    DM.qryGenerico.Sql.Add('SELECT exibir_prazo_recibo_protocolo FROM tab_ato2 where tabela = :tabela  and item_tab = :item_tab ');
    DM.qryGenerico.Sql.Add('and YEAR(data) = YEAR('+ QuotedStr(ConvData(MaskEdit1.Text))+ ')');
    DM.qryGenerico.ParamByName('tabela').AsString:= Copy(ComboBox5.Text, 1,1);
    DM.qryGenerico.ParamByName('item_tab').AsString:= Copy(ComboBox5.Text, 3,1);
    DM.qryGenerico.Open;

    bNaoExibirDataDeEntregaNoReciboDeProtocolo:= DM.qryGenerico.FieldByName('exibir_prazo_recibo_protocolo').AsBoolean;


   MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), StrToInt(F_Menu.Label42.Caption)));
   if (trim(copy(ComboBox5.text, 1, 5)) = '1006') or
      (trim(copy(ComboBox5.text, 1, 5)) = '1009') then
   begin
     MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), StrToInt(F_Menu.Label43.Caption)));
   end;
end;

procedure TF_RecepR.MaskEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit13.SetFocus;
end;

procedure TF_RecepR.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  Begin
   MkEmail.SetFocus;
  End;
end;

procedure TF_RecepR.CurrencyEdit1Exit(Sender: TObject);
begin
  calc_emol  := 0.00;
  calc_vfetj := 0.00;
  calc_total := 0.00;

  If (Copy(ComboBox6.Text,1,2) = '01') then
  begin
    If ValidData(MaskEdit1.Text) then dat_calc := QuotedStr(ConvData(MaskEdit1.Text))
    Else dat_calc := QuotedStr(ConvData(DateToStr(now)));
    DM.Tab_Atos.RequestLive := False;
    DM.Tab_Atos.Close;
    DM.Tab_Atos.Sql.Clear;
    DM.Tab_Atos.Sql.Add('select * from tab_ato2 where YEAR(data) = YEAR('+dat_calc+') ');
    DM.Tab_Atos.Sql.Add('group by data');
    DM.Tab_Atos.Open;
    DM.Tab_Atos.FindLast;
    dat := DM.Tab_Atos.FieldByname('data').AsString;

    //REGISTRO COM VALOR DECLARADO
    if copy(ComboBox5.Text,1,3) = '4.1' then
    begin
      if CurrencyEdit1.Value = 0 then
      begin
        ShowMessage('FAVOR INFORMAR O VALOR A SER CALCULADO !');
        CurrencyEdit1.SetFocus;
        Exit;
      end;

      DM.Tab_Atos.Close;
      DM.Tab_Atos.Sql.Clear;
      DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE YEAR(data) = YEAR('+QuotedStr(ConvData(dat))+')');
      DM.Tab_Atos.Sql.Add(' AND ate > 0');
      DM.Tab_Atos.Sql.Add(' ORDER BY de, ate');
      DM.Tab_Atos.Open;

      DM.Tab_Atos.Open;
      While (NOT DM.Tab_Atos.Eof) do
      Begin
        If (CurrencyEdit1.Value >= DM.Tab_Atos.FieldByName('de').ASCurrency) AND (CurrencyEdit1.Value <= DM.Tab_Atos.FieldByName('ate').ASCurrency) then
        begin
          calc_emol  := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency;
          calc_vfetj := DM.Tab_Atos.FieldByName('taxa').ASCurrency;
          calc_total := DM.Tab_Atos.FieldByName('total').ASCurrency;
          //CurrencyEdit2.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;    fdgdfgfd
        end;
        DM.Tab_Atos.Next;
      end;
    end
    else
    begin
      DM.Tab_Atos.Close;
      DM.Tab_Atos.Sql.Clear;
      DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
      DM.Tab_Atos.Sql.Add('     YEAR(data) = YEAR('+ QuotedStr(ConvData(dat))+')');
      DM.Tab_Atos.Sql.Add(' AND tabela = ' + QuotedStr(copy(ComboBox5.Text,1,1)));
      DM.Tab_Atos.Sql.Add(' AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)));
      DM.Tab_Atos.Open;

      calc_emol  := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency;
      calc_vfetj := DM.Tab_Atos.FieldByName('taxa').ASCurrency;
      calc_total := DM.Tab_Atos.FieldByName('total').ASCurrency;

      //CurrencyEdit2.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;
    end;
  end;
//  else CurrencyEdit2.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;

  if StrToInt(MaskEdit10.Text) > 0 then
  begin
    DM.Tab_Atos.Close;
    DM.Tab_Atos.Sql.Clear;
    DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
    DM.Tab_Atos.Sql.Add('     YEAR(data) = YEAR('+QuotedStr(ConvData(dat))+')');
    DM.Tab_Atos.Sql.Add(' AND tabela = "4"');
    DM.Tab_Atos.Sql.Add(' AND item_tab = "2"');
    DM.Tab_Atos.Sql.Add(' AND subitem = "B"');
    DM.Tab_Atos.Open;
    //CurrencyEdit2.Value := valorDoDajeConformeTabela - (DM.Tab_Atos.FieldByName('total').ASCurrency * qtdPagina);
    //CurrencyEdit2.Value := CurrencyEdit2.Value + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit10.Text));
  end;

  if PermiteRecepcaoSemDAJE Then
    CurrencyEdit2.Value:= calc_total;

  {if StrToInt(MaskEdit15.Text) > 0 then
  begin
    DM.Tab_Atos.Close;
    DM.Tab_Atos.Sql.Clear;
    DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
    DM.Tab_Atos.Sql.Add('     data = '   + QuotedStr(ConvData(dat)));
    DM.Tab_Atos.Sql.Add(' AND tabela = "4"');
    DM.Tab_Atos.Sql.Add(' AND item_tab = "9"');
    DM.Tab_Atos.Sql.Add(' AND subitem = "A"');
    DM.Tab_Atos.Open;
    CurrencyEdit2.Value := CurrencyEdit2.Value + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit15.Text));
  end;  }

end;

procedure TF_RecepR.CurrencyEdit2Exit(Sender: TObject);
begin
  currencyedit3.value := currencyedit2.value;
end;

procedure TF_RecepR.MaskEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_RecepR.MaskEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit14.SetFocus;
end;

procedure TF_RecepR.CheckBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepR.CheckBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepR.CheckBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepR.CheckBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepR.MaskEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
  Begin
    if MaskEdit13.Enabled Then
      MaskEdit13.SetFocus
    else
    CurrencyEdit1.SetFocus;
  End;
end;

procedure TF_RecepR.MaskEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox6.SetFocus;
end;

procedure TF_RecepR.FormCreate(Sender: TObject);
begin
  Habilitar_Tela(False);
  PageControl1.ActivePage:= TabSheet1;
   
end;

procedure TF_RecepR.MaskEdit10Exit(Sender: TObject);
begin
  If MaskEdit10.Text = '' then MaskEdit10.Text := '0';
end;

procedure TF_RecepR.ComboBox1Change(Sender: TObject);
begin
      If (ComboBox1.ItemIndex = 0) then //CPF
      begin
        MaskEdit27.EditMask := '';
        MaskEdit27.Text     := TirarTudo(MaskEdit27.Text, '-','.','/');
        MaskEdit27.EditMask := '999.999.999-99';
      end
      else
      if (ComboBox1.ItemIndex = 1) then //CNPJ
      begin
        MaskEdit27.EditMask := '';
        MaskEdit27.Text     := TirarTudo(MaskEdit27.Text, '-','.','/');
        MaskEdit27.EditMask := '99.999.999/9999-99';
      end
      else
        MaskEdit27.EditMask := '';
end;

procedure TF_RecepR.MkEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = 13 then MaskEdit19.SetFocus;
end;

procedure TF_RecepR.spbPesquisaClick(Sender: TObject);
begin
  if (MkProtocolo.Text <> '') and (mkDataInicial.Text <> '  /  /    ') and (mkDataFinal.Text <> '  /  /    ') Then
  Begin
    Application.MessageBox('Informe apenas um dos critérios para realizar a pesquisa!', 'Mensagem do Sistema', mb_ok);
    Abort;
  End;

  if (mkDataInicial.Text <> '  /  /    ') and (mkDataFinal.Text <> '  /  /    ') Then
  begin
    if (FormatDateTime('yyyy-mm-dd',  StrToDate(mkDataInicial.Text)) > FormatDateTime('yyyy-mm-dd',  StrToDate(mkDataFinal.Text))) Then
    begin
      Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Mensagem do Sistema', mb_ok);
      Abort;
    end;

    qryPesquisaRecep.Close;
    qryPesquisaRecep.SQL.Clear;
    qryPesquisaRecep.SQL.Add('SELECT td.celular, data_r, data_entr, td.tipo_reg, tabela, divisor, pag_adic, vias_adc, valor_base, custas, deposito, '+
                             'situacao, a_cpff, td_pesso.p_auxiliar, td_pesso.recibo, a_nome, tip_doc1, doc1, tip_doc2, doc2, email_apresentante, '+
                             'a_telefone, contato, a_cpff, ext_nat, natureza, tabela  FROM td left join td_pesso on (td.p_auxiliar = td_pesso.p_auxiliar) '+
                             'Where data_r >= '+QuotedStr( FormatDateTime('yyyy-mm-dd',  StrToDate(mkDataInicial.Text)) )+' and '+
                             'data_r <= '+QuotedStr( FormatDateTime('yyyy-mm-dd',  StrToDate(mkDataFinal.Text)) )+' group by p_auxiliar');

    qryPesquisaRecep.Open;
  end
  else if (MkProtocolo.Text <> '') Then
  begin
    qryPesquisaRecep.Close;
    qryPesquisaRecep.SQL.Clear;
    qryPesquisaRecep.SQL.Add('SELECT td.celular, data_r, data_entr, td.tipo_reg, tabela, divisor, pag_adic, vias_adc, valor_base, custas, deposito,        '+
                             'situacao, a_cpff, td_pesso.p_auxiliar, td_pesso.recibo, a_nome, tip_doc1, doc1, tip_doc2, doc2, email_apresentante,    '+
                             'a_telefone, contato, a_cpff, ext_nat, natureza, tabela  FROM td left join td_pesso on (td.p_auxiliar = td_pesso.p_auxiliar) '+
                             'Where td.p_auxiliar = '+QuotedStr(MkProtocolo.Text)+' group by p_auxiliar');

    qryPesquisaRecep.Open;
  end;

  If qryPesquisaRecep.Active Then
  Begin
    if (qryPesquisaRecep.RecordCount <= 0 ) Then
    Begin
      Application.MessageBox('A pesquisa não retornou registro algum!', 'Mensagem do Sistema', mb_ok);
      Abort;
    End;
  End;
end;

procedure TF_RecepR.MkProtocolo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then spbPesquisa.Click;                                
end;

procedure TF_RecepR.DBGrid1DblClick(Sender: TObject);
begin
  btImprimir.Enabled:= True;

  if (Not(qryPesquisaRecep.IsEmpty)) Then
  Begin
    MaskEdit1.Text  := qryPesquisaRecep.FieldByName('data_r').asString;
    MaskEdit16.Text := qryPesquisaRecep.FieldByName('data_entr').asString;
    Label3.Caption  := qryPesquisaRecep.FieldByName('p_auxiliar').asString;
    MaskEdit8.Text  := qryPesquisaRecep.FieldByName('recibo').asString;

    ComboBox1.Text  := qryPesquisaRecep.FieldByName('tip_doc1').asString;
    if qryPesquisaRecep.FieldByName('tip_doc1').asString = 'CPF' Then
    Begin
      MaskEdit27.EditMask:= '';
      MaskEdit27.Text    := TirarTudo(qryPesquisaRecep.FieldByName('doc1').asString, '.', '/', '-');
      MaskEdit27.EditMask:= '999.999.999-99';
    End
    Else
    if qryPesquisaRecep.FieldByName('tip_doc1').asString = 'CNPJ' Then
    Begin
      MaskEdit27.EditMask:= '';
      MaskEdit27.Text    := TirarTudo(qryPesquisaRecep.FieldByName('doc1').asString, '.', '/', '-');
      MaskEdit27.EditMask:= '99.999.999/9999-99';
    End;

    ComboBox11.Text := qryPesquisaRecep.FieldByName('tip_doc2').asString;
    MaskEdit7.Text  := qryPesquisaRecep.FieldByName('doc2').asString;


    MaskEdit17.Text := qryPesquisaRecep.FieldByName('a_nome').asString;
    ComboBox7.Text  := Ver_Situacao(qryPesquisaRecep.FieldByName('situacao').asString, True);
    MaskEdit12.Text := qryPesquisaRecep.FieldByName('a_cpff').asString;
    MkEmail.Text    := qryPesquisaRecep.FieldByName('email_apresentante').AsString;
    MaskEdit19.Text := qryPesquisaRecep.FieldByName('contato').asstring;
    MaskEdit18.Text := qryPesquisaRecep.FieldByName('a_telefone').asstring;
    MaskEdit2.Text := qryPesquisaRecep.FieldByName('celular').asstring;
    ComboBox3.Text  := qryPesquisaRecep.FieldByName('ext_nat').asString;
    MaskEdit4.Text  := qryPesquisaRecep.FieldByName('natureza').AsString;
    ComboBox10.Text := qryPesquisaRecep.FieldByName('tipo_reg').AsString;
    ComboBox5.Text  := Def_Tab(qryPesquisaRecep.FieldByName('tabela').asstring, True);
    ComboBox6.Text  := Def_Div(qryPesquisaRecep.FieldByName('divisor').asstring, True);
    MaskEdit10.Text := qryPesquisaRecep.FieldByName('pag_adic').AsString;
    MaskEdit15.Text := qryPesquisaRecep.FieldByName('vias_adc').AsString;
    CurrencyEdit1.Value := qryPesquisaRecep.FieldByName('valor_base').AsCurrency;
    CurrencyEdit2.Value := qryPesquisaRecep.FieldByName('custas').AsCurrency;
    CurrencyEdit3.Value := qryPesquisaRecep.FieldByName('deposito').AsCurrency;
    if (MessageBox(Handle, PChar('Deseja imprimir o recibo deste protocolo ?'), 'Titulos e Documentos', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      btImprimir.Click;

    PageControl1.ActivePage:= TabSheet1;
    Habilitar_Tela(True);
    BitBtn4.Enabled:= False;
  End
end;

procedure TF_RecepR.mkDataInicialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then mkDataFinal.SetFocus;
end;

procedure TF_RecepR.mkDataFinalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then spbPesquisa.Click;
end;

procedure TF_RecepR.TabSheet2Show(Sender: TObject);
begin
  MkProtocolo.SetFocus
end;

procedure TF_RecepR.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_RecepR.MkProtocoloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then spbPesquisa.Click;
end;

end.
