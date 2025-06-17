unit RecepC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DBCtrls, Printers, RDprint, ToolEdit, CurrEdit,
  Buttons, ComCtrls, jpeg, RpCon, RpConDS, RpBase, RpSystem, RpDefine,
  RpRave;

type
  TF_RecepC = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    MaskEdit9: TMaskEdit;
    ComboBox1: TComboBox;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    RichEdit1: TRichEdit;
    Label13: TLabel;
    ComboBox5: TComboBox;
    Label21: TLabel;
    ComboBox6: TComboBox;
    Label10: TLabel;
    CurrencyEdit5: TCurrencyEdit;
    Label11: TLabel;
    MaskEdit10: TMaskEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ControlBar1: TControlBar;
    Label36: TLabel;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    RichEdit4: TRichEdit;
    RichEdit5: TRichEdit;
    RvDataSetConnection2: TRvDataSetConnection;
    Label17: TLabel;
    Label18: TLabel;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    ComboBox2: TComboBox;
    MaskEdit27: TMaskEdit;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    Label14: TLabel;
    MaskEdit2: TMaskEdit;
    Label15: TLabel;
    MaskEdit6: TMaskEdit;
    RvSystem2: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    Label22: TLabel;
    MkEmail: TMaskEdit;
    RvProject3: TRvProject;
    RvSystem3: TRvSystem;
    RvDataSetConnection3: TRvDataSetConnection;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    MaskEdit13: TMaskEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label35: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label16: TLabel;
    MaskEdit8: TMaskEdit;
    RvProject2: TRvProject;
    MaskEdit14: TMaskEdit;
    Label52: TLabel;
    edtAverbacao: TMaskEdit;
    Label23: TLabel;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Limpar(Sender : TOBject);
    Procedure Habilitar_Tela(Habilita : Boolean);
    Procedure Gravar(Sender : TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RichEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Exit(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox5Exit(Sender: TObject);
    procedure MaskEdit8Exit(Sender: TObject);
    procedure MaskEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit5Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure MkEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit27Exit(Sender: TObject);
    procedure MaskEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAverbacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    NaoInserirRecepcao: Boolean;
  end;


var
  F_RecepC: TF_RecepC;
  qtde_talao, qtde_vias : Integer;
  impport : String;
  num_rec,y  : Integer;
  ndaje, sdaje : String;
  bNaoExibirDataDeEntregaNoReciboDeProtocolo: Boolean;
 
implementation

uses DMTD, Menu, Func, Dep1, U_Autent, FuncGeral, ProcGeral, New_CalcT, Daje,
  U_DAJE_TJ;

{$R *.DFM}

procedure Recibo_Cert_Fiscal_LN;
Var
  linha, porta : Integer;
  branco, texto, buffer, primeiro, ultimo : String;
  F : TextFile;
begin
  Dm.certidao.Close;
  Dm.certidao.RequestLive := True;
  Dm.certidao.Sql.Clear;
  Dm.certidao.Sql.Add('SELECT * FROM certidao');
  Dm.certidao.Sql.Add('WHERE nr_protoc = ' + IntToStr(StrToInt(f_recepc.Label3.Caption)));
  Dm.certidao.RequestLive := False;
  Dm.certidao.Open;

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur where tcartorio = "' + F_Menu.Label37.Caption + '"');
  Dm.Configur.Open;                 

  branco := '                                              ';

  AssignFile(F,porta_cert);

  Rewrite(F); { Comando para Inicialização }
  for qtde_vias := 1 to cert_vias do
  Begin
    buffer := DM.Configur.fieldbyname('cartorio').AsString;
    Writeln(F, buffer);
    buffer := DM.Configur.fieldbyname('endereco').AsString + ' - ' + DM.Configur.fieldbyname('cidade').AsString + ' / ' + DM.Configur.fieldbyname('estado').AsString;
    Writeln(F, buffer);
    buffer := 'Telefone: ' + DM.Configur.fieldbyname('telefone').AsString + ' / ' + DM.Configur.fieldbyname('fax').AsString;
    Writeln(F, buffer);
    buffer := 'CNPJ: ' + DM.Configur.fieldbyname('cnpj').AsString;
    Writeln(F, buffer);
    Writeln(F, '');
    buffer := 'Recibo n. : ' + IntToStr(StrToInt(F_RecepC.Label3.Caption));
    Writeln(F, buffer);
    Writeln(F, '');
    buffer := 'Data do pedido: ' + DM.Certidao.fieldbyname('movimento').AsString;
    Writeln(F, buffer);
    buffer := 'Data da entrega: ' + DM.Certidao.fieldbyname('data_entr').AsString;
    Writeln(F, buffer);
    Writeln(F, '');
    buffer := 'Certidao : Titulos e Documentos';
    Writeln(F, buffer);
    buffer := 'Protocolo: ' + DM.Certidao.fieldbyname('recibo').AsString + '     Registro: ' + DM.Certidao.fieldbyname('protocolo').AsString;
    Writeln(F, buffer);
    Writeln(F, '');
    buffer := 'Emolumentos :               ' + FormatCurr('R$ ###,###,##0.00', Dm.Certidao.FieldByName('v_subtotal').AsCurrency);
    Writeln(F, buffer);
    buffer := 'Lei 3217/99 :               ' + FormatCurr('R$ ###,###,##0.00', Dm.Certidao.FieldByName('tribunal').AsCurrency);
    Writeln(F, buffer);
    buffer := 'Lei 4664/05 :               ' + FormatCurr('R$ ###,###,##0.00', Dm.Certidao.FieldByName('defensoria').AsCurrency);
    Writeln(F, buffer);
    buffer := 'Lei 111/06  :               ' + FormatCurr('R$ ###,###,##0.00', Dm.Certidao.FieldByName('procuradoria').AsCurrency);
    Writeln(F, buffer);
    buffer := '                            ----------';
    Writeln(F, buffer);
    buffer := 'Total :                     ' + FormatCurr('R$ ###,###,##0.00', Dm.Certidao.FieldByName('custas').AsCurrency);
    Writeln(F, buffer);
    Writeln(F, '');
    buffer := 'Solicitante: ' + F_RecepC.MaskEdit3.Text;
    Writeln(F, buffer);
    buffer := 'CPF/CNPJ: ' + F_RecepC.MaskEdit27.Text;
    Writeln(F, buffer);
    buffer := 'Total Pago: ' + FormatCurr('R$ ###,###,##0.00', Dm.Certidao.FieldByName('custas').AsCurrency);
    Writeln(F, buffer);
    Writeln(F, '');
    Writeln(F, '');
    Writeln(F, '');
    Writeln(F, '');
    Writeln(F, '');
    Writeln(F, '');
    buffer := '------------------------------------------';
    Writeln(F, buffer);
    buffer := 'Funcionario: ' + F_Menu.Label25.Caption;
    Writeln(F, buffer);
    buffer := 'Matricula: ' + F_Menu.Label38.Caption;
    Writeln(F, buffer);    
    Writeln(F, '');
    Writeln(F, '');
    Writeln(F, '');
    Writeln(F, '');
    Writeln(F, '');    
  end;
  CloseFile(F);
end;

Function SeparaTabela(NumTab : String) : String;
var
  x : Integer;
begin
  Tab     := '';
  item    := '';
  subitem := '';
  Tab     := copy(numtab, 1, 1);
  item    := inttostr(strtoint(copy(numtab, 3, 1)));
  subitem := copy(numtab, 5,1);
end;

Function Gera_Recibo : Integer;
Begin
  If F_Menu.Label7.Caption <> 'Saquarema' then
  Begin
    DM.Configur.close;
    DM.Configur.sql.clear;
    DM.Configur.sql.add('select * from configur');
    DM.Configur.open;

    result := DM.Configur.fieldbyname('recibo').asinteger + 1;

    DM.Configur.close;
    DM.Configur.sql.clear;
    DM.Configur.sql.add('UPDATE configur set recibo = ' + QuotedStr((IntToStr(result))));
    DM.Configur.ExecSQL;
  End
  Else
  Begin
    DM.CaixaPJ.close;
    DM.CaixaPJ.sql.clear;
    DM.CaixaPJ.sql.add('select * from configur');
    DM.CaixaPJ.open;

    result := DM.CaixaPJ.fieldbyname('recibo').asinteger + 1;

    DM.CaixaPJ.close;
    DM.CaixaPJ.sql.clear;
    DM.CaixaPJ.sql.add('UPDATE configur set recibo = ' + QuotedStr((IntToStr(result))));
    DM.CaixaPJ.ExecSQL;
  End;
end;

Function GerarProtocolo : Boolean;
Begin
  Result := False;
  if (StrToInt(F_RecepC.Label3.Caption) = 0) then
  begin
    Dm.Seq_Bal.Close;
    Dm.Seq_Bal.RequestLive := False;
    Dm.Seq_Bal.Sql.Clear;
    Dm.Seq_Bal.Sql.Add('UPDATE seq_bal SET');
    Dm.Seq_Bal.Sql.Add('certidao = (certidao + 1)');
    Dm.Seq_Bal.ExecSql;
    Dm.Seq_Bal.Close;
    Dm.Seq_Bal.RequestLive := True;
    Dm.Seq_Bal.Sql.Clear;
    Dm.Seq_Bal.Sql.Add('SELECT certidao FROM seq_bal');
    Dm.Seq_Bal.Open;
    F_RecepC.Label3.Caption := StrZero(Dm.Seq_Bal.FieldByName('certidao').asString, 6);
    Result := True;
    Dm.Seq_Bal.Close;
  end;
end;

Procedure TF_RecepC.Limpar(Sender : TOBject);
Begin
  Label3.Caption      := '000000';
  MaskEdit2.Text      := '';
  MaskEdit6.Text      := '';
  ComboBox1.Text      := '';
  MaskEdit3.Text      := '';
  MaskEdit4.Text      := '';
  MaskEdit14.Text     := '';
  MaskEdit5.Text      := '';
  MaskEdit9.Text      := '';
  MaskEdit11.Text     := '';
  MaskEdit12.Text     := '';
  CurrencyEdit1.Value := 0.00;
  ComboBox1.Text      := '';
  ComboBox2.Text      := '';
  MaskEdit27.Text     := '';
  ComboBox11.Text     := '';
  MaskEdit7.Text      := '';
  MaskEdit1.Text      := DateToStr(date);
  MkEmail.Text        := '';
  BitBtn4.Enabled     := True;
  CheckBox2.Checked   := False;
  edtAverbacao.Text   := '';
  RichEdit1.Lines.Clear;    
  //MaskEdit3.SetFocus;
end;

Procedure Grava_TDPedid;
begin
  DM.ArqAux.Close;
  DM.ArqAux.Sql.Clear;
  DM.ArqAux.Sql.Add('SELECT * FROM ' + F_RecepC.Label20.Caption);
  DM.ArqAux.Open;

  DM.ArqAux.FindFirst;
  while not DM.ArqAux.Eof do
  begin
    DM.TD_Pedid.Close;
    DM.TD_Pedid.Sql.Clear;
    DM.TD_Pedid.Sql.Add('INSERT INTO td_pedid (data_r, p_auxiliar, recibo, cod_lae, tabela, item, subitem, descricao, valor_unit,');
    DM.TD_Pedid.Sql.Add(' qtde, valor_calc, tipo_prot)');
    DM.TD_Pedid.Sql.Add(' VALUES (');
    DM.TD_Pedid.Sql.Add(QuotedStr(ConvData(F_RecepC.MaskEdit1.Text)) + ', ');
    DM.TD_Pedid.Sql.Add(F_RecepC.Label3.Caption + ', ');
    DM.TD_Pedid.Sql.Add(F_RecepC.MaskEdit2.Text + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('codigo').AsString)     + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('tabela').AsString)     + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('item_tab').AsString)   + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('subitem').AsString)    + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('descr_tab').AsString)  + ', ');
    DM.TD_Pedid.Sql.Add(TrocaVirgulaporPonto(CurrToStr(DM.ArqAux.fieldbyname('valor_unit').AsCurrency)) + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('qtde').AsString)       + ', ');
    DM.TD_Pedid.Sql.Add(TrocaVirgulaporPonto(CurrToStr(DM.ArqAux.fieldbyname('valor_calc').AsCurrency)) + ', ');
    DM.TD_Pedid.Sql.Add('"C" )');
    DM.TD_Pedid.ExecSQL;
    DM.ArqAux.Next;
  end;
end;

Procedure TF_RecepC.Gravar(Sender : TObject);
begin
  Dm.Certidao.Close;
  Dm.Certidao.Sql.Clear;
  Dm.Certidao.Sql.Add('SELECT * FROM certidao');
  Dm.Certidao.Sql.Add('WHERE');
  Dm.Certidao.Sql.Add('recno = 0');
  Dm.Certidao.Open;                                 
  Dm.Certidao.Append;
  MaskEdit2.Text:= inttostr(Gera_Recibo);
  Dm.Certidao.FieldByName('nr_protoc').asString           := Label3.Caption;
  dm.certidao.FieldByName('recibo').AsString              := MaskEdit2.Text;
  dm.Certidao.FieldByName('protocolo').AsString           := MaskEdit6.Text;
  dm.Certidao.FieldByName('averbacao').AsString           := edtAverbacao.Text;  
  Dm.Certidao.FieldByName('movimento').asString           := Maskedit1.text;
  Dm.Certidao.FieldByName('data').asString                := Maskedit1.text;
  Dm.Certidao.FieldByName('deposito').ascurrency          := CurrencyEdit1.Value;;
  Dm.Certidao.FieldByName('apresentan').asString          := Trim(MaskEdit3.text);
  dm.Certidao.FieldByName('tip_doc1').AsString            := Trim(ComboBox2.Text);
  dm.Certidao.FieldByName('doc1').AsString                := TirarTudo(Maskedit27.Text, '.', '/', '-');
  dm.Certidao.FieldByName('tip_doc2').AsString            := ComboBox11.Text;
  dm.Certidao.FieldByName('doc2').AsString                := MaskEdit7.Text;

  if CheckBox1.Checked then
    dm.Certidao.FieldByName('cert_5anos').AsString := 'S' else dm.Certidao.FieldByName('cert_5anos').AsString := 'N';

  DM.Certidao.FieldByName('anos').AsString                := MaskEdit13.Text;
  Dm.Certidao.FieldByName('telefone').asString            := Trim(MaskEdit4.text);
  Dm.Certidao.FieldByName('celular').asString             := Trim(MaskEdit14.Text);

  Dm.Certidao.FieldByName('propriet').asString            := Trim(MaskEdit5.text);
  Dm.Certidao.FieldByName('status').asString              := 'EM PROCESSO';
  Dm.Certidao.FieldByName('stat_data').asString           := Maskedit1.text;
  Dm.Certidao.FieldByName('devolvido').asString           := 'N';
  Dm.Certidao.FieldByName('natureza').asString            := Copy(ComboBox1.Text, 1, 3);
  Dm.Certidao.FieldByName('data_entr').asString           := Maskedit9.text;
  Dm.Certidao.FieldByName('identifica').asString          := F_Menu.Label1.Caption;
  Dm.Certidao.FieldByName('ext_nat').asString             := Trim(ComboBox1.Text);
  Dm.Certidao.FieldByName('descricao').asString           := RichEdit1.Lines.Text;
  dm.certidao.FieldByName('tabela').AsString              := trim(copy(ComboBox5.Text, 1, 3));
  dm.certidao.FieldByName('divisor').AsString             := copy(ComboBox6.Text, 1, 2);
  dm.Certidao.FieldByName('folha').AsInteger              := qtd_fol_cert;
  dm.Certidao.FieldByName('pag').AsInteger                := StrToInt(MaskEdit10.Text); //qtd_pag_cert;
  dm.certidao.FieldByName('vl_pag').AsCurrency            := VrPagCert;
  dm.certidao.FieldByName('vl_fol').AsCurrency            := VrFolCert;

  dm.certidao.FieldByName('v_emolumento').AsCurrency      := calc_emol;
  dm.certidao.FieldByName('tribunal').AsCurrency          := calc_vfetj;
  dm.certidao.FieldByName('vl_pag').AsCurrency            := calc_pag;  
  dm.Certidao.FieldByName('defensoria').AsCurrency        := VrDefensoria;
  dm.Certidao.FieldByName('procuradoria').AsCurrency      := VrProcuradoria;
  dm.certidao.FieldByName('custas').AsCurrency            := calc_total;
  dm.certidao.FieldByName('cartorio').AsString            := F_Menu.Label37.Caption;
  dm.certidao.FieldByName('livro_c').AsString             := MaskEdit11.Text;
  dm.certidao.FieldByName('folha_c').AsString             := MaskEdit12.Text;
  Dm.certidao.FieldByName('daje').asString                := ndaje;
  Dm.certidao.FieldByName('serie_daje').asString          := sdaje;
  Dm.certidao.FieldByName('email_apresentante').asString  := MkEmail.Text;

  Dm.Certidao.Post;

  Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'Foi realizado a recepção da certidão: '+Label3.Caption+', Contribuinte: '+MaskEdit3.Text + ', Documento: '+ComboBox2.Text+': '+TirarTudo(Maskedit27.Text, '.', '/', '-'), Label3.Caption);


  Dm.Certidao.Close;
  if (not Atualiza_Caixa(MaskEdit1.Text, '5', 'E', 'PEDIDO DE CERTIDÃO', Label3.Caption, Label35.Caption, F_Menu.Label1.Caption, Trim(MaskEdit3.Text), CurrencyEdit5.Value, CurrencyEdit2.Value, CurrencyEdit4.Value, CurrencyEdit3.Value, CurrencyEdit6.Value )) then
  begin
    ShowMessage('Problemas para atualiza o caixa.');
  end;

  Dm.Selos.close;
  Dm.Selos.SQL.Clear;
  Dm.Selos.SQL.add('INSERT INTO selos (recibo, daje, serie_daje, data, tp_prot) VALUES (');
  Dm.Selos.sql.add(QuotedStr(Label3.Caption) + ',');
  Dm.Selos.sql.add(QuotedStr(ndaje)     + ',');
  Dm.Selos.sql.add(QuotedStr(sdaje)     + ',');
  Dm.Selos.sql.add(QuotedStr(ConvData(MaskEdit1.Text)) + ', "C")');
  Dm.Selos.ExecSQL;

  Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'Foi adicionado na recepção de título o daje: '+Strzero(sdaje, 3)+' '+Strzero(ndaje, 6), Label3.Caption);

//  Grava_TDPedid;

end;


procedure TF_RecepC.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.setfocus;
  if key = 27 then close;
end;

procedure TF_RecepC.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Maskedit3.setfocus;
end;

procedure TF_RecepC.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.setfocus;
end;

procedure TF_RecepC.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit14.setfocus;
end;

procedure TF_RecepC.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit11.SetFocus;
end;

procedure TF_RecepC.FormActivate(Sender: TObject);
begin
{  MaskEdit1.Text := DateToStr(date);
  MaskEdit3.SetFocus;}
  BitBtn2.SetFocus;
  //Abrindo Configur
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;

  //Abrindo Config_adm
  Dm.Config_Adm.Close;
  Dm.Config_Adm.Sql.Clear;
  Dm.Config_Adm.Sql.Add('SELECT * FROM config_adm');
  Dm.Config_Adm.Open;
end;

procedure TF_RecepC.ComboBox1Enter(Sender: TObject);
begin
  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
  if (Trim(ComboBox1.Text) = '') then ComboBox1.Text := ComboBox1.Items.Strings[0];
end;

procedure TF_RecepC.ComboBox1KeyPress(Sender: TObject; var Key: Char);
var
  Found: boolean;
  i,SelSt: Integer;
  TmpStr: string;
begin
  if Key in ['a'..'z'] then Dec(Key,32);
  with (Sender as TComboBox) do
  begin
    SelSt := SelStart;
    if (Key = Chr(vk_Back)) and (SelLength <> 0) then
     TmpStr := Copy(Text,1,SelStart)+Copy(Text,SelLength+SelStart+1,255)
    else if Key = Chr(vk_Back) then
     TmpStr := Copy(Text,1,SelStart-1)+Copy(Text,SelStart+1,255)
    else TmpStr := Copy(Text,1,SelStart)+Key+Copy(Text,SelLength+SelStart+1,255);
    if TmpStr = '' then Exit;
    if (Key = Chr(vk_Back)) and (SelSt > 0) then
     Dec(SelSt)
    else if Key <> Chr(vk_Back) then Inc(SelSt);
    Key := #0;
    if SelSt = 0 then
    begin
      Text:= '';
      Exit;
    end;
    Found := False;
    for i := 1 to Items.Count do
      if UpperCase(Copy(Items[i-1],1,Length(TmpStr))) = UpperCase(TmpStr) then
      begin
        Text := Items[i-1];
        ItemIndex := i-1;
        Found := True;
        Break;
      end;
    if Found then
    begin
      SelStart := SelSt;
      SelLength := Length(Text)-SelSt;
    end
    else Beep;
  end;
end;

procedure TF_RecepC.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox6.SetFocus;
end;

procedure TF_RecepC.CurrencyEdit1Exit(Sender: TObject);
begin
  {Application.CreateForm(TF_Dep1, F_Dep1);
  F_Dep1.ShowModal;
  CurrencyEdit2.Value := F_Dep1.CurrencyEdit1.Value;
  CurrencyEdit3.Value := F_Dep1.CurrencyEdit2.Value;
  CurrencyEdit4.Value := F_Dep1.CurrencyEdit3.Value;
  CurrencyEdit1.Value := F_Dep1.CurrencyEdit4.Value;
  Label35.Caption     := F_Dep1.MaskEdit1.Text;
  F_Dep1.Destroy;
  F_Dep1 := NIL;}
end;

procedure TF_RecepC.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn4.SetFocus;
end;

procedure TF_RecepC.ComboBox1Exit(Sender: TObject);
var
  util : String;
  pz   : Integer;
begin
  if (Trim(ComboBox1.Text) <> '') then
  begin
    util := Copy(ComboBox1.Text, Length(ComboBox1.Text), 1);
    pz   := StrToInt(Copy(ComboBox1.Text, (Length(ComboBox1.Text) - 2), 2));
    if (util = 'N') then
    begin
      MaskEdit9.Text := DateToStr(Ver_DiaUtil(StrToDate(MaskEdit1.Text) + pz));
    end
    else MaskEdit9.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), pz));
  end
  else MaskEdit9.Text := DateToStr(date);
end;

procedure TF_RecepC.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepC.BitBtn4Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Confirma recepção do pedido de certidão ?'), 'RECEPÇÃO DE CERTIDÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
  begin
    //Invertida a ordem conforme OS ...
    {F_RecepC.NaoInserirRecepcao := False;
    ndaje := '';
    Application.CreateForm(TF_Daje, F_Daje);
    F_Daje.ShowModal;
    ndaje := F_Daje.MaskEdit1.Text;
    F_Daje.MaskEdit1.Clear;
    F_Daje.Destroy;
    F_Daje := Nil;}

    if (not(F_RecepC.NaoInserirRecepcao)) or (PermiteRecepcaoSemDAJE)  then
    begin
     { if DM.Configur.FieldByName('chk_17').AsString = 'T' then
      begin
        num_rec        := Gera_Recibo;
        MaskEdit2.Text := strzero(inttostr(num_rec),6);
      end;}

      if (not GerarProtocolo) then
      begin
        ShowMessage('Problemas para gerar o protocolo auxiliar.');
        ShowMessage('Recepção cancelada.');
        Exit;
      end;

      {ndaje := '';
      Application.CreateForm(TF_Daje, F_Daje);
      F_Daje.ShowModal;
      ndaje := F_Daje.MaskEdit1.Text;
      F_Daje.MaskEdit1.Clear;
      F_Daje.Destroy;
      F_Daje := Nil;}

      Gravar(F_RecepC);

  //    if F_menu.laser.caption = '1' then
  //    Begin

  {    if (v_chk_16) then
      begin
        Dm.ArqAux2.Close;
        Dm.ArqAux2.Sql.Clear;
        Dm.ArqAux2.Sql.Add('SELECT * FROM certidao');
        Dm.ArqAux2.Sql.Add('WHERE');
        Dm.ArqAux2.Sql.Add('nr_protoc = ' + QuotedStr(Label3.Caption));
        Dm.ArqAux2.Open;

        RvDataSetConnection2.DataSet := dm.ArqAux2;

        RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
        RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
        RvProject1.SetParam('Descricao',  F_RecepC.RichEdit2.Text);
        RvProject1.SetParam('Descricao2', F_RecepC.RichEdit3.Text);
        RvProject1.SetParam('Descricao3', F_RecepC.RichEdit4.Text);
        RvProject1.SetParam('Descricao4', F_RecepC.RichEdit5.Text);

        RvProject1.SetParam('emol_cer', CurrToStr(DM.ArqAux2.fieldbyname('v_subtotal').AsCurrency));
        RvProject1.SetParam('fetj_cer', CurrToStr(DM.ArqAux2.fieldbyname('tribunal').AsCurrency));
        RvProject1.SetParam('fund_cer', CurrToStr(DM.ArqAux2.fieldbyname('defensoria').AsCurrency));
        RvProject1.SetParam('funp_cer', CurrToStr(DM.ArqAux2.fieldbyname('procuradoria').AsCurrency));
        RvProject1.SetParam('tota_cer', CurrToStr(DM.ArqAux2.fieldbyname('custas').AsCurrency));

        RvProject1.ExecuteReport('report1');  //RECIBO TITULOS
  }
      F_RecepC.RichEdit2.Clear;
      F_RecepC.RichEdit3.Clear;
      F_RecepC.RichEdit4.Clear;
      F_RecepC.RichEdit5.Clear;


      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT * FROM certidao');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('nr_protoc = ' + QuotedStr(Label3.Caption));
      Dm.ArqAux.Open;


      Dm.ArqAux2.Close;
      Dm.ArqAux2.Sql.Clear;
      Dm.ArqAux2.Sql.Add('SELECT * FROM td_pedid');
      Dm.ArqAux2.Sql.Add('WHERE');
      Dm.ArqAux2.Sql.Add('p_auxiliar = ' + QuotedStr(Label3.Caption) + ' AND tipo_prot = "C"');
      Dm.ArqAux2.Open;

      DM.ArqAux2.FindFirst;
      if (F_Menu.laser2.caption = '1') then
      begin

        while not DM.ArqAux2.Eof do
        begin
          F_RecepC.RichEdit2.Lines.Add(DM.ArqAux2.fieldbyname('tabela').AsString + '.' + DM.ArqAux2.fieldbyname('item').AsString + ' ' + DM.ArqAux2.fieldbyname('subitem').AsString);
          F_RecepC.RichEdit3.Lines.Add(DM.ArqAux2.fieldbyname('descricao').AsString);
          F_RecepC.RichEdit4.Lines.Add(DM.ArqAux2.fieldbyname('qtde').AsString + ' x');
          F_RecepC.RichEdit5.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.fieldbyname('valor_calc').AsCurrency));
          DM.ArqAux2.Next;
        end;

                              // Colocar para neste recibo sair a descrição pagina adicional
        RvDataSetConnection2.DataSet := dm.ArqAux;


        If F_Menu.Label39.Caption <> '34377622000155' Then
        Begin
          If cert_vias > 1 then
          Begin
            RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
            RvProject1.SetParam('email', 'Site: '+F_Menu.Label50.Caption);
            RvProject1.SetParam('email_cartorio', 'Email:'+ F_Menu.Label55.Caption);
            RvProject1.SetParam('cnpj_cart', F_Menu.Label39.Caption);
            RvProject1.SetParam('end_cart',  F_Menu.Label11.Caption);
            RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
            RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
            RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
            RvProject1.SetParam('Descricao',  copy(F_RecepC.Combobox5.text,1,4));
            RvProject1.SetParam('Descricao2', copy(F_RecepC.Combobox1.Text, 7, 20));
            RvProject1.SetParam('Descricao3', '1');
            RvProject1.SetParam('Descricao4', formatcurr('###,###,#0.00', F_RecepC.Currencyedit5.value));
            RvProject1.SetParam('Descricao5', Trim(RichEdit1.Text));
            RvProject1.SetParam('observacao', Trim(RichEdit1.Text));
            RvProject1.SetParam('telefone',  MaskEdit4.Text);
            RvProject1.SetParam('email_apresentante',  MkEmail.Text);

            if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then //1 RTD
              RvProject1.SetParam('DataDeEntrega', 'Entrega: ' +MaskEdit9.Text)
            else
            RvProject1.SetParam('DataDeEntrega', '');

            dm.qryGenerico.Close;
            dm.qryGenerico.SQL.Clear;
            dm.qryGenerico.SQL.Add('select fmmpba, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje, pags, vr_pge from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
            dm.qryGenerico.ParamByName('serie_daje').AsString := sdaje;
            dm.qryGenerico.ParamByName('numero_daje').AsString:= ndaje;
            dm.qryGenerico.Open;

            if (F_Menu.Label39.Caption = '27357717000141') or (F_Menu.Label39.Caption = '27.357.717/0001-41') or
              (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66') or
              (F_Menu.Label39.Caption = '28275286000137') or (F_Menu.Label39.Caption = '28.275.286/0001-37') or
              (F_Menu.Label39.Caption = '27400369000148') or (F_Menu.Label39.Caption = '27.400.369/0001-48') or
              (F_Menu.Label39.Caption = '27215776000185') or (F_Menu.Label39.Caption = '27.215.776/0001-85') or
              (F_Menu.Label39.Caption = '27282471000196') or (F_Menu.Label39.Caption = '27.282.471/0001-96') Then
            Begin

              if (Not(PermiteRecepcaoSemDAJE)) Then
              begin
                RvProject1.SetParam('emol_cer', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency));
                RvProject1.SetParam('fetj_cer', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('vr_pge').AsCurrency));

                RvProject1.SetParam('tota_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('fmmpba').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('vr_pge').AsCurrency));
              end
              else
              begin
                RvProject1.SetParam('emol_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumento').AsCurrency));
                RvProject1.SetParam('fetj_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('tribunal').AsCurrency));
                RvProject1.SetParam('tota_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumento').AsCurrency + DM.ArqAux.fieldbyname('tribunal').AsCurrency));
              end;

            End
            Else
            Begin
              if (Not(PermiteRecepcaoSemDAJE)) Then
              begin
                RvProject1.SetParam('emol_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('emol_daje').AsCurrency));
                RvProject1.SetParam('fetj_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));

                RvProject1.SetParam('tota_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                             dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                             dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                             dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                             dm.qryGenerico.fieldbyname('fmmpba').AsCurrency +
                                                                             dm.qryGenerico.fieldbyname('vr_pge').AsCurrency));
              end
              else
              begin
                RvProject1.SetParam('emol_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumento').AsCurrency));
                RvProject1.SetParam('fetj_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('tribunal').AsCurrency));
                RvProject1.SetParam('tota_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumento').AsCurrency + DM.ArqAux.fieldbyname('tribunal').AsCurrency));
              end;

            End;

            RvProject1.SetParam('fecom',    FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency));
            RvProject1.SetParam('def_pub',  FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency));
            RvProject1.SetParam('pags',     dm.qryGenerico.fieldbyname('pags').AsString);

            {RvProject1.SetParam('tota_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('vr_pge').AsCurrency));}

            RvProject1.ExecuteReport('report1');
          End
          Else
          Begin
            RvProject2.SetParam('nome_cart', F_Menu.Label29.Caption);
            RvProject2.SetParam('email', 'Site: '+F_Menu.Label50.Caption);
            RvProject2.SetParam('email_cartorio', 'Email:'+ F_Menu.Label55.Caption);
            RvProject2.SetParam('cnpj_cart', F_Menu.Label39.Caption);
            RvProject2.SetParam('end_cart',  F_Menu.Label11.Caption);
            RvProject2.SetParam('fone_cart',  F_Menu.Label12.Caption);
            RvProject2.SetParam('usuario',    F_Menu.Label25.Caption);
            RvProject2.SetParam('doc_usu',    F_Menu.Label38.Caption);
            RvProject2.SetParam('Descricao',  copy(F_RecepC.Combobox5.text,1,4));
            RvProject2.SetParam('Descricao2', F_RecepC.ComboBox5.Text);
            RvProject2.SetParam('observacao', Trim(RichEdit1.Text));
            RvProject2.SetParam('Descricao3', '1');
            RvProject2.SetParam('Descricao4', currtostr(F_RecepC.Currencyedit5.value));
            RvProject2.SetParam('telefone',  MaskEdit4.Text);
            RvProject2.SetParam('email_apresentante',  MkEmail.Text);

            if (F_Menu.Label39.Caption <> '28.588.048/0001-81') then //1 RTD
              RvProject2.SetParam('DataDeEntrega', 'Entrega: ' +MaskEdit9.Text)
            else
            RvProject1.SetParam('DataDeEntrega', '');

            dm.qryGenerico.Close;
            dm.qryGenerico.SQL.Clear;
            dm.qryGenerico.SQL.Add('select fmmpba, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje, pags, vr_pge from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
            dm.qryGenerico.ParamByName('serie_daje').AsString := sdaje;
            dm.qryGenerico.ParamByName('numero_daje').AsString:= ndaje;
            dm.qryGenerico.Open;

            if (F_Menu.Label39.Caption = '27357717000141') or (F_Menu.Label39.Caption = '27.357.717/0001-41') or
              (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66') or
              (F_Menu.Label39.Caption = '28275286000137') or (F_Menu.Label39.Caption = '28.275.286/0001-37') or
              (F_Menu.Label39.Caption = '27400369000148') or (F_Menu.Label39.Caption = '27.400.369/0001-48') or
              (F_Menu.Label39.Caption = '27215776000185') or (F_Menu.Label39.Caption = '27.215.776/0001-85') or
              (F_Menu.Label39.Caption = '27282471000196') or (F_Menu.Label39.Caption = '27.282.471/0001-96') Then
            Begin
              if (Not(PermiteRecepcaoSemDAJE)) Then
              begin
                RvProject2.SetParam('emol_cer', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency));
                RvProject2.SetParam('fetj_cer', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('fmmpba').AsCurrency +
                                                                         DM.qryGenerico.fieldbyname('vr_pge').AsCurrency));
                                                                         
                RvProject2.SetParam('tota_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('fmmpba').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('vr_pge').AsCurrency));
              end
              else
              begin
                RvProject2.SetParam('emol_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumento').AsCurrency));
                RvProject2.SetParam('fetj_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('tribunal').AsCurrency));
                RvProject2.SetParam('tota_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumento').AsCurrency + DM.ArqAux.fieldbyname('tribunal').AsCurrency));
              end;
            End
            Else
            Begin
              if (Not(PermiteRecepcaoSemDAJE)) Then
              begin
                RvProject2.SetParam('emol_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('emol_daje').AsCurrency));
                RvProject2.SetParam('fetj_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
                RvProject2.SetParam('tota_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('fmmpba').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('vr_pge').AsCurrency));
              end
              else
              begin
                RvProject2.SetParam('emol_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumento').AsCurrency));
                RvProject2.SetParam('fetj_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('tribunal').AsCurrency));
                RvProject2.SetParam('tota_cer', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumento').AsCurrency + DM.ArqAux.fieldbyname('tribunal').AsCurrency));
              end;
            End;

            RvProject2.SetParam('fecom',    FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency));
            RvProject2.SetParam('def_pub',  FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency));
            RvProject2.SetParam('pags',     dm.qryGenerico.fieldbyname('pags').AsString);
            {RvProject2.SetParam('tota_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('vr_pge').AsCurrency)); }

            RvProject2.ExecuteReport('report1');
          End;
        End
        Else
        Begin 
            RvProject3.SetParam('nome_cart', F_Menu.Label29.Caption);
            RvProject3.SetParam('cnpj_cart', F_Menu.Label39.Caption);
            RvProject3.SetParam('end_cart',  F_Menu.Label11.Caption);
            RvProject3.SetParam('fone_cart',  F_Menu.Label12.Caption);
            RvProject3.SetParam('usuario',    F_Menu.Label25.Caption);
            RvProject3.SetParam('email',    F_RecepC.MkEmail.Text);
            RvProject3.SetParam('doc_usu',    F_Menu.Label38.Caption);
            RvProject3.SetParam('Descricao',  copy(F_RecepC.Combobox5.text,1,4));
            RvProject3.SetParam('Descricao2', copy(F_RecepC.Combobox1.Text, 7, 20));
            RvProject3.SetParam('Descricao3', '1');
            RvProject3.SetParam('Descricao4', formatcurr('###,###,#0.00', F_RecepC.Currencyedit5.value));

            RvProject3.SetParam('parte',   MaskEdit5.Text);
            RvProject3.SetParam('cpf',     MaskEdit27.Text);
            RvProject3.SetParam('telefone', MaskEdit4.Text);
            RvProject3.SetParam('celular', MaskEdit14.Text);

            DM.qryGenerico.Close;
            DM.qryGenerico.SQL.Clear;
            DM.qryGenerico.Sql.Add('SELECT exibir_prazo_recibo_protocolo FROM tab_ato2 where tabela = :tabela  and item_tab = :item_tab ');
            DM.qryGenerico.Sql.Add('and YEAR(data) = YEAR('+ QuotedStr(ConvData(MaskEdit1.Text))+ ')');
            DM.qryGenerico.ParamByName('tabela').AsString:= Copy(ComboBox5.Text, 1,1);
            DM.qryGenerico.ParamByName('item_tab').AsString:= Copy(ComboBox5.Text, 3,1);
            DM.qryGenerico.Open;

            if (bNaoExibirDataDeEntregaNoReciboDeProtocolo) then
               RvProject3.SetParam('DataDeEntrega', 'Data de Entrega: ' +MaskEdit9.Text);

            dm.qryGenerico.Close;
            dm.qryGenerico.SQL.Clear;
            dm.qryGenerico.SQL.Add('select fmmpba, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje, pags, vr_pge from daje where serie_daje = :serie_daje and numero_daje = :numero_daje');
            dm.qryGenerico.ParamByName('serie_daje').AsString := sdaje;
            dm.qryGenerico.ParamByName('numero_daje').AsString:= ndaje;
            dm.qryGenerico.Open;

            if (F_Menu.Label39.Caption = '27357717000141') or (F_Menu.Label39.Caption = '27.357.717/0001-41') or
              (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66') or
              (F_Menu.Label39.Caption = '28275286000137') or (F_Menu.Label39.Caption = '28.275.286/0001-37') or
              (F_Menu.Label39.Caption = '27400369000148') or (F_Menu.Label39.Caption = '27.400.369/0001-48') or
              (F_Menu.Label39.Caption = '27215776000185') or (F_Menu.Label39.Caption = '27.215.776/0001-85') or
              (F_Menu.Label39.Caption = '27282471000196') or (F_Menu.Label39.Caption = '27.282.471/0001-96') Then
            Begin
              RvProject3.SetParam('emol_cer', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('emol_daje').AsCurrency));
              RvProject3.SetParam('fetj_cer', FormatCurr('###,###,##0.00', DM.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('fmmpba').AsCurrency +
                                                                       DM.qryGenerico.fieldbyname('vr_pge').AsCurrency));
            End
            Else
            Begin
              RvProject3.SetParam('emol_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('emol_daje').AsCurrency));
              RvProject3.SetParam('fetj_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency));
            End;

            RvProject3.SetParam('fecom',    FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency));
            RvProject3.SetParam('def_pub',  FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency));
            RvProject3.SetParam('pags',     dm.qryGenerico.fieldbyname('pags').AsString);

            RvProject3.SetParam('tota_cer', FormatCurr('###,###,##0.00', dm.qryGenerico.fieldbyname('emol_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('tx_fisca_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('fecom_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('def_pub_daje').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('fmmpba').AsCurrency +
                                                                         dm.qryGenerico.fieldbyname('vr_pge').AsCurrency));

            RvProject3.ExecuteReport('report1');
        End;
      end
      else
      begin
        if F_Menu.bematech2.Caption = '1' then
        begin
          for y := 1 to cert_vias do
          begin
            impport := porta_cert;
            ReciboRecBem(Funcoes, True, MaskEdit1.Text, Label3.Caption, MaskEdit2.Text, Trim(MaskEdit3.Text),
                         Trim(MaskEdit4.Text), Trim(Copy(ComboBox1.Text, 1, 50)), MaskEdit9.Text,
                         '', Trim(MaskEdit5.Text), '', 'C', copy(ComboBox5.text, 1, 5) , '', '',
                         '', '', impport, '', F_Menu.Label1.Caption, CurrencyEdit1.Value, CurrencyEdit5.Value, VrEmolumentos, VrEmolAdicional, VrPag,
                         VrViasExcedente, VrMicrofilme, VrDigitalizacao, Vr_Notpag, VrInformatica,
                         VrGravEletronica, VrConferencia, (VrDoi + VrDoiInfo), VrProcEst, VrPorDist,
                         (VrDistrib+VrTrib_DIST + VrDefen_DIST + VrProcu_DIST + VrTrib_nom + VrDefen_nom + VrProcu_nom+tot_nomexc),
                         VrInfoDistrib, VrGravEletrDistrib, VrNomeExc, VrTribunal, VrProcuradoria, VrDefensoria, VrMutua, VrAcoterj, VrSubTotal, VrTotG);
          End;
  //      Recibo_Cert_Fiscal_LN;
        end
        else
  {      begin
          if (F_Menu.Label24.Caption = 'T') then
          begin
            ReciboCertidao(Funcoes, True, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit3.Text), Trim(MaskEdit5.Text), Trim(MaskEdit4.Text), Trim(Copy(ComboBox1.Text, 7, 50)), MaskEdit9.Text, TimeToStr(Time), Trim(RichEdit1.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'CT C', False), '', CurrencyEdit1.Value);
          end
          else ReciboCertidao(Funcoes, False, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit3.Text), Trim(MaskEdit5.Text), Trim(MaskEdit4.Text), Trim(Copy(ComboBox1.Text, 7, 50)), MaskEdit9.Text, TimeToStr(Time), Trim(RichEdit1.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'CT C', False), '', CurrencyEdit1.Value);
        end;
  //      else
  }      Begin
          if (F_Menu.Label24.Caption = 'T') then
          begin
            Funcoes.ReciboCertidao(Funcoes, True, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit3.Text), Trim(MaskEdit5.Text), Trim(MaskEdit4.Text), Trim(Copy(ComboBox1.Text, 7, 50)), MaskEdit9.Text, TimeToStr(Time), Trim(RichEdit1.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'CT C', False), '', CurrencyEdit1.Value, VrEmolumentos, VrBusca, VrDesarquivamento, VrInformatica, VrSubTotal, VrTribunal, VrDefensoria, VrProcuradoria, VrTotG);
          end
          else Funcoes.ReciboCertidao(Funcoes, False, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit3.Text), Trim(MaskEdit5.Text), Trim(MaskEdit4.Text), Trim(Copy(ComboBox1.Text, 7, 50)), MaskEdit9.Text, TimeToStr(Time), Trim(RichEdit1.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'CT C', False), '', CurrencyEdit1.Value, VrEmolumentos, VrBusca, VrDesarquivamento, VrInformatica, VrSubTotal, VrTribunal, VrDefensoria, VrProcuradoria, VrTotG);
          // Autenticando a bobina;
        end;
     //   Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'CT C', True);
    //     BitBtn4.Enabled := False;
      end;
    end
    else
    begin
      ShowMessage('Recepção não gerada !');
      Label3.Caption := '000000';
    end;
  end;
  Habilitar_Tela(False);
  BitBtn2.SetFocus;
end;

procedure TF_RecepC.BitBtn2Click(Sender: TObject);
begin
  Limpar(F_RecepC);

  Application.CreateForm(TF_DAJE_TJ, F_DAJE_TJ);
  F_DAJE_TJ.ShowModal;
  sdaje := F_DAJE_TJ.MaskEdit1.Text;
  ndaje := F_DAJE_TJ.MaskEdit2.Text;
  {F_DAJE_TJ.MaskEdit1.Clear;
  F_DAJE_TJ.Destroy;
  F_DAJE_TJ := Nil;}


  DM.ArqAux.Close;
  DM.ArqAux.Sql.Clear;
  DM.ArqAux.Sql.Add('SELECT p_auxiliar, daje FROM td WHERE (daje = ' + QuotedStr(ndaje));
  DM.ArqAux.Sql.Add(' and serie_daje = ' + QuotedStr(sdaje) + ') or (dajepost = ' + QuotedStr(sdaje+ndaje));
  DM.ArqAux.Sql.Add(') or (dajevias = ' + QuotedStr(sdaje+ndaje) + ')');
  DM.ArqAux.Open;

  DM.ArqAux1.Close;
  DM.ArqAux1.Sql.Clear;
  DM.ArqAux1.Sql.Add('SELECT nr_protoc, daje FROM certidao WHERE daje = ' + QuotedStr(ndaje));
  DM.ArqAux1.Sql.Add(' and serie_daje = ' + QuotedStr(sdaje));
  DM.ArqAux1.Open;

  if ((DM.ArqAux.RecordCount <> 0)) and (Trim(ndaje) <> '') then
  begin
    MessageBox(0, PChar('Nº de DAJE já relacionado ao protocolo: '+DM.ArqAux.FieldByName('p_auxiliar').AsString+'. Favor Verificar !'), 'ALERTA', MB_OK + MB_ICONWARNING);
    F_RecepC.NaoInserirRecepcao := True;
    Exit;
  end;  

  if ((DM.ArqAux1.RecordCount <> 0)) and (Trim(ndaje) <> '') then
  begin
    MessageBox(0, PChar('Nº de DAJE já relacionado na tabela de certidão, recibo: '+DM.ArqAux1.FieldByName('nr_protoc').AsString+'. Favor Verificar !'), 'ALERTA', MB_OK + MB_ICONWARNING);
    F_RecepC.NaoInserirRecepcao := True;
    Exit;
  end;

  if not NaoInserirRecepcao then
  begin
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('SELECT * FROM daje WHERE serie_daje = ' + QuotedStr(F_DAJE_TJ.MaskEdit1.Text));
    DM.ArqAux.Sql.Add(' and numero_daje = ' + QuotedStr(F_DAJE_TJ.MaskEdit2.Text));
    DM.ArqAux.Open;

    if DM.ArqAux.RecordCount <> 0 then
    begin
      ComboBox2.Text := DM.ArqAux.FieldByName('tipo_doc').AsString;
      MaskEdit27.Text := DM.ArqAux.FieldByName('doc').AsString;

      if (Trim(ComboBox2.Text) = 'CPF') then MaskEdit27.EditMask := '###.###.###-##';
      if (Trim(ComboBox2.Text) = 'CNPJ') then MaskEdit27.EditMask := '##.###.###/####-##';

      MaskEdit3.Text := DM.ArqAux.FieldByName('contribuinte').AsString;
      MaskEdit10.Text := DM.ArqAux.FieldByName('pags').AsString;

      DM.ArqAux1.Close;
      DM.ArqAux1.Sql.Clear;
      DM.ArqAux1.Sql.Add('SELECT ct.tabela, ct.item, ct.descricao FROM tab_ato2 ta ');
      DM.ArqAux1.Sql.Add('left outer join cad_tab ct on (ct.tabela = ta.tabela and ct.item = ta.item_tab) ');
      DM.ArqAux1.Sql.Add('where ta.cod_ato = ' + DM.ArqAux.FieldByName('cod_ato').AsString);
      DM.ArqAux1.Open;
      if DM.ArqAux1.RecordCount <> 0 then
      begin
        DM.ArqAux1.FindFirst;
        ComboBox5.Text := Dm.ArqAux1.FieldByName('tabela').AsString + '.' + Trim(Dm.ArqAux1.FieldByName('item').AsString) + ' - ' + Dm.ArqAux1.FieldByName('descricao').AsString;
      end;

      CurrencyEdit1.Value := DM.ArqAux.FieldByName('vr_daje').AsCurrency;
      CurrencyEdit5.Value := DM.ArqAux.FieldByName('vr_daje').AsCurrency;
    end;

    Habilitar_Tela(True);
    MaskEdit3.SetFocus;
  end
  else
  begin
    if PermiteRecepcaoSemDAJE Then
    begin
      Habilitar_Tela(True);
      MaskEdit3.SetFocus;
    end
    else
    begin
      Habilitar_Tela(False);
      BitBtn2.SetFocus;
    end;
  end;

  F_DAJE_TJ.MaskEdit1.Clear;
  F_DAJE_TJ.MaskEdit2.Clear;
  F_DAJE_TJ.Destroy;
  F_DAJE_TJ := Nil;
end;

procedure TF_RecepC.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RecepC.RichEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 Begin
  if RichEdit1.Lines.Count > 2 then
  Begin
   Showmessage('Máximo de 3 linhas');
   bitbtn4.setfocus;
  end;
 end;
end;

procedure TF_RecepC.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
 if RichEdit1.Lines.Count > 2 then
  Begin
   Showmessage('Máximo de 3 linhas');
   bitbtn4.setfocus;
  end;
end;

procedure TF_RecepC.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RecepC.ComboBox6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepC.CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_RecepC.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit5.SetFocus;
end;

procedure TF_RecepC.MaskEdit10Exit(Sender: TObject);
begin
  try
   if (MaskEdit10.Text = '') and (StrToInt(MaskEdit10.Text) < 1) then
   begin
     Application.MessageBox('Campo Numerico Preencher com número maior que 0(ZERO)', 'Mensagem do Sistema', mb_ok);
     MaskEdit10.SetFocus;
     exit;
   end;
  except
   Application.MessageBox('Valido apenas Numeros, favor verificar', 'Mensagem do Sistema', mb_ok);
   MaskEdit10.SetFocus;
   exit;
  end;

  If ValidData(MaskEdit1.Text) then
    dat_calc := QuotedStr(ConvData(MaskEdit1.Text))
  Else
  dat_calc := QuotedStr(ConvData(DateToStr(now)));

  DM.Tab_Atos.RequestLive := False;
  DM.Tab_Atos.Close;
  DM.Tab_Atos.Sql.Clear;
  DM.Tab_Atos.Sql.Add('select * from tab_ato2 where data <= ' + dat_calc);
  DM.Tab_Atos.Sql.Add('group by data');
  DM.Tab_Atos.Open;
  DM.Tab_Atos.FindLast;
  dat := DM.Tab_Atos.FieldByname('data').AsString;

  if (ComboBox6.Text <> '06 - Gratuito') then
  begin
    DM.Tab_Atos.Close;
    DM.Tab_Atos.Sql.Clear;
    DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
    DM.Tab_Atos.Sql.Add('     data = '   + QuotedStr(ConvData(dat)));
    DM.Tab_Atos.Sql.Add(' AND tabela = ' + QuotedStr(copy(ComboBox5.Text,1,1)));
    DM.Tab_Atos.Sql.Add(' AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)));

    if copy(ComboBox5.Text,5,1) <> '-' then
      DM.Tab_Atos.Sql.Add(' AND subitem = '+QuotedStr(copy(ComboBox5.Text,5,1)));

    DM.Tab_Atos.Open;

    calc_emol  := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency;
    calc_vfetj := DM.Tab_Atos.FieldByName('taxa').ASCurrency;
    calc_total := DM.Tab_Atos.FieldByName('total').ASCurrency;
    calc_pag := 0;

    if StrToInt(MaskEdit10.Text) > 0 then
    begin
      DM.Tab_Atos.Close;
      DM.Tab_Atos.Sql.Clear;
      DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
      DM.Tab_Atos.Sql.Add('     data = '   + QuotedStr(ConvData(dat)));
      DM.Tab_Atos.Sql.Add(' AND tabela = "4"');
      DM.Tab_Atos.Sql.Add(' AND item_tab = "9"');
      DM.Tab_Atos.Sql.Add(' AND subitem = "B"');
      DM.Tab_Atos.Open;
      calc_pag   := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency * StrToInt(MaskEdit10.Text);
      calc_vfetj := calc_vfetj + (DM.Tab_Atos.FieldByName('taxa').ASCurrency * StrToInt(MaskEdit10.Text));
      calc_emol  := calc_emol + calc_pag;
      calc_total := calc_total + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit10.Text));
    end;
  end
  else
  begin
    calc_emol  := 0;
    calc_vfetj := 0;
    calc_total := 0;
    calc_pag   := 0;
  end;

  //CurrencyEdit5.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;

  {if StrToInt(MaskEdit10.Text) > 0 then
  begin
    DM.Tab_Atos.Close;
    DM.Tab_Atos.Sql.Clear;
    DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
    DM.Tab_Atos.Sql.Add('     data = '   + QuotedStr(ConvData(dat)));
    DM.Tab_Atos.Sql.Add(' AND tabela = "4"');
    DM.Tab_Atos.Sql.Add(' AND item_tab = "9"');
    DM.Tab_Atos.Sql.Add(' AND subitem = "B"');
    DM.Tab_Atos.Open;
    if (ComboBox6.Text <> '06 - Gratuito') then
    begin
    calc_pag   := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency * StrToInt(MaskEdit10.Text);
    calc_vfetj := calc_vfetj + (DM.Tab_Atos.FieldByName('taxa').ASCurrency * StrToInt(MaskEdit10.Text));
    calc_emol  := calc_emol + calc_pag;
    calc_total := calc_total + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit10.Text));}
//    CurrencyEdit5.Value := calc_total;
  CurrencyEdit5.Value := calc_total;
end;

procedure TF_RecepC.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_RecepC.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then edtAverbacao.SetFocus;
end;

procedure TF_RecepC.ComboBox2Exit(Sender: TObject);
begin
{
  MaskEdit27.EditMask := '';
  MaskEdit27.Clear;
  if (Trim(ComboBox2.Text) = 'CPF') then
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') = '') then MaskEdit27.EditMask := '###.###.###-##';
  end;
  if (Trim(ComboBox2.Text) = 'CNPJ') then
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') = '') then MaskEdit27.EditMask := '##.###.###/####-##';
    ComboBox11.Text := '';
    MaskEdit7.Text := '';
  end;
 }
end;

procedure TF_RecepC.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit27.SetFocus;
end;

procedure TF_RecepC.MaskEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox11.SetFocus
end;

procedure TF_RecepC.ComboBox11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_RecepC.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Maskedit4.setfocus;
end;

procedure TF_RecepC.ComboBox5Exit(Sender: TObject);
begin
  Dm.Calculo.Close;
  Dm.Calculo.Sql.Clear;
  Dm.Calculo.Sql.Add('SELECT data FROM cad_cus');
  Dm.Calculo.Sql.Add('GROUP BY data');
  Dm.Calculo.Sql.Add('ORDER BY data DESC');
  Dm.Calculo.Open;

  SeparaTabela(ComboBox5.Text);

{  if (tab = '10') and (item = '7') and (subitem = 'A') then
  begin
    MaskEdit8.Enabled  := True;
    MaskEdit8.Text     := '1';
    MaskEdit10.Enabled := False;
    MaskEdit10.Text    := '0';
  end
  else
  begin
    MaskEdit8.Enabled  := False;
    MaskEdit8.Text     := '0';
    MaskEdit10.Enabled := True;
    MaskEdit10.Text    := '1';
  end;}
end;

procedure TF_RecepC.MaskEdit8Exit(Sender: TObject);
var
  anos : Integer;
  mic  : String;
begin
{  try
   if (MaskEdit8.Text = '') and (StrToInt(MaskEdit8.Text) < 1) then
   begin
     Application.MessageBox('Campo Numerico Preencher com número maior que 0(ZERO)', 'Mensagem do Sistema', mb_ok);
     MaskEdit8.SetFocus;
     exit;
   end;
  except
   Application.MessageBox('Valido apenas Numeros, favor verificar', 'Mensagem do Sistema', mb_ok);
   MaskEdit8.SetFocus;
   exit;
  end;
  //Calculo de Certidão                                                                                           qtde paginas
  if CheckBox1.Checked then anos := 1 else anos := 0;
  if CheckBox2.Checked then mic := 'S' else mic := 'N';

  RichEdit2.Lines.Clear;
  RichEdit3.Lines.Clear;
  RichEdit4.Lines.Clear;
  RichEdit5.Lines.Clear;

  if (DM.Config_Adm.FieldByName('chk_04').AsBoolean) then
  begin
    CalculoCert(MaskEdit1.Text, copy(combobox5.text, 1, 5), 0.00, StrToInt(Copy(ComboBox6.Text, 1,2)) , StrToInt(MaskEdit10.Text), StrToInt(MaskEdit8.Text), 0, 0, 0, anos, mic, StrToInt(MaskEdit13.Text));
    CurrencyEdit1.Value := VrTotG;
    CurrencyEdit5.Value := VrTotG;
  end;

  if (DM.Config_Adm.FieldByName('chk_05').AsBoolean) then
  begin
    CalculoCert2(MaskEdit1.Text, copy(combobox5.text, 1, 5), 0.00, StrToInt(Copy(ComboBox6.Text, 1,2)) , StrToInt(MaskEdit10.Text), StrToInt(MaskEdit8.Text), 0, 0, 0, anos, mic, True);
    CurrencyEdit1.Value := VrTotG;
    CurrencyEdit5.Value := VrTotG;
  end;
}
end;

procedure TF_RecepC.MaskEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit12.SetFocus;
end;

procedure TF_RecepC.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox5.SetFocus;
end;

procedure TF_RecepC.Habilitar_Tela(Habilita: Boolean);
begin
  MaskEdit1.Enabled      := Habilita;
  MaskEdit2.Enabled      := Habilita;
  MaskEdit6.Enabled      := Habilita;
  edtAverbacao.Enabled   := Habilita;  
  MaskEdit3.Enabled      := Habilita;
  ComboBox2.Enabled      := Habilita;
  MaskEdit27.Enabled     := Habilita;
  ComboBox11.Enabled     := Habilita;
  MaskEdit7.Enabled      := Habilita;
  MaskEdit4.Enabled      := Habilita;
  MaskEdit14.Enabled     := Habilita;
  MaskEdit11.Enabled     := Habilita;
  MaskEdit5.Enabled      := Habilita;
  MaskEdit12.Enabled     := Habilita;
  ComboBox5.Enabled      := Habilita;
  ComboBox1.Enabled      := Habilita;
  ComboBox6.Enabled      := Habilita;
  MaskEdit10.Enabled     := Habilita;
  CurrencyEdit5.Enabled  := Habilita;
  CurrencyEdit1.Enabled  := Habilita;
  RichEdit1.Enabled      := Habilita;
  BitBtn4.Enabled        := Habilita;
end;

procedure TF_RecepC.CurrencyEdit5Exit(Sender: TObject);
begin
  currencyedit1.value := currencyedit5.value;
end;

procedure TF_RecepC.FormCreate(Sender: TObject);
begin
  Habilitar_Tela(False);
end;

procedure TF_RecepC.ComboBox2Change(Sender: TObject);
begin
  If (ComboBox2.ItemIndex = 0) then //CPF
  begin
    MaskEdit27.EditMask := '';
    MaskEdit27.Text     := TirarTudo(MaskEdit27.Text, '-','.','/');
    MaskEdit27.EditMask := '999.999.999-99';
  end
  else
  if (ComboBox2.ItemIndex = 1) then //CNPJ
  begin
    MaskEdit27.EditMask := '';
    MaskEdit27.Text     := TirarTudo(MaskEdit27.Text, '-','.','/');
    MaskEdit27.EditMask := '99.999.999/9999-99';
  end
  else
    MaskEdit27.EditMask := '';
end;

procedure TF_RecepC.MkEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Maskedit5.setfocus;      
end;

procedure TF_RecepC.MaskEdit27Exit(Sender: TObject);
begin
  if (TirarTudo(MaskEdit27.Text, '.', '-', '/') <> '') OR (Trim(MaskEdit27.Text) = '') then
  begin
    Dm.BuscaPartes.Close;
    Dm.BuscaPartes.Sql.Clear;
    Dm.BuscaPartes.Sql.Add('SELECT celular, propriet, email_apresentante, telefone, doc2, tip_doc2 ');
    Dm.BuscaPartes.Sql.Add('FROM certidao ');
    Dm.BuscaPartes.Sql.Add('WHERE');
    Dm.BuscaPartes.Sql.Add('doc1 = ' + Chr(39) + TirarTudo(MaskEdit27.Text, '.', '/', '-') + Chr(39) +' or doc1 = ' + Chr(39) + (MaskEdit27.Text) + Chr(39) +' order by recno desc ');
    Dm.BuscaPartes.Open;
    Dm.BuscaPartes.Last;
    
    if (Dm.BuscaPartes.RecordCount <> 0) then
    begin

      if MaskEdit4.Text = '' Then
        MaskEdit4.Text  := Dm.BuscaPartes.FieldByName('telefone').asString;

      if MaskEdit14.Text = '' Then
        MaskEdit14.Text  := Dm.BuscaPartes.FieldByName('celular').asString;

      if ComboBox11.Text = '' Then
        ComboBox11.Text  := Dm.BuscaPartes.FieldByName('tip_doc2').asString;

      if MaskEdit7.Text = '' Then
        MaskEdit7.Text  := Dm.BuscaPartes.FieldByName('doc2').asString;

      if MkEmail.text = '' Then
        MkEmail.text  := Dm.BuscaPartes.FieldByName('email_apresentante').asString;

      if MaskEdit5.Text = '' Then
        MaskEdit5.Text  := Dm.BuscaPartes.FieldByName('propriet').asString;

    end;
    Dm.BuscaPartes.Close;
  end; 

end;

procedure TF_RecepC.MaskEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MkEmail.setfocus;
end;

procedure TF_RecepC.edtAverbacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

end.
