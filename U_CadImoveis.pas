unit U_CadImoveis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, Buttons, Mask, ComCtrls, ToolEdit, CurrEdit,
  DBCtrls, Grids, DBGrids, RxLookup, Db, DBTables, FuncGeral;

type
  TF_CadImoveis = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    ControlBar1: TControlBar;
    Label36: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    cbRegiao: TComboBox;
    cbTipoImovel: TComboBox;
    EdCEP: TMaskEdit;
    EdEndereco: TMaskEdit;
    EdNumero: TMaskEdit;
    EdComplemento: TMaskEdit;
    EdBairro: TMaskEdit;
    CbSituacaoConstrucao: TComboBox;
    CbFormaAlienacao: TComboBox;
    CbTipoTransacao: TComboBox;
    CbValorConstaNoAto: TComboBox;
    CbNaoConsta: TComboBox;
    EdAreaMetroQuad: TMaskEdit;
    EdNumeroMatricula: TMaskEdit;
    EdDescTipoImovel: TMaskEdit;
    EdDescTipoTrans: TMaskEdit;
    EdInscricaoNIRF: TMaskEdit;
    cbValorITBI: TComboBox;
    CbUF: TDBLookupComboBox;
    CbCidade: TDBLookupComboBox;
    EdProtocolo: TMaskEdit;
    EdValorAvaliacao: TCurrencyEdit;
    Panel3: TPanel;
    TabSheet3: TTabSheet;
    Label25: TLabel;
    EdNomeAlienante: TMaskEdit;
    cbTipoCPFAlienante: TComboBox;
    cbCPFAlienante: TMaskEdit;
    EdRG: TMaskEdit;
    Label49: TLabel;
    Label33: TLabel;
    Label28: TLabel;
    EdCPFProcurador: TMaskEdit;
    Panel4: TPanel;
    Label27: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    EdNomeAdiquirente: TMaskEdit;
    CbTipoCPFAdiquirente: TComboBox;
    CbCPFAdiquirente: TMaskEdit;
    EdRGAdiquirente: TMaskEdit;
    EdCpfProcuradorAdiquirente: TMaskEdit;
    EdValorAlienacao: TCurrencyEdit;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    DBGrid1: TDBGrid;
    Label35: TLabel;
    DBGrid2: TDBGrid;
    Label37: TLabel;
    EdParticipacao: TCurrencyEdit;
    EdParticipacaoAdiquirente: TCurrencyEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label26: TLabel;
    mkBaseCalculoITBI: TCurrencyEdit;
    DtAlienacao: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    Procedure Gravar(Sender : TOBject; Modo : Integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure LimparCampos;
    procedure Atualizar(Sender : TOBject; Clique : Boolean);
    procedure Carregar(Sender : TOBject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CbUFCloseUp(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CbUFClick(Sender: TObject);
    procedure FiltraMunicipio;
    function retornaCodigoDaCidadeSelecionada(texto: string): String;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure cbTipoCPFAlienanteChange(Sender: TObject);
    procedure CbTipoCPFAdiquirenteChange(Sender: TObject);
    procedure CarregarPartes;
    procedure EdProtocoloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbRegiaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTipoImovelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCEPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdEnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdComplementoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdBairroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbUFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbSituacaoConstrucaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbFormaAlienacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbTipoTransacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbValorConstaNoAtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdValorAlienacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdValorAvaliacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbNaoConstaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdAreaMetroQuadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNumeroMatriculaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdDescTipoImovelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdDescTipoTransKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdInscricaoNIRFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbValorITBIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNomeAlienanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTipoCPFAlienanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbCPFAlienanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdRGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCPFProcuradorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNomeAdiquirenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbTipoCPFAdiquirenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbCPFAdiquirenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdRGAdiquirenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCpfProcuradorAdiquirenteKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdProtocoloExit(Sender: TObject);
    procedure DtAlienacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure AtualizaRegistro;
    procedure AtualizaPartes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadImoveis: TF_CadImoveis;
  sCidade: String;

implementation

uses Menu, natureza, DMTD, U_PesqImoveis;

{$R *.DFM}

procedure TF_CadImoveis.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption = '&Incluir' then
  begin
    BitBtn1.Caption := '&Salvar';
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn8.Enabled := false;
    Panel2.Enabled  := True;
    Panel3.Enabled  := True;
    Panel4.Enabled  := True;
    LimparCampos;
  end
  else
  begin
    if BitBtn1.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Inclusão de Dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        dm.qryGenerico_Auxiliar3.Close;
        dm.qryGenerico_Auxiliar3.SQL.Clear;
        dm.qryGenerico_Auxiliar3.SQL.Add('select count(*) as registro from imoveis where codprotocolo = '+QuotedStr(EdProtocolo.Text)+'');
        dm.qryGenerico_Auxiliar3.Open;

        if dm.qryGenerico_Auxiliar3.FieldByName('registro').AsInteger >= 1 Then
        begin
          MessageBox(Handle, PChar('Já existe um lançamento com este protocolo!'), 'DOI', MB_OK + MB_ICONWARNING);
          Abort;
        end
        else
          Gravar(F_CadImoveis, 0);
      end
      else
      begin
        MessageBox(Handle, PChar('Os dados não foram incluídos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
        Atualizar(F_Natureza, False);
      end;
      Panel2.enabled  := false;
      Panel3.enabled  := false;
      Panel4.enabled  := false;
      BitBtn1.Caption := '&Incluir';
      BitBtn2.Enabled := true;
      BitBtn3.Enabled := true;
      BitBtn4.Enabled := true;
      BitBtn5.Enabled := true;
      BitBtn6.Enabled := true;
      BitBtn8.Enabled := true;
      BitBtn1.SetFocus;
    end;
  end;

end;

procedure TF_CadImoveis.Gravar(Sender: TOBject; Modo: Integer);
begin
  if EdProtocolo.Text = '' Then
  begin
    ShowMessage('Campo: Nº do Protocolo, deve ser preenchido!');
    Abort;
  end;
  if (Modo = 0) then
  begin
    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear;
    Dm.qryGenerico.SQL.Add('insert into imoveis(codregiao, codtipoimovel, codsitconstrucao, codformalienacao, codtipotransacao, codvalorconstaato, ');
    Dm.qryGenerico.SQL.Add('coditbinaoconsta, endereco, ');
    Dm.qryGenerico.SQL.Add('numero, complemento, bairro, cidade, coduf, cep, dataalienacao, valoralienacao, valoravaliacao, desctipoimovel, desctipotrans,');
    Dm.qryGenerico.SQL.Add('areametroquadrado, numeromatricula, codareanaoconsta, inscricao_nirf, codprotocolo, BaseDeCalculoITBI)');
    Dm.qryGenerico.SQL.Add('values(:codregiao, :codtipoimovel, :codsitconstrucao, :codformalienacao, :codtipotransacao, :codvalorconstaato, ');
    Dm.qryGenerico.SQL.Add(':coditbinaoconsta, :endereco, ');
    Dm.qryGenerico.SQL.Add(':numero, :complemento, :bairro, :cidade, :coduf, :cep, :dataalienacao, :valoralienacao, :valoravaliacao, :desctipoimovel, :desctipotrans,');
    Dm.qryGenerico.SQL.Add(':areametroquadrado, :numeromatricula, :codareanaoconsta, :inscricao_nirf, :codprotocolo, :BaseDeCalculoITBI)');
    if cbRegiao.Text <> '' Then
      Dm.qryGenerico.ParamByName('codregiao').AsString       := Copy(cbRegiao.Text,1,1)
    else
      Dm.qryGenerico.ParamByName('codregiao').AsString       := '';
    if cbTipoImovel.Text <> '' Then
      Dm.qryGenerico.ParamByName('codtipoimovel').AsString   := Copy(cbTipoImovel.Text,1,2)
    else
      Dm.qryGenerico.ParamByName('codtipoimovel').AsString   := '';
    if CbSituacaoConstrucao.Text <> '' Then
      Dm.qryGenerico.ParamByName('codsitconstrucao').AsString := Copy(CbSituacaoConstrucao.Text,1,1)
    else
      Dm.qryGenerico.ParamByName('codsitconstrucao').AsString := '';
    if CbFormaAlienacao.Text <> '' Then
      Dm.qryGenerico.ParamByName('codformalienacao').AsString := Copy(CbFormaAlienacao.Text,1,1)
    else
      Dm.qryGenerico.ParamByName('codformalienacao').AsString := '';
    if CbTipoTransacao.Text <> '' Then
      Dm.qryGenerico.ParamByName('codtipotransacao').AsString := Copy(CbTipoTransacao.Text,1,2)
    else
      Dm.qryGenerico.ParamByName('codtipotransacao').AsString := '';
    if CbValorConstaNoAto.Text <> '' Then
      Dm.qryGenerico.ParamByName('codvalorconstaato').AsString:= Copy(CbValorConstaNoAto.Text,1,1)
    else
      Dm.qryGenerico.ParamByName('codvalorconstaato').AsString:= '';
    if cbValorITBI.Text <> '' Then
      Dm.qryGenerico.ParamByName('coditbinaoconsta').AsString  := Copy(cbValorITBI.Text,1,1)
    else
      Dm.qryGenerico.ParamByName('coditbinaoconsta').AsString  := '';
    Dm.qryGenerico.ParamByName('endereco').asString           := EdEndereco.Text;
    Dm.qryGenerico.ParamByName('numero').asString             := EdNumero.Text;
    Dm.qryGenerico.ParamByName('complemento').asString        := EdComplemento.Text;
    Dm.qryGenerico.ParamByName('bairro').asString             := EdBairro.Text;
    Dm.qryGenerico.ParamByName('cidade').asString             := retornaCodigoDaCidadeSelecionada(CbCidade.Text);
    Dm.qryGenerico.ParamByName('coduf').AsString              := CbUF.Text;
    Dm.qryGenerico.ParamByName('cep').asString                := TirarTudo(EdCEP.Text, '-','.','/');
    Dm.qryGenerico.ParamByName('dataalienacao').AsString      := FormatDateTime('yyyy-mm-dd',StrToDate(DtAlienacao.Text));
    Dm.qryGenerico.ParamByName('valoralienacao').AsFloat      := EdValorAlienacao.Value;
    Dm.qryGenerico.ParamByName('valoravaliacao').AsFloat      := EdValorAvaliacao.Value;
    Dm.qryGenerico.ParamByName('desctipoimovel').AsString     := EdDescTipoImovel.Text;
    Dm.qryGenerico.ParamByName('desctipotrans').AsString      := EdDescTipoTrans.Text;
    Dm.qryGenerico.ParamByName('areametroquadrado').AsString  := EdAreaMetroQuad.Text;
    Dm.qryGenerico.ParamByName('numeromatricula').AsString    := EdNumeroMatricula.Text;
    dm.qryGenerico.ParamByName('codareanaoconsta').AsString   := Copy(CbNaoConsta.Text,1,1);
    Dm.qryGenerico.ParamByName('inscricao_nirf').AsString     := EdInscricaoNIRF.Text;
    dm.qryGenerico.ParamByName('codprotocolo').AsString       := EdProtocolo.Text;
    dm.qryGenerico.ParamByName('BaseDeCalculoITBI').AsFloat   := mkBaseCalculoITBI.Value;
    dm.qryGenerico.ParamByName('codprotocolo').AsString       := EdProtocolo.Text;
    try
      Dm.qryGenerico.ExecSQL;
    finally
      ShowMessage('Registro salvo com sucesso!');
    end;
  end
  else
  begin
    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear;
    Dm.qryGenerico.SQL.Add('update imoveis set codregiao= :codregiao, codtipoimovel=:codtipoimovel, codsitconstrucao=:codsitconstrucao, codformalienacao=:codformalienacao, ');
    Dm.qryGenerico.SQL.Add('codtipotransacao=:codtipotransacao, codvalorconstaato=:codvalorconstaato, coditbinaoconsta=:coditbinaoconsta, endereco=:endereco, numero=:numero, ');
    Dm.qryGenerico.SQL.Add('complemento=:complemento, bairro=:bairro, cidade=:cidade, coduf=:coduf, cep=:cep, dataalienacao=:dataalienacao, valoralienacao=:valoralienacao, ');
    Dm.qryGenerico.SQL.Add('valoravaliacao=:valoravaliacao, desctipoimovel=:desctipoimovel, desctipotrans=:desctipotrans, areametroquadrado=:areametroquadrado, ');
    Dm.qryGenerico.SQL.Add('numeromatricula=:numeromatricula, codareanaoconsta=:codareanaoconsta, inscricao_nirf=:inscricao_nirf, BaseDeCalculoITBI=:BaseDeCalculoITBI  ');
    Dm.qryGenerico.SQL.Add('Where codprotocolo=:codprotocolo ');
    if cbRegiao.Text <> '' Then
      Dm.qryGenerico.ParamByName('codregiao').AsString       := Copy(cbRegiao.Text,1,1)
    else
      Dm.qryGenerico.ParamByName('codregiao').AsString       := '';
    if cbTipoImovel.Text <> '' Then
      Dm.qryGenerico.ParamByName('codtipoimovel').AsString   := Copy(cbTipoImovel.Text,1,2)
    else
      Dm.qryGenerico.ParamByName('codtipoimovel').AsString   := '';
    if CbSituacaoConstrucao.Text <> '' Then
      Dm.qryGenerico.ParamByName('codsitconstrucao').AsString := Copy(CbSituacaoConstrucao.Text,1,1)
    else
      Dm.qryGenerico.ParamByName('codsitconstrucao').AsString := '';
    if CbFormaAlienacao.Text <> '' Then
      Dm.qryGenerico.ParamByName('codformalienacao').AsString := Copy(CbFormaAlienacao.Text,1,1)
    else
      Dm.qryGenerico.ParamByName('codformalienacao').AsString := '';
    if CbTipoTransacao.Text <> '' Then
      Dm.qryGenerico.ParamByName('codtipotransacao').AsString := Copy(CbTipoTransacao.Text,1,2)
    else
      Dm.qryGenerico.ParamByName('codtipotransacao').AsString := '';
    if CbValorConstaNoAto.Text <> '' Then
      Dm.qryGenerico.ParamByName('codvalorconstaato').AsString:= Copy(CbValorConstaNoAto.Text,1,1)
    else
      Dm.qryGenerico.ParamByName('codvalorconstaato').AsString:= '';
    if cbValorITBI.Text <> '' Then
      Dm.qryGenerico.ParamByName('coditbinaoconsta').AsString  := Copy(cbValorITBI.Text,1,1)
    else
      Dm.qryGenerico.ParamByName('coditbinaoconsta').AsString  := '';
    Dm.qryGenerico.ParamByName('endereco').asString           := EdEndereco.Text;
    Dm.qryGenerico.ParamByName('numero').asString             := EdNumero.Text;
    Dm.qryGenerico.ParamByName('complemento').asString        := EdComplemento.Text;
    Dm.qryGenerico.ParamByName('bairro').asString             := EdBairro.Text;
    Dm.qryGenerico.ParamByName('cidade').asString             := retornaCodigoDaCidadeSelecionada(CbCidade.Text);
    Dm.qryGenerico.ParamByName('coduf').AsString              := CbUF.Text;
    Dm.qryGenerico.ParamByName('cep').asString                := TirarTudo(EdCEP.Text, '-','.','/');
    Dm.qryGenerico.ParamByName('dataalienacao').AsString      := FormatDateTime('yyyy-mm-dd',StrToDate(DtAlienacao.Text));
    Dm.qryGenerico.ParamByName('valoralienacao').AsFloat      := EdValorAlienacao.Value;
    Dm.qryGenerico.ParamByName('valoravaliacao').AsFloat      := EdValorAvaliacao.Value;
    Dm.qryGenerico.ParamByName('desctipoimovel').AsString     := EdDescTipoImovel.Text;
    Dm.qryGenerico.ParamByName('desctipotrans').AsString      := EdDescTipoTrans.Text;
    Dm.qryGenerico.ParamByName('areametroquadrado').AsString  := EdAreaMetroQuad.Text;
    Dm.qryGenerico.ParamByName('numeromatricula').AsString    := EdNumeroMatricula.Text;
    dm.qryGenerico.ParamByName('codareanaoconsta').AsString   := Copy(CbNaoConsta.Text,1,1);
    Dm.qryGenerico.ParamByName('inscricao_nirf').AsString     := EdInscricaoNIRF.Text;
    dm.qryGenerico.ParamByName('codprotocolo').AsString       := EdProtocolo.Text;
    dm.qryGenerico.ParamByName('BaseDeCalculoITBI').AsFloat   := mkBaseCalculoITBI.Value;
    dm.qryGenerico.ParamByName('codprotocolo').AsString       := EdProtocolo.Text;
    try
      Dm.qryGenerico.ExecSQL;
    finally
      ShowMessage('Registro atualizado com sucesso!');
    end;
  end;
end;

procedure TF_CadImoveis.BitBtn2Click(Sender: TObject);
begin
  if not(Dm.qryCadImoveis.IsEmpty) then
  begin
    if messagedlg('Confirma Exclusão ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Dm.qryCadImoveis.delete;
    end;
  end;
end;

procedure TF_CadImoveis.LimparCampos;
begin
  cbRegiao.Text:= '';
  cbTipoImovel.Text:= '';
  CbSituacaoConstrucao.Text:= '';
  CbFormaAlienacao.Text:= '';
  CbTipoTransacao.Text:= '';
  CbValorConstaNoAto.Text:= '';
  EdEndereco.Text:= ''; ;
  EdNumero.Text:= ''; ;
  EdComplemento.Text:= ''; ;
  EdBairro.Text:= ''; ;
  CbCidade.KeyValue:= '';
  CbUF.KeyValue:= '';
  EdCEP.Text:= ''; ;
  //DtAlienacao.Date:= now;
  EdValorAlienacao.Value:= 0.00;
  EdValorAvaliacao.Value:= 0.00;
  EdDescTipoImovel.Text:= '';
  EdDescTipoTrans.Text:= '';
  EdInscricaoNIRF.Text:= '';
  EdAreaMetroQuad.Text:= '';
  EdNumeroMatricula.Text:= ''; 
end;

procedure TF_CadImoveis.Atualizar(Sender: TOBject; Clique: Boolean);
begin
  Dm.qryCadImoveis.Close;
  Dm.qryCadImoveis.Sql.Clear;
  Dm.qryCadImoveis.Sql.Add('SELECT * FROM imoveis');
  Dm.qryCadImoveis.Sql.Add('ORDER BY codigo');
  Dm.qryCadImoveis.Open;

  If Dm.sNumeroProcoloDOI <> '' Then
  Begin
    Dm.qryCadImoveis.Close;
    Dm.qryCadImoveis.SQL.Clear;
    Dm.qryCadImoveis.SQL.Add('SELECT * FROM imoveis WHERE codprotocolo = '+QuotedStr(Dm.sNumeroProcoloDOI)+'');
    Dm.qryCadImoveis.Open;
  End;

  Carregar(F_CadImoveis);
  CarregarPartes;
end;

procedure TF_CadImoveis.Carregar(Sender : TOBject);
begin
  Case (dm.qryCadImoveis.FieldByName('codregiao').AsInteger) Of
    1  : cbRegiao.Text := '1-Urbana';
    3  : cbRegiao.Text := '3-Rural';
  End;

  Case (dm.qryCadImoveis.FieldByName('codtipoimovel').AsInteger) Of
    67  : cbTipoImovel.Text := '67-Casa';
    65  : cbTipoImovel.Text := '65-Apto';
    15  : cbTipoImovel.Text := '15-Loja';
    17  : cbTipoImovel.Text := '17-Sala/Conjunto';
    71  : cbTipoImovel.Text := '71-Terreno/fração';
    31  : cbTipoImovel.Text := '31-Galpão';
    33  : cbTipoImovel.Text := '33-Prédio Comercial';
    35  : cbTipoImovel.Text := '35-Prédio Residencial';
    69  : cbTipoImovel.Text := '69-Fazenda/Sítio/Chácara';
    89  : cbTipoImovel.Text := '89-Outros';
  End;

  Case (dm.qryCadImoveis.FieldByName('codsitconstrucao').AsInteger) Of
    0  : CbSituacaoConstrucao.Text := '0-Construção Averbada';
    1  : CbSituacaoConstrucao.Text := '1-Em Construção';
    2  : CbSituacaoConstrucao.Text := '2-Não se Aplica';
  End;

  Case (dm.qryCadImoveis.FieldByName('codformalienacao').AsInteger) Of
    5  : CbFormaAlienacao.Text := '5-À vista';
    7  : CbFormaAlienacao.Text := '7-A prazo';
    9  : CbFormaAlienacao.Text := '9-Não se Aplica';
  End;

  Case (dm.qryCadImoveis.FieldByName('codtipotransacao').AsInteger) Of
    15  : CbTipoTransacao.Text := '15-Adjudicação';
    41  : CbTipoTransacao.Text := '41-Arrematação em Hasta Pública';
    37  : CbTipoTransacao.Text := '37-Cessão de Direitos';
    11  : CbTipoTransacao.Text := '11-Compra e Venda';
    19  : CbTipoTransacao.Text := '19-Dação em Pagamento';
    25  : CbTipoTransacao.Text := '25-Desapropriação';
    43  : CbTipoTransacao.Text := '43-Dissolução de Sociedade';
    21  : CbTipoTransacao.Text := '21-Distrato de Negócio';
    53  : CbTipoTransacao.Text := '53-Doação';
    55  : CbTipoTransacao.Text := '55-Doação em adiantamento da legítima';
    27  : CbTipoTransacao.Text := '27-Herança, Legado ou Meação (adjudicação)';
    45  : CbTipoTransacao.Text := '45-Incorporação e loteamento';
    47  : CbTipoTransacao.Text := '47-Integralização/Subscrição de capital';
    49  : CbTipoTransacao.Text := '49-Partilha amigável ou litigiosa';
    13  : CbTipoTransacao.Text := '13-Permuta';
    31  : CbTipoTransacao.Text := '31-Procuração em Causa Própria';
    33  : CbTipoTransacao.Text := '33-Promessa de Compra e Venda';
    51  : CbTipoTransacao.Text := '51-Retorno de Capital próprio';
    39  : CbTipoTransacao.Text := '39-Outros';
  End;

  Case (dm.qryCadImoveis.FieldByName('codvalorconstaato').AsInteger) Of
    0  : CbValorConstaNoAto.Text := '0-Sim';
    1  : CbValorConstaNoAto.Text := '1-Não';
  End;

  Case (dm.qryCadImoveis.FieldByName('codareanaoconsta').AsInteger) Of
    0  : CbNaoConsta.Text := '0-Área está sendo informada';
    1  : CbNaoConsta.Text := '1-Área não consta nos documentos';
  End;

  Case (dm.qryCadImoveis.FieldByName('coditbinaoconsta').AsInteger) Of
    0  : cbValorITBI.Text := '0-Área está sendo informada';
    1  : cbValorITBI.Text := '1-Área não consta nos documentos';
  End;

  EdProtocolo.Text        := dm.qryCadImoveis.FieldByName('codprotocolo').AsString;

  EdCEP.EditMask          := '';
  EdCEP.Text              := dm.qryCadImoveis.FieldByName('cep').AsString;
  EdCEP.EditMask          := '99.999-999';
  EdEndereco.Text         := dm.qryCadImoveis.FieldByName('endereco').AsString;
  EdNumero.Text           := dm.qryCadImoveis.FieldByName('numero').AsString;
  EdComplemento.Text      := dm.qryCadImoveis.FieldByName('complemento').AsString;
  EdBairro.Text           := dm.qryCadImoveis.FieldByName('bairro').AsString;
  DtAlienacao.Text        := dm.qryCadImoveis.FieldByName('dataalienacao').AsString;
  EdValorAlienacao.Value  := dm.qryCadImoveis.FieldByName('valoralienacao').AsCurrency;
  EdValorAvaliacao.Value  := dm.qryCadImoveis.FieldByName('valoravaliacao').AsCurrency;
  EdAreaMetroQuad.Text    := dm.qryCadImoveis.FieldByName('areametroquadrado').AsString;
  EdNumeroMatricula.Text  := dm.qryCadImoveis.FieldByName('numeromatricula').AsString;
  EdDescTipoImovel.Text   := dm.qryCadImoveis.FieldByName('desctipoimovel').AsString;
  EdDescTipoTrans.Text    := dm.qryCadImoveis.FieldByName('desctipotrans').AsString;
  EdInscricaoNIRF.Text    := dm.qryCadImoveis.FieldByName('inscricao_nirf').AsString;
  mkBaseCalculoITBI.Value := dm.qryCadImoveis.FieldByName('BaseDeCalculoITBI').AsCurrency;

  dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('SELECT nome_munic FROM municipios WHERE codigo = '+QuotedStr(dm.qryCadImoveis.FieldByName('cidade').AsString)+'');
  dm.qryGenerico.Open;

  CbCidade.KeyValue       := dm.qryGenerico.FieldByName('nome_munic').AsString;
  CbUF.KeyValue           := dm.qryCadImoveis.FieldByName('coduf').AsString;

  FiltraMunicipio;
end;

procedure TF_CadImoveis.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CadImoveis.FormActivate(Sender: TObject);
begin
  Atualizar(F_CadImoveis, False);
  BitBtn1.SetFocus;
end;

procedure TF_CadImoveis.BitBtn3Click(Sender: TObject);
begin
  if BitBtn3.Caption = '&Correção' then
  begin
    BitBtn3.Caption := '&Salvar';
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := false;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn8.Enabled := false;
    Panel2.enabled  := true;
    Panel3.Enabled  := true;
    Panel4.Enabled  := true;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Correção dos Dados ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_CadImoveis, 1);
        AtualizaPartes;
        CarregarPartes;
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
        Atualizar(F_CadImoveis, False);
      end;
      Panel2.enabled  := False;
      Panel3.enabled  := false;
      Panel4.enabled  := false;
      BitBtn3.Caption := '&Correção';
      BitBtn1.Enabled := True;
      BitBtn2.Enabled := True;
      BitBtn4.Enabled := True;
      BitBtn5.Enabled := True;
      BitBtn6.Enabled := True;
      BitBtn8.Enabled := True;
      BitBtn3.SetFocus;
    end;
  end;

end;

procedure TF_CadImoveis.BitBtn5Click(Sender: TObject);
begin
  Dm.qryCadImoveis.Next;
  Carregar(F_CadImoveis);
end;

procedure TF_CadImoveis.BitBtn6Click(Sender: TObject);
begin
  Dm.qryCadImoveis.Prior;
  Carregar(F_CadImoveis);
end;

procedure TF_CadImoveis.FormShow(Sender: TObject);
begin
  DM.qryUF.Close;
  DM.qryUF.SQL.Clear;
  DM.qryUF.SQL.Add('SELECT * FROM uf');
  DM.qryUF.Open;

  DM.qryMunicipio.Close;
  DM.qryMunicipio.SQL.Clear;
  DM.qryMunicipio.SQL.Add('SELECT * FROM municipios order by nome_munic');
  DM.qryMunicipio.Open;
  PageControl1.ActivePage:= TabSheet1;

  CarregarPartes;
end;

procedure TF_CadImoveis.CbUFCloseUp(Sender: TObject);
begin
  FiltraMunicipio;
end;

procedure TF_CadImoveis.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PesqImoveis, F_PesqImoveis);
  F_PesqImoveis.ShowModal;
  F_PesqImoveis.Destroy;
  F_PesqImoveis := Nil;
end;

procedure TF_CadImoveis.CbUFClick(Sender: TObject);
begin
  FiltraMunicipio;
end;

procedure TF_CadImoveis.FiltraMunicipio;
begin
  if CbUF.Text <> '' Then
  Begin
    DM.qryMunicipio.Close;
    DM.qryMunicipio.SQL.Clear;
    DM.qryMunicipio.SQL.Add('SELECT * FROM municipios where uf = '+QuotedStr(CbUF.Text)+' order by nome_munic');
    DM.qryMunicipio.Open;
    sCidade:= DM.qryMunicipio.FieldByName('codigo').AsString;
  End;
end;

function TF_CadImoveis.retornaCodigoDaCidadeSelecionada(
  texto: string): String;
begin
  result:= '';
  DM.qryGenerico_Aux.Close;
  DM.qryGenerico_Aux.SQL.Clear;
  DM.qryGenerico_Aux.SQL.Add('SELECT * FROM municipios where nome_munic = '+QuotedStr(CbCidade.Text)+' order by nome_munic');
  DM.qryGenerico_Aux.Open;
  result:= DM.qryGenerico_Aux.FieldByName('codigo').AsString;
end;

procedure TF_CadImoveis.DBGrid1DblClick(Sender: TObject);
begin
  EdNomeAlienante.Text    := DM.qryPartesExameTituloAlienante.FieldByName('nome').AsString;
  cbTipoCPFAlienante.Text := DM.qryPartesExameTituloAlienante.FieldByName('tip_doc1').AsString;
  cbCPFAlienante.Text     := DM.qryPartesExameTituloAlienante.FieldByName('doc1').AsString;

  if cbTipoCPFAlienante.Text = 'CPF' Then
  begin
    cbCPFAlienante.EditMask := '';
    cbCPFAlienante.Text     := TirarTudo(DM.qryPartesExameTituloAlienante.FieldByName('doc1').AsString, '-','.','/');
    cbCPFAlienante.EditMask := '999.999.999-99';
  end
  else
  if cbTipoCPFAlienante.Text = 'CNPJ' Then
  begin
    cbCPFAlienante.EditMask := '';
    cbCPFAlienante.Text     := TirarTudo(DM.qryPartesExameTituloAlienante.FieldByName('doc1').AsString, '-','.','/');
    cbCPFAlienante.EditMask := '99.999.999/9999-99';
  end;

  ComboBox2.Text          := DM.qryPartesExameTituloAlienante.FieldByName('tip_doc2').AsString;
  EdRG.Text               := DM.qryPartesExameTituloAlienante.FieldByName('doc2').AsString;
  EdParticipacao.Value    := DM.qryPartesExameTituloAlienante.FieldByName('participacao').AsFloat;

  EdCPFProcurador.EditMask := '';
  EdCPFProcurador.Text    := DM.qryPartesExameTituloAlienante.FieldByName('cpf_procurador').AsString;
  EdCPFProcurador.EditMask := '999.999.999-99';

end;

procedure TF_CadImoveis.DBGrid2DblClick(Sender: TObject);
begin
  EdNomeAdiquirente.Text      := DM.qryPartesExameTitulo.FieldByName('nome').AsString;
  CbTipoCPFAdiquirente.Text   := DM.qryPartesExameTitulo.FieldByName('tip_doc1').AsString;
  CbCPFAdiquirente.Text       := DM.qryPartesExameTitulo.FieldByName('doc1').AsString;

  if CbTipoCPFAdiquirente.Text = 'CPF' Then
  begin
    CbCPFAdiquirente.EditMask := '';
    CbCPFAdiquirente.Text     := TirarTudo(DM.qryPartesExameTitulo.FieldByName('doc1').AsString, '-','.','/');
    CbCPFAdiquirente.EditMask := '999.999.999-99';
  end
  else
  if CbTipoCPFAdiquirente.Text = 'CNPJ' Then // CNPJ
  begin
    CbCPFAdiquirente.EditMask := '';
    CbCPFAdiquirente.Text     := TirarTudo(DM.qryPartesExameTitulo.FieldByName('doc1').AsString, '-','.','/');
    CbCPFAdiquirente.EditMask := '99.999.999/9999-99';
  end;

  ComboBox1.Text              := DM.qryPartesExameTitulo.FieldByName('tip_doc2').AsString;
  EdRGAdiquirente.Text        := DM.qryPartesExameTitulo.FieldByName('doc2').AsString;
  EdParticipacaoAdiquirente.Value        := DM.qryPartesExameTitulo.FieldByName('participacao').AsFloat;

  EdCpfProcuradorAdiquirente.EditMask    := '';
  EdCpfProcuradorAdiquirente.Text        := DM.qryPartesExameTitulo.FieldByName('cpf_procurador').AsString;
  EdCpfProcuradorAdiquirente.EditMask    := '999.999.999-99';

end;

procedure TF_CadImoveis.AtualizaPartes;
begin
  DM.qryGenerico.Close;  // Alienante
  DM.qryGenerico.SQL.Clear;
  DM.qryGenerico.SQL.Add('UPDATE td_pesso SET participacao = :participacao, cpf_procurador = :cpf_procurador where p_auxiliar = :p_auxiliar and recno = :recno ');
  DM.qryGenerico.ParamByName('participacao').AsFloat:= EdParticipacao.Value;
  DM.qryGenerico.ParamByName('cpf_procurador').AsString:= TirarTudo(EdCPFProcurador.Text, '-','.','/');
  DM.qryGenerico.ParamByName('p_auxiliar').AsString:= DM.qryPartesExameTituloAlienante.FieldByName('p_auxiliar').AsString;
  DM.qryGenerico.ParamByName('recno').AsString:= DM.qryPartesExameTituloAlienante.FieldByName('recno').AsString;
  DM.qryGenerico.ExecSQL;

  DM.qryGenerico.Close;  // Adquirente
  DM.qryGenerico.SQL.Clear;
  DM.qryGenerico.SQL.Add('UPDATE td_pesso SET participacao = :participacao, cpf_procurador = :cpf_procurador where p_auxiliar = :p_auxiliar and recno = :recno ');
  DM.qryGenerico.ParamByName('participacao').AsFloat:= EdParticipacaoAdiquirente.Value;
  DM.qryGenerico.ParamByName('cpf_procurador').AsString:= TirarTudo(EdCpfProcuradorAdiquirente.Text, '-','.','/');
  DM.qryGenerico.ParamByName('p_auxiliar').AsString:= DM.qryPartesExameTitulo.FieldByName('p_auxiliar').AsString;
  DM.qryGenerico.ParamByName('recno').AsString:= DM.qryPartesExameTitulo.FieldByName('recno').AsString;
  DM.qryGenerico.ExecSQL;
end;

procedure TF_CadImoveis.BitBtn7Click(Sender: TObject);
begin
  AtualizaPartes;
  CarregarPartes;
  Application.MessageBox('Registro atualizado com sucesso !' , 'Mensagem do Sistema', mb_ok);  
  {
  EdNomeAlienante.Text    := '';
  cbTipoCPFAlienante.Text := '';
  cbCPFAlienante.Text     := '';
  cbTipoCPFAlienante.Text := '';
  ComboBox2.Text          := '';
  EdRG.Text               := '';
  EdParticipacao.Value    := 0.00;
  EdCPFProcurador.Text    := '';  }
end;

procedure TF_CadImoveis.BitBtn9Click(Sender: TObject);
begin
  {DM.qryGenerico.Close;
  DM.qryGenerico.SQL.Clear;
  DM.qryGenerico.SQL.Add('UPDATE td_pesso SET participacao = :participacao, cpf_procurador = :cpf_procurador where p_auxiliar = :p_auxiliar and recno = :recno ');
  DM.qryGenerico.ParamByName('participacao').AsFloat:= EdParticipacaoAdiquirente.Value;
  DM.qryGenerico.ParamByName('cpf_procurador').AsString:= TirarTudo(EdCpfProcuradorAdiquirente.Text, '-','.','/');
  DM.qryGenerico.ParamByName('p_auxiliar').AsString:= DM.qryPartesExameTitulo.FieldByName('p_auxiliar').AsString;
  DM.qryGenerico.ParamByName('recno').AsString:= DM.qryPartesExameTitulo.FieldByName('recno').AsString;
  DM.qryGenerico.ExecSQL;}
  AtualizaPartes;
  CarregarPartes;
  Application.MessageBox('Registro atualizado com sucesso !' , 'Mensagem do Sistema', mb_ok);
  {EdNomeAdiquirente.Text          := '';
  CbTipoCPFAdiquirente.Text       := '';
  cbCPFAlienante.Text             := '';
  ComboBox1.Text                  := '';
  EdRGAdiquirente.Text            := '';
  EdCpfProcuradorAdiquirente.Text := '';
  EdParticipacaoAdiquirente.Value := 0.00;}
end;

procedure TF_CadImoveis.cbTipoCPFAlienanteChange(Sender: TObject);
begin
  If (cbTipoCPFAlienante.ItemIndex = 0) then //CPF
  begin
    cbCPFAlienante.EditMask := '';
    cbCPFAlienante.Text     := TirarTudo(cbCPFAlienante.Text, '-','.','/');
    cbCPFAlienante.EditMask := '999.999.999-99';
  end
  else
  if (cbTipoCPFAlienante.ItemIndex = 1) then //CNPJ
  begin
    cbCPFAlienante.EditMask := '';
    cbCPFAlienante.Text     := TirarTudo(cbCPFAlienante.Text, '-','.','/');
    cbCPFAlienante.EditMask := '99.999.999/9999-99';
  end
end;

procedure TF_CadImoveis.CbTipoCPFAdiquirenteChange(Sender: TObject);
begin
  If (CbTipoCPFAdiquirente.ItemIndex = 0) then //CPF
  begin
    CbCPFAdiquirente.EditMask := '';
    CbCPFAdiquirente.Text     := TirarTudo(CbCPFAdiquirente.Text, '-','.','/');
    CbCPFAdiquirente.EditMask := '999.999.999-99';
  end
  else
  if (CbTipoCPFAdiquirente.ItemIndex = 1) then //CNPJ
  begin
    CbCPFAdiquirente.EditMask := '';
    CbCPFAdiquirente.Text     := TirarTudo(CbCPFAdiquirente.Text, '-','.','/');
    CbCPFAdiquirente.EditMask := '99.999.999/9999-99';
  end
end;

procedure TF_CadImoveis.CarregarPartes;
begin
  DM.qryExameTitulo.Close;
  DM.qryExameTitulo.SQL.Clear;
  DM.qryExameTitulo.SQL.Add('SELECT p_auxiliar FROM td where p_auxiliar = '+QuotedStr(Dm.sNumeroProcoloDOI)+'');
  DM.qryExameTitulo.Open;

  if DM.qryExameTitulo.recordCount = 0 Then
  Begin
    ShowMessage('Protocolo não informado na tela de exame!');
    Abort;
  End
  Else
  Begin
    //**Carrega os dados do alienante**//
    DM.qryPartesExameTituloAlienante.Close;
    DM.qryPartesExameTituloAlienante.SQL.Clear;
    DM.qryPartesExameTituloAlienante.SQL.Add(' SELECT td_pesso.* FROM td_pesso inner join td on (td.p_auxiliar = td_pesso.p_auxiliar) '+
                                    ' inner join cad_sit on (cad_sit.codigo = td_pesso.situacao) '+
                                    ' where tipoDoi = '+QuotedStr('2')+' and td.p_auxiliar = :p_auxiliar order by td_pesso.nome ');
    DM.qryPartesExameTituloAlienante.ParamByName('p_auxiliar').AsString:= Dm.sNumeroProcoloDOI;
    DM.qryPartesExameTituloAlienante.Open;

    //**Carrega os dados do adiquirente**//
    DM.qryPartesExameTitulo.Close;
    DM.qryPartesExameTitulo.SQL.Clear;
    DM.qryPartesExameTitulo.SQL.Add(' SELECT td_pesso.* FROM td_pesso inner join td on (td.p_auxiliar = td_pesso.p_auxiliar) '+
                                    ' inner join cad_sit on (cad_sit.codigo = td_pesso.situacao) '+
                                    ' where tipoDoi = '+QuotedStr('3')+' and td.p_auxiliar = :p_auxiliar order by td_pesso.nome ');
    DM.qryPartesExameTitulo.ParamByName('p_auxiliar').AsString:= Dm.sNumeroProcoloDOI;
    DM.qryPartesExameTitulo.Open;
  End;
  DM.qryPartesExameTituloAlienante.FieldByName('participacao').AsFloat;
end;

procedure TF_CadImoveis.EdProtocoloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    cbRegiao.SetFocus;
end;

procedure TF_CadImoveis.cbRegiaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    cbTipoImovel.SetFocus;
end;

procedure TF_CadImoveis.cbTipoImovelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    EdCEP.SetFocus;
end;

procedure TF_CadImoveis.EdCEPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    EdEndereco.SetFocus;
end;

procedure TF_CadImoveis.EdEnderecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    EdNumero.SetFocus;
end;

procedure TF_CadImoveis.EdNumeroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    EdComplemento.SetFocus;
end;

procedure TF_CadImoveis.EdComplementoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    EdBairro.SetFocus;
end;

procedure TF_CadImoveis.EdBairroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    CbUF.SetFocus;
end;

procedure TF_CadImoveis.CbUFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    CbCidade.SetFocus;
end;

procedure TF_CadImoveis.CbCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    CbSituacaoConstrucao.SetFocus;
end;

procedure TF_CadImoveis.CbSituacaoConstrucaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    CbFormaAlienacao.SetFocus;
end;

procedure TF_CadImoveis.CbFormaAlienacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    CbTipoTransacao.SetFocus;
end;

procedure TF_CadImoveis.CbTipoTransacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    CbValorConstaNoAto.SetFocus;
end;

procedure TF_CadImoveis.CbValorConstaNoAtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    DtAlienacao.SetFocus;
end;

procedure TF_CadImoveis.EdValorAlienacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    EdValorAvaliacao.SetFocus;
end;

procedure TF_CadImoveis.EdValorAvaliacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    cbNaoConsta.SetFocus;
end;

procedure TF_CadImoveis.CbNaoConstaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    EdAreaMetroQuad.SetFocus;
end;

procedure TF_CadImoveis.EdAreaMetroQuadKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    EdNumeroMatricula.SetFocus;
end;

procedure TF_CadImoveis.EdNumeroMatriculaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    EdDescTipoImovel.SetFocus;
end;

procedure TF_CadImoveis.EdDescTipoImovelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    EdDescTipoTrans.SetFocus;
end;

procedure TF_CadImoveis.EdDescTipoTransKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    EdInscricaoNIRF.SetFocus;
end;

procedure TF_CadImoveis.EdInscricaoNIRFKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    cbValorITBI.SetFocus;
end;

procedure TF_CadImoveis.cbValorITBIKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    mkBaseCalculoITBI.SetFocus;
end;

procedure TF_CadImoveis.EdNomeAlienanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    cbTipoCPFAlienante.SetFocus;
end;

procedure TF_CadImoveis.cbTipoCPFAlienanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    cbCPFAlienante.SetFocus;
end;

procedure TF_CadImoveis.cbCPFAlienanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    ComboBox2.SetFocus;
end;

procedure TF_CadImoveis.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    EdRg.SetFocus;
end;

procedure TF_CadImoveis.EdRGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    EdCPFProcurador.SetFocus;
end;

procedure TF_CadImoveis.EdCPFProcuradorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    EdParticipacao.SetFocus;
end;

procedure TF_CadImoveis.EdNomeAdiquirenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    CbTipoCPFAdiquirente.SetFocus;
end;

procedure TF_CadImoveis.CbTipoCPFAdiquirenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    CbCPFAdiquirente.SetFocus;
end;

procedure TF_CadImoveis.CbCPFAdiquirenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    ComboBox1.SetFocus;
end;

procedure TF_CadImoveis.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    EdRGAdiquirente.SetFocus;
end;

procedure TF_CadImoveis.EdRGAdiquirenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    EdCpfProcuradorAdiquirente.SetFocus;
end;

procedure TF_CadImoveis.EdCpfProcuradorAdiquirenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    EdParticipacaoAdiquirente.SetFocus;
end;

procedure TF_CadImoveis.AtualizaRegistro;
begin
  DM.qryExameTitulo.Close;
  DM.qryExameTitulo.SQL.Clear;
  DM.qryExameTitulo.SQL.Add('SELECT p_auxiliar FROM td where p_auxiliar = '+QuotedStr(EdProtocolo.Text)+'');
  DM.qryExameTitulo.Open;

  if DM.qryExameTitulo.recordCount = 0 Then
  Begin
    ShowMessage('Protocolo não informado na tela de exame!');
    Abort;
  End
  Else
  Begin
    //**Carrega os dados do alienante**//
    DM.qryPartesExameTituloAlienante.Close;
    DM.qryPartesExameTituloAlienante.SQL.Clear;
    DM.qryPartesExameTituloAlienante.SQL.Add(' SELECT td_pesso.* FROM td_pesso inner join td on (td.p_auxiliar = td_pesso.p_auxiliar) '+
                                    ' inner join cad_sit on (cad_sit.codigo = td_pesso.situacao) '+
                                    ' where tipoDoi > 0 and tipoDoi = '+QuotedStr('2')+' and td.p_auxiliar = :p_auxiliar order by td_pesso.nome ');
    DM.qryPartesExameTituloAlienante.ParamByName('p_auxiliar').AsString:= EdProtocolo.Text;
    DM.qryPartesExameTituloAlienante.Open;


    //**Carrega os dados do adiquirente**//

    DM.qryPartesExameTitulo.Close;
    DM.qryPartesExameTitulo.SQL.Clear;
    DM.qryPartesExameTitulo.SQL.Add(' SELECT td_pesso.* FROM td_pesso inner join td on (td.p_auxiliar = td_pesso.p_auxiliar) '+
                                    ' inner join cad_sit on (cad_sit.codigo = td_pesso.situacao) '+
                                    ' where tipoDoi > 0 and tipoDoi = '+QuotedStr('3')+' and td.p_auxiliar = :p_auxiliar order by td_pesso.nome ');
    DM.qryPartesExameTitulo.ParamByName('p_auxiliar').AsString:= EdProtocolo.Text;
    DM.qryPartesExameTitulo.Open;
  End;
  DM.qryPartesExameTituloAlienante.FieldByName('participacao').AsFloat;

end;

procedure TF_CadImoveis.EdProtocoloExit(Sender: TObject);
begin
  CarregarPartes;
end;

procedure TF_CadImoveis.DtAlienacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    EdValorAlienacao.SetFocus;
end;

end.
