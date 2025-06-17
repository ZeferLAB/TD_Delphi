unit RETQ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers, CheckLst, Db,
  DBTables, RDprint, jpeg, UnMath, SISGetImgString_TLB, FileCtrl, AxCtrls,
  OleCtrls, DbOleCtl, ImgeditLibCtl_TLB, ComObj, ShellApi;

Type
  TPassThroughData = Record
    nLen : Integer;
    Data : Array[0..255] of byte;
  end;        

type
  TF_RETQ = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Label6: TLabel;
    MaskEdit2: TMaskEdit;
    RDprint1: TRDprint;
    Label11: TLabel;
    Label12: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    ComboBox3: TComboBox;
    Label4: TLabel;
    ImgEdit1: TImgEdit;
    RichEdit1: TRichEdit;
    Rad_Registro: TRadioButton;
    Rad_Protocolo: TRadioButton;
    Label15: TLabel;
    Label23: TLabel;
    ComboBox6: TComboBox;
    Label24: TLabel;
    Edit3: TEdit;
    Label25: TLabel;
    Edit11: TEdit;
    Edit13: TEdit;
    Label27: TLabel;
    Edit12: TEdit;
    Label26: TLabel;
    BitBtn5: TBitBtn;
    tamanhoFonte: TEdit;
    Label30: TLabel;
    edtEspacamentoLinhas: TEdit;
    lblEspacamento: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Rad_RegistroClick(Sender: TObject);
    procedure Rad_ProtocoloClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    function retornaLetraDoLivroProtocolo(p_auxiliar: String): String;
    function retornaLetraDoLivroRegistro(p_auxiliar: String): String;
    procedure ImprimiEtiquetaDeViasAdicionais(sProtocolo: String);
    procedure ImprimiEtiquetaDeViasAdicionaisDaTabelaTD(sProtocolo: String);
    function retornaValorDaPaginaAdicionalDeCertidao(QtdViasCertida: Integer): String;
    procedure Imprime_Zebra(CustomMemo:TCustomMemo;Memo:TMemo);
    procedure DirectPrint(s: String);
    procedure geraTextoFormatado;
    procedure SetDefaultPrinter(PrinterName: String);
    function ListarImpressoras: String;
    Function ImpressoraPadrao :String;
    function ConverteBMPBit(LocalQRCodeEmBranco, LocalQRCodeBaixadoDoTribunal: String): Boolean;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RETQ: TF_RETQ;
  Vr_SubTotal, Vr_Busca, Vr_Total, Vr_Mutua, Vr_Acoterj,
  Vr_Tribunal, Vr_Defensoria, Vr_Procuradoria,
  emo_vex, bus_vex, con_vex, inf_exc, gui_exc, sub_vex,
  lei20_vex, lei05_vex, lei05a_vex, tot_vex, emol_tit,
  fetj_tit, fund_tit, funp_tit, tota_tit : Currency;
  DefinidoModeloArgox, DefinidoModeloZebra: Boolean;
  letra: double;
  caracters: String;
  contador: Integer;

implementation

uses Menu, EtiqQk, EtiqQk1, EtiqQk2, DMTD, FuncGeral, ProcGeral, Exame,
  U_AssinaEtiqueta;

  function  A_Set_Darkness ( darkness:integer):integer;stdcall;external 'WINPPLA.DLL'; // Seta funcao de Intensidade da impressao
  function  A_CreatePrn    ( selection:integer;FileName:pchar):integer;stdcall;external 'WINPPLA.DLL';   // Inicia Operacao da Impressora
  function  A_Print_Out    ( width,height,copies,amount:integer):integer;stdcall;external 'WINPPLA.DLL';  // Qtade de etiquetas
  function  A_Prn_Text     ( x,y,ori,font,typee,hor_factor,ver_factor:integer;mode:char;numeric:integer;data:pchar):integer;stdcall;external 'WINPPLA.DLL'; // conteudo que vai ser impresso
  function  A_Prn_Barcode  ( x,y,ori:integer;typee:char;narrow,width,height:integer;mode:char;numeric:integer;data:pchar):integer;stdcall;external 'WINPPLA.DLL';
  function  A_Prn_Text_TrueType ( x,y,FSize:integer;FType:pchar;Fspin,FWeight,FItalic,FUnline,FStrikeOut:integer;id_name,data:pchar;mem_mode:integer):integer;stdcall;external 'WINPPLA.DLL';
  function  A_Get_Graphic  ( x,y,mem_mode:integer;format:char;filename:pchar):integer;stdcall;external 'WINPPLA.DLL';
  function  A_Draw_Box     ( mode, x, y, width, height, top, side:integer):integer;stdcall;external 'WINPPLA.DLL';
  function  A_Draw_Line    (mode, x, y, width, height:integer):integer;stdcall;external 'WINPPLA.DLL';
  Procedure A_ClosePrn     ();stdcall;external 'WINPPLA.DLL';


{$R *.DFM}
Function Strzero(Numero : String;Casas : Integer) : String;
var
  zeros : String;
Begin
  zeros := '00000000000000000000000000000000000000000';
  result := copy(zeros,1,casas) + numero;
  result := copy(result, length(result) - (casas - 1), casas);
end;

Function Alinha(Sentido, Tamanho, Cadeia : String) : String;
var
  branco : String;
  tam, tam1 : Integer;
Begin
  branco := '                                                            ';
  if sentido = 'D' then
  begin
    tam := strtoint(tamanho);
    tam1 := strtoint(tamanho) - 1;
    result := copy(branco,1,tam) + cadeia;
    result := copy(result, length(result) - tam1, tam);
  end
  else
  begin
    result := copy(cadeia + branco,1,tam);
  end;
end;

procedure TF_RETQ.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RETQ.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RETQ.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_RETQ.BitBtn2Click(Sender: TObject);
begin
  maskedit2.clear;
  maskedit3.clear;
  maskedit1.setfocus;
end;

procedure TF_RETQ.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.Click;
end;

procedure TF_RETQ.RadioButton2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_RETQ.FormActivate(Sender: TObject);
begin

  //MaskEdit6.Text := UpperCase(Trim(F_Menu.Label29.Caption)) + '- REGISTRO DE TITULOS E DOCUMENTOS';

  //Abrindo Configur
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;
  if Dm.Configur.FieldByName('chk_21').AsString = 'T' Then
    DefinidoModeloArgox:= True
  else
  DefinidoModeloArgox:= False;

  if Dm.Configur.FieldByName('chk_30').AsString = 'T' Then
    DefinidoModeloZebra:= True
  else
    DefinidoModeloZebra:= False;

  {if (DM.Configur.FieldByName('chk_13').AsBoolean) then
  begin
    Label9.Visible    := True;
    Label10.Visible   := True;
    ComboBox4.Visible := True;
    ComboBox5.Visible := True;
  end
  else
  begin
    Label9.Visible    := False;
    Label10.Visible   := False;
    ComboBox4.Visible := False;
    ComboBox5.Visible := False;
  end;}

  if (F_Menu.Label39.Caption = '27.145.475/0001-22') OR (F_Menu.Label39.Caption = '27145475000122') //Adrea de Una
    or (F_Menu.Label39.Caption = '28.588.048/0001-81') OR (F_Menu.Label39.Caption = '28588048000181') Then  //Gierc 1 RTD
    ListarImpressoras;

  //BitBtn2.Click;
end;

procedure TF_RETQ.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox3.SetFocus;
end;

procedure TF_RETQ.BitBtn1Click(Sender: TObject);
var
  //***************************************//

  tam_lin_mat, tam_lin_atos, tam_lin_daje, posicao, x, qtde_etq : integer;
  sai, foi : Boolean;
  lin_mat, lin_mat2, lin_atos, lin_dajes, lin_atos2, lin_dajes2 : String;
  tam_fonte, posicaoX, posicaoY, qrCodeX, qrCodeY, variacaoY : Integer;
  cabec_argox : String;
  y: Integer;
  //**************************************//

  sair, imprimirTodas   : Boolean;
  DtCalc, dataseek, protseek, arq, endd,
  l6, l3, l20, l7, l11, l13, buffer, tit_cartorio : String;
  xx, quant, lin, prot_inii,xx1 : integer;
  F : TextFile;
  qtde_vex, livro_, serie_selo, n_selo : String;
  _SerieDaje,
  _Daje: String;
  _EmolDaje,
  _ValorDaje,
  VrDaje_1,
  EmolDaje_1,
  TaxaFiscalDaje_1,
  FecomDaje_1,
  DefPublicaDaje_1,
  pge_11, FMMPBA_11  : currency;
  _SerieDajeComplementar,
  _DajeComplementar: String;
  count, j: integer;
  width,
  height,
  copies,
  amount: Integer;
begin
  tit_cartorio    := 'Registro de Titulos e Documentos';
  Vr_SubTotal     := 0;
  Vr_Busca        := 0;
  Vr_Total        := 0;
  Vr_Mutua        := 0;
  Vr_Acoterj      := 0;
  Vr_Tribunal     := 0;
  Vr_Defensoria   := 0;
  Vr_Procuradoria := 0;

  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data Inválida !!!');
    exit;
  end;

  IF (F_Menu.Label39.Caption = '34377622000155') or (F_Menu.Label39.Caption = '34.377.622/0001-55') Then //Rtd Juliana
  Begin
    F_AssinaEtiqueta:= TF_AssinaEtiqueta.Create(Nil);
    F_AssinaEtiqueta.ShowModal;
  End;

  if Rad_Registro.Checked Then
  Begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT p_auxiliar, protocolo, registro, averba, data_r, data_p, anotacao, vias_adc, selo_serie, selo_numero, v_viaexc,');
    Dm.ArqAux.Sql.Add(' v_conferencia, v_emolumentos, v_emoladicional, v_mic, v_not_pd, v_pag, v_digitalizacao, v_informatica, v_graveletr,');
    Dm.ArqAux.Sql.Add(' v_nome, v_distrib, v_doi, v_doi_info, v_guia, v_guia_info, v_subtotal, v_tribunal, v_procuradoria, v_defensoria,');
    dm.ArqAux.sql.add(' v_mutua, v_acoterj, v_total, v_ar, livro_b, folha_b, livro_c, folha_c, daje, serie_daje, selo, selo_validador, livro, folha, folha_reg, livro_reg, tipo_reg, lvf ');
    Dm.ArqAux.Sql.Add(' FROM td');
    Dm.ArqAux.Sql.Add(' WHERE');
    Dm.ArqAux.Sql.Add(' data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    if (Trim(MaskEdit3.Text) <> '')  AND  (Trim(MaskEdit2.Text) <> '') AND
       (Trim(MaskEdit3.Text) <> '0') AND  (Trim(MaskEdit2.Text) <> '0')AND
       (ValidNumero(MaskEdit3.Text)) AND  (ValidNumero(MaskEdit2.Text))then
       begin
         Dm.ArqAux.Sql.Add(' AND protocolo >= ' + Trim(MaskEdit3.Text));
         Dm.Arqaux.Sql.Add(' AND protocolo <= ' + Trim(MaskEdit2.Text));
       end;
    Dm.ArqAux.Sql.Add(' ORDER BY protocolo');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      ShowMessage('Dados insuficientes para impressão !');
      MaskEdit1.SetFocus;
      Exit;
    end;
  End
  Else if Rad_Protocolo.Checked Then
  Begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT p_auxiliar, ext_nat, protocolo, registro, averba, data_r, data_p, anotacao, vias_adc, selo_serie, selo_numero, v_viaexc,');
    Dm.ArqAux.Sql.Add(' v_conferencia, v_emolumentos, v_emoladicional, v_mic, v_not_pd, v_pag, v_digitalizacao, v_informatica, v_graveletr,');
    Dm.ArqAux.Sql.Add(' v_nome, v_distrib, v_doi, v_doi_info, v_guia, v_guia_info, v_subtotal, v_tribunal, v_procuradoria, v_defensoria,');
    dm.ArqAux.sql.add(' v_mutua, v_acoterj, v_total, v_ar, livro_b, folha_b, livro_c, folha_c, daje, serie_daje, selo, selo_validador, livro, folha, folha_reg, livro_reg, tipo_reg, lvf ');
    Dm.ArqAux.Sql.Add(' FROM td');
    Dm.ArqAux.Sql.Add(' WHERE');
    Dm.ArqAux.Sql.Add(' data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    if (Trim(MaskEdit3.Text) <> '')  AND  (Trim(MaskEdit2.Text) <> '') AND
       (Trim(MaskEdit3.Text) <> '0') AND  (Trim(MaskEdit2.Text) <> '0')AND
       (ValidNumero(MaskEdit3.Text)) AND  (ValidNumero(MaskEdit2.Text))then
       begin
         Dm.ArqAux.Sql.Add(' AND p_auxiliar >= ' + Trim(MaskEdit3.Text));
         Dm.Arqaux.Sql.Add(' AND p_auxiliar <= ' + Trim(MaskEdit2.Text));
       end;
    Dm.ArqAux.Sql.Add(' ORDER BY p_auxiliar');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      ShowMessage('Dados insuficientes para impressão !');
      MaskEdit1.SetFocus;
      Exit;
    end;
  End;

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

  Dm.Calculo.Close;
  Dm.Calculo.Sql.Clear;
  Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
  Dm.Calculo.Sql.Add('WHERE');
  Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
  Dm.Calculo.Sql.Add('AND tabela = ''1''');
  Dm.Calculo.Sql.Add('AND item  = ''1''' );
  Dm.Calculo.Open;

  VrBusca := dm.calculo.FieldByName('v_emolumentos').ascurrency;
  Vr_Mutua   := dm.ArqAux.FieldByName('v_mutua').AsCurrency;
  Vr_Acoterj := DM.ArqAux.FieldByName('v_acoterj').ascurrency;
  qtde_vex   := dm.ArqAux.fieldbyname('vias_adc').AsString;
  VrSubTotal := (DM.ArqAux.fieldbyname('v_emolumentos').AsCurrency +
                 DM.ArqAux.fieldbyname('v_emoladicional').AsCurrency +
                 DM.ArqAux.fieldbyname('v_mic').AsCurrency +
                 DM.ArqAux.fieldbyname('v_not_pd').AsCurrency +
                 DM.ArqAux.fieldbyname('v_pag').AsCurrency +
                 DM.ArqAux.fieldbyname('v_conferencia').AsCurrency +
                 DM.ArqAux.fieldbyname('v_digitalizacao').AsCurrency +
                 DM.ArqAux.fieldbyname('v_informatica').AsCurrency +
                 DM.ArqAux.fieldbyname('v_graveletr').AsCurrency +
                 DM.ArqAux.fieldbyname('v_nome').AsCurrency +
                 DM.ArqAux.fieldbyname('v_distrib').AsCurrency +
                 DM.ArqAux.fieldbyname('v_doi').AsCurrency +
                 DM.ArqAux.fieldbyname('v_doi_info').AsCurrency +
                 DM.ArqAux.fieldbyname('v_guia').AsCurrency +
                 DM.ArqAux.fieldbyname('v_guia_info').AsCurrency + VrBusca);

  dm.tabdemais.Close;
  dm.tabdemais.sql.Clear;
  dm.tabdemais.sql.add('select * from cad_tabdemais');
  dm.tabdemais.sql.add('where');
  dm.tabdemais.sql.add('data = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
  dm.tabdemais.open;
  Vr_Tribunal     := truncav((VrSubTotal * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
  Vr_Defensoria   := truncav((VrSubTotal * dm.tabdemais.FieldByName('defensoria').ascurrency) / 100);
  Vr_Procuradoria := truncav((VrSubTotal * dm.tabdemais.FieldByName('procuradoria').ascurrency) / 100);

  Vr_Total := VrSubTotal + Vr_Acoterj + Vr_Tribunal + Vr_Defensoria + Vr_Procuradoria;

  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ETQ';
  CriaTabela('ETQ', arq);
  quant := 0;
  while (not Dm.ArqAux.Eof) do
  begin
    if (not ValidNumero(ComboBox3.Text)) then
    begin
      quant := Dm.Td.fieldbyname('qtde_eti').asinteger;
    end
    else
    begin
      if (ValidNumero(ComboBox3.Text)) then
      begin
        quant := StrToInt(ComboBox3.Text);
      end
      else
      begin
        quant := 1;
      end;
    end;

    livro_ := 'B ' + Dm.ArqAux.FieldByName('livro_b').AsString;
    If (Dm.ArqAux.FieldByName('livro_c').AsString <> '') and (ValidNumero(Dm.ArqAux.FieldByName('livro_c').AsString)) then
      livro_ := 'C ' + Dm.ArqAux.FieldByName('livro_c').AsString;


    If Dm.ArqAux.fieldbyname('lvf').AsString = 'X' then
      livro_ := 'F ' + Dm.ArqAux.FieldByName('livro_reg').AsString;

    //if radiobutton3.checked then
    begin
      for xx := 1 to quant do
      begin
        Dm.ArqAux1.Close;            
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
        Dm.ArqAux1.Sql.Add('(averba, p_auxiliar, indexador, linha1, linha2, linha3, linha4, linha5,');
        Dm.ArqAux1.Sql.Add(' v_subtotal, v_tribunal, v_procuradoria, v_defensoria, v_mutua, v_acoterj, v_total, v_ar, selo, daje, serie, selo_validador, livro_b, livro_c, data_p, livro, folha, folha_reg, livro_reg, v_emolumentos)');
        Dm.ArqAux1.Sql.Add(' VALUES(');

        If (NOT a_chk11) then  { Diferente de SJM. }
        Begin
          If F_Menu.Label7.Caption = 'CASIMIRO DE ABREU' then
          Begin
            serie_selo := '';
            n_selo     := '';
            Dm.Selos.Close;
            Dm.Selos.Sql.Clear;
            Dm.Selos.Sql.Add('select selo_serie, selo_numero from selos where recibo = ' + Dm.ArqAux.FieldByName('protocolo').AsString);
            Dm.Selos.Open;
            If Dm.Selos.RecordCount <> 0 then
            Begin
              for xx1 := 1 to xx do
              Begin
                serie_selo := Dm.Selos.FieldByname('selo_serie').AsString;
                n_selo     := Dm.Selos.FieldByname('selo_numero').AsString;
                Dm.Selos.Next;
              End;
            End;
            Dm.Selos.Close;
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('averba').asString) + ',');
            Dm.ArqAux1.Sql.Add(Dm.ArqAux.FieldByName('p_auxiliar').asString + ',');
            Dm.ArqAux1.Sql.Add(Dm.ArqAux.FieldByName('protocolo').asString + ',');
            Dm.ArqAux1.Sql.Add(Chr(39) + UpperCase(Trim(F_Menu.Label29.Caption)) + '- REGISTRO DE TITULOS E DOCUMENTOS' + Chr(39) + ',');
            Dm.ArqAux1.Sql.Add(Chr(39) + 'Apresentado  no  dia ' + Dm.ArqAux.FieldByName('data_r').asString + ' para R E G I S T R O  e  apontado sob o Num. ' +
                                             Dm.ArqAux.FieldByName('p_auxiliar').AsString +
                                             ' do Lv. A ' + Dm.ArqAux.FieldByName('livro_b').AsString  +  '. Registrado sob o Num. ' + Dm.ArqAux.FieldByName('protocolo').AsString + ' do livro ' +
                                             'B ' + Dm.ArqAux.FieldByName('livro_b').AsString + ', por Disco Otico.'  + Chr(39) + ',');

            {if F_Retq.radiobutton1.checked then
               Dm.ArqAux1.Sql.Add(Chr(39) + 'Anotacao a Margem do Num. ' + Dm.ArqAux.FieldByName('anotacao').AsString + Chr(39) + ',')
            else if F_Retq.radiobutton2.checked then
               Dm.ArqAux1.Sql.Add('"' + DataExtenso(MaskEdit1.Text, True, '') + 'Valido somente com selo de fiscalizacao.",');
            }
            Dm.ArqAux1.Sql.Add('"",');
            Dm.ArqAux1.Sql.Add('"' + Trim(F_Menu.Label11.Caption) + '" ' + ',');
            If (serie_selo <> '') AND (n_selo <> '') then
              Dm.ArqAux1.Sql.Add('"                                                         Selo N. ' + serie_selo + ' ' + n_selo + '" ' + ',')
            else Dm.ArqAux1.Sql.Add('"" ' + ',');

            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_subtotal').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_tribunal').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_procuradoria').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_defensoria').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_mutua').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_acoterj').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Vr_Total) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_ar').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('selo').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('daje').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('serie_daje').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('selo_validador').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('livro_b').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('livro_c').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(FormatDateTime('YYYY-MM-DD', Dm.ArqAux.FieldByName('data_p').AsDateTime)) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('livro').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('folha').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('folha_reg').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('livro_reg').AsString) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_emolumentos').AsCurrency) + ')');
          End
          Else
          Begin { Saquarema }
            tit_cartorio := F_Menu.Label29.Caption;
            If F_Menu.Label7.Caption = 'Nova Friburgo' then tit_cartorio := F_Menu.Label29.Caption + ' TITULOS E DOCUMENTOS';
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('averba').asString) + ',');
            Dm.ArqAux1.Sql.Add(Dm.ArqAux.FieldByName('p_auxiliar').asString + ',');
            Dm.ArqAux1.Sql.Add(Dm.ArqAux.FieldByName('protocolo').asString + ',');
            Dm.ArqAux1.Sql.Add(Chr(39) + UpperCase(Trim(tit_cartorio)) + Chr(39) + ',');
            Dm.ArqAux1.Sql.Add(Chr(39) + 'Apresentado no dia ' + Dm.ArqAux.FieldByName('data_r').asString + ' para REGISTRO e apontado sob o Num. ' +
                                             Dm.ArqAux.FieldByName('p_auxiliar').AsString +
                                             ' do Lv. A ' + Dm.ArqAux.FieldByName('livro_b').AsString  +  '. Registrado sob o Num. ' + Dm.ArqAux.FieldByName('protocolo').AsString + ' do livro ' +
                                             ' do Lv. A ' + Dm.ArqAux.FieldByName('livro_b').AsString  +  '. Registrado sob o Num. ' + Dm.ArqAux.FieldByName('protocolo').AsString + ' do livro ' +
                                             livro_ + Dm.ArqAux.FieldByName('livro_b').AsString + ' no dia de hoje.'  + Chr(39) + ',');
//                                           'B ' + Dm.ArqAux.FieldByName('livro_b').AsString + ' no dia de hoje.'  + Chr(39) + ',');

           { if F_Retq.radiobutton1.checked then
               Dm.ArqAux1.Sql.Add(Chr(39) + 'Anotacao a Margem do Num. ' + Dm.ArqAux.FieldByName('anotacao').AsString + Chr(39) + ',')
            else if F_Retq.radiobutton2.checked then
               Dm.ArqAux1.Sql.Add('"' + DataExtenso(MaskEdit1.Text, True, '') + 'Valido somente com selo de fiscalizacao.",');
            }
            Dm.ArqAux1.Sql.Add('"",');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('tipo_reg').asString) + ',');
            Dm.ArqAux1.Sql.Add('"" ' + ',');

            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_subtotal').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_tribunal').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_procuradoria').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_defensoria').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_mutua').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_acoterj').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Vr_Total) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_ar').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('selo').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('daje').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('serie_daje').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('selo_validador').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('livro_b').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('livro_c').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(FormatDateTime('YYYY-MM-DD', Dm.ArqAux.FieldByName('data_p').AsDateTime)) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('livro').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('folha').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('folha_reg').AsString) + ',');
            Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('livro_reg').AsString) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_emolumentos').AsCurrency) + ')');
          End;
        End
        Else
        Begin
          Dm.ArqAux1.Sql.Add(QuotedStr(Dm.ArqAux.FieldByName('averba').asString) + ',');
          Dm.ArqAux1.Sql.Add(Dm.ArqAux.FieldByName('p_auxiliar').asString + ',');
          Dm.ArqAux1.Sql.Add(Dm.ArqAux.FieldByName('protocolo').asString + ',');
          Dm.ArqAux1.Sql.Add(Chr(39) + Trim(F_Menu.Label29.Caption) + '-' + Trim(F_Menu.Label6.Caption) + ' - ' + tit_cartorio + Chr(39) + ',');
          Dm.ArqAux1.Sql.Add(Chr(39) + 'Protocolo numero ' +
                                           Dm.ArqAux.FieldByName('p_auxiliar').AsString +
                                           ' e registrado sob o num. de Ordem ' + Dm.ArqAux.FieldByName('protocolo').AsString +
                                           ' em ' + Dm.ArqAux.FieldByName('data_p').AsString + 'no livro' +
                                           ' ' + livro_ + '. Certifico que remeti nota do presente'  +
                                           ' ao distribuidor de ' + Chr(39) + ',');


          Dm.ArqAux1.Sql.Add(Chr(39) + 'registro desta cidade. Sao Joao de Meriti, ' + Dm.ArqAux.FieldByName('data_p').AsString + Chr(39) + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');
          Dm.ArqAux1.Sql.Add('"" ' + ',');          
          Dm.ArqAux1.Sql.Add('"" ' + ')');
        End;
        Dm.ArqAux1.ExecSql;
      end;
    end;
    Dm.ArqAux.Next;
  end;

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY indexador');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    ShowMessage('Problemas para carregar movimento !');
    Dm.ArqAux.Close;
    Exit;
  end;

  //Screen.cursor := crdefault;
  //if radiobutton3.checked then
  begin
    begin                                                                      
      qtde_etq := strtoint(ComboBox3.Text);

        if (F_Menu.Label39.Caption = '15.023.917/0001-89') or
           (F_Menu.Label39.Caption = '15023917000189') or
           (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') ='28666922000151') or   // manter cnpj do 1 rtd pois la ele tbm tem zebra
          (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '27072837000100') OR
          (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104') OR
          (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '20404098000150') OR
          (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '27040667000174') and DefinidoModeloZebra Then  //Livramento
        Begin
          For x:= 1 to qtde_etq do
          Begin
            Dm.ArqAux1.Close;
            Dm.ArqAux1.Sql.Clear;
            Dm.ArqAux1.Sql.Add('select * from '+ arq +' ');
            Dm.ArqAux1.Open;

            Dm.ArqAux1.FindFirst;

            While (NOT Dm.ArqAux1.Eof) Do
            Begin

              EmolDaje_1       := 0.00;
              TaxaFiscalDaje_1 := 0.00;
              FecomDaje_1      := 0.00;
              DefPublicaDaje_1 := 0.00;
              pge_11           := 0.00;
              FMMPBA_11        := 0.00;

              _SerieDajeComplementar := '';
              _DajeComplementar      := '';

              If TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') <> '34672442000104' then //diferente do 1 RYD
              Begin
                dm.qryGenerico.Close;
                dm.qryGenerico.SQL.Clear;
                dm.qryGenerico.SQL.Add('select emol_daje, tx_fisca_daje, vr_pge, fmmpba, def_pub_daje, fecom_daje, serie_daje_complementar, numero_daje_complementar from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' ');
                dm.qryGenerico.SQL.Add('and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
                dm.qryGenerico.Open;

                _SerieDajeComplementar := Dm.qryGenerico.FieldByName('serie_daje_complementar').AsString;
                _DajeComplementar      := Dm.qryGenerico.FieldByName('numero_daje_complementar').AsString;

                EmolDaje_1       := dm.qryGenerico.fieldByname('emol_daje').AsCurrency;
                TaxaFiscalDaje_1 := dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency;
                FecomDaje_1      := dm.qryGenerico.fieldByname('fecom_daje').AsCurrency;
                DefPublicaDaje_1 := dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency;
                pge_11           := Dm.qryGenerico.fieldByname('vr_pge').AsCurrency;
                FMMPBA_11        := Dm.qryGenerico.fieldByname('fmmpba').AsCurrency;


                Dm.qryGenerico_Auxiliar2.Close;
                Dm.qryGenerico_Auxiliar2.SQL.Clear;
                Dm.qryGenerico_Auxiliar2.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(_SerieDajeComplementar)+' and numero_daje = '+QuotedStr(_DajeComplementar)+' ');
                Dm.qryGenerico_Auxiliar2.Open;
                If Dm.qryGenerico_Auxiliar2.RecordCount <> 0 then
                Begin
                  EmolDaje_1       := EmolDaje_1 + dm.qryGenerico_Auxiliar2.fieldByname('emol_daje').AsCurrency;
                  TaxaFiscalDaje_1 := TaxaFiscalDaje_1 + dm.qryGenerico_Auxiliar2.fieldByname('tx_fisca_daje').AsCurrency;
                  FecomDaje_1      := FecomDaje_1 + dm.qryGenerico_Auxiliar2.fieldByname('fecom_daje').AsCurrency;
                  DefPublicaDaje_1 := DefPublicaDaje_1 + dm.qryGenerico_Auxiliar2.fieldByname('def_pub_daje').AsCurrency;
                  pge_11           := pge_11 + Dm.qryGenerico_Auxiliar2.fieldByname('vr_pge').AsCurrency;
                  FMMPBA_11        := FMMPBA_11 + Dm.qryGenerico_Auxiliar2.fieldByname('fmmpba').AsCurrency;
                End;

                RichEdit1.Lines.Clear;
                RichEdit1.Lines.Add('');
                RichEdit1.Lines.Add('');
                RichEdit1.Lines.Add(''+'Prenotado e protocolado em ' + Dm.ArqAux1.fieldByname('data_p').AsString  + ' ');

                if Dm.ArqAux1.fieldByname('linha4').AsString = 'Reg.' then
                  RichEdit1.Lines.Add(' sob o n. ' + Dm.ArqAux1.fieldByname('p_auxiliar').AsString +', registro n. '+ Dm.ArqAux1.fieldByname('indexador').AsString + ' Livro:'+retornaLetraDoLivroRegistro(Dm.ArqAux1.fieldByname('p_auxiliar').AsString))
                else
                RichEdit1.Lines.Add(' sob o n. ' + Dm.ArqAux1.fieldByname('p_auxiliar').AsString +', averbação n. '+ Dm.ArqAux1.fieldByname('indexador').AsString + ' Livro:'+retornaLetraDoLivroRegistro(Dm.ArqAux1.fieldByname('p_auxiliar').AsString));


{               if FileExists('C:\siscart\ETQ_TD\imgselo\QrCode.bmp\') Then
                  DeleteFile('C:\siscart\ETQ_TD\imgselo\QrCode.bmp\');    //LIVRAMENTO QRCODE TESTAR
                WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'DAJE.EXE ' + 'CQ;'+TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.')+';'+'C:\siscart\ETQ_TD\imgselo\'+';'+'dbtd;'+'TD;'),SW_HIDE);
                ConverteBMPBit('c:\siscart\imgselo\QRCodeBranco.bmp','C:\siscart\ETQ_TD\imgselo\QrCode.bmp');}


                if FileExists('C:\siscart\ETQ_TD\imgselo\qrcode_' + TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.') +'.bmp') then //+'qrcode.bmp') Then             sssss
                  DeleteFile('C:\siscart\ETQ_TD\imgselo\qrcode_' + TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.') +'.bmp'); //+'qrcode.bmp');
                WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'DAJE.EXE ' + 'CQ;'+TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.')+';'+'C:\siscart\ETQ_TD\imgselo\'+';'+'dbtd;'+'TD;ETQ;'),SW_HIDE);
                sleep(10000);
                Dm.KillTask(F_Menu.LbCaminhoDajeIntegracao.Caption+'Daje.exe');
                ConverteBMPBit('C:\siscart\ETQ_TD\imgselo\QRCodeBranco.bmp', 'C:\siscart\ETQ_TD\imgselo\qrcode_' + TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.') +'.bmp');   //+'qrcode.bmp');


                //RichEdit1.Lines.Add(''+Dm.ArqAux1.fieldByname('registro').AsString);
                //RichEdit1.Lines.Add(''+Dm.ArqAux1.fieldByname('matricula_2').AsString);
                //RichEdit1.Lines.Add(''+F_Menu.Label11.Caption + ' -BA ' + Dm.ArqAux1.fieldByname('data_rg').AsString);
                //RichEdit1.Lines.Add(''+F_Menu.Label11.Caption + ' -BA ' + DateToStr(Now));
                RichEdit1.Lines.Add('');
                RichEdit1.Lines.Add(''+'DAJE(S) : '+ Dm.ArqAux1.fieldByname('serie').AsString +'-'+ Dm.ArqAux1.fieldByname('daje').AsString);
                RichEdit1.Lines.Add(''+'SELO : ' + Dm.ArqAux1.fieldByname('selo').AsString + ' Cod. Validação : '+Dm.ArqAux1.fieldByname('selo_validador').AsString);
                //RichEdit1.Lines.Add(''+Dm.ArqAux1.fieldByname('daje_2').AsString);
                 //RichEdit1.Lines.Add('Emolumentos  : R$ ' + StrCurr(Dm.ArqAux1.fieldByname('custas').AsCurrency, 10, True));
                RichEdit1.Lines.Add('Emolumentos: R$' + StrCurr(EmolDaje_1, 10, True) + '    Taxa de Fiscal.: R$' + StrCurr(TaxaFiscalDaje_1, 10, True));
                RichEdit1.Lines.Add('Fecom: R$' + StrCurr(FecomDaje_1, 10, True) + '    Defensoria: R$' + StrCurr(DefPublicaDaje_1, 10, True));
                RichEdit1.Lines.Add('Oficial/Autorizado: _________________________________');
                Imprime_Zebra(RichEdit1, Nil);
              End
              Else
              Begin
                dm.qryGenerico.Close;
                dm.qryGenerico.SQL.Clear;
                dm.qryGenerico.SQL.Add('select emol_daje, tx_fisca_daje, def_pub_daje, fecom_daje, vr_pge, fmmpba,vr_daje, serie_daje_complementar, numero_daje_complementar  from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' ');
                dm.qryGenerico.SQL.Add('and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
                dm.qryGenerico.Open;

                _SerieDajeComplementar := Dm.qryGenerico.FieldByName('serie_daje_complementar').AsString;
                _DajeComplementar      := Dm.qryGenerico.FieldByName('numero_daje_complementar').AsString;

                EmolDaje_1       := dm.qryGenerico.fieldByname('emol_daje').AsCurrency;
                TaxaFiscalDaje_1 := dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency;
                FecomDaje_1      := dm.qryGenerico.fieldByname('fecom_daje').AsCurrency;
                DefPublicaDaje_1 := dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency;
                pge_11           := Dm.qryGenerico.fieldByname('vr_pge').AsCurrency;
                FMMPBA_11        := Dm.qryGenerico.fieldByname('fmmpba').AsCurrency;

                Dm.qryGenerico_Auxiliar2.Close;
                Dm.qryGenerico_Auxiliar2.SQL.Clear;
                Dm.qryGenerico_Auxiliar2.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(_SerieDajeComplementar)+' and numero_daje = '+QuotedStr(_DajeComplementar)+' ');
                Dm.qryGenerico_Auxiliar2.Open;
                If Dm.qryGenerico_Auxiliar2.RecordCount <> 0 then
                Begin
                  EmolDaje_1       := EmolDaje_1 + dm.qryGenerico_Auxiliar2.fieldByname('emol_daje').AsCurrency;
                  TaxaFiscalDaje_1 := TaxaFiscalDaje_1 + dm.qryGenerico_Auxiliar2.fieldByname('tx_fisca_daje').AsCurrency;
                  FecomDaje_1      := FecomDaje_1 + dm.qryGenerico_Auxiliar2.fieldByname('fecom_daje').AsCurrency;
                  DefPublicaDaje_1 := DefPublicaDaje_1 + dm.qryGenerico_Auxiliar2.fieldByname('def_pub_daje').AsCurrency;
                  pge_11           := pge_11 + Dm.qryGenerico_Auxiliar2.fieldByname('vr_pge').AsCurrency;
                  FMMPBA_11        := FMMPBA_11 + Dm.qryGenerico_Auxiliar2.fieldByname('fmmpba').AsCurrency;
                End;


                RichEdit1.Lines.Clear;
                If TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '20404098000150' then
                Begin
                  RichEdit1.Lines.Add('        OFICIO UNICO DE MEDEIROS NETO - BAHIA');
                  RichEdit1.Lines.Add('Titulos e Documentos - Oficiala: Anna Paola Ramalho Vieira');
                End
                Else
                Begin
                  RichEdit1.Lines.Add('');
                  RichEdit1.Lines.Add('');
                End;  
                RichEdit1.Lines.Add(''+'Prenotado e protocolado em ' + Dm.ArqAux1.fieldByname('data_p').AsString  + ' ');

                if Dm.ArqAux1.fieldByname('linha4').AsString = 'Reg.' then
                  RichEdit1.Lines.Add(' sob o n. ' + Dm.ArqAux1.fieldByname('p_auxiliar').AsString +', registro n. '+ Dm.ArqAux1.fieldByname('indexador').AsString + ' Livro:'+retornaLetraDoLivroRegistro(Dm.ArqAux1.fieldByname('p_auxiliar').AsString) + 'AV.: ' + Dm.ArqAux1.fieldByname('averba').AsString)
                else
                  RichEdit1.Lines.Add(' sob o n. ' + Dm.ArqAux1.fieldByname('p_auxiliar').AsString +', averbação n. '+ Dm.ArqAux1.fieldByname('indexador').AsString + ' Livro:'+retornaLetraDoLivroRegistro(Dm.ArqAux1.fieldByname('p_auxiliar').AsString) + 'AV.: ' + Dm.ArqAux1.fieldByname('averba').AsString);

                if FileExists('C:\siscart\ETQ_TD\imgselo\QrCode.bmp\') Then
                  DeleteFile('C:\siscart\ETQ_TD\imgselo\QrCode.bmp\');    //LIVRAMENTO QRCODE TESTAR

                WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'DAJE.EXE ' + 'CQ;'+TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.')+';'+'C:\siscart\ETQ_TD\imgselo\'+';'+'dbtd;'+'TD;'),SW_HIDE);

                ConverteBMPBit('c:\siscart\imgselo\QRCodeBranco.bmp','C:\siscart\ETQ_TD\imgselo\QrCode_'+TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.')+'.bmp');


                //RichEdit1.Lines.Add(''+Dm.ArqAux1.fieldByname('registro').AsString);
                //RichEdit1.Lines.Add(''+Dm.ArqAux1.fieldByname('matricula_2').AsString);
                //RichEdit1.Lines.Add(''+F_Menu.Label11.Caption + ' -BA ' + Dm.ArqAux1.fieldByname('data_rg').AsString);
                //RichEdit1.Lines.Add(''+F_Menu.Label11.Caption + ' -BA ' + DateToStr(Now));
                RichEdit1.Lines.Add('');
                RichEdit1.Lines.Add(''+'DAJE(S) : '+ Dm.ArqAux1.fieldByname('serie').AsString +'-'+ Dm.ArqAux1.fieldByname('daje').AsString + ' SELO: ' + Dm.ArqAux1.fieldByname('selo').AsString);
                RichEdit1.Lines.Add(''+'Cod. Validação: '+Dm.ArqAux1.fieldByname('selo_validador').AsString);
                //RichEdit1.Lines.Add(''+Dm.ArqAux1.fieldByname('daje_2').AsString);
                 //RichEdit1.Lines.Add('Emolumentos  : R$ ' + StrCurr(Dm.ArqAux1.fieldByname('custas').AsCurrency, 10, True));
                RichEdit1.Lines.Add('Emolumentos: R$' + StrCurr(EmolDaje_1, 10, True) + ' TX. Fiscal.: R$' + StrCurr(TaxaFiscalDaje_1, 10, True));
                RichEdit1.Lines.Add('Fecom: R$' + StrCurr(FecomDaje_1, 10, True) + ' Def.Pub.: R$' + StrCurr(DefPublicaDaje_1, 10, True));
                RichEdit1.Lines.Add('PGE: R$' + StrCurr(pge_11, 10, True) + '    FMMPBA: R$' + StrCurr(FMMPBA_11, 10, True));
                RichEdit1.Lines.Add('TOTAL: R$' + StrCurr(Dm.qryGenerico.fieldByname('vr_daje').AsCurrency, 10, True));
                RichEdit1.Lines.Add(''+ Acentos(F_Menu.Label7.Caption) + ' -BA ' + Dm.ArqAux1.fieldByname('data_p').AsString);
                RichEdit1.Lines.Add('Consulte:');
                RichEdit1.Lines.Add('www.tjba.jus.br/autenticidade');
                Imprime_Zebra(RichEdit1, Nil);
              End;
              Dm.ArqAux1.Next;
            End;
          End;
        End
      else if (F_Menu.Label39.Caption = '28.588.048/0001-81') or (F_Menu.Label39.Caption = '28.588.048/0001-81') Then //Gierc 1 RTD
      begin
        {121100002700670Cavalcante
        => O numero 3 é que vale a posição vertical ou orizontal da palavra
        => o numero 2 é que vale ao tamanho da fonte
        => 27 é que vale altura
        => 870 é que vale ao alinhamento da esquerda para direita}

        dm.qryGenerico.Close;
        dm.qryGenerico.SQL.Clear;
        dm.qryGenerico.SQL.Add('select protocolo, data_p, selo, ext_nat from td where p_auxiliar = '+QuotedStr(F_Exame.MaskEdit1.Text)+'');
        dm.qryGenerico.Open;

        {RichEdit4.Clear;
        RichEdit5.Clear;
        memo2.clear;
        RichEdit4.Lines.Add('f320');
        RichEdit4.Lines.Add('L');
        RichEdit4.Lines.Add('m');
        RichEdit4.Lines.Add('D11');
        RichEdit4.Lines.Add('c0400');
        RichEdit4.Lines.Add('H12');
        geraTextoFormatado;
        RichEdit5.Lines.Add('E');
        RichEdit5.Lines.Add('f10');
                                              //Forma anterior              //'Nova Etiqueta'
        //RichEdit4.Lines.Add('321100003400870'+F_Menu.Label14.Caption + ' -BA ' + TabSql.qry2.fieldByname('data_rg').AsString);//27 mudei para 40 de 30 foi
        RichEdit4.Lines.Add('321100003900870'+F_Menu.LbNomeTitular.Caption );//27 mudei para 40 de 30 foi
        RichEdit4.Lines.Add('321100003600870'+'_________________________________');//27 mudei para 40 de 30 foi
        RichEdit4.Lines.Add('321100003100870'+'Selo '+Dm.qryGenerico.fieldByname('selo').AsString);
        RichEdit4.Lines.Add('321100002800870'+'Em ' + DataExtenso(Dm.qryGenerico.fieldByname('data_p').AsString, False, ''));
        RichEdit4.Lines.Add('321100002400870'+'Registro n. '+Dm.qryGenerico.fieldByname('protocolo').AsString);
        RichEdit4.Lines.Add('321100002000870'+'Prenotado ao protocolo sob o n. ' + F_Exame.MaskEdit1.Text);
        RichEdit4.Lines.Add('321100001400870'+Acentos(dm.qryGenerico.fieldByname('ext_nat').AsString));
        RichEdit4.Lines.Add(''); //Estas duas linhas precisam ficar para o alinhamento na etiqueta
        RichEdit4.Lines.Add(''); //Estas duas linhas precisam ficar para o alinhamento na etiqueta

        Printer.BeginDoc;

        //DirectPrint(copy(RichEdit4.Lines.Text, 0, 28));
        //DirectPrint(copy(RichEdit4.Lines.Text, 28, 236)); // LINHA DO SELO 20
        //DirectPrint(copy(RichEdit4.Lines.Text, 238, 600));

        count := RichEdit4.Lines.Count;
        for j:=0 to count do
        begin
          DirectPrint(RichEdit4.Lines.Strings[j] + #$D#$A#$D#$A);
        end;
        DirectPrint(RichEdit5.Lines.Text);

        Printer.EndDoc;
        Abort;}
      end
      else if (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34377622000155') then  // Rtd Salvador (Juliana)
      begin
        if DefinidoModeloArgox Then
        begin
          Dm.ArqAux1.Close;
          Dm.ArqAux1.Sql.Clear;
          Dm.ArqAux1.Sql.Add('select * from '+ arq +' ');
          Dm.ArqAux1.Open;
          y:= 0;
          Dm.qryGenerico.Close;
          Dm.qryGenerico.SQL.Clear;
          Dm.qryGenerico.SQL.Add(' select * from selos where recibo = '+QuotedStr(Dm.ArqAux1.fieldByname('p_auxiliar').AsString)+' ');
          Dm.qryGenerico.Open;
          if Dm.qryGenerico.RecordCount > 0 Then
          begin
            if Application.MessageBox( Pchar('Existem etiquetas de vias adicionais. Deseja imprimir todas?'),'Menssagem',MB_ICONQUESTION + MB_YESNO ) = Id_yes Then
              imprimirTodas:= True
            else
              imprimirTodas:= False;
          end;

          while y < strtoint(ComboBox3.Text) do
          Begin
            Dm.ArqAux1.First;
            while not Dm.ArqAux1.eof do
            Begin
              if (Dm.Configur.FieldByName('ajusteEtiqueta_tempoReal').AsString= '1') then
              begin
                posicaoX := StrToInt(Edit3.text);
                posicaoY := StrToInt(Edit11.text);
                qrCodeX  := StrToInt(Edit12.text);
                qrCodeY  := StrToInt(Edit13.text);
              end
              else
              begin
                posicaoX := Dm.Configur.FieldByName('etiqueta_posX').AsInteger;
                posicaoY := Dm.Configur.FieldByName('etiqueta_posY').AsInteger;
                qrCodeX  := Dm.Configur.FieldByName('qrCode_posX').AsInteger;
                qrCodeY  := Dm.Configur.FieldByName('qrCode_posY').AsInteger;
              end;
              variacaoY := 11;
              tam_fonte := 9;

              A_CreatePrn(1, 'siscart.txt');
              A_Set_Darkness(12);
              cabec_argox := '';
              A_Prn_Text(posicaoX, posicaoY, 1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Protocolo: '+Dm.ArqAux1.fieldByname('p_auxiliar').AsString+' Registro: '+Dm.ArqAux1.fieldByname('indexador').AsString));
              posicaoY := posicaoY - variacaoY;
              if (Dm.ArqAux1.fieldByname('averba').AsString <> '') and (Dm.ArqAux1.fieldByname('averba').AsString <> '0') Then
                A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('A margem do registro primitivo n '+Dm.ArqAux1.fieldByname('averba').AsString+'' ));
              posicaoY := posicaoY - variacaoY;
              A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('    O QUE CERTIFICO  ' + Dm.ArqAux1.fieldByname('data_p').AsString )); //PegaSelo(qry2.fieldByname('protocolo').AsString))
              posicaoY := posicaoY - variacaoY;

              Dm.qryGenerico.Close;
              Dm.qryGenerico.SQL.Clear;
              Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
              Dm.qryGenerico.Open;
              _SerieDajeComplementar := Dm.qryGenerico.FieldByName('serie_daje_complementar').AsString;
              _DajeComplementar      := Dm.qryGenerico.FieldByName('numero_daje_complementar').AsString;
              _SerieDaje             := '';
              _Daje                  := '';
              _EmolDaje              := 0;
              _ValorDaje             := 0;
              VrDaje_1               := 0;
              EmolDaje_1             := 0;
              TaxaFiscalDaje_1       := 0;
              FecomDaje_1            := 0;
              DefPublicaDaje_1       := 0;
              _EmolDaje := Dm.qryGenerico.FieldByName('emol_daje').AsCurrency;
              _ValorDaje:= Dm.qryGenerico.FieldByName('vr_daje').AsCurrency;
              _SerieDaje:= Dm.qryGenerico.FieldByName('serie_daje').AsString;
              _Daje     := Dm.qryGenerico.FieldByName('numero_daje').AsString;

              if (_ValorDaje > 0) and (_EmolDaje <= 0) Then
              Begin
                VrDaje_1          := _ValorDaje;
                EmolDaje_1        := RoundTo(((VrDaje_1 * emol_daje)/100),    -2);
                TaxaFiscalDaje_1  := RoundTo(((VrDaje_1 * tx_fisc_daje)/100), -2);
                FecomDaje_1       := RoundTo(((VrDaje_1 * fecom_daje)/100),   -2);
                DefPublicaDaje_1  := RoundTo(((VrDaje_1 * def_pub_daje)/100), -2);

                Dm.qryGenerico_Auxiliar3.Close;
                Dm.qryGenerico_Auxiliar3.SQL.Clear;
                Dm.qryGenerico_Auxiliar3.SQL.Add('update daje set');
                Dm.qryGenerico_Auxiliar3.SQL.Add('emol_daje      = ' + QuotedStr(StringReplace(FloatToStr(EmolDaje_1), ',', '.', [rfReplaceAll])));
                Dm.qryGenerico_Auxiliar3.SQL.Add(',tx_fisca_daje = ' + QuotedStr(StringReplace(FloatToStr(TaxaFiscalDaje_1), ',', '.', [rfReplaceAll])));
                Dm.qryGenerico_Auxiliar3.SQL.Add(',fecom_daje    = ' + QuotedStr(StringReplace(FloatToStr(FecomDaje_1), ',', '.', [rfReplaceAll])));
                Dm.qryGenerico_Auxiliar3.SQL.Add(',def_pub_daje  = ' + QuotedStr(StringReplace(FloatToStr(DefPublicaDaje_1), ',', '.', [rfReplaceAll])));
                Dm.qryGenerico_Auxiliar3.SQL.Add('where serie_daje = ' + StrZero(_SerieDaje,3)+' and numero_daje = '+QuotedStr(_Daje)+'' );
                Dm.qryGenerico_Auxiliar3.ExecSQL;
              End;

              Dm.qryGenerico_Auxiliar2.Close;
              Dm.qryGenerico_Auxiliar2.SQL.Clear;
              Dm.qryGenerico_Auxiliar2.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(_SerieDajeComplementar)+' and numero_daje = '+QuotedStr(_DajeComplementar)+' ');
              Dm.qryGenerico_Auxiliar2.Open;

              _EmolDaje := Dm.qryGenerico_Auxiliar2.FieldByName('emol_daje').AsCurrency;
              _ValorDaje:= Dm.qryGenerico_Auxiliar2.FieldByName('vr_daje').AsCurrency;
              _SerieDaje:= Dm.qryGenerico_Auxiliar2.FieldByName('serie_daje').AsString;
              _Daje     := Dm.qryGenerico_Auxiliar2.FieldByName('numero_daje').AsString;

              if (_ValorDaje > 0) and (_EmolDaje <= 0) Then
              Begin
                VrDaje_1          := _ValorDaje;
                EmolDaje_1        := RoundTo(((VrDaje_1 * emol_daje)/100),    -2);
                TaxaFiscalDaje_1  := RoundTo(((VrDaje_1 * tx_fisc_daje)/100), -2);
                FecomDaje_1       := RoundTo(((VrDaje_1 * fecom_daje)/100),   -2);
                DefPublicaDaje_1  := RoundTo(((VrDaje_1 * def_pub_daje)/100), -2);

                Dm.qryGenerico_Auxiliar3.Close;
                Dm.qryGenerico_Auxiliar3.SQL.Clear;
                Dm.qryGenerico_Auxiliar3.SQL.Add('update daje set');
                Dm.qryGenerico_Auxiliar3.SQL.Add('emol_daje      = ' + QuotedStr(StringReplace(FloatToStr(EmolDaje_1), ',', '.', [rfReplaceAll])));
                Dm.qryGenerico_Auxiliar3.SQL.Add(',tx_fisca_daje = ' + QuotedStr(StringReplace(FloatToStr(TaxaFiscalDaje_1), ',', '.', [rfReplaceAll])));
                Dm.qryGenerico_Auxiliar3.SQL.Add(',fecom_daje    = ' + QuotedStr(StringReplace(FloatToStr(FecomDaje_1), ',', '.', [rfReplaceAll])));
                Dm.qryGenerico_Auxiliar3.SQL.Add(',def_pub_daje  = ' + QuotedStr(StringReplace(FloatToStr(DefPublicaDaje_1), ',', '.', [rfReplaceAll])));
                Dm.qryGenerico_Auxiliar3.SQL.Add('where serie_daje = ' + StrZero(_SerieDaje,3)+' and numero_daje = '+QuotedStr(_Daje)+'' );
                Dm.qryGenerico_Auxiliar3.ExecSQL;
              End;

              {Dm.qryGenerico_Auxiliar2.Close;
              Dm.qryGenerico_Auxiliar2.SQL.Clear;
              Dm.qryGenerico_Auxiliar2.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(_SerieDajeComplementar)+' and numero_daje = '+QuotedStr(_DajeComplementar)+' ');
              Dm.qryGenerico_Auxiliar2.Open;}

              if _DajeComplementar <> '' Then
              Begin
                A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico_Auxiliar2.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('emol_daje').AsCurrency) + ' Fecom R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Auxiliar2.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency) + ' Def R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Auxiliar2.fieldByname('def_pub_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
                posicaoY := posicaoY - variacaoY;
                A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar(' Tx Fcal R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Auxiliar2.fieldByname('tx_fisca_daje').AsCurrency + Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency)) + ' Tx Pge R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Auxiliar2.fieldByname('vr_pge').AsCurrency + Dm.qryGenerico.fieldByname('vr_pge').AsCurrency)) + ' FMMPBA R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Auxiliar2.fieldByname('fmmpba').AsCurrency + Dm.qryGenerico.fieldByname('fmmpba').AsCurrency)))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
                posicaoY := posicaoY - variacaoY;
                A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico_Auxiliar2.fieldByname('vr_daje').AsCurrency + Dm.qryGenerico.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))
                posicaoY := posicaoY - variacaoY;
                A_Prn_Text(posicaoX,posicaoY,   1, tam_fonte, 1, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.qryGenerico_Auxiliar2.fieldByname('numero_daje').AsString + ' Serie: '+Dm.qryGenerico_Auxiliar2.fieldByname('serie_daje').AsString+ ' Emissor: '+dm.qryGenerico_Auxiliar2.FieldByName('iddaje_tj').AsString));
                posicaoY := posicaoY - variacaoY;
                A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('SELO:' + Dm.qryGenerico.fieldByname('numero_selo').AsString + ' Validacao:'+Dm.qryGenerico.fieldByname('cod_validacao').AsString));
                posicaoY := posicaoY - variacaoY;
                A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Consulte: www.tjba.jus.br/autenticidade')); // variavel que virá do banco de dados
              End
              Else
              Begin
                Dm.qryGenerico.Close;
                Dm.qryGenerico.SQL.Clear;
                Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
                Dm.qryGenerico.Open;

                A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('emol_daje').AsCurrency) + ' Fecom R$'+FormatCurr('###,##0.00',Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency) + ' Def R$'+FormatCurr('###,##0.00',Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency) )); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
                posicaoY := posicaoY - variacaoY;
                A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Tx Fcal R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency)) + 'Tx Pge R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico.fieldByname('vr_pge').AsCurrency)) + 'FMMPBA R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico.fieldByname('fmmpba').AsCurrency)) )); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
                posicaoY := posicaoY - variacaoY;
                A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))
                posicaoY := posicaoY - variacaoY;
                A_Prn_Text(posicaoX,posicaoY,   1, tam_fonte, 1, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.qryGenerico.fieldByname('numero_daje').AsString + ' Serie: '+Dm.qryGenerico.fieldByname('serie_daje').AsString+ ' Emissor: '+dm.qryGenerico.FieldByName('iddaje_tj').AsString));
                posicaoY := posicaoY - variacaoY;
                A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('SELO:' + Dm.qryGenerico.fieldByname('numero_selo').AsString + ' Validacao:'+Dm.qryGenerico.fieldByname('cod_validacao').AsString));
                posicaoY := posicaoY - variacaoY;
                A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Consulte: www.tjba.jus.br/autenticidade'));
              End;
              posicaoY := posicaoY - variacaoY;

              {if (_DajeComplementar = '') Then
              Begin
                dm.qryGenerico_Auxiliar4.Close;
                dm.qryGenerico_Auxiliar4.SQL.Clear;
                dm.qryGenerico_Auxiliar4.SQL.Add('select iddaje_tj from daje where numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' and serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+'');
                dm.qryGenerico_Auxiliar4.Open;
                dm.qryGenerico_Auxiliar4.Last;
                A_Prn_Text(posicaoX,50 ,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + '      Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+dm.qryGenerico_Auxiliar4.FieldByName('iddaje_tj').AsString));
                A_Prn_Text(posicaoX,22 ,  4, 9        , 0, 2, 1, 'n', 2, pchar(Dm.ArqAux1.fieldByname('selo').AsString)); // variavel que virá do banco de dados
                A_Prn_Text(posicaoX,22 ,  4, 9        , 0, 2, 1, 'n', 2, pchar('  '+Dm.ArqAux1.fieldByname('selo_validador').AsString)); // variavel que virá do banco de dados
              End
              Else
              Begin
                dm.qryGenerico_Auxiliar4.Close;
                dm.qryGenerico_Auxiliar4.SQL.Clear;
                dm.qryGenerico_Auxiliar4.SQL.Add('select iddaje_tj from daje where numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' and serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+'');
                dm.qryGenerico_Auxiliar4.Open;
                dm.qryGenerico_Auxiliar4.Last;
                A_Prn_Text(posicaoX,50 ,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + '      Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+dm.qryGenerico_Auxiliar4.FieldByName('iddaje_tj').AsString));
                A_Prn_Text(posicaoX,22 ,  4, 9        , 0, 2, 1, 'n', 2, pchar(Dm.ArqAux1.fieldByname('selo').AsString)); // variavel que virá do banco de dados
                A_Prn_Text(posicaoX,22 ,  4, 9        , 0, 2, 1, 'n', 2, pchar('  '+Dm.ArqAux1.fieldByname('selo_validador').AsString)); // variavel que virá do banco de dados
              End;}

              posicaoY := posicaoY - variacaoY;
              A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar(sAssinaturaEtiqueta));
              posicaoY := posicaoY - variacaoY;
              A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar(sCargoEtiqueta));
              posicaoY := posicaoY - variacaoY;

              if FileExists(caminho_imgselo+'qrcode.bmp') Then
                DeleteFile(caminho_imgselo+'qrcode.bmp');

              WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'DAJE.EXE ' + 'CQ;'+TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.')+';'+caminho_imgselo+';'+'dbtd;'+'TD;'),SW_HIDE);

              if FileExists(caminho_imgselo+'qrcode_'+TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.')+'.bmp') and (FileExists('c:\siscart\imgselo\QRCodeBranco.bmp')) then
              begin
                ConverteBMPBit('c:\siscart\imgselo\QRCodeBranco.bmp', caminho_imgselo+'qrcode.bmp');
                if FileExists('C:\siscart\imgselo\QrCode.bmp') then
                  A_Get_Graphic(qrCodeX, qrCodeY, 2, 'B', pchar('C:\Siscart\imgselo\QrCode.bmp'));
              end;

              A_Print_Out(1, 1, 1, 1);
              A_ClosePrn;
              Dm.ArqAux1.Next;

              if imprimirTodas Then
              begin
                ImprimiEtiquetaDeViasAdicionaisDaTabelaTD(Dm.ArqAux1.fieldByname('p_auxiliar').AsString);
                ImprimiEtiquetaDeViasAdicionais(Dm.ArqAux1.fieldByname('p_auxiliar').AsString);
              end;
              inc(y);
            end;
          end;
        end;
      end
      else if false then  // Rtd Una
      begin
        if DefinidoModeloArgox then
        begin
          y:= 0;
          dm.qryGenerico.Close;
          dm.qryGenerico.SQL.Clear;
          dm.qryGenerico.SQL.Add('select protocolo, data_p, selo, ext_nat from td where p_auxiliar = '+QuotedStr(F_Exame.MaskEdit1.Text)+'');
          dm.qryGenerico.Open;

          while y < strtoint(ComboBox3.Text) do
          begin
            Dm.qryGenerico.First;
            while not Dm.qryGenerico.eof do
            Begin
              if (Dm.Configur.FieldByName('ajusteEtiqueta_tempoReal').AsString= '1') then
              begin
                posicaoX := StrToInt(Edit3.text);
                posicaoY := StrToInt(Edit11.text);
                qrCodeX  := StrToInt(Edit12.text);
                qrCodeY  := StrToInt(Edit13.text);
              end
              else
              begin
                posicaoX := Dm.Configur.FieldByName('etiqueta_posX').AsInteger;
                posicaoY := Dm.Configur.FieldByName('etiqueta_posY').AsInteger;
                qrCodeX  := Dm.Configur.FieldByName('qrCode_posX').AsInteger;
                qrCodeY  := Dm.Configur.FieldByName('qrCode_posY').AsInteger;
              end;
              variacaoY := 11;
              tam_fonte := 9;

              A_CreatePrn(1, 'siscart.txt');
              A_Set_Darkness(12);
              A_Prn_Text(posicaoX, posicaoY, 1, tam_fonte, 2, 1, 1, 'n', 2, pchar(Acentos(dm.qryGenerico.fieldByname('ext_nat').AsString)));
              posicaoY := posicaoY - variacaoY;
              A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Prenotado ao protocolo sob o n. ' + F_Exame.MaskEdit1.Text));
              posicaoY := posicaoY - variacaoY;
              A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Registro n. '+Dm.qryGenerico.fieldByname('protocolo').AsString));
              posicaoY := posicaoY - variacaoY;
              A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Em ' + DataExtenso(Dm.qryGenerico.fieldByname('data_p').AsString, False, '')));
              posicaoY := posicaoY - variacaoY;
              A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Selo '+Dm.qryGenerico.fieldByname('selo').AsString));
              posicaoY := posicaoY - variacaoY;
              A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('_________________________________'));
              posicaoY := posicaoY - variacaoY;
              A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar(F_Menu.LbNomeTitular.Caption));
              posicaoY := posicaoY - variacaoY;

              if FileExists(caminho_imgselo+'qrcode.bmp') Then
                DeleteFile(caminho_imgselo+'qrcode.bmp');

              WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'DAJE.EXE ' + 'CQ;'+TirarTudo(Dm.qryGenerico.fieldByname('selo').AsString,'-','/','.')+';'+caminho_imgselo+';'+'dbtd;'+'TD;'),SW_HIDE);

              if FileExists(caminho_imgselo+'qrcode_'+TirarTudo(Dm.qryGenerico.fieldByname('selo').AsString,'-','/','.')+'.bmp') and (FileExists('c:\siscart\imgselo\QRCodeBranco.bmp')) then
              begin
                ConverteBMPBit('c:\siscart\imgselo\QRCodeBranco.bmp', caminho_imgselo+'qrcode.bmp');
                if FileExists('C:\siscart\imgselo\QrCode.bmp') then
                  A_Get_Graphic(qrCodeX, qrCodeY, 2, 'B', pchar('C:\Siscart\imgselo\QrCode.bmp'));
              end;

              A_Print_Out(1, 1, 1, 1);
              A_ClosePrn;

              inc(y);
              Dm.qryGenerico.Next;
            end;
          end;
        end;
      end
      else if (F_Menu.Label39.Caption = '27.215.296/0001-14') or (F_Menu.Label39.Caption = '27215296000114') Then //Eder de Valença
      begin
        if DefinidoModeloArgox then
        begin
          Dm.ArqAux1.Close;
          Dm.ArqAux1.Sql.Clear;
          Dm.ArqAux1.Sql.Add('select * from '+ arq +' ');
          Dm.ArqAux1.Open;
          y:= 0;
          Dm.qryGenerico.Close;
          Dm.qryGenerico.SQL.Clear;
          Dm.qryGenerico.SQL.Add(' select * from selos where recibo = '+QuotedStr(Dm.ArqAux1.fieldByname('p_auxiliar').AsString)+' ');
          Dm.qryGenerico.Open;

          {if Dm.qryGenerico.RecordCount > 0 Then
          Begin
          if Application.MessageBox( Pchar('Existem etiquetas de vias adicionais. Deseja imprimir todas?'),'Menssagem',MB_ICONQUESTION + MB_YESNO ) = Id_yes Then
            imprimirTodas:= True
          else
          imprimirTodas:= False;
          End; }

          while y < strtoint(ComboBox3.Text) do
          Begin
            Dm.ArqAux1.First;

            while not Dm.ArqAux1.eof do
            Begin


              A_CreatePrn(1, 'siscart.txt'); // Inicia Operacao da Impressora
              A_Set_Darkness(12);
              tam_fonte := 9;
              cabec_argox := '';         // mandar para edere valença para testar

              //A_Prn_Text(50,130,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar(UpperCase(F_menu.Label29.Caption))); //nome do cartorio
              //A_Prn_Text(50,120,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar(F_Menu.Label11.Caption)); //endereco


              A_Prn_Text(50,110,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Protocolo: '+Dm.ArqAux1.fieldByname('p_auxiliar').AsString+' - TD'));
              A_Prn_Text(50,100,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Registro: '+Dm.ArqAux1.fieldByname('indexador').AsString+''));

              {if (Dm.ArqAux1.fieldByname('averba').AsString <> '') and (Dm.ArqAux1.fieldByname('averba').AsString <> '0') Then
              Begin
                A_Prn_Text(50,90,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('A margem do registro primitivo n '+Dm.ArqAux1.fieldByname('averba').AsString+'' ));
              End; }

              Dm.qryGenerico.Close;
              Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
              Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
              Dm.qryGenerico.Open;

              A_Prn_Text(50, 72,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.Configur.fieldByname('id_eselo').AsString));
              A_Prn_Text(50, 60,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Selo: '+Dm.ArqAux1.fieldByname('selo').AsString +' Cod. Validacao: '+Dm.ArqAux1.fieldByname('selo_validador').AsString)); // variavel que virá do banco de dados


              _SerieDajeComplementar := Dm.qryGenerico.FieldByName('serie_daje_complementar').AsString;
              _DajeComplementar      := Dm.qryGenerico.FieldByName('numero_daje_complementar').AsString;

              Dm.qryGenerico_Auxiliar2.Close;
              Dm.qryGenerico_Auxiliar2.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
              Dm.qryGenerico_Auxiliar2.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(_SerieDajeComplementar)+' and numero_daje = '+QuotedStr(_DajeComplementar)+' ');
              Dm.qryGenerico_Auxiliar2.Open;

              if Dm.qryGenerico_Auxiliar2.IsEmpty then
              begin
                A_Prn_Text(50,46,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Custas: Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency) + ' Taxa Fiscal: R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency) ))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
                A_Prn_Text(50,30 ,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))
              end
              else
              begin
                A_Prn_Text(50,46,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Custas: Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico_Auxiliar2.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico_Auxiliar2.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency + Dm.qryGenerico_Auxiliar2.fieldByname('def_pub_daje').AsCurrency) + ' Taxa Fiscal: R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Auxiliar2.fieldByname('tx_fisca_daje').AsCurrency) )));
                A_Prn_Text(50,30 ,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_daje').AsCurrency + Dm.qryGenerico_Auxiliar2.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))
              end;

              A_Prn_Text(50,17,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('          ' + Acentos(F_Menu.Label7.Caption) + ' -BA ' + Dm.ArqAux1.fieldByname('data_p').AsString )); //PegaSelo(qry2.fieldByname('protocolo').AsString))

              A_Print_Out(1, 1, 1, 1);

              A_ClosePrn;
              Dm.ArqAux1.Next;

              inc(y);


            End;
         End;
        End
      End
      Else  if ((TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '28588048000181') OR (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104')
            or (F_Menu.Label39.Caption = '01.221.489/0001-94') or (F_Menu.Label39.Caption = '01221489000194')
            or (F_Menu.Label39.Caption = '27.145.475/0001-22') or (F_Menu.Label39.Caption = '27145475000122')) then // adriel if (F_Menu.Label39.Caption = '01.221.489/0001-94') or (F_Menu.Label39.Caption = '01221489000194') Then //Jean de Jean Bom Jesus da Lapa
      Begin
        if DefinidoModeloArgox Then
        Begin
          Dm.ArqAux1.Close;
          Dm.ArqAux1.Sql.Clear;
          Dm.ArqAux1.Sql.Add('select * from '+ arq +' ');
          Dm.ArqAux1.Open;

          y:= 0;

          Dm.qryGenerico.Close;
          Dm.qryGenerico.SQL.Clear;
          Dm.qryGenerico.SQL.Add(' select * from selos where recibo = '+QuotedStr(Dm.ArqAux1.fieldByname('p_auxiliar').AsString)+' ');
          Dm.qryGenerico.Open;

          {if Dm.qryGenerico.RecordCount > 0 Then
          Begin
          if Application.MessageBox( Pchar('Existem etiquetas de vias adicionais. Deseja imprimir todas?'),'Menssagem',MB_ICONQUESTION + MB_YESNO ) = Id_yes Then
            imprimirTodas:= True
          else
          imprimirTodas:= False;
          End; }
          if  (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104') then
          begin
            while y < strtoint(ComboBox3.Text) do
            Begin
              Dm.ArqAux1.First;
              while not Dm.ArqAux1.eof do
              Begin
                A_CreatePrn(1, 'siscart.txt'); // Inicia Operacao da Impressora
                A_Set_Darkness(12);
                cabec_argox := '';         // mandar para edere valença para testar

                tam_fonte:= 9;

                Dm.qryGenerico.Close;
                Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
                Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
                Dm.qryGenerico.Open;

                             //era 70
                _SerieDajeComplementar := Dm.qryGenerico.FieldByName('serie_daje_complementar').AsString;
                _DajeComplementar      := Dm.qryGenerico.FieldByName('numero_daje_complementar').AsString;

                if FileExists(caminho_imgselo+'qrcode_' + TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.') +'.bmp') then //+'qrcode.bmp') Then             sssss
                  DeleteFile(caminho_imgselo+'qrcode_' + TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.') +'.bmp'); //+'qrcode.bmp');

                WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'DAJE.EXE ' + 'CQ;'+TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.')+';'+caminho_imgselo+';'+'dbtd;'+'TD;ETQ;'),SW_HIDE);
                sleep(10000);
                Dm.KillTask(F_Menu.LbCaminhoDajeIntegracao.Caption+'Daje.exe');

                ConverteBMPBit('c:\siscart\imgselo\QRCodeBranco.bmp', caminho_imgselo+'qrcode_' + TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.') +'.bmp');   //+'qrcode.bmp');
                A_Get_Graphic(35, 85, 1, 'B', pchar('C:\siscart\imgselo\QrCode.bmp'));


//                A_Get_Graphic(20, 85, 1, 'B', pchar(caminho_imgselo+'qrcode_' + TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.') +'.bmp'));

                          //390

                A_Prn_Text(350,170,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar(Acentos('www.tjba.jus.br/autenticidade'))); //PegaSelo(qry2.fieldByname('protocolo').AsString))
                A_Prn_Text(350,160,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar(Acentos('Consulte:'))); //PegaSelo(qry2.fieldByname('protocolo').AsString))

                A_Prn_Text(350,150,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar(Acentos(F_Menu.Label7.Caption) + ' -BA ' + Dm.ArqAux1.fieldByname('data_p').AsString )); //PegaSelo(qry2.fieldByname('protocolo').AsString))

                Dm.qryGenerico_Auxiliar2.Close;
                Dm.qryGenerico_Auxiliar2.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
                Dm.qryGenerico_Auxiliar2.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(_SerieDajeComplementar)+' and numero_daje = '+QuotedStr(_DajeComplementar)+' ');
                Dm.qryGenerico_Auxiliar2.Open;

                if Dm.qryGenerico_Auxiliar2.IsEmpty then
                begin
                  A_Prn_Text(350,140,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_daje').AsCurrency)));
                  A_Prn_Text(350,130,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Def.Pub R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency)+ ' Pge R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_pge').AsCurrency)+ ' Fmmpba R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('fmmpba').AsCurrency)));
                  A_Prn_Text(350,120,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Taxa Fiscal: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency)));
                  A_Prn_Text(350,110,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Custas: Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('emol_daje').AsCurrency) +' Fecom R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency)));
                end
                else
                begin
                  A_Prn_Text(350,140,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_daje').AsCurrency + Dm.qryGenerico.fieldByname('vr_daje').AsCurrency)));
                  A_Prn_Text(350,130,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Def.Pub R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency)+ ' Pge R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_pge').AsCurrency)+ ' Fmmpba R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('fmmpba').AsCurrency)));
                  A_Prn_Text(350,120,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar(' Taxa Fiscal: R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Auxiliar2.fieldByname('tx_fisca_daje').AsCurrency))));
                  A_Prn_Text(350,110,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Custas: Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('emol_daje').AsCurrency) +' Fecom R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency)));

               end;


                Dm.qryGenerico.Close;
                Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
                Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
                Dm.qryGenerico.Open;

                A_Prn_Text(350, 100,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Selo: '+Dm.ArqAux1.fieldByname('selo').AsString +' Val.: '+Dm.ArqAux1.fieldByname('selo_validador').AsString)); // variavel que virá do banco de dados
                if Dm.qryGenerico.FieldByName('iddaje_tj').AsString <> '' then
                  A_Prn_Text(350, 90,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.qryGenerico.FieldByName('iddaje_tj').AsString))
                else
                  A_Prn_Text(350, 90,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.Configur.fieldByname('id_eselo').AsString));

                A_Prn_Text(350,80,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Protocolo: '+Dm.ArqAux1.fieldByname('p_auxiliar').AsString+' - '+'Registro: '+Dm.ArqAux1.fieldByname('indexador').AsString+'  - '+'Averbacao: '+Dm.ArqAux1.fieldByname('averba').AsString+''));
                A_Prn_Text(350,60,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Registro de Titulos e Documentos'));

                tam_fonte:= 1;
                             //era 70


                width  := 1;
                height := 1;
                copies := 1;
                amount := 1;

                A_Print_Out(width, height, copies, amount);

                A_ClosePrn;
                Dm.ArqAux1.Next;

                inc(y);


              End;
           End;
          end
          else
          begin
            while y < strtoint(ComboBox3.Text) do
            Begin
              Dm.ArqAux1.First;

              while not Dm.ArqAux1.eof do
              Begin


                A_CreatePrn(1, 'siscart.txt'); // Inicia Operacao da Impressora
                A_Set_Darkness(12);
                cabec_argox := '';         // mandar para edere valença para testar

                tam_fonte:= 9;

                Dm.qryGenerico.Close;
                Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
                Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
                Dm.qryGenerico.Open;

                             //era 70
                _SerieDajeComplementar := Dm.qryGenerico.FieldByName('serie_daje_complementar').AsString;
                _DajeComplementar      := Dm.qryGenerico.FieldByName('numero_daje_complementar').AsString;


                if FileExists(caminho_imgselo+'qrcode.bmp') Then
                  DeleteFile(caminho_imgselo+'qrcode.bmp');

                WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'DAJE.EXE ' + 'CQ;'+TirarTudo(Dm.ArqAux1.fieldByname('selo').AsString,'-','/','.')+';'+caminho_imgselo+';'+'dbtd;'+'TD;'),SW_HIDE);

                ConverteBMPBit('c:\siscart\imgselo\QRCodeBranco.bmp', caminho_imgselo+'qrcode.bmp');


                A_Get_Graphic(20, 85, 1, 'B', pchar('C:\siscart\imgselo\QrCode.bmp'));


                          //390

                A_Prn_Text(350,160,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar(Acentos('www.tjba.jus.br/autenticidade'))); //PegaSelo(qry2.fieldByname('protocolo').AsString))
                A_Prn_Text(350,150,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar(Acentos('Consulte:'))); //PegaSelo(qry2.fieldByname('protocolo').AsString))

                A_Prn_Text(350,140,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar(Acentos(F_Menu.Label7.Caption) + ' -BA ' + Dm.ArqAux1.fieldByname('data_p').AsString )); //PegaSelo(qry2.fieldByname('protocolo').AsString))

                Dm.qryGenerico_Auxiliar2.Close;
                Dm.qryGenerico_Auxiliar2.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
                Dm.qryGenerico_Auxiliar2.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(_SerieDajeComplementar)+' and numero_daje = '+QuotedStr(_DajeComplementar)+' ');
                Dm.qryGenerico_Auxiliar2.Open;

                if Dm.qryGenerico_Auxiliar2.IsEmpty then
                begin

                    A_Prn_Text(350,130,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))
                    A_Prn_Text(350,120,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Custas: Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
                    A_Prn_Text(350,110,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Taxa Fiscal: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency)));
                end
                else
                begin
                  A_Prn_Text(350,130,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_daje').AsCurrency + Dm.qryGenerico_Auxiliar2.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))
                  A_Prn_Text(350,120,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Custas: Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico_Auxiliar2.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico_Auxiliar2.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency + Dm.qryGenerico_Auxiliar2.fieldByname('def_pub_daje').AsCurrency)));
                  A_Prn_Text(350,110,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar(' Taxa Fiscal: R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency + Dm.qryGenerico_Auxiliar2.fieldByname('tx_fisca_daje').AsCurrency))));
               end;


                Dm.qryGenerico.Close;
                Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
                Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
                Dm.qryGenerico.Open;

                A_Prn_Text(350, 100,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Selo: '+Dm.ArqAux1.fieldByname('selo').AsString +' Val.: '+Dm.ArqAux1.fieldByname('selo_validador').AsString)); // variavel que virá do banco de dados
                if Dm.qryGenerico.FieldByName('iddaje_tj').AsString <> '' then
                  A_Prn_Text(350, 90,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.qryGenerico.FieldByName('iddaje_tj').AsString))
                else
                  A_Prn_Text(350, 90,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.Configur.fieldByname('id_eselo').AsString));

                A_Prn_Text(350,80,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Protocolo: '+Dm.ArqAux1.fieldByname('p_auxiliar').AsString+' - '+'Registro: '+Dm.ArqAux1.fieldByname('indexador').AsString+''));
                A_Prn_Text(350,60,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Registro de Titulos e Documentos'));

                tam_fonte:= 1;
                             //era 70


                width  := 1;
                height := 1;
                copies := 1;
                amount := 1;

                A_Print_Out(width, height, copies, amount);

                A_ClosePrn;
                Dm.ArqAux1.Next;

                inc(y);


              End;
           End;
         end;
        End;
      End
      Else if (F_Menu.Label39.Caption = '28.224.408/0001-66') or (F_Menu.Label39.Caption = '28224408000166') Then //Adenilton feira
      Begin
        if DefinidoModeloArgox Then
        begin
          Dm.ArqAux1.Close;
          Dm.ArqAux1.Sql.Clear;
          Dm.ArqAux1.Sql.Add('select * from '+ arq +' ');
          Dm.ArqAux1.Open;

          y:= 0;

          Dm.qryGenerico.Close;
          Dm.qryGenerico.SQL.Clear;
          Dm.qryGenerico.SQL.Add(' select * from selos where recibo = '+QuotedStr(Dm.ArqAux1.fieldByname('p_auxiliar').AsString)+' ');
          Dm.qryGenerico.Open;

          {if Dm.qryGenerico.RecordCount > 0 Then
          Begin
          if Application.MessageBox( Pchar('Existem etiquetas de vias adicionais. Deseja imprimir todas?'),'Menssagem',MB_ICONQUESTION + MB_YESNO ) = Id_yes Then
            imprimirTodas:= True
          else
          imprimirTodas:= False;
          End; }

          while y < strtoint(ComboBox3.Text) do
          begin
            Dm.ArqAux1.First;
            while not Dm.ArqAux1.eof do
            Begin
              A_CreatePrn(1, 'siscart.txt');
              A_Set_Darkness(12);
              tam_fonte := 9;
              cabec_argox := '';
              A_Prn_Text(30,130,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar(UpperCase('CARTORIO DE REG. DE TIT. E DOC. E PESSOA JURIDICA')));
              A_Prn_Text(30,120,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar(F_Menu.Label11.Caption));
              A_Prn_Text(30,110,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Protocolo TD: '+Dm.ArqAux1.fieldByname('p_auxiliar').AsString+' Livro: B'));
              A_Prn_Text(30,100,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Registro: '+Dm.ArqAux1.fieldByname('indexador').AsString+''));

              Dm.qryGenerico.Close;
              Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
              Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
              Dm.qryGenerico.Open;

              if Dm.qryGenerico.FieldByName('iddaje_tj').AsString <> '' then
                A_Prn_Text(30, 72,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.qryGenerico.FieldByName('iddaje_tj').AsString))
              else
                A_Prn_Text(30, 72,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.Configur.fieldByname('id_eselo').AsString));
              A_Prn_Text(30, 60,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Selo: '+Dm.ArqAux1.fieldByname('selo').AsString +' Cod. Validacao: '+Dm.ArqAux1.fieldByname('selo_validador').AsString)); // variavel que virá do banco de dados
              A_Prn_Text(30,46,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Custas: Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency) + ' Taxa Fiscal: R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency) ))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
              A_Prn_Text(30,30 ,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))
              A_Prn_Text(30,17,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('          ' + Acentos(F_Menu.Label7.Caption) + ' -BA ' + Dm.ArqAux1.fieldByname('data_p').AsString )); //PegaSelo(qry2.fieldByname('protocolo').AsString))
              A_Print_Out(1, 1, 1, 1);
              A_ClosePrn;
              Dm.ArqAux1.Next;

              inc(y);


            End;
         End;
        End
      End
      Else if DefinidoModeloArgox Then
      Begin
        Dm.ArqAux1.Close;
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('select * from '+ arq +' ');
        Dm.ArqAux1.Open;

        y:= 0;

        Dm.qryGenerico.Close;
        Dm.qryGenerico.SQL.Clear;
        Dm.qryGenerico.SQL.Add(' select * from selos where recibo = '+QuotedStr(Dm.ArqAux1.fieldByname('p_auxiliar').AsString)+' ');
        Dm.qryGenerico.Open;

        {if Dm.qryGenerico.RecordCount > 0 Then
        Begin
        if Application.MessageBox( Pchar('Existem etiquetas de vias adicionais. Deseja imprimir todas?'),'Menssagem',MB_ICONQUESTION + MB_YESNO ) = Id_yes Then
          imprimirTodas:= True
        else
          imprimirTodas:= False;
        End; }

        while y < strtoint(ComboBox3.Text) do
        Begin
          Dm.ArqAux1.First;
          while not Dm.ArqAux1.eof do
          Begin
            A_CreatePrn(1, 'siscart.txt'); // Inicia Operacao da Impressora
            A_Set_Darkness(12);
            tam_fonte := 9;
            cabec_argox := '';

            if (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '28504578000102') then //Barra da Estiva
            begin
              if (Dm.Configur.FieldByName('ajusteEtiqueta_tempoReal').AsString= '1') then
              begin
                posicaoX := StrToInt(Edit3.text);
                posicaoY := StrToInt(Edit11.text);
                qrCodeX  := StrToInt(Edit12.text);
                qrCodeY  := StrToInt(Edit13.text);
              end
              else
              begin
                posicaoX := Dm.Configur.FieldByName('etiqueta_posX').AsInteger;
                posicaoY := Dm.Configur.FieldByName('etiqueta_posY').AsInteger;
                qrCodeX  := Dm.Configur.FieldByName('qrCode_posX').AsInteger;
                qrCodeY  := Dm.Configur.FieldByName('qrCode_posY').AsInteger;
              end;
              if F_RETQ.edtEspacamentoLinhas.Text = '' then
                variacaoY := 11
              else
                variacaoY := StrToInt(F_RETQ.edtEspacamentoLinhas.Text);

              A_Prn_Text(posicaoX, posicaoY,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Protocolo: '+Dm.ArqAux1.fieldByname('p_auxiliar').AsString+''));
              inc(posicaoY, variacaoY);
              A_Prn_Text(posicaoX, posicaoY,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Registro: '+Dm.ArqAux1.fieldByname('indexador').AsString+''));
              inc(posicaoY, variacaoY);
              if (Dm.ArqAux1.fieldByname('averba').AsString <> '') and (Dm.ArqAux1.fieldByname('averba').AsString <> '0') Then
              begin
                A_Prn_Text(posicaoX, posicaoY, 3, tam_fonte, 2, 1, 1, 'n', 2, pchar('A margem do registro primitivo n '+Dm.ArqAux1.fieldByname('averba').AsString+'' ));
                inc(posicaoY, variacaoY);
              end;
              Dm.qryGenerico.Close;
              Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
              Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
              Dm.qryGenerico.Open;
              A_Prn_Text(posicaoX, posicaoY, 3, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.Configur.fieldByname('id_eselo').AsString));
              inc(posicaoY, variacaoY);
              A_Prn_Text(posicaoX, posicaoY, 3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Selo: '+Dm.ArqAux1.fieldByname('selo').AsString +' Cod. Validacao: '+Dm.ArqAux1.fieldByname('selo_validador').AsString)); // variavel que virá do banco de dados
              inc(posicaoY, variacaoY);
              A_Prn_Text(posicaoX, posicaoY, 3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Custas: Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency) + ' Taxa Fiscal: R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency) ))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
              inc(posicaoY, variacaoY);
              A_Prn_Text(posicaoX, posicaoY, 3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))
              inc(posicaoY, variacaoY);
              A_Prn_Text(posicaoX, posicaoY, 3, tam_fonte, 2, 1, 1, 'n', 2, pchar('          ' + Acentos(F_Menu.Label7.Caption) + ' -BA ' + Dm.ArqAux1.fieldByname('data_p').AsString )); //PegaSelo(qry2.fieldByname('protocolo').AsString))}
              if FileExists(caminho_imgselo+'qrcode.bmp') Then
                DeleteFile(caminho_imgselo+'qrcode.bmp');

              WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'DAJE.EXE ' + 'CQ;'+TirarTudo(Dm.qryGenerico.fieldByname('numero_selo').AsString,'-','/','.')+';'+caminho_imgselo+';'+'dbtd;'+'TD;'),SW_HIDE);
              if FileExists(caminho_imgselo+'qrcode_'+TirarTudo(Dm.qryGenerico.fieldByname('numero_selo').AsString,'-','/','.')+'.bmp') and (FileExists('c:\siscart\imgselo\QRCodeBranco.bmp')) then
              begin
                ConverteBMPBit('c:\siscart\imgselo\QRCodeBranco.bmp', caminho_imgselo+'qrcode.bmp');
                if FileExists('C:\siscart\imgselo\QrCode.bmp') then
                  A_Get_Graphic(qrCodeX, qrCodeY, 2, 'B', pchar('C:\Siscart\imgselo\QrCode.bmp'));
              end;

              A_Print_Out(1, 1, 1, 1);
              A_ClosePrn;
              Dm.ArqAux1.Next;
            end
            else
            begin
              {Nome do cartorio para o cabeçalho}
              //A_Prn_Text(50,130,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar(UpperCase(F_menu.Label29.Caption))); //nome do cartorio
              //A_Prn_Text(50,120,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar(F_Menu.Label11.Caption)); //endereco
              // adriel 10-09-2021
             if ((TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '28588048000181') or (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104')) then
             begin

               A_Prn_Text(370,70,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Protocolo: '+Dm.ArqAux1.fieldByname('p_auxiliar').AsString+''));
               A_Prn_Text(370,80,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Registro: '+Dm.ArqAux1.fieldByname('indexador').AsString+''));
             end
             else
             begin
               A_Prn_Text(50,110,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Protocolo: '+Dm.ArqAux1.fieldByname('p_auxiliar').AsString+''));
               A_Prn_Text(50,100,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Registro: '+Dm.ArqAux1.fieldByname('indexador').AsString+''));
             end;

              {if (Dm.ArqAux1.fieldByname('averba').AsString <> '') and (Dm.ArqAux1.fieldByname('averba').AsString <> '0') Then
              Begin
                A_Prn_Text(50,90,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('A margem do registro primitivo n '+Dm.ArqAux1.fieldByname('averba').AsString+'' ));
              End; }

              Dm.qryGenerico.Close;
              Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
              Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('serie').AsString)+' and numero_daje = '+QuotedStr(Dm.ArqAux1.fieldByname('daje').AsString)+' ');
              Dm.qryGenerico.Open;

              if ((TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '28588048000181') or (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104')) then
              begin
                if Dm.qryGenerico.FieldByName('iddaje_tj').AsString <> '' then
                  A_Prn_Text(370, 100,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.qryGenerico.FieldByName('iddaje_tj').AsString))
                else
                  A_Prn_Text(370, 100,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.Configur.fieldByname('id_eselo').AsString));

                A_Prn_Text(370, 112,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Selo: '+Dm.ArqAux1.fieldByname('selo').AsString +' Cod. Validacao: '+Dm.ArqAux1.fieldByname('selo_validador').AsString)); // variavel que virá do banco de dados

                A_Prn_Text(370,130,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Custas: Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency) + ' Taxa Fiscal: R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency) ))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
                A_Prn_Text(370,140 , 1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))

                A_Prn_Text(370,150,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('          ' + Acentos(F_Menu.Label7.Caption) + ' -BA ' + Dm.ArqAux1.fieldByname('data_p').AsString )); //PegaSelo(qry2.fieldByname('protocolo').AsString))

              end
              else
              begin
                if Dm.qryGenerico.FieldByName('iddaje_tj').AsString <> '' then
                  A_Prn_Text(50, 72,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.qryGenerico.FieldByName('iddaje_tj').AsString))
                else
                  A_Prn_Text(50, 72,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.ArqAux1.fieldByname('daje').AsString + ' Serie: '+Dm.ArqAux1.fieldByname('serie').AsString+ '      Emissor: '+Dm.Configur.fieldByname('id_eselo').AsString));
                A_Prn_Text(50, 60,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Selo: '+Dm.ArqAux1.fieldByname('selo').AsString +' Cod. Validacao: '+Dm.ArqAux1.fieldByname('selo_validador').AsString)); // variavel que virá do banco de dados

                A_Prn_Text(50,46,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Custas: Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency) + ' Taxa Fiscal: R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency) ))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
                A_Prn_Text(50,30 ,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))

                A_Prn_Text(50,17,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('          ' + Acentos(F_Menu.Label7.Caption) + ' -BA ' + Dm.ArqAux1.fieldByname('data_p').AsString )); //PegaSelo(qry2.fieldByname('protocolo').AsString))

              end;

              A_Print_Out(1, 1, 1, 1);
              A_ClosePrn;
              Dm.ArqAux1.Next;
            end;
          End;
          inc(y);
        End;
      End
      Else
      Begin
        AssignFile(F, F_Menu.Label44.Caption);
        Rewrite(F);
      while not dm.ArqAux.Eof do
      begin
        if False then  // (not F_Etqr.RadioButton2.Checked) then
        Begin
          { modo impressao normal - especificar chr(18) }
          Write(F, Chr(18)+Chr(27)+Chr(77));
          // Write(F, Chr(18));
          WriteLn(F);
          //Write(F, Chr(18));
          Write(F, Chr(18)+Chr(27)+Chr(48));
        end
        else
        Begin
          { Modo Impressao condensada - especificar chr(15) }
          Write(F, Chr(18)+Chr(27)+Chr(77));
          // Write(F, Chr(18));
          WriteLn(F);
          // Write(F, Chr(18));
          Write(F, Chr(15)+Chr(27)+Chr(48));
        end;
        If F_Menu.Label7.Caption = 'CASIMIRO DE ABREU' then
        Begin
          {buffer := dm.ArqAux.FieldByName('linha1').AsString;
          Writeln(F, buffer);
          buffer := dm.ArqAux.FieldByName('linha4').AsString;
          Writeln(F, buffer);
          buffer := copy(dm.ArqAux.FieldByName('linha2').AsString, 1, 75);
          Writeln(F, buffer);
          buffer := copy(dm.ArqAux.FieldByName('linha2').AsString, 76, 75);
          Writeln(F, buffer);
          buffer := dm.ArqAux.FieldByName('linha3').AsString;
          Writeln(F, buffer);
          Writeln(F, dm.ArqAux.FieldByName('linha5').AsString);
          buffer := '________________________________________________________ ';
          Writeln(F, buffer);
          buffer := (F_RETQ.ComboBox1.Text) + ' - ' + (F_RETQ.ComboBox2.Text);
          Writeln(F, buffer);
          buffer := dm.ArqAux.FieldByName('linha4').AsString;
          buffer := 'Emol     3217/99   4664/05   111/06   3716/02     590/82     Total';
          Writeln(F, buffer);
          buffer := Trim(StrCurr(Dm.ArqAux.FieldByname('v_subtotal').AsCurrency, 14, True)) + '     ' +
                   Trim(StrCurr(Dm.ArqAux.FieldByname('v_tribunal').AsCurrency, 14, True)) + '     ' +
                   Trim(StrCurr(Dm.ArqAux.FieldByname('v_procuradoria').AsCurrency, 14, True)) + '     ' +
                   Trim(StrCurr(Dm.ArqAux.FieldByname('v_defensoria').AsCurrency, 14, True)) + '     ' +
                   Trim(StrCurr(Dm.ArqAux.FieldByname('v_mutua').AsCurrency, 14, True)) + '      ' +
                   Trim(StrCurr(Dm.ArqAux.FieldByname('v_acoterj').AsCurrency, 14, True)) + '     ' +
                   Trim(StrCurr(Dm.ArqAux.FieldByname('v_total').AsCurrency, 14, True));
          Writeln(F, buffer);}
        End
        Else
        Begin
          buffer := dm.ArqAux.FieldByName('linha1').AsString;
          Writeln(F, buffer);
          buffer := copy(dm.ArqAux.FieldByName('linha2').AsString, 1, 75);
          Writeln(F, buffer);
          buffer := copy(dm.ArqAux.FieldByName('linha2').AsString, 76, 75);
          Writeln(F, buffer);
          buffer := dm.ArqAux.FieldByName('linha3').AsString;
          Writeln(F, buffer);
          Writeln(F, '');
          buffer := '________________________________________________________ ';
          Writeln(F, buffer);
          //buffer := (F_RETQ.ComboBox1.Text) + ' - ' + (F_RETQ.ComboBox2.Text);
          Writeln(F, buffer);
          buffer := dm.ArqAux.FieldByName('linha4').AsString;
          If (NOT a_chk11) then
          Begin
            buffer := 'Emol     3217/99   4664/05   111/06   3716/02   590/82   Total';
            Writeln(F, buffer);
            buffer := Trim(StrCurr(Dm.ArqAux.FieldByname('v_subtotal').AsCurrency, 14, True)) + '     ' +
                     Trim(StrCurr(Dm.ArqAux.FieldByname('v_tribunal').AsCurrency, 14, True)) + '     ' +
                     Trim(StrCurr(Dm.ArqAux.FieldByname('v_procuradoria').AsCurrency, 14, True)) + '     ' +
                     Trim(StrCurr(Dm.ArqAux.FieldByname('v_defensoria').AsCurrency, 14, True)) + '     ' +
                     Trim(StrCurr(Dm.ArqAux.FieldByname('v_mutua').AsCurrency, 14, True)) + '      ' +
                     Trim(StrCurr(Dm.ArqAux.FieldByname('v_acoterj').AsCurrency, 14, True)) + '     ' +
                     Trim(StrCurr(Dm.ArqAux.FieldByname('v_total').AsCurrency, 14, True));
            Writeln(F, buffer);
          End
          Else
          Begin
            Writeln(F, '');
            Writeln(F, '');
          End;
        End;
        If F_Menu.Label7.Caption <> 'CASIMIRO DE ABREU' then
        Begin
          Writeln(F, '');
          Writeln(F, '');
        End
        Else Writeln(F, '');
        Write(F, Chr(18)+Chr(27)+Chr(77));
        dm.ArqAux.Next;
      end;
      CloseFile(F);
     End;
    end;
   // Application.CreateForm(TF_Etiq, F_Etiq);
   // F_Etiq.QuickRep1.preview;
  //  F_Etiq.Destroy;
  //  F_Etiq := nil;
  end;

  {if radiobutton5.checked then
  begin
  //  Application.CreateForm(Tf_etiq1, f_etiq1);
    f_etiq1.QuickRep1.preview;
  //  f_etiq1.Destroy;
  //  F_Etiq1 := nil;
  end;}

  Dm.ArqAux.close;
  DestroeTabela(arq);
//  StatusBar1.SimpleText := 'Fim do Relatório';
//  StatusBar1.UpDate;

  Screen.cursor := crdefault;
end;

procedure TF_RETQ.BitBtn4Click(Sender: TObject);
begin
  BitBtn1.SetFocus;
end;

function TF_RETQ.retornaLetraDoLivroProtocolo(p_auxiliar: String): String;
var
  letra: String;
Begin
  result:= '';
  letra:= '';
  dm.qryGenerico_Auxiliar4.Close;
  dm.qryGenerico_Auxiliar4.SQL.Clear;
  dm.qryGenerico_Auxiliar4.SQL.Add('select lva, lvb, lvc, livro, folha from td where p_auxiliar = '+QuotedStr(p_auxiliar)+' ');
  dm.qryGenerico_Auxiliar4.Open;
  {if dm.qryGenerico_Auxiliar4.FieldByName('lva').AsString = 'X' Then
    letra:= ' A'+dm.qryGenerico_Auxiliar4.FieldByName('livro').AsString+' Folha: '+dm.qryGenerico_Auxiliar4.FieldByName('folha').AsString
  Else if dm.qryGenerico_Auxiliar4.FieldByName('lvb').AsString = 'X' Then
    letra:= ' B'+dm.qryGenerico_Auxiliar4.FieldByName('livro').AsString+' Folha: '+dm.qryGenerico_Auxiliar4.FieldByName('folha').AsString
  Else If dm.qryGenerico_Auxiliar4.FieldByName('lvc').AsString = 'X' Then
    letra:= ' C'+dm.qryGenerico_Auxiliar4.FieldByName('livro').AsString+' Folha: '+dm.qryGenerico_Auxiliar4.FieldByName('folha').AsString;}

  if dm.qryGenerico_Auxiliar4.FieldByName('lva').AsString = 'X' Then
    letra:= ' A'+dm.qryGenerico_Auxiliar4.FieldByName('livro').AsString
  Else if dm.qryGenerico_Auxiliar4.FieldByName('lvb').AsString = 'X' Then
    letra:= ' B'+dm.qryGenerico_Auxiliar4.FieldByName('livro').AsString
  Else If dm.qryGenerico_Auxiliar4.FieldByName('lvc').AsString = 'X' Then
    letra:= ' C'+dm.qryGenerico_Auxiliar4.FieldByName('livro').AsString;


  result:= letra;

End;

function TF_RETQ.retornaLetraDoLivroRegistro(p_auxiliar: String): String;
var
  letra: String;
Begin
  result:= '';
  letra:= '';
  dm.qryGenerico_Auxiliar4.Close;
  dm.qryGenerico_Auxiliar4.SQL.Clear;
  dm.qryGenerico_Auxiliar4.SQL.Add('select lva_reg, lvb_reg, lvc_reg, folha_reg, livro_reg from td where p_auxiliar = '+QuotedStr(p_auxiliar)+' ');
  dm.qryGenerico_Auxiliar4.Open;
  if dm.qryGenerico_Auxiliar4.FieldByName('lva_reg').AsString = 'X' Then
    letra:= ' A'+dm.qryGenerico_Auxiliar4.FieldByName('livro_reg').AsString
  Else if dm.qryGenerico_Auxiliar4.FieldByName('lvb_reg').AsString = 'X' Then
    letra:= ' B'+dm.qryGenerico_Auxiliar4.FieldByName('livro_reg').AsString
  Else If dm.qryGenerico_Auxiliar4.FieldByName('lvc_reg').AsString = 'X' Then
    letra:= ' C'+dm.qryGenerico_Auxiliar4.FieldByName('livro_reg').AsString;


  result:= letra;

End;

procedure TF_RETQ.ImprimiEtiquetaDeViasAdicionais(sProtocolo: String);
var
  tam_fonte, idDaje, posicaoX, posicaoY, qrCodeX, qrCodeY, variacaoY: Integer;
  cabec_argox, _SerieDaje, _Daje, _SerieDajeComplementar, _DajeComplementar: String;
  _EmolDaje, _ValorDaje, VrDaje_1, EmolDaje_1, TaxaFiscalDaje_1, FecomDaje_1, DefPublicaDaje_1  : currency;
begin
  dm.qryGenerico_Aux.Close;
  dm.qryGenerico_Aux.SQL.Clear;
  dm.qryGenerico_Aux.SQL.Add(' select daje.vr_pge, daje.fmmpba, daje.numero_selo, daje.cod_validacao, daje.serie_daje, daje.numero_daje, selos.daje, daje.emol_daje, '+
                         ' daje.tx_fisca_daje, daje.fecom_daje, daje.def_pub_daje, '+
			 ' daje.vr_daje, daje.numero_selo, daje.cod_validacao, td.p_auxiliar, '+
			 ' td.registro, td.folha, td.folha_reg, td.livro, td.livro_reg, td.averba, td.data_p, td.dajevias, td.serie_vias, daje.pags '+
                         ' from td join selos on (selos.recibo = td.p_auxiliar) '+
                         ' inner join daje on (daje.numero_daje = selos.daje) and (daje.serie_daje = selos.serie_daje) where p_auxiliar = '+QuotedStr(sProtocolo)+' '+
                         ' order by p_auxiliar  ');
  dm.qryGenerico_Aux.Open;
  dm.qryGenerico_Aux.First;   

  While not dm.qryGenerico_Aux.Eof do
  Begin
    if (Dm.Configur.FieldByName('ajusteEtiqueta_tempoReal').AsString= '1') then
    begin
      posicaoX := StrToInt(Edit3.text);
      posicaoY := StrToInt(Edit11.text);
      qrCodeX  := StrToInt(Edit12.text);
      qrCodeY  := StrToInt(Edit13.text);
    end
    else
    begin
      posicaoX := Dm.Configur.FieldByName('etiqueta_posX').AsInteger;
      posicaoY := Dm.Configur.FieldByName('etiqueta_posY').AsInteger;
      qrCodeX  := Dm.Configur.FieldByName('qrCode_posX').AsInteger;
      qrCodeY  := Dm.Configur.FieldByName('qrCode_posY').AsInteger;
    end;
    tam_fonte := 9;
    variacaoY := 11;

    A_CreatePrn(1, 'siscart.txt'); // Inicia Operacao da Impressora
    A_Set_Darkness(12);

    cabec_argox := '';
    A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Protocolo: '+Dm.qryGenerico_Aux.fieldByname('p_auxiliar').AsString+' Registro: '+Dm.qryGenerico_Aux.fieldByname('registro').AsString+''));
    posicaoY := posicaoY - variacaoY;
    if (Dm.qryGenerico_Aux.fieldByname('averba').AsString <> '') and (Dm.qryGenerico_Aux.fieldByname('averba').AsString <> '0') Then
      A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('A margem do registro primitivo n '+Dm.qryGenerico_Aux.fieldByname('averba').AsString+'' ));
    posicaoY := posicaoY - variacaoY;
    A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('    O QUE CERTIFICO ' + Dm.qryGenerico_Aux.fieldByname('data_p').AsString ));
    posicaoY := posicaoY - variacaoY;

    Dm.qryGenerico_Auxiliar2.Close;
    Dm.qryGenerico_Auxiliar2.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
    Dm.qryGenerico_Auxiliar2.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString)+' and numero_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('numero_daje').AsString)+' ');
    Dm.qryGenerico_Auxiliar2.Open;

    _SerieDajeComplementar := Dm.qryGenerico_Auxiliar2.FieldByName('serie_daje_complementar').AsString;
    _DajeComplementar      := Dm.qryGenerico_Auxiliar2.FieldByName('numero_daje_complementar').AsString;


    _EmolDaje := Dm.qryGenerico_Auxiliar2.FieldByName('emol_daje').AsCurrency;
    _ValorDaje:= Dm.qryGenerico_Auxiliar2.FieldByName('vr_daje').AsCurrency;
    _SerieDaje:= Dm.qryGenerico_Auxiliar2.FieldByName('serie_daje').AsString;
    _Daje     := Dm.qryGenerico_Auxiliar2.FieldByName('numero_daje').AsString;

    if (_ValorDaje > 0) and (_EmolDaje <= 0) Then
    Begin
      VrDaje_1          := _ValorDaje;
      EmolDaje_1        := RoundTo(((VrDaje_1 * emol_daje)/100),    -2);
      TaxaFiscalDaje_1  := RoundTo(((VrDaje_1 * tx_fisc_daje)/100), -2);
      FecomDaje_1       := RoundTo(((VrDaje_1 * fecom_daje)/100),   -2);
      DefPublicaDaje_1  := RoundTo(((VrDaje_1 * def_pub_daje)/100), -2);

      Dm.qryGenerico_Auxiliar3.Close;
      Dm.qryGenerico_Auxiliar3.SQL.Clear;
      Dm.qryGenerico_Auxiliar3.SQL.Add('update daje set');
      Dm.qryGenerico_Auxiliar3.SQL.Add('emol_daje      = ' + QuotedStr(StringReplace(FloatToStr(EmolDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',tx_fisca_daje = ' + QuotedStr(StringReplace(FloatToStr(TaxaFiscalDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',fecom_daje    = ' + QuotedStr(StringReplace(FloatToStr(FecomDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',def_pub_daje  = ' + QuotedStr(StringReplace(FloatToStr(DefPublicaDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add('where serie_daje = ' + StrZero(_SerieDaje,3)+' and numero_daje = '+QuotedStr(_Daje)+'' );
      Dm.qryGenerico_Auxiliar3.ExecSQL;
    End;

    Dm.qryGenerico_Auxiliar2.Close;
    Dm.qryGenerico_Auxiliar2.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
    Dm.qryGenerico_Auxiliar2.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString)+' and numero_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('numero_daje').AsString)+' ');
    Dm.qryGenerico_Auxiliar2.Open;

    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
    Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(_SerieDajeComplementar)+' and numero_daje = '+QuotedStr(_DajeComplementar)+' ');
    Dm.qryGenerico.Open;

    _EmolDaje := Dm.qryGenerico.FieldByName('emol_daje').AsCurrency;
    _ValorDaje:= Dm.qryGenerico.FieldByName('vr_daje').AsCurrency;
    _SerieDaje:= Dm.qryGenerico.FieldByName('serie_daje').AsString;
    _Daje     := Dm.qryGenerico.FieldByName('numero_daje').AsString;

    if (_ValorDaje > 0) and (_EmolDaje <= 0) Then
    Begin
      VrDaje_1          := _ValorDaje;
      EmolDaje_1        := RoundTo(((VrDaje_1 * emol_daje)/100),    -2);
      TaxaFiscalDaje_1  := RoundTo(((VrDaje_1 * tx_fisc_daje)/100), -2);
      FecomDaje_1       := RoundTo(((VrDaje_1 * fecom_daje)/100),   -2);
      DefPublicaDaje_1  := RoundTo(((VrDaje_1 * def_pub_daje)/100), -2);

      Dm.qryGenerico_Auxiliar3.Close;
      Dm.qryGenerico_Auxiliar3.SQL.Clear;
      Dm.qryGenerico_Auxiliar3.SQL.Add('update daje set');
      Dm.qryGenerico_Auxiliar3.SQL.Add('emol_daje      = ' + QuotedStr(StringReplace(FloatToStr(EmolDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',tx_fisca_daje = ' + QuotedStr(StringReplace(FloatToStr(TaxaFiscalDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',fecom_daje    = ' + QuotedStr(StringReplace(FloatToStr(FecomDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',def_pub_daje  = ' + QuotedStr(StringReplace(FloatToStr(DefPublicaDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add('where serie_daje = ' + StrZero(_SerieDaje,3)+' and numero_daje = '+QuotedStr(_Daje)+'' );
      Dm.qryGenerico_Auxiliar3.ExecSQL;
    End;

    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
    Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(_SerieDajeComplementar)+' and numero_daje = '+QuotedStr(_DajeComplementar)+' ');
    Dm.qryGenerico.Open;


    if (Not(Dm.qryGenerico.isEmpty)) Then
    begin
      A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico_Auxiliar2.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('emol_daje').AsCurrency) + ' Fecom R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Auxiliar2.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency) + ' Def R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Auxiliar2.fieldByname('def_pub_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
      posicaoY := posicaoY - variacaoY;
      A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Tx Fcal R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Auxiliar2.fieldByname('tx_fisca_daje').AsCurrency + Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency)) + ' Tx Pge R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Auxiliar2.fieldByname('vr_pge').AsCurrency + Dm.qryGenerico.fieldByname('vr_pge').AsCurrency)) + ' FMMPBA R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Auxiliar2.fieldByname('fmmpba').AsCurrency + Dm.qryGenerico.fieldByname('fmmpba').AsCurrency)))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
      posicaoY := posicaoY - variacaoY;
      A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico_Auxiliar2.fieldByname('vr_daje').AsCurrency + Dm.qryGenerico.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))
      posicaoY := posicaoY - variacaoY;
    End
    Else
    Begin
      A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico_Aux.fieldByname('emol_daje').AsCurrency) + ' Fecom R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Aux.fieldByname('fecom_daje').AsCurrency) + ' Def R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Aux.fieldByname('def_pub_daje').AsCurrency) )); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
      posicaoY := posicaoY - variacaoY;
      A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Tx Fcal R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Aux.fieldByname('tx_fisca_daje').AsCurrency)) + 'Tx Pge R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Aux.fieldByname('vr_pge').AsCurrency)) + 'FMMPBA R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Aux.fieldByname('fmmpba').AsCurrency)))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
      posicaoY := posicaoY - variacaoY;
      A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico_Aux.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))
      posicaoY := posicaoY - variacaoY;
    End;


    if (_DajeComplementar = '') Then
    Begin
      dm.qryGenerico_Auxiliar4.Close;
      dm.qryGenerico_Auxiliar4.SQL.Clear;
      dm.qryGenerico_Auxiliar4.SQL.Add('select iddaje_tj from daje where numero_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('daje').AsString)+' and serie_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString)+'');
      dm.qryGenerico_Auxiliar4.Open;
      dm.qryGenerico_Auxiliar4.Last;

      A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.qryGenerico_Aux.fieldByname('daje').AsString + ' Serie: '+Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString+ ' Emissor: '+dm.qryGenerico_Auxiliar4.fieldByname('iddaje_tj').AsString));
      posicaoY := posicaoY - variacaoY;
      A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('SELO:'+Dm.qryGenerico_Aux.fieldByname('numero_selo').AsString + ' Validacao:'+Dm.qryGenerico_Aux.fieldByname('cod_validacao').AsString)); // variavel que virá do banco de dados
      posicaoY := posicaoY - variacaoY;
      A_Prn_Text(posicaoX, posicaoY ,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Consulte: www.tjba.jus.br/autenticidade')); // variavel que virá do banco de dados
      posicaoY := posicaoY - variacaoY;
    end
    else
    begin
      dm.qryGenerico_Auxiliar4.Close;
      dm.qryGenerico_Auxiliar4.SQL.Clear;
      dm.qryGenerico_Auxiliar4.SQL.Add('select iddaje_tj from daje where numero_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('daje').AsString)+' and serie_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString)+'');
      dm.qryGenerico_Auxiliar4.Open;
      dm.qryGenerico_Auxiliar4.Last;

      A_Prn_Text(posicaoX, posicaoY ,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.qryGenerico_Aux.fieldByname('daje').AsString + ' Serie: '+Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString+ ' Emissor: '+dm.qryGenerico_Auxiliar4.fieldByname('iddaje_tj').AsString));
      posicaoY := posicaoY - variacaoY;
      A_Prn_Text(posicaoX, posicaoY ,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('SELO:'+Dm.qryGenerico_Aux.fieldByname('numero_selo').AsString + ' Validacao:'+Dm.qryGenerico_Aux.fieldByname('cod_validacao').AsString)); // variavel que virá do banco de dados
      posicaoY := posicaoY - variacaoY;
      A_Prn_Text(posicaoX, posicaoY ,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar('Consulte: www.tjba.jus.br/autenticidade')); // variavel que virá do banco de dados
      posicaoY := posicaoY - variacaoY;
    end;

    if FileExists(caminho_imgselo+'qrcode.bmp') Then
      DeleteFile(caminho_imgselo+'qrcode.bmp');

    WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'DAJE.EXE ' + 'CQ;'+TirarTudo(Dm.qryGenerico_Aux.fieldByname('numero_selo').AsString,'-','/','.')+';'+caminho_imgselo+';'+'dbtd;'+'TD;'),SW_HIDE);

    if FileExists(caminho_imgselo+'qrcode_'+TirarTudo(Dm.qryGenerico_Aux.fieldByname('numero_selo').AsString,'-','/','.')+'.bmp') and (FileExists('c:\siscart\imgselo\QRCodeBranco.bmp')) then
    begin
      ConverteBMPBit('c:\siscart\imgselo\QRCodeBranco.bmp', caminho_imgselo+'qrcode.bmp');
      if FileExists('C:\siscart\imgselo\QrCode.bmp') then
        A_Get_Graphic(qrCodeX, qrCodeY, 2, 'B', pchar('C:\Siscart\imgselo\QrCode.bmp'));
    end;

    posicaoY := posicaoY - variacaoY;
    A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar(sAssinaturaEtiqueta));
    posicaoY := posicaoY - variacaoY;
    A_Prn_Text(posicaoX, posicaoY,  1, tam_fonte, 1, 1, 1, 'n', 2, pchar(sCargoEtiqueta));
    posicaoY := posicaoY - variacaoY;

    A_Print_Out(1, 1, 1, 1);
    A_ClosePrn;
    Dm.qryGenerico_Aux.Next;
  End;
End;  

{procedure TF_RETQ.ImprimiEtiquetaDeViasAdicionais(sProtocolo: String);
var
  tam_fonte : Integer;
  cabec_argox : String;
  idDaje: Integer;
  _SerieDaje,
  _Daje: String;
  _EmolDaje,
  _ValorDaje,
  VrDaje_1,
  EmolDaje_1,
  TaxaFiscalDaje_1,
  FecomDaje_1,
  DefPublicaDaje_1  : currency;
  _SerieDajeComplementar,
  _DajeComplementar: String;


Begin
  dm.qryGenerico_Aux.Close;
  dm.qryGenerico_Aux.SQL.Clear;
  dm.qryGenerico_Aux.SQL.Add(' select daje.vr_pge, daje.fmmpba, daje.numero_selo, daje.cod_validacao, daje.serie_daje, daje.numero_daje, selos.daje, daje.emol_daje, '+
                         ' daje.tx_fisca_daje, daje.fecom_daje, daje.def_pub_daje, '+
			 ' daje.vr_daje, daje.numero_selo, daje.cod_validacao, td.p_auxiliar, '+
			 ' td.registro, td.folha, td.folha_reg, td.livro, td.livro_reg, td.averba, td.data_p, td.dajevias, td.serie_vias, daje.pags '+
                         ' from td join selos on (selos.recibo = td.p_auxiliar) '+
                         ' inner join daje on (daje.numero_daje = selos.daje) and (daje.serie_daje = selos.serie_daje) where p_auxiliar = '+QuotedStr(sProtocolo)+' '+
                         ' order by p_auxiliar  ');
  dm.qryGenerico_Aux.Open;
  dm.qryGenerico_Aux.First;


  While not dm.qryGenerico_Aux.Eof do
  Begin
    A_CreatePrn(1, 'siscart.txt'); // Inicia Operacao da Impressora
    A_Set_Darkness(12);

    tam_fonte := 9;
    cabec_argox := '';
    A_Get_Graphic(15, 3, 2, 'B', pchar('bb.bmp'));

    A_Prn_Text(107,137,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Protocolo: '+Dm.qryGenerico_Aux.fieldByname('p_auxiliar').AsString+' Registro: '+Dm.qryGenerico_Aux.fieldByname('registro').AsString+''));


    if (Dm.qryGenerico_Aux.fieldByname('averba').AsString <> '') and (Dm.qryGenerico_Aux.fieldByname('averba').AsString <> '0') Then
    Begin
      A_Prn_Text(107,126,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('A margem do registro primitivo n '+Dm.qryGenerico_Aux.fieldByname('averba').AsString+'' ));
    End
    Else
    Begin
      //A_Prn_Text(107,112,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('A margem do registro primitivo n xxxx' ));
    End;

    A_Prn_Text(107,113,  1, 2, 2, 1, 1, 'n', 2, pchar('             '+ 'O QUE CERTIFICO' ));

    //A_Prn_Text(107,99,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('  ')); //F_Menu.Label7.Caption + ' -BA ' + qry2.fieldByname('data_p').AsString

    A_Prn_Text(107,100,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('          ' + Acentos(F_Menu.Label7.Caption) + ' -BA ' + Dm.qryGenerico_Aux.fieldByname('data_p').AsString ));


                  //a posição acima eu adicionei mais 20 ou seja era 72 e passou para 92 assim como tambem para as posições abaixo
    Dm.qryGenerico_Auxiliar2.Close;
    Dm.qryGenerico_Auxiliar2.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
    Dm.qryGenerico_Auxiliar2.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString)+' and numero_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('numero_daje').AsString)+' ');
    Dm.qryGenerico_Auxiliar2.Open;

    _SerieDajeComplementar := Dm.qryGenerico_Auxiliar2.FieldByName('serie_daje_complementar').AsString;
    _DajeComplementar      := Dm.qryGenerico_Auxiliar2.FieldByName('numero_daje_complementar').AsString;


    _EmolDaje := Dm.qryGenerico_Auxiliar2.FieldByName('emol_daje').AsCurrency;
    _ValorDaje:= Dm.qryGenerico_Auxiliar2.FieldByName('vr_daje').AsCurrency;
    _SerieDaje:= Dm.qryGenerico_Auxiliar2.FieldByName('serie_daje').AsString;
    _Daje     := Dm.qryGenerico_Auxiliar2.FieldByName('numero_daje').AsString;

    if (_ValorDaje > 0) and (_EmolDaje <= 0) Then
    Begin
      VrDaje_1          := _ValorDaje;
      EmolDaje_1        := RoundTo(((VrDaje_1 * emol_daje)/100),    -2);
      TaxaFiscalDaje_1  := RoundTo(((VrDaje_1 * tx_fisc_daje)/100), -2);
      FecomDaje_1       := RoundTo(((VrDaje_1 * fecom_daje)/100),   -2);
      DefPublicaDaje_1  := RoundTo(((VrDaje_1 * def_pub_daje)/100), -2);

      Dm.qryGenerico_Auxiliar3.Close;
      Dm.qryGenerico_Auxiliar3.SQL.Clear;
      Dm.qryGenerico_Auxiliar3.SQL.Add('update daje set');
      Dm.qryGenerico_Auxiliar3.SQL.Add('emol_daje      = ' + QuotedStr(StringReplace(FloatToStr(EmolDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',tx_fisca_daje = ' + QuotedStr(StringReplace(FloatToStr(TaxaFiscalDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',fecom_daje    = ' + QuotedStr(StringReplace(FloatToStr(FecomDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',def_pub_daje  = ' + QuotedStr(StringReplace(FloatToStr(DefPublicaDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add('where serie_daje = ' + StrZero(_SerieDaje,3)+' and numero_daje = '+QuotedStr(_Daje)+'' );
      Dm.qryGenerico_Auxiliar3.ExecSQL;
    End;

    Dm.qryGenerico_Auxiliar2.Close;
    Dm.qryGenerico_Auxiliar2.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
    Dm.qryGenerico_Auxiliar2.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString)+' and numero_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('numero_daje').AsString)+' ');
    Dm.qryGenerico_Auxiliar2.Open;


    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
    Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(_SerieDajeComplementar)+' and numero_daje = '+QuotedStr(_DajeComplementar)+' ');
    Dm.qryGenerico.Open;

    _EmolDaje := Dm.qryGenerico.FieldByName('emol_daje').AsCurrency;
    _ValorDaje:= Dm.qryGenerico.FieldByName('vr_daje').AsCurrency;
    _SerieDaje:= Dm.qryGenerico.FieldByName('serie_daje').AsString;
    _Daje     := Dm.qryGenerico.FieldByName('numero_daje').AsString;

    if (_ValorDaje > 0) and (_EmolDaje <= 0) Then
    Begin
      VrDaje_1          := _ValorDaje;
      EmolDaje_1        := RoundTo(((VrDaje_1 * emol_daje)/100),    -2);
      TaxaFiscalDaje_1  := RoundTo(((VrDaje_1 * tx_fisc_daje)/100), -2);
      FecomDaje_1       := RoundTo(((VrDaje_1 * fecom_daje)/100),   -2);
      DefPublicaDaje_1  := RoundTo(((VrDaje_1 * def_pub_daje)/100), -2);

      Dm.qryGenerico_Auxiliar3.Close;
      Dm.qryGenerico_Auxiliar3.SQL.Clear;
      Dm.qryGenerico_Auxiliar3.SQL.Add('update daje set');
      Dm.qryGenerico_Auxiliar3.SQL.Add('emol_daje      = ' + QuotedStr(StringReplace(FloatToStr(EmolDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',tx_fisca_daje = ' + QuotedStr(StringReplace(FloatToStr(TaxaFiscalDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',fecom_daje    = ' + QuotedStr(StringReplace(FloatToStr(FecomDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add(',def_pub_daje  = ' + QuotedStr(StringReplace(FloatToStr(DefPublicaDaje_1), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar3.SQL.Add('where serie_daje = ' + StrZero(_SerieDaje,3)+' and numero_daje = '+QuotedStr(_Daje)+'' );
      Dm.qryGenerico_Auxiliar3.ExecSQL;
    End;

    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear; //Este select pega o que esta na coluna de daje complementar
    Dm.qryGenerico.SQL.Add(' select * from daje where serie_daje = '+QuotedStr(_SerieDajeComplementar)+' and numero_daje = '+QuotedStr(_DajeComplementar)+' ');
    Dm.qryGenerico.Open;


    if (Not(Dm.qryGenerico.isEmpty)) Then
    Begin
      //A_Prn_Text(107,87,  1, 1, 2, 1, 1, 'n', 2, pchar('Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico_Auxiliar2.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('emol_daje').AsCurrency) + ' Fecom R$'+FormatCurr('###,##0.00', Dm.qryGenerico_Auxiliar2.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency) + ' Def R$'+FormatCurr('###,##0.00', Dm.qryGenerico_Auxiliar2.fieldByname('def_pub_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency) + ' Tx Fcal R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Auxiliar2.fieldByname('tx_fisca_daje').AsCurrency + Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency)))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
      //A_Prn_Text(107,72 ,  1, 1, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico_Auxiliar2.fieldByname('vr_daje').AsCurrency + Dm.qryGenerico.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))

    A_Prn_Text(107,87,  1, 1, 2, 1, 1, 'n', 2, pchar('Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico_Auxiliar2.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico.fieldByname('emol_daje').AsCurrency) + ' Fecom R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Auxiliar2.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico.fieldByname('fecom_daje').AsCurrency) + ' Def R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Auxiliar2.fieldByname('def_pub_daje').AsCurrency + Dm.qryGenerico.fieldByname('def_pub_daje').AsCurrency))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))

           A_Prn_Text(107,74,  1, 1, 2, 1, 1, 'n', 2, pchar(' Tx Fcal R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Auxiliar2.fieldByname('tx_fisca_daje').AsCurrency + Dm.qryGenerico.fieldByname('tx_fisca_daje').AsCurrency)) + ' Tx Pge R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Auxiliar2.fieldByname('vr_pge').AsCurrency + Dm.qryGenerico.fieldByname('vr_pge').AsCurrency)) + ' FMMPBA R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Auxiliar2.fieldByname('fmmpba').AsCurrency + Dm.qryGenerico.fieldByname('fmmpba').AsCurrency)))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))

           A_Prn_Text(107,62 ,  1, 1, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico_Auxiliar2.fieldByname('vr_daje').AsCurrency + Dm.qryGenerico.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))

    End
    Else
    Begin
      //A_Prn_Text(107,87,  1, 1, 2, 1, 1, 'n', 2, pchar('Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico_Aux.fieldByname('emol_daje').AsCurrency) + ' Fecom R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Aux.fieldByname('fecom_daje').AsCurrency) + ' Def R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Aux.fieldByname('def_pub_daje').AsCurrency) +' Tx Fcal R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Aux.fieldByname('tx_fisca_daje').AsCurrency) ))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
      //A_Prn_Text(107,72 ,  1, 1, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico_Aux.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))

  A_Prn_Text(107,87,  1, 1, 2, 1, 1, 'n', 2, pchar('Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico_Aux.fieldByname('emol_daje').AsCurrency) + ' Fecom R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Aux.fieldByname('fecom_daje').AsCurrency) + ' Def R$'+FormatCurr('###,##0.00',Dm.qryGenerico_Aux.fieldByname('def_pub_daje').AsCurrency) )); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))

A_Prn_Text(107,74,  1, 1, 2, 1, 1, 'n', 2, pchar('Tx Fcal R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Aux.fieldByname('tx_fisca_daje').AsCurrency)) + 'Tx Pge R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Aux.fieldByname('vr_pge').AsCurrency)) + 'FMMPBA R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Aux.fieldByname('fmmpba').AsCurrency)))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))

           A_Prn_Text(107,62 ,  1, 1, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico_Aux.fieldByname('vr_daje').AsCurrency))); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))

    End;


    if (_DajeComplementar = '') Then
    Begin

      dm.qryGenerico_Auxiliar4.Close;
      dm.qryGenerico_Auxiliar4.SQL.Clear;
      dm.qryGenerico_Auxiliar4.SQL.Add('select iddaje_tj from daje where numero_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('daje').AsString)+' and serie_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString)+'');
      dm.qryGenerico_Auxiliar4.Open;
      dm.qryGenerico_Auxiliar4.Last;

      A_Prn_Text(107,50 ,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.qryGenerico_Aux.fieldByname('daje').AsString + '      Serie: '+Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString+ '      Emissor: '+dm.qryGenerico_Auxiliar4.fieldByname('iddaje_tj').AsString));
      A_Prn_Text(57,22 ,  4, 9        , 0, 2, 1, 'n', 2, pchar(Dm.qryGenerico_Aux.fieldByname('numero_selo').AsString)); // variavel que virá do banco de dados
      A_Prn_Text(68,22 ,  4, 9        , 0, 2, 1, 'n', 2, pchar('  '+Dm.qryGenerico_Aux.fieldByname('cod_validacao').AsString)); // variavel que virá do banco de dados
    End
    Else
    Begin
      dm.qryGenerico_Auxiliar4.Close;
      dm.qryGenerico_Auxiliar4.SQL.Clear;
      dm.qryGenerico_Auxiliar4.SQL.Add('select iddaje_tj from daje where numero_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('daje').AsString)+' and serie_daje = '+QuotedStr(Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString)+'');
      dm.qryGenerico_Auxiliar4.Open;
      dm.qryGenerico_Auxiliar4.Last;

      A_Prn_Text(107,50 ,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.qryGenerico_Aux.fieldByname('daje').AsString + '      Serie: '+Dm.qryGenerico_Aux.fieldByname('serie_daje').AsString+ '      Emissor: '+dm.qryGenerico_Auxiliar4.fieldByname('iddaje_tj').AsString));
      A_Prn_Text(57,22 ,  4, 9        , 0, 2, 1, 'n', 2, pchar(Dm.qryGenerico_Aux.fieldByname('numero_selo').AsString)); // variavel que virá do banco de dados
      A_Prn_Text(68,22 ,  4, 9        , 0, 2, 1, 'n', 2, pchar('  '+Dm.qryGenerico_Aux.fieldByname('cod_validacao').AsString)); // variavel que virá do banco de dados
    End;

    A_Prn_Text(107,28 ,  1, 2, 2, 1, 1, 'n', 2, pchar(sAssinaturaEtiqueta));
    A_Prn_Text(107,18 ,  1, 2, 2, 1, 1, 'n', 2, pchar(sCargoEtiqueta));

    A_Print_Out(1, 1, 1, 1);
    A_ClosePrn;
    Dm.qryGenerico_Aux.Next;
  End;
End; }

procedure TF_RETQ.ImprimiEtiquetaDeViasAdicionaisDaTabelaTD(sProtocolo: String);
var
  tam_fonte : Integer;
  cabec_argox : String;
Begin
{  dm.qryGenerico_Aux.Close;
  dm.qryGenerico_Aux.SQL.Clear;
  dm.qryGenerico_Aux.SQL.Add(' select daje.serie_daje, daje.numero_daje, daje.emol_daje, '+
                         ' daje.tx_fisca_daje, daje.fecom_daje, daje.def_pub_daje, '+
			 ' daje.vr_daje, daje.numero_selo, daje.cod_validacao, td.p_auxiliar, '+
			 ' td.registro, td.folha, td.folha_reg, td.livro, td.livro_reg, td.averba, td.data_p, td.dajevias, td.serie_vias '+
                         ' from td inner join daje on (daje.numero_daje = td.dajevias) and (daje.serie_daje = td.serie_vias) where p_auxiliar = '+QuotedStr(sProtocolo)+' '+
                         ' order by p_auxiliar  ');
  dm.qryGenerico_Aux.Open;
  dm.qryGenerico_Aux.First;


  While not dm.qryGenerico_Aux.Eof do
  Begin
    A_CreatePrn(1, 'siscart.txt'); // Inicia Operacao da Impressora
    A_Set_Darkness(12);

    tam_fonte := 9;
    cabec_argox := '';
    A_Get_Graphic(15, 3, 2, 'B', pchar('bb.bmp'));

    A_Prn_Text(107,137,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Protocolo: '+Dm.qryGenerico_Aux.fieldByname('p_auxiliar').AsString+'   -'+ 'Livro n '+retornaLetraDoLivroProtocolo(Dm.qryGenerico_Aux.fieldByname('p_auxiliar').AsString)+' '+Dm.qryGenerico_Aux.fieldByname('folha').AsString ));
    A_Prn_Text(107,126,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Registro: '+Dm.qryGenerico_Aux.fieldByname('registro').AsString+'   -'+ 'Livro n '+retornaLetraDoLivroRegistro(Dm.qryGenerico_Aux.fieldByname('p_auxiliar').AsString)+' '+Dm.qryGenerico_Aux.fieldByname('folha_reg').AsString ));

    if (Dm.qryGenerico_Aux.fieldByname('averba').AsString <> '') or (Dm.qryGenerico_Aux.fieldByname('averba').AsString <> '0') Then
    Begin
      A_Prn_Text(107,112,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('A margem do registro primitivo n '+Dm.qryGenerico_Aux.fieldByname('averba').AsString+'' ));
    End
    Else
    Begin
      A_Prn_Text(107,112,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('A margem do registro primitivo n xxxx' ));
    End;

    A_Prn_Text(107,100,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('             '+ 'O QUE CERTIFICO' ));
    A_Prn_Text(107,99,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('  ')); //F_Menu.Label7.Caption + ' -BA ' + qry2.fieldByname('data_p').AsString
    A_Prn_Text(107,92,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('  ' )); //qry2.fieldByname('daje').AsString
    A_Prn_Text(107,72,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('          ' + Acentos(F_Menu.Label7.Caption) + ' -BA ' + Dm.qryGenerico_Aux.fieldByname('data_p').AsString )); //PegaSelo(qry2.fieldByname('protocolo').AsString))
    A_Prn_Text(107,60,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Custas: Emol R$'+FormatCurr('###,##0.00', Dm.qryGenerico_Aux.fieldByname('emol_daje').AsCurrency + Dm.qryGenerico_Aux.fieldByname('fecom_daje').AsCurrency + Dm.qryGenerico_Aux.fieldByname('def_pub_daje').AsCurrency) +' Taxa Fiscal: R$'+ FormatCurr('###,##0.00', (Dm.qryGenerico_Aux.fieldByname('tx_fisca_daje').AsCurrency) ))); //StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True))
    A_Prn_Text(107,46 ,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('Total: R$'+ FormatCurr('###,##0.00', Dm.qryGenerico_Aux.fieldByname('vr_daje').AsCurrency) )); //StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True))
    A_Prn_Text(107,30 ,  1, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE: '+ Dm.qryGenerico_Aux.fieldByname('dajevias').AsString + '      Serie: '+Dm.qryGenerico_Aux.fieldByname('serie_vias').AsString+ '      Emissor: '+Dm.Configur.fieldByname('id_eselo').AsString));
    A_Prn_Text(57,22 ,  4, 9        , 0, 2, 1, 'n', 2, pchar(Dm.qryGenerico_Aux.fieldByname('numero_selo').AsString)); // variavel que virá do banco de dados
    A_Prn_Text(68,22 ,  4, 9        , 0, 2, 1, 'n', 2, pchar('  '+Dm.qryGenerico_Aux.fieldByname('cod_validacao').AsString)); // variavel que virá do banco de dados

    A_Print_Out(1, 1, 1, 1);
    A_ClosePrn;
    Dm.qryGenerico_Aux.Next;
  End; }
End;

function TF_RETQ.retornaValorDaPaginaAdicionalDeCertidao(QtdViasCertida: Integer): String;
Begin
  Result := 'R$ 0,00';
  DM.qryGenerico_Auxiliar3.Close;
  DM.qryGenerico_Auxiliar3.SQL.Clear;
  DM.qryGenerico_Auxiliar3.SQL.Add('select * from tab_ato2');
  DM.qryGenerico_Auxiliar3.SQL.Add(' where data <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(MaskEdit1.Text))));
  DM.qryGenerico_Auxiliar3.SQL.Add(' and tabela = 4');
  DM.qryGenerico_Auxiliar3.SQL.Add(' and item_tab = 9');
  DM.qryGenerico_Auxiliar3.SQL.Add(' and subitem = "B" order by data desc');
  DM.qryGenerico_Auxiliar3.Open;
  DM.qryGenerico_Auxiliar3.FindLast;
  If (DM.qryGenerico_Auxiliar3.RecordCount <> 0) then
  begin
    DM.qryGenerico_Auxiliar3.FindFirst;
    Result := FormatCurr('R$ ###,###,##0.00', DM.qryGenerico_Auxiliar3.FieldByName('total').AsCurrency * QtdViasCertida);
  end
  Else
  Result := 'R$ 0,00';
End;

procedure TF_RETQ.Imprime_Zebra(CustomMemo:TCustomMemo;Memo:TMemo);
Var
  vetq : TStringList;
  f : textfile;
  linha0, linha1, linha2, linha3, linha4, linha5, linha6, linha7, linha8 : String;
  bitmap0,bitmap1 : TBitmap;
  sRet : String;
  iGetImg : IGetImgDisp;
  sImg : String;
  c : String;
  DIRX, ARQ_TMP : String;
  xyz : Integer;

  x, y, ers, ers1, ers2 : integer;
  sair     : boolean;
  xx, yy : Integer;
  distancia_nome : Integer;
  espaco_branco : String;
  Rcht: TRichEdit;
    posicaoX, posicaoY, qrCodeX, qrCodeY: integer;
begin                                    
  if (Dm.Configur.FieldByName('ajusteEtiqueta_tempoReal').AsString= '1') then
  begin
    posicaoX := StrToInt(Edit3.text);
    posicaoY := StrToInt(Edit11.text);
    qrCodeX  := StrToInt(Edit12.text);
    qrCodeY  := StrToInt(Edit13.text);
  end
  else
  begin
    posicaoX := Dm.Configur.FieldByName('etiqueta_posX').AsInteger;
    posicaoY := Dm.Configur.FieldByName('etiqueta_posY').AsInteger;
    qrCodeX  := Dm.Configur.FieldByName('qrCode_posX').AsInteger;
    qrCodeY  := Dm.Configur.FieldByName('qrCode_posY').AsInteger;
  end;

  Rcht:= TRichEdit(CustomMemo);
  bitmap1 := TBitmap.Create; //LIVRAMENTO QRCODE TESTAR

//bitmap1.LoadFromFile('C:\siscart\ETQ_TD\imgselo\QrCode.bmp');  //LIVRAMENTO QRCODE TESTAR

  bitmap1.LoadFromFile('C:\siscart\imgselo\QrCode.bmp');


  With TF_RETQ do          {Criar um parametro na tela de configurações para inverter posição da etiqueta }
  Begin
    ers1 := 0;
    ers2 := 0;
    ers  := Rcht.Lines.Count;
    While ers1 <= ers do
    Begin
      Sair := False;
      While (Not Sair) do
      Begin
        If (Trim(Rcht.Lines.Strings[ers1]) <> '') then
        Begin
          //Label12.Caption := pubNomeComputador;
          ARQ_TMP := 'TEMP_BMP.BMP';
          if not DirectoryExists('C:\SISCART\PROGRAMA\BMPTMP\') then
            ForceDirectories('C:\SISCART\PROGRAMA\BMPTMP\');

          if not DirectoryExists('C:\SISCART\ETQ_TD\BMPTMP\') then
            ForceDirectories('C:\SISCART\ETQ_TD\BMPTMP\');

          if ((TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') ='28666922000151') or
              (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '27072837000100') OR
              (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104')) then
          begin
            bitmap0 := TBitmap.Create;
            bitmap0.LoadFromFile('C:\Siscart\ETQ_TD\Mod_BMP.bmp');
            bitmap0.Canvas.Font.Name  := 'Liberation Mono';
            bitmap0.Canvas.Pen.Width  := 10;
            bitmap0.Canvas.Font.Style := [fsbold];
            bitmap0.Canvas.Pen.Width  := 2;
            bitmap0.Canvas.Font.Size  := 13;

          end
          else
          begin
            bitmap0 := TBitmap.Create;
            bitmap0.LoadFromFile('C:\Siscart\Mod_BMP.bmp');
            bitmap0.Canvas.Font.Name  := 'Liberation Mono';
            bitmap0.Canvas.Pen.Width  := 10;
            bitmap0.Canvas.Font.Style := [fsbold];


            bitmap0.Canvas.Pen.Width  := 2;
            bitmap0.Canvas.Font.Size  := 16;
          end;


          while (ers1 < Rcht.Lines.Count) do
          begin
            bitmap0.Canvas.TextOut(posicaoX, posicaoY, Rcht.Lines.Strings[ers1]);
            if ers1 > 2 then
              bitmap0.Canvas.Font.Size := 13;
            posicaoY := posicaoY + 20;
            ers1 := ers1 + 1;
          end;



         (* //espaco_branco  := '                                                        ';
          {distancia_nome := length(Trim(Rcht.Lines.Strings[ers1]));
          distancia_nome := 56 - distancia_nome;
          distancia_nome := distancia_nome  div 2;
          espaco_branco  := Copy(espaco_branco, 1,distancia_nome); }
          //bitmap0.Canvas.TextOut(70, 76, espaco_branco + Trim(Rcht.Lines.Strings[ers1]));
          //bitmap0.Canvas.TextOut(70, 50, espaco_branco + Trim(Rcht.Lines.Strings[ers1]));
          bitmap0.Canvas.TextOut(110, 5, espaco_branco + Trim(Rcht.Lines.Strings[ers1]));

          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          {espaco_branco  := '                                                                                                                                  ';
          distancia_nome := length(Trim(Rcht.Lines.Strings[ers1]));
          distancia_nome := 56 - distancia_nome;
          distancia_nome := distancia_nome  div 2;
          espaco_branco  := Copy(espaco_branco, 1,distancia_nome);}
          //bitmap0.Canvas.TextOut(0, 110, espaco_branco + Trim(Rcht.Lines.Strings[ers1]));
          //bitmap0.Canvas.TextOut(70, 90, espaco_branco + Trim(Rcht.Lines.Strings[ers1]));
          //bitmap0.Canvas.TextOut(110, 45, espaco_branco + Trim(Rcht.Lines.Strings[ers1]));
          bitmap0.Canvas.TextOut(110, 30, espaco_branco + Trim(Rcht.Lines.Strings[ers1]));



          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          {espaco_branco  := '                                                                                                                                  ';
          distancia_nome := length(Rcht.Lines.Strings[ers1]);
          distancia_nome := 56 - distancia_nome;
          distancia_nome := distancia_nome  div 2;
          espaco_branco  := Copy(espaco_branco, 1,distancia_nome);}
          //bitmap0.Canvas.TextOut(90, 134, espaco_branco + Acentos(Rcht.Lines.Strings[ers1]));
          //bitmap0.Canvas.TextOut(160, 114, espaco_branco + Acentos(Rcht.Lines.Strings[ers1]));]
          bitmap0.Canvas.TextOut(110, 54, espaco_branco + Acentos(Rcht.Lines.Strings[ers1]));

          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          {espaco_branco  := '                                                        ';
          distancia_nome := Length(Rcht.Lines.Strings[ers1]);
          distancia_nome := 56 - distancia_nome;
          distancia_nome := distancia_nome  div 2;
          espaco_branco  := Copy(espaco_branco, 1, distancia_nome); }
          //bitmap0.Canvas.TextOut(100, 154, espaco_branco + Trim(Rcht.Lines.Strings[ers1]));
          //bitmap0.Canvas.TextOut(170, 134, espaco_branco + Trim(Rcht.Lines.Strings[ers1]));
          bitmap0.Canvas.TextOut(200, 74, espaco_branco + Trim(Rcht.Lines.Strings[ers1]));

          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          bitmap0.Canvas.Font.Size  := 15;
          //bitmap0.Canvas.TextOut(70, 174, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(140, 154, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(180, 100, Rcht.Lines.Strings[ers1]);

         //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          //Autenticação
          bitmap0.Canvas.Font.Size  := 15;    // Linha de matricula
          //bitmap0.Canvas.TextOut(180, 194, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 194, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(140, 174, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(180, 120, Rcht.Lines.Strings[ers1]);

          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          bitmap0.Canvas.Font.Size  := 15;   // Linha de emolumento
          //bitmap0.Canvas.TextOut(0, 214, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 194, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 149, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(110, 145, Rcht.Lines.Strings[ers1]);
          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          bitmap0.Canvas.Font.Size  := 15;     //Linha de fecom
          //bitmap0.Canvas.TextOut(0, 234, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 214, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(110, 170, Rcht.Lines.Strings[ers1]);
          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          bitmap0.Canvas.Font.Size  := 15;
          //bitmap0.Canvas.TextOut(0, 254, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 234, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(110, 195, Rcht.Lines.Strings[ers1]);
          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          bitmap0.Canvas.Font.Size  := 15;
          //bitmap0.Canvas.TextOut(0, 274, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 254, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(110, 194, Rcht.Lines.Strings[ers1]);

          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;
                                        //Aqui
          bitmap0.Canvas.Font.Size  := 15;
          //bitmap0.Canvas.TextOut(0, 294, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 274, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(110, 224, Rcht.Lines.Strings[ers1]);

          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          bitmap0.Canvas.Font.Size  := 15;
          //bitmap0.Canvas.TextOut(0, 314, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 294, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(110, 244, Rcht.Lines.Strings[ers1]);

          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          bitmap0.Canvas.Font.Size  := 15;
          //bitmap0.Canvas.TextOut(0, 344, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 324, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(110, 274, Rcht.Lines.Strings[ers1]);

          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          bitmap0.Canvas.Font.Size  := 15;
          //bitmap0.Canvas.TextOut(0, 354, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 334, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(110, 284, Rcht.Lines.Strings[ers1]);

          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          bitmap0.Canvas.Font.Size  := 15;
          //bitmap0.Canvas.TextOut(0, 374, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 354, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(110, 304, Rcht.Lines.Strings[ers1]);

          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          bitmap0.Canvas.Font.Size  := 15;
          //bitmap0.Canvas.TextOut(0, 394, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 374, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(110, 324, Rcht.Lines.Strings[ers1]);

          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));

          ers1 := ers1 + 1;

          bitmap0.Canvas.Font.Size  := 15;
          //bitmap0.Canvas.TextOut(0, 414, Rcht.Lines.Strings[ers1]);
          //bitmap0.Canvas.TextOut(70, 394, Rcht.Lines.Strings[ers1]);
          bitmap0.Canvas.TextOut(110, 344, Rcht.Lines.Strings[ers1]);


          //ShowMessage(Trim(Rcht.Lines.Strings[ers1]));


          ers1 := ers1 + 1;

          ers2 := 10; *)
          if ((TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') ='28666922000151') or
              (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '27072837000100') OR
              (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104')) then
          begin
            bitmap0.Canvas.Draw(qrCodeX, qrCodeY, bitmap1);
            bitmap0.saveToFile('C:\SISCART\ETQ_TD\BMPTMP\Etq' + ARQ_TMP);
            bitmap0.saveToFile('C:\SISCART\ETQ_TD\BMPTMP\' + ARQ_TMP);
            F_RETQ.ImgEdit1.Image := 'C:\SISCART\ETQ_TD\BMPTMP\' + ARQ_TMP;
            F_RETQ.ImgEdit1.Display;

            If (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104') then
            Begin  // impressora Zebra Nova ---
              F_RETQ.ImgEdit1.RotateRight(1800) //Etiqueta para ser impressa de Cabeça para baixo. 1º Tabelionato de Notas de Itabuna
            End
            Else if not  ((TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '28666922000151') or
                          (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '27072837000100') or
                          (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '20404098000150')) then //OR
//                        (TirarTudo(F_Menu.Label22.Caption, '-', '.', '/') = '27040667000174')) then
            begin
              F_RETQ.ImgEdit1.RotateRight(1800);
            end;

            F_RETQ.ImgEdit1.SaveAs('C:\SISCART\ETQ_TD\BMPTMP\' + ARQ_TMP, wiFileTypeBMP, wiPageTypeBW, 1, 0, False);
            F_RETQ.ImgEdit1.SaveAs('C:\SISCART\ETQ_TD\BMPTMP\teste' + ARQ_TMP, wiFileTypeBMP, wiPageTypeBW, 1, 0, False);
            iGetImg := CreateComObject(Class_GetImg) as IgetImgDisp;
            sImg := iGetImg.fConvertString(Memo.Text, 'C:\SISCART\ETQ_TD\BMPTMP\' + ARQ_TMP, 10, 10, 'C:\Siscart\ETQ_TD\Mod_Etq.prn');
            With TFileStream.Create('C:\Siscart\ETQ_TD\Mod_Etq.prn', fmCreate) do
            Try
               Write(Pointer(sImg)^, Length(sImg));
            Finally
               Free;
            End;

            If (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104') then
            Begin
              F_RETQ.ImgEdit1.RotateLeft(1800) //Etiqueta para ser impressa de Cabeça para baixo. 1º Tabelionato de Notas de Itabuna
            End
            Else if not  ((TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '28666922000151') or
                     (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '27072837000100') or
                     (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '20404098000150')) then // or
//                     (TirarTudo(F_Menu.Label22.Caption, '-', '.', '/') = '27040667000174')) then
            begin
              F_RETQ.ImgEdit1.RotateLeft(1800);
            end;
            F_RETQ.ImgEdit1.ClearDisplay;

            bitmap0.FreeImage;
            bitmap0.Destroy;
            bitmap0 := Nil;
            iGetImg := Nil;

            // criar um arquivo .bat para enviar o arquivo texto gerado para a impressora atraves da porta LPT1
            // usando o comando type do DOS
            if not FileExists('C:\Siscart\ETQ_TD\PRINTLBL.BAT') then
            begin
              AssignFile(F, 'C:\Siscart\ETQ_TD\PRINTLBL.BAT');
              try
                Rewrite(F);
                //Writeln(F, 'TYPE C:\Mod_Etq.prn > ' + cam_impressora);
                Writeln(F, 'TYPE C:\Siscart\ETQ_TD\Mod_Etq.prn > ' + 'C:\Siscart\');

              finally
                CloseFile(F);
              end
            end;

            ShellExecute(0, 'Open', PChar('C:\Siscart\ETQ_TD\PRINTLBL.BAT'), nil, nil, Ord(SW_HIDE));

          end
          else
          begin
            bitmap0.Canvas.Draw(qrCodeX, qrCodeY, bitmap1);
            bitmap0.saveToFile('C:\SISCART\PROGRAMA\BMPTMP\Etq' + ARQ_TMP);
            bitmap0.saveToFile('C:\SISCART\PROGRAMA\BMPTMP\' + ARQ_TMP);
            F_RETQ.ImgEdit1.Image := 'C:\SISCART\PROGRAMA\BMPTMP\' + ARQ_TMP;

            F_RETQ.ImgEdit1.Display;
              {If (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104') then
                F_RETQ.ImgEdit1.RotateRight(0) //Etiqueta para ser impressa de Cabeça para baixo. 1º Tabelionato de Notas de Itabuna}

              if not  ((TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '28666922000151') or
                       (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '27072837000100') OR
                       (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104') or
                       (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '20404098000150') or
                       (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '27040667000174'))then
              begin
                F_RETQ.ImgEdit1.RotateRight(1800);
              end;

            F_RETQ.ImgEdit1.SaveAs('C:\SISCART\PROGRAMA\BMPTMP\' + ARQ_TMP, wiFileTypeBMP, wiPageTypeBW, 1, 0, False);
            F_RETQ.ImgEdit1.SaveAs('C:\SISCART\PROGRAMA\BMPTMP\teste' + ARQ_TMP, wiFileTypeBMP, wiPageTypeBW, 1, 0, False);
            iGetImg := CreateComObject(Class_GetImg) as IgetImgDisp;
            sImg := iGetImg.fConvertString(Memo.Text, 'C:\SISCART\PROGRAMA\BMPTMP\' + ARQ_TMP, 10, 10, 'C:\Siscart\Mod_Etq.prn');
            With TFileStream.Create('C:\Siscart\Mod_Etq.prn', fmCreate) do
            Try
               Write(Pointer(sImg)^, Length(sImg));
            Finally
               Free;
            End;

              {If (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104') then
                F_RETQ.ImgEdit1.RotateLeft(0) //Etiqueta para ser impressa de Cabeça para baixo. 1º Tabelionato de Notas de Itabuna}
              if not  ((TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '28666922000151') or
                       (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '27072837000100') OR
                       (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '34672442000104') OR
                       (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '20404098000150') OR
                       (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') = '27040667000174'))then
              begin
                F_RETQ.ImgEdit1.RotateLeft(1800);
              end;

            F_RETQ.ImgEdit1.ClearDisplay;

            bitmap0.FreeImage;
            bitmap0.Destroy;
            bitmap0 := Nil;
            iGetImg := Nil;

            // criar um arquivo .bat para enviar o arquivo texto gerado para a impressora atraves da porta LPT1
            // usando o comando type do DOS
            if not FileExists('C:\Siscart\PRINTLBL.BAT') then
            begin
              AssignFile(F, 'C:\Siscart\PRINTLBL.BAT');
              try
                Rewrite(F);
                //Writeln(F, 'TYPE C:\Mod_Etq.prn > ' + cam_impressora);
                Writeln(F, 'TYPE C:\Siscart\Mod_Etq.prn > ' + 'C:\Siscart\');

              finally
                CloseFile(F);
              end
            end;

            ShellExecute(0, 'Open', PChar('C:\Siscart\PRINTLBL.BAT'), nil, nil, Ord(SW_HIDE));

          end;

        end
        else ers2 := ers2 + 1;
        ers1 := ers1 + 1;
        if (UpperCase(Copy(Trim(Rcht.Lines.Strings[ers1]), 1, 7)) = 'RECONHE') or (ers2 > 9) then
        Begin
          Sair := True;
        end;
      end;
    end;
    x := x + 1;
  end;
end;

procedure TF_RETQ.Rad_RegistroClick(Sender: TObject);
begin
  Label3.Caption:= 'Nº Registro';
end;

procedure TF_RETQ.Rad_ProtocoloClick(Sender: TObject);
begin
  Label3.Caption:= 'Nº Protocolo';
end;

procedure TF_RETQ.FormShow(Sender: TObject);
begin
  dm.qryGenerico_Auxiliar3.Close;
  dm.qryGenerico_Auxiliar3.SQL.Clear;
  dm.qryGenerico_Auxiliar3.SQL.Add('select data_p from td where p_auxiliar = '+QuotedStr(F_Exame.MaskEdit1.Text)+'');
  dm.qryGenerico_Auxiliar3.Open;

  MaskEdit1.Text := DateToStr(dm.qryGenerico_Auxiliar3.FieldByName('data_p').AsDateTime);

  {IF (F_Menu.Label39.Caption = '27.145.475/0001-22') or (F_Menu.Label39.Caption = '27145475000122')
    or (F_Menu.Label39.Caption = '28588048000181') or (F_Menu.Label39.Caption = '28.588.048/0001-81') Then}
  if (F_Menu.Label39.Caption = '28588048000181') or (F_Menu.Label39.Caption = '28.588.048/0001-81') Then //Adrea de Una / 1 RTD Gierc
  begin
    Label23.Visible:= True;
    ComboBox6.Visible:= True;
  End;

  Dm.qryGenerico.Close;
  Dm.qryGenerico.SQL.Clear;
  Dm.qryGenerico.SQL.Add('select etiqueta_posX, etiqueta_posY, qrCode_posX, qrCode_posY, ajusteEtiqueta_tempoReal from configur');
  Dm.qryGenerico.Open;
  Edit3.Text := Dm.qryGenerico.FieldByName('etiqueta_posX').AsString;
  Edit11.Text:= Dm.qryGenerico.FieldByName('etiqueta_posY').AsString;
  Edit12.Text:= Dm.qryGenerico.FieldByName('qrCode_posX').AsString;
  Edit13.Text:= Dm.qryGenerico.FieldByName('qrCode_posY').AsString;

  IF (F_Menu.Label39.Caption = '34377622000155') or (F_Menu.Label39.Caption = '34.377.622/0001-55') or
     (F_Menu.Label39.Caption = '20404098000150') or
     (Dm.qryGenerico.FieldByName('ajusteEtiqueta_tempoReal').AsString= '1') Then //Rtd Juliana
  Begin
    if F_Menu.Label25.Caption = 'SISCART' Then
    Begin
      Edit3.Visible := True;
      Edit11.Visible:= True;
      Edit12.Visible:= True;
      Edit13.Visible:= True;
      Label24.Visible:= True;
      Label25.Visible:= True;
      Label26.Visible:= True;
      Label27.Visible:= True;
      BitBtn5.Visible:= True; 
      Edit3.ReadOnly := False;
      Edit11.ReadOnly:= False;
      Edit12.ReadOnly:= False;
      Edit13.ReadOnly:= False;
    End;
  End;
end;

procedure TF_RETQ.geraTextoFormatado;
begin
  //  letra := 0.15
  //else
{    letra := 0.20;
                                           //cm da etiqueta     //espaçamento à esquerda
  caracters := FloatToStr(Trunc(RoundTo((StrToFloat(Edit2.Text)-(StrToFloat(Edit10.Text)/100))/letra, -2)));
  contador := StrToInt(caracters);
  memo2.Text := StringReplace(memo2.Text, #13, '', [rfReplaceAll,rfIgnoreCase]);
  memo2.Text := StringReplace(memo2.Text, #10, '', [rfReplaceAll,rfIgnoreCase]);

  while memo2.Text <> '' do
  begin
    contador := StrToInt(caracters);
    if (Length(Memo2.Text) > contador) then
    begin
      while (copy(Memo2.Text, contador, 1) <> ' ') and (copy(Memo2.Text, contador, 1) <> ',') and (length(Memo2.Text) > 0) and (contador > 0) do
        contador := contador - 1;
    end;
    {if (pos('Zebra', ComboBox3.Items.Strings[ComboBox3.ItemIndex]) > 0) or (pos('Designer', ComboBox3.Items.Strings[ComboBox3.ItemIndex]) > 0) then    //Zebra
    begin
      RichEdit2.Lines.Add('A'+Edit12.Text+','+Edit13.Text+',0,'+Edit14.Text+',1,1,N,"'+copy(Memo2.Text, 0, contador) + '"');
      if Edit14.Text = '1' then
        Edit13.Text := IntToStr(StrToInt(Edit13.Text) + 12)
      else if Edit14.Text = '2' then
        Edit13.Text := IntToStr(StrToInt(Edit13.Text) + 16)
      else if Edit14.Text = '3' then
        Edit13.Text := IntToStr(StrToInt(Edit13.Text) + 20);
    end
    else}
    {if pos('Argox', ComboBox3.Items.Strings[ComboBox3.ItemIndex]) > 0 then    //Argox
    begin
      RichEdit4.Lines.Add(Edit6.Text+Edit7.Text+'11'+FormatFloat('000', StrToInt(Edit8.Text))+FormatFloat('0000', StrToInt(Edit9.Text))+FormatFloat('0000', StrToInt(Edit10.Text))+copy(Memo2.Text, 0, contador));
      if Edit7.Text = '0' then
        Edit9.Text := IntToStr(StrToInt(Edit9.Text) - 12)
      else if Edit7.Text = '1' then
        Edit9.Text := IntToStr(StrToInt(Edit9.Text) - 15)
      else if Edit7.Text = '2' then
        Edit9.Text := IntToStr(StrToInt(Edit9.Text) - 25);
    end;
    Memo2.Text := copy(Memo2.Text, contador+1, Length(Memo2.Text));
  end;}

end;

procedure TF_RETQ.SetDefaultPrinter(PrinterName: String);
var
  I: Integer;
  Device : PChar;
  Driver : Pchar;
  Port : Pchar;
  HdeviceMode: Thandle;
  aPrinter : TPrinter;
begin
  Printer.PrinterIndex := -1;
  getmem(Device, 255);
  getmem(Driver, 255);      
  getmem(Port, 255);
  aPrinter := TPrinter.create;
  for I := 0 to Printer.printers.Count-1 do
  begin
    if Printer.printers[i] = PrinterName then
    begin
      aprinter.printerindex := i;
      aPrinter.getprinter(device, driver, port, HdeviceMode);
      StrCat(Device, ',');
      StrCat(Device, Driver );
      StrCat(Device, Port );
      WriteProfileString('windows', 'device', Device);
      StrCopy( Device, 'windows' );
      SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, Longint(@Device));
    end;
  end;
  Freemem(Device, 255);
  Freemem(Driver, 255);
  Freemem(Port, 255);
  aPrinter.Free;
end;

function TF_RETQ.ListarImpressoras: String;
Var
  I : Integer;
begin
  Result:= '';
  ComboBox6.Clear;
  for I := 0 to Printer.Printers.Count - 1 do
  begin
    ComboBox6.Items.Add(Printer.Printers.Strings[I]);
  end;
  ComboBox6.ItemIndex := 0;
  Label15.Caption := ImpressoraPadrao;
  //ComboBox6.Text:= Label6.Caption;
end;

procedure TF_RETQ.DirectPrint(s: String);
var
  PTBlock : TPassThroughData;
begin
  PTBlock.nLen := Length(s);
  StrPCopy(@PTBlock.Data, s);
  Escape(printer.handle, PASSTHROUGH, 0, @PTBlock, nil);
end;

function TF_RETQ.ImpressoraPadrao :String; var
  aDevice : array[0..255] of char;
  aDriver : array[0..255] of char;
  aPort : array[0..255] of char;
  ahDMode : THandle;
begin
  Printer.GetPrinter(aDevice, aDriver, aPort, ahDMode);
  Result := aDevice;
end;


procedure TF_RETQ.ComboBox6Change(Sender: TObject);
begin
  Label15.Caption:= ComboBox6.Text;
  SetDefaultPrinter(ComboBox6.Items.Strings[ComboBox6.ItemIndex]);
end;

function TF_RETQ.ConverteBMPBit(LocalQRCodeEmBranco, LocalQRCodeBaixadoDoTribunal: String): Boolean;
var
  bitmap0, Bitmap, bitmap1, bitmap2 : TBitmap;
  MyOther: TRect;
  MyRect1, MyRect, MyOther1: TRect;
  LarguraEsquerda, LarguraDireita, LarguraTotal, AlturaTotal: integer;
begin

  result:= False;

  bitmap0 := TBitmap.Create;

  bitmap1 := TBitmap.Create;
  bitmap0.LoadFromFile(LocalQRCodeEmBranco); // ler a imagem vazia

  bitmap1.LoadFromFile(LocalQRCodeBaixadoDoTribunal);

  //Bitmap1.Canvas.FillRect(MyRect1);

  bitmap0.Canvas.Draw(0,0, Bitmap1);   // 0,0

  bitmap0.SaveToFile('C:\siscart\imgselo\QrCode.bmp');

  bitmap0.Destroy;
  bitmap1.Destroy;

  result:= True;

end;

procedure TF_RETQ.BitBtn5Click(Sender: TObject);
begin
  Dm.qryGenerico.Close;
  Dm.qryGenerico.SQL.Clear;
  Dm.qryGenerico.SQL.Add('update configur set etiqueta_posX = :etiqueta_posX, etiqueta_posY = :etiqueta_posY, qrCode_posX = :qrCode_posX, qrCode_posY = :qrCode_posY');
  Dm.qryGenerico.ParamByName('etiqueta_posX').AsString:= Edit3.Text;
  Dm.qryGenerico.ParamByName('etiqueta_posY').AsString:= Edit11.Text;
  Dm.qryGenerico.ParamByName('qrCode_posX').AsString  := Edit12.Text;
  Dm.qryGenerico.ParamByName('qrCode_posY').AsString  := Edit13.Text;
  Dm.qryGenerico.ExecSQL;

  Dm.Configur.Close;
  Dm.Configur.Open;
  Application.MessageBox(Pchar('Informações salvas com sucesso!'),'Menssagem',MB_OK);
end;

end.
