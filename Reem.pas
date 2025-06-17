unit Reem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Printers, RDprint, jpeg, RpBase,
  RpSystem, RpRave, RpDefine, RpCon, RpConDS, ComCtrls;

type
  TF_Reemi = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Bevel1: TBevel;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    PrintDialog1: TPrintDialog;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    RichEdit4: TRichEdit;
    RvProject2: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection2: TRvDataSetConnection;
    RvProject1: TRvProject;
    RvDataSetConnection1: TRvDataSetConnection;
    RvSystem2: TRvSystem;
    RvProject3: TRvProject;
    RvSystem3: TRvSystem;
    RvDataSetConnection3: TRvDataSetConnection;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Reemi: TF_Reemi;
  ndaje, sdaje, ndajevias, serie_dajeVias : String;
    
implementation

uses DMTD, Func, Menu, U_Autent, FuncGeral, ProcGeral, TRecep;

{$R *.DFM}

procedure TF_Reemi.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_Reemi.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  MaskEdit2.Text := '';
  maskedit2.setfocus;
end;

procedure TF_Reemi.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
  if key = 27 then close;
end;

procedure TF_Reemi.BitBtn1Click(Sender: TObject);
var
   impport, vez, tipo_parte : String;
   impporti, x : integer;
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    ShowMessage('Número do protocolo inválido !');
    MaskEdit1.SetFocus;
    Exit;
  end;

  F_Reemi.RichEdit1.Clear;
  F_Reemi.RichEdit2.Clear;
  F_Reemi.RichEdit3.Clear;
  F_Reemi.RichEdit4.Clear;


  Dm.ArqAux2.Close;
  Dm.ArqAux2.Sql.Clear;
  Dm.ArqAux2.Sql.Add('SELECT * FROM td');
  Dm.ArqAux2.Sql.Add(' WHERE p_auxiliar = ' + QuotedStr(MaskEdit1.Text));
  Dm.ArqAux2.Open;

  if (Dm.ArqAux2.RecordCount = 0) then
  begin
    ShowMessage('Protocolo não localizado.');
    Exit;
    MaskEdit1.SetFocus;
  end;

  tipo_parte := '';
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT situacao FROM td_pesso');
  Dm.ArqAux.Sql.Add(' WHERE p_auxiliar = ' + Dm.ArqAux2.fieldByname('p_auxiliar').AsString + ' AND nome = ' + QuotedStr(Dm.ArqAux2.fieldByname('a_nome').AsString));
  Dm.ArqAux.Open;
  If Dm.ArqAux.RecordCount <> 0 then
  Begin
    tipo_parte := Ver_Situacao(Dm.ArqAux.fieldByname('situacao').AsString,False)
  End;

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM td_pedid');
  Dm.ArqAux.Sql.Add(' WHERE p_auxiliar = ' + QuotedStr(MaskEdit1.Text));
  Dm.ArqAux.Open;
  DM.ArqAux.FindFirst;


  if F_menu.laser.caption = '1' then
  begin


    If F_Menu.Label39.Caption = '34377622000155' Then
    Begin

      ndajevias      := DM.ArqAux2.FieldByName('dajevias').asString;
      serie_dajeVias := DM.ArqAux2.FieldByName('serie_vias').asString;
      ndaje          := DM.ArqAux2.FieldByName('daje').asString;
      sdaje          := DM.ArqAux2.FieldByName('serie_daje').asString;

      If cert_vias > 1 then
      Begin

        Dm.qryGenerico.Close;
        Dm.qryGenerico.Sql.Clear;
        Dm.qryGenerico.Sql.Add('select emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
        Dm.qryGenerico.ParamByName('serie_daje').AsString:=  serie_dajeVias;
        Dm.qryGenerico.ParamByName('numero_daje').AsString:= ndajevias;
        Dm.qryGenerico.Open;
        RvProject3.SetParam('recibo',  DM.ArqAux2.fieldbyname('recibo').AsString);
        RvProject3.SetParam('nome_cart', F_Menu.Label29.Caption);
        RvProject3.SetParam('cnpj_cart', F_Menu.Label39.Caption);
        RvProject3.SetParam('end_cart',  F_Menu.Label11.Caption);
        RvProject3.SetParam('fone_cart',  F_Menu.Label12.Caption);
        RvProject3.SetParam('usuario',    F_Menu.Label25.Caption);
        RvProject3.SetParam('doc_usu',    F_Menu.Label38.Caption);
        RvProject3.SetParam('Descricao',  DM.ArqAux2.fieldbyname('tabela').AsString);
        RvProject3.SetParam('Descricao2', DM.ArqAux2.fieldbyname('ext_nat').AsString);
        RvProject3.SetParam('Descricao3', '1');
        RvProject3.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('custas').AsCurrency));
        RvProject2.SetParam('situacao',  tipo_parte);
        RvProject3.SetParam('email',  DM.ArqAux2.fieldbyname('email_apresentante').AsString);
        RvProject3.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('v_emolumentos').AsCurrency));
        RvProject3.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('v_tribunal').AsCurrency));
        RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('custas').AsCurrency));

        RvProject3.SetParam('emol_tit2', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency - DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
        RvProject3.SetParam('fetj_tit2', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));

        if (serie_dajeVias <> '') and (ndajevias <> '') Then
        Begin
          RvProject3.SetParam('daje',        Strzero(sdaje, 3) + Strzero(ndaje, 6));
          RvProject3.SetParam('daje_new',    Strzero(serie_dajeVias, 3)+ Strzero(ndajevias, 6));

          RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('custas').AsCurrency));
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

        Dm.qryGenerico.Close;
        Dm.qryGenerico.Sql.Clear;
        Dm.qryGenerico.Sql.Add('select emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
        Dm.qryGenerico.ParamByName('serie_daje').AsString:=  serie_dajeVias;
        Dm.qryGenerico.ParamByName('numero_daje').AsString:= ndajevias;
        Dm.qryGenerico.Open;
        RvProject3.SetParam('recibo',  DM.ArqAux2.fieldbyname('recibo').AsString);
        RvProject3.SetParam('nome_cart', F_Menu.Label29.Caption);
        RvProject3.SetParam('cnpj_cart', F_Menu.Label39.Caption);
        RvProject3.SetParam('end_cart',  F_Menu.Label11.Caption);
        RvProject3.SetParam('fone_cart',  F_Menu.Label12.Caption);
        RvProject3.SetParam('usuario',    F_Menu.Label25.Caption);
        RvProject3.SetParam('doc_usu',    F_Menu.Label38.Caption);
        RvProject3.SetParam('situacao',  tipo_parte);
        RvProject3.SetParam('Descricao',  DM.ArqAux2.fieldbyname('tabela').AsString);
        RvProject3.SetParam('Descricao2', DM.ArqAux2.fieldbyname('ext_nat').AsString);
        RvProject3.SetParam('Descricao3', '1');
        RvProject3.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('custas').AsCurrency));
        RvProject2.SetParam('situacao',  tipo_parte);
        RvProject3.SetParam('email',  DM.ArqAux2.fieldbyname('email_apresentante').AsString);
        RvProject3.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('v_emolumentos').AsCurrency));
        RvProject3.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('v_tribunal').AsCurrency));
        RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('custas').AsCurrency));

        RvProject3.SetParam('emol_tit2', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency - DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
        RvProject3.SetParam('fetj_tit2', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));

        if (serie_dajeVias <> '') and (ndajevias <> '') Then
        Begin
          RvProject3.SetParam('daje',        Strzero(sdaje, 3) + ndaje);
          RvProject3.SetParam('daje_new',    Strzero(serie_dajeVias, 3) + Strzero(ndajevias, 6));
          //RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency - DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
          RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('custas').AsCurrency));
        End
        Else
        Begin
          RvProject3.SetParam('daje',    Strzero(sdaje, 3)+ndaje);
        End;
        RvProject3.SetParam('sistema',  'Titulos e Documentos');
        RvProject3.Execute;  //RECIBO TITULOS
      End;

      Exit;
    End;


    if (F_Menu.Label24.Caption = 'T') then
    begin
      if (DM.Config_Adm.FieldByName('chk_08').AsBoolean) then
      begin
        while not DM.ArqAux.Eof do
        begin
          F_Reemi.RichEdit1.Lines.Add(DM.ArqAux.fieldbyname('tabela').AsString + '.' + DM.ArqAux.fieldbyname('item').AsString + ' ' + DM.ArqAux.fieldbyname('subitem').AsString);
          F_Reemi.RichEdit2.Lines.Add(DM.ArqAux.fieldbyname('descricao').AsString);
          F_Reemi.RichEdit3.Lines.Add(DM.ArqAux.fieldbyname('qtde').AsString + ' x');
          F_Reemi.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux.fieldbyname('valor_calc').AsCurrency));
          DM.ArqAux.Next;
        end;

        RvDataSetConnection2.DataSet := DM.ArqAux2;

        If cert_vias > 1 then
        Begin
          RvProject2.SetParam('nome_cart',  F_Menu.Label29.Caption);
          RvProject2.SetParam('cnpj_cart',  F_Menu.Label39.Caption);
          RvProject2.SetParam('end_cart',   F_Menu.Label11.Caption);
          RvProject2.SetParam('fone_cart',  F_Menu.Label12.Caption);
          RvProject2.SetParam('usuario',    F_Menu.Label25.Caption);
          RvProject2.SetParam('doc_usu',    F_Menu.Label38.Caption);
          RvProject2.SetParam('Descricao',  DM.ArqAux2.fieldbyname('tabela').AsString);
          RvProject2.SetParam('Descricao2', DM.ArqAux2.fieldbyname('ext_nat').AsString);
          RvProject2.SetParam('Descricao3', '1');
          RvProject2.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('custas').AsCurrency));
          RvProject2.SetParam('situacao',  tipo_parte);


          RvProject2.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('v_emolumentos').AsCurrency));
          RvProject2.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('v_tribunal').AsCurrency));
          RvProject2.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('custas').AsCurrency));

          RvProject2.ExecuteReport('report2');  //RECIBO TITULOS
        End
        Else
        Begin
          RvProject1.SetParam('nome_cart',  F_Menu.Label29.Caption);
          RvProject1.SetParam('cnpj_cart',  F_Menu.Label39.Caption);
          RvProject1.SetParam('end_cart',   F_Menu.Label11.Caption);
          RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
          RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
          RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
          RvProject1.SetParam('Descricao',  DM.ArqAux2.fieldbyname('tabela').AsString);
          RvProject1.SetParam('Descricao2', DM.ArqAux2.fieldbyname('ext_nat').AsString);
          RvProject1.SetParam('Descricao3', '1');
          RvProject1.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('custas').AsCurrency));

          RvProject1.SetParam('situacao',  tipo_parte);


          RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('v_emolumentos').AsCurrency));
          RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('v_tribunal').AsCurrency));
          RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux2.fieldbyname('custas').AsCurrency));

          RvProject1.ExecuteReport('report2');  //RECIBO TITULOS
        End;
      end;

      if not (DM.Config_Adm.FieldByName('chk_08').AsBoolean) then
      begin
        if (DM.Configur.FieldByName('chk_11').AsBoolean) then
        begin
          Dm.ArqAux2.Close;
          Dm.ArqAux2.Sql.Clear;
          Dm.ArqAux2.Sql.Add('SELECT * FROM td');
          Dm.ArqAux2.Sql.Add('WHERE');
          Dm.ArqAux2.Sql.Add('recibo = ' + QuotedStr(MaskEdit1.Text));
          Dm.ArqAux2.Open;

          RvDataSetConnection2.DataSet := DM.ArqAux2;

          if (DM.ArqAux2.FieldByName('v_emolumentos').AsCurrency <> 0) then
          begin
            F_Reemi.RichEdit1.Lines.Add('10.1');
            F_Reemi.RichEdit2.Lines.Add('REGISTRO, ARQUIVAMENTO DE CONTRATO, AVERBAÇÃO...');
            F_Reemi.RichEdit3.Lines.Add('1  x');
            F_Reemi.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.FieldByName('v_emolumentos').AsCurrency));
          end;

          if (DM.ArqAux2.FieldByName('v_emoladicional').AsCurrency <> 0) then
          begin
            F_Reemi.RichEdit1.Lines.Add('10.1');
            F_Reemi.RichEdit2.Lines.Add('EMOLUMENTO ADICIONAL (UFIR)');
            F_Reemi.RichEdit3.Lines.Add('1  x');
            F_Reemi.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.FieldByName('v_emoladicional').AsCurrency));
          end;

          If (DM.ArqAux2.FieldByName('v_not_pd').AsCurrency <> 0) then
          begin
            F_Reemi.RichEdit1.Lines.Add('10.2.1');
            F_Reemi.RichEdit2.Lines.Add('PRIMEIRA PÁGINA');
            F_Reemi.RichEdit3.Lines.Add('1  x');
            F_Reemi.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.FieldByName('v_not_pd').AsCurrency));
          end;

          If (DM.ArqAux2.FieldByName('v_pag').AsCurrency <> 0) then
          begin
            F_Reemi.RichEdit1.Lines.Add('3.11');
            F_Reemi.RichEdit2.Lines.Add('POR FOLHA EXCEDENTE A UMA');
            F_Reemi.RichEdit3.Lines.Add(DM.ArqAux2.fieldbyname('pag_adc').AsString + ' x');
            F_Reemi.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.fieldbyname('vr_pag').asCurrency));
          end;

          If (DM.ArqAux2.FieldByName('v_informatica').AsCurrency <> 0) then
          begin
            F_Reemi.RichEdit1.Lines.Add('1.9');
            F_Reemi.RichEdit2.Lines.Add('INFORMÁTICA DO ATO/DOI/GUIA/GUIA DE DISTRIBUIÇÃO');
            F_Reemi.RichEdit3.Lines.Add('1  x');
            F_Reemi.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.FieldByName('v_informatica').AsCurrency));
          end;

          If (DM.ArqAux2.FieldByName('v_graveletr').AsCurrency <> 0) then
          begin
            F_Reemi.RichEdit1.Lines.Add('1.10');
            F_Reemi.RichEdit2.Lines.Add('GRAVAÇÃO ELETRÔNICA');
            F_Reemi.RichEdit3.Lines.Add('1  x');
            F_Reemi.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.FieldByName('v_graveletr').AsCurrency));
          end;

          If (DM.ArqAux2.FieldByName('v_conferencia').AsCurrency <> 0) then
          begin
            F_Reemi.RichEdit1.Lines.Add('1.5');
            F_Reemi.RichEdit2.Lines.Add('CONFERÊNCIA DE CÓPIA OU REPRODUÇÃO, POR PÁGINA');
            F_Reemi.RichEdit3.Lines.Add('2  x');
            F_Reemi.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.FieldByName('v_conferencia').AsCurrency));
          end;

          If (DM.ArqAux2.FieldByName('v_digitalizacao').AsCurrency <> 0) then
          begin
            F_Reemi.RichEdit1.Lines.Add('1.8');
            F_Reemi.RichEdit2.Lines.Add('DIGITALIZAÇÃO');
            F_Reemi.RichEdit3.Lines.Add('1  x');
            F_Reemi.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.FieldByName('v_digitalizacao').AsCurrency));
          end;

          If (DM.ArqAux2.FieldByName('v_mic').AsCurrency <> 0) then
          begin
            F_Reemi.RichEdit1.Lines.Add('1.7');
            F_Reemi.RichEdit2.Lines.Add('MICROFILMAGEM');
            F_Reemi.RichEdit3.Lines.Add('1  x');
            F_Reemi.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.FieldByName('v_mic').AsCurrency));
          end;

          If (DM.ArqAux2.FieldByName('v_guia').AsCurrency <> 0) then
          begin
            F_Reemi.RichEdit1.Lines.Add('1.6');
            F_Reemi.RichEdit2.Lines.Add('EXPEDIÇÃO E EMISSÃO DE GUIAS E COMUNICAÇÕES');
            F_Reemi.RichEdit3.Lines.Add('1  x');
            F_Reemi.RichEdit4.Lines.Add(FormatCurr('###,##0.00', (DM.ArqAux2.FieldByName('v_guia').AsCurrency + DM.ArqAux2.FieldByName('v_guia_info').AsCurrency)));
          end;


          RvProject2.SetParam('nome_cart',  F_Menu.Label29.Caption);
          RvProject2.SetParam('cnpj_cart',  F_Menu.Label39.Caption);
          RvProject2.SetParam('end_cart',   F_Menu.Label11.Caption);
          RvProject2.SetParam('fone_cart',  F_Menu.Label12.Caption);
          RvProject2.SetParam('usuario',    F_Menu.Label25.Caption);
          RvProject2.SetParam('doc_usu',    F_Menu.Label38.Caption);
          RvProject2.SetParam('Descricao',  F_Reemi.RichEdit1.Text);
          RvProject2.SetParam('Descricao2', F_Reemi.RichEdit2.Text);
          RvProject2.SetParam('Descricao3', F_Reemi.RichEdit3.Text);
          RvProject2.SetParam('Descricao4', F_Reemi.RichEdit4.Text);
          RvProject2.SetParam('emol_tit',   FormatCurr('###,###,##0.00', dm.ArqAux2.fieldbyname('v_subtotal').AsCurrency));
          RvProject2.SetParam('fetj_tit',   FormatCurr('###,###,##0.00', dm.ArqAux2.fieldbyname('v_tribunal').AsCurrency));
          RvProject2.SetParam('fund_tit',   FormatCurr('###,###,##0.00', dm.ArqAux2.fieldbyname('v_procuradoria').AsCurrency));
          RvProject2.SetParam('funp_tit',   FormatCurr('###,###,##0.00', dm.ArqAux2.fieldbyname('v_defensoria').AsCurrency));
          RvProject2.SetParam('tota_tit',   FormatCurr('###,###,##0.00', dm.ArqAux2.fieldbyname('v_total').AsCurrency));
          RvProject2.SetParam('nome_exc',   FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_nome').AsCurrency +
                                                                         DM.ArqAux.fieldbyname('v_distrib').AsCurrency +
                                                                         DM.ArqAux.fieldbyname('v_leis_dist').AsCurrency));
          RvProject2.ExecuteReport('report2');
        end;
      end;
    end
    else
    begin
      ReciboRec(Funcoes, True, Dm.ArqAux2.FieldByName('data_r').asString,
                          Dm.ArqAux2.FieldByName('p_auxiliar').asString,
                          Dm.ArqAux2.FieldByName('contato').asString,
                          Dm.ArqAux2.FieldByName('a_telefone').asString,
                          Ver_Natureza(Dm.ArqAux2.FieldByName('natureza').asString, False),
                          Dm.ArqAux2.FieldByName('data_entr').asString,
                          Dm.arqAux2.FieldByName('hora_p').asString,
                          Dm.ArqAux2.FieldByName('a_nome').asString,
                          Autentica(Dm.ArqAux2.FieldByName('p_auxiliar').asString,
                                    Dm.ArqAux2.FieldByName('data_r').asString,
                                    StrAsterisco(Trim(StrCurr(Dm.ArqAux2.FieldByName('deposito').asCurrency, 14, True)), 14),
                                    'TDR C', False),
                          Dm.ArqAux2.FieldByName('deposito').asCurrency,
                          Dm.ArqAux2.FieldByName('custas').asCurrency,
                          Dm.ArqAux2.FieldByName('v_emolumentos').asCurrency,
                          Dm.ArqAux2.FieldByName('v_emoladicional').asCurrency,
                          Dm.ArqAux2.FieldByName('v_pag').asCurrency,
                          Dm.ArqAux2.FieldByName('v_viaexc').asCurrency,
                          Dm.ArqAux2.FieldByName('v_mic').asCurrency,
                          Dm.ArqAux2.FieldByName('v_digitalizacao').asCurrency,
                          Dm.ArqAux2.FieldByName('v_informatica').asCurrency,
                          Dm.ArqAux2.FieldByName('v_graveletr').asCurrency,
                          Dm.ArqAux2.FieldByName('v_conferencia').asCurrency,
                          Dm.ArqAux2.FieldByName('v_distrib').asCurrency,
                          Dm.ArqAux2.FieldByName('v_infodistrib').asCurrency,
                          Dm.ArqAux2.FieldByName('v_graveletrdistrib').asCurrency,
                          Dm.ArqAux2.FieldByName('v_nome').asCurrency,
                          Dm.ArqAux2.FieldByName('v_tribunal').asCurrency,
                          Dm.ArqAux2.FieldByName('v_procuradoria').asCurrency,
                          Dm.ArqAux2.FieldByName('v_defensoria').asCurrency,
                          Dm.ArqAux2.FieldByName('v_mutua').asCurrency,
                          Dm.ArqAux2.FieldByName('v_acoterj').asCurrency,
                          Dm.ArqAux2.FieldByName('v_subtotal').asCurrency,
                          Dm.ArqAux2.FieldByName('v_total').asCurrency);

    end;
  end
  else
  begin
    if f_menu.matricial.Caption = '1' then
    begin
        Funcoes.ReciboTitulos(Funcoes, True, Dm.ArqAux2.FieldByName('data_r').asString,
                            Dm.ArqAux2.FieldByName('p_auxiliar').asString,
                            Dm.ArqAux2.FieldByName('contato').asString,
                            Dm.ArqAux2.FieldByName('a_telefone').asString,
                            Ver_Natureza(Dm.ArqAux2.FieldByName('natureza').asString, False),
                            Dm.ArqAux2.FieldByName('data_entr').asString,
                            Dm.arqAux2.FieldByName('hora_p').asString,
                            Dm.ArqAux2.FieldByName('a_nome').asString,
                            Autentica(Dm.ArqAux2.FieldByName('p_auxiliar').asString,
                                      Dm.ArqAux2.FieldByName('data_r').asString,
                                      StrAsterisco(Trim(StrCurr(Dm.ArqAux2.FieldByName('deposito').asCurrency, 14, True)), 14),
                                      'TDR C', False),
                            Dm.ArqAux2.FieldByName('deposito').asCurrency,
                            Dm.ArqAux2.FieldByName('v_emolumentos').asCurrency,
                            Dm.ArqAux2.FieldByName('v_emoladicional').asCurrency,
                            Dm.ArqAux2.FieldByName('v_pag').asCurrency,
                            Dm.ArqAux2.FieldByName('v_viaexc').asCurrency,
                            Dm.ArqAux2.FieldByName('v_mic').asCurrency,
                            Dm.ArqAux2.FieldByName('v_digitalizacao').asCurrency,
                            Dm.ArqAux2.FieldByName('v_informatica').asCurrency,
                            Dm.ArqAux2.FieldByName('v_graveletr').asCurrency,
                            Dm.ArqAux2.FieldByName('v_conferencia').asCurrency,
                            Dm.ArqAux2.FieldByName('v_distrib').asCurrency,
                            Dm.ArqAux2.FieldByName('v_infodistrib').asCurrency,
                            Dm.ArqAux2.FieldByName('v_graveletrdistrib').asCurrency,
                            Dm.ArqAux2.FieldByName('v_nome').asCurrency,
                            Dm.ArqAux2.FieldByName('v_tribunal').asCurrency,
                            Dm.ArqAux2.FieldByName('v_procuradoria').asCurrency,
                            Dm.ArqAux2.FieldByName('v_defensoria').asCurrency,
                            Dm.ArqAux2.FieldByName('v_mutua').asCurrency,
                            Dm.ArqAux2.FieldByName('v_acoterj').asCurrency,
                            Dm.ArqAux2.FieldByName('v_subtotal').asCurrency,
                            Dm.ArqAux2.FieldByName('v_total').asCurrency);
    End
    Else
    Begin
        Application.CreateForm(TF_TelaRecep, F_TelaRecep);
        F_TelaRecep.Label1.Caption := 'Gerar impressão quantas vezes ?';
        F_TelaRecep.ShowModal;
        vez := F_TelaRecep.MaskEdit1.Text;
        F_TelaRecep.Destroy;
        F_TelaRecep := NIL;

        impport := Bematech_porta;

        for x := 1 to strtoint(vez) do
        begin
          ReciboRecBem(Funcoes, True, Dm.ArqAux2.FieldByName('data_r').asString,
                              Dm.ArqAux2.FieldByName('p_auxiliar').asString,
                              Dm.ArqAux2.FieldByName('recibo').asString,
                              Dm.ArqAux2.FieldByName('contato').asString,
                              Dm.ArqAux2.FieldByName('a_telefone').asString,
                              Ver_Natureza(Dm.ArqAux2.FieldByName('natureza').asString, False),
                              Dm.ArqAux2.FieldByName('data_entr').asString,
                              Dm.arqAux2.FieldByName('hora_p').asString,
                              Dm.ArqAux2.FieldByName('a_cpff').asString,
                              Autentica(Dm.ArqAux2.FieldByName('p_auxiliar').asString,
                                        Dm.ArqAux2.FieldByName('data_r').asString,
                                        StrAsterisco(Trim(StrCurr(Dm.ArqAux2.FieldByName('deposito').asCurrency, 14, True)), 14),
                                        'TDR C', False),
                              dm.ArqAux2.FieldByName('cartorio').Asstring,
                              dm.ArqAux2.FieldByName('tabela').Asstring,
                              dm.ArqAux2.FieldByName('qtde_nome').Asstring,
                              dm.ArqAux2.FieldByName('microfilme').Asstring,
                              dm.ArqAux2.FieldByName('pag_adic').Asstring,
                              dm.ArqAux2.FieldByName('vias_adc').Asstring,
                              impport,
                              Dm.ArqAux2.FieldByName('qtde_diligencia').AsString,
                              dm.arqaux2.FieldByname('identifica').asstring,
                              Dm.ArqAux2.FieldByName('deposito').asCurrency,
                              Dm.ArqAux2.FieldByName('custas').asCurrency,
                              Dm.ArqAux2.FieldByName('v_emolumentos').asCurrency,
                              Dm.ArqAux2.FieldByName('v_emoladicional').asCurrency,
                              Dm.ArqAux2.FieldByName('v_pag').asCurrency,
                              Dm.ArqAux2.FieldByName('v_viaexc').asCurrency,
                              Dm.ArqAux2.FieldByName('v_mic').asCurrency,
                              Dm.ArqAux2.FieldByName('v_digitalizacao').asCurrency,
                              dm.ArqAux2.FieldByName('v_not_pd').AsCurrency,
                              Dm.ArqAux2.FieldByName('v_informatica').asCurrency,
                              Dm.ArqAux2.FieldByName('v_graveletr').asCurrency,
                              Dm.ArqAux2.FieldByName('v_conferencia').asCurrency,
                              (Dm.ArqAux2.FieldByName('v_doi').asCurrency + Dm.ArqAux2.FieldByName('v_doi_info').asCurrency),
                              dm.arqaux2.FieldByName('v_procest').AsCurrency,
                              dm.arqaux2.FieldByName('v_leis_dist').AsCurrency,
                              Dm.ArqAux2.FieldByName('v_distrib').asCurrency+Dm.ArqAux2.FieldByName('v_nome').asCurrency+Dm.ArqAux2.FieldByName('v_infodistrib').asCurrency+dm.arqaux2.FieldByName('v_leis_dist').AsCurrency,
                              Dm.ArqAux2.FieldByName('v_infodistrib').asCurrency,
                              Dm.ArqAux2.FieldByName('v_graveletrdistrib').asCurrency,
                              Dm.ArqAux2.FieldByName('v_nome').asCurrency,
                              Dm.ArqAux2.FieldByName('v_tribunal').asCurrency,
                              Dm.ArqAux2.FieldByName('v_procuradoria').asCurrency,
                              Dm.ArqAux2.FieldByName('v_defensoria').asCurrency,
                              Dm.ArqAux2.FieldByName('v_mutua').asCurrency,
                              Dm.ArqAux2.FieldByName('v_acoterj').asCurrency,
                              Dm.ArqAux2.FieldByName('v_subtotal').asCurrency,
                              Dm.ArqAux2.FieldByName('v_total').asCurrency);
      End;
    End;
  end;
//  else
//  begin
//    ShowMessage('Recibo não localizado !');
//  end;
  Dm.ArqAux2.Close;
  BitBtn3.SetFocus;
end;

procedure TF_Reemi.FormActivate(Sender: TObject);
begin
  //Abrindo Configur
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;

  MaskEdit1.SetFocus;
end;

procedure TF_Reemi.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

procedure TF_Reemi.BitBtn4Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    ShowMessage('Número do Protocolo Auxiliar Inválido !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT p_auxiliar, data_r, deposito');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('p_auxiliar = ' + MaskEdit1.Text);
  dm.ArqAux.sql.add('cartorio = "' + MaskEdit2.Text + '"');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
      Autentica(Dm.ArqAux.FieldByName('p_auxiliar').asString,
                Dm.ArqAux.FieldByName('data_r').asString,
                StrAsterisco(Trim(StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True)), 14),
                'TDR C',
                True);
  end;
  Dm.ArqAux.Close;
end;

procedure TF_Reemi.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

end.
