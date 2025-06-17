unit U_Daje;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ToolEdit, CurrEdit, StdCtrls, Mask, Buttons, ExtCtrls,
  RDprint, Menus, jpeg, WrapperIntegracao, sisDajSeloWS_TLB, unMath, DbTables,
  RpRender, RpRenderPDF, RpBase, RpSystem, RpDefine, ComCtrls, FileCtrl, StrUtils, ShellAPI, RpRave;

Function GerarDaje(_Contribuinte, _DataEmissao, _HoraEmissao, _DataVencimento, _Endereco, _Observacao, _CpfCnpj, _CodigoTipoAto, _Isento, _SerieDajePrincipal, _NumeroDajePrincipal : String;
                    _ValorDaje, _ValorAto, _ValorDeclarado : Double;_CodigoCartorio, _CodigoEmissor, _QtdeAtos : Integer; _DajeComplementar : Boolean; _CodigoAtoAdicional, _QtdeAtoAdicional: String) : Boolean;

{Function GerarDaje_Compl(_Contribuinte, _DataEmissao, _HoraEmissao, _DataVencimento, _Endereco, _Observacao, _CpfCnpj, _CodigoTipoAto,
                    _SerieDajePrincipal, _NumeroDajePrincipal : String;
                    _ValorDaje, _ValorAto : Double; _CodigoCartorio, _CodigoEmissor, _QtdeAtos : Integer; _Isento : boolean) : Boolean;}

function GerarDaje_Compl(_CodigoTipoAto, _SerieDajePrincipal, _NumeroDajePrincipal : string; _QtdeAtos, _CodigoCartorio, _CodigoEmissor, v_atoVinculado : integer; v_valor_declarado : Currency ) : boolean;                    

Procedure ImprimirDaje(_EmolImp : Currency; _DataVencimentoDaje, _ContribuinteDaje, _DataEmissaoDaje, _EnderecoContribuinteDaje, _CidadeContribuinteDaje,
                       _DenominacaoUnidadeDaje, _Delegatario, _Substituto, _CodigoAtoDaje, _QtdeDaje, _TipoNaturezaDaje, _CpfCnpjContribuinteDaje, _ObsDaje, sTexto : String);

Function ConsultarDaje(_CodigoEmissor, _Serie, _NumeroSequencial, _CodigoCartorio : String) : Boolean;

Function ConsultarDaje_Compl(_CodigoTipoAto, _SerieDajePrincipal, _NumeroDajePrincipal : string; _QtdeAtos, _CodigoCartorio, _CodigoEmissor, v_atoVinculado : integer; v_valor_declarado : Currency) : boolean;

Function PagarDajeManual(_CodigoEmissor, _Serie, _NumeroSequencial, _CodigoCartorio : String) : Boolean;

Function PagarDajeManualProducao(_CodigoEmissor, _Serie, _NumeroSequencial, _CodigoCartorio : String) : Boolean;

Function MotivoIsencao(_CodigoEmissor : String) : String; //Colocar parametros depois como conseguir

Function SeloComDaje(_CodigoEmissor, _Funcionario, _MotivoIsencao, _DescricaoMotivo, _Dajes, _NumeroSeloFisico, _NumeroCertidao, _NumeroProtocolo, _folha, _livro, _NomeParte, _CodigoCartorio : String) : String;

Function AnexarTeorAto(_CodigoEmissor, _NumeroSelo, _Conteudo : String) : Boolean;

Function MotivoCancelamento(_CodigoEmissor : String) : String; //Colocar parametros depois como conseguir

Function CancelarSelo(_CodigoEmissor, _NumeroSelo, _MotivoCanc : String) : Boolean;

Function InformarEstoqueInicialSelos(_CodigoEmissor : String) : Boolean; //Colocar parametros depois como conseguir

Function TestarConexaoTJ(_CodigoEmissor : String) : Boolean;

Function VerStatusDajeSistema(_Serie, _NumeroSelo : String) : String;

function VerificarDajeJustificado(_CodigoEmissor, _SerieDaje, _NumeroDaje: integer): integer;

Function DesbloquearDaje(_CodigoEmissor, _Serie, _NumeroSequencial : String) : Boolean;

function CodJustificativas : string;

function JustificarDaje(_CodigoEmissor, _SerieDaje, _NumeroDaje, _QtdeDaje : integer) : boolean;

var
  _SerieDaje, _NumeroDaje, _CodigoEmissorDaje, _CodigoDestinoDaje, _QtdeDaje, _SerieDajPrincipalDaje, _NumeroDajPrincipalDaje : Integer;
  _ContribuinteDaje, CidadeContribuinteDaje, _DataEmissaoDaje, _DataVencimentoDaje, _DenominacaoUnidadeDaje, _CodigoAtoDaje, _Delegatario, _Substituto : String;
  _ObservacaoDaje, _CpfCnpjContribuinteDaje, _EnderecoContribuinteDaje, _CidadeContribuinteDaje, _TipoNaturezaDaje, _NewNumeroDajePrincipal : String;
  _ValorDaje, _ValorAtoPraticadoDaje, _ValorDaje2, _ValorDajeCompl : Double;
  LinhaDig, _CodBarra_WS, CodBarra, img_daje, _StatusDaje, _numeroSelo, _codigoValidacao : String;
  _ValorDajeComplementar, _ValorDaje_WS, _EmolDaje, _TaxaFiscalDaje, _FecomDaje, _DefPublicaDaje, _PGE, _FMMPBA : Currency;
  _numeroSelo_Vias, _codigoValidacao_Vias: String;
  TipoDeDajeForDajeVias: Boolean;


 const
   ERROR_CONEXAO = 'ATENÇÃO O SERVIÇO TJBA NÃO ESTA DISPONÍVEL. TENTE MAIS TARDE !!!!!';

implementation

uses DMTD, Menu;

Function VerStatusDajeSistema(_Serie, _NumeroSelo : String) : String;
var
  qry_DAJE : TQuery;
Begin
  Result := '';
  qry_DAJE := TQuery.Create(Application);
  qry_DAJE.DatabaseName := Dm.DBTD.Databasename;
  qry_DAJE.Close;
  qry_DAJE.Sql.Clear;
  qry_DAJE.Sql.Add('select status from daje where serie_daje = ' + QuotedStr(_Serie) + ' AND numero_daje = ' + QuotedStr(_NumeroSelo));
  qry_DAJE.Open;
  If qry_DAJE.RecordCount <> 0 then Result := qry_DAJE.FieldByname('status').AsString;
  qry_DAJE.Destroy;
  qry_DAJE := Nil;
End;

Function Strzero1(Numero : String;Casas : Integer) : String;
Begin
  result := stringofchar('0',(casas-length(trim(numero)))) + trim(numero);
end;

Function FormataCPF(CPF : string): string;
begin
  Result := Copy(CPF,1,3)+'.'+Copy(CPF,4,3)+'.'+Copy(CPF,7,3)+'-'+Copy(CPF,10,2);
end;

Function Formatacnpj(cnpj : string): string;
begin
  Result := Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+Copy(cnpj,9,4)+'-' +Copy(cnpj,13,2);
end;

Function Modulo10(Parametro : String) : String;
var
  x, y, Res1, Res2 : Integer;
  ResEdit2, ResEdit3, ResEdit4, Resultado : String;
begin
  Result     := '';
  y          := 0;
  Resultado  := '';
  ResEdit2   := '';
  ResEdit3   := '';
  ResEdit4   := '';
  for x := 0 to (Length(Parametro) - 1) do
  begin
    if (y = 0) then
    begin
      Resultado := IntToStr(StrToInt(Copy(Parametro, Length(Parametro) - x, 1)) * 2);
      if (Length(Resultado) > 1) then
      begin
        Res1 := 0;
        Res1 := StrToInt(Copy(Resultado, 1,1)) + StrToInt(Copy(Resultado, 2,1));
        ResEdit2 := ResEdit2 + IntToStr(Res1);
      end
      else ResEdit2 := ResEdit2 + Resultado;
      y := 1;
    end
    else if (y = 1) then
    begin
      Resultado := IntToStr(StrToInt(Copy(Parametro, Length(Parametro) - x, 1)) * 1);
      if (Length(Resultado) > 1) then
      begin
        Res1 := 0;
        Res1 := StrToInt(Copy(Resultado, 1,1)) + StrToInt(Copy(Resultado, 2,1));
        ResEdit2 := ResEdit2 + IntToStr(Res1);
      end
      else ResEdit2 := ResEdit2 + Resultado;
      y := 0;
    end;
  end;
  Res2 := 0;
  for x := 1 to Length(ResEdit2) do
  begin
    Res2 := Res2 + StrToInt(Copy(ResEdit2, x, 1));
  end;
  Res2 := Res2 Mod 10;
  ResEdit3 := IntToStr(Res2);
  if (Res2 > 0) then
       ResEdit4 := IntToStr(10 - Res2)
  else ResEdit4 := '0';
  Result   := ResEdit4;
end;

Function Modulo11(Parametro : String; base : Integer) : String;
var
  x, y, Res1, Res2, yy : Integer;
  ResEdit2, ResEdit3, Resultado : Integer;
  ResEdit4  : String;
begin
  Result     := '';
  y          := 0;
  Resultado  := 0;
  ResEdit2   := 0;
  ResEdit3   := 0;
  ResEdit4   := '';
  yy         := 2;
  for x := 0 to (Length(Parametro) - 1) do
  begin
    Resultado := (StrToInt(Copy(Parametro, Length(Parametro) - x, 1)) * yy);
    ResEdit2  := ResEdit2 + Resultado;
    yy        := yy + 1;
    if (yy = base) then yy := 2;
  end;
  ResEdit2 := ResEdit2 Mod 11;

  if (ResEdit2 = 0) OR (ResEdit2 = 1) then ResEdit4 := '0';
  if (ResEdit2 = 10) then ResEdit4 := '1';
  if (ResEdit4 = '') then ResEdit4 := IntToStr(11 - ResEdit2);

  Result   := ResEdit4;
end;


Function GerarDaje(_Contribuinte, _DataEmissao, _HoraEmissao, _DataVencimento, _Endereco, _Observacao, _CpfCnpj, _CodigoTipoAto, _Isento, _SerieDajePrincipal, _NumeroDajePrincipal : String;
                    _ValorDaje, _ValorAto, _ValorDeclarado : Double;_CodigoCartorio, _CodigoEmissor, _QtdeAtos : Integer; _DajeComplementar : Boolean; _CodigoAtoAdicional,_QtdeAtoAdicional: String) : Boolean;
var req, ret : DajRequests;
    fValor, Texto, sDescricao: String;
    pIni, pFim, I: INTEGER;
begin
  Result := False;
  req := CoDajRequests.Create;
  ret := CoDajRequests.Create;

  req.DadosCartorio.CodigoCartorio := _CodigoCartorio;
  req.DadosCartorio.CodigoTipoAto  := _CodigoTipoAto;

  _ValorDaje_WS    := 0;   
  _EmolumentosDaje := 0;
  _TaxaFiscalDaje  := 0;
  _FecomDaje       := 0;
  _PGE             := 0;
  _DefPublicaDaje  := 0;
  _FMMPBA          := 0;
  _CodBarra_WS     := '';

  //Dados do Daje
  //req.DadosDaje.CodigoEmissor := _CodigoEmissor;
  req.DadosDaje.Atribuicao := sisDajSeloWS_br_jus_tjba_eselodes_ParametrosWS_atribuicao_TDPJ;

  if _Isento = 'S' then
  begin
    req.DadosStatus.Isento := True;
    req.DadosDaje.CodigoEmissor := _CodigoEmissor;
  end
  else
    req.DadosStatus.Isento := False;

  If (_CodigoAtoAdicional <> '') AND (_QtdeAtoAdicional <> '0') then
  Begin
    req.DadosDaje.AtosAdicionais     := _CodigoAtoAdicional;
    req.DadosDaje.QtdeAtosAdicionais := _QtdeAtoAdicional;
  End;

  //Dados do Valor
  req.DadosValor.Qtde     := _QtdeAtos;

{ DADOS DAJE COMPLEMENTAR }
  if _DajeComplementar then
  begin
    req.DadosDajeComplementar.SerieDajPrincipal         := StrToInt(_SerieDajePrincipal);
    req.DadosDajeComplementar.NumSequencialDajPrincipal := StrToInt(_NumeroDajePrincipal);
    req.DadosDajeComplementar.ValorPagarDajComplementar := _ValorDaje;
    req.DadosDajeComplementar.TipoDajComplementar       := _CodigoTipoAto;
  end
  else
  begin
    //Dados do Valor
    req.DadosValor.ValorDeclarado := _ValorDeclarado;
    req.DadosValor.ValorAto       := _ValorAto;
    req.DadosValor.ValorDaj       := _ValorDaje;
  end;

  //Datas do Daje
  req.DadosData.DataEmissao    := StrToDateTime(_DataEmissao);
  req.DadosData.HoraEmissao    := StrToTime(_HoraEmissao);
  req.DadosData.DataVencimento := StrToDateTime(_DataVencimento);

  //Dados do Contribuinte (não obrigatórios)
  req.DadosContribuinte.Contribuinte := _Contribuinte;
  req.DadosContribuinte.Endereco     := _Endereco;
  req.DadosContribuinte.Cpfcnpj      := _CpfCnpj;
  req.DadosContribuinte.Observacao   := _Observacao;

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
  // Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;

  // Usuário/Senha - WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;


  Try
    Try
      ret := req.sendDajPadrao;

      if (ret.Retorno.CodigoRetorno = 500) then
      Begin
        ShowMessage('Erro: 500 - Serviço indisponível (O serviço está indisponível. Neste caso, tente em alguns instantes mais '+
                    'tarde, ou caso persistir, comunique ao administrador do portal TJBA).');
        Abort;
      End;


      if ret.Retorno.CodigoRetorno = 200 then
      begin
        Result := True;
        _SerieDaje              := ret.Serie;
        _NumeroDaje             := ret.Numero;
        _ObservacaoDaje         := ret.DadosContribuinte.Observacao;
        _ValorAtoPraticadoDaje  := ret.DadosValor.ValorDeclarado;
        _ValorDaje_WS           := ret.DadosValor.ValorDaj;                   //_EmolImp;  2017
        _CodBarra_WS            := ret.DadosDaje.CodigoBarra;


        texto := ret.TaxaRateio;
        F_Menu.Memo1.Lines.Add(texto);
        while (Pos('<Descricao>', F_Menu.Memo1.Text) > 0) do
        begin
          fValor            := Copy(F_Menu.Memo1.Text, Pos('<Valor>', F_Menu.Memo1.Text) + 7, Pos('</Valor>', F_Menu.Memo1.Text) - Pos('<Valor>', F_Menu.Memo1.Text) - 7);
          sDescricao        := Copy(F_Menu.Memo1.Text, Pos('<Descricao>', F_Menu.Memo1.Text) + 11, Pos('</Descricao>', F_Menu.Memo1.Text) - Pos('<Descricao>', F_Menu.Memo1.Text) - 11);
          F_Menu.Memo1.Text := Copy(F_Menu.Memo1.Text, Pos('</Valor>', F_Menu.Memo1.Text) + 7, Length(F_Menu.Memo1.Text) - Pos('</Valor>', F_Menu.Memo1.Text) - 7);
                                                                     // 2017
          if (sDescricao = 'Emolumentos') Then
            _EmolumentosDaje := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'Taxa Fiscal') Then
            _TaxaFiscalDaje  := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'FECOM') Then
            _FecomDaje       := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'PGE') Then
            _PGE := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'Def. Pública') Then
            _DefPublicaDaje  := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'FMMPBA') Then
            _FMMPBA := StrToCurr(TirarTudo(fValor, '.','',''));


        end;

        _ValorDajeComplementar  := Ret.DadosDajeComplementar.ValorPagarDajComplementar;
        If _DajeComplementar then
        Begin
          _NumeroDajPrincipalDaje := ret.DadosDajeComplementar.SerieDajPrincipal + ret.DadosDajeComplementar.NumSequencialDajPrincipal;
          _NewNumeroDajePrincipal := StrZero(IntToStr(ret.DadosDajeComplementar.SerieDajPrincipal),3) + '-' + StrZero(IntToStr(ret.DadosDajeComplementar.NumSequencialDajPrincipal),6);
        End;

      end
      else
      begin
        ShowMessage('Não foi possível emitir a Daje: ' + ret.Retorno.MsgErro);
        Result := False;
      end;

    except
      On E : Exception do
      begin
        //ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
        Result := False;
      end;
    end;
  Finally
    req := nil;
    ret := nil;

  end;
end;

//Function GerarDaje_Compl(_Contribuinte, _DataEmissao, _HoraEmissao, _DataVencimento, _Endereco, _Observacao, _CpfCnpj, _CodigoTipoAto,
//                    _SerieDajePrincipal, _NumeroDajePrincipal : String;
//                    _ValorDaje, _ValorAto : Double; _CodigoCartorio, _CodigoEmissor, _QtdeAtos : Integer; _Isento : boolean) : Boolean;

function GerarDaje_Compl(_CodigoTipoAto, _SerieDajePrincipal, _NumeroDajePrincipal : string; _QtdeAtos, _CodigoCartorio, _CodigoEmissor, v_atoVinculado : integer; v_valor_declarado : Currency ) : boolean;
   var req, ret : DajRequests;
   fValor, Texto, sDescricao: String;
begin

  //<atoVinculado>2</atoVinculado>                                      =  codigoNatDaje       setimo  parametro
  //<numeroSequencialDajPrincipal>003045</numeroSequencialDajPrincipal> = MaskEdit47.Text      terceiro parametro
  //<serieDajPrincipal>002</serieDajPrincipal>                          =  MaskEdit46.Text     segundo parametro
  //<valorDeclarado>5000</valorDeclarado>                               =  CurrencyEdit1.Value  oitavo parametro

  Result := False;
  req    := CoDajRequests.Create;
  ret    := CoDajRequests.Create;

  _ValorDaje_WS    := 0;    // 2017
  _EmolumentosDaje := 0;
  _TaxaFiscalDaje  := 0;
  _FecomDaje       := 0;
  _PGE             := 0;
  _DefPublicaDaje  := 0;
  _CodBarra_WS     := '';

  req.DadosCartorio.CodigoTipoAto                     := _CodigoTipoAto;
  req.DadosCartorio.CodigoCartorio                    := _CodigoCartorio;
  req.DadosDajeComplementar.EmissorDajPrincipal       := _CodigoEmissor;
  req.DadosDajeComplementar.SerieDajPrincipal         := StrToInt(_SerieDajePrincipal);
  req.DadosDajeComplementar.NumSequencialDajPrincipal := StrToInt(_NumeroDajePrincipal);
  req.DadosValor.Qtde                                 := _QtdeAtos;
  req.DadosValor.ValorDeclarado                       := v_valor_declarado;
  req.DadosDaje.AtoVinculado                          := v_atoVinculado;

  req.DadosDaje.Atribuicao                            := sisDajSeloWS_br_jus_tjba_eselodes_ParametrosWS_atribuicao_RI;

  Dm.Configur.Close;
  Dm.Configur.SQL.Clear;
  Dm.Configur.SQL.Add('select * from configur');
  Dm.Configur.Open;
  if (Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '') then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;

  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;

  try
    try
      ret := req.sendDajComplementar;

      if ret.Retorno.CodigoRetorno = 200 then
      begin
        Result := True;
        _SerieDaje              := ret.Serie;
        _NumeroDaje             := ret.Numero;
        //_ValorAtoPraticadoDaje  := ret.DadosValor.ValorAto;
        _ValorAtoPraticadoDaje  := ret.DadosValor.ValorDeclarado;
        _ObservacaoDaje         := ret.DadosContribuinte.Observacao;
        _SerieDajPrincipalDaje  := ret.DadosDajeComplementar.SerieDajPrincipal;
        _NumeroDajPrincipalDaje := ret.DadosDajeComplementar.NumSequencialDajPrincipal;
        _ValorDajeComplementar  := ret.DadosDajeComplementar.ValorPagarDajComplementar;

        texto := ret.TaxaRateio;
        F_Menu.Memo1.Lines.Add(texto);
        while (Pos('<Descricao>', F_Menu.Memo1.Text) > 0) do                                                      //_EmolImp;  2017
        begin
          fValor            := Copy(F_Menu.Memo1.Text, Pos('<Valor>', F_Menu.Memo1.Text) + 7, Pos('</Valor>', F_Menu.Memo1.Text) - Pos('<Valor>', F_Menu.Memo1.Text) - 7);
          sDescricao        := Copy(F_Menu.Memo1.Text, Pos('<Descricao>', F_Menu.Memo1.Text) + 11, Pos('</Descricao>', F_Menu.Memo1.Text) - Pos('<Descricao>', F_Menu.Memo1.Text) - 11);
          F_Menu.Memo1.Text := Copy(F_Menu.Memo1.Text, Pos('</Valor>', F_Menu.Memo1.Text) + 7, Length(F_Menu.Memo1.Text) - Pos('</Valor>', F_Menu.Memo1.Text) - 7);
                                                                     // 2017
          if (sDescricao = 'Emolumentos') Then
            _EmolumentosDaje := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'Taxa Fiscal') Then
            _TaxaFiscalDaje  := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'FECOM') Then
            _FecomDaje       := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'PGE') Then
            _PGE := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'Def. Pública') Then
          _DefPublicaDaje  := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'FMMPBA') Then
          _FMMPBA := StrToCurr(TirarTudo(fValor, '.','',''));
          
        end;
      end
      else
      begin
        ShowMessage('Não foi possível emitir a Daje: ' + ret.Retorno.MsgErro);
        Result := False;
      end;

    except
      on E : Exception do
      begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
        Result := False;
      end;
    end;
  finally
    req := nil;
    ret := nil;
  end;
end;

Function ConsultarDaje(_CodigoEmissor, _Serie, _NumeroSequencial, _CodigoCartorio : String) : Boolean;
   var req, ret : DajRequests;
   fValor, Texto, sDescricao: String;
   _TotaDAJE: Currency;

begin
  Result := False;
  req := CoDajRequests.Create;
  ret := CoDajRequests.Create;

  _EmolDaje       := 0;
  _TaxaFiscalDaje := 0;
  _FecomDaje      := 0;
  _DefPublicaDaje := 0;
  _PGE            := 0;
  _TotaDAJE       := 0;
  _ValorDaje      := 0;

  //Dados do Daje
  req.DadosDaje.CodigoEmissor := StrToInt(_CodigoEmissor);
  req.DadosDaje.Serie := StrToInt(_Serie);
  req.DadosDaje.NumeroSequencial := StrToInt(_NumeroSequencial);

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
  // Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;

  {if ret.DadosCartorio.CodigoCartorio <> strtoint(id_eselo) Then
  begin
    Application.MessageBox(Pchar('O Daje informado não corresponde a esta serventia!'), 'Consultar DAJE', Mb_IconInformation);
    Abort;
  end;}  

  // Usuário/Senha - WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;

//  req.DadosUser.LoginClient := 102403;
//  req.DadosUser.SenhaClient := '2NjZN7in';

  Try
    Try
      ret := req.getDaj;

      If ret.Retorno.CodigoRetorno = 200 then
      Begin
        Result := True;

        _StatusDaje := ret.DadosDaje.StatusDajPadrao;

        _DataEmissaoDaje          := DateTimeToStr(ret.DadosData.DataEmissao);
        _ContribuinteDaje         := ret.DadosContribuinte.Contribuinte;
        _EnderecoContribuinteDaje := ret.DadosContribuinte.Endereco;

        _CodigoEmissorDaje        := ret.DadosDaje.CodigoEmissor;
        _CodigoDestinoDaje        := StrToInt(_CodigoCartorio);

        _CodigoAtoDaje            := ret.DadosCartorio.CodigoTipoAto;  

        ret.DadosDaje.Atribuicao;


        _ObservacaoDaje           := ret.DadosContribuinte.Observacao;
        _QtdeDaje                 := ret.DadosValor.Qtde;
        _NumeroDajPrincipalDaje   := ret.DadosDajeComplementar.NumSequencialDajPrincipal;
        _DataVencimentoDaje       := DateTimeToStr(ret.DadosData.DataVencimento);
        _ValorAtoPraticadoDaje    := ret.DadosValor.ValorAto;
        _CpfCnpjContribuinteDaje  := ret.DadosContribuinte.Cpfcnpj;
        _ValorDaje                := ret.DadosValor.ValorDaj;
        _EmolDaje                 := ret.DadosValor.Emolumentos;

        {_TaxaFiscalDaje           := ret.DadosValor.Fiscalizacao;
        _PGE                      := ret.DadosValor.PGE;
        _FecomDaje                := ret.DadosValor.Fecom;
        _DefPublicaDaje           := ret.DadosValor.Defensoria;}


        texto := ret.TaxaRateio;
        F_Menu.Memo1.Lines.Add(texto);
        while (Pos('<Descricao>', F_Menu.Memo1.Text) > 0) do
        begin                                                                                                               //_EmolImp;  2017
          fValor            := Copy(F_Menu.Memo1.Text, Pos('<Valor>', F_Menu.Memo1.Text) + 7, Pos('</Valor>', F_Menu.Memo1.Text) - Pos('<Valor>', F_Menu.Memo1.Text) - 7);
          sDescricao        := Copy(F_Menu.Memo1.Text, Pos('<Descricao>', F_Menu.Memo1.Text) + 11, Pos('</Descricao>', F_Menu.Memo1.Text) - Pos('<Descricao>', F_Menu.Memo1.Text) - 11);
          F_Menu.Memo1.Text := Copy(F_Menu.Memo1.Text, Pos('</Valor>', F_Menu.Memo1.Text) + 7, Length(F_Menu.Memo1.Text) - Pos('</Valor>', F_Menu.Memo1.Text) - 7);
                                                                     // 2017
          if (sDescricao = 'Emolumentos') Then
            _EmolDaje := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'Taxa Fiscal') Then
            _TaxaFiscalDaje  := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'FECOM') Then
            _FecomDaje       := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'PGE') Then
            _PGE := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'Def. Pública') Then
          _DefPublicaDaje  := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'FMMPBA') Then
          _FMMPBA := StrToCurr(TirarTudo(fValor, '.','',''));
          
        end;

        {dm.qryGenerico.RequestLive := False;
        dm.qryGenerico.Close;
        dm.qryGenerico.Sql.Clear;
        dm.qryGenerico.Sql.Add('select * from tab_ato2 where cod_ato = '+QuotedStr(_CodigoAtoDaje));
        dm.qryGenerico.Sql.Add('group by data');
        dm.qryGenerico.Open;
        dm.qryGenerico.FindLast;

        if _ValorDaje <> dm.qryGenerico.FieldByName('total').AsCurrency Then
          _ValorDaje:= dm.qryGenerico.FieldByName('total').AsCurrency; }



        if (dm.Configur.RecordCount <> 0) and (_EmolDaje <= 0) then
        begin
          _EmolDaje    := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('emol_daje').AsCurrency)/100),-2);
          _TaxaFiscalDaje  := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('tx_fiscal_daje').AsCurrency)/100),-2);
          _FecomDaje   := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('fecom_daje').AsCurrency)/100),-2);
          _DefPublicaDaje  := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('def_pub_daje').AsCurrency)/100),-2);
          _PGE          := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('vr_pge').AsCurrency)/100),-2);
          _FMMPBA       := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('FMMPBA').AsCurrency)/100),-2);
          _DefPublicaDaje    := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('def_pub_daje').AsCurrency)/100),-2);

          _TotaDAJE     := (_EmolDaje + _TaxaFiscalDaje + _FecomDaje + _DefPublicaDaje + _PGE);

          {if (_ValorDaje <> _TotaDAJE) then
            _DefPublicaDaje := _DefPublicaDaje + (_ValorDaje - _TotaDAJE); }
        end;   


        //Application.MessageBox(Pchar('Daje: ' + _Serie + ' ' + _NumeroSequencial + ' - Status: ' + _StatusDaje), 'Consulta DAJE', Mb_IconInformation);
        {Application.MessageBox(Pchar('Apresentante: ' + _ContribuinteDaje + ' - Data de Emissão: ' + _DataEmissaoDaje + ' - Data de Vencimento: ' + _DataVencimentoDaje +
        ' - Valor DAJE: ' + FormatCurr('###,###,###,##0.00', _ValorDaje) + ' - DAJE: ' + _Serie + ' ' + _NumeroSequencial + ' - Status: ' + _StatusDaje), 'Consulta DAJE', Mb_IconInformation);}
      End
      Else
      Begin
        ShowMessage('Não foi possível consultar a Daje: ' + ret.Retorno.MsgErro);
        Result := False;
      End;

    Except
      On E : Exception do
      Begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
        Result := False;
      End;
    End;
  Finally
    req := nil;
    ret := nil;
  End;
end;

Function ConsultarDaje_Compl(_CodigoTipoAto, _SerieDajePrincipal, _NumeroDajePrincipal : string; _QtdeAtos, _CodigoCartorio, _CodigoEmissor, v_atoVinculado : integer; v_valor_declarado : Currency) : boolean;
   var req, ret : DajRequests;
   fValor, Texto, sDescricao: String;
   _TotaDAJE: Currency;
begin
  Result := False;
  req    := CoDajRequests.Create;
  ret    := CoDajRequests.Create;

  req.DadosCartorio.CodigoTipoAto                     := _CodigoTipoAto;
  req.DadosCartorio.CodigoCartorio                    := _CodigoCartorio;
  req.DadosDajeComplementar.EmissorDajPrincipal       := _CodigoEmissor;
  req.DadosDajeComplementar.SerieDajPrincipal         := StrToInt(_SerieDajePrincipal);
  req.DadosDajeComplementar.NumSequencialDajPrincipal := StrToInt(_NumeroDajePrincipal);
  req.DadosValor.Qtde                                 := _QtdeAtos;
  req.DadosValor.ValorDeclarado                       := v_valor_declarado;
  req.DadosDaje.AtoVinculado                          := v_atoVinculado;



  req.DadosDaje.Atribuicao                            := sisDajSeloWS_br_jus_tjba_eselodes_ParametrosWS_atribuicao_TDPJ;

  Dm.Configur.Close;
  Dm.Configur.SQL.Clear;
  Dm.Configur.SQL.Add('select * from configur');
  Dm.Configur.Open;
  if (Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '') then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;

  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;

  try
    try
      ret := req.sendDajComplementar;

      if ret.Retorno.CodigoRetorno = 200 then
      begin
        Result := True;
        _SerieDaje              := ret.Serie;
        _NumeroDaje             := ret.Numero;
        //_ValorAtoPraticadoDaje  := ret.DadosValor.ValorAto;
        _ValorAtoPraticadoDaje  := ret.DadosValor.ValorDeclarado;
        _ObservacaoDaje         := ret.DadosContribuinte.Observacao;
        _SerieDajPrincipalDaje  := ret.DadosDajeComplementar.SerieDajPrincipal;
        _NumeroDajPrincipalDaje := ret.DadosDajeComplementar.NumSequencialDajPrincipal;

        texto := ret.TaxaRateio;
        F_Menu.Memo1.Lines.Add(texto);
        while (Pos('<Descricao>', F_Menu.Memo1.Text) > 0) do
        begin                                                                                                       //  2017
          fValor            := Copy(F_Menu.Memo1.Text, Pos('<Valor>', F_Menu.Memo1.Text) + 7, Pos('</Valor>', F_Menu.Memo1.Text) - Pos('<Valor>', F_Menu.Memo1.Text) - 7);
          sDescricao        := Copy(F_Menu.Memo1.Text, Pos('<Descricao>', F_Menu.Memo1.Text) + 11, Pos('</Descricao>', F_Menu.Memo1.Text) - Pos('<Descricao>', F_Menu.Memo1.Text) - 11);
          F_Menu.Memo1.Text := Copy(F_Menu.Memo1.Text, Pos('</Valor>', F_Menu.Memo1.Text) + 7, Length(F_Menu.Memo1.Text) - Pos('</Valor>', F_Menu.Memo1.Text) - 7);
                                                                     // 2017
          if (sDescricao = 'Emolumentos') Then
            _EmolDaje := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'Taxa Fiscal') Then
            _TaxaFiscalDaje  := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'FECOM') Then
            _FecomDaje       := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'PGE') Then
            _PGE := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'Def. Pública') Then
          _DefPublicaDaje  := StrToCurr(TirarTudo(fValor, '.','',''));

          if (sDescricao = 'FMMPBA') Then
          _FMMPBA := StrToCurr(TirarTudo(fValor, '.','',''));
          
        end;

        dm.qryGenerico.RequestLive := False;
        dm.qryGenerico.Close;
        dm.qryGenerico.Sql.Clear;
        dm.qryGenerico.Sql.Add('select * from tab_ato2 where cod_ato = '+QuotedStr(_CodigoAtoDaje));
        dm.qryGenerico.Sql.Add('group by data');
        dm.qryGenerico.Open;
        dm.qryGenerico.FindLast;

        if _ValorDaje <> dm.qryGenerico.FieldByName('total').AsCurrency Then
          _ValorDaje:= dm.qryGenerico.FieldByName('total').AsCurrency;

        if (dm.Configur.RecordCount <> 0) then
        begin
          _EmolDaje    := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('emol_daje').AsCurrency)/100),-2);
          _TaxaFiscalDaje  := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('tx_fiscal_daje').AsCurrency)/100),-2);
          _FecomDaje   := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('fecom_daje').AsCurrency)/100),-2);
          _DefPublicaDaje  := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('def_pub_daje').AsCurrency)/100),-2);
          _PGE          := SimpleRoundTo(((_ValorDaje * dm.Configur.FieldByName('vr_pge').AsCurrency)/100),-2);

          _TotaDAJE     := (_EmolDaje + _TaxaFiscalDaje + _FecomDaje + _DefPublicaDaje + _PGE);

          if (_ValorDaje <> _TotaDAJE) then
            _DefPublicaDaje := _DefPublicaDaje + (_ValorDaje - _TotaDAJE);
        end;

      end
      else
      begin
        ShowMessage('Não foi possível emitir a Daje: ' + ret.Retorno.MsgErro);
        Result := False;
      end;

    except
      on E : Exception do
      begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
        Result := False;
      end;
    end;
  finally
    req := nil;
    ret := nil;
  end;
End;


Procedure GeraCodigoBoleto(Validade, Emissor, Serie, NumeroDaje, Destino : String; ValorDaje : Currency);
var
  BL01LinDig, BL02LinDig, BL03LinDig, BL04LinDig : String;
  Mod11 : String;
  Campo1, Campo2 : String;
begin

//Módulo 11
  Mod11 := Modulo11('858' +
                    //ver como é o strzero1 de julio
                    StrZero1(TirarTudo(StrCurrPesq(ValorDaje), '.', '', ''), 11) +
                    '0409' +
                    Copy(Validade, 9, 2) + Copy(Validade, 4, 2) + Copy(Validade, 1, 2) +
                    Emissor +
                    Serie +
                    NumeroDaje +
                    Destino + 
                    '01',
                    10);

//1º Bloco da linha digitavel
  BL01LinDig := '';
  BL01LinDig := '858' + Mod11 + Copy(StrZero1(TirarTudo(StrCurrPesq(ValorDaje), '.', '', ''), 11), 1, 7);

//2º Bloco da linha Digitável
  BL02LinDig := '';
  BL02LinDig := Copy(StrZero1(TirarTudo(StrCurrPesq(ValorDaje), '.', '', ''), 11), 8, 11) + '0409' + Copy(Validade, 9, 2) + Copy(Validade, 4, 1);

//3º Bloco da linha Digitável
  BL03LinDig := '';
  BL03LinDig := Copy(Validade, 5, 1) + Copy(Validade, 1, 2) + Emissor + Serie + Copy(NumeroDaje, 1, 1);

//4º Bloco da linha Digitável
  BL04LinDig := '';
  BL04LinDig := Copy(NumeroDaje, 2, 5) + Destino + '01';


  LinhaDig := BL01LinDig + ' ' + Modulo11(BL01LinDig, 10) + ' ' +
              BL02LinDig + ' ' + Modulo11(BL02LinDig, 10) + ' ' +
              BL03LinDig + ' ' + Modulo11(BL03LinDig, 10) + ' ' +
              BL04LinDig + ' ' + Modulo11(BL04LinDig, 10);

  Campo1 := '858';
  Campo2 := StrZero1(TirarTudo(StrCurrPesq(ValorDaje), '.', '', ''), 11) +
            '0409' +
            Copy(Validade, 9, 2) + Copy(Validade, 4, 2) + Copy(Validade, 1, 2) +
            Emissor +
            Serie +
            NumeroDaje +
            Destino +
            '01';
  CodBarra := Campo1 + Mod11 + Campo2;

{
  CodBarra := BL01LinDig + Modulo10(BL01LinDig) +
              BL02LinDig + Modulo10(BL02LinDig) +
              BL03LinDig + Modulo10(BL03LinDig) +
              BL04LinDig + Modulo10(BL04LinDig);
}
end;

Procedure ImprimirDaje(_EmolImp : Currency; _DataVencimentoDaje, _ContribuinteDaje, _DataEmissaoDaje, _EnderecoContribuinteDaje, _CidadeContribuinteDaje,
                       _DenominacaoUnidadeDaje, _Delegatario, _Substituto, _CodigoAtoDaje, _QtdeDaje, _TipoNaturezaDaje, _CpfCnpjContribuinteDaje, _ObsDaje, sTexto : String);
//var
  //_EmolumentosDaje, _TaxaFiscalDaje, _FecomDaje, _DefPublicaDaje, _DiferencaDaje : Currency;

begin
  {_EmolumentosDaje := 0;
  _TaxaFiscalDaje  := 0;
  _FecomDaje       := 0;
  _DefPublicaDaje  := 0;
  _DiferencaDaje   := 0;


  _ValorDaje       := _EmolImp;
  _EmolumentosDaje := SimpleRoundTo(((_EmolImp * emol_daje)/100),-2);
  _TaxaFiscalDaje  := SimpleRoundTo(((_EmolImp * tx_fisc_daje)/100),-2);
  _FecomDaje       := SimpleRoundTo(((_EmolImp * fecom_daje)/100),-2);
  _DefPublicaDaje  := SimpleRoundTo(((_EmolImp * def_pub_daje)/100),-2);}

  if _EmolImp = 0 then
  begin
    _ValorDaje_WS := 0;
    _ValorAtoPraticadoDaje := 0;
    _EmolumentosDaje := 0;
    _TaxaFiscalDaje := 0;
    _FecomDaje := 0;
    _DefPublicaDaje := 0;
    _PGE := 0;
  end;
  GeraCodigoBoleto(_DataVencimentoDaje, StrZero(id_eselo,4), StrZero(IntToStr(_SerieDaje), 3), StrZero(IntToStr(_NumeroDaje), 6), StrZero(id_eselo,4), _ValorDaje_WS);

  Dm.SysDaje.DefaultDest    := rdPreview;
  Dm.SysDaje.DoNativeOutput := true;
  Dm.SysDaje.RenderObject   := nil;
  Dm.RvDaje.Open;
  Dm.RvDaje.SetParam('BarraDaje', StrZero(IntToStr(_SerieDaje), 3) + StrZero(IntToStr(_NumeroDaje), 6));
  Dm.RvDaje.SetParam('Serie', StrZero(IntToStr(_SerieDaje), 3));
  Dm.RvDaje.SetParam('Numero', StrZero(IntToStr(_NumeroDaje), 6));
  Dm.RvDaje.SetParam('Contribuinte', _ContribuinteDaje);
  Dm.RvDaje.SetParam('Emissao', _DataEmissaoDaje);
  Dm.RvDaje.SetParam('Endereco', _EnderecoContribuinteDaje);
  Dm.RvDaje.SetParam('Cidade', _CidadeContribuinteDaje);
  Dm.RvDaje.SetParam('Denominacao', _DenominacaoUnidadeDaje);
  Dm.RvDaje.SetParam('Delegatario', _Delegatario);
  Dm.RvDaje.SetParam('Substituto', _Substituto);
  Dm.RvDaje.SetParam('CartorioEmissor', StrZero(id_eselo,4));
  Dm.RvDaje.SetParam('CartorioDestino', StrZero(id_eselo,4));
  Dm.RvDaje.SetParam('CodigoAto', _CodigoAtoDaje);
  Dm.RvDaje.SetParam('Observacao', _ObsDaje);
  Dm.RvDaje.SetParam('QtdeAtos', _QtdeDaje);

  If (_NumeroDajPrincipalDaje > 0) then
    Dm.RvDaje.SetParam('DajePrincipal', IntToStr(_SerieDajPrincipalDaje) + '-' + IntToStr(_NumeroDajPrincipalDaje))
  Else
    Dm.RvDaje.SetParam('DajePrincipal', '');

  Dm.RvDaje.SetParam('Vencimento', _DataVencimentoDaje);
  Dm.RvDaje.SetParam('TipoNatureza', _TipoNaturezaDaje);
  Dm.RvDaje.SetParam('ValorAto', 'R$ ' + FormatCurr('###,###,###,##0.00', _ValorAtoPraticadoDaje));

  if Length(Trim(_CpfCnpjContribuinteDaje)) > 11 then
    Dm.RvDaje.SetParam('CpfCnpj', formatacnpj(_CpfCnpjContribuinteDaje))
  else
    Dm.RvDaje.SetParam('CpfCnpj', formataCPF(_CpfCnpjContribuinteDaje));

  Dm.RvDaje.SetParam('ValorPagar', 'R$ ' + FormatCurr('###,###,###,##0.00', _ValorDaje_WS));
  Dm.RvDaje.SetParam('LinhaDigitavel', LinhaDig);
  Dm.RvDaje.SetParam('CodigoBarras', CodBarra);

  If _EmolImp > 0 then
  Begin
    Dm.RvDaje.SetParam('Cota', 'Emolumentos R$' + FormatCurr('###,###,###,##0.00', _EmolumentosDaje) + ' - Taxa Fiscal R$' + FormatCurr('###,###,###,##0.00', _TaxaFiscalDaje) +
                            ' - FECOM R$' + FormatCurr('###,###,###,##0.00', _FecomDaje) + ' - PGE R$' + FormatCurr('###,###,###,##0.00', _PGE) + ' - FMMPBA R$' + FormatCurr('###,###,###,##0.00', _FMMPBA) + ' - Def. ');
    Dm.RvDaje.SetParam('Cota2', 'Pública R$' + FormatCurr('###,###,###,##0.00', _DefPublicaDaje));
  End
  Else
  Begin
    Dm.RvDaje.SetParam('Cota', 'Emolumentos R$' + FormatCurr('###,###,###,##0.00', 0) + ' - Taxa Fiscal R$' + FormatCurr('###,###,###,##0.00', 0) +
                            ' - FECOM R$' + FormatCurr('###,###,###,##0.00', 0) + ' - PGE R$' + FormatCurr('###,###,###,##0.00', 0) + ' - FMMPBA R$' + FormatCurr('###,###,###,##0.00', 0) + ' - Def. ');
    Dm.RvDaje.SetParam('Cota2', 'Pública R$' + FormatCurr('###,###,###,##0.00', 0));    // Pra quando gerar daje insento , zera tudo 
  End;

  Dm.RvDaje.SetParam('Cota2', 'Pública R$' + FormatCurr('###,###,###,##0.00', _DefPublicaDaje));


  Dm.RvDaje.ExecuteReport('rptDaje');
  Dm.SysDaje.SystemSetups := Dm.SysDaje.SystemSetups - [ssAllowSetup];
  Dm.SysDaje.DefaultDest := rdFile;
  Dm.SysDaje.DoNativeOutput:= false;
  Dm.SysDaje.RenderObject:= Dm.RvRenderPDF1;

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;

  dir_daje := Dm.Configur.FieldByName('imagensdaje').asString + 'Recep\';
  If NOT DirectoryExists(dir_daje) then ForceDirectories(dir_daje);

  Try
    //dir_daje := F_Menu.Label76.Caption + '\img_daje\';
    Dm.SysDaje.OutputFileName:= dir_daje + StrZero(IntToStr(_SerieDaje), 3) + '_' + StrZero(IntToStr(_NumeroDaje), 6) + '.PDF';
    Dm.RvDaje.ExecuteReport('rptDaje');
  Except
  End;
  Dm.RvDaje.Close;
end;

Function PagarDajeManual(_CodigoEmissor, _Serie, _NumeroSequencial, _CodigoCartorio : String) : Boolean;
   var req, ret : DajRequests;
begin
  Result := False;
  req := CoDajRequests.Create;
  ret := CoDajRequests.Create;

  //Dados do Daje
  req.DadosDaje.CodigoEmissor := StrToInt(_CodigoEmissor);
  req.DadosDaje.Serie := StrToInt(_Serie);
  req.DadosDaje.NumeroSequencial := StrToInt(_NumeroSequencial);

  Dm.Configur.Close;
  Dm.Configur.SQL.Clear;
  Dm.Configur.SQL.Add('select * from configur');
  Dm.Configur.Open;
  // Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;
  //
  // Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;
  //

//  req.DadosUser.LoginClient := 102403;
//  req.DadosUser.SenhaClient := '2NjZN7in';

  Try
    Try          //sendPagamentoDaje;
      ret := req.confirmarPagamentoDaj;

      If ret.Retorno.CodigoRetorno = 200 then
      Begin
        Result := True;

        _StatusDaje := ret.DadosDaje.StatusDajPadrao;
        _DataEmissaoDaje          := DateTimeToStr(ret.DadosData.DataEmissao);
        _ContribuinteDaje         := ret.DadosContribuinte.Contribuinte;
        _EnderecoContribuinteDaje := ret.DadosContribuinte.Endereco;
        _CodigoEmissorDaje        := ret.DadosDaje.CodigoEmissor;
        _CodigoDestinoDaje        := StrToInt(_CodigoCartorio);
        _CodigoAtoDaje            := ret.DadosCartorio.CodigoTipoAto;
        _ObservacaoDaje           := ret.DadosContribuinte.Observacao;
        _QtdeDaje                 := ret.DadosValor.Qtde;
        _NumeroDajPrincipalDaje   := ret.DadosDajeComplementar.NumSequencialDajPrincipal;
        _DataVencimentoDaje       := DateTimeToStr(ret.DadosData.DataVencimento);
//        _ValorAtoPraticadoDaje    := ret.DadosValor.ValorAto;
        _CpfCnpjContribuinteDaje  := ret.DadosContribuinte.Cpfcnpj;
//        _ValorDaje                := ret.DadosValor.ValorDaj;

        //Application.MessageBox(Pchar('Daje: ' + _Serie + ' ' + _NumeroSequencial + ' emitido em: ' + _DataEmissaoDaje + '. Nome do contribuinte: ' + _ContribuinteDaje + ' - Status: ' + UpperCase(_StatusDaje)), 'PAGO COM SUCESSO', Mb_IconInformation);
      End
      Else
      Begin
        ShowMessage('Não foi possível para o Daje: ' + ret.Retorno.MsgErro);
        Result := False;
      End;

    Except
      On E : Exception do
      Begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
        Result := False;
      End;
    End;
  Finally
    req := nil;
    ret := nil;
  End;
end;

Function PagarDajeManualProducao(_CodigoEmissor, _Serie, _NumeroSequencial, _CodigoCartorio : String) : Boolean;
   var req, ret : DajRequests;
begin
  Result := False;
  req := CoDajRequests.Create;
  ret := CoDajRequests.Create;

  //Dados do Daje
  req.DadosDaje.CodigoEmissor := StrToInt(_CodigoEmissor);
  req.DadosDaje.Serie := StrToInt(_Serie);
  req.DadosDaje.NumeroSequencial := StrToInt(_NumeroSequencial);

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
  // Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;
  //
  // Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;
  //

//  req.DadosUser.LoginClient := 102403;
//  req.DadosUser.SenhaClient := '2NjZN7in';

  Try
    Try
      ret := req.confirmarPagamentoDaj;

      If ret.Retorno.CodigoRetorno = 200 then
      Begin
        Result := True;
        Application.MessageBox(Pchar('Daje: ' + _Serie + ' ' + _NumeroSequencial + '.'), 'PAGO COM SUCESSO', Mb_IconInformation);
      End
      Else
      Begin
        ShowMessage('Não foi possível para o Daje: ' + ret.Retorno.MsgErro);
        Result := False;
      End;

    Except
      On E : Exception do
      Begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
        Result := False;
      End;
    End;
  Finally
    req := nil;
    ret := nil;
  End;
end;

Function MotivoIsencao(_CodigoEmissor : String) : String; //Colocar parametros depois como conseguir
var
  req, ret : SeloRequests;
  texto : String;
begin
  Result := '0';
  ret    := CoSeloRequests.Create;
  req    := CoSeloRequests.Create;

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
//Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;

//Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;

  Try
    Try
      texto := req.getMotivoIsencao(ret);
      If ret.Retorno.CodigoRetorno = 200 then
      Begin
        //ShowMessage(texto);
        Result := texto;
      End
      Else
      Begin
        ShowMessage('Não foi possível recuperar os motivos: ' + ret.Retorno.MsgErro);
      End;

    Except
      On E : Exception do
      Begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
      End;
    End;
  Finally
    req := nil;
    ret := nil;
  End;
end;

Function SeloComDaje(_CodigoEmissor, _Funcionario, _MotivoIsencao, _DescricaoMotivo, _Dajes, _NumeroSeloFisico, _NumeroCertidao, _NumeroProtocolo, _folha, _livro, _NomeParte, _CodigoCartorio : String) : String;
   var req, ret : SeloRequests;
begin
  Result := '0';
  ret    := CoSeloRequests.Create;
  req    := CoSeloRequests.Create;

//Dados do Daje para capturar o Selo.

  req.Selo.CodigoCartorio := StrToInt(_CodigoEmissor);
  req.Selo.Funcionario    := _Funcionario;
  req.Selo.Dajs           := _Dajes;
  req.Selo.NumSeloFisico  := _NumeroSeloFisico;
  req.Selo.NomeParte      := _NomeParte;
  req.Selo.NumeroCertidao := _NumeroCertidao;
  if (_MotivoIsencao <> '') then
    req.Selo.MotivoIsencao  := StrToInt(_MotivoIsencao)
  else
    req.Selo.MotivoIsencao  := 0;
  req.Selo.DescricaoMotivo:= _DescricaoMotivo;
  //end;
  req.Selo.NumeroProtocolo:= 0; //_NumeroProtocolo
  req.Selo.Livro          := _livro;
  req.Selo.Folha          := _folha;

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
//Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;

//Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').AsString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').AsString;
  Dm.Configur.Close;

  Try
    Try
      ret := req.getSeloDaje;
      If ret.Retorno.CodigoRetorno = 200 then
      Begin
        if TipoDeDajeForDajeVias Then
        Begin
          _numeroSelo_Vias      := ret.Selo.NumeroSelo;
          _codigoValidacao_Vias := ret.Selo.CodigoValidacao;
        End
        Else
        Begin
          _numeroSelo      := ret.Selo.NumeroSelo;
          _codigoValidacao := ret.Selo.CodigoValidacao;
        End;

        Try
          if TipoDeDajeForDajeVias Then
          Begin
            Dm.ArqAux1.Close;
            Dm.ArqAux1.Sql.Clear;
            Dm.ArqAux1.Sql.Add('update daje set numero_selo = ' + QuotedStr(_numeroSelo_Vias));
            Dm.ArqAux1.Sql.Add(', cod_validacao = ' + QuotedStr(_codigoValidacao_Vias));
            Dm.ArqAux1.Sql.Add(', usuario_selo = ' + QuotedStr(_Funcionario));
            Dm.ArqAux1.Sql.Add('WHERE serie_daje = ' + QuotedStr(Copy(Strzero1(_Dajes, 13), 5, 3)));
            Dm.ArqAux1.Sql.Add('and numero_daje = ' + QuotedStr(Copy(Strzero1(_Dajes, 13), 8, 6)));
            Dm.ArqAux1.ExecSQL;

            Result := _numeroSelo_Vias + '|' + _codigoValidacao_Vias;
            Application.MessageBox(Pchar('Selo: ' + _numeroSelo_Vias + ' Código de Validação: ' + _codigoValidacao_Vias), 'GERADO COM SUCESSO', Mb_IconInformation);
          End
          Else
          Begin
            Dm.ArqAux1.Close;
            Dm.ArqAux1.Sql.Clear;
            Dm.ArqAux1.Sql.Add('update daje set numero_selo = ' + QuotedStr(_numeroSelo));
            Dm.ArqAux1.Sql.Add(', cod_validacao = ' + QuotedStr(_codigoValidacao));
            Dm.ArqAux1.Sql.Add(', usuario_selo = ' + QuotedStr(_Funcionario));
            Dm.ArqAux1.Sql.Add('WHERE serie_daje = ' + QuotedStr(Copy(Strzero1(_Dajes, 13), 5, 3)));
            Dm.ArqAux1.Sql.Add('and numero_daje = ' + QuotedStr(Copy(Strzero1(_Dajes, 13), 8, 6)));
            Dm.ArqAux1.ExecSQL;

            Result := _numeroSelo + '|' + _codigoValidacao;
            Application.MessageBox(Pchar('Selo: ' + _numeroSelo + ' Código de Validação: ' + _codigoValidacao), 'GERADO COM SUCESSO', Mb_IconInformation);
          End;
        Except
          //Result := '0';
          ShowMessage('Não foi possível gerar o Selo.');
          _numeroSelo      := '';
          _codigoValidacao := '';
        End;
      End
      Else
      Begin
        ShowMessage('Não foi possível gerar o Selo: ' + ret.Retorno.MsgErro);
        _numeroSelo      := '';
        _codigoValidacao := '';

      End;
    Except
      On E : Exception do
      Begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
      End;
    End;
  Finally
    req := nil;
    ret := nil;
  End;
end;

Function MotivoCancelamento(_CodigoEmissor : String) : String; //Colocar parametros depois como conseguir
var
  req, ret : SeloRequests;
  texto : String;
begin
  Result := '0';
  ret    := CoSeloRequests.Create;
  req    := CoSeloRequests.Create;

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
//Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;

//Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;

  Try
    Try
      texto := req.getMotivoCancelamento(ret);
      If ret.Retorno.CodigoRetorno = 200 then
      Begin
        //ShowMessage(texto);
        Result := texto;
      End
      Else
      Begin
        ShowMessage('Não foi possível recuperar os motivos: ' + ret.Retorno.MsgErro);
      End;

    Except
      On E : Exception do
      Begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
      End;
    End;
  Finally
    req := nil;
    ret := nil;
  End;
end;

Function CancelarSelo(_CodigoEmissor, _NumeroSelo, _MotivoCanc : String) : Boolean;
   var req, ret : SeloRequests;
Begin
  Result := False;
  ret    := CoSeloRequests.Create;
  req    := CoSeloRequests.Create;

  req.Selo.CodigoCartorio     := StrToInt(_CodigoEmissor);
  req.Selo.NumeroSelo         := _NumeroSelo;
  req.Selo.MotivoCancelamento := _MotivoCanc;

  {req.Selo.CodigoCartorio     := StrToInt(_CodigoEmissor);
  req.Selo.NumeroSelo         := _NumeroSelo;
  req.Selo.MotivoCancelamento := _MotivoCanc;}

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
//Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;

  //Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;

  Try
    Try
      ret := req.cancelaSelo;
      If ret.Retorno.CodigoRetorno = 200 then
      Begin
        Result := True;
      Application.MessageBox(Pchar('Cancelamento do Selo Efetuado com Sucesso'), 'GERADO COM SUCESSO', Mb_IconInformation);
      End
      Else
      Begin
        ShowMessage('Não foi possível Cancelar o Selo: ' + ret.Retorno.MsgErro);
      End;

    Except
      On E : Exception do
      Begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
      End;
    End;
  Finally
    req := nil;
    ret := nil;
  End;

End;

Function AnexarTeorAto(_CodigoEmissor, _NumeroSelo, _Conteudo : String) : Boolean;
   var req, ret : SeloRequests;
Begin
  Result := False;
  ret    := CoSeloRequests.Create;
  req    := CoSeloRequests.Create;

//Dados do Selo para Enviar a Certodão.
  req.Selo.CodigoCartorio := StrToInt(_CodigoEmissor);
  req.Selo.NumeroSelo     := _NumeroSelo;
  req.Selo.CaminhoArquivo := _Conteudo;

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
//Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;

//Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;

  Try
    Try
      ret := req.sendTeorAto;
      If ret.Retorno.CodigoRetorno = 200 then
      Begin
        Result := True;
      End
      Else
      Begin
        ShowMessage('Não foi possível enviar o Teor do Ato: ' + ret.Retorno.MsgErro);
      End;

    Except
      On E : Exception do
      Begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
      End;
    End;
  Finally
    req := nil;
    ret := nil;
  End;

End;

Function InformarEstoqueInicialSelos(_CodigoEmissor : String) : Boolean;
   var req, ret : SeloRequests;
begin
  Result := False;
  req := CoSeloRequests.Create;
  ret := CoSeloRequests.Create;

  //Dados do estoque
  req.Selo.SequenciaSelos := 'AU123456;AU123555;1';

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
  // Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;
  //
  // Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;
  //

//  req.DadosUser.LoginClient := 102403;
//  req.DadosUser.SenhaClient := '2NjZN7in';

  Try
    Try
      ret := req.getEstoqueSelo;

      If ret.Retorno.CodigoRetorno = 200 then
      Begin
        Result := True;
        ShowMessage('Estoque de Selos transmitido com sucesso.');
      End
      Else
      Begin
        ShowMessage('Não foi possível transmitir o(s) Selo(s): ' + ret.Retorno.MsgErro);
        Result := False;
      End;

    Except
      On E : Exception do
      Begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
        Result := False;
      End;
    End;
  Finally
    req := nil;
    ret := nil;
  End;
end;

Function TestarConexaoTJ(_CodigoEmissor : String) : Boolean;
var
  texto : String;
  req, ret : DajRequests;

Begin
  req := CoDajRequests.Create;
  ret := CoDajRequests.Create;

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
//Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;

//Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;

  Try
    Try
      texto := req.consultaDajsNPagos48(ret);

      If ret.Retorno.CodigoRetorno = 200 then
      Begin
        Result := True;
        ShowMessage('Conexão com o TJ disponível nesse momento.');
      End
      Else
      Begin
        ShowMessage('Conexão com o TJ indisponível nesse momento. Tente novamente mais tarde. ' + ret.Retorno.MsgErro);
        Result := False;
      End;

    Except
      On E : Exception do
      Begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
        Result := False;
      End;
    End;
  Finally
    req := nil;
    ret := nil;
  End;
end;

Function DesbloquearDaje(_CodigoEmissor, _Serie, _NumeroSequencial : String) : Boolean;
   var req, ret : DajRequests;
begin
  Result := False;
  req := CoDajRequests.Create;
  ret := CoDajRequests.Create;

  //Dados do Daje
  req.DadosDaje.CodigoEmissor := StrToInt(_CodigoEmissor);
  req.DadosDaje.Serie := StrToInt(_Serie);
  req.DadosDaje.NumeroSequencial := StrToInt(_NumeroSequencial);

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
  // Dados Proxy
  if Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '' then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
  begin
    req.DadosProxy.UsaProxy := False;
  end;
  //
  // Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;
  Dm.Configur.Close;


  Try
    Try
      ret := req.UnblockDaj;

      If ret.Retorno.CodigoRetorno = 200 then
      Begin
        Result := True;
        Application.MessageBox(Pchar('Daje: ' + _Serie + ' ' + _NumeroSequencial + '.'), 'BLOQUEADO COM SUCESSO', Mb_IconInformation);
      End
      Else
      Begin
       if(ret.Retorno.CodigoRetorno = 500)then
          ShowMessage(ERROR_CONEXAO)
        else
          ShowMessage('Não foi possível para o Daje: ' + ret.Retorno.MsgErro);
        Result := False;
      End;

    Except
      On E : Exception do
      Begin
        ShowMessage(E.ClassName + ' erro com Mensagem ' + E.Message);
        Result := False;
      End;
    End;
  Finally
    req := nil;
    ret := nil;
  End;
end;

function VerificarDajeJustificado(_CodigoEmissor, _SerieDaje,
  _NumeroDaje: integer): Integer;
var
  req, ret : DajRequests;
begin
  Result := 0;

  req := CoDajRequests.Create;
  ret := CoDajRequests.Create;

  //Dados do Cartório
  req.DadosDaje.CodigoEmissor       := _CodigoEmissor;
  req.DadosDaje.NumeroSequencial    := _NumeroDaje;
  req.DadosDaje.Serie := _SerieDaje;

  //Dados Proxy
  dm.qryGenerico.Close;
  dm.qryGenerico.Sql.Clear;
  dm.qryGenerico.Sql.Add('select * from configur');
  dm.qryGenerico.Open;
  if (Trim(dm.qryGenerico.FieldByName('servidor_proxy').asString) <> '') then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(dm.qryGenerico.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(dm.qryGenerico.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(dm.qryGenerico.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(dm.qryGenerico.FieldByName('senha_proxy').asString);
  end
  else
    req.DadosProxy.UsaProxy := False;

  //Dados WebService
  req.DadosUser.LoginClient := StrToInt(dm.qryGenerico.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := dm.qryGenerico.FieldByName('senhaclient').asString;

  try
    try
      ret := req.VerificaDajJustificado;

      result := ret.Retorno.CodigoRetorno;

    except
      on E : Exception do
      begin
        Application.MessageBox(Pchar(E.ClassName + ' erro com mensagem ' + E.Message), 'Justificar Daje', Mb_IconInformation);
        Result := 0;
      end;
    end;
  finally
    req := nil;
    ret := nil;
  end;
end;

function CodJustificativas : string;
var
  req, ret : ParametrosRequests;
begin
  Result := '';
  req := CoParametrosRequests.Create;
  ret := CoParametrosRequests.Create;

  //Dados Proxy
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
  if (Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '') then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
    req.DadosProxy.UsaProxy := False;

  //Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;

  try
    try
      ret := req.justificativasDaj;

      if (ret.Retorno.CodigoRetorno = 200) then
        Result := ret.RetornoXml
      else
      begin
        Application.MessageBox(Pchar('Não foi possível carregar os códigos da justificativa: ' + ret.Retorno.MsgErro), 'Justificar Daje', Mb_IconInformation);
        Result := '';
      end
    except
      on E : Exception do
      begin
        Application.MessageBox(Pchar(E.ClassName + ' erro com mensagem ' + E.Message), 'Justificar Daje', Mb_IconInformation);
        Result := '';
      end;
    end;
  finally
    req := nil;
    ret := nil;
  end;
end;


function JustificarDaje(_CodigoEmissor, _SerieDaje, _NumeroDaje, _QtdeDaje : integer) : boolean;
var
  req, ret : DajRequests;
begin
  Result := False;

  req := CoDajRequests.Create;
  ret := CoDajRequests.Create;

  //Dados do Cartório
  req.DadosDaje.CodigoEmissor       := _CodigoEmissor;
  req.DadosDaje.NumeroSequencial    := _NumeroDaje;
  req.DadosDaje.Serie := _SerieDaje;
  req.DadosDaje.CodigoJustificativa := _QtdeDaje;

  //Dados Proxy
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('select * from configur');
  Dm.Configur.Open;
  if (Trim(Dm.Configur.FieldByName('servidor_proxy').asString) <> '') then
  begin
    req.DadosProxy.UsaProxy := True;
    req.DadosProxy.Servidor := Trim(Dm.Configur.FieldByName('servidor_proxy').asString);
    req.DadosProxy.Porta    := StrToInt(Trim(Dm.Configur.FieldByName('porta_proxy').asString));
    req.DadosProxy.Usuario  := Trim(Dm.Configur.FieldByName('usuario_proxy').asString);
    req.DadosProxy.Senha    := Trim(Dm.Configur.FieldByName('senha_proxy').asString);
  end
  else
    req.DadosProxy.UsaProxy := False;

  //Dados WebService
  req.DadosUser.LoginClient := StrToInt(Dm.Configur.FieldByName('loginclient').asString);
  req.DadosUser.SenhaClient := Dm.Configur.FieldByName('senhaclient').asString;

  try
    try
      ret := req.JustificaDaj;

      if (ret.Retorno.CodigoRetorno = 200) then
      begin
        Application.MessageBox('Daje justificado com sucesso!', 'Justificar Daje', Mb_IconInformation);
        Result := True;
        Exit;
      end
      else
      begin
        Application.MessageBox(Pchar('Não foi possível justificar o Daje: ' + ret.Retorno.MsgErro), 'Justificar Daje', Mb_IconInformation);
        Result := False;
      end
    except
      on E : Exception do
      begin
        Application.MessageBox(Pchar(E.ClassName + ' erro com mensagem ' + E.Message), 'Justificar Daje', Mb_IconInformation);
        Result := False;
      end;
    end;
  finally
    req := nil;
    ret := nil;
  end;
end;



end.
