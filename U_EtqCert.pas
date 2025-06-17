unit U_EtqCert;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers, CheckLst, Db,
  DBTables, RDprint, jpeg;

type
  TF_RETQC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit3: TMaskEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label4: TLabel;
    Label6: TLabel;
    MaskEdit2: TMaskEdit;
    RDprint1: TRDprint;
    Label11: TLabel;
    Label12: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RETQC: TF_RETQC;
  Vr_SubTotal, Vr_Busca, Vr_Total, Vr_Mutua, Vr_Acoterj,
  Vr_Tribunal, Vr_Defensoria, Vr_Procuradoria,
  emo_vex, bus_vex, con_vex, inf_exc, gui_exc, sub_vex,
  lei20_vex, lei05_vex, lei05a_vex, tot_vex, emol_tit,
  fetj_tit, fund_tit, funp_tit, tota_tit : Currency;


implementation

uses Menu, EtiqQk, EtiqQk1, EtiqQk2, DMTD, FuncGeral, ProcGeral;

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

procedure TF_RETQC.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RETQC.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RETQC.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_RETQC.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then Combobox2.SetFocus;
end;

procedure TF_RETQC.BitBtn2Click(Sender: TObject);
begin
  maskedit2.clear;
  maskedit3.clear;
  maskedit1.setfocus;
end;

procedure TF_RETQC.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox3.SetFocus;
end;

procedure TF_RETQC.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RETQC.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.setfocus;
end;

procedure TF_RETQC.RadioButton2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_RETQC.FormActivate(Sender: TObject);
begin


  //Abrindo Configur
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;

  BitBtn2.Click;
end;

procedure TF_RETQC.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox3.SetFocus;
end;

procedure TF_RETQC.BitBtn1Click(Sender: TObject);
var
  sair   : Boolean;
  DtCalc, dataseek, protseek, arq, endd,
  l6, l3, l20, l7, l11, l13, buffer, tit_cartorio : String;
  xx, quant, lin, prot_inii : integer;
  F : TextFile;
  qtde_vex, livro_, serie_selo, n_selo : String;
begin
  tit_cartorio    := 'Registro de Titulos e Documento';
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

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * from certidao');
  Dm.ArqAux.Sql.Add(' WHERE');
  Dm.ArqAux.Sql.Add(' stat_data = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  if (Trim(MaskEdit3.Text) <> '')  AND  (Trim(MaskEdit2.Text) <> '') AND
     (Trim(MaskEdit3.Text) <> '0') AND  (Trim(MaskEdit2.Text) <> '0')AND
     (ValidNumero(MaskEdit3.Text)) AND  (ValidNumero(MaskEdit2.Text))then
     begin
       Dm.ArqAux.Sql.Add(' AND nr_protoc >= ' + Trim(MaskEdit3.Text));
       Dm.Arqaux.Sql.Add(' AND nr_protoc <= ' + Trim(MaskEdit2.Text));
     end;
  Dm.ArqAux.Sql.Add(' ORDER BY nr_protoc');
  showmessage(dm.arqaux.sql.text);
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    ShowMessage('Dados insuficientes para impressão !');
    MaskEdit1.SetFocus;
    Exit;
  end;


  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ETQ';
  CriaTabela('ETQ', arq);
  quant := 0;
  while (not Dm.ArqAux.Eof) do
  begin
    if (ValidNumero(ComboBox3.Text)) then
    begin
      quant := StrToInt(ComboBox3.Text);
    end
    else
    begin
      quant := 1;
    end;

    if True then
    begin
      for xx := 1 to quant do
      begin
        Dm.ArqAux1.Close;
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
        Dm.ArqAux1.Sql.Add('(indexador, linha1, linha2, linha3, linha4, linha5,');
        Dm.ArqAux1.Sql.Add(' v_subtotal, v_tribunal, v_procuradoria, v_defensoria, v_mutua, v_acoterj, v_total, v_ar)');
        Dm.ArqAux1.Sql.Add(' VALUES(');

        Dm.Certidao.Close;
        Dm.Certidao.Sql.Clear;
        Dm.Certidao.Sql.Add('select p_auxiliar, protocolo from td where protocolo = ' + Dm.ArqAux.FieldByName('protocolo').asString);
        Dm.Certidao.Open;

        Dm.ArqAux1.Sql.Add(Dm.Certidao.FieldByName('protocolo').asString + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + UpperCase(Trim(F_Menu.Label29.Caption)) + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + 'Apresentado no dia ' + Dm.ArqAux.FieldByName('movimento').asString + ' para REGISTRO e apontado sob o Num. ' +
                                         Dm.Certidao.FieldByName('p_auxiliar').AsString +
                                         ' e Registrado sob o Num. ' + Dm.Certidao.FieldByName('protocolo').AsString +
                                         ' no dia de hoje. (Extraida nos termos do artigo n° 334, letra "D" do prov. n° 10 de 08.02.80) . O referido é verdade e dou fé.'  + Chr(39) + ',');

        if False then
           Dm.ArqAux1.Sql.Add(Chr(39) + 'Anotacao a Margem do Num. ' + Dm.ArqAux.FieldByName('anotacao').AsString + Chr(39) + ',')
        else
           Dm.ArqAux1.Sql.Add('"' + DataExtenso(MaskEdit1.Text, True, '') + 'Valido somente com selo de fiscalizacao.",');

        Dm.ArqAux1.Sql.Add('"" ' + ',');
        Dm.ArqAux1.Sql.Add('"" ' + ',');

        Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_subtotal').AsCurrency) + ',');
        Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('tribunal').AsCurrency) + ',');
        Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('procuradoria').AsCurrency) + ',');
        Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('defensoria').AsCurrency) + ',');
        Dm.ArqAux1.Sql.Add('"" ' + ',');
        Dm.ArqAux1.Sql.Add('"" ' + ',');
        Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('custas').AsCurrency) + ',');
        Dm.ArqAux1.Sql.Add('"" ' + ')');
        Dm.ArqAux1.ExecSql;
      end;
    end;

    if False then
//  if radiobutton4.checked then
    begin
      Dm.Td_Pesso.Close;
      Dm.Td_Pesso.Sql.Clear;
      Dm.Td_Pesso.Sql.Add('SELECT nome, endereco, bairro, estado, cep, numero, cidade, complem');
      Dm.Td_Pesso.Sql.Add('FROM td_pesso');
      Dm.Td_Pesso.Sql.Add('WHERE');
      Dm.Td_Pesso.Sql.Add('protocolo = ' + Dm.ArqAux.FieldByName('protocolo').asString);
      Dm.Td_Pesso.Sql.Add('AND situacao = "D"');
      Dm.Td_Pesso.Sql.Add('AND cep <> ""');
      Dm.Td_Pesso.Open;
      if (Dm.Td_Pesso.RecordCount <> 0) then
      begin
        while (not Dm.td_pesso.eof) do
        begin
          for xx := 1 to quant do
          begin
            Dm.ArqAux1.Close;
            Dm.ArqAux1.Sql.Clear;
            Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
            Dm.ArqAux1.Sql.Add('(indexador, linha1, linha2, linha3, linha4)');
            Dm.ArqAux1.Sql.Add('VALUES(');
            Dm.ArqAux1.Sql.Add(Dm.ArqAux.fieldbyname('protocolo').asstring + ',');
            Dm.ArqAux1.Sql.Add(Chr(39) + 'TD ' + Dm.ArqAux.fieldbyname('protocolo').asstring + ' - ' + Dm.ArqAux.fieldbyname('data_p').asstring + Chr(39) + ',');
            Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.Td_Pesso.Fieldbyname('nome').asstring, Chr(39), '','') + Chr(39) + ',');
            endd := '';
            endd := TirarTudo(Dm.td_pesso.fieldbyname('endereco').asstring, Chr(39), '','');
            if (Trim(Dm.Td_Pesso.FieldByName('numero').asString) <> '') then
            begin
              endd := endd + ' Nº ' + Dm.td_pesso.fieldbyname('numero').asstring;
            end;
            if (Trim(Dm.Td_Pesso.FieldByName('complem').asString) <> '') then
            begin
              endd := endd + ' ' + Trim(Dm.td_pesso.fieldbyname('complem').asstring);
            end;
            if (Trim(Dm.Td_Pesso.FieldByName('bairro').asString) <> '') then
            begin
              endd := endd + ' - ' + Trim(Dm.td_pesso.fieldbyname('bairro').asstring);
            end;
            Dm.ArqAux1.Sql.Add(Chr(39) + endd + Chr(39) + ',');
            Dm.ArqAux1.Sql.Add(Chr(39) + 'CEP: ' + FormataCep(Dm.Td_Pesso.fieldbyname('cep').asstring) + ' - ' + TirarTudo(Dm.td_pesso.fieldbyname('cidade').asstring, Chr(39), '','') + '-' + Dm.td_pesso.fieldbyname('estado').asstring + Chr(39) + ')');
            Dm.ArqAux1.ExecSql;
          end;
          Dm.Td_Pesso.Next;
        end;
        Dm.Td_Pesso.Close;
      end;
    end;

    if False then
    begin
      Dm.Td_Pesso.Close;
      Dm.Td_Pesso.Sql.Clear;
      Dm.Td_Pesso.Sql.Add('SELECT nome FROM td_pesso');
      Dm.Td_Pesso.Sql.Add('WHERE');
      Dm.Td_Pesso.Sql.Add('protocolo = ' + Dm.ArqAux.FieldByName('protocolo').asString);
      Dm.Td_Pesso.Sql.Add('AND situacao = "E"');
      Dm.Td_Pesso.Open;
      if (Dm.Td_Pesso.RecordCount <> 0) then
      begin
        while (not Dm.td_pesso.eof) do
        begin
          for xx := 1 to quant do
          begin
            Dm.ArqAux1.Close;
            Dm.ArqAux1.Sql.Clear;
            Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
            Dm.ArqAux1.Sql.Add('(indexador, linha1, linha2, linha3, linha4, ');
            Dm.ArqAux1.Sql.Add('v_subtotal, v_tribunal, v_procuradoria, v_defensoria, v_mutua, v_acoterj, v_total, v_ar)');

            Dm.ArqAux1.Sql.Add('VALUES(');
            Dm.ArqAux1.Sql.Add(Dm.ArqAux.FieldByName('protocolo').asString + ',');
            Dm.ArqAux1.Sql.Add(Chr(39) + Trim(F_Menu.Label9.Caption) + Chr(39) + ',');
            Dm.ArqAux1.Sql.Add(Chr(39) + 'Apresentado hoje para REGISTRO e apontado sob o n ' +
                                         Dm.ArqAux.FieldByName('protocolo').AsString +
                                         ' do Protocolo A 1. Registrado sob o nº 48610 do livro ' +
                                         'B 5, por disco ótico.    Selo_______' + ',');



{            Dm.ArqAux1.Sql.Add(Chr(39) + 'Protocolado sob nº ' + Dm.ArqAux.FieldByName('p_auxiliar').AsString +
                                                               ' em ' + Dm.ArqAux.FieldByName('data_r').AsString +
                                                               ', Registrado/Microfilmado sob nº ' + Dm.ArqAux.FieldByName('protocolo').AsString + '/' +
                                                               Dm.ArqAux.FieldByName('registro').AsString + ', em ' + Dm.ArqAux.FieldByName('data_p').AsString + Chr(39) + ',');}


            Dm.ArqAux1.Sql.Add(Chr(39) + 'Firma: ' + Trim(Dm.Td_Pesso.fieldbyname('nome').asstring) + Chr(39) + ',');
            Dm.ArqAux1.Sql.Add(Chr(39) + 'L I V R O    A U T E N T I C A D O' + Chr(39) + ',');

            //
            Dm.ArqAux1.Sql.Add(Chr(39) + Trim(ComboBox1.text) + '-' + Trim(ComboBox2.Text) + Chr(39) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_subtotal').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_tribunal').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_procuradoria').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_defensoria').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_mutua').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_acoterj').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_total').AsCurrency) + ',');
            Dm.ArqAux1.Sql.Add(StrCurrPesq(Dm.ArqAux.FieldByName('v_ar').AsCurrency) + ')');
            Dm.ArqAux1.ExecSql;
          end;
          Dm.Td_Pesso.Next;
        end;
        Dm.Td_Pesso.Close;
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
  if True then
  begin
    if v_chk_10 then
    begin
      while not dm.ArqAux.Eof do
      begin
        buffer := pchar('Coloque o protocolo ' + dm.ArqAux.FieldByName('indexador').asstring);
        Application.MessageBox(pchar(buffer), 'Mensagem do Sistema' , mb_ok);

        RDprint1.OpcoesPreview.Preview := False;
        RDprint1.Abrir;

        lin := 1;

        rdprint1.imp(01,01,#27#64);          // reset
        rdprint1.imp(04,01,#27#33#15);       // fonte selecionada
        lin := lin + 1;

        RDprint1.Imp(lin, 02, dm.ArqAux.FieldByName('linha1').AsString);
        lin := lin + 1;
        RDprint1.Imp(lin, 02, copy(dm.ArqAux.FieldByName('linha2').AsString, 1, 75));
        lin := lin + 1;
        RDprint1.Imp(lin, 02, copy(dm.ArqAux.FieldByName('linha2').AsString, 76, 75));
        lin := lin + 1;
        RDprint1.Imp(lin, 02, dm.ArqAux.FieldByName('linha3').AsString);
        lin := lin + 1;
        RDprint1.Imp(lin, 02, '');
        lin := lin + 1;
        RDprint1.Imp(lin, 02, '________________________________________ ');
        lin := lin + 1;
        RDprint1.Imp(lin, 02, dm.ArqAux.FieldByName('linha4').AsString);
        lin := lin + 1;

        RDprint1.Imp(lin, 02, 'Emol    3217/99   4664/05   111/06   3716/02   590/82   Total');
        lin := lin + 1;


        RDprint1.Imp(lin, 02, Trim(StrCurr(Dm.ArqAux.FieldByname('v_subtotal').AsCurrency, 14, True)) + '    ' +
                 Trim(StrCurr(Dm.ArqAux.FieldByname('v_tribunal').AsCurrency, 14, True)) + '     ' +
                 Trim(StrCurr(Dm.ArqAux.FieldByname('v_procuradoria').AsCurrency, 14, True)) + '      ' +
                 Trim(StrCurr(Dm.ArqAux.FieldByname('v_defensoria').AsCurrency, 14, True)) + '     ' +
                 Trim(StrCurr(Dm.ArqAux.FieldByname('v_mutua').AsCurrency, 14, True)) + '    ' +
                 Trim(StrCurr(Dm.ArqAux.FieldByname('v_acoterj').AsCurrency, 14, True)) + '    ' +
                 Trim(StrCurr(Dm.ArqAux.FieldByname('v_total').AsCurrency, 14, True)));
        lin := lin + 1;

        RDprint1.fechar;
        dm.ArqAux.Next;
      end;
    end
    else
    begin
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
        If False then
        Begin
          buffer := dm.ArqAux.FieldByName('linha1').AsString;
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
          buffer := (F_RETQC.ComboBox1.Text) + ' - ' + (F_RETQC.ComboBox2.Text);
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
          Writeln(F, buffer);
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
          buffer := (F_RETQC.ComboBox1.Text) + ' - ' + (F_RETQC.ComboBox2.Text);
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
    end;
   // Application.CreateForm(TF_Etiq, F_Etiq);
   // F_Etiq.QuickRep1.preview;
  //  F_Etiq.Destroy;
  //  F_Etiq := nil;
  end;

  if False then
  begin
  //  Application.CreateForm(Tf_etiq1, f_etiq1);
    f_etiq1.QuickRep1.preview;
  //  f_etiq1.Destroy;
  //  F_Etiq1 := nil;
  end;

  Dm.ArqAux.close;
  DestroeTabela(arq);
//  StatusBar1.SimpleText := 'Fim do Relatório';
//  StatusBar1.UpDate;
  Screen.cursor := crdefault;
end;

procedure TF_RETQC.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

end.
