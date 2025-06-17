unit ReemiC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Printers, RDprint, jpeg, ComCtrls,
  RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave;

type
  TF_ReemiC = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ControlBar1: TControlBar;
    Label36: TLabel;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    RichEdit4: TRichEdit;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection2: TRvDataSetConnection;
    RvProject2: TRvProject;
    RvSystem2: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ReemiC: TF_ReemiC;

implementation

uses DMTD, Func, Menu, FuncGeral, ProcGeral, RecepR;

{$R *.DFM}

procedure TF_ReemiC.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_ReemiC.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit1.setfocus;
end;

procedure TF_ReemiC.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
  if key = 27 then close;
end;

procedure TF_ReemiC.BitBtn1Click(Sender: TObject);
var
  sdaje,
  ndaje: String;
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    ShowMessage('Número do Protocolo Auxiliar Inválido !');
    MaskEdit1.SetFocus;
    Exit;
  end;

  F_ReemiC.RichEdit1.Clear;
  F_ReemiC.RichEdit2.Clear;
  F_ReemiC.RichEdit3.Clear;
  F_ReemiC.RichEdit4.Clear;

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM certidao');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('nr_protoc = ' + QuotedStr(MaskEdit1.Text));
  Dm.ArqAux.Open;

  if (Dm.ArqAux.RecordCount = 0) then
  begin
    ShowMessage('Recibo não localizado.');
    Exit;
    MaskEdit1.SetFocus;
  end;

  if (F_Menu.laser2.caption = '1') then
  begin
    Dm.ArqAux2.Close;
    Dm.ArqAux2.Sql.Clear;
    Dm.ArqAux2.Sql.Add('SELECT * FROM td_pedid');
    Dm.ArqAux2.Sql.Add('WHERE');
    Dm.ArqAux2.Sql.Add('p_auxiliar = ' + QuotedStr(MaskEdit1.Text) + ' AND tipo_prot = "C"');
    Dm.ArqAux2.Open;
    DM.ArqAux2.FindFirst;

    while not DM.ArqAux2.Eof do
    begin
      F_ReemiC.RichEdit1.Lines.Add(DM.ArqAux2.fieldbyname('tabela').AsString + '.' + DM.ArqAux2.fieldbyname('item').AsString + ' ' + DM.ArqAux2.fieldbyname('subitem').AsString);
      F_ReemiC.RichEdit2.Lines.Add(DM.ArqAux2.fieldbyname('descricao').AsString);
      F_ReemiC.RichEdit3.Lines.Add(DM.ArqAux2.fieldbyname('qtde').AsString + ' x');
      F_ReemiC.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.fieldbyname('valor_calc').AsCurrency));
      DM.ArqAux2.Next;
    end;

    RvDataSetConnection2.DataSet := DM.ArqAux;
    If F_Menu.Label39.Caption = '34377622000155' Then
    Begin
      Dm.qryGenerico.Close;
      Dm.qryGenerico.Sql.Clear;
      Dm.qryGenerico.Sql.Add('select emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
      Dm.qryGenerico.ParamByName('serie_daje').AsString:=  sdaje;
      Dm.qryGenerico.ParamByName('numero_daje').AsString:= ndaje;
      Dm.qryGenerico.Open;

      RvProject3.SetParam('nome_cart', F_Menu.Label29.Caption);
      RvProject3.SetParam('cnpj_cart', F_Menu.Label39.Caption);
      RvProject3.SetParam('end_cart',  F_Menu.Label11.Caption);
      RvProject3.SetParam('fone_cart',  F_Menu.Label12.Caption);
      RvProject3.SetParam('usuario',    F_Menu.Label25.Caption);
      RvProject3.SetParam('doc_usu',    F_Menu.Label38.Caption);
      RvProject3.SetParam('Descricao',  Copy(DM.ArqAux.fieldbyname('tabela').AsString,1,3));
      RvProject3.SetParam('Descricao2', retornaDescritacaoTabCus(Copy(DM.ArqAux.fieldbyname('tabela').AsString,1,1), Copy(DM.ArqAux.fieldbyname('tabela').AsString, 3, 1)));
      RvProject3.SetParam('Descricao3', '1');
      RvProject3.SetParam('Descricao4', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
      RvProject3.SetParam('email',  Dm.ArqAux.FieldByName('email_apresentante').AsString);
      RvProject3.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumento').AsCurrency));
      RvProject3.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('tribunal').AsCurrency));
      RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
      RvProject3.SetParam('emol_tit2', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('vr_daje').AsCurrency - DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
      RvProject3.SetParam('fetj_tit2', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
      RvProject3.SetParam('daje',        Strzero(sdaje, 3) + Strzero(ndaje, 6));
      //RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency + DM.qryGenerico.fieldbyname('vr_daje').AsCurrency));
      RvProject3.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
      Begin
        RvProject3.SetParam('daje',    Strzero(sdaje, 3)+ndaje);
      End;

      RvProject3.SetParam('sistema',  'Titulos e Documentos');
      RvProject3.ExecuteReport('report1');  //RECIBO TITULOS
    End
    Else
    If cert_vias > 1 then
    Begin
      RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
      RvProject1.SetParam('cnpj_cart', F_Menu.Label39.Caption);
      RvProject1.SetParam('end_cart',  F_Menu.Label11.Caption);
      RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
      RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
      RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
      RvProject1.SetParam('telefone', DM.ArqAux.fieldbyname('telefone').AsString);
{      RvProject1.SetParam('Descricao',  F_ReemiC.RichEdit1.Text);
      RvProject1.SetParam('Descricao2', F_ReemiC.RichEdit2.Text);
      RvProject1.SetParam('Descricao3', F_ReemiC.RichEdit3.Text);
      RvProject1.SetParam('Descricao4', F_ReemiC.RichEdit4.Text);


      RvProject1.SetParam('emol_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency));
      RvProject1.SetParam('fetj_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('tribunal').AsCurrency));
      RvProject1.SetParam('fund_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('defensoria').AsCurrency));
      RvProject1.SetParam('funp_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('procuradoria').AsCurrency));

      RvProject1.SetParam('tota_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('tribunal').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('defensoria').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('procuradoria').AsCurrency));  }

        RvProject1.SetParam('Descricao',  DM.ArqAux.fieldbyname('tabela').AsString);
        RvProject1.SetParam('Descricao2', copy(DM.ArqAux.fieldbyname('ext_nat').AsString, 7, 20));
        RvProject1.SetParam('Descricao3', '1');

        if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then
          RvProject2.SetParam('DataDeEntrega', 'Entrega: ' +DM.ArqAux.fieldbyname('data_entr').AsString);

        RvProject1.SetParam('Descricao4', formatcurr('###,###,#0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
        RvProject1.SetParam('emol_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumento').AsCurrency));
        RvProject1.SetParam('fetj_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('tribunal').AsCurrency));
        RvProject1.SetParam('tota_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));

      RvProject1.ExecuteReport('report1');
    End
    Else
    Begin
      RvProject2.SetParam('nome_cart', F_Menu.Label29.Caption);
      RvProject2.SetParam('cnpj_cart', F_Menu.Label39.Caption);
      RvProject2.SetParam('end_cart',  F_Menu.Label11.Caption);
      RvProject2.SetParam('fone_cart',  F_Menu.Label12.Caption);
      RvProject2.SetParam('usuario',    F_Menu.Label25.Caption);
      RvProject2.SetParam('doc_usu',    F_Menu.Label38.Caption);
      RvProject2.SetParam('telefone', DM.ArqAux.fieldbyname('telefone').AsString);

      if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then //1 RTD
        RvProject2.SetParam('DataDeEntrega', 'Entrega: ' +DM.ArqAux.fieldbyname('data_entr').AsString);

{      RvProject2.SetParam('Descricao',  F_ReemiC.RichEdit1.Text);
      RvProject2.SetParam('Descricao2', F_ReemiC.RichEdit2.Text);
      RvProject2.SetParam('Descricao3', F_ReemiC.RichEdit3.Text);
      RvProject2.SetParam('Descricao4', F_ReemiC.RichEdit4.Text);


      RvProject2.SetParam('emol_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency));
      RvProject2.SetParam('fetj_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('tribunal').AsCurrency));
      RvProject2.SetParam('fund_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('defensoria').AsCurrency));
      RvProject2.SetParam('funp_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('procuradoria').AsCurrency));

      RvProject2.SetParam('tota_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('tribunal').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('defensoria').AsCurrency +
                                                                   DM.ArqAux.fieldbyname('procuradoria').AsCurrency));}

      RvProject2.SetParam('Descricao',  DM.ArqAux.fieldbyname('tabela').AsString);
      RvProject2.SetParam('Descricao2', copy(DM.ArqAux.fieldbyname('ext_nat').AsString, 7, 20));
      RvProject2.SetParam('Descricao3', '1');
      RvProject2.SetParam('Descricao4', formatcurr('###,###,#0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));
      RvProject2.SetParam('emol_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumento').AsCurrency));
      RvProject2.SetParam('fetj_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('tribunal').AsCurrency));
      RvProject2.SetParam('tota_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('custas').AsCurrency));

      RvProject2.ExecuteReport('report1');
    End;
  end
  else
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT nr_protoc, movimento, apresentan, telefone, propriet, natureza,');
    Dm.ArqAux.Sql.Add('data_entr, imovel1, imovel2, imovel3, descricao, deposito,');
    dm.ArqAux.sql.add('v_emolumento, v_busca, v_desarquivamento, v_informatica,');
    dm.ArqAux.sql.add('v_subtotal, tribunal, defensoria, procuradoria, custas');
    Dm.ArqAux.Sql.Add('FROM certidao');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('nr_protoc = ' + MaskEdit1.Text);
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount <> 0) then
    begin
      if F_Menu.laser.caption = '1' then
      Begin
       if (F_Menu.Label24.Caption = 'T') then
       begin
         ReciboCertidao(Funcoes, True,
                                Dm.ArqAux.FieldByName('movimento').asString,
                                StrZero(Dm.ArqAux.FieldByName('nr_protoc').asString, 6),
                                Dm.ArqAux.FieldByName('apresentan').asString,
                                Dm.ArqAux.FieldByName('propriet').asString,
                                Dm.ArqAux.FieldByName('telefone').asString,
                                Ver_NatCer(Dm.ArqAux.FieldByName('natureza').asString, False),
                                Dm.ArqAux.FieldByName('data_entr').asString,
                                TimeToStr(Time),
                                Dm.ArqAux.FieldByName('descricao').asString,
                                Dm.ArqAux.FieldByName('imovel2').asString,
                                Dm.ArqAux.FieldByName('imovel3').asString,
                                Dm.ArqAux.FieldByName('deposito').asCurrency);
       end
       else
       begin
         ReciboCertidao(Funcoes, False,
                                Dm.ArqAux.FieldByName('movimento').asString,
                                StrZero(Dm.ArqAux.FieldByName('nr_protoc').asString, 6),
                                Dm.ArqAux.FieldByName('apresentan').asString,
                                Dm.ArqAux.FieldByName('propriet').asString,
                                Dm.ArqAux.FieldByName('telefone').asString,
                                Ver_NatCer(Dm.ArqAux.FieldByName('natureza').asString, False),
                                Dm.ArqAux.FieldByName('data_entr').asString,
                                TimeToStr(Time),
                                Dm.ArqAux.FieldByName('descricao').asString,
                                Dm.ArqAux.FieldByName('imovel2').asString,
                                Dm.ArqAux.FieldByName('imovel3').asString,
                                Dm.ArqAux.FieldByName('deposito').asCurrency);
       end;
      end
      else
      Begin
       if (F_Menu.Label24.Caption = 'T') then
       begin
         Funcoes.ReciboCertidao(Funcoes, True,
                                Dm.ArqAux.FieldByName('movimento').asString,
                                StrZero(Dm.ArqAux.FieldByName('nr_protoc').asString, 6),
                                Dm.ArqAux.FieldByName('apresentan').asString,
                                Dm.ArqAux.FieldByName('propriet').asString,
                                Dm.ArqAux.FieldByName('telefone').asString,
                                Ver_NatCer(Dm.ArqAux.FieldByName('natureza').asString, False),
                                Dm.ArqAux.FieldByName('data_entr').asString,
                                TimeToStr(Time),
                                Dm.ArqAux.FieldByName('imovel1').asString,
                                Dm.ArqAux.FieldByName('imovel2').asString,
                                Dm.ArqAux.FieldByName('imovel3').asString,
                                Dm.ArqAux.FieldByName('deposito').asCurrency,
                                Dm.ArqAux.FieldByName('v_emolumento').AsCurrency,
                                Dm.ArqAux.FieldByName('v_busca').AsCurrency,
                                Dm.ArqAux.FieldByName('v_desarquivamento').AsCurrency,
                                Dm.ArqAux.FieldByName('v_informatica').AsCurrency,
                                Dm.ArqAux.FieldByName('v_subtotal').AsCurrency,
                                Dm.ArqAux.FieldByName('tribunal').AsCurrency,
                                Dm.ArqAux.FieldByName('defensoria').AsCurrency,
                                Dm.ArqAux.FieldByName('procuradoria').AsCurrency,
                                Dm.ArqAux.FieldByName('custas').AsCurrency);
       end
       else
       begin
         Funcoes.ReciboCertidao(Funcoes, False,
                                Dm.ArqAux.FieldByName('movimento').asString,
                                StrZero(Dm.ArqAux.FieldByName('nr_protoc').asString, 6),
                                Dm.ArqAux.FieldByName('apresentan').asString,
                                Dm.ArqAux.FieldByName('propriet').asString,
                                Dm.ArqAux.FieldByName('telefone').asString,
                                Ver_NatCer(Dm.ArqAux.FieldByName('natureza').asString, False),
                                Dm.ArqAux.FieldByName('data_entr').asString,
                                TimeToStr(Time),
                                Dm.ArqAux.FieldByName('imovel1').asString,
                                Dm.ArqAux.FieldByName('imovel2').asString,
                                Dm.ArqAux.FieldByName('imovel3').asString,
                                Dm.ArqAux.FieldByName('deposito').asCurrency,
                                Dm.ArqAux.FieldByName('v_emolumento').AsCurrency,
                                Dm.ArqAux.FieldByName('v_busca').AsCurrency,
                                Dm.ArqAux.FieldByName('v_desarquivamento').AsCurrency,
                                Dm.ArqAux.FieldByName('v_informatica').AsCurrency,
                                Dm.ArqAux.FieldByName('v_subtotal').AsCurrency,
                                Dm.ArqAux.FieldByName('tribunal').AsCurrency,
                                Dm.ArqAux.FieldByName('defensoria').AsCurrency,
                                Dm.ArqAux.FieldByName('procuradoria').AsCurrency,
                                Dm.ArqAux.FieldByName('custas').AsCurrency);
       end;
      end;
    end;
  end;  
  Dm.ArqAux.Close;
  BitBtn3.SetFocus;
end;

procedure TF_ReemiC.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

procedure TF_ReemiC.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

end.
