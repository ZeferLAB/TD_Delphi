unit Pesq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, Grids, DBGrids, DBCtrls, Menus, jpeg,
  ComCtrls, Tabnotbk, Db, DBTables;

type
  TF_Pesq = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    AndamentoNotificao1: TMenuItem;
    IncluirIPI1: TMenuItem;
    CorrigirIPI1: TMenuItem;
    VisualizarParcelasF51: TMenuItem;
    CorreodasDatasdeBaixaEfetivaF81: TMenuItem;
    CorreodasDatasdeBaixaProvisriaF91: TMenuItem;
    ControlBar1: TControlBar;
    Label36: TLabel;
    TabbedNotebook1: TTabbedNotebook;
    DBGrid3: TDBGrid;
    DBGrid1: TDBGrid;
    ImagemdoLivro1: TMenuItem;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton3: TSpeedButton;
    lbDataDeReceb: TLabel;
    dataRegistro: TDateTimePicker;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    MaskEdit1: TMaskEdit;
    ComboBox1: TComboBox;
    ChkAgrupaRepresentante: TCheckBox;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dataRegistro2: TDateTimePicker;
    lbA: TLabel;
    Panel7: TPanel;
    Panel5: TPanel;
    Label34: TLabel;
    Panel6: TPanel;
    Label35: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label32: TLabel;
    Label33: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label9: TLabel;
    DBText7: TDBText;
    Label17: TLabel;
    TabSheet2: TTabSheet;
    Label10: TLabel;
    DBText8: TDBText;
    Label12: TLabel;
    DBText10: TDBText;
    Label11: TLabel;
    DBText9: TDBText;
    Label13: TLabel;
    DBText11: TDBText;
    Label14: TLabel;
    Label18: TLabel;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    Label7: TLabel;
    Label22: TLabel;
    DBText1: TDBText;
    Label5: TLabel;
    DBText3: TDBText;
    Label23: TLabel;
    DBText4: TDBText;
    Label4: TLabel;
    DBText2: TDBText;
    Label6: TLabel;
    DBText19: TDBText;
    DBText5: TDBText;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    DBText6: TDBText;
    Label20: TLabel;
    Label21: TLabel;
    Label19: TLabel;
    DBText17: TDBText;
    Label28: TLabel;
    Label29: TLabel;
    Label16: TLabel;
    DBText18: TDBText;
    DBText12: TDBText;
    Label37: TLabel;
    LbTotal: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel8: TPanel;
    BitBtn7: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid2: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    Label38: TLabel;
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
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn7Click(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure ImagemdoLivro1Click(Sender: TObject);
    procedure TabbedNotebook1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
  private
    { Private declarations }
    procedure carregaTd_cert (Tipo:integer);
  public
    { Public declarations }
  end;

  Procedure Ocorrencias;

var
  F_Pesq: TF_Pesq;
  folha,
  livro: String;   //Imagem dos livros

implementation

Uses DMTD, Menu, PesqP, Loc, AndaNot, AndaNotB, U_cgi, Exame, VParc,
  CorBaiE, CorBaiP, FuncGeral, Anotacao, Lavratura, U_GradAverbacoes,
  baixan, BxRet, BxRetPro, U_GridPesqNomeTitulo, U_ImgLivros;

{$R *.DFM}

Procedure TF_Pesq.Carregar(Sender : TOBject);
begin
  Label15.Caption := '';
  Label17.Caption := '';
  Label18.Caption := '';
  Label22.Caption := '';

  Label25.Caption := '';
  Label26.Caption := '';

  Label38.Caption := '';

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

  Label33.Caption := Dm.Td_Cert.FieldByName('a_nome').asString;
  Label31.Caption := Dm.Td_Cert.FieldByName('contato').asString;

  frmAnotacao.RichEdit1.Text := Dm.Td_Cert.FieldByName('anotacao').AsString;

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT livro_b,folha_b,folha_b_f, livro_reg, folha_reg FROM td'); //Imagem dos livros
  Dm.ArqAux.Sql.Add(' WHERE');
  Dm.ArqAux.Sql.Add(' protocolo = ' + QuotedStr(Dm.Td_Cert.FieldByName('protocolo').asString));
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    Label25.Caption := Dm.ArqAux.FieldByName('livro_b').AsString;
    Label26.Caption := Dm.ArqAux.FieldByName('folha_b').AsString + ' a ' + Dm.ArqAux.FieldByName('folha_b_f').AsString;

    livro:= Dm.ArqAux.FieldByName('livro_reg').AsString;
    folha:= Dm.ArqAux.FieldByName('folha_reg').AsString;  //Imagem dos livros
  end;
  Dm.ArqAux.Close;

  { Buscar averbação do registro }
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT averba FROM td'); //Imagem dos livros
  Dm.ArqAux.Sql.Add(' WHERE');
  Dm.ArqAux.Sql.Add(' p_auxiliar = ' + QuotedStr(Dm.Td_Cert.FieldByName('p_auxiliar').asString));
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    Label38.Caption := 'Averba N.' + Dm.ArqAux.FieldByName('averba').AsString;
  end;
  Dm.ArqAux.Close;

end;

procedure TF_Pesq.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    maskedit1.setfocus
  End;
  if key = 27 then
    close;
end;

procedure TF_Pesq.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_Pesq.SpeedButton1Click(F_Pesq);
  IF (F_Menu.Label39.Caption = '34377622000155') or (F_Menu.Label39.Caption = '34.377.622/0001-55') Then //Rtd Juliana
  Begin
    IF Key = VK_F4 tHEN
    Begin
      SpeedButton3.Click;
    End;
  End;
end;

procedure TF_Pesq.BitBtn3Click(Sender: TObject);
begin
  panel2.visible := false;;
  panel1.enabled := true;
  combobox1.setfocus;
  maskedit1.text := '';
end;

procedure TF_Pesq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if panel2.visible then
  begin
    panel2.visible := false;;
    panel1.enabled := true;
    combobox1.text := '';
    maskedit1.text := '';
  end;
end;

procedure TF_Pesq.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27  then
    F_Pesq.BitBtn3Click(F_Pesq);

  if key = 13  then
    F_Pesq.BitBtn4Click(F_Pesq);
                              
  if key = 113 then
    F_Pesq.AndamentoNotificao1Click(F_Pesq);

  if key = 112 then
    F_Pesq.VisualizarParcelasF51Click(F_pesq);
end;

procedure TF_Pesq.BitBtn4Click(Sender: TObject);
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM td_cert');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('protocolo = ' + Dm.Td_Cert.FieldByName('protocolo').asString);

  If Dm.Td_Cert.FieldByName('h').asString = 'A' then
    Dm.ArqAux.Sql.Add(' AND h = ' + QuotedStr(Dm.Td_Cert.FieldByName('h').asString))
  Else
    Dm.ArqAux.Sql.Add(' AND h = ""');

  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    Application.CreateForm(TF_PesqP, F_PesqP);
    F_PesqP.Caption := 'Partes do Título Registrado sob Nº ' + Dm.ArqAux.FieldByName('protocolo').asString;
    F_PesqP.ShowModal;
    F_PesqP.Destroy;
    F_PesqP := NIL;
  end;
  //DBGrid1.SetFocus;
end;

procedure TF_Pesq.BitBtn4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_Pesq.BitBtn3Click(F_Pesq);
end;

procedure TF_Pesq.BitBtn5Click(Sender: TObject);
begin
  if (not Permissao('acesso023')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Loc, F_Loc);
  F_Loc.MaskEdit1.Text := Dm.Td_Cert.FieldByName('registro').asString;
  F_Loc.Label5.Caption := 'sim';
  F_Loc.ShowModal;
  F_Loc.Destroy;
  F_Loc := NIL;
end;

procedure TF_Pesq.SpeedButton1Click(Sender: TObject);
var
  argu, sinal, query, query2, Emissor, Serie, Daje, queryCampos, queryFiltros, queryFiltros2, queryOrderBy, queryCont, queryCont1, queryCont2: String;
  cod: Integer;
  pesqTEmp: string;
begin
  Dm.Td_Cert.RequestLive := False;
  F_Pesq.Label16.caption := '';
  F_Pesq.Label21.caption := '';
  Label29.Visible:= False;
  Label28.Visible:= False;
  pesqTEmp:=Trim(MaskEdit1.Text);
  {if BuscaCGI(maskedit1.text) then
  begin
    Application.CreateForm(TF_Cgi, F_Cgi);
    F_Cgi.Showmodal;
    F_cgi.destroy;
    DM.DBRI.Close;
  end;}

  cod := (StrToInt(Copy(ComboBox1.Text, 1,2)));
  if (not ValidNumero(Copy(ComboBox1.Text, 1,2))) OR
     (cod > 15) OR (cod <= 0) then
  begin
    MessageBox(Handle, PChar('Opção de pesquisa inválida !'), 'ERRO', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    MessageBox(Handle, PChar('Favor optar por uma opção válida !'), 'ERRO', MB_OK + MB_ICONWARNING);
    ComboBox1.SetFocus;
    Exit;
  end;
  if (Trim(MaskEdit1.Text) = '') then
  begin
    MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
    MessageBox(Handle, PChar('Você deve digitar algum dado para realizar a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  LbTotal.Caption:= '0';
  argu := '';
  if (cod = 1) or (cod = 8) then
  begin
    RadioButton1.Checked := True;
    argu := Trim(MaskEdit1.Text);
    
  end
  else
  begin
    if (RadioButton1.Checked) then
      argu := Chr(39) + Trim(MaskEdit1.Text) + Chr(39)
    else if (RadioButton2.Checked) then
      argu := Chr(39) + Trim(MaskEdit1.Text) + '%' + Chr(39)
    else if (RadioButton3.Checked) then
      argu := Chr(39) + '%' + Trim(MaskEdit1.Text) + '%' + Chr(39)
    else if (RadioButton4.Checked) then
      argu := 'Soundex(' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39) + ')'
    else
      argu := Trim(MaskEdit1.Text);
  end;
  if (cod <> 7) then
  begin
    queryCampos := ' select td.nome_ret, sequencia_averbacao, td.natureza, td.tipo_reg, td.h, td.a_nome, ' +
                   ' td_pesso.endereco, td.recibo, td_pesso.registro, td.livro,   ' +
                   ' td.protocolo, td_pesso.p_auxiliar, td.p_auxiliar as auxiliar1, td_pesso.p_auxiliar, td_pesso.p_auxiliar as auxiliar2,   ' +
                   ' tc.tip_doc1, tc.tip_doc2, td_pesso.cep, tc.ext_nat, tc.doc2, tc.averba, tc.data_d, td_pesso.bairro, td_pesso.cidade, td_pesso.estado, '+
                   ' tc.anotacao, tc.data_r, tc.contrato, tc.doc1, tc.situacao, '+
                   ' td_pesso.nome, td.contato, tc.data_p, cad_sit.descricao, tc.situacao, td.status, cad_sit.descricao, data       ';
    query       := ' from td ' +
                   ' right join td_pesso on (td.p_auxiliar = td_pesso.p_auxiliar)  ' +
                   ' left join cad_sit on (td_pesso.situacao = cad_sit.codigo)    ' +
                   ' left join daje on (daje.numero_daje = td.daje) and (daje.serie_daje = td.serie_daje) '+
                   ' left join td_cert tc on((tc.registro = td_pesso.registro) and (tc.doc1 = td_pesso.doc1))'+
                   ' where td_pesso.registro > 0 ';
    query2      := ' from td ' +
                   ' right join td_pesso on (td.p_auxiliar = td_pesso.p_auxiliar) ' +
                   ' left join cad_sit on (td_pesso.situacao = cad_sit.codigo)    ' +
                   ' left join daje on (daje.numero_daje = td.daje) and (daje.serie_daje = td.serie_daje) '+
                   ' left join td_cert tc on((tc.registro = td_pesso.registro) and (tc.doc1 = td_pesso.doc1))'+
                   ' where td_pesso.registro > 0 ';


    queryCont := ' select count(td.recno) as numero';
    queryCont1:= ' from td ' +
                 ' right join td_pesso on (td.p_auxiliar = td_pesso.p_auxiliar)  ' +
                 ' left join cad_sit on (td_pesso.situacao = cad_sit.codigo)    ' +
                 ' left join daje on (daje.numero_daje = td.daje) and (daje.serie_daje = td.serie_daje) '+
                 ' left join td_cert tc on((tc.registro = td_pesso.registro) and (tc.doc1 = td_pesso.doc1))'+
                 ' where td_pesso.registro > 0 ';
    queryCont2:= ' from td ' +
                 ' right join td_pesso on (td.p_auxiliar = td_pesso.p_auxiliar) ' +
                 ' left join cad_sit on (td_pesso.situacao = cad_sit.codigo)    ' +
                 ' left join daje on (daje.numero_daje = td.daje) and (daje.serie_daje = td.serie_daje) '+
                 ' left join td_cert tc on((tc.registro = td_pesso.registro) and (tc.doc1 = td_pesso.doc1))'+
                 ' where td_pesso.registro > 0 ';



    if radiobutton1.Checked then sinal := ' =';
    if radiobutton2.Checked then sinal := ' like';
    if radiobutton3.Checked then sinal := ' like';
    if radiobutton4.Checked then sinal := ' like';

    if (cod = 1) then
    begin
      queryFiltros  := ' and td.recibo = '+ argu ;
      queryFiltros2 := ' and td_pesso.recibo = '+ argu ;
    end
    else if (cod = 2) then
    begin
      queryFiltros  := ' and tc.contrato ' + sinal + argu;
      queryFiltros2 := queryFiltros;
    end
    else if (cod = 3) then
    begin
      queryFiltros  := ' and (td.registro in (' + argu + ') or td_pesso.registro in (' + argu + ') or td.protocolo in ('+ argu +') or td_pesso.p_auxiliar in ('+ argu +'))';
      queryFiltros2 := ' and td_pesso.registro in (' + argu + ') or td_pesso.protocolo in ('+ argu +') or td_pesso.p_auxiliar in ('+ argu +')';
    end
    else if (cod = 8) then
    begin
      queryFiltros  := ' and td.p_auxiliar   = ' + argu;
      queryFiltros2 := ' and td_pesso.p_auxiliar   = ' + argu ;
    end
    else if (cod = 14) then
    begin
      Emissor:= Copy(MaskEdit1.Text, 1,4);
      Serie  := Copy(MaskEdit1.Text, 5,3);
      Daje   := Copy(MaskEdit1.Text, 8,6);
      queryFiltros  := ' and daje.iddaje_tj = ' + QuotedStr(Emissor)+' and daje.serie_daje = '+QuotedStr(Serie)+' and daje.numero_daje = '+QuotedStr(Daje);
      queryFiltros2 := queryFiltros;
    end
    else if (cod = 13) Then
    begin
      if (RadioButton1.Checked) or (RadioButton4.Checked) then
      begin
        queryFiltros  := ' and td.a_nome = '+ argu;
        queryFiltros2 := ' and td_pesso.nome = '+ argu;
      end
      else
      begin
        queryFiltros  := ' and td.a_nome like '+ argu;
        queryFiltros2 := ' and td_pesso.nome like '+ argu;
      end
    end
    else if ((cod = 4) or (cod = 15)) then
    begin
      if (Not(BuscaExataEmTituloRegEProtocolados)) Then
      begin
        if (RadioButton1.Checked) or (RadioButton4.Checked) then
        begin
           queryFiltros  := ' and (td.a_nome '+ sinal+' '+argu +' or td_pesso.nome '+ sinal+' '+argu+')';
           queryFiltros2 := ' and (td.a_nome '+ sinal+' '+argu +' or td_pesso.nome '+ sinal+' '+argu+')';
        end
        else
        begin
           queryFiltros  := ' and (td.a_nome '+ sinal+' '+argu +' or td_pesso.nome '+ sinal+' '+argu+')';
           queryFiltros2 := ' and (td.a_nome '+ sinal+' '+argu +' or td_pesso.nome '+ sinal+' '+argu+')';
        end;
      end
      else
      begin
        if (RadioButton1.Checked) then
        begin
          queryFiltros  := ' and td.a_nome = ' + argu;
          queryFiltros2 := ' and td_pesso.nome = ' + argu;
        end
        else
        begin
          if (RadioButton4.Checked) then
          begin
           queryFiltros  := ' and (td.a_nome '+ sinal+' '+argu +' or td_pesso.nome '+ sinal+' '+argu+')';
           queryFiltros2 := ' and (td.a_nome '+ sinal+' '+argu +' or td_pesso.nome '+ sinal+' '+argu+')';
          end
          else
          Begin
            queryFiltros  := ' and (td.a_nome '+ sinal+' '+argu +' or td_pesso.nome '+ sinal+' '+argu+')';
            queryFiltros2 := ' and (td.a_nome '+ sinal+' '+argu +' or td_pesso.nome '+ sinal+' '+argu+')';
          End
        end;
      end;
    end
    else if (cod = 5) then
    begin
      if (RadioButton1.Checked) then
      begin
        queryFiltros  := ' and td_pesso.doc1 = ' + argu;
        queryFiltros2 := ' and td_pesso.doc1 = ' + argu;
      end
      else
      begin
        queryFiltros  := ' and td_pesso.doc1 like ' + argu;
        queryFiltros2 := ' and td_pesso.doc1 like ' + argu;
      end;
    end
    else if (cod = 6) then
    begin
      if (BuscaExataEmTituloRegEProtocolados) Then
      Begin
        if (RadioButton1.Checked) then
        begin
          queryFiltros  := ' and a_nome = '+ argu;
          queryFiltros2 := ' and td_pesso.nome = ' + argu;
        end
        else
        begin
          queryFiltros  := ' and a_nome like '+ argu;
          queryFiltros2 := ' and td_pesso.nome like ' + argu;
        end;
      end
      else
      begin
        if (RadioButton1.Checked) then
        begin
          queryFiltros  := ' and a_nome = '+ argu;
          queryFiltros2 := ' and td_pesso.nome = '  + argu;
        end
        else
        begin
          queryFiltros  := ' and a_nome like '+ argu;
          queryFiltros2 := ' and td_pesso.nome like '  + argu;
        end;
      end;
    end
    else if (cod = 9) then
    begin
      if (RadioButton1.Checked) then
      begin
        queryFiltros  := ' and contato = '+ argu;
        queryFiltros2 := queryFiltros;
      end
      else
      begin
        queryFiltros  := ' and contato like '+ argu;
        queryFiltros2 := queryFiltros;
      end;
    end
    else if (cod = 11) then
    begin
      queryFiltros  := ' and tc.averba = '+QuotedStr(MaskEdit1.Text);
      queryFiltros2 := queryFiltros;
    end
    else if (cod = 12) then
    begin
      queryFiltros  := ' and (td.registro = ' + QuotedStr(MaskEdit1.Text)+' or td_pesso.registro = ' + QuotedStr(MaskEdit1.Text)+' or tc.registro = ' + QuotedStr(MaskEdit1.Text)+')';
      queryFiltros2 := queryFiltros;
    end
    else if (cod = 10) then
    begin
      queryFiltros  := ' and tc.data_p = ''' + ConvData(MaskEdit1.Text) + ''' ';
      queryFiltros2  := ' and tc.data_p = ''' + ConvData(MaskEdit1.Text) + ''' ';
      Label29.Visible:= True;
      Label28.Visible:= True;
    end;

    if (cod = 15) then
    begin
      queryFiltros    := queryFiltros  + ' and tc.data_p between ' + QuotedStr(FormatDateTime('yyy-mm-dd', dataRegistro.Date)) + ' and ' + QuotedStr(FormatDateTime('yyy-mm-dd', dataRegistro2.Date));
      queryFiltros2   := queryFiltros2 + ' and tc.data_p between ' + QuotedStr(FormatDateTime('yyy-mm-dd', dataRegistro.Date)) + ' and ' + QuotedStr(FormatDateTime('yyy-mm-dd', dataRegistro2.Date));
      Label29.Visible := True;
      Label28.Visible := True;
    end;

    if ChkAgrupaRepresentante.Checked Then
    begin
      queryFiltros  := queryFiltros  + ' group by a_nome ';
      queryFiltros2 := queryFiltros2 + ' group by a_nome ';
    end
    else if (cod = 10) then
    begin
      queryFiltros  := queryFiltros  + ' group by tc.data_p ';
      queryFiltros2 := queryFiltros2 + ' group by tc.data_p ';
    end;

    if (F_Menu.Label39.Caption = '27271464000199') then
      queryOrderBy := ' order by auxiliar1, auxiliar2 asc '
    else
      queryOrderBy := ' order by auxiliar1, auxiliar2 ';

    Dm.Td_Cert.Close;
    Dm.Td_Cert.Sql.Clear;
    Dm.Td_Cert.Sql.Add(queryCampos + query + queryFiltros);
    {Dm.Td_Cert.Sql.Add(' union all');
    Dm.Td_Cert.Sql.Add(queryCampos + query2 + queryFiltros2); }
    Dm.Td_Cert.Sql.Add(queryOrderBy);
    Dm.Td_Cert.SQL.SaveToFile('c:\siscart\pes_reg.txt');

    Dm.Td_Cert.Open;

    if (DM.Td_Cert.RecordCount =0) and
       ((TirarTudo(F_Menu.Label39.Caption, '.', '/', '-') = '15258382000125') OR (TirarTudo(F_Menu.Label39.Caption, '.', '/', '-') = '13250568000102')) and
       (cod = 3)then
    begin
      Query1.Close;
      Query1.Sql.Clear;
      pesqTEmp:=pesqTEmp+'%';
      Query1.Sql.Add('select data_p, nome, p_auxiliar, ext_nat, registro, livro, folha from td_cert where  registro in ('+QuotedStr(pesqTEmp)+')');
      Query1.Open;
      //TabbedNotebook1.Pages[2].TabVisible := false;

      TabbedNotebook1.ActivePage:='Retroativo';
      TabbedNotebook1.visible:=true;
      Panel6.visible:=false;
      Panel5.visible:=false;
      label35.visible:=false;
      label34.visible:=false;
      TabSheet2.visible:=false;
      Panel7.visible:=true;
      panel8.Visible:=true;
    end
    else
     if ((DM.Td_Cert.RecordCount =0) or (DM.Td_Cert.RecordCount=-1)) and
       ((TirarTudo(F_Menu.Label39.Caption, '.', '/', '-') = '15258382000125') OR (TirarTudo(F_Menu.Label39.Caption, '.', '/', '-') = '13250568000102')) and
        (cod = 4) then
     begin
       Query1.Close;
       Query1.Sql.Clear;
       pesqTEmp:='%'+pesqTEmp+'%';
       Query1.Sql.Add('select data_p, nome, p_auxiliar, ext_nat, registro, livro, folha from td_cert where  nome like '+QuotedStr(pesqTEmp)+'');
       Query1.Open;

       TabbedNotebook1.ActivePage:='Retroativo';
       TabbedNotebook1.visible:=true;
       Panel6.visible:=false;
       Panel5.visible:=false;
       label35.visible:=false;
       label34.visible:=false;
       TabSheet2.visible:=false;
       Panel7.visible:=true;
       panel8.Visible:=true;

     end;

    Dm.qryGenerico.Close;
    Dm.qryGenerico.Sql.Clear;
    Dm.qryGenerico.Sql.Add(queryCont + queryCont1 );
    Dm.qryGenerico.Sql.Add( queryFiltros);
    Dm.qryGenerico.Open;
    LbTotal.Caption:= inttostr(strtoint(LbTotal.Caption)+Dm.qryGenerico.FieldByName('numero').AsInteger);
//    Dm.qryGenerico.SQL.SaveToFile('c:\ssCont.txt');
    try
      Dm.qryGenerico.Open;
      Dm.qryGenerico.FieldByName('numero').asstring;
      LbTotal.Caption:= 'Total de registros: '+LbTotal.Caption;
    except
    End;

    if (Dm.Td_Cert.RecordCount = 0 ) and
       ((TirarTudo(F_Menu.Label39.Caption, '.', '/', '-') = '15258382000125') OR (TirarTudo(F_Menu.Label39.Caption, '.', '/', '-') = '13250568000102')) and
       (cod = 3) and (Query1.recordcount <> 0)  then
    begin
      Panel2.Visible := True;
      Panel1.Enabled := False;
    end
    else
      if ((DM.Td_Cert.RecordCount =0) or (DM.Td_Cert.RecordCount=-1))and
         ((TirarTudo(F_Menu.Label39.Caption, '.', '/', '-') = '15258382000125') OR (TirarTudo(F_Menu.Label39.Caption, '.', '/', '-') = '13250568000102')) and
         (cod = 4) then
      begin
        Panel2.Visible := True;
        Panel1.Enabled := False;
      end
    else
    begin
     if Dm.Td_Cert.RecordCount = 0 then
     begin
      Dm.Td_Cert.Close;
      MessageBox(Handle, PChar('Dados não encontrados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
      Exit;
     end else
     begin
       Panel2.Visible := True;
       Panel1.Enabled := False;

       TabbedNotebook1.visible:=true;
       Panel6.visible:=true;
       Panel5.visible:=true;
       label35.visible:=true;
       label34.visible:=true;
       TabSheet2.visible:=true;
       Panel7.visible:=true;
       panel8.Visible:=true;
     end;
    end;

    Label29.Caption:= IntToStr(Dm.Td_Cert.RowsAffected);

    if Dm.Td_Cert.FieldByName('auxiliar1').asString <> '' then
      F_Pesq.Label16.Caption := Dm.Td_Cert.FieldByName('auxiliar1').asString
    else
      F_Pesq.Label16.Caption := Dm.Td_Cert.FieldByName('auxiliar2').asString;
    Dm.Td.RequestLive:= False;
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    if F_Pesq.Label16.Caption <> '' then
      queryFiltros := ' and td.p_auxiliar = ' + Trim(F_Pesq.Label16.Caption);
    queryFiltros := queryFiltros + ' GROUP BY a_nome ';
    Dm.Td.Sql.Add(queryCampos + query + queryFiltros);
    Dm.Td.Sql.Add(' union all');
    Dm.Td.Sql.Add(queryCampos + query2 + queryFiltros2);
    Dm.Td.Open;

    if (Trim(Dm.Td.FieldByName('status').asString) = 'DEVOLVIDO IRREGULAR')OR
       (Trim(Dm.Td.FieldByName('status').asString) = 'DEVOLVIDO PRONTO') THEN
     F_Pesq.Label21.Caption := (Trim(Dm.Td.FieldByName('data_d').asString));
    Dm.Td.RequestLive:= true;
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

    if (Dm.Td_Cert.RecordCount = 0) and ((TirarTudo(F_Menu.Label39.Caption, '.', '/', '-') = '15258382000125')) and
       (cod = 3) and(Query1.recordcount <> 0)   then
    begin
      Panel2.Visible := True;
      Panel1.Enabled := False;
    end else
    begin
      Dm.Td_Cert.Close;
      MessageBox(Handle, PChar('Dados não encontrados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    F_Pesq.Label16.Caption := Dm.Td_Cert.FieldByName('p_auxiliar').asString;
    Dm.Td.RequestLive:= False;
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT td.nome_ret, td.registro, td.p_auxiliar, td.protocolo, td.status, td.data_d, cad_sit.descricao FROM td INNER JOIN td_pesso');
    Dm.Td.Sql.Add('ON (td.p_auxiliar = td_pesso.p_auxiliar) left join cad_sit on (td_pesso.situacao = cad_sit.codigo)');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('p_auxiliar = ' + Trim(F_Pesq.Label16.Caption));

    if ChkAgrupaRepresentante.Checked Then
      Dm.Td.Sql.Add('GROUP BY a_nome');

    Dm.Td.Open;

    if (Trim(Dm.Td.FieldByName('status').asString) = 'DEVOLVIDO IRREGULAR')OR
       (Trim(Dm.Td.FieldByName('status').asString) = 'DEVOLVIDO PRONTO') THEN
     F_Pesq.Label21.Caption := (Trim(Dm.Td.FieldByName('data_d').asString));
    Dm.Td.RequestLive:= False;
  end;
  Dm.Td_Cert.RequestLive := True;

  Panel2.Visible := True;
  Panel1.Enabled := False;
  //DbGrid1.SetFocus;
end;

procedure TF_Pesq.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Pesq.RadioButton1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_Pesq.RadioButton2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_Pesq.RadioButton3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_Pesq.RadioButton4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_Pesq.FormDestroy(Sender: TObject);
begin
  Dm.Td_Cert.Close;
  Dm.Td_Cert.RequestLive := True;
end;

procedure TF_Pesq.AndamentoNotificao1Click(Sender: TObject);
begin
  if (Dm.Td_Cert.FieldByName('registro').asInteger > 0) then
  begin
    if (Dm.Td_Cert.FieldByName('natureza').asInteger = 300)or(Dm.Td_Cert.FieldByName('natureza').asInteger = 196) then
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

procedure TF_Pesq.IncluirIPI1Click(Sender: TObject);
begin

 DM.ipi.close;
 DM.ipi.Sql.Clear;
 DM.ipi.Sql.Add('update acertifi set ipi = ' );

end;

procedure TF_Pesq.VisualizarParcelasF51Click(Sender: TObject);
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
procedure TF_Pesq.CorreodasDatasdeBaixaEfetivaF81Click(Sender: TObject);
begin
  Application.CreateForm(TF_CorBaiE, F_CorBaiE);
  Ocorrencias;
  F_CorBaiE.ShowModal;
  F_CorBaiE.Destroy;
  F_CorBaiE := NIL;
end;

procedure TF_Pesq.CorreodasDatasdeBaixaProvisriaF91Click(Sender: TObject);
begin
  Application.CreateForm(TF_CorBaiP, F_CorBaiP);
  Ocorrencias;
  F_CorBaiP.ShowModal;
  F_CorBaiP.Destroy;
  F_CorBaiP := NIL;
end;

procedure TF_Pesq.BitBtn1Click(Sender: TObject);
begin
  frmAnotacao.ShowModal;
end;

procedure TF_Pesq.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmLavratura, frmLavratura);
  frmLavratura.lblDataProtocolo.Caption := '';
  frmLavratura.lblProtocolo.Caption     := '';
  frmLavratura.MaskEdit1.Text           := '';
  frmLavratura.MaskEdit2.Text           := '';
  frmLavratura.MaskEdit3.Text           := '';
  frmLavratura.MaskEdit4.Text           := '';
  frmLavratura.MaskEdit5.Text           := '';
  frmLavratura.RichEdit1.Text           := '';
  DM.qryLavratura.Close;
  DM.qryLavratura.Sql.Clear;
  DM.qryLavratura.Sql.Add('SELECT * FROM lavratura WHERE ');
  DM.qryLavratura.Sql.Add('data_protocolo = ' + #39 + ConvData(Dm.Td_Cert.FieldByName('data_r').asString) + #39);
  DM.qryLavratura.Sql.Add('AND protocolo = ' + #39 + Dm.Td_Cert.FieldByName('p_auxiliar').asString + #39);
  DM.qryLavratura.Open;
  if DM.qryLavratura.RecordCount <> 0 then
  begin
    frmLavratura.Panel1.Enabled           := False;
    frmLavratura.BitBtn1.Caption          := 'Fechar';
    frmLavratura.lblOperacao.Caption      := 'MOSTRAR';
    frmLavratura.lblDataProtocolo.Caption := Dm.Td_Cert.FieldByName('data_r').asString;
    frmLavratura.lblProtocolo.Caption     := Dm.Td_Cert.FieldByName('p_auxiliar').asString;
    frmLavratura.MaskEdit1.Text           := DM.qryLavratura.FieldByName('data_lavratura').AsString;
    frmLavratura.MaskEdit2.Text           := DM.qryLavratura.FieldByName('livro').AsString;
    frmLavratura.MaskEdit3.Text           := DM.qryLavratura.FieldByName('folha').AsString;
    frmLavratura.MaskEdit4.Text           := DM.qryLavratura.FieldByName('selo').AsString;
    frmLavratura.MaskEdit5.Text           := DM.qryLavratura.FieldByName('termo').AsString;
    frmLavratura.RichEdit1.Text           := DM.qryLavratura.FieldByName('observacao').AsString;
    frmLavratura.ShowModal;
    frmLavratura.Destroy;
    frmLavratura := Nil;
  end;
  DM.qryLavratura.Close;
end;

procedure TF_Pesq.ComboBox1Exit(Sender: TObject);
begin
  if Copy(ComboBox1.Text, 1, 2) = '10' then
  Begin
    MaskEdit1.EditMask := '99/99/9999';
    RadioButton1.Checked:= True;
  End
  else
  Begin
    MaskEdit1.EditMask := '';
    MaskEdit1.Text:= '';
  End;


end;

procedure TF_Pesq.BitBtn6Click(Sender: TObject);
begin
  Application.CreateForm(TF_GradAverbacoes, F_GradAverbacoes);
  F_GradAverbacoes.qryRelatorio.Close;
  F_GradAverbacoes.qryRelatorio.SQL.Clear;
  F_GradAverbacoes.qryRelatorio.SQL.Add('select protocolo , registro, averbacao, data_recepcao, data_baixa, '+
                                        ' cod_natureza, nome_parte, nome_apresentante from historicoregistro Where registro = '+QuotedStr(DM.Td_Cert.FieldByName('averba').AsString)+' order by protocolo , registro, averbacao');
  F_GradAverbacoes.qryRelatorio.Open;
  F_GradAverbacoes.ShowModal;
  F_GradAverbacoes.Destroy;
  F_GradAverbacoes := NIL;
end;

procedure TF_Pesq.FormShow(Sender: TObject);
begin
  ComboBox1.ItemIndex := 0;
  
  folha:= '';
  livro:= '';

  if ModalidadeAverbacaoCapital Then
  Begin                                          
    TabbedNotebook1.PageIndex:= 1;
    //DBGrid3.Columns[9].Visible:= True;
    //DBGrid3.Columns[10].Visible:= False;
  End
  else
  Begin
    TabbedNotebook1.PageIndex:= 0;
    //DBGrid3.Columns[9].Visible:= False;
    //DBGrid3.Columns[10].Visible:= True;
  End;

end;

procedure TF_Pesq.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If dm.td_cert.FieldByName('tipo_reg').AsString = 'Reg.' then // condição
  Begin
    DBGrid1.Canvas.Font.Color:= clWindow;
    DBGrid1.Canvas.Brush.Color:= clGreen;
  End;
  DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[datacol].field, State);
end;

procedure TF_Pesq.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If dm.td_cert.FieldByName('tipo_reg').AsString = 'Reg.' then // condição
  Begin
    DBGrid3.Canvas.Font.Color:= clWindow;
    DBGrid3.Canvas.Brush.Color:= clGreen;
  End;
  DBGrid3.DefaultDrawDataCell(Rect, DBGrid3.columns[datacol].field, State);

end;

Procedure Carrega_Ocorrencias;
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
      if (Assigned(F_BxRet))   then F_BxRet.ComboBox1.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').AsString, 5)    + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').AsString));
      if (Assigned(F_BaixaN))  then F_BaixaN.ComboBox1.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').AsString, 5)   + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').AsString));
      if (Assigned(F_BxRetPro))then F_BxRetPro.ComboBox1.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').AsString, 5) + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').AsString));
      if (Assigned(F_CorBaiE)) then F_CorBaiE.ComboBox4.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').AsString, 5)  + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').AsString));
      if (Assigned(F_CorBaiP)) then F_CorBaiP.ComboBox4.Items.Add(StrZero(Dm.Cad_Ir.FieldByName('codigo').AsString, 5)  + ' - ' + Trim(Dm.Cad_Ir.FieldByName('motivo').AsString));
      Dm.Cad_Ir.Next;
    end;
  end;
  Dm.Cad_Ir.Close;
end;

procedure TF_Pesq.BitBtn7Click(Sender: TObject);
begin
  if (not Permissao('acesso047')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_BaixaN, F_BaixaN);             
  Carrega_Ocorrencias;
  F_BaixaN.ComboBox3.ItemIndex:= 0;
  F_BaixaN.MaskEdit1.Text:= DM.Td.FieldByName('protocolo').AsString;
  F_BaixaN.BringToFront;
  F_BaixaN.Showmodal;
  F_BaixaN.Destroy;
  F_BaixaN := NIL;
end;

procedure TF_Pesq.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    F_Pesq.SpeedButton1Click(F_Pesq);

end;

Procedure Carrega_ParteTDCert(Form : String);
begin
end;


procedure TF_Pesq.SpeedButton3Click(Sender: TObject);
begin 
  Application.CreateForm(TF_GridPesqNomeTitulo, F_GridPesqNomeTitulo);
  F_GridPesqNomeTitulo.BringToFront;
  F_GridPesqNomeTitulo.MaskEdit1.SetFocus;
  F_GridPesqNomeTitulo.Showmodal;
  F_GridPesqNomeTitulo.Destroy;

end;

procedure TF_Pesq.ComboBox1Change(Sender: TObject);
var
  cod: Integer;
begin
  cod := (StrToInt(Copy(ComboBox1.Text, 1,2)));
  if (F_Menu.Label39.Caption = '34377622000155') or (F_Menu.Label39.Caption = '34.377.622/0001-55') Then //Rtd Juliana
  begin
    if (cod = 13) or (cod = 4) or (cod = 9) then
      SpeedButton3.Visible:= True
    else
      SpeedButton3.Visible:= False;
  end;
  if (cod = 15) then
  begin
    lbDataDeReceb.Visible := True;
    dataRegistro.Visible  := True;
    dataRegistro2.Visible := True;
    lbA.Visible           := True;
  end
  else
  begin
    lbDataDeReceb.Visible := True;
    dataRegistro.Visible  := True;
    dataRegistro2.Visible := True;
    lbA.Visible           := True;
  end;
end;

procedure TF_Pesq.BitBtn8Click(Sender: TObject);
begin
  Application.CreateForm(TF_ImgLivros, F_ImgLivros);
  F_ImgLivros.Label1.Caption:= 'Matrícula';
  F_ImgLivros.MaskEdit2.Text:= Dm.Td_Cert.FieldByName('registro').AsString;
  F_ImgLivros.ComboBox1.Text:= Label25.Caption;//Dm.Td_Cert.FieldByName('livro').AsString;
  {Dm.qryGenerico.Close;
  Dm.qryGenerico.SQL.Clear;
  Dm.qryGenerico.SQL.Add('select tc.registro as matric, nome, tip_doc1, doc1, descricao as situacao, td.data_p from td_cert tc ');
  Dm.qryGenerico.SQL.Add(' join cad_sit st on (tc.situacao = st.codigo) ');
  Dm.qryGenerico.SQL.Add(' join td on (td.registro = tc.registro) ');
  Dm.qryGenerico.SQL.Add('where td.registro = '+QuotedStr(Dm.Td_Cert.FieldByName('registro').AsString)+'');
  Dm.qryGenerico.Open;  }
  Dm.qryGenerico.Close;
  Dm.qryGenerico.SQL.Clear;
  Dm.qryGenerico.SQL.Add(' select td_cert.livro, livro.folha from livro ');
  Dm.qryGenerico.SQL.Add(' join td_cert on (livro.ordem = td_cert.registro) ');
  Dm.qryGenerico.SQL.Add('where td_cert.registro = '+QuotedStr(Dm.Td_Cert.FieldByName('registro').AsString)+'');
  Dm.qryGenerico.Open;

  F_ImgLivros.sLivro        := Dm.Td_Cert.FieldByName('livro').AsString;
  F_ImgLivros.MaskEdit1.Text:= Dm.qryGenerico.FieldByName('folha').AsString;
  F_ImgLivros.BitBtn1.OnClick(Nil);
  F_ImgLivros.ShowModal;
  F_ImgLivros.Destroy;
  F_ImgLivros := Nil;
end;

procedure TF_Pesq.ImagemdoLivro1Click(Sender: TObject);
begin
  Application.CreateForm(TF_ImgLivros, F_ImgLivros);
  F_ImgLivros.Label1.Caption:= 'Matrícula';
  F_ImgLivros.MaskEdit2.Text:= Dm.Td_Cert.FieldByName('registro').AsString;

  Dm.qryGenerico.Close;
  Dm.qryGenerico.SQL.Clear;
  Dm.qryGenerico.SQL.Add(' select td_cert.livro, livro.folha, livro.tipo from livro ');
  Dm.qryGenerico.SQL.Add(' join td_cert on (livro.ordem = td_cert.registro) ');
  Dm.qryGenerico.SQL.Add('where td_cert.registro = '+QuotedStr(Dm.Td_Cert.FieldByName('registro').AsString));
  Dm.qryGenerico.Open;

  F_ImgLivros.ComboBox1.Clear;
  F_ImgLivros.ComboBox1.Items.Add(Dm.qryGenerico.FieldByName('tipo').AsString);
  F_ImgLivros.ComboBox1.ItemIndex := 0;
  F_ImgLivros.sLivro         := Dm.Td_Cert.FieldByName('livro').AsString;
  F_ImgLivros.MaskEdit1.Text := Dm.qryGenerico.FieldByName('folha').AsString;
  F_ImgLivros.BitBtn1.OnClick(Nil);
  F_ImgLivros.ShowModal;
  F_ImgLivros.Destroy;
  F_ImgLivros := Nil;
end;

procedure TF_Pesq.TabbedNotebook1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  if NewTab = 2 then
  begin
    Panel6.visible:=false;
    Panel5.visible:=false;
    label35.visible:=false;
    label34.visible:=false;
    TabSheet2.visible:=false;
    PageControl1.visible:=false;
  end
  else
  begin
    Panel6.visible:=true;
    Panel5.visible:=true;
    label35.visible:=true;
    label34.visible:=true;
    TabSheet2.visible:=true;
    PageControl1.visible:=true;

  end
end;

procedure TF_Pesq.carregaTd_cert(Tipo: integer);
begin

end;

end.





