unit Menu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, FileCtrl, StdCtrls, ExtCtrls, Mask, Buttons,
  jpeg, AppEvent, Grids, Calendar, TypInfo, WPDefs, WPPrint, WpWinCtr,
  WPRich, IniFiles, ImgeditLibCtl_TLB, ShellApi, ulicenca, DbOleCtl,
  AxCtrls, ImagXpr7_TLB, OleCtrls, AcroPDFLib_TLB,CadCertificos,U_PesqImagemDigDOC;

type
  TF_Menu = class(TForm)
    MainMenu1: TMainMenu;
    Recepo1: TMenuItem;
    Recepo2: TMenuItem;
    Normal1: TMenuItem;
    Reduzida1: TMenuItem;
    Certido1: TMenuItem;
    Exame1: TMenuItem;
    ManutenodosTtulos1: TMenuItem;
    Registro1: TMenuItem;
    Baixas1: TMenuItem;
    Rpido1: TMenuItem;
    Relatrios1: TMenuItem;
    Selo1: TMenuItem;
    Recibo1: TMenuItem;
    Protocolo1: TMenuItem;
    ProtocoloAuxiliar1: TMenuItem;
    relaodeAtosPraticados1: TMenuItem;
    EmissodeNotificaes1: TMenuItem;
    EmissodeEtiquetas1: TMenuItem;
    ListagemdeConferncia1: TMenuItem;
    LivrodeDepsitos1: TMenuItem;
    TermosdeAberturaEncerramento1: TMenuItem;
    ListagemdoSinoreg1: TMenuItem;
    Aviso1: TMenuItem;
    ReciboNormal1: TMenuItem;
    AnotaoMargem1: TMenuItem;
    Pesquisas1: TMenuItem;
    Normal2: TMenuItem;
    Posio1: TMenuItem;
    PosioFinanceira1: TMenuItem;
    Contratos1: TMenuItem;
    Utilitrios1: TMenuItem;
    Configuraes1: TMenuItem;
    Estatsticas1: TMenuItem;
    Troca1: TMenuItem;
    Status1: TMenuItem;
    Cadastros1: TMenuItem;
    Natureza1: TMenuItem;
    Localidade1: TMenuItem;
    Pastas1: TMenuItem;
    Contratos2: TMenuItem;
    Fichario1: TMenuItem;
    Ufesp1: TMenuItem;
    Feriados1: TMenuItem;
    BensdeGarantia1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Sada1: TMenuItem;
    SairdoSistema1: TMenuItem;
    TrocarCOnexo1: TMenuItem;
    Reemisso1: TMenuItem;
    Ttulos1: TMenuItem;
    Certides1: TMenuItem;
    Ttulos2: TMenuItem;
    Certides2: TMenuItem;
    Devoluo3: TMenuItem;
    Ttulos3: TMenuItem;
    Certido4: TMenuItem;
    uSURIOS1: TMenuItem;
    Mensagens1: TMenuItem;
    TabeladeCustas2: TMenuItem;
    Label2: TLabel;
    Timer1: TTimer;
    Internet1: TMenuItem;
    Edit2: TEdit;
    Edit1: TEdit;
    Caixa1: TMenuItem;
    Fechamento1: TMenuItem;
    Movimento1: TMenuItem;
    Label3: TLabel;
    StatusBar1: TStatusBar;
    Digitalizao1: TMenuItem;
    Imagens1: TMenuItem;
    Logs1: TMenuItem;
    CadastrodeSituaesdasPartes1: TMenuItem;
    CadastrodosItensdaTabela1: TMenuItem;
    Gare1: TMenuItem;
    Simplex1: TMenuItem;
    Duplex1: TMenuItem;
    CertidaoNegativa1: TMenuItem;
    Individual1: TMenuItem;
    Internet2: TMenuItem;
    BaixaNotificaes1: TMenuItem;
    Clculo1: TMenuItem;
    Exigncias1: TMenuItem;
    ModelosdeExigncias1: TMenuItem;
    Label19: TLabel;
    Label10: TLabel;
    Negativas1: TMenuItem;
    Positivas1: TMenuItem;
    MaskEdit2: TMaskEdit;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label8: TLabel;
    NotificaesdeOutrasComarcas1: TMenuItem;
    CadastrodeNotificaesdeOutrasComarcas1: TMenuItem;
    Certidao1: TMenuItem;
    TrocaCertido1: TMenuItem;
    ExclusodeProtocolos1: TMenuItem;
    Normal3: TMenuItem;
    Certido2: TMenuItem;
    Confirmao1: TMenuItem;
    Internet3: TMenuItem;
    CadastrodeEscritrios1: TMenuItem;
    RecibodeFaturados1: TMenuItem;
    Image1: TImage;
    ControlBar1: TControlBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Ttulos4: TMenuItem;
    Certides3: TMenuItem;
    Label17: TLabel;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    Label25: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label18: TLabel;
    Ttulo1: TMenuItem;
    Certido3: TMenuItem;
    AppEvents1: TAppEvents;
    MaskEdit3: TMaskEdit;
    Label26: TLabel;
    OcorrnciasdeNotificao1: TMenuItem;
    Notificaes1: TMenuItem;
    ArRetorno1: TMenuItem;
    Label27: TLabel;
    Resumo1: TMenuItem;
    Analtico1: TMenuItem;
    Retorno1: TMenuItem;
    Confirmao2: TMenuItem;
    Label28: TLabel;
    Modelos1231: TMenuItem;
    AR1: TMenuItem;
    ControledeAR1: TMenuItem;
    Certido5: TMenuItem;
    Label29: TLabel;
    Label30: TLabel;
    Aviso2: TMenuItem;
    NotificaesAR1: TMenuItem;
    NotificaesBalco1: TMenuItem;
    Manuteno1: TMenuItem;
    Label31: TLabel;
    Postagem1: TMenuItem;
    Listagemdecontrole1: TMenuItem;
    ProtocolodeRecepodeCertido1: TMenuItem;
    ResumoFinanceiro1: TMenuItem;
    Edit3: TEdit;
    Button1: TButton;
    Label32: TLabel;
    NotificaesRecepcionadas1: TMenuItem;
    ControledeDiligncias1: TMenuItem;
    RePostagem1: TMenuItem;
    RelaodeRepostagens1: TMenuItem;
    PedidosdeInformaesaoCorreioPI1: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    partes1: TLabel;
    partes2: TLabel;
    laser: TLabel;
    RichEdit3: TRichEdit;
    PesquisaCEP1: TMenuItem;
    vezes: TLabel;
    VerificaoDiligncias1: TMenuItem;
    senha: TLabel;
    importcsv: TLabel;
    TrocarSenha1: TMenuItem;
    EditordeTextos1: TMenuItem;
    Label33: TLabel;
    Grficos1: TMenuItem;
    RetornoNovo1: TMenuItem;
    ARModeloNovo1: TMenuItem;
    Estatstica1: TMenuItem;
    Grfico1: TMenuItem;
    CertidoNegativa1: TMenuItem;
    TermosdeAberturaEncerramento2: TMenuItem;
    RetornoARProvisrio1: TMenuItem;
    RelaodasNotificaesemAberto1: TMenuItem;
    RelaodasNotificaesSolucionadas1: TMenuItem;
    RelaodeNotificaesBaixadasProvisoriamente1: TMenuItem;
    NotificaesBaixadasProvisoriamenteSJRP1: TMenuItem;
    NotificaesBaixadasProvisoriamenteSANTOANDR1: TMenuItem;
    NotificaesBaixadasProvisoriamenteSUZANO1: TMenuItem;
    NotificaesBaixadasProvisoriamenteSANTOS1: TMenuItem;
    BAURU1: TMenuItem;
    NotificaesBaixadasProvisoriamenteSECUNDINO1: TMenuItem;
    NotificaesBaixadasProvisoriamenteMERCABENCO1: TMenuItem;
    NotificaesBaixadasProvisoriamenteCORREIOS1: TMenuItem;
    GrficoBaixaProvisria1: TMenuItem;
    NotificaesBaixadasEfetivamente1: TMenuItem;
    ModeloFicticioAR1: TMenuItem;
    ModelodeAprovao1: TMenuItem;
    NotificaesBaixadasProvisoriamenteWOCosta1: TMenuItem;
    RelaodeRisco1: TMenuItem;
    NotificaesComBaixaProvDifdaBaixaEfetiva1: TMenuItem;
    NotificaesBaixadasProvisoriamenteScania1: TMenuItem;
    NotificaesBaixadasEfetivamenteSCANIA1: TMenuItem;
    NotificaesBaixadasProvisoriamenteouEfetivamente1: TMenuItem;
    Correio1: TMenuItem;
    GerarArquivodeenviodePostagem1: TMenuItem;
    GerarArquivodeenviodeBaixas1: TMenuItem;
    ImportarArquivosdeBaixas1: TMenuItem;
    Ttulos5: TMenuItem;
    Certides4: TMenuItem;
    Recepo3: TMenuItem;
    Label34: TLabel;
    Correios1: TMenuItem;
    GerarArquivodePostagem1: TMenuItem;
    GerarArquivodeBaixas1: TMenuItem;
    Label35: TLabel;
    Label36: TLabel;
    ResumodosAtosPraticados1: TMenuItem;
    Tabela1: TMenuItem;
    DemaisTabelas1: TMenuItem;
    Label37: TLabel;
    ImpressodosLivros1: TMenuItem;
    LivroA1: TMenuItem;
    LivroB1: TMenuItem;
    LivroC1: TMenuItem;
    LivroD1: TMenuItem;
    matricial: TLabel;
    bematech: TLabel;
    Distribuidor1: TMenuItem;
    Faturados1: TMenuItem;
    Selagem1: TMenuItem;
    Distribuio1: TMenuItem;
    NomesExtras1: TMenuItem;
    Exportaes1: TMenuItem;
    TtuloseDocumentos1: TMenuItem;
    NumeroRoloMicofilme1: TMenuItem;
    Notificadores1: TMenuItem;
    ListagemdeConferncia2: TMenuItem;
    LivroAdicional1: TMenuItem;
    MutuaeAcoterj1: TMenuItem;
    Label38: TLabel;
    Cdigodecustas1: TMenuItem;
    Label39: TLabel;
    Label40: TLabel;
    bematech2: TLabel;
    Incluirvalordedistribuio1: TMenuItem;
    ConfigAdministrativas1: TMenuItem;
    Label41: TLabel;
    Info1: TMenuItem;
    CorreodeLivrosAeB1: TMenuItem;
    SpeedButton10: TSpeedButton;
    SpeedButton8: TSpeedButton;
    CadastrodeEmolumentos1: TMenuItem;
    laser2: TLabel;
    SpeedButton9: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label42: TLabel;
    Emolumentos1: TMenuItem;
    Manual1: TMenuItem;
    Lote1: TMenuItem;
    Label43: TLabel;
    Label44: TLabel;
    ReciboAvulso1: TMenuItem;
    Certido6: TMenuItem;
    conferencia1: TMenuItem;
    Certido7: TMenuItem;
    Retroativo1: TMenuItem;
    DAJEs1: TMenuItem;
    Etiquetas1: TMenuItem;
    EmissodeDAJE1: TMenuItem;
    SpeedButton16: TSpeedButton;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Imveis1: TMenuItem;
    ExportarDOI1: TMenuItem;
    RecibodeTitulos1: TMenuItem;
    Label49: TLabel;
    ReaberturadeNotificao1: TMenuItem;
    ImagemdosLivros1: TMenuItem;
    Ttulos6: TMenuItem;
    Label48: TLabel;
    ListagemdeRegistrosAverbados1: TMenuItem;
    SincronizarRegistrosAverbados2: TMenuItem;
    AjustarDaje1: TMenuItem;
    GrficodeEmolumentos1: TMenuItem;
    AtualizaoOnline1: TMenuItem;
    Log1: TMenuItem;
    ExameeTtulo1: TMenuItem;
    Imagens2: TMenuItem;
    LbCaminhoExportaPDF: TLabel;
    Memo1: TMemo;
    Manualmente1: TMenuItem;
    Automaticamente1: TMenuItem;
    Label50: TLabel;
    LbNomeTitular: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    CaminhoImagemAnimal: TLabel;
    Label55: TLabel;
    AjustedeAverbao1: TMenuItem;
    Label56: TLabel;
    Label58: TLabel;
    Notificaes2: TMenuItem;
    ImportarImagensdeRegistro1: TMenuItem;
    ImpressodeRecibo1: TMenuItem;
    TtulosRegistrados1: TMenuItem;
    Labelcep: TLabel;
    CompararImagenscomRegistros1: TMenuItem;
    ExameeClculo1: TMenuItem;
    Certido8: TMenuItem;
    PrazosdeTtulos1: TMenuItem;
    LbCaminhoDajeIntegracao: TLabel;
    LivrodeExameClculo1: TMenuItem;
    SpeedButton6: TSpeedButton;
    AjustarValordosDajes1: TMenuItem;
    ExportarCentralRTDPJ1: TMenuItem;
    Titulos7: TMenuItem;
    Label57: TLabel;
    LbCnpj: TLabel;
    CadastrodeCertifico1: TMenuItem;
    ImagensDIGDOC1: TMenuItem;
    LivroE1: TMenuItem;
    LivroG1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Normal1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Reduzida1Click(Sender: TObject);
    procedure Certido1Click(Sender: TObject);
    procedure Ttulos1Click(Sender: TObject);
    procedure Certides1Click(Sender: TObject);
    procedure AnotaoMargem1Click(Sender: TObject);
    procedure Ttulos2Click(Sender: TObject);
    procedure Certides2Click(Sender: TObject);
    procedure Baixas1Click(Sender: TObject);
    procedure Rpido1Click(Sender: TObject);
    procedure Ttulos3Click(Sender: TObject);
    procedure Certido4Click(Sender: TObject);
    procedure Troca1Click(Sender: TObject);
    procedure Estatsticas1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure Selo1Click(Sender: TObject);
    procedure Protocolo1Click(Sender: TObject);
    procedure ProtocoloAuxiliar1Click(Sender: TObject);
    procedure LivrodeDepsitos1Click(Sender: TObject);
    procedure ListagemdoSinoreg1Click(Sender: TObject);
    procedure ListagemdeConferncia1Click(Sender: TObject);
    procedure TermosdeAberturaEncerramento1Click(Sender: TObject);
    procedure Aviso1Click(Sender: TObject);
    procedure ReciboNormal1Click(Sender: TObject);
    procedure ReciboFotocpia1Click(Sender: TObject);
    procedure CertidodeNotificaonoEntregue1Click(Sender: TObject);
    procedure Aviso11Click(Sender: TObject);
    procedure Normal2Click(Sender: TObject);
    procedure Localidade1Click(Sender: TObject);
    procedure Fichario1Click(Sender: TObject);
    procedure uSURIOS1Click(Sender: TObject);
    procedure Ufesp1Click(Sender: TObject);
    procedure Feriados1Click(Sender: TObject);
    procedure BensdeGarantia1Click(Sender: TObject);
    procedure Mensagens1Click(Sender: TObject);
    procedure Contratos2Click(Sender: TObject);
    procedure Contratos1Click(Sender: TObject);
    procedure Pastas1Click(Sender: TObject);
    procedure Posio1Click(Sender: TObject);
    procedure PosioFinanceira1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TrocarCOnexo1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Internet1Click(Sender: TObject);
    procedure Fechamento1Click(Sender: TObject);
    procedure Movimento1Click(Sender: TObject);
    procedure Imagens1Click(Sender: TObject);
    procedure Logs1Click(Sender: TObject);
    procedure CadastrodeSituaesdasPartes1Click(Sender: TObject);
    procedure CadastrodosItensdaTabela1Click(Sender: TObject);
    procedure Simplex1Click(Sender: TObject);
    procedure Duplex1Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Internet2Click(Sender: TObject);
    procedure Clculo1Click(Sender: TObject);
    procedure Exigncias1Click(Sender: TObject);
    procedure ModelosdeExigncias1Click(Sender: TObject);
    procedure Negativas1Click(Sender: TObject);
    procedure Positivas1Click(Sender: TObject);
    procedure NotificaesdeOutrasComarcas1Click(Sender: TObject);
    procedure CadastrodeNotificaesdeOutrasComarcas1Click(Sender: TObject);
    procedure Certidao1Click(Sender: TObject);
    procedure TrocaCertido1Click(Sender: TObject);
    procedure Normal3Click(Sender: TObject);
    procedure Certido2Click(Sender: TObject);
    procedure Internet3Click(Sender: TObject);
    procedure CadastrodeEscritrios1Click(Sender: TObject);
    procedure Ttulos4Click(Sender: TObject);
    procedure Certides3Click(Sender: TObject);
    procedure Ttulo1Click(Sender: TObject);
    procedure Certido3Click(Sender: TObject);
    procedure OcorrnciasdeNotificao1Click(Sender: TObject);
    procedure Notificaes1Click(Sender: TObject);
    procedure ArRetorno1Click(Sender: TObject);
    procedure Resumo1Click(Sender: TObject);
    procedure Analtico1Click(Sender: TObject);
    procedure Confirmao2Click(Sender: TObject);
    procedure Retorno1Click(Sender: TObject);
    procedure Modelos1231Click(Sender: TObject);
    procedure AR1Click(Sender: TObject);
    procedure ControledeAR1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure NotificaesAR1Click(Sender: TObject);
    procedure Aviso2Click(Sender: TObject);
    procedure NotificaesBalco1Click(Sender: TObject);
    procedure Manuteno1Click(Sender: TObject);
    procedure Postagem1Click(Sender: TObject);
    procedure Listagemdecontrole1Click(Sender: TObject);
    procedure ProtocolodeRecepodeCertido1Click(Sender: TObject);
    procedure ResumoFinanceiro1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotificaesRecepcionadas1Click(Sender: TObject);
    procedure ControledeDiligncias1Click(Sender: TObject);
    procedure RePostagem1Click(Sender: TObject);
    procedure RelaodeRepostagens1Click(Sender: TObject);
    procedure PedidosdeInformaesaoCorreioPI1Click(Sender: TObject);
    procedure PesquisaCEP1Click(Sender: TObject);
    procedure VerificaoDiligncias1Click(Sender: TObject);
    procedure EditordeTextos1Click(Sender: TObject);
    procedure Grficos1Click(Sender: TObject);
    procedure RetornoNovo1Click(Sender: TObject);
    procedure ARModeloNovo1Click(Sender: TObject);
    procedure Grfico1Click(Sender: TObject);
    procedure TermosdeAberturaEncerramento2Click(Sender: TObject);
    procedure RetornoARProvisrio1Click(Sender: TObject);
    procedure RelaodasNotificaesemAberto1Click(Sender: TObject);
    procedure RelaodasNotificaesSolucionadas1Click(Sender: TObject);
    procedure RelaodeNotificaesBaixadasProvisoriamente1Click(
      Sender: TObject);
    procedure NotificaesBaixadasProvisoriamenteSJRP1Click(Sender: TObject);
    procedure NotificaesBaixadasProvisoriamenteSANTOANDR1Click(
      Sender: TObject);
    procedure NotificaesBaixadasProvisoriamenteSUZANO1Click(
      Sender: TObject);
    procedure NotificaesBaixadasProvisoriamenteSANTOS1Click(
      Sender: TObject);
    procedure BAURU1Click(Sender: TObject);
    procedure NotificaesBaixadasProvisoriamenteSECUNDINO1Click(
      Sender: TObject);
    procedure NotificaesBaixadasProvisoriamenteMERCABENCO1Click(
      Sender: TObject);
    procedure NotificaesBaixadasProvisoriamenteCORREIOS1Click(
      Sender: TObject);
    procedure GrficoBaixaProvisria1Click(Sender: TObject);
    procedure NotificaesBaixadasEfetivamente1Click(Sender: TObject);
    procedure ModeloFicticioAR1Click(Sender: TObject);
    procedure NotificaesBaixadasProvisoriamenteWOCosta1Click(
      Sender: TObject);
    procedure RelaodeRisco1Click(Sender: TObject);
    procedure NotificaesComBaixaProvDifdaBaixaEfetiva1Click(
      Sender: TObject);
    procedure NotificaesBaixadasProvisoriamenteScania1Click(
      Sender: TObject);
    procedure NotificaesBaixadasEfetivamenteSCANIA1Click(Sender: TObject);
    procedure NotificaesBaixadasProvisoriamenteouEfetivamente1Click(
      Sender: TObject);
    procedure GerarArquivodeenviodePostagem1Click(Sender: TObject);
    procedure GerarArquivodeenviodeBaixas1Click(Sender: TObject);
    procedure ImportarArquivosdeBaixas1Click(Sender: TObject);
    procedure Ttulos5Click(Sender: TObject);
    procedure Certides4Click(Sender: TObject);
    procedure Recepo3Click(Sender: TObject);
    procedure GerarArquivodePostagem1Click(Sender: TObject);
    procedure GerarArquivodeBaixas1Click(Sender: TObject);
    procedure ResumodosAtosPraticados1Click(Sender: TObject);
    procedure Tabela1Click(Sender: TObject);
    procedure DemaisTabelas1Click(Sender: TObject);
    procedure LivroA1Click(Sender: TObject);
    procedure LivroB1Click(Sender: TObject);
    procedure LivroC1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Distribuidor1Click(Sender: TObject);
    procedure Faturados1Click(Sender: TObject);
    procedure Distribuio1Click(Sender: TObject);
    procedure NomesExtras1Click(Sender: TObject);
    procedure LivroD1Click(Sender: TObject);
    procedure TtuloseDocumentos1Click(Sender: TObject);
    procedure NumeroRoloMicofilme1Click(Sender: TObject);
    procedure Notificadores1Click(Sender: TObject);
    procedure ListagemdeConferncia2Click(Sender: TObject);
    procedure LivroAdicional1Click(Sender: TObject);
    procedure MutuaeAcoterj1Click(Sender: TObject);
    procedure Cdigodecustas1Click(Sender: TObject);
    procedure Incluirvalordedistribuio1Click(Sender: TObject);
    procedure ConfigAdministrativas1Click(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure CorreodeLivrosAeB1Click(Sender: TObject);
    procedure CadastrodeEmolumentos1Click(Sender: TObject);
    procedure Emolumentos1Click(Sender: TObject);
    procedure Manual1Click(Sender: TObject);
    procedure Lote1Click(Sender: TObject);
    procedure ReciboAvulso1Click(Sender: TObject);
    procedure Certido6Click(Sender: TObject);
    procedure conferencia1Click(Sender: TObject);
    procedure Certido7Click(Sender: TObject);
    procedure Retroativo1Click(Sender: TObject);
    procedure DAJEs1Click(Sender: TObject);
    procedure Etiquetas1Click(Sender: TObject);
    procedure EmissodeDAJE1Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure Imveis1Click(Sender: TObject);
    procedure ExportarDOI1Click(Sender: TObject);
    procedure RecibodeTitulos1Click(Sender: TObject);
    procedure ReaberturadeNotificao1Click(Sender: TObject);
    procedure ImagemdosLivros1Click(Sender: TObject);
    procedure ConverterImagensTIFBMP1Click(Sender: TObject);
    procedure Ttulos6Click(Sender: TObject);
    procedure Label48Click(Sender: TObject);
    procedure ListagemdeRegistrosAverbados1Click(Sender: TObject);
    procedure SincronizarRegistrosAverbados2Click(Sender: TObject);
    procedure GrficodeEmolumentos1Click(Sender: TObject);
    procedure AtualizaoOnline1Click(Sender: TObject);
    procedure Imagens2Click(Sender: TObject);
    procedure ExameeTtulo1Click(Sender: TObject);
    procedure Manualmente1Click(Sender: TObject);
    procedure Automaticamente1Click(Sender: TObject);
    procedure AtosparaDOI1Click(Sender: TObject);
    procedure AjustedeAverbao1Click(Sender: TObject);
    procedure Notificaes2Click(Sender: TObject);
    procedure ImportarImagensdeRegistro1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImpressodeRecibo1Click(Sender: TObject);
    procedure TtulosRegistrados1Click(Sender: TObject);
    procedure CompararImagenscomRegistros1Click(Sender: TObject);
    procedure ExameeClculo1Click(Sender: TObject);
    procedure Certido8Click(Sender: TObject);
    procedure PrazosdeTtulos1Click(Sender: TObject);
    procedure LivrodeExameClculo1Click(Sender: TObject);
    procedure AjustarValordosDajes1Click(Sender: TObject);
    procedure Titulos7Click(Sender: TObject);
    procedure CadastrodeCertifico1Click(Sender: TObject);
    procedure ImagensDIGDOC1Click(Sender: TObject);
    procedure LivroE1Click(Sender: TObject);
    procedure LivroG1Click(Sender: TObject);

  private
    { Private declarations }
    procedure ColorControl(Sender: TObject);
    procedure ListaDeArquivos(ASource: String; ADirList: TStringList;  vSeqCarac: String);
    Procedure ConverteImagem(sCaminhoArquivoASerConvertido, sCaminhoArquivoConvertido: String);
    function Crypt(Action, Src: String): String;
  public
    { Public declarations }
    cnpj: String;
    prazoLimite : integer;
    gerarDajeIsento: Boolean;
    livroAutomatico: Boolean;
    Function DefineSub(arq_img : String) : String;

  end;


  Function TirarTudo(BaseString, BreakString, BreakString1, BreakString2 : String): String;
  Function Permissao(campo : String) : Boolean;
  Function PegaAte( stringa, ate, direcao : string ) : string;
  Function ValidNumero(num : String) : Boolean;
  Procedure CriaTabela(Tipo, Tabela : String);
  Function Strzero(Numero : String;Casas : Integer) : String;
  Function StrZero2(Cadeia : String; Casas : Integer; Posicao : String): String;
  Procedure DestroeTabela(Tabela : String);
  function right( strng : string ; qtd : integer ) : string;
  Function TrocaVirgulaporPonto(texto : String) : String;
  Function TrocaPontoporVirgula(texto : String) : String;
  Function TirarPonto(texto : String) : String;
  Function TruncaArre(valor:currency):Currency;
  Function Ver_Situacao(Situacao : String; ComCod : Boolean) : String;
  Function CheckCPF(Argumento : String): String;
  Function CheckCGC(Argumento : String): String;
  Function StrCurrPesq(Cadeia : Currency) : String;
  function TruncaV(V: Real): Real;
  Function ConvDoc(saga, suga, siga: string) : string;
  procedure Copiar(Origem, Destino: string);
  Procedure Carrega_Configuracao;
  Procedure Carrega_Clientes;
  //Function BuscaCGI(nome : String) : Boolean;
var
  F_Menu     : TF_Menu;
  FecharProg : Boolean;
  // ATENÇÃO
  // Variáveis PÚBLICAS NÃO colocar em nenhuma outra Parte do Sistema
  NRL, NCert, NMicro, arq1 : String;
  caminho, Tab, Item, subitem, cod_serventia   : String;
  VrEmolumentos, VrEmolAdicional, VrPag, VrViasExcedente, VrMicrofilme : Currency;
  VrDigitalizacao, VrInformatica, VrGravEletronica, VrConferencia : Currency;
  VrDistrib, VrMicroDistrib, VrInfoDistrib, VrGravEletrDistrib, VrNomeExc : Currency;
  VrDistribNew : Currency; 
  VrTrib_nom, VrDefen_nom, VrProcu_nom, tot_nomexc, nome_dist, v_nome : Currency;
  VrTrib_DIST, VrDefen_DIST, VrProcu_DIST : Currency;
  qtd_pg, qtd_nom : Integer;
  v_qtd_pg, v_qtd_nom, valorbase : Currency;
  VrBusca, VrDesarquivamento, Vr_Notpag : Currency;
  VrTribunal, VrProcuradoria, VrDefensoria : Currency;
  qtd_pag_cert, qtd_fol_cert : Integer;
  VrTribCert, VrDefeCert, VrProcCert : Currency;
  vl_pag_cert, vl_fol_cert, VrPagCert, VrFolCert : Currency;
  VrPrimaPag, Val_Fol, Val_Pag : Currency;
  VrSubTotal, VrTotG : Currency;
  VrMutua, VrAcoterj : Currency;
  VrDoi, VrDoiInfo   : Currency;
  VrGuia, VrGuiaInfo : Currency;
  VrPorDist, VrProcEst : Currency;
  VrOfiG, VrEstG, VrIpeG, VrSinG, VrTriG, VrCond : Currency;
  VrOfiPagG, VrEstPagG, VrIpePagG, VrSinPagG, VrTriPagG, VrTotPagG : Currency;
  VrOfiMicG, VrEstMicG, VrIpeMicG, VrSinMicG, VrTriMicG, VrTotMicG : Currency;
  VrOfiAdcG, VrEstAdcG, VrIpeAdcG, VrSinAdcG, VrTriAdcG, VrTotAdcG : Currency;

  IniFile : TIniFile;
  Porta_cert, Porta_driver : String;
  cert_vias : Integer;

  { Variaveis para o Calculo }
  calc_emol, calc_pag, calc_vfetj, calc_vfundperj, calc_vfunperj, calc_mutua, calc_aco, calc_subtot, calc_vdistr, calc_total, calc_vbib : Currency;
  calc_emol_pre, calc_vfetj_pre, calc_vfundperj_pre, calc_vfunperj_pre, calc_total_pre : Currency;
  calc_total_cert : Currency;
  dat, dat_calc : String;

  _EmolumentosDaje, _TaxaFiscalDaje, _FecomDaje, _DefPublicaDaje, _DiferencaDaje,
  perc_pge, emol_daje, tx_fisc_daje, fecom_daje, def_pub_daje, _PGE, fmmpba, ValorDaje_WS : Currency;  

  tx_daje, tx_fecom, tx_df_pb : Integer;
  id_eselo, dir_daje : String;
  //Averbacao
  BuscaExataEmTituloRegEProtocolados, ModalidadeAverbacaoCapital: Boolean;
  CaminhoDoExecutavelAtualiza: String;

implementation

uses RecepN, Func, FuncGeral, ProcGeral, Reem, RecepC, Anot, Exame, ExameC, Reg,
  RegR, Dev, DevC, Baixa1, Status, Troca, Estat, Config, RSelo, RRec,
  RPO, RPA, RAP, RDEP, RETQ, RConf, RTER, RAV,
  Pesq, Natureza, Local, Ficha, Usuar, Ufesp, feriados, Contrato,
  Acesso, Posicao, PosFin,
  Internet, pufesp, imp_fic, PesqNat, CaixaF,
  CaixaM, Loc, Logs, CadSit, QR_AvNN, CadTab, Gare, RELGARE,
  Cer_Neg, CAIXAI, baixan, CALCUL, Exigenc2, Titulo, ALERTA1,
  Mod_Exig, Cer_Pos, PNot, CadNot, PesqC, TrocaC, U_ExcluN, ExcluC,
  ficha2, IMP_FAT, DMTD, TAB_AUX1, Permis, StatusC, ReemiC, NatCer, RecepR,
  CadOcor, BxRet, Retorno, SeloB, R_Conf, RRet, RETQAR, RConAr, RCertNot, RAviso,
  RCNotB, Manut, logerro, Info, RPos, RLisNot, RPce, CaixaIn, RelNot,
  RConNot, RePost, RRepost, CadPI, U_WRecep, PesqCep, U_PesqDel, u_editor,
  Grafico, RRet1, RETQAR1, Graf, NotAber, NotSolu, BxRetPro, RelPro,
  RelPro1, RelPro2, RelPro3, RelPro4, RelPro5, RelPro6, RelPro7, RelPro8,
  GrafProv, RelEfe, QkNotFic, QkScan,EtiqQk, EtiqQk1, EtiqQk2, QkEtqAR1, Confirma,
  RelPro9, RelPro10, CorBaiE, CorBaiP, ProDef, RelPro11, RelPro12, RelBaix,
  GArqPost, GArqPostBX, ImportaPostBX, RCERT, PesqRec, UPostCor, UPostBx,
  RelAdv, Res_Atos, UTabDemais, URPOLB, UQkRPOLB, URPOLC, U_Importa,
  WRecep2, USelos, URelDistrib, UQk_RelDist, URelnomes, UQk_RelNomes,
  UExportxml, URPOD, URoloMicorfilme, UCadNot, QkSelo, UFatRelConf,
  UQkRelFat, UExpLA, U_RelMutua, UQK_RelMutua, Cod_cus, Cor_distr, ConfAdm,
  Licenc, LivProt, CadEmol, UQK_RelDNew, U_EtqEmol, USeloLote, U_RecAv,
  New_CalcT, U_EtqCert, U_SeloC, DigDup2, retroativo, PesqDaje,
  Anotacao, Etiquetas, U_EmissDAJE, U_CadImoveis, U_ExportacaoDOI,
  U_ReciboDeTitulo, U_StatusNotificacaoReabre, U_ImgLivros, Clipbrd,
  U_RelTitulosDOI, U_ListagemDeRegistroAverbado,
  U_SincronizaRegistrosAverbados, U_DajeCorrecao, U_GraficoEmolumentos,
  U_LogCertidao, U_DajeCorrecaoAutomatica, U_RelDOI, U_AjusteRegAverbado,
  U_RelNotificacoesEstatistica, U_ImportaImagemOutroFormato,
  U_ReciboNotificacaoCobrada, U_RelTitulosRegistrados, U_RelAtoPraticado,
  U_ComparaImagenRegistro, U_ExameCalculo, termos, U_LivroCertidaoRel,
  U_GridAnaliseTitulos, U_RelLivroExameCalculo, URPOLB_NewC,
  U_AjustaValorDAJE, U_RelTitulosProtocolados, U_LivroE, U_LivroG;
{$R *.DFM}

procedure Copiar(Origem, Destino: string);
var
  InFile,OutFile: File;
  Buffer: array[1..1024]of byte;
  NumRecsRead: integer;
begin
  AssignFile(InFile,Origem);
  AssignFile(OutFile,Destino);
  Reset(Infile,1);
  Rewrite(OutFile,1);
  while not EOF(Infile) do
  begin
    BlockRead(InFile,Buffer,Sizeof(Buffer),NumRecsRead);
    BlockWrite(OutFile,Buffer,NumRecsRead);
  end;
  CloseFile(InFile);
  CloseFile(OutFile);
end;


Function Ver_Situacao(Situacao : String; ComCod : Boolean) : String;
begin
  Result := '';
  if (Trim(situacao) <> '') then
  begin
    Dm.Cad_Sit.Close;
    Dm.Cad_Sit.Sql.Clear;
    Dm.Cad_Sit.Sql.Add('SELECT codigo, descricao FROM cad_sit');
    Dm.Cad_Sit.Sql.Add('WHERE');
    Dm.Cad_Sit.Sql.Add('codigo = ' + Chr(39) +  situacao + Chr(39));
    Dm.Cad_Sit.Open;
    if (Dm.Cad_Sit.RecordCount <> 0) then
    begin
      if (not ComCod) then
      begin
        Result := Dm.Cad_Sit.FieldByName('descricao').AsString;
      end
      else Result := StrBranco(Dm.Cad_Sit.FieldByName('codigo').AsString, 3, 'D') + ' - ' + Dm.Cad_Sit.FieldByName('descricao').AsString;
    end;  
    Dm.Cad_Sit.Close;
  end;
end;

Function CheckCPF(Argumento : String): String;
var
  soma, resto, dig1, dig2, i : Integer;
Begin
  Result := '';
  if length(argumento) <> 11 then exit;
  { 1º digito }
  soma := 0;
  for i := 1 to 9 do soma := soma + (StrToInt(Copy(argumento,i,1)) * ((11 - i)));
  resto := soma mod 11;
  if (resto = 0) or (resto = 1) then dig1 := 0 else dig1 := 11 - resto;
  { 2º Digito }
  soma := 0;
  for i := 1 to 9 do soma := soma + (StrToInt(Copy(argumento,i,1)) * ((12 - i)));
  soma := soma + (2 * dig1);
  resto := soma mod 11;
  if (resto = 0) or (resto = 1) then dig2 := 0 else dig2 := 11 - resto;
  result := Copy(argumento,1,9) + IntToStr(dig1) + IntToStr(dig2);
end;

Function CheckCGC(Argumento : String): String;
var
  mostra, p, a, b, i, d, e, s, w, m, z, c, t, d1, d2, resto : Integer;
  corpo : String;
Begin
  Result := '';
  if length(argumento) <> 14 then exit;
  corpo := argumento;
  p := 0;
  for i := 1 to 8 do
    begin
      a := 2;
      b := 1;
      c := StrToInt(Copy(corpo,i,1));
      if (i mod 2) <> 0 then d := c * a else d := c * b;
      p := p + d;
    end;
  s := 0;
  e := 2;
  w := 12;
  while w >= 1 do
    Begin
      z := StrToInt(Copy(corpo,w,1));
      if e > 9 then e := 2;
      m := z * e;
      e := e + 1;
      s := s + m;
      w := w - 1;
    end;
  resto := s mod 11;
  if resto <= 1 then d1 := 0 else d1 := 11 - resto;
  { 2º Digito }
  t := 0;
  e := 2;
  w := 13;
  while w >= 1 do
    begin
      z := StrToInt(Copy(corpo, w, 1));
      if e > 9 then e := 2;
      m := z * e;
      e := e + 1;
      t := t + m;
      w := w - 1;
    end;
  resto := t mod 11;
  if resto <= 1 then d2 := 0 else d2 := 11 - resto;
  result := Copy(argumento,1,12) + IntToStr(d1) + IntToStr(d2);
end;

Function StrCurrPesq(Cadeia : Currency) : String;
begin
  result := Trim(Copy(StrCurr(cadeia, 14, False), 1,11) + '.' + Copy(StrCurr(cadeia, 14, False), 13,2));
end;

function TruncaV(V: Real): Real;
var
  aux1, aux2 : String;
  passou2, passou : Boolean;
  z : Integer;
Begin
    aux1 := FormatCurr('000,000.0000000', v);
    aux1 := Copy(aux1,1,10);
    aux2 := '';
    passou := False;
    passou2 := False;
    for z := 1 to length(aux1) do
    Begin
      if passou then
      Begin
        aux2 := aux2 + Copy(aux1,z,1);
      end
      else
      Begin
        if (Copy(aux1,z,1) = ',') then
        Begin
          aux2 := aux2 + ',';
          passou := True;
        end
        else
        Begin
          if (Copy(aux1,z,1) <> '.') and ((Copy(aux1,z,1) <> '0') or (passou2)) then
          Begin
            aux2 := aux2 + Copy(aux1,z,1);
            passou2 := True;
          end;
        end;
      end;
    end;
    Result := StrToFloat(aux2);
end;

Function ConvDoc(saga, suga, siga: string) : string;
Var
  con : integer;
  xy  : integer;
begin
  result := '';
  if suga  = '1' then
  begin
    xy := 1;
    con := length(saga);
    while (xy - 1) < con do
    begin
      if (copy(saga,xy,1) <> '.') and (copy(saga,xy,1) <> '-') and (copy(saga,xy,1) <> '/') and (copy(saga,xy,1) <> '\') then result := result + copy(saga,xy,1);
      xy := xy + 1;
    end;
  end
  else
  begin
    xy  := 1;
    con := length(saga);
    if siga = 'CPF' then
    begin
      while (xy - 1) < con do
      begin
        if xy = 4 then
        begin
          Result := Result + '.' + copy(saga,xy,1);
        end;
        if xy = 7 then
        begin
          Result := Result + '.' + copy(saga,xy,1);
        end;
        if xy = 10 then
        begin
           Result := Result + '-' + copy(saga,xy,1);
        end;
        if (xy <> 4) and (xy <> 7) and (xy <> 10) then
        begin
          Result := Result + copy(saga,xy,1);
        end;
        xy := xy + 1;
      end;
    end
    else
    begin
      while (xy - 1) < con do
      begin
        if xy = 3 then
        begin
          Result := Result + '.' + copy(saga,xy,1);
        end;
        if xy = 6 then
        begin
          Result := Result + '.' + copy(saga,xy,1);
        end;
        if xy = 9 then
        begin
          Result := Result + '/' + copy(saga,xy,1);
        end;
        if xy = 13 then
        begin
          Result := Result + '-' + copy(saga,xy,1);
        end;
        if (xy <> 3) and (xy <> 6) and (xy <> 9) and (xy <> 13) then
        begin
          Result := Result + copy(saga,xy,1);
        end;
        xy := xy + 1;
      end;
    end;
  end;
end;

Function TruncaArre(valor:currency):Currency;
begin
  result := StrToCurr(FloatToStrF(valor,fffixed,12,1));
end;

Function Permissao(campo : String) : Boolean;
var
  x : Integer;
begin
  if (F_Menu.Label15.Caption = 'T') AND
     (campo <> 'acesso063')         then
  begin
    Result := True;
    Exit;
  end;
  Result := False;
  Dm.Permissao.Close;
  Dm.Permissao.Sql.Clear;
  Dm.Permissao.Sql.Add('SELECT ' + campo + ' FROM permissao');
  Dm.Permissao.Sql.Add('WHERE');
  Dm.Permissao.Sql.Add('usuario = ' + F_Menu.Label14.Caption);
  Dm.Permissao.Open;
  if (Dm.Permissao.FieldByName(campo).asString = 'T') then Result := True;
  Dm.Permissao.Close;
end;


Function TF_Menu.DefineSub(arq_img : String) : String;
Begin
  Result := '';
  if StrToInt(arq_img) < 1000 then result := '0000\' else
  begin
    Result := IntToStr(StrToInt(arq_img));
    Result := Copy(Result, 1, length(Result) - 3);
    Result := floattostr(strtofloat(result));
    Result := strzero(Result, 4) + '\';
  end;
end;

Function StrZero2(Cadeia : String; Casas : Integer; Posicao : String): String;
var
  branco : String;
Begin
  Result := '';
  cadeia := Trim(cadeia);
  branco := StringOfChar('0', 1000);
  if (posicao = 'E') then
  begin
    Result := copy(branco + cadeia, length(branco + cadeia) - (casas - 1), casas);
  end
  else Result := Copy(cadeia + branco, 1, casas);
end;

Function Strzero(Numero : String;Casas : Integer) : String;
Begin
  result := stringofchar('0',(casas-length(trim(numero)))) + trim(numero);
end;

Function StrZero3( ValorInteiro, Tamanho : Integer) : String;
begin
  if tamanho > 20 then ShowMessage('Tamanho máximo de 20 caracteres');
  result := '00000000000000000000' + IntToStr(ValorInteiro);
  result := Copy(result, length(result) - (tamanho - 1), tamanho);
end;

function right( strng : string ; qtd : integer ) : string;
var
  pos : integer;
begin
  pos    := length(trim(strng));
  result := '';
  repeat
    result := copy(strng,pos,1) + result;
    pos := pos - 1;
    qtd := qtd - 1;
  until qtd < 1;
end;

Function ValidNumero(num : String) : Boolean;
begin
  try
    StrToInt(Trim(num));
    Result := True;
  except
    Result := False;
  end;  
end;

Function TirarPonto(texto : String) : String;
var
  Posi : Integer;
begin
  Result := '';
  Result := Trim(Texto);
  Posi   := 0;
  Posi   := Pos('.', texto);
  Result := Trim(Copy(Texto, 1, (Posi - 1)) + '' + Copy(Texto, (Posi + 1), Length(Texto)));
end;

Function TrocaVirgulaporPonto(texto : String) : String;
var
  Posi : Integer;
begin
  Result := '';
  Result := Trim(Texto);
  Posi   := 0;
  Posi   := Pos(',', texto);
  if posi > 0 then
  Result := Trim(Copy(Texto, 1, (Posi - 1)) + '.' + Copy(Texto, (Posi + 1), Length(Texto)));
end;

Function TrocaPontoporVirgula(texto : String) : String;
var
  Posi : Integer;
begin
  Result := '';
  Result := Trim(Texto);
  Posi   := 0;
  Posi   := Pos('.', texto);
  if posi > 0 then
  Result := Trim(Copy(Texto, 1, (Posi - 1)) + ',' + Copy(Texto, (Posi + 1), Length(Texto)));
end;

Function PegaAte( stringa, ate, direcao : string) : string;
var
  xy, tam_ate : integer;
begin
  result  := '';
  if direcao = 'R' then
    begin
      for xy := length(stringa) downto 1 do
        begin
          if copy(stringa,xy,1) = ate then break else result := copy(stringa,xy,1) + result;
        end;
    end
  else if direcao = 'L' then
    begin
      for xy := 1 to length(stringa) do
        begin
          if copy(stringa,xy,1) = ate then break else result := result + copy(stringa,xy,1);
        end;
    end;

    end;


Function TirarTudo(BaseString, BreakString, BreakString1, BreakString2 : String): String;
var
  EndOfCurrentString: byte;
  TempStr: string;
  x, y   : Integer;
begin
  result := '';
  x := 0;
  y := Length(BaseString);
  while x <= y do
  begin
    EndOfCurrentString := Pos(BreakString, BaseString);
    if EndOfCurrentString = 0 then
    begin
      Result := Result + BaseString;
      x := x + 1000;
    end
    else
    begin
      Result := Result + Copy(BaseString, 1, EndOfCurrentString - 1);
      BaseString := Copy(BaseString, EndOfCurrentString + length(BreakString), length(BaseString) - EndOfCurrentString);
    end;
    x := x + 1;
  end;
  BaseString := Result;
  if (Trim(BreakString1) <> '') then
  begin
    Result := '';
    x      := 0;
    y      := Length(BaseString);
    while x <= y do
    begin
      EndOfCurrentString := Pos(BreakString1, BaseString);
      if EndOfCurrentString = 0 then
      begin
        Result := Result + BaseString;
        x := x + 1000;
      end
      else
      begin
        Result := Result + Copy(BaseString, 1, EndOfCurrentString - 1);
        BaseString := Copy(BaseString, EndOfCurrentString + length(BreakString1), length(BaseString) - EndOfCurrentString);
      end;
      x := x + 1;
    end;
    BaseString := Result;
  end;
  if (Trim(BreakString2) <> '') then
  begin
    Result  := '';
    x       := 0;
    y       := Length(BaseString);
    while x <= y do
    begin
      EndOfCurrentString := Pos(BreakString2, BaseString);
      if EndOfCurrentString = 0 then
      begin
        Result := Result + BaseString;
        x := x + 1000;
      end
      else
      begin
        Result := Result + Copy(BaseString, 1, EndOfCurrentString - 1);
        BaseString := Copy(BaseString, EndOfCurrentString + length(BreakString2), length(BaseString) - EndOfCurrentString);
      end;
      x := x + 1;
    end;
  end;
  Result := Trim(Result);
end;


Procedure CriaTabela(Tipo, Tabela : String);
begin
  DestroeTabela(Tabela);
  Dm.CriaTabela.Close;
  Dm.CriaTabela.Sql.Clear;
  Dm.CriaTabela.Sql.Add('CREATE TABLE IF NOT EXISTS ' + Tabela);
  Dm.CriaTabela.Sql.Add('(recno       INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,');

  if (Tipo = 'RELATOS') then
  begin
    Dm.CriaTabela.Sql.Add('p_auxiliar          INT(11)       NULL,');
    Dm.CriaTabela.Sql.Add('registro            INT(11)       NULL,');
    Dm.CriaTabela.Sql.Add('tabela              VARCHAR(5)    NULL,');
    Dm.CriaTabela.Sql.Add('v_emolumentos       DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_emoladicional     DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_mic               DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_pag               DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_viaexc            DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_digitalizacao     DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_informatica       DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_graveletr         DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_conferencia       DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_distrib           DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_tribunal          DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_defensoria        DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_procuradoria      DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_mutua             DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_acoterj           DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_infodistrib       DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_graveletrdistrib  DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_subtotal          DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('v_total             DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('custas              DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('a_nome              VARCHAR(200)  NULL,');
    Dm.CriaTabela.Sql.Add('valor_base          DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('contato             VARCHAR(60)   NULL,');
    Dm.CriaTabela.Sql.Add('ext_nat             VARCHAR(60)   NULL,');
    Dm.CriaTabela.Sql.Add('livro_b             INT(5)        NULL,');
    Dm.CriaTabela.Sql.Add('folha_b             INT(5)        NULL,');
    // OS 644
    Dm.CriaTabela.Sql.Add('selo_serie          VARCHAR(4)    NULL,');
    Dm.CriaTabela.Sql.Add('selo_numero         VARCHAR(6)    NULL,');
    Dm.CriaTabela.Sql.Add('daje                VARCHAR(10)   NULL,');
    // OS 856
    Dm.CriaTabela.Sql.Add('qtdpost             INT(11)       NULL,');
    Dm.CriaTabela.Sql.Add('valordajepost       DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('dajepost            VARCHAR(10)   NULL,');
    //
    Dm.CriaTabela.Sql.Add('tp_prot             CHAR(1)       NULL)');

  end;

  if (Tipo = 'CALCATOS') then
  begin
    Dm.CriaTabela.Sql.Add('data                DATE          NULL,');
    Dm.CriaTabela.Sql.Add('codigo              INT(11)       NULL,');
    Dm.CriaTabela.Sql.Add('descricao           VARCHAR(250)  NULL,');
    Dm.CriaTabela.Sql.Add('tabela              VARCHAR(5)    NULL,');
    Dm.CriaTabela.Sql.Add('item_tab            VARCHAR(5)    NULL,');
    Dm.CriaTabela.Sql.Add('subitem             VARCHAR(5)    NULL,');
    Dm.CriaTabela.Sql.Add('descr_tab           VARCHAR(250)  NULL,');
    Dm.CriaTabela.Sql.Add('valor_unit          DECIMAL(18,2) NULL,');
    Dm.CriaTabela.Sql.Add('qtde                INT(6)        NULL,');
    Dm.CriaTabela.Sql.Add('valor_calc          DECIMAL(18,2) NULL)');
  end;

  Dm.CriaTabela.ExecSQL;
end;

Procedure DestroeTabela(Tabela : String);
begin
  if (Tabela <> 'td')       AND
     (Tabela <> 'td_pesso') AND
     (Tabela <> 'td_cert')  then
  begin
    Dm.CriaTabela.Close;
    Dm.CriaTabela.Sql.Clear;
    Dm.CriaTabela.Sql.Add('DROP TABLE IF EXISTS ' + Tabela);
    try
      Dm.CriaTabela.ExecSql;
    except
    end;
  end;
end;




Procedure Carrega_Ocorrencias;
begin
  Dm.Cad_Ir.Close;
  Dm.Cad_Ir.Sql.Clear;
  Dm.Cad_Ir.Sql.Add('SELECT * FROM cad_ir');
  Dm.Cad_Ir.Sql.Add('ORDER BY motivo');
  Dm.Cad_Ir.Open;
  if (Dm.Cad_Ir.RecordCount <> 0) then
  begin
    while (not Dm.Cad_ir.Eof) do
    begin
      if (Assigned(F_BxRet))   then F_BxRet.ComboBox1.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').AsString, 5)    + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').AsString));
      if (Assigned(F_BaixaN))  then F_BaixaN.ComboBox1.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').AsString, 5)   + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').AsString));
      if (Assigned(F_BxRetPro))then F_BxRetPro.ComboBox1.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').AsString, 5) + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').AsString));
      if (Assigned(F_CorBaiE)) then F_CorBaiE.ComboBox4.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').AsString, 5)  + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').AsString));
      if (Assigned(F_CorBaiP)) then F_CorBaiP.ComboBox4.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').AsString, 5)  + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').AsString));
      Dm.Cad_Ir.Next;
    end;
  end;
  Dm.Cad_Ir.Close;
end;

Procedure Carrega_Clientes;
begin
 {
  Dm.Escrit.Close;
  Dm.Escrit.RequestLive := False;
  Dm.Escrit.Sql.Clear;
  Dm.Escrit.Sql.Add('SELECT codigo, escritorio, tip_doc, doc, endereco, contato, tel, ncliente');
  Dm.Escrit.Sql.Add('FROM escrit');
  Dm.Escrit.Sql.Add('GROUP BY codigo');
  Dm.Escrit.Sql.Add('ORDER BY escritorio');
  Dm.Escrit.Open;
  if (Dm.Escrit.RecordCount <> 0) then
  begin
    while (not Dm.Escrit.Eof) do
    begin
      if (Assigned(F_RecepR)) then
      begin
        F_RecepR.ComboBox2.Items.Add(StrZero(Dm.Escrit.FieldByName('codigo').AsString, 3)                   + ' - ' +
                                     StrBranco(Trim(Dm.Escrit.FieldByName('escritorio').AsString), 60, 'D') + ' ' +
                                     StrBranco(Trim(Dm.Escrit.FieldByName('tip_doc').AsString), 4, 'D')     + ' ' +
                                     StrBranco(Trim(Dm.Escrit.FieldByName('doc').AsString), 20, 'D')        + ' ' +
                                     StrBranco(Trim(Dm.Escrit.FieldByName('tel').AsString), 20, 'D')        + ' ' +
                                     StrBranco(Trim(Dm.Escrit.FieldByName('contato').AsString), 60, 'D')    + ' ' +
                                     StrZero(Dm.Escrit.FieldByName('ncliente').AsString, 3));
      end;
      Dm.Escrit.Next;
    end;
  end;
  Dm.Escrit.Close;
  Dm.Escrit.RequestLive := True;
  }
end;

Procedure Carrega_ConfigAdm;
begin
  DM.Config_Adm.Close;
  Dm.Config_Adm.Sql.Clear;
  Dm.Config_Adm.Sql.Add('SELECT * FROM config_adm');
  Dm.Config_Adm.Open;
end;

Procedure Carrega_Configuracao;
begin
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur where tcartorio = "' + F_Menu.Label37.Caption + '"');
  Dm.Configur.Open;

  F_Menu.Label4.Caption    := Dm.Configur.FieldByName('dir_cert').asString;
  F_Menu.Label49.Caption   := Dm.Configur.FieldByName('imgSeloCertidaoImagem').asString;

  TrabalhaComQRCode        := Dm.Configur.FieldByName('trabalhacomqrcode').AsBoolean;

  caminho_imgselo := 'c:\siscart\imgselo\td\';
  If Not DirectoryExists(caminho_imgselo) then  //QrCode
    ForceDirectories(caminho_imgselo);

  F_Menu.Label50.Caption    := Dm.Configur.FieldByName('site').asString;
  F_Menu.Label6.Caption    := Dm.Configur.FieldByName('estado').asString;
  F_Menu.Label54.Caption    := Dm.Configur.FieldByName('ambiente_trabalho').asString;
  F_Menu.Label58.Caption    := Dm.Configur.FieldByName('tot_prot_lva_p').asString;

  F_Menu.CaminhoImagemAnimal.Caption:= Dm.Configur.FieldByName('dir_imagem_animal').asString;

  F_Menu.LbNomeTitular.Caption := Dm.Configur.FieldByName('titular').asString;
  F_Menu.Label7.Caption    := Dm.Configur.FieldByName('cidade').asString;
  F_Menu.Label8.Caption    := Dm.Configur.FieldByName('dir_modrec').asString;
  F_Menu.Label16.Caption   := Dm.Configur.FieldByName('dir_modexig').asString; //Caminho onde tambem se encontra os termos de encerramento e abertura
  F_Menu.Label9.Caption    := Trim(Dm.Configur.FieldByName('cartorio').asString) + ' da Comarca de ' + Trim(Dm.Configur.FieldByName('cidade').asString) + ' / ' + Trim(Dm.Configur.FieldByName('estado').asString);
  F_menu.Label29.Caption   := Trim(Dm.Configur.FieldByName('cartorio').asString);
  F_Menu.Caption           := UpperCase(F_Menu.Label9.Caption) + UpperCase(dm.RetornaVersaoExecutavel);
  F_Menu.Label11.Caption   := Trim(Dm.Configur.FieldByName('endereco').asString);
  F_Menu.Label12.Caption   := 'TEL:' + Trim(Dm.Configur.FieldByName('telefone').asString) + '-' + Trim(Dm.Configur.FieldByName('fax').asString);
  F_Menu.Label13.Caption   := Trim(Dm.Configur.FieldByName('titulo').AsString);
  F_Menu.Label17.Caption   := Trim(Dm.Configur.FieldByName('imagens').AsString);
  F_Menu.laser.caption     := Dm.Configur.FieldByName('imp_laser').AsString;
  F_Menu.laser2.caption    := Dm.Configur.FieldByName('imp_laser2').AsString;
  F_Menu.matricial.caption := dm.Configur.FieldByName('imp_matricial').AsString;
  F_Menu.bematech.Caption  := dm.Configur.FieldByName('imp_bematech').AsString;
  F_Menu.Label27.Caption   := Dm.Configur.FieldByName('dir_ret').asString;
  F_Menu.Label32.Caption   := Dm.Configur.FieldByName('dir_conf').asString;
  F_Menu.Label32.Caption   := Dm.Configur.FieldByName('dir_conf').asString;
  F_Menu.Label33.Caption   := Dm.Configur.FieldByName('dir_cor').asString;
  F_Menu.importcsv.Caption := Dm.Configur.FieldByName('import_csv').asString;
  F_Menu.Label18.Caption   := Trim(Dm.Configur.FieldByName('dir_exig').asString);
  F_Menu.Label47.Caption   := Trim(Dm.Configur.FieldByName('dir_cert_notificacao').asString);
  F_Menu.Label35.Caption   := Trim(Dm.Configur.FieldByName('endereco').asString);
  F_Menu.Label12.Caption   := 'TEL.:' + Trim(Dm.Configur.FieldByName('telefone').asString); // + ' - ' + Trim(Dm.Configur.FieldByName('fax').asString);
  //F_Menu.Label11.Caption   := F_Menu.Label11.Caption + ' - ' + F_Menu.Label7.Caption + ' - ' + F_Menu.Label12.Caption;
  F_Menu.Label13.Caption   := Trim(Dm.Configur.FieldByName('titulo').asString);
  F_Menu.LbCaminhoExportaPDF.Caption:= Dm.Configur.FieldByName('caminhoDoExportaPDF').AsString;  
  F_Menu.Label20.Caption   := Dm.Configur.FieldByName('mensagem1').asString;
  F_Menu.Label21.Caption   := Dm.Configur.FieldByName('mensagem2').asString;
  F_Menu.Label22.Caption   := Dm.Configur.FieldByName('mensagem3').asString;
  F_Menu.Label23.Caption   := Dm.Configur.FieldByName('mensagem4').asString;
  F_Menu.Label28.Caption   := Dm.Configur.FieldByName('mensagem5').asString;
  F_Menu.Label34.Caption   := Dm.Configur.FieldByName('cod_correio').asString;
  F_Menu.Label42.Caption   := Dm.Configur.FieldByName('prazo_t_t').asString;
  F_Menu.Label43.Caption   := Dm.Configur.FieldByName('prazo_t_n').asString;
  F_Menu.Labelcep.Caption  := 'CEP: ' + Dm.Configur.FieldByName('cep').asString;
  F_Menu.Label36.Caption   := 'CEP: ' + Dm.Configur.FieldByName('cep').asString  + ' / ' + F_Menu.Label12.Caption;
  F_Menu.Label51.Caption   := Dm.Configur.FieldByName('dir_centralrtd').asString;
  //cnpj                     := Dm.Configur.FieldByName('cnpj').asString;
  F_Menu.Label39.Caption   := Dm.Configur.FieldByName('cnpj').asString;
  F_Menu.cnpj                     := F_Menu.Label39.Caption;
  f_menu.label40.caption   := dm.configur.fieldbyname('horario_atendimento').asstring;
  Bematech_porta           := dm.Configur.FieldByName('bematech_porta').AsString;
  cert_vias                := dm.Configur.Fieldbyname('cert_vias').AsInteger;
  F_Menu.bematech2.Caption := dm.Configur.FieldByName('imp_bematech2').AsString;
  nomeescrevente           := dm.Configur.FieldByName('nomeescrevente').AsString;
  cpfescrevente            := dm.configur.FieldByName('cpfescrevente').AsString;
  matriculaescrevente      := dm.Configur.FieldByName('matriculaescrevente').AsString;
  camino_xml               := dm.Configur.FieldByName('caminho_xml').AsString;
  email                    := dm.configur.FieldByName('email').AsString;
  F_Menu.Label55.Caption   := dm.configur.FieldByName('email').AsString;
  F_Menu.LbCaminhoDajeIntegracao.Caption   := dm.configur.FieldByName('caminho_daje_integra').AsString;


  PermiteRecepcaoSemDAJE   := False;//dm.configur.FieldByName('PermiteRecepcaoSemDAJE').AsBoolean;
  F_Menu.livroAutomatico :=  dm.Configur.FieldByName('trab_livro_automat').AsBoolean;

  F_Menu.Label57.Caption   := dm.Configur.FieldByName('desab_lf_cabec').AsString;

  If Dm.Configur.FieldByName('chk_Image_Averb').AsBoolean Then
    F_Menu.Label52.Caption   := 'S'
  Else
    F_Menu.Label52.Caption   := 'N';

  prazo_dias_uteis         := Dm.Configur.FieldByName('prazo_diasUteis').AsBoolean;

  cod_serventia            := dm.configur.fieldByName('serventia').AsString;
  porta_cert               := dm.Configur.FieldbyName('porta_cert').AsString;
  v_chk_01                 := dm.Configur.FieldByNAme('chk_01').AsBoolean;
  v_chk_02                 := dm.Configur.FieldByNAme('chk_02').AsBoolean;
  v_chk_03                 := dm.Configur.FieldByName('chk_03').AsBoolean;
  v_chk_04                 := dm.Configur.FieldByName('chk_04').AsBoolean;
  v_chk_05                 := dm.Configur.FieldByName('chk_05').AsBoolean;
  v_chk_06                 := dm.Configur.FieldByName('chk_06').AsBoolean;
  v_chk_07                 := dm.Configur.FieldByName('chk_07').AsBoolean;
  v_chk_08                 := dm.Configur.FieldByName('chk_08').AsBoolean;
  v_chk_09                 := dm.Configur.FieldByName('chk_09').AsBoolean;
  v_chk_10                 := dm.Configur.FieldByName('chk_10').AsBoolean;
  v_chk_11                 := dm.Configur.FieldByName('chk_11').AsBoolean;
  v_chk_12                 := dm.Configur.FieldByName('chk_12').AsBoolean;
  v_chk_13                 := dm.Configur.FieldByName('chk_13').AsBoolean;
  v_chk_14                 := dm.Configur.FieldByName('chk_14').AsBoolean;
  v_chk_15                 := dm.Configur.FieldByName('chk_15').AsBoolean;
  v_chk_16                 := dm.Configur.FieldByName('chk_16').AsBoolean;
  v_chk_18                 := dm.Configur.FieldByName('chk_18').AsBoolean;
  v_chk_19                 := dm.Configur.FieldByName('chk_19').AsBoolean;
  v_chk_20                 := dm.Configur.FieldByName('chk_20').AsBoolean;
  v_chk_17                 := dm.Configur.FieldByName('chk_17').AsBoolean;
  F_Menu.Label44.Caption   := dm.Configur.FieldbyName('imp_etq_matr').AsString;
  id_eselo                 := dm.Configur.FieldbyName('id_eselo').AsString;
  F_Menu.gerarDajeIsento          := dm.Configur.FieldbyName('gerarDajeIsento').AsBoolean;

  //Averbacao
  ModalidadeAverbacaoCapital:= dm.Configur.FieldbyName('ModalidadeAverbacaoCapital').AsString = 'T';
  F_Menu.Label56.Caption   := dm.Configur.FieldbyName('ModalidadeAverbacaoCapital').AsString;

  dir_daje                 := dm.Configur.FieldbyName('imagensdaje').AsString;
  emol_daje                := dm.Configur.FieldByName('emol_daje').AsCurrency;
  tx_fisc_daje             := dm.Configur.FieldByName('tx_fiscal_daje').AsCurrency;
  fecom_daje               := dm.Configur.FieldByName('fecom_daje').AsCurrency;
  def_pub_daje             := dm.Configur.FieldByName('def_pub_daje').AsCurrency;
  perc_pge                 := dm.Configur.FieldByName('vr_pge').AsCurrency;
  fmmpba                   := dm.Configur.FieldByName('fmmpba').AsCurrency;

  Dm.liberaNaturesaTelaExame := (dm.Configur.FieldByName('PermiteEdicaoNaturesaExame').AsString <> 'F');
  Dm.PermitirSelecionarFolhaParaEnvio:= dm.Configur.FieldByName('PermiteSelecionarFolCert').AsBoolean; 
  Dm.Dir_CamImagensNotificBMP:= dm.Configur.FieldByName('dir_CamImagensNotificBMP').AsString;
  sCaminhoDosCarimbos   := dm.Configur.FieldByName('Caminho_Carimbo').AsString;
  BuscaExataEmTituloRegEProtocolados := dm.Configur.FieldByName('BuscaExataEmTituloRegEProtoc').AsBoolean;
  CaminhoDoExecutavelAtualiza := dm.Configur.FieldByName('caminhoExecutavel').AsString;
  Dm.Configur.Close;
  DM.Config_Adm.Close;
  Dm.Config_Adm.Sql.Clear;
  Dm.Config_Adm.Sql.Add('SELECT * FROM config_adm');
  Dm.Config_Adm.Open;

  a_chk06   := Dm.Config_Adm.fieldbyname('chk_06').AsBoolean;
  a_chk07   := Dm.Config_Adm.fieldbyname('chk_07').AsBoolean;
  a_chk08   := Dm.Config_Adm.fieldbyname('chk_08').AsBoolean;
  a_chk09   := Dm.Config_Adm.fieldbyname('chk_09').AsBoolean;
  a_chk11   := Dm.Config_Adm.fieldbyname('chk_11').AsBoolean;
  a_chk12   := Dm.Config_Adm.fieldbyname('chk_12').AsBoolean;
  a_implva1 := Dm.Config_Adm.fieldbyname('imp_lva1').AsBoolean;
  a_implva2 := Dm.Config_Adm.fieldbyname('imp_lva2').AsBoolean;
  a_implva3 := Dm.Config_Adm.fieldbyname('imp_lva3').AsBoolean;
  a_implva4 := Dm.Config_Adm.fieldbyname('imp_lva4').AsBoolean;
  a_implvb1 := Dm.Config_Adm.fieldbyname('imp_lvb1').AsBoolean;
  a_implvb2 := Dm.Config_Adm.fieldbyname('imp_lvb2').AsBoolean;
  a_implvb3 := Dm.Config_Adm.fieldbyname('imp_lvb3').AsBoolean;
  a_implvb4 := Dm.Config_Adm.fieldbyname('imp_lvb4').AsBoolean;
end;

Procedure Carrega_NatCer(Form : String);
begin
  Dm.NatCer.Close;
  Dm.NatCer.Sql.Clear;
  Dm.NatCer.Sql.Add('SELECT * FROM natcer');
  Dm.NatCer.Sql.Add('ORDER BY natureza');
  Dm.NatCer.Open;
  if (Dm.NatCer.RecordCount <> 0) then
  begin
    while (not Dm.NatCer.Eof) do
    begin
      if (Maiusculo(Form) = 'RECEPC') then F_RecepC.ComboBox1.Items.Add(StrZero(Dm.NatCer.FieldByName('cod').AsString, 3) + ' - ' + StrBranco(Dm.NatCer.FieldByName('natureza').AsString, 50, 'D') + ' - ' + StrZero(Dm.NatCer.FieldByName('prazo').AsString, 2) + Dm.NatCer.FieldByName('uteis').AsString);
      if (Maiusculo(Form) = 'EXAMEC') then F_ExameC.ComboBox3.Items.Add(StrZero(Dm.NatCer.FieldByName('cod').AsString, 3) + ' - ' + StrBranco(Dm.NatCer.FieldByName('natureza').AsString, 50, 'D') + ' - ' + StrZero(Dm.NatCer.FieldByName('prazo').AsString, 2) + Dm.NatCer.FieldByName('uteis').AsString);      
      Dm.NatCer.Next;
    end;  
  end;
  Dm.NatCer.Close;
end;

// Atribui propriedade ao componente, dado seu valor como string
procedure AtribuiProp(Comp: TComponent; Const PropName: string; Val: string);
var
  PInfo: PPropInfo;
begin
  // Pega informações de tipo da propriedade
  PInfo := GetPropInfo(Comp.ClassInfo, PropName);
  // Achou?
  if PInfo <> nil then
  begin
    // Trata conforme o tipo
    case PInfo^.Proptype^.Kind of
      tkInteger: SetOrdProp(Comp, PInfo, StrToInt(Val));
      tkChar, tkWChar: SetOrdProp(Comp, PInfo, ord(Val[1]));
      tkEnumeration: SetOrdProp(Comp, PInfo, GetEnumValue(PInfo^.PropType^, Val));
      tkFloat: SetFloatProp(Comp, PInfo, StrToFloat(Val));
      tkString, tkLString, tkWString: SetStrProp(Comp, PInfo, Val);
      tkVariant: SetVariantProp(Comp, PInfo, Val);
      tkInt64: SetInt64Prop(Comp, PInfo, StrToInt64(Val));
      else ShowMessage('Este tipo não é suportado por este programa');
    end;
  end
  else ShowMessage('Propriedade não encontrada');
end;

// Lê valor da propriedade do componente
function LeProp(Comp: TComponent; Const PropName: string): string;
var
  PInfo: PPropInfo;
begin
  Result := '';
  // Pega informações de tipo da propriedade
  PInfo := GetPropInfo(Comp.ClassInfo, PropName);
  // Achou?
  if PInfo <> nil then
  begin
    // Trata conforme o tipo
    case PInfo^.Proptype^.Kind of
      tkInteger: Result := IntToStr(GetOrdProp(Comp, PInfo));
      tkChar, tkWChar: Result := char(GetOrdProp(Comp, PInfo));
      tkEnumeration: Result := GetEnumName(PInfo^.PropType^, GetOrdProp(Comp, PInfo));
      tkFloat: Result := FloatToStr(GetFloatProp(Comp, PInfo));
      tkString, tkLString, tkWString: Result := GetStrProp(Comp, PInfo);
      tkVariant: GetVariantProp(Comp, PInfo);
      tkInt64: Result := IntToStr(GetInt64Prop(Comp, PInfo));
      else ShowMessage('Este tipo não é suportado por este programa');
    end;
  end
  else ShowMessage('Propriedade não encontrada');
end;

procedure TF_Menu.ColorControl(Sender: TObject);
var
  Cor: TColor;
  DD: integer;
begin
  if not FecharProg then
  begin
     with screen.activeform do
     begin
        if active then
        begin
           for DD:= 0 to ComponentCount -1 do
           begin
              if (Components[DD] is TCustomEdit) then
              begin
                 if (Components[DD] as TCustomEdit).Focused then
                    Cor := claqua
                 else
                    Cor := clWindow;
                 AtribuiProp(Components[DD],'Color',IntToStr(Cor));
              end;
           end;
        end;
     end;
  end;
end;

Procedure Carrega_Usuarios;
begin
  Dm.Usuarios.Close;
  Dm.Usuarios.Sql.Clear;
  Dm.Usuarios.Sql.Add('SELECT u_apel FROM usuarios');
  Dm.Usuarios.Sql.Add('ORDER BY u_apel');
  Dm.Usuarios.Open;
  if (Dm.Usuarios.RecordCount <> 0) then
  begin
    while (not Dm.Usuarios.Eof) do
    begin
      if (Assigned(F_CaixaF)) then F_CaixaF.ComboBox1.Items.Add(Trim(Dm.Usuarios.FieldByName('u_apel').AsString));
      if (Assigned(F_CaixaI)) then F_CaixaI.ComboBox1.Items.Add(Trim(Dm.Usuarios.FieldByName('u_apel').AsString));
      Dm.Usuarios.Next;
    end;
  end;
  if (Assigned(F_CaixaF)) then F_CaixaF.ComboBox1.Items.Add('GERAL');
  if (Assigned(F_CaixaI)) then F_CaixaI.ComboBox1.Items.Add('GERAL');
end;

Function Maiusculo(Texto : String) : String;
var
  x, p : Integer;
begin
  Result := '';
  for x := 1 to Length(texto) do
  begin
    p := pos(Copy(texto, x,1), F_Menu.MaskEdit2.Text);
    if (p <> 0) then
    begin
      Result := Result + Copy(F_Menu.MaskEdit1.Text, p, 1);
    end
    else Result := Result + UpperCase(Copy(texto, x,1));
  end;
end;


Function Verificacao : Boolean;
var
  dir : String;
Begin
  result := true;
  {dir := 'c:\siscart\temp\td';
  if not directoryexists(dir) then
  begin
    ForceDirectories(Dir);
    if not directoryexists(dir) then
    begin
      result := false;
      showmessage('Não foi possível configurar seu computador automaticamente. O sistema não pode ser executado. (1)');
      exit;
    end
  end;
  if fileexists('apoio.dbf') then copyfile(pchar('apoio.dbf'), pchar(dir + '\apoio.dbf'), false);
  if not fileexists(dir + '\apoio.dbf') then
  begin
    result := false;
    showmessage('Não foi possível configurar seu computador automaticamente. O sistema não pode ser executado. (2)');
    exit;
  end;}
end;

procedure Bloquear;
Begin
  DM.ArqAux.Close;
  DM.ArqAux.Sql.Clear;
  DM.ArqAux.Sql.Add('alter table usuarios change u_nome siscart varchar(50)');
  DM.ArqAux.ExecSQL;

  DM.ArqAux.Close;
  DM.ArqAux.Sql.Clear;
  DM.ArqAux.Sql.Add('select * from usuarios where 1 = 2');
end;


procedure TF_Menu.Sair1Click(Sender: TObject);
begin
  FecharProg := True;
  Application.Terminate;
end;

procedure TF_Menu.Normal1Click(Sender: TObject);
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

function TF_Menu.Crypt(Action, Src: String): String;
Label Fim;
var KeyLen : Integer;
    KeyPos : Integer;
    OffSet : Integer;
    Dest, Key : String;
    SrcPos : Integer;
    SrcAsc : Integer;
    TmpSrcAsc : Integer;
    Range : Integer;
begin
  if (Src = '') Then
  begin
    Result:= '';
    Goto Fim;
  end;
  Key := 'AQUI VOCE CRIA SUA CHAVE PARA CRIPTOGRAFAR';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
            Application.ProcessMessages;
            SrcAsc := (Ord(Src[srcPos]) + OffSet) Mod 255;
            if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;

            SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
            Dest := Dest + Format('%1.2x',[srcAsc]);
            OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$' + copy(Src,1,2));//<--------------- adiciona o $ entra as aspas simples
    SrcPos := 3;
    repeat
      SrcAsc := StrToInt('$' + copy(Src,SrcPos,2));//<--------------- adiciona o $ entra as aspas simples
      if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
      TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
  Result:= Dest;

  Fim:
end;


procedure TF_Menu.FormActivate(Sender: TObject);
var
  vcnpj,
  CodCliLicenca,
  dt_trava : String;
begin
///////////////////////////////////////////////////////////////////////
//VerificaLicenca(CodCliLicenca, '000', 'Q', Dm.ArqAux);
//CodCliLicenca - Fixo
//(000)         - CÓDIGO DO CLIENTE CADASTRADO NO SISOS
//(Q ou Z)      - SE UTILIZA QUERY OU ZEQUERY (ZEOS)
//Dm.ArqAux     - Nome da DM.QryUmaqueryqueestejacomREQUESTILVEativo
///////////////////////////////////////////////////////////////////////

  vcnpj       := '';
  Dm.configpt.Sql.Clear;
  Dm.configpt.Active := False;
  Dm.configpt.Sql.Add('SELECT * FROM configur');
  Dm.configpt.Active := True;
  Dm.configpt.first;

  vcnpj := Trim(DM.configpt.fieldbyname('cnpj').AsString);
  vcnpj := StringReplace(vcnpj, '.', '', [rfreplaceall]);
  vcnpj := StringReplace(vcnpj, '-', '', [rfreplaceall]);
  vcnpj := StringReplace(vcnpj, '/', '', [rfreplaceall]);
  CodCliLicenca := Trim(DM.configpt.fieldbyname('CodCliLicenca').AsString);

  if vcnpj = '' then
  begin
    Screen.Cursor := crDefault;
    ShowMessage('Não há CNPJ cadastrado');
    exit;
  end;

  if ((codCliLicenca = '') or (codCliLicenca = '000')) then
    CodCliLicenca := '999'
  else
    CodCliLicenca := Crypt('D', CodCliLicenca);

  if CodCliLicenca = '999' then
  begin
    ShowMessage('Erro código 42. Contate a Siscart: (71) 4042-1022');
    Application.Terminate;
    Exit;
  end;
  VerificaLicenca(CodCliLicenca, '69', 'Q', Dm.Qry_CadImp);

  timer1.Enabled := false;

  if Label1.Caption = 'Usuario - Label1' then
  begin
    FecharProg := False;
    Screen.OnActiveControlChange := ColorControl;
    Application.CreateForm(TF_Acesso, F_Acesso);
    F_Acesso.ShowModal;
    F_Acesso.Destroy;
    F_Acesso := NIL;
  end;

{ Titulos7.Visible := false;
  if (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '27251207000195') then
    Titulos7.Visible := true;}
end;

procedure TF_Menu.Reduzida1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RecepN, F_RecepN);
  F_RecepN.Label25.caption := 'REDUZIDA';
 { Tabela.Apoio.Open;
  Tabela.Apoio.Edit;
  Tabela.apoio.fieldbyname('valor_dep').ascurrency := 0;
  tabela.apoio.fieldbyname('valor').ascurrency     := 0;
  tabela.apoio.fieldbyname('deposito').ascurrency  := 0;
  tabela.apoio.fieldbyname('valor_ch').ascurrency  := 0;
  tabela.apoio.fieldbyname('valor_di').ascurrency  := 0;
  tabela.apoio.fieldbyname('saldo').ascurrency     := 0;
  tabela.apoio.fieldbyname('distrib').ascurrency   := 0;
  tabela.apoio.fieldbyname('estado').ascurrency    := 0;
  tabela.apoio.fieldbyname('ipesp').ascurrency     := 0;
  tabela.apoio.fieldbyname('apamagis').ascurrency  := 0;
  tabela.apoio.fieldbyname('custas').ascurrency    := 0;
  Tabela.Apoio.post;
  Tabela.Apoio.Edit;
  F_RecepN.Maskedit1.text := datetostr(date);
  F_RecepN.ShowModal;
  Tabela.Apoio.Cancel;
  Tabela.Apoio.Close; }
  F_RecepN.Destroy;
end;

procedure TF_Menu.Certido1Click(Sender: TObject);
begin
  if (not Permissao('acesso051')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RecepC, F_RecepC);
  Carrega_Tabela('RECEPC', 'C');
  Carrega_Divisor('RECEPC');
  Carrega_NatCer('RECEPC');
  F_RecepC.ShowModal;
  F_RecepC.Destroy;
  F_RecepC := NIL;
end;

procedure TF_Menu.Ttulos1Click(Sender: TObject);
begin
  if (not Permissao('acesso054')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Reemi, F_Reemi);
  F_Reemi.Showmodal;
  F_Reemi.Destroy;
  F_Reemi := NIL;
end;

procedure TF_Menu.Certides1Click(Sender: TObject);
begin
  if (not Permissao('acesso055')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_ReemiC, F_ReemiC);
  F_ReemiC.Showmodal;
  F_ReemiC.Destroy;
  F_ReemiC := NIL;
end;

procedure TF_Menu.AnotaoMargem1Click(Sender: TObject);
begin
  if (not Permissao('acesso046')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Anot, F_Anot);
  F_Anot.ShowModal;
  F_Anot.Destroy;
  F_Anot := NIL;
end;

procedure TF_Menu.Ttulos2Click(Sender: TObject);
begin

  if (not Permissao('acesso044')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  Application.CreateForm(TF_Exame, F_Exame);
  if v_chk_01 then
  begin
    F_Exame.SpeedButton1.Visible := True;
    F_Exame.SpeedButton2.Visible := True;
  end
  else
  begin
    F_Exame.SpeedButton1.Visible := False;
    F_Exame.SpeedButton2.Visible := False;
  end;
  
  Carrega_Natureza('EXAME');
  Carrega_Lancamento('EXAME');
  Carrega_Tabela('EXAME', 'R');
  Carrega_Divisor('EXAME');
  Carrega_Situacao('EXAME');
  F_Exame.Maskedit2.text := datetostr(date);
  F_Exame.Maskedit1.text := '';
  F_Exame.Showmodal;
  F_Exame.Destroy;
  F_Exame := NIL;         
end;

procedure TF_Menu.Certides2Click(Sender: TObject);
begin
  if (not Permissao('acesso045')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_ExameC, F_ExameC);
  Carrega_Divisor('EXAMEC');
  Carrega_NatCer('EXAMEC');
  Carrega_Tabela('EXAMEC', 'C');
  F_ExameC.MaskEdit1.Text  := '';
  F_ExameC.ShowModal;
  F_ExameC.Destroy;
  F_ExameC := NIL;
end;

procedure TF_Menu.Baixas1Click(Sender: TObject);
begin
  if (not Permissao('acesso042')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Reg, F_Reg);
  F_Reg.MaskEdit2.Text := DateToStr(date);
  F_Reg.Showmodal;
  F_Reg.Destroy;
  F_Reg := NIL;
end;

procedure TF_Menu.Rpido1Click(Sender: TObject);
begin
  if (not Permissao('acesso043')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RegR, F_RegR);
  F_RegR.Maskedit2.text := datetostr(date);  
  F_RegR.ShowModal;
  F_RegR.Destroy;
  F_RegR := NIL;
end;

procedure TF_Menu.Ttulos3Click(Sender: TObject);
begin
  if (not Permissao('acesso056')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Dev, F_Dev);
  F_Dev.ShowModal;
  F_Dev.Destroy;
  F_Dev := NIL;
end;

procedure TF_Menu.Certido4Click(Sender: TObject);
begin
  if (not Permissao('acesso057')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_DevC, F_DevC);
  F_DevC.ShowModal;
  F_DevC.Destroy;
  F_DevC := NIL;
end;

procedure TF_Menu.Troca1Click(Sender: TObject);
begin
  if (not Permissao('acesso016')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Troca, F_Troca);
  F_Troca.Showmodal;
  F_Troca.Destroy;
  F_Troca := NIL;
end;

procedure TF_Menu.Estatsticas1Click(Sender: TObject);
begin
  if (not Permissao('acesso015')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Estat, F_Estat);
  F_Estat.ShowModal;
  F_Estat.Destroy;
  F_Estat := NIL;
end;

procedure TF_Menu.Configuraes1Click(Sender: TObject);
begin
  if (not Permissao('acesso014')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Config, F_Config);
  If F_Menu.Label7.Caption <> 'Saquarema' then
  Begin
    F_Config.Label78.Visible := False;
    F_Config.Label79.Visible := False;
  End;
  F_Config.TabbedNotebook1.PageIndex := 0;
  F_Config.ShowModal;
  F_Config.Destroy;
  F_Config := NIL;
  Carrega_Configuracao;
end;

procedure TF_Menu.Selo1Click(Sender: TObject);
begin
  if (not Permissao('acesso029')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  {Application.CreateForm(TF_SeloB, F_SeloB);
  F_SeloB.ShowModal;
  F_SeloB.Destroy;
  F_SeloB := NIL; }

  F_RelAtoPraticado:= TF_RelAtoPraticado.Create(Nil);
  F_RelAtoPraticado.ShowModal;
  F_RelAtoPraticado:= Nil;
end;

procedure TF_Menu.Protocolo1Click(Sender: TObject);
begin
  if (not Permissao('acesso031')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RPO, F_RPO);
  Carrega_Assina;
  F_RPO.Showmodal;
  F_RPO.Destroy;
  F_RPO := NIL;
end;

procedure TF_Menu.ProtocoloAuxiliar1Click(Sender: TObject);
begin
  if (not Permissao('acesso032')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RPA, F_RPA);
  Carrega_Assina;
  F_RPA.Showmodal;
  F_RPA.Destroy;
  F_RPA := NIL;
end;

procedure TF_Menu.LivrodeDepsitos1Click(Sender: TObject);
begin
  if (not Permissao('acesso037')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RDep, F_RDep);
  Carrega_Assina;
  F_RDep.Showmodal;
  F_RDep.Destroy;
  F_RDep := NIL;
end;

procedure TF_Menu.ListagemdoSinoreg1Click(Sender: TObject);
begin
{  Application.CreateForm(TF_RSIN, F_RSIN);
  F_RSIN.Showmodal;
  F_RSIN.Destroy; }
end;

procedure TF_Menu.ListagemdeConferncia1Click(Sender: TObject);
begin
  if (not Permissao('acesso036')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RConf, F_RConf);
  F_RConf.Showmodal;
  F_RConf.Destroy;
  F_RConf := NIL;
end;

procedure TF_Menu.TermosdeAberturaEncerramento1Click(Sender: TObject);
begin
  if (not Permissao('acesso038')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RTer, F_RTer);
  F_RTER.SHowmodal;
  F_RTER.Destroy;
  F_RTer := NIL;
end;
                                     
procedure TF_Menu.Aviso1Click(Sender: TObject);
begin
  if (not Permissao('acesso034')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RAV, F_RAV);
  //Carrega_Assina;
  F_Rav.Showmodal;
  F_Rav.Destroy;
  F_Rav := NIL;
end;

procedure TF_Menu.ReciboNormal1Click(Sender: TObject);
begin
  Application.CreateForm(TF_QAvNN, F_QAvNN);
  F_QAvNN.QuickRep1.Preview;
  F_QAvNN.Destroy;
end;

procedure TF_Menu.ReciboFotocpia1Click(Sender: TObject);
begin
{  Application.CreateForm(TF_RRecNF, F_RRecNF);
  F_RRecNF.Showmodal;
  F_RRecNF.Destroy; }
end;

procedure TF_Menu.CertidodeNotificaonoEntregue1Click(Sender: TObject);
begin
{  Application.CreateForm(TF_RNE, F_RNE);
  F_RNE.SHowmodal;
  F_RNE.Destroy; }
end;

procedure TF_Menu.Aviso11Click(Sender: TObject);
begin
{  Application.CreateForm(TF_Rav1, F_Rav1);
  F_Rav1.Showmodal;
  F_RAV1.Destroy; }
end;

procedure TF_Menu.Normal2Click(Sender: TObject);
begin
  if (not Permissao('acesso023')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Pesq, F_Pesq);
  Application.CreateForm(TfrmAnotacao, frmAnotacao);
  F_Pesq.ShowModal;
  F_Pesq.Destroy;
  F_Pesq := NIL;
  frmAnotacao.Destroy;
  frmAnotacao := NIL;
end;
                               
procedure TF_Menu.Localidade1Click(Sender: TObject);
begin
  if (not Permissao('acesso002')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Local, F_Local);
  F_Local.ShowModal;
  F_Local.Destroy;
  F_Local := NIL;
end;

procedure TF_Menu.Fichario1Click(Sender: TObject);
begin
  if (not Permissao('acesso006')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Fich, F_Fich);
  F_Fich.ShowModal;
  F_Fich.Destroy;
  F_Fich := NIL;
end;

procedure TF_Menu.uSURIOS1Click(Sender: TObject);
begin
  if (not Permissao('acesso004')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Usu, F_Usu);
  Application.CreateForm(TF_Permis, F_Permis);
  F_Usu.ShowModal;
  F_Permis.Destroy;
  F_Usu.Destroy;
  F_Permis := NIL;
  F_Usu    := NIL;
end;

procedure TF_Menu.Ufesp1Click(Sender: TObject);
begin
  if (not Permissao('acesso007')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Ufesp, F_Ufesp);
  F_Ufesp.ShowModal;
  F_Ufesp.Destroy;
  F_Ufesp := NIL;
end;

procedure TF_Menu.Feriados1Click(Sender: TObject);
begin
  if (not Permissao('acesso008')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Feriados, F_Feriados);
  F_Feriados.ShowModal;
  F_Feriados.Destroy;
  F_Feriados := NIL;
end;

procedure TF_Menu.BensdeGarantia1Click(Sender: TObject);
begin
{  Application.CreateForm(Tf_bgarantia, f_bgarantia);
  f_bgarantia.showmodal;
  F_Bgarantia.destroy; }
end;

procedure TF_Menu.Mensagens1Click(Sender: TObject);
begin
{  Application.CreateForm(Tf_mensagem, f_mensagem);
  f_mensagem.showmodal;
  F_mensagem.destroy; }
end;

procedure TF_Menu.Contratos2Click(Sender: TObject);
begin
  if (not Permissao('acesso005')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Cont, F_Cont);
  F_Cont.ShowModal;
  F_Cont.Destroy;
  F_Cont := NIL;
end;

procedure TF_Menu.Contratos1Click(Sender: TObject);
begin
{  Application.CreateForm(Tf_pcont, f_pcont);
  f_pcont.showmodal;
  F_PCont.destroy; }
end;

procedure TF_Menu.Pastas1Click(Sender: TObject);
begin
{  Application.CreateForm(Tf_pasta, f_pasta);
  f_pasta.showmodal;
  F_Pasta.destroy; }
end;

procedure TF_Menu.Posio1Click(Sender: TObject);
begin
  if (not Permissao('acesso025')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Info, F_Info);
  Application.CreateForm(TfrmAnotacao, frmAnotacao);
  F_Info.ShowModal;
  F_Info.Destroy;
  F_Info := NIL;
  frmAnotacao.Destroy;
  frmAnotacao := NIL;
end;

procedure TF_Menu.PosioFinanceira1Click(Sender: TObject);
begin
  if (not Permissao('acesso026')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_PosFin, F_PosFin);
  F_PosFin.ShowModal;
  F_PosFin.Destroy;
  F_PosFin := NIL;
end;

procedure TF_Menu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Shift = [SSALT]) or (key = Vk_F4) then key:= Vk_Clear;
end;

procedure TF_Menu.TrocarCOnexo1Click(Sender: TObject);
begin
  Label1.Caption := 'Usuario';
  StatusBar1.Panels.Items[1].Text := 'Usuário';
  if Label1.Caption = 'Usuario' then
  begin
    Application.CreateForm(TF_Acesso, F_Acesso);
    F_Acesso.ShowModal;
    F_Acesso.Destroy;
    F_Acesso := NIL;
  end;
  if not Verificacao then exit;
end;

procedure TF_Menu.Timer1Timer(Sender: TObject);
begin
  if Verificacao then
     StatusBar1.Panels.Items[2].Text:=  F_menu.Label7.caption + formatdatetime('" ," dd "de" mmmm "de" yyyy', date) + '     ' +  TimeToStr(time) + ' hs        ';
end;

procedure TF_Menu.Internet1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Inter, F_Inter);
  Application.CreateForm(TF_LogErro, F_LogErro);
  F_Inter.MaskEdit1.Text := DateToStr(date);
  F_Inter.showmodal;
  F_Inter.destroy;
  F_LogErro.Destroy;
  F_Inter   := NIL;
  F_LogErro := NIL;
end;

procedure TF_Menu.Fechamento1Click(Sender: TObject);
begin
  if (not Permissao('acesso060')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_CaixaF, F_CaixaF);
  Carrega_Usuarios;
  F_CaixaF.ShowModal;
  F_CaixaF.Destroy;
  F_CaixaF := NIL;
end;

procedure TF_Menu.Movimento1Click(Sender: TObject);
begin
  if (not Permissao('acesso061')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_CaixaM, F_CaixaM);
  F_CaixaM.Showmodal;
  F_CaixaM.Destroy;
  F_CaixaM := NIL;
end;


procedure TF_Menu.Imagens1Click(Sender: TObject);
begin
  if (not Permissao('acesso027')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Loc, F_Loc);
  F_Loc.ShowModal;
  F_Loc.Destroy;
  F_Loc := NIL;
end;

procedure TF_Menu.Logs1Click(Sender: TObject);
begin
  if (not Permissao('acesso020')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Logs, F_Logs);
  F_Logs.ShowModal;
  F_Logs.Destroy;
  F_Logs := NIL;
end;

procedure TF_Menu.CadastrodeSituaesdasPartes1Click(Sender: TObject);
begin
  if (not Permissao('acesso009')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Sit, F_Sit);
  F_Sit.ShowModal;
  F_Sit.Destroy;
  F_Sit := NIL;
end;

procedure TF_Menu.CadastrodosItensdaTabela1Click(Sender: TObject);
begin
  if (not Permissao('acesso010')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_CadTab, F_CadTab);
  F_CadTab.ShowModal;
  F_CadTab.Destroy;
  F_CadTab := NIL;
end;

procedure TF_Menu.Simplex1Click(Sender: TObject);
begin
{  if (not Permissao('acesso052')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_DigSIm2, F_DigSim2);
  F_DigSim2.ShowModal;
  F_DigSim2.Destroy;
  F_DigSim2 := NIL; }
end;

procedure TF_Menu.Duplex1Click(Sender: TObject);
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

procedure TF_Menu.Individual1Click(Sender: TObject);
begin
  if (not Permissao('acesso062')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_CaixaIn, F_CaixaIn);
  if Label15.Caption <> 'T' then
  begin
    Dm.CaixaIn.Close;
    if dm.CaixaIn.RequestLive = False then dm.CaixaIn.RequestLive := True;
    Dm.CaixaIn.Sql.Clear;
    Dm.CaixaIn.Sql.Add('SELECT * FROM caixaind');
    Dm.CaixaIn.Sql.Add('WHERE');
    Dm.CaixaIn.Sql.Add('    data      = ' + Chr(39) + ConvData(DateToStr(date))   + Chr(39));
    Dm.CaixaIn.Sql.Add('AND caixa     = ' + Chr(39) + Trim(F_Menu.Label1.Caption) + Chr(39));
    Dm.CaixaIn.Sql.Add('AND encerrado = "S"');
    Dm.CaixaIn.Sql.Add('ORDER BY data DESC');
    Dm.CaixaIn.Open;
    if Dm.CaixaIn.RecordCount <> 0 then
    begin 
      showmessage('Este dia já foi Encerrado!!!!');
      exit;
    end;
  end
  else
  begin
    {Caso seja nível máximo habilita todos usuários comuns}
    Dm.CaixaIn.Close;
    if dm.CaixaIn.RequestLive = False then dm.CaixaIn.RequestLive := True;
    Dm.CaixaIn.Sql.Clear;
    Dm.CaixaIn.Sql.Add('SELECT * FROM caixaind');
    Dm.CaixaIn.Sql.Add('WHERE');
    Dm.CaixaIn.Sql.Add('data = ' + Chr(39) + ConvData(DateToStr(date)) + Chr(39));
    Dm.CaixaIn.Sql.Add('ORDER BY data DESC,caixa');
    Dm.CaixaIn.Open;
    Dm.CaixaIn.FindFirst;
  end;
  F_CaixaIn.ShowModal;
  F_CaixaIn.Destroy;
  F_CaixaIn := NIL;
end;

procedure TF_Menu.Internet2Click(Sender: TObject);
begin
  if (not Permissao('acesso058')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Ret, F_Ret);
  F_Ret.showmodal;
  F_Ret.Destroy;
  F_Ret := NIL;
end;

procedure TF_Menu.Clculo1Click(Sender: TObject);
begin
  if (not Permissao('acesso048')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  Application.CreateForm(TF_NewCalcT, F_NewCalcT);
  F_NewCalcT.ShowModal;
  F_NewCalcT.Destroy;
  F_NewCalcT := Nil;

{ Application.CreateForm(TF_Calcul, F_Calcul);
  Carrega_Tabela('CALCULO', 'R');
  Carrega_Divisor('CALCULO');
  F_Calcul.Showmodal;
  F_Calcul.destroy;
  F_Calcul := NIL;}
end;

procedure TF_Menu.Exigncias1Click(Sender: TObject);
begin
  if (not Permissao('acesso049')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Exige2, F_Exige2);
  Carrega_Assina;
  F_Exige2.Maskedit2.Text := DateToStr(date);
  F_Exige2.Showmodal;
  F_Exige2.Destroy;
  F_Exige2 := NIL;
end;

procedure TF_Menu.ModelosdeExigncias1Click(Sender: TObject);
begin
  if (not Permissao('acesso011')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_ModExig, F_ModExig);
  F_ModExig.ShowModal;
  F_ModExig.Destroy;
  F_ModExig := NIL;
end;

procedure TF_Menu.Negativas1Click(Sender: TObject);
begin
  if (not Permissao('acesso039')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_CNeg, F_CNeg);
  Application.CreateForm( TF_WRecep2, F_WRecep2);
  Carrega_Assina;
  F_CNeg.ShowModal;
  F_CNeg.Destroy;
  F_CNeg := NIL;
end;

procedure TF_Menu.Positivas1Click(Sender: TObject);
begin
  if (not Permissao('acesso040')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_CPos, F_CPos);
  F_CPos.ShowModal;
  F_CPos.Destroy;
  F_CPos := NIL;
end;

procedure TF_Menu.NotificaesdeOutrasComarcas1Click(Sender: TObject);
begin
  if (not Permissao('acesso028')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_PNotifica, F_PNotifica);
  F_PNotifica.ShowModal;
  F_PNotifica.Destroy;
  F_PNotifica := NIL;
end;

procedure TF_Menu.CadastrodeNotificaesdeOutrasComarcas1Click(
  Sender: TObject);
begin
  if (not Permissao('acesso012')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_CadNot, F_CadNot);
  F_CadNot.ShowModal;
  F_CadNot.Destroy;
  F_CadNot := NIL;
end;

procedure TF_Menu.Certidao1Click(Sender: TObject);
begin
  if (not Permissao('acesso024')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_PesqC, F_PesqC);
  F_PesqC.ShowModal;
  F_PesqC.Destroy;
  F_PesqC := NIL;
end;

procedure TF_Menu.TrocaCertido1Click(Sender: TObject);
begin
  if (not Permissao('acesso017')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_TrocaC, F_TrocaC);
  F_TrocaC.Showmodal;
  F_TrocaC.Destroy;
  F_TrocaC := NIL;
end;

procedure TF_Menu.Normal3Click(Sender: TObject);
begin
  if (not Permissao('acesso021')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_ExcluN, F_ExcluN);
  F_ExcluN.Showmodal;
  F_ExcluN.Destroy;
  F_ExcluN := NIL;
end;

procedure TF_Menu.Certido2Click(Sender: TObject);
begin
  if (not Permissao('acesso022')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_ExcluC, F_ExcluC);
  F_ExcluC.ShowModal;
  F_ExcluC.Destroy;
  F_ExcluC := NIL;
end;

procedure TF_Menu.Internet3Click(Sender: TObject);
begin
  Application.CreateForm(TF_Con, F_Con);
  F_Con.ShowModal;
  F_Con.Destroy;
  F_Con := NIL;
end;

procedure TF_Menu.CadastrodeEscritrios1Click(Sender: TObject);
begin
  if (not Permissao('acesso013')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Fich2, F_Fich2);
  Carrega_CliEmp;
  F_Fich2.ShowModal;
  F_Fich2.Destroy;
  F_Fich2 := NIL;
end;

procedure TF_Menu.Ttulos4Click(Sender: TObject);
begin
  if (not Permissao('acesso018')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Stat, F_Stat);
  F_Stat.Showmodal;
  F_Stat.Destroy;
  F_Stat := NIL;
end;

procedure TF_Menu.Certides3Click(Sender: TObject);
begin
  if (not Permissao('acesso019')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_StatC, F_StatC);
  F_StatC.Showmodal;
  F_StatC.Destroy;
  F_StatC := NIL;
end;

procedure TF_Menu.Ttulo1Click(Sender: TObject);
begin
  if (not Permissao('acesso001')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Natureza, F_Natureza);
  F_Natureza.ShowModal;
  F_Natureza.Destroy;
  F_Natureza := NIL;
end;

procedure TF_Menu.Certido3Click(Sender: TObject);
begin
  if (not Permissao('acesso001')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_NatCer, F_NatCer);
  F_NatCer.ShowModal;
  F_NatCer.Destroy;
  F_NatCer := NIL;
end;

procedure TF_Menu.OcorrnciasdeNotificao1Click(Sender: TObject);
begin
  if (not Permissao('acesso064')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_CadOcor, F_CadOcor);
  F_CadOcor.ShowModal;
  F_CadOcor.Destroy;
  F_CadOcor := NIL;   
end;

procedure TF_Menu.Notificaes1Click(Sender: TObject);
begin
  if (not Permissao('acesso047')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_BaixaN, F_BaixaN);
  Carrega_Ocorrencias;
  F_BaixaN.Showmodal;
  F_BaixaN.Destroy;
  F_BaixaN := NIL;
end;

procedure TF_Menu.ArRetorno1Click(Sender: TObject);
begin
  if (not Permissao('acesso065')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_BxRet, F_BxRet);
  Carrega_Ocorrencias;
  F_BxRet.ShowModal;
  F_BxRet.Destroy;
  F_BxRet := NIL;
end;

procedure TF_Menu.Resumo1Click(Sender: TObject);
begin
  if (not Permissao('acesso033')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RSelo, F_RSelo);
  F_RSelo.showmodal;
  F_RSelo.Destroy;
  F_RSelo := NIL;
end;

procedure TF_Menu.Analtico1Click(Sender: TObject);
begin
  if (not Permissao('acesso033')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RAP, F_RAP);
  F_Rap.showmodal;
  F_Rap.Destroy;
  F_Rap := NIL;
end;

procedure TF_Menu.Confirmao2Click(Sender: TObject);
begin             
  if (not Permissao('acesso067')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(Tf_relconf, f_relconf);
  F_RelConf.Showmodal;
  F_RelConf.Destroy;  
  F_RelConf := NIL;
end;

procedure TF_Menu.Retorno1Click(Sender: TObject);
begin
  if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RRetor, F_RRetor);
  F_RRetor.MaskEdit1.Text := DateToStr(date);  
  F_RRetor.showmodal;
  F_RRetor.Destroy;
  F_RRetor := NIL;
end;

procedure TF_Menu.Modelos1231Click(Sender: TObject);
begin
  if (not Permissao('acesso035')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  QRDestroi;
  Application.CreateForm(TF_RETQ, F_RETQ);
  Application.CreateForm(TF_Etiq, F_Etiq);
  Application.CreateForm(Tf_etiq1, f_etiq1);
  Application.CreateForm(Tf_etiq2, f_etiq2);
  Carrega_Assina;
  F_RETQ.Showmodal;
  F_Etiq.Destroy;
  f_etiq1.Destroy;
  f_etiq2.Destroy;
  F_RETQ.Destroy;
  F_Etiq  := nil;
  F_Etiq1 := nil;
  F_Etiq2 := nil;
  F_REtq  := NIL;
end;

procedure TF_Menu.AR1Click(Sender: TObject);
begin
  if (not Permissao('acesso035')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RETQAR, F_RETQAR);
  F_RETQAR.Showmodal;
  F_RETQAR.Destroy;
  F_REtqAR := NIL;
end;

procedure TF_Menu.ControledeAR1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RConAR, F_RConAR);
  F_RConAR.Showmodal;
  F_RConAR.Destroy;
  F_RConAR := NIL;
end;

procedure TF_Menu.SpeedButton10Click(Sender: TObject);
begin
  FecharProg := True;
  Application.Terminate;
  winexec(pchar('S:\PJ\Atualiza.exe'), sw_normal);
end;

procedure TF_Menu.NotificaesAR1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RCertNot, F_RCertNot);
  Carrega_Assina;
  F_RCertNot.Showmodal;
  F_RCertNot.Destroy;
  F_RCertNot := NIL;
end;

procedure TF_Menu.Aviso2Click(Sender: TObject);
begin
  Application.CreateForm(TF_RAviso, F_RAviso);
  F_RAviso.ShowModal;
  F_RAviso.Destroy;
  F_RAviso := NIL;
end;

procedure TF_Menu.NotificaesBalco1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RCNotB, F_RCNotB);
  Carrega_Assina;
  F_RCNotB.Showmodal;
  F_RCNotB.Destroy;
  F_RCNotB := NIL;
end;

procedure TF_Menu.Manuteno1Click(Sender: TObject);
begin
  if (not Permissao('acesso068')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Manut, F_Manut);
  Carrega_Natureza('MANUT');
  Carrega_Lancamento('MANUT');
  Carrega_Tabela('MANUT', 'R');
  Carrega_Divisor('MANUT');
  Carrega_Situacao('MANUT');
  F_Manut.Showmodal;
  F_Manut.Destroy;
  F_Manut := NIL;
end;

procedure TF_Menu.Postagem1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RPos, F_RPos);
  F_RPos.ShowModal;
  F_RPos.Destroy;
  F_RPos := NIL;
end;

procedure TF_Menu.Listagemdecontrole1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RLisNot, F_RLisNot);
  F_RLisNot.ShowModal;
  F_RLisNot.Destroy;
  F_RLisNot := NIL;
end;

procedure TF_Menu.ProtocolodeRecepodeCertido1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RPce, F_RPce);
  F_RPce.ShowModal;
  F_RPce.Destroy;
  F_RPce := NIL;
end;

procedure TF_Menu.ResumoFinanceiro1Click(Sender: TObject);
begin
  if (not Permissao('acesso029')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RSelo, F_RSelo);
  F_RSelo.showmodal;
  F_RSelo.Destroy;
  F_RSelo := NIL;
end;

procedure TF_Menu.Button1Click(Sender: TObject);
begin
  Edit3.Text := Edit3.Text + ' - ' + TirarApostrofe(Edit3.Text);
end;

procedure TF_Menu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FecharProg := True;
  Application.Terminate;
  Action := caFree;
end;

procedure TF_Menu.NotificaesRecepcionadas1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RelNot, F_RelNot);
  F_RelNot.MaskEdit1.Text := DateToStr(Date);  
  F_RelNot.ShowModal;
  F_RelNot.Destroy;
  F_RelNot := NIL;
end;

procedure TF_Menu.ControledeDiligncias1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RConNot, F_RConNot);
  F_RConNot.ShowModal;
  F_RConNot.Destroy;
  F_RConNot := NIL;
end;

procedure TF_Menu.RePostagem1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RePost, F_RePost);
  F_RePost.ShowModal;
  F_RePost.Destroy;
  F_RePost := NIL;
end;

procedure TF_Menu.RelaodeRepostagens1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RRPost, F_RRPost);
  F_RRPost.ShowModal;
  F_RRPost.Destroy;
  F_RRPost := NIL;
end;

procedure TF_Menu.PedidosdeInformaesaoCorreioPI1Click(Sender: TObject);
begin
  Application.CreateForm(TF_CadPI, F_CadPI);
  F_CadPI.ShowModal;
  F_CadPI.Destroy;
  F_CadPI := NIL;
end;

procedure TF_Menu.PesquisaCEP1Click(Sender: TObject);
begin
 begin
  Application.CreateForm(TF_PesqCep, F_PesqCep);
  F_PesqCep.Showmodal;
  F_PesqCep.Destroy;
  F_PesqCep := NIL;
end;
end;

procedure TF_Menu.VerificaoDiligncias1Click(Sender: TObject);
begin
 begin
  if (not Permissao('acesso110')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_PesqDel, F_PesqDel);
  F_PesqDel.showmodal;
  F_PesqDel.Destroy;
  F_PesqDel := NIL;
end;
end;

procedure TF_Menu.EditordeTextos1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Editor, F_Editor);
  caminho := F_Menu.Label16.Caption;
  F_Editor.ShowModal;
  F_Editor.Destroy;
  F_Editor := nil;
end;

procedure TF_Menu.Grficos1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Grafico, F_Grafico);
  F_Grafico.ShowModal;
  F_Grafico.Destroy;
  F_Grafico := NIL;
end;

procedure TF_Menu.RetornoNovo1Click(Sender: TObject);
begin
  if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RRetor1, F_RRetor1);
  F_RRetor1.MaskEdit1.Text := DateToStr(date);
  F_RRetor1.showmodal;
  F_RRetor1.Destroy;
  F_RRetor1 := NIL;
end;
procedure TF_Menu.ARModeloNovo1Click(Sender: TObject);
begin
 if (not Permissao('acesso035')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RETQAR1, F_RETQAR1);
  Application.CreateForm(TQk_EtqAR1, Qk_EtqAR1);
  F_RETQAR1.Showmodal;
  Qk_EtqAR1.Destroy;
  F_RETQAR1.Destroy;
  Qk_EtqAR1 := NIL;
  F_REtqAR1 := NIL;
end;

procedure TF_Menu.Grfico1Click(Sender: TObject);
begin
 if (not Permissao('acesso015')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Graf, F_Graf);
  F_Graf.ShowModal;
  F_Graf.Destroy;
  F_Graf := NIL;
end;

procedure TF_Menu.TermosdeAberturaEncerramento2Click(Sender: TObject);
begin
  {Application.CreateForm(TF_EDITOR, F_EDITOR);
  Application.CreateForm(TF_RTer, F_RTer);
  Dm.Configur.Open;
  caminho := F_Menu.Label16.Caption;
  Dm.Configur.Close;
  F_RTER.SHowmodal;
  F_RTER.Destroy;
  F_RTER := nil;
  f_editor.destroy;
  f_editor := nil; }

  Application.CreateForm(TF_Termos, F_Termos);
  F_Termos.ShowModal;
  F_Termos.Destroy;
  F_Termos := NIL;
end;

procedure TF_Menu.RetornoARProvisrio1Click(Sender: TObject);
begin
  if (not Permissao('acesso065')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_BxRetPro, F_BxRetPro);
  Carrega_Ocorrencias;
  F_BxRetPro.ShowModal;
  F_BxRetPro.Destroy;
  F_BxRetPro := NIL;
end;

procedure TF_Menu.RelaodasNotificaesemAberto1Click(Sender: TObject);
begin
 if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_NotAber, F_NotAber);
  F_NotAber.MaskEdit1.Text := DateToStr(date);
  F_NotAber.MaskEdit2.Text := DateToStr(date);
  F_NotAber.showmodal;
  F_NotAber.Destroy;
  F_NotAber := NIL;
end;

procedure TF_Menu.RelaodasNotificaesSolucionadas1Click(Sender: TObject);
begin
  if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_NotSolu, F_NotSolu);
  F_NotSolu.MaskEdit1.Text := DateToStr(date);
  F_NotSolu.MaskEdit2.Text := DateToStr(date);
  F_NotSolu.showmodal;
  F_NotSolu.Destroy;
  F_NotSolu := NIL;
end;

procedure TF_Menu.RelaodeNotificaesBaixadasProvisoriamente1Click(
  Sender: TObject);
begin
  if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro, F_RelPro);
  F_RelPro.MaskEdit1.Text := DateToStr(date);
  F_RelPro.MaskEdit2.Text := DateToStr(date);
  F_RelPro.MaskEdit3.Text := DateToStr(date);
  F_RelPro.MaskEdit4.Text := DateToStr(date);
  F_RelPro.showmodal;
  F_RelPro.Destroy;
  F_RelPro := NIL;
end;

procedure TF_Menu.NotificaesBaixadasProvisoriamenteSJRP1Click(
  Sender: TObject);
begin
 if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro1, F_RelPro1);
  F_RelPro1.MaskEdit1.Text := DateToStr(date);
  F_RelPro1.MaskEdit2.Text := DateToStr(date);
  F_RelPro1.MaskEdit3.Text := DateToStr(date);
  F_RelPro1.MaskEdit4.Text := DateToStr(date);
  F_RelPro1.showmodal;
  F_RelPro1.Destroy;
  F_RelPro1 := NIL;
end;

procedure TF_Menu.NotificaesBaixadasProvisoriamenteSANTOANDR1Click(
  Sender: TObject);
begin
 if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro2, F_RelPro2);
  F_RelPro2.MaskEdit1.Text := DateToStr(date);
  F_RelPro2.MaskEdit2.Text := DateToStr(date);
  F_RelPro2.MaskEdit3.Text := DateToStr(date);
  F_RelPro2.MaskEdit4.Text := DateToStr(date);  
  F_RelPro2.showmodal;
  F_RelPro2.Destroy;
  F_RelPro2 := NIL;
end;

procedure TF_Menu.NotificaesBaixadasProvisoriamenteSUZANO1Click(
  Sender: TObject);
begin
  if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro3, F_RelPro3);
  F_RelPro3.MaskEdit1.Text := DateToStr(date);
  F_RelPro3.MaskEdit2.Text := DateToStr(date);
  F_RelPro3.MaskEdit3.Text := DateToStr(date);
  F_RelPro3.MaskEdit4.Text := DateToStr(date);
  F_RelPro3.showmodal;
  F_RelPro3.Destroy;
  F_RelPro3 := NIL;
end;

procedure TF_Menu.NotificaesBaixadasProvisoriamenteSANTOS1Click(
  Sender: TObject);
begin
 if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro4, F_RelPro4);
  F_RelPro4.MaskEdit1.Text := DateToStr(date);
  F_RelPro4.MaskEdit2.Text := DateToStr(date);
  F_RelPro4.MaskEdit3.Text := DateToStr(date);
  F_RelPro4.MaskEdit4.Text := DateToStr(date);
  F_RelPro4.showmodal;
  F_RelPro4.Destroy;
  F_RelPro4 := NIL;
end;

procedure TF_Menu.BAURU1Click(Sender: TObject);
begin
 if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro5, F_RelPro5);
  F_RelPro5.MaskEdit1.Text := DateToStr(date);
  F_RelPro5.MaskEdit2.Text := DateToStr(date);
  F_RelPro5.MaskEdit3.Text := DateToStr(date);
  F_RelPro5.MaskEdit4.Text := DateToStr(date);
  F_RelPro5.showmodal;
  F_RelPro5.Destroy;
  F_RelPro5 := NIL;
end;

procedure TF_Menu.NotificaesBaixadasProvisoriamenteSECUNDINO1Click(
  Sender: TObject);
begin
 if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro6, F_RelPro6);
  F_RelPro6.MaskEdit1.Text := DateToStr(date);
  F_RelPro6.MaskEdit2.Text := DateToStr(date);
  F_RelPro6.MaskEdit3.Text := DateToStr(date);
  F_RelPro6.MaskEdit4.Text := DateToStr(date);
  F_RelPro6.showmodal;
  F_RelPro6.Destroy;
  F_RelPro6 := NIL;
end;

procedure TF_Menu.NotificaesBaixadasProvisoriamenteMERCABENCO1Click(
  Sender: TObject);
begin
 if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro7, F_RelPro7);
  F_RelPro7.MaskEdit1.Text := DateToStr(date);
  F_RelPro7.MaskEdit2.Text := DateToStr(date);
  F_RelPro7.MaskEdit3.Text := DateToStr(date);
  F_RelPro7.MaskEdit4.Text := DateToStr(date);
  F_RelPro7.showmodal;
  F_RelPro7.Destroy;
  F_RelPro7 := NIL;
end;

procedure TF_Menu.NotificaesBaixadasProvisoriamenteCORREIOS1Click(
  Sender: TObject);
begin
 if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro8, F_RelPro8);
  F_RelPro8.MaskEdit1.Text := DateToStr(date);
  F_RelPro8.MaskEdit2.Text := DateToStr(date);
//  F_RelPro8.MaskEdit3.Text := DateToStr(date);
//  F_RelPro8.MaskEdit4.Text := DateToStr(date);
  F_RelPro8.showmodal;
  F_RelPro8.Destroy;
  F_RelPro8 := NIL;
end;

procedure TF_Menu.GrficoBaixaProvisria1Click(Sender: TObject);
begin
  if (not Permissao('acesso015')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_GrafProv, F_GrafProv);
  F_GrafProv.ShowModal;
  F_GrafProv.Destroy;
  F_GrafProv := NIL;
end;

procedure TF_Menu.NotificaesBaixadasEfetivamente1Click(Sender: TObject);
begin
 if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelEfe, F_RelEfe);
  F_RelEfe.MaskEdit1.Text := DateToStr(date);
  F_RelEfe.MaskEdit2.Text := DateToStr(date);
  F_RelEfe.MaskEdit3.Text := DateToStr(date);
  F_RelEfe.MaskEdit4.Text := DateToStr(date);
  F_RelEfe.showmodal;
  F_RelEfe.Destroy;
  F_RelEfe := NIL;
end;

procedure TF_Menu.ModeloFicticioAR1Click(Sender: TObject);
begin
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT * from td where recno = 1');
  Dm.Join.Open;
  QRDestroi;
  Application.CreateForm(TQk_NotFic, Qk_NotFic);
  Qk_NotFic.QuickRep1.Preview;
  Qk_NotFic.Destroy;
  // Qk_NotFic := NIL;
  Dm.Join.Close;
end;

procedure TF_Menu.NotificaesBaixadasProvisoriamenteWOCosta1Click(
  Sender: TObject);
begin
  if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro9, F_RelPro9);
  F_RelPro9.MaskEdit1.Text := DateToStr(date);
  F_RelPro9.MaskEdit2.Text := DateToStr(date);
  F_RelPro9.MaskEdit3.Text := DateToStr(date);
  F_RelPro9.MaskEdit4.Text := DateToStr(date);
  F_RelPro9.showmodal;
  F_RelPro9.Destroy;
  F_RelPro9 := NIL;
end;

procedure TF_Menu.RelaodeRisco1Click(Sender: TObject);
begin
 if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro10, F_RelPro10);
  F_RelPro10.MaskEdit1.Text := DateToStr(date);
  F_RelPro10.MaskEdit2.Text := DateToStr(date);
  F_RelPro10.MaskEdit3.Text := DateToStr(date);
  F_RelPro10.MaskEdit4.Text := DateToStr(date);
  F_RelPro10.showmodal;
  F_RelPro10.Destroy;
  F_RelPro10 := NIL;
end;

procedure TF_Menu.NotificaesComBaixaProvDifdaBaixaEfetiva1Click(
  Sender: TObject);
begin
 if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_ProDef, F_ProDef);
  F_ProDef.MaskEdit1.Text := DateToStr(date);
  F_ProDef.MaskEdit2.Text := DateToStr(date);
  F_ProDef.MaskEdit3.Text := DateToStr(date);
  F_ProDef.MaskEdit4.Text := DateToStr(date);
  F_ProDef.showmodal;
  F_ProDef.Destroy;
  F_ProDef := NIL;
end;

procedure TF_Menu.NotificaesBaixadasProvisoriamenteScania1Click(
  Sender: TObject);
begin
  if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro11, F_RelPro11);
  F_RelPro11.MaskEdit1.Text := DateToStr(date);
  F_RelPro11.MaskEdit2.Text := DateToStr(date);
  F_RelPro11.MaskEdit3.Text := DateToStr(date);
  F_RelPro11.MaskEdit4.Text := DateToStr(date);
  F_RelPro11.showmodal;
  F_RelPro11.Destroy;
  F_RelPro11 := NIL;
end;

procedure TF_Menu.NotificaesBaixadasEfetivamenteSCANIA1Click(
  Sender: TObject);
begin
  if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelPro12, F_RelPro12);
  F_RelPro12.MaskEdit1.Text := DateToStr(date);
  F_RelPro12.MaskEdit2.Text := DateToStr(date);
  F_RelPro12.MaskEdit3.Text := DateToStr(date);
  F_RelPro12.MaskEdit4.Text := DateToStr(date);
  F_RelPro12.showmodal;
  F_RelPro12.Destroy;
  F_RelPro12 := NIL;
end;

procedure TF_Menu.NotificaesBaixadasProvisoriamenteouEfetivamente1Click(
  Sender: TObject);
begin
  if (not Permissao('acesso066')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RelBaix, F_RelBaix);
  F_RelBaix.MaskEdit1.Text := DateToStr(date);
  F_RelBaix.MaskEdit2.Text := DateToStr(date);
  F_RelBaix.MaskEdit3.Text := DateToStr(date);
  F_RelBaix.MaskEdit4.Text := DateToStr(date);
  F_RelBaix.showmodal;
  F_RelBaix.Destroy;
  F_RelBaix := NIL;
end;

procedure TF_Menu.GerarArquivodeenviodePostagem1Click(Sender: TObject);
begin
  Application.CreateForm(TF_GArqPost, F_GArqPost);
  F_GArqPost.ShowModal;
  F_GArqPost.Destroy;
  F_GArqPost := NIL;
end;

procedure TF_Menu.GerarArquivodeenviodeBaixas1Click(Sender: TObject);
begin
  Application.CreateForm(TF_GArqPostBX, F_GArqPostBX);
  F_GArqPostBX.ShowModal;
  F_GArqPostBX.Destroy;
  F_GArqPostBX := NIL;
end;

procedure TF_Menu.ImportarArquivosdeBaixas1Click(Sender: TObject);
begin
  Application.CreateForm(TF_ImportaPostBX, F_ImportaPostBX);
  F_ImportaPostBX.ShowModal;
  F_ImportaPostBX.Destroy;
  F_ImportaPostBX := NIL;
end;

procedure TF_Menu.Ttulos5Click(Sender: TObject);
begin
  if (not Permissao('acesso030')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  QRDestroi;
  Application.CreateForm(TF_RRec, F_RRec);
  Carrega_Assina;
  F_RRec.Showmodal;
  F_RRec.Destroy;
  F_RRec := NIL;
end;

procedure TF_Menu.Certides4Click(Sender: TObject);
begin
  if (not Permissao('acesso030')) then
  begin
    ShowMessage('Acesso Negado');
    Exit;
  end;
  Application.CreateForm(TF_RCert, F_RCert);
  Carrega_Assina;
  F_RCert.Showmodal;
  F_RCert.Destroy;
  F_RCert := nil;
end;

procedure TF_Menu.Recepo3Click(Sender: TObject);
begin
  if (not Permissao('acesso070')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_PesqRec, F_PesqRec);
  Application.CreateForm(TfrmAnotacao, frmAnotacao);
  F_PesqRec.ShowModal;
  F_PesqRec.Destroy;
  F_PesqRec := NIL;
  frmAnotacao.Destroy;
  frmAnotacao := NIL;
end;

procedure TF_Menu.GerarArquivodePostagem1Click(Sender: TObject);
begin
  Application.CreateForm(TF_PostCor, F_PostCor);
  F_PostCor.ShowModal;
  F_PostCor.Destroy;
  F_PostCor := Nil;
end;

procedure TF_Menu.GerarArquivodeBaixas1Click(Sender: TObject);
begin
  Application.CreateForm(TF_PostCorBX, F_PostCorBX);
  F_PostCorBX.ShowModal;
  F_PostCorBX.Destroy;
  F_PostCorBX := Nil;
end;

procedure TF_Menu.ResumodosAtosPraticados1Click(Sender: TObject);
begin
  if (not Permissao('acesso029')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_ResAtos, F_ResAtos);
  F_ResAtos.ShowModal;
  F_ResAtos.Destroy;
  F_ResAtos := Nil;
end;

procedure TF_Menu.Tabela1Click(Sender: TObject);
begin
  if (not Permissao('acesso003')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_TabAux1, F_TabAux1);
  F_TabAux1.ShowModal;
  F_TabAux1.Destroy;
  F_TabAux1 := NIL;
end;

procedure TF_Menu.DemaisTabelas1Click(Sender: TObject);
begin
  if (not Permissao('acesso003')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_DemaisTab, F_DemaisTab);
  F_DemaisTab.showmodal;
  F_DemaisTab.destroy;
  F_DemaisTab := Nil;
end;

procedure TF_Menu.LivroA1Click(Sender: TObject);
begin
  if (not Permissao('acesso031')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  QRDestroi;
  Application.CreateForm(TF_RPO, F_RPO);
  Carrega_Assina;
  F_RPO.Showmodal;
  F_RPO.Destroy;
  F_RPO := NIL;
end;

procedure TF_Menu.LivroB1Click(Sender: TObject);
begin
  if (not Permissao('acesso031')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RPOLB, F_RPOLB);
  Application.CreateForm(TF_QkRPOLB, F_QkRPOLB);
  Carrega_Assina;
  F_RPOLB.showmodal;
  F_QkRPOLB.destroy;
  F_QkRPOLB := Nil;
  F_RPOLB.destroy;
  F_RPOLB := Nil;
end;

procedure TF_Menu.LivroC1Click(Sender: TObject);
begin
  {Application.CreateForm(TF_RPOLC, F_RPOLC);
  Application.CreateForm(TF_QkRPOLB, F_QkRPOLB);
  Carrega_Assina;
  F_RPOLC.showmodal;
  F_QkRPOLB.destroy;
  F_QkRPOLB := Nil;
  F_RPOLC.destroy;
  F_RPOLC := Nil;}

  Application.CreateForm(TF_RPOLB_NewC, F_RPOLB_NewC);
  Application.CreateForm(TF_QkRPOLB, F_QkRPOLB);
  Carrega_Assina;
  F_RPOLB_NewC.showmodal;
  F_QkRPOLB.destroy;
  F_QkRPOLB := Nil;
  F_RPOLB_NewC.destroy;
  F_RPOLB_NewC := Nil;
  
end;

procedure TF_Menu.FormCreate(Sender: TObject);
begin
  IniFile := TIniFile.Create ( ExtractFilePath(ParamStr(0)) + '\siscart.ini');
  F_Menu.Label37.Caption := IniFile.ReadString('Configuracoes','Cartorio','');
end;

procedure TF_Menu.Distribuidor1Click(Sender: TObject);
begin
  Application.CreateForm(TF_importa, F_importa);
  F_importa.ShowModal;
  F_importa.Destroy;
  F_importa := Nil;
end;

procedure TF_Menu.Faturados1Click(Sender: TObject);
begin
  if (not Permissao('acesso041')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RecFat, F_RecFat);
  F_RecFat.Showmodal;
  F_RecFat.Destroy;
  F_RecFat := NIL;
end;

procedure TF_Menu.Distribuio1Click(Sender: TObject);
begin
  QRDestroi;
  Application.CreateForm(TF_RelDist, F_RelDist);
  Carrega_Assina;
  F_RelDist.ShowModal;
  F_RelDist.Destroy;
  F_RelDist := Nil;
end;

procedure TF_Menu.NomesExtras1Click(Sender: TObject);
begin
  Application.CreateForm(TFRel_NomeExtra, FRel_NomeExtra);
  Application.CreateForm(TFqk_RelNomes, Fqk_RelNomes);
  FRel_NomeExtra.ShowModal;
  Fqk_RelNomes.Destroy;
  Fqk_RelNomes := Nil;
  FRel_NomeExtra.Destroy;
  FRel_NomeExtra := nil;
end;

procedure TF_Menu.LivroD1Click(Sender: TObject);
begin
  if (not Permissao('acesso031')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  QRDestroi;
  Application.CreateForm(TF_RPOD, F_RPOD);
  Carrega_Assina;
  F_RPOD.Showmodal;
  F_RPOD.Destroy;
  F_RPOD := NIL;
end;

procedure TF_Menu.TtuloseDocumentos1Click(Sender: TObject);
begin
  Application.CreateForm(TF_ExportXML, F_ExportXML);
  F_ExportXML.ShowModal;
  F_ExportXML.Destroy;
  F_ExportXML := Nil;
end;

procedure TF_Menu.NumeroRoloMicofilme1Click(Sender: TObject);
begin
//  Application.CreateForm(TFRoloMicorfilme, FRoloMicorfilme);
end;

procedure TF_Menu.Notificadores1Click(Sender: TObject);
begin
  Application.CreateForm(TFCadNot, FCadNot);
  dm.cad_not.close;
  dm.cad_not.sql.Clear;
  dm.cad_not.sql.add('select * from cad_not');
  dm.cad_not.open;

  FCadNot.ShowModal;
  FCadNot.Destroy;
  FCadNot := nil;
end;

procedure TF_Menu.ListagemdeConferncia2Click(Sender: TObject);
begin
  Application.CreateForm(TFFatRelConf, FFatRelConf);
  Application.CreateForm(TF_QKRelFat, F_QKRelFat);
  FFatRelConf.ShowModal;
  F_QKRelFat.Destroy;
  F_QKRelFat := Nil;
  FFatRelConf.Destroy;
  FFatRelConf := nil;
end;

procedure TF_Menu.LivroAdicional1Click(Sender: TObject);
begin
  //Exportação para o Livro Adicional
  try
    DM.LA.Connected := True;
  except
    Application.MessageBox('Não Foi possivel conectar ao Banco de Dados!', 'Mensagem do Sistema', mb_ok);
    exit;
  end;
  Application.CreateForm(TFExpLA, FExpLA);
  FExpLA.ShowModal;
  FExpLA.Destroy;
  FExpLA := Nil;
end;

procedure TF_Menu.MutuaeAcoterj1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RelMutua, F_RelMutua);
  Application.CreateForm(TF_QKRelMutua, F_QKRelMutua);
  F_RelMutua.ShowModal;
  F_QKRelMutua.Destroy;
  F_QKRelMutua := Nil;
  F_RelMutua.Destroy;
  F_RelMutua := Nil;
end;

procedure TF_Menu.Cdigodecustas1Click(Sender: TObject);
begin
  f_cod_cus.showmodal;
end;

procedure TF_Menu.Incluirvalordedistribuio1Click(Sender: TObject);
begin
  if (not Permissao('acesso071')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_CorDistr, F_CorDistr);
  F_CorDistr.Showmodal;
  F_CorDistr.Destroy;
  F_CorDistr := NIL;
end;

procedure TF_Menu.ConfigAdministrativas1Click(Sender: TObject);
begin
  if (F_Menu.Label41.Caption = 'N') then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'Administrativo', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_ConfAdm, F_ConfAdm);
  F_ConfAdm.TabbedNotebook1.PageIndex := 0;
  F_ConfAdm.ShowModal;
  F_ConfAdm.Destroy;
  F_ConfAdm := NIL;
end;

procedure TF_Menu.Info1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Licenc, F_Licenc);
  F_Licenc.Label5.Caption := F_Menu.Label9.Caption + ' ' + F_Menu.Label7.Caption;
  F_Licenc.Showmodal;
  F_Licenc.Destroy;
  F_Licenc := Nil;
end;

procedure TF_Menu.CorreodeLivrosAeB1Click(Sender: TObject);
begin
  Application.CreateForm(TF_LivProt, F_LivProt);
  F_LivProt.Showmodal;
  F_LivProt.Destroy;
  F_LivProt := Nil;
end;

procedure TF_Menu.CadastrodeEmolumentos1Click(Sender: TObject);
begin
  if (not Permissao('acesso003')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_CadEmol, F_CadEmol);
  F_CadEmol.ShowModal;
  F_CadEmol.Destroy;
  F_CadEmol := Nil;
end;

procedure TF_Menu.Emolumentos1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RETQEMOL, F_RETQEMOL);
  F_RETQEMOL.Showmodal;
  F_RETQEMOL.Destroy;
  F_RETQEMOL := nil;
end;

procedure TF_Menu.Manual1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Selos, F_Selos);
  F_Selos.ShowModal;
  F_Selos.Destroy;
  F_Selos := Nil;
end;

procedure TF_Menu.Lote1Click(Sender: TObject);
begin
  Application.CreateForm(TF_SelosLote, F_SelosLote);
  F_SelosLote.ShowModal;
  F_SelosLote.Destroy;
  F_SelosLote := Nil;
end;

procedure TF_Menu.ReciboAvulso1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Recib2, F_Recib2);
  F_Recib2.ShowModal;
  F_Recib2.Destroy;
  F_Recib2 := NIL;
end;

procedure TF_Menu.Certido6Click(Sender: TObject);
begin
  if (not Permissao('acesso035')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RETQC, F_RETQC);
  Carrega_Assina;
  F_RETQC.ShowModal;
  F_RETQC.Destroy;
  F_RETQC := Nil;
end;

procedure TF_Menu.conferencia1Click(Sender: TObject);
begin
  if (not Permissao('acesso033')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RSelo, F_RSelo);
  Application.CreateForm(TQk_Selo, Qk_Selo);
  F_RSelo.showmodal;
  Qk_Selo.Destroy;
  Qk_Selo := Nil;

  F_RSelo.Destroy;
  F_RSelo := NIL;
end;

procedure TF_Menu.Certido7Click(Sender: TObject);
begin
  if (not Permissao('acesso033')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_RSelo1, F_RSelo1);
  Carrega_Assina;
  F_RSelo1.showmodal;
  F_RSelo1.Destroy;
  F_RSelo1 := NIL;
end;

procedure TF_Menu.Retroativo1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Retroativo, F_Retroativo);
  Carrega_Situacao('RETRO');
  F_Retroativo.ShowModal;
  F_Retroativo.Destroy;
  F_Retroativo := Nil;
end;

procedure TF_Menu.DAJEs1Click(Sender: TObject);
begin
  Application.CreateForm(TF_PesqDaje, F_PesqDaje);
  F_PesqDaje.ShowModal;
  F_PesqDaje.Destroy;
  F_PesqDaje := Nil;
end;

procedure TF_Menu.Etiquetas1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Etiquetas, F_Etiquetas);
  F_Etiquetas.ShowModal;
  F_Etiquetas.Destroy;
  F_Etiquetas := Nil;
end;

procedure TF_Menu.EmissodeDAJE1Click(Sender: TObject);
begin
  Application.CreateForm(TF_EmissDAJE, F_EmissDAJE);
  F_EmissDAJE.ShowModal;
  F_EmissDAJE.Destroy;
  F_EmissDAJE := Nil;
end;

procedure TF_Menu.SpeedButton16Click(Sender: TObject);
begin
  Application.CreateForm(TF_EmissDAJE, F_EmissDAJE);
  F_EmissDAJE.ShowModal;
  F_EmissDAJE.Destroy;
  F_EmissDAJE := Nil;
end;

procedure TF_Menu.Imveis1Click(Sender: TObject);
begin
  Application.CreateForm(TF_CadImoveis, F_CadImoveis);
  F_CadImoveis.ShowModal;
  F_CadImoveis.Destroy;
  F_CadImoveis := Nil;
end;

procedure TF_Menu.ExportarDOI1Click(Sender: TObject);
begin
  Application.CreateForm(TF_ExportacaoDOI, F_ExportacaoDOI);
  F_ExportacaoDOI.ShowModal;
  F_ExportacaoDOI.Destroy;
  F_ExportacaoDOI := Nil;
end;

procedure TF_Menu.RecibodeTitulos1Click(Sender: TObject);
begin
  F_ReciboDeTitulo:= TF_ReciboDeTitulo.Create(Application);
  F_ReciboDeTitulo.ShowModal;
end;

procedure TF_Menu.ReaberturadeNotificao1Click(Sender: TObject);
begin
  Application.CreateForm(TF_StatusNotificacaoReabre, F_StatusNotificacaoReabre);
  F_StatusNotificacaoReabre.ShowModal;
  F_StatusNotificacaoReabre.Destroy;
  F_StatusNotificacaoReabre := Nil;
end;

procedure TF_Menu.ImagemdosLivros1Click(Sender: TObject);
begin
  Application.CreateForm(TF_ImgLivros, F_ImgLivros);
  F_ImgLivros.ShowModal;
  F_ImgLivros.Destroy;
  F_ImgLivros := Nil;  
end;

procedure TF_Menu.ConverterImagensTIFBMP1Click(Sender: TObject);
var
  i, x: Integer;
  sListaArqs:TStringList;
  c: cardinal;
  teste,
  sSeqCarac,
  sNome,
  sNumeroCertidao,
  CaminhoDosArquivos:String;
  ImgEdit1: TImgEdit;
begin
  CaminhoDosArquivos:= 'S:\Siscart\PROGRAMAS\TD\IMAGENS\livroB\0000';

{  ImgEdit1:= TImgEdit.Create(Nil);

  sListaArqs:=TStringList.Create;
  sSeqCarac:= sNumeroCertidao;

  ListaDeArquivos(ExtractFilePath(CaminhoDosArquivos+'\')+'*.*',sListaArqs,sSeqCarac);
  If sListaArqs.Count>0 Then
  Begin
    Try
     // for i := 1 to sListaArqs.Count do
      Begin
        sNome := CaminhoDosArquivos +'\'+  Dm.ExtractNameCompleto(sListaArqs[i-1]);
        ConverteImagem(sNome, CaminhoDosArquivos +'\Arquivo.bmp');

      End;
      Except
      Begin
        ShowMessage('Script de atualização: '+sNome+'.tif'+' não executado!');
        Application.Terminate;
      End;
    End;
  end; }
  
end;

procedure TF_Menu.ListaDeArquivos(ASource: String; ADirList: TStringList;
  vSeqCarac: String);
Var
  SearchRec:TSearchRec;
  Result, i:Integer;
  vTeste: String;

begin
  Result:=FindFirst(ASource,faAnyFile,SearchRec);

  If Result=0 Then
  While(Result=0) Do
  Begin
    vTeste:= copy(SearchRec.Name,1,Length(vSeqCarac));
    If ((SearchRec.Name+' ')[1]='.') or (copy(SearchRec.Name,1,Length(vSeqCarac)) <> vSeqCarac) Then
    Begin
      Result:=FindNext(SearchRec);
      Continue;
    End;
    ADirList.Add(SearchRec.Name);
    Result:=FindNext(SearchRec);
  End;
  FindClose(SearchRec);
  ADirList.Sort;
End;

Procedure TF_Menu.ConverteImagem(sCaminhoArquivoASerConvertido, sCaminhoArquivoConvertido: String);
var
  FileStreamIn: TFileStream;
  FileStreamOut: TFileStream;
begin
  FileStreamIn := TFileStream.Create(sCaminhoArquivoASerConvertido, fmOpenRead);
  FileStreamOut := TFileStream.Create(sCaminhoArquivoConvertido, fmCreate);

  try
    FileStreamOut.CopyFrom(FileStreamIn, FileStreamOut.Size);
  finally
    FileStreamIn.Free;
    FileStreamOut.Free;
  end;
end;



procedure TF_Menu.Ttulos6Click(Sender: TObject);
begin
  F_RelTitulosDOI:= TF_RelTitulosDOI.Create(Nil);
  F_RelTitulosDOI.ShowModal;
  F_RelTitulosDOI.Destroy;
  F_RelTitulosDOI := Nil;
end;

procedure TF_Menu.Label48Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://eselo.tjba.jus.br/index.faces', '', '', 1);
end;

procedure TF_Menu.ListagemdeRegistrosAverbados1Click(Sender: TObject);
begin
  F_ListagemDeRegistroAverbado:= TF_ListagemDeRegistroAverbado.Create(Nil);
  F_ListagemDeRegistroAverbado.ShowModal;
  F_ListagemDeRegistroAverbado.Destroy;
  F_ListagemDeRegistroAverbado := Nil;

end;

procedure TF_Menu.SincronizarRegistrosAverbados2Click(Sender: TObject);
begin
  F_SincronizaRegistrosAverbados:= TF_SincronizaRegistrosAverbados.Create(Nil);
  F_SincronizaRegistrosAverbados.ShowModal;
  F_SincronizaRegistrosAverbados.Destroy;
  F_SincronizaRegistrosAverbados := Nil; 
end;

procedure TF_Menu.GrficodeEmolumentos1Click(Sender: TObject);
begin
  {Segue o mesmo critério de usuários de movimento de caixa.
   Se la estiver marcado ele tambem permite acesso a esta tela}
  if (not Permissao('acesso061')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  F_GraficoEmolumentos:= TF_GraficoEmolumentos.Create(Nil);
  F_GraficoEmolumentos.ShowModal;
  F_GraficoEmolumentos.Destroy;
  F_GraficoEmolumentos := Nil; 

end;

procedure TF_Menu.AtualizaoOnline1Click(Sender: TObject);
var
  sSistema: String;
begin
  sSistema:= StringReplace(Application.Title, ' ', EmptyStr, [rfReplaceAll]);
                                                       //Dir. Serv. onde se encontra arq.    //Pasta Temp.   //Inical do nome do arquivo de atual.        //Carrega com versao banco   //Caminho onde Será jogado o novo exe        //Passa o nome do sistema para ser fechado
  WinExec(pchar(ExtractFilePath(ParamStr(0))+'AtualizaOnlineSiscart.EXE'+ ' ' + 'Discos\TitulosDocumentos'+ ' ' + 'C:\Discos' + ' ' + 'Pack_AtualizaTD_' + ' ' + 'TD.EXE' + ' ' + VersaoExecutavelComBanco + ' '+ CaminhoDoExecutavelAtualiza +' '+ PChar(sSistema) +' '+ VersaoDoExecutavelGravadoNoBanco), sw_normal);
end;

procedure TF_Menu.Imagens2Click(Sender: TObject);
begin
  if (not Permissao('acesso020')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Logs, F_Logs);
  F_Logs.ShowModal;
  F_Logs.Destroy;
  F_Logs := NIL;
end;

procedure TF_Menu.ExameeTtulo1Click(Sender: TObject);
begin
  if (not Permissao('acesso020')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_LogRegitros, F_LogRegitros);
  F_LogRegitros.ShowModal;
  F_LogRegitros.Destroy;
  F_LogRegitros := NIL;
end;

procedure TF_Menu.Manualmente1Click(Sender: TObject);
begin
  F_DajeCorrecao:= TF_DajeCorrecao.Create(Nil);
  F_DajeCorrecao.ShowModal;
  F_DajeCorrecao.Destroy;
  F_DajeCorrecao := Nil;
end;

procedure TF_Menu.Automaticamente1Click(Sender: TObject);
begin
  F_DajeCorrecaoAutomatica:= TF_DajeCorrecaoAutomatica.Create(Nil);
  F_DajeCorrecaoAutomatica.ShowModal;
  F_DajeCorrecaoAutomatica.Destroy;
  F_DajeCorrecaoAutomatica := Nil;
end;

procedure TF_Menu.AtosparaDOI1Click(Sender: TObject);
begin
  F_RelDOI:= TF_RelDOI.Create(Nil);
  F_RelDOI.ShowModal;
end;

procedure TF_Menu.AjustedeAverbao1Click(Sender: TObject);
begin
  if (not Permissao('acesso016')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_AjusteRegAverbado, F_AjusteRegAverbado);
  F_AjusteRegAverbado.Showmodal;
  F_AjusteRegAverbado.Destroy;
  F_AjusteRegAverbado := NIL;
end;

procedure TF_Menu.Notificaes2Click(Sender: TObject);
begin
  Application.CreateForm(TF_RelNotificacoesEstatistica, F_RelNotificacoesEstatistica);
  F_RelNotificacoesEstatistica.Showmodal;
  F_RelNotificacoesEstatistica.Destroy;
  F_RelNotificacoesEstatistica := NIL;
end;

procedure TF_Menu.ImportarImagensdeRegistro1Click(Sender: TObject);
begin
  Application.CreateForm(TF_ImportaImagem, F_ImportaImagem);
  F_ImportaImagem.Showmodal;
  F_ImportaImagem.Destroy;
  F_ImportaImagem := NIL;
end;

procedure TF_Menu.FormShow(Sender: TObject);
begin
  if not DirectoryExists('c:\siscart\temp\td\imgcel\') then
    ForceDirectories('c:\siscart\temp\td\imgcel\');
end;

procedure TF_Menu.ImpressodeRecibo1Click(Sender: TObject);
begin
  F_ReciboNotificacaoCobrada:= TF_ReciboNotificacaoCobrada.Create(Nil);
  F_ReciboNotificacaoCobrada.ShowModal;
  F_ReciboNotificacaoCobrada:= Nil;
end;

procedure TF_Menu.TtulosRegistrados1Click(Sender: TObject);
begin
  F_RelTitulosRegistrados:= TF_RelTitulosRegistrados.Create(Nil);
  F_RelTitulosRegistrados.ShowModal;
  F_RelTitulosRegistrados:= Nil;
end;

procedure TF_Menu.CompararImagenscomRegistros1Click(Sender: TObject);
begin
  F_ComparaImagenRegistro:= TF_ComparaImagenRegistro.Create(Nil);
  F_ComparaImagenRegistro.ShowModal;
  F_ComparaImagenRegistro:= Nil;
end;

procedure TF_Menu.ExameeClculo1Click(Sender: TObject);
begin
  F_ExameCalculo:= TF_ExameCalculo.Create(Nil);
  F_ExameCalculo.ShowModal;
  F_ExameCalculo.Destroy;
end;

procedure TF_Menu.Certido8Click(Sender: TObject);
begin
  F_LivroCertidaoRel:= TF_LivroCertidaoRel.Create(Nil);
  F_LivroCertidaoRel.ShowModal;
  F_LivroCertidaoRel:= Nil;

end;

procedure TF_Menu.PrazosdeTtulos1Click(Sender: TObject);
begin
  F_GridAnaliseTitulos:= TF_GridAnaliseTitulos.Create(Nil);
  F_GridAnaliseTitulos.ShowModal;
  F_GridAnaliseTitulos.destroy;
end;

procedure TF_Menu.LivrodeExameClculo1Click(Sender: TObject);
begin
  Application.CreateForm(TF_RelLivroExameCalculo, F_RelLivroExameCalculo);
  F_RelLivroExameCalculo.ShowModal;
  F_RelLivroExameCalculo := NIL;
end;

procedure TF_Menu.AjustarValordosDajes1Click(Sender: TObject);
begin
  F_AjustaValorDAJE:= TF_AjustaValorDAJE.Create(Nil);
  F_AjustaValorDAJE.ShowModal;
  F_AjustaValorDAJE.destroy;
end;

procedure TF_Menu.Titulos7Click(Sender: TObject);
begin
  Application.CreateForm(TF_RelTitulosProtocolados, F_RelTitulosProtocolados);
  F_RelTitulosProtocolados.ShowModal;
  F_RelTitulosProtocolados.Free;
end;

procedure TF_Menu.CadastrodeCertifico1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadCertificos, frmCadCertificos);
  frmCadCertificos.ShowModal;
  frmCadCertificos.Destroy;
  frmCadCertificos := Nil;
end;

procedure TF_Menu.ImagensDIGDOC1Click(Sender: TObject);
begin
  Application.CreateForm(TF_PesqImagemDigDOC, F_PesqImagemDigDOC);  
  try
    F_PesqImagemDigDOC.ShowModal;
  finally
   F_PesqImagemDigDOC.free;
   F_PesqImagemDigDOC:=nil;

  end;
end;

procedure TF_Menu.LivroE1Click(Sender: TObject);
begin
  QRDestroi;
  Application.CreateForm(TF_LivroE, F_LivroE);
  Carrega_Assina;
  F_LivroE.Showmodal;
  F_LivroE.Destroy;
  F_LivroE := NIL;
end;

procedure TF_Menu.LivroG1Click(Sender: TObject);
begin
  QRDestroi;
  Application.CreateForm(TF_LivroG, F_LivroG);
  F_LivroG.Showmodal;
  F_LivroG.Destroy;
  F_LivroG := NIL;
end;

end.





