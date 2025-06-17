unit PesqRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, Grids, DBGrids, DBCtrls, Menus, jpeg,
  ComCtrls, Tabnotbk;

type
  TF_PesqRec = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Bevel1: TBevel;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    MaskEdit1: TMaskEdit;
    ComboBox1: TComboBox;
    PopupMenu1: TPopupMenu;
    AndamentoNotificao1: TMenuItem;
    IncluirIPI1: TMenuItem;
    CorrigirIPI1: TMenuItem;
    VisualizarParcelasF51: TMenuItem;
    CorreodasDatasdeBaixaEfetivaF81: TMenuItem;
    CorreodasDatasdeBaixaProvisriaF91: TMenuItem;
    DBText4: TDBText;
    ControlBar1: TControlBar;
    Label36: TLabel;
    BitBtn2: TBitBtn;
    TabbedNotebook1: TTabbedNotebook;
    DBGrid3: TDBGrid;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    Label34: TLabel;
    Panel6: TPanel;
    Label35: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label29: TLabel;
    Label30: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label9: TLabel;
    DBText7: TDBText;
    Label17: TLabel;
    TabSheet2: TTabSheet;
    Label10: TLabel;
    DBText8: TDBText;
    Label11: TLabel;
    DBText9: TDBText;
    Label12: TLabel;
    DBText10: TDBText;
    Label13: TLabel;
    DBText11: TDBText;
    Label14: TLabel;
    Label18: TLabel;
    Label27: TLabel;
    DBText5: TDBText;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBText2: TDBText;
    Label5: TLabel;
    DBText3: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    DBText19: TDBText;
    Label22: TLabel;
    Label15: TLabel;
    Label23: TLabel;
    Label28: TLabel;
    DBText12: TDBText;
    DBText13: TDBText;
    Label20: TLabel;
    Label21: TLabel;
    Label19: TLabel;
    DBText17: TDBText;
    Label8: TLabel;
    Label16: TLabel;
    Label26: TLabel;
    DBText18: TDBText;
    DBText6: TDBText;
    BitBtn1: TBitBtn;
    ChkAgrupaRepresentante: TCheckBox;
    cbUsuario: TComboBox;
    lbTotal: TLabel;
    MkDataInicial: TDateTimePicker;
    lbA: TLabel;
    lbDataDeReceb: TLabel;
    MkDataFinal: TDateTimePicker;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    Procedure Carregar(Sender : TOBject);
    procedure RadioButton1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure AndamentoNotificao1Click(Sender: TObject);
    procedure IncluirIPI1Click(Sender: TObject);
    procedure VisualizarParcelasF51Click(Sender: TObject);
    procedure CorreodasDatasdeBaixaEfetivaF81Click(Sender: TObject);
    procedure CorreodasDatasdeBaixaProvisriaF91Click(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure cbUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MkDataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MkDataFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Procedure Ocorrencias;

var
  F_PesqRec: TF_PesqRec; 

implementation

Uses DMTD, Menu, PesqP, Loc, AndaNot, AndaNotB, U_cgi, Exame, VParc,
  CorBaiE, CorBaiP, FuncGeral, Anotacao, U_GradAverbacoes;

{$R *.DFM}

Procedure TF_PesqRec.Carregar(Sender : TOBject);
begin
  Label15.Caption := '';
  Label17.Caption := '';
  Label18.Caption := '';
  Label22.Caption := '';
  Label23.Caption := '';
  Label25.Caption := '';

  Label15.Caption := Ver_Situacao(Dm.Td_Cert.FieldByName('situacao').asString, False);
  Label18.Caption := FormataCep(Dm.Td_Cert.FieldByName('cep').asString);
  if (Dm.Td_Cert.FieldByName('doc1').asString <> '') then
  begin
    Label17.Caption := Dm.Td_Cert.FieldByName('tip_doc1').asString + ' ' + FormataDoc(Dm.Td_Cert.FieldByName('doc1').asString, Dm.Td_Cert.FieldByName('tip_doc1').asString) + ' ';
  end;
  if (Dm.Td_Cert.FieldByName('doc2').asString <> '') then
  begin
    Label17.Caption := Label17.Caption + Dm.Td_Cert.FieldByName('tip_doc2').asString + ' ' + Dm.Td_Cert.FieldByName('doc2').asString;
  end;
  if (Trim(Label17.Caption) = '') then Label17.Caption := 'NÃO HÁ DOCUMENTO CADASTRADO.';
  Label22.Caption := Dm.Td_Cert.FieldByName('ext_nat').asString;
  Label23.Caption := Dm.Td_Cert.FieldByName('status').asString;
  Label25.Caption := Dm.Td_Cert.FieldByName('contato').asString;
  Label30.Caption := Dm.Td_Cert.FieldByName('a_nome').asString;

  frmAnotacao.RichEdit1.Text := Dm.Td_Cert.FieldByName('anotacao').AsString;

end;

procedure TF_PesqRec.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if maskedit1.Visible Then
    begin
      maskedit1.setfocus;
    end
    else
    begin
      cbUsuario.SetFocus;
    end
  end;

  if key = 27 then
    close;
end;

procedure TF_PesqRec.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_PesqRec.SpeedButton1Click(F_PesqRec);
end;

procedure TF_PesqRec.BitBtn3Click(Sender: TObject);
begin
  panel2.visible := false;;
  panel1.enabled := true;
  combobox1.setfocus;
  cbUsuario.Text := '';
  maskedit1.text := '';
end;

procedure TF_PesqRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if panel2.visible then
  begin
    panel2.visible := false;;
    panel1.enabled := true;
    combobox1.text := '';
    maskedit1.text := '';
  end;
end;

procedure TF_PesqRec.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27  then F_PesqRec.BitBtn3Click(F_PesqRec);
  if key = 13  then F_PesqRec.BitBtn4Click(F_PesqRec);
  if key = 113 then F_PesqRec.AndamentoNotificao1Click(F_PesqRec);
  if key = 112 then F_PesqRec.VisualizarParcelasF51Click(F_pesqRec);
end;

procedure TF_PesqRec.BitBtn4Click(Sender: TObject);
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT td_pesso.*, cad_sit.descricao FROM td_pesso left join cad_sit on (td_pesso.situacao = cad_sit.codigo)');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('p_auxiliar = ' + Dm.Td_Cert.FieldByName('p_auxiliar').asString);
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    Application.CreateForm(TF_PesqP, F_PesqP);
    F_PesqP.Caption := 'Partes do Protocolo Auxiliar Nº ' + Dm.ArqAux.FieldByName('p_auxiliar').asString;
    F_PesqP.ShowModal;
    F_PesqP.Destroy;
    F_PesqP := NIL;
  end;
  DBGrid1.SetFocus;
end;

procedure TF_PesqRec.BitBtn4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_PesqRec.BitBtn3Click(F_PesqRec);
end;

procedure TF_PesqRec.BitBtn5Click(Sender: TObject);
begin
  if (not Permissao('acesso023')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Loc, F_Loc);
  F_Loc.MaskEdit1.Text := Dm.Td_Cert.FieldByName('protocolo').asString;
  F_Loc.Label5.Caption := 'sim';
  F_Loc.ShowModal;
  F_Loc.Destroy;
  F_Loc := NIL;
end;

procedure TF_PesqRec.SpeedButton1Click(Sender: TObject);
var
  argu, sinal : String;
  cod : Integer;
begin

   F_PesqRec.Label16.caption := '';
   F_PesqRec.Label21.caption := '';
   Dm.Td_Cert.RequestLive := False;
{  if BuscaCGI(maskedit1.text) then
  Begin
    Application.CreateForm(TF_Cgi, F_Cgi);
    F_Cgi.Showmodal;
    F_cgi.destroy;
    DM.DBRI.Close;
  end; }

  cod := (StrToInt(Copy(ComboBox1.Text, 1,2)));
  if (not ValidNumero(Copy(ComboBox1.Text, 1,2))) OR
     (cod > 15) OR (cod <= 0) then
  begin
    MessageBox(Handle, PChar('Opção de pesquisa inválida !'), 'ERRO', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    MessageBox(Handle, PChar('Favor optar por uma opção válida !'), 'ERRO', MB_OK + MB_ICONWARNING);
    ComboBox1.SetFocus;
    Exit;
  end;
  if (cod <> 14) Then
  Begin
    if (Trim(MaskEdit1.Text) = '') then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você deve digitar algum dado para realizar a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
  End
  Else
  Begin
    if (Trim(cbUsuario.Text) = '') then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você deve digitar algum dado para realizar a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
  End;
  if (cod = 8) AND (Not ValidData(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('Data a ser pesquisada é inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  argu := '';
  if (cod > 0) AND (cod <= 1) OR
     (cod = 7) OR (cod = 8)  then
  begin
    RadioButton1.Checked := True;
    argu := Trim(MaskEdit1.Text);
  end
  else
  begin
    if (RadioButton1.Checked) then argu := Chr(39) + Trim(MaskEdit1.Text) + Chr(39);
    if (RadioButton2.Checked) then argu := Chr(39) + Trim(MaskEdit1.Text) + '%' + Chr(39);
    if (RadioButton3.Checked) then argu := Chr(39) + '%' + Trim(MaskEdit1.Text) + '%' + Chr(39);
    if (RadioButton4.Checked) then argu := 'Soundex(' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39) + ')';
  end;
  if (cod <> 7) then
  begin
    Dm.Td_Cert.Close;
    Dm.Td_Cert.Sql.Clear;
    Dm.Td_Cert.Sql.Add('SELECT td.sequencia_averbacao, td.tipo_reg, td.cartorio, tip_doc1, tip_doc2, a_nome, cep, ext_nat, doc2, averba, data_d, bairro, cidade, estado, endereco, anotacao, data_r, td.recibo, contrato, td.registro, ');
    Dm.Td_Cert.Sql.Add('a_telefone, status, td.protocolo, td.p_auxiliar, td_pesso.nome, doc1, td.contato, td.data_p, cad_sit.descricao, situacao FROM td LEFT JOIN td_pesso');
    Dm.Td_Cert.Sql.Add('ON (td.p_auxiliar = td_pesso.p_auxiliar) left join cad_sit on (td_pesso.situacao = cad_sit.codigo)');
    Dm.Td_Cert.Sql.Add('WHERE ');

    Dm.qryGenerico.Close;
    Dm.qryGenerico.Sql.Clear;
    Dm.qryGenerico.Sql.Add('SELECT Count(*) as quantidade FROM td ');
    Dm.qryGenerico.Sql.Add('WHERE');

    if radiobutton1.Checked then sinal := ' =';
    if radiobutton2.Checked then sinal := ' like';

    lbTotal.Caption:= '....';

    if (cod = 1) then
      Dm.Td_Cert.Sql.Add('td.recibo = '+ argu)
    else if (cod = 2) then
      Dm.Td_Cert.Sql.Add('td.contrato' + sinal + argu)
    else if (cod = 3) then
      Dm.Td_Cert.Sql.Add('td.registro = ' + argu + 'or td.protocolo = '+argu)
    else if (cod = 9) then
      Dm.Td_Cert.Sql.Add('td.p_auxiliar   = ' + argu)
    else if (cod = 13) Then
    begin
      if (RadioButton1.Checked) then
        Dm.Td_Cert.Sql.Add('td.a_nome = '+ argu +' ')
      else
      begin
        if (RadioButton4.Checked) then
          Dm.Td_Cert.Sql.Add('td.a_nome = '+ argu +' ')
        else
          Dm.Td_Cert.Sql.Add('td.a_nome like '+ argu +' ');
      end
    end
    else if (cod = 14) Then
    begin
      if (RadioButton1.Checked) then
        argu := Chr(39) + Trim(cbUsuario.Text) + Chr(39);

      if (RadioButton2.Checked) then
        argu := Chr(39) + Trim(cbUsuario.Text) + '%' + Chr(39);

      if (RadioButton3.Checked) then
        argu := Chr(39) + '%' + Trim(cbUsuario.Text) + '%' + Chr(39);

      if (RadioButton4.Checked) then
        argu := 'Soundex(' + Chr(39) + Trim(cbUsuario.Text) + Chr(39) + ')';

      if (RadioButton1.Checked) then
      begin
        Dm.Td_Cert.Sql.Add('td.identifica = '+ argu +' ');
        Dm.qryGenerico.Sql.Add('td.identifica = '+ argu +' ');
      end
      else
      begin
        if (RadioButton4.Checked) then
        begin
          Dm.Td_Cert.Sql.Add('td.identifica = '+ argu +' ');
          Dm.qryGenerico.Sql.Add('td.identifica = '+ argu +' ');
        end
        else
        Dm.Td_Cert.Sql.Add('td.identifica like '+ argu +' ');
        Dm.qryGenerico.Sql.Add('td.identifica like '+ argu +' ');
      end;

      if (FormatDateTime('yyyy-mm-dd', MkDataInicial.Date) = '  /  /    ') and (FormatDateTime('yyyy-mm-dd', MkDataFinal.Date) = '  /  /    ') Then
      begin
        MessageBox(Handle, PChar('Informe a Data de Rec.!'), PChar(F_PesqRec.Caption), MB_OK + MB_ICONWARNING);
        Exit;
      end;

      Dm.qryGenerico.Sql.Add('and data_p >= '+QuotedStr(FormatDateTime('yyyy-mm-dd', MkDataInicial.Date))+' ');
      Dm.qryGenerico.Sql.Add('and data_p <= '+QuotedStr(FormatDateTime('yyyy-mm-dd', MkDataFinal.Date))+' ');

      Dm.qryGenerico.Open;

      if Dm.qryGenerico.FieldByName('quantidade').AsInteger > 0 Then
        lbTotal.Caption:= 'Total: '+Dm.qryGenerico.FieldByName('quantidade').AsString;

      Dm.Td_Cert.Sql.Add('and data_p >= '+QuotedStr(FormatDateTime('yyyy-mm-dd', MkDataInicial.Date))+' ');
      Dm.Td_Cert.Sql.Add('and data_p <= '+QuotedStr(FormatDateTime('yyyy-mm-dd', MkDataFinal.Date))+' ');
    end
    else if (cod = 4) or (cod = 15) then
    begin
      if (Not(BuscaExataEmTituloRegEProtocolados)) Then
      begin
        if (RadioButton1.Checked) then
          Dm.Td_Cert.Sql.Add('td_pesso.nome = '+ argu +' or td.a_nome = '+ argu +' ')
        else
        begin
          if (RadioButton4.Checked) then
            Dm.Td_Cert.Sql.Add('td_pesso.nome = '+ argu +' or td.a_nome = '+ argu +' ')
          else
            Dm.Td_Cert.Sql.Add('td_pesso.nome like '+ argu +' or td.a_nome like '+ argu +' ');
        end;
      end
      else
      begin
        if (RadioButton1.Checked) then
          Dm.Td_Cert.Sql.Add('td_pesso.nome = '+ argu +' ')
        else if (RadioButton4.Checked) then
          Dm.Td_Cert.Sql.Add('td_pesso.nome = '+ argu +' ')
        else
          Dm.Td_Cert.Sql.Add('td_pesso.nome like '+ argu +' ');
      end;
    end
    else if (cod = 5) then
    begin
      if (RadioButton1.Checked) then
        Dm.Td_Cert.Sql.Add('td_pesso.doc1 = '+ argu)
      else
        Dm.Td_Cert.Sql.Add('td_pesso.doc1 like '+ argu)
    end
    else if (cod = 6) then
    begin
      if (Not(BuscaExataEmTituloRegEProtocolados)) Then
      begin
        if (RadioButton1.Checked) then
          Dm.Td_Cert.Sql.Add('td_pesso.nome = '+ argu +' or td.a_nome like '+ argu +' ')
        else
          Dm.Td_Cert.Sql.Add('td_pesso.nome like '+ argu +' or td.a_nome like '+ argu +' ')
      end
      else
      begin
        if (RadioButton1.Checked) then
          Dm.Td_Cert.Sql.Add('td.a_nome like '+ argu +' ')
        else
          Dm.Td_Cert.Sql.Add('td.a_nome = '+ argu +' ');
      end;
    end
    else if (cod = 10) then
    begin
      if (RadioButton1.Checked) then
        Dm.Td_Cert.Sql.Add('td.contato = '+ argu)
      else
        Dm.Td_Cert.Sql.Add('td.contato like '+ argu);
    end
    else if (cod = 11) then
      Dm.Td_Cert.Sql.Add('td.averba = '+QuotedStr(MaskEdit1.Text)+'')
    else if (cod = 12) then
      Dm.Td_Cert.Sql.Add('td.registro = '+QuotedStr(MaskEdit1.Text)+'');

    if (cod = 8) then
    begin
      Dm.Td_Cert.Sql.Add('td.data_r = "' + ConvData(argu) + '"');
      if ChkAgrupaRepresentante.Checked Then
        Dm.Td_Cert.Sql.Add('GROUP BY a_nome');
      Dm.Td_Cert.Sql.Add('ORDER BY td.p_auxiliar');
    end
    else if (cod = 15) then
    begin
      Dm.Td_Cert.Sql.Add('and td.data_r between ' + QuotedStr(FormatDateTime('yyyy-mm-dd', MkDataInicial.Date)) +' and '+ QuotedStr(FormatDateTime('yyyy-mm-dd', MkDataFinal.Date)));
      if ChkAgrupaRepresentante.Checked Then
        Dm.Td_Cert.Sql.Add('GROUP BY a_nome');
      if (F_Menu.Label39.Caption = '27271464000199') then  //Ilheus
        Dm.qryGenerico.Sql.Add('ORDER BY td.p_auxiliar asc')
      else
        Dm.Td_Cert.Sql.Add('ORDER BY td.p_auxiliar');
    end
    else
    begin
      if ChkAgrupaRepresentante.Checked Then
        Dm.Td_Cert.Sql.Add('GROUP BY a_nome');
      if (F_Menu.Label39.Caption = '27271464000199') then  //Ilheus
        Dm.qryGenerico.Sql.Add('ORDER BY td.p_auxiliar asc')
      else
        Dm.Td_Cert.Sql.Add('ORDER BY td.p_auxiliar');
    end;

    Dm.Td_Cert.Open;
    if (Dm.Td_Cert.RecordCount = 0) then
    begin
      Dm.Td_Cert.Close;
      MessageBox(Handle, PChar('Dados não encontrados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;

    F_PesqRec.Label16.Caption := Dm.Td_Cert.FieldByName('p_auxiliar').asString;
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT td.status, td.data_d FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('p_auxiliar = ' + Trim(F_PesqRec.Label16.Caption));
    Dm.Td.Open;

    if (Trim(Dm.Td.FieldByName('status').asString) = 'DEVOLVIDO IRREGULAR')OR
       (Trim(Dm.Td.FieldByName('status').asString) = 'DEVOLVIDO PRONTO') THEN
     F_PesqRec.Label21.Caption := (Trim(Dm.Td.FieldByName('data_d').asString));
  end
  else
  begin
    Dm.Acertifi.Close;
    Dm.Acertifi.Sql.Clear;
    Dm.Acertifi.Sql.Add('SELECT numreg FROM acertifi');
    Dm.Acertifi.Sql.Add('WHERE');
    Dm.Acertifi.Sql.Add('codigo_barra = ' + Chr(39) + argu + Chr(39));
    Dm.Acertifi.Open;
    if (Dm.Acertifi.RecordCount = 0) then
    begin
      ShowMessage('Código RL não encontrado !');
      Dm.Acertifi.Close;
      MaskEdit1.SetFocus;
      Exit;
    end;
    argu := Dm.Acertifi.FieldByName('numreg').asString;
    Dm.Acertifi.Close;
    Dm.Td_Cert.Close;
    Dm.Td_Cert.RequestLive := False;
    Dm.Td_Cert.Sql.Clear;
    Dm.Td_Cert.Sql.Add('SELECT * FROM td_cert');
    Dm.Td_Cert.Sql.Add('WHERE');
    Dm.Td_Cert.Sql.Add('registro = ' + argu);
    Dm.Td_Cert.Sql.Add('ORDER BY nome');
    Dm.Td_Cert.Open;
    if (Dm.Td_Cert.RecordCount = 0) then
    begin
      Dm.Td_Cert.Close;
      MessageBox(Handle, PChar('Dados não encontrados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    F_PesqRec.Label16.Caption := Dm.Td_Cert.FieldByName('p_auxiliar').asString;
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT td.status, td.data_d FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('p_auxiliar = ' + Trim(F_PesqRec.Label16.Caption));
    Dm.Td.Open;

    if (Trim(Dm.Td.FieldByName('status').asString) = 'DEVOLVIDO IRREGULAR')OR
       (Trim(Dm.Td.FieldByName('status').asString) = 'DEVOLVIDO PRONTO') THEN
     F_PesqRec.Label21.Caption := (Trim(Dm.Td.FieldByName('data_d').asString));
  end;
  Dm.Td_Cert.RequestLive := True;
  Panel2.Visible := True;
  Panel1.Enabled := False;
  //DbGrid1.SetFocus;
end;

procedure TF_PesqRec.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_PesqRec.RadioButton1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_PesqRec.RadioButton2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_PesqRec.RadioButton3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_PesqRec.RadioButton4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_PesqRec.FormDestroy(Sender: TObject);
begin
  Dm.Td_Cert.Close;
  Dm.Td_Cert.RequestLive := True;
end;

procedure TF_PesqRec.AndamentoNotificao1Click(Sender: TObject);
begin
  if (Dm.Td_Cert.FieldByName('registro').asInteger > 0) then
  begin
    if (Dm.Td_Cert.FieldByName('natureza').asInteger = 300)or(Dm.Td_Cert.FieldByName('natureza').asInteger = 197) then
    begin
      Application.CreateForm(TF_AndaNot, F_AndaNot);
      F_AndaNot.Label1.Caption := Dm.Td_Cert.FieldByName('registro').asString;
      F_AndaNot.ShowModal;
      F_AndaNot.Destroy;
      F_AndaNot := NIL;
    end
    else
    begin
      if (Dm.Td_Cert.FieldByName('natureza').asInteger = 2) then
      begin
        Application.CreateForm(TF_AndaNotB, F_AndaNotB);
        F_AndaNotB.Label1.Caption := Dm.Td_Cert.FieldByName('registro').asString;
        F_AndaNotB.ShowModal;
        F_AndaNotB.Destroy;
        F_AndaNotB := NIL;
      end;  
    end;
  end
  else ShowMessage('Número do registro inválido !');  
end;

procedure TF_PesqRec.IncluirIPI1Click(Sender: TObject);
begin

 DM.ipi.close;
 DM.ipi.Sql.Clear;
 DM.ipi.Sql.Add('update acertifi set ipi = ' );

end;

procedure TF_PesqRec.VisualizarParcelasF51Click(Sender: TObject);
begin
  Application.CreateForm(TF_VParc, F_VParc);
  F_VParc.ShowModal;
  F_VParc.Destroy;
  F_VParc := NIL;  
end;

Procedure Ocorrencias;
begin
  Dm.Cad_Ir.Close;
  Dm.Cad_Ir.Sql.Clear;
  Dm.Cad_Ir.Sql.Add('SELECT * FROM cad_ir');
  Dm.Cad_Ir.Sql.Add('ORDER BY motivo');
  Dm.Cad_Ir.Open;
  if (Dm.Cad_Ir.RecordCount <> 0) then
  begin
    while (not Dm.Cad_ir.Eof) do
    begin
     if (Assigned(F_CorBaiE)) then F_CorBaiE.ComboBox4.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').asString, 5) + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').asString));
     if (Assigned(F_CorBaiP)) then F_CorBaiP.ComboBox4.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').asString, 5) + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').asString));
     Dm.Cad_Ir.Next;
    end;
  end;
  Dm.Cad_Ir.Close;
end;
procedure TF_PesqRec.CorreodasDatasdeBaixaEfetivaF81Click(Sender: TObject);
begin
  Application.CreateForm(TF_CorBaiE, F_CorBaiE);
  Ocorrencias;
  F_CorBaiE.ShowModal;
  F_CorBaiE.Destroy;
  F_CorBaiE := NIL;
end;

procedure TF_PesqRec.CorreodasDatasdeBaixaProvisriaF91Click(Sender: TObject);
begin
  Application.CreateForm(TF_CorBaiP, F_CorBaiP);
  Ocorrencias;
  F_CorBaiP.ShowModal;
  F_CorBaiP.Destroy;
  F_CorBaiP := NIL;
end;

procedure TF_PesqRec.ComboBox1Exit(Sender: TObject);
begin
  if Copy(ComboBox1.Text, 1, 2) = '08' then
    MaskEdit1.EditMask := '99/99/9999'
  else
    MaskEdit1.EditMask := '';
end;

procedure TF_PesqRec.BitBtn1Click(Sender: TObject);
begin
  frmAnotacao.ShowModal;
end;

procedure TF_PesqRec.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TF_GradAverbacoes, F_GradAverbacoes);
  F_GradAverbacoes.qryRelatorio.Close;
  F_GradAverbacoes.qryRelatorio.SQL.Clear;
  F_GradAverbacoes.qryRelatorio.SQL.Add('select protocolo , registro, averbacao, data_recepcao, data_baixa, '+
                                        ' cod_natureza, nome_parte, nome_apresentante from HistoricoRegistro Where registro = '+QuotedStr(DM.Td_Cert.FieldByName('averba').AsString)+' order by protocolo , registro, averbacao');
  F_GradAverbacoes.qryRelatorio.Open;
  F_GradAverbacoes.ShowModal;
  F_GradAverbacoes.Destroy;
  F_GradAverbacoes := NIL;
end;  

procedure TF_PesqRec.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If dm.td_cert.FieldByName('tipo_reg').AsString = 'Reg.' then // condição
  Begin
    DBGrid1.Canvas.Font.Color:= clWindow;
    DBGrid1.Canvas.Brush.Color:= clGreen;
  End;
  DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[datacol].field, State);

end;

procedure TF_PesqRec.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If dm.td_cert.FieldByName('tipo_reg').AsString = 'Reg.' then // condição
  Begin
    DBGrid3.Canvas.Font.Color:= clWindow;
    DBGrid3.Canvas.Brush.Color:= clGreen;
  End;
  DBGrid3.DefaultDrawDataCell(Rect, DBGrid3.columns[datacol].field, State);

end;

procedure TF_PesqRec.FormShow(Sender: TObject);
begin
  dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('select u_apel from usuarios where u_apel <> '+QuotedStr('SISCART')+' group by u_apel order by u_apel');
  dm.qryGenerico.Open;

  cbUsuario.Clear;

  dm.qryGenerico.First;
  while not dm.qryGenerico.eof do
  begin
    cbUsuario.Items.Add(dm.qryGenerico.FieldByName('u_apel').AsString);
    dm.qryGenerico.Next;
  end;
end;

procedure TF_PesqRec.ComboBox1Change(Sender: TObject);
begin
  MkDataInicial.Date := now;
  MkDataFinal.Date := now;
  if (Copy(ComboBox1.Text, 1, 2) = '14') then
  begin
    cbUsuario.Visible     := True;
    lbDataDeReceb.Visible := True;
    MkDataInicial.Visible := True;
    MkDataFinal.Visible   := True;
    lbA.Visible           := True;
  end
  else if (Copy(ComboBox1.Text, 1, 2) = '15') then
  begin
    lbDataDeReceb.Visible := True;
    MkDataInicial.Visible := True;
    MkDataFinal.Visible   := True;
    lbA.Visible           := True;
  end
  else
  begin
    cbUsuario.Visible     := False;
    lbDataDeReceb.Visible := False;
    MkDataInicial.Visible := False;
    lbA.Visible           := False;
    MkDataFinal.Visible   := False;
  end;
end;

procedure TF_PesqRec.cbUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    begin
      MkDataInicial.SetFocus;
    end
  end;

  if key = 27 then
    close;
end;

procedure TF_PesqRec.MkDataInicialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    begin
      MkDataFinal.SetFocus;
    end
  end;

end;

procedure TF_PesqRec.MkDataFinalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    begin
      SpeedButton1.Click;
    end
  end;
end;

end.



