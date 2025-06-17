unit RECR2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, DbTables, UnMath, StdCtrls, ComCtrls,  NcsAlignment,RichEdit;

type
  TQK_RecR2 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel16: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel24: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel_livro: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRImage1: TQRImage;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRImage4: TQRImage;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRImage5: TQRImage;
    QRShape4: TQRShape;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRRichText1: TQRRichText;
    RichEdit55: TRichEdit;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    tam_total, tam_restante, v_posicao : Integer;
    
    procedure Quebra_linha_no_QRMemo1(v_Str: String);
    procedure JustifyRichText(RichEdit :TRichEdit; AllText :Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QK_RecR2: TQK_RecR2;

  VrDaje_1, fmmpba_1, EmolDaje_1, TaxaFiscalDaje_1, FecomDaje_1, DefPublicaDaje_1 : currency;

  id : integer;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TQK_RecR2.JustifyRichText(RichEdit: TRichEdit; AllText: Boolean);
const
  TO_ADVANCEDTYPOGRAPHY = $1;
  EM_SETTYPOGRAPHYOPTIONS = (WM_USER + 202);
  EM_GETTYPOGRAPHYOPTIONS = (WM_USER + 203);
  var
    ParaFormat :TParaFormat;
    SelStart,
    SelLength :Integer;
    begin
      ParaFormat.cbSize := SizeOf(ParaFormat);
      if SendMessage(RichEdit.handle,
        EM_SETTYPOGRAPHYOPTIONS,
        TO_ADVANCEDTYPOGRAPHY,
        TO_ADVANCEDTYPOGRAPHY) = 1 then
      begin
        SelStart := RichEdit.SelStart;
        SelLength := RichEdit.SelLength;
        if AllText then
          RichEdit.SelectAll;
        ParaFormat.dwMask := PFM_ALIGNMENT;
        ParaFormat.wAlignment := PFA_JUSTIFY;
        SendMessage(RichEdit.handle, EM_SETPARAFORMAT, 0, LongInt(@ParaFormat));
        // Restaura seleção caso tenhamos mudado para All
        RichEdit.SelStart := SelStart;
        RichEdit.SelLength := SelLength;
      end;
end;

procedure TQK_RecR2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iddaje_tj: Integer; v_OBS,teste : String;
begin
  QrLabel35.Caption := '0,00';
  QRLabel47.Caption := '0,00';
  QrLabel27.Caption := '0,00';
  QRLabel29.Caption := '0,00';
  QRLabel52.Caption := '0,00';
  QRLabel54.Caption := '0,00';
  QRLabel58.Caption := '0,00';

  QrLabel10.Caption := '0,00';
  QrLabel11.Caption := '';
  QrLabel12.Caption := '';
  QrLabel25.Caption := '';
  QrLabel7.Caption  := '0,00';
  //QrLabel35.Caption := '0,00';
  QrLabel36.Caption := '0,00';
  QrLabel37.Caption := '0,00';
  QrLabel38.Caption := '0,00';
  QrLabel39.Caption := '0,00';
  QrLabel40.Caption := '0,00';
  QrLabel41.Caption := '0,00';
  QrLabel43.Caption := '0,00';
  QrLabel12.Enabled := False;


  //QrLabel16.Enabled := False;
  //QrLabel44.Caption := '';

  VrDaje_1          := 0;
  EmolDaje_1        := 0;
  TaxaFiscalDaje_1  := 0;
  FecomDaje_1       := 0;
  DefPublicaDaje_1  := 0;
  fmmpba_1          := 0;

  QRLabel4.caption := '';
  //if Dm.ArqAux.FieldByName('livro').asInteger > 0 then
  //  QRLabel4.caption := Dm.ArqAux.FieldByName('livro').asString;

  if (Dm.ArqAux.FieldByName('folha').asInteger > 0) then
  //Begin
    QRLabel30.Caption:= dm.arqaux.fieldbyname('folha').AsString;  
  //End
  //Else {Comentado }
  {Begin
    QRLabel30.Caption := '';
    QRLabel31.Caption := '';
    QRLabel4.Caption  := '';
    QRLabel64.Caption := 'CERTIFICO';
    QRLabel67.Left    := 470;
  End;}

  Dm.Join.Close;
  Dm.Join.SQL.Clear;
  Dm.Join.SQL.Add('select * from daje where');
  Dm.Join.SQL.Add('serie_daje      = ' + QuotedStr(Dm.ArqAux.FieldByName('serie_daje').asString));
  Dm.Join.SQL.Add('and numero_daje = ' + QuotedStr(Dm.ArqAux.FieldByName('daje').asString)+' and status <> '+QuotedStr('Isento')+'');
  Dm.Join.Open;

  dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('select serie_daje_complementar, numero_daje_complementar, emol_daje, tx_fisca_daje,iddaje_tj, fecom_daje, def_pub_daje, vr_declarado, vr_daje, vr_pge, fmmpba from daje ');
  dm.qryGenerico.SQL.Add('where serie_daje      = ' + QuotedStr(Dm.Join.FieldByName('serie_daje_complementar').asString));
  dm.qryGenerico.SQL.Add('and numero_daje = ' + QuotedStr(Dm.Join.FieldByName('numero_daje_complementar').asString) +' and status <> '+QuotedStr('Isento')+'');
  dm.qryGenerico.Open;


  iddaje_tj := Dm.qryGenerico.FieldByName('iddaje_tj').AsInteger;
  if (Dm.Join.RecordCount <> 0) then
  begin
    if (Dm.Join.FieldByName('emol_daje').AsCurrency = 0) then
    begin
      id                := Dm.Join.FieldByName('id').AsInteger;

      If (dm.qryGenerico.IsEmpty) Then
      Begin
        If (Dm.Join.FieldByName('emol_daje').AsCurrency = 0) Then
          VrDaje_1:= DM.ArqAux.FieldByName('custas').AsCurrency
        else
        VrDaje_1          := Dm.Join.FieldByName('vr_daje').AsCurrency;

        EmolDaje_1        := SimpleRoundTo(((VrDaje_1 * emol_daje)/100),    -2);
        TaxaFiscalDaje_1  := SimpleRoundTo(((VrDaje_1 * tx_fisc_daje)/100), -2);
        FecomDaje_1       := SimpleRoundTo(((VrDaje_1 * fecom_daje)/100),   -2);
        DefPublicaDaje_1  := SimpleRoundTo(((VrDaje_1 * def_pub_daje)/100), -2);
        fmmpba_1          := SimpleRoundTo(((VrDaje_1 * fmmpba)/100), -2);

        QrLabel35.Caption := 'R$ ' + (StrCurr(EmolDaje_1,       14, True));
        QRLabel47.Caption := 'R$ ' + (StrCurr(TaxaFiscalDaje_1, 14, True));
        QrLabel27.Caption := 'R$ ' + (StrCurr(FecomDaje_1,      14, True));
        QRLabel29.Caption := 'R$ ' + (StrCurr(DefPublicaDaje_1, 14, True));
        QRLabel52.Caption := 'R$ ' + (strcurr(VrDaje_1,         14, True));
        QRLabel58.Caption := 'R$ ' + (strcurr(fmmpba_1,         14, True));
      End
      Else
      Begin
        If (Dm.Join.FieldByName('emol_daje').AsCurrency = 0) Then
          VrDaje_1:= DM.ArqAux.FieldByName('custas').AsCurrency + dm.qryGenerico.FieldByName('emol_daje').AsCurrency
        else
        VrDaje_1          := Dm.Join.FieldByName('vr_daje').AsCurrency + dm.qryGenerico.FieldByName('vr_daje').AsCurrency;

        EmolDaje_1        := SimpleRoundTo(((VrDaje_1 * emol_daje)/100),    -2);
        TaxaFiscalDaje_1  := SimpleRoundTo(((VrDaje_1 * tx_fisc_daje)/100), -2);
        FecomDaje_1       := SimpleRoundTo(((VrDaje_1 * fecom_daje)/100),   -2);
        DefPublicaDaje_1  := SimpleRoundTo(((VrDaje_1 * def_pub_daje)/100), -2);
        fmmpba_1          := SimpleRoundTo(((VrDaje_1 * fmmpba)/100), -2);

        QrLabel35.Caption := 'R$ ' + (StrCurr(EmolDaje_1,       14, True));
        QRLabel47.Caption := 'R$ ' + (StrCurr(TaxaFiscalDaje_1, 14, True));
        QrLabel27.Caption := 'R$ ' + (StrCurr(FecomDaje_1,      14, True));
        QRLabel29.Caption := 'R$ ' + (StrCurr(DefPublicaDaje_1, 14, True));
        QRLabel52.Caption := 'R$ ' + (strcurr(VrDaje_1,         14, True));
        QRLabel58.Caption := 'R$ ' + (strcurr(fmmpba_1,         14, True));
      End;

      try
        Dm.Join.Close;
        Dm.Join.SQL.Clear;
        Dm.Join.SQL.Add('update daje set');
        Dm.Join.SQL.Add('emol_daje      = ' + QuotedStr(StringReplace(FloatToStr(EmolDaje_1), ',', '.', [rfReplaceAll])));
        Dm.Join.SQL.Add(',tx_fisca_daje = ' + QuotedStr(StringReplace(FloatToStr(TaxaFiscalDaje_1), ',', '.', [rfReplaceAll])));
        Dm.Join.SQL.Add(',fecom_daje    = ' + QuotedStr(StringReplace(FloatToStr(FecomDaje_1), ',', '.', [rfReplaceAll])));
        Dm.Join.SQL.Add(',def_pub_daje  = ' + QuotedStr(StringReplace(FloatToStr(DefPublicaDaje_1), ',', '.', [rfReplaceAll])));
        Dm.Join.SQL.Add(',fmmpba        = ' + QuotedStr(StringReplace(FloatToStr(fmmpba_1), ',', '.', [rfReplaceAll])));
        Dm.Join.SQL.Add('where id       = ' + IntToStr(id));
        Dm.Join.ExecSQL;
      except
      end;
    end
    else
    begin
      If (dm.qryGenerico.IsEmpty) Then
      Begin
        QrLabel35.Caption := 'R$ ' + (StrCurr(Dm.Join.FieldByName('emol_daje').AsCurrency,     14, True));
        QRLabel47.Caption := 'R$ ' + (StrCurr(Dm.Join.FieldByName('tx_fisca_daje').AsCurrency, 14, True));
        QrLabel27.Caption := 'R$ ' + (StrCurr(Dm.Join.FieldByName('fecom_daje').AsCurrency,    14, True));
        QRLabel29.Caption := 'R$ ' + (StrCurr(Dm.Join.FieldByName('def_pub_daje').AsCurrency,  14, True));
        QRLabel52.Caption := 'R$ ' + (strcurr(Dm.Join.FieldByName('vr_daje').asCurrency,       14, True));
        QRLabel54.Caption := 'R$ ' + (strcurr(Dm.Join.FieldByName('vr_pge').asCurrency,        14, True));

        if dm.qryGenerico.FieldByName('fmmpba').AsCurrency <= 0 then
        begin
          fmmpba_1          := SimpleRoundTo(((Dm.Join.FieldByName('vr_daje').asCurrency * fmmpba)/100), -2);
          QRLabel58.Caption := currtostr(fmmpba_1);
        end
        else
        begin
          QRLabel58.Caption := 'R$ ' + (strcurr(Dm.Join.FieldByName('fmmpba').asCurrency,       14, True));
        end;

      End
      Else
      Begin
        QrLabel35.Caption := 'R$ ' + (StrCurr(Dm.Join.FieldByName('emol_daje').AsCurrency + dm.qryGenerico.FieldByName('emol_daje').AsCurrency,     14, True));
        QRLabel47.Caption := 'R$ ' + (StrCurr(Dm.Join.FieldByName('tx_fisca_daje').AsCurrency + dm.qryGenerico.FieldByName('tx_fisca_daje').AsCurrency, 14, True));
        QrLabel27.Caption := 'R$ ' + (StrCurr(Dm.Join.FieldByName('fecom_daje').AsCurrency + dm.qryGenerico.FieldByName('fecom_daje').AsCurrency,    14, True));
        QRLabel29.Caption := 'R$ ' + (StrCurr(Dm.Join.FieldByName('def_pub_daje').AsCurrency + dm.qryGenerico.FieldByName('def_pub_daje').AsCurrency,  14, True));
        QRLabel52.Caption := 'R$ ' + (strcurr(Dm.Join.FieldByName('vr_daje').asCurrency + dm.qryGenerico.FieldByName('vr_daje').AsCurrency,       14, True));
        QRLabel54.Caption := 'R$ ' + (strcurr(Dm.Join.FieldByName('vr_pge').asCurrency + dm.qryGenerico.FieldByName('vr_pge').AsCurrency,       14, True));
        QRLabel58.Caption := 'R$ ' + (strcurr(Dm.Join.FieldByName('fmmpba').asCurrency + dm.qryGenerico.FieldByName('fmmpba').AsCurrency,        14, True));
      End;
    end;
  end;

  if (iddaje_tj <= 0) Then
    QRLabel16.Caption:= id_eselo
  else
  QRLabel16.Caption:= Strzero(inttostr(iddaje_tj), 4);

  QrLabel11.Caption := Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False);
  if (Dm.ArqAux.FieldByName('natureza').asInteger = 197)or (Dm.ArqAux.FieldByName('natureza').asInteger = 300) then
  begin
    QrLabel12.Caption := Busca_NomePessoal(Dm.ArqAux.FieldByName('p_auxiliar').asString, 'D');
    QrLabel12.Enabled := True;
    //QrLabel16.Enabled := True;
  end;
  QrLabel7.Caption  := 'R$ ' + (StrCurr(Dm.ArqAux.FieldByName('valor_base').asCurrency, 14, True));
  //QrLabel35.Caption := 'R$ ' + (StrCurr(Dm.ArqAux.FieldByName('v_emolumentos').asCurrency, 14, True));
  QrLabel36.Caption := 'R$ ' + (StrCurr(Dm.ArqAux.FieldByName('v_emoladicional').asCurrency, 14, True));
  QrLabel37.Caption := 'R$ ' + (StrCurr(Dm.ArqAux.FieldByName('v_mic').asCurrency, 14, True));
  QrLabel38.Caption := 'R$ ' + (StrCurr(Dm.ArqAux.FieldByName('v_pag').asCurrency, 14, True));
  QrLabel39.Caption := 'R$ ' + (StrCurr(Dm.ArqAux.FieldByName('v_viaexc').asCurrency, 14, True));
  QrLabel40.Caption := 'R$ ' + (StrCurr(Dm.ArqAux.FieldByName('v_digitalizacao').asCurrency, 14, True));
  QrLabel41.Caption := 'R$ ' + (StrCurr(Dm.ArqAux.FieldByName('v_informatica').asCurrency + Dm.ArqAux.FieldByName('v_infodistrib').asCurrency, 14, True));
  QRLabel42.Caption := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('v_graveletr').asCurrency + Dm.ArqAux.FieldByName('v_graveletrdistrib').asCurrency, 14, True));
  QRLabel43.Caption := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('v_conferencia').asCurrency, 14, True));
  QRLabel9.Caption  := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('v_guia').asCurrency, 14, True));  
  QRLabel46.Caption := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('v_subtotal').asCurrency, 14, True));
  QRLabel44.Caption := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('v_nome').asCurrency, 14, True));
  QRLabel45.Caption := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('v_distrib').asCurrency + Dm.ArqAux.FieldByName('v_leis_dist').asCurrency , 14, True));
  //QRLabel47.Caption := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('v_tribunal').asCurrency, 14, True));
  QRLabel48.Caption := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('v_procuradoria').asCurrency, 14, True));
  QRLabel49.Caption := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('v_defensoria').asCurrency, 14, True));
  QRLabel50.Caption := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('v_mutua').asCurrency, 14, True));
  QRLabel51.Caption := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('v_acoterj').asCurrency, 14, True));
  //QRLabel52.Caption := 'R$ ' + (strcurr(Dm.ArqAux.FieldByName('custas').asCurrency, 14, True));

  QRImage4.Width:= 0;
  QRImage5.Enabled:= False;
  QRImage4.Enabled:= False;
  QRLabel61.Enabled:= False;
  QRLabel62.Enabled:= False;
  QRLabel78.Enabled:= False;
  QRLabel87.Enabled:= False;
  QRLabel92.Enabled:= False;
  QRLabel93.Enabled:= False;
  QRLabel94.Enabled:= False;
  QRShape4.Enabled:= False;

  //parametrizar para EDER VALENÇA ADICIONAR TAMBEM PARA CERTIDÃO
  IF (TrabalhaComQRCode) Then //Eder de Valença
  begin
    QRLabel17.Enabled:= False;
    QRLabel18.Enabled:= False;
    QRLabel19.Enabled:= False;
    QRLabel20.Enabled:= False;
    QRLabel21.Enabled:= False;
    QRLabel22.Enabled:= False;
    QRLabel23.Enabled:= False;
    QRImage1.Enabled:= False;

    QRImage4.Width:= 231;
    QRImage5.Enabled:= True;
    QRImage4.Enabled:= True;
    QRLabel61.Enabled:= True;
    QRLabel62.Enabled:= True;
    QRLabel78.Enabled:= True;
    QRLabel87.Enabled:= True;
    QRLabel92.Enabled:= True;
    QRLabel93.Enabled:= True;
    QRLabel94.Enabled:= True;
    QRShape4.Enabled:= True;

    WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'DAJE.EXE ' + 'CQ;'+TirarTudo(Dm.ArqAux.FieldByName('selo').AsString,'-','/','.')+';'+caminho_imgselo+';'+'dbtd;'+'TD;'),SW_HIDE);
    Dm.KillTask(F_Menu.LbCaminhoDajeIntegracao.Caption+'Daje.exe');
    
    QRImage5.Picture.LoadFromFile(caminho_imgselo+'qrcode_'+TirarTudo(Dm.ArqAux.FieldByName('selo').AsString,'-','/','.')+'.bmp');
  end
  else
  begin
    QRLabel17.Enabled:= True;
    QRLabel18.Enabled:= True;
    QRLabel19.Enabled:= True;
    QRLabel20.Enabled:= True;
    QRLabel21.Enabled:= True;
    QRLabel22.Enabled:= True;
    QRLabel23.Enabled:= True;
    QRImage1.Enabled:= True;

    QRImage4.Width:= 0;
    QRImage5.Enabled:= False;
    QRImage4.Enabled:= False;
    QRLabel61.Enabled:= False;
    QRLabel62.Enabled:= False;
    QRLabel78.Enabled:= False;
    QRLabel87.Enabled:= False;
    QRLabel92.Enabled:= False;
    QRLabel93.Enabled:= False;
    QRLabel94.Enabled:= False;
    QRShape4.Enabled:= False;
  end;

  QrLabel87.Caption := Dm.ArqAux.FieldByName('selo').AsString;
  QrLabel92.Caption := Dm.ArqAux.FieldByName('selo_validador').AsString;


  QRLabel14.Caption := Dm.ArqAux.FieldByName('selo_serie').AsString + ' ' + Dm.ArqAux.FieldByName('selo_numero').AsString;
  QrLabel20.Caption := Dm.ArqAux.FieldByName('selo').AsString;
  QrLabel21.Caption := Dm.ArqAux.FieldByName('selo_validador').AsString;

  QRMemo1.Lines.Clear;
  if (Dm.ArqAux.FieldByName('obs_prov1').AsString <> '') then
  begin

    {QRMemo1.Height := 17;
    QRMemo1.Left   := 10;
    QRMemo1.Top    := 22;
    QRMemo1.Width  := 500;}
    // QRMemo1.Lines.Clear;

    RichEdit55.lines.clear;

    v_OBS := '';
    v_OBS := Dm.ArqAux.FieldByName('obs_prov1').AsString;
    RichEdit55.Text:=v_OBS;
    JustifyRichText(RichEdit55,false);
    //Quebra_linha_no_QRMemo1(v_OBS);  //procedure feita em 17-03-2015 por jesutec
  end
  else
    RichEdit55.lines.clear;
  //QRMemo1.Lines.Clear;

  //QRLabel30.Caption:= dm.arqaux.fieldbyname('folha_a').AsString;

  if (dm.arqaux.fieldbyname('averba').AsString <> '') and (dm.arqaux.fieldbyname('averba').AsString <> '0') then
  begin
    QRLabel24.Enabled  := True;
    QRDBText10.Enabled := True;
  end
  else
  begin
    QRLabel24.Enabled  := False;
    QRDBText10.Enabled := False;
  end;


  QrLabel79.Caption := DataExtenso(Dm.ArqAux.FieldByName('data_p').asString, True, '');


  if dm.arqaux.fieldbyname('deposito').ascurrency > dm.arqaux.fieldbyname('custas').ascurrency then
  begin
    qrlabel25.caption := 'DEVOLVER.............................:';
    qrlabel10.caption := 'R$ ' + StrCurr((dm.arqaux.fieldbyname('deposito').ascurrency - dm.arqaux.fieldbyname('custas').ascurrency), 14, True) ;
  end
  else if dm.arqaux.fieldbyname('deposito').ascurrency < dm.arqaux.fieldbyname('v_total').ascurrency then
  begin
    qrlabel25.caption := 'RECEBER..............................:';
    qrlabel10.caption := 'R$ ' + StrCurr((dm.arqaux.fieldbyname('custas').ascurrency - dm.arqaux.fieldbyname('deposito').ascurrency), 14, True) ;
  end
  else if dm.arqaux.fieldbyname('custas').ascurrency = dm.arqaux.fieldbyname('deposito').ascurrency then
  begin
    qrlabel25.caption := '......................................';
    qrlabel10.caption := 'R$ ' + StrCurr(0, 14, True) ;
  end;
//QRLabel44.Caption := StringOfChar('_', Length(QrLabel26.Caption));

  {dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('SELECT lva, lvb, lvc FROM td WHERE p_auxiliar = '+QuotedStr(Dm.ArqAux.FieldByName('p_auxiliar').asString)+'');
  dm.qryGenerico.Open;}

  QRLabel_livro.Caption := '';

  if (trim(dm.arqaux.fieldbyname('lva').AsString) = 'X') then
  Begin
    QRLabel32.Caption := 'LIVRO '+'A:' +trim(dm.arqaux.fieldbyname('livro').AsString);
    QRLabel53.Caption     := dm.arqaux.fieldbyname('folha').AsString;
  End;

  if (trim(dm.arqaux.fieldbyname('lvb').AsString) = 'X') then
  Begin
    QRLabel32.Caption := 'LIVRO '+'B:' +trim(dm.arqaux.fieldbyname('livro').AsString);
    QRLabel53.Caption     := dm.arqaux.fieldbyname('folha').AsString;
  End;

  if (trim(dm.arqaux.fieldbyname('lvc').AsString) = 'X') then
  Begin
    QRLabel32.Caption := 'LIVRO '+'C:' +trim(dm.arqaux.fieldbyname('livro').AsString);
    QRLabel53.Caption     := dm.arqaux.fieldbyname('folha').AsString;
  End;

    {if (trim(dm.arqaux.fieldbyname('livro').AsString) <> '0') or (trim(dm.arqaux.fieldbyname('folha').AsString) <> '0') then
    Begin
      QRLabel32.Caption := 'LIVRO '+'A:' +trim(dm.arqaux.fieldbyname('livro').AsString);
      QRLabel53.Caption     := dm.arqaux.fieldbyname('folha').AsString;
    End; }

  If ((F_Menu.Label39.Caption = '28664048000113') or (F_Menu.Label39.Caption = '28.664.048/0001-13')) AND (Dm.arqaux.FieldByName('tipo_reg').AsString = 'Av.') Then //Rtd Maragogipe
  Begin

    if (trim(dm.arqaux.fieldbyname('lva_reg').AsString) = 'X') then
    Begin
      QRLabel_livro.Caption := '';
      QRLabel30.Caption     := '';

      QRLabel56.Caption:= 'LIVRO '+'A:' +trim(dm.arqaux.fieldbyname('livro_reg').AsString);
      QRLabel55.Caption:= dm.arqaux.fieldbyname('folha_reg').AsString;
    End;

    if (trim(dm.arqaux.fieldbyname('lvb_reg').AsString) = 'X') then
    Begin
      QRLabel_livro.Caption := '';
      QRLabel30.Caption     := '';

      QRLabel56.Caption:= 'LIVRO '+'B:' +trim(dm.arqaux.fieldbyname('livro_reg').AsString);
      QRLabel55.Caption:= dm.arqaux.fieldbyname('folha_reg').AsString;
    End;

    if (trim(dm.arqaux.fieldbyname('lvc_reg').AsString) = 'X') then
    Begin
      QRLabel_livro.Caption := '';
      QRLabel30.Caption     := '';

      QRLabel56.Caption := 'LIVRO '+'C:' +trim(dm.arqaux.fieldbyname('livro_reg').AsString);
      QRLabel55.Caption     := dm.arqaux.fieldbyname('folha_reg').AsString;

    End;
  End
  Else
  Begin
    if (trim(dm.arqaux.fieldbyname('lva_reg').AsString) = 'X') then
    Begin
      QRLabel_livro.Caption := 'LIVRO '+'A:' +trim(dm.arqaux.fieldbyname('livro_reg').AsString);
      QRLabel30.Caption     := dm.arqaux.fieldbyname('folha_reg').AsString;
    End;

    if (trim(dm.arqaux.fieldbyname('lvb_reg').AsString) = 'X') then
    Begin
      QRLabel_livro.Caption := 'LIVRO '+'B:' +trim(dm.arqaux.fieldbyname('livro_reg').AsString);
      QRLabel30.Caption     := dm.arqaux.fieldbyname('folha_reg').AsString;
    End;

    if (trim(dm.arqaux.fieldbyname('lvc_reg').AsString) = 'X') then
    Begin
      QRLabel_livro.Caption := 'LIVRO '+'C:' +trim(dm.arqaux.fieldbyname('livro_reg').AsString);
      QRLabel30.Caption     := dm.arqaux.fieldbyname('folha_reg').AsString;
    End;
  End;

  IF (F_Menu.Label39.Caption = '28287131000110') or (F_Menu.Label39.Caption = '28.287.131/0001-10') Then //ciro serrinha
  begin
    QRLabel31.Caption     := 'Folha:';
    QRLabel34.Caption     := 'Folha:';
  end;



end;

procedure TQK_RecR2.Quebra_linha_no_QRMemo1(v_Str: String);
var
   v_qtd_caracteres_copiados : Integer;
   v_space : Boolean;
   teste : String;
begin
     teste := '';
     tam_total := length(v_Str);
     //if tam_total >= 107 then
     if tam_total >= 80 then
     begin
        //v_qtd_caracteres_copiados := 107;
        v_qtd_caracteres_copiados := 80;
        tam_restante := tam_total - v_qtd_caracteres_copiados;

        v_space := false;
        while v_space = false do
        begin
              if trim(copy(v_Str,v_qtd_caracteres_copiados,1))<>'' then
              begin
                   v_qtd_caracteres_copiados := v_qtd_caracteres_copiados + 1;
              end
              else
                  begin
                       v_qtd_caracteres_copiados := v_qtd_caracteres_copiados - 1;
                       if tam_total > v_qtd_caracteres_copiados then
                          tam_restante := tam_total - v_qtd_caracteres_copiados
                       else
                           tam_restante := tam_total;

                       teste := copy( v_Str, 1, v_qtd_caracteres_copiados );
                       QRMemo1.Lines.Add(  teste );
                       v_qtd_caracteres_copiados := v_qtd_caracteres_copiados + 1;
                       if tam_total > v_qtd_caracteres_copiados then
                          tam_restante := tam_total - v_qtd_caracteres_copiados
                       else
                           tam_restante := tam_total;

                       v_Str := copy( v_Str, v_qtd_caracteres_copiados+1, tam_restante+1 );

                       Quebra_linha_no_QRMemo1(v_Str);


                       v_space := true;
                  end;
        end;


     end
     else
        begin
             v_qtd_caracteres_copiados := tam_total;

             teste := copy( v_Str, 1, v_qtd_caracteres_copiados );
             //if teste <> '' Then
             QRMemo1.Lines.Add(  teste );
             //else
             //QRMemo1.Lines.Clear;

        end;
end;

end.

