unit u_editor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  WPDefs, WPPrint, WpWinCtr, WPRich, WPRuler, Tabs, ExtCtrls, Menus, WPTbar,
  WPPrvFrm, WPSymDlg, WPTblDlg, WPTblCalc, WPEval, WPMerge, WPRepED,
  WPTabdlg, WpParBrd, WPBltDlg, WpPagPrp, WpParPrp, ComCtrls, wpstat2,
  StdCtrls, Buttons, wpfinder, WPObj, Db, FileCtrl, AxCtrls, OleCtrls,
  DbOleCtl, ImgeditLibCtl_TLB;

type
  Tf_editor = class(TForm)
    Panel1: TPanel;
    WPToolBar1: TWPToolBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    InsertFile1: TMenuItem;
    N3: TMenuItem;
    PrinterSetup1: TMenuItem;
    PrintDialog: TMenuItem;
    Preview1: TMenuItem;
    N1: TMenuItem;
    Close1: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    UndoEnabled1: TMenuItem;
    N2: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    SelectAll1: TMenuItem;
    HideSelection1: TMenuItem;
    Insert1: TMenuItem;
    Symbol1: TMenuItem;
    Format1: TMenuItem;
    Font1: TMenuItem;
    Paragraph1: TMenuItem;
    Borders1: TMenuItem;
    Tabstops1: TMenuItem;
    PageLayout1: TMenuItem;
    WPPreviewDlg1: TWPPreviewDlg;
    WPSymbolDlg1: TWPSymbolDlg;
    WPTableDlg1: TWPTableDlg;
    Panel2: TPanel;
    WPRuler1: TWPRuler;
    WPVertRuler1: TWPVertRuler;
    Panel3: TPanel;
    WPParagraphPropDlg1: TWPParagraphPropDlg;
    WPPagePropDlg1: TWPPagePropDlg;
    WPParagraphBorderDlg1: TWPParagraphBorderDlg;
    WPTabDlg1: TWPTabDlg;
    StatusBar1: TStatusBar;
    WPRichText1: TWPRichText;
    Timer1: TTimer;
    TabSet1: TTabSet;
    teste1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Localizar1: TMenuItem;
    Trocar1: TMenuItem;
    N4: TMenuItem;
    AbrirModelo1: TMenuItem;
    SalvarComoModelo1: TMenuItem;
    Label1: TLabel;
    WPRichText2: TWPRichText;
    Imagem1: TMenuItem;
    SpeedButton3: TSpeedButton;
    Label27: TLabel;
    Label26: TLabel;
    ImgEdit1: TImgEdit;
    ImgEdit2: TImgEdit;
    FileListBox1: TFileListBox;
    ComboBox3: TComboBox;
    ComboBox2: TComboBox;
    ComboBox4: TComboBox;
    GroupBox3: TGroupBox;
    ImgEdit6: TImgEdit;
    StatusBar2: TStatusBar;
    BitBtn1: TBitBtn;
    procedure TabSet1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure SaveAs1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure InsertFile1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure PrintDialogClick(Sender: TObject);
    procedure Preview1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure UndoEnabled1Click(Sender: TObject);
    procedure Undo1Click(Sender: TObject);
    procedure Symbol1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure HideSelection1Click(Sender: TObject);
    procedure Table2Click(Sender: TObject);
    procedure Paragraph1Click(Sender: TObject);
    procedure Borders1Click(Sender: TObject);
    procedure Tabstops1Click(Sender: TObject);
    procedure PageLayout1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure WPRichText1ChangeLastFilename(Sender: TObject);
    procedure WPRichText1Enter(Sender: TObject);
    procedure WPRichText1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure WPRichText1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Localizar1Click(Sender: TObject);
    procedure Trocar1Click(Sender: TObject);
    procedure SalvarComoModelo1Click(Sender: TObject);
    procedure AbrirModelo1Click(Sender: TObject);
    procedure WPRichText1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure teste1Click(Sender: TObject);
    procedure Imagem1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
      function InsertGraphicDialog(sCaminhoDoArquivo, sNumeroArquivo: String): TWPObject;
  public
    { Public declarations }
    function VerificaArquivosBMP(sCaminhoDoArquivo, sNumeroArquivo: String): String;
  end;
  procedure troca( oque, peloque : string );


var
  f_editor              : Tf_editor;
  caminho2, arq_modelo, cam, cam2 : string;
  salvo: boolean;
implementation

uses menu, func, u_abre_m, u_save_m, DMTD, U_SeloCertidao, funcgeral,
  U_IncluiImagemEditor;

{$R *.DFM}

function podesair : boolean;
var
  msg : string;
begin
  if (f_editor.WPRichText1.modified) and (f_editor.WPRichText1.LastFileName <> '')  then
  begin
    msg := 'O texto atual  ' + uppercase(f_editor.WPRichText1.LastFileName);
    msg := msg + '  foi modificado e não foi gravado. Deseja gravar o arquivo ?';
    if application.messagebox(pchar(msg),'Dados Não Gravados',mb_yesno) = mryes then f_editor.wprichtext1.Save;
  end;
end;


function acha_arq( arq : string) : string;
begin
{  with f_editor do
    begin
      funcoes.abre_modelos.click;
      if arq = '' then
        result := arq
      else
        begin
          if tabela.modelos.seek(arq) then
            result := tabela.modelos.fieldbyname('arquivo').asstring
          else
            result := '';
        end;
      funcoes.fecha_modelos.click;
    end; }
end;


procedure atualiza;
var
  pagina   : integer;
  linhas   : integer;
begin
  with f_editor do
    begin
      pagina   := wprichtext1.getpagenumber+1;
      linhas   := wprichtext1.getlinenumber+1;
      //
      statusbar1.Panels[0].text := inttostr(linhas) + ' : ' + inttostr(pagina);
      //
      if (not wprichtext1.Inserting ) then
        statusbar1.panels[2].text := 'Sobrepondo'
      else
        statusbar1.panels[2].text := 'Inserindo';
    end;
end;


procedure Tf_editor.TabSet1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
   WPRichText1.WorkOnText := TWPWorkOnOptions(NewTab);
   WPRichText1.refresh;
end;

procedure Tf_editor.SaveAs1Click(Sender: TObject);
begin
//  getdir(0, cam);
//  WPRichText1.SaveAs;
//  chdir(cam);
  salvo:= True;
  WPRichText1.SaveAs;
  chdir(caminho);
end;

procedure Tf_editor.New1Click(Sender: TObject);
begin
  podesair;
  statusbar1.Panels[4].text := '';
  WPRichText1.Clear;
end;

procedure Tf_editor.Open1Click(Sender: TObject);
var
  nomant : string;
begin
  nomant := statusbar1.Panels[3].text;
  podesair;
  WPRichText1.Load;
  if nomant <> statusbar1.Panels[3].text then
  begin
    statusbar1.Panels[4].text := '';
  end;
end;

procedure Tf_editor.InsertFile1Click(Sender: TObject);
begin
  WPRichText1.Insert;
  wprichtext1.refresh;  
end;

procedure Tf_editor.PrinterSetup1Click(Sender: TObject);
begin
  WPrichText1.PrinterSetup;
end;

procedure Tf_editor.PrintDialogClick(Sender: TObject);
begin
  //WPRichText1.Print;
  WPRichText1.PrintDialog;
end;

procedure Tf_editor.Preview1Click(Sender: TObject);
begin
  WPPreviewDlg1.EditBox := WPRichText1;
  WPPreviewDlg1.Execute;
end;

procedure Tf_editor.Close1Click(Sender: TObject);
begin
  close;
end;

procedure Tf_editor.UndoEnabled1Click(Sender: TObject);
begin
  UndoEnabled1.Checked := not UndoEnabled1.Checked;
  WPRichText1.SuspendUndo( not UndoEnabled1.Checked );
end;

procedure Tf_editor.Undo1Click(Sender: TObject);
begin
  WPRichText1.Undo;
end;

procedure Tf_editor.Symbol1Click(Sender: TObject);
begin
  WPSymbolDlg1.Execute;
end;

procedure Tf_editor.Font1Click(Sender: TObject);
begin
  WPRichText1.FontSelect;
end;

procedure Tf_editor.Cut1Click(Sender: TObject);
begin
  WPRichText1.CutToClipboard;
end;

procedure Tf_editor.Copy1Click(Sender: TObject);
begin
  WPRichText1.CopyToClipboard;
end;

procedure Tf_editor.Paste1Click(Sender: TObject);
begin
  WPRichText1.PasteFromClipboard;
end;

procedure Tf_editor.Delete1Click(Sender: TObject);
begin
   WPRichText1.ClearSelection;
end;

procedure Tf_editor.SelectAll1Click(Sender: TObject);
begin
  WPRichText1.SelectAll;
end;

procedure Tf_editor.HideSelection1Click(Sender: TObject);
begin
   WPRichText1.HideSelection;
end;

procedure Tf_editor.Table2Click(Sender: TObject);
begin
  WPTableDlg1.Execute;
end;

procedure Tf_editor.Paragraph1Click(Sender: TObject);
begin
  WPParagraphPropDlg1.Execute;
end;

procedure Tf_editor.Borders1Click(Sender: TObject);
begin
  WPParagraphBorderDlg1.Execute;
end;

procedure Tf_editor.Tabstops1Click(Sender: TObject);
begin
  WPTabDlg1.Execute;
end;

procedure Tf_editor.PageLayout1Click(Sender: TObject);
begin
  WPPagePropDlg1.Execute;
end;

procedure Tf_editor.Save1Click(Sender: TObject);
begin
  salvo:= True;

  WPRichText1.Save;
end;

procedure Tf_editor.Timer1Timer(Sender: TObject);
begin
  if wprichtext1.modified then
    statusbar1.panels[1].text := 'Modificou'
  else
    statusbar1.panels[1].text := '';
end;

procedure Tf_editor.WPRichText1ChangeLastFilename(Sender: TObject);
begin
  statusbar1.panels[3].text := uppercase(wprichtext1.lastfilename);
end;

procedure Tf_editor.WPRichText1Enter(Sender: TObject);
begin
  atualiza;
end;

procedure Tf_editor.WPRichText1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  atualiza;
end;

procedure Tf_editor.WPRichText1Click(Sender: TObject);
begin
  atualiza;
end;

procedure Tf_editor.FormActivate(Sender: TObject);
begin
  atualiza;
end;

procedure troca( oque, peloque : string );
var
  wot        : integer;
  fonteant   : byte; //string;
  estiloant  : wrtstyle;
  tamanhoant : integer;
begin
  for wot := 0 to 2 do
    begin
      f_editor.wprichtext1.workontext := TWPWorkOnOptions(wot);
      f_editor.wprichtext1.CPPosition := 0;
      while f_editor.wprichtext1.Finder.Next(oque) do
        begin
          f_editor.wprichtext1.SetSelPosLen(f_editor.wprichtext1.Finder.FoundPosition, f_editor.wprichtext1.Finder.FoundLength );
          f_editor.wprichtext1.CPPosition := f_editor.wprichtext1.Finder.FoundPosition;

          estiloant  := f_editor.wprichtext1.Finder.FoundAttr.Style;
          fonteant   := f_editor.wprichtext1.Finder.FoundAttr.font;
          tamanhoant := f_editor.wprichtext1.Finder.FoundAttr.Size;
          //
          f_editor.wprichtext1.CurrAttr.Style := estiloant;
          f_editor.wprichtext1.CPAttr^.Font   := fonteant;
          f_editor.wprichtext1.CurrAttr.Size  := tamanhoant;

          f_editor.wprichtext1.InputString(peloque);
        end;
        f_editor.wprichtext1.Finder.Clear;
    end;
  f_editor.wprichtext1.workontext := TWPWorkOnOptions(0);
end;


procedure Tf_editor.Localizar1Click(Sender: TObject);
begin
  wprichtext1.FindDialog;
end;

procedure Tf_editor.Trocar1Click(Sender: TObject);
begin
  wprichtext1.ReplaceDialog;
end;

procedure Tf_editor.SalvarComoModelo1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Save_M, F_Save_M);
  F_Save_M.ShowModal;
  F_Save_M.Destroy;
  F_Save_M := Nil;
end;

procedure Tf_editor.AbrirModelo1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Abre_M, F_Abre_M);
  F_Abre_M.ShowModal;
  if (F_Abre_M.Label1.Caption <> 'cancelou') then
  begin
//    getdir(0,cam);
//    cam2 := F_Menu.Label8.Caption + 'modelos\' + Dm.Modelos.FieldByName('arquivo').asstring;
    caminho2 := F_Menu.Label16.Caption + Dm.Modelos.FieldByName('arquivo').asstring;
//    if (not fileexists(cam2)) then
    if (not fileexists(caminho2)) then
    begin
//      showmessage('Problemas com Arquivos/Diretórios: Arquivo ' + uppercase(cam2) + ' não encontrado.');
      showmessage('Problemas com Arquivos/Diretórios: Arquivo ' + uppercase(caminho2) + ' não encontrado.');
    end
    else
    begin
      podesair;
      WPRichText1.WorkOnText := TWPWorkOnOptions(2);
      wprichtext1.Clear;
      WPRichText1.WorkOnText := TWPWorkOnOptions(1);
      wprichtext1.Clear;
      WPRichText1.WorkOnText := TWPWorkOnOptions(0);
      wprichtext1.Clear;
//      wprichtext1.LoadFromFile(cam2);
      wprichtext1.LoadFromFile(caminho2);
      wprichtext1.SetPageNumber(0);
      wprichtext1.modified := false;
      wprichtext1.refresh;
      statusbar1.Panels[4].text := Dm.Modelos.FieldByName('nome').asstring;
    end;
  end;
  F_Abre_M.Destroy;
  F_Abre_M := nil;
end;

procedure Tf_editor.WPRichText1Change(Sender: TObject);
begin
  atualiza;
end;

procedure Tf_editor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Not(salvo)) Then
  begin
    if Application.MessageBox('Deseja salvar o texto digitado ?', 'Editor de Texto', MB_ICONQUESTION + MB_YESNO) = ID_Yes then
    begin
      WPRichText1.SaveAs;
      chdir(caminho);
    End;
  end;

  DeleteFile('c:\siscart\daje.rtf');
  podesair;
  wprichtext1.modified := false;
end;

procedure Tf_editor.teste1Click(Sender: TObject);
var
  cam_sis : String;
begin
  WPRichText1.SaveToFile('c:\siscart\daje.rtf');

{ Application.CreateForm(TF_SeloCertidao, F_SeloCertidao);
  F_SeloCertidao.ShowModal;
  F_SeloCertidao.Destroy;
  F_SeloCertidao := Nil;}
  //cam_sis := ExtractFilePath(Application.ExeName);
  //Winexec(Pchar(cam_sis + 'ExportaRTF_PDF.exe'), SW_SHOWNORMAL);
  Winexec(Pchar(F_Menu.LbCaminhoExportaPDF.Caption + 'ExportaRTF_PDF.exe'), SW_SHOWNORMAL);


end;

procedure Tf_editor.Imagem1Click(Sender: TObject);
begin
  F_IncluiImagemEditor:= TF_IncluiImagemEditor.Create(Nil);
  F_IncluiImagemEditor.ShowModal;
  F_IncluiImagemEditor.Free;

  //Dm.Dir_CamImagensNotificBMP
  {WPRichText1.InitialDir:= 'S:\Siscart\PROGRAMAS\IMAGENS\LIVRO2\Notificação\000001_010.bmp';}

end;

function Tf_editor.InsertGraphicDialog(sCaminhoDoArquivo, sNumeroArquivo: String): TWPObject;
var
{$IFDEF DELPHI3ANDUP}
  dia: TOpenPictureDialog;
{$ELSE}
  dia: TOpenDialog;
{$ENDIF}
  ArquivoDeImagem: String;
begin
  Result := nil;
  begin
    {$IFDEF DELPHI3ANDUP}
    dia := TOpenPictureDialog.Create(Self);
    {$ELSE}
    dia := TOpenDialog.Create(Self);
    {$ENDIF}
    try
      ArquivoDeImagem:= sCaminhoDoArquivo + sNumeroArquivo + '.bmp';
      dia.InitialDir := ArquivoDeImagem;
      dia.Filter := 'Graphic files|*.BMP;*.JPG;*.WMF;*.TIF';
      dia.Options := [ofNoChangeDir];
      begin
        Result := WPLoadObjectFromFile(Self, ArquivoDeImagem{dia.FileName}, True);
        dia.InitialDir := ExtractFilePath(ArquivoDeImagem{dia.Filename});
        if Result <> nil then
        begin
          Result.WriteRTFMode := wobBoth;
          Result.Font.Style := [];
          Result.ParentColor := FALSE;
          Result.ParentFont := FALSE;
          WPRichText1.TextObjects.Insert(Result);
        end;
      end;
    finally
      dia.Free;
    end;
  end;
end;

function Tf_editor.VerificaArquivosBMP(sCaminhoDoArquivo, sNumeroArquivo: String): String;
var
  i, x: Integer;
  sListaArqs:TStringList;
  c: cardinal;
  teste,
  sNome,
  NomeDoArquivo: String;
begin
  result:= '';
                    
  sListaArqs:=TStringList.Create;
  sNumeroArquivo:= StrZero(sNumeroArquivo, 14)+'_';


  if (FileExists(sCaminhoDoArquivo+'\'+StrZero(sNumeroArquivo, 17)+'1.bmp')) Then
  Begin
    Dm.DirList(sCaminhoDoArquivo+'*.bmp',sListaArqs, StrZero(sNumeroArquivo, 17));
  End
  Else
  if (FileExists(sCaminhoDoArquivo+'\'+StrZero(sNumeroArquivo, 16)+'1.bmp')) Then
  Begin
    Dm.DirList(sCaminhoDoArquivo+'*.bmp',sListaArqs, StrZero(sNumeroArquivo, 16));
  End
  Else
  if (FileExists(sCaminhoDoArquivo+'\'+StrZero(sNumeroArquivo, 15)+'1.bmp')) Then
  Begin
    Dm.DirList(sCaminhoDoArquivo+'*.bmp',sListaArqs, StrZero(sNumeroArquivo, 15));
  End
  Else
  if (FileExists(sCaminhoDoArquivo+'\'+StrZero(sNumeroArquivo, 14)+'1.bmp')) Then
  Begin
    Dm.DirList(sCaminhoDoArquivo+'*.bmp',sListaArqs, StrZero(sNumeroArquivo, 14));
  End
  Else
  if (FileExists(sCaminhoDoArquivo+'\'+StrZero(sNumeroArquivo, 13)+'1.bmp')) Then
  Begin
    Dm.DirList(sCaminhoDoArquivo+'*.bmp',sListaArqs, StrZero(sNumeroArquivo, 13));
  End
  Else
  if (FileExists(sCaminhoDoArquivo+'\'+StrZero(sNumeroArquivo, 12)+'1.bmp')) Then
  Begin
    Dm.DirList(sCaminhoDoArquivo+'*.bmp',sListaArqs, StrZero(sNumeroArquivo, 12));
  End
  Else
  if (FileExists(sCaminhoDoArquivo+'\'+StrZero(sNumeroArquivo, 11)+'1.bmp')) Then
  Begin
    Dm.DirList(sCaminhoDoArquivo+'*.bmp',sListaArqs, StrZero(sNumeroArquivo, 11));
  End
  Else
  if (FileExists(sCaminhoDoArquivo+'\'+StrZero(sNumeroArquivo, 10)+'1.bmp')) Then
  Begin
    Dm.DirList(sCaminhoDoArquivo+'*.bmp',sListaArqs, StrZero(sNumeroArquivo, 10));
  End
  Else
  Begin
    Dm.DirList(sCaminhoDoArquivo+'*.bmp',sListaArqs, StrZero(sNumeroArquivo, 6));
  End;

 

  If sListaArqs.Count>0 Then
  Begin
    Try
      for i := 1 to sListaArqs.Count do
      Begin
        ExisteArquivo:=True;

        InsertGraphicDialog(Dm.Dir_CamImagensNotificBMP, DM.ExtractName(sListaArqs[i-1]) );
        F_IncluiImagemEditor.lbMsg.Caption:= 'Aguarde enquanto a imagem: '+DM.ExtractName(sListaArqs[i-1])+', está sendo processada ...';
        F_IncluiImagemEditor.Refresh;
        //DeleteFile(sNome+'.bmp');
      End;
    Except
      Begin
        ShowMessage('Erro ao carregar imagem. Verifique se a imagem selecionada não está aberta em outro '+
                    'aplicativo ou se a resolução da imagem é compativel com o formato .bmp!');
        result:= '';
        Abort;
      End;
    End;
  End;
  Application.messagebox(pchar('Imagens inseridas com sucesso!'),'ATENÇÃO', MB_ICONINFORMATION);
  if F_IncluiImagemEditor <> Nil Then
    F_IncluiImagemEditor.Close;

end;



procedure Tf_editor.BitBtn1Click(Sender: TObject);
var
  ext, arq, arq_tmp : String;
  denovo : boolean;
  mat_ : string;
begin

  ImgEdit6.Image := '';
  ImgEdit6.ClearDisplay;
  ImgEdit6.Image := sCaminhoDosCarimbos+'\'+ComboBox4.Text;
  ImgEdit6.Zoom := 5;
  ImgEdit6.Display;
  ImgEdit6.ClipboardCopy(0, 0, 300, 900);
  WPRichText1.PasteFromClipboard;
  ImgEdit6.Zoom := 50;
  ImgEdit6.Display;
end;
procedure Tf_editor.ComboBox4Change(Sender: TObject);
begin
  IMgEdit6.Image := sCaminhoDosCarimbos+'\'+ComboBox4.Text;
  ImgEdit6.Zoom := 20;
  ImgEdit6.Display;
end;

procedure Tf_editor.FormShow(Sender: TObject);
var
  x: Integer;
begin
  FileListBox1.Directory := sCaminhoDosCarimbos;
  FileListBox1.Update;
  ComboBox4.Items.Clear;
  for x := 0 to FileListBox1.Items.Count - 1 do
  begin
    FileListBox1.ItemIndex := x;
    if UpperCase(PegaAte(FileListBox1.FileName, '.','R')) = 'TIF' then
    begin
      ComboBox4.Items.Add(PegaAte(FileListBox1.FileName, '\','R'));
    end;
  end;
  if ComboBox4.text <> '' Then
  begin
    ImgEdit2.Image := sCaminhoDosCarimbos + ComboBox4.text;
    ImgEdit2.FitTo(0, true);
    FileListBox1.Directory := 'C:\siscart\temp\convtif\';
    FileListBox1.Update;

    if Trim(ComboBox4.Text) = '' then ComboBox4.Text := ComboBox4.Items.Strings[1];
    if Trim(ComboBox3.Text) = '' then ComboBox3.Text := ComboBox3.Items.Strings[0];
  end;

  Dm.qryGenerico.Close;
  Dm.qryGenerico.SQL.Clear;
  Dm.qryGenerico.SQL.Add('select * from usuarios');
  Dm.qryGenerico.Open;

  Dm.qryGenerico.First;
  while not Dm.qryGenerico.eof do
  Begin
    if (ComboBox2.Text = '') then
      ComboBox2.Text := UnCript(Dm.qryGenerico.FieldByName('u_nome').AsString);
    ComboBox2.Items.Add(UnCript(Dm.qryGenerico.FieldByName('u_nome').AsString));

    if (F_Menu.Label45.Caption = 'S') then
    begin
      ComboBox2.Text := F_Menu.Label25.Caption;
    end;
    Dm.qryGenerico.Next;
  End;
end;



End.

