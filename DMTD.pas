unit DMTD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, RpRender, RpRenderPDF, RpBase, RpSystem, RpDefine, RpRave,
  RxQuery, FileCtrl, Shellapi, StdCtrls;
  
type
  TDM = class(TDataModule)
    DBTD: TDatabase;
    DS_Natureza: TDataSource;
    Natureza: TQuery;
    Ds_ArqAux: TDataSource;
    ArqAux: TQuery;
    Ds_HisTD: TDataSource;
    HisTD: TQuery;
    Ds_Local: TDataSource;
    Local: TQuery;
    Ds_Cad_Cus: TDataSource;
    Cad_Cus: TQuery;
    Ds_Cad_Tab: TDataSource;
    Cad_Tab: TQuery;
    Ds_Usuarios: TDataSource;
    Usuarios: TQuery;
    Ds_Permissao: TDataSource;
    Permissao: TQuery;
    CriaTabela: TQuery;
    Ds_ArqAux1: TDataSource;
    ArqAux1: TQuery;
    Ds_TD: TDataSource;
    TD: TQuery;
    Ds_Td_Cert: TDataSource;
    Td_Cert: TQuery;
    Ds_Fichario: TDataSource;
    Fichario: TQuery;
    DS_Ufesp: TDataSource;
    Ufesp: TQuery;
    DS_Feriados: TDataSource;
    Feriados: TQuery;
    Ds_Cad_Sit: TDataSource;
    Cad_Sit: TQuery;
    DS_Mod_Exig: TDataSource;
    Mod_Exig: TQuery;
    DS_Configur: TDataSource;
    Configur: TQuery;
    Ds_Seq_Bal: TDataSource;
    Seq_Bal: TQuery;
    Ds_Notifica: TDataSource;
    Notifica: TQuery;
    Ds_Escrit: TDataSource;
    Escrit: TQuery;
    DS_Certidao: TDataSource;
    Certidao: TQuery;
    DS_Baixa: TDataSource;
    Baixa: TQuery;
    Ds_Td_Pesso: TDataSource;
    Td_Pesso: TQuery;
    DS_Log_Dig: TDataSource;
    Log_Dig: TQuery;
    Ds_Caixa: TDataSource;
    Caixa: TQuery;
    DS_Cad_Ir: TDataSource;
    Cad_Ir: TQuery;
    DS_Cad_Oco: TDataSource;
    Cad_Oco: TQuery;
    Ds_Calculo: TDataSource;
    Calculo: TQuery;
    Ds_Cad_Lan: TDataSource;
    Cad_Lan: TQuery;
    Soma: TQuery;
    Ds_Join: TDataSource;
    Join: TQuery;
    Ds_PessAux: TDataSource;
    PessAux: TQuery;
    Ds_CadDiv: TDataSource;
    Cad_Div: TQuery;
    ds_inttd: TDataSource;
    int_tds: TQuery;
    Ds_Int_Pess: TDataSource;
    int_pess: TQuery;
    ds_logerro: TDataSource;
    logerro: TQuery;
    Ds_cep: TDataSource;
    Cep: TQuery;
    AtualizaTD: TQuery;
    BuscaPartes: TQuery;
    Ds_NatCer: TDataSource;
    NatCer: TQuery;
    DS_SeqConf: TDataSource;
    SeqConf: TQuery;
    BxRet: TQuery;
    DS_CotaCert: TDataSource;
    CotaCert: TQuery;
    BuscaContrato: TQuery;
    Ds_ResMen: TDataSource;
    ResMen: TQuery;
    Ds_FiltroNomes: TDataSource;
    FiltroNomes: TQuery;
    Ds_Acertifi: TDataSource;
    acertifi: TQuery;
    Ds_ArqAux2: TDataSource;
    ArqAux2: TQuery;
    DBPJ: TDatabase;
    Ds_CaixaPJ: TDataSource;
    CaixaPJ: TQuery;
    Ds_CaixaIn: TDataSource;
    CaixaIn: TQuery;
    BuscaDado: TQuery;
    DS_Log_Erro: TDataSource;
    Log_Erro: TQuery;
    Ds_CadPi: TDataSource;
    CadPi: TQuery;
    DS_Simcred: TDataSource;
    Simcred: TQuery;
    DS_Ipi: TDataSource;
    ipi: TQuery;
    DS_Modelos: TDataSource;
    Modelos: TQuery;
    Trava: TQuery;
    Grafico: TQuery;
    Ds_Clientes: TDataSource;
    Clientes: TQuery;
    TD_Not: TQuery;
    Ds_TabDemais: TDataSource;
    TabDemais: TQuery;
    qr_cartorio: TQuery;
    ds_cartorio: TDataSource;
    qrMenor: TQuery;
    DSTd_Mov: TDataSource;
    qr_td_mov: TQuery;
    td_temp: TQuery;
    Ds_td_temp: TDataSource;
    tdp_temp: TQuery;
    DS_tdp_temp: TDataSource;
    Selos: TQuery;
    Ds_Selos: TDataSource;
    Ds_Recibo: TDataSource;
    Recibo: TQuery;
    cad_not: TQuery;
    Ds_cad_not: TDataSource;
    LA: TDatabase;
    livro: TQuery;
    Cad_icus: TQuery;
    Ds_cad_icus: TDataSource;
    DS_Config_Adm: TDataSource;
    Config_Adm: TQuery;
    DS_Tab_atos: TDataSource;
    Tab_atos: TQuery;
    DS_Tab_atoemol: TDataSource;
    Tab_atoemol: TQuery;
    DS_Tab_ato2: TDataSource;
    tab_ato2: TQuery;
    DS_TD_Pedid: TDataSource;
    TD_Pedid: TQuery;
    DS_Pedid_Aux: TDataSource;
    Pedid_Aux: TQuery;
    Query1: TQuery;
    cad_tab2: TQuery;
    Ds_Retroativo: TDataSource;
    Retroativo: TQuery;
    Edita_Retro: TQuery;
    qryLavratura: TQuery;
    dsLavratura: TDataSource;
    RvDaje: TRvProject;
    SysDaje: TRvSystem;
    RvRenderPDF1: TRvRenderPDF;
    qryGenerico: TQuery;
    qryCadImoveis: TQuery;
    Ds_CadImoveis: TDataSource;
    qryUF: TQuery;
    ds_UF: TDataSource;
    Ds_Municipio: TDataSource;
    qryMunicipio: TQuery;
    qryMunicipiocodigo: TIntegerField;
    qryMunicipiocodibge: TIntegerField;
    qryMunicipionome_munic: TStringField;
    qryMunicipiouf: TStringField;
    qryExameTitulo: TQuery;
    Ds_ExameTitulo: TDataSource;
    Ds_PartesExameTituloAlienante: TDataSource;
    qryPartesExameTituloAlienante: TQuery;
    Dts_PartesExameTitulo: TDataSource;
    qryPartesExameTitulo: TQuery;
    qryGenerico_Aux: TQuery;
    qryGenerico_Auxiliar3: TQuery;
    qryGenerico_Auxiliar2: TQuery;
    dsEdita_Retro: TDataSource;
    SQLScript1: TSQLScript;
    Script: TSQLScript;
    qryGenerico_Auxiliar4: TQuery;
    qryPenhor: TQuery;
    qryPenhorrecno: TIntegerField;
    qryPenhordata: TDateField;
    qryPenhorprotocolo: TIntegerField;
    qryPenhorvr_credito: TFloatField;
    qryPenhordt_emissao: TDateField;
    qryPenhordt_vencimento: TDateField;
    qryPenhorbens_garantia: TMemoField;
    dsPenhor: TDataSource;
    Qry_CadImp: TQuery;
    configpt: TQuery;
    qryCertificados: TQuery;
    dsCertificados: TDataSource;
    qryRelTitulosPrenotados: TQuery;
    Pessoal: TQuery;
    DS_Pessoal: TDataSource;
    ArqAux_Pessoal: TQuery;
    Qry_td_livroe: TQuery;
    DS_td_livroe: TDataSource;
    procedure UsuariosAfterScroll(DataSet: TDataSet);
    procedure Mod_ExigAfterScroll(DataSet: TDataSet);
    procedure NaturezaAfterScroll(DataSet: TDataSet);
    procedure LocalAfterScroll(DataSet: TDataSet);
    procedure Cad_TabAfterScroll(DataSet: TDataSet);
    procedure UfespAfterScroll(DataSet: TDataSet);
    procedure Cad_CusAfterScroll(DataSet: TDataSet);
    procedure FicharioAfterScroll(DataSet: TDataSet);
    procedure FeriadosAfterScroll(DataSet: TDataSet);
    procedure Cad_SitAfterScroll(DataSet: TDataSet);
    procedure NotificaAfterScroll(DataSet: TDataSet);
    procedure EscritAfterScroll(DataSet: TDataSet);
    procedure Td_CertAfterScroll(DataSet: TDataSet);
    procedure CertidaoAfterScroll(DataSet: TDataSet);
    procedure Cad_IrAfterScroll(DataSet: TDataSet);
    procedure ArqAux1AfterScroll(DataSet: TDataSet);
    procedure CotaCertAfterScroll(DataSet: TDataSet);
    procedure HisTDAfterScroll(DataSet: TDataSet);
    procedure FiltroNomesAfterScroll(DataSet: TDataSet);
    procedure CadPiAfterScroll(DataSet: TDataSet);
    procedure PessAuxAfterScroll(DataSet: TDataSet);
    function ExistirDaje(sSerie, sNumeroDaje :String): Boolean;
    procedure DMCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NomeTabela : String;
    isReentrada: Boolean;
    sNumeroProcoloDOI: String;
    PermitirSelecionarFolhaParaEnvio,
    liberaNaturesaTelaExame: Boolean;
    Dir_CamImagensNotificBMP: String;     
    procedure VerificaArquivoCertidao(sNumeroCertidao, CaminhoDosArquivos:String);
    function VerificaArquivoRegistros(sNumeroCertidao, CaminhoDosArquivos:String): String;
    procedure DirList(ASource: String; ADirList: TStringList; vSeqCarac: String);
    function ExtractName(const Filename: String): String;
    function RetornaVersaoExecutavel: String;
    procedure VerificaArquivoAtualizacao;
    function DajePagoIsentoOuLiberado(codEmissor, sSerie, sNumeroDaje: String; qryConsultaStatus: TQuery): Boolean;
    procedure AtualizaStatusPagamento(codEmissor, sSerie, sNumeroDaje: String; qryConsultaStatus: TQuery);
    Function RemovePonto(vStr:AnsiString):String;
    procedure ValidaVersaoBancoEExecutavel(sVersaoDB: String);
    function ExtractNameCompleto(const Filename: String): String;
    procedure CriarDiretorioImagens(DiretorioOrigem, DiretorioDestino: String);
    procedure GerarNumeroFolhaAutomatico(QtdPag, protocolo: Integer; geraLivroProtocolo, geraLivroRegistro, livroA, livroB, livroC: Boolean; out rlivro, rFolha_Fim: Integer);
    function KillTask(ExeFileName: string): Integer;
    function ConverteBMPBit(LocalQRCodeEmBranco, LocalQRCodeBaixadoDoTribunal: String): Boolean;
  end;
var
  DM: TDM;
  arq_img,
  sSeqCarac : String;
  ExisteArquivo,
  PermiteRecepcaoSemDAJE:Boolean;
  TrabalhaComQRCode: Boolean;
  sProtocolo,
  sProtocoloVinculado,
  sCaminhoDosCarimbos,
  VersaoDoExecutavelGravadoNoBanco,
  sPedidoEstorno,
  sAssinaturaEtiqueta,
  sCargoEtiqueta,
  caminho_imgselo: String;

const
  VersaoDoExecutavel = '1.3.8.5';
  VersaoExecutavelComBanco = '1.0.5.7'; // Informa que este executável so roda com o banco desta versão
  VersaoBateRegister = '04/02/2019 - OnLine';//'27/11/2014';

implementation

uses usuar, Mod_Exig, natureza, local, TAB_AUX1, Ufesp, CadTab, ficha,
  Feriados, CadNot, FICHA2, CadSit, Pesq, PesqC, PNot, Exame, CadOcor,
  AndaNot, Manut, ExameC, Menu, info, AndaNotB, CadPI, Exigenc2, PesqRec, FuncGeral,
  Anot, U_AtualizaBanco, ProcGeral, Tlhelp32;

{$R *.DFM}

function TDm.KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExtractFileName(ExeFileName))) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;


procedure TDM.UsuariosAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_Usu) then
  begin
    if (F_Usu.BitBtn1.Enabled) AND
       (F_Usu.BitBtn2.Enabled) AND
       (F_Usu.BitBtn3.Enabled) AND
       (F_Usu.BitBtn4.Enabled) AND
       (F_Usu.BitBtn5.Enabled) AND
       (F_Usu.BitBtn6.Enabled) AND
       (F_Usu.BitBtn7.Enabled) AND
       (F_Usu.BitBtn8.Enabled) then F_Usu.Carregar(F_Usu, False, False, '');
  end;
end;

procedure TDM.Mod_ExigAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_ModExig) then
  begin
    if (F_ModExig.BitBtn1.Enabled) AND
       (F_ModExig.BitBtn2.Enabled) AND
       (F_ModExig.BitBtn3.Enabled) AND
       (F_ModExig.BitBtn4.Enabled) AND
       (F_ModExig.BitBtn5.Enabled) AND
       (F_ModExig.BitBtn6.Enabled) AND
       (F_ModExig.BitBtn7.Enabled) AND
       (F_ModExig.BitBtn8.Enabled) then F_ModExig.Carregar(F_ModExig);
  end;
  if (Assigned(F_Exige2)) then F_Exige2.Carrega_Modelos(F_Exige2, False);
end;

procedure TDM.NaturezaAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_Natureza) then
  begin
    if (F_Natureza.BitBtn1.Enabled) AND
       (F_Natureza.BitBtn2.Enabled) AND
       (F_Natureza.BitBtn3.Enabled) AND
       (F_Natureza.BitBtn4.Enabled) AND
       (F_Natureza.BitBtn5.Enabled) AND
       (F_Natureza.BitBtn6.Enabled) AND
       (F_Natureza.BitBtn7.Enabled) AND
       (F_Natureza.BitBtn8.Enabled) then F_Natureza.Carregar(F_Natureza);
  end;
end;

procedure TDM.LocalAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_Local) then
  begin
    if (F_Local.BitBtn1.Enabled) AND
       (F_Local.BitBtn2.Enabled) AND
       (F_Local.BitBtn3.Enabled) AND
       (F_Local.BitBtn4.Enabled) AND
       (F_Local.BitBtn5.Enabled) AND
       (F_Local.BitBtn6.Enabled) AND
       (F_Local.BitBtn7.Enabled) AND
       (F_Local.BitBtn8.Enabled) then F_Local.Carregar(F_Local);
  end;
end;

procedure TDM.Cad_TabAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_CadTab) then
  begin
    if (F_CadTab.BitBtn1.Enabled) AND
       (F_CadTab.BitBtn2.Enabled) AND
       (F_CadTab.BitBtn3.Enabled) AND
       (F_CadTab.BitBtn4.Enabled) AND
       (F_CadTab.BitBtn5.Enabled) AND
       (F_CadTab.BitBtn6.Enabled) AND
       (F_CadTab.BitBtn7.Enabled) AND
       (F_CadTab.BitBtn8.Enabled) then F_CadTab.Carregar(F_CadTab);
  end;
end;

procedure TDM.UfespAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_Ufesp) then
  begin
    if (F_Ufesp.BitBtn1.Enabled) AND
       (F_Ufesp.BitBtn2.Enabled) AND
       (F_Ufesp.BitBtn3.Enabled) AND
       (F_Ufesp.BitBtn4.Enabled) AND
       (F_Ufesp.BitBtn5.Enabled) AND
       (F_Ufesp.BitBtn6.Enabled) AND
       (F_Ufesp.BitBtn7.Enabled) AND
       (F_Ufesp.BitBtn8.Enabled) then F_Ufesp.Carregar(F_Ufesp, False, False);
  end;
end;

procedure TDM.Cad_CusAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_TabAux1) then
  begin
    if (F_TabAux1.BitBtn1.Enabled) AND
       (F_TabAux1.BitBtn2.Enabled) AND
       (F_TabAux1.BitBtn3.Enabled) AND
       (F_TabAux1.BitBtn4.Enabled) AND
       (F_TabAux1.BitBtn5.Enabled) AND
       (F_TabAux1.BitBtn6.Enabled) AND
       (F_TabAux1.BitBtn7.Enabled) AND
       (F_TabAux1.BitBtn8.Enabled) then F_TabAux1.Carregar(F_TabAux1);
  end;
end;

procedure TDM.FicharioAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_Fich) then
  begin
    if (F_Fich.BitBtn1.Enabled) AND
       (F_Fich.BitBtn2.Enabled) AND
       (F_Fich.BitBtn3.Enabled) AND
       (F_Fich.BitBtn4.Enabled) AND
       (F_Fich.BitBtn5.Enabled) AND
       (F_Fich.BitBtn6.Enabled) AND
       (F_Fich.BitBtn7.Enabled) AND
       (F_Fich.BitBtn8.Enabled) then F_Fich.Carregar(F_Fich, False, False);
  end;
end;

procedure TDM.FeriadosAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_Feriados) then
  begin
    if (F_Feriados.BitBtn1.Enabled) AND
       (F_Feriados.BitBtn2.Enabled) AND
       (F_Feriados.BitBtn3.Enabled) AND
       (F_Feriados.BitBtn4.Enabled) AND
       (F_Feriados.BitBtn5.Enabled) AND
       (F_Feriados.BitBtn6.Enabled) AND
       (F_Feriados.BitBtn7.Enabled) AND
       (F_Feriados.BitBtn8.Enabled) then F_Feriados.Carregar(F_Feriados, False, False);
  end;
end;

procedure TDM.Cad_SitAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_Sit) then
  begin
    if (F_Sit.BitBtn1.Enabled) AND
       (F_Sit.BitBtn2.Enabled) AND
       (F_Sit.BitBtn3.Enabled) AND
       (F_Sit.BitBtn4.Enabled) AND
       (F_Sit.BitBtn5.Enabled) AND
       (F_Sit.BitBtn6.Enabled) AND
       (F_Sit.BitBtn7.Enabled) AND
       (F_Sit.BitBtn8.Enabled) then F_Sit.Carregar(F_Sit, False, False);
  end;
end;

procedure TDM.NotificaAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_CadNot) then
  begin
    if (F_CadNot.BitBtn1.Enabled) AND
       (F_CadNot.BitBtn2.Enabled) AND
       (F_CadNot.BitBtn3.Enabled) AND
       (F_CadNot.BitBtn4.Enabled) AND
       (F_CadNot.BitBtn5.Enabled) AND
       (F_CadNot.BitBtn6.Enabled) AND
       (F_CadNot.BitBtn7.Enabled) AND
       (F_CadNot.BitBtn8.Enabled) then F_CadNot.Carregar(F_CadNot, False);
  end;
  if Assigned(F_PNotifica) then F_PNotifica.Carrega(F_PNotifica);
end;

procedure TDM.EscritAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_Fich2) then
  begin
    if (F_Fich2.BitBtn1.Enabled) AND
       (F_Fich2.BitBtn2.Enabled) AND
       (F_Fich2.BitBtn3.Enabled) AND
       (F_Fich2.BitBtn5.Enabled) AND
       (F_Fich2.BitBtn6.Enabled) AND
       (F_Fich2.BitBtn8.Enabled) then F_Fich2.Carregar(F_Fich2, False);
  end;
end;

procedure TDM.Td_CertAfterScroll(DataSet: TDataSet);
begin
  if (Assigned(F_Pesq))    then F_Pesq.Carregar(F_Pesq);
  if (Assigned(F_PesqRec)) then F_PesqRec.Carregar(F_PesqRec);
end;

procedure TDM.CertidaoAfterScroll(DataSet: TDataSet);
begin
  if (Assigned(F_PesqC)) then F_PesqC.Carregar(F_PesqC);
end;

procedure TDM.Cad_IrAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_CadOcor) then
  begin
    if (F_CadOcor.BitBtn1.Enabled) AND
       (F_CadOcor.BitBtn2.Enabled) AND
       (F_CadOcor.BitBtn3.Enabled) AND
       (F_CadOcor.BitBtn4.Enabled) AND
       (F_CadOcor.BitBtn5.Enabled) AND
       (F_CadOcor.BitBtn6.Enabled) AND
       (F_CadOcor.BitBtn7.Enabled) AND
       (F_CadOcor.BitBtn8.Enabled) then F_CadOcor.Carregar(F_CadOcor, False, False);
  end;
end;

procedure TDM.ArqAux1AfterScroll(DataSet: TDataSet);
 var
 rl : String;
begin
  if (Assigned(F_AndaNot)) then
  begin
    F_AndaNot.Label3.Visible := True;
    F_AndaNot.Label5.Visible := True;
    F_AndaNot.Label6.Visible := True;
    F_AndaNot.Label8.Visible := True;
    F_AndaNot.Label3.Caption := Dm.ArqAux1.FieldByName('data').asString;
    F_AndaNot.Label5.Caption := Dm.ArqAux1.FieldByName('hora').asString;
    F_AndaNot.Label8.Caption := Dm.ArqAux1.FieldByName('certificado').asString;
    rl := '';
    rl := TrimChar(Dm.ArqAux1.FieldByName('rl').asString,'R');
    rl := TrimChar(RL,'L');
    rl := TrimChar(RL,'B');
    rl := TrimChar(RL,'R');
    rl := Trim(RL);
    if (Length(RL) < 9) and (trim(rl) <> '')  then
    Begin
     rl := Digi(rl);
     F_AndaNot.Label6.Caption := 'RZ '+ rl + ' BR';
    end
    else F_AndaNot.Label6.Caption := Dm.ArqAux1.FieldByName('rl').asString;
  end;
end;

procedure TDM.CotaCertAfterScroll(DataSet: TDataSet);
begin
  if (Assigned(F_ExameC)) then
  begin
    if (Dm.CotaCert.RecordCount <> 0) then
    begin
      F_ExameC.ComboBox1.Text       := Def_Tab(Dm.CotaCert.FieldByName('tabela').asString, True);
      F_ExameC.ComboBox6.Text       := Def_Div(Dm.CotaCert.FieldByName('divisor').asString, True);
      F_ExameC.MaskEdit7.Text       := Dm.CotaCert.FieldByName('qtde_cer').asString;
      F_ExameC.CurrencyEdit2.Value  := (Dm.CotaCert.FieldByName('oficial_cer').asCurrency + Dm.CotaCert.FieldByName('oficial_pag').asCurrency);
      F_ExameC.CurrencyEdit3.Value  := (Dm.CotaCert.FieldByName('estado_cer').asCurrency + Dm.CotaCert.FieldByName('estado_pag').asCurrency);
      F_ExameC.CurrencyEdit4.Value  := (Dm.CotaCert.FieldByName('ipesp_cer').asCurrency + Dm.CotaCert.FieldByName('ipesp_pag').asCurrency);
      F_ExameC.CurrencyEdit5.Value  := (Dm.CotaCert.FieldByName('sinoreg_cer').asCurrency + Dm.CotaCert.FieldByName('sinoreg_pag').asCurrency);
      F_ExameC.CurrencyEdit6.Value  := (Dm.CotaCert.FieldByName('tribunal_cer').asCurrency + Dm.CotaCert.FieldByName('tribunal_pag').asCurrency);
      F_ExameC.CurrencyEdit7.Value  := (Dm.CotaCert.FieldByName('total_cer').asCurrency + Dm.CotaCert.FieldByName('total_pag').asCurrency);
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT nr_protoc,');
      Dm.ArqAux.Sql.Add('SUM(qtde_cer) qtd_c,');
      Dm.ArqAux.Sql.Add('SUM(qtde_pag) qtd_p,');
      Dm.ArqAux.Sql.Add('SUM(oficial)  oficial,');
      Dm.ArqAux.Sql.Add('SUM(estado)   estado,');
      Dm.ArqAux.Sql.Add('SUM(ipesp)    ipesp,');
      Dm.ArqAux.Sql.Add('SUM(sinoreg)  sinoreg,');
      Dm.ArqAux.Sql.Add('SUM(tribunal) tribunal,');
      Dm.ArqAux.Sql.Add('SUM(total)    total');
      Dm.ArqAux.Sql.Add('FROM cotacert');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('nr_protoc = ' + F_ExameC.MaskEdit1.Text);
      Dm.ArqAux.Sql.Add('GROUP BY nr_protoc');
      Dm.ArqAux.Open;
      if (Dm.ArqAux.RecordCount <> 0) then
      begin
      end;
      Dm.ArqAux.Close;
    end;
  end;
end;

procedure TDM.HisTDAfterScroll(DataSet: TDataSet);
begin
  if (Assigned(F_Info)) then
  begin
//    F_Info.Label7.Caption := Dm.HisTd.FieldByName('usuario').asString;
//    if (Dm.HisTd.FieldByName('data').asDateTime > 0) then F_Info.Label17.Caption := Dm.HisTd.FieldByName('data').asString + ' - ' + Dm.HisTd.FieldByName('hora').asString else F_Info.Label17.Caption := '';
  end;
end;

procedure TDM.FiltroNomesAfterScroll(DataSet: TDataSet);
begin
  if (Assigned(F_AndaNotB)) then
  begin
    // Abrindo a tabela temporária
    Dm.ArqAux1.Close;
    Dm.ArqAux1.Sql.Clear;
    Dm.ArqAux1.Sql.Add('SELECT * FROM ' + NomeTabela);
    Dm.ArqAux1.Sql.Add('WHERE');
    Dm.ArqAux1.Sql.Add('nome = ' + Chr(39) + Trim(Dm.FiltroNomes.FieldByName('nome').asString) + Chr(39));
    Dm.ArqAux1.Sql.Add('ORDER BY recno');
    Dm.ArqAux1.Open;
  end;
end;

procedure TDM.CadPiAfterScroll(DataSet: TDataSet);
begin
  if Assigned(F_CadPI) then
  begin
    if (F_CadPI.BitBtn1.Enabled) AND
       (F_CadPI.BitBtn2.Enabled) AND
       (F_CadPI.BitBtn3.Enabled) AND
       (F_CadPI.BitBtn4.Enabled) AND
       (F_CadPI.BitBtn5.Enabled) AND
       (F_CadPI.BitBtn6.Enabled) AND
       (F_CadPI.BitBtn7.Enabled) AND
       (F_CadPI.BitBtn8.Enabled) then F_CadPI.Carrega(F_CadPI, False);
  end;
end;

procedure TDM.PessAuxAfterScroll(DataSet: TDataSet);
begin
  if (Assigned(F_Anot)) then F_Anot.Carrega_Pessoal(F_Anot, False) else
  if (Assigned(F_Exame)) then F_Exame.Carrega_Pessoal(F_Exame, False);
  if (Assigned(F_Manut)) then F_Manut.Carrega_Pessoal(F_Manut, False);
end;

function TDM.ExistirDaje(sSerie, sNumeroDaje: String): Boolean;
begin
  result:= False;

  qryGenerico.Close;
  qryGenerico.SQL.Clear;
  qryGenerico.SQL.Add('select * from daje where numero_daje = '+QuotedStr(sNumeroDaje)+' and serie_daje = '+QuotedStr(sSerie)+'');
  qryGenerico.Open;

  if (Not(qryGenerico.IsEmpty)) Then
    result:= True;

end;

function TDM.RetornaVersaoExecutavel: String;
begin
  Result:= '  -  Versao do Executavel - '+VersaoDoExecutavel+' / Versao da Bate Register - '+VersaoBateRegister+' - Sistema de Titulos e Documentos'
  //Result:= '  -  Versao do Executavel - '+VersaoDoExecutavel+' - Sistema de Titulos e Documentos'
end;


procedure TDM.VerificaArquivoCertidao(sNumeroCertidao, CaminhoDosArquivos:String);
var
  i, x: Integer;
  sListaArqs:TStringList;
  c: cardinal;
  teste,
  sSeqCarac,
  sNome: String;
begin
  sListaArqs:=TStringList.Create;
  sSeqCarac:= sNumeroCertidao;
  DirList(ExtractFilePath(CaminhoDosArquivos+'\')+'*.tif',sListaArqs,sSeqCarac);
  If sListaArqs.Count>0 Then
  Begin
    Try
      for i := 1 to sListaArqs.Count do
      Begin
        sNome := ExtractName(sListaArqs[i-1]);
        DeleteFile(sNome+'.tif');
      End;
     Except
      Begin
        ShowMessage('Script de atualização: '+sNome+'.tif'+' não executado!');
        Application.Terminate;
      End;
  End;
end;
END;

function TDM.VerificaArquivoRegistros(sNumeroCertidao, CaminhoDosArquivos:String): String;
var
  i, x: Integer;
  sListaArqs:TStringList;
  c: cardinal;
  teste,
  sSeqCarac,
  sNome: String;
begin
  result:= '';
  sListaArqs:=TStringList.Create;
  sSeqCarac:= sNumeroCertidao;
  DirList(ExtractFilePath(CaminhoDosArquivos+'\')+'*.*',sListaArqs,sSeqCarac);
  If sListaArqs.Count>0 Then
  Begin
    Try
      for i := 1 to sListaArqs.Count do
      Begin
        sNome := ExtractName(sListaArqs[i-1]);
        result:= sNome;
      End;
     Except
      Begin
        ShowMessage('Erro ao passar pelo arquivo: '+sNome+'!');
        Result:= '';
        Application.Terminate;
      End;
  End;
end;
END;



procedure TDM.DirList(ASource: String; ADirList: TStringList;  vSeqCarac: String);
Var
  SearchRec:TSearchRec;
  Result:Integer;
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

function TDM.ExtractName(const Filename: String): String;
var
  aExt : String;
  aPos : Integer;
begin
  aExt := ExtractFileExt(Filename);
  Result := ExtractFileName(Filename);
  if aExt <> '' then
  begin
    aPos := Pos(aExt,Result);
    if aPos > 0 then
    begin
      Delete(Result,aPos,Length(aExt));
    end;
  end;
end;

function TDM.ExtractNameCompleto(const Filename: String): String;
var
  aExt : String;
  aPos : Integer;
begin
  //aExt := ExtractFileExt(Filename);
  //Result := ExtractFileName(Filename)+ExtractFileExt(Filename);
  Result := ExtractFileName(Filename);
  {if aExt <> '' then
  begin
    aPos := Pos(aExt,Result);
    if aPos > 0 then
    begin
      Delete(Result,aPos,Length(aExt));
    end;
  end; }
end;


procedure TDM.AtualizaStatusPagamento(codEmissor, sSerie,
  sNumeroDaje: String; qryConsultaStatus: TQuery);
begin
  qryConsultaStatus.Close;
  qryConsultaStatus.SQL.Clear;
  qryConsultaStatus.SQL.Add('update daje set status = :status where (serie_daje = :serie_daje and numero_daje = :numero_daje and iddaje_tj = :iddaje_tj)');
  qryConsultaStatus.ParamByName('serie_daje').AsString  := sSerie;
  qryConsultaStatus.ParamByName('numero_daje').AsString := sNumeroDaje;
  qryConsultaStatus.ParamByName('iddaje_tj').AsString   := codEmissor;
  qryConsultaStatus.ParamByName('status').AsString      := 'Liberado Manualmente';
  qryConsultaStatus.ExecSQL;
end;

function TDM.DajePagoIsentoOuLiberado(codEmissor, sSerie,
  sNumeroDaje: String; qryConsultaStatus: TQuery): Boolean;
begin
  result:= False;
  qryConsultaStatus.Close;
  qryConsultaStatus.SQL.Clear;
  qryConsultaStatus.SQL.Add('select status from daje where (serie_daje = :serie_daje and numero_daje = :numero_daje and iddaje_tj = :iddaje_tj)');
  qryConsultaStatus.ParamByName('serie_daje').AsString  := sSerie;
  qryConsultaStatus.ParamByName('numero_daje').AsString := sNumeroDaje;
  qryConsultaStatus.ParamByName('iddaje_tj').AsString   := codEmissor;
  qryConsultaStatus.Open;
  result:= (qryConsultaStatus.FieldByName('status').AsString = 'Pago') or
           (qryConsultaStatus.FieldByName('status').AsString = 'Liberado Manualmente') or
           (qryConsultaStatus.FieldByName('status').AsString = 'Isento');

end;

procedure TDM.VerificaArquivoAtualizacao;
var
  i, x: Integer;
  sListaArqs:TStringList;
  c: cardinal;
  teste,
  sNome: String;
begin
  ExisteArquivo:= False;

  sListaArqs:=TStringList.Create;
  sSeqCarac:='Pack_AtualizaTD_';
  DirList(ExtractFilePath(ParamStr(0))+'*.Sql',sListaArqs,sSeqCarac);
  If sListaArqs.Count>0 Then
  Begin
     F_AtualizaBanco:=TF_AtualizaBanco.Create(Application);
     F_AtualizaBanco.Show;
    Try
      for i := 1 to sListaArqs.Count do
      Begin
        ExisteArquivo:=True;
        sNome := ExtractName(sListaArqs[i-1]);

        Script.SQL.Clear;
        Script.SQL.LoadFromFile(sNome+'.Sql');
        F_AtualizaBanco.MemScript.Lines.Add('Arquivo:'+sNome+'.Sql'+', sendo processado!');
        for x := 0 to Script.SQL.Count -1 do
          F_AtualizaBanco.MemScript.Lines.Add(Script.SQL.Strings[x]);

        Script.ExecSQL;
        DeleteFile(sNome+'.Sql');


      End;
      ShowMessage('Atualização realizada em: '+ inttostr(GetTickCount - c) + ' ms!');
      F_AtualizaBanco.Close;
     Except
      Begin
        ShowMessage('Script de atualização: '+sNome+'.Sql'+' não executado!');
        Application.Terminate;
      End;
    End;
  End;

  if not FileExists(sNome+'.Sql') then
  Begin
    ExisteArquivo:=False;
  End;
end;   


procedure TDM.ValidaVersaoBancoEExecutavel(sVersaoDB: String);
begin
  {Indica com qual banco este executável pode trabalhar
   lembrando que este controle faz referencia apenas ao banco}

  IF ((RemovePonto(sVersaoDB)) < (RemovePonto(VersaoExecutavelComBanco))) or (sVersaoDB = '') Then
  Begin
    Application.MessageBox(PChar('Este executável não é compatível com o banco de dados atual: '+Copy(sVersaoDB,1,1) + '.' + Copy(sVersaoDB,2,1) + '.' + Copy(sVersaoDB,3,1) + '.' + Copy(sVersaoDB,4,1)+', '+
                                 'por favor, verifique o gerenciador de versões e execute os respectivos updates!'), 'Títulos e Documentos',MB_OK+MB_ICONEXCLAMATION);
    Application.Terminate;
  End;

end;

function TDM.RemovePonto(vStr: AnsiString): String;
Begin
 Result:=vStr;
  While Pos('.',Result)>0 Do
    Delete(REsult,Pos('.',Result),1);
  While Pos(',',Result)>0 Do
    Delete(REsult,Pos(',',Result),1);
  While Pos('-',Result)>0 Do
    Delete(REsult,Pos('-',Result),1);
  While Pos('/',Result)>0 Do
    Delete(REsult,Pos('/',Result),1);
End;


procedure TDM.DMCreate(Sender: TObject);
var
  ShFileOpStruct : TShFileOpStruct;
begin
  If Not DirectoryExists('C:\siscart\temp\td') then
  Begin
    CreateDir('C:\siscart\temp\td');
    CriarDiretorioImagens('C:\siscart\temp\Convert', 'C:\siscart\temp\td\Convert');
  End;

  If Not DirectoryExists('C:\siscart\temp\td\convtif') then
  Begin
    CreateDir('C:\siscart\temp\td\convtif');
    CriarDiretorioImagens('C:\siscart\temp\convtif', 'C:\siscart\temp\td\convtif');
  End;

  If Not DirectoryExists('C:\siscart\temp\td\imagens') then
  Begin
    CreateDir('C:\siscart\temp\td\imagens');
    CriarDiretorioImagens('C:\siscart\temp\imagens', 'C:\siscart\temp\td\imagens');
  End;
end;

procedure TDM.CriarDiretorioImagens(DiretorioOrigem,
  DiretorioDestino: String);
var 
  OpStruc : TSHFileOpStruct;
  frombuf,
  tobuf : array[0..128] of Char;
begin
  FillChar(frombuf, Sizeof(frombuf), 0);
  FillChar(tobuf, Sizeof(tobuf), 0);
  StrPCopy(frombuf, DiretorioOrigem);
  StrPCopy(tobuf, DiretorioDestino);
  with OpStruc do
  begin
    Wnd := Application.Handle;
    wFunc := FO_COPY;
    pFrom := @frombuf;
    pTo := @tobuf;
    fFlags := FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
    fAnyOperationsAborted := False;
    hNameMappings := nil;
    lpszProgressTitle := nil;
  end; // with
  ShFileOperation(OpStruc); 
end; // CopyDir

procedure TDM.GerarNumeroFolhaAutomatico(QtdPag, protocolo: Integer; geraLivroProtocolo,
  geraLivroRegistro, livroA, livroB, livroC: Boolean; out rlivro, rFolha_Fim: Integer);
  var
    Tot_Folha_Protoc,
    Tot_Protocolo,
    Tot_Folha_Registro,
    rFolha: Integer;
    livro_encerrado: String;
    diferenca: Integer;
    continuidadeRegistro: Boolean;
begin                            //livro automatico
  diferenca:= 0;
  if (geraLivroProtocolo) and (livroA) Then
  Begin
    dm.qryGenerico_Auxiliar3.Close;
    dm.qryGenerico_Auxiliar3.SQL.Clear;
    dm.qryGenerico_Auxiliar3.SQL.Add('select tot_prot_lva_p, livro_lva_p, folha_lva_p, tot_folha_lva_p from configur');
    dm.qryGenerico_Auxiliar3.Open;            

    {Buscar na configur qual a paginação total de folhas e de protocolo}
    Tot_Folha_Protoc:= Dm.qryGenerico_Auxiliar3.FieldByName('tot_folha_lva_p').AsInteger;
    Tot_Protocolo   := Dm.qryGenerico_Auxiliar3.FieldByName('tot_prot_lva_p').AsInteger;
    rLivro           := Dm.qryGenerico_Auxiliar3.FieldByName('livro_lva_p').AsInteger;
    rFolha_Fim           := Dm.qryGenerico_Auxiliar3.FieldByName('folha_lva_p').AsInteger;

    dm.qryGenerico_Auxiliar3.Close;
    dm.qryGenerico_Auxiliar3.SQL.Clear;
    dm.qryGenerico_Auxiliar3.SQL.Add('select count(*) as numero from td_protocolo_pagina');
    dm.qryGenerico_Auxiliar3.SQL.Add('where livro_a = '+QuotedStr(inttostr(rLivro))+' and folha_a = '+QuotedStr(inttostr(rFolha_Fim))+' ');
    dm.qryGenerico_Auxiliar3.Open;

    if (dm.qryGenerico_Auxiliar3.FieldByName('numero').AsInteger >= Tot_Protocolo) Then
    begin
      rFolha_Fim:= rFolha_Fim + 1;
      if rFolha_Fim > Tot_Folha_Protoc Then
      begin
        rLivro:= rLivro + 1;
        rFolha_Fim:= 1;
      end
    end;
    
    try
      dm.qryGenerico_Auxiliar3.Close;
      dm.qryGenerico_Auxiliar3.SQL.Clear;
      dm.qryGenerico_Auxiliar3.SQL.Add('insert into td_protocolo_pagina(livro_a, folha_a, p_auxiliar, data_lanc, livro_b, folha_b, livro_c, folha_c)');
      dm.qryGenerico_Auxiliar3.SQL.Add('values('+QuotedStr(inttostr(rLivro))+', '+QuotedStr(IntToStr(rFolha_Fim))+', '+QuotedStr(inttostr(protocolo))+',');
      dm.qryGenerico_Auxiliar3.SQL.Add(''+QuotedStr(FormatDateTime('yyyy-mm-dd', now))+', '+QuotedStr('0')+', '+QuotedStr('0')+', '+QuotedStr('0')+', '+QuotedStr('0')+')');
      dm.qryGenerico_Auxiliar3.ExecSQL;

    except
      ShowMessage('Erro ao inserir livro e folha na tabela td_protocolo_pagina!');
    End;

    try
      dm.qryGenerico_Auxiliar2.Close;
      dm.qryGenerico_Auxiliar2.SQL.Clear;
      dm.qryGenerico_Auxiliar2.SQL.Add('update configur set livro_lva_p = :livro_lva_p, folha_lva_p = :folha_lva_p ');
      dm.qryGenerico_Auxiliar2.ParamByName('livro_lva_p').AsInteger:= rLivro;
      dm.qryGenerico_Auxiliar2.ParamByName('folha_lva_p').AsInteger:= rFolha_Fim;
      dm.qryGenerico_Auxiliar2.ExecSQL;
    except
      ShowMessage('Erro ao inserir livro e folha na tabela configur!');
    End;

    try
      dm.qryGenerico_Auxiliar2.Close;
      dm.qryGenerico_Auxiliar2.SQL.Clear;
      dm.qryGenerico_Auxiliar2.SQL.Add('update td set livro = :livro, folha = :folha Where p_auxiliar = :p_auxiliar');
      dm.qryGenerico_Auxiliar2.ParamByName('livro').AsInteger  := rLivro;
      dm.qryGenerico_Auxiliar2.ParamByName('folha').AsInteger  := rFolha_Fim;
      dm.qryGenerico_Auxiliar2.ParamByName('p_auxiliar').AsInteger:= protocolo;
      dm.qryGenerico_Auxiliar2.ExecSQL;
    except
      ShowMessage('Erro ao inserir livro e folha na tabela TD!');
    End;

  End
  Else
  if (geraLivroRegistro) and (livroB) Then
  Begin
      continuidadeRegistro:= False;

      dm.qryGenerico_Auxiliar3.Close;
      dm.qryGenerico_Auxiliar3.SQL.Clear;
      dm.qryGenerico_Auxiliar3.SQL.Add('select tot_folha_lvb_p, livrop, folhap from configur');
      dm.qryGenerico_Auxiliar3.Open;

      Tot_Folha_Registro  := Dm.qryGenerico_Auxiliar3.FieldByName('tot_folha_lvb_p').AsInteger;
      rLivro              := Dm.qryGenerico_Auxiliar3.FieldByName('livrop').AsInteger;

      dm.qryGenerico_Auxiliar2.Close;
      dm.qryGenerico_Auxiliar2.SQL.Clear;
      dm.qryGenerico_Auxiliar2.SQL.Add('select livro_b, folha_b, folha_b_f, p_auxiliar, data_lanc, livrob_enc from td_protocolo_pagina where livro_b = '+QuotedStr(intToStr(rLivro))+'');
      dm.qryGenerico_Auxiliar2.Open;

      if Dm.qryGenerico_Auxiliar2.FieldByName('livrob_enc').AsString = 'S' Then
      begin
        rLivro:= rLivro + 1;
        rFolha:= 1;

        if QtdPag > 1 Then
        Begin
          rFolha              := Dm.qryGenerico_Auxiliar3.FieldByName('folhap').AsInteger;
          rFolha_Fim          := ((Dm.qryGenerico_Auxiliar3.FieldByName('folhap').AsInteger - 1) + QtdPag);
        End
        Else
        Begin
          rFolha              := Dm.qryGenerico_Auxiliar3.FieldByName('folhap').AsInteger;
          rFolha_Fim          := Dm.qryGenerico_Auxiliar3.FieldByName('folhap').AsInteger;
        End;

      End
      Else
      Begin
        if QtdPag > 1 Then
        Begin
          rFolha              := Dm.qryGenerico_Auxiliar3.FieldByName('folhap').AsInteger;
          rFolha_Fim          := ((Dm.qryGenerico_Auxiliar3.FieldByName('folhap').AsInteger - 1) + QtdPag);
        End
        Else
        Begin
          rFolha              := Dm.qryGenerico_Auxiliar3.FieldByName('folhap').AsInteger;
          rFolha_Fim          := Dm.qryGenerico_Auxiliar3.FieldByName('folhap').AsInteger;
        End;
      End;

      {Se a folha alcançar o total ela cria um novo livro e recalcula a folha}

      if (QtdPag + rFolha) > Tot_Folha_Registro then
      begin
        continuidadeRegistro := True;     //5 - 1 = 10

      end
      else
      continuidadeRegistro:= False;

      if ((rFolha + QtdPag) > (Tot_Folha_Registro)) and (Not(continuidadeRegistro)) Then
      Begin
        livro_encerrado     := 'S';
      End;

      try
        dm.qryGenerico_Auxiliar3.Close;
        dm.qryGenerico_Auxiliar3.SQL.Clear;
        dm.qryGenerico_Auxiliar3.SQL.Add('select livro_b, folha_b, folha_b_f, p_auxiliar, data_lanc, livrob_enc from td_protocolo_pagina where recno = 0');
        dm.qryGenerico_Auxiliar3.Open;


        dm.qryGenerico_Auxiliar3.Close;
        dm.qryGenerico_Auxiliar3.SQL.Clear;
        dm.qryGenerico_Auxiliar3.SQL.Add('insert into td_protocolo_pagina(livro_a, folha_a, p_auxiliar, data_lanc, livro_b, folha_b, folha_b_f, livro_c, folha_c, livrob_enc)');
        dm.qryGenerico_Auxiliar3.SQL.Add('values('+QuotedStr(inttostr(0))+', '+QuotedStr(IntToStr(0))+', '+QuotedStr(inttostr(protocolo))+',');
        dm.qryGenerico_Auxiliar3.SQL.Add(''+QuotedStr(FormatDateTime('yyyy-mm-dd', now))+', '+QuotedStr(IntToStr(rLivro))+', '+QuotedStr(IntToStr(rFolha))+', '+QuotedStr(IntToStr(rFolha_Fim))+', '+QuotedStr('0')+', '+QuotedStr('0')+', '+QuotedStr(livro_encerrado)+')');
        dm.qryGenerico_Auxiliar3.ExecSQL;

      except
        ShowMessage('Erro ao inserir livro e folha na tabela td_protocolo_pagina!');
      End;

      try
        dm.qryGenerico_Auxiliar2.Close;
        dm.qryGenerico_Auxiliar2.SQL.Clear;
        dm.qryGenerico_Auxiliar2.SQL.Add('update td set livro_reg = :livro_reg, folha_reg = :folha_reg, folha_reg_f = :folha_reg_f Where p_auxiliar = :p_auxiliar');
        dm.qryGenerico_Auxiliar2.ParamByName('livro_reg').AsInteger  := rLivro;
        dm.qryGenerico_Auxiliar2.ParamByName('folha_reg').AsInteger  := rFolha;
        if continuidadeRegistro then
          dm.qryGenerico_Auxiliar2.ParamByName('folha_reg_f').AsInteger:= Tot_Folha_Registro
        else
        dm.qryGenerico_Auxiliar2.ParamByName('folha_reg_f').AsInteger:= rFolha_Fim;
        dm.qryGenerico_Auxiliar2.ParamByName('p_auxiliar').AsInteger:= protocolo;
        dm.qryGenerico_Auxiliar2.ExecSQL;
      except
        ShowMessage('Erro ao inserir livro e folha na tabela TD!');
      End;

      if ((rFolha + QtdPag) > (Tot_Folha_Registro)) Then
      Begin
        livro_encerrado     := 'S';
      End;


      If continuidadeRegistro then
      begin
        If livro_encerrado = 'S' Then
        Begin

         diferenca:=   (Tot_Folha_Registro - rFolha);

         if diferenca > 0 then
         begin
           rFolha_Fim:= (QtdPag - diferenca);
         end;
         rLivro:= rLivro + 1;

        End;
      end
      else
      begin
        If livro_encerrado = 'S' Then
        Begin
          rLivro:= rLivro + 1;
          rFolha_Fim:= 1;
        End
        Else
        rFolha_Fim:= rFolha_Fim + 1;
      End;
      
      try
        dm.qryGenerico_Auxiliar2.Close;
        dm.qryGenerico_Auxiliar2.SQL.Clear;
        dm.qryGenerico_Auxiliar2.SQL.Add('update configur set livrop = :livrop, folhap = :folhap ');
        dm.qryGenerico_Auxiliar2.ParamByName('livrop').AsInteger:= rLivro;
        dm.qryGenerico_Auxiliar2.ParamByName('folhap').AsInteger:= rFolha_Fim;
        dm.qryGenerico_Auxiliar2.ExecSQL;
      except
        ShowMessage('Erro ao inserir livro e folha na tabela configur!');
      End;

  End

  Else
  if (geraLivroRegistro) and (livroC) Then
  Begin

      dm.qryGenerico_Auxiliar3.Close;
      dm.qryGenerico_Auxiliar3.SQL.Clear;
      dm.qryGenerico_Auxiliar3.SQL.Add('select tot_folha_lvc_p, livroc, folhac from configur');
      dm.qryGenerico_Auxiliar3.Open;

      Tot_Folha_Registro := Dm.qryGenerico_Auxiliar3.FieldByName('tot_folha_lvc_p').AsInteger;
      rLivro              := Dm.qryGenerico_Auxiliar3.FieldByName('livroc').AsInteger;
      rFolha              := Dm.qryGenerico_Auxiliar3.FieldByName('folhac').AsInteger;


      if Dm.qryGenerico_Auxiliar2.FieldByName('livroc_enc').AsString = 'S' Then
      begin
        rLivro:= rLivro + 1;
        rFolha:= 1;

        if QtdPag > 1 Then
        Begin
          rFolha              := Dm.qryGenerico_Auxiliar3.FieldByName('folhac').AsInteger;
          rFolha_Fim          := ((Dm.qryGenerico_Auxiliar3.FieldByName('folhac').AsInteger - 1) + QtdPag);
        End
        Else
        Begin
          rFolha              := Dm.qryGenerico_Auxiliar3.FieldByName('folhac').AsInteger;
          rFolha_Fim          := Dm.qryGenerico_Auxiliar3.FieldByName('folhac').AsInteger;
        End;

      End
      Else
      Begin
        if QtdPag > 1 Then
        Begin
          rFolha              := Dm.qryGenerico_Auxiliar3.FieldByName('folhac').AsInteger;
          rFolha_Fim          := ((Dm.qryGenerico_Auxiliar3.FieldByName('folhac').AsInteger - 1) + QtdPag);
        End
        Else
        Begin
          rFolha              := Dm.qryGenerico_Auxiliar3.FieldByName('folhac').AsInteger;
          rFolha_Fim          := Dm.qryGenerico_Auxiliar3.FieldByName('folhac').AsInteger;
        End;
      End;

      {Se a folha alcançar o total ela cria um novo livro e recalcula a folha}

      if ((rFolha + QtdPag) > (Tot_Folha_Registro)) Then
      Begin
        livro_encerrado     := 'S';
      End;
               
      try
        dm.qryGenerico_Auxiliar3.Close;
        dm.qryGenerico_Auxiliar3.SQL.Clear;
        dm.qryGenerico_Auxiliar3.SQL.Add('insert into td_protocolo_pagina(livro_a, folha_a, p_auxiliar, data_lanc, livro_b, folha_b, livro_c, folha_c, folha_c_f)');
        dm.qryGenerico_Auxiliar3.SQL.Add('values('+QuotedStr(inttostr(0))+', '+QuotedStr(IntToStr(0))+', '+QuotedStr(inttostr(protocolo))+',');
        dm.qryGenerico_Auxiliar3.SQL.Add(''+QuotedStr(FormatDateTime('yyyy-mm-dd', now))+', '+QuotedStr('0')+', '+QuotedStr('0')+', '+QuotedStr(IntToStr(rLivro))+', '+QuotedStr(IntToStr(rFolha))+', '+QuotedStr(IntToStr(rFolha_Fim))+')');
        dm.qryGenerico_Auxiliar3.ExecSQL;
      except
        ShowMessage('Erro ao inserir livro e folha na tabela td_protocolo_pagina!');
      End;

      try
        dm.qryGenerico_Auxiliar2.Close;
        dm.qryGenerico_Auxiliar2.SQL.Clear;
        dm.qryGenerico_Auxiliar2.SQL.Add('update td set livro_reg = :livro_reg, folha_reg = :folha_reg, folha_reg_f = :folha_reg_f Where p_auxiliar = :p_auxiliar');
        dm.qryGenerico_Auxiliar2.ParamByName('livro_reg').AsInteger:= rLivro;
        dm.qryGenerico_Auxiliar2.ParamByName('folha_reg').AsInteger:= rFolha;
        dm.qryGenerico_Auxiliar2.ParamByName('folha_reg_f').AsInteger:= rFolha_Fim;
        dm.qryGenerico_Auxiliar2.ParamByName('p_auxiliar').AsInteger:= protocolo;
        dm.qryGenerico_Auxiliar2.ExecSQL;
      except
        ShowMessage('Erro ao inserir livro e folha na tabela TD!');
      End;

      If livro_encerrado = 'S' Then
      Begin
        rLivro:= rLivro + 1;
        rFolha_Fim:= 1;
      End
      Else
      rFolha_Fim:= rFolha_Fim + 1;


      try
        dm.qryGenerico_Auxiliar2.Close;
        dm.qryGenerico_Auxiliar2.SQL.Clear;
        dm.qryGenerico_Auxiliar2.SQL.Add('update configur set livroc = :livroc, folhac = :folhac ');
        dm.qryGenerico_Auxiliar2.ParamByName('livroc').AsInteger:= rLivro;
        dm.qryGenerico_Auxiliar2.ParamByName('folhac').AsInteger:= rFolha_Fim;
        dm.qryGenerico_Auxiliar2.ExecSQL;
      except
        ShowMessage('Erro ao inserir livro e folha na tabela configur!');
      End;
    End;

end;

function TDM.ConverteBMPBit(LocalQRCodeEmBranco,
  LocalQRCodeBaixadoDoTribunal: String): Boolean;
var
  bitmap0, bitmap1, bitmap2 : TBitmap;
  Rect, MyOther: TRect;
  MyRect: TRect;
  LarguraEsquerda, LarguraDireita, LarguraTotal, AlturaTotal: integer;
begin

  result:= False;

  bitmap0 := TBitmap.Create;

  bitmap1 := TBitmap.Create;
  bitmap0.LoadFromFile(LocalQRCodeEmBranco); // ler a imagem vazia

  bitmap1.LoadFromFile(LocalQRCodeBaixadoDoTribunal);

  //Bitmap1.Canvas.FillRect(MyRect1);

  bitmap0.Canvas.Draw(0,0, Bitmap1);

  bitmap0.SaveToFile('C:\siscart\imgselo\QrCode.bmp');

  bitmap0.Destroy;
  bitmap1.Destroy;

  result:= True;

end;

end.
