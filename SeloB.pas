unit SeloB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Printers, ComCtrls, ExtCtrls, jpeg;

type
  TF_SeloB = class(TForm)
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel2: TBevel;
    Bevel3: TBevel;
    MaskEdit7: TMaskEdit;
    Label7: TLabel;
    Label1: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    MaskEdit3: TMaskEdit;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_SeloB: TF_SeloB;

implementation

uses DMTD, Menu, QkSeloB, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_SeloB.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(Date);
  MaskEdit1.SetFocus;
end;

procedure TF_SeloB.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
  if key = 13 then Maskedit7.SetFocus;
end;

procedure TF_SeloB.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_SeloB.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_SeloB.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit2.text := '';
  maskedit7.text := '';
  maskedit1.setfocus;
end;

procedure TF_SeloB.BitBtn1Click(Sender: TObject);
var
  arq, arq_temp : String;
  sair   : Boolean;
  DtCalc : String;
  x, y : Integer;
begin
//  StatusBar1.SimpleText := 'Procurando Movimento...';
//  StatusBar1.UpDate;
  arq_temp := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'RELATOS';
  DestroeTabela(arq_temp);
  CriaTabela('RELATOS', arq_temp);


  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  if not v_chk_07 then
  begin
    Dm.ArqAux.Sql.Add('SELECT  p_auxiliar, registro, tabela, data_p, data_r, ');
    Dm.ArqAux.Sql.Add('v_emolumentos,');
    Dm.ArqAux.Sql.Add('v_emoladicional,');
    Dm.ArqAux.Sql.Add('v_mic,');
    Dm.ArqAux.Sql.Add('v_pag,');
    Dm.ArqAux.Sql.Add('v_viaexc,');
    Dm.ArqAux.Sql.Add('v_digitalizacao,');
    dm.arqaux.sql.add('v_informatica,');
    dm.arqaux.sql.add('v_graveletr,');
    dm.ArqAux.sql.add('v_conferencia,');
    dm.arqaux.sql.add('(v_nome + v_distrib + v_leis_dist + v_infodistrib) as v_distrib,');
    dm.ArqAux.sql.add('v_tribunal,');
    dm.arqaux.sql.add('v_defensoria,');
    dm.ArqAux.sql.add('v_procuradoria,');
    dm.arqaux.sql.add('v_mutua,');
    dm.arqaux.sql.add('v_acoterj,');
    dm.arqaux.sql.add('v_infodistrib,');
    dm.ArqAux.sql.add('v_graveletrdistrib,');
    dm.ArqAux.sql.add('v_subtotal,');
    dm.arqaux.sql.add('custas,');
    //Dm.ArqAux.Sql.Add('a_nome, valor_base, contato, ext_nat, livro_b, folha_b');
    Dm.ArqAux.Sql.Add('a_nome, valor_base, contato, ext_nat, livro_b, folha_b, selo_serie, selo_numero, daje, qtdpost, valordajepost, dajepost, dajevias');
    Dm.ArqAux.Sql.Add('FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit7.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('GROUP BY p_auxiliar');

    if F_Menu.Label39.Caption = '13225586000134' Then  // Bom jesus da lapa
      Dm.ArqAux.Sql.Add('ORDER BY data_p')
    else
    Dm.ArqAux.Sql.Add('ORDER BY registro');

 end
 else
 begin
    Dm.Calculo.Close;
    Dm.Calculo.Sql.Clear;
    Dm.Calculo.Sql.Add('SELECT data FROM cad_tabdemais');
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

    dm.tabdemais.Close;
    dm.tabdemais.sql.Clear;
    dm.tabdemais.sql.add('select * from cad_tabdemais');
    dm.tabdemais.sql.add('where');
    dm.tabdemais.sql.add('data = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
    dm.tabdemais.open;
    if (Dm.tabdemais.RecordCount = 0) then
    begin
      Dm.tabdemais.Close;
      Exit;
    end;

    Dm.ArqAux.Sql.Add('SELECT p_auxiliar, registro, tabela, data_p, data_r, ');
    Dm.ArqAux.Sql.Add('v_emolumentos ,');
    Dm.ArqAux.Sql.Add('v_emoladicional,');
    Dm.ArqAux.Sql.Add('v_mic,');
    Dm.ArqAux.Sql.Add('v_pag,');
    Dm.ArqAux.Sql.Add('v_viaexc,');
    Dm.ArqAux.Sql.Add('v_digitalizacao,');
    dm.arqaux.sql.add('v_informatica,');
    dm.arqaux.sql.add('v_graveletr,');
    dm.ArqAux.sql.add('v_conferencia,');
    dm.arqaux.sql.add('0.00 as v_distrib,');
    dm.ArqAux.sql.add('v_tribunal,');
    dm.ArqAux.sql.add('((v_distrib * ' + StringReplace(CurrToStr(dm.tabdemais.FieldByName('tribunal').ascurrency) , ',', '.', [rfReplaceAll]) +
                      ')/ 100) as v_disttribunal ,');
    dm.ArqAux.sql.add('((v_nome * ' + StringReplace(CurrToStr(dm.tabdemais.FieldByName('tribunal').ascurrency) , ',', '.', [rfReplaceAll]) +
                      ')/ 100) as v_nometribunal ,');
    dm.arqaux.sql.add('v_defensoria,');
    dm.ArqAux.sql.add('((v_distrib * ' + StringReplace(CurrToStr(dm.tabdemais.FieldByName('defensoria').ascurrency) , ',', '.', [rfReplaceAll]) +
                      ')/ 100) as v_distdefensoria,');
    dm.ArqAux.sql.add('((v_nome * ' + StringReplace(CurrToStr(dm.tabdemais.FieldByName('defensoria').ascurrency) , ',', '.', [rfReplaceAll]) +
                      ')/ 100) as v_nomedefensoria ,');
    dm.ArqAux.sql.add('v_procuradoria,');
    dm.ArqAux.sql.add('((v_distrib * ' + StringReplace(CurrToStr(dm.tabdemais.FieldByName('procuradoria').ascurrency) , ',', '.', [rfReplaceAll]) +
                       ')/ 100) as v_distprocuradoria,');
    dm.ArqAux.sql.add('((v_nome * ' + StringReplace(CurrToStr(dm.tabdemais.FieldByName('procuradoria').ascurrency) , ',', '.', [rfReplaceAll]) +
                      ')/ 100) as v_nomeprocuradoria ,');
    dm.arqaux.sql.add('v_mutua,');
    dm.arqaux.sql.add('v_acoterj,');
    dm.arqaux.sql.add('v_infodistrib,');
    dm.ArqAux.sql.add('v_graveletrdistrib,');
    dm.ArqAux.sql.add('v_subtotal + v_nome + v_distrib as v_subtotal,');
    dm.ArqAux.sql.add('v_subtotal + v_nome as v_subtotal,');
    dm.arqaux.sql.add('custas,');
    //Dm.ArqAux.Sql.Add('a_nome, valor_base, contato, ext_nat, livro_b, folha_b');
    Dm.ArqAux.Sql.Add('a_nome, valor_base, contato, ext_nat, livro_b, folha_b, selo_serie, selo_numero, daje, qtdpost, valordajepost, dajepost, dajevias');
    Dm.ArqAux.Sql.Add('FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit7.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('GROUP BY p_auxiliar');

    if F_Menu.Label39.Caption = '13225586000134' Then  // Bom jesus da lapa
      Dm.ArqAux.Sql.Add('ORDER BY data_p')
    else
    Dm.ArqAux.Sql.Add('ORDER BY registro');

  end;

  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
//    Dm.ArqAux.Close;
    MessageBox(Handle, PChar('MOVIMENTO DE TÍTULOS NÃO LOCALIZADO.'), 'SELO', MB_OK + MB_ICONINFORMATION);
//    MaskEdit1.SetFocus;
//    Exit;
  end;

  //Inserindo movimento de titulos

  Dm.ArqAux.FindFirst;
  while not Dm.ArqAux.eof do
  begin
   try
    Dm.ArqAux1.Close;
    Dm.ArqAux1.Sql.Clear;
    Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq_temp);
    Dm.ArqAux1.Sql.Add('(p_auxiliar, registro, tabela, data_pratica, data_r, v_emolumentos, v_emoladicional, v_mic, v_pag, v_viaexc, v_digitalizacao,');
    Dm.ArqAux1.Sql.Add('v_informatica, v_graveletr, v_conferencia, v_distrib, v_tribunal, v_defensoria, v_procuradoria, v_mutua,');
    Dm.ArqAux1.Sql.Add('v_acoterj, v_infodistrib, v_graveletrdistrib, v_subtotal, custas, a_nome, valor_base, contato, ext_nat,');
    //Dm.ArqAux1.Sql.Add('livro_b, folha_b, tp_prot, ');
    Dm.ArqAux1.Sql.Add('livro_b, folha_b, tp_prot, selo_serie, selo_numero, daje, qtdpost, valordajepost, dajepost, dajevias, ');
    Dm.ArqAux1.Sql.Add('v_disttribunal, v_nometribunal, v_distdefensoria, v_nomedefensoria, v_distprocuradoria, v_nomeprocuradoria)');
    Dm.ArqAux1.Sql.Add('VALUES(');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('p_auxiliar').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('registro').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('tabela').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + ConvData(dm.ArqAux.fieldbyname('data_p').AsString) + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + ConvData(dm.ArqAux.fieldbyname('data_r').AsString) + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_emolumentos').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_emoladicional').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_mic').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_pag').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_viaexc').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_digitalizacao').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_informatica').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_graveletr').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_conferencia').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_distrib').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_tribunal').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_defensoria').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_procuradoria').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_mutua').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_acoterj').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_infodistrib').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_graveletrdistrib').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_subtotal').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('custas').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('a_nome').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('valor_base').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('contato').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('ext_nat').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('livro_b').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('folha_b').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add('1, ');

    // OS 644
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('selo_serie').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('selo_numero').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('daje').AsString + Chr(39) + ',');

    // OS 856
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('qtdpost').AsString + Chr(39) + ',');
//  Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('valordajepost').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('valordajepost').AsCurrency) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('dajepost').AsString + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('dajevias').AsString + Chr(39) + ',');

    if v_chk_07 then
    begin
      Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_disttribunal').AsCurrency) + ',');
      Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_nometribunal').AsCurrency) + ',');
      Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_distdefensoria').AsCurrency) + ',');
      Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_nomedefensoria').AsCurrency) + ',');
      Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_distprocuradoria').AsCurrency) + ',');
      Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_nomeprocuradoria').AsCurrency));
    end
    else
    begin
      Dm.ArqAux1.Sql.Add('"",');
      Dm.ArqAux1.Sql.Add('"",');
      Dm.ArqAux1.Sql.Add('"",');
      Dm.ArqAux1.Sql.Add('"",');
      Dm.ArqAux1.Sql.Add('"",');
      Dm.ArqAux1.Sql.Add('""');
    end;

    Dm.ArqAux1.Sql.Add(')');
    Dm.ArqAux1.ExecSql;
    except
      showmessage('Erro no título protocolo: '+dm.ArqAux.fieldbyname('p_auxiliar').AsString);
    end;  
    Dm.ArqAux.Next;
  end;
  Dm.ArqAux.Close;

  y := 2;
  For x := 1 to 2 do
  Begin
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add(' SELECT * FROM certidao WHERE');
    If x = 1 then
    Begin
      DM.ArqAux.Sql.Add('     (movimento >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
      DM.ArqAux.Sql.Add(' AND  movimento <= ' + Chr(39) + ConvData(MaskEdit7.Text) + Chr(39) + ')');
    End
    Else
    Begin
      DM.ArqAux.Sql.Add('     (stat_data >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
      DM.ArqAux.Sql.Add(' AND  stat_data <= ' + Chr(39) + ConvData(MaskEdit7.Text) + Chr(39) + ')');
      DM.ArqAux.Sql.Add(' AND  status = "PRONTO"');
    End;

    if F_Menu.Label39.Caption = '13225586000134' Then  // Bom jesus da lapa
      Dm.ArqAux.Sql.Add('ORDER BY stat_data')
    else
    DM.ArqAux.Sql.Add('ORDER BY recno');

    DM.ArqAux.Open;

    if (DM.ArqAux.RecordCount = 0) then
    begin
      MessageBox(Handle, PChar('MOVIMENTO DE CERTIDÕES NÃO LOCALIZADO.'), 'SELO', MB_OK + MB_ICONINFORMATION);
    end;

    //Inserindo movimento de certidões

    Dm.ArqAux.FindFirst;
    while not Dm.ArqAux.eof do
    begin
     try
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq_temp);
      Dm.ArqAux1.Sql.Add('(p_auxiliar, registro, tabela, data_pratica, data_r, v_emolumentos, v_emoladicional, v_mic, v_pag, v_viaexc, v_digitalizacao,');
      Dm.ArqAux1.Sql.Add('v_informatica, v_graveletr, v_conferencia, v_distrib, v_tribunal, v_defensoria, v_procuradoria, v_mutua,');
      Dm.ArqAux1.Sql.Add('v_acoterj, v_infodistrib, v_graveletrdistrib, v_subtotal, custas, a_nome, valor_base, contato, ext_nat,');
      Dm.ArqAux1.Sql.Add('livro_b, folha_b, tp_prot)');
      Dm.ArqAux1.Sql.Add('VALUES(');
      Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('recibo').AsString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('protocolo').AsString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add('"" ' + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + ConvData(dm.ArqAux.fieldbyname('movimento').AsString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + ConvData(dm.ArqAux.fieldbyname('movimento').AsString) + Chr(39) + ',');
      
      If x = 1 then
        Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_emolumento').AsCurrency) + ',')
      Else
        Dm.ArqAux1.Sql.Add( '0' + ',');
      Dm.ArqAux1.Sql.Add( '0' + ',');
      Dm.ArqAux1.Sql.Add( '0' + ',');
      Dm.ArqAux1.Sql.Add( '0' + ',');
      Dm.ArqAux1.Sql.Add( '0' + ',');
      Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_digitalizacao').AsCurrency) + ',');
      Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_informatica').AsCurrency) + ',');
      Dm.ArqAux1.Sql.Add( '0' + ',');
      Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_conferencia').AsCurrency) + ',');
      Dm.ArqAux1.Sql.Add( '0' + ',');
      If x = 1 then
      Begin
        Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('tribunal').AsCurrency) + ',');
        Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('defensoria').AsCurrency) + ',');
        Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('procuradoria').AsCurrency) + ',');
      End
      Else
      Begin
        Dm.ArqAux1.Sql.Add( '0' + ',');
        Dm.ArqAux1.Sql.Add( '0' + ',');
        Dm.ArqAux1.Sql.Add( '0' + ',');
      End;
      Dm.ArqAux1.Sql.Add( '0' + ',');
      Dm.ArqAux1.Sql.Add( '0' + ',');
      Dm.ArqAux1.Sql.Add( '0' + ',');
      Dm.ArqAux1.Sql.Add( '0' + ',');
      If x = 1 then
      Begin
        Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('v_subtotal').AsCurrency) + ',');
        Dm.ArqAux1.Sql.Add(StrCurrPesq(dm.ArqAux.fieldbyname('custas').AsCurrency) + ',');
      End
      Else
      Begin
        Dm.ArqAux1.Sql.Add( '0' + ',');
        Dm.ArqAux1.Sql.Add( '0' + ',');
      End;
      Dm.ArqAux1.Sql.Add('"" ' + ',');
      Dm.ArqAux1.Sql.Add( '0' + ',');
      Dm.ArqAux1.Sql.Add('""' + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.fieldbyname('ext_nat').AsString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add('""' + ',');
      Dm.ArqAux1.Sql.Add('""' + ',');
      Dm.ArqAux1.Sql.Add(IntToStr(y));
      Dm.ArqAux1.Sql.Add(')');
      Dm.ArqAux1.ExecSql;
     except
       showmessage('Erro na certidão protocolo: '+dm.ArqAux.fieldbyname('protocolo').AsString);
     end;
     Dm.ArqAux.Next;
    end;
    inc(y);
  End;
  Dm.ArqAux.Close;

  DM.ArqAux.Close;
  DM.ArqAux.Sql.Clear;
  DM.ArqAux.Sql.Add('SELECT * FROM ' + arq_temp);
  Dm.ArqAux.Sql.Add(' ORDER BY data_pratica '); // estava ordenado por registro ate o dia 10-10-2014  data_pratica
  DM.ArqAux.Open;

  //  StatusBar1.SimpleText := 'Gerando Relatório...';
  //  StatusBar1.Update;
  Application.CreateForm(TQk_SeloB, Qk_SeloB);
  Qk_SeloB.QrLabel1.Caption  := F_Menu.Label29.Caption;
  Qk_SeloB.QrLabel2.Caption  := F_Menu.Label11.Caption;
  Qk_SeloB.QrLabel3.Caption  := F_Menu.Label13.Caption + ' ' + F_Menu.Label5.Caption;
  Qk_SeloB.QrLabel4.Caption  := 'REGISTRO DE TÍTULOS E DOCUMENTOS';
  Qk_SeloB.QrLabel5.Caption  := 'RELAÇÃO DE ATOS PRATICADOS ';
  Qk_SeloB.QRLabel42.Caption := 'Período de  ' + MaskEdit1.Text + ' a ' + MaskEdit7.Text;
  Qk_SeloB.QRLabel31.Caption := MaskEdit3.Text;
  Qk_SeloB.QuickRep1.Preview;
  Qk_SeloB.Destroy;
  Qk_SeloB := NIL;
  //  StatusBar1.SimpleText := 'Fim do Relatório';
  //  StatusBar1.Update;

  DestroeTabela(arq_temp);
  Bitbtn3.setfocus;
end;

procedure TF_SeloB.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_SeloB.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit7.Text := MaskEdit1.Text; 
end;

procedure TF_SeloB.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = 13 then BitBtn1.SetFocus;
end;

end.
