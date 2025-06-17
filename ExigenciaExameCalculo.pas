unit ExigenciaExameCalculo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NcsAlignment, StdCtrls, ComCtrls, Buttons, DBCtrls, Grids, DBGrids,
  Tabnotbk, Mask, ExtCtrls, Printers, FileCtrl, AxCtrls, OleCtrls,
  ImgeditLibCtl_TLB, WPDefs, WPPrint, WpWinCtr, WPRich, WPTbar, WPPanel,
  DbOleCtl, WPRuler, WPPrvFrm, WPObj, jpeg;
  {Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, WPRuler, WPRich, WPTbar, Buttons, WPDefs,
  WPPanel, WPPrint, WpWinCtr, Grids, DBGrids, ComCtrls, Tabnotbk; }

type
  TF_ExigenciaExameCalculo = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    Label3: TLabel;
    Label7: TLabel;
    Bevel7: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Bevel9: TBevel;
    Label11: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Bevel5: TBevel;
    btnIncluirExigencias: TBitBtn;
    ListBox1: TListBox;
    DBGrid1: TDBGrid;
    WPRichText1: TWPRichText;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ListBox2: TListBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Bevel6: TBevel;
    Bevel8: TBevel;
    WPRichText5: TWPRichText;
    btnImprimir: TBitBtn;
    WPToolPanel1: TWPToolPanel;
    spAssinatura: TSpeedButton;
    WPToolBar1: TWPToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    WPRichText2: TWPRichText;
    btnCorrigir: TBitBtn;
    btnRetornar: TBitBtn;
    btnAvancar: TBitBtn;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    WPRichText3: TWPRichText;
    WPRichText4: TWPRichText;
    WPRuler1: TWPRuler;
    WPVertRuler1: TWPVertRuler;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    btnPesquisar: TBitBtn;
    btnOutro: TBitBtn;
    btnFechar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnIncluirExigenciasClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCorrigirClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnOutroClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    procedure Grava_Exige;
    { Private declarations }
  public
    { Public declarations }
    procedure Carrega_Modelos(pesquisa: Boolean);
    procedure Conta_Exige;
    procedure Carrega_Exige;
    procedure pesquisaProtocolo;
  end;

var
  F_ExigenciaExameCalculo: TF_ExigenciaExameCalculo;
  quantidade: integer;
  solicitante: String;

implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_ExigenciaExameCalculo.FormActivate(Sender: TObject);
begin
  Label13.Caption := '';
  Label14.Caption := '';
  Label15.Caption := '';
  Label16.Caption := '';
  Label30.Caption := '';
  Label32.Caption := '';
  MaskEdit2.Text  := DateToStr(date);
  TabbedNoteBook1.ActivePage := 'Preparação';
  TabbedNoteBook1.Enabled    := False;
  Carrega_Modelos(true);
  pesquisaProtocolo;
end;

Procedure TF_ExigenciaExameCalculo.Carrega_Modelos(pesquisa: Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.Mod_Exig.Close;
    Dm.Mod_Exig.Sql.Clear;
    Dm.Mod_Exig.Sql.Add('SELECT * FROM mod_exig where tipo = '+QuotedStr('Exigência')+'');
    Dm.Mod_Exig.Sql.Add('ORDER BY descricao');
    Dm.Mod_Exig.Open;
  end;
  if (Dm.Mod_Exig.FieldByName('cod').asInteger <> 0) then
  begin
    WpRichText1.Clear;
    WpRichText1.LoadFromFile(F_Menu.Label16.Caption + StrZero(Dm.Mod_Exig.FieldByName('cod').asString, 7) + '.RTF');
    WpRichText1.Refresh;
    WpRichText1.MovePosition(WpmHome, False);
  end;
end;

procedure TF_ExigenciaExameCalculo.btnPesquisarClick(Sender: TObject);
begin
  pesquisaProtocolo;
end;

procedure TF_ExigenciaExameCalculo.pesquisaProtocolo;
begin
  if (not ValidNumero(MaskEdit1.Text)) OR (Trim(MaskEdit1.Text) = '0') then
  begin
    ShowMessage('Protocolo inválido !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  if (not ValidData(MaskEdit2.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit2.SetFocus;
    Exit;
  end; 
  Dm.Td_Cert.Close;
  Dm.Td_Cert.Sql.Clear;
  Dm.Td_Cert.Sql.Add('SELECT * FROM td_exame_calculo where');
  Dm.Td_Cert.Sql.Add('protocolo = ' + Trim(MaskEdit1.Text));
  Dm.Td_Cert.Open;
  if (Dm.Td_Cert.RecordCount = 0) then
  begin
    Dm.Td_Cert.Close;
    ShowMessage('Protocolo Auxiliar não encontrado !');
    //MaskEdit1.SetFocus;
    Exit;
  end;
  if (Dm.Td_Cert.FieldByName('statusBaixa').asString <> 'IRREGULAR') then
  begin
    Dm.Td_Cert.Close;
    ShowMessage('Este título não está em situação de IRREGULAR. ');
    //MaskEdit1.SetFocus;
    Exit;
  end;
  quantidade      := 0;
  Label11.Caption := '';
  btnIncluirExigencias.Enabled := True;
  Label13.Caption := Dm.Td_Cert.fieldbyname('protocolo').asString;
  Label14.Caption := Dm.Td_Cert.FieldByName('data_lancamento').asString;  //data_r
  Label15.Caption := Dm.Td_Cert.FieldByName('statusBaixa').asString;
  Label30.Caption := Dm.Td_Cert.FieldByName('natureza').asString;
  Label32.Caption := Dm.Td_Cert.FieldByName('nome').asString;
  //Label19.Caption := Dm.Td_Cert.FieldByName('contato').asString;
  Label21.Caption := Dm.Td_Cert.FieldByName('protocolo').asString; // recibo
  Label11.Caption := Dm.Td_Cert.FieldByName('nome').asString;
  solicitante := Dm.Td_Cert.FieldByName('nome_solicitante').asString;
  Dm.Td_Cert.Close;

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('select nome from td_pesso where p_auxiliar = ' + Label13.Caption);
  Dm.ArqAux.Open;
  Dm.ArqAux.Close;
  Conta_Exige;
end;

Procedure TF_ExigenciaExameCalculo.Grava_Exige;
var
  via, arq, sub : string;
begin
  if (StrToInt(Label33.Caption) = 0) then Label33.Caption := '1';
  arq := 'E' + Trim(MaskEdit1.Text) + '_' + Trim(Label33.Caption) + '.RTF';
  sub := DefSub(Trim(MaskEdit1.Text));
  if (not DirectoryExists(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub)) then
  begin
    ForceDirectories(F_Menu.Label18.Caption + sub);
    if (not DirectoryExists(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub)) then                   //F_Menu.Label18.Caption
    begin
      ShowMessage('Não foi possível criar ' + Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub);
      Exit;
    end;
    WpRichText2.SaveToFile(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub + '\' + arq);
  end
  else WpRichText2.SaveToFile(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub + '\' + arq);
end;


Procedure TF_ExigenciaExameCalculo.Carrega_Exige;
begin
  WpRichText2.ReadOnly := False;
  WpRichText2.Clear;
  WpRichText2.LoadFromFile(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + 'MODELO.RTF');
  WpRichText2.Refresh;
  WpRichText2.Find('<dataexig>', False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<dataexig>', MaskEdit2.Text);
  end;

  WpRichText2.Find('<pauxiliar>', False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<pauxiliar>', Trim(StrZero(MaskEdit1.Text, 8)));
  end;
  WpRichText2.Find('<data>', False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<data>', Label14.Caption);
  end;
  WpRichText2.Find('<natureza>', False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<natureza>', Label30.Caption);
  end;
  WpRichText2.Find('<apresentante>', False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<apresentante>', solicitante);
  end;
  WpRichText2.Find('<nome_parte>', False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<nome_parte>', Label11.Caption);
  end;
  WpRichText2.Find('<assinante>', False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<assinante>', ComboBox1.Text);
  end;
  WpRichText2.Find('<cargo>', False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<cargo>', ComboBox2.Text);
  end;
  WpRichText2.Find('<razaosocial>', False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<razaosocial>', Label32.Caption);
  end;
  WpRichText2.Find('<numerodeexigencia>', False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<numerodeexigencia>', Label21.Caption);
  end;              

  WpRichText2.Refresh;
  spAssinatura.Click;
 // WpRichText2.MovePosition(WpmEnd, False);
end;

Procedure TF_ExigenciaExameCalculo.Conta_Exige;
var
  x, contador   : integer;
  via, arq, sub : string;
begin
 { checando se existe exigência }
  contador := 0;
  arq      := 'E' + Trim(MaskEdit1.Text) + '_1' + '.RTF';
  via      := Copy(arq, length(arq) - 4,1);
  sub      := DefSub(Trim(MaskEdit1.Text));
  for x := 1 to 9 do
  begin
    via := IntToStr(x);
    arq := Copy(arq,1, Length(arq) - 6) + '_' + via + '.RTF';
    if FileExists(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub + '\' + arq) then contador := contador + 1;
  end;
  Label35.Caption := IntToStr(contador);
  if contador > 0 then
  begin
    Label33.Caption := IntToStr(contador);
    arq := Copy(arq,1, Length(arq) - 6) + '_' + IntToStr(contador) + '.RTF';
    WpRichText2.Clear;
    WpRichText2.LoadFromFile(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub + '\' + arq);
    TabbedNoteBook1.Enabled := True;
    TabbedNotebook1.ActivePage := 'Exigência';
  end
  else
  begin
    Label33.Caption := '0';
    Carrega_Exige;
    TabbedNoteBook1.Enabled := True;
  end;
  WpRichText2.Refresh;
end;

procedure TF_ExigenciaExameCalculo.btnIncluirExigenciasClick(Sender: TObject);
var
  item : String;
begin
  quantidade := quantidade + 1;
  item := '00' + inttostr(quantidade);
  item := copy(item,length(item) - 1, 2);
  WpRichText1.SelectAll;
  WpRichText1.CopyToClipboard;
  WpRichText2.ReadOnly := False;
  WpRichText2.InputLines(2);
  WpRichText2.PasteFromClipboard;
  WpRichText2.ReadOnly := True;
  ListBox1.Items.Add(item + '.' + Copy(Dm.Mod_Exig.FieldByName('descricao').asString,1,30));
end;

procedure TF_ExigenciaExameCalculo.btnRetornarClick(Sender: TObject);
var
  arq, via, sub : String;
begin
  if (StrToInt(Label33.Caption) > 1) then
  begin
    via := IntToStr(StrToInt(Label33.Caption) - 1);
  end
  else via := '1';
  if (StrToInt(via) <= StrToInt(Label35.Caption)) then
  begin
    Label33.Caption := via;
    arq := 'E' + Trim(MaskEdit1.Text) + '_' + via + '.RTF';
    sub := DefSub(Trim(MaskEdit1.Text));
    WpRichText2.Clear;
    WpRichText2.LoadFromFile(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub + '\' + arq);
  end
  else ShowMessage('Não há mais Exigências.');
  WpRichText2.Refresh;
end;

procedure TF_ExigenciaExameCalculo.btnImprimirClick(Sender: TObject);
var
  x, y : Integer;
  copias : String;
begin
  if (StrToInt(Label33.Caption) < 1) then
  begin
    ShowMessage('É necesserário gravar a nota.');
    ShowMessage('Caso a nota já esteja preenchida, favor clicar em correção, caso não clicar em inclusão.');
    Exit; 
  end;
  copias := InputBox('Impressão Exigência', 'Informe o nº de cópias : ', '2');
  WpRichText2.Zooming                       := 100;
  if (WpRichText2.PrinterSetup) then
  begin
    if (not ValidNumero(copias)) then copias := '1';
    WpRichText2.PrintParameter.NumberOfCopies := StrToInt(copias);
    WpRichText2.Print;
  end;
  WpRichText2.Zooming := 80;
  WpRichText2.MovePosition(WpmHome, False);
end;

procedure TF_ExigenciaExameCalculo.btnCorrigirClick(Sender: TObject);
begin
  if (btnCorrigir.Caption = '&Corrigir') then
  begin
    btnCorrigir.Caption  := '&Gravar';
    btnIncluir.Enabled   := False;
    btnExcluir.Enabled   := False;
    btnAvancar.Enabled   := False;
    btnRetornar.Enabled  := False;
    btnImprimir.Enabled  := False;
    WpRichText2.ReadOnly := False;
    WpRichText2.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Gravar exigência ?'), 'EXIGÊNCIA', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin
      Grava_Exige;
    end;
    Conta_Exige;
    btnCorrigir.Caption := '&Corrigir';
    btnIncluir.Enabled := True;
    btnExcluir.Enabled := True;
    btnAvancar.Enabled  := True;
    btnRetornar.Enabled  := True;
    btnImprimir.Enabled  := True;
  end;
end;

procedure TF_ExigenciaExameCalculo.btnAvancarClick(Sender: TObject);
var
  arq, via, sub : String;
begin
  via := IntToStr(StrToInt(Label33.Caption) + 1);
  if (StrToInt(via) <= StrToInt(Label35.Caption)) then
  begin
    Label33.Caption := via;
    arq := 'E' + Trim(MaskEdit1.Text) + '_' + via + '.RTF';
    sub := DefSub(Trim(MaskEdit1.Text));
    WpRichText2.Clear;
    WpRichText2.LoadFromFile(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub + '\' + arq);
  end
  else ShowMessage('Não há mais Exigências.');
  WpRichText2.Refresh;
end;

procedure TF_ExigenciaExameCalculo.btnIncluirClick(Sender: TObject);
begin
  if (btnIncluir.Caption = '&Incluir') then
  begin
    Label33.Caption  := IntToStr(StrToInt(Label35.Caption) + 1);
    btnIncluir.Caption := '&Gravar';
    btnExcluir.Enabled := False;
    btnCorrigir.Enabled  := False;
    btnAvancar.Enabled  := False;
    btnRetornar.Enabled  := False;
    btnImprimir.Enabled  := False;
    Carrega_Exige;
    WpRichText2.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Gravar exigência ?'), 'EXIGÊNCIA', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin
      Grava_Exige;
    end;
    Conta_Exige;
    btnIncluir.Caption := '&Incluir';
    btnExcluir.Enabled := True;
    btnCorrigir.Enabled  := True;
    btnAvancar.Enabled  := True;
    btnRetornar.Enabled  := True;
    btnImprimir.Enabled  := True;
  end;
end;

procedure TF_ExigenciaExameCalculo.btnExcluirClick(Sender: TObject);
var
  arq, sub : String;
  x, y : Integer;
begin
  arq := 'E' + Trim(MaskEdit1.Text) + '_' + Label33.Caption + '.RTF';
  sub := DefSub(Trim(MaskEdit1.Text));
  if (MessageBox(Handle, PChar('Confirma exclusão da nota ' + arq), 'EXCLUSÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
  begin
    DeleteFile(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub + '\' + arq);
    y := 0;
    for x := 1 to 9 do
    begin
      arq := '';
      arq := 'E' + Trim(MaskEdit1.Text) + '_' + IntToStr(x) + '.RTF';
      if (FileExists(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub + '\' + arq)) then
      begin
        y := y + 1;
        WpRichText5.Clear;
        WpRichText5.LoadFromFile(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub + '\' + arq);
        WpRichText5.Refresh;
        DeleteFile(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub + '\' + arq);        
        arq := '';
        arq := 'E' + Trim(MaskEdit1.Text) + '_' + IntToStr(y) + '.RTF';
        WpRichText5.SaveToFile(Dm.Configur.FieldByName('dir_exig_examecalculo').asString + sub + '\' + arq);
      end;
    end;
    Conta_Exige;
  end;
end;

procedure TF_ExigenciaExameCalculo.btnOutroClick(Sender: TObject);
begin
  Label13.Caption := '';
  Label14.Caption := '';
  Label15.Caption := '';
  Label30.Caption := '';
  Label32.Caption := '';
  MaskEdit1.Clear;
  TabbedNotebook1.ActivePage := 'Preparação';
  WpRichText1.Clear;
  WpRichText2.Clear;
  WpRichText3.Clear;
  WpRichText4.Clear;
  MaskEdit1.SetFocus;
  ListBox1.Clear;
end;

procedure TF_ExigenciaExameCalculo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TF_ExigenciaExameCalculo.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

procedure TF_ExigenciaExameCalculo.MaskEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_ExigenciaExameCalculo.MaskEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then btnPesquisar.SetFocus;
end;

procedure TF_ExigenciaExameCalculo.FormCreate(Sender: TObject);
begin
  Dm.Configur.open;
end;

end.
