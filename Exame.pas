UNIT Exame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, Menus, Grids, DBGrids,
  ToolEdit, CurrEdit, jpeg, DB, DBTables, Status, ComCtrls,Duplicp;

type
  TF_Exame = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    MaskEdit7: TMaskEdit;
    PopupMenu1: TPopupMenu;
    Incluir1: TMenuItem;
    Corrigir2: TMenuItem;
    Excluir1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Alterar1: TMenuItem;
    Panel2: TPanel;
    Label30: TLabel;
    Label33: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    BitBtn4: TBitBtn;
    SpeedButton4: TSpeedButton;
    MaskEdit24: TMaskEdit;
    Label38: TLabel;
    Label41: TLabel;
    MaskEdit26: TMaskEdit;
    Label43: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    ComboBox3: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    PopupMenu3: TPopupMenu;
    PesquisarCEP1: TMenuItem;
    Label11: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    Label14: TLabel;
    CurrencyEdit5: TCurrencyEdit;
    Label17: TLabel;
    ComboBox8: TComboBox;
    Label19: TLabel;
    ComboBox4: TComboBox;
    Label34: TLabel;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    SpeedButton5: TSpeedButton;
    Label35: TLabel;
    Label40: TLabel;
    Panel5: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    MaskEdit16: TMaskEdit;
    MaskEdit23: TMaskEdit;
    MaskEdit29: TMaskEdit;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit9: TCurrencyEdit;
    CurrencyEdit10: TCurrencyEdit;
    CurrencyEdit12: TCurrencyEdit;
    CurrencyEdit13: TCurrencyEdit;
    CurrencyEdit15: TCurrencyEdit;
    CurrencyEdit16: TCurrencyEdit;
    CurrencyEdit17: TCurrencyEdit;
    CurrencyEdit18: TCurrencyEdit;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    Label42: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    MaskEdit9: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    CurrencyEdit11: TCurrencyEdit;
    MaskEdit14: TMaskEdit;
    CurrencyEdit14: TCurrencyEdit;
    Label68: TLabel;
    MaskEdit30: TMaskEdit;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    PopupMenu4: TPopupMenu;
    Inclluir1: TMenuItem;
    Corrigir1: TMenuItem;
    Excluir2: TMenuItem;
    MaskEdit31: TMaskEdit;
    CurrencyEdit19: TCurrencyEdit;
    Label8: TLabel;
    MaskEdit8: TMaskEdit;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    SpeedButton9: TSpeedButton;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    MaskEdit35: TMaskEdit;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    ComboBox10: TComboBox;
    Label80: TLabel;
    MaskEdit38: TMaskEdit;
    CheckBox5: TCheckBox;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    BitBtn8: TBitBtn;
    ComboBox11: TComboBox;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    SpeedButton12: TSpeedButton;
    Label31: TLabel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    EdAverbacao: TMaskEdit;
    Label87: TLabel;
    GroupBox6: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox4: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    Label88: TLabel;
    Label69: TLabel;
    MaskEdit33: TMaskEdit;
    MaskEdit39: TMaskEdit;
    Label89: TLabel;
    Label70: TLabel;
    MaskEdit34: TMaskEdit;
    MaskEdit40: TMaskEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label39: TLabel;
    Label26: TLabel;
    Label32: TLabel;
    Label76: TLabel;
    Label16: TLabel;
    Label74: TLabel;
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
    MaskEdit3: TMaskEdit;
    ComboBox9: TComboBox;
    MaskEdit36: TMaskEdit;
    MaskEdit37: TMaskEdit;
    ComboBox12: TComboBox;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn11: TBitBtn;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn13: TBitBtn;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel4: TPanel;
    Label13: TLabel;
    Label18: TLabel;
    Label44: TLabel;
    Label4: TLabel;
    Label37: TLabel;
    Label67: TLabel;
    Label86: TLabel;
    Label75: TLabel;
    Label15: TLabel;
    MaskEdit10: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MkEmail: TMaskEdit;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    MaskEdit41: TMaskEdit;
    MaskEdit42: TMaskEdit;
    qryDajesAdicionais: TQuery;
    qryDajesAdicionaisnumero_daje: TIntegerField;
    qryDajesAdicionaisserie_daje: TStringField;
    qryDajesAdicionaisemol_daje: TFloatField;
    qryDajesAdicionaistx_fisca_daje: TFloatField;
    qryDajesAdicionaisfecom_daje: TFloatField;
    qryDajesAdicionaisdef_pub_daje: TFloatField;
    qryDajesAdicionaisvr_daje: TFloatField;
    qryDajesAdicionaisvr_declarado: TFloatField;
    Dts_DajesAdicionais: TDataSource;
    DBGrid4: TDBGrid;
    BitBtn9: TBitBtn;
    BitBtn14: TBitBtn;
    qryDajesAdicionaisid: TIntegerField;
    qryDajesAdicionaisnumero_selo: TStringField;
    qryDajesAdicionaiscod_validacao: TStringField;
    Label91: TLabel;
    MaskEdit43: TMaskEdit;
    Label101: TLabel;
    PanViasAdicionais: TPanel;
    Panel9: TPanel;
    MkNumeroDaje: TMaskEdit;
    MkSerieDaje: TMaskEdit;
    Label92: TLabel;
    Label93: TLabel;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    Label94: TLabel;
    Label95: TLabel;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    MaskEdit44: TMaskEdit;
    Label96: TLabel;
    MaskEdit45: TMaskEdit;
    Label97: TLabel;
    Memo1: TMemo;
    Label98: TLabel;
    SpeedButton21: TSpeedButton;
    CheckBox10: TCheckBox;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    Label99: TLabel;
    cbTipoEndereco: TComboBox;
    CheckBox11: TCheckBox;
    MaskEdit32: TMemo;
    duplic: TButton;
    CheckBox12: TCheckBox;
    BitBtn21: TBitBtn;
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
    procedure MaskEdit21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Alterar1Click(Sender: TObject);
    procedure MaskEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MaskEdit8Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MaskEdit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit24Exit(Sender: TObject);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
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
    procedure MaskEdit27Exit(Sender: TObject);
    procedure MaskEdit28Exit(Sender: TObject);
    procedure MaskEdit17Exit(Sender: TObject);
    procedure MaskEdit22Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure ComboBox7Exit(Sender: TObject);
    procedure ComboBox7KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit36KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PesquisarCEP1Click(Sender: TObject);
    procedure CurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit18Exit(Sender: TObject);
    procedure CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Inclluir1Click(Sender: TObject);
    procedure Corrigir1Click(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Excluir2Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure CurrencyEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit14Exit(Sender: TObject);
    procedure MaskEdit16Exit(Sender: TObject);
    procedure MaskEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit23Exit(Sender: TObject);
    procedure MaskEdit23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit32KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure MaskEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit34KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit33KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit35KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit37KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure ComboBox10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure MaskEdit33KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit34KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton12Click(Sender: TObject);
    procedure MkEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure EdAverbacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit39KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit40KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit38KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure MaskEdit42KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn13Click(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure MaskEdit43Exit(Sender: TObject);
    procedure MaskEdit43KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label101Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure MkSerieDajeKeyPress(Sender: TObject; var Key: Char);
    procedure MkNumeroDajeKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure MaskEdit44KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit45KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label98Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure cbTipoEnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure duplicClick(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);

  private
    procedure carregaTipoEndereco;
    { Private declarations }
  public
    { Public declarations }
    v_sql : String;
    qry : TQuery;
    function VerificaStatusDoTitulo(value: String): String;
    function VerificaSeTituloLiberado(value: String): String;
    procedure AtualizarCampoLiberado_da_TD( value,nr_protoc : String );
    procedure CarregaDadosEnderecoDasPartes(sCpf: String);
    procedure GerarNumeroDoLivro;
    procedure AlteraAsPartesEmTdCertidao;
    procedure SalvaAsPartesEmTdCertidao;
    procedure SalvaAsPartesEmTdPesso;
    procedure MostraDajesAdicionais(Codigo: String);
    procedure ValidaECalculaTabelas;
    procedure ChamaTelaDeBusca;
    procedure CarregarPartesDaGrid;
    procedure CarregaVariaveisLOGS(Tipo: String);
  end;

var
  F_Exame: TF_Exame;
  tipo_   : String;
  val_loc : Currency;
  tipo_reg : String;
  PermitirEdicaoDasPartes: Boolean;
  _iddaje_tj, _serie_daje, _numero_daje: String;

  mudouNatureza,
  mudouStatus,
  mudouComboNatureza,
  mudouTabela,
  mudouDivisor,
  mudouQtdPag,
  mudouQtdVias,
  mudouTipoRegA,
  mudouLivroProtoc,
  mudouFolhaProtoc,
  mudouLivroRegist,
  mudouFolhaRegist,
  mudouDoi,
  mudouValorBase,
  mudouValorCustas,
  mudouAverbadoAoRegistro,
  mudouSeqAverbacao,


  mudouParte,
  mudouApresentante,
  mudouTelefone,
  mudouObservacao,
  mudouEmail,
  mudouPasta,
  mudouDataDoc,


  mudouTipoCPF,
  mudouDocCPF,
  mudouTipoRG,
  mudouDocRG,
  mudouNomeParte,
  mudouSituacao,
  mudouCEP,
  mudouEndereco,
  mudouNumero,
  mudouComplem,
  mudouBairro,
  mudouCidade,
  mudouEstado,
  mudouEstadoCivil,
  mudouProfissao,
  mudouNacionalidade,
  mudouInstrumento: String;


  mudouQtde_nome,
  mudouV_nome,
  mudouPag_adic,
  mudouV_pag,
  mudouV_tribunal,
  mudouV_defensoria,
  mudouV_procuradoria,
  mudouV_mutua,
  mudouV_acoterj,
  mudouV_distrib,
  mudouV_subtotal,
  mudouV_total,

  mudouvalor_base,
  mudouvias_adc,
  mudouqtdpost,
  mudouext_nat,
  mudoulivro,
  mudoufolha,
  mudousequencia_averbacao,
  mudouv_emolumentos,
  mudoucustas,
  mudoutipo_reg,
  mudouenviar_doi,
  mudouaverba,

  mudouLva,
  mudouLvb,
  mudouLvc,
  mudouLvd,

  mudoulva_reg,
  mudoulvb_reg,
  mudoulvc_reg,
  mudoulvd_reg: String;

  sCodNatureza,
  sNomeNatureza:String;

implementation

uses DMTD, Func, Menu, Baixa1, RRec, Anot, Info, Prot, Loc,
  InfComp, Tel_Avi, PesqCep, End2, FuncGeral, ProcGeral, USelos, New_CalcT,
  Anotacao, Lavratura, U_Daje, EXIGENC2, U_CadImoveis, Etiquetas, RETQ,
  DajeVias, U_EmissDAJE, RecepR, U_GridBuscaPartes, ItemPenhor,
  U_RegistroAnimal, DigDup2, U_CadLivroE;

{$R *.DFM}

Procedure Abre_CadTab;
begin
  Dm.Cad_Tab2.Close;
  Dm.Cad_Tab2.Sql.Clear;
  Dm.Cad_Tab2.Sql.Add('SELECT * FROM cad_tab order by tabela, item');
  Dm.Cad_Tab2.Open;
  Dm.Cad_Tab2.FindFirst;
end;

Procedure Carrega_CadTab;
begin
  With F_Exame do
  begin
    MaskEdit9.Text       := Dm.Cad_Tab2.fieldbyname('tabela').AsString;
    MaskEdit11.Text      := Dm.Cad_Tab2.fieldbyname('item').AsString;
    MaskEdit12.Text      := Dm.Cad_Tab2.fieldbyname('subitem').AsString;
    MaskEdit13.Text      := Dm.Cad_Tab2.fieldbyname('descricao').AsString;
    CurrencyEdit11.Value := Dm.Cad_Tab2.fieldbyname('valor').AsCurrency;
    CurrencyEdit14.Value := Dm.Cad_Tab2.fieldbyname('valor').AsCurrency;
  end;
end;

Procedure TF_Exame.Limpa_TelaPessoal(Sender : TOBject);
begin
  MaskEdit17.Text     := '';
  MaskEdit27.Text     := '';
  MaskEdit28.Text     := '';
  MaskEdit22.Text     := '';
  cbTipoEndereco.Text := '';
  MaskEdit18.Text     := '';
  MaskEdit3.Text      := '';
  MaskEdit19.Text     := '';
  MaskEdit20.Text     := '';
  MaskEdit21.Text     := '';
  MaskEdit25.Text     := '';
  ComboBox1.Text      := '';
  ComboBox7.Text      := '';
  ComboBox9.Text      := '';
  MaskEdit36.Text     := '';
  MaskEdit37.Text     := '';

  mudouTipoCPF        := '';
  mudouDocCPF         := '';
  mudouTipoRG         := '';
  mudouDocRG          := '';
  mudouNomeParte      := '';
  mudouSituacao       := '';
  mudouCEP            := '';
  mudouEndereco       := '';
  mudouNumero         := '';
  mudouComplem        := '';
  mudouBairro         := '';
  mudouCidade         := '';
  mudouEstado         := '';
  mudouEstadoCivil    := '';
  mudouProfissao      := '';
  mudouNacionalidade  := '';
  mudouInstrumento    := '';
end;

Procedure Carrega_Pedid;
begin
  DM.TD_Pedid.Close;
  DM.TD_Pedid.Sql.Clear;
  DM.TD_Pedid.Sql.Add('SELECT * FROM td_pedid');
  DM.TD_Pedid.Sql.Add('WHERE');
  DM.TD_Pedid.Sql.Add('p_auxiliar = ' + Trim(F_Exame.MaskEdit1.Text));
  DM.TD_Pedid.Open;
  DM.TD_Pedid.FindFirst;

  with (F_Exame) do
  begin
    MaskEdit30.Text := DM.TD_Pedid.fieldbyname('cod_lae').AsString;
    MaskEdit9.Text  := DM.TD_Pedid.fieldbyname('tabela').AsString;
    MaskEdit11.Text := DM.TD_Pedid.fieldbyname('item').AsString;
    MaskEdit12.Text := DM.TD_Pedid.fieldbyname('subitem').AsString;
    MaskEdit13.Text := DM.TD_Pedid.fieldbyname('descricao').AsString;
    MaskEdit14.Text := DM.TD_Pedid.fieldbyname('qtde').AsString;
    CurrencyEdit11.Value := DM.TD_Pedid.fieldbyname('valor_unit').AsCurrency;
    CurrencyEdit14.Value := DM.TD_Pedid.fieldbyname('valor_calc').AsCurrency;
  end;
end;

Procedure Carrega_Pedid2;
begin
  with (F_exame) do
  begin
    MaskEdit30.Text := DM.TD_Pedid.fieldbyname('cod_lae').AsString;
    MaskEdit9.Text  := DM.TD_Pedid.fieldbyname('tabela').AsString;
    MaskEdit11.Text := DM.TD_Pedid.fieldbyname('item').AsString;
    MaskEdit12.Text := DM.TD_Pedid.fieldbyname('subitem').AsString;
    MaskEdit13.Text := DM.TD_Pedid.fieldbyname('descricao').AsString;
    MaskEdit14.Text := DM.TD_Pedid.fieldbyname('qtde').AsString;
    CurrencyEdit11.Value := DM.TD_Pedid.fieldbyname('valor_unit').AsCurrency;
    CurrencyEdit14.Value := DM.TD_Pedid.fieldbyname('valor_calc').AsCurrency;
  end;
end;

Procedure TF_Exame.Carrega_Pessoal(Sender : TObject; Pesquisa : Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('SELECT * FROM td_pesso left join cad_sit on (td_pesso.situacao = cad_sit.codigo)');
    Dm.PessAux.Sql.Add('WHERE');
    Dm.PessAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    Dm.PessAux.Open;
    Dm.PessAux.FindLast;

    MaskEdit17.Text := Dm.PessAux.FieldByName('nome').asString;
    ComboBox1.Text  := Dm.PessAux.FieldByName('tip_doc1').asString;
    MaskEdit27.EditMask := '';
    MaskEdit27.Text := Dm.PessAux.FieldByName('doc1').asString;
    if (ComboBox1.Text = 'CPF') then
      MaskEdit27.EditMask := '###.###.###-##'
    else
    MaskEdit27.EditMask := '##.###.###/####-##';
    ComboBox2.Text  := Dm.PessAux.FieldByName('tip_doc2').asString;
    MaskEdit28.Text := Dm.PessAux.FieldByName('doc2').asString;
    MaskEdit18.Text := Dm.PessAux.FieldByName('endereco').asString;
    cbTipoEndereco.Text := Dm.PessAux.FieldByName('tipoEndereco').asString;
    MaskEdit3.Text  := Dm.PessAux.FieldByName('numero').asString;
    MaskEdit19.Text := Dm.PessAux.FieldByName('bairro').asString;
    MaskEdit20.Text := Dm.PessAux.FieldByName('cidade').asString;
    MaskEdit21.Text := Dm.PessAux.FieldByName('estado').asString;
    MaskEdit36.Text := Dm.PessAux.FieldByName('profissao').asString;
    MaskEdit37.Text := Dm.PessAux.FieldByName('nacionalidade').asString;
    ComboBox9.Text  := Dm.PessAux.FieldByName('estcivil').asString;
    MaskEdit22.EditMask := '';
    MaskEdit22.Text := Dm.PessAux.FieldByName('cep').asString;
    MaskEdit22.EditMask := '#####-###';
    ComboBox7.Text  := Ver_Situacao(Dm.PessAux.FieldByName('situacao').asString, True);
    MaskEdit25.Text := Dm.PessAux.FieldByName('complem').asString;

    If Dm.PessAux.FieldByName('model').asString = 'S' then ///// FLAG PRA DEFINIR SE VAI OU NAO PARA O SINTER -- JOSE
      CheckBox11.Checked := True
    Else CheckBox11.Checked := False;

    maskedit22.enabled := true;
    cbTipoEndereco.Enabled := true;
    maskedit18.enabled := true;
    maskedit19.enabled := true;
    maskedit20.enabled := true;
    maskedit21.enabled := true;
    maskedit25.enabled := true;
    MaskEdit3.Visible  := True;
    maskedit22.visible := true;
    cbTipoEndereco.Visible := true;
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
  End;

end;

Procedure TF_Exame.Limpar(Sender : TObject);
begin
  Dm.PessAux.Close;
  ComboBox1.Text  := '';
  MaskEdit27.Text := '';
  MaskEdit1.Enabled := True;
  maskedit7.text := '';
  maskedit8.text := '';
  maskedit35.text := '';
  maskedit10.text := '';
  MaskEdit4.Text  := '';
  maskedit15.text := '';
  MaskEdit45.Text := '';
  maskedit13.text := '';
  cbTipoEndereco.Text := '';
  maskedit18.text := '';
  MaskEdit3.Text  := '';
  maskedit19.text := '';
  maskedit20.text := '';
  maskedit21.text := '';
  maskedit22.text := '';
  ComboBox7.Text  := '';
  maskedit24.text := '';
  maskedit26.text := '';
  maskedit33.text := '';
  maskedit34.text := '';
  MaskEdit44.Text := '';
  MaskEdit41.Text := '';
  CurrencyEdit1.Value := 0.00;
  CurrencyEdit2.Value := 0.00;
  Label33.Visible := False;
  Label33.caption := '0';
  Label29.Visible := False;
  Label35.Visible := False;
  Label40.Visible := False;
  Label29.Caption := '0';
  Label40.Caption := '0';

  Label94.Visible := False;
  Label95.Visible := False;
  Label95.Caption := '0';



  Label43.Visible := False;
  CheckBox8.Checked:= True;
  Label43.Caption := '';
  MaskEdit42.Text:= '';
  MaskEdit43.Text := '';

//********APRESENTANTE*************/

  mudouNatureza := '';
  mudouComboNatureza := '';
  mudouTabela:= '';
  mudouDivisor:= '';
  mudouQtdPag:= '';
  mudouQtdVias:= '';
  mudouTipoRegA:= '';
  mudouLivroProtoc:= '';
  mudouFolhaProtoc:= '';
  mudouLivroRegist:= '';
  mudouFolhaRegist:= '';
  mudouDoi:= '';
  mudouValorBase:= '';
  mudouValorCustas:= '';
  mudouAverbadoAoRegistro:= '';
  mudouSeqAverbacao:= '';


//********APRESENTANTE*************/

  mudouParte:= '';
  mudouApresentante:= '';
  mudouTelefone:= '';
  mudouObservacao:= '';
  mudouEmail:= '';
  mudouPasta:= '';
  mudouDataDoc:= '';

//********PARTES*******************/

  mudouTipoCPF:= '';
  mudouDocCPF:= '';
  mudouTipoRG:= '';
  mudouDocRG:= '';
  mudouNomeParte:= '';
  mudouSituacao:= '';
  mudouCEP:= '';
  mudouEndereco:= '';
  mudouNumero:= '';
  mudouComplem:= '';
  mudouBairro:= '';
  mudouCidade:= '';
  mudouEstado:= '';
  mudouEstadoCivil:= '';
  mudouProfissao:= '';
  mudouNacionalidade:= '';
  mudouInstrumento:= '';


  if (Not(ModalidadeAverbacaoCapital)) Then
  Begin
    Label77.Visible := False;
    Label78.Visible := False;
  End;
  Label78.Caption := '';
  MkEmail.Text:= '';
end;

procedure TF_Exame.Carrega(Sender : TObject; Pesquisa : Boolean);
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

  Label37.Visible     := True;
  Label37.caption     := Dm.Td.FieldByName('data_r').asstring;
  ComboBox3.Text      := Ver_Natureza(Dm.Td.FieldByName('natureza').asstring, True);
  MaskEdit6.Text      := Dm.Td.FieldByName('natureza').asstring;
  ComboBox5.Text      := Def_Tab(Dm.Td.FieldByName('tabela').asstring, True);
  ComboBox6.Text      := Def_Div(Dm.Td.FieldByName('divisor').asstring, True);
  ComboBox8.Text      := Def_Portal(Dm.Td.FieldByName('portal').AsInteger);
  ComboBox10.Text     := Dm.Td.FieldByName('tipo_reg').AsString;           
  maskedit8.text      := Dm.Td.FieldByName('pag_adic').asstring;
  maskedit35.text     := Dm.Td.FieldByName('vias_adc').asstring;
  maskedit38.text     := Dm.Td.FieldByName('qtdpost').asstring;
  tipo_               := Dm.Td.FieldByName('tipo').asstring;
  tipo_reg            := Dm.Td.FieldByName('tipo_reg').asstring;
  maskedit10.text     := Dm.Td.FieldByName('a_nome').asstring;
  MaskEdit42.Text     := Dm.Td.FieldByName('data_documento').asstring;
  MaskEdit41.Text     := Dm.Td.FieldByName('a_pasta').asstring;
  maskedit4.text      := Dm.Td.FieldByName('contato').asstring;
  maskedit15.text     := Dm.Td.FieldByName('a_telefone').asstring;
  MaskEdit45.Text     := Dm.Td.FieldByName('celular').asstring;
  maskedit32.Text     := Dm.Td.FieldByName('obs_prov1').asstring;  //OBS
  CurrencyEdit1.Value := Dm.Td.FieldByName('valor_base').ascurrency;
  CurrencyEdit2.Value := Dm.Td.FieldByName('custas').ascurrency;
  Label29.Visible     := True;
  Label29.Caption     := Dm.Td.FieldByName('registro').asString;
  ComboBox11.Text     := Dm.Td.FieldByName('enviar_doi').asString;
  MkEmail.Text        := Dm.Td.FieldByName('email_apresentante').asstring;
  MaskEdit43.Text     := Dm.Td.FieldByName('sequencia_averbacao').asstring;

  if (Dm.Td.FieldByName('sequencia_averbacao').asstring <> '') and (ModalidadeAverbacaoCapital) Then
  begin
    Label94.Visible := True;
    Label95.Visible := True;
    Label95.Caption := Dm.Td.FieldByName('sequencia_averbacao').asstring;
  end;      

  if (Dm.Td.FieldByName('sequencia_averbacao').asstring <> '') and (ModalidadeAverbacaoCapital) Then
  begin
    Label94.Visible := True;
    Label95.Visible := True;
    if (F_Menu.Label39.Caption = '27271464/000199') or (F_Menu.Label39.Caption = '27.271.464/0001-99') Then
    begin
      if Dm.Td.FieldByName('rolo').asstring <> '' Then
      begin
        Label94.Visible:= False;
        Label95.Visible:= False;
      end
      else
      Begin
        Label94.Visible:= False;
        Label95.Visible:= False;
      End;
    end
    else
    Label95.Caption := Dm.Td.FieldByName('sequencia_averbacao').asstring;  
  End;

  //Averbacao
  if (Dm.Td.FieldByName('averba').asString <> '') and {or} (Dm.Td.FieldByName('averba').asString <> '0') then
  begin
    //if (Not(ModalidadeAverbacaoCapital)) Then
    if True then //(F_Menu.Label56.Caption = 'T') then
    Begin
      Label77.Visible     := True;
      Label78.Visible     := True;
      Label78.Caption     := '';
      Label78.Caption     := Dm.Td.FieldByName('averba').asString;
    End;
    EdAverbacao.Text     := Dm.Td.FieldByName('averba').asString;
  end
  else
  begin
    if (Not(ModalidadeAverbacaoCapital)) Then
    Begin
      Label77.Visible     := False;
      Label78.Visible     := False;
      Label78.Caption     := '';
    End;
    //**//
    EdAverbacao.Text    := '';
  end;

  If Dm.Td.FieldByName('h').asString = 'A' then Label29.Caption := Label29.Caption + '' + Dm.Td.FieldByName('h').asString;
  Label40.Visible     := True;
  Label35.Visible     := True; 
  Label40.Caption     := Dm.Td.FieldByName('recibo').asString;
  ComboBox4.Text      := dm.TD.FieldByName('doi').AsString;
  MaskEdit5.Text      := dm.td.FieldByName('qtde_diligencia').AsString;
  Label43.Visible     := True;
  Label43.Caption     := Dm.Td.FieldByName('status').asString;
  Label31.Caption     := Dm.Td.FieldByName('rl').asString;
  MaskEdit16.Text      := IntToStr(Dm.Td.FieldByName('qtde_nome').AsInteger);
  CurrencyEdit15.Value := Dm.Td.FieldByName('v_nome').AsCurrency;
  MaskEdit23.Text      := IntToStr(Dm.Td.FieldByName('pag_adic').AsInteger);
  CurrencyEdit16.Value := Dm.Td.FieldByName('v_pag').AsCurrency;
  CurrencyEdit6.Value  := DM.TD.FieldByName('v_subtotal').AsCurrency;
  CurrencyEdit7.Value  := DM.TD.FieldByName('v_tribunal').AsCurrency;
  CurrencyEdit8.Value  := DM.TD.FieldByName('v_defensoria').AsCurrency;
  CurrencyEdit9.Value  := DM.TD.FieldByName('v_procuradoria').AsCurrency;
  CurrencyEdit10.Value := DM.TD.FieldByName('v_mutua').AsCurrency;
  CurrencyEdit12.Value := DM.TD.FieldByName('v_acoterj').AsCurrency;
  CurrencyEdit18.Value := DM.TD.FieldByName('v_distrib').AsCurrency;
  CurrencyEdit13.Value := DM.TD.FieldByName('v_total').AsCurrency;

  Dm.qryGenerico.Close;
  Dm.qryGenerico.SQL.Clear;
  Dm.qryGenerico.SQL.Add('select * from daje where serie_daje = '+QuotedStr(strzero(Dm.TD.FieldByName('serie_daje').AsString, 3))+' and numero_daje = '+QuotedStr(Dm.TD.FieldByName('daje').AsString)+'');
  Dm.qryGenerico.Open;

  {if Dm.TD.FieldByName('livro').AsString = '' then
    MaskEdit33.Text := '0'
  else
  MaskEdit33.Text := Dm.TD.FieldByName('livro').AsString;


  if Dm.TD.FieldByName('folha').AsString = '' then
    MaskEdit34.Text := '0'
  else
  MaskEdit34.Text := Dm.TD.FieldByName('folha').AsString;}


  if Dm.TD.FieldByName('daje').AsString = '' then
    Label72.Caption := ''
  else
  Label72.Caption := Dm.TD.FieldByName('serie_daje').AsString +'  ' + Strzero(Dm.TD.FieldByName('daje').AsString, 6) + '  '+Dm.qryGenerico.FieldByName('status').AsString;

  _iddaje_tj  := Dm.qryGenerico.FieldByName('iddaje_tj').AsString;
  _serie_daje := Dm.qryGenerico.FieldByName('serie_daje').AsString;
  _numero_daje:= Dm.qryGenerico.FieldByName('numero_daje').AsString;

  Label83.Caption:= Dm.TD.FieldByName('selo').AsString;
  Label85.Caption:= Dm.TD.FieldByName('selo_validador').AsString;

  CheckBox10.Checked := False;
  if Dm.TD.FieldByName('checkduvida').AsString = 'X' then
    CheckBox10.Checked := True;

  CheckBox1.Checked := False;
  if Dm.TD.FieldByName('lva').AsString = 'X' then
    CheckBox1.Checked := True;

  CheckBox2.Checked := False;
  if Dm.TD.FieldByName('lvb').AsString = 'X' then
    CheckBox2.Checked := True;

  CheckBox3.Checked := False;
  if Dm.TD.FieldByName('lvc').AsString = 'X' then
    CheckBox3.Checked := True;

  CheckBox4.Checked := False;
  if Dm.TD.FieldByName('lvd').AsString = 'X' then
    CheckBox4.Checked := True;

  if (not CheckBox4.Checked) and (not CheckBox3.Checked) and (not CheckBox2.Checked) and (not CheckBox1.Checked) then
    CheckBox1.Checked;
  //************************************/
  CheckBox9.Checked := False;
  if Dm.TD.FieldByName('lva_reg').AsString = 'X' then
    CheckBox9.Checked := True;

  CheckBox8.Checked := False;
  if Dm.TD.FieldByName('lvb_reg').AsString = 'X' then
    CheckBox8.Checked := True;

  CheckBox12.Checked := False;
  if Dm.TD.FieldByName('lvf').AsString = 'X' then
    CheckBox12.Checked := True;

  If (NOT CheckBox8.Checked) AND (NOT CheckBox12.Checked) then CheckBox8.Checked := True;

  CheckBox7.Checked := False;
  if Dm.TD.FieldByName('lvc_reg').AsString = 'X' then
    CheckBox7.Checked := True;

  CheckBox6.Checked := False;
  if Dm.TD.FieldByName('lvd_reg').AsString = 'X' then
    CheckBox6.Checked := True;

  {if (not CheckBox9.Checked) and (not CheckBox8.Checked) and (not CheckBox7.Checked) and (not CheckBox6.Checked) then
    CheckBox8.Checked := true;}

  if Dm.TD.FieldByName('livro_reg').AsString = '' then
    MaskEdit33.Text := '0'
  else
    MaskEdit33.Text := Dm.TD.FieldByName('livro_reg').AsString;

  if Dm.TD.FieldByName('folha_reg').AsString = '' then
    MaskEdit34.Text := '0'
  else
    MaskEdit34.Text := Dm.TD.FieldByName('folha_reg').AsString;

  if Dm.TD.FieldByName('folha_reg_f').AsString = '' then
    MaskEdit44.Text := '0'
  else
    MaskEdit44.Text := Dm.TD.FieldByName('folha_reg_f').AsString;

  if Dm.TD.FieldByName('livro').AsString = '' then
    MaskEdit39.Text := '0'
  else
    MaskEdit39.Text := Dm.TD.FieldByName('livro').AsString;

  if Dm.TD.FieldByName('folha').AsString = '' then
    MaskEdit40.Text := '0'
  else
    MaskEdit40.Text := Dm.TD.FieldByName('folha').AsString;
  
  {if ModalidadeAverbacaoCapital Then //// Criação do Livri F
    CheckBox8.Checked:= True;}
  //***********************************/

  if (Pesquisa) then Dm.Td.Close;
end;

procedure TF_Exame.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then
    close
  else if key = 13 then
    if bitbtn1.enabled then BitBtn1Click(F_Exame) else bitbtn2.setfocus;
end;

procedure TF_Exame.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_Exame.BitBtn2Click(Sender: TObject);
begin
  Limpar(F_Exame);
  //GroupBox3.Enabled := false;
  if (Not(PermitirEdicaoDasPartes)) Then
    GroupBox4.Enabled := false
  else
  GroupBox4.Enabled := True;

  if (Not(dm.liberaNaturesaTelaExame)) Then
    GroupBox5.Enabled := false
  else
  GroupBox5.Enabled := True;
  bitbtn1.enabled := true;
  bitbtn4.enabled := true;
  Panel2.enabled := false;
  Panel4.Enabled := false;
  Label83.Caption:= '.';
  Label85.Caption:= '.';
  Label72.Caption:= '.';
  if (ValidNumero(MaskEdit1.Text)) then MaskEdit1.Text := IntToStr(StrToInt(MaskEdit1.Text) + 1);
  try
    MaskEdit1.SetFocus;
  except
  end;  

  CheckBox9.Checked:= False;
  CheckBox8.Checked:= True;
  CheckBox12.Checked:= False;
  CheckBox7.Checked:= False;
  CheckBox6.Checked:= False;

  MaskEdit33.Text:= '0';
  MaskEdit34.Text:= '0';
  MaskEdit44.Text:= '0';


  CheckBox10.Checked:= False;
  CheckBox1.Checked:= True;
  CheckBox2.Checked:= False;
  CheckBox3.Checked:= False;
  CheckBox4.Checked:= False;
  MostraDajesAdicionais('0');
end;

procedure TF_Exame.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    ShowMessage('Protocolo Auxiliar inválido !');
    MaskEdit1.SetFocus;
    Exit;
  end;

  sCodNatureza := '';
  sNomeNatureza:= '';
    
  MaskEdit1.Enabled := False;
  Panel2.enabled    := False;
  Panel4.Enabled    := false;
  Dm.Td.Close;
  Dm.Td.Sql.Clear;
  Dm.Td.Sql.Add('SELECT * FROM td where');
  Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
  Dm.td.sql.add('and cartorio = "' + F_Menu.Label37.Caption + '"');
  Dm.Td.Open;
  if (Dm.Td.RecordCount = 0) then
  begin
    Dm.Td.Close;
    ShowMessage('Protocolo Auxiliar não encontado !');
    BitBtn2Click(F_Exame);
    Exit;
  end;

  Dm.qryGenerico.Close;
  Dm.qryGenerico.SQL.Clear;
  Dm.qryGenerico.SQL.Add('select * from selos where recibo = '+QuotedStr(MaskEdit1.Text)+'');
  Dm.qryGenerico.Open;

  if Dm.qryGenerico.FieldByName('daje').AsString = '000000' Then
  begin
    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear;
    Dm.qryGenerico.SQL.Add('delete from selos where recibo = '+QuotedStr(MaskEdit1.Text)+'');
    Dm.qryGenerico.ExecSQL;
  end;

  sCodNatureza := Dm.Td.FieldByName('natureza').asstring;
  sNomeNatureza:= Dm.TD.fieldbyname('ext_nat').asstring;

  if ((Dm.TD.fieldbyname('status').asstring = 'RECEPCAO') or (Dm.TD.fieldbyname('status').asstring = 'EXAME')) then
  Begin

    mudouStatus:= Dm.Td.FieldByName('status').asstring;

    Dm.Td.Edit;
    Dm.Td.FieldByName('data_e').asstring     := datetostr(date);
    Dm.Td.FieldByName('status').asstring     := 'EXAME';
    Dm.Td.FieldByName('hora_p').asstring     := timetostr(time);
    Dm.Td.FieldByName('identific1').asstring := F_Menu.Label1.caption;
    Dm.Td.Post;

    if mudouStatus <> 'EXAME' Then
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Status do registro foi alterado de: '+mudouStatus+' para: '+Dm.Td.FieldByName('status').asstring+'', MaskEdit1.Text);

    //GroupBox3.Enabled := True;
    GroupBox5.Enabled := True;
    panel4.Enabled    := true;
    SpeedButton11.Enabled := false;
    MaskEdit6.SetFocus;
  end
  else
  begin
    //BitBtn5.Enabled   := False;
    //GroupBox3.Enabled := False;
    GroupBox4.Enabled := False;
    if (Not(dm.liberaNaturesaTelaExame)) Then
      GroupBox5.Enabled := false
    else
    GroupBox5.Enabled := True;
    panel4.Enabled    := false;
    SpeedButton11.Enabled := true;

    if (PermitirEdicaoDasPartes) Then
    Begin
      GroupBox3.Enabled := True;
      GroupBox4.Enabled := True;
    End;
  end;
  Panel2.Enabled := True;
  Panel4.Enabled := True;
  Carrega_Pedid;
  Carrega_Pessoal(F_Exame, True);
  Carrega(F_Exame, False);
  Dm.Td.Close;
  BitBtn1.Enabled := False;
  BitBtn4.Enabled := False;

  if (Pos('NOTIFICACAO', ComboBox3.Text) > 0) then
  begin
    Label80.Visible := True;
    MaskEdit38.Visible := True;
  end
  else
  begin
    Label80.Visible := False;
    MaskEdit38.Visible := False;
  end;

  //aqui verificar nesta parte a O.S de TD numero = C:\jesus\temp\Ordem-de-Servico\1050.pdf
  v_sql := '';
  v_sql := ' select status from td WHERE p_auxiliar = '+Trim(MaskEdit1.Text);
  if  VerificaStatusDoTitulo(v_sql) = 'PRONTO'  then
  begin
    BitBtn8.Enabled := true;
    v_sql := '';
    v_sql := ' select liberado from td WHERE p_auxiliar = '+Trim(MaskEdit1.Text);
    if  VerificaSeTituloLiberado(v_sql) = 'S'  then
      BitBtn8.Caption := '&Bloqueado'
    else
      BitBtn8.Caption := '&Liberado';

  end
  else
  begin

    BitBtn8.Enabled := false;
  end;
  MostraDajesAdicionais(MaskEdit1.Text);
{
// Buscando o livro B
  Label69.Caption := 'Livro B';
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('select livrop, folhap from configur');
  Dm.ArqAux.Open;
  MaskEdit33.Text := Dm.ArqAux.FieldByName('livrop').AsString;
  MaskEdit34.Text := Dm.ArqAux.FieldByName('folhap').AsString;
  Dm.ArqAux.Close;

// Buscando o livro C
  dm.ArqAux.Close;
  dm.ArqAux.Sql.Clear;
  dm.ArqAux.Sql.Add('select cod_lae from td_pedid where p_auxiliar = ' + MaskEdit1.Text + ' group by cod_lae');
  dm.ArqAux.Open;
  If dm.ArqAux.RecordCount <> 0 then
  Begin
    If dm.ArqAux.FieldByName('cod_lae').AsString = '6003' then
    Begin
      Label69.Caption := 'Livro C';
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('select livro_c, folha_c from configur');
      Dm.ArqAux.Open;
      MaskEdit33.Text := Dm.ArqAux.FieldByName('livro_c').AsString;
      MaskEdit34.Text := Dm.ArqAux.FieldByName('folha_c').AsString;
      Dm.ArqAux.Close;
    End;
  End;    }
end;

procedure TF_Exame.FormActivate(Sender: TObject);
begin
{  if Label78.Visible = false then
  begin
       Label78.Visible := true;
       Label78.Caption  := '';
  end     
  else
    Label78.Caption     := ''; }

  Dm.DBTD.close;
  F_Menu.Vezes.Caption := '0';
  if MaskEdit1.Enabled Then
    try
      MaskEdit1.setfocus;
    except
    end;  

  //Abrindo Configur
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;

  if Dm.Configur.FieldByName('AlteraPartesExames').AsString = 'T' Then
    PermitirEdicaoDasPartes:= True
  else
    PermitirEdicaoDasPartes:= False;

  //Abrindo Config_adm
  Dm.Config_Adm.Close;
  Dm.Config_Adm.Sql.Clear;
  Dm.Config_Adm.Sql.Add('SELECT * FROM config_adm');
  Dm.Config_Adm.Open;

  if (DM.Configur.FieldByName('chk_15').AsBoolean = True) then SpeedButton5.Visible := True else SpeedButton5.Visible := False;
  carregaTipoEndereco;
end;

procedure TF_Exame.carregaTipoEndereco;
begin
  with Dm.ArqAux do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select * from tipologradouro';
    Open;
  end;
  while (not Dm.ArqAux.Eof) do
  begin
    cbTipoEndereco.Items.Add(Dm.ArqAux.FieldByName('tipologradouro').AsString);
    Dm.ArqAux.Next;
  end;
end;

procedure TF_Exame.MaskEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = VK_F2 tHEN
  Begin
    ChamaTelaDeBusca;
  End;

  if key = 13 then
    combobox7.SetFocus;
end;

procedure TF_Exame.MaskEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_Exame.MaskEdit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit20.setfocus;
end;

procedure TF_Exame.MaskEdit21KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then ComboBox9.SetFocus;
end;

procedure TF_Exame.Alterar1Click(Sender: TObject);
begin
  Panel4.Enabled := True;
  MaskEdit10.SetFocus;
end;

procedure TF_Exame.MaskEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit11.SetFocus;
end;

procedure TF_Exame.MaskEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then MaskEdit45.SetFocus;
end;

procedure TF_Exame.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //GroupBox3.Enabled := false;
  if (Not(PermitirEdicaoDasPartes)) Then
    GroupBox4.Enabled := false
  else
  GroupBox4.Enabled := True;

  if (Not(dm.liberaNaturesaTelaExame)) Then
    GroupBox5.Enabled := false
  else
  GroupBox5.Enabled := True;
  Panel2.enabled := false;
  Panel4.enabled := false;
  bitbtn1.enabled := true;
  bitbtn4.enabled := true;
end;

procedure TF_Exame.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox3.setfocus;
end;

procedure TF_Exame.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit5.setfocus;
end;

procedure TF_Exame.SpeedButton2Click(Sender: TObject);
begin
  if (Label43.Caption = 'EXAME') OR (Label43.Caption = 'RECEPCAO') then
  begin
    ShowMessage('Título não baixado. Utilize opção de Baixas');
    Exit;
  end;
  Application.CreateForm(TF_Baixa1, F_Baixa1);
  F_Baixa1.Caption              := 'Mudança de Status';
  F_Baixa1.Label12.Caption      := Label37.Caption;
  F_Baixa1.Label19.Caption      := Label72.Caption;
  F_Baixa1.Label3.Caption       := Trim(MaskEdit1.Text);
  F_Baixa1.Label4.Caption       := Trim(Label33.Caption);
  F_Baixa1.Label5.Caption       := Trim(Label29.Caption);
  F_Baixa1.Label15.Caption      := Trim(MaskEdit26.Text);
  F_Baixa1.Maskedit1.text       := datetostr(date);

  //F_Baixa1.MaskEdit1.enabled    := False;
  F_Baixa1.Radiobutton1.enabled := True;
  F_Baixa1.Radiobutton1.Checked := true;
  F_Baixa1.Radiobutton2.enabled := False;
  F_Baixa1.Radiobutton3.enabled := False;
  F_Baixa1.Radiobutton4.enabled := False;

  if (TirarTudo(F_Menu.Label39.Caption, '.', '/', '-') = '28588048000181') then
    F_Baixa1.rbSubJudice.Visible := true;

  if (LowerCase(Label43.Caption) = 'pronto') or (LowerCase(Label43.Caption) = 'devolvido pronto') then
  begin
    F_Baixa1.Radiobutton5.Enabled := False;
    F_Baixa1.Radiobutton6.Enabled := False;
    F_Baixa1.Radiobutton7.Enabled := False;
    F_Baixa1.rbSubJudice.Enabled  := false;
  end;

  F_Baixa1.Showmodal;
  F_Baixa1.Destroy;
  F_Baixa1 := NIL;
  F_Exame.BitBtn2Click(F_Exame);
  {Application.CreateForm(TF_Stat, F_Stat);
  F_Stat.ShowModal; }
end;

procedure TF_Exame.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(TfrmAnotacao, frmAnotacao);
  Application.CreateForm(TF_Info, F_Info);
  F_Info.Label14.Caption := 'remoto';
  F_Info.MaskEdit1.Text  := Trim(MaskEdit1.Text);
  F_Info.MaskEdit2.Text  := Trim(Label29.Caption);
  F_Info.ShowModal;
  F_Info.Destroy;
  F_Info := NIL;
  frmAnotacao.Destroy;
  frmAnotacao := NIL;
end;

procedure TF_Exame.MaskEdit8Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit8.Text)) then
    MaskEdit8.Text := '0';
end;

procedure TF_Exame.BitBtn4Click(Sender: TObject);
begin
  BitBtn2Click(F_Exame);
  Application.CreateForm(TF_Prot, F_Prot);
  F_Prot.Label1.Caption := 'T';
  F_Prot.ShowModal;
  F_Prot.Destroy;
  F_Prot := NIL;
  MaskEdit1.SetFocus;
end;

procedure TF_Exame.SpeedButton4Click(Sender: TObject);
begin
  Application.CreateForm(TF_Loc, F_Loc);
  F_Loc.Maskedit1.text := F_Exame.Label29.caption;
  F_Loc.Label5.caption := 'sim';
  F_Loc.Showmodal;
  F_Loc.Destroy;
  F_Loc := NIL;
end;

procedure TF_Exame.MaskEdit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_Exame.MaskEdit24Exit(Sender: TObject);
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

procedure TF_Exame.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = 27 then maskedit1.setfocus;
  if key = 13 then
  Begin
    if (Label43.Caption = 'RECEPCAO') or (Label43.Caption = 'EXAME') then
    Begin
      ComboBox3.SetFocus;
    end
    else
    Begin
     showmessage('Esta título não esta em EXAME. Portanto não será possível alterá-lo');
     bitbtn2.setfocus;
    end;
  end;

end;

procedure TF_Exame.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if CurrencyEdit1.Enabled Then
      CurrencyEdit1.SetFocus;
//    if (StrToInt(Copy(ComboBox3.Text, 1, 3)) <> 197) and (StrToInt(Copy(ComboBox3.Text, 1, 3)) <> 300) then
//    begin
      //GroupBox3.Enabled := False;
      {panel4.Enabled    := false;
      GroupBox4.Enabled := True;
      Label26.Caption   := 'I';
      Limpa_TelaPessoal(F_Exame);
      ComboBox1.SetFocus;}
//    end
//    else BitBtn5.SetFocus;
  end;
end;

procedure TF_Exame.ComboBox1Exit(Sender: TObject);
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

procedure TF_Exame.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  IF Key = VK_F2 tHEN
  Begin
    ChamaTelaDeBusca;
  End;

  if key = 13 then
    MaskEdit27.SetFocus;
  if key = 27 then
  begin
    Carrega_Pessoal(F_Exame, False);
    Label26.Caption   := 'Label26';
    GroupBox3.Enabled := True;
    panel4.Enabled    := true;
    if (Not(PermitirEdicaoDasPartes)) Then
      GroupBox4.Enabled := false
    else
    GroupBox4.Enabled := True;
    //DbGrid1.SetFocus;
  end;
end;

procedure TF_Exame.MaskEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    ComboBox2.SetFocus;
end;

procedure TF_Exame.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit28.SetFocus;
end;

procedure TF_Exame.MaskEdit28KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit17.SetFocus;
end;

procedure TF_Exame.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox5.SetFocus;
end;

procedure TF_Exame.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_Exame.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  Begin

   {F_menu.vezes.caption := '';
   if copy(combobox5.text,1,2) = '03' then
   Begin
    F_menu.vezes.caption := InputBox('QTDADE DE DESTINATÁRIO', 'Digite a quantidade de destinatários :', '1');
   end;}
   ComboBox6.SetFocus;
  end;
end;

procedure TF_Exame.ComboBox6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if MaskEdit8.Visible Then
      MaskEdit8.SetFocus
    else
    MaskEdit35.SetFocus;
  end;

end;

procedure TF_Exame.MaskEdit26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox4.SetFocus;
end;

procedure TF_Exame.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  Begin
    if ModalidadeAverbacaoCapital Then
      EdAverbacao.SetFocus
    Else
    MaskEdit6.SetFocus;
  End;
end;

procedure TF_Exame.MaskEdit7Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit7.Text)) then MaskEdit7.Text := '0';
end;

procedure TF_Exame.MaskEdit26Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit26.Text)) then MaskEdit26.Text := '0';
end;

procedure TF_Exame.Incluir1Click(Sender: TObject);
begin
  Limpa_TelaPessoal(F_Exame);
  //GroupBox3.Enabled := False;
  GroupBox4.Enabled := True;
  Label26.Caption   := 'I';
  ComboBox1.SetFocus;
end;

procedure TF_Exame.Corrigir2Click(Sender: TObject);
begin
  //GroupBox3.Enabled := False;
  GroupBox4.Enabled := True;
  Label26.Caption   := 'C';
  combobox1.SetFocus;
end;

procedure TF_Exame.Excluir1Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Confirma exclusão ?'), 'EXCLUSÃO DE PARTES', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
  begin


    Dm.Td_Pesso.Close;
    Dm.Td_Pesso.Sql.Clear;
    Dm.Td_Pesso.Sql.Add('select * FROM td_pesso');
    Dm.Td_Pesso.Sql.Add('WHERE');
    Dm.Td_Pesso.Sql.Add('recno = ' + Dm.PessAux.FieldByName('recno').asString);
    Dm.Td_Pesso.Open;

    mudouTipoCPF   := Dm.Td_Pesso.FieldByName('tip_doc1').AsString;
    mudouDocCPF    := Dm.Td_Pesso.FieldByName('doc1').AsString;
    mudouNomeParte := Dm.Td_Pesso.FieldByName('nome').AsString;
    mudouSituacao  := Ver_Situacao(Dm.Td_Pesso.FieldByName('situacao').AsString, True);


    Dm.Td_Pesso.Close;
    Dm.Td_Pesso.Sql.Clear;
    Dm.Td_Pesso.Sql.Add('DELETE FROM td_pesso');
    Dm.Td_Pesso.Sql.Add('WHERE');
    Dm.Td_Pesso.Sql.Add('recno = ' + Dm.PessAux.FieldByName('recno').asString);
    Dm.Td_Pesso.ExecSql;
    Dm.Td_Pesso.Close;

    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Exclusão da Parte: '+mudouNomeParte+', '+mudouTipoCPF+': '+mudouDocCPF+', Situação: '+ mudouSituacao+', do banco de dados', MaskEdit1.Text);


    Carrega_Pessoal(F_Exame, True);
  end;
end;

procedure TF_Exame.MaskEdit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then cbTipoEndereco.SetFocus;
end;

procedure TF_Exame.ComboBox7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then MaskEdit22.SetFocus;
end;

procedure TF_Exame.MaskEdit27Exit(Sender: TObject);
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
    Dm.Join.Close;
    Dm.Join.Sql.Clear;
    Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.data_e, a.data_i, a.data_d, a.data_du, a.data_anot,');
    Dm.Join.Sql.Add('a.p_auxiliar, a.protocolo, a.registro, a.tipo, a.natureza, a.ext_nat, a.anotacao,');
    Dm.Join.Sql.Add('a.status, a.identifica, a.identific1, a.identific2, a.identific3, a.microfilme,');
    Dm.Join.Sql.Add('a.tabela, a.contrato,a.data_not1, a.data_not2, a.data_not3, a.cod_ir1, a.cod_ir2, a.cod_ir3,');
    Dm.Join.Sql.Add('b.nome, b.endereco, b.cidade, b.estado, b.cep, b.situacao, b.nome2, b.tip_doc1,');
    Dm.Join.Sql.Add('b.doc1, b.tip_doc2, b.doc2, b.bairro, b.numero, b.complem, b.profissao, b.nacionalidade, b.estcivil');
    Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
    Dm.Join.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
    Dm.Join.Sql.Add('WHERE');
    Dm.Join.Sql.Add('(b.doc1 = ' + Chr(39) + TirarTudo(MaskEdit27.Text, '.', '/', '-') + Chr(39)+')');
    Dm.Join.Sql.Add('AND ((a.cod_ir1 = 3) or (a.cod_ir2 = 3) or (a.cod_ir3 = 3))');
    Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
    Dm.Join.Open;


    CarregaDadosEnderecoDasPartes(TirarTudo(MaskEdit27.Text, '.', '/', '-'));

    if (Dm.Join.RecordCount <> 0) then F_End2.showmodal;
    Dm.Join.Close;
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
    Dm.Join.Close;
    Dm.Join.Sql.Clear;
    Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.data_e, a.data_i, a.data_d, a.data_du, a.data_anot,');
    Dm.Join.Sql.Add('a.p_auxiliar, a.protocolo, a.registro, a.tipo, a.natureza, a.ext_nat, a.anotacao,');
    Dm.Join.Sql.Add('a.status, a.identifica, a.identific1, a.identific2, a.identific3, a.microfilme,');
    Dm.Join.Sql.Add('a.tabela, a.contrato,a.data_not1, a.data_not2, a.data_not3, a.cod_ir1, a.cod_ir2, a.cod_ir3,');
    Dm.Join.Sql.Add('b.nome, b.endereco, b.cidade, b.estado, b.cep, b.situacao, b.nome2, b.tip_doc1,');
    Dm.Join.Sql.Add('b.doc1, b.tip_doc2, b.doc2, b.bairro, b.numero, b.complem, b.profissao, b.nacionalidade, b.estcivil');
    Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
    Dm.Join.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
    Dm.Join.Sql.Add('WHERE');
    Dm.Join.Sql.Add('(b.doc1 = ' + Chr(39) + TirarTudo(MaskEdit27.Text, '.', '/', '-') + Chr(39)+')');
    Dm.Join.Sql.Add('AND ((a.cod_ir1 = 3) or (a.cod_ir2 = 3) or (a.cod_ir3 = 3))');
    Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
    Dm.Join.Open;
    CarregaDadosEnderecoDasPartes(TirarTudo(MaskEdit27.Text, '.', '/', '-'));
    if (Dm.Join.RecordCount <> 0) then F_End2.showmodal;
    Dm.Join.Close;
  end;
  if (Label26.Caption = 'I') AND (Trim(MaskEdit17.Text) = '') then
  begin
    Procura_Pessoal('doc1', TirarTudo(MaskEdit27.Text, '.', '-', '/'));
  end;
end;

procedure TF_Exame.MaskEdit28Exit(Sender: TObject);
begin
  if (Label26.Caption = 'I') AND (Trim(MaskEdit17.Text) = '') then Procura_Pessoal('doc2', Trim(MaskEdit28.Text));
end;

procedure TF_Exame.MaskEdit17Exit(Sender: TObject);
var
  Sair : Boolean;
begin

  //Verificando se o nome já está cadastrado neste título

  if (Label26.Caption = 'I') {and (Trim(ComboBox7.Text) = '')} then
  begin
    if (Trim(MaskEdit17.Text) <> '') then
    begin
      {Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT nome FROM td_pesso');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('    p_auxiliar = ' + Trim(MaskEdit1.Text));
      Dm.ArqAux.Sql.Add('AND nome       = ' + Chr(39) + Trim(MaskEdit17.Text) + Chr(39));
      Dm.ArqAux.Open;
      if (Dm.ArqAux.RecordCount <> 0) then
      begin
        Application.CreateForm(TF_TelAviso, F_TelAviso);
        F_TelAviso.Panel1.Caption := 'ATENÇÃO - NOME ENCONTRADO NESTE PROTOCOLO';
        F_TelAviso.ShowModal;
        ShowMessage('INCLUSÃO ABORTADA !');
        //cancelando inclusão
        Carrega_Pessoal(F_Exame, False);
        Label26.Caption   := 'Label26';
        GroupBox3.Enabled := True;
        panel4.Enabled    := true;
        if (Not(PermitirEdicaoDasPartes)) Then
          GroupBox4.Enabled := false
        else
        GroupBox4.Enabled := True;

        GroupBox4.Enabled := False;
        //DbGrid1.SetFocus;
      end;
      Dm.ArqAux.Close; }
    end;
  end;
  if (Trim(ComboBox7.Text) = '') then
  begin
    if (Label26.Caption = 'I') AND (Trim(MaskEdit27.Text) = '') then Procura_Pessoal('nome', Trim(MaskEdit17.Text));
  end;
end;

procedure TF_Exame.MaskEdit22Exit(Sender: TObject);
begin
  if (Trim(MaskEdit18.Text) = '') then
  begin
    Busca_Endereco(TirarTudo(MaskEdit22.Text, '-', '',''), '');
    if (Trim(MaskEdit18.Text) <> '') then
      MaskEdit3.SetFocus
    else
      cbTipoEndereco.SetFocus;
  end;
end;

procedure TF_Exame.SpeedButton1Click(Sender: TObject);
begin
  if (Label43.Caption <> 'EXAME') AND (Label43.Caption <> 'RECEPCAO') then
  begin
    ShowMessage('Título já baixado. Utilize opção de Status');
    Exit;
  end;

  Application.CreateForm(TF_Baixa1, F_Baixa1);
  BitBtn1.Enabled := True;

  F_Baixa1.tipo_reg := tipo_reg;

  F_Baixa1.Caption              := 'Baixa de Títulos';
  F_Baixa1.Label12.Caption      := Label37.Caption;
  F_Baixa1.Label3.Caption       := Trim(MaskEdit1.Text);
  F_Baixa1.Label4.Caption       := Trim(Label33.Caption);
  F_Baixa1.Label5.Caption       := Trim(Label29.Caption);
  F_Baixa1.Label19.Caption      := Label72.Caption;
  F_Baixa1.Label15.Caption      := IntToStr(StrToInt(MaskEdit34.Text) + StrToInt(MaskEdit8.Text));

  F_Baixa1.nome_parte           := MaskEdit10.Text;
  F_Baixa1.Nome_apresentante    := MaskEdit4.Text;
  F_Baixa1.cod_natureza         := StrToInt(MaskEdit6.Text);
  F_Baixa1.data_recepcao        := StrToDateTime(Label37.Caption);


  F_Baixa1.Label18.Caption      := '';
  dm.ArqAux.Close;
  dm.ArqAux.Sql.Clear;
  dm.ArqAux.Sql.Add('select cod_lae from td_pedid where p_auxiliar = ' + MaskEdit1.Text + ' group by cod_lae');
  dm.ArqAux.Open;
  if dm.ArqAux.RecordCount <> 0 then
    if dm.ArqAux.FieldByName('cod_lae').AsString = '6003' then
      F_Baixa1.Label18.Caption := '6003'
    else
      F_Baixa1.Label18.Caption := '';
  dm.ArqAux.Close;
  if StrToInt(MaskEdit8.Text) > 0 then
    F_Baixa1.Label16.Caption      := IntToStr(StrToInt(MaskEdit34.Text) + 1)
  else
    F_Baixa1.Label16.Caption      := '0';
  F_Baixa1.Label17.Caption      := MaskEdit33.Text;
  F_Baixa1.Label9.Caption       := '';

  dm.Natureza.Close;
  dm.Natureza.sql.Clear;
  dm.natureza.SQL.add('select * from natureza where natureza = "' + trim(copy(ComboBox3.Text, 1, 50)) + '"');
  dm.natureza.Open;
  F_Baixa1.Label11.Caption      := dm.Natureza.FieldByName('cod').AsString;
  F_Baixa1.Maskedit1.text       := datetostr(date);
  F_Baixa1.Radiobutton1.enabled := False;
  F_Baixa1.Radiobutton1.Checked := False;
  F_Baixa1.Radiobutton2.enabled := True;
  F_Baixa1.Radiobutton3.enabled := True;
  F_Baixa1.Radiobutton4.enabled := True;
  F_Baixa1.GroupBox2.Visible    := F_Exame.CheckBox5.Checked;
  if (ComboBox10.Text = 'Av.') Then
  Begin
    if (Label29.Caption = '0') or (Label29.Caption = '') Then
      //GerarSequencias(True, F_Baixa1.Fora, False, False, False, strtoint(Label29.Caption));
    F_Baixa1.averbacao        := EdAverbacao.Text;
    //F_Baixa1.protocolooficial := EdAverbacao.Text;
    NMicro:= MaskEdit43.Text;
    F_Baixa1.microfilme       := NMicro;
  End;

  F_Baixa1.Showmodal;
  F_Baixa1.Destroy;
  F_Baixa1 := NIL;
  //F_Exame.BitBtn2Click(F_Exame);
  BitBtn1.Click;  
  if BitBtn2.Enabled Then
    BitBtn2.SetFocus;
end;

procedure TF_Exame.ComboBox5Exit(Sender: TObject);
begin
  if (Trim(Copy(ComboBox5.Text, 1,3)) = '03') then tipo_ := 'N' else tipo_ := 'T';
end;

procedure TF_Exame.ComboBox3Exit(Sender: TObject);
begin
//  if (Trim(ComboBox3.Text) <> '') then Tipo_ := Copy(ComboBox3.Text, Length(ComboBox3.Text), 1);
  if ComboBox3.Text <> '' then
  begin
    dm.Natureza.Close;
    dm.Natureza.sql.Clear;
    dm.natureza.SQL.add('select * from natureza where natureza = "' + trim(copy(ComboBox3.Text, 1, 50)) + '"');
    dm.natureza.Open;
    MaskEdit6.Text := dm.Natureza.FieldByName('cod').AsString;

    if ModalidadeAverbacaoCapital Then
    Begin
      if ComboBox3.Text <> '' Then
      Begin
        //sNomeNatureza
        if (sCodNatureza <> MaskEdit6.Text) Then
        begin
          if Application.MessageBox( Pchar('Deseja gravar a natureza ?'),PChar('Exame/Baixa'),MB_ICONQUESTION + MB_YESNO ) = Id_yes then
          begin
            Dm.qryGenerico.Close;
            Dm.qryGenerico.Sql.Clear;
            Dm.qryGenerico.Sql.Add('UPDATE td SET natureza = '+QuotedStr(MaskEdit6.Text)+', ext_nat = '+QuotedStr(copy(ComboBox3.Text, 1, 50))+'');
            Dm.qryGenerico.Sql.Add('WHERE');
            Dm.qryGenerico.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
            Dm.qryGenerico.ExecSQL;
            sCodNatureza:= MaskEdit6.Text;
            ComboBox5.SetFocus;
          End;
        End;
      End;
    End;
    

  end;
end;

procedure TF_Exame.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit25.SetFocus;
end;

procedure TF_Exame.MaskEdit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit19.SetFocus;
end;

procedure TF_Exame.BitBtn5Click(Sender: TObject);
begin
  Application.CreateForm(TF_InfComp, F_InfComp);
  F_InfComp.Label23.Caption := Trim(MaskEdit1.Text);
  F_InfComp.Label25.Caption := Label37.Caption;
  F_InfComp.Label26.Caption := Label31.Caption;
  F_InfComp.ShowModal;
  F_InfComp.Destroy;
  F_InfComp := NIL;
  if (PermitirEdicaoDasPartes) Then
  Begin
    GroupBox4.Enabled := True;
    ComboBox1.SetFocus;
  End
  Else
    GroupBox4.Enabled := False;
  Label26.Caption   := 'I';
end;

procedure TF_Exame.ComboBox7Exit(Sender: TObject);
begin
//  if (Trim(ComboBox7.Text) = '') then
//  begin
//    ShowMessage('OBRIGATÓRIO COLOCAR SITUAÇÃO.');
//    Combobox7.SetFocus;
//    Exit;
//  end;
end;

procedure TF_Exame.ComboBox7KeyPress(Sender: TObject; var Key: Char);
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

procedure TF_Exame.ComboBox1KeyPress(Sender: TObject; var Key: Char);
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

procedure TF_Exame.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 73 then Incluir1Click(F_Exame);
  if key = 67 then Corrigir2Click(F_Exame);
  if key = 69 then Excluir1Click(F_Exame);
  if key = 27 then BitBtn2Click(F_Exame);
end;

procedure TF_Exame.MaskEdit36KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit37.setfocus;
end;

procedure TF_Exame.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit15.setfocus;
end;

procedure TF_Exame.PesquisarCEP1Click(Sender: TObject);
begin
 Application.CreateForm(TF_PesqCep, F_PesqCep);
 F_PesqCep.Showmodal;
 F_PesqCep.Destroy;
 F_PesqCep := NIL;
end;

procedure TF_Exame.CurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_Exame.MaskEdit18Exit(Sender: TObject);
begin
  {Dm.Join.Close;
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
  Dm.Join.Sql.Add('(b.endereco = ' + Chr(39) + F_Exame.Maskedit18.text + Chr(39)+')');
  Dm.Join.Sql.Add('AND ((a.cod_ir1 = 3) or (a.cod_ir2 = 3) or (a.cod_ir3 = 3))');
  Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
  Dm.Join.Open;
  if (Dm.Join.RecordCount <> 0) then F_End2.showmodal;
  Dm.Join.Close;  ^}
end;

procedure TF_Exame.CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then maskedit8.setfocus;
end;

procedure TF_Exame.ComboBox8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit24.SetFocus;
end;

procedure TF_Exame.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_Exame.MaskEdit6Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit6.Text)) OR (MaskEdit6.Text = '0') then
  begin
    MaskEdit6.Text := '0';
    //if Combobox3.Enabled Then
    //  Combobox3.SetFocus;
  end
  else
  begin
    dm.Natureza.close;
    dm.Natureza.sql.clear;
    dm.natureza.sql.add('select * from natureza where cod = ' + MaskEdit6.Text);
    dm.Natureza.Open;
    if dm.Natureza.RecordCount <> 0 then
      ComboBox3.Text := Dm.Natureza.FieldByName('natureza').AsString;
      ComboBox3Exit(sender);
    UpdateWindow(Handle);
  end;
  if (StrToInt(MaskEdit6.Text) = 197) OR (StrToInt(MaskEdit6.Text) = 96) OR (StrToInt(MaskEdit6.Text) = 300)  then
  begin
    ComboBox5.Text  := '1006 - Notificação';
    MaskEdit5.text := '1';
    if (StrToInt(MaskEdit6.Text) = 197) OR (StrToInt(MaskEdit6.Text) = 300) then MaskEdit24.Text := '1';
  end;
end;

procedure TF_Exame.SpeedButton5Click(Sender: TObject);
begin
  if F_Exame.Label43.Caption = 'PRONTO' then
  begin
    Application.CreateForm(TF_Selos, F_Selos);
    F_Selos.ShowModal;
    F_Selos.Destroy;
    F_Selos := Nil;
  end
  else
  begin
    Application.MessageBox('Não será possivel realizar a selagem, pois o título não está Registrado !' , 'Mensagem do Sistema', mb_ok);
  end;
end;

procedure TF_Exame.SpeedButton7Click(Sender: TObject);
var
  TextoLOG: String;
begin
  if messagedlg('Deseja gravar calculo ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

    {DM.qryGenerico.Close;
    DM.qryGenerico.SQL.Clear;
    DM.qryGenerico.Sql.Add('select qtde_nome, v_nome, pag_adic, v_pag, v_tribunal, v_defensoria,');
    DM.qryGenerico.Sql.Add('v_procuradoria, v_mutua, v_acoterj, v_distrib, v_subtotal, v_total from td where p_auxiliar = '+QuotedStr(MaskEdit1.Text)+'');
    DM.qryGenerico.Open;

    if MaskEdit16.Text <> DM.qryGenerico.FieldByName('qtde_nome').AsString Then
    begin
      mudouQtde_nome     := 'Quantidade Anterior: '+DM.qryGenerico.FieldByName('qtde_nome').AsString + 'Quantidade Nova: '+ DM.qryGenerico.FieldByName('qtde_nome').AsString;
      TextoLOG := TextoLOG + mudouQtde_nome;
    End;

    if TrocaVirgulaporPonto(CurrToStr(CurrencyEdit15.Value)) <> DM.qryGenerico.FieldByName('v_nome').AsString Then
    begin
      mudouV_nome := TrocaVirgulaporPonto(CurrToStr(CurrencyEdit15.Value));

      TextoLOG := TextoLOG + mudouQtde_nome;

    end;

    if MaskEdit23.Text <> DM.qryGenerico.FieldByName('pag_adic').AsString Then
      mudouPag_adic      := MaskEdit23.Text;

    if TrocaVirgulaporPonto(CurrToStr(CurrencyEdit16.Value)) <> DM.qryGenerico.FieldByName('v_pag').AsCurrency Then
      mudouV_pag         := DM.qryGenerico.FieldByName('v_pag').AsString;

    if TrocaVirgulaporPonto(CurrToStr(CurrencyEdit7.Value)) <> DM.qryGenerico.FieldByName('v_tribunal').AsCurrency Then
      mudouV_tribunal    := TrocaVirgulaporPonto(CurrToStr(CurrencyEdit7.Value));

    if TrocaVirgulaporPonto(CurrToStr(CurrencyEdit8.Value)) <> DM.qryGenerico.FieldByName('v_defensoria').AsCurrency Then
      mudouV_defensoria  := DM.qryGenerico.FieldByName('v_defensoria').AsString;

    if TrocaVirgulaporPonto(CurrToStr(CurrencyEdit9.Value)) <> DM.qryGenerico.FieldByName('v_procuradoria').AsCurrency Then
      mudouV_procuradoria  := DM.qryGenerico.FieldByName('v_procuradoria').AsString;

    if TrocaVirgulaporPonto(CurrToStr(CurrencyEdit10.Value)) <> DM.qryGenerico.FieldByName('v_mutua').AsCurrency Then
      mudouV_mutua  := DM.qryGenerico.FieldByName('v_mutua').AsString;

    if TrocaVirgulaporPonto(CurrToStr(CurrencyEdit12.Value)) <> DM.qryGenerico.FieldByName('v_acoterj').AsCurrency Then
      mudouV_acoterj  := DM.qryGenerico.FieldByName('v_acoterj').AsString;

    if TrocaVirgulaporPonto(CurrToStr(CurrencyEdit18.Value)) <> DM.qryGenerico.FieldByName('v_distrib').AsCurrency Then
      mudouV_distrib  := DM.qryGenerico.FieldByName('v_distrib').AsString;

    if TrocaVirgulaporPonto(CurrToStr(CurrencyEdit6.Value)) <> DM.qryGenerico.FieldByName('v_subtotal').AsCurrency Then
      mudouV_subtotal  := DM.qryGenerico.FieldByName('v_subtotal').AsString;

    if TrocaVirgulaporPonto(CurrToStr(CurrencyEdit13.Value)) <> DM.qryGenerico.FieldByName('v_total').AsCurrency Then
      mudouV_subtotal  := DM.qryGenerico.FieldByName('v_total').AsString; }



    DM.ArqAux2.Close;
    DM.ArqAux2.Sql.Clear;
    DM.ArqAux2.Sql.Add('UPDATE td SET');
    DM.ArqAux2.Sql.Add(' qtde_nome = '      + MaskEdit16.Text + ',');
    DM.ArqAux2.Sql.Add(' v_nome = '         + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit15.Value))  + ',');
    DM.ArqAux2.Sql.Add(' pag_adic = '       + MaskEdit23.Text + ',');
    DM.ArqAux2.Sql.Add(' v_pag = '          + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit16.Value))  + ',');
    DM.ArqAux2.Sql.Add(' v_tribunal = '     + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit7.Value))  + ',');
    DM.ArqAux2.Sql.Add(' v_defensoria = '   + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit8.Value))  + ',');
    DM.ArqAux2.Sql.Add(' v_procuradoria = ' + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit9.Value))  + ',');
    DM.ArqAux2.Sql.Add(' v_mutua = '        + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit10.Value)) + ',');
    DM.ArqAux2.Sql.Add(' v_acoterj = '      + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit12.Value)) + ',');
    DM.ArqAux2.Sql.Add(' v_distrib = '      + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit18.Value)) + ',');
    DM.ArqAux2.Sql.Add(' v_subtotal = '     + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit6.Value))  + ',');
    DM.ArqAux2.Sql.Add(' v_total = '        + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit13.Value)) + ',');
    //DM.ArqAux2.Sql.Add(' tipo_reg = '       + QuotedStr(ComboBox10.Text) + ',');
    DM.ArqAux2.Sql.Add(' custas = '         + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit13.Value)));
    DM.ArqAux2.Sql.Add(' WHERE p_auxiliar = ' + MaskEdit1.Text);
    DM.ArqAux2.ExecSQL;

    ShowMessage('Calculo gravado !');

    //Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Mudança de status de: '+mudouStatus+' para: '+Dm.Td.FieldByName('status').asstring+'', MaskEdit1.Text);


    CurrencyEdit2.Value := CurrencyEdit13.Value;
  end;
  Panel5.Visible := False;
end;

procedure TF_Exame.Inclluir1Click(Sender: TObject);
begin
  Abre_CadTab;
  Panel7.Enabled       := True;
  Panel7.Visible       := True;
  SpeedButton6.Enabled := False;
  SpeedButton7.Enabled := False;
  Label65.Caption      := 'incluir';
  SpeedButton8.Caption := '&Incluir Item';
  SpeedButton8.Visible := True;
  DBGrid3.SetFocus;
end;

procedure TF_Exame.Corrigir1Click(Sender: TObject);
begin
  Abre_CadTab;
  Panel6.Enabled       := True;
  SpeedButton6.Enabled := False;
  SpeedButton7.Enabled := False;
  Label65.Caption       := 'corrigir';
  SpeedButton8.Caption := '&Gravar Correção';
  SpeedButton8.Visible := True;
  MaskEdit14.SetFocus;
end;

procedure TF_Exame.DBGrid3DblClick(Sender: TObject);
begin
  Carrega_CadTab;
  Panel6.Enabled := True;
  Panel7.Visible := False;
  MaskEdit14.SetFocus;
end;

procedure TF_Exame.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Panel7.Visible := False;
  if key = 13 then
  begin
    Carrega_CadTab;
    MaskEdit14.SetFocus;
  end;
end;

procedure TF_Exame.DBGrid3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Carrega_CadTab;
end;

procedure TF_Exame.DBGrid2DblClick(Sender: TObject);
begin
  Carrega_Pedid2;
//MaskEdit14.SetFocus;
end;

procedure TF_Exame.DBGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Carrega_Pedid2;
end;

procedure TF_Exame.Excluir2Click(Sender: TObject);
var
  id : String;
begin
  if messagedlg('Deseja excluir este item do calculo ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    id := inttostr(DM.TD_Pedid.FieldbyName('id').AsInteger);
    DM.TD_Pedid.delete;
    DM.TD_Pedid.Close;
    DM.TD_Pedid.Open;
    if id < '1' then DM.TD_Pedid.FindFirst else
    begin
      DM.TD_Pedid.FindFirst;
      if not DM.TD_Pedid.Locate('id', id, []) then DM.TD_Pedid.FindLast;
    end;
  end;
end;

procedure TF_Exame.SpeedButton8Click(Sender: TObject);
begin
  if Label65.Caption = 'incluir' then
  begin
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('INSERT INTO td_pedid(data_r, p_auxiliar, recibo, cod_lae, descricao, tabela, item, subitem, valor_unit, qtde, valor_calc, tipo_prot)');
    DM.ArqAux.Sql.Add(' VALUES(');
    DM.ArqAux.Sql.Add(QuotedStr(ConvData(Label37.Caption)) + ', ');
    DM.ArqAux.Sql.Add(Trim(MaskEdit1.Text)       + ', ');
    DM.ArqAux.Sql.Add(Trim(Label40.Caption)      + ', ');
    DM.ArqAux.Sql.Add(Trim(MaskEdit30.Text)       + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit13.Text) + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit9.Text)  + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit11.Text)  + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit12.Text)  + ', ');
    DM.ArqAux.Sql.Add(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit11.Value)) + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit14.Text)  + ', ');
    DM.ArqAux.Sql.Add(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit14.Value)) + ',');
    DM.ArqAux.Sql.Add('"T")');
    DM.ArqAux.ExecSQL;

    ShowMessage('Item incluído !');
    Carrega_Pedid;
  end;

  if Label65.Caption = 'corrigir' then
  begin
    if messagedlg('Dados Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM.ArqAux.Active := False;
      DM.ArqAux.Sql.Clear;
      DM.ArqAux.Sql.Add('UPDATE td_pedid SET');
      DM.ArqAux.Sql.Add(' data_r = '     + QuotedStr(ConvData(Label37.Caption))  + ',');
      DM.ArqAux.Sql.Add(' descricao = '  + MaskEdit13.Text + ',');
      DM.ArqAux.Sql.Add(' tabela = '     + MaskEdit9.Text  + ',');
      DM.ArqAux.Sql.Add(' item = '       + MaskEdit11.Text  + ',');
      DM.ArqAux.Sql.Add(' subitem = '    + MaskEdit12.Text  + ',');
      DM.ArqAux.Sql.Add(' valor_unit = ' + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit11.Value)) + ',');
      DM.ArqAux.Sql.Add(' qtde = '       + QuotedStr(MaskEdit14.Text)  + ',');
      DM.ArqAux.Sql.Add(' valor_calc = ' + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit14.Value)));
      DM.ArqAux.Sql.Add(' WHERE id = '   + DM.TD_Pedid.fieldbyname('id').AsString);
      Dm.ArqAux.ExecSQL;

      ShowMessage('Correção concluída !');
      Carrega_Pedid;
    end
    else
    ShowMessage('Correção não realizada !');
  end;
  Panel6.Enabled := False;
  SpeedButton8.Visible := False;
  SpeedButton6.Enabled := True;
  SpeedButton7.Enabled := True;
end;

procedure TF_Exame.SpeedButton6Click(Sender: TObject);
var
  qtd_pg, qtd_nom : Integer;
  v_qtd_pg, v_qtd_nom, valorbase : Currency;
begin
  VrTotG         := 0;
  VrSubTotal     := 0;
  VrTribunal     := 0;
  VrDefensoria   := 0;
  VrProcuradoria := 0;
  VrMutua        := 0;
  VrAcoterj      := 0;
  VrDistrib      := 0;

  VrTrib_nom  := 0;
  VrDefen_nom := 0;
  VrProcu_nom := 0;
  tot_nomexc  := 0;
  nome_dist   := 0;
  v_nome      := 0;

  VrEmolAdicional := 0;
  VrTrib_DIST  := 0.00;
  VrDefen_DIST := 0.00;
  VrProcu_DIST := 0.00;

  dt_tab := MaskEdit31.Text;
  valorbase := F_Exame.CurrencyEdit1.Value;

  DM.Tab_atoemol.Close;
  DM.Tab_atoemol.sql.Clear;
  DM.Tab_atoemol.sql.Add('SELECT * from tab_atoemol');
  DM.Tab_atoemol.sql.Add('where');
  DM.Tab_atoemol.sql.Add('data = ' + QuotedStr(ConvData(dt_tab)));
  DM.Tab_atoemol.open;
  if (DM.Tab_atoemol.RecordCount = 0) then
  begin
    DM.Tab_atoemol.Close;
//  MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA CADASTRADA !'), 'CALCULO', MB_OK + MB_ICONSTOP);
//  Exit;
  end;

  DM.TabDemais.Close;
  DM.TabDemais.sql.Clear;
  DM.TabDemais.sql.Add('SELECT * from cad_tabdemais');
  DM.TabDemais.sql.Add('where');
  DM.TabDemais.sql.Add('data = ' + QuotedStr(ConvData(dt_tab)));
  DM.TabDemais.open;
  if (DM.TabDemais.RecordCount = 0) then
  begin
    DM.TabDemais.Close;
    MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR DEMAIS TABELAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
    Exit;
  end;

  DM.ArqAux2.Close;
  DM.ArqAux2.Sql.Clear;
  DM.ArqAux2.Sql.Add('SELECT SUM(valor_calc) as subtotal FROM td_pedid WHERE p_auxiliar = ' + MaskEdit1.Text);
  DM.ArqAux2.Open;

{ if (valorbase > 0) and (F_Exame.MaskEdit6.Text <> '225')then
  begin
    //Valor adicional
    VrEmolAdicional := truncav((valorbase * dm.tabdemais.FieldByName('registro').ascurrency) / 100);
    if vrEmolAdicional < dm.tabdemais.FieldByName('ufir_max').ascurrency then vrEmolAdicional := truncav(dm.tabdemais.FieldByName('ufir_min').ascurrency);
    if vrEmolAdicional > dm.tabdemais.FieldByName('ufir_min').ascurrency then vrEmolAdicional := truncav(dm.tabdemais.FieldByName('ufir_max').ascurrency);
  end;

  if (MaskEdit30.Text = '6003') or (MaskEdit30.Text = '6004') then
  begin
    VrEmolAdicional := TruncaV(VrEmolAdicional / 2);
  end;

  CurrencyEdit19.Value := VrEmolAdicional;

  if (VrEmolAdicional <> 0) then
  begin
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('UPDATE td_pedid SET valor_unit = ' + TrocaVirgulaporPonto(CurrToStr(VrEmolAdicional)) + ', valor_calc = ' + TrocaVirgulaporPonto(CurrToStr(VrEmolAdicional)));
    DM.ArqAux.Sql.Add(' WHERE p_auxiliar = ' + MaskEdit1.Text + ' AND (tabela = 10 and item = 1 and subitem = 1)');
    DM.ArqAux.ExecSQL;
  end; }

//if (MaskEdit23.Text <> '0') then
  qtd_pg  := 0;
  v_qtd_pg:= 0.00;
  if StrToInt(MaskEdit23.Text) > 0 then
  begin
    //Qtde Paginas
    if StrToInt(MaskEdit23.Text) > StrToInt(DM.TabDemais.FieldByName('qtd_pag').AsString) then
    begin
      qtd_pg   := StrToInt(MaskEdit23.Text) - (StrToInt(DM.TabDemais.FieldByName('qtd_pag').AsString));
      v_qtd_pg := DM.TabDemais.fieldbyname('pag_ate').asCurrency + (qtd_pg * DM.TabDemais.fieldbyname('pag_exc').asCurrency);
    end
    else v_qtd_pg := DM.TabDemais.fieldbyname('pag_ate').asCurrency;
    CurrencyEdit16.Value := v_qtd_pg;
    qtd_pg := StrToInt(MaskEdit23.Text);
  end;

  VrSubTotal := (VrEmolAdicional +
                 DM.ArqAux2.fieldbyname('subtotal').AsCurrency);// +
                 //CurrencyEdit16.Value);


  VrTribunal     := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('tribunal').AsCurrency) / 100);
  VrDefensoria   := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
  VrProcuradoria := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);
  VrMutua        := DM.TabDemais.FieldByName('mutua').AsCurrency;
  VrAcoterj      := DM.TabDemais.FieldByName('acoterj').AsCurrency;

  If (NOT v_chk_07) then { Calculo desmenbrado do Distribuidor + os Nomes Excedentes. }
  begin
    if (MaskEdit16.Text <> '0') then
    begin
      //Qtde Nomes
      if StrToInt(MaskEdit16.Text) > StrToInt(DM.TabDemais.FieldByName('qtd_nomes').AsString) then
      begin
        qtd_nom   := StrToInt(MaskEdit16.Text) - (StrToInt(DM.TabDemais.FieldByName('qtd_nomes').AsString));
        v_qtd_nom := DM.TabDemais.fieldbyname('nomes_ate').asCurrency + (qtd_nom * DM.TabDemais.fieldbyname('nomes').asCurrency);
        VrNomeExc := v_qtd_nom;
      end
      else VrNomeExc := DM.TabDemais.fieldbyname('nomes_ate').asCurrency;

      //Tribunal
      VrTrib_nom  := ((VrNomeExc * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
      //Defensoria
      VrDefen_nom := TruncaV((VrNomeExc * dm.tabdemais.FieldByName('defensoria').ascurrency) / 100);
      //Procuradoria
      VrProcu_nom := TruncaV((VrNomeExc * dm.tabdemais.FieldByName('procuradoria').ascurrency) / 100);

      tot_nomexc :=  VrNomeExc + VrTrib_nom + VrDefen_nom + VrProcu_nom;
      tot_nomexc :=  VrNomeExc; // + VrTrib_nom + VrDefen_nom + VrProcu_nom;

      CurrencyEdit15.Value := tot_nomexc;
      qtd_nom := StrToInt(MaskEdit16.Text);
    end;
    VrDistrib      := DM.TabDemais.FieldByName('distribuicao').AsCurrency;
    VrTrib_DIST    := TruncaV((VrDistrib * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
    VrDefen_DIST   := TruncaV((VrDistrib * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
    VrProcu_DIST   := TruncaV((VrDistrib * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);
  End
  Else
  Begin
    if (MaskEdit16.Text <> '0') then
    begin
      //Qtde Nomes
      if StrToInt(MaskEdit16.Text) > StrToInt(DM.TabDemais.FieldByName('qtd_nomes').AsString) then
      begin
        qtd_nom   := StrToInt(MaskEdit16.Text) - (StrToInt(DM.TabDemais.FieldByName('qtd_nomes').AsString));
        v_qtd_nom := DM.TabDemais.fieldbyname('nomes_ate').asCurrency + (qtd_nom * DM.TabDemais.fieldbyname('nomes').asCurrency);
        VrNomeExc := v_qtd_nom;
      end
      else VrNomeExc := DM.TabDemais.fieldbyname('nomes_ate').asCurrency;
      tot_nomexc :=  VrNomeExc; // + VrTrib_nom + VrDefen_nom + VrProcu_nom;

      CurrencyEdit15.Value := tot_nomexc;
      qtd_nom := StrToInt(MaskEdit16.Text);
    end;
    VrDistribNew   := DM.TabDemais.FieldByName('distribuicao').AsCurrency + VrNomeExc;
    VrDistrib      := DM.TabDemais.FieldByName('distribuicao').AsCurrency;
    VrTrib_DIST    := TruncaV((VrDistribNew * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
    VrDefen_DIST   := TruncaV((VrDistribNew * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
    VrProcu_DIST   := TruncaV((VrDistribNew * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);
  End;

  VrTotG := VrSubTotal + VrTribunal + VrDefensoria + VrProcuradoria + VrMutua + VrAcoterj + VrDistrib + tot_nomexc +
            VrTrib_DIST + VrDefen_DIST + VrProcu_DIST +
            VrTrib_nom + VrDefen_nom + VrProcu_nom;

  CurrencyEdit7.Value  := VrTribunal;
  CurrencyEdit8.Value  := VrDefensoria;
  CurrencyEdit9.Value  := VrProcuradoria;
  CurrencyEdit10.Value := VrMutua;
  CurrencyEdit12.Value := VrAcoterj;
  CurrencyEdit6.Value  := VrSubTotal;
  CurrencyEdit18.Value := VrDistrib; // + VrTrib_DIST + VrDefen_DIST + VrProcu_DIST + VrTrib_nom + VrDefen_nom + VrProcu_nom;
  //VrDistrib    +VrTrib_DIST + VrDefen_DIST + VrProcu_DIST + VrTrib_nom + VrDefen_nom + VrProcu_nom;
  CurrencyEdit13.Value := VrTotG;
end;

procedure TF_Exame.CurrencyEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_Exame.SpeedButton8Click(F_Exame);
end;

procedure TF_Exame.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit14.SetFocus;
end;

procedure TF_Exame.MaskEdit14Exit(Sender: TObject);
var
  Multip : Currency;
begin
  Multip := 0;
  Multip := (StrToInt(MaskEdit14.Text) * CurrencyEdit11.Value);
  CurrencyEdit14.Value := Multip;
end;

procedure TF_Exame.MaskEdit16Exit(Sender: TObject);
begin
  if MaskEdit16.Text = '0' then CurrencyEdit15.Value := 0.00;
end;

procedure TF_Exame.MaskEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit23.SetFocus;
end;

procedure TF_Exame.MaskEdit23Exit(Sender: TObject);
begin
  if MaskEdit23.Text = '0' then CurrencyEdit16.Value := 0.00;
end;

procedure TF_Exame.MaskEdit23KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit29.SetFocus;
end;

procedure TF_Exame.MaskEdit32KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
    MkEmail.SetFocus; 
end;

procedure TF_Exame.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit35.SetFocus;

{
  If key = 13 then
  Begin
    if (MessageBox(Handle, PChar('Corrigir os dados ?'), 'EXAME DE TÍTULOS', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin
        dm.Natureza.Close;
        dm.Natureza.sql.Clear;
        dm.natureza.SQL.add('select * from natureza where natureza = "' + trim(copy(ComboBox3.Text, 1, 50)) + '"');
        dm.natureza.Open;

        dm.ArqAux.Close;
        dm.ArqAux.sql.Clear;
        dm.arqaux.sql.add('update td set');
        dm.arqaux.SQL.add(' valor_base = '         + StringReplace(FloatToStr(CurrencyEdit1.Value) , ',', '.', [rfReplaceAll]) + ',');
        dm.arqaux.SQL.add(' pag_adic = '           + MaskEdit8.Text + ',');
        dm.arqaux.SQL.add(' natureza = '           + dm.Natureza.FieldByName('cod').AsString + ',');
        dm.arqaux.SQL.add(' tabela = "'            + Trim(Copy(ComboBox5.Text, 1,5)) + '",');
        dm.arqaux.SQL.add(' divisor = '            + Copy(ComboBox6.Text, 1,2) + ',');
        dm.arqaux.SQL.add(' ext_nat = "'           + copy(ComboBox3.Text, 1, 50)  + '"');
        dm.arqaux.sql.Add(' where p_auxiliar = ' + Trim(MaskEdit1.Text));
        dm.arqaux.ExecSQL;
        BitBtn1.OnClick(Self);
    End;
  End;
}
end;

procedure TF_Exame.SpeedButton9Click(Sender: TObject);
begin
//  MaskEdit34.Enabled := True;
//  MaskEdit34.SetFocus;
end;

procedure TF_Exame.MaskEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then MaskEdit21.SetFocus;
end;

procedure TF_Exame.MaskEdit34KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
  begin
    if (Not(MaskEdit44.Visible)) then
      ComboBox11.SetFocus
    else
    MaskEdit44.SetFocus;
  end             
end;

procedure TF_Exame.MaskEdit33KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit34.SetFocus;
end;

procedure TF_Exame.MaskEdit35KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if key = 13 then MaskEdit33.SetFocus;
  if key = 13 then
    if MaskEdit38.Visible then
       MaskEdit38.SetFocus
     else
       ComboBox10.SetFocus;
end;

procedure TF_Exame.MaskEdit37KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = 13 then
  Begin
    SalvaAsPartesEmTdPesso;
  end;
end;
procedure TF_Exame.ComboBox9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
  Begin
    if MaskEdit36.Enabled Then
      MaskEdit36.SetFocus
  End
end;

procedure TF_Exame.BitBtn6Click(Sender: TObject);
begin
  Application.CreateForm(TfrmLavratura, frmLavratura);
  frmLavratura.lblDataProtocolo.Caption := '';
  frmLavratura.lblProtocolo.Caption     := '';
  frmLavratura.MaskEdit1.Text           := '';
  frmLavratura.MaskEdit2.Text           := '';
  frmLavratura.MaskEdit3.Text           := '';
  frmLavratura.MaskEdit4.Text           := '';
  frmLavratura.MaskEdit5.Text           := '';
  frmLavratura.RichEdit1.Text           := '';
  DM.qryLavratura.Close;
  DM.qryLavratura.Sql.Clear;
  DM.qryLavratura.Sql.Add('SELECT * FROM lavratura WHERE ');
  DM.qryLavratura.Sql.Add('data_protocolo = ' + #39 + ConvData(Label37.Caption) + #39);
  DM.qryLavratura.Sql.Add('AND protocolo = ' + #39 + MaskEdit1.Text + #39);
  DM.qryLavratura.Open;
  if DM.qryLavratura.RecordCount <> 0 then
  begin
    frmLavratura.lblOperacao.Caption      := 'CORRIGIR';
    frmLavratura.lblDataProtocolo.Caption := Label37.Caption;
    frmLavratura.lblProtocolo.Caption     := MaskEdit1.Text;
    frmLavratura.MaskEdit1.Text           := DM.qryLavratura.FieldByName('data_lavratura').AsString;
    frmLavratura.MaskEdit2.Text           := DM.qryLavratura.FieldByName('livro').AsString;
    frmLavratura.MaskEdit3.Text           := DM.qryLavratura.FieldByName('folha').AsString;
    frmLavratura.MaskEdit4.Text           := DM.qryLavratura.FieldByName('selo').AsString;
    frmLavratura.MaskEdit5.Text           := DM.qryLavratura.FieldByName('termo').AsString;
    frmLavratura.RichEdit1.Text           := DM.qryLavratura.FieldByName('observacao').AsString;
  end
  else
  begin
    frmLavratura.lblOperacao.Caption      := 'INCLUIR';
    frmLavratura.lblDataProtocolo.Caption := Label37.Caption;
    frmLavratura.lblProtocolo.Caption     := MaskEdit1.Text;
  end;
  DM.qryLavratura.Close;
  frmLavratura.ShowModal;
  frmLavratura.Destroy;
  frmLavratura := Nil;
end;

procedure TF_Exame.ComboBox10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit39.SetFocus;
end;

procedure TF_Exame.BitBtn7Click(Sender: TObject);
begin
  if (not Permissao('acesso046')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Anot, F_Anot);
  if (MaskEdit1.Text <> '') then
  begin

    IF Label29.Caption = '0' Then
    Begin
      MessageBox(Handle, PChar('Registro não encontrado !'), 'PESQUISA', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
      Abort;
    End;

    F_Anot.chamada_externa := True;
    F_Anot.MaskEdit1.Text := Label29.Caption;
  end;
  F_Anot.ShowModal;
  F_Anot.Destroy;
  F_Anot := NIL;
end;

procedure TF_Exame.SpeedButton10Click(Sender: TObject);
begin
  if not TestarConexaoTJ(id_eselo) then
    CheckBox5.Enabled := True;
  CheckBox5.Checked := False;
end;

procedure TF_Exame.MaskEdit33KeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9', #08]) then key := #0;
end;

procedure TF_Exame.MaskEdit34KeyPress(Sender: TObject; var Key: Char);
begin
     if not (key in ['0'..'9', #08]) then key := #0;
end;

procedure TF_Exame.SpeedButton11Click(Sender: TObject);
begin
  Application.CreateForm(TF_RRec, F_RRec);
  Carrega_Assina;
  F_RRec.MaskEdit3.Clear;
  F_RRec.MaskEdit4.Clear;
  F_RRec.MaskEdit3.Text := Label29.Caption;
  F_RRec.MaskEdit4.Text := Label29.Caption;
  F_RRec.Showmodal;
  F_RRec.Destroy;
  F_RRec := NIL;
end;

function TF_Exame.VerificaStatusDoTitulo(value: String): String;
var
  qry  : TQuery;
begin
  qry  := TQuery.Create(Application);
  qry.DatabaseName  := DM.DBTD.DatabaseName;
  try
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add(value);
    qry.Open;
    qry.First;

    result := trim(qry.FieldByName('status').AsString);

  except
    on E: Exception do
       begin
         MessageDlg('Ocorreu um erro ao consultar a tabela ! '+value+
                    'Tente Novamente ou comunique ao Administrador SISCART!'+#10+#10+E.Message,mtError,[mbOk],0);

         result := '';
       end;

  end;
  if qry <> nil then
  begin
    qry.Destroy;
    qry := nil;
  end;
end;

function TF_Exame.VerificaSeTituloLiberado(value: String): String;
var
  qry  : TQuery;
begin
  qry  := TQuery.Create(Application);
  qry.DatabaseName  := DM.DBTD.DatabaseName;
  try
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add(value);
    qry.Open;
    qry.First;

    result := trim(qry.FieldByName('liberado').AsString);

  except
    on E: Exception do
       begin
         MessageDlg('Ocorreu um erro ao consultar a tabela ! '+value+
                    'Tente Novamente ou comunique ao Administrador SISCART!'+#10+#10+E.Message,mtError,[mbOk],0);

         result := '';
       end;

  end;
  if qry <> nil then
  begin
    qry.Destroy;
    qry := nil;
  end;
end;

procedure TF_Exame.BitBtn8Click(Sender: TObject);
var
  msg,tipo : String;
begin

  if ( BitBtn8.Caption = '&Bloqueado' ) then
  begin
    msg := 'Liberar o Protocolo para Entrega?';
    tipo := 'L';
  end
  else
  begin
    msg := 'Bloquear o Protocolo para Entrega?';
    tipo := 'B';
  end;   

  if Application.MessageBox( Pchar(msg),'Baixa de Título',MB_ICONQUESTION + MB_YESNO ) = Id_yes then
    if tipo = 'L' then
    begin
      AtualizarCampoLiberado_da_TD('NULL',trim(MaskEdit1.text));
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O documento foi bloqueado', MaskEdit1.Text);
    end
    else
    begin
      AtualizarCampoLiberado_da_TD('S',trim(MaskEdit1.text));
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O documento foi liberado', MaskEdit1.Text);
    End;

 v_Sql := '';
 v_Sql := ' select liberado from td where p_auxiliar = '+trim(MaskEdit1.Text);
 if VerificaSeTituloLiberado(v_Sql) = 'S' then
   BitBtn8.Caption := '&Bloqueado'
 else
   BitBtn8.Caption := '&Liberar';

end;

procedure TF_Exame.AtualizarCampoLiberado_da_TD(value,nr_protoc: String);
var
   qry  : TQuery;
   
begin
    v_Sql := '';
    if value = 'S' then
      v_Sql := 'UPDATE td SET liberado = '+QuotedStr('S')+' where p_auxiliar = '+nr_protoc
    else
      v_Sql := 'UPDATE td SET liberado = null '+' where p_auxiliar = '+nr_protoc;

    qry  := TQuery.Create(Application);
    qry.DatabaseName  := DM.DBTD.DatabaseName;
    try
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add(v_Sql);
      qry.ExecSQL;
    except
      on E: Exception do
         begin
           MessageDlg('Ocorreu um erro ao Atualizar a tabela ! '+v_Sql+
                      'Tente Novamente ou comunique ao Administrador SISCART!'+#10+#10+E.Message,mtError,[mbOk],0);
         end;

    end;
    if qry <> nil then
    begin
      qry.Destroy;
      qry := nil;
    end;
end;

procedure TF_Exame.CarregaDadosEnderecoDasPartes(sCpf: String);
begin
  if sCpf <> '' Then
  Begin

    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear;
    Dm.qryGenerico.SQL.Add('SELECT * FROM escrit WHERE doc = '+QuotedStr(sCpf)+' order by escritorio');
    Dm.qryGenerico.Open;

    If (Not(Dm.qryGenerico.IsEmpty)) Then
    Begin

      MaskEdit17.Text := Dm.qryGenerico.FieldByName('escritorio').asString;
      ComboBox2.Text  := Dm.qryGenerico.FieldByName('tip_doc').asString;
      MaskEdit18.Text := Dm.qryGenerico.FieldByName('endereco').asString;
      MaskEdit19.Text := Dm.qryGenerico.FieldByName('bairro').asString;
      MaskEdit20.Text := Dm.qryGenerico.FieldByName('cidade').asString;
      MaskEdit21.Text := Dm.qryGenerico.FieldByName('estado').asString;
      MaskEdit22.EditMask := '';
      MaskEdit22.Text := Dm.qryGenerico.FieldByName('cep').asString;
      MaskEdit22.EditMask := '#####-###';

      
      MaskEdit36.Text := Dm.qryGenerico.FieldByName('profissao').asString;
      ComboBox9.Text := Dm.qryGenerico.FieldByName('estado_civil').asString;
      MaskEdit37.Text := Dm.qryGenerico.FieldByName('nacionalidade').asString;
      ComboBox2.Text := Dm.qryGenerico.FieldByName('tip_doc_outro').asString;
      MaskEdit28.Text := Dm.qryGenerico.FieldByName('doc_outro').asString;
      MaskEdit3.Text := Dm.qryGenerico.FieldByName('numero').asString;



    End
    Else
    Begin

      Dm.qryGenerico.Close;
      Dm.qryGenerico.SQL.Clear;
      Dm.qryGenerico.SQL.Add('SELECT b.situacao, b.nome, b.endereco, b.cidade, b.estado, b.cep, b.situacao, b.nome2, b.tip_doc1,');
      Dm.qryGenerico.SQL.Add('b.doc1, b.tip_doc2, b.doc2, b.bairro, b.numero, b.complem, b.profissao, b.nacionalidade, b.estcivil, tipoEndereco');
      Dm.qryGenerico.SQL.Add('FROM td_pesso b WHERE b.doc1 = '+QuotedStr(sCpf)+' and b.endereco <> '+QuotedStr('')+' order by recno asc');
      Dm.qryGenerico.Open;
      Dm.qryGenerico.Last;

      MaskEdit17.Text := Dm.qryGenerico.FieldByName('nome').asString;

      ComboBox2.Text  := Dm.qryGenerico.FieldByName('tip_doc2').asString;
      MaskEdit28.Text := Dm.qryGenerico.FieldByName('doc2').asString;
      cbTipoEndereco.Text := Dm.qryGenerico.FieldByName('tipoEndereco').asString;
      MaskEdit18.Text := Dm.qryGenerico.FieldByName('endereco').asString;
      MaskEdit3.Text  := Dm.qryGenerico.FieldByName('numero').asString;
      MaskEdit19.Text := Dm.qryGenerico.FieldByName('bairro').asString;
      MaskEdit20.Text := Dm.qryGenerico.FieldByName('cidade').asString;
      MaskEdit21.Text := Dm.qryGenerico.FieldByName('estado').asString;
      MaskEdit36.Text := Dm.qryGenerico.FieldByName('profissao').asString;
      MaskEdit37.Text := Dm.qryGenerico.FieldByName('nacionalidade').asString;
      ComboBox9.Text  := Dm.qryGenerico.FieldByName('estcivil').asString;
      MaskEdit22.EditMask := '';
      MaskEdit22.Text := Dm.qryGenerico.FieldByName('cep').asString;
      MaskEdit22.EditMask := '#####-###';
      MaskEdit25.Text := Dm.qryGenerico.FieldByName('complem').asString;
      ComboBox7.Text  := Ver_Situacao(Dm.qryGenerico.FieldByName('situacao').asString, True);

    End;
  End;
end;

procedure TF_Exame.CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then EdAverbacao.SetFocus;

end;

procedure TF_Exame.ComboBox11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  Begin
    if CurrencyEdit2.Enabled Then
      CurrencyEdit2.SetFocus
    else
    CurrencyEdit1.SetFocus;
  End

end;

procedure TF_Exame.SpeedButton12Click(Sender: TObject);
begin
  if (not Permissao('acesso049')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Exige2, F_Exige2);
  Carrega_Assina;
  F_Exige2.MaskEdit1.Text:= MaskEdit1.Text;
  F_Exige2.Maskedit2.Text := DateToStr(date);
  F_Exige2.BitBtn1.OnClick(Sender);
  F_Exige2.Showmodal;
  F_Exige2.Destroy;
  F_Exige2 := NIL;
end;

procedure TF_Exame.MkEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit41.SetFocus;
end;

procedure TF_Exame.SpeedButton19Click(Sender: TObject);
begin
  Application.CreateForm(TF_CadImoveis, F_CadImoveis);
  Dm.sNumeroProcoloDOI:= MaskEdit1.Text;
  F_CadImoveis.ShowModal;
  Dm.sNumeroProcoloDOI:= '';

  F_CadImoveis.Destroy;
  F_CadImoveis := Nil;
end;

procedure TF_Exame.SpeedButton20Click(Sender: TObject);
begin
  if Label29.Caption <> '0' Then
  Begin
    Application.CreateForm(TF_RETQ, F_RETQ);
    F_RETQ.MaskEdit1.Text:= DateToStr(now);
    F_RETQ.MaskEdit3.Text:= Label29.Caption;
    F_RETQ.MaskEdit2.Text:= Label29.Caption;
    F_RETQ.ShowModal;
    F_RETQ.Destroy;
    F_RETQ := Nil;
  End
  Else
  Begin
    MessageBox(Handle, PChar('É necessário baixar o titulo para emitir sua respectiva etiqueta !'), 'ATENÇÃO', MB_OK + MB_ICONWARNING);
    Abort;
  End;
end;

procedure TF_Exame.EdAverbacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  Begin
    MaskEdit43.SetFocus;
  End;
end;

procedure TF_Exame.MaskEdit39KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit40.SetFocus;
end;

procedure TF_Exame.MaskEdit40KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit33.SetFocus;
end;

procedure TF_Exame.GerarNumeroDoLivro;
var
  livro_b, folha_b, livro_c, folha_c: Integer;
begin

{  if (CheckBox2.Checked) Then // se livro b estiver marcado
  Begin
    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear;
    Dm.qryGenerico.SQL.Add('select (livrop) as livro_b, (folhap) as folha_b from configur');
    Dm.qryGenerico.Open;

    livro_b:= Dm.qryGenerico.FieldByName('livro_b').AsInteger;
    folha_b:= Dm.qryGenerico.FieldByName('folha_b').AsInteger;

    MaskEdit33.Text:= inttostr(livro_b);
    MaskEdit34.Text:= inttostr(folha_b);

    Dm.qryGenerico_Aux.Close;
    Dm.qryGenerico_Aux.SQL.Clear;
    Dm.qryGenerico_Aux.SQL.Add('update td set livro_b = :livro_b, folha_b = :folha_b, folha_b_f = :folha_b_f where p_auxiliar = '+QuotedStr(MaskEdit1.Text)+'');
    Dm.qryGenerico_Aux.ParamByName('livro_b').AsInteger  := livro_b;
    Dm.qryGenerico_Aux.ParamByName('folha_b').AsInteger  := folha_b;
    Dm.qryGenerico_Aux.ParamByName('folha_b_f').AsInteger:= folha_b + strtoint(MaskEdit8.Text);
    Dm.qryGenerico_Aux.ExecSQL;

    Dm.qryGenerico_Aux.Close;
    Dm.qryGenerico_Aux.SQL.Clear;
    Dm.qryGenerico_Aux.SQL.Add('update configur set livrop = :livrop, folhap = :folhap');
    Dm.qryGenerico_Aux.ParamByName('livrop').AsInteger:= livro_b;
    Dm.qryGenerico_Aux.ParamByName('folhap').AsInteger:= folha_b + strtoint(MaskEdit8.Text);
    Dm.qryGenerico_Aux.ExecSQL;
  End;

  if (CheckBox8.Checked) Then // se livro b estiver marcado
  Begin
    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear;
    Dm.qryGenerico.SQL.Add('select (livrop) as livro_b, (folhap) as folha_b from configur');
    Dm.qryGenerico.Open;

    livro_b:= Dm.qryGenerico.FieldByName('livro_b').AsInteger;
    folha_b:= Dm.qryGenerico.FieldByName('folha_b').AsInteger;

    MaskEdit39.Text:= inttostr(livro_b);
    MaskEdit40.Text:= inttostr(folha_b);

    Dm.qryGenerico_Aux.Close;
    Dm.qryGenerico_Aux.SQL.Clear;
    Dm.qryGenerico_Aux.SQL.Add('update td set livro_reg = :livro_reg, folha_reg = :folha_reg, folha_reg_f = :folha_reg_f where p_auxiliar = '+QuotedStr(MaskEdit1.Text)+'');
    Dm.qryGenerico_Aux.ParamByName('livro_reg').AsInteger  := livro_b;
    Dm.qryGenerico_Aux.ParamByName('folha_reg').AsInteger  := folha_b;
    Dm.qryGenerico_Aux.ParamByName('folha_reg_f').AsInteger:= folha_b + strtoint(MaskEdit8.Text);
    Dm.qryGenerico_Aux.ExecSQL;

    Dm.qryGenerico_Aux.Close;
    Dm.qryGenerico_Aux.SQL.Clear;
    Dm.qryGenerico_Aux.SQL.Add('update configur set livrop = :livrop, folhap = :folhap');
    Dm.qryGenerico_Aux.ParamByName('livrop').AsInteger:= livro_b;
    Dm.qryGenerico_Aux.ParamByName('folhap').AsInteger:= folha_b + strtoint(MaskEdit8.Text);
    Dm.qryGenerico_Aux.ExecSQL;
  End;


  if (CheckBox3.Checked) Then // se livro c estiver marcado
  Begin
    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear;
    Dm.qryGenerico.SQL.Add('select livro_c, folha_c from configur');
    Dm.qryGenerico.Open;

    livro_c:= Dm.qryGenerico.FieldByName('livro_c').AsInteger;
    folha_c:= Dm.qryGenerico.FieldByName('folha_c').AsInteger;

    MaskEdit33.Text:= inttostr(livro_c);
    MaskEdit34.Text:= inttostr(folha_c);

    Dm.qryGenerico_Aux.Close;
    Dm.qryGenerico_Aux.SQL.Clear;
    Dm.qryGenerico_Aux.SQL.Add('update td set livro_c = :livro_c, folha_c = :folha_c, folha_c_f = :folha_c_f where p_auxiliar = '+QuotedStr(MaskEdit1.Text)+'');
    Dm.qryGenerico_Aux.ParamByName('livro_c').AsInteger  := livro_c;
    Dm.qryGenerico_Aux.ParamByName('folha_c').AsInteger  := folha_c;
    Dm.qryGenerico_Aux.ParamByName('folha_c_f').AsInteger:= folha_c + strtoint(MaskEdit8.Text);
    Dm.qryGenerico_Aux.ExecSQL;

    Dm.qryGenerico_Aux.Close;
    Dm.qryGenerico_Aux.SQL.Clear;
    Dm.qryGenerico_Aux.SQL.Add('update configur set livro_c = :livro_c, folha_c = :folha_c');
    Dm.qryGenerico_Aux.ParamByName('livro_c').AsInteger:= livro_c;
    Dm.qryGenerico_Aux.ParamByName('folha_c').AsInteger:= folha_c + strtoint(MaskEdit8.Text);
    Dm.qryGenerico_Aux.ExecSQL;
  End;

  if (CheckBox7.Checked) Then // se livro c estiver marcado
  Begin
    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear;
    Dm.qryGenerico.SQL.Add('select livro_c, folha_c from configur');
    Dm.qryGenerico.Open;

    livro_c:= Dm.qryGenerico.FieldByName('livro_c').AsInteger;
    folha_c:= Dm.qryGenerico.FieldByName('folha_c').AsInteger;

    MaskEdit39.Text:= inttostr(livro_c);
    MaskEdit40.Text:= inttostr(folha_c);

    Dm.qryGenerico_Aux.Close;
    Dm.qryGenerico_Aux.SQL.Clear;
    Dm.qryGenerico_Aux.SQL.Add('update td set livro_reg = :livro_c, folha_reg = :folha_c, folha_reg_f_c = :folha_reg_f_c where p_auxiliar = '+QuotedStr(MaskEdit1.Text)+'');
    Dm.qryGenerico_Aux.ParamByName('livro_c').AsInteger  := livro_c;
    Dm.qryGenerico_Aux.ParamByName('folha_c').AsInteger  := folha_c;
    Dm.qryGenerico_Aux.ParamByName('folha_c_f').AsInteger:= folha_c + strtoint(MaskEdit8.Text);
    Dm.qryGenerico_Aux.ExecSQL;

    Dm.qryGenerico_Aux.Close;
    Dm.qryGenerico_Aux.SQL.Clear;
    Dm.qryGenerico_Aux.SQL.Add('update configur set livro_c = :livro_c, folha_c = :folha_c');
    Dm.qryGenerico_Aux.ParamByName('livro_c').AsInteger:= livro_c;
    Dm.qryGenerico_Aux.ParamByName('folha_c').AsInteger:= folha_c + strtoint(MaskEdit8.Text);
    Dm.qryGenerico_Aux.ExecSQL;
  End;
  
     }
end;

procedure TF_Exame.MaskEdit38KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    MaskEdit42.SetFocus;
  end;
end;

procedure TF_Exame.BitBtn9Click(Sender: TObject);
begin
{  Application.CreateForm(TF_DajeVias, F_DajeVias);
  F_DajeVias.TelaDeExame:= True;
  F_DajeVias.ShowModal;}
  PanViasAdicionais.Left:= 240;
  PanViasAdicionais.Top:= 0;
  PanViasAdicionais.Visible:= True;

  if (PanViasAdicionais.Visible) then
    MkSerieDaje.SetFocus;


  MostraDajesAdicionais(MaskEdit1.Text);
end;

procedure TF_Exame.BitBtn10Click(Sender: TObject);
begin
  PageControl1.ActivePage:= TabSheet1;
  Limpa_TelaPessoal(F_Exame);
  //GroupBox3.Enabled := False;
  GroupBox4.Enabled := True;
  Label26.Caption   := 'I';
  ComboBox1.SetFocus;
end;

procedure TF_Exame.BitBtn12Click(Sender: TObject);
begin
  PageControl1.ActivePage:= TabSheet1;
  //GroupBox3.Enabled := False;
  GroupBox4.Enabled := True;
  Label26.Caption   := 'C';
  combobox1.SetFocus;
end;

procedure TF_Exame.BitBtn11Click(Sender: TObject);
begin
  PageControl1.ActivePage:= TabSheet1;
  if (MessageBox(Handle, PChar('Confirma exclusão ?'), 'INCLUSÃO DE PARTES', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
  begin
    dm.qryGenerico.Close;
    dm.qryGenerico.SQL.Clear;
    dm.qryGenerico.SQL.Add('select * from td_pesso WHERE recno = '+QuotedStr(Dm.PessAux.FieldByName('recno').asString)+' ');
    dm.qryGenerico.Open;

    mudouTipoCPF   := Dm.qryGenerico.FieldByName('tip_doc1').AsString;
    mudouDocCPF    := Dm.qryGenerico.FieldByName('doc1').AsString;
    mudouNomeParte := Dm.qryGenerico.FieldByName('nome').AsString;
    mudouSituacao  := Ver_Situacao(Dm.qryGenerico.FieldByName('situacao').AsString, True);

    // aqui LOG

    Dm.Td_Pesso.Close;
    Dm.Td_Pesso.Sql.Clear;
    Dm.Td_Pesso.Sql.Add('DELETE FROM td_pesso');
    Dm.Td_Pesso.Sql.Add('WHERE');
    Dm.Td_Pesso.Sql.Add('recno = ' + Dm.PessAux.FieldByName('recno').asString);
    Dm.Td_Pesso.ExecSql;

    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Exclusão da Parte: '+mudouNomeParte+', '+mudouTipoCPF+': '+mudouDocCPF+', Situação: '+ mudouSituacao+', do banco de dados', MaskEdit1.Text);


    Dm.Td_Pesso.Close;
    Carrega_Pessoal(F_Exame, True);
  end;
end;

procedure TF_Exame.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePage:= TabSheet1;
  //Procura_Pessoal('doc1', TirarTudo(DM.PessAux.FieldByName('doc1').AsString, '.', '-', '/'));
  CarregarPartesDaGrid;
end;

procedure TF_Exame.MaskEdit42KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    if (MessageBox(Handle, PChar('Confirma correção dos dados do apresentante ?'), 'EXAME DE TÍTULOS', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin

      Dm.qryGenerico.Close;
      Dm.qryGenerico.Sql.Clear;
      Dm.qryGenerico.Sql.Add('SELECT a_nome, contato, a_telefone, obs_prov1, email_apresentante, a_pasta, data_documento');
      Dm.qryGenerico.Sql.Add('FROM td');
      Dm.qryGenerico.Sql.Add('WHERE');
      Dm.qryGenerico.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
      Dm.qryGenerico.Open;

      if Dm.qryGenerico.FieldByName('a_nome').asstring <> Trim(MaskEdit10.Text) then
      begin
        mudouParte:= Trim(MaskEdit10.Text);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Parte, foi alterado de: '+Dm.qryGenerico.FieldByName('a_nome').asstring+' para: '+mudouParte+'', MaskEdit1.Text);
      end;

      if Dm.qryGenerico.FieldByName('contato').asString <> Trim(MaskEdit4.Text) then
      begin
        mudouApresentante := Trim(MaskEdit4.Text);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Apresentante, foi alterado de: '+Dm.qryGenerico.FieldByName('contato').asString+' para: '+mudouApresentante+'', MaskEdit1.Text);
      end;

      if Dm.qryGenerico.FieldByName('a_telefone').asstring <> Trim(MaskEdit15.Text) then
      begin
        mudouTelefone := Trim(MaskEdit15.Text);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Telefone, foi alterado de: '+Dm.qryGenerico.FieldByName('a_telefone').asstring+' para: '+mudouTelefone+'', MaskEdit1.Text);
      end;

      if Dm.qryGenerico.FieldByName('obs_prov1').asstring <> Trim(MaskEdit32.Text) Then
      begin
        mudouObservacao:= Trim(MaskEdit32.Text);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Obs. foi alterado de: '+Dm.qryGenerico.FieldByName('obs_prov1').asstring+' para: '+mudouObservacao+'', MaskEdit1.Text);
      end;

      if UpperCase(Dm.qryGenerico.FieldByName('email_apresentante').asstring) <> UpperCase(Trim(MkEmail.Text)) Then
      begin
        mudouEmail := Trim(MkEmail.Text);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Email, foi alterado de: '+Dm.qryGenerico.FieldByName('email_apresentante').asstring+' para: '+mudouEmail+'', MaskEdit1.Text);
      end;

      if Dm.qryGenerico.FieldByName('a_pasta').asstring <> Trim(MaskEdit41.Text) Then
      begin
        mudouPasta:= MaskEdit41.Text;
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Pasta, foi alterado de: '+Dm.qryGenerico.FieldByName('a_pasta').asstring+' para: '+mudouPasta+'', MaskEdit1.Text);
      end;

      if (Dm.qryGenerico.FieldByName('data_documento').asstring <> MaskEdit42.Text) and (Dm.qryGenerico.FieldByName('data_documento').asstring <> '') Then
      begin
        mudouDataDoc:= MaskEdit42.Text;
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Data do Documento, foi alterado de: '+Dm.qryGenerico.FieldByName('data_documento').asstring+' para: '+mudouDataDoc+'', MaskEdit1.Text);
      end;

      Dm.TD.Close;
      Dm.TD.Sql.Clear;
      Dm.TD.Sql.Add('SELECT *');
      Dm.TD.Sql.Add('FROM td');
      Dm.TD.Sql.Add('WHERE');
      Dm.TD.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
      Dm.TD.Open;
      if (Dm.TD.RecordCount <> 0) then
      begin
        Dm.TD.Edit;
        Dm.TD.FieldByName('a_nome').asstring     := Trim(MaskEdit10.Text);
        Dm.TD.FieldByName('contato').asString    := Trim(MaskEdit4.Text);
        Dm.TD.FieldByName('a_telefone').asstring := Trim(MaskEdit15.Text);
        Dm.Td.FieldByName('celular').asstring    := Trim(MaskEdit45.Text);
        Dm.TD.FieldByName('obs_prov1').asstring        := Trim(MaskEdit32.Text);
        Dm.Td.FieldByName('email_apresentante').asstring := Trim(MkEmail.Text);
        Dm.Td.FieldByName('a_pasta').asstring := Trim(MaskEdit41.Text);
        if MaskEdit42.Text <> '  /  /    ' Then
          Dm.Td.FieldByName('data_documento').asstring := MaskEdit42.Text;
        Dm.TD.Post;   
      end;
      Dm.TD.Close;
    end
    else
    Carrega(F_Exame, True);
    //Panel4.Enabled := False;
  end;

end;

procedure TF_Exame.AlteraAsPartesEmTdCertidao;
begin
//
end;

procedure TF_Exame.SalvaAsPartesEmTdCertidao;
begin
  if (Label83.Caption <> '') or (Label83.Caption <> '.') then
  Begin
    Dm.Edita_Retro.Close;
    Dm.Edita_Retro.SQL.Clear;
    Dm.Edita_Retro.SQL.Add('DELETE FROM td_cert WHERE p_auxiliar = :p_auxiliar');
    Dm.Edita_Retro.ParamByName('p_auxiliar').AsString:= MaskEdit1.Text;
    Dm.Edita_Retro.ExecSQL;
    Atualiza_TDCert(Label37.caption, MaskEdit1.Text);
  End
end;

procedure TF_Exame.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit4.setfocus;
end;

procedure TF_Exame.SalvaAsPartesEmTdPesso;
begin
  begin
    if (Trim(ComboBox7.Text) = '') then
    begin
      ShowMessage('OBRIGATÓRIO COLOCAR SITUAÇÃO.');
      Combobox7.SetFocus;
      Exit;
    end;
    if (Trim(MaskEdit17.Text) = '') then
    begin
      ShowMessage('OBRIGATÓRIO DIGITAR O NOME DA PARTE.');
      MaskEdit17.SetFocus;
      Exit;
    end;
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
        try
        Dm.Td_Pesso.Append;
        Dm.Td_Pesso.FieldByName('data').asString           := Label37.Caption;
        Dm.Td_Pesso.FieldByName('tipo').asString           := tipo_;
        Dm.Td_Pesso.FieldByName('p_auxiliar').asString     := Trim(MaskEdit1.Text);
        Dm.Td_Pesso.FieldByName('protocolo').asString      := Trim(Label29.Caption);
        Dm.Td_Pesso.FieldByName('registro').asString       := Trim(Label29.Caption);
        Dm.Td_Pesso.FieldByName('nome').asString           := Trim(MaskEdit17.Text);
        Dm.Td_Pesso.FieldByName('tip_doc1').asString       := Trim(ComboBox1.Text);
        Dm.Td_Pesso.FieldByName('doc1').asString           := TirarTudo(MaskEdit27.Text, '.', '-', '/');
        Dm.Td_Pesso.FieldByName('tip_doc2').asString       := Trim(ComboBox2.Text);
        Dm.Td_Pesso.FieldByName('doc2').asString           := Trim(MaskEdit28.Text);
        Dm.Td_Pesso.FieldByName('tipoEndereco').asString   := Trim(cbTipoEndereco.Text);
        Dm.Td_Pesso.FieldByName('endereco').asString       := Trim(MaskEdit18.Text);
        Dm.Td_Pesso.FieldByName('numero').asString         := Trim(MaskEdit3.Text);
        Dm.Td_Pesso.FieldByName('bairro').asString         := Trim(MaskEdit19.Text);
        Dm.Td_Pesso.FieldByName('cidade').asString         := Trim(MaskEdit20.Text);
        Dm.Td_Pesso.FieldByName('estado').asString         := Trim(MaskEdit21.Text);
        Dm.Td_Pesso.FieldByName('cep').asString            := TirarTudo(MaskEdit22.Text, '-','','');
        Dm.Td_Pesso.FieldByName('situacao').asString       := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));
        Dm.Td_Pesso.FieldByName('complem').asString        := Trim(MaskEdit25.Text);
        Dm.Td_Pesso.FieldByName('profissao').asString      := Trim(MaskEdit36.Text);
        Dm.Td_Pesso.FieldByName('nacionalidade').asString  := Trim(MaskEdit37.Text);
        Dm.Td_Pesso.FieldByName('estcivil').asString       := Trim(ComboBox9.Text);

        If CheckBox11.Checked then  ///// FLAG PRA DEFINIR SE VAI OU NAO PARA O SINTER -- JOSE
          Dm.Td_Pesso.FieldByName('model').asString       := 'S'
        Else Dm.Td_Pesso.FieldByName('model').asString       := 'N';

        Dm.Td_Pesso.Post;

        Except
          showMessage('Erro ao gravar na TD_PESSO');
        eND;

        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Foi incluído a parte: '+Trim(MaskEdit17.Text)+', Documento: '+Trim(ComboBox1.Text)+'-'+TirarTudo(MaskEdit27.Text, '.', '-', '/')+', Situação: '+ComboBox7.Text, MaskEdit1.Text);

        if (Label83.Caption <> '') or (Label83.Caption <> '.') Then
          SalvaAsPartesEmTdCertidao;
        Dm.Td_Pesso.Close;
        Carrega_Pessoal(F_Exame, True);
        Application.MessageBox('Registro salvo com sucesso!' , 'Mensagem do Sistema', mb_ok);

        if (MessageBox(Handle, PChar('Continuar inclusão ?'), 'INCLUSÃO DE PARTES', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
        begin
          Label26.Caption := 'I';
          Limpa_TelaPessoal(F_Exame);
          ComBoBox1.SetFocus;
        end
        else
        begin
            Label26.Caption   := 'Label26';
            GroupBox3.Enabled := True;
            panel4.Enabled    := true;
            if (Not(PermitirEdicaoDasPartes)) Then
              GroupBox4.Enabled := false
            else
            GroupBox4.Enabled := True;

            //DbGrid1.SetFocus;
        end;
      end
      else
      begin
        Carrega_Pessoal(F_Exame, False);
        Label26.Caption   := 'Label26';
        GroupBox3.Enabled := True;
        panel4.Enabled    := true;
        if (Not(PermitirEdicaoDasPartes)) Then
          GroupBox4.Enabled := false
        else
        GroupBox4.Enabled := True;
        //DbGrid1.SetFocus;
      end;
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

          if Dm.Td_Pesso.FieldByName('nome').asString <> Trim(MaskEdit17.Text) then
          begin
            mudouNomeParte:= MaskEdit17.Text;
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: F => Nome, foi alterado de: '+Dm.Td_Pesso.FieldByName('nome').asString+' para: '+mudouNomeParte+'', MaskEdit1.Text);
          end;

          if (Dm.Td_Pesso.FieldByName('tip_doc1').asString <> Trim(ComboBox1.Text)) or (Dm.Td_Pesso.FieldByName('doc1').asString <> TirarTudo(MaskEdit27.Text, '.', '-', '/'))then
          begin
            mudouDocCPF:= ComboBox1.Text + ': '+TirarTudo(MaskEdit27.Text, '.', '-', '/');
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: CPF/CNPJ, foi alterado de: '+Dm.Td_Pesso.FieldByName('tip_doc1').asString+': '+Dm.Td_Pesso.FieldByName('doc1').asString+' para: '+mudouDocCPF+'', MaskEdit1.Text);
          end;

          if (Dm.Td_Pesso.FieldByName('tip_doc2').asString <> Trim(ComboBox2.Text)) or (Dm.Td_Pesso.FieldByName('doc2').asString <> MaskEdit28.Text) then
          begin
            mudouTipoRG:= ComboBox2.Text + ': '+TirarTudo(MaskEdit28.Text, '.', '-', '/');
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: RG, foi alterado de: '+Dm.Td_Pesso.FieldByName('tip_doc2').asString+': '+Dm.Td_Pesso.FieldByName('doc2').asString+' para: '+mudouTipoRG+'', MaskEdit1.Text);
          end;

          if Dm.Td_Pesso.FieldByName('endereco').asString <> Trim(MaskEdit18.Text) then
          begin
            mudouEndereco:= Trim(MaskEdit18.Text);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Endereço, foi alterado de: '+Dm.Td_Pesso.FieldByName('endereco').asString+' para: '+mudouEndereco+'', MaskEdit1.Text);
          end;

          if Dm.Td_Pesso.FieldByName('tipoEndereco').asString <> Trim(cbTipoEndereco.Text) then
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Endereço, foi alterado de: '+Dm.Td_Pesso.FieldByName('tipoEndereco').asString+' para: '+cbTipoEndereco.Text+'', MaskEdit1.Text);

          if Dm.Td_Pesso.FieldByName('numero').asString <> Trim(MaskEdit3.Text) then
          begin
            mudouNumero:= Trim(MaskEdit18.Text);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Número, foi alterado de: '+Dm.Td_Pesso.FieldByName('numero').asString+' para: '+mudouNumero+'', MaskEdit1.Text);
          end;

          if Dm.Td_Pesso.FieldByName('complem').asString <> Trim(MaskEdit25.Text) then
          begin
            mudouComplem:= Trim(MaskEdit25.Text);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Complem., foi alterado de: '+Dm.Td_Pesso.FieldByName('complem').asString+' para: '+mudouComplem+'', MaskEdit1.Text);
          end;

          if Dm.Td_Pesso.FieldByName('situacao').asString <> Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50))) then
          begin
            mudouSituacao:= Trim(ComboBox7.Text);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Situação., foi alterado de: '+Ver_Situacao_RetornaTEXTO(Dm.Td_Pesso.FieldByName('situacao').asString)+' para: '+mudouSituacao+'', MaskEdit1.Text);
          end;

          if Dm.Td_Pesso.FieldByName('cep').asString <> TirarTudo(MaskEdit22.Text, '.', '-', '/') then
          begin
            mudouCEP:= Trim(MaskEdit22.Text);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: CEP, foi alterado de: '+Dm.Td_Pesso.FieldByName('cep').asString+' para: '+mudouCEP+'', MaskEdit1.Text);
          end;

          if Dm.Td_Pesso.FieldByName('bairro').asString <> Trim(MaskEdit19.Text) then
          begin
            mudouBairro:= Trim(MaskEdit19.Text);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Bairro, foi alterado de: '+Dm.Td_Pesso.FieldByName('bairro').asString+' para: '+mudouBairro+'', MaskEdit1.Text);
          end;

          if Dm.Td_Pesso.FieldByName('cidade').asString <> Trim(MaskEdit20.Text) then
          begin
            mudouCidade:= Trim(MaskEdit20.Text);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Cidade, foi alterado de: '+Dm.Td_Pesso.FieldByName('cidade').asString+' para: '+mudouCidade+'', MaskEdit1.Text);
          end;

          if Dm.Td_Pesso.FieldByName('estado').asString <> Trim(MaskEdit21.Text) then
          begin
            mudouEstado:= Trim(MaskEdit21.Text);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Estado, foi alterado de: '+Dm.Td_Pesso.FieldByName('estado').asString+' para: '+mudouEstado+'', MaskEdit1.Text);
          end;

          if Dm.Td_Pesso.FieldByName('estcivil').asString <> Trim(ComboBox9.Text) then
          begin
            mudouEstadoCivil:= Trim(ComboBox9.Text);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Estado Civil, foi alterado de: '+Dm.Td_Pesso.FieldByName('estcivil').asString+' para: '+mudouEstadoCivil+'', MaskEdit1.Text);
          end;

          if Dm.Td_Pesso.FieldByName('profissao').asString <> Trim(MaskEdit36.Text) then
          begin
            mudouProfissao:= Trim(ComboBox9.Text);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Profissão, foi alterado de: '+Dm.Td_Pesso.FieldByName('profissao').asString+' para: '+mudouProfissao+'', MaskEdit1.Text);
          end;

          if Dm.Td_Pesso.FieldByName('nacionalidade').asString <> Trim(MaskEdit37.Text) then
          begin
            mudouNacionalidade:= Trim(MaskEdit37.Text);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Nacionalidade, foi alterado de: '+Dm.Td_Pesso.FieldByName('profissao').asString+' para: '+mudouNacionalidade+'', MaskEdit1.Text);
          end;

        try
          Dm.Td_Pesso.Edit;
          Dm.Td_Pesso.FieldByName('data').asString          := Label37.Caption;
          Dm.Td_Pesso.FieldByName('tipo').asString          := tipo_;
          Dm.Td_Pesso.FieldByName('p_auxiliar').asString    := Trim(MaskEdit1.Text);
          Dm.Td_Pesso.FieldByName('protocolo').asString     := Trim(Label29.Caption);
          Dm.Td_Pesso.FieldByName('registro').asString      := Trim(Label29.Caption);
          Dm.Td_Pesso.FieldByName('nome').asString          := Trim(MaskEdit17.Text);
          Dm.Td_Pesso.FieldByName('tip_doc1').asString      := Trim(ComboBox1.Text);
          Dm.Td_Pesso.FieldByName('doc1').asString          := TirarTudo(MaskEdit27.Text, '.', '-', '/');
          Dm.Td_Pesso.FieldByName('tip_doc2').asString      := Trim(ComboBox2.Text);
          Dm.Td_Pesso.FieldByName('doc2').asString          := Trim(MaskEdit28.Text);
          Dm.Td_Pesso.FieldByName('tipoEndereco').asString  := Trim(cbTipoEndereco.Text);
          Dm.Td_Pesso.FieldByName('endereco').asString      := Trim(MaskEdit18.Text);
          Dm.Td_Pesso.FieldByName('numero').asString        := Trim(MaskEdit3.Text);
          Dm.Td_Pesso.FieldByName('bairro').asString        := Trim(MaskEdit19.Text);
          Dm.Td_Pesso.FieldByName('cidade').asString        := Trim(MaskEdit20.Text);
          Dm.Td_Pesso.FieldByName('estado').asString        := Trim(MaskEdit21.Text);
          Dm.Td_Pesso.FieldByName('cep').asString           := TirarTudo(MaskEdit22.Text, '-','','');
          Dm.Td_Pesso.FieldByName('situacao').asString      := Ver_Situacao1(Trim(copy(ComboBox7.Text, 1, 50)));
          Dm.Td_Pesso.FieldByName('complem').asString       := Trim(MaskEdit25.Text);
          Dm.Td_Pesso.FieldByName('profissao').asString     := Trim(MaskEdit36.Text);
          Dm.Td_Pesso.FieldByName('nacionalidade').asString := Trim(MaskEdit37.Text);
          Dm.Td_Pesso.FieldByName('estcivil').asString      := Trim(ComboBox9.Text);

          If CheckBox11.Checked then  ///// FLAG PRA DEFINIR SE VAI OU NAO PARA O SINTER -- JOSE
            Dm.Td_Pesso.FieldByName('model').asString    := 'S'
          Else Dm.Td_Pesso.FieldByName('model').asString := 'N';

          Dm.Td_Pesso.Post;
        Except
          showMessage('Erro ao gravar edição na TD_PESSO');
        eND;

          if (Label83.Caption <> '') or (Label83.Caption <> '.') Then
            SalvaAsPartesEmTdCertidao;

          Dm.Td_Pesso.Close;
          Carrega_Pessoal(F_Exame, True);
          Application.MessageBox('Registro atualizado com sucesso!' , 'Mensagem do Sistema', mb_ok);
        end;
        Label26.Caption   := 'Label26';
        GroupBox3.Enabled := True;
        panel4.Enabled    := true;

        if (Not(PermitirEdicaoDasPartes)) Then
          GroupBox4.Enabled := false
        else
        GroupBox4.Enabled := True;   
        //DbGrid1.SetFocus;
      end;
    end;
  End
end;

procedure TF_Exame.BitBtn13Click(Sender: TObject);
begin
  SalvaAsPartesEmTdPesso;
end;

procedure TF_Exame.MostraDajesAdicionais(Codigo: String);
begin
  qryDajesAdicionais.Close;
  qryDajesAdicionais.ParamByName('p_auxiliar').AsString:= MaskEdit1.Text;
  qryDajesAdicionais.Open;
end;

procedure TF_Exame.MaskEdit4Exit(Sender: TObject);
begin
{  if MaskEdit4.Text <> '' Then
  Begin
    dm.qryGenerico.Close;
    dm.qryGenerico.SQL.Clear;
    dm.qryGenerico.SQL.Add('SELECT * FROM td Where contato = '+QuotedStr(MaskEdit4.Text)+'');
    dm.qryGenerico.Open;
    dm.qryGenerico.Last;

    if Dm.qryGenerico.FieldByName('contato').asstring <> '' Then
    Begin
      maskedit10.text:= Dm.qryGenerico.FieldByName('a_nome').asstring;
      maskedit15.text:= Dm.qryGenerico.FieldByName('a_telefone').asstring;
      MaskEdit41.Text:= Dm.qryGenerico.FieldByName('a_cpff').asstring;
      MaskEdit41.Text:= Dm.qryGenerico.FieldByName('a_pasta').asstring;
    End;
  End;  }

end;

procedure TF_Exame.BitBtn14Click(Sender: TObject);
begin
  dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('DELETE FROM selos where id = '+QuotedStr(qryDajesAdicionaisid.AsString)+' ');
  dm.qryGenerico.ExecSQL;

  MostraDajesAdicionais(MaskEdit1.Text);

end;

procedure TF_Exame.MaskEdit43Exit(Sender: TObject);
begin
  ValidaECalculaTabelas;
end;

procedure TF_Exame.MaskEdit43KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  Begin
    MaskEdit6.SetFocus;
  End;

end;

procedure TF_Exame.Label101Click(Sender: TObject);
begin
  if (_numero_daje <> '') Then
  Begin
    if application.messagebox(pchar('Iniciar Atualização dos DAJE´s ?'),'Confirmação',mb_iconquestion + mb_yesno) = id_yes then
    Begin
      if (_iddaje_tj = '') or (_iddaje_tj = '0') Then
         _iddaje_tj:= id_eselo;
      If ConsultarDaje(_iddaje_tj, StrZero(_serie_daje, 3), StrZero(_numero_daje, 6), _iddaje_tj) then
      Begin
        If (_StatusDaje = 'Pago') or (_StatusDaje = 'Isento') then
        Begin
          Dm.ArqAux2.Close;
          Dm.ArqAux2.Sql.Clear;
          Dm.ArqAux2.Sql.Add('update daje set status = ' + QuotedStr(_StatusDaje) + ' where iddaje_tj = '+QuotedStr(_iddaje_tj)+' and serie_daje = '+QuotedStr(_serie_daje)+' and numero_daje = '+QuotedStr(_numero_daje)+' ');
          Try
            Dm.ArqAux2.ExecSql;
          Except
          End;
        End;
        Dm.qryGenerico.Close;
        Dm.qryGenerico.SQL.Clear;
        Dm.qryGenerico.SQL.Add('select * from daje where iddaje_tj = '+QuotedStr(_iddaje_tj)+' and serie_daje = '+QuotedStr(_serie_daje)+' and numero_daje = '+QuotedStr(_numero_daje)+' ');
        Dm.qryGenerico.Open;
        Label72.Caption := Dm.qryGenerico.FieldByName('serie_daje').AsString +'  ' + Strzero(Dm.qryGenerico.FieldByName('numero_daje').AsString, 6) + '  '+Dm.qryGenerico.FieldByName('status').AsString;
      End;
      ShowMessage('Daje atualizado com sucesso.');
    End;
  End
  Else
  Begin
    ShowMessage('Não existe daje para ser atualizado!');
  End;

end;

procedure TF_Exame.FormShow(Sender: TObject);
begin
  if (Not(ModalidadeAverbacaoCapital)) Then
  Begin
    Label87.Visible:=False;
    EdAverbacao.Visible:= False;
    Label91.Visible:= False;
    MaskEdit43.Visible:= False;
  End;
  {if
    (F_Menu.Label39.Caption = '28.287.131/0001-10') or (F_Menu.Label39.Caption = '28287131000110') or
    (F_Menu.Label39.Caption = '28.508.639/0001-00') or (F_Menu.Label39.Caption = '28508639000100') or
    (F_Menu.Label39.Caption = '27.215.296/0001-14') or (F_Menu.Label39.Caption = '27215296000114') or
    (F_Menu.Label39.Caption = '29.603.272/0001-68') or (F_Menu.Label39.Caption = '29603272000168') or
    (F_Menu.Label39.Caption = '01.221.489/0001-94') or (F_Menu.Label39.Caption = '01221489000194') or
    (F_Menu.Label39.Caption = '28.664.048/0001-13') or (F_Menu.Label39.Caption = '28664048000113') or
    (F_Menu.Label39.Caption = '27.400.369/0001-48') or (F_Menu.Label39.Caption = '27400369000148') or
    (F_Menu.Label39.Caption = '27.251.207/0001-95') or (F_Menu.Label39.Caption = '27251207000195') or
    (F_Menu.Label39.Caption = '29.649.551/0001-62') or (F_Menu.Label39.Caption = '29649551000162') or
    (F_Menu.Label39.Caption = '28.344.918/0001-77') or (F_Menu.Label39.Caption = '28344918000177') or
    (F_Menu.Label39.Caption = '27.146.890/0001-09') or (F_Menu.Label39.Caption = '27146890000109') or
    (F_Menu.Label39.Caption = '27.282.471/0001-96') or (F_Menu.Label39.Caption = '27282471000196')}
  if (F_Menu.livroAutomatico)then // Trabalha com livro automatico
  begin
    Label73.Caption:= 'Pag. Reg:';
    Label96.Visible:= True;
    MaskEdit44.Visible:= True;
  end
  else
  begin
    Label96.Visible:= False;
    MaskEdit44.Visible:= False;
    Label73.Caption:= 'Qtd Vias:';
  end;

  if (F_Menu.Label39.Caption = '27.251.207/0001-95') or (F_Menu.Label39.Caption = '27251207000195') then
  begin
    Label8.Visible   := true;
    MaskEdit8.Visible:= true;
  End;

end;

procedure TF_Exame.CurrencyEdit1Exit(Sender: TObject);
begin
  if (Not(ModalidadeAverbacaoCapital)) Then
  Begin
    ValidaECalculaTabelas;
  End;
end;

procedure TF_Exame.ValidaECalculaTabelas;
var
    qtdPagina: Integer;
    valorDoDajeConformeTabela: Currency;
    carcter: String;
begin
  calc_pag   := 0.00;
  calc_emol  := 0.00;
  calc_vfetj := 0.00;
  calc_total := 0.00;

  If (Copy(ComboBox6.Text,1,2) = '01') then
  begin
    If MaskEdit2.Text <> '' then
      dat_calc := QuotedStr(ConvData(MaskEdit2.Text))
    Else
    dat_calc := QuotedStr(ConvData(DateToStr(now)));

    DM.Tab_Atos.RequestLive := False;
    DM.Tab_Atos.Close;
    DM.Tab_Atos.Sql.Clear;
    DM.Tab_Atos.Sql.Add('select * from tab_ato2 where YEAR(data) = YEAR('+ dat_calc +') ');
    DM.Tab_Atos.Sql.Add('group by data order by cod_ato, data asc');
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
      DM.Tab_Atos.Sql.Add('ORDER BY de, ate ');
      DM.Tab_Atos.Open;

      DM.Tab_Atos.First;
      While (NOT DM.Tab_Atos.Eof) do
      Begin
        If (CurrencyEdit1.Value >= DM.Tab_Atos.FieldByName('de').ASCurrency) AND (CurrencyEdit1.Value <= DM.Tab_Atos.FieldByName('ate').ASCurrency) then
        begin
          calc_emol  := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency;
          calc_vfetj := DM.Tab_Atos.FieldByName('taxa').ASCurrency;
          calc_total := DM.Tab_Atos.FieldByName('total').ASCurrency;
          CurrencyEdit2.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;
        end;
        DM.Tab_Atos.Next;
      end;
    end
    else
    if copy(ComboBox5.Text,1,3) = '4.2' then   // NOVO
    begin
      DM.Tab_Atos.Close;
      DM.Tab_Atos.Sql.Clear;
      DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
      DM.Tab_Atos.Sql.Add('     YEAR(data) = YEAR('+ QuotedStr(ConvData(dat)) +') ');
      DM.Tab_Atos.Sql.Add(' AND tabela = ' + QuotedStr(copy(ComboBox5.Text,1,1)));
      DM.Tab_Atos.Sql.Add(' AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)));
      DM.Tab_Atos.Sql.Add(' AND subitem = ' + QuotedStr('A'));
      DM.Tab_Atos.Open;

      calc_emol  := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency;
      calc_vfetj := DM.Tab_Atos.FieldByName('taxa').ASCurrency;
      calc_total := DM.Tab_Atos.FieldByName('total').ASCurrency;



      if StrToInt(MaskEdit8.Text) > 0 then
      begin

        DM.Tab_Atos.Close;
        DM.Tab_Atos.Sql.Clear;
        DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
        DM.Tab_Atos.Sql.Add('     YEAR(data) = YEAR('+ QuotedStr(ConvData(dat)) +') ');
        DM.Tab_Atos.Sql.Add(' AND tabela = ' + QuotedStr(copy(ComboBox5.Text,1,1)));
        DM.Tab_Atos.Sql.Add(' AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)));
        DM.Tab_Atos.Sql.Add(' AND subitem = ' + QuotedStr('B'));
        DM.Tab_Atos.Open;

        calc_emol  := calc_emol  + (DM.Tab_Atos.FieldByName('valor_tab').ASCurrency * StrToInt(MaskEdit8.Text));
        calc_vfetj := calc_vfetj + (DM.Tab_Atos.FieldByName('taxa').ASCurrency * StrToInt(MaskEdit8.Text));
        calc_total := calc_total + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit8.Text));
        calc_pag   := DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit8.Text);

        CurrencyEdit2.Value := calc_total;
      end
      Else
      CurrencyEdit2.Value := calc_total;
    End
    Else
    begin
      DM.Tab_Atos.Close;
      DM.Tab_Atos.Sql.Clear;
      DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
      DM.Tab_Atos.Sql.Add('     YEAR(data) = YEAR('+ QuotedStr(ConvData(dat)) +') ');
      DM.Tab_Atos.Sql.Add(' AND tabela = ' + QuotedStr(copy(ComboBox5.Text,1,1)));
      DM.Tab_Atos.Sql.Add(' AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)));

      if (copy(ComboBox5.Text,4,1) = '.') Then
        DM.Tab_Atos.Sql.Add(' AND subitem = ' + QuotedStr(copy(ComboBox5.Text,5,1)));
      //else
      //DM.Tab_Atos.Sql.Add(' AND subitem = "" ');


      //DM.Tab_Atos.Sql.Add(' AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)) +' order by cod_ato, data asc');
      //DM.Tab_Atos.Sql.Add(' AND ((subitem = "A") OR (subitem = "") OR (subitem IS NULL)) AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)) +' order by cod_ato, data asc');

      DM.Tab_Atos.Open;

      calc_emol  := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency;
      calc_vfetj := DM.Tab_Atos.FieldByName('taxa').ASCurrency;
      calc_total := DM.Tab_Atos.FieldByName('total').ASCurrency;

      CurrencyEdit2.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;
     //********************Rotina abaixo substituida pela que se encontra acima 0***********************************//
      {DM.Tab_Atos.Close;
      DM.Tab_Atos.Sql.Clear;
      DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
      DM.Tab_Atos.Sql.Add('     YEAR(data) = YEAR('+ QuotedStr(ConvData(dat)) +') ');
      DM.Tab_Atos.Sql.Add(' AND tabela = ' + QuotedStr(copy(ComboBox5.Text,1,1)));
      DM.Tab_Atos.Sql.Add(' AND ate > 0');
      DM.Tab_Atos.Sql.Add(' AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)) +' order by cod_ato, data asc');
      DM.Tab_Atos.Open;


      DM.Tab_Atos.First;
      While (NOT DM.Tab_Atos.Eof) do
      Begin
        If (CurrencyEdit1.Value >= DM.Tab_Atos.FieldByName('de').ASCurrency) AND (CurrencyEdit1.Value <= DM.Tab_Atos.FieldByName('ate').ASCurrency) then
        begin
          calc_emol  := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency;
          calc_vfetj := DM.Tab_Atos.FieldByName('taxa').ASCurrency;
          calc_total := DM.Tab_Atos.FieldByName('total').ASCurrency;
          CurrencyEdit2.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;
        end;
        DM.Tab_Atos.Next;
      end; }
      //********************Rotina abaixo substituida pela que se encontra acima 0***********************************//

    //end;

  //else CurrencyEdit2.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;

  if StrToInt(MaskEdit8.Text) > 0 then
  begin
    DM.Tab_Atos.Close;
    DM.Tab_Atos.Sql.Clear;
    DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
    DM.Tab_Atos.Sql.Add('     YEAR(data) = YEAR('+ QuotedStr(ConvData(dat))+ ')');
    DM.Tab_Atos.Sql.Add(' AND tabela = "4"');
    DM.Tab_Atos.Sql.Add(' AND subitem = "B" AND  item_tab = '+QuotedStr(copy(ComboBox5.Text,3,1))+'');
    DM.Tab_Atos.Sql.Add(' order by cod_ato, data asc');
    DM.Tab_Atos.Open;

    calc_emol  := calc_emol  + (DM.Tab_Atos.FieldByName('valor_tab').ASCurrency * StrToInt(MaskEdit8.Text));
    calc_vfetj := calc_vfetj + (DM.Tab_Atos.FieldByName('taxa').ASCurrency * StrToInt(MaskEdit8.Text));
    calc_total := calc_total + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit8.Text));
    calc_pag   := DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit8.Text);

    CurrencyEdit2.Value := calc_total;

    DM.qryGenerico_Aux.Close;
    DM.qryGenerico_Aux.Sql.Clear;
    DM.qryGenerico_Aux.Sql.Add('SELECT * FROM td WHERE p_auxiliar = ' + QuotedStr(MaskEdit1.Text));
    DM.qryGenerico_Aux.Open;


    DM.qryGenerico.Close;
    DM.qryGenerico.Sql.Clear;
    DM.qryGenerico.Sql.Add('SELECT * FROM daje WHERE serie_daje = ' + QuotedStr(Dm.qryGenerico_Aux.FieldByName('serie_daje').AsString));
    DM.qryGenerico.Sql.Add(' and numero_daje = ' + QuotedStr(Dm.qryGenerico_Aux.FieldByName('daje').AsString));
    DM.qryGenerico.Open;

    {qtdPagina:= DM.qryGenerico.FieldByName('pags').AsInteger;
    valorDoDajeConformeTabela:= DM.qryGenerico.FieldByName('vr_daje').AsCurrency;

    CurrencyEdit2.Value := valorDoDajeConformeTabela - (DM.Tab_Atos.FieldByName('total').ASCurrency * qtdPagina);

    CurrencyEdit2.Value := CurrencyEdit2.Value + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit8.Text));
    CurrencyEdit3.Value:= CurrencyEdit2.Value; }

//  calc_total := calc_total + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit8.Text));
  end;
end;
end
Else
begin
      DM.Tab_Atos.Close;
      DM.Tab_Atos.Sql.Clear;
      DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
      DM.Tab_Atos.Sql.Add('     YEAR(data) = YEAR('+ QuotedStr(ConvData(dat)) +') ');
      DM.Tab_Atos.Sql.Add(' AND tabela = ' + QuotedStr(copy(ComboBox5.Text,1,1)));
      DM.Tab_Atos.Sql.Add(' AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)));

      if (copy(ComboBox5.Text,4,1) = '.') Then
        DM.Tab_Atos.Sql.Add(' AND subitem = ' + QuotedStr(copy(ComboBox5.Text,5,1)))
      else
        DM.Tab_Atos.Sql.Add(' AND subitem = "" ');


      //DM.Tab_Atos.Sql.Add(' AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)) +' order by cod_ato, data asc');
      //DM.Tab_Atos.Sql.Add(' AND ((subitem = "A") OR (subitem = "") OR (subitem IS NULL)) AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)) +' order by cod_ato, data asc');

      DM.Tab_Atos.Open;

      calc_emol  := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency;
      calc_vfetj := DM.Tab_Atos.FieldByName('taxa').ASCurrency;
      calc_total := DM.Tab_Atos.FieldByName('total').ASCurrency;

      CurrencyEdit2.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;
end;
{  if StrToInt(MaskEdit35.Text) > 0 then
  begin
    DM.Tab_Atos.Close;
    DM.Tab_Atos.Sql.Clear;
    DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
    DM.Tab_Atos.Sql.Add('     data = '   + QuotedStr(ConvData(dat)));
    DM.Tab_Atos.Sql.Add(' AND tabela = "4"');
    DM.Tab_Atos.Sql.Add(' AND item_tab = "9"');
    DM.Tab_Atos.Sql.Add(' AND subitem = "A"');
    DM.Tab_Atos.Open;

    CurrencyEdit2.Value := CurrencyEdit2.Value + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit35.Text));
//  calc_total := calc_total + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit35.Text));
  end;}


  If (Not CheckBox8.Checked) AND (Not CheckBox12.Checked) then
  Begin
    ShowMessage('Por favor preencher o Livro "B" ou "F"');
    Exit;
  End;


  if (MessageBox(Handle, PChar('Dados Ok ?'), 'EXAME DE TÍTULOS', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
  begin

    dm.Natureza.Close;
    dm.Natureza.sql.Clear;
    dm.natureza.SQL.add('select * from natureza where natureza = "' + trim(copy(ComboBox3.Text, 1, 50)) + '"');
    dm.natureza.Open;


    dm.qryGenerico.Close;
    dm.qryGenerico.sql.Clear;
    dm.qryGenerico.SQL.add('select * from td where p_auxiliar = '+QuotedStr(MaskEdit1.Text)+'');
    dm.qryGenerico.Open;

    if dm.qryGenerico.FieldByName('valor_base').AsString <> FloatToStr(CurrencyEdit1.Value) then
    begin
      mudouvalor_base:= FloatToStr(CurrencyEdit1.Value);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Valor Base, foi alterado de: '+Dm.qryGenerico.FieldByName('valor_base').asString+' para: '+mudouvalor_base+'', MaskEdit1.Text);
    end;

    if dm.qryGenerico.FieldByName('pag_adic').AsString <> MaskEdit8.Text then
    begin
      mudoupag_adic:= MaskEdit8.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Qtd Pag., foi alterado de: '+Dm.qryGenerico.FieldByName('pag_adic').asString+' para: '+mudoupag_adic+'', MaskEdit1.Text);
    end;

    if dm.qryGenerico.FieldByName('vias_adc').AsString <> MaskEdit35.Text then
    begin
      mudouvias_adc:= MaskEdit35.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Qtd Vias, foi alterado de: '+Dm.qryGenerico.FieldByName('vias_adc').asString+' para: '+mudouvias_adc+'', MaskEdit1.Text);
    end;

    if dm.qryGenerico.FieldByName('qtdpost').AsString <> MaskEdit38.Text then
    begin
      mudouqtdpost:= MaskEdit38.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Postagem, foi alterado de: '+Dm.qryGenerico.FieldByName('qtdpost').asString+' para: '+mudouqtdpost+'', MaskEdit1.Text);
    end;

    if dm.qryGenerico.FieldByName('natureza').AsString <> MaskEdit6.Text then
    begin
      mudouNatureza:= dm.Natureza.FieldByName('natureza').AsString;

      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Natureza, foi alterado de: '+Ver_Natureza(dm.qryGenerico.FieldByName('natureza').AsString, False)+' para: '+mudouNatureza+'', MaskEdit1.Text);
    end;

    if dm.qryGenerico.FieldByName('tabela').AsString <> Trim(Copy(ComboBox5.Text, 1,3)) then
    begin
      mudoutabela:= ComboBox5.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Tabela, foi alterado de: '+Ver_DescTabela(dm.qryGenerico.FieldByName('tabela').AsString, False)+' para: '+mudoutabela+'', MaskEdit1.Text);
    end;

    if dm.qryGenerico.FieldByName('divisor').AsString <> Trim(Copy(ComboBox6.Text, 2,1)) then
    begin
      mudoudivisor:= ComboBox6.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Divisor, foi alterado de: '+dm.qryGenerico.FieldByName('divisor').AsString+' para: '+mudoudivisor+'', MaskEdit1.Text);
    end;

    {if dm.qryGenerico.FieldByName('ext_nat').AsString <> Trim(copy(ComboBox3.Text, 1, 50)) then
    begin
      mudouext_nat:= copy(ComboBox3.Text, 1, 50);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Natureza, foi alterado de: '+dm.qryGenerico.FieldByName('ext_nat').AsString+' para: '+mudouext_nat+'', MaskEdit1.Text);
    end;}

    if dm.qryGenerico.FieldByName('livro').AsString <> MaskEdit33.Text then
    begin
      mudoulivro:= MaskEdit33.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Livro, foi alterado de: '+dm.qryGenerico.FieldByName('livro').AsString+' para: '+mudoulivro+'', MaskEdit1.Text);
    end;

    if dm.qryGenerico.FieldByName('folha').AsString <> MaskEdit34.Text then
    begin
      mudoufolha:= MaskEdit34.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Folha, foi alterado de: '+dm.qryGenerico.FieldByName('folha').AsString+' para: '+mudoufolha+'', MaskEdit1.Text);
    end;

    if TrocaVirgulaporPonto(FormatCurr('###########0.00', dm.qryGenerico.FieldByName('v_pag').AsCurrency)) <> TrocaVirgulaporPonto(FormatCurr('###########0.00', calc_pag)) then
    begin
      mudouv_pag:= TrocaVirgulaporPonto(FormatCurr('###########0.00', calc_pag));
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Total de Página, foi alterado de: '+dm.qryGenerico.FieldByName('v_pag').AsString+' para: '+mudouv_pag+'', MaskEdit1.Text);
    end;

    if TrocaVirgulaporPonto(FormatCurr('###########0.00', dm.qryGenerico.FieldByName('v_emolumentos').AsCurrency)) <> TrocaVirgulaporPonto(FormatCurr('###########0.00', calc_emol)) then
    begin
      mudouv_emolumentos:= TrocaVirgulaporPonto(FormatCurr('###########0.00', calc_emol));
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Emolumentos, foi alterado de: '+dm.qryGenerico.FieldByName('v_emolumentos').AsString+' para: '+mudouv_pag+'', MaskEdit1.Text);
    end;

    if TrocaVirgulaporPonto(FormatCurr('###########0.00', dm.qryGenerico.FieldByName('v_tribunal').AsCurrency)) <> TrocaVirgulaporPonto(FormatCurr('###########0.00', calc_vfetj)) then
    begin
      mudouv_tribunal:= TrocaVirgulaporPonto(FormatCurr('###########0.00', calc_vfetj));
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Valor Tribunal, foi alterado de: '+dm.qryGenerico.FieldByName('v_tribunal').AsString+' para: '+mudouv_tribunal+'', MaskEdit1.Text);
    end;

    if TrocaVirgulaporPonto(FormatCurr('###########0.00', dm.qryGenerico.FieldByName('custas').AsCurrency)) <> TrocaVirgulaporPonto(FormatCurr('###########0.00', CurrencyEdit2.Value)) then
    begin
      mudoucustas:= TrocaVirgulaporPonto(FormatCurr('###########0.00', CurrencyEdit2.Value));
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Valor Custas, foi alterado de: '+dm.qryGenerico.FieldByName('custas').AsString+' para: '+mudoucustas+'', MaskEdit1.Text);
    end;

    if dm.qryGenerico.FieldByName('tipo_reg').AsString <> ComboBox10.Text then
    begin
      mudoutipo_reg:= ComboBox10.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Valor Custas, foi alterado de: '+dm.qryGenerico.FieldByName('tipo_reg').AsString+' para: '+mudoutipo_reg+'', MaskEdit1.Text);
    end;

    if dm.qryGenerico.FieldByName('enviar_doi').AsString <> ComboBox11.Text then
    begin
      mudouenviar_doi:= ComboBox11.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: DOI, foi alterado de: '+dm.qryGenerico.FieldByName('enviar_doi').AsString+' para: '+mudouenviar_doi+'', MaskEdit1.Text);
    end;

    if dm.qryGenerico.FieldByName('averba').AsString <> EdAverbacao.Text then
    begin
      mudouaverba:= EdAverbacao.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Averbado ao Registro, foi alterado de: '+dm.qryGenerico.FieldByName('averba').AsString+' para: '+mudouaverba+'', MaskEdit1.Text);
    end;

    if dm.qryGenerico.FieldByName('sequencia_averbacao').AsString <> MaskEdit43.Text then
    begin
      mudousequencia_averbacao:= MaskEdit43.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Seguencia Averbadção, foi alterado de: '+dm.qryGenerico.FieldByName('sequencia_averbacao').AsString+' para: '+mudousequencia_averbacao+'', MaskEdit1.Text);
    end;   

  {  if (dm.qryGenerico.FieldByName('lva').AsString = '') and (CheckBox1.Checked) then
    begin
      mudouLva:= 'Protoc. Livro A';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Protoc. Livro, foi alterado de: Não Selecionado para: '+mudouLva+'', MaskEdit1.Text);
    end
    else
    begin
      mudouLva:= 'Protoc. Livro A';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Protoc. Livro, foi alterado de: '+mudouLva+' para: Não Selecionado', MaskEdit1.Text);
    end;

    if (dm.qryGenerico.FieldByName('lvb').AsString = '') and (CheckBox2.Checked) then
    begin
      mudouLvb:= 'Protoc. Livro B';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Protoc. Livro, foi alterado de: Não Selecionado para: '+mudouLvb+'', MaskEdit1.Text);
    end
    else
    begin
      mudouLvb:= 'Protoc. Livro B';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Protoc. Livro, foi alterado de: '+mudouLvb+' para: Não Selecionado', MaskEdit1.Text);
    end;

    if (dm.qryGenerico.FieldByName('lvc').AsString = '') and (CheckBox3.Checked) then
    begin
      mudouLvb:= 'Protoc. Livro C';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Protoc. Livro, foi alterado de: Não Selecionado para: '+mudouLvc+'', MaskEdit1.Text);
    end
    else
    begin
      mudouLvb:= 'Protoc. Livro C';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Protoc. Livro, foi alterado de: '+mudouLvc+' para: Não Selecionado', MaskEdit1.Text);
    end;

    if (dm.qryGenerico.FieldByName('lvc').AsString = '') and (CheckBox4.Checked) then
    begin
      mudouLvd:= 'Protoc. Livro D';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Protoc. Livro, foi alterado de: Não Selecionado para: '+mudouLvd+'', MaskEdit1.Text);
    end
    else
    begin
      mudouLvd:= 'Protoc. Livro D';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Protoc. Livro, foi alterado de: '+mudouLvd+' para: Não Selecionado', MaskEdit1.Text);
    end;


    if (dm.qryGenerico.FieldByName('lva_reg').AsString = '') and (CheckBox9.Checked) then
    begin
      mudoulva_reg:= 'Regist. Livro A';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Regist. Livro, foi alterado de: Não Selecionado para: '+mudoulva_reg+'', MaskEdit1.Text);
    end
    else
    begin
      mudouLva:= 'Regist. Livro A';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Regist. Livro, foi alterado de: '+mudoulva_reg+' para: Não Selecionado', MaskEdit1.Text);
    end;

    if (dm.qryGenerico.FieldByName('lvb_reg').AsString = '') and (CheckBox8.Checked) then
    begin
      mudoulvb_reg  := 'Regist. Livro B';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Regist. Livro, foi alterado de: Não Selecionado para: '+mudouLvb_reg+'', MaskEdit1.Text);
    end
    else
    begin
      mudoulvb_reg:= 'Regist. Livro B';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Regist. Livro, foi alterado de: '+mudouLvb_reg+' para: Não Selecionado', MaskEdit1.Text);
    end;

    if (dm.qryGenerico.FieldByName('lvc_reg').AsString = '') and (CheckBox7.Checked) then
    begin
      mudouLvb_reg:= 'Regist. Livro C';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Regist. Livro, foi alterado de: Não Selecionado para: '+mudouLvc_reg+'', MaskEdit1.Text);
    end
    else
    begin
      mudouLvb_reg:= 'Regist. Livro C';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Regist. Livro, foi alterado de: '+mudouLvc_reg+' para: Não Selecionado', MaskEdit1.Text);
    end;

    if (dm.qryGenerico.FieldByName('lvc_reg').AsString = '') and (CheckBox4.Checked) then
    begin
      mudouLvd:= 'Regist. Livro D';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Regist. Livro, foi alterado de: Não Selecionado para: '+mudouLvd_reg+'', MaskEdit1.Text);
    end
    else
    begin
      mudoulvd_reg:= 'Regist. Livro D';
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Campo: Regist. Livro, foi alterado de: '+mudouLvd_reg+' para: Não Selecionado', MaskEdit1.Text);
    end;  }

    dm.Natureza.Close;
    dm.Natureza.sql.Clear;
    dm.natureza.SQL.add('select * from natureza where natureza = "' + trim(copy(ComboBox3.Text, 1, 50)) + '"');
    dm.natureza.Open;

    dm.ArqAux.Close;
    dm.ArqAux.sql.Clear;
    dm.arqaux.sql.add('update td set');
    dm.arqaux.SQL.add(' valor_base = '         + StringReplace(FloatToStr(CurrencyEdit1.Value) , ',', '.', [rfReplaceAll]) + ',');
    dm.arqaux.SQL.add(' pag_adic = '           + MaskEdit8.Text + ',');
    dm.arqaux.SQL.add(' vias_adc = '           + MaskEdit35.Text + ',');
    if MaskEdit38.Text <> '' Then
      dm.arqaux.SQL.add(' qtdpost  = '           + MaskEdit38.Text + ',')
    else
      dm.arqaux.SQL.add(' qtdpost  =             0,');

    dm.arqaux.SQL.add(' natureza = '           + dm.Natureza.FieldByName('cod').AsString + ',');
    dm.arqaux.SQL.add(' tabela = "'            + Trim(Copy(ComboBox5.Text, 1,3)) + '",');
    dm.arqaux.SQL.add(' divisor = '            + Copy(ComboBox6.Text, 1,2) + ',');
    dm.arqaux.SQL.add(' ext_nat = '            + QuotedStr(copy(ComboBox3.Text, 1, 50))  + ',');
    dm.arqaux.SQL.add(' livro = '              + MaskEdit39.Text + ',');
    dm.arqaux.SQL.add(' folha = '              + MaskEdit40.Text + ',');
    dm.arqaux.SQL.add(' livro_reg = '          + MaskEdit33.Text + ','); 
    dm.arqaux.SQL.add(' folha_reg_f = '        + MaskEdit44.Text + ',');
    dm.arqaux.SQL.add(' folha_reg = '          + MaskEdit34.Text + ',');
    dm.arqaux.SQL.add(' v_pag = '              + TrocaVirgulaporPonto(FormatCurr('###########0.00', calc_pag))   + ',');
    dm.arqaux.SQL.add(' v_emolumentos = '      + TrocaVirgulaporPonto(FormatCurr('###########0.00', calc_emol))  + ',');
    dm.arqaux.SQL.add(' v_tribunal = '         + TrocaVirgulaporPonto(FormatCurr('###########0.00', calc_vfetj)) + ',');
    dm.arqaux.SQL.add(' custas = '             + TrocaVirgulaporPonto(FormatCurr('###########0.00', CurrencyEdit2.Value)) + ',');
    dm.arqaux.SQL.add(' tipo_reg = '           + QuotedStr(ComboBox10.Text) + ',');
    dm.arqaux.SQL.add(' enviar_doi = '         + QuotedStr(ComboBox11.Text) + ',');
    dm.arqaux.SQL.add(' averba = '             + QuotedStr(EdAverbacao.Text) + ',');

    If ValidNumero(MaskEdit43.Text) then
      dm.arqaux.SQL.add(' sequencia_averbacao = ' + QuotedStr(MaskEdit43.Text) + ',');


    if CheckBox1.Checked then
      dm.arqaux.SQL.add(' lva = "X",')
    else
      dm.arqaux.SQL.add(' lva = NULL,');

    if CheckBox2.Checked then
      dm.arqaux.SQL.add(' lvb = "X",')
    else
      dm.arqaux.SQL.add(' lvb = NULL,');

    if CheckBox3.Checked then
      dm.arqaux.SQL.add(' lvc = "X",')
    else
      dm.arqaux.SQL.add(' lvc = NULL,');

    if CheckBox4.Checked then
      dm.arqaux.SQL.add(' lvd = "X",')
    else
      dm.arqaux.SQL.add(' lvd = NULL,');

    //************************/

    dm.arqaux.SQL.add(' livro = '+ QuotedStr(MaskEdit39.Text) + ',');
    dm.arqaux.SQL.add(' folha = '+ QuotedStr(MaskEdit40.Text) + ',');

    dm.arqaux.SQL.add(' livro_reg  = '+ QuotedStr(MaskEdit33.Text) + ',');
    dm.arqaux.SQL.add(' folha_reg  = '+ QuotedStr(MaskEdit34.Text) + ',');
    dm.arqaux.SQL.add(' folha_reg_f = '+ QuotedStr(MaskEdit44.Text) + ',');

    if CheckBox10.Checked then
      dm.arqaux.SQL.add(' checkduvida = "X",')
    else
    dm.arqaux.SQL.add(' checkduvida = NULL,');

    if CheckBox9.Checked then
      dm.arqaux.SQL.add(' lva_reg = "X",')
    else
    dm.arqaux.SQL.add(' lva_reg = NULL,');

    if CheckBox8.Checked then
      dm.arqaux.SQL.add(' lvb_reg = "X",')
    else
    dm.arqaux.SQL.add(' lvb_reg = NULL,');

    if CheckBox12.Checked then
      dm.arqaux.SQL.add(' lvf = "X",')
    else
    dm.arqaux.SQL.add(' lvf = NULL,');

    if CheckBox7.Checked then
      dm.arqaux.SQL.add(' lvc_reg = "X",')
    else
    dm.arqaux.SQL.add(' lvc_reg = NULL,');

    if CheckBox6.Checked then
      dm.arqaux.SQL.add(' lvd_reg = "X"')
    else
    dm.arqaux.SQL.add(' lvd_reg = NULL');

    //***********************/

    dm.arqaux.sql.Add(' where p_auxiliar = ' + Trim(MaskEdit1.Text));

    dm.arqaux.ExecSQL;

    GerarNumeroDoLivro;

    BitBtn1.OnClick(Self);
  End;
End;
procedure TF_Exame.BitBtn15Click(Sender: TObject);
begin
  Application.CreateForm(TF_EmissDAJE, F_EmissDAJE);
  F_EmissDAJE.ShowModal;
  F_EmissDAJE.Destroy;
  F_EmissDAJE := Nil;
end;

procedure TF_Exame.BitBtn16Click(Sender: TObject);
begin
  if (not Permissao('acesso050')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
{ if f_menu.Label37.Caption <> 'D' then
  begin
    Application.MessageBox('Acesso Apenas pelos sistema de Distribuição!', 'Mensagem do Sistema', mb_ok);
    exit;
  end;
  }
  Application.CreateForm(TF_RecepR, F_RecepR);
  Carrega_Clientes;
  Carrega_Natureza('RECEP');
  Carrega_Tabela('RECEP', 'R');
  Carrega_Divisor('RECEP');
  Carrega_Situacao('RECEP');
  F_RecepR.ShowModal;
  F_RecepR.Destroy;
  F_RecepR := NIL;
end;

procedure TF_Exame.TabSheet2Show(Sender: TObject);
begin
  GroupBox3.Enabled:= True;
end;

procedure TF_Exame.ChamaTelaDeBusca;
begin
  F_GridBuscaPartes:= TF_GridBuscaPartes.Create(Nil);
  F_GridBuscaPartes.Showmodal;
  F_GridBuscaPartes.Destroy;
  F_GridBuscaPartes := NIL;
end;

procedure TF_Exame.BitBtn17Click(Sender: TObject);
begin
  if (MkNumeroDaje.Text = '') or (MkSerieDaje.Text = '') Then
  Begin
    Application.MessageBox('Número/Série do Daje não informado !', 'Mensagem do Sistema', mb_ok);
    Abort;
  End;

  dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('select count(id) as id from daje where numero_daje = '+QuotedStr(Strzero(MkNumeroDaje.Text, 6))+' and serie_daje = '+QuotedStr(Strzero(MkSerieDaje.Text, 3))+'');
  dm.qryGenerico.Open;

  if (dm.qryGenerico.FieldByName('id').AsInteger <= 0) Then
  Begin
    Application.MessageBox('Número/Série do Daje não localizado na tabela DAJE!', 'Mensagem do Sistema', mb_ok);
    Abort;
  End;

  dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('select * from selos where daje = '+QuotedStr(Strzero(MkNumeroDaje.Text, 6))+' and serie_daje = '+QuotedStr(Strzero(MkSerieDaje.Text, 3))+'' );
  dm.qryGenerico.Open;

  if (dm.qryGenerico.FieldByName('id').AsInteger > 0) Then
  Begin
    Application.MessageBox('Daje já informado na tabela SELOS!', 'Mensagem do Sistema', mb_ok);
    Abort;
  End;

  if dm.qryGenerico.RecordCount <= 0 Then
  Begin
    Dm.Selos.close;
    Dm.Selos.SQL.Clear;
    Dm.Selos.SQL.add('INSERT INTO selos (recibo, daje, serie_daje, data, tp_prot) VALUES (');
    Dm.Selos.sql.add(QuotedStr(MaskEdit1.Text) + ',');
    Dm.Selos.sql.add(QuotedStr(Strzero(MkNumeroDaje.Text, 6))     + ',');
    Dm.Selos.sql.add(QuotedStr(Strzero(MkSerieDaje.Text, 3))     + ',');
    Dm.Selos.sql.add(QuotedStr(ConvData(MaskEdit2.Text)) + ', "T")');
    Dm.Selos.ExecSQL;

    //Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Foi adicionado daje de via adicional nº: '+QuotedStr(Strzero(MkSerieDaje.Text, 3))+'-'+Strzero(MkNumeroDaje.Text, 6), MaskEdit1.Text);

    MkNumeroDaje.Text:= '';
    MkSerieDaje.Text:= '';
    MkSerieDaje.SetFocus;
  End
  Else
  Begin
    Application.MessageBox('O Daje informado ja está em uso!', 'Mensagem do Sistema', mb_ok);
  End;


  qryDajesAdicionais.Close;
  qryDajesAdicionais.ParamByName('p_auxiliar').AsString:= MaskEdit1.Text;
  qryDajesAdicionais.Open;
end;

procedure TF_Exame.BitBtn18Click(Sender: TObject);
begin
  PanViasAdicionais.Visible:= False;
  qryDajesAdicionais.Close;
  qryDajesAdicionais.ParamByName('p_auxiliar').AsString:= MaskEdit1.Text;
  qryDajesAdicionais.Open;
end;

procedure TF_Exame.MkSerieDajeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  Begin
    MkNumeroDaje.SetFocus;
    MkSerieDaje.Text:= Strzero(MkSerieDaje.Text, 3);
  End
end;

procedure TF_Exame.MkNumeroDajeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn17.SetFocus;
end;

procedure TF_Exame.CarregarPartesDaGrid;
var
  campo, conteudo: String;
begin
  if (Trim(MaskEdit1.Text) <> '') then
  begin
    if MaskEdit28.Text <> '' Then
    Begin
      campo:= 'doc2';
      conteudo:= DM.PessAux.FieldByName('doc2').AsString;
    End
    Else
    Begin
      campo:= 'doc1';
      conteudo:= DM.PessAux.FieldByName('doc1').AsString;
    End;

    {Dm.qryGenerico.Close;
    Dm.qryGenerico.Sql.Clear;
    Dm.qryGenerico.Sql.Add('SELECT * FROM td_pesso');
    Dm.qryGenerico.Sql.Add('WHERE p_auxiliar = '+QuotedStr(MaskEdit1.Text)+' and ');
    Dm.qryGenerico.Sql.Add(campo  + ' = ' + Chr(39) + conteudo + Chr(39));
    Dm.qryGenerico.Sql.Add('ORDER BY data DESC');
    Dm.qryGenerico.Open;}

    Dm.qryGenerico.Close;
    Dm.qryGenerico.Sql.Clear;
    Dm.qryGenerico.Sql.Add('SELECT * FROM td_pesso');
    Dm.qryGenerico.Sql.Add('WHERE recno = '+QuotedStr(DM.PessAux.FieldByName('recno').AsString)+' ');
    Dm.qryGenerico.Sql.Add('ORDER BY data DESC');
    Dm.qryGenerico.Open;
    if (Dm.qryGenerico.RecordCount <> 0) then
    begin
      if (Assigned(F_Exame)) then
      begin
        F_Exame.MaskEdit17.Text := Dm.qryGenerico.FieldByName('nome').AsString;
        F_Exame.ComboBox1.Text  := Dm.qryGenerico.FieldByName('tip_doc1').AsString;
        F_Exame.MaskEdit27.EditMask := '';
        F_Exame.MaskEdit27.Text := Dm.qryGenerico.FieldByName('doc1').AsString;
        if (F_Exame.ComboBox1.Text = 'CPF') then
          F_Exame.MaskEdit27.EditMask := '###.###.###-##'
        else
        F_Exame.MaskEdit27.EditMask := '##.###.###/####-##';
        F_Exame.ComboBox2.Text      := Dm.qryGenerico.FieldByName('tip_doc2').AsString;
        F_Exame.MaskEdit28.Text     := Dm.qryGenerico.FieldByName('doc2').AsString;
        F_Exame.cbTipoEndereco.Text := Dm.qryGenerico.FieldByName('tipoEndereco').AsString;        
        F_Exame.MaskEdit18.Text     := Dm.qryGenerico.FieldByName('endereco').AsString;
        F_Exame.MaskEdit19.Text     := Dm.qryGenerico.FieldByName('bairro').AsString;
        F_Exame.MaskEdit20.Text     := Dm.qryGenerico.FieldByName('cidade').AsString;
        F_Exame.MaskEdit21.Text     := Dm.qryGenerico.FieldByName('estado').AsString;
        F_Exame.MaskEdit22.EditMask := '';
        F_Exame.MaskEdit22.Text     := Dm.qryGenerico.FieldByName('cep').AsString;
        F_Exame.MaskEdit22.EditMask := '#####-###';
        F_Exame.ComboBox7.Text      := Ver_Situacao(Dm.qryGenerico.FieldByName('situacao').AsString, True);
        F_Exame.MaskEdit3.Text      := Dm.qryGenerico.FieldByName('numero').AsString;
        F_Exame.MaskEdit25.Text     := Dm.qryGenerico.FieldByName('complem').AsString;
        F_Exame.MaskEdit36.Text     := Dm.qryGenerico.FieldByName('profissao').asString;
        F_Exame.ComboBox9.Text      := Dm.qryGenerico.FieldByName('estcivil').asString;
        F_Exame.MaskEdit37.Text     := Dm.qryGenerico.FieldByName('nacionalidade').asString;
        If Dm.qryGenerico.FieldByName('model').asString = 'S' then CheckBox11.Checked := True
        Else CheckBox11.Checked := False;
      end;
    end;
    Dm.qryGenerico.Close;
  end;

end;

procedure TF_Exame.CarregaVariaveisLOGS;
begin

end;

procedure TF_Exame.BitBtn19Click(Sender: TObject);
begin
  Application.CreateForm(TfrmItemPenhor, frmItemPenhor);
  frmItemPenhor.ShowModal;
  frmItemPenhor.Destroy;
  frmItemPenhor := NIL;
end;

procedure TF_Exame.BitBtn20Click(Sender: TObject);
begin
  F_RegistroAnimal:= TF_RegistroAnimal.Create(Self);
  F_RegistroAnimal.BringToFront;
  F_RegistroAnimal.Showmodal;
  F_RegistroAnimal.Destroy;
  F_RegistroAnimal := NIL;
end;

procedure TF_Exame.MaskEdit44KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
  begin
    combobox11.SetFocus;
  end;
end;

procedure TF_Exame.MaskEdit45KeyDown(Sender:
 TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then MaskEdit32.SetFocus;
end;

procedure TF_Exame.Label98Click(Sender: TObject);
begin

  if Application.MessageBox( Pchar('Deseja realmente desvincular o daje do protocolo atual ?'),PChar('Exame/Baixa'),MB_ICONQUESTION + MB_YESNO ) = Id_yes then
  Begin
    if (Label85.Caption = '') and (Label43.Caption <> 'PRONTO') Then
    Begin
      dm.qryGenerico.Close;
      dm.qryGenerico.SQL.Clear;
      dm.qryGenerico.SQL.Add('UPDATE td SET daje = "", serie_daje = "" where p_auxiliar = '+QuotedStr(MaskEdit1.Text)+' ');
      dm.qryGenerico.ExecSQL;

      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Daje foi desvinculado pela tela de exame.', MaskEdit1.Text);

      BitBtn2.OnClick(Nil);
    End
    Else
    Begin
     Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'O Usuário tentou desvincular o daje do protocolo atual.', MaskEdit1.Text);

     Application.MessageBox( Pchar('Não é permitido desvincular um daje de um protocolo já baixado.'),PChar('Exame/Baixa'),MB_ICONEXCLAMATION);

    End;
  End;

end;

procedure TF_Exame.SpeedButton21Click(Sender: TObject);
begin
  if (not Permissao('acesso052')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_DigDup2, F_DigDup2);
  F_DigDup2.MaskEdit2.Text:= Label29.Caption;
  F_DigDup2.MaskEdit1.Text:= Label29.Caption;
  F_DigDup2.BitBtn1.OnClick(Nil);
  
  F_DigDup2.ShowModal;
  F_DigDup2.Destroy;
  F_DigDup2 := NIL;
end;

procedure TF_Exame.cbTipoEnderecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit18.SetFocus;
end;

procedure TF_Exame.duplicClick(Sender: TObject);
begin
 if (MaskEdit1.text = '') or (MaskEdit1.text = '0') then
       begin
         showmessage('Protocolo atual inválido');
         exit;
       end;
     //Carrega_Situacoes('SITUACAO');
       Application.CreateForm(TF_Duplicp, F_Duplicp);
       //if modificou_p then F_Duplicp.Modificou_p.caption := 'S' else F_Duplicp.Modificou_p.caption := 'N';
      // if (tem_filtro = 'True') then F_Duplicp.Tem_Filtro.caption := 'S' else F_Duplicp.Tem_Filtro.caption := 'N';
       F_Duplicp.MaskEdit1.text := MaskEdit1.Text;
       F_Duplicp.MaskEdit2.text := '1';
       //F_Duplicp.MaskEdit3.Text := Label70.Caption;
       //F_Duplicp.MaskEdit6.Text := Label71.Caption;
       F_Duplicp.Showmodal;
       //if F_Duplicp.Modificou_p.Caption = 'S' then modificou_p := true;
      { if (F_Duplicp.Modificou_p.Caption = 'S') then
       Begin

         if not Atualiza_His( DateToStr(date), TimeToStr(time), DateToStr(date), TimeToStr(time), 'Z', F_menu.tipoProtocolo.caption, Edit29.Text, F_Menu.Label1.Caption, '') then
         begin
           ShowMessage('Problemas para atualizar o Históricos');
         end;
       end; }
       Carrega_Pessoal(F_Exame, True);
       F_DuplicP.destroy;
       F_DuplicP := Nil;
end;

procedure TF_Exame.CheckBox8Click(Sender: TObject);
begin
  If CheckBox12.Checked then CheckBox12.Checked := False;
end;

procedure TF_Exame.CheckBox12Click(Sender: TObject);
begin
  If CheckBox8.Checked then CheckBox8.Checked := False;
end;

procedure TF_Exame.BitBtn21Click(Sender: TObject);
begin
  Application.CreateForm(TF_CadLivroE, F_CadLivroE);
  F_CadLivroE.ShowModal;
  F_CadLivroE.Destroy;
  F_CadLivroE := NIL;  
end;

end.

