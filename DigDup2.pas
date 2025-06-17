unit DigDup2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, AxCtrls, OleCtrls, ImgeditLibCtl_TLB, ExtCtrls,
  ComCtrls, ScanLibCtl_TLB, Db, Grids, DBGrids, DBTables, Menus,
  DbOleCtl, FileCtrl, QuickRpt, Qrctrls, SISRenameTIFFMat_TLB, TWNPRO4Lib_TLB,
  ImagXpr7_TLB, shellApi;

type
  TF_DigDup2 = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    Zoom1: TMenuItem;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    ImgEdit1: TImgEdit;
    ImgScan1: TImgScan;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit2: TMaskEdit;
    Label9: TLabel;
    MaskEdit3: TMaskEdit;
    Label10: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label11: TLabel;
    Label5: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Label13: TLabel;
    Label6: TLabel;
    SpeedButton5: TSpeedButton;
    Panel3: TPanel;
    SpeedButton6: TSpeedButton;
    CheckBox1: TCheckBox;
    Xpress1: TImagXpress;
    TwainPRO1: TTwainPRO;
    Label12: TLabel;
    MaskEdit4: TMaskEdit;
    CheckBox2: TCheckBox;
    Label100: TLabel;
    CheckBox30: TCheckBox;
    BitBtn10: TBitBtn;
    CheckBox3: TCheckBox;
    MaskEdit5: TMaskEdit;
    BitBtn12: TBitBtn;
    Label14: TLabel;
    edtAverbacao: TMaskEdit;
    Memo1: TMemo;
    ComboBox1: TComboBox;
    Label15: TLabel;
    Memo2: TMemo;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Zoom1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ImgEdit1DblClick(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ImgScan1PageDone(Sender: TObject; PageNumber: Integer);
    procedure ImgScan1ScanUIDone(Sender: TObject);
    procedure ImgScan1ScanDone(Sender: TObject);
    procedure ImgScan1FileNameRequest(Sender: TObject;
      PageNumber: Integer);
    procedure ImgScan1ScanStarted(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure TwainPRO1PostScan(Sender: TObject; var Cancel: WordBool);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure edtAverbacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    function pesquisaImagem(numero: String): String;
    { Private declarations }
  public
    { Public declarations }
    contadorx,verificadorx, ajustCont: integer;
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure ListarArquivos(Diretorio: string; Sub:Boolean;Arq:string);
    procedure get_averba;
    procedure Ordenar(Valores: tStrings);
  end;
  Function Andar(arq_img, sentido : String) : Boolean;
var
  F_DigDup2: TF_DigDup2;
  arq1, cam1, cam2, img_a, operacao, temp, img, arq, sub, tipolog : String;
  arq_temp, frente, verso : String;
  varios : Boolean;
  prot_scan, prot_scan0 : String;  
  GeraArquivoBMP : Boolean;
  aArquivoConverter: WideString;
  aCaminhoDestino: WideString;
  aDocumentoInicial: WideString;
  aDocumentoFinal: WideString;
  aPaginaInicial: Integer;
  aPaginas: Integer;
  iQuantZero: Integer;
  ObjRename: clsRenameTIFF;
  imagem_generica: String;
  contx:integer;


implementation

uses DMTD, Menu, Zoom, Senha, Loc, ExcLote, DispScan, ProcGeral, Exame;

{$R *.DFM}



procedure Copiar(Origem, Destino: string);
var
  InFile,OutFile: File;
  Buffer: array[1..1024]of byte;
  NumRecsRead: integer;
begin
  AssignFile(InFile,Origem);
  AssignFile(OutFile,Destino);
  Reset(Infile,1);
  Rewrite(OutFile,1);
  while not EOF(Infile) do
  begin
    BlockRead(InFile,Buffer,Sizeof(Buffer),NumRecsRead);
    BlockWrite(OutFile,Buffer,NumRecsRead);
  end;
  CloseFile(InFile);
  CloseFile(OutFile);
end;



Procedure AbreLacuna(arquivo, ext_ini, ext_fim : String; qtde : Integer);
var
  ext_ori, ext_des, ext_ult : String;
  ii, pp, pula : Integer;
Begin
  While True do
  begin
    pula := (StrToInt(ext_fim) - StrToInt(ext_ini)) + 1;
    ii := 1;
    pp := 1;
    ext_ult := ext_fim;
    for ii := 1 to qtde do
    begin
      ext_ori := ext_ult;
      ext_des := IntToStr(StrToInt(ext_ult)+1);
      pp := 1;
      for pp := 1 to pula do
      begin
        if pp = 1 then
        begin
          ext_ult := ext_des;
        end;
        if FileExists(arquivo+'.'+ext_ori) then
        begin
          Copiar(arquivo+'.'+ext_ori,arquivo+'.'+ext_des);
          DeleteFile(arquivo+'.'+ext_ori);
        end
        else
          break;
        ext_ori := IntToStr(StrToInt(ext_ori)-1);
        ext_des := IntToStr(StrToInt(ext_des)-1);
      end;
    end;
    Break;
  end;
end;



{Procedure Renomeia(arquivo, ext_del, ext_fim : String);
var
  ext_ren : String;
Begin
  While True do
  begin
    ext_ren := IntToStr(StrToInt(ext_del)+1);
    if FileExists(arquivo+'.'+ext_ren) then
    begin
      Copiar(arquivo+'.'+ext_ren,arquivo+'.'+ext_del);
      DeleteFile(arquivo+'.'+ext_ren);
    end
    else
      break;
    ext_del := IntToStr(StrToInt(ext_del)+1);
  end;
end;}

Procedure Renomeia(arquivo, ext_del, ext_fim : String);
var
  ext_ren : String;
Begin
  While True do
  begin
    ext_ren := StrZero(IntToStr(StrToInt(ext_del)+1),3);
    ext_del := StrZero(IntToStr(StrToInt(ext_del)),3);
    if FileExists(arquivo+'.'+ext_ren) then
    begin
      Copiar(arquivo+'.'+ext_ren,arquivo+'.'+ext_del);
      DeleteFile(arquivo+'.'+ext_ren);
    end
    else
      break;
    ext_del := IntToStr(StrToInt(ext_del)+1);
  end;
end;

Procedure CriaDir( param1 : string );
begin
  if not DirectoryExists(param1) then
  begin
    ForceDirectories(param1);
    if not DirectoryExists(param1) then
    begin
      showmessage('Problemas para criar diretorio ' + param1);
      exit;
    end;
  end;
end;

Function Tem_Prot(Protocolo : String) : Boolean;
Begin
  Result := False;
  Dm.query1.Close;
  Dm.query1.Sql.Clear;
  Dm.query1.Sql.Add('SELECT count(protocolo) as qtde FROM td');
  Dm.query1.Sql.Add('WHERE');
  //
  if F_DigDup2.label7.caption = 'titulos' then
  begin
    Dm.query1.Sql.Add('registro = ' + protocolo);
  end
  else if F_DigDup2.label7.caption = 'certifi' then
       begin
         Dm.query1.Sql.Add('certcertif = ' + protocolo);
       end;
  //
  Dm.query1.Open;
  result := (dm.query1.fieldbyname('qtde').asinteger > 0);
  Dm.query1.Close;
end;

Procedure Atual_Logs(Protocolo, Tipo, Pagina, Data, Hora, Usuario, Operacao : String);
Begin
  Dm.Log_Dig.Close;
  Dm.Log_Dig.Sql.Clear;
  Dm.Log_Dig.Sql.Add('SELECT * FROM log_dig');
  Dm.Log_Dig.Sql.Add('WHERE');
  Dm.Log_Dig.Sql.Add('recno = 0');
  Dm.Log_Dig.Open;
  Dm.Log_Dig.Append;
  Dm.Log_Dig.FieldByName('protocolo').asString := protocolo;
  Dm.Log_Dig.FieldByName('tipo').asString      := tipo;
  Dm.Log_Dig.FieldByName('pagina').asString    := pagina;
  Dm.Log_Dig.FieldByName('data').asString      := data;
  Dm.Log_Dig.FieldByName('hora').asString      := hora;
  Dm.Log_Dig.FieldByName('usuario').asString   := usuario;
  Dm.Log_Dig.FieldByName('operacao').asString  := operacao;
  Dm.Log_Dig.Post;
  Dm.Log_Dig.Close;
end;

Procedure Inicializar;
var
  timeout : Integer;
begin
  with F_DigDup2 do
  begin
    { Limpando ImgEdit }
    //deletefile(ImgScan1.Image);
    ImgScan1.ScanTo := DisplayAndFile;
    ImgScan1.MultiPage := True;
    ImgScan1.ShowSetupBeforeScan := CheckBox1.Checked;
    ImgScan1.Page      := 1;
    ImgScan1.PageCount := 0;
    ImgScan1.Refresh;
    ImgScan1.Update;
    ImgEdit1.Page      := 1;
    ImgEdit1.ClearDisplay;
    { Preparando arquivo temporario }

    ImgScan1.Image := 'c:\siscart\temp_pro.tif';
    deletefile('c:\siscart\temp_pro.tif');
    Xpress1.FileName := 'c:\siscart\temp_pro.tif';


    {ImgScan1.Image := 'c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif';

    deletefile('c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif');

    ImgScan1.Image := 'c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif';

    Xpress1.FileName := 'c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif';
    }

  end;
end;

function contar2( protocolo : string ; Mostra, Inicio, SeqExt : boolean ) : integer;
var
  achou : boolean;
  ult_arq, ult_img_frente, ult_img_verso : string;
  pri_arq, pri_img_frente, pri_img_verso, xy : string;
  contador, ext, ext2, ini, fim : integer;
begin
  result         := 1;              
  contador       := 0;
  imagem_generica:= '';
  pri_arq        := '';
  pri_img_frente := '';
  pri_img_verso  := '';
  with F_DigDup2 do
  begin
      //for xy := ini to fim do
      //begin
        xy := protocolo;
        ext  := 1;
        ext2 := 2;
        sub  := F_Menu.definesub(MaskEdit1.Text);
        CriaDir(cam1 + sub);
        //while true do
        //begin
          if fileexists(cam1 + sub + strzero(xy,3) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(xy,3) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(xy,3) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(xy,3) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(xy,3) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(xy,3) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(xy,3) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else if fileexists(cam1 + sub + strzero(xy,4) + '.' + strzero(inttostr(ext),3)) then
          begin
            {if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext; }
          end
          else if fileexists(cam1 + sub + strzero(xy,5) + '.' + strzero(inttostr(ext),3)) then
          begin
            {if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext; }
          end
          else if fileexists(cam1 + sub + strzero(xy,6) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(xy,6) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(xy,6) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(xy,6) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(xy,6) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(xy,6) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(xy,6) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end;
          {else
          if fileexists(cam1 + sub + strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end}
          //else break;
        //end;
      //end;
      if (Contador>0) and (Mostra) then
      begin
        if inicio then
        begin
          inicializar;
          label10.caption  := pri_arq;
          ImgEdit1.Image   := pri_img_frente;
          imagem_generica  := ult_img_frente;
          ImgEdit1.Display;
          ImgEdit1.FitTo(0, True);

          label2.caption := strzero(PegaAte(pri_arq,'.','R'),4);
          label4.caption := strzero(inttostr(contador),4);

          StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
          StatusBar1.UpDate;
        end
        else
        begin
          inicializar;
          label10.caption  := ult_arq;
          ImgEdit1.Image   := ult_img_frente;
          imagem_generica  := ult_img_frente;
          ImgEdit1.Display;
          ImgEdit1.FitTo(0, True);

          label2.caption := strzero(inttostr(contador),4);
          label4.caption := strzero(inttostr(contador),4);

          StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
          StatusBar1.UpDate;
        end;
        //break;
      end
      else
      begin
        if (not SeqExt) then
        begin
          dec(ini);
          dec(fim);
          //if fim < strtoint(maskedit1.text) then break;
        end;
        //else break;
      end;
    if contador > 0 then Label5.Caption := IntToStr(contador) else Label5.Caption := '0';
  end;
end;

function contar( protocolo : string ; Mostra, Inicio, SeqExt : boolean ) : integer;
var
  achou : boolean;
  ult_arq, ult_img_frente, ult_img_verso : string;
  pri_arq, pri_img_frente, pri_img_verso : string;
  contador, xy, ext, ext2, ini, fim : integer;
begin
  result         := 1;
  contador       := 0;
  imagem_generica:= '';
  pri_arq        := '';
  pri_img_frente := '';
  pri_img_verso  := '';
  with F_DigDup2 do
  begin
    if protocolo <> '' then
    begin
      ini := strtoint(protocolo);
      fim := strtoint(protocolo);
    end
    else
    begin
      ini := strtoint(maskedit1.text);
      fim := strtoint(maskedit2.text);
    end;
    while true do
    begin
      for xy := ini to fim do
      begin
        ext  := 1;
        ext2 := 2;
        sub  := F_Menu.definesub(inttostr(xy));
        CriaDir(cam1 + sub);
        while true do
        begin
          if fileexists(cam1 + sub + strzero(inttostr(xy),3) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),3) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),3) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),3) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),3) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),3) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),3) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),4) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),5) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),6) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),6) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),6) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),6) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),6) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),6) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),6) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),7) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),8) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),9) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),10) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),11) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),12) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),13) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),14) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),15) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),16) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end
          else
          if fileexists(cam1 + sub + strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext),3)) then
          begin
            if pri_arq        = '' then pri_arq        := strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext),3);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext),3);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext2),3);
            ult_img_frente := cam1 + sub + strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext),3);
            ult_img_verso  := cam1 + sub + strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext2),3);
            ult_arq := strzero(inttostr(xy),17) + '.' + strzero(inttostr(ext),3);
            inc(contador); inc(ext,1); inc(ext2,2); result := ext;
          end 
          else break;
        end;
      end;
      if (Contador>0) and (Mostra) then
      begin
        if inicio then
        begin
          inicializar;
          label10.caption  := pri_arq;
          ImgEdit1.Image   := pri_img_frente;
          imagem_generica  := ult_img_frente;
          ImgEdit1.Display;
          ImgEdit1.FitTo(0, True);

          label2.caption := strzero(PegaAte(pri_arq,'.','R'),4);
          label4.caption := strzero(inttostr(contador),4);

          StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
          StatusBar1.UpDate;
        end
        else
        begin
          inicializar;
          label10.caption  := ult_arq;
          ImgEdit1.Image   := ult_img_frente;
          imagem_generica  := ult_img_frente;
          ImgEdit1.Display;
          ImgEdit1.FitTo(0, True);

          label2.caption := strzero(inttostr(contador),4);
          label4.caption := strzero(inttostr(contador),4);

          StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
          StatusBar1.UpDate;
        end;
        break;
      end
      else
      begin
        if (not SeqExt) then
        begin
          dec(ini);
          dec(fim);
          if fim < strtoint(maskedit1.text) then break;
        end
        else break;
      end;
    end;
    if contador > 0 then Label5.Caption := IntToStr(contador) else Label5.Caption := '0';
  end;
end;

Function AndarDoc(arq_img, sentido : String) : Boolean;
var
  xy, tam_ext : integer;
  mostra : boolean;
  arq, ext, ext1 : String;
Begin
  mostra := true;
  result := false;
  ext    := '1';
  ext1   := '2';
  with F_DigDup2 do
  begin
    tam_ext := length( PegaAte(label10.caption,'.','R') );
    arq     := copy(label10.caption,1,length(label10.caption)-(tam_ext+1));
    if sentido = '+' then
    begin
      mostra  := false;
      arq     := inttostr(strtoint(arq)+1);
      if strtoint(arq) > strtoint(maskedit2.text) then
      begin
        showmessage('Não existem próximas imagens neste intervalo');
        result := false
      end
      else
      begin
        sub    := F_Menu.definesub(arq); CriaDir(cam1 + sub);
        result := (contar(arq,true,true,false)>0);
      end;
    end
    else if sentido = '-' then
    begin
      mostra := false;
      arq    := inttostr(strtoint(arq)-1);
      if strtoint(arq) < strtoint(maskedit1.text) then
      begin
        showmessage('Não existem imagens anteriores neste intervalo');
        result := false
      end
      else
      begin
        sub    := f_menu.definesub(arq); CriaDir(cam1 + sub);
        result := (contar(arq,true,true,false)>0);
      end;
    end;

    if mostra then
    begin
      ext1 := inttostr(strtoint(ext)+1);
      ImgEdit1.Image := cam1 + sub + arq + '.' + ext;
      ImgEdit1.Display;
      StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
      StatusBar1.UpDate;
      Label10.caption := arq + '.' + ext;
      Label10.Hint    := label10.caption;
      Label10.update;
      if sentido = '+' then
      begin
        Label2.caption := strzero(inttostr(strtoint(label2.caption)+1),4);
        Label2.update;
      end
      else if sentido = '-' then
      begin
        Label2.caption := strzero(inttostr(strtoint(label2.caption)-1),4);
        Label2.update;
      end;
    end;
  end;
end;

Function Andar(arq_img, sentido : String) : Boolean;
var
  xy, tam_ext : integer;
  mostra : boolean;
  arq, ext, ext1 : String;
Begin
  mostra := true;
  result := false;
  with F_DigDup2 do
  begin
    tam_ext := length( PegaAte(label10.caption,'.','R') );
    arq     := copy(label10.caption,1,length(label10.caption)-(tam_ext+1));
    ext     := strzero(pegaate(label10.caption,'.','R'),3);
    sub     := f_menu.definesub(arq); CriaDir(cam1 + sub);
    if sentido = '+' then
    begin
      ext := strzero(inttostr(strtoint(ext)+1),3);
      if not fileexists(cam1 + sub + arq + '.' + ext) then
      begin
        mostra  := false;
        showmessage('Não existem próximas imagens neste intervalo');
        result := false;
      end
      else result := true;
    end
    else if sentido = '-' then
    begin
      ext := strzero(inttostr(strtoint(ext)-1),3);
      if not fileexists(cam1 + sub + arq + '.' + ext) then
      begin
        mostra := false;
        showmessage('Não existem imagens anteriores neste intervalo');
        result := false;
      end
      else result := true;
    end;

    if mostra then
    begin
      ext1 := strzero(inttostr(strtoint(ext)+1),3);
      ImgEdit1.Image := cam1 + sub + arq + '.' + ext;
      ImgEdit1.Display;
      StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
      StatusBar1.UpDate;
      Label10.caption := arq + '.' + ext;
      Label10.Hint    := label10.caption;
      Label10.update;
      if sentido = '+' then
      begin
        Label2.caption := strzero(inttostr(strtoint(label2.caption)+1),4);
        Label2.update;
      end
      else if sentido = '-' then
      begin
        Label2.caption := strzero(inttostr(strtoint(label2.caption)-1),4);
        Label2.update;
      end;
    end;
  end;
end;

Function Andar2(arq_img, sentido : String) : String;
var
  ext : String;
  tamanho: integer;
begin
  //ext := inttostr(strtoint(TirarTudo(copy(arq_img, length(arq_img) - 3, 6), '.', '-', '/') ) + 1)
  ext := copy(arq_img, pos('.', arq_img)+1, length(arq_img));
  tamanho := length(ext);
  if sentido = '+' then
    ext := IntToStr(StrToInt(ext)+1)
  else
    ext := IntToStr(StrToInt(ext)-1);

  //if StrToInt(copy(ext, length(ext) - 3, 6)) < 1000 Then
  if StrToInt(ext) < 1000 then
  begin
    {ext := copy(arq_img, length(arq_img) - 2, 3);
    if sentido = '+' then
      ext := '000' + inttostr(strtoint(ext) + 1)
    else
      ext := '000' + inttostr(strtoint(ext) - 1);
    ext := copy(ext, length(ext) - 2, 3); //Nesta rotina quando o valor é 0001000 ele pega os 3 primeiros zeros}
    ext := Strzero(ext, tamanho);
    arq_img := copy(arq_img, 1, pos('.', arq_img)) + ext;
    if not fileexists(arq_img) then
      result := ''
    else
      result := arq_img;
  end
  else
  begin
    ext := inttostr(strtoint(TirarTudo(copy(arq_img, length(arq_img) - 3, 6), '.', '-', '/') )); //Nesta rotina quando o valor é 0001000 ele pega os 3 primeiros zeros

    if sentido = '+' then
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
  end;
  if sentido = '+' then
  begin
    F_DigDup2.Label2.caption := strzero(inttostr(strtoint(F_DigDup2.label2.caption)+1),4);
    //Label2.update;
  end
  else if sentido = '-' then
  begin
    F_DigDup2.Label2.caption := strzero(inttostr(strtoint(F_DigDup2.label2.caption)-1),4);
    //Label2.update;
  end;
end;

procedure TF_DigDup2.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_DigDup2.BitBtn2Click(Sender: TObject);
begin
  Panel1.Enabled  := False;
  label2.caption  := '0000';
  label4.caption  := '0000';
  label10.caption := '';
  imgedit1.ClearDisplay;
  maskedit1.setfocus;
end;

procedure TF_DigDup2.BitBtn1Click(Sender: TObject);
var
  nova : Boolean;
  Arquivo: TSearchRec;
  nomeArquivo, pArquivo, primeiroNome, ultimoNome: String;
  contador, qtdZeros: integer;
begin
  img := '';
  iQuantZero:= 0;
  Label5.Caption := '';
  if (not validnumero(maskedit1.text)) then
  begin
    showmessage('Protocolo Inválido');
    maskedit1.setfocus;
    exit;
  end;
  if (not validnumero(maskedit2.text)) then
  begin
    showmessage('Protocolo Inválido');
    maskedit2.setfocus;
    exit;
  end;
  if (trim(maskedit1.text) = '') or (trim(maskedit2.text) = '') then
  Begin
    showmessage('Dados inválidos');
    maskedit1.setfocus;
    exit;
  end;

  if (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66') Then //Validação feita para Adenilton feira rtd
  begin
    DM.qryGenerico.Close;
    DM.qryGenerico.SQL.Clear;
    DM.qryGenerico.SQL.Add('select p_auxiliar from td_cert where registro = '+QuotedStr(MaskEdit2.Text)+'');
    DM.qryGenerico.Open;

    if DM.qryGenerico.FieldByName('p_auxiliar').AsString = '' then
    begin
      Application.MessageBox('Nº do Registro não localizado no banco!', 'Digitalização', MB_ICONEXCLAMATION);
      Abort;
    end;
  end;

  varios := false;
  if (strtoint(maskedit2.text) - strtoint(maskedit1.text) + 1) > 1 then varios := true else varios := false;
  Panel1.Enabled := False;
  nova := false;
  Label6.Caption := '';
  StatusBar1.SimpleText := 'Localizando...';
  StatusBar1.UpDate;
  arq := strzero(maskedit1.text, 6);
  arq_temp := 'c:\siscart\temp\td\td_temp.tif';
  sub := f_menu.DefineSub(maskedit1.text);

  if MaskEdit4.Text = 'B' then
  begin
    cam1 := F_Menu.Label17.Caption + 'livroB\';
    cam2 := F_Menu.Label17.Caption + 'livroB\'
  end
  Else
  if MaskEdit4.Text = 'C' then
  begin
    cam1 := F_Menu.Label17.Caption + 'livroC\';
    cam2 := F_Menu.Label17.Caption + 'livroC\'
  End
  else
  begin
    cam1 := F_Menu.Label17.Caption + 'livroF\';
    cam2 := F_Menu.Label17.Caption + 'livroF\'
  end;

  if right(cam1,1) <> '\' then cam1 := cam1 + '\';
  if label7.caption = 'certifi' then cam1 := cam1 + 'CERTIF\';
  if label7.caption = 'certifi' then cam2 := cam2 + '\CERTIF';

  //img  := cam1 + sub + arq + '.001';
  iQuantZero := 6;
  //pesquisaImagem(MaskEdit1.Text);

  memo1.Lines.clear;
  memo2.lines.clear;
  ComboBox1.Items.Clear;

  {if (not fileexists(img)) then
  begin
    arq := strzero(maskedit1.text, 1);
    img  := cam1 + sub + arq + '.001';
    ListarArquivos(cam1 + sub,false,arq);
    iQuantZero:= 1;
  end;  }

 { if Memo1.Lines.Count <=0 then
  begin
    arq := strzero(maskedit1.text, 2);
    img  := cam1 + sub + arq + '.001';
    ListarArquivos(cam1 + sub,false,arq);
    iQuantZero:= 2;
  end; }


  {if (Trim(MaskEdit1.Text) <> '') and (Trim(edtAverbacao.Text) <> '') then
  begin
    arq := strzero(MaskEdit1.Text, 6) +'_'+ edtAverbacao.Text;
    if fileexists(cam1 + sub + arq + '.001') then
      img := cam1 + sub + arq + '.001'
    else if FindFirst(cam1 + sub + '*'+edtAverbacao.Text+'*' , faAnyFile, Arquivo) = 0 then
    begin
      nomeArquivo := Arquivo.Name;
      arq := copy(nomeArquivo, 0, pos('.', nomeArquivo)-1);
      if nomeArquivo <> '' then
        img := pesquisaImagem(copy(nomeArquivo, 0, pos('.', nomeArquivo)-1))
    end;
  end
  else
  begin
    img := pesquisaImagem(MaskEdit1.Text);
    if (not fileexists(img)) then
    begin
      if FindFirst(cam1 + sub + '*'+MaskEdit1.Text+'*' , faAnyFile, Arquivo) = 0 then
      begin
        nomeArquivo := Arquivo.Name;
        if nomeArquivo <> '' then
        begin
          arq := copy(nomeArquivo, 0, pos('.', nomeArquivo)-1);
          img := cam1 + sub + nomeArquivo; //pesquisaImagem(copy(nomeArquivo, 0, pos('.', nomeArquivo)-1))
          if (not fileexists(img)) then
            img := '';
        end;
      end;    
    end;
  end;}

  contador := 0;
  primeiroNome := '.999';
  ultimoNome   := '.000';
  qtdZeros := 4;


  if edtAverbacao.Text <> '' then
  begin
    ListarArquivos(cam1 + sub,false,arq);
    Ordenar(memo1.lines);
    get_averba;
    ordenar(memo2.lines);
    Ordenar(ComboBox1.Items);
     combobox1.visible:=true;
   end
   else
   begin
     combobox1.visible:=false;
     ListarArquivos(cam1 + sub,false,arq);
     Ordenar(memo1.lines);
     get_averba;
     ordenar(memo2.lines);
   end;
  img  := cam1 + sub + memo2.Lines.Strings[0];
  contadorx:=0;
  {while qtdZeros <= 14 do
  begin
    if (MaskEdit1.Text <> '') and (edtAverbacao.Text <> '') then
      pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'_'+edtAverbacao.Text+ '*'
    else
      pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'*';

    if FindFirst(cam1 + sub + pArquivo, faAnyFile, Arquivo) = 0 then
    begin
      repeat
        nomeArquivo := Arquivo.Name;
        if copy(nomeArquivo, pos('.', nomeArquivo)+1, 3) < copy(primeiroNome, pos('.', primeiroNome)+1, 3) then
          primeiroNome := nomeArquivo;
        if copy(nomeArquivo, pos('.', nomeArquivo)+1, 3) > copy(ultimoNome, pos('.', ultimoNome)+1, 3) then
          ultimoNome := nomeArquivo;
        contador := contador + 1;
      until FindNext(Arquivo) <> 0;

      if primeiroNome <> '' then
      begin
        arq := copy(primeiroNome, 0, pos('.', primeiroNome)-1);
        img := cam1 + sub + primeiroNome;
        if (not fileexists(img)) then
          img := '';
      end;
      FindClose(Arquivo);
      break;
    end;
    inc(qtdZeros);
  end; }
  label10.Caption := copy(img, pos('.',img)+1, 3);
  Label2.Caption  := copy(img, pos('.',img)+1, 3);
  label4.Caption  := StrZero(IntToStr(verificadorx), 3);
  Panel1.Enabled := True;
  ImgEdit1.Page := 1;

  if (not fileexists(img)) then
  begin
    label10.caption      := '';
    CriaDir(cam1 + sub);
    label2.caption := '0000';
    Label4.Caption := '0000';
    Label6.Caption := 'NOVA';
    nova := True;

    edtAverbacao.text:='';
    label14.visible:=false;
    edtAverbacao.visible:=false;
    edtAverbacao.enabled := false;
  end
  else
  begin
    inicializar;
    label14.visible:=true;
    edtAverbacao.visible:=true;
    edtAverbacao.enabled := true;

    imagem_generica  := cam1 + sub + memo2.Lines.Strings[Memo2.Lines.Count];
    ImgEdit1.Image   := img;
    label2.caption   := '0000';
    label10.Caption  := label4.Caption;
    ImgEdit1.Display;
    ImgEdit1.FitTo(0, True);
     bitbtn1.enabled      := true;
    StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
    StatusBar1.UpDate;
  end;  

  {imagem_generica  := img;
  CriaDir(cam1 + sub);

  if (not fileexists(img)) then
  begin
    label10.caption      := '';
    CriaDir(cam1 + sub);
    label2.caption := '0000';
    Label4.Caption := '0000';
    Label6.Caption := 'NOVA';
    nova := True;
  end;

  Panel1.Enabled := True;
  ImgEdit1.Page := 1;
  if nova then
  begin
    bitbtn5.enabled := true;
    StatusBar1.SimpleText := 'Novo documento...';
    StatusBar1.UpDate;
    ImgEdit1.Image := '';
  end
  else
    //contar(maskedit2.text,true,false,false);}
    //contar2(arq,true,false,false);

  //edtAverbacao.enabled := true;
  if edtAverbacao.text <>'' then
  begin
    SpeedButton2.visible := false;
    Speedbutton1.visible := false;
    Label2.visible:=false;
    Label4.visible:=false;
    Label3.visible:=false;
  end
  else
  begin
    SpeedButton2.visible := true;
    Speedbutton1.visible := true;
    Speedbutton1.enabled := true;
    Speedbutton2.enabled := true;
    Label2.visible:=true;
    Label4.visible:=true;
    Label3.visible:=true;
  end;

  bitbtn4.enabled      := true;
  bitbtn5.enabled      := true;
  bitbtn6.enabled      := true;
  bitbtn12.enabled     := true;
  bitbtn8.enabled      := true;
  bitbtn7.enabled      := true;

  bitbtn2.enabled      := false;
  bitbtn3.enabled      := false;
  bitbtn9.enabled      := false;
end;

function TF_DigDup2.pesquisaImagem(numero: String): String;
var
  arq, img: String;
  i: integer;
begin
  img := '';
  arq := strzero(numero, 6);
  img := cam1 + sub + arq + '.001';

  if (not FileExists(img)) then
  begin
    for i:= 1 to 14 do
    begin
      arq := strzero(numero, i);
      img  := cam1 + sub + arq + '.001';
      if fileexists(img) then
        Exit;
    end;
  end;
  result := img;
end;

procedure TF_DigDup2.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.setfocus;
  if key = 27 then close;
end;

procedure TF_DigDup2.SpeedButton1Click(Sender: TObject);
var
  arq1, pxExtensao, nomeArquivo, pArquivo: String;
  Arquivo: TSearchRec;
  qtdZeros: integer;
begin
  if contadorx = verificadorx then
  begin
   showmessage('não tem mais pagina');
  end else
  begin
    if contadorx < 0 then contadorx :=0;

    inc(contadorx);
    Label2.caption:=strZero(inttostr(contadorx),3);
    Label2.update;
    if contadorx = verificadorx then exit;

    ImgEdit1.Image := cam1 + sub+ Memo2.lines.strings[contadorx];
    ImgEdit1.Display;
    label15.caption:= Memo2.lines.strings[contadorx];
    label15.Update;
  end;


  {pxExtensao := StrZero(IntToStr(StrToInt(copy(ImgEdit1.Image, pos('.', ImgEdit1.Image)+1, 3))+1), 3);
  qtdZeros := 4;
  while qtdZeros <= 14 do
  begin
    if (MaskEdit1.Text <> '') and (edtAverbacao.Text <> '') then
    begin
      pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'_'+edtAverbacao.Text+ '*';
      //if CheckBox1.Checked then
        //pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'A_'+edtAverbacao.Text+ '*';
    end
    else
    begin
      pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'*';
      //if CheckBox1.Checked then
        //pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'A*';
    end;

    if FindFirst(cam1 + sub + pArquivo, faAnyFile, Arquivo) = 0 then
    begin
      img := '';
      repeat
        nomeArquivo := Arquivo.Name;
        if copy(nomeArquivo, pos('.', nomeArquivo)+1, 3) = pxExtensao then
        begin
          arq := copy(nomeArquivo, 0, pos('.', nomeArquivo)-1);
          img := cam1 + sub + nomeArquivo;
          if (not fileexists(img)) then
            img := ''
          else
          begin
            ImgEdit1.Image := img;
            ImgEdit1.Display;
            Label2.caption := pxExtensao;
          end;
          Exit;
        end;
      until FindNext(Arquivo) <> 0;
    end;
    inc(qtdZeros);
    FindClose(Arquivo);
  end;
  if img = '' then
  begin
    ShowMessage('Não existe próxima página.');
    Exit;
  end;    }
  {if strtoint(label4.caption) = 0 then exit;
    andar(ImgEdit1.Image, '+');}
end;

procedure TF_DigDup2.SpeedButton2Click(Sender: TObject);
var
  pxExtensao, nomeArquivo, pArquivo: String;
  Arquivo: TSearchRec;
  qtdZeros: integer;
begin
  if contadorx < 0 then
  begin
    showmessage('não tem mais pagina');
  end else
  begin
    contadorx:= contadorx -1;
    if contadorx =  verificadorx then contadorx := contadorx -1;
    if contadorx < 0 then  contadorx:=0;

    ImgEdit1.Image := cam1 + sub+ Memo2.lines.strings[contadorx];
    ImgEdit1.Display;
    Label2.caption:=strZero(inttostr(contadorx),3);
    label2.Update;
    label15.caption:= Memo2.lines.strings[contadorx];
    label15.Update;
 end;

 { pxExtensao := StrZero(IntToStr(StrToInt(copy(ImgEdit1.Image, pos('.', ImgEdit1.Image)+1, 3))-1), 3);
  qtdZeros := 4;
  while qtdZeros <= 14 do
  begin
    if (MaskEdit1.Text <> '') and (edtAverbacao.Text <> '') then
    begin
      pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'_'+edtAverbacao.Text+ '*';
      //if CheckBox1.Checked then
        //pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'A_'+edtAverbacao.Text+ '*';
    end
    else
    begin
      pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'*';
      //if CheckBox1.Checked then
        //pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'A*';
    end;

    if FindFirst(cam1 + sub + pArquivo, faAnyFile, Arquivo) = 0 then
    begin
      img := '';
      repeat
        nomeArquivo := Arquivo.Name;
        if copy(nomeArquivo, pos('.', nomeArquivo)+1, 3) = pxExtensao then
        begin
          arq := copy(nomeArquivo, 0, pos('.', nomeArquivo)-1);
          img := cam1 + sub + nomeArquivo;
          if (not fileexists(img)) then
            img := ''
          else
          begin
            ImgEdit1.Image := img;
            ImgEdit1.Display;
            Label2.caption := pxExtensao;
          end;
          Exit;
        end;
      until FindNext(Arquivo) <> 0;
    end;
    inc(qtdZeros);
    FindClose(Arquivo);
  end;
  if img = '' then
  begin
    ShowMessage('Não existe página anterior.');
    Exit;
  end;}
  {if strtoint(label4.caption) = 0 then exit;
    andar(ImgEdit1.Image, '-');}
end;                            

procedure TF_DigDup2.BitBtn5Click(Sender: TObject);
var
  ult_imagem, extt, novo1, novo, ext, ext1, extAux, parametros, origem, destino, dir_img,averba : String;
  continua, ignora, outra, semqtde, canc_dig, nofinal, primeira, primeira_fim, parada : boolean;
  retorno, xy, zz, ini, fim, timeout, vezes, x, qtd_img, ver_qtd : Integer;
  qde_prot : Double;
  prot_atual: String;
  parar : Boolean;
  flavio, qtdpag : integer;
  ArquivoTemp, caminhoBMP: String;
  teste:string;
  teste2:integer;
begin
 if (speedbutton3.visible = true) and (speedbutton4.visible = true) then
  begin
    if (not Permissao('acesso073')) then
    begin
      MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;

  if memo2.lines.Count >0 then
  begin
    ImgEdit1.Image := cam1 + sub+ memo2.lines.Strings[verificadorx-1];
    ImgEdit1.Display;
    Label2.caption:=strZero(inttostr(verificadorx),3);
    teste:=memo2.lines.Strings[verificadorx-1];
    Label2.update;
    label15.caption:= Memo2.lines.strings[verificadorx];
    label15.Update;
  end;
  contadorx:= verificadorx;
  nofinal := True;
  primeira := False;
  primeira_fim := False;
  if (StrZero(Label5.Caption,3) <> Label2.Caption) and (Trim(Label5.Caption) <> '') then
  begin
    if messagedlg('Deseja Iniciar Inclusão após esta Imagem ?', mtconfirmation, [mbyes, mbno],0)= Mryes then
    begin
      nofinal := False;
    end
    else
    begin
      if Label2.Caption = '0001' then
      begin
        if messagedlg('Deseja Incluir como sendo a primeira Imagem ?', mtconfirmation, [mbyes, mbno],0)= Mryes then
        begin
          nofinal  := False;
          primeira := True;
          Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'Diante da pergunta: Deseja Incluir como sendo a primeira Imagem ? o usuario optou SIM: '+Label2.Caption+' ', retornaProtocolo(MaskEdit1.Text));
        end
        else
        begin
          nofinal      := True;
          primeira_fim := True;
        end;
      end
      else
        nofinal := True;
    end;
  end;
  if primeira then
    Label13.Caption := '001'
  else
  begin
    if memo2.lines.Count >0 then
    begin
      Label13.Caption := inttostr(StrToInt(Label2.Caption)+1);
      teste2:= 1+strtoint( copy(teste, Pos ('.', teste) + 1, Length (teste)));
      Label13.caption := strzero(inttostr(teste2), 3);
    end else
    begin
      Label13.Caption := inttostr(StrToInt(Label2.Caption)+1);
      Label13.caption := strzero(Label13.Caption, 3);
    end;
  end;

  vezes      := 0;
  timeout    := 0;
  qde_prot   := strtofloat(maskedit2.text);

  prot_atual := strzero(maskedit1.text, iQuantZero);
  if not parada then
    prot_scan0 := strzero(prot_atual, iQuantZero);

  outra      := false;
  continua   := true;
  semqtde    := false;
  ult_imagem := imgedit1.image;

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;
  dir_img  := Dm.Configur.FieldByName('imagens').asString;
  Dm.Configur.Close;

  while ((continua) and (strtoint(prot_atual) <= qde_prot)) do
  begin
    inicializar;
    if (not validnumero(maskedit3.text)) then maskedit3.text := '0';
    if (not ((maskedit3.text = '') or (maskedit3.text = '0'))) then
    begin
      continua       := false;
    end
    else
    begin
      semqtde        := true;
      varios         := true;
    end;
    
    try
      if Checkbox2.Checked then F_DigDup2.TwainPRO1.SelectSource;
    except
      sleep(100);
      exit;
    end;

    arq      := Strzero(prot_atual, iQuantZero);

    if (nofinal) and (Label6.Caption = 'NOVA') then
      ext      := inttostr(contar(prot_atual,false,false,true))
    else
      ext      := Label13.Caption;

    if (primeira_fim) and (nofinal) then
      ext := inttostr(contar(prot_atual,false,false,true));


    sub      := f_menu.definesub(arq);
    CriaDir(cam1 + sub);
    novo     := cam1 + sub + arq + '.' + ext;
    ext1     := inttostr(contar(prot_atual,false,false,true) +1);
    novo1    := cam1 + sub + arq + '.' + ext1;
    ImgEdit1.Image := novo;
    operacao := 'I';
    ignora   := false;

    if contx <> 0 then
    begin
       if retorno = 7 then
       begin
         edtAverbacao.Text:= averba;
         if strtoint(ext) < strtoint(label4.caption)  then   ext := inttostr(strtoint(label4.caption) +1);
       end else
       begin
         if strtoint(ext) <= contx then  ext := inttostr(contx+1);
       end;
    end;

     contx:=strtoint(ext);

    StatusBar1.SimpleText := 'Digitalizando Nova Imagem em ' + novo;
    StatusBar1.UpDate;
    Label2.caption := ext;
    Label4.caption := ext;
    StatusBar1.SimpleText := 'Imagem digitalizada em ' + novo;
    StatusBar1.UpDate;

    { Iniciando digitalização multipage }
    prot_scan := strzero(maskedit1.text, iQuantZero);
    {if edtAverbacao.Text <> '' then
      prot_scan :=  prot_scan +'_'+edtAverbacao.Text;}

    F_DigDup2.Panel3.Visible := True;

    F_DigDup2.Panel3.Refresh;
    F_DigDup2.Panel3.repaint;




    F_DigDup2.TwainPRO1.StartSession;
    F_DigDup2.TwainPRO1.CloseSession;

    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'Imagem digitalizada em: '+novo+' ', retornaProtocolo(MaskEdit1.Text));

    dir_img := cam2;

    qtd_img := 0;
    ver_qtd := 0;
    if semqtde then
    begin
      qtd_img := imgedit1.PageCount;
    end
    else
    begin
      qtd_img := strtoint(maskedit3.text);
      ver_qtd := (Abs(strtoint(maskedit1.text) - strtoint(maskedit2.text)) + 1 ) * strtoint(maskedit3.text);
     end;

    canc_dig := False;
    parada   := False;
    if (imgedit1.PageCount <> ver_qtd) and (ver_qtd <> 0) then
    begin
      parar := False;
      while (imgedit1.PageCount <> ver_qtd) do
      begin
        if parar then
        begin
          if messagedlg('Cancelar a Digitalização ?', mtconfirmation, [mbyes, mbno],0) = MrYes then
          begin
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Usuário cancelou a digitalização do arquivo: '+novo+' cancelada' ,retornaProtocolo(MaskEdit1.Text));
             edtAverbacao.Text:='';
             BitBtn12Click(sender);
             sleep(100);
             BitBtn1Click(sender);
             exit;
            //Break;
          end;
        end;
        ImgEdit1.Image := ImgScan1.Image;
        Imgscan1.PageOption := 2;
        flavio := Imgscan1.StartScan;
        if flavio <> 0 then parar := True;
      end;
      parada := True;
    end;

    if not canc_dig then
    begin
      if nofinal = False then
      begin
        AbreLacuna(cam1+sub+arq, ext, Label5.Caption, qtd_img);
      end;

      ObjRename         := CoclsRenameTIFF.Create;
      aArquivoConverter := ImgScan1.Image;
      aArquivoConverter := 'c:\siscart\temp_pro.tif';
      aCaminhoDestino   := dir_img + sub;

      aDocumentoInicial := Strzero(arq, iQuantZero);

      if semqtde then
        aDocumentoFinal := Strzero(arq, iQuantZero)
      else
        aDocumentoFinal := Strzero(arq, iQuantZero);

      aPaginaInicial:= StrToInt(ext);
      aPaginas:= qtd_img;
      aPaginas := Xpress1.NumPages(Xpress1.filename);

      with ObjRename do
      begin
        ObjRename.ArquivoConverter      := aArquivoConverter;
        ObjRename.CaminhoDestinoArquivo := aCaminhoDestino;
        ObjRename.DocumentoInicial      := aDocumentoInicial;
        ObjRename.DocumentoFinal        := aDocumentoFinal;




        if CheckBox30.Checked Then
        Begin
          caminhoBMP := Dm.Dir_CamImagensNotificBMP;
          ArquivoTemp:= Dm.Dir_CamImagensNotificBMP + Strzero(aDocumentoFinal, 14) + '_' +strzero(ext, 3)+'.bmp';
          if not DirectoryExists(caminhoBMP) then
            ForceDirectories(caminhoBMP);

          CopyFile('C:\siscart\temp\td\temp.bmp', Pchar(ArquivoTemp), True);
        End;

        ObjRename.PaginaINI:= aPaginaInicial;
        ObjRename.QtdePaginas:= aPaginas;
        ObjRename.ConverteImagem;
      end;
    end;

    //if (FileExists(cam1 + sub + MaskEdit2.Text + '.' + Strzero(ext, 3))) Then
      //RenameFile(cam1+sub+MaskEdit2.Text+'.'+Strzero(ext), cam1+sub+arq+'.'+ Strzero(ext,3));

    if (FileExists(cam1+sub+Strzero(MaskEdit1.Text, iQuantZero)+'.'+ Strzero(ext, 3))) then
      if trim(edtAverbacao.Text) <> '' then
        RenameFile(cam1+sub+Strzero(MaskEdit1.Text, iQuantZero)+'.'+ Strzero(ext, 3), cam1+sub+Strzero(MaskEdit1.Text, iQuantZero) +'_'+ edtAverbacao.Text +'.'+ Strzero(ext, 3));

    extAux := IntToStr(StrToInt(ext)+1);

   if  edtAverbacao.text <> '' then      // 16-10-2020 verificar O.S 1046
   begin
     while FileExists(cam1+sub+Strzero(MaskEdit1.Text, iQuantZero)+'.'+ Strzero(extAux, 3)) do
     begin
       if trim(edtAverbacao.Text) <> '' then
         RenameFile(cam1+sub+Strzero(MaskEdit1.Text, iQuantZero)+'.'+ Strzero(extAux, 3), cam1+sub+Strzero(MaskEdit1.Text, iQuantZero) +'_'+ edtAverbacao.Text +'.'+ Strzero(extAux, 3));

         extAux := IntToStr(StrToInt(extAux)+1);
      end;
    end;

    if semqtde then           
    begin
      KeyBd_Event(39,0,0,0);
      retorno := Application.MessageBox(pchar('Deseja finalizar documento ' + arq + ' ?'),'ATENÇÃO', mb_yesnocancel + mb_iconwarning + mb_defbutton1);
      if retorno = 7 then
      begin
        outra := true;
        if edtAverbacao.Text <>'' then
        begin
         averba :=edtAverbacao.Text;
         edtAverbacao.Text:='';
        end else
        begin
         averba:='';
        end;
        BitBtn1Click(sender);
        if (nofinal = False) or (Label6.Caption = '') then
        begin
          ext := IntToStr(StrToInt(ext) + qtd_img);
          Label13.caption := ext;
        end
        else
          if not ignora then
            ext := ext1;
      end;
      if retorno = 6 then
      begin
        outra := false;
        label14.visible:=true;
        edtAverbacao.enabled := true;
        F_DigDup2.BitBtn7.click;
        F_DigDup2.BitBtn2.click;
        if (nofinal = False) or (Label6.Caption = '') then continua := False;
      end;
      if retorno = 2 then
      begin
        //if not atualizalog(datetostr(date),timetostr(time),usuario_,'LOTE MANUAL CANCELADO',paginas_,strtofloat(inicial_),strtofloat(final_)) then showmessage('Problemas para atualizar Log de Eventos');
        continua := false;
      end;
    end;

    if (varios) and (not outra) then
    begin
      prot_atual := Inttostr(strtoint(prot_atual) + 1);
      prot_scan0 := (prot_atual);
      imgedit1.image := '';
      imgedit1.ClearDisplay;
    end;
  end;
  ImgScan1.CloseScanner;
  F_DigDup2.Panel3.Visible := False;
  Maskedit3.Text := '';
  bitbtn7.click;
  bitbtn1.click;
  operacao := '';
   {if retorno =6 then
   begin
     edtAverbacao.Text:='';
     BitBtn7Click(sender);
     sleep(100);
     BitBtn1Click(sender);
     exit;
   end;}
end;

procedure TF_DigDup2.BitBtn4Click(Sender: TObject);
var
  extt, novo, novo1, ext1 : string;
  ignora : boolean;
  x : Integer;
begin
  showmessage('Em teste');
  exit;
  //
  Application.CreateForm(TF_Senha, F_Senha);
  F_Senha.ShowModal;
  if (not F_Senha.Senha_Ok) then
    begin
      F_Senha.Destroy;
      F_Senha := nil;
      Exit;
    end;
  F_Senha.Destroy;
  F_Senha := nil;
  if MessageDlg('Tem certeza que deseja substituir a imagem ' + imgedit1.image + ' ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    operacao := 'S';
    novo := imgedit1.image;
    ext1 := copy(novo, length(novo) - 2, 3);
    ext1 := '000' + inttostr(strtoint(ext1) + 1);
    ext1 := copy(ext1, length(ext1) - 2, 3);
    novo1 := copy(novo, 1, length(novo) - 3) + ext1;
    StatusBar1.SimpleText := 'Substituindo a imagem ' + novo;
    StatusBar1.UpDate;
    DeleteFile(novo);
    if fileexists(novo1) then DeleteFile(novo1);
    if fileexists(novo) then
    Begin
      StatusBar1.SimpleText := 'Arquivo não pode ser substituido ' + novo;
      StatusBar1.UpDate;
      showmessage('Problemas para substituir a imagem ' + novo + ' (1)');
      exit;
    end;
    inicializar;
    if Messagedlg('Ignorar a última imagem digitalizada ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then ignora := true else ignora := false;
    { Iniciando digitalização multipage }
    ImgScan1.Page := 1;
    ImgScan1.PageCount := 0;
    Imgscan1.StartScan;
    { Inciando a distribuição das imagens em dois ImgEdit }
    ImgEdit1.Image := 'c:\siscart\temp\td\temp.tif';
    ImgEdit1.Display;
    x := 1;
    while x <= imgedit1.PageCount do
    Begin
      { Frente }
      ImgEdit1.Page := x;
      ImgEdit1.Display;
      ImgEdit1.Fitto(2, true);
      ImgEdit1.ClipboardCopy(0,0,2000,2000);
      atual_logs(maskedit1.text, tipolog, label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'SUBSTITUICAO');
      { Verso }
      x := x + 1;
      if not ignora then
      begin
        ImgEdit1.Page := x;
        ImgEdit1.Display;
        ImgEdit1.Fitto(2, true);
        ImgEdit1.ClipboardCopy(0,0,2000,2000);
        label4.caption := '0000' + inttostr(strtoint(label4.caption) + 1);
        label4.caption := copy(label4.caption, length(label4.caption) - 2, 4);
        atual_logs(maskedit1.text, tipolog, label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'SUBSTITUICAO');
      end;
      { Próximo }
      x := x + 1;
      extt := '000' + inttostr(strtoint(copy(novo, length(novo) - 2,3)) + 2);
      extt := copy(extt, length(extt) - 2,3);
      novo := copy(novo, 1, length(novo) - 3) + extt;
      extt := '000' + inttostr(strtoint(copy(novo1, length(novo1) - 2,3)) + 2);
      extt := copy(extt, length(extt) - 2,3);
      novo1 := copy(novo1, 1, length(novo1) - 3) + extt;
    end;
    if not fileexists(novo) then
    begin
      StatusBar1.SimpleText := 'Imagem não substituída em ' + novo;
      StatusBar1.UpDate;
      showmessage('Problemas para re-digitalizar a imagem '+ novo);
    end
    else
    begin
      ImgEdit1.Page := 1;
      ImgEdit1.Image := novo;
      ImgEdit1.Display;
      atual_logs(maskedit1.text, tipolog, label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'SUBSTITUICAO');
      StatusBar1.SimpleText := 'Imagem substituída em ' + novo;
      StatusBar1.UpDate;
    end;
    if not ignora then
    begin
      if not fileexists(novo1) then
      begin
        StatusBar1.SimpleText := 'Imagem não substituída em ' + novo1;
        StatusBar1.UpDate;
        showmessage('Problemas para re-digitalizar a imagem '+ novo1);
      end
      else
      begin
        ImgEdit1.Page := 1;
        ImgEdit1.Image := novo1;
        ImgEdit1.Display;
        atual_logs(maskedit1.text, tipolog, label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'SUBSTITUICAO');
        StatusBar1.SimpleText := 'Imagem substituída em ' + novo1;
        StatusBar1.UpDate;
      end;
    end;
    if ignora then
    begin
      ImgEdit1.Page := 1;
      ImgEdit1.Image := novo;
      ImgEdit1.Display;
      Label2.caption := '0001';
    end
    else
    begin
      ImgEdit1.Page := 1;
      ImgEdit1.Image := novo1;
      ImgEdit1.Display;
      Label2.caption := Label4.caption;
    end;
    contar(maskedit2.text,true,true,false);
  end;
  operacao := ' ';
end;

procedure TF_DigDup2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Panel1.Enabled := False;
  label2.caption := '0000';
  label4.caption := '0000';
  maskedit1.text := '';
  imgedit1.ClearDisplay;
end;

procedure TF_DigDup2.Zoom1Click(Sender: TObject);
begin
  if ImgEdit1.Image <> '' then
  begin
    Application.CreateForm(TF_Zoom, F_Zoom);
    F_Zoom.ImgEdit1.Image := ImgEdit1.Image;
    F_Zoom.showmodal;
    F_Zoom.Destroy;
    F_Zoom := NIL;
  end;
end;

procedure TF_DigDup2.BitBtn6Click(Sender: TObject);
var
  ext, sub : string;
begin
  if strtoint(label4.caption) = 0 then
  begin
    showmessage('Não existem imagens para excluir');
    exit;
  end;
  arq := strzero(maskedit1.text, 6);   //PegaAte(label10.caption,'.','L');
  ext := PegaAte(label10.caption,'.','R');
  sub := f_menu.DefineSub(arq); CriaDir(cam1 + sub);

  if application.messagebox(pchar('Confirma exclusão ?'),'ATENÇÃO', mb_yesno + mb_iconwarning + mb_defbutton1) = mrNo then
  begin
    exit;
  end;
  if (not Permissao('acesso074')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if edtaverbacao.text <> '' then
  begin
    Deletefile(cam1+sub+ComboBox1.text);
    //ListarArquivos(cam1+sub,false);
    get_averba;
  end
  else
  begin
    Deletefile(ImgEdit1.Image);
    BitBtn1Click(sender);

  end;
  atual_logs(maskedit1.text, tipolog, label2.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'EXCLUSAO');

  if ext <> Label5.Caption then
  begin
    Renomeia(cam1+sub+arq, ext, Label5.Caption);
  end;

  contar(arq,true,false,false);
end;

procedure TF_DigDup2.BitBtn7Click(Sender: TObject);
begin
  label2.caption := '0000';
  label4.caption := '0000';
  contx:=0;
  label10.caption := '';
  imgedit1.ClearDisplay;
  Panel1.enabled := false;
  Speedbutton1.enabled := false;
  Speedbutton2.enabled := false;
  Speedbutton3.visible := false;
  Speedbutton4.visible := false;
  bitbtn4.enabled := false;
  bitbtn5.enabled := false;
  bitbtn6.enabled := false;
  bitbtn12.enabled := false;  
  bitbtn8.enabled := false;
  bitbtn7.enabled := false;
  //Panel2.enabled := true;
  bitbtn1.enabled := true;
  bitbtn2.enabled := true;
  bitbtn3.enabled := true;
  bitbtn9.enabled := true;
  edtAverbacao.text:='';
  combobox1.Visible:=false;
  memo1.lines.clear;
  memo2.lines.clear;
  combobox1.Items.clear;
  label14.visible:=false;
  edtAverbacao.visible:=false;
  bitbtn2.setfocus;
end;

procedure TF_DigDup2.FormActivate(Sender: TObject);
begin
  if label11.caption = 'active' then
  begin
    label11.caption := '';
    bitbtn2.click;
    if label7.caption = 'titulos' then
    begin
      label1.caption := 'Protocolos de';
      tipolog := '1';
    end
    else if label7.caption = 'certifi' then
         begin
           label1.caption := 'Certificados de';
           tipolog := '2';
         end;
    maskedit1.setfocus;
  end;
end;

procedure TF_DigDup2.ImgEdit1DblClick(Sender: TObject);
begin
  Application.CreateForm(TF_Zoom, F_Zoom);
  F_Zoom.Label2.Caption := F_DigDup2.Label2.Caption;
  F_Zoom.Label4.Caption := F_DigDup2.Label4.Caption;
  F_zoom.imgedit1.Image := imgedit1.image;
  F_zoom.imgedit1.Zoom  := 100;
  F_zoom.Label1.Caption := 'SIMPLEX';
  F_Zoom.showmodal;
  F_Zoom.destroy;
end;

procedure TF_DigDup2.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit4.setfocus;
  if key = 27 then close;
end;

procedure TF_DigDup2.MaskEdit1Exit(Sender: TObject);
begin
  maskedit2.text := maskedit1.text;
end;

procedure TF_DigDup2.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.setfocus;
  if key = 27 then close;
end;



procedure TF_DigDup2.SpeedButton4Click(Sender: TObject);
begin
  if strtoint(label4.caption) = 0 then exit;
    andardoc(ImgEdit1.Image, '+');
end;

procedure TF_DigDup2.SpeedButton3Click(Sender: TObject);
begin
  if strtoint(label4.caption) = 0 then exit;
    andardoc(ImgEdit1.Image, '-');
end;

procedure TF_DigDup2.Label1Click(Sender: TObject);
begin
  if (not bitbtn5.enabled) then
  begin
    if label7.caption = 'titulos' then
    begin
      label1.caption := 'Certificados de';
      label7.caption := 'certifi';
    end
    else if label7.caption = 'certifi' then
    begin
      label1.caption := 'Protocolos de';
      label7.caption := 'titulos';
    end;
  end;
end;

procedure TF_DigDup2.FormCreate(Sender: TObject);
begin
  CriaDir('c:\siscart\temp\td\imagens\');
  F_DigDup2.TwainPRO1.hParentWnd := F_DigDup2.Handle;
  contx:=0;
end;


procedure TF_DigDup2.BitBtn8Click(Sender: TObject);
var
  ult_imagem, extt, novo1, novo, ext, ext1, parametros, origem, destino, dir_img : String;
  continua, ignora, outra, semqtde, canc_dig, nofinal : boolean;
  xy, zz, ini, fim, timeout, vezes, x, qtd_img, ver_qtd, qtdpag : Integer;
  qde_prot : Double;
  prot_atual: String;
  ArquivoTemp, caminhoBMP: String;
begin
  if strtoint(label4.caption) = 0 then
  begin
    showmessage('Não existem imagens para alterar');
    exit;
  end;
  if (speedbutton3.visible = true) and (speedbutton4.visible = true) then
  begin
    if (not Permissao('acesso073')) then
    begin
      MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
      Exit;
    end;

  end;

  vezes      := 0;
  timeout    := 0;
  qde_prot   := strtofloat(maskedit2.text);
  prot_atual := strzero(maskedit1.text, iQuantZero);

  outra      := false;
  continua   := true;
  semqtde    := false;
  ult_imagem := imgedit1.image;

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;
  dir_img  := Dm.Configur.FieldByName('imagens').asString;
  Dm.Configur.Close;

  while ((continua) and (strtoint(prot_atual) <= qde_prot)) do
  begin
    inicializar;
    if (not validnumero(maskedit3.text)) then maskedit3.text := '0';
    if (not ((maskedit3.text = '') or (maskedit3.text = '0'))) then
    begin
      continua       := false;
    end
    else
    begin
      semqtde        := true;
      varios         := true;
    end;

    arq      := strzero(prot_atual, iQuantZero);
    ext      := strzero(inttostr(StrToInt(Label2.Caption)),3);
    sub      := f_menu.definesub(arq);
    CriaDir(cam1 + sub);
    novo     := cam1 + sub + arq + '.' + ext;
    ext1     := strzero(inttostr(contar(prot_atual,false,false,true) +1),3);

    novo1    := cam1 + sub + arq + '.' + ext1;
    ImgEdit1.Image := novo;
    operacao := 'I';
    ignora   := false;

    StatusBar1.SimpleText := 'Alterando Imagem em ' + novo;
    StatusBar1.UpDate;
    Label2.caption := ext;
    Label4.caption := ext;
    StatusBar1.SimpleText := 'Imagem digitalizada em ' + novo;
    StatusBar1.UpDate;

    TwainPRO1.StartSession;
    TwainPRO1.CloseSession;

    { Iniciando digitalização multipage }
    dir_img := cam2;
    qtd_img := 0;
    ver_qtd := 0;
    if semqtde then
    begin
      qtd_img := imgedit1.PageCount;
    end
    else
    begin
      qtd_img := strtoint(maskedit3.text);
      ver_qtd := (Abs(strtoint(maskedit1.text) - strtoint(maskedit2.text)) + 1 ) * strtoint(maskedit3.text);
    end;

    canc_dig := False;

    if not canc_dig then
    begin
      DeleteFile(cam1+sub+arq+'.'+ext);

      ObjRename:= CoclsRenameTIFF.Create;

      aArquivoConverter:= 'c:\siscart\temp_pro.tif';
      aCaminhoDestino:= dir_img + sub;
      aDocumentoInicial:= arq;
      if semqtde then
        aDocumentoFinal:= arq
      else
        aDocumentoFinal:= maskedit2.text;

      aPaginaInicial:= StrToInt(ext);
      aPaginas:= qtd_img;
      aPaginas := Xpress1.NumPages(Xpress1.filename);
      //Xpress1.NumPages(Xpress1.filename, aPaginas);

      with ObjRename do
      begin
        ObjRename.ArquivoConverter:= aArquivoConverter;
        ObjRename.CaminhoDestinoArquivo:= aCaminhoDestino;
        ObjRename.DocumentoInicial:= aDocumentoInicial;
        ObjRename.DocumentoFinal:= aDocumentoFinal;
        ObjRename.PaginaINI:= aPaginaInicial;

        if CheckBox30.Checked Then
        Begin
          caminhoBMP := Dm.Dir_CamImagensNotificBMP;
          ArquivoTemp:= Dm.Dir_CamImagensNotificBMP + Strzero(aDocumentoFinal, 14) + '_' +strzero(ext, 3)+'.bmp';
          if not DirectoryExists(caminhoBMP) then
            ForceDirectories(caminhoBMP);

          CopyFile('C:\siscart\temp\td\temp.bmp', Pchar(ArquivoTemp), True);
        End;


        ObjRename.QtdePaginas:= aPaginas;
        ObjRename.ConverteImagem;            
      end;
    end;

    if (FileExists(cam1 + sub + MaskEdit2.Text + '.' + ext)) Then
    Begin
      RenameFile(cam1+sub+MaskEdit2.Text+'.'+ext, cam1+sub+arq+'.'+ ext);
    End;     

    if semqtde then
    begin
      KeyBd_Event(39,0,0,0);
      if False then //application.messagebox(pchar('Deseja finalizar documento ' + arq + ' ?'),'ATENÇÃO', mb_yesno + mb_iconwarning + mb_defbutton1) = mrNo then
      begin
        outra := true;
        if not ignora then ext := ext1;
      end
      else
      begin
        outra := false;
        continua := False;
        F_DigDup2.BitBtn7.click;
        F_DigDup2.BitBtn2.click;
      end;
    end;

  end;
  bitbtn7.click;
  bitbtn1.click;
  operacao := '';
end;

procedure TF_DigDup2.BitBtn9Click(Sender: TObject);
begin
  if (not Permissao('acesso074')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  Application.CreateForm(TF_ExcLote, F_ExcLote);
  F_ExcLote.ShowModal;
  F_ExcLote.Destroy;
  F_ExcLote := nil;
end;

procedure TF_DigDup2.SpeedButton5Click(Sender: TObject);
begin
  Imgscan1.OpenScanner;
  Imgscan1.ShowScannerSetup;
  Imgscan1.CloseScanner;
end;

procedure TF_DigDup2.ImgScan1PageDone(Sender: TObject;
  PageNumber: Integer);
begin
  prot_scan := inttostr(strtoint(prot_scan) + 1);
  if StrToInt(prot_scan) <= strtoint(maskedit2.text) then
  begin
{    if (Trim(maskedit3.text) = '') or (maskedit3.text = '0') then
      F_DigDup2.Panel3.Caption := IntToStr(prot_scan0)
    else
      F_DigDup2.Panel3.Caption := IntToStr(prot_scan);
    F_DigDup2.Panel3.Refresh;
    F_DigDup2.Panel3.repaint;}
  end;
end;

procedure TF_DigDup2.ImgScan1ScanUIDone(Sender: TObject);
begin
//  showmessage('UI Done ' + IntToStr(imgscan1.Page));
end;

procedure TF_DigDup2.ImgScan1ScanDone(Sender: TObject);
begin
//  showmessage('Scan Done ' + IntToStr(imgscan1.Page));
end;

procedure TF_DigDup2.ImgScan1FileNameRequest(Sender: TObject;
  PageNumber: Integer);
begin
//  showmessage('FileNameRequest ' + IntToStr(imgscan1.Page));
end;

procedure TF_DigDup2.ImgScan1ScanStarted(Sender: TObject);
begin
//  showmessage('ScanStarted ' + IntToStr(imgscan1.Page));
//  showmessage(IntToStr(ImgScan1.ScanTo));
end;

procedure TF_DigDup2.SpeedButton6Click(Sender: TObject);
begin
  Imgscan1.OpenScanner;
  Imgscan1.ShowScannerSetup;
  Imgscan1.CloseScanner;
end;

procedure TF_DigDup2.TwainPRO1PostScan(Sender: TObject;
  var Cancel: WordBool);
begin
  TwainPRO1.SaveTIFFCompression := TIFF_CCITTFAX3;
  TwainPRO1.SaveMultiPage := true;

  if CheckBox30.Checked Then
    TwainPRO1.SaveFile('c:\siscart\temp\td\temp.bmp');

  TwainPRO1.SaveFile('c:\siscart\temp_pro.tif');
  Xpress1.FileName := 'c:\siscart\temp_pro.tif';

  if TwainPro1.PendingXfers = 0 then Cancel := true;
end;

procedure TF_DigDup2.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if edtAverbacao.Enabled then
      edtAverbacao.SetFocus
    else
      BitBtn1.setfocus;

  end;
  if key = 27 then close;
end;

procedure TF_DigDup2.BitBtn10Click(Sender: TObject);
var
  sArquivo: String;
begin
  sArquivo:= 'C:\Windows\System32\shimgvw.dll, ImageView_Fullscreen '+ImgEdit1.Image;

  ShellExecute(0, 'Open', 'C:\Windows\System32\rundll32.exe', PChar(sArquivo), '', SW_NORMAL);
end;

procedure TF_DigDup2.FormShow(Sender: TObject);
begin
  if (F_Exame <> Nil) then
  begin
    if FileExists(imagem_generica) then
    begin
      ImgEdit1.Image   := imagem_generica;
      ImgEdit1.Display;
      ImgEdit1.FitTo(0, True);
    end;
  end;

end;

procedure TF_DigDup2.BitBtn12Click(Sender: TObject);
var
  qq : String;
  q : Integer;
begin
  if (Not(Permissao('acesso113'))) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end
  else
  begin
    if (Trim(MaskEdit1.Text) = '') then
    begin
      ShowMessage('Registro inválido');
      MaskEdit1.SetFocus;
      exit;
    end;

    if (MessageBox(Handle, PChar('Deseja excluir as imagens?'), 'EXCLUSÃO DE IMAGENS', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_No) then
      Abort;

    if (MessageBox(Handle, PChar('Deseja realmente excluir todas as imagens relacionadas ?'), 'EXCLUSÃO DE IMAGENS', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
    begin
      with F_DigDup2 do
      begin
        q := 0;
        qq := copy(imgedit1.image,1,length(imgedit1.image) - 3) + '001';
        while qq <> '' do
        begin
          //if q = 0 then
            //qq := copy(imgedit1.image,1,length(imgedit1.image) - 3) + '001';
          q := q + 1;

          {arq := inttostr(strtoint(maskedit1.text));
          arq := strzero(arq, 6);
          sub := DefineSub(maskedit1.text);}
          if not fileexists(qq) then
          begin
            showmessage('Imagem não localizada ' + qq);
            maskedit1.setfocus;
            exit;
          end
          else
          begin
            DeleteFile(qq);
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Imagem: '+Label2.Caption+' do  registro: '+MaskEdit1.Text+', protocolo: '+retornaProtocolo(MaskEdit1.Text)+', foi excluída do diretório assim como seus respectivos anexos '+qq, retornaProtocolo(MaskEdit1.Text));
          end;

          qq := Andar2(qq, '+');
        end;
        Label4.Caption := copy('000' + inttostr(q), length('000' + inttostr(q)) -2, 3);
      end;
      Label2.Caption := '0000';
      Label4.Caption := '0000';
      ImgEdit1.ClearDisplay;
      ShowMessage('Imagens Excluídas com Sucesso!');
    end;
  end;
end;

procedure TF_DigDup2.edtAverbacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn5.SetFocus;
end;

procedure TF_DigDup2.ListarArquivos(Diretorio: string; Sub: Boolean; Arq:string);
var

  F: TSearchRec;

  Ret: Integer;

  TempNome: string;

begin
  Ret := FindFirst(Diretorio+'*.*', faAnyFile, F);
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
       if trim(edtAverbacao.text) <> '' then
       begin
         if Pos(arq+'_'+trim(edtAverbacao.Text),F.Name) > 0 then
         Memo1.Lines.Add(F.Name);
       end
       else
       begin
         if Pos(arq,F.Name) > 0   then
         Memo1.Lines.Add(F.Name);
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

function TF_DigDup2.TemAtributo(Attr, Val: Integer): Boolean;
begin
 Result := Attr and Val = Val;
end;

procedure TF_DigDup2.get_averba;
var
 x, ipos, linha,tamanho : Integer;
 buffer : string;
begin
 ComboBox1.Items.Clear;
 combobox1.text:='Averbações';
 for x := 0 to memo1.Lines.Count - 1 do
 begin
  if edtAverbacao.Text <> '' then
  begin
    if Pos(MaskEdit1.text+'_'+trim(edtAverbacao.Text),memo1.Lines.Strings[x]) > 0 then
    begin
      tamanho := Length(memo1.Lines.Strings[x]);
      ComboBox1.Items.Add(copy(memo1.Lines.Strings[x],0,tamanho));
      Memo2.lines.Add(copy(memo1.Lines.Strings[x],0,tamanho));
      //(copy(memo1.Lines.Strings[I],0,tamanho));
    end;
  end
  else
  begin
    if Pos(MaskEdit1.text,memo1.Lines.Strings[x]) > 0 then
    begin
        tamanho := Length(memo1.Lines.Strings[x]);
        Memo2.lines.Add(copy(memo1.Lines.Strings[x],0,tamanho));
    end;
  end;
 end;
 verificadorx:= Memo2.Lines.Count;
 contadorx:=0;
end;

procedure TF_DigDup2.ComboBox1Change(Sender: TObject);
begin
  if (fileexists(cam1+sub+combobox1.text)) then
  begin
    inicializar;
    ImgEdit1.Image   := cam1 + sub +combobox1.text;   //img;
    Label2.Caption   := label4.Caption;
    label10.Caption  := label4.Caption;
    ImgEdit1.Display;
    ImgEdit1.FitTo(0, True);
     bitbtn1.enabled      := true;
    StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
    StatusBar1.UpDate;
  end;
end;

procedure TF_DigDup2.Ordenar(Valores: tStrings);
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

procedure TF_DigDup2.SpeedButton7Click(Sender: TObject);
begin
  ImgEdit1.Image := cam1 + sub+ memo2.lines.Strings[verificadorx-1];
  ImgEdit1.Display;
  contadorx := verificadorx;
end;

procedure TF_DigDup2.SpeedButton8Click(Sender: TObject);
begin
  ImgEdit1.Image := cam1 + sub+ memo2.lines.Strings[0];
  ImgEdit1.Display;
  contadorx :=0;
end;

end.
