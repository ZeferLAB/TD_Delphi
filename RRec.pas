unit RRec;

interface

uses                     
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls, Printers, jpeg, RpRave,
  RpCon, RpConDS, RpDefine, RpBase, RpSystem, ExportPack, FileCtrl;

type
  TF_RRec = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel3: TBevel;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    ComboBox1: TComboBox;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox2: TComboBox;
    ControlBar1: TControlBar;
    Label36: TLabel;
    CheckBox1: TCheckBox;
    MaskEdit5: TMaskEdit;
    Label7: TLabel;
    RvSystem1: TRvSystem;
    RvDataSetConnection3: TRvDataSetConnection;
    RvProject1: TRvProject;
    ComboBox3: TComboBox;
    EXQR: TExportQR;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Imprime_Recibo(Sender: TObject);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ImprimeCertidaoDeAtoPraticado(_caminho, _cod_emissor_, MasKaraDoDaje: String);
    { Private declarations }
  public
    { Public declarations }
    total_pag:string;
  end;

var
  F_RRec: TF_RRec;

implementation

uses DMTD, Menu, RECR, FuncGeral, ProcGeral, U_Daje, Exame, RECR2;

{$R *.DFM}


procedure TF_RRec.Imprime_Recibo(Sender: TObject);
var
  linha, porta, qtde_talao  : Integer;
  branco, texto, buffer, primeiro, ultimo, recibo : String;
  F : TextFile;
  l6, l3, l20, l7, l11, l13 : String;
begin
  //Recibo Bematech

   l6  := F_Menu.Label9.Caption;
   l3  := F_Menu.Label7.Caption;
   l7  := F_Menu.label11.Caption;
   l13 := F_Menu.label13.Caption;

   //Gerando Número de Recibo

   while not dm.ArqAux.Eof do
   begin
     dm.Recibo.close;
     dm.recibo.sql.clear;
     dm.recibo.sql.add('select * from recibo where');
     dm.recibo.sql.add('protocolo >= ' + dm.ArqAux.FieldByName('protocolo').AsString);
     dm.recibo.sql.add('and');
     dm.recibo.sql.add('cartorio = "' + F_Menu.Label37.Caption + '"');
     dm.recibo.open;

     if dm.recibo.RecordCount = 0 then
     begin
       dm.recibo.close;
       dm.Recibo.SQL.Clear;
       dm.recibo.SQL.add('select max(recibo) as recibo from recibo');
       dm.recibo.sql.add('where cartorio = "' + F_Menu.Label37.Caption + '"');
       dm.recibo.open;

       if dm.recibo.RecordCount = 0 then recibo := '1'
       else recibo := inttostr(dm.recibo.FieldByName('recibo').AsInteger + 1);

       dm.Recibo.close;
       dm.Recibo.sql.Clear;
       dm.Recibo.sql.add('insert into recibo (');
       dm.Recibo.sql.add('p_auxiliar, protocolo, recibo, cartorio)');
       dm.Recibo.sql.add('values(');
       dm.Recibo.sql.add(dm.ArqAux.FieldByName('p_auxiliar').AsString + ',');
       dm.Recibo.sql.add(dm.ArqAux.FieldByName('registro').AsString + ',');
       dm.recibo.sql.add(recibo + ',');
       dm.Recibo.sql.add(F_Menu.Label37.Caption + ')');
       dm.Recibo.ExecSQL;
     end
     else recibo := dm.recibo.FieldByName('recibo').AsString;

    // AssignFile(F,'C:\NOTIF\' + RECIBO + '.TXT');
     AssignFile(F, Bematech_porta);
     Rewrite(F);

     buffer := Copy(branco,1, (28 - (length(Trim(l6)) div 2))) + Trim(l6);
     Writeln(F, buffer);
     buffer := Copy(branco,1, (20 - (length(Trim(l7)) div 2))) + Trim(l7);
     Writeln(F, buffer);
     buffer := '        CNPJ : ' + F_Menu.cnpj;
     Writeln(F, buffer);
     Writeln(F, '');
     buffer  := '             REGISTRO ';
     Writeln(F, buffer);
     buffer := 'Recibo : '  + Strzero(recibo, 6) + '  Protocolo : ' + Dm.ArqAux.FieldByName('registro').AsString;
     Writeln(F, buffer);
     buffer := 'Data Pedido : ' + dm.ArqAux.FieldByName('data_p').AsString + ' Data Entrega : 24hs';
     Writeln(F, buffer);
     buffer := 'Tipo de Registro : ' + dm.ArqAux.FieldByName('ext_nat').AsString ;
     Writeln(F, buffer);
     buffer := 'Recebi de(a) ' + dm.ArqAux.FieldByName('a_nome').AsString;
     buffer := buffer + ' CPF/CNPJ : ' + dm.ArqAux.FieldByName('doc').AsString;
     buffer := buffer + ' a quantia de R$ ' + Trim(StrCurr(dm.ArqAux.FieldByName('v_total').AsCurrency , 14, True));
     buffer := buffer + ' referente aos emolumetos cobrados conforme';
     buffer := buffer + ' descrito abaixo:';
     Writeln(F, buffer);
     buffer := 'Vl.Decl.:  R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('valor_base').AsCurrency , 14, True));
     Writeln(F, buffer);

     buffer := 'Nomes : ' + strzero(Dm.ArqAux.FieldByname('qtde_nome').AsString , 3) + ' Paginas : ' + strzero(Dm.ArqAux.FieldByname('pag_adic').AsString, 3) + ' Vias : ' + Strzero(Dm.ArqAux.FieldByname('vias_adc').AsString, 3);
     Writeln(F, buffer);
     buffer := 'Diligenca : ' + Dm.ArqAux.FieldByname('qtde_diligencia').AsString;
     Writeln(F, buffer);


     if Dm.ArqAux.FieldByname('v_emolumentos').AsCurrency > 0 then
     begin
         buffer := 'TAB 10.01  Emolumentos....: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_emolumentos').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;

     if Dm.ArqAux.FieldByname('v_emoladicional').AsCurrency > 0 then
     begin
       if (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1001') or (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1003A') or (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1003C') then
         buffer := 'TAB10.1.I  5PrimeirasPag..: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_emoladicional').AsCurrency, 14, True));
       if (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1002') or (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1003B') or (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1003D') then
         buffer := 'TAB10.2.I 1Pagina........: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_emoladicional').AsCurrency, 14, True));
       if (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1006') or (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1009') then
         buffer := 'TAB10.6    Diligencia.....: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_emoladicional').AsCurrency, 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_not_pd').AsCurrency > 0 then
     begin
       buffer := 'TAB10.2.I  1Pagina........: R$ ' + Trim(StrCurr(dm.ArqAux.FieldByName('v_not_pd').AsCurrency, 14, True));
       Writeln(F, buffer);

     end;

     if dm.ArqAux.FieldByName('v_pag').AsCurrency > 0 then
     begin
       if (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1001') or (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1003A') or (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1003C') then
         buffer := 'TAB10.1.II Pag.Excedente..: R$ ' + Trim(StrCurr(dm.ArqAux.FieldByName('v_pag').AsCurrency, 14, True));
       if (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1002') or (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1003B') or (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1003D') or (trim(dm.ArqAux.FieldByName('tabela').AsString) = '1006') then
         buffer := 'TAB10.2.II Pag.Excedente..: R$ ' + Trim(StrCurr(dm.ArqAux.FieldByName('v_pag').AsCurrency, 14, True));
       Writeln(F, buffer);
     end;

     if Dm.ArqAux.FieldByname('v_mic').AsCurrency > 0 then
     begin
       buffer := 'TAB1.7    Microfilme.....: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_mic').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_viaexc').AsCurrency > 0 then
     begin
       buffer := 'TAB10.4    Via Excedente..: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_viaexc').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_digitalizacao').AsCurrency > 0 then
     begin
       buffer := 'TAB10.6    Digitalizacao..: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_digitalizacao').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_informatica').AsCurrency > 0 then
     begin
       buffer := 'TAB1.9     Informatica....: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_informatica').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_graveletr').AsCurrency > 0 then
     begin
       buffer := 'TAB1.10    Grav Eletronica: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_graveletr').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;

     if Dm.ArqAux.FieldByname('v_conferencia').AsCurrency > 0 then
     begin
       buffer := 'TAB1.5     Conferencia....: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_conferencia').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('doi').AsCurrency > 0 then
     begin
       buffer := 'TAB1.6/1.9 Doi............: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('doi').AsCurrency, 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('procest').AsCurrency > 0 then
     begin
       buffer := 'TAB10.5    ProcEstrangeira: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('procest').AsCurrency, 14, true));
       Writeln(F, buffer);
     end;
     buffer := '                      ---------------';
     Writeln(F, buffer);
     if Dm.ArqAux.FieldByname('v_subtotal').AsCurrency > 0 then
     begin
       buffer := '           SubTotal.......: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_subtotal').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_nome').AsCurrency > 0 then
     begin
       buffer := 'TAB4       Nomes Exced....: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_nome').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_distrib').AsCurrency > 0 then
     begin
       buffer := 'TAB4       Distribuicao...: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_distrib').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_infodistrib').AsCurrency > 0 then
     begin
       buffer := 'TAB1.9     Info Distrib...: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_infodistrib').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_graveletrdistrib').AsCurrency > 0 then
     begin
       buffer := 'TAB1.10    Grav.Elet.Dist.: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_graveletrdistrib').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_leis_dist').AsCurrency > 0 then
     begin
       buffer := 'TAB4       Leis Distrib...: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_leis_dist').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;


     if Dm.ArqAux.FieldByname('v_tribunal').AsCurrency > 0 then
     begin
       buffer := '           Lei 3217/99....: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_tribunal').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_procuradoria').AsCurrency > 0 then
     begin
       buffer := '           Lei 4664/05....: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_procuradoria').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_defensoria').AsCurrency > 0 then
     begin
       buffer := '           Lei 111/06.....: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_defensoria').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_mutua').AsCurrency > 0 then
     begin
       buffer := '           Lei 3761/02....: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_mutua').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     if Dm.ArqAux.FieldByname('v_acoterj').AsCurrency > 0 then
     begin
       buffer := '           Lei 590/82.....: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_acoterj').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     buffer := '                      ---------------';
     Writeln(F, buffer);
     if Dm.ArqAux.FieldByname('v_total').AsCurrency > 0 then
     begin
       buffer := '           Total..........: R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByname('v_total').AsCurrency , 14, True));
       Writeln(F, buffer);
     end;
     Writeln(F, '');
     Writeln(F, '');
     buffer := '________________________________';
     Writeln(F, buffer);
     buffer := ComboBox1.Text;
     Writeln(F, buffer);
     buffer := ComboBox2.Text;
     Writeln(F, buffer);
     Writeln(F, '');
   //  buffer := 'Func. ' + F_Menu.Label1.Caption;
   //  Writeln(F, buffer);
     Writeln(F, '');
     Writeln(F, '');
     Writeln(F, '');
     Writeln(F, '');
     Writeln(F, '');
     Writeln(F, '');
     Writeln(F, '');
     Writeln(F, '');
     Writeln(F, '');
     CloseFile(F);

     dm.ArqAux.Next;
   end;
end;

procedure TF_RRec.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit5.setfocus;
end;

procedure TF_RRec.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit4.setfocus;
end;

procedure TF_RRec.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RRec.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit5.Clear;
  MaskEdit3.Clear;
  MaskEdit4.Clear;
  MaskEdit1.SetFocus;
end;

procedure TF_RRec.BitBtn1Click(Sender: TObject);
var
  arq : String;
  SIT1 : string;
  _caminho, _cod_emissor_ : String;
  p_auxiliar: String;
  i: Integer;

begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
   MessageBox(Handle, PChar('Data inválida !'), 'RECIBO', MB_OK + MB_ICONINFORMATION);
   MaskEdit1.SetFocus;
   Exit;
  end;

  i:= 0;

{  DM.Join.Close;
  DM.Join.Sql.Clear;
  DM.Join.Sql.Add('SELECT a.data_r, a.data_p, a.p_auxiliar, a.protocolo, a.registro, a.recibo,');
  DM.Join.Sql.Add(' a.ext_nat, a.a_nome, a.valor_base, a.custas,');
  DM.Join.Sql.Add(' a.v_subtotal, a.v_nome, a.v_distrib, a.v_tribunal, a.v_procuradoria, a.v_defensoria,');
  DM.Join.Sql.Add(' a.v_mutua, a.v_acoterj, a.v_total, a.deposito,');
  DM.Join.Sql.Add(' b.tabela, b.item, b.subitem, b.descricao, b.valor_calc');
  DM.Join.Sql.Add(' FROM td a INNER JOIN td_pedid b on (a.p_auxiliar = b.p_auxiliar)');
  DM.Join.Sql.Add(' WHERE ');
  DM.Join.Sql.Add(' a.data_p between ' + QuotedStr(ConvData(MaskEdit1.Text)) + ' AND ' + QuotedStr(ConvData(MaskEdit5.Text)));

  if (StrToInt(MaskEdit3.Text) > 0) AND (StrToInt(MaskEdit4.Text) > 0) then
  begin
    DM.Join.Sql.Add(' AND a.registro >= ' + Trim(MaskEdit3.Text));
    DM.Join.Sql.Add(' AND a.registro <= ' + Trim(MaskEdit4.Text));
  end;
  DM.Join.SQL.add(' AND cartorio = "' + F_Menu.Label37.Caption + '"');
  DM.Join.Sql.Add(' ORDER BY a.p_auxiliar');
  DM.Join.Open;

  if (DM.Join.RecordCount = 0) then
  begin
    DM.Join.Close;
    MessageBox(Handle, PChar('Movimento não localizado !'), 'RECIBO', MB_OK + MB_ICONINFORMATION);
    MaskEdit1.SetFocus;
    Exit;
  end;

  if CheckBox1.Checked then
  begin
    RvDataSetConnection3.DataSet := DM.Join;

//    ShowMessage('Raveeeeeeee');

    RvProject1.SetParam('nome_cart', F_Menu.Label9.Caption);
    RvProject1.SetParam('ende_cart', F_Menu.Label11.Caption);
    RvProject1.SetParam('nome_ofic', F_Menu.Label5.Caption);
    RvProject1.SetParam('titu_ofic', F_Menu.Label13.Caption);
    RvProject1.SetParam('assina',    Trim(Combobox1.Text));
    RvProject1.SetParam('cargo_ass', Trim(ComboBox2.Text));
    RvProject1.SetParam('data_ass',  DataExtenso(DM.Join.FieldByName('data_p').AsString, True, ''));

    if DM.Join.FieldByName('deposito').AsCurrency > DM.Join.FieldByName('custas').AsCurrency then
    begin
      RvProject1.SetParam('final', 'DEVOLVER.............................:');
      RvProject1.SetParam('valor', 'R$ ' + StrCurr((DM.Join.fieldbyname('deposito').AsCurrency - DM.Join.fieldbyname('v_total').AsCurrency), 14, True));
    end
    else if DM.Join.FieldByName('deposito').AsCurrency < DM.Join.FieldByName('v_total').AsCurrency then
    begin
      RvProject1.SetParam('final', 'RECEBER..............................:');
      RvProject1.SetParam('valor', 'R$ ' + StrCurr((DM.Join.fieldbyname('v_total').AsCurrency - DM.Join.fieldbyname('deposito').AsCurrency), 14, True));
    end
    else if DM.Join.FieldByName('v_total').AsCurrency = DM.Join.FieldByName('deposito').AsCurrency then
    begin
      RvProject1.SetParam('final', '......................................');
      RvProject1.SetParam('valor', StrCurr(0, 14, True));
    end;
    RvProject1.ExecuteReport('report1');
  end;
}

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT td.tipo_reg, td.lvc_reg, td.lva_reg, td.lvb_reg, td.livro_reg, p_auxiliar, protocolo, a_nome, ext_nat, data_p, registro, data_r, tabela, recibo, daje, serie_daje, obs_prov1, averba,sequencia_averbacao, ');
  Dm.ArqAux.Sql.Add(' a_nome, doc, a_cidade, natureza, contrato, agencia, contato, valor_base, selo_serie, selo_numero, selo, selo_validador,');
  Dm.ArqAux.Sql.Add(' qtde_nome, pag_adic, qtde_diligencia, vias_adc,');
  Dm.ArqAux.Sql.Add(' v_emolumentos,');
  Dm.ArqAux.Sql.Add(' v_emoladicional,');
  Dm.ArqAux.Sql.Add(' v_mic,');
  Dm.ArqAux.Sql.Add(' lvb,');
  Dm.ArqAux.Sql.Add(' lva,');
  Dm.ArqAux.Sql.Add(' lvc,');
  Dm.ArqAux.Sql.Add(' livro,');
  Dm.ArqAux.Sql.Add(' v_pag,');
  Dm.ArqAux.Sql.Add(' v_not_pd,');
  Dm.ArqAux.Sql.Add(' v_viaexc,');
  Dm.ArqAux.Sql.Add(' v_digitalizacao,');
  dm.ArqAux.sql.add(' v_informatica,');
  dm.ArqAux.sql.add(' v_graveletr,');
  dm.ArqAux.sql.add(' v_conferencia,');
  dm.ArqAux.sql.add(' v_nome,');
  dm.ArqAux.sql.add(' v_tribunal,');
  dm.ArqAux.SQL.add(' v_procuradoria,');
  dm.ArqAux.sql.add(' v_defensoria,');
  dm.ArqAux.sql.add(' v_mutua,');
  dm.arqaux.sql.add(' v_acoterj,');
  dm.ArqAux.sql.add(' v_distrib,');
  dm.ArqAux.sql.add(' v_infodistrib,');
  dm.ArqAux.sql.add(' v_graveletrdistrib,');
  dm.ArqAux.sql.add(' (v_doi + v_doi_info) as doi,');
  dm.ArqAux.sql.add(' v_procest as procest,');
  DM.ArqAux.sql.add(' v_leis_dist,');
  dm.arqaux.sql.add(' v_subtotal,');
  dm.arqaux.sql.add(' v_total,');
  Dm.ArqAux.Sql.Add(' v_ar, deposito, custas, cod_local, v_cus_ter, folha, folha_a, folha_b, folha_c, folha_reg,folha_reg_f, lvf,');
  Dm.ArqAux.Sql.Add(' (v_guia + v_guia_info) as v_guia');
  Dm.ArqAux.Sql.Add(' FROM td');
  Dm.ArqAux.Sql.Add(' WHERE');
  Dm.ArqAux.Sql.Add(' data_p between ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux.Sql.Add(' AND ' + Chr(39) + ConvData(MaskEdit5.Text) + Chr(39));

  if (StrToInt(MaskEdit3.Text) > 0) AND (StrToInt(MaskEdit4.Text) > 0) then
  begin
    if (ComboBox3.Text <> '') Then
    Begin
      if (ComboBox3.Text = 'Nº do Registro') Then
      Begin
        Dm.ArqAux.Sql.Add('AND registro >= ' + Trim(MaskEdit3.Text));
        Dm.ArqAux.Sql.Add('AND registro <= ' + Trim(MaskEdit4.Text));
      End
      Else
      Begin
        Dm.ArqAux.Sql.Add('AND p_auxiliar >= ' + Trim(MaskEdit3.Text));
        Dm.ArqAux.Sql.Add('AND p_auxiliar <= ' + Trim(MaskEdit4.Text));
      End;
    End;
  end;
  dm.arqaux.SQL.add('AND cartorio = "' + F_Menu.Label37.Caption + '"');
  Dm.ArqAux.Sql.Add('GROUP BY p_auxiliar');
  Dm.ArqAux.Sql.Add('ORDER BY p_auxiliar');
  Dm.ArqAux.Open;

  p_auxiliar:= Dm.ArqAux.FieldByName('p_auxiliar').AsString;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    MessageBox(Handle, PChar('Movimento não localizado !'), 'RECIBO', MB_OK + MB_ICONINFORMATION);
    MaskEdit1.SetFocus;
    Exit;
  end
  Else
  Begin
    total_pag:=dm.arqaux.fieldbyname('folha_reg_f').AsString;
    ImprimeCertidaoDeAtoPraticado(_caminho, _cod_emissor_, '00####');
  End;

  if (Not(ModalidadeAverbacaoCapital)) Then
  Begin
    Dm.qryGenerico_Auxiliar4.Close;
    Dm.qryGenerico_Auxiliar4.Sql.Clear;
    Dm.qryGenerico_Auxiliar4.Sql.Add('SELECT td.lvc_reg, td.lva_reg, td.lvb_reg, td.livro_reg, td.protocolo, td.selo_serie, daje.numero_selo as selo, td.selo_serie as selo_numero, daje.cod_validacao as selo_validador, '+
                      'selos.id, daje.serie_daje, daje.numero_daje as daje, daje.emol_daje, daje.tx_fisca_daje, td.lvf, '+
                      'daje.fecom_daje, 	def_pub_daje, daje.vr_daje, daje.vr_declarado,  td.p_auxiliar, protocolo,'+
                      'a_nome, ext_nat, data_p, td.registro, data_r, tabela, td.recibo, td.obs_prov1, averba, a_nome, '+
                      'td.doc, a_cidade, natureza, contrato, agencia, contato, valor_base, qtde_nome, pag_adic, '+
                      'qtde_diligencia, vias_adc, v_emolumentos, v_emoladicional, v_mic, lvb, lva, lvc, livro, '+
                      'v_pag, v_not_pd, v_viaexc, v_digitalizacao, v_informatica, v_graveletr, v_conferencia, v_nome, '+
                      'v_tribunal, v_procuradoria, v_defensoria, v_mutua, v_acoterj,v_distrib,v_infodistrib, v_graveletrdistrib, '+
                      '(v_doi + v_doi_info) as doi, v_procest as procest, v_leis_dist, v_subtotal, v_total, v_ar, deposito, custas, '+
                      'cod_local, v_cus_ter, folha, folha_a, folha_b, folha_c, folha_reg, (v_guia + v_guia_info) as v_guia FROM selos '+
                      'inner join daje on (selos.daje = daje.numero_daje) and selos.serie_daje = daje.serie_daje '+
                      'inner join td on (td.p_auxiliar = selos.recibo) where td.p_auxiliar = '+QuotedStr(F_Exame.MaskEdit1.Text)+' ');

    Dm.qryGenerico_Auxiliar4.Open;

    if (Dm.qryGenerico_Auxiliar4.RecordCount > 0) then
    begin
      if (MessageBox(Handle, PChar('Existem dajes de vias adicionais. Deseja gerar a certidão de ato praticado ?'), 'Certidão de Ato Praticado', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
      Begin
        Dm.qryGenerico_Auxiliar4.First;
        for i:= 0 to Dm.qryGenerico_Auxiliar4.Recordcount - 1 do
        begin
          Dm.qryGenerico_Auxiliar4.FieldByName('daje').AsString;

          Dm.ArqAux.Close;
          Dm.ArqAux.Sql.Clear;
          Dm.ArqAux.Sql.Add('SELECT td.lvc_reg, td.lva_reg, td.lvb_reg, td.livro_reg, td.protocolo, td.selo_serie,td.sequencia_averbacao, daje.numero_selo as selo, td.selo_serie as selo_numero, daje.cod_validacao as selo_validador, '+
                            'selos.id, daje.serie_daje, daje.numero_daje as daje, daje.emol_daje, daje.tx_fisca_daje, td.lvf, '+
                            'daje.fecom_daje, 	def_pub_daje, daje.vr_daje, daje.vr_declarado,  td.p_auxiliar, protocolo,'+
                            'a_nome, ext_nat, data_p, td.registro, data_r, tabela, td.recibo, td.obs_prov1, averba, a_nome, '+
                            'td.doc, a_cidade, natureza, contrato, agencia, contato, valor_base, qtde_nome, pag_adic, '+
                            'qtde_diligencia, vias_adc, v_emolumentos, v_emoladicional, v_mic, lvb, lva, lvc, livro, '+
                            'v_pag, v_not_pd, v_viaexc, v_digitalizacao, v_informatica, v_graveletr, v_conferencia, v_nome, '+
                            'v_tribunal, v_procuradoria, v_defensoria, v_mutua, v_acoterj,v_distrib,v_infodistrib, v_graveletrdistrib, '+
                            '(v_doi + v_doi_info) as doi, v_procest as procest, v_leis_dist, v_subtotal, v_total, v_ar, deposito, custas, '+
                            'cod_local, v_cus_ter, folha, folha_a, folha_b, folha_c, folha_reg, (v_guia + v_guia_info) as v_guia FROM selos '+
                            'inner join daje on (selos.daje = daje.numero_daje) and selos.serie_daje = daje.serie_daje '+
                            'inner join td on (td.p_auxiliar = selos.recibo) where td.p_auxiliar = '+QuotedStr(F_Exame.MaskEdit1.Text)+' and numero_daje = '+QuotedStr(Dm.qryGenerico_Auxiliar4.FieldByName('daje').AsString)+' ');

          Dm.ArqAux.Open;



          ImprimeCertidaoDeAtoPraticado(_caminho, _cod_emissor_,'00####');
          Dm.qryGenerico_Auxiliar4.Next;
        end;
      End;

    end;
  End;
  Screen.Cursor := crdefault;
  BitBtn3.SetFocus;
end;

procedure TF_RRec.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then ComboBox1.Setfocus;
end;

procedure TF_RRec.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  Begin
    ComboBox2.setfocus;
  End;
end;

procedure TF_RRec.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then bitbtn1.setfocus;
end;

procedure TF_RRec.MaskEdit3Exit(Sender: TObject);
begin
  if ValidNumero(MaskEdit3.Text) then
    MaskEdit4.Text := MaskEdit3.Text;
end;

procedure TF_RRec.MaskEdit4Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit4.Text)) then MaskEdit4.Text := '0';
end;

procedure TF_RRec.FormActivate(Sender: TObject);
begin

  if Assigned(F_exame) then  // se a tela de exame estiver aberta entra aqui
  begin
    F_RRec.Color := clSilver;
    dm.qryGenerico_Auxiliar3.Close;
    dm.qryGenerico_Auxiliar3.SQL.Clear;
    dm.qryGenerico_Auxiliar3.SQL.Add('select data_p from td where p_auxiliar = '+QuotedStr(F_Exame.MaskEdit1.Text)+'');
    dm.qryGenerico_Auxiliar3.Open;

    MaskEdit1.Text := DateToStr(dm.qryGenerico_Auxiliar3.FieldByName('data_p').AsDateTime);
    MaskEdit5.Text := DateToStr(dm.qryGenerico_Auxiliar3.FieldByName('data_p').AsDateTime);
    
  end
  else
  begin
    MaskEdit1.Text := DateToStr(date);
    MaskEdit5.Text := DateToStr(date);
  end;

end;

procedure TF_RRec.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RRec.MaskEdit1Exit(Sender: TObject);
begin
  if ValidData(MaskEdit1.Text) then
    MaskEdit5.Text := MaskEdit1.Text;
end;

procedure TF_RRec.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

procedure TF_RRec.ImprimeCertidaoDeAtoPraticado(_caminho, _cod_emissor_, MasKaraDoDaje: String);
var
  sNumeroProtocolo: String;
begin
  If CheckBox1.Checked then
  Begin
    if trim(TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-'))  <> '27271464000199' then
    begin
      Application.CreateForm(TQK_RecR, QK_RecR);
      Qk_RecR.QrLabel2.Caption  := UpperCase(F_Menu.Label9.Caption);
      Qk_RecR.QrLabel88.Caption := F_Menu.Label11.Caption;

      if (F_menu.Label39.Caption = '28287131000110') or (F_menu.Label39.Caption = '28.287.131/0001-10') Then  //Serrinha
        QK_RecR.QRLabel68.Caption:= 'Parte....................................:';

      Qk_RecR.QrLabel89.Caption := 'Nome do Titular: '+F_Menu.LbNomeTitular.Caption;//F_Menu.Label5.Caption;
      Qk_RecR.QrLabel90.Caption := F_Menu.Label13.Caption;
      QK_RecR.QRLabel63.Caption := F_Menu.label13.Caption;
      Qk_RecR.QrLabel81.Caption := Trim(Combobox1.Text);
      Qk_RecR.QrLabel80.Caption := Trim(ComboBox2.Text);
      QK_RecR.QRLabel16.Caption := id_eselo;
      QK_RecR.QRDBText7.Mask    := MasKaraDoDaje;

      Qk_RecR.QuickRep1.Preview;

      //Dm.ArqAux.First;
      //While (NOT Dm.ArqAux.Eof) Do
      Begin

        if not DirectoryExists(dir_daje + 'Atos\') then
        begin
          ForceDirectories(dir_daje + 'Atos\');
          if not DirectoryExists(dir_daje + 'Atos\') then
          begin
            showmessage('Problemas para criar diretorio ' + dir_daje + 'Atos\');
            exit;
          end;
        end;
        sNumeroProtocolo:= Dm.ArqAux.FieldByName('p_auxiliar').asString;
        _caminho := dir_daje + 'Atos\REC_' + sNumeroProtocolo + '.PDF';

        //If NOT FileExists(_caminho) then
        Begin
          Qk_RecR.QuickRep1.Prepare;
          EXQR.Report := Qk_RecR.QuickRep1;
          EXQR.ExportQRPDF(dir_daje + 'Atos\REC_' + sNumeroProtocolo, True, False);
          _cod_emissor_ := id_eselo;
          Dm.ArqAux2.Close;
          Dm.ArqAux2.Sql.Clear;
          Dm.ArqAux2.Sql.Add('select iddaje_tj from daje where numero_selo = ' + QuotedStr(Dm.ArqAux.FieldByName('selo').asString));
          Dm.ArqAux2.Open;
          If Dm.ArqAux2.FieldByname('iddaje_tj').AsString = '9999' then _cod_emissor_ := '9999';
          If NOT AnexarTeorAto(_cod_emissor_, TirarTudo(Dm.ArqAux.FieldByName('selo').asString,'-','/','.'), _caminho) then
             ShowMessage('Problemas para enviar o Teor do Ato para o TJBA.')
          else
              Application.MessageBox('Teor do ato enviado com sucesso para o TJBA', 'Recibos Titulos', Mb_IconInformation);

          Dm.ArqAux2.Close;
        End;
        //else
        //showmessage('Já existe o arquivo ' + dir_daje + 'Atos\REC_' + sNumeroProtocolo);


        //Dm.ArqAux.Next;
      End;
      DeleteFile('C:\siscart\imgselo\td\qrcode_'+Dm.RemovePonto(Dm.ArqAux.FieldByName('selo').asString)+'.bmp');


      Qk_RecR.Destroy;
      Qk_RecR := NIL;
    end else
    begin
      Application.CreateForm(TQK_RecR2, QK_RecR2);
      QK_RecR2.QrLabel2.Caption  := UpperCase(F_Menu.Label9.Caption);
      QK_RecR2.QrLabel88.Caption := F_Menu.Label11.Caption;

      if (F_menu.Label39.Caption = '28287131000110') or (F_menu.Label39.Caption = '28.287.131/0001-10') Then  //Serrinha
        QK_RecR2.QRLabel68.Caption:= 'Parte....................................:';

      QK_RecR2.QrLabel89.Caption := 'Nome do Titular: '+F_Menu.LbNomeTitular.Caption;//F_Menu.Label5.Caption;
      QK_RecR2.QrLabel90.Caption := F_Menu.Label13.Caption;
      QK_RecR2.QRLabel63.Caption := F_Menu.label13.Caption;
      QK_RecR2.QrLabel81.Caption := Trim(Combobox1.Text);
      QK_RecR2.QrLabel80.Caption := Trim(ComboBox2.Text);
      QK_RecR2.QRLabel16.Caption := id_eselo;
      QK_RecR2.QRDBText7.Mask    := MasKaraDoDaje;

      QK_RecR2.QuickRep1.Preview;

      //Dm.ArqAux.First;
      //While (NOT Dm.ArqAux.Eof) Do
      Begin

        if not DirectoryExists(dir_daje + 'Atos\') then
        begin
          ForceDirectories(dir_daje + 'Atos\');
          if not DirectoryExists(dir_daje + 'Atos\') then
          begin
            showmessage('Problemas para criar diretorio ' + dir_daje + 'Atos\');
            exit;
          end;
        end;
        sNumeroProtocolo:= Dm.ArqAux.FieldByName('p_auxiliar').asString;
        _caminho := dir_daje + 'Atos\REC_' + sNumeroProtocolo + '.PDF';

        //If NOT FileExists(_caminho) then
        Begin
          QK_RecR2.QuickRep1.Prepare;
          EXQR.Report := Qk_RecR2.QuickRep1;
          EXQR.ExportQRPDF(dir_daje + 'Atos\REC_' + sNumeroProtocolo, True, False);
          _cod_emissor_ := id_eselo;
          Dm.ArqAux2.Close;
          Dm.ArqAux2.Sql.Clear;
          Dm.ArqAux2.Sql.Add('select iddaje_tj from daje where numero_selo = ' + QuotedStr(Dm.ArqAux.FieldByName('selo').asString));
          Dm.ArqAux2.Open;
          If Dm.ArqAux2.FieldByname('iddaje_tj').AsString = '9999' then _cod_emissor_ := '9999';
          If NOT AnexarTeorAto(_cod_emissor_, TirarTudo(Dm.ArqAux.FieldByName('selo').asString,'-','/','.'), _caminho) then
             ShowMessage('Problemas para enviar o Teor do Ato para o TJBA.')
          else
              Application.MessageBox('Teor do ato enviado com sucesso para o TJBA', 'Recibos Titulos', Mb_IconInformation);

          Dm.ArqAux2.Close;
        End;
        //else
        //showmessage('Já existe o arquivo ' + dir_daje + 'Atos\REC_' + sNumeroProtocolo);


        //Dm.ArqAux.Next;
      End;
      DeleteFile('C:\siscart\imgselo\td\qrcode_'+Dm.RemovePonto(Dm.ArqAux.FieldByName('selo').asString)+'.bmp');


      QK_RecR2.Destroy;
      QK_RecR2 := NIL;

    end;
  End;

  if F_Menu.bematech.Caption = '1' then
  begin
    Imprime_Recibo(Nil);
  end;
end;

procedure TF_RRec.FormShow(Sender: TObject);
begin
  ComboBox1.Text:= F_Menu.Label25.Caption;
end;

end.
