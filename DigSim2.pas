unit DigSim2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, AxCtrls, OleCtrls, ImgeditLibCtl_TLB, ExtCtrls,
  ComCtrls, ScanLibCtl_TLB, Db, Apodset, Grids, DBGrids, DBTables, Menus,
  DbOleCtl, FileCtrl, QuickRpt, Qrctrls, SISRenameTIFF_TLB, TWNPRO4Lib_TLB,
  ImagXpr7_TLB;

type
  TF_DigSim2 = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Function Andar(arq_img, sentido : String) : Boolean;


var
  F_DigSim2: TF_DigSim2;
  arq1, cam1, cam2, img_a, operacao, temp, img, arq, sub, tipolog : String;
  arq_temp, frente, verso : String;
  varios : Boolean;
  prot_scan, prot_scan0 : Integer;

  aArquivoConverter: WideString;
  aCaminhoDestino: WideString;
  aDocumentoInicial: WideString;
  aDocumentoFinal: WideString;
  aPaginaInicial: Integer;
  aPaginas: Integer;

  ObjRename: clsRenameTIFF;

implementation

uses DMTD, Menu, Zoom, Senha, Loc, ExcLote, DispScan;

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



Procedure Renomeia(arquivo, ext_del, ext_fim : String);
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
  if F_DigSim2.label7.caption = 'titulos' then
  begin
    Dm.query1.Sql.Add('registro = ' + protocolo);
  end
  else if F_DigSim2.label7.caption = 'certifi' then
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
Begin
  with F_DigSim2 do
  Begin
    { Limpando ImgEdit }
//    deletefile(ImgScan1.Image);
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

    ImgScan1.Image := 'c:\TESTE_KODAK\temp.tif';
    deletefile('c:\TESTE_KODAK\temp.tif');
    Xpress1.FileName := 'c:\TESTE_KODAK\temp.tif';

{
    ImgScan1.Image := 'c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif';

    deletefile('c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif');

    ImgScan1.Image := 'c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif';

    Xpress1.FileName := 'c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif';
 }

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
  pri_arq        := '';
  pri_img_frente := '';
  pri_img_verso  := '';
  with F_DigSim2 do
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
        sub  := definesub(inttostr(xy)); CriaDir(cam1 + sub);
        while true do
        begin
          if fileexists(cam1 + sub + inttostr(xy) + '.' + inttostr(ext)) then
          begin
            if pri_arq        = '' then pri_arq        := inttostr(xy) + '.' + inttostr(ext);
            if pri_img_frente = '' then pri_img_frente := cam1 + sub + inttostr(xy) + '.' + inttostr(ext);
            if pri_img_verso  = '' then pri_img_verso  := cam1 + sub + inttostr(xy) + '.' + inttostr(ext2);
            ult_img_frente := cam1 + sub + inttostr(xy) + '.' + inttostr(ext);
            ult_img_verso  := cam1 + sub + inttostr(xy) + '.' + inttostr(ext2);
            ult_arq := inttostr(xy) + '.' + inttostr(ext);
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
  with F_DigSim2 do
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
        sub    := definesub(arq); CriaDir(cam1 + sub);
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
             sub    := definesub(arq); CriaDir(cam1 + sub);
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
  with F_DigSim2 do
  begin
    tam_ext := length( PegaAte(label10.caption,'.','R') );
    arq     := copy(label10.caption,1,length(label10.caption)-(tam_ext+1));
    ext     := strzero(pegaate(label10.caption,'.','R'),3);
    sub     := definesub(arq); CriaDir(cam1 + sub);
    if sentido = '+' then
    begin
      ext := inttostr(strtoint(ext)+1);
      if not fileexists(cam1 + sub + arq + '.' + ext) then
      begin
        mostra  := false;
        arq     := inttostr(strtoint(arq)+1);
        if (strtoint(arq) > strtoint(maskedit2.text)) or (not fileexists(cam1 + sub + arq + '.1')) then
        begin
          showmessage('Não existem próximas imagens neste intervalo');
          result := false
        end
        else
        begin
          sub    := definesub(arq); CriaDir(cam1 + sub);
          result := (contar(arq,true,true,false)>0);
        end;
      end
      else result := true;
    end
    else if sentido = '-' then
         begin
           ext := inttostr(strtoint(ext)-1);
           if not fileexists(cam1 + sub + arq + '.' + ext) then
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
               sub    := definesub(arq); CriaDir(cam1 + sub);
               result := (contar(arq,true,false,false)>0);
             end;
           end
           else result := true;
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

procedure TF_DigSim2.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_DigSim2.BitBtn2Click(Sender: TObject);
begin
  Panel1.Enabled  := False;
  label2.caption  := '0000';
  label4.caption  := '0000';
  label10.caption := '';
  imgedit1.ClearDisplay;
  maskedit1.setfocus;
end;

procedure TF_DigSim2.BitBtn1Click(Sender: TObject);
var
  nova : Boolean;
begin
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
  varios := false;
  if (strtoint(maskedit2.text) - strtoint(maskedit1.text) + 1) > 1 then varios := true else varios := false;
  Panel1.Enabled := False;
  nova := false;
  Label6.Caption := '';
  StatusBar1.SimpleText := 'Localizando...';
  StatusBar1.UpDate;
  { Nome da imagem }
  arq := maskedit1.text;
  arq_temp := 'c:\siscart\temp\td_temp.tif';
  { Definindo subdiretório }
  sub := DefineSub(maskedit1.text);
  { Carregando caminho das imagens }
  cam1 := F_Menu.Label17.Caption;
  cam2 := F_Menu.Label17.Caption;
  if right(cam1,1) <> '\' then cam1 := cam1 + '\';
  if label7.caption = 'certifi' then cam1 := cam1 + 'CERTIF\';
  if label7.caption = 'certifi' then cam2 := cam2 + '\CERTIF';
  img  := cam1 + sub + arq + '.1';
  CriaDir(cam1 + sub);
  { Verificando imagens existentes }
  if (not fileexists(img)) then
  begin
    speedbutton3.visible := false;
    speedbutton4.visible := false;
    label10.caption      := '';
    CriaDir(cam1 + sub);
    label2.caption := '0000';
    Label4.Caption := '0000';
    Label6.Caption := 'NOVA';
    nova := True;
  end
  else
  begin
    speedbutton3.visible := true;
    speedbutton4.visible := true;
  end;

  Panel1.Enabled := True;
  ImgEdit1.Page := 1;
  if nova then
  begin
    bitbtn5.enabled := true;
    bitbtn5.setfocus;
    StatusBar1.SimpleText := 'Novo documento...';
    StatusBar1.UpDate;
    ImgEdit1.Image := '';
  end
  else contar(maskedit2.text,true,false,false);
  //
  Speedbutton1.enabled := true;
  Speedbutton2.enabled := true;
  bitbtn4.enabled      := true;
  bitbtn5.enabled      := true;
  bitbtn6.enabled      := true;
  bitbtn8.enabled      := true;
  bitbtn7.enabled      := true;
  Panel2.enabled       := false;
  bitbtn1.enabled      := false;
  bitbtn2.enabled      := false;
  bitbtn3.enabled      := false;
  bitbtn9.enabled      := false;
end;

procedure TF_DigSim2.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit2.setfocus;
  if key = 27 then close;
end;

procedure TF_DigSim2.SpeedButton1Click(Sender: TObject);
begin
  if strtoint(label4.caption) = 0 then exit;
  andar(ImgEdit1.Image, '+');
end;

procedure TF_DigSim2.SpeedButton2Click(Sender: TObject);
begin
  if strtoint(label4.caption) = 0 then exit;
  andar(ImgEdit1.Image, '-');
end;


procedure TF_DigSim2.BitBtn5Click(Sender: TObject);
var
  ult_imagem, extt, novo1, novo, ext, ext1, parametros, origem, destino, dir_img : String;
  continua, ignora, outra, semqtde, canc_dig, nofinal, primeira, primeira_fim, parada : boolean;
  retorno, xy, zz, ini, fim, timeout, vezes, x, qtd_img, ver_qtd : Integer;
  qde_prot, prot_atual : Double;
  parar : Boolean;
  flavio : integer;
begin
  if (speedbutton3.visible = true) and (speedbutton4.visible = true) then
  begin
    if (not Permissao('acesso073')) then
    begin
      MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;

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
        end
        else
        begin
          nofinal      := True;
          primeira_fim := True;
        end;
      end
      else
      begin
        nofinal := True;
      end;
    end;
  end;
  if primeira then
    Label13.Caption := '001'
  else
    Label13.Caption := inttostr(StrToInt(Label2.Caption)+1);

  vezes      := 0;
  timeout    := 0;
  qde_prot   := strtofloat(maskedit2.text);

  if (nofinal) and (Label6.Caption = 'NOVA') then
    prot_atual := strtofloat(maskedit1.text)
  else
    prot_atual := strtofloat(PegaAte(label10.caption,'.','L'));
  if not parada then prot_scan0 := StrToInt(FloatToStr(prot_atual));

  outra      := false;
  continua   := true;
  semqtde    := false;
  ult_imagem := imgedit1.image;

{
  repeat
  try
    ImgScan1.OpenScanner;
    break;
  except
    ImgScan1.CloseScanner;
    inc(timeout);
  end;
  until timeout > 10;
}

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;
  dir_img  := Dm.Configur.FieldByName('imagens').asString;
  Dm.Configur.Close;

  while ((continua) and (prot_atual <= qde_prot)) do
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

    arq      := floattostr(prot_atual);
    if (nofinal) and (Label6.Caption = 'NOVA') then
      ext      := inttostr(contar(floattostr(prot_atual),false,false,true))
    else
      ext      := Label13.Caption;

    if (primeira_fim) and (nofinal) then
      ext := inttostr(contar(floattostr(prot_atual),false,false,true));

    sub      := definesub(arq); CriaDir(cam1 + sub);
    novo     := cam1 + sub + arq + '.' + ext;
    ext1     := inttostr(contar(floattostr(prot_atual),false,false,true) +1);
    novo1    := cam1 + sub + arq + '.' + ext1;
    ImgEdit1.Image := novo;
    operacao := 'I';
    ignora   := false;

    StatusBar1.SimpleText := 'Digitalizando Nova Imagem em ' + novo;
    StatusBar1.UpDate;
    Label2.caption := ext;
    Label4.caption := ext;
    StatusBar1.SimpleText := 'Imagem digitalizada em ' + novo;
    StatusBar1.UpDate;

    { Iniciando digitalização multipage }
    prot_scan := StrToInt(maskedit1.text);

    F_DigSim2.Panel3.Visible := True;
    if (Trim(maskedit3.text) = '') or (maskedit3.text = '0') then
      F_DigSim2.Panel3.Caption := IntToStr(prot_scan0)
    else
      F_DigSim2.Panel3.Caption := IntToStr(prot_scan);
    F_DigSim2.Panel3.Refresh;
    F_DigSim2.Panel3.repaint;


//    F_DigSim2.TwainPRO1.SelectSource;

    F_DigSim2.TwainPRO1.StartSession;
    F_DigSim2.TwainPRO1.CloseSession;

//    F_DigSim2.Xpress1.FileName := 'c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif';
//    ImgEdit1.Image := 'c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif';

{
    ImgScan1.ScanTo := DisplayAndFile;
    ImgScan1.Page := 1;
    ImgScan1.PageCount := 0;
    ImgScan1.MultiPage := True;
    Imgscan1.ShowSetupBeforeScan := CheckBox1.Checked;
    ImgEdit1.Image := ImgScan1.Image;


    if parada then
      Imgscan1.PageOption := 2
    else
      Imgscan1.PageOption := 1;

    Imgscan1.StartScan;
    Application.ProcessMessages;
}
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
            Break;
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

      ObjRename:= CoclsRenameTIFF.Create;
      aArquivoConverter:= ImgScan1.Image;
//      aArquivoConverter:= 'C:\SISCART\TEMP\TEMP.TIF';
      aCaminhoDestino:= dir_img;
      aDocumentoInicial:= arq;
      if semqtde then
        aDocumentoFinal:= arq
      else
        aDocumentoFinal:= maskedit2.text;

      aPaginaInicial:= StrToInt(ext);
      aPaginas:= qtd_img;

      with ObjRename do
      begin
        ObjRename.ArquivoConverter:= aArquivoConverter;
        ObjRename.CaminhoDestinoArquivo:= aCaminhoDestino;
        ObjRename.DocumentoInicial:= aDocumentoInicial;
        ObjRename.DocumentoFinal:= aDocumentoFinal;
        ObjRename.PaginaINI:= aPaginaInicial;
        ObjRename.QtdePaginas:= aPaginas;
        ObjRename.ConverteImagem;
      end;
    end;

    if semqtde then
    begin
///////////////
      KeyBd_Event(39,0,0,0);
      retorno := application.messagebox(pchar('Deseja finalizar documento ' + arq + ' ?'),'ATENÇÃO', mb_yesnocancel + mb_iconwarning + mb_defbutton1);
      if retorno = 7 then
      begin
        outra := true;
        if (nofinal = False) or (Label6.Caption = '') then
        begin
          ext := IntToStr(StrToInt(ext) + qtd_img);
          Label13.caption := ext;
        end
        else if not ignora then ext := ext1;
      end;
      if retorno = 6 then
      begin
        outra := false;
        F_DigSim2.BitBtn7.click;
        F_DigSim2.BitBtn2.click;
        if (nofinal = False) or (Label6.Caption = '') then continua := False;
      end;
      if retorno = 2 then
      begin
//        if not atualizalog(datetostr(date),timetostr(time),usuario_,'LOTE MANUAL CANCELADO',paginas_,strtofloat(inicial_),strtofloat(final_)) then showmessage('Problemas para atualizar Log de Eventos');
        continua := false;
      end;
    end;

    if (varios) and (not outra) then
    begin
      prot_atual := prot_atual + 1;
      prot_scan0 := StrToInt(FloatToStr(prot_atual));
      imgedit1.image := '';
      imgedit1.ClearDisplay;
    end;
  end;
  ImgScan1.CloseScanner;
  F_DigSim2.Panel3.Visible := False;
  Maskedit3.Text := '';
  bitbtn7.click;
  bitbtn1.click;
  operacao := '';
end;

procedure TF_DigSim2.BitBtn4Click(Sender: TObject);
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
    ImgEdit1.Image := 'c:\siscart\temp\temp.tif';
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

procedure TF_DigSim2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Panel1.Enabled := False;
  label2.caption := '0000';
  label4.caption := '0000';
  maskedit1.text := '';
  imgedit1.ClearDisplay;
end;

procedure TF_DigSim2.Zoom1Click(Sender: TObject);
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

procedure TF_DigSim2.BitBtn6Click(Sender: TObject);
var
  ext, sub : string;
begin
  if strtoint(label4.caption) = 0 then
  begin
    showmessage('Não existem imagens para excluir');
    exit;
  end;
  arq := PegaAte(label10.caption,'.','L');
  ext := PegaAte(label10.caption,'.','R');
  sub := DefineSub(arq); CriaDir(cam1 + sub);

  if application.messagebox(pchar('Confirma exclusão ?'),'ATENÇÃO', mb_yesno + mb_iconwarning + mb_defbutton1) = mrNo then
  begin
    exit;
  end;
  if (not Permissao('acesso074')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;

{  Application.CreateForm(TF_Senha, F_Senha);
  F_Senha.ShowModal;
  if (not F_Senha.Senha_Ok) then
  begin
    F_Senha.Destroy;
    F_Senha := nil;
    Exit;
  end;
  F_Senha.Destroy;
  F_Senha := nil;}

  Deletefile(cam1 + sub + arq + '.' + ext);

  atual_logs(maskedit1.text, tipolog, label2.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'EXCLUSAO');

  if ext <> Label5.Caption then
  begin
    Renomeia(cam1+sub+arq, ext, Label5.Caption);
  end;

  contar(arq,true,false,false);
end;

procedure TF_DigSim2.BitBtn7Click(Sender: TObject);
begin
  label2.caption := '0000';
  label4.caption := '0000';
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
  bitbtn8.enabled := false;
  bitbtn7.enabled := false;
  Panel2.enabled := true;
  bitbtn1.enabled := true;
  bitbtn2.enabled := true;
  bitbtn3.enabled := true;
  bitbtn9.enabled := true;
  bitbtn2.setfocus;
end;

procedure TF_DigSim2.FormActivate(Sender: TObject);
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

procedure TF_DigSim2.ImgEdit1DblClick(Sender: TObject);
begin
  Application.CreateForm(TF_Zoom, F_Zoom);
  F_Zoom.Label2.Caption := F_DigSim2.Label2.Caption;
  F_Zoom.Label4.Caption := F_DigSim2.Label4.Caption;
  F_zoom.imgedit1.Image := imgedit1.image;
  F_zoom.imgedit1.Zoom  := 100;
  F_zoom.Label1.Caption := 'SIMPLEX';
  F_Zoom.showmodal;
  F_Zoom.destroy;
end;

procedure TF_DigSim2.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit3.setfocus;
  if key = 27 then close;
end;

procedure TF_DigSim2.MaskEdit1Exit(Sender: TObject);
begin
//  maskedit2.text := maskedit1.text;
end;

procedure TF_DigSim2.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
  if key = 27 then close;
end;



procedure TF_DigSim2.SpeedButton4Click(Sender: TObject);
begin
  if strtoint(label4.caption) = 0 then exit;
  andardoc(ImgEdit1.Image, '+');
end;

procedure TF_DigSim2.SpeedButton3Click(Sender: TObject);
begin
  if strtoint(label4.caption) = 0 then exit;
  andardoc(ImgEdit1.Image, '-');
end;

procedure TF_DigSim2.Label1Click(Sender: TObject);
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

procedure TF_DigSim2.FormCreate(Sender: TObject);
begin
  CriaDir('c:\siscart\temp\imagens\');
  F_DigSim2.TwainPRO1.hParentWnd := F_DigSim2.Handle;
end;


procedure TF_DigSim2.BitBtn8Click(Sender: TObject);
var
  ult_imagem, extt, novo1, novo, ext, ext1, parametros, origem, destino, dir_img : String;
  continua, ignora, outra, semqtde, canc_dig, nofinal : boolean;
  xy, zz, ini, fim, timeout, vezes, x, qtd_img, ver_qtd : Integer;
  qde_prot, prot_atual : Double;
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
    //
{    Application.CreateForm(TF_Senha, F_Senha);
    F_Senha.ShowModal;
    if (not F_Senha.Senha_Ok) then
      begin
        F_Senha.Destroy;
        F_Senha := nil;
        Exit;
      end;
    F_Senha.Destroy;
    F_Senha := nil;}
    //
  end;

  vezes      := 0;
  timeout    := 0;
  qde_prot   := strtofloat(maskedit2.text);
//  prot_atual := strtofloat(maskedit1.text);
  prot_atual := strtofloat(PegaAte(label10.caption,'.','L'));
  outra      := false;
  continua   := true;
  semqtde    := false;
  ult_imagem := imgedit1.image;

{
  repeat
  try
    ImgScan1.OpenScanner;
    break;
  except
    ImgScan1.CloseScanner;
    inc(timeout);
  end;
  until timeout > 10;
}

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;
  dir_img  := Dm.Configur.FieldByName('imagens').asString;
  Dm.Configur.Close;

  while ((continua) and (prot_atual <= qde_prot)) do
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

    arq      := floattostr(prot_atual);
    ext      := inttostr(StrToInt(Label2.Caption));
    sub      := definesub(arq); CriaDir(cam1 + sub);
    novo     := cam1 + sub + arq + '.' + ext;
    ext1     := inttostr(contar(floattostr(prot_atual),false,false,true) +1);
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
{   ImgScan1.MultiPage := True;
    ImgScan1.Page := 1;
    ImgScan1.PageCount := 0;
    ImgEdit1.Image := ImgScan1.Image;
    Imgscan1.ShowSetupBeforeScan := CheckBox1.Checked;
    Imgscan1.StartScan;
}
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
    if (imgedit1.PageCount <> ver_qtd) and (ver_qtd <> 0) then
    begin
      MessageBox(Handle, PChar('Falta(m) ' + IntToStr(Abs(imgedit1.PageCount - ver_qtd)) + ' documento(s) para ser(em) digitalizado(s) !!!'), 'ERRO', MB_OK + MB_ICONWARNING);
      if messagedlg('Deseja CANCELAR este lote de digitalização ?', mtconfirmation, [mbyes, mbno], 0) = MrYes then
        canc_dig := True
      else
        canc_dig := False;
    end;

    if not canc_dig then
    begin
      DeleteFile(cam1+sub+arq+'.'+ext);

      ObjRename:= CoclsRenameTIFF.Create;
      aArquivoConverter:= ImgScan1.Image;
//      aArquivoConverter:= 'C:\SISCART\TEMP\TEMP.TIF';
      aCaminhoDestino:= dir_img;
      aDocumentoInicial:= arq;
      if semqtde then
        aDocumentoFinal:= arq
      else
        aDocumentoFinal:= maskedit2.text;

      aPaginaInicial:= StrToInt(ext);
      aPaginas:= qtd_img;

      with ObjRename do
      begin
        ObjRename.ArquivoConverter:= aArquivoConverter;
        ObjRename.CaminhoDestinoArquivo:= aCaminhoDestino;
        ObjRename.DocumentoInicial:= aDocumentoInicial;
        ObjRename.DocumentoFinal:= aDocumentoFinal;
        ObjRename.PaginaINI:= aPaginaInicial;
        ObjRename.QtdePaginas:= aPaginas;
        ObjRename.ConverteImagem;
      end;
    end;

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
        F_DigSim2.BitBtn7.click;
        F_DigSim2.BitBtn2.click;
      end;
    end;

    if (varios) and (not outra) then
    begin
      prot_atual := prot_atual + 1;
      imgedit1.image := '';
      imgedit1.ClearDisplay;
    end;
  end;
  ImgScan1.CloseScanner;
  bitbtn7.click;
  bitbtn1.click;
  operacao := '';
end;

procedure TF_DigSim2.BitBtn9Click(Sender: TObject);
begin
  if (not Permissao('acesso074')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;

{  Application.CreateForm(TF_Senha, F_Senha);
  F_Senha.ShowModal;
  if (not F_Senha.Senha_Ok) then
  begin
    F_Senha.Destroy;
    F_Senha := nil;
    Exit;
  end;
  F_Senha.Destroy;
  F_Senha := nil;}

  Application.CreateForm(TF_ExcLote, F_ExcLote);
  F_ExcLote.ShowModal;
  F_ExcLote.Destroy;
  F_ExcLote := nil;
end;

procedure TF_DigSim2.SpeedButton5Click(Sender: TObject);
begin
  Imgscan1.OpenScanner;
  Imgscan1.ShowScannerSetup;
  Imgscan1.CloseScanner;
end;

procedure TF_DigSim2.ImgScan1PageDone(Sender: TObject;
  PageNumber: Integer);
begin
  prot_scan := prot_scan + 1;
  if StrToInt(FloatToStr(prot_scan)) <= strtoint(maskedit2.text) then
  begin
    if (Trim(maskedit3.text) = '') or (maskedit3.text = '0') then
      F_DigSim2.Panel3.Caption := IntToStr(prot_scan0)
    else
      F_DigSim2.Panel3.Caption := IntToStr(prot_scan);
    F_DigSim2.Panel3.Refresh;
    F_DigSim2.Panel3.repaint;
  end;
end;

procedure TF_DigSim2.ImgScan1ScanUIDone(Sender: TObject);
begin
//  showmessage('UI Done ' + IntToStr(imgscan1.Page));
end;

procedure TF_DigSim2.ImgScan1ScanDone(Sender: TObject);
begin
//  showmessage('Scan Done ' + IntToStr(imgscan1.Page));
end;

procedure TF_DigSim2.ImgScan1FileNameRequest(Sender: TObject;
  PageNumber: Integer);
begin
//  showmessage('FileNameRequest ' + IntToStr(imgscan1.Page));
end;

procedure TF_DigSim2.ImgScan1ScanStarted(Sender: TObject);
begin
//  showmessage('ScanStarted ' + IntToStr(imgscan1.Page));
//  showmessage(IntToStr(ImgScan1.ScanTo));
end;

procedure TF_DigSim2.SpeedButton6Click(Sender: TObject);
begin
  Imgscan1.OpenScanner;
  Imgscan1.ShowScannerSetup;
  Imgscan1.CloseScanner;
end;

procedure TF_DigSim2.TwainPRO1PostScan(Sender: TObject;
  var Cancel: WordBool);
begin
  TwainPRO1.SaveTIFFCompression := TIFF_CCITTFAX3;
  TwainPRO1.SaveMultiPage := false;

  TwainPRO1.SaveFile('c:\TESTE_KODAK\temp.tif');
  Xpress1.FileName := 'c:\TESTE_KODAK\temp.tif';

//  TwainPRO1.SaveFile('c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif');
//  Xpress1.FileName := 'c:\siscart\temp\temp' + Copy(Timetostr(time),1,2) + Copy(Timetostr(time),4,2) + Copy(Timetostr(time),7,2) + '.tif';

  Cancel := true;
end;

end.
