unit U_Certidao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, FileCtrl, ComCtrls, AdminLibCtl_TLB, DbOleCtl,
  ImgeditLibCtl_TLB, Mask, Buttons, ExtCtrls, AxCtrls, OleCtrls,
  ImagXpr7_TLB, U_TIFFToPDF, WPPDFPRP, WPPDFR1, WPPDFR2, DBCtrls, Grids,
  DBGrids, Db, RxMemDS, unMath,DMT,Shellapi;

type
  TF_Certidao = class(TForm)
    Label18: TLabel;
    Xpress1: TImagXpress;
    Panel1: TPanel;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    ImagXCarimbo: TImagXpress;
    GroupBox1: TGroupBox;
    BitBtn7: TBitBtn;
    CheckBox7: TCheckBox;
    BitBtn4: TBitBtn;
    ImgEdit4: TImgEdit;
    Panel4: TPanel;
    ProgressBar1: TProgressBar;
    ImgEdit5: TImgEdit;
    ImgEdit1: TImgEdit;
    ImgEdit3: TImgEdit;
    Xpress2: TImagXpress;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    Panel2: TPanel;
    Label13: TLabel;
    Panel3: TPanel;
    Label12: TLabel;
    ImgAdmin1: TImgAdmin;
    MaskEdit2: TMaskEdit;
    FileListBox1: TFileListBox;
    PopupMenu1: TPopupMenu;
    PrimeiraPgina1: TMenuItem;
    ltimaPgina1: TMenuItem;
    Zoom1: TMenuItem;
    PrintDialog1: TPrintDialog;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn8: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label9: TLabel;
    SpeedButton10: TSpeedButton;
    Label11: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    MaskEdit3: TMaskEdit;
    Label25: TLabel;
    CheckBox1: TCheckBox;
    BitBtn5: TBitBtn;
    ImgAdmin2: TImgAdmin;
    SpeedButton3: TSpeedButton;
    BitBtn3: TBitBtn;
    TempPaginas: TRxMemoryData;
    TempPaginasPAGINAS: TStringField;
    DtsTempPaginas: TDataSource;
    TempComTodasPaginas: TRxMemoryData;
    TempComTodasPaginasPAGINAS_PADRAO: TStringField;
    ComboBox2: TComboBox;
    ComboBox4: TComboBox;
    Label26: TLabel;
    Label27: TLabel;
    FileListBox2: TFileListBox;
    GroupBox3: TGroupBox;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    BitBtn13: TBitBtn;
    BitBtn10: TBitBtn;
    DBEdit1: TDBEdit;
    BitBtn6: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn12: TBitBtn;
    Label28: TLabel;
    ImgEdit2: TImgEdit;
    CheckBox11: TCheckBox;
    Button1: TButton;
    BtAjustaImagemSemDiminuir: TButton;
    edtAverbacao: TMaskEdit;
    Label29: TLabel;
    memo1: TMemo;
    Memo2: TMemo;
    CheckBox12: TCheckBox;
    CheckBox14: TCheckBox;
    ImgEdit6: TImgEdit;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox8: TCheckBox;
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PrimeiraPgina1Click(Sender: TObject);
    procedure ltimaPgina1Click(Sender: TObject);
    procedure Zoom1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    Procedure Carrega_XPressAssinatura2(Imagem : String);
    procedure Button1Click(Sender: TObject);
    procedure BtAjustaImagemSemDiminuirClick(Sender: TObject);
    procedure edtAverbacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
  private
    procedure CarregaImagemSemDimensionar(Imagem : String);
    { Private declarations }
  public
    { Public declarations }
    contador,verificador, ajustCont: integer;
    controle_ajuste:boolean;
    strFileTIFFIn, strFilePDFOut : String;
    F_Author, F_Producer, F_Title, F_Subject, F_Keywords : String;
    mens_lote1, mens_lote2, mens_lote3, mens_lote4, mens_lote5 : String;
    mens_lote6, mens_lote7, mens_lote8, mens_lote9, mens_lote10 : String;
    mens_lote11, mens_lote12, mens_lote13, mens_lote14, mens_lote15,
    mens_lote16, mens_lote17, mens_lote18, mens_lote19, mens_lote20,
    mens_lote21, mens_lote22, mens_lote23, mens_lote24, mens_lote25,
    mens_lote26, mens_lote27, mens_lote28, mens_lote29 : String;

    procedure desenharSelo(selo,codigovalidacao:String);
    function LimpaDiretorio(sNome: string): Boolean;
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure ListarArquivos(Diretorio: string; Sub:Boolean;Arq:string);
    procedure get_imagens(avarba:boolean=false);
    procedure Ordenar(Valores: tStrings);
    function GerCodBar1_XPress(col, lin, alt, lar : Integer; par : String; Caracter, Bmp : Boolean): String;

  end;

var
  F_Certidao: TF_Certidao;
  IP_TRANSPARENT : Boolean;
  IP_TCOLOR : Integer;
  IP_MERGESIZE,col_i, lin_i : Integer;
  protoc, hora, arq_ant, arq1, arq2 : String;
  oficial_cert, estado_cert, ipesp_cert, civil_cert, tribunal_cert, total_cert : String;
  dir_matricula, dir_livro3, dir_indbens, dir_temp, dir_modelos, dir_carimbos, dir_digital : String;
   oficial_zeis, estado_zeis, ipesp_zeis, civil_zeis, tribunal_zeis, total_zeis :String;
   tem_outro, tem_oficio, tem_arisp, tem_pre, tem_pedido, tem_contra, imprimiu_cota : Boolean;
  cam1, img, arq, sub,nome_ant : String;
  nomeImg : String;
  altura0, largura0, limitetop, limitesize : Integer;
  Nome_PDF, Nome_TIF : String;
  objPDF : T_TIFFToPDF;
  dir_ato : String;
  iQuantZero: Integer;

const
  PathDelim  = {$IFDEF MSWINDOWS} '\'; {$ELSE} '/'; {$ENDIF}
    
implementation

uses Menu, FuncGeral, DMTD, U_Daje, Zoom, ImagemDaje, ExameC, LotClan;

{$R *.DFM}

function IncludeTrailingPathDelimiter(const S: string): string;
begin
  Result := S;
  if not IsPathDelimiter(Result, Length(Result)) then
    Result := Result + PathDelim;
end;

function TF_Certidao.LimpaDiretorio(sNome: string): Boolean;
var
  sr: TSearchRec;
  FullName: string;
begin
  Result := True;
  if (FindFirst(sNome + '\*.*', faAnyFile, sr) = 0) then
  try
    repeat
      FullName := IncludeTrailingPathDelimiter(sNome) + sr.Name;
      if (sr.Name <> '.') and (sr.Name <> '..') and (sr.Name <> 'imgtmp.tif')
        and (sr.Name <> 'Convert') and (sr.Name <> 'convtif') and (sr.Name <> 'imagens') then
      begin
        if ((sr.Attr and faDirectory) = 0) then
          Result := DeleteFile(FullName)
        else
          Result := LimpaDiretorio(FullName);
      end;
    until (FindNext(sr) <> 0) or not Result;
  finally
    FindClose(sr);
  end;
  Result := Result and DirectoryExists(sNome) and RemoveDir(sNome);

end;

procedure TF_Certidao.desenharSelo(selo,codigovalidacao:String);
var
  arq_tmp : String;
  bitmap0, Bitmap1 : TBitmap;
  mutiplicador, mutiplicadorB : Integer;
  MyRect, MyOther: TRect;
  LarguraEsquerda, LarguraDireita, LarguraTotal, AlturaTotal: integer;

begin
  mutiplicador  := 3;
  mutiplicadorB := 3;

  MyRect:= Rect (1,1,200,200);

  LarguraEsquerda:= 1030;//950;
  LarguraDireita := 12;
  LarguraTotal   := 485; //Se for diminuindo ele vai subindo para o topo, porém tem de ir reduzindo o de baixo AlturaTotal
  AlturaTotal    := 600;


  bitmap0 := TBitmap.Create;
  bitmap0.LoadFromFile(F_Menu.Label49.Caption + 'selo.bmp');
  bitmap0.Canvas.Pen.Width  := 1;//*mutiplicador;


  if (TrabalhaComQRCode) Then  //Eder valença
  begin
    MyOther:= Rect (LarguraEsquerda,LarguraDireita,LarguraTotal,AlturaTotal);

    bitmap0.Canvas.Pen.Width  := 1;

    bitmap0.Canvas.Font.Name  := 'Arial';
    bitmap0.Canvas.Font.Size  := 24;
    bitmap0.Canvas.TextOut(90,6, 'Selo de Autenticidade');

    bitmap0.Canvas.Font.Name  := 'Arial';
    bitmap0.Canvas.Font.Size  := 19;
    bitmap0.Canvas.TextOut(17,37, 'Tribunal de Justiça do Estado da Bahia');

    bitmap0.Canvas.Font.Name  := 'Arial';
    bitmap0.Canvas.Font.Size  := 22;
    bitmap0.Canvas.TextOut(70,64, 'Ato Notarial ou de Registro');

    bitmap0.Canvas.Font.Name  := 'Times New Roman';
    bitmap0.Canvas.Font.Size  := 25;
    bitmap0.Canvas.Font.Style := [fsBold];
    bitmap0.Canvas.TextOut(120,92, selo);

    bitmap0.Canvas.Font.Name  := 'Times New Roman';
    bitmap0.Canvas.Font.Size  := 25;
    bitmap0.Canvas.Font.Style := [fsBold];
    bitmap0.Canvas.TextOut(145,127, codigovalidacao);

    bitmap0.Canvas.Font.Name  := 'Times New Roman';
    bitmap0.Canvas.Font.Size  := 23;
    bitmap0.Canvas.TextOut(185,159, 'Consulte:');

    bitmap0.Canvas.Font.Name  := 'Times New Roman';
    bitmap0.Canvas.Font.Size  := 23;
    bitmap0.Canvas.TextOut(50,192, 'www.tjba.jus.br/autenticidade');

    WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'DAJE.EXE ' + 'CQ;'+TirarTudo(selo,'-','/','.')+';'+caminho_imgselo+';'+'dbtd;'+'TD;'),SW_HIDE);
    Dm.KillTask(F_Menu.LbCaminhoDajeIntegracao.Caption+'Daje.exe');

    bitmap1 := TBitmap.Create;
    bitmap1.PixelFormat := pf4bit; //pf32bit; pf1bit, pf4bit, pf8bit, pf15bit, pf16bit, pf24bit, pf32bit
    bitmap1.LoadFromFile(caminho_imgselo+'qrcode_'+TirarTudo(selo, '.', ',', '-')+'.bmp');
                                                    
    bitmap0.Canvas.Pen.Width := 1;

    bitmap0.Canvas.CopyRect(MyOther, Bitmap1.Canvas, MyRect);

    If Not DirectoryExists(F_Menu.Label49.Caption + 'img\') then
      ForceDirectories(F_Menu.Label49.Caption + 'img\');
    nomeImg:= F_Menu.Label49.Caption + 'img\'+codigovalidacao+'.bmp';
    bitmap0.SaveToFile(nomeImg);
    bitmap0.Destroy;
    bitmap1.Destroy;

  end
  else
  begin
    bitmap0.Canvas.Font.Name  := 'Arial';
    bitmap0.Canvas.Font.Size  := 24;
    bitmap0.Canvas.TextOut(90,6, 'Selo de Autenticidade');

    bitmap0.Canvas.Font.Name  := 'Arial';
    bitmap0.Canvas.Font.Size  := 19;
    bitmap0.Canvas.TextOut(17,37, 'Tribunal de Justiça do Estado da Bahia');

    bitmap0.Canvas.Font.Name  := 'Arial';
    bitmap0.Canvas.Font.Size  := 22;
    bitmap0.Canvas.TextOut(70,64, 'Ato Notarial ou de Registro');

    bitmap0.Canvas.Font.Name  := 'Times New Roman';
    bitmap0.Canvas.Font.Size  := 25;
    bitmap0.Canvas.Font.Style := [fsBold];
    bitmap0.Canvas.TextOut(120,92, selo);

    bitmap0.Canvas.Font.Name  := 'Times New Roman';
    bitmap0.Canvas.Font.Size  := 25;
    bitmap0.Canvas.Font.Style := [fsBold];
    bitmap0.Canvas.TextOut(145,127, codigovalidacao);

    bitmap0.Canvas.Font.Name  := 'Times New Roman';
    bitmap0.Canvas.Font.Size  := 23;
    bitmap0.Canvas.TextOut(185,159, 'Consulte:');

    bitmap0.Canvas.Font.Name  := 'Times New Roman';
    bitmap0.Canvas.Font.Size  := 23;
    bitmap0.Canvas.TextOut(50,192, 'www.tjba.jus.br/autenticidade');

    If Not DirectoryExists(F_Menu.Label49.Caption + 'img\') then
      ForceDirectories(F_Menu.Label49.Caption + 'img\');
    nomeImg:= F_Menu.Label49.Caption + 'img\'+codigovalidacao+'.bmp';
    bitmap0.SaveToFile(nomeImg);
    bitmap0.Destroy;
  End;
end;


Function AndarAteFim(arq_img, sentido : String) : String;
var
  ext, arq_fim : String;
Begin

  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 3) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 4) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 4) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 5) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 5) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 6) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 6) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 7) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 7) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 8) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 8) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 9) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 9) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 10) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 10) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 11) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 11) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 12) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 12) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 13) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 13) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 14) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 14) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 15) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 15) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 16) + '.001';
  End
  Else
  if (Not(FileExists('C:\siscart\temp\td\' + strZero(arq, 16) + '.001'))) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 17) + '.001';
  End;

  result := arq_img;
  while result <> '' do
  begin
    ext := copy(arq_img, length(arq_img) - 2, 3);
    if sentido = '+' then ext := '000' + inttostr(strtoint(ext) + 1) else ext := '000' + inttostr(strtoint(ext) - 1);
    ext := copy(ext, length(ext) - 2, 3);
    arq_img := copy(arq_img,1, length(arq_img) - 3) + ext;
    if not fileexists(arq_img) then
    begin
      result := '';
    end
    else
    begin
      result  := arq_img;
      arq_fim := arq_img;
    end;
  end;
  Result := arq_fim;
end;


Procedure Carrega_Configuracoes;
begin
  DM_IMG.TQ_CONFIG_IMG.Close;
  DM_IMG.TQ_CONFIG_IMG.SQL.Clear;
  DM_IMG.TQ_CONFIG_IMG.SQL.Add('SELECT * FROM config_img');
  DM_IMG.TQ_CONFIG_IMG.Open;


  dir_matricula := DM_IMG.TQ_CONFIG_IMG.FieldByName('dir_matricula').AsString;
  dir_livro3    := DM_IMG.TQ_CONFIG_IMG.FieldByName('dir_livro3').AsString;
  dir_indbens   := DM_IMG.TQ_CONFIG_IMG.FieldByName('dir_indbens').AsString;
  dir_temp      := DM_IMG.TQ_CONFIG_IMG.FieldByName('dir_temp').AsString;
  dir_modelos   := DM_IMG.TQ_CONFIG_IMG.FieldByName('dir_modelos').AsString;
  dir_carimbos  := DM_IMG.TQ_CONFIG_IMG.FieldByName('dir_carimbos').AsString;
  dir_digital   := DM_IMG.TQ_CONFIG_IMG.FieldByName('dir_digital').AsString;

  oficial_cert  := DM_IMG.TQ_CONFIG_IMG.FieldByName('oficial_cert').AsString;
  estado_cert   := DM_IMG.TQ_CONFIG_IMG.FieldByName('estado_cert').AsString;
  total_cert    := DM_IMG.TQ_CONFIG_IMG.FieldByName('total_cert').AsString;

  oficial_zeis  := DM_IMG.TQ_CONFIG_IMG.FieldByName('oficial_zeis').AsString;
  estado_zeis   := DM_IMG.TQ_CONFIG_IMG.FieldByName('estado_zeis').AsString;
  total_zeis    := DM_IMG.TQ_CONFIG_IMG.FieldByName('total_zeis').AsString;

  DM_IMG.TQ_CONFIG_IMG.Close;



  DM_IMG.ArqAux.Close;
  DM_IMG.ArqAux.Sql.Clear;
  DM_IMG.ArqAux.Sql.Add('select xml_dir, xml_codserv from configur');
  DM_IMG.ArqAux.Open;



  dir_daje := DM_IMG.ArqAux.FieldByname('xml_dir').AsString;
  id_eselo := DM_IMG.ArqAux.FieldByname('xml_codserv').AsString;

  DM_IMG.ArqAux.Close;


end;




Function Pega_Ext(Arq : String) : String;
var
  x : Integer;
Begin
  x := length(arq);
  result := '';
  while x > 0 do
  begin
    if copy(arq, x,1) <> '.' then result := copy(arq, x,1) + result else x := 0;
    x := x - 1;
  end;
end;

Function Pega_Arq(Arq : String) : String;
var
  x : Integer;
Begin
  x := 1;
  result := '';
  while x <= length(arq) do
  begin
    if copy(arq, x, 1) <> '.' then result := result + copy(arq, x, 1) else x := length(arq) + 1;
    x := x + 1;
  end;
end;

Function Andar(arq_img, sentido : String) : String;
var
  ext : String;
Begin
  {if (FileExists('C:\siscart\temp\td\' + strZero(arq, 3) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 3) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 4) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 4) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 5) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 5) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 6) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 6) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 7) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 7) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 8) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 8) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 9) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 9) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 10) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 10) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 11) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 11) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 12) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 12) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 13) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 13) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 14) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 14) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 15) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 15) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 16) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\siscart\temp\td\' + strZero(arq, 16) + '.001';
  End; }

  {ext := copy(arq_img, length(arq_img) - 2, 3);

  if sentido = '+' then
    ext := '000' + inttostr(strtoint(ext) + 1)
  else
  ext := '000' + inttostr(strtoint(ext) - 1);

  ext := copy(ext, length(ext) - 2, 3);

  arq_img := copy(arq_img,1, length(arq_img) - 3) + ext;

  if not fileexists(arq_img) then
    result := ''
  else
  result := arq_img; }

  {A Rotina acima é a original}
  if sentido = '+' then
    ext := inttostr(strtoint(TirarTudo(copy(arq_img, length(arq_img) - 3, 6), '.', '-', '/') ) + 1)
  else
  ext := inttostr(strtoint(TirarTudo(copy(arq_img, length(arq_img) - 3, 6), '.', '-', '/') ) - 1);

  IF strtoint(copy(ext, length(ext) - 3, 6)) < 1000 Then
  Begin
    ext := copy(arq_img, length(arq_img) - 2, 3);

    if sentido = '+' then    //CRIAR A CONDIÇÃO ANTES DESTA LINHA CHECANDO SE É MENOR QUE 999
      ext := '000' + inttostr(strtoint(ext) + 1)
    else
    ext := '000' + inttostr(strtoint(ext) - 1);

    ext := copy(ext, length(ext) - 2, 3); //Nesta rotina quando o valor é 0001000 ele pega os 3 primeiros zeros

    arq_img := copy(arq_img,1, length(arq_img) - 3) + ext;

    if not fileexists(arq_img) then
      result := ''
    else
    result := arq_img;
  End
  Else
  Begin
    ext := inttostr(strtoint(TirarTudo(copy(arq_img, length(arq_img) - 3, 6), '.', '-', '/') )); //Nesta rotina quando o valor é 0001000 ele pega os 3 primeiros zeros

    if sentido = '+' then    //CRIAR A CONDIÇÃO ANTES DESTA LINHA CHECANDO SE É MENOR QUE 999
      ext := inttostr(strtoint(ext) + 1)
    else
    ext := inttostr(strtoint(ext) - 1);


    if (length(arq_img)-pos('.',arq_img) < 4) Then
      arq_img := copy(arq_img,1, length(arq_img) - 3) + ext
    else
    arq_img := copy(arq_img,1, length(arq_img) - 4) + ext;



    if not fileexists(arq_img) then
      result := ''
    else
    result := arq_img;

  End;


end;

Function Cota_XPress(Linha, coluna : Integer) : Boolean;
var
  datac, codEmissor : String;
  xf, xc, xy, lin_o, xd, font_ant, espaco : integer;
Begin
  With F_Certidao do
  Begin
    { Imprimindo Cota }
    hora  := timetostr(time);
    col_i := coluna;
    lin_i := linha;

    nome_ant := F_Certidao.Xpress1.Font.Name;
    F_Certidao.Xpress1.Font.Size := 26;
    F_Certidao.Xpress1.Font.Name := 'Courier New';
    F_Certidao.Xpress1.Font.Style := [fsBold];

    if F_Certidao.CheckBox3.Checked then
    begin
      F_Certidao.Xpress1.Font.Size := 30;
      F_Certidao.Xpress1.Font.Style := [fsBold];
//      F_Certidao.Xpress1.DrawTextString(lin_i, col_i-100,'CONTINUAÇÃO DA MATRÍCULA Nº ' + F_Certidao.MaskEdit1.text, RGB(0, 0, 0));

      {if ComboBox6.text = 'Ficha L3 Nº' then
        F_Certidao.Xpress1.DrawTextString(lin_i, col_i-150,'CONTINUAÇÃO DA REGISTRO Nº ' + F_Certidao.MaskEdit1.text, RGB(0, 0, 0))
      else
      F_Certidao.Xpress1.DrawTextString(lin_i, col_i-150,'CONTINUAÇÃO DA MATRÍCULA Nº ' + F_Certidao.MaskEdit1.text, RGB(0, 0, 0))}

    {  if ComboBox6.text = 'Ficha L3 Nº' then
        F_Certidao.Xpress1.DrawTextString(lin_i, col_i-10,'CONTINUAÇÃO DA REGISTRO Nº ' + F_Certidao.MaskEdit1.text, RGB(0, 0, 0))
      else
      begin
        //if (F_menu.LbCnpj.Caption = '29803586000104') or (F_menu.LbCnpj.Caption = '29.803.586/0001-04') Then
        begin
          F_Certidao.Xpress1.DrawTextString(lin_i, col_i+110,'CONTINUAÇÃO DA MATRÍCULA Nº ' + F_Certidao.MaskEdit1.text, RGB(0, 0, 0)) //almeida colocar cnpj
        end
        //else
        //begin
          //F_Certidao.Xpress1.DrawTextString(lin_i, col_i-10,'CONTINUAÇÃO DA MATRÍCULA Nº ' + F_Certidao.MaskEdit1.text, RGB(0, 0, 0));
        //end;
      end }
    end;

   { if f_contri.richedit2.text <> '' then
    begin
      F_Certidao.Xpress1.Font.Name := nome_ant;
      F_Certidao.Xpress1.Font.Size := 28;
      F_Certidao.Xpress1.Font.Style := [fsBold];
      if f_contri.richedit2.Lines.Count <= 1 then
      begin
        F_Certidao.Xpress1.DrawTextString(lin_i, col_i-100,'Título contraditório prenotado: ', RGB(0, 0, 0));
        lin_i := lin_i + 580;
      end
      else
      begin
        F_Certidao.Xpress1.DrawTextString(lin_i, col_i-100, 'Título(s) contraditório(s) prenotado(s):', RGB(0, 0, 0));
        lin_i := lin_i + 680;    // Teste almeida
        //lin_i := lin_i + 480;
      end;
      for xc := 0 to f_contri.richedit2.lines.count - 1 do
      begin
        F_Certidao.Xpress1.Font.Name := 'Courier New';
        F_Certidao.Xpress1.Font.Size := 26;
        if f_contri.richedit2.lines.strings[xc+1] <> '' then
        begin
          if xc = 2 then
          begin
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i-90,f_contri.richedit2.lines.strings[xc] + ', etc...', RGB(0, 0, 0));
            break;
          end
          else if xc = 1 then
          begin
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i-90,f_contri.richedit2.lines.strings[xc] + ',', RGB(0, 0, 0));
            col_i := col_i + 30;
            lin_i := lin_i - 750;
          end
          else
          Begin
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i-90,f_contri.richedit2.lines.strings[xc] + ',', RGB(0, 0, 0));
            lin_i := lin_i + 750;
          end;
        end
        else
        begin
          F_Certidao.Xpress1.DrawTextString(lin_i, col_i-90,f_contri.richedit2.lines.strings[xc] + '.', RGB(0, 0, 0));
        end;
      end;
    end;  }
    xy := 0;
    col_i := coluna;
    lin_i := linha;
    F_Certidao.Xpress1.Font.Name := 'Courier New';
    F_Certidao.Xpress1.Font.Style := [fsBold];
    F_Certidao.Xpress1.Font.Size := 28;
    lin_o := lin_i + xy;
    espaco := 33;
    if (not CheckBox2.checked) then
    Begin
      if checkbox3.Checked then
      begin
        xy := xy - 40;
      end;

      DM_IMG.qryGenerico.Close;
      DM_IMG.qryGenerico.SQL.Clear;
      DM_IMG.qryGenerico.SQL.Add('SELECT d.iddaje_tj, c.* FROM certidao c inner join daje d on (c.daje = d.numero_daje) and (c.serie_daje = d.serie_daje) WHERE nr_protoc ='+QuotedStr(F_Certidao.MaskEdit1.Text)+'');
      DM_IMG.qryGenerico.Open;

      {if DM_IMG.qryGenerico.FieldByName('iddaje_tj').AsString <> '' Then
        codEmissor:= id_eselo
      else
      codEmissor:= '9999';}

      if DM_IMG.qryGenerico.FieldByName('serie_daje').AsString = '002' Then
      begin
        if (DM_IMG.qryGenerico.FieldByName('iddaje_tj').AsString <> id_eselo) and (DM_IMG.qryGenerico.FieldByName('iddaje_tj').AsString <> '9999') then
          codEmissor:= DM_IMG.qryGenerico.FieldByName('iddaje_tj').AsString
        else
        codEmissor:= id_eselo;
      end
      else
      codEmissor:= DM_IMG.qryGenerico.FieldByName('iddaje_tj').AsString;

      DM_IMG.qryGenerico_Auxiliar_1.Close;
      DM_IMG.qryGenerico_Auxiliar_1.SQL.Clear;
      DM_IMG.qryGenerico_Auxiliar_1.SQL.Add('SELECT iddaje_tj, serie_daje, numero_daje, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje, vr_pge, fmmpba FROM daje WHERE numero_daje_complementar = '+QuotedStr(DM_IMG.qryGenerico.FieldByName('daje').AsString)+' and serie_daje_complementar = '+QuotedStr(DM_IMG.qryGenerico.FieldByName('serie_daje').AsString)+'');
      DM_IMG.qryGenerico_Auxiliar_1.Open;

      if DM_IMG.qryGenerico_Auxiliar_1.FieldByName('numero_daje').AsString <> '' Then
      begin
        DM_IMG.qryGenerico_Auxiliar.Close;
        DM_IMG.qryGenerico_Auxiliar.SQL.Clear;
        DM_IMG.qryGenerico_Auxiliar.SQL.Add('SELECT iddaje_tj, serie_daje, numero_daje, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje, vr_pge, fmmpba FROM daje WHERE numero_daje = '+QuotedStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('numero_daje').AsString)+' and serie_daje = '+QuotedStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('serie_daje').AsString)+'');
        DM_IMG.qryGenerico_Auxiliar.Open;

        DM_IMG.qryGenerico_Auxiliar_1.Close;
        DM_IMG.qryGenerico_Auxiliar_1.SQL.Clear;
        DM_IMG.qryGenerico_Auxiliar_1.SQL.Add('SELECT iddaje_tj, serie_daje, numero_daje, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje, vr_pge, fmmpba FROM daje WHERE numero_daje = '+QuotedStr(DM_IMG.qryGenerico.FieldByName('daje').AsString)+' and serie_daje = '+QuotedStr(DM_IMG.qryGenerico.FieldByName('serie_daje').AsString)+'');
        DM_IMG.qryGenerico_Auxiliar_1.Open;

      end
      else
      begin

        DM_IMG.qryGenerico_Auxiliar_1.Close;
        DM_IMG.qryGenerico_Auxiliar_1.SQL.Clear;
        DM_IMG.qryGenerico_Auxiliar_1.SQL.Add('SELECT iddaje_tj, serie_daje_complementar, numero_daje_complementar, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje, vr_pge, fmmpba FROM daje WHERE numero_daje = '+QuotedStr(DM_IMG.qryGenerico.FieldByName('daje').AsString)+' and serie_daje = '+QuotedStr(DM_IMG.qryGenerico.FieldByName('serie_daje').AsString)+'');
        DM_IMG.qryGenerico_Auxiliar_1.Open;

        DM_IMG.qryGenerico_Auxiliar.Close;
        DM_IMG.qryGenerico_Auxiliar.SQL.Clear;
        DM_IMG.qryGenerico_Auxiliar.SQL.Add('SELECT iddaje_tj, serie_daje_complementar, numero_daje_complementar, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje, vr_pge, fmmpba FROM daje WHERE numero_daje = '+QuotedStr('0')+' and serie_daje = '+QuotedStr('0')+'');
        DM_IMG.qryGenerico_Auxiliar.Open;

      end;

      if (uppercase(copy(combobox2.text,1,10)) <> 'PREFEITURA') and (uppercase(copy(combobox2.text,1,5)) <> 'CAIXA') and (Trim(combobox2.text) <> 'Certidão Gratuita(NIHIL)') then
      begin
        if true then
        begin
          if ( TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '28287131000110') or (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '26967669000140') Then  //Serrinha e Araci
          Begin
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 330, ' Daje: '+codEmissor+'-'+DM_IMG.qryGenerico.FieldByName('serie_daje').AsString+'-'+DM_IMG.qryGenerico.FieldByName('daje').AsString, RGB(0, 0, 0));

            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 290, 'Emolumentos: R$ ' + (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('emol_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('emol_daje').AsCurrency)) +
                                                                ' Fiscal: R$ ' + (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('tx_fisca_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('tx_fisca_daje').AsCurrency)) +
                                                                ' FECOM: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('fecom_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('fecom_daje').AsCurrency)) +
                                                                ' Defensoria: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('def_pub_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('def_pub_daje').AsCurrency)) +
                                                                ' PGE: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('vr_pge').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('vr_pge').AsCurrency)) +
                                                                ' FMMPBA: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('fmmpba').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('fmmpba').AsCurrency)), RGB(0, 0, 0));

            oficial_cert:= CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('vr_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('vr_daje').AsCurrency);

            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 250, 'Total: R$ ' + oficial_cert, RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 200, 'SELOS E CONTRIBUIÇÕES', RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 150, 'RECOLHIDOS POR VERBA ', RGB(0, 0, 0));
          End
          Else
          if (F_menu.LbCnpj.Caption = '15224679000170') or (F_menu.LbCnpj.Caption = '15.224.679/0001-70') Then  //Camaçari
          Begin
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 250, 'Daje: '+codEmissor+'-'+DM_IMG.qryGenerico.FieldByName('serie_daje').AsString+'-'+DM_IMG.qryGenerico.FieldByName('daje').AsString, RGB(0, 0, 0));

            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 210, 'Emolumentos: R$ ' + (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('emol_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('emol_daje').AsCurrency)) +
                                                                ' Fiscal: R$ ' + (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('tx_fisca_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('tx_fisca_daje').AsCurrency)) +
                                                                ' FECOM: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('fecom_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('fecom_daje').AsCurrency)) +
                                                                ' Defensoria: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('def_pub_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('def_pub_daje').AsCurrency)) +
                                                                ' PGE: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('vr_pge').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('vr_pge').AsCurrency)) +
                                                                ' FMMPBA: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('fmmpba').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('fmmpba').AsCurrency)), RGB(0, 0, 0));

            oficial_cert:= CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('vr_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('vr_daje').AsCurrency);

            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 170, 'Total: R$ ' + oficial_cert, RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 120, 'SELOS E CONTRIBUIÇÕES', RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 70, 'RECOLHIDOS POR VERBA ', RGB(0, 0, 0));
          End

          Else
          Begin
            //F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 85, 'Nº Daje/Serie: '+DM_IMG.qryGenerico.FieldByName('iddaje_tj').AsString+''+DM_IMG.qryGenerico.FieldByName('numero_daje').AsString+''+DM_IMG.qryGenerico.FieldByName('serie_daje').AsString, RGB(0, 0, 0));
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 50, 'Emolumentos: R$ ' + (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('emol_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('emol_daje').AsCurrency)) +
                                                                ' Fiscal: R$ ' + (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('tx_fisca_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('tx_fisca_daje').AsCurrency)) +
                                                                ' FECOM: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('fecom_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('fecom_daje').AsCurrency)) +
                                                                ' Defensoria: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('def_pub_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('def_pub_daje').AsCurrency)) +
                                                                ' PGE: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('vr_pge').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('vr_pge').AsCurrency))+
                                                                ' FMMPBA: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('fmmpba').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('fmmpba').AsCurrency)), RGB(0, 0, 0));

            //F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 50, 'Daje: '+DM_IMG.qryGenerico.FieldByName('iddaje_tj').AsString+''+DM_IMG.qryGenerico.FieldByName('numero_daje').AsString+''+DM_IMG.qryGenerico.FieldByName('serie_daje').AsString, RGB(0, 0, 0));

            oficial_cert:= CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('vr_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('vr_daje').AsCurrency);

            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 5, 'Total: R$ ' + oficial_cert + '' + ' Daje: '+codEmissor+'-'+DM_IMG.qryGenerico.FieldByName('serie_daje').AsString+'-'+DM_IMG.qryGenerico.FieldByName('daje').AsString, RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i +30,  '' + 'Protocolo: '+Maskedit1.text, RGB(0, 0, 0));
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'SELOS E CONTRIBUIÇÕES', RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'RECOLHIDOS POR VERBA ', RGB(0, 0, 0));

            {F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 85, 'Nº Daje/Serie: '+DM_IMG.qryGenerico.FieldByName('numero_daje').AsString +''+DM_IMG.qryGenerico.FieldByName('serie_daje').AsString, RGB(0, 0, 0));

            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 50, 'Emolumentos: R$ ' + (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('emol_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('emol_daje').AsCurrency)) +
                                                                ' Fiscal: R$ ' + (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('tx_fisca_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('tx_fisca_daje').AsCurrency)) +
                                                                ' FECOM: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('fecom_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('fecom_daje').AsCurrency)) +
                                                                ' Defensoria: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('def_pub_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('def_pub_daje').AsCurrency)) +
                                                                ' PGE: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('vr_pge').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('vr_pge').AsCurrency)), RGB(0, 0, 0));

            oficial_cert:= CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('vr_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('vr_daje').AsCurrency);

            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 5, 'Total......: R$ ' + oficial_cert, RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'SELOS E CONTRIBUIÇÕES', RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'RECOLHIDOS POR VERBA ', RGB(0, 0, 0));}
          End
        end
        else
        Begin
          if uppercase(combobox2.text) = 'FAZENDA ESTADUAL' then
          begin
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'ISENTO DE CUSTAS', RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' REQUISIÇÃO DA ', RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'FAZENDA ESTADUAL', RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
            xy := xy + espaco;
            F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
          end
          else
          Begin
            if uppercase(combobox2.text) = 'FAZENDA NACIONAL' then
            begin
              F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'ISENTO DE CUSTAS', RGB(0, 0, 0));
              xy := xy + espaco;
              F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
              xy := xy + espaco;
              F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' REQUISIÇÃO DA ', RGB(0, 0, 0));
              xy := xy + espaco;
              F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
              xy := xy + espaco;
              F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'FAZENDA NACIONAL', RGB(0, 0, 0));
              xy := xy + espaco;
              F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
              xy := xy + espaco;
              F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
              xy := xy + espaco;
              F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
            end
            else
            Begin
              if uppercase(combobox2.text) = 'INSS' then
              begin
                F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'ISENTO DE CUSTAS', RGB(0, 0, 0));
                xy := xy + espaco;
                F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                xy := xy + espaco;
                F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' REQUISIÇÃO DO ', RGB(0, 0, 0));
                xy := xy + espaco;
                F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                xy := xy + espaco;
                F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, '      INSS     ', RGB(0, 0, 0));
                xy := xy + espaco;
                F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                xy := xy + espaco;
                F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                xy := xy + espaco;
                F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
              end
              else
              Begin
                if uppercase(combobox2.text) = 'INCRA' then
                begin
                  F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'ISENTO DE CUSTAS', RGB(0, 0, 0));
                  xy := xy + espaco;
                  F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                  xy := xy + espaco;
                  F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' REQUISIÇÃO DO ', RGB(0, 0, 0));
                  xy := xy + espaco;
                  F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                  xy := xy + espaco;
                  F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, '     INCRA     ', RGB(0, 0, 0));
                  xy := xy + espaco;
                  F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                  xy := xy + espaco;
                  F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                  xy := xy + espaco;
                  F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                end
                else
                Begin
                  if copy(uppercase(combobox2.text),1,3) = 'REQ' then
                  begin
                    F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'ISENTO DE CUSTAS', RGB(0, 0, 0));
                    xy := xy + espaco;
                    F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                    xy := xy + espaco;
                    F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, '   REQUISIÇÃO  ', RGB(0, 0, 0));
                    xy := xy + espaco;
                    F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                    xy := xy + espaco;
                    F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, '    JUDICIAL  ', RGB(0, 0, 0));
                    xy := xy + espaco;
                    F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                    xy := xy + espaco;
                    F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                    xy := xy + espaco;
                    F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                  end
                  else
                  begin
                    if uppercase(combobox2.text) = 'ZEIS' then
                    begin

                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 85, 'Daje: '+codEmissor+'-'+DM_IMG.qryGenerico.FieldByName('serie_daje').AsString+'-'+DM_IMG.qryGenerico.FieldByName('daje').AsString, RGB(0, 0, 0));

                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'Emolumentos: R$ ' + oficial_zeis, RGB(0, 0, 0));
                      xy := xy + espaco;
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'Tx. Fiscal.: R$ ' + estado_zeis, RGB(0, 0, 0));
                      xy := xy + espaco;
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'Total: R$ ' + total_zeis, RGB(0, 0, 0));
                      xy := xy + espaco;
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'SELOS E CONTRIBUIÇÕES', RGB(0, 0, 0));
                      xy := xy + espaco;
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'RECOLHIDOS POR VERBA ', RGB(0, 0, 0));
                    end
                    else
                    Begin
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'ISENTO DE CUSTAS', RGB(0, 0, 0));
                      xy := xy + espaco;
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                      xy := xy + espaco;
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, '   REQUISIÇÃO  ', RGB(0, 0, 0));
                      xy := xy + espaco;
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                      xy := xy + espaco;
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy,  Combobox2.Text, RGB(0, 0, 0));
                      xy := xy + espaco;
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                      xy := xy + espaco;
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                      xy := xy + espaco;
                      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, ' ', RGB(0, 0, 0));
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
      if (uppercase(copy(combobox2.text,1,10)) = 'PREFEITURA') or (uppercase(copy(combobox2.text,1,5)) = 'CAIXA') then
      begin

        //F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 85, 'Nº Daje/Serie: '+DM_IMG.qryGenerico.FieldByName('numero_daje').AsString +''+DM_IMG.qryGenerico.FieldByName('serie_daje').AsString, RGB(0, 0, 0));

        F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 50, 'Emolumentos: R$ ' + (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('emol_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('emol_daje').AsCurrency)) +
                                                            ' Fiscal: R$ ' + (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('tx_fisca_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('tx_fisca_daje').AsCurrency)) +
                                                            ' FECOM: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('fecom_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('fecom_daje').AsCurrency)) +
                                                            ' Defensoria: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('def_pub_daje').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('def_pub_daje').AsCurrency)) +
                                                            ' PGE: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('vr_pge').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('vr_pge').AsCurrency)) +
                                                            ' FMMPBA: R$ '+ (CurrToStr(DM_IMG.qryGenerico_Auxiliar_1.FieldByName('fmmpba').AsCurrency + DM_IMG.qryGenerico_Auxiliar.FieldByName('fmmpba').AsCurrency)), RGB(0, 0, 0));

        oficial_cert:= DM_IMG.qryGenerico_Auxiliar.FieldByName('vr_daje').AsString;

        xy := xy + espaco;
        F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 5, 'Total: R$ ' + oficial_cert + '  Daje: '+codEmissor+'-'+ DM_IMG.qryGenerico.FieldByName('serie_daje').AsString +'-'+ DM_IMG.qryGenerico.FieldByName('daje').AsString, RGB(0, 0, 0));
        //F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'Tx. Fiscal.: R$ Nihil', RGB(0, 0, 0));
        xy := xy + espaco;
        //F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'Total......: R$ ' + oficial_cert, RGB(0, 0, 0));
        xy := xy + espaco;
        xy := xy + espaco;

        if uppercase(copy(combobox2.text,1,10)) = 'PREFEITURA' then
        begin
          F_Certidao.Xpress1.DrawTextString(lin_i, col_i - 85, '  Daje: '+codEmissor+'-'+DM_IMG.qryGenerico.FieldByName('serie_daje').AsString+'-'+DM_IMG.qryGenerico.FieldByName('daje').AsString, RGB(0, 0, 0));

          F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'Certidão expedida nos termos do', RGB(0, 0, 0));
          xy := xy + espaco;
          F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'artigo 8º da Lei nº 11.331/2002', RGB(0, 0, 0))
        end
        else
        begin
          F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, '      Solicitação feita pela      ', RGB(0, 0, 0));
          xy := xy + espaco;
          F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, '      Caixa Econômica Federal', RGB(0, 0, 0));
        end;
      end
      else
      begin
        if Trim(combobox2.text) = 'Certidão Gratuita(NIHIL)' then
        begin
          F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'Emolumentos: R$ Nihil', RGB(0, 0, 0));
          xy := xy + espaco;
          F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'Tx. Fiscal.: R$ Nihil', RGB(0, 0, 0));
          xy := xy + espaco;
          F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, 'Total: R$ Nihil', RGB(0, 0, 0));
          xy := xy + espaco;
          xy := xy + espaco;
          F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, '        Certidão Gratuita         ', RGB(0, 0, 0));
          xy := xy + espaco;
          F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy, '                             ', RGB(0, 0, 0));
        end;
      end;
      xy := xy + 60;
//      F_Certidao.Xpress1.DrawTextString(lin_i, col_i + xy,'Controle Interno Nº ' + maskedit5.text, RGB(0, 0, 0));
    end;
    if (not F_Certidao.CheckBox2.Checked) then
    begin
      F_Certidao.Xpress1.Font.Name := 'Arial';
      F_Certidao.Xpress1.FOnt.Size := 30;
      lin_i := lin_o;
{ OS.49.220 - EDSON
      if F_Certidao.CheckBox5.Checked then
        F_Certidao.Xpress1.DrawTextString(lin_i + 500, col_i, 'Certidão expedida às ' + TimeToStr(time) + ' horas do dia ' + formatdatetime('dd"/"mm"/"yyyy', date) + '. Certidão assinada digitalmente.', RGB(0, 0, 0))
      else
        F_Certidao.Xpress1.DrawTextString(lin_i + 500, col_i, 'Certidão expedida às ' + TimeToStr(time) + ' horas do dia ' + formatdatetime('dd"/"mm"/"yyyy', date) + '.', RGB(0, 0, 0));
}
      if (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '28287131000110') or (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '15224679000170') or (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '26967669000140') Then  //Serrinha e Araci
      begin
     {   if F_Certidao.CheckBox5.Checked then
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i - 175, 'Certidão expedida às ' + Trim(F_Certidao.Maskedit7.Text) + ' horas do dia ' + formatdatetime('dd"/"mm"/"yyyy', StrToDate(F_Certidao.Maskedit6.Text)) + '. Certidão assinada digitalmente.', RGB(0, 0, 0))
        else   }
        F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i - 175, 'Certidão expedida às ' + Trim(F_Certidao.Maskedit7.Text) + ' horas do dia ' + formatdatetime('dd"/"mm"/"yyyy', StrToDate(F_Certidao.Maskedit6.Text)) + '.', RGB(0, 0, 0));
      End
      Else
      Begin
        {if F_Certidao.CheckBox5.Checked then
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i, 'Certidão expedida às ' + Trim(F_Certidao.Maskedit7.Text) + ' horas do dia ' + formatdatetime('dd"/"mm"/"yyyy', StrToDate(F_Certidao.Maskedit6.Text)) + '. Certidão assinada digitalmente.', RGB(0, 0, 0))
        else}
        F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i, 'Certidão expedida às ' + Trim(F_Certidao.Maskedit7.Text) + ' horas do dia ' + formatdatetime('dd"/"mm"/"yyyy', StrToDate(F_Certidao.Maskedit6.Text)) + '.', RGB(0, 0, 0));
      End;

      F_Certidao.Xpress1.FOnt.Size := 20;
      { Código de Barras }
//      datac := datetostr(date);
      datac := Maskedit6.Text;
      protoc := '000000' + MaskEdit1.Text;
      protoc := Copy(protoc,length(protoc) - 5,6);
      protoc := protoc + Copy(datac,1,2) + Copy(datac,4,2) + Copy(datac,7,4);
      F_Certidao.Xpress1.FOnt.Size := 28;
      //F_Certidao.Xpress1.DrawTextString(lin_i + 500, col_i + 45, 'Para lavratura de escrituras esta certidão é válida por 30 dias (Art. 1°, IV, Decreto 93.240/86).', RGB(0, 0, 0));
      //F_Certidao.Xpress1.DrawTextString(lin_i + 500, col_i + 100, 'Código de controle de certidão :', RGB(0, 0, 0));


      if((TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') <> '16131328000187') and
        (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') <>  '31885166000166'))  then
      begin
        if (F_menu.LbCnpj.Caption = '27215776000185') or (F_menu.LbCnpj.Caption = '27.215.776/0001-85') Then  //Itaparica
        Begin
          F_Certidao.Xpress1.DrawTextString(lin_i + 500, col_i + 32, 'O prazo de entrega poderá ser prorrogado por até 10(dez) dias, quando relativas a imóveis ainda', RGB(0, 0, 0));
          F_Certidao.Xpress1.DrawTextString(lin_i + 500, col_i + 62, 'sujeitos ao regime de registro anterior á Lei 6.015/73, pedidos de certidão com buscas nos Livros 3 -', RGB(0, 0, 0));
          F_Certidao.Xpress1.DrawTextString(lin_i + 500, col_i + 92, 'Auxiliar, 4 - Indicador Real e 5 - Indicador Pessoal e pedidos de certidões cuja expedição dependa de', RGB(0, 0, 0));
          F_Certidao.Xpress1.DrawTextString(lin_i + 500, col_i + 122, 'buscas que importem em levantamentos, conforme estabelece o art. 827 do Código de Normas/BA', RGB(0, 0, 0));
        End
        Else
        if (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '28287131000110') or (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '26967669000140') Then  //Serrinha
        Begin
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + -260, 'O prazo de validade desta certidão é de 30(trinta) dias.', RGB(0, 0, 0));
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + -215, 'Art. 764(Código de Normas de Serviços dos Oficios Extrajudiciais Bahia).', RGB(0, 0, 0));
        End
        Else
        if (F_menu.LbCnpj.Caption = '15224679000170') or (F_menu.LbCnpj.Caption = '15.224.679/0001-70') Then
        Begin
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i - 70, 'O prazo de validade desta certidão é de 30(trinta) dias.', RGB(0, 0, 0));
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i - 120, 'Art. 764(Código de Normas de Serviços dos Oficios Extrajudiciais Bahia).', RGB(0, 0, 0));
        End
        Else
        If (F_menu.LbCnpj.Caption = '13225586000134') or (F_menu.LbCnpj.Caption = '13.225.586/0001-34') or
           (F_menu.LbCnpj.Caption = '32826440000199') or (F_menu.LbCnpj.Caption = '32.826.440/0001-99') Then
        begin
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + 45, 'O prazo de validade desta certidão é de 60(sessenta) dias.', RGB(0, 0, 0));
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + 90, 'Art. 764(Código de Normas de Serviços dos Oficios Extrajudiciais Bahia).', RGB(0, 0, 0));
        end
        Else
        Begin
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + 45, 'O prazo de validade desta certidão é de 30(trinta) dias.', RGB(0, 0, 0));
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + 90, 'Art. 764(Código de Normas de Serviços dos Oficios Extrajudiciais Bahia).', RGB(0, 0, 0));
        End;
      end;
      //Printer.Canvas.TextOut(col_i + 630, lin_i + 45, 'O prazo de validade desta certidão é de 30(trinta) dias. Art. 829(Código de Normas de Serviços dos Oficios Extrajudiciais Bahia).');


      if (F_menu.LbCnpj.Caption = '15224679000170') or (F_menu.LbCnpj.Caption = '15.224.679/0001-70') Then
      begin
      {  if tem_pedido and (maskedit5.text <> '') then
        Begin
          if CheckBox13.Checked then
            F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i - 20,  'Pedido Nº' + Maskedit5.text +' Certidão assinada digitalmente por Maise Campos Sarlo', RGB(0, 0, 0))
          else
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i - 20,  'Pedido Nº ' + Maskedit5.text, RGB(0, 0, 0));
        End; }
      end
      ELSE
      {if (F_menu.LbCnpj.Caption <> '28287131000110') Then  //Serrinha
      begin
        if tem_pedido and (maskedit5.text <> '') then
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + 127,  'Pedido Nº ' + Maskedit5.text, RGB(0, 0, 0));
      end;    }



      if tem_pre    and (maskedit1.text <> '') then F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + 127,  'Prenotação Nº ' + Maskedit1.text, RGB(0, 0, 0));

      if tem_arisp  and (maskedit1.text <> '') then F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + 127,  'ARISP Nº ' + Maskedit1.text, RGB(0, 0, 0));

     { if tem_oficio and (maskedit1.text <> '') then
      Begin
        if F_Certidao.ComboBox5.text = 'Internet Nº' then F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + 140,  'Internet Nº ' + Maskedit5.text, RGB(0, 0, 0)) else  F_Certidao.Xpress1.DrawTextString(lin_i + 500, col_i + 127,  'Ofício Nº ' + Maskedit5.text, RGB(0, 0, 0));
      end; }

    {  if tem_outro and (maskedit1.text <> '') then
        F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + 140,  ' ' + 'Protocolo :'+Maskedit1.text, RGB(0, 0, 0));}

      if (F_menu.LbCnpj.Caption <> '28287131000110') Then  //Serrinha
      begin
        if (F_Certidao.label13.caption = 'balcao')  and (maskedit1.text <> '') then
          F_Certidao.Xpress1.DrawTextString(lin_i + 900, col_i + 100,  'Pedido Nº ' + Maskedit1.text, RGB(0, 0, 0));
      end;

      altura0 := 80;
      largura0 := 3;
//      GerCodBar1_XPress(col_i + 2050, lin_i + 85, altura0, largura0, protoc, True, False);
       F_Certidao.GerCodBar1_XPress(col_i + 2600, lin_i + 85, altura0, largura0, protoc, True, False);
    end;
  end;
end;

function  TF_Certidao.GerCodBar1_XPress(col, lin, alt, lar : Integer; par : String; Caracter, Bmp : Boolean): String;
var
  tampen, vezes, x, y, pos, posini, plinha , paltura, paltura1, plargura, oldfont : Integer;
  barras, espacos : Array[1..10] of String;
  ret, inicio, fim, dig1, dig2, bar1, bar2 : String;
begin
  // O Parâmetro "par" tem que ser um número par !!!
  result := '';
  if par = '' then
  begin
    Showmessage('Número Nulo');
    Exit;
  end;
  { Gerando Codigo }
  barras[1] := 'LEEEL';
  barras[2] := 'ELEEL';
  barras[3] := 'LLEEE';
  barras[4] := 'EELEL';
  barras[5] := 'LELEE';
  barras[6] := 'ELLEE';
  barras[7] := 'EEELL';
  barras[8] := 'LEELE';
  barras[9] := 'ELELE';
  barras[10] := 'EELLE';
  espacos[1] := 'leeel';
  espacos[2] := 'eleel';
  espacos[3] := 'lleee';
  espacos[4] := 'eelel';
  espacos[5] := 'lelee';
  espacos[6] := 'ellee';
  espacos[7] := 'eeell';
  espacos[8] := 'leele';
  espacos[9] := 'elele';
  espacos[10] := 'eelle';
  inicio := 'EeEe';
  fim := 'LeE';
  ret := '';
  x := 1;
  While x <= length(par) do
  Begin
    dig1 := Copy(par,x,1);
    dig2 := Copy(par,x + 1,1);
    if (dig1 = '') or (dig2 = '') then x := 1000 else
    begin
      if strToInt(dig1) = 0 then dig1 := '10';
      if strToInt(dig2) = 0 then dig2 := '10';
      for y := 1 to 5 do
      begin
        bar1 := Copy(barras[StrToInt(dig1)],y,1);
        bar2 := Copy(espacos[StrToInt(dig2)],y,1);
        ret := ret + bar1 + bar2;
      end;
      x := x + 2;
    end;
  end;
  { Imprimindo }

  F_Certidao.Xpress1.DrawFillColor := clBlack;
  F_Certidao.Xpress1.DrawFillStyle := FILL_Solid;
  F_Certidao.Xpress1.DrawMode := PEN_Blackness;

  pos := col;
  pos := 1400;
  posini := col;
  plinha := lin;
//  plinha := 3200;
//  plinha := 3250;
  plinha := 3700;
//  plinha := 3670;
  x := 1;
  paltura := alt;
  plargura := lar;
  { linha Inicial }
  paltura1 := paltura;
  paltura := paltura + 10;
  for vezes := 1 to plargura do
  Begin
    F_Certidao.Xpress1.DrawRoundRect(pos, plinha, pos+1, plinha+paltura, 0, 0, RGB(255, 0, 0));
    pos := pos + 1;
  end;
  pos := pos + (2 * plargura);
  for vezes := 1 to plargura do
  Begin
    F_Certidao.Xpress1.DrawRoundRect(pos, plinha, pos + 1, plinha + paltura, 0, 0, RGB(255, 0, 0));
    pos := pos + 1;
  end;
  pos := pos + (2 * plargura);
  paltura := paltura1;
  { Codigo principal }
  While x <= length(ret) do
  begin
    if Copy(ret,x,1) = 'E' then
    Begin
      for vezes := 1 to plargura do
      Begin
        F_Certidao.Xpress1.DrawRoundRect(pos, plinha, pos + 1, plinha + paltura, 0, 0, RGB(255, 0, 0));
        pos := pos + 1;
      end;
    end;
    if Copy(ret,x,1) = 'L' then
    Begin
      for vezes := 1 to (3 * plargura) do
      Begin
        F_Certidao.Xpress1.DrawRoundRect(pos, plinha, pos + 1, plinha + paltura, 0, 0, RGB(255, 0, 0));
        pos := pos + 1;
      end;
    end;
    if Copy(ret,x,1) = 'e' then pos := pos + (2 * plargura);
    if Copy(ret,x,1) = 'l' then pos := pos + (4 * plargura);
    x := x + 1;
  end;
  { Linha Final }
  paltura1 := paltura;
  paltura := paltura + 10;
  for vezes := 1 to (3 * plargura) do
  Begin
    F_Certidao.Xpress1.DrawRoundRect(pos, plinha, pos + 1, plinha + paltura, 0, 0, RGB(255, 0, 0));
    pos := pos + 1;
  end;
  pos := pos + (2 * plargura);
  for vezes := 1 to plargura do
  Begin
    F_Certidao.Xpress1.DrawRoundRect(pos, plinha, pos + 1, plinha + paltura, 0, 0, RGB(255, 0, 0));
    pos := pos + 1;
  end;
  pos := pos + (2 * plargura);
  paltura := paltura1;
  { Impressão de caracteres }

  if caracter then
  begin
    F_Certidao.Xpress1.Font.Size := 20;
    F_Certidao.Xpress1.DrawTextString(1550, 3780, par, RGB(0, 0, 0));
//    F_Certidao.Xpress1.DrawTextString(1550, 3330, par, RGB(0, 0, 0));
  end;

  result := ret;
end;

Procedure Contar;
var
  qq : String;
  q : Integer;
Begin
  with F_Certidao do
  begin
    qq := copy(imgedit1.image,1,length(imgedit1.image) - 3) + '001';
    q := 0;
    while qq <> '' do
    Begin
      qq := andar(qq, '+');
      q := q + 1;
      Label28.Caption := 'Aguarde enquanto a imagem '+inttostr(q)+' é ajustada ...';
      Label28.Update;
    end;
   { if Length(inttostr(q)) < 4 Then
      Label4.Caption := copy('000' + inttostr(q), length('000' + inttostr(q)) -2, 3)
    else
    Label4.Caption := copy('000' + inttostr(q), length('000' + inttostr(q)) -3, 4);
        }
    Label28.Caption := 'Ajuste realizado com sucesso!';
    Label28.Update;    
  end;
end;

Procedure Carrega_XPress1(Imagem : String);
var
  mais_imagem, tem_branco : Boolean;
  arq_xpress, arq_xpress_ant, extensao, arq_temp,Ultimo : String;
  num_pag, desc_num,ultimapaginaX,i : Integer;
  _perc, _TotaDAJE: Currency;
begin
  tem_branco := False;
  mais_imagem := True;
  F_Certidao.ajustCont:=0;
  F_Certidao.controle_ajuste:=true;
  F_Certidao.Xpress2.FileName :=cam1 + sub+ F_Certidao.memo2.lines.strings[F_Certidao.ajustCont];
  arq_xpress := cam1 + sub+ F_Certidao.memo2.lines.strings[F_Certidao.ajustCont];
  Ultimo:= cam1 + sub+ F_Certidao.memo2.lines.strings[(F_Certidao.verificador -1)];
  num_pag := 0;
  arq_temp := PegaAte(TimeToStr(time), ':', 'L');
  arq_temp := arq_temp + PegaAte(TimeToStr(time), ':', 'R');
  desc_num := 0;
  _perc:= 0;
  _TotaDAJE:= 0;

  while mais_imagem do
  begin
    F_Certidao.Xpress1.Area(False, 0, 0, 0, 0);
    F_Certidao.Xpress1.Merge(False, 0, 0, False, 0, 0, 0);
    F_Certidao.Xpress1.ViewUpdate := False;
    if not F_Certidao.checkbox14.checked then
    begin
      if num_pag = 0 then
      begin
        F_Certidao.Xpress1.FileName := F_Menu.Label4.Caption + 'modelo_sem_cabec.tif';
      end;
    end else
    begin
      F_Certidao.Xpress1.FileName := F_Menu.Label4.Caption + 'modelo_sem_cabec.tif';
    end;



    If F_Certidao.Xpress1.ImagError <> 0 then showmessage('Erro ao carregar o arquivo modelo_sem_cabec.TIF');

    if StrToInt(PegaAte(F_Certidao.XPress2.FileName, '.', 'R')) mod 2 = 0 then
    begin

      if not F_Certidao.Checkbox8.Checked then
      Begin
        if (F_Certidao.CheckBox12.Checked and (not F_Certidao.CheckBox14.Checked)) or
           ((Ultimo=F_Certidao.XPress2.FileName) and F_Certidao.CheckBox14.Checked and (Ultimo <> ''))Then
        Begin
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.05), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.72))
           // F_Certidao.Xpress2.Area(True, Round(F_Certidao.Xpress2.IWidth * 0.1), Round(F_Certidao.Xpress2.IHeight * 0.20), Round(F_Certidao.Xpress2.IWidth * 0.83), Round(F_Certidao.Xpress2.IHeight * 0.75));
        end;
      end
      else
      begin
         if (F_menu.LbCnpj.Caption = '27215776000185') or (F_menu.LbCnpj.Caption = '27.215.776/0001-85') or (F_menu.LbCnpj.Caption = '26967669000140') or (F_menu.LbCnpj.Caption = '26.967.669/0001-40') or
            (F_menu.LbCnpj.Caption = '28664048000113') or (F_menu.LbCnpj.Caption = '28.664.048/0001-13') or (F_menu.LbCnpj.Caption = '27400369000148') or (F_menu.LbCnpj.Caption = '27.400.369/0001-48') or
            (F_menu.LbCnpj.Caption = '32301377000177') or (F_menu.LbCnpj.Caption = '32.301.377/0001-77') or
            (F_menu.LbCnpj.Caption = '45023795000191') or (F_menu.LbCnpj.Caption = '45.023.795/0001-91') Then
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.10), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else
          if (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '28287131000110') or (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '26967669000140') or (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '15258382000125') Then
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.11), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else
          if (F_menu.LbCnpj.Caption = '27248629000101') or (F_menu.LbCnpj.Caption = '27.248.629/0001-01') then //joão dourado
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.11), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else
          if (F_menu.LbCnpj.Caption = '30710805000190') or (F_menu.LbCnpj.Caption = '30.710.805/0001-90') then   //Jonas qualquer coisa mexer aqui
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.14), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else
          if (F_menu.LbCnpj.Caption = '15234252000152') or (F_menu.LbCnpj.Caption = '15.234.252/0001-52') then    //Irecê
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.20), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else                                //Camaçari

          if (F_menu.LbCnpj.Caption = '15224679000170') or (F_menu.LbCnpj.Caption = '15.224.679/0001-70') Then
          begin
            //if (Not(F_Certidao.CheckBox13.Checked)) then
              F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.13), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75));
            //else
            //F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.17), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          End

          else
          if (F_menu.LbCnpj.Caption = '13225586000134') or (F_menu.LbCnpj.Caption = '13.225.586/0001-34') Then
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.17), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else
          F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.20), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75));

      end;

      { se precisar voltar a incluir isso aqui 31-03-2020 adriel
         if F_Menu.Label39.Caption = '13648829000147' then //Porto Seguro
          F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.02), Round(F_Certidao.Xpress1.IHeight * 0.02), Round(F_Certidao.Xpress1.IWidth * 0.85), Round(F_Certidao.Xpress1.IHeight * 0.83))
        else
          if (F_Menu.Label39.Caption = '16427627000163') or (F_Menu.Label39.Caption = '16.427.627/0001-63')  then //Eunapolis
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.08), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
            else
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.1), Round(F_Certidao.Xpress1.IWidth * 0.85), Round(F_Certidao.Xpress1.IHeight * 0.83));
         end;  }



      //F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.02), Round(F_Certidao.Xpress1.IHeight * 0.02), Round(F_Certidao.Xpress1.IWidth * 0.85), Round(F_Certidao.Xpress1.IHeight * 0.83))
      {if not F_Certidao.Checkbox8.Checked then  //papel timbrado
        F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.05), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.72))
      else
        F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.20), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75));}

      IP_TRANSPARENT := True;
      IP_TCOLOR      := RGB(255, 255, 255);
      IP_MERGESIZE   := 2;
      F_Certidao.Xpress1.ViewUpdate := True;
      F_Certidao.Xpress1.Merge(True, IP_MERGESIZE, 0, IP_TRANSPARENT, IP_TCOLOR, 0, 0);

      if (F_Menu.Label39.Caption = '13236831000109') or (F_Menu.Label39.Caption = '13.236.831/0001-09') or
        (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '13648829000147') then
      Begin
        Dm.qryGenerico.Close;
        Dm.qryGenerico.Sql.Clear;
        Dm.qryGenerico.Sql.Add('SELECT custas FROM certidao');
        Dm.qryGenerico.Sql.Add('WHERE');
        Dm.qryGenerico.Sql.Add('nr_protoc = ' + Trim(F_ExameC.MaskEdit1.Text));
        Dm.qryGenerico.Open;

        if (Not(dm.Configur.Active)) Then
          dm.Configur.Open;

        if (dm.Configur.RecordCount <> 0) then
        begin
          _EmolDaje    := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('emol_daje').AsCurrency)/100),-2);
          _TaxaFiscalDaje  := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('tx_fiscal_daje').AsCurrency)/100),-2);
          _FecomDaje   := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('fecom_daje').AsCurrency)/100),-2);
          _DefPublicaDaje  := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('def_pub_daje').AsCurrency)/100),-2);
          _PGE          := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('vr_pge').AsCurrency)/100),-2);
          _FMMPBA       := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('fmmpba').AsCurrency)/100),-2);

          _TotaDAJE     := (_EmolDaje + _TaxaFiscalDaje + _FecomDaje + _DefPublicaDaje + _PGE + _FMMPBA);

          if (dm.qryGenerico.FieldByName('custas').AsCurrency <> _TotaDAJE) then
            _DefPublicaDaje := _DefPublicaDaje + (dm.qryGenerico.FieldByName('custas').AsCurrency - _TotaDAJE);
        end;

        F_Certidao.Xpress1.Font.Name := 'Arial';
        F_Certidao.Xpress1.FOnt.Size := 30;
        // adriel
       { F_Certidao.Xpress1.DrawTextString(55,3340, 'Emolumentos: R$ ' + CurrToStr(_EmolDaje)+
                                                   ' Fiscal: R$ ' +CurrToStr(_TaxaFiscalDaje) +
                                                   ' FECOM: R$ '+ CurrToStr(_FecomDaje) +
                                                   ' Defensoria: R$ '+ CurrToStr(_DefPublicaDaje) +
                                                   ' PGE: R$ '+ CurrToStr(_PGE)+
                                                   ' FMMPBA: R$ '+ CurrToStr(fmmpba), RGB(0, 0, 0));   }
      End
      Else
      Begin
        Dm.qryGenerico.Close;
        Dm.qryGenerico.Sql.Clear;
        Dm.qryGenerico.Sql.Add('SELECT nr_protoc, movimento, protocolo as registro, stat_data FROM certidao');
        Dm.qryGenerico.Sql.Add('WHERE');
        Dm.qryGenerico.Sql.Add('nr_protoc = ' + Trim(F_ExameC.MaskEdit1.Text));
        Dm.qryGenerico.Open;

        F_Certidao.Xpress1.Font.Name := 'Arial';
        F_Certidao.Xpress1.FOnt.Size := 20;

        {F_Certidao.Xpress1.DrawTextString(55,3340, ' Protocolo: '+F_Certidao.MaskEdit1.Text+
                                                   //' Data de Recepção: '+Dm.qryGenerico.FieldByName('movimento').AsString +
                                                   ' Nº do Registro: '+Dm.qryGenerico.FieldByName('registro').AsString +
                                                   //' Data de Registro: '+Dm.qryGenerico.FieldByName('stat_data').AsString +
                                                   ' O prazo de validade desta certidão é de 30(trinta) dias. ', RGB(0, 0, 0));

        F_Certidao.Xpress1.DrawTextString(55,3370, ' O prazo de validade desta certidão é de 30(trinta) dias. ', RGB(0, 0, 0));}

      End;


      //if Not F_Certidao.CheckBox7.Checked then  F_Certidao.Xpress2.AutoCrop(0.15,50,1000);
    end
    else
    begin
      if not F_Certidao.Checkbox8.Checked then
      Begin
        if (F_Certidao.CheckBox12.Checked and (not F_Certidao.CheckBox14.Checked)) or
           ((Ultimo=F_Certidao.XPress2.FileName) and F_Certidao.CheckBox14.Checked and (Ultimo <> ''))Then
        Begin
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.05), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.72))
           // F_Certidao.Xpress2.Area(True, Round(F_Certidao.Xpress2.IWidth * 0.1), Round(F_Certidao.Xpress2.IHeight * 0.20), Round(F_Certidao.Xpress2.IWidth * 0.83), Round(F_Certidao.Xpress2.IHeight * 0.75));
        end;
      end
      else
      begin
         if (F_menu.LbCnpj.Caption = '27215776000185') or (F_menu.LbCnpj.Caption = '27.215.776/0001-85') or (F_menu.LbCnpj.Caption = '26967669000140') or (F_menu.LbCnpj.Caption = '26.967.669/0001-40') or
            (F_menu.LbCnpj.Caption = '28664048000113') or (F_menu.LbCnpj.Caption = '28.664.048/0001-13') or (F_menu.LbCnpj.Caption = '27400369000148') or (F_menu.LbCnpj.Caption = '27.400.369/0001-48') or
            (F_menu.LbCnpj.Caption = '32301377000177') or (F_menu.LbCnpj.Caption = '32.301.377/0001-77') Then
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.10), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else
          if (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '28287131000110') or (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '26967669000140') or (TirarTudo(F_menu.LbCnpj.Caption, '.', '/', '-') = '15258382000125') Then
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.11), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else
          if (F_menu.LbCnpj.Caption = '27248629000101') or (F_menu.LbCnpj.Caption = '27.248.629/0001-01') then //joão dourado
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.11), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else
          if (F_menu.LbCnpj.Caption = '30710805000190') or (F_menu.LbCnpj.Caption = '30.710.805/0001-90') then   //Jonas qualquer coisa mexer aqui
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.14), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else
          if (F_menu.LbCnpj.Caption = '15234252000152') or (F_menu.LbCnpj.Caption = '15.234.252/0001-52') then    //Irecê
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.20), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else                                //Camaçari
          if (F_menu.LbCnpj.Caption = '15224679000170') or (F_menu.LbCnpj.Caption = '15.224.679/0001-70') Then
            //if (Not(F_Certidao.CheckBox13.Checked)) then
              F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.13), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
            //else
            //F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.17), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75)
          else
          if (F_menu.LbCnpj.Caption = '13225586000134') or (F_menu.LbCnpj.Caption = '13.225.586/0001-34') Then
            F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.17), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else
          F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.20), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75));
      end;

         {  comentado devido a rotina de reduzir imagem se precisar voltar a incluir 30-03-2021 adriel

           if F_Menu.Label39.Caption = '13648829000147' then //Porto Seguro
             F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.02), Round(F_Certidao.Xpress1.IHeight * 0.02), Round(F_Certidao.Xpress1.IWidth * 0.85), Round(F_Certidao.Xpress1.IHeight * 0.83))
          else
          if F_Menu.Label39.Caption = '16427627000163' then //Eunapolis
             F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.08), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
          else
             F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.1), Round(F_Certidao.Xpress1.IWidth * 0.85), Round(F_Certidao.Xpress1.IHeight * 0.83));

           }


      //F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.1), Round(F_Certidao.Xpress1.IWidth * 0.85), Round(F_Certidao.Xpress1.IHeight * 0.83));

      {if not F_Certidao.Checkbox8.Checked then  // papel timbrado
        F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.05), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.72))
      else
        F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.20), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75));}

      if (F_Menu.Label39.Caption = '13236831000109') or (F_Menu.Label39.Caption = '13.236.831/0001-09') or
        (F_Menu.Label39.Caption = '13648829000147') or (F_Menu.Label39.Caption = '13.648.829/0001-47') Then
      Begin
        Dm.qryGenerico.Close;
        Dm.qryGenerico.Sql.Clear;
        Dm.qryGenerico.Sql.Add('SELECT custas FROM certidao');
        Dm.qryGenerico.Sql.Add('WHERE');
        Dm.qryGenerico.Sql.Add('nr_protoc = ' + Trim(F_ExameC.MaskEdit1.Text));
        Dm.qryGenerico.Open;

        if (Not(dm.Configur.Active)) Then
          dm.Configur.Open;

        if (dm.Configur.RecordCount <> 0) then
        begin
          _EmolDaje    := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('emol_daje').AsCurrency)/100),-2);
          _TaxaFiscalDaje  := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('tx_fiscal_daje').AsCurrency)/100),-2);
          _FecomDaje   := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('fecom_daje').AsCurrency)/100),-2);
          _DefPublicaDaje  := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('def_pub_daje').AsCurrency)/100),-2);
          _PGE          := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('vr_pge').AsCurrency)/100),-2);
          _FMMPBA       := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('fmmpba').AsCurrency)/100),-2);

          _TotaDAJE     := (_EmolDaje + _TaxaFiscalDaje + _FecomDaje + _DefPublicaDaje + _PGE + _FMMPBA);

          if (dm.qryGenerico.FieldByName('custas').AsCurrency <> _TotaDAJE) then
            _DefPublicaDaje := _DefPublicaDaje + (dm.qryGenerico.FieldByName('custas').AsCurrency - _TotaDAJE);
        end;

        F_Certidao.Xpress1.Font.Name := 'Arial';
        F_Certidao.Xpress1.FOnt.Size := 30;

       // adriel
      {  F_Certidao.Xpress1.DrawTextString(55,3340, 'Emolumentos: R$ ' + CurrToStr(_EmolDaje)+
                                                   ' Fiscal: R$ ' +CurrToStr(_TaxaFiscalDaje) +
                                                   ' FECOM: R$ '+ CurrToStr(_FecomDaje) +
                                                   ' Defensoria: R$ '+ CurrToStr(_DefPublicaDaje) +
                                                   ' PGE: R$ '+ CurrToStr(_PGE) +
                                                   ' FMMPBA: R$ '+ CurrToStr(fmmpba), RGB(0, 0, 0));}

      End
      Else
      Begin
        Dm.qryGenerico.Close;
        Dm.qryGenerico.Sql.Clear;
        Dm.qryGenerico.Sql.Add('SELECT nr_protoc, movimento, protocolo as registro, stat_data FROM certidao');
        Dm.qryGenerico.Sql.Add('WHERE');
        Dm.qryGenerico.Sql.Add('nr_protoc = ' + Trim(F_ExameC.MaskEdit1.Text));
        Dm.qryGenerico.Open;

        F_Certidao.Xpress1.Font.Name := 'Arial';
        F_Certidao.Xpress1.FOnt.Size := 20;


        {F_Certidao.Xpress1.DrawTextString(55,3340, ' O prazo de validade desta certidão é de 30(trinta) dias. ', RGB(0, 0, 0));

        F_Certidao.Xpress1.DrawTextString(55,3340, ' Protocolo: '+F_Certidao.MaskEdit1.Text+
                                                   //' Data de Recepção: '+Dm.qryGenerico.FieldByName('movimento').AsString +
                                                   ' Nº do Registro: '+Dm.qryGenerico.FieldByName('registro').AsString +
                                                   //' Data de Registro: '+Dm.qryGenerico.FieldByName('stat_data').AsString +
                                                   ' O prazo de validade desta certidão é de 30(trinta) dias. ', RGB(0, 0, 0)); }

      End;

      IP_TRANSPARENT := True;
      IP_TCOLOR      := RGB(255, 255, 255);
      IP_MERGESIZE   := 2;
      F_Certidao.Xpress1.ViewUpdate := True;
      F_Certidao.Xpress1.Merge(True, IP_MERGESIZE, 0, IP_TRANSPARENT, IP_TCOLOR, 0, 0);
//      if Not F_Certidao.CheckBox7.Checked then F_Certidao.Xpress2.autoCrop(0.15,50,1000);
    end;
    //ultimapaginaX :=F_Certidao.ajustCont


    F_Certidao.Xpress2.Paint;
    F_Certidao.Xpress2.SaveFileName := 'C:\siscart\temp\td\imgtmp.tif';
    F_Certidao.Xpress2.SaveFileType := FT_TIFF;
    F_Certidao.Xpress2.SaveTIFFCompression := TIFF_CCITTFAX3;
//    F_Certidao.Xpress2.SaveTIFFCompression := TIFF_CCITTFAX4;

    F_Certidao.Xpress2.SaveFile;

    F_Certidao.Xpress1.SaveFileType := FT_TIFF;
    F_Certidao.Xpress1.SaveTIFFCompression := TIFF_CCITTFAX3;
//    F_Certidao.Xpress1.SaveTIFFCompression := TIFF_CCITTFAX4;

    F_Certidao.Xpress1.FileName     := 'C:\siscart\temp\td\imgtmp.tif';
    F_Certidao.Xpress1.Paint;

    num_pag := num_pag + 1;

    F_Certidao.Xpress1.SaveFileName := 'C:\Siscart\temp\td\' + PegaAte(arq_xpress, '\', 'R');
    F_Certidao.Xpress1.SaveFile;

    arq_xpress_ant := arq_xpress;
//    arq_xpress     := andar(F_Certidao.XPress2.FileName, '+');
    if not (F_Certidao.ajustCont = F_Certidao.verificador) then
    begin
     inc(F_Certidao.ajustCont);

     if F_Certidao.ajustCont =  F_Certidao.verificador then arq_xpress:=''
     else
       arq_xpress :=cam1 + sub+ F_Certidao.memo2.lines.strings[F_Certidao.ajustcont];
    end else
    begin
      arq_xpress :='';
    end;
    //andar(F_Certidao.XPress2.FileName, '+');

 {   if ultimo = arq_xpress then
    begin
      for i := 0 to F_Certidao.memo2.lines.Count -1 do
      begin
        F_Certidao.Xpress2.FileName:=F_Certidao.memo2.lines.strings[i];
        F_Certidao.Xpress2.Paint;
        F_Certidao.Xpress2.SaveFileName := 'C:\siscart\temp\td\imgtmp.tif';
        F_Certidao.Xpress2.SaveFileType := FT_TIFF;
        F_Certidao.Xpress2.SaveTIFFCompression := TIFF_CCITTFAX3;
      end;
    end;  }

    if (arq_xpress = '') and (not tem_branco) then
    begin
      mais_imagem := False;
    end
    else
    begin
      if (tem_branco) and (arq_xpress = '') then
      begin
        F_Certidao.Xpress1.Area(False, 0, 0, 0, 0);
        F_Certidao.Xpress1.Merge(False, 0, 0, False, 0, 0, 0);
        F_Certidao.Xpress1.ViewUpdate := False;

        F_Certidao.Xpress1.FileName := F_Menu.Label4.Caption + 'branco_sem_cabec.tif';

        If F_Certidao.Xpress1.ImagError <> 0 then showmessage('Erro ao carregar o arquivo branco_sem_cabec.TIF');

        if F_Menu.Label39.Caption = '13648829000147' then //Porto Seguro
          F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.02), Round(F_Certidao.Xpress1.IHeight * 0.02), Round(F_Certidao.Xpress1.IWidth * 0.85), Round(F_Certidao.Xpress1.IHeight * 0.83))
        else
        if (F_Menu.Label39.Caption = '16427627000163') or (F_Menu.Label39.Caption = '16.427.627/0001-63')  then //Eunapolis
          F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.08), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.75))
        else
        if not F_Certidao.Checkbox8.Checked then
          F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.1), Round(F_Certidao.Xpress1.IWidth * 0.85), Round(F_Certidao.Xpress1.IHeight * 0.83))
        else
          F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.04), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.72));

       // F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.1), Round(F_Certidao.Xpress1.IWidth * 0.85), Round(F_Certidao.Xpress1.IHeight * 0.83));
//      F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.04), Round(F_Certidao.Xpress1.IWidth * 0.83), Round(F_Certidao.Xpress1.IHeight * 0.72));

        IP_TRANSPARENT := True;
        IP_TCOLOR      := RGB(255, 255, 255);
        IP_MERGESIZE   := 2;
        F_Certidao.Xpress1.ViewUpdate := True;
        F_Certidao.Xpress1.Merge(True, IP_MERGESIZE, 0, IP_TRANSPARENT, IP_TCOLOR, 0, 0);

        F_Certidao.Xpress1.SaveFileType := FT_TIFF;
        F_Certidao.Xpress1.SaveTIFFCompression := TIFF_CCITTFAX3;

        F_Certidao.Xpress1.Paint;

        extensao := '000' + IntToStr(StrToInt(PegaAte(arq_xpress_ant, '.', 'R')) + 1);
        extensao := copy(extensao, length(extensao) - 2, 3);
        arq_xpress := PegaAte(arq_xpress_ant, '\', 'R');
        arq_xpress := PegaAte(arq_xpress, '.', 'L') + '.' + extensao;
        arq_xpress := 'C:\siscart\' + arq_xpress;

        F_Certidao.Xpress1.SaveFileName := 'C:\siscart\' + PegaAte(arq_xpress, '\', 'R');
        F_Certidao.Xpress1.SaveFile;

        tem_branco  := False;
      end;
      F_Certidao.Xpress2.FileName := arq_xpress;
    end;
  end;

  if StrToInt(PegaAte(F_Certidao.XPress2.FileName, '.', 'R')) mod 2 = 0 then
    Cota_XPress(250,3340)
  else
    Cota_XPress(250,3340);

  F_Certidao.Xpress1.Paint;
  F_Certidao.Xpress1.SaveFileName := 'C:\siscart\temp\td\' + PegaAte(F_Certidao.XPress2.FileName, '\', 'R');
  F_Certidao.Xpress1.SaveFile;
  //

 // F_Certidao.Label2.Caption := '001';
  arq := '000000' + inttostr(strtoint(F_Certidao.Label16.Caption));
  arq := copy(arq, length(arq) - 5, 6);
  F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + arq + '.001';

  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 3) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 3) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 4) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 4) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 5) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 5) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 6) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 6) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 7) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 7) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 8) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 8) + '.001';
  End
  Else
  if (FileExists('C:\Siscart\temp\td\' + strZero(arq, 9) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 9) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 10) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 10) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 11) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 11) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 12) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 12) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 13) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 13) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 14) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 14) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 15) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 15) + '.001';
  End
  Else
  if (FileExists('C:\siscart\temp\td\' + strZero(arq, 16) + '.001')) Then
  Begin
    img := cam1 + sub + arq + '.001';
    F_Certidao.ImgEdit1.Image := 'C:\Siscart\temp\td\' + strZero(arq, 16) + '.001';
  End;
  F_Certidao.ImgEdit1.Image :='C:\Siscart\temp\td\'+ F_Certidao.Memo2.lines.Strings[0];
  F_Certidao.contador:=0;
  F_Certidao.ImgEdit1.Display;
  F_Certidao.ImgEdit1.FitTo(0, True);
  if F_Certidao.ImgEdit1.ImageWidth > F_Certidao.ImgEdit1.ImageHeight then F_Certidao.ImgEdit1.RotateRight(900);
  F_Certidao.SpeedButton3.Enabled := True;
  F_Certidao.Xpress1.visible:=false;
  F_Certidao.Xpress2.visible:=false;
  F_Certidao.ImgEdit5.visible:=false;
  F_Certidao.ImgEdit3.visible:=false;
  F_Certidao.ImgEdit4.visible:=false;
end;

procedure TF_Certidao.BitBtn8Click(Sender: TObject);
begin
  Dm.Certidao.Close;
  Dm.ArqAux.Close;
  Dm.ArqAux2.Close;
  Close;
end;

procedure TF_Certidao.SpeedButton10Click(Sender: TObject);
begin
  if application.messagebox(pchar('Iniciar Atualização do DAJE ?'),'Confirmação',mb_iconquestion + mb_yesno) = id_yes then
  Begin
    If ConsultarDaje(id_eselo, Label17.Caption, Label24.Caption, id_eselo) then
    Begin
     If (_StatusDaje <> 'Não Pago') then
      Begin
        Dm.ArqAux2.Close;
        Dm.ArqAux2.Sql.Clear;
        Dm.ArqAux2.Sql.Add('update daje set status = ' + QuotedStr(_StatusDaje) + ' where serie_daje = ' + Label17.Caption);
        Dm.ArqAux2.Sql.Add(' and numero_daje = ' + Label24.Caption);
        Try
          Dm.ArqAux2.ExecSql;
        Except
        End;
      End;
    End;
    Dm.ArqAux2.Close;
    ShowMessage('Fim do Processo.');
  End;
end;

procedure TF_Certidao.BitBtn7Click(Sender: TObject);
var
  x : Integer;
  atual_file : String;
begin
  ImgEdit1.Image := F_Certidao.MaskEdit2.Text;
  contar;
  F_Certidao.FileListBox1.Directory := 'C:\siscart\';
  F_Certidao.FileListBox1.Update;
  for x := 0 to F_Certidao.FileListBox1.Items.Count - 1 do
  begin
    F_Certidao.FileListBox1.ItemIndex := x;
    deletefile(F_Certidao.FileListBox1.FileName);
  end;

  Label28.Caption := 'Processando o ajuste da imagem  ...';
  Label28.Update;

  Carrega_XPress1(PegaAte(ImgEdit1.Image, '.', 'L') + '.001');

  Label28.Caption := 'Ajuste processado com sucesso  ...';
  Label28.Update;
  
  bitbtn4.enabled := True;
  BitBtn5.Enabled := True;
end;

procedure TF_Certidao.BitBtn1Click(Sender: TObject);
begin
  Label28.Caption := '.';
  Label28.Update;

  if (Trim(MaskEdit1.Text) = '') then
  Begin
    ShowMessage('Pedido inválido');
    MaskEdit1.SetFocus;
    exit;
  end;
  Dm.Certidao.Close;
  Dm.Certidao.Sql.Clear;
  Dm.Certidao.Sql.Add('SELECT * FROM certidao');
  Dm.Certidao.Sql.Add('where nr_protoc = ' + Quotedstr(Trim(MaskEdit1.Text)));
  if Trim(edtAverbacao.Text) <> '' then
  Dm.Certidao.Sql.Add('and averbacao = ' + Quotedstr(Trim(edtAverbacao.Text)));

  Dm.Certidao.Open;
  if (Dm.Certidao.RecordCount = 0) then
  begin
    Dm.Certidao.Close;
    ShowMessage('Pedido não encontrado');
    MaskEdit1.SetFocus;
    Exit;
  end
  else
  begin
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('SELECT * FROM daje WHERE serie_daje = ' + QuotedStr(Dm.Certidao.FieldByName('serie_daje').AsString));
    DM.ArqAux.Sql.Add(' and numero_daje = ' + QuotedStr(Dm.Certidao.FieldByName('daje').AsString));
    DM.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      Dm.ArqAux.Close;
      ShowMessage('Pedido não encontrado');
      MaskEdit1.SetFocus;
      Exit;
    end
    else
    begin
      Label11.Caption := Dm.Certidao.FieldByName('apresentan').asString;
      Label16.Caption := dm.certidao.FieldByName('protocolo').AsString;
      Label17.Caption := Dm.Certidao.FieldByName('serie_daje').AsString;
      Label24.Caption := Dm.Certidao.FieldByName('daje').AsString;
      Label19.Caption := Dm.Certidao.FieldByName('selo').AsString;
      Label20.Caption := Dm.Certidao.FieldByName('selo_validador').AsString;
      Label23.Caption := Dm.ArqAux.FieldByName('status').AsString;
      if Label16.Caption = '' then
      begin
        showmessage('Protocolo não encontrado.');
        Exit;
      end;
      arq := inttostr(strtoint(Label16.Caption));
      arq := strzero(arq, 6);
      sub := F_Menu.DefineSub(Label16.Caption);
      if MaskEdit3.Text = 'B' then
        cam1 := F_Menu.Label17.Caption + 'LivroB\'
      else
        cam1 := F_Menu.Label17.Caption + 'LivroC\';

      //if copy(cam1, length(cam1),1) <> '\' then cam1 := cam1 + '\';
      ListarArquivos(cam1 + sub,false,arq);
      ordenar(memo1.lines);
      if edtAverbacao.Text <> '' then
      begin
        get_imagens(true);
        ordenar(memo2.lines);
      end
      else
      begin
        get_imagens;
        ordenar(memo2.lines);
      end;
      img :=cam1 + sub + memo2.lines.Strings[0];
      ///

     { If CheckBox1.Checked then
        img := img + 'A';
      if edtAverbacao.Text <> '' then
        img := img +'_'+edtAverbacao.Text;
      img := img + '.001';

      iQuantZero := 4;
      if (not FileExists(img)) then
      begin
        while iQuantZero <= 16 do
        begin
          arq := inttostr(strtoint(Label16.Caption));
          arq := strzero(arq, iQuantZero);
          img := cam1 + sub + arq;
          If CheckBox1.Checked then
            img := img + 'A';
          if edtAverbacao.Text <> '' then
            img := img +'_'+edtAverbacao.Text;
          img := img + '.001';
          if (not FileExists(img)) then
            inc(iQuantZero)
          else
            break;
        end;
      end; }

      if not fileexists(img) then
      begin
        showmessage('Imagem não localizada ' + img);
        maskedit1.setfocus;
        exit;
      end;

      {if (Not(FileExists(F_Menu.Label49.Caption + 'img\'+Label20.Caption+'.bmp'))) Then
      Begin
        ShowMessage('Arquivo:'+F_Menu.Label49.Caption + 'img\'+Label20.Caption+'.bmp não encontrado');
        Abort;
      End;}

      desenharSelo(Label19.Caption, Label20.Caption);
      IMgEdit2.Image := F_Menu.Label49.Caption + 'img\'+Label20.Caption+'.bmp';
      ImgEdit2.Display;

      if (Not(FileExists(img))) Then
      Begin
        ShowMessage('Arquivo:'+img+'não encontrado');
        Abort;
      End;
      Label2.caption:= strZero('1',3);
      ImgEdit1.Image := img;
      ImgEdit1.Display;
      ImgEdit1.FitTo(1, True);
    //  Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 2, 3);
      Label2.update;
      contar;
      Bitbtn2.enabled := True;
      Bitbtn8.enabled := True;
      Bitbtn4.enabled := True;
      Bitbtn5.enabled := True;
      Bitbtn7.enabled := True;
      Panel1.Enabled := True;
      F_Certidao.MaskEdit2.Text := ImgEdit1.Image;
      Bitbtn1.enabled := False;
      MaskEdit1.Enabled := False;

      BtAjustaImagemSemDiminuir.Click;
    end;
  end;
end;

procedure TF_Certidao.BitBtn2Click(Sender: TObject);
begin
  controle_ajuste:=false;
  Label28.Caption := '.';
  Label28.Update;

  SpeedButton3.Enabled := False;
  Maskedit1.setfocus;
  ImgEdit1.ClearDisplay;
  Label11.Caption := '';
  Label16.Caption := '';
  Label17.Caption := '';
  Label24.Caption := '';
  Label19.Caption := '';
  Label20.Caption := '';
  Label23.Caption := '';
end;

procedure TF_Certidao.BitBtn5Click(Sender: TObject);
begin

  if (F_menu.Label39.Caption = '27215296000114') or (F_menu.Label39.Caption = '27.215.296/0001-14') Then  //Eder valença
  begin
                            //largura / altura
    ImgEdit2.ClipboardCopy(1, 0, 800, 312);
    ImgEdit1.ClipboardPaste(10, 300);//200
  end
  else
  begin
    ImgEdit2.ClipboardCopy(1, 0, 800, 600);
    ImgEdit1.ClipboardPaste(10, 200);
  end;
end;

procedure TF_Certidao.SpeedButton5Click(Sender: TObject);
begin
  Button1.OnClick(Nil);


   if controle_ajuste then
   ImgEdit1.Image := 'C:\Siscart\temp\td\'+ memo2.lines.Strings[0]
   else
   ImgEdit1.Image := cam1 + sub+ memo2.lines.Strings[0];


  ImgEdit1.Display;
  if ImgEdit1.ImageWidth > ImgEdit1.ImageHeight then ImgEdit1.RotateRight(900);
  ImgEdit1.Update;
  StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
  StatusBar1.UpDate;
  //Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 2, 3);
  Label2.update;
  contador:= 0;
end;

procedure TF_Certidao.SpeedButton2Click(Sender: TObject);
var
  arq1 : String;
begin
  Button1.OnClick(Nil);
{  arq1 := andar(ImgEdit1.Image, '-');
  if arq1 = '' then
  Begin
    showmessage('Não existe página anterior');
    exit;
  end
  else
  begin }

  if contador < 0 then
  begin
    showmessage('não tem mais pagina');
  end else
  begin
    contador:= contador -1;
   if contador =  verificador then contador := contador -1;
   if contador < 0 then  contador:=0;

   if controle_ajuste then
    ImgEdit1.Image := 'C:\Siscart\temp\td\'+ memo2.lines.strings[contador]
   else
    ImgEdit1.Image := cam1 + sub+ memo2.lines.strings[contador];

 //  Label2.caption:=strZero(inttostr(contador),3);


   ImgEdit1.Display;
   if ImgEdit1.ImageWidth > ImgEdit1.ImageHeight then ImgEdit1.RotateRight(900);
   StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
   StatusBar1.UpDate;
 //  Label2.update;
  end;


end;

procedure TF_Certidao.SpeedButton1Click(Sender: TObject);
var
  arq1 : String;
begin
  Button1.OnClick(Nil);
{  arq1 := andar(ImgEdit1.Image, '+');
  if arq1 = '' then
  Begin
    showmessage('Não existe próxima página');
    exit;
  end
  else
  begin }

 if contador = verificador then
 begin
   showmessage('não tem mais pagina');
 end else
 begin
   if contador < 0 then contador :=0;
   inc(contador);
   if contador = verificador then exit;
   if controle_ajuste then
    ImgEdit1.Image := 'C:\Siscart\temp\td\'+ memo2.lines.strings[contador]
   else
    ImgEdit1.Image := cam1 + sub+ memo2.lines.strings[contador];


  // Label2.caption:=strZero(inttostr(contador),3);
   ImgEdit1.Display;
   if ImgEdit1.ImageWidth > ImgEdit1.ImageHeight then ImgEdit1.RotateRight(900);
   StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
   StatusBar1.UpDate;
  // Label2.update;
   // if strtoint(label2.caption) > 999 then Label2.caption := pega_ext(imgedit1.image) else Label2.caption := pega_ext(imgedit1.image);
 end;



end;

procedure TF_Certidao.SpeedButton4Click(Sender: TObject);
begin
  Button1.OnClick(Nil);

  if controle_ajuste then
   ImgEdit1.Image := 'C:\Siscart\temp\td\'+memo2.lines.Strings[verificador-1]
  else
   ImgEdit1.Image := cam1 + sub+ memo2.lines.Strings[verificador-1];
  ImgEdit1.Display;
  if ImgEdit1.ImageWidth > ImgEdit1.ImageHeight then ImgEdit1.RotateRight(900);
  ImgEdit1.Update;
  StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
  StatusBar1.UpDate;
  contador:= verificador;
  //Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 2, 3);
  Label2.update;
end;

procedure TF_Certidao.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then edtAverbacao.SetFocus;
end;

procedure TF_Certidao.PrimeiraPgina1Click(Sender: TObject);
begin
  ImgEdit1.Image := Copy(ImgEdit1.Image, 1, length(ImgEdit1.Image) - 3) + '001';
  ImgEdit1.display;
  //label2.caption := '001';
end;

procedure TF_Certidao.ltimaPgina1Click(Sender: TObject);
begin
  ImgEdit1.Image := Copy(ImgEdit1.Image, 1, length(ImgEdit1.Image) - 3) + label4.caption;
  ImgEdit1.display;
  label2.caption := label4.caption;
end;

procedure TF_Certidao.Zoom1Click(Sender: TObject);
begin
  if ImgEdit1.Image <> '' then
  begin
    Application.CreateForm(TF_Zoom, F_Zoom);
    F_Zoom.ImgEdit1.Image := ImgEdit1.Image;
    F_Zoom.showmodal;
    F_Zoom.Destroy;
    F_Zoom := Nil;
  end;
end;

procedure TF_Certidao.BitBtn4Click(Sender: TObject);
var
  s : WordBool;
  bEnviar: Boolean;
  cont: integer;

begin
  cont:=0;
  dir_temp := 'C:\siscart\temp\td\convtif\';

  If Not DirectoryExists(dir_temp) then
     CreateDir(dir_temp);

  If FileExists('C:\siscart\temp\td\CER_' + Maskedit1.text + '.pdf') then
  Begin
    {Application.CreateForm(TfrmImagemDaje, FrmImagemDaje);
    FrmImagemDaje.AcroPDF1.LoadFile('C:\siscart\temp\td\CER_' + Maskedit1.text + '.pdf', s);
    FrmImagemDaje.ShowModal;
    FrmImagemDaje.Destroy;
    FrmImagemDaje := Nil;}
    ShellExecute(Handle, 'open', PChar('C:\siscart\temp\td\CER_' + Maskedit1.text + '.pdf'), nil, nil, SW_SHOWNORMAL);
    Exit;
  End;

  If FileExists(dir_ato + 'CER_' + Maskedit1.text + '.pdf') then
  Begin
    {Application.CreateForm(TfrmImagemDaje, FrmImagemDaje);
    FrmImagemDaje.AcroPDF1.LoadFile(dir_ato + 'CER_' + Maskedit1.text + '.pdf', s);
    FrmImagemDaje.ShowModal;
    FrmImagemDaje.Destroy;
    FrmImagemDaje := Nil;  }
    ShellExecute(Handle, 'open', PChar(dir_ato + 'CER_' + Maskedit1.text + '.pdf'), nil, nil, SW_SHOWNORMAL);
    Exit;
  End
  Else
  Begin
    if Dm.PermitirSelecionarFolhaParaEnvio Then
    Begin
      if (Not(Panel5.Visible)) Then
      Begin
        if (MessageBox(Handle, PChar('Deseja informar as páginas selecionadas ?'), 'CERTIDÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
        Begin
          Panel5.Left:= 200;
          Panel5.Visible:= True;
          TempPaginas.Open;
          BitBtn10.OnClick(Sender);
          Abort;
        End
        Else
          Panel5.Visible:= False;
      End;
    End;
  End;

  dir_ato  := dir_daje + 'Atos\';
  Nome_PDF := 'CER_' + Maskedit1.text; // Certidão Digital + '.' + 'PDF'; // Assinatura Digital
  Nome_TIF := 'CER_' + Maskedit1.text + '.TIF'; // Certidão Digital + '.' + 'TIF'; // Assinatura Digital

  if FileExists(dir_temp + Nome_TIF) then
    DeleteFile(dir_temp + Nome_TIF);

  ImgAdmin1.Image := dir_temp + Nome_TIF;

  if (Not(TempComTodasPaginas.Active)) Then
    TempComTodasPaginas.Open;

  arq_ant := Copy(ImgEdit1.Image, 1, length(ImgEdit1.Image) - 3) + '001';

  if (TempPaginas.IsEmpty) Then
  Begin
    arq2 := arq_ant;
    arq1 := andar(imgedit1.image, '-');
    while arq1 <> '' do
    Begin
      arq2 := arq1;
      arq1 := andar(arq1, '-');

    end;
    arq1 := arq2;
    while arq1 <> '' do
    begin
      if not (cont = verificador) then
      begin
        if controle_ajuste then
        begin
          arq1 := 'C:\Siscart\temp\td\'+ Memo2.lines.Strings[cont];
        end
        else
        begin
          arq1 := cam1 + sub+ Memo2.lines.Strings[cont];
        end;

        ImgAdmin1.Append(arq1,1,1);
        inc(cont);
      end
      else
      begin
        arq1:='';
      end;
    end
  End
  Else
  Begin //TEOR
    TempPaginas.First;
    //arq_ant := copy(imgedit1.image,1, length(imgedit1.image) - 3) + TempPaginasPAGINAS.AsString;

    arq_ant := Copy(ImgEdit1.Image, 1, length(ImgEdit1.Image) - 3) + '001';

    arq2 := arq_ant;
    arq1 := andar(arq2, '-');
    if arq1 <> '' then
      arq_ant:= arq1
    else
    arq1:= arq_ant;

    while arq1 <> '' do
    Begin
      arq2 := arq1;
      if arq1 <> '' Then
      Begin
        TempComTodasPaginas.Append;
        TempComTodasPaginasPAGINAS_PADRAO.AsString:= copy(arq1, length(arq1) - 2, 3);
        TempComTodasPaginas.Post;
      End;
      arq1 := andar(arq1, '-');

    end;

    arq1 := andar(arq_ant,'+');
    arq_ant:= arq1;
    while arq1 <> '' do
    begin
      if arq1 <> '' Then
      Begin
        TempComTodasPaginas.Append;
        TempComTodasPaginasPAGINAS_PADRAO.AsString:= copy(arq1, length(arq1) - 2, 3);
        TempComTodasPaginas.Post;
      End;
      arq1 := andar(arq1,'+');
    end;

    TempPaginas.First;
    TempComTodasPaginas.First;

    if (Not(TempComTodasPaginas.IsEmpty)) then
    begin
      if (MessageBox(Handle, PChar('Deseja enviar para o tribunal as paginas informadas ?'), 'CERTIDÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
        bEnviar:= True
      else
      if (MessageBox(Handle, PChar('Deseja não enviar para o tribunal as paginas informadas ?'), 'CERTIDÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
        bEnviar:= False;
    end;
     TempPaginas.last;
    While not TempComTodasPaginas.Eof do
    Begin             //colocar para ela informar as paginas que nao irão para o tribunal
      if (Not(bEnviar)) then
      Begin
        if (Not(TempPaginas.Locate('Paginas', TempComTodasPaginasPAGINAS_PADRAO.AsString, []))) Then
        Begin
          if FileExists('C:\siscart\temp\td\'+ strZero(Label16.Caption, 3)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString) Then
            ImgAdmin1.Append('C:\siscart\temp\td\'+strZero(Label16.Caption, 3)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString,1,1)
          else if FileExists('C:\siscart\temp\td\'+ strZero(Label16.Caption, 4)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString) Then
            ImgAdmin1.Append('C:\siscart\temp\td\'+strZero(Label16.Caption, 4)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString,1,1)
          else if FileExists('C:\siscart\temp\td\'+ strZero(Label16.Caption, 5)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString) Then
            ImgAdmin1.Append('C:\siscart\temp\td\'+strZero(Label16.Caption, 5)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString,1,1)
          else if FileExists('C:\siscart\temp\td\'+ strZero(Label16.Caption, 6)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString) Then
            ImgAdmin1.Append('C:\siscart\temp\td\'+strZero(Label16.Caption, 6)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString,1,1)
          else if FileExists('C:\siscart\temp\td\'+ strZero(Label16.Caption, 7)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString) Then
            ImgAdmin1.Append('C:\siscart\temp\td\'+strZero(Label16.Caption, 7)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString,1,1)
          else if FileExists('C:\siscart\temp\td\'+ strZero(Label16.Caption, 8)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString) Then
            ImgAdmin1.Append('C:\siscart\temp\td\'+strZero(Label16.Caption, 8)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString,1,1)
          else if FileExists('C:\siscart\temp\td\'+ strZero(Label16.Caption, 9)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString) Then
            ImgAdmin1.Append('C:\siscart\temp\td\'+strZero(Label16.Caption, 9)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString,1,1)
          else if FileExists('C:\siscart\temp\td\'+ strZero(Label16.Caption, 10)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString) Then
            ImgAdmin1.Append('C:\siscart\temp\td\'+strZero(Label16.Caption, 10)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString,1,1)
          else if FileExists('C:\siscart\temp\td\'+ strZero(Label16.Caption, 11)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString) Then
            ImgAdmin1.Append('C:\siscart\temp\td\'+strZero(Label16.Caption, 11)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString,1,1);
        End;
        TempComTodasPaginas.Next;
      end
      else if (bEnviar) then
      begin
        if true Then
        begin
          if FileExists('C:\siscart\temp\PJ\'+memo2.lines.strings[strtoint(TempPaginasPAGINAS.asstring)-1]) Then
            ImgAdmin1.Append('C:\siscart\temp\PJ\'+memo2.lines.strings[strtoint(TempPaginasPAGINAS.asstring)-1],1,1)
        end;
        TempPaginas.prior;
        if TempPaginas.bof then TempComTodasPaginas.Last;
        TempComTodasPaginas.Next;
      end;
    end;
  end;

  ImgAdmin1.Image := '';
  if (FileExists('C:\siscart\temp\td\'+strZero(Label16.Caption, 3)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString)) Then
    arq_ant:= 'C:\siscart\temp\td\'+strZero(Label16.Caption, 3)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString
  else
  if (FileExists('C:\siscart\temp\td\'+strZero(Label16.Caption, 4)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString)) Then
    arq_ant:= 'C:\siscart\temp\td\'+strZero(Label16.Caption, 4)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString
  else
  if (FileExists('C:\siscart\temp\td\'+strZero(Label16.Caption, 5)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString)) Then
    arq_ant:= 'C:\siscart\temp\td\'+strZero(Label16.Caption, 5)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString
  else
  if (FileExists('C:\siscart\temp\td\'+strZero(Label16.Caption, 6)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString)) Then
    arq_ant:= 'C:\siscart\temp\td\'+strZero(Label16.Caption, 6)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString
  else
  if (FileExists('C:\siscart\temp\td\'+strZero(Label16.Caption, 7)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString)) Then
    arq_ant:= 'C:\siscart\temp\td\'+strZero(Label16.Caption, 7)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString
  else
  if (FileExists('C:\siscart\temp\td\'+strZero(Label16.Caption, 8)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString)) Then
    arq_ant:= 'C:\siscart\temp\td\'+strZero(Label16.Caption, 8)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString
  else
  if (FileExists('C:\siscart\temp\td\'+strZero(Label16.Caption, 9)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString)) Then
    arq_ant:= 'C:\siscart\temp\td\'+strZero(Label16.Caption, 9)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString
  else
  if (FileExists('C:\siscart\temp\td\'+strZero(Label16.Caption, 10)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString)) Then
    arq_ant:= 'C:\siscart\temp\td\'+strZero(Label16.Caption, 10)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString
  else
  if (FileExists('C:\siscart\temp\td\'+strZero(Label16.Caption, 11)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString)) Then
    arq_ant:= 'C:\siscart\temp\td\'+strZero(Label16.Caption, 11)+'.'+TempComTodasPaginasPAGINAS_PADRAO.AsString;


  if controle_ajuste then
  begin
     imgedit1.image := 'C:\Siscart\temp\td\'+ Memo2.lines.Strings[0];
  end
  else
  begin
     imgedit1.image := cam1 + sub+ Memo2.lines.Strings[0];
  end;
  imgedit1.display;
  objPDF := T_TIFFToPDF.Create;
  with objPDF do
  begin
    sFolderImage := dir_temp; // + Nome_TIF;
    sFolderToOut := dir_ato;//'C:\siscart\temp\td\'; //dir_ato; // + Nome_PDF;
    sFileNameSav := Nome_PDF;
    F_Author      := 'OFICIAL DE REGISTRO DE TÍTULOS E DOCUMENTOS';
    F_Producer    := 'Siscart Informática';
    F_Title       := 'Certidão Digital';
    F_Subject     := 'Certidão Digital';

    F_Keywords    := 'Certidão Matrícula nº ' + MaskEdit1.Text + '   ' + 'Bel. ';

    if GenTIFFToPDFA(self) then
    begin
      DeleteFile(dir_temp + Nome_TIF);
      DeleteFile(dir_ato + Nome_TIF);
      BitBtn3.Enabled := True;
    end;
    Destroy;

   { Application.CreateForm(TfrmImagemDaje, FrmImagemDaje);
    FrmImagemDaje.AcroPDF1.LoadFile(dir_ato + 'CER_' + Maskedit1.text + '.pdf', s);
    FrmImagemDaje.ShowModal;
    FrmImagemDaje.Destroy;
    FrmImagemDaje := Nil;  }
    ShellExecute(Handle, 'open', PChar(dir_ato + 'CER_' + Maskedit1.text + '.pdf'), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TF_Certidao.SpeedButton3Click(Sender: TObject);
var
  arqcarimbo, arq_ant, arq1, arq2, arq3, arqTemp,caminho_atual : String;
  ajustcont:integer;
begin

  arqTemp:= ImgEdit1.Image;
  arqcarimbo := ImgEdit1.Image;
  ImgEdit1.SaveAs(arqcarimbo, 1, 1, 3, 0, false);
  ImgEdit1.Image := arqcarimbo;
  ImgEdit1.Display;

 (* arq_ant := arqcarimbo; //arqTemp;
  arq2 := arq_ant;
  ajustcont:=0;
  arq1 :='C:\Siscart\temp\td\'+memo2.lines.Strings[ajustcont];//cam1+ sub+ memo2.lines.Strings[ajustcont];   // andar(arqTemp, '-');
  arq3 := arq2;

  arq1:=cam1+ sub+ memo2.lines.Strings[ajustcont];

  while arq1 <> '' do
  Begin
    //Label2.Caption:= copy(arq1, length(arq1) - 2, 3);
    //Label2.Update;

   { if (length(arq1)-pos('.',arq1) < 4) Then
      Label2.Caption := copy(arq1, length(arq1) - 2, 3)
    else
      Label2.Caption := copy(arq1, length(arq1) - 3, 4);
    }

    arqTemp := 'C:\Siscart\temp\td\'+ memo2.lines.Strings[ajustcont];
    Begin

      caminho_atual:=  'C:\Siscart\temp\td\'+ memo2.lines.Strings[ajustcont];
      if arqcarimbo = caminho_atual then
      begin
       inc(ajustcont);
        if not (ajustcont = verificador) then
          arq1 :='C:\Siscart\temp\td\'+ memo2.lines.Strings[ajustcont]
        else
          arq1:='';
      end;

      ImgEdit1.Image := arq1;
      ImgEdit1.Display;
      ImgEdit1.SaveAs('C:\Siscart\temp\td\' + memo2.lines.Strings[ajustcont], 1, 1, 3, 0, false);

      ImgEdit1.Image := 'C:\Siscart\temp\td\' + memo2.lines.Strings[ajustcont];
      ImgEdit1.Display;



      inc(ajustcont);
      if not (ajustcont = verificador) then
        arq1 :='C:\Siscart\temp\td\'+ memo2.lines.Strings[ajustcont]
      else
      begin
        arq1 :='';
      end;
    End
  end;
 *)
 (* arq1 := andar(arq3, '+');
  while arq1 <> '' do
  begin
    //Label2.Caption:= copy(arq1, length(arq1) - 2, 3);
    //Label2.Update;

   { if (length(arq1)-pos('.',arq1) < 4) Then
      Label2.Caption := copy(arq1, length(arq1) - 2, 3)
    else
      Label2.Caption := copy(arq1, length(arq1) - 3, 4);
     }
    arqTemp := 'C:\siscart\temp\td\' + StrZero(Label16.Caption,6) + '.' + Label2.Caption;
    ImgEdit1.Image := arq1;
    ImgEdit1.Display;
    ImgEdit1.SaveAs(arqTemp, 1, 1, 3, 0, false);
    ImgEdit1.Image := 'C:\siscart\temp\td\' + StrZero(Label16.Caption,6) + '.' + Label2.Caption;
    ImgEdit1.Display;

    arq1 := andar(arq1, '+');
  end;  *)

end;

procedure TF_Certidao.FormActivate(Sender: TObject);
begin
  BitBtn1.OnClick(Self);
  F_Certidao.MaskEdit7.text := TimeToStr(time);
end;

procedure TF_Certidao.BitBtn3Click(Sender: TObject);
var
  _origem, _caminho : String;
begin
  try
    _origem := 'C:\siscart\temp\td\CER_' + Maskedit1.text + '.pdf';
    dir_ato  := dir_daje + 'Atos\';
    Nome_PDF := 'CER_' + Maskedit1.text + '.' + 'PDF';
    _caminho := dir_ato + Nome_PDF;

    CopyFile(PChar(_origem), PChar(_caminho), True);
    If NOT AnexarTeorAto(id_eselo, TirarTudo(Label19.Caption,'-','/','.'), _caminho) then ShowMessage('Problemas para enviar o Teor do Ato para o TJBA.');

    Application.MessageBox('Teor enviado com sucesso!', 'Mensagem do Sistema', mb_ok);
  Except
   Application.MessageBox('Erro ao tentar enviar o Teor!', 'Mensagem do Sistema', mb_ok);
   exit;
  End;

  //var
//  _origem, _caminho : String;
//begin
  {try
    Carrega_Configuracoes;
    _origem := 'C:\siscart\temp\td\CER_' + Maskedit1.text + '.pdf';
    dir_ato  := dir_daje + 'Atos\';
    Nome_PDF := 'CER_' + Maskedit1.text + '.' + 'PDF';
    _caminho := dir_ato + Nome_PDF;

    CopyFile(PChar(_origem), PChar(_caminho), True);
    If NOT AnexarTeorAto(id_eselo, TirarTudo(Label19.Caption,'-','/','.'), _caminho) then ShowMessage('Problemas para enviar o Teor do Ato para o TJBA.');

    Application.MessageBox('Teor enviado com sucesso!', 'Mensagem do Sistema', mb_ok);
  Except
   Application.MessageBox('Erro ao tentar enviar o Teor!', 'Mensagem do Sistema', mb_ok);
   exit;
  End;      }

end;

procedure TF_Certidao.FormDestroy(Sender: TObject);
var
  x, ini, fim : Integer;
begin

  x := 0;
  For x := 1 to 3000 do
    DeleteFile('C:\siscart\temp\td\convtif\Convert\'+INTTOSTR(X)+'.'+'BMP');

  ClearFolder(Self, F_Menu.Label49.Caption + 'img\');
  DeleteFile('C:\siscart\temp\td\CER_' + Maskedit1.text + '.pdf');
  ini := StrToInt(Label2.Caption);
  fim := StrToInt(Label4.Caption);

  //x := 0;
  //For x := 1 to 3000 do
  //  DeleteFile('C:\siscart\temp\td\' + StrZero(Label16.Caption,  iQuantZero) + '.' + StrZero(IntToStr(x),3));
  LimpaDiretorio('C:\siscart\temp\td\');
  LimpaDiretorio('C:\siscart\temp\td\convtif\');
end;

procedure TF_Certidao.BitBtn10Click(Sender: TObject);
begin
  TempPaginas.Insert;
  DBEdit1.Text:= '';
  DBEdit1.SetFocus;
end;

procedure TF_Certidao.BitBtn13Click(Sender: TObject);
begin
  if DBEdit1.Text = '' Then
  Begin
    Application.MessageBox('Número da página, deve ser preenchido!', 'Mensagem do Sistema', mb_ok);
    Abort;
  End;
  TempPaginasPAGINAS.AsString:= Strzero(DBEdit1.Text, 3);
  TempPaginas.Post;

  if application.messagebox(pchar('Deseja gerar o PDF ?'),'Gerar PDF',mb_iconquestion + mb_yesno) = id_yes then
  Begin
    BitBtn4.OnClick(Sender);
  End
  Else
  BitBtn10.onClick(Sender);
end;

procedure TF_Certidao.BitBtn9Click(Sender: TObject);
begin
  TempPaginas.Delete;
end;

procedure TF_Certidao.BitBtn6Click(Sender: TObject);
begin
  TempPaginas.Close;
  Panel5.Visible:= False;
end;

procedure TF_Certidao.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.text<>'' then
  begin
    if (TempPaginas.State in ([DsInsert, DsEdit])) Then
      TempPaginasPAGINAS.AsString := DBEdit1.Text;
  end;
end;

procedure TF_Certidao.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
    BitBtn10.OnClick(Sender);
end;

procedure TF_Certidao.FormShow(Sender: TObject);
var
  x: Integer;
begin
  controle_ajuste:=false;
  FileListBox1.Directory := sCaminhoDosCarimbos;
  FileListBox1.Update;
  ComboBox4.Items.Clear;
  for x := 0 to FileListBox1.Items.Count - 1 do
  begin
    FileListBox1.ItemIndex := x;
    if UpperCase(PegaAte(FileListBox1.FileName, '.','R')) = 'TIF' then
      ComboBox4.Items.Add(PegaAte(FileListBox1.FileName, '\','R'));
  end;
  ImgEdit2.Image := sCaminhoDosCarimbos + ComboBox4.text;
  ImgEdit2.FitTo(1, true);
  FileListBox1.Directory := dir_temp;
  FileListBox1.Update;

  if Trim(ComboBox4.Text) = '' then ComboBox4.Text := ComboBox4.Items.Strings[1];
  if Trim(ComboBox2.Text) = '' then ComboBox2.Text := ComboBox2.Items.Strings[0];

  Dm.Usuarios.Close;
  Dm.Usuarios.SQL.Clear;
  Dm.Usuarios.SQL.Add('select * from usuarios where assina = "S"');
  Dm.Usuarios.Open;

  Dm.Usuarios.First;
  while not Dm.Usuarios.eof do
  Begin
    if (F_Certidao.ComboBox2.Text = '') then
      F_Certidao.ComboBox2.Text := UnCript(Dm.Usuarios.FieldByName('u_nome').AsString);
    F_Certidao.ComboBox2.Items.Add(UnCript(Dm.Usuarios.FieldByName('u_nome').AsString));

    if (F_Menu.Label45.Caption = 'S') then
    begin
      F_Certidao.ComboBox2.Text := F_Menu.Label25.Caption;
    end;
    Dm.Usuarios.Next;
  End;  

end;


procedure TF_Certidao.BitBtn12Click(Sender: TObject);
var
  ext, arq, arq_tmp : String;
  denovo : boolean;
  mat_ : string;
  bitmap0 : TBitmap;
begin
  if Copy(ComboBox4.Text, 1, 2) = '99' then
  begin
    //ImgEdit6.Image := '';
    //ImgEdit6.ClearDisplay;
    //ImgEdit6.Image := 'C:\siscart\temp\td\CARIMBO_TMP.TIF';
    //ImgEdit6.Zoom := 20;
    //ImgEdit6.Display;        //altura //largura
    //ImgEdit6.ClipboardCopy(1, 0, 450, 100);
    //imgEdit1.ClipboardPaste(10, 200);
    ImgEdit6.ClipboardCopy(0, 0, 300, 300);
    ImgEdit1.ClipboardPaste(10, 200);
  end
  Else
  Begin
    ImgEdit6.Image := '';
    ImgEdit6.ClearDisplay;
    ImgEdit6.Image := sCaminhoDosCarimbos+'\'+ComboBox4.Text;
    ImgEdit6.Zoom := 20;
    ImgEdit6.Display;
    ImgEdit6.ClipboardCopy(0, 0, 500, 900);
    ImgEdit1.ClipboardPaste(10, 200);
  End;
end;
procedure TF_Certidao.ComboBox4Change(Sender: TObject);
begin

    IMgEdit6.Image := sCaminhoDosCarimbos+'\'+ComboBox4.Text;
    ImgEdit6.Zoom := 20;
    ImgEdit6.Display;
end;

procedure TF_Certidao.CheckBox11Click(Sender: TObject);
begin
  if CheckBox11.Checked then
  begin
    Application.CreateForm(TF_LotClan, F_LotClan);
    F_LotClan.ShowModal;
    F_LotClan.Destroy;
    F_LotClan := Nil;
    
    if Copy(ComboBox4.Text, 1, 2) = '99' then
    begin
      //ImgEdit6.Height := 100;
      //ImgEdit6.Width := 200; //Reduz a largura do texto

      ImgEdit6.Height := 174;
      ImgEdit6.Width := 442;
      Carrega_XPressAssinatura2(IMgEdit6.Image);
    end

  end;
end;

Procedure TF_Certidao.Carrega_XPressAssinatura2(Imagem : String);
var
  x_car, y_car, centraliza : Integer;
  rr : Double;
begin
  F_Certidao.ImagXCarimbo.FileName := F_Certidao.ImgEdit6.Image;
  If F_Certidao.ImagXCarimbo.ImagError <> 0 then
    showmessage('Erro ao carregar o arquivo ' + sCaminhoDosCarimbos + F_Certidao.ComboBox1.Text);
  x_car := F_Certidao.ImagXCarimbo.IHeight;
//  y_car := 60;
  y_car := 20;
  centraliza :=  0;
//  F_Certidao.ImagXCarimbo.Font.Name     := 'Arial';   // courier new
  F_Certidao.ImagXCarimbo.Font.Name     := 'courier new';
  F_Certidao.ImagXCarimbo.Font.Size     := 36;  //18;
  F_Certidao.ImagXCarimbo.DrawStyle     := STYLE_Solid;
  F_Certidao.ImagXCarimbo.DrawFillStyle := FILL_Transparent;
  F_Certidao.ImagXCarimbo.DrawMode      := PEN_Blackness;
  F_Certidao.ImagXCarimbo.Font.Style    := [fsBold];  // negrito
  //F_Certidao.ImagXCarimbo.Font.Style    := [];      // normal

  if F_Certidao.mens_lote1 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car,  10, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote1), RGB(0, 0, 0));
  if F_Certidao.mens_lote2 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car,  50, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote2), RGB(0, 0, 0));
  if F_Certidao.mens_lote3 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 100, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote3), RGB(0, 0, 0));
  if F_Certidao.mens_lote4 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 150, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote4), RGB(0, 0, 0));
  if F_Certidao.mens_lote5 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 200, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote5), RGB(0, 0, 0));
  if F_Certidao.mens_lote6 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 250, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote6), RGB(0, 0, 0));
  if F_Certidao.mens_lote7 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 300, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote7), RGB(0, 0, 0));
  if F_Certidao.mens_lote8 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 350, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote8), RGB(0, 0, 0));
  if F_Certidao.mens_lote9 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 400, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote9), RGB(0, 0, 0));
  if F_Certidao.mens_lote10 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 450, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote10), RGB(0, 0, 0));
  if F_Certidao.mens_lote11 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 500, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote11), RGB(0, 0, 0));
  if F_Certidao.mens_lote12 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 550, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote12), RGB(0, 0, 0));
  if F_Certidao.mens_lote13 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 600, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote13), RGB(0, 0, 0));

  if F_Certidao.mens_lote14 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 650, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote14), RGB(0, 0, 0));
  if F_Certidao.mens_lote15 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 700, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote15), RGB(0, 0, 0));
  if F_Certidao.mens_lote16 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 750, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote16), RGB(0, 0, 0));
  if F_Certidao.mens_lote17 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 800, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote17), RGB(0, 0, 0));
  if F_Certidao.mens_lote18 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 850, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote18), RGB(0, 0, 0));
  if F_Certidao.mens_lote19 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 900, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote19), RGB(0, 0, 0));
  if F_Certidao.mens_lote20 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 950, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote20), RGB(0, 0, 0));



   if F_Certidao.mens_lote21 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 1000, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote21), RGB(0, 0, 0));
  if F_Certidao.mens_lote22 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 1050, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote22), RGB(0, 0, 0));
  if F_Certidao.mens_lote23 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 1100, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote23), RGB(0, 0, 0));
  if F_Certidao.mens_lote24 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 1150, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote24), RGB(0, 0, 0));
  if F_Certidao.mens_lote25 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 1200, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote25), RGB(0, 0, 0));
  if F_Certidao.mens_lote26 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 1250, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote26), RGB(0, 0, 0));
  if F_Certidao.mens_lote27 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 1300, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote27), RGB(0, 0, 0));
  if F_Certidao.mens_lote28 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 1350, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote28), RGB(0, 0, 0));
  if F_Certidao.mens_lote29 <> '' then
   F_Certidao.ImagXCarimbo.DrawTextString(Y_car, 1400, StringOfChar(' ', centraliza) + Trim(F_Certidao.mens_lote29), RGB(0, 0, 0));














  F_Certidao.ImagXCarimbo.Paint;
  F_Certidao.ImagXCarimbo.SaveFileName := 'C:\siscart\temp\td\CARIMBO_TMP.TIF';
  F_Certidao.ImagXCarimbo.SaveFileType := FT_TIFF;
  F_Certidao.ImagXCarimbo.SaveTIFFCompression := TIFF_CCITTFAX3;
  F_Certidao.ImagXCarimbo.SaveFile;
  sleep(200);
  F_Certidao.ImgEdit6.Image := 'C:\siscart\temp\td\CARIMBO_TMP.TIF';
  F_Certidao.ImgEdit6.Display;
  //F_Certidao.ImgEdit6.FitTo(0, True);
end;


procedure TF_Certidao.Button1Click(Sender: TObject);
var
  arqcarimbo, arq_ant, arq1, arq2, arq3, arqTemp : String;
begin
  arqTemp:= ImgEdit1.Image;
  arqcarimbo := arqTemp;//'C:\siscart\temp\td\' + StrZero(Label16.Caption,6) + '.' + StrZero(Label2.Caption,3);
  ImgEdit1.SaveAs(arqcarimbo, 1, 1, 3, 0, false);
  ImgEdit1.Image := arqcarimbo;
  ImgEdit1.Display;
end;

procedure TF_Certidao.CarregaImagemSemDimensionar(Imagem : String);
var
  mais_imagem, tem_branco : Boolean;
  arq_xpress, arq_xpress_ant, extensao, arq_temp : String;
  num_pag, desc_num : Integer;
  _perc, _TotaDAJE: Currency;
begin
  tem_branco := False;
  mais_imagem := True;
  F_Certidao.Xpress2.FileName := imagem;
  arq_xpress := imagem;
  num_pag := 0;
  arq_temp := PegaAte(TimeToStr(time), ':', 'L');
  arq_temp := arq_temp + PegaAte(TimeToStr(time), ':', 'R');
  desc_num := 0;
  _perc:= 0;
  _TotaDAJE:= 0;

  while mais_imagem do
  begin
    F_Certidao.Xpress1.Area(False, 0, 0, 0, 0);
    F_Certidao.Xpress1.Merge(False, 0, 0, False, 0, 0, 0);
    F_Certidao.Xpress1.ViewUpdate := False;

    if num_pag = 0 then
    begin
      F_Certidao.Xpress1.FileName := F_Menu.Label4.Caption + 'modelo_sem_cabec.tif';
    end;

    If F_Certidao.Xpress1.ImagError <> 0 then showmessage('Erro ao carregar o arquivo modelo_sem_cabec.TIF');

    if StrToInt(PegaAte(F_Certidao.XPress2.FileName, '.', 'R')) mod 2 = 0 then
    begin

      IP_TRANSPARENT := True;
      IP_TCOLOR      := RGB(255, 255, 255);
      IP_MERGESIZE   := 2;
      F_Certidao.Xpress1.ViewUpdate := True;
      F_Certidao.Xpress1.Merge(True, IP_MERGESIZE, 0, IP_TRANSPARENT, IP_TCOLOR, 0, 0);

      if (F_Menu.Label39.Caption = '13236831000109') or (F_Menu.Label39.Caption = '13.236.831/0001-09') or
        (TirarTudo(F_Menu.Label39.Caption, '.', '-', '/') = '13648829000147') then
      Begin
        Dm.qryGenerico.Close;
        Dm.qryGenerico.Sql.Clear;
        Dm.qryGenerico.Sql.Add('SELECT custas FROM certidao');
        Dm.qryGenerico.Sql.Add('WHERE');
        Dm.qryGenerico.Sql.Add('nr_protoc = ' + Trim(F_ExameC.MaskEdit1.Text));
        Dm.qryGenerico.Open;

        if (Not(dm.Configur.Active)) Then
          dm.Configur.Open;

        if (dm.Configur.RecordCount <> 0) then
        begin
          _EmolDaje    := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('emol_daje').AsCurrency)/100),-2);
          _TaxaFiscalDaje  := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('tx_fiscal_daje').AsCurrency)/100),-2);
          _FecomDaje   := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('fecom_daje').AsCurrency)/100),-2);
          _DefPublicaDaje  := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('def_pub_daje').AsCurrency)/100),-2);
          _PGE          := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('vr_pge').AsCurrency)/100),-2);
          _FMMPBA       := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('fmmpba').AsCurrency)/100),-2);

          _TotaDAJE     := (_EmolDaje + _TaxaFiscalDaje + _FecomDaje + _DefPublicaDaje + _PGE + _FMMPBA);

          if (dm.qryGenerico.FieldByName('custas').AsCurrency <> _TotaDAJE) then
            _DefPublicaDaje := _DefPublicaDaje + (dm.qryGenerico.FieldByName('custas').AsCurrency - _TotaDAJE);
        end;

        F_Certidao.Xpress1.Font.Name := 'Arial';
        F_Certidao.Xpress1.FOnt.Size := 30;

        F_Certidao.Xpress1.DrawTextString(55,3340, 'Emolumentos: R$ ' + CurrToStr(_EmolDaje)+
                                                   ' Fiscal: R$ ' +CurrToStr(_TaxaFiscalDaje) +
                                                   ' FECOM: R$ '+ CurrToStr(_FecomDaje) +
                                                   ' Defensoria: R$ '+ CurrToStr(_DefPublicaDaje) +
                                                   ' PGE: R$ '+ CurrToStr(_PGE)+
                                                   ' FMMPBA: R$ '+ CurrToStr(fmmpba), RGB(0, 0, 0));
      End
      Else
      Begin
        Dm.qryGenerico.Close;
        Dm.qryGenerico.Sql.Clear;
        Dm.qryGenerico.Sql.Add('SELECT nr_protoc, movimento, protocolo as registro, stat_data FROM certidao');
        Dm.qryGenerico.Sql.Add('WHERE');
        Dm.qryGenerico.Sql.Add('nr_protoc = ' + Trim(F_ExameC.MaskEdit1.Text));
        Dm.qryGenerico.Open;

        F_Certidao.Xpress1.Font.Name := 'Arial';
        F_Certidao.Xpress1.FOnt.Size := 20;

        {F_Certidao.Xpress1.DrawTextString(55,3340, ' Protocolo: '+F_Certidao.MaskEdit1.Text+
                                                   //' Data de Recepção: '+Dm.qryGenerico.FieldByName('movimento').AsString +
                                                   ' Nº do Registro: '+Dm.qryGenerico.FieldByName('registro').AsString +
                                                   //' Data de Registro: '+Dm.qryGenerico.FieldByName('stat_data').AsString +
                                                   ' O prazo de validade desta certidão é de 30(trinta) dias. ', RGB(0, 0, 0));

        F_Certidao.Xpress1.DrawTextString(55,3370, ' O prazo de validade desta certidão é de 30(trinta) dias. ', RGB(0, 0, 0));}

      End;


      //if Not F_Certidao.CheckBox7.Checked then  F_Certidao.Xpress2.AutoCrop(0.15,50,1000);
    end
    else
    begin
      if (F_Menu.Label39.Caption = '13236831000109') or (F_Menu.Label39.Caption = '13.236.831/0001-09') or
        (F_Menu.Label39.Caption = '13648829000147') or (F_Menu.Label39.Caption = '13.648.829/0001-47') Then
      Begin
        Dm.qryGenerico.Close;
        Dm.qryGenerico.Sql.Clear;
        Dm.qryGenerico.Sql.Add('SELECT custas FROM certidao');
        Dm.qryGenerico.Sql.Add('WHERE');
        Dm.qryGenerico.Sql.Add('nr_protoc = ' + Trim(F_ExameC.MaskEdit1.Text));
        Dm.qryGenerico.Open;

        if (Not(dm.Configur.Active)) Then
          dm.Configur.Open;

        if (dm.Configur.RecordCount <> 0) then
        begin
          _EmolDaje    := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('emol_daje').AsCurrency)/100),-2);
          _TaxaFiscalDaje  := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('tx_fiscal_daje').AsCurrency)/100),-2);
          _FecomDaje   := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('fecom_daje').AsCurrency)/100),-2);
          _DefPublicaDaje  := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('def_pub_daje').AsCurrency)/100),-2);
          _PGE          := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('vr_pge').AsCurrency)/100),-2);
          _FMMPBA       := RoundTo(((dm.qryGenerico.FieldByName('custas').AsCurrency * dm.Configur.FieldByName('fmmpba').AsCurrency)/100),-2);

          _TotaDAJE     := (_EmolDaje + _TaxaFiscalDaje + _FecomDaje + _DefPublicaDaje + _PGE + _FMMPBA);

          if (dm.qryGenerico.FieldByName('custas').AsCurrency <> _TotaDAJE) then
            _DefPublicaDaje := _DefPublicaDaje + (dm.qryGenerico.FieldByName('custas').AsCurrency - _TotaDAJE);
        end;

        F_Certidao.Xpress1.Font.Name := 'Arial';
        F_Certidao.Xpress1.FOnt.Size := 30;

        F_Certidao.Xpress1.DrawTextString(55,3340, 'Emolumentos: R$ ' + CurrToStr(_EmolDaje)+
                                                   ' Fiscal: R$ ' +CurrToStr(_TaxaFiscalDaje) +
                                                   ' FECOM: R$ '+ CurrToStr(_FecomDaje) +
                                                   ' Defensoria: R$ '+ CurrToStr(_DefPublicaDaje) +
                                                   ' PGE: R$ '+ CurrToStr(_PGE) +
                                                   ' FMMPBA: R$ '+ CurrToStr(fmmpba), RGB(0, 0, 0));

      End
      Else
      Begin
        Dm.qryGenerico.Close;
        Dm.qryGenerico.Sql.Clear;
        Dm.qryGenerico.Sql.Add('SELECT nr_protoc, movimento, protocolo as registro, stat_data FROM certidao');
        Dm.qryGenerico.Sql.Add('WHERE');
        Dm.qryGenerico.Sql.Add('nr_protoc = ' + Trim(F_ExameC.MaskEdit1.Text));
        Dm.qryGenerico.Open;

        F_Certidao.Xpress1.Font.Name := 'Arial';
        F_Certidao.Xpress1.FOnt.Size := 20;


        {F_Certidao.Xpress1.DrawTextString(55,3340, ' O prazo de validade desta certidão é de 30(trinta) dias. ', RGB(0, 0, 0));

        F_Certidao.Xpress1.DrawTextString(55,3340, ' Protocolo: '+F_Certidao.MaskEdit1.Text+
                                                   //' Data de Recepção: '+Dm.qryGenerico.FieldByName('movimento').AsString +
                                                   ' Nº do Registro: '+Dm.qryGenerico.FieldByName('registro').AsString +
                                                   //' Data de Registro: '+Dm.qryGenerico.FieldByName('stat_data').AsString +
                                                   ' O prazo de validade desta certidão é de 30(trinta) dias. ', RGB(0, 0, 0)); }

      End;

      IP_TRANSPARENT := True;
      IP_TCOLOR      := RGB(255, 255, 255);
      IP_MERGESIZE   := 2;
      F_Certidao.Xpress1.ViewUpdate := True;
      F_Certidao.Xpress1.Merge(True, IP_MERGESIZE, 0, IP_TRANSPARENT, IP_TCOLOR, 0, 0);
//      if Not F_Certidao.CheckBox7.Checked then F_Certidao.Xpress2.autoCrop(0.15,50,1000);
    end;
        //ultimapaginaX :=F_Certidao.ajustCont


    F_Certidao.Xpress2.Paint;
    F_Certidao.Xpress2.SaveFileName := 'C:\siscart\temp\td\imgtmp.tif';
    F_Certidao.Xpress2.SaveFileType := FT_TIFF;
    F_Certidao.Xpress2.SaveTIFFCompression := TIFF_CCITTFAX3;
//    F_Certidao.Xpress2.SaveTIFFCompression := TIFF_CCITTFAX4;

    F_Certidao.Xpress2.SaveFile;

    F_Certidao.Xpress1.SaveFileType := FT_TIFF;
    F_Certidao.Xpress1.SaveTIFFCompression := TIFF_CCITTFAX3;
//    F_Certidao.Xpress1.SaveTIFFCompression := TIFF_CCITTFAX4;

    F_Certidao.Xpress1.FileName     := 'C:\siscart\temp\td\imgtmp.tif';
    F_Certidao.Xpress1.Paint;

    num_pag := num_pag + 1;

    F_Certidao.Xpress1.SaveFileName := 'C:\siscart\temp\td\' + PegaAte(arq_xpress, '\', 'R');
    F_Certidao.Xpress1.SaveFile;

    arq_xpress_ant := arq_xpress;


    if not (F_Certidao.ajustCont = F_Certidao.verificador) then
    begin
     inc(F_Certidao.ajustCont);

     if F_Certidao.ajustCont =  F_Certidao.verificador then arq_xpress:=''
     else
       arq_xpress :=cam1 + sub+ F_Certidao.memo2.lines.strings[F_Certidao.ajustcont];
    end else
    begin
      arq_xpress :='';
    end;
//    arq_xpress     := andar(F_Certidao.XPress2.FileName, '+');

    //arq_xpress := andar(F_Certidao.XPress2.FileName, '+');

    if (arq_xpress = '') and (not tem_branco) then
    begin
      mais_imagem := False;
    end
    else
    begin
      if (tem_branco) and (arq_xpress = '') then
      begin
        F_Certidao.Xpress1.Area(False, 0, 0, 0, 0);
        F_Certidao.Xpress1.Merge(False, 0, 0, False, 0, 0, 0);
        F_Certidao.Xpress1.ViewUpdate := False;

        F_Certidao.Xpress1.FileName := F_Menu.Label4.Caption + 'branco_sem_cabec.tif';

        If F_Certidao.Xpress1.ImagError <> 0 then showmessage('Erro ao carregar o arquivo branco_sem_cabec.TIF');

        F_Certidao.Xpress1.Area(True, Round(F_Certidao.Xpress1.IWidth * 0.1), Round(F_Certidao.Xpress1.IHeight * 0.1), Round(F_Certidao.Xpress1.IWidth * 0.85), Round(F_Certidao.Xpress1.IHeight * 0.83));

        IP_TRANSPARENT := True;
        IP_TCOLOR      := RGB(255, 255, 255);
        IP_MERGESIZE   := 2;
        F_Certidao.Xpress1.ViewUpdate := True;
        F_Certidao.Xpress1.Merge(True, IP_MERGESIZE, 0, IP_TRANSPARENT, IP_TCOLOR, 0, 0);

        F_Certidao.Xpress1.SaveFileType := FT_TIFF;
        F_Certidao.Xpress1.SaveTIFFCompression := TIFF_CCITTFAX3;

        F_Certidao.Xpress1.Paint;

        extensao := '000' + IntToStr(StrToInt(PegaAte(arq_xpress_ant, '.', 'R')) + 1);
        extensao := copy(extensao, length(extensao) - 2, 3);
        arq_xpress := PegaAte(arq_xpress_ant, '\', 'R');
        arq_xpress := PegaAte(arq_xpress, '.', 'L') + '.' + extensao;
        arq_xpress := 'C:\siscart\' + arq_xpress;

        F_Certidao.Xpress1.SaveFileName := 'C:\siscart\' + PegaAte(arq_xpress, '\', 'R');
        F_Certidao.Xpress1.SaveFile;

        tem_branco  := False;
      end;
      F_Certidao.Xpress2.FileName := arq_xpress;
    end;
  end;
End;

procedure TF_Certidao.BtAjustaImagemSemDiminuirClick(Sender: TObject);
begin
  CarregaImagemSemDimensionar(PegaAte(ImgEdit1.Image, '.', 'L') + '.001');
end;

procedure TF_Certidao.edtAverbacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then BitBtn1.SetFocus;
end;

procedure TF_Certidao.ListarArquivos(Diretorio: string; Sub: Boolean;Arq:string);
var

  F: TSearchRec;

  Ret: Integer;

  TempNome: string;

begin
  Ret := FindFirst(Diretorio+'*.*', faAnyFile, F);
   memo1.Lines.clear;
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
          if Sub = True then
          begin
            TempNome := Diretorio+'\' + F.Name;
            ListarArquivos(TempNome, True,arq);
          end;
      end
      else
      begin
        //Memo1.Lines.Add(Diretorio+'\'+F.Name);
        if edtAverbacao.Text <> '' then
        begin
          if pos(Arq+'_',F.Name) > 0 then
          Memo1.Lines.Add(F.Name);
        end
        else
        begin
          if Pos(Arq,F.Name) > 0 then
          begin
            if not (Pos(Arq+'_',F.Name) > 0) then
            Memo1.Lines.Add(F.Name);
          end;

        end;
      end;
        Ret := FindNext(F);
    end;
  finally
  begin
    FindClose(F);
  end;
 end;
end;

function TF_Certidao.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TF_Certidao.get_imagens(avarba: boolean);
var i, ipos, linha,tamanho : Integer;
buffer : string;
begin
  memo2.Lines.clear;
 if not avarba then
 begin
   for I := 0 to memo1.Lines.Count - 1 do
     if  Pos(Label16.caption,memo1.Lines.Strings[I]) > 0 then
     begin
      if not (Pos(Label16.caption+'_',memo1.Lines.Strings[I]) > 0) then
      begin
        tamanho := Length(memo1.Lines.Strings[I]);
        memo2.Lines.Add(copy(memo1.Lines.Strings[I],0,tamanho));
      end;
     end;
 end else
 begin
  for I := 0 to memo1.Lines.Count - 1 do
     if  Pos(Label16.caption+'_'+trim(edtAverbacao.text),memo1.Lines.Strings[I]) > 0 then
     begin
       tamanho := Length(memo1.Lines.Strings[I]);
       memo2.Lines.Add(copy(memo1.Lines.Strings[I],0,tamanho));
     end;
 end;

 Label4.caption:= inttostr(memo2.Lines.Count);
 verificador:= memo2.Lines.Count;
 contador:=0;
end;

procedure TF_Certidao.Ordenar(Valores: tStrings);
var i, j : integer;
    temp : string;
begin
  for i := 0 to Valores.Count - 1 do
    for j := 0 to Valores.Count - 2 do
    begin
      if ansiUpperCase(Valores[j]) > ansiUpperCase(Valores[j + 1]) then
      begin
        TEmp := Valores[j];
        Valores[j] := Valores[j + 1];
        Valores[j + 1 ] := TEmp;
      end;
    end;
end;

procedure TF_Certidao.CheckBox12Click(Sender: TObject);
begin
  if CheckBox12.Checked then
  begin
    CheckBox14.Visible := true;
    CheckBox14.Checked := false;
  end else
  begin
    CheckBox14.Checked := false;
    CheckBox14.Visible := false;
  end;
end;

procedure TF_Certidao.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TDM_IMG,DM_IMG);
  maskedit6.text := DateToStr(date);
end;

procedure TF_Certidao.MaskEdit1Exit(Sender: TObject);
begin
  { iniciar }
  //maskedit5.enabled := false;
  //speedButton3.enabled := false;
  if maskedit1.text <> '' then
  Begin
    tem_pedido := false;
    tem_pre := false;
    tem_arisp := false;
    tem_oficio := false;
    tem_outro := false;
    {if ComboBox5.text = 'Pedido Nº' then
    begin
      if not loc_cert(maskedit1.text) then tem_pedido := false else tem_pedido := true;
    end;
      if ComboBox5.text = 'Arisp Nº' then
    begin
      if not loc_cert(maskedit1.text) then tem_arisp := false else tem_arisp := true;
    end;
      if ComboBox5.text = 'Prenotação Nº' then
    begin
      if not loc_pre(.text) then tem_pre := false else tem_pre := true;
    end;
      if (ComboBox5.text = 'Ofício Nº') or (ComboBox5.text = 'Internet Nº') then
    begin
      if not senha(maskedit1.text) then tem_oficio := false else tem_oficio := true;
    end;
    if ComboBox5.text = 'Outro' then
    begin
      tem_outro := true;
    end;
    if (not tem_arisp) and (not tem_pre) and (not tem_pedido) and (not tem_oficio) and (not tem_outro) then
    Begin
      maskedit1.enabled := true;
      //speedButton3.enabled := true;
      maskedit1.text := '';
      if label13.caption <> 'balcao' then Maskedit5.SetFocus;
      Exit;
    end;}
  end;
  tem_outro := true;
end;

end.
