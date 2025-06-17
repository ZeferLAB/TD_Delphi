unit Exigenc2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NcsAlignment, StdCtrls, ComCtrls, Buttons, DBCtrls, Grids, DBGrids,
  Tabnotbk, Mask, ExtCtrls, Printers, FileCtrl, AxCtrls, OleCtrls,
  ImgeditLibCtl_TLB, WPDefs, WPPrint, WpWinCtr, WPRich, WPTbar, WPPanel,
  DbOleCtl, WPRuler, WPPrvFrm, WPObj, jpeg;

type
  TF_Exige2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    TabbedNotebook1: TTabbedNotebook;
    Label3: TLabel;
    Label7: TLabel;
    BitBtn4: TBitBtn;
    ListBox1: TListBox;
    BitBtn8: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    Bevel7: TBevel;
    WPRichText1: TWPRichText;
    WPToolPanel1: TWPToolPanel;
    WPToolBar1: TWPToolBar;
    WPRichText2: TWPRichText;
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
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Edit1: TEdit;
    Bevel6: TBevel;
    Bevel8: TBevel;
    Label36: TLabel;
    WPRichText3: TWPRichText;
    WPRichText4: TWPRichText;
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    WPRuler1: TWPRuler;
    WPVertRuler1: TWPVertRuler;
    WPPreviewDlg1: TWPPreviewDlg;
    SpeedButton2: TSpeedButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label17: TLabel;
    Label18: TLabel;
    Bevel9: TBevel;
    SpeedButton4: TSpeedButton;
    WPRichText5: TWPRichText;
    ControlBar1: TControlBar;
    Label9: TLabel;
    Label11: TLabel;
    spAssinatura: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    ListBox2: TListBox;
    Label22: TLabel;
    Bevel5: TBevel;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure MaskEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure spAssinaturaClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    Procedure Carrega_Modelos(Sender : TOBject; Pesquisa : Boolean);
    Procedure Conta_Exige(Sender : TOBject);
    Procedure Carrega_Exige(Sender : TObject);
    Procedure Grava_Exige(Sender : TOBject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    procedure AtualizaMacrosAssinantesECargo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Exige2: TF_Exige2;
  qq : Integer;

implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Exige2.Grava_Exige(Sender : TOBject);
var
  via, arq, sub : string;
begin
  if (StrToInt(Label33.Caption) = 0) then Label33.Caption := '1';
  arq := 'E' + Trim(MaskEdit1.Text) + '_' + Trim(Label33.Caption) + '.RTF';
  sub := DefSub(Trim(MaskEdit1.Text));
  if (not DirectoryExists(F_Menu.Label18.Caption + sub)) then
  begin
    ForceDirectories(F_Menu.Label18.Caption + sub);
    if (not DirectoryExists(F_Menu.Label18.Caption + sub)) then
    begin
      ShowMessage('Não foi possível criar ' + F_Menu.Label18.Caption + sub);
      Exit;
    end;
    WpRichText2.SaveToFile(F_Menu.Label18.Caption + sub + '\' + arq);
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('update td set data_irr = ' + QuotedStr(ConvData(MaskEdit2.Text)) + ' where p_auxiliar = ' + MaskEdit1.Text);
    try
      DM.ArqAux.ExecSql;
    Except
      ShowMessage('Falha ao gravar a baixa da nota devolutiva.');
    End;
  end
  else
  Begin
    WpRichText2.SaveToFile(F_Menu.Label18.Caption + sub + '\' + arq);
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('update td set data_irr = ' + QuotedStr(ConvData(MaskEdit2.Text)) + ' where p_auxiliar = ' + MaskEdit1.Text);
    try
      DM.ArqAux.ExecSql;
    Except
      ShowMessage('Falha ao gravar a baixa da nota devolutiva.');
    End;
  End;
end;

Procedure TF_Exige2.Carrega_Exige(Sender : TObject);
begin
  WpRichText2.ReadOnly := False;
  WpRichText2.Clear;
  WpRichText2.LoadFromFile(F_Menu.Label18.Caption + 'MODELO.RTF');
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
    WpRichText2.Finder.ReplaceAll('<apresentante>', Label19.Caption);
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
  WpRichText2.Find('<nomelogado>', False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<nomelogado>', F_Menu.Label25.Caption);
  end;
  WpRichText2.Refresh;
  spAssinatura.Click;
 // WpRichText2.MovePosition(WpmEnd, False);
end;

Procedure TF_Exige2.Carrega_Modelos(Sender : TOBject; Pesquisa : Boolean);
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

Procedure TF_Exige2.Conta_Exige(Sender : TOBject);
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
    if FileExists(F_Menu.Label18.Caption + sub + '\' + arq) then contador := contador + 1;
  end;
  Label35.Caption := IntToStr(contador);
  if contador > 0 then
  begin
    Label33.Caption := IntToStr(contador);
    arq := Copy(arq,1, Length(arq) - 6) + '_' + IntToStr(contador) + '.RTF';
    WpRichText2.Clear;
    WpRichText2.LoadFromFile(F_Menu.Label18.Caption + sub + '\' + arq);
    TabbedNoteBook1.Enabled := True;
    TabbedNotebook1.ActivePage := 'Exigência';
  end
  else
  begin
    Label33.Caption := '0';
    Carrega_Exige(F_Exige2);
    TabbedNoteBook1.Enabled := True;
    //if (TabbedNoteBook1.ActivePage = 'Preparação') then
   //   DbGrid1.SetFocus;
  end;
  WpRichText2.Refresh;
end;

procedure TF_Exige2.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Exige2.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Bitbtn1.SetFocus;
end;

procedure TF_Exige2.BitBtn1Click(Sender: TObject);
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
  Dm.Td.Close;
  Dm.Td.Sql.Clear;
  Dm.Td.Sql.Add('SELECT * FROM td');
  Dm.Td.Sql.Add('WHERE');
  Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
  Dm.Td.Open;
  if (Dm.Td.RecordCount = 0) then
  begin
    Dm.Td.Close;
    ShowMessage('Protocolo Auxiliar não encontrado !');
    //MaskEdit1.SetFocus;
    Exit;
  end;
  {if (Dm.Td.FieldByName('status').asString <> 'IRREGULAR') AND
     (Dm.Td.FieldByName('status').asString <> 'DEVOLVIDO IRREGULAR')  then
  begin
    Dm.Td.Close;
    ShowMessage('Este título não está em situação de IRREGULAR ou DEVOLVIDO IRREGULAR. ');
    //MaskEdit1.SetFocus;
    Exit;
  end;}
  qq              := 0;
  Label11.Caption := '';
  BitBtn4.Enabled := True;
  Label13.Caption := Dm.Td.fieldbyname('p_auxiliar').asString;
  Label14.Caption := Dm.Td.FieldByName('data_r').asString;
  Label15.Caption := Dm.Td.FieldByName('status').asString;
  Label30.Caption := Dm.Td.FieldByName('ext_nat').asString;
  Label32.Caption := Dm.Td.FieldByName('a_nome').asString;
  Label19.Caption := Dm.Td.FieldByName('contato').asString;
  Label21.Caption := Dm.Td.FieldByName('recibo').asString;
  Label11.Caption := Dm.Td.FieldByName('a_nome').asString;
  Dm.Td.Close;

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('select nome from td_pesso where p_auxiliar = ' + Label13.Caption);
  Dm.ArqAux.Open;
  //If Dm.ArqAux.RecordCount <> 0 then
    //Label11.Caption := Dm.ArqAux.FieldByname('nome').AsString;
  Dm.ArqAux.Close;
  Conta_Exige(F_Exige2);
end;

procedure TF_Exige2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Bitbtn4.setfocus;
end;

procedure TF_Exige2.BitBtn4Click(Sender: TObject);
var
  item : String;
begin
  qq   := qq + 1;
  item := '00' + inttostr(qq);
  item := copy(item,length(item) - 1, 2);
  WpRichText1.SelectAll;
  WpRichText1.CopyToClipboard;
  WpRichText2.ReadOnly := False;
  WpRichText2.InputLines(2);
  WpRichText2.PasteFromClipboard;
  WpRichText2.ReadOnly := True;
  ListBox1.Items.Add(item + '.' + Copy(Dm.Mod_Exig.FieldByName('descricao').asString,1,30));
  //ShowMessage('Ítem Incluído na Exigência');
end;                       

procedure TF_Exige2.BitBtn6Click(Sender: TObject);
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
    WpRichText2.LoadFromFile(F_Menu.Label18.Caption + sub + '\' + arq);
  end
  else ShowMessage('Não há mais Exigências.');
  WpRichText2.Refresh;  
end;

procedure TF_Exige2.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if key = 13 then combobox2.setfocus;
end;

procedure TF_Exige2.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if key = 13 then bitbtn5.setfocus;
end;

{procedure TF_Extrat.BitBtn9Click(Sender: TObject);
var
  x : Integer;
begin
  NcsAlignment1.Width := 60;
  RichEdit2.Clear;
  for x := 0 to RichEdit1.Lines.Count do
  Begin
    Edit1.Text := RichEdit1.Lines.Strings[x];
    if (pos(Copy(Edit1.Text, length(edit1.text), 1), '.:') = 0) and (length(edit1.Text) > (60/2)) then
    Begin
      NcsAlignment1.Text := Edit1.Text;
      Edit2.text := NcsAlignment1.Result;
    end
    else
    begin
      Edit2.Text := Edit1.Text;
    end;
    RichEdit2.Lines.Add(Edit2.Text);
  end;
  RichEdit1.Clear;
  for x := 0 to RichEdit2.Lines.Count do RichEdit1.Lines.Add(RichEdit2.Lines.strings[x]);
end;}

procedure TF_Exige2.BitBtn7Click(Sender: TObject);
var
  via : String;
  sair : boolean;
begin
{  arq := F_Exige2.Edit1.text;
  Funcoes.Abre_ConfigClick(Funcoes);
  dir := tabela.configur.fieldbyname('dir_exig').asString;
  Funcoes.Fecha_ConfigClick(Funcoes);
  if nova then arq := 'E' + MaskEdit1.Text + '_1' + '.rtf';
  if StrToInt(MaskEdit1.Text) < 1000 then sub := '0000' + '\' else
  Begin
    sub := MaskEdit1.text;
    sub := '0000' + Copy(sub,1,length(sub) - 2);
    sub := Copy(sub,length(sub) - 3,4) + '\';
  end;
  if not DirectoryExists(dir + sub) then
  begin
    ForceDirectories(dir + sub);
    if not DirectoryExists(dir + sub) then
    begin
      showmessage('Não foi possível criar ' + dir + sub);
      Bitbtn7.setfocus;
      Exit;
    end;
  end;
  if not FileExists(dir + sub + arq) then
  Begin
    if MessageDlg('Gravar Exigência em ' + dir + sub + arq + ' ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      F_Exige2.WPRichText2.SaveToFile(dir + sub + arq);
      if FileExists(dir + sub + arq) then Showmessage('Exigência gravada com Sucesso') else
      begin
        ShowMessage('Não foi possível gravar a Exigência em ' + dir + sub + arq);
        bitbtn7.setfocus;
      end;
    end
    else F_Exige2.Bitbtn7.setfocus;
  end
  else
  begin
    if (nova) or (inclu_ext) then
    begin
      sair := False;
      while not sair do
      begin
        via := copy(arq,length(arq) - 4,1);
        if strtoint(via) = 9 then
        Begin
          showmessage('Limite máximo de exigências por título são 9. Não foi possível gravar o exigência corrente.');
          sair := True;
          Exit;
        end;
        via := IntToStr(StrToInt(via) + 1);
        arq := copy(arq,1,length(arq) - 6) + '_' + via + '.rtf';
        if not fileexists(dir + sub + arq) then sair := True;
      end;
      if messagedlg('Salvar a Exigência ?', mtconfirmation, [MbYes, MbNo], 0) = MrYes then
      begin
        F_Exige2.WPRichText2.SaveToFile(dir + sub + arq);
        if FileExists(dir + sub + arq) then Showmessage('Exigência gravada com Sucesso') else
        begin
          ShowMessage('Não foi possível gravar a Exigência em ' + dir + sub + arq);
          bitbtn7.setfocus;
        end;
      end;
    end
    else
    begin
      if MessageDlg('Sobrepor a Exigência ' + dir + sub + arq + ' ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        F_Exige2.WPRichText2.SaveToFile(dir + sub + arq);
        if FileExists(dir + sub + arq) then Showmessage('Exigência gravada com Sucesso') else
        begin
          ShowMessage('Não foi possível gravar o Exigência em ' + dir + sub + arq);
          bitbtn7.setfocus;
        end;
      end;
    end;
  end;
  { atualizar Históricos
  F_Exige2.BitBtn1Click(F_Exige2);
  conta_exige;
  F_Exige2.Bitbtn8.Visible := True;
  F_Exige2.Bitbtn8.Enabled := True;
  F_Exige2.WpRichText2.ReadOnly := true;
  F_Exige2.BitBtn2.Enabled := true;
  F_Exige2.BitBtn3.Enabled := true;
  F_Exige2.BitBtn5.Enabled := true;
  F_Exige2.BitBtn6.Enabled := true;
  F_Exige2.BitBtn9.Enabled := true;
  F_Exige2.BitBtn10.Enabled := true;
  F_Exige2.BitBtn11.Enabled := true;
  F_Exige2.Bitbtn8.Enabled := True; }
end;

procedure TF_Exige2.BitBtn8Click(Sender: TObject);
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

procedure TF_Exige2.MaskEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then tabbednotebook1.ActivePage := 'Exigência';
end;

procedure TF_Exige2.BitBtn12Click(Sender: TObject);
var
  tipo, matricula, sub, cam, arq : String;
begin
{  tabela.Configur.Open;
  base := tabela.Configur.fieldbyname('imagens').asString;
  tabela.Configur.Close;
  if MaskEdit28.Text <> '' then
  Begin
    sub := '';
    cam := '';
    sub := defsub(MaskEdit28.text);
    arq := '0000000'+ MaskEdit28.text;
    arq := Copy(arq,length(arq) - 6,7);
    cam := base + sub + '\' + arq + '.001';
    if not fileexists(cam) then ShowMEssage('Imagem não disponível em ' + cam) else
    Begin
      F_Exige2.label29.Caption := '001';
      F_Exige2.ImgEdit1.Image := cam;
      F_Exige2.ImgEdit1.Display;
      ImgEdit1.FitTo(2, True);
    end;
    F_Exige2.ImgEdit1.FitTo(1, True);
  end
  else ShowMessage('Ficha Inválida'); }
end;

procedure TF_Exige2.FormActivate(Sender: TObject);
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
  Carrega_Modelos(F_Exige2, True);
  if (Label4.Caption = 'remoto') then F_Exige2.BitBtn1Click(F_Exige2);
end;

procedure TF_Exige2.DBGrid1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
{  Funcoes.Abre_ConfigClick(Funcoes);
  dir11 := Tabela.Configur.FieldByname('dir_modexi').AsString;
  Funcoes.Fecha_ConfigClick(Funcoes);
  F_Exige2.WpRichText1.Clear;
   checando se existe modelo de Modelo
  arq11 := 'E' + Tabela.Mod_Exig.FieldByName('codigo').AsString + '_1' + '.rtf';
  if StrToInt(Tabela.Mod_Exig.FieldByName('codigo').AsString) < 1000 then sub11 := '0000' + '\' else
  Begin
    sub11 := Tabela.Mod_Exig.FieldByName('codigo').AsString;
    sub11 := '0000' + Copy(sub,1,length(sub11) - 2);
    sub11 := Copy(sub,length(sub11) - 3,4) + '\';
  end;
  if FileExists(dir11 + sub11 + arq11) then
  begin
    { loading...
    F_Exige2.WpRichText1.ReadOnly := False;
    F_Exige2.WpRichText1.LoadFromFile(dir11 + sub11 + arq11);
    F_Exige2.WpRichText1.SelStart := 0;
    F_Exige2.WpRichText1.selectall;
    F_Exige2.WpRichText1.SetFocus;
    F_Exige2.WpRichText1.SelLength :=0;
    F_Exige2.WPRichText1.CPPosition := 0;
    F_Exige2.WpRichText1.ReadOnly := True;
  end; }
end;

procedure TF_Exige2.DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
{  Funcoes.Abre_ConfigClick(Funcoes);
  dir11 := Tabela.Configur.FieldByname('dir_modexi').AsString;
  Funcoes.Fecha_ConfigClick(Funcoes);
  F_Exige2.WpRichText1.Clear;
  { checando se existe modelo de Modelo
  arq11 := 'E' + Tabela.Mod_Exig.FieldByName('codigo').AsString + '_1' + '.rtf';
  if StrToInt(Tabela.Mod_Exig.FieldByName('codigo').AsString) < 1000 then sub11 := '0000' + '\' else
  Begin
    sub11 := Tabela.Mod_Exig.FieldByName('codigo').AsString;
    sub11 := '0000' + Copy(sub11,1,length(sub11) - 2);
    sub11 := Copy(sub11,length(sub11) - 3,4) + '\';
  end;
  if FileExists(dir11 + sub11 + arq11) then
  begin
    { loading...
    F_Exige2.WpRichText1.ReadOnly := False;
    F_Exige2.WpRichText1.LoadFromFile(dir11 + sub11 + arq11);
    F_Exige2.WpRichText1.SelStart := 0;
    F_Exige2.WpRichText1.selectall;
    F_Exige2.WpRichText1.SetFocus;
    F_Exige2.WpRichText1.SelLength :=0;
    F_Exige2.WPRichText1.CPPosition := 0;
    F_Exige2.WpRichText1.ReadOnly := True;
  end; }
end;

procedure TF_Exige2.DBGrid1CellClick(Column: TColumn);
begin
{  Funcoes.Abre_ConfigClick(Funcoes);
  dir11 := Tabela.Configur.FieldByname('dir_modexi').AsString;
  Funcoes.Fecha_ConfigClick(Funcoes);
  F_Exige2.WpRichText1.Clear;
  { checando se existe modelo de Modelo
  arq11 := 'M' + Tabela.Mod_Exig.FieldByName('codigo').AsString + '_1' + '.rtf';
  if StrToInt(Tabela.Mod_Exig.FieldByName('codigo').AsString) < 1000 then sub11 := '0000' + '\' else
  Begin
    sub11 := Tabela.Mod_Exig.FieldByName('codigo').AsString;
    sub11 := '0000' + Copy(sub,1,length(sub11) - 2);
    sub11 := Copy(sub,length(sub11) - 3,4) + '\';
  end;
  if FileExists(dir11 + sub11 + arq11) then
  begin
    { loading... 
    F_Exige2.WpRichText1.ReadOnly := False;
    F_Exige2.WpRichText1.LoadFromFile(dir11 + sub11 + arq11);
    F_Exige2.WpRichText1.SelStart := 0;
    F_Exige2.WpRichText1.selectall;
    F_Exige2.WpRichText1.SetFocus;
    F_Exige2.WpRichText1.SelLength :=0;
    F_Exige2.WPRichText1.CPPosition := 0;
    F_Exige2.WpRichText1.ReadOnly := True;
  end; }
end;

procedure TF_Exige2.BitBtn5Click(Sender: TObject);
begin
  if (BitBtn5.Caption = '&Corrigir') then
  begin
    BitBtn5.Caption := '&Gravar';
    BitBtn10.Enabled := False;
    BitBtn11.Enabled := False;
    BitBtn9.Enabled  := False;
    BitBtn6.Enabled  := False;
    BitBtn8.Enabled  := False;
    WpRichText2.ReadOnly := False;
    WpRichText2.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Gravar exigência ?'), 'EXIGÊNCIA', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin
      Grava_Exige(F_Exige2);
    end;
    Conta_Exige(F_Exige2);
    BitBtn5.Caption := '&Corrigir';
    BitBtn10.Enabled := True;
    BitBtn11.Enabled := True;
    BitBtn9.Enabled  := True;
    BitBtn6.Enabled  := True;
    BitBtn8.Enabled  := True;
  end;
end;

procedure TF_Exige2.BitBtn9Click(Sender: TObject);
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
    WpRichText2.LoadFromFile(F_Menu.Label18.Caption + sub + '\' + arq);
  end
  else ShowMessage('Não há mais Exigências.');
  WpRichText2.Refresh;
end;

procedure TF_Exige2.BitBtn10Click(Sender: TObject);
begin
  if (BitBtn10.Caption = '&Incluir') then
  begin
    Label33.Caption  := IntToStr(StrToInt(Label35.Caption) + 1);
    BitBtn10.Caption := '&Gravar';
    BitBtn11.Enabled := False;
    BitBtn5.Enabled  := False;
    BitBtn9.Enabled  := False;
    BitBtn6.Enabled  := False;
    BitBtn8.Enabled  := False;
    Carrega_Exige(F_Exige2);
    WpRichText2.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Gravar exigência ?'), 'EXIGÊNCIA', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin
      Grava_Exige(F_Exige2);
    end;
    Conta_Exige(F_Exige2);
    BitBtn10.Caption := '&Incluir';
    BitBtn11.Enabled := True;
    BitBtn5.Enabled  := True;
    BitBtn9.Enabled  := True;
    BitBtn6.Enabled  := True;
    BitBtn8.Enabled  := True;
  end;
end;

procedure TF_Exige2.BitBtn11Click(Sender: TObject);
var
  arq, sub : String;
  x, y : Integer;
begin
  arq := 'E' + Trim(MaskEdit1.Text) + '_' + Label33.Caption + '.RTF';
  sub := DefSub(Trim(MaskEdit1.Text));
  if (MessageBox(Handle, PChar('Confirma exclusão da nota ' + arq), 'EXCLUSÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
  begin
    DeleteFile(F_Menu.Label18.Caption + sub + '\' + arq);
    y := 0;
    for x := 1 to 9 do
    begin
      arq := '';
      arq := 'E' + Trim(MaskEdit1.Text) + '_' + IntToStr(x) + '.RTF';
      if (FileExists(F_Menu.Label18.Caption + sub + '\' + arq)) then
      begin
        y := y + 1;
        WpRichText5.Clear;
        WpRichText5.LoadFromFile(F_Menu.Label18.Caption + sub + '\' + arq);
        WpRichText5.Refresh;
        DeleteFile(F_Menu.Label18.Caption + sub + '\' + arq);        
        arq := '';
        arq := 'E' + Trim(MaskEdit1.Text) + '_' + IntToStr(y) + '.RTF';
        WpRichText5.SaveToFile(F_Menu.Label18.Caption + sub + '\' + arq);
      end;
    end;
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('update td set data_irr = NULL where p_auxiliar = ' + MaskEdit1.Text);
    try
      DM.ArqAux.ExecSql;
    Except
      ShowMessage('Falha ao atualizar a baixa da nota devolutiva.');
    End;

    Conta_Exige(F_Exige2);
  end;
end;

procedure TF_Exige2.SpeedButton1Click(Sender: TObject);
begin
  F_Exige2.WPRichText2.InputString(F_Exige2.Edit2.Text);
end;

procedure TF_Exige2.SpeedButton2Click(Sender: TObject);
begin
   WPPreviewDlg1.EditBox := WPRichText2;
   WPPreviewDlg1.Execute;
end;

procedure TF_Exige2.spAssinaturaClick(Sender: TObject);
var
  habilitar : Boolean;
begin
  WpRichText2.Find('Data de Retirada:', False);
  if (not WpRichText2.Finder.Found) then
  begin
    WpRichText2.Finder.Clear;
    WpRichText3.Clear;
    WpRichText3.LoadFromFile(F_Menu.Label18.Caption + 'Rodape.RTF');
    WpRichText3.Refresh;
    WpRichText3.Find('<escrevente>', False);
    if WpRichText3.Finder.Found = True then
    begin
      WpRichText3.Finder.Clear;
      WpRichText3.Finder.ReplaceAll('<escrevente>', Trim(ComboBox1.Text));
    end;
    WpRichText3.Find('<cargo>', False);
    if WpRichText3.Finder.Found = True then
    begin
      WpRichText3.Finder.Clear;
      WpRichText3.Finder.ReplaceAll('<cargo>', Trim(ComboBox2.Text));
    end;
    WpRichText3.Find('<data>', False);
    if WpRichText3.Finder.Found = True then
    begin
      WpRichText3.Finder.Clear;
      WpRichText3.Finder.ReplaceAll('<data>', DataExtenso(MaskEdit2.Text, True, ''));
    end;
    WpRichText3.Refresh;
    WpRichText3.MovePosition(WpmHome, False);
    WpRichText3.SelectAll;                   
    WpRichText3.CopyToClipboard;
    Habilitar := False;
    if (WpRichText2.ReadOnly) then
    begin
      WpRichText2.ReadOnly := False;
      Habilitar            := True;
    end;
    WpRichText2.MovePosition(WpmEnd, False);
    WpRichText2.InputLines(2);
    WpRichText2.PasteFromClipboard;
    WpRichText2.Refresh;
    if (habilitar) then WpRichText2.ReadOnly := True;
  end
  else
  begin
    WpRichText2.Refresh;
    WpRichText2.MovePosition(WpmHome, False);
    ShowMessage('Rodapé já encontrado nesta nota');
    ShowMessage('Favor apagar rodapé para incluí-lo novamente.');
  end;  
end;

procedure TF_Exige2.SpeedButton4Click(Sender: TObject);
var
  x : integer;

begin
  F_Exige2.WPRichText2.CPPosition := 0;
  While not F_Exige2.WPRichText2.Eof do
  begin
    F_Exige2.WPRichText2.CPLineNr := x ;
    x := x + 1;
  end;

  F_Exige2.WPRichText2.Font.Size := 12;
  F_Exige2.WPRichText2.InputLines(3);
  F_Exige2.WPRichText2.InputString('Atenciosamente,');
  F_Exige2.WPRichText2.InputLines(2);
  F_Exige2.WPRichText2.InputString(ComboBox1.Text);
  F_Exige2.WPRichText2.InputLines(1);
  F_Exige2.WPRichText2.InputString(ComboBox2.Text);
end;


procedure TF_Exige2.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Exige2.FormDestroy(Sender: TObject);
begin
  Dm.Mod_Exig.Close;
end;

procedure TF_Exige2.BitBtn2Click(Sender: TObject);
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

procedure TF_Exige2.AtualizaMacrosAssinantesECargo;
begin

end;

procedure TF_Exige2.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

end.

