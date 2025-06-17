unit U_ExportacaoDOI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, Mask, Buttons, Db, DBTables;

type
  TF_ExportacaoDOI = class(TForm)
    ControlBar1: TControlBar;
    Label36: TLabel;
    cbCompetencia: TComboBox;
    Label13: TLabel;
    EdCaminhoDiretorio: TMaskEdit;
    Label3: TLabel;
    EdExercicio: TMaskEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbTipoDOI: TComboBox;
    Label2: TLabel;
    Memo1: TMemo;
    qryTDGeral: TQuery;
    qryTDAlienante: TQuery;
    qryTDAdiquirente: TQuery;
    Label4: TLabel;
    CbRetificacaoDoAto: TComboBox;
    Label5: TLabel;
    ComboBox1: TComboBox;
    MkNumeroControle: TMaskEdit;
    Label6: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure GerarArquivoDOI;
    Function Pree_Esq(qtd:Integer; texto:String; carac:Char) : String;
    Function Pree_Dir(qtd:Integer; texto:String; carac:Char) : String;
    function RetornaMunicipio(iCodigo: Integer): String;
    procedure cbCompetenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdExercicioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTipoDOIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MkNumeroControleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbRetificacaoDoAtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCaminhoDiretorioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  idDoRegistro1 = 1;
  idDoRegistro2 = 2;
  idDoRegistro3 = 3;
  idDoRegistro9 = 9;

var
  F_ExportacaoDOI: TF_ExportacaoDOI;
  Filler,
  Filler2,
  Filler3,
  Filler4,
  Filler5,
  NumeroDoControle,
  DataDaLavratura,
  Livro,
  Folha_Livro,
  Folha,
  Matricula,
  Registro,
  Situacao,
  AtribuicaoDaDOI,
  TipoDaTransacao,
  DescricaoDoTipoDaTransacao,
  RetificacaoDoAto,
  DataDaAlienacao,
  FormaDeAlienacao,
  ValorNaoCostaNosDocumentos,
  ValorDaAlienacaoEAquisicao,
  BaseDeCalcITBI_ITCD,
  TipoDoImovel,
  DescricaoDoTipoDoImovel,
  SituacaoDaConstrucao,
  Localizacao,
  AreaNaoConsta,
  Area,
  EnderecoDoImovel,
  Numero,
  Complemento,
  Bairro,
  CepDoImovel,
  Municipio,
  UF,
  Inscricao_NIRF,
  Valor_ITBI,
  FillerTipo1,
  HexaTipo1,
  ValorNaoCostaNosDocumentosITBI,


  FillerAlienanteOutro,
  cpf_cnpjAlienante,
  participacaoNaOperacaoAlienante,
  cpf_ProcuradorDadosAlienante,
  FillerAlienante,
  FimDeRegistroAlienante,

  cpf_cnpjAdiquirente,
  participacaoNaOperacaoAdiquirente,
  cpf_ProcuradorDadosAdiquirente,
  FillerAdiquirente,
  FimDeRegistroAdiquirente,

  campoDeControle,
  FillerControle,
  FimDeRegistroControle: String;

  TotalDeRegistro: Integer;


implementation

uses DMTD, FuncGeral;

{$R *.DFM}

procedure TF_ExportacaoDOI.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ExportacaoDOI.BitBtn1Click(Sender: TObject);
var
  Arquivo: TextFile;
begin

  if (cbCompetencia.Text = '') then
  Begin
    ShowMessage('Competência dos Registros: deve ser informada!');
    Abort;
  End;

  if (EdExercicio.Text = '') then
  Begin
    ShowMessage('Exercício: deve ser informado!');
    Abort;
  End;

  if (EdCaminhoDiretorio.Text = '') then
  Begin
    ShowMessage('Diretório: deve ser informado!');
    Abort;
  End;
  Memo1.Lines.Clear;
  GerarArquivoDOI;

  Try
    Memo1.Lines.SaveToFile(EdCaminhoDiretorio.Text + '\DOI.txt');
  Except
    Application.MessageBox('Diretório para exportação não encontrado!', 'Gerar Arquivo DOI', Mb_IconWarning);
    Exit;
  End;
  Application.MessageBox('Fim da Exportação!', 'Gerar Arquivo DOI', Mb_IconInformation);
end;

procedure TF_ExportacaoDOI.GerarArquivoDOI;
begin

  qryTDGeral.Close;
  qryTDGeral.SQL.Clear;
  qryTDGeral.SQL.Add('SELECT * FROM td inner join imoveis on (td.p_auxiliar = imoveis.codprotocolo) where month(data_p) = :mes and year(data_p) = :ano and td.enviar_doi = '+QuotedStr('Sim')+'');
  qryTDGeral.ParambyName('mes').AsInteger:= cbCompetencia.ItemIndex + 1;
  qryTDGeral.ParambyName('ano').AsInteger:= strtoint(EdExercicio.Text);
  qryTDGeral.Open;

  Filler  := StringOfChar(' ', 115);
  Filler2 := StringOfChar(' ', 10);
  Filler3 := StringOfChar(' ', 208);
  Filler4 := StringOfChar(' ', 16);
  Filler5 := StringOfChar(' ', 342);


  TotalDeRegistro:= 0;


  qryTDGeral.First;
  while not (qryTDGeral.eof) do
  Begin
    If ((cbTipoDOI.ItemIndex = 1) and (cbTipoDOI.ItemIndex = 2)) Then   // Ajustar aqui de acordo layout
    Begin
      NumeroDoControle                          := EdExercicio.Text + MkNumeroControle.Text;
      ShowMessage('Campo: Controle deve ser preenchido!');
      Abort;
    End
    Else                                                                {A Função Pree_Esq adiciona a string dentro do espaço definido no copy }
    NumeroDoControle                            := Filler2;
    DataDaLavratura                             := copy(DateToStr(qryTDGeral.FieldByName('data_p').AsDateTime), 1, 10 );
    Livro                                       := copy(Pree_Dir(7, 'B'  , ' '), 1, 1 );

    {if (Not(qryTDGeral.FieldByName('folha').IsNull) or
      (Not(qryTDGeral.FieldByName('folha').AsString = ''))) Then
    Folha                                       := copy(Pree_Dir(6, qryTDGeral.FieldByName('folha').AsString, ' '), 1, 6)
    Else
    Folha := copy(Pree_Dir(6, '0', ' '), 1, 6); }

    if (Not(qryTDGeral.FieldByName('livro_reg').IsNull) or
      (Not(qryTDGeral.FieldByName('livro_reg').AsString = ''))) Then
    Folha_Livro                                       := copy(Pree_Dir(6, Strzero(qryTDGeral.FieldByName('livro_reg').AsString, 3), ' '), 1, 6)
    Else
    Folha_Livro := copy(Pree_Dir(6, Strzero('0', 3), ' '), 1, 6);


    if qryTDGeral.FieldByName('folha_reg').AsString <> '' then
      Folha                                 := copy(Pree_Dir(15, Strzero(qryTDGeral.FieldByName('folha_reg').AsString, 4), ' '), 1, 15 )
    else
    Folha                                   := copy(Pree_Dir(15, Strzero('0', 4), '0'), 1, 15 );


    if qryTDGeral.FieldByName('numeromatricula').AsString <> '' then
      Matricula                                 := copy(Pree_Dir(5, Strzero(qryTDGeral.FieldByName('numeromatricula').AsString, 5), ' '), 1, 5 )
    else
    Matricula                                   := copy(Pree_Dir(5, Strzero('0', 1), '0'), 1, 5 );

    if qryTDGeral.FieldByName('registro').AsString <> '' then
      Registro                                  := copy(Pree_Esq(15, qryTDGeral.FieldByName('registro').AsString, '0'), 1, 15 )
    else
    Registro                                    := copy(Pree_Esq(15, '0', '0'), 1, 15 );

    Situacao                                    := Copy(Pree_Esq(1, cbTipoDOI.Text, ' '), 1 ,1);

    AtribuicaoDaDOI                             := Copy(Pree_Esq(1, inttostr(CbRetificacaoDoAto.ItemIndex+1), ' '), 1 ,1); //1=Ofício de Notas / 2=Registro de Imóveis / 3=Registro de Títulos e Documentos
    TipoDaTransacao                             := Copy(Pree_Esq(2, qryTDGeral.FieldByName('codtipotransacao').AsString, ' '), 1 ,2);
    DescricaoDoTipoDaTransacao                  := copy(Pree_Esq(30, qryTDGeral.FieldByName('desctipotrans').AsString, ' '), 1, 30);

    RetificacaoDoAto                            := copy(Pree_Esq(1, cbTipoDOI.Text, ' '), 1, 1);

    DataDaAlienacao                             := copy(Pree_Esq(10, DateToStr(qryTDGeral.FieldByName('dataalienacao').AsDateTime), ' '), 1, 10 );;
    FormaDeAlienacao                            := copy(Pree_Esq(1, qryTDGeral.FieldByName('codformalienacao').AsString, ' '), 1, 1);

    If qryTDGeral.FieldByName('valoralienacao').AsCurrency > 0 then
    Begin
      ValorNaoCostaNosDocumentos                := copy(Pree_Esq(1, '0', '0'), 1, 1);
      ValorDaAlienacaoEAquisicao                := copy(Pree_Esq(15, TirarPonto(StrCurr(qryTDGeral.FieldByName('valoralienacao').asCurrency , 14, True)), '0')      , 1, 15 );
    End
    Else
    Begin
      ValorNaoCostaNosDocumentos                := copy(Pree_Esq(1, '1', '1'), 1, 1);
      ValorDaAlienacaoEAquisicao                := copy(Pree_Esq(15, TirarPonto(StrCurr(0 , 14, True)), '0')      , 1, 15 );
      //ValorDaAlienacaoEAquisicao                := copy(Pree_Esq(15, ValorDaAlienacaoEAquisicao, ' '), 1, 15 );
    End;
    BaseDeCalcITBI_ITCD                         := copy(Pree_Esq(15, TirarPonto(StrCurr(qryTDGeral.FieldByName('BaseDeCalculoITBI').AsCurrency , 14, True)), '0')      , 1, 15 );
    TipoDoImovel                                := copy(Pree_Esq(2, qryTDGeral.FieldByName('codtipoimovel').AsString, ' '), 1, 2);
    DescricaoDoTipoDoImovel                     := copy(Pree_Esq(30, '', ' '), 1, 30);//copy(Pree_Esq(30, qryTDGeral.FieldByName('desctipoimovel').AsString, ' '), 1, 30);
    SituacaoDaConstrucao                        := copy(Pree_Esq(1, qryTDGeral.FieldByName('codsitconstrucao').AsString, ' '), 1, 1);
    Localizacao                                 := copy(Pree_Esq(1, qryTDGeral.FieldByName('codregiao').AsString, ' '), 1, 1);
    if qryTDGeral.FieldByName('areametroquadrado').AsCurrency > 0 Then
      AreaNaoConsta                               := copy(Pree_Esq(1, '0', '0'), 1, 1)
    Else
    AreaNaoConsta                               := copy(Pree_Esq(1, '1', ' '), 1, 1);

    Area                                        := copy(Pree_Esq(17, TirarPonto(StrCurr(qryTDGeral.FieldByName('areametroquadrado').AsCurrency, 17, True)), '0'), 1, 17 );
    EnderecoDoImovel                            := copy(Pree_Esq(40, qryTDGeral.FieldByName('endereco').AsString, ' '), 1, 40);
    Numero                                      := copy(Pree_Esq(6, qryTDGeral.FieldByName('numero').AsString, ' '), 1, 6);
    Complemento                                 := copy(Pree_Esq(21, qryTDGeral.FieldByName('complemento').AsString, ' '), 1, 21);
    Bairro                                      := copy(Pree_Esq(20, qryTDGeral.FieldByName('bairro').AsString, ' '), 1, 20);
    CepDoImovel                                 := copy(Pree_Esq(8, qryTDGeral.FieldByName('cep').AsString, ' '), 1, 8);
    Municipio                                   := copy(Pree_Esq(30, RetornaMunicipio(qryTDGeral.FieldByName('cidade').AsInteger), ' '), 1, 30);
    UF                                          := copy(Pree_Esq(2, qryTDGeral.FieldByName('coduf').AsString, ' '), 1, 2);
    Inscricao_NIRF                              := copy(Pree_Esq(15, TirarTudo(qryTDGeral.FieldByName('inscricao_nirf').AsString, '.', '-', '/'), ' '), 1, 15);

    If qryTDGeral.FieldByName('BaseDeCalculoITBI').AsCurrency > 0 then
    Begin
      ValorNaoCostaNosDocumentosITBI            := copy(Pree_Esq(1, '0', ' '), 1, 1);
    End
    Else
    Begin
      ValorNaoCostaNosDocumentosITBI            := copy(Pree_Esq(1, '1', ' '), 1, 1);
    End;

    FillerTipo1                                 := StringOfChar(' ', 30);

    Memo1.Lines.Add(inttostr(idDoRegistro1) + NumeroDoControle + DataDaLavratura + Livro + Folha_Livro + Folha + Matricula + Registro +
                    Situacao + AtribuicaoDaDOI + TipoDaTransacao + DescricaoDoTipoDaTransacao + RetificacaoDoAto + DataDaAlienacao +
                    FormaDeAlienacao + ValorNaoCostaNosDocumentos + ValorDaAlienacaoEAquisicao + BaseDeCalcITBI_ITCD + TipoDoImovel + DescricaoDoTipoDoImovel +
                    SituacaoDaConstrucao + Localizacao + AreaNaoConsta + Area + EnderecoDoImovel + Numero + Complemento +
                    Bairro + CepDoImovel + Municipio + UF + Inscricao_NIRF + ValorNaoCostaNosDocumentosITBI + FillerTipo1);
    Inc(TotalDeRegistro);


//**********************//


    qryTDAlienante.Close;
    qryTDAlienante.SQL.Clear;
    qryTDAlienante.SQL.Add('SELECT td_pesso.* FROM td_pesso inner join td on (td.p_auxiliar = td_pesso.p_auxiliar)');
    qryTDAlienante.SQL.Add('inner join cad_sit on (cad_sit.codigo = td_pesso.situacao) where td.p_auxiliar = :p_auxiliar and tipoDoi = '+QuotedStr('2')+'');
    qryTDAlienante.ParambyName('p_auxiliar').AsInteger:= qryTDGeral.FieldByName('p_auxiliar').AsInteger;
    qryTDAlienante.Open;

    qryTDAlienante.First;
    While not qryTDAlienante.eof do
    Begin
      FillerAlienante                                    := Filler2;
      if qryTDAlienante.FieldByName('doc1').AsString <> '' Then
        cpf_cnpjAlienante                                := copy(Pree_Esq(14, qryTDAlienante.FieldByName('doc1').AsString, ' '), 1, 14)
      else
      cpf_cnpjAlienante                                  := '   11111111111';
      FillerAlienanteOutro                               := Filler;
      participacaoNaOperacaoAlienante                    := copy(Pree_Esq(6, StrCurr(qryTDAlienante.FieldByName('participacao').AsCurrency, 6, True), '0'), 1, 6 );
      cpf_ProcuradorDadosAlienante                       := copy(Pree_Esq(11, qryTDAlienante.FieldByName('cpf_procurador').AsString, ' '), 1, 11);

      Memo1.Lines.Add(inttostr(idDoRegistro2) + FillerAlienante + cpf_cnpjAlienante + FillerAlienanteOutro + participacaoNaOperacaoAlienante + cpf_ProcuradorDadosAlienante + Filler3);
      Inc(TotalDeRegistro);
      qryTDAlienante.Next;
    End;

  //**********************//

    qryTDAdiquirente.Close;
    qryTDAdiquirente.SQL.Clear;
    qryTDAdiquirente.SQL.Add('SELECT td_pesso.* FROM td_pesso inner join td on (td.p_auxiliar = td_pesso.p_auxiliar)');
    qryTDAdiquirente.SQL.Add('inner join cad_sit on (cad_sit.codigo = td_pesso.situacao) where td.p_auxiliar = :p_auxiliar and tipoDoi = '+QuotedStr('3')+'');
    qryTDAdiquirente.ParambyName('p_auxiliar').AsInteger:= qryTDGeral.FieldByName('p_auxiliar').AsInteger;
    qryTDAdiquirente.Open;

    qryTDAdiquirente.First;
    While not qryTDAdiquirente.Eof do
    Begin
      FillerAdiquirente                                    := Filler2;
      if qryTDAdiquirente.FieldByName('doc1').AsString <> '' Then
        cpf_cnpjAdiquirente                                  := copy(Pree_Esq(14, qryTDAdiquirente.FieldByName('doc1').AsString, ' '), 1, 14)
      else
      cpf_cnpjAdiquirente                                  := '   11111111111';
      participacaoNaOperacaoAdiquirente                    := copy(Pree_Esq(6, StrCurr(qryTDAdiquirente.FieldByName('participacao').AsCurrency, 6, True), '0'), 1, 6 );
      cpf_ProcuradorDadosAdiquirente                       := copy(Pree_Esq(11, qryTDAdiquirente.FieldByName('cpf_procurador').AsString, ' '), 1, 11);
      Memo1.Lines.Add(inttostr(idDoRegistro3) + Filler2 + cpf_cnpjAdiquirente + Filler + participacaoNaOperacaoAdiquirente + cpf_ProcuradorDadosAdiquirente + Filler3);
      Inc(TotalDeRegistro);
      qryTDAdiquirente.Next;
    End;
    qryTDGeral.Next;
   End;

   campoDeControle := inttostr((TotalDeRegistro + 1));
   Memo1.Lines.Add(inttostr(idDoRegistro9) + filler4 + StrZero(campoDeControle,6) + filler5);

end;

// Preenche à Direita
Function TF_ExportacaoDOI.Pree_Dir(qtd:Integer; texto:String; carac:Char) : String;
Begin
  Result := Copy( texto + StringOfChar(carac,qtd), 1, qtd);
End;

// Preenche à Esquerda
Function TF_ExportacaoDOI.Pree_Esq(qtd:Integer; texto:String; carac:Char) : String;
Begin
  Result := Copy(StringOfChar(carac, qtd), 1, qtd - length(texto))+texto;
End;

function TF_ExportacaoDOI.RetornaMunicipio(iCodigo: Integer): String;
begin
  if iCodigo > 0 Then
  Begin
    DM.qryGenerico.Close;
    DM.qryGenerico.SQL.Clear;
    DM.qryGenerico.SQL.Add('SELECT nome_munic FROM municipios where codigo = '+QuotedStr(inttostr(iCodigo))+' ');
    DM.qryGenerico.Open;
    result:= DM.qryGenerico.FieldByName('nome_munic').AsString;
  End
  Else
  result:= '';
end;



procedure TF_ExportacaoDOI.cbCompetenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    EdExercicio.SetFocus;

end;

procedure TF_ExportacaoDOI.EdExercicioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    cbTipoDOI.SetFocus;

end;

procedure TF_ExportacaoDOI.cbTipoDOIKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    MkNumeroControle.SetFocus;
end;

procedure TF_ExportacaoDOI.MkNumeroControleKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    CbRetificacaoDoAto.SetFocus;
end;

procedure TF_ExportacaoDOI.CbRetificacaoDoAtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    ComboBox1.SetFocus;

end;

procedure TF_ExportacaoDOI.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    EdCaminhoDiretorio.SetFocus;
end;

procedure TF_ExportacaoDOI.EdCaminhoDiretorioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    BitBtn1.SetFocus;
end;

procedure TF_ExportacaoDOI.FormCreate(Sender: TObject);
begin
  //BitBtn1.SetFocus;
end;

procedure TF_ExportacaoDOI.FormShow(Sender: TObject);
begin
  CbRetificacaoDoAto.ItemIndex:= 2;
end;

end.
