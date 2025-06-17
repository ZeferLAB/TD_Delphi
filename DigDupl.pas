unit DigDupl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, AxCtrls, OleCtrls, ImgeditLibCtl_TLB, ExtCtrls,
  ComCtrls, ScanLibCtl_TLB, Db, Apodset, Grids, DBGrids, DBTables, Menus,
  DbOleCtl, FileCtrl, jpeg;

type
  TF_DigDup = class(TForm)
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
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    ImgEdit2: TImgEdit;
    ImgEdit3: TImgEdit;
    ImgEdit1: TImgEdit;
    ImgScan1: TImgScan;
    ControlBar1: TControlBar;
    Label36: TLabel;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_DigDup: TF_DigDup;
  arq1, cam1, img_a, ficha, ficha1, operacao, temp, img, arq, sub : String;

implementation

uses DMTD, Menu, Zoom, FuncGeral;

{$R *.DFM}

Function Tem_Prot(Protocolo : String) : Boolean;
Begin
  Result := False;
  Dm.Td.Close;
  Dm.Td.Sql.Clear;
  Dm.Td.Sql.Add('SELECT protocolo FROM td');
  Dm.Td.Sql.Add('WHERE');
  Dm.Td.Sql.Add('protocolo = ' + protocolo);
  Dm.Td.Open;
  if (Dm.Td.RecordCount <> 0) then Result := True;
  Dm.Td.Close; 
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
Begin
  with F_DigDup do
  Begin
    { Limpando ImgEdit }
    ImgScan1.Page := 1;
    ImgScan1.PageCount := 0;
    ImgEdit1.Page := 1;
    ImgEdit2.Image := '';
    ImgEdit3.Image := '';
    ImgEdit1.ClearDisplay;
    ImgEdit2.ClearDisplay;
    ImgEdit3.ClearDisplay;
    { Preparabndo arquivo temporario }
    deletefile('c:\siscart\temp\temp.tif');
    ImgScan1.Image := 'c:\siscart\temp\temp.tif';
  end;
end;

Function Andar(arq_img, sentido : String) : String;
var
  ext : String;
Begin
  ext := copy(arq_img, length(arq_img) - 2, 3);
  if sentido = '+' then ext := '000' + inttostr(strtoint(ext) + 1) else ext := '000' + inttostr(strtoint(ext) - 1);
  ext := copy(ext, length(ext) - 2, 3);
  arq_img := copy(arq_img,1, length(arq_img) - 3) + ext;
  if not fileexists(arq_img) then result := '' else result := arq_img;
end;

Procedure Contar;
var
  qq, ult_img : String;
  q : Integer;
Begin
  with F_DigDup do
  begin
    qq := copy(imgedit1.image,1,length(imgedit1.image) - 3) + '001';
    q := 0;
    while qq <> '' do
    Begin
      ult_img := qq;
      qq := andar(qq, '+');
      q := q + 1;
    end;
    Label2.Caption := copy('000' + inttostr(q), length('000' + inttostr(q)) -2, 3);
    Label4.Caption := copy('000' + inttostr(q), length('000' + inttostr(q)) -2, 3);
    ImgEdit1.Image := ult_img;
    ImgEdit1.Display;
    ImgEdit1.FitTo(0, True);
    StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
    StatusBar1.UpDate;
  end;
end;

procedure TF_DigDup.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_DigDup.BitBtn2Click(Sender: TObject);
begin
  Panel1.Enabled := False;
  label2.caption := '000';
  label4.caption := '000';
  maskedit1.text := '';
  imgedit1.ClearDisplay;
  imgedit2.ClearDisplay;
  imgedit3.ClearDisplay;
  maskedit1.setfocus;
end;

procedure TF_DigDup.BitBtn1Click(Sender: TObject);
var
  nova : Boolean;
begin
  if maskedit1.text = '' then
  Begin
    showmessage('Protocolo inválido');
    maskedit1.setfocus;
    exit;
  end;
  if not tem_prot(maskedit1.text) then
  begin
    showmessage('Protocolo inexistente');
    maskedit1.setfocus;
    exit;
  end;
  Panel1.Enabled := False;
  nova := false;
  StatusBar1.SimpleText := 'Localizando...';
  StatusBar1.UpDate;
  { Nome da imagem }
  arq := maskedit1.text;
  { Definindo subdiretório }
  sub := DefineSub(maskedit1.text);
  { Carregando caminho das imagens }
  cam1 := F_Menu.Label17.Caption;
  img  := cam1 + sub + arq + '.001';
  { Verificando imagens existentes }
  if (not fileexists(img)) then
  begin
    if not DirectoryExists(cam1 + sub) then
    begin
      ForceDirectories(cam1 + sub);
      if not DirectoryExists(cam1 + sub) then
      begin
        showmessage('Problemas para criar diretorio ' + cam1 + sub);
        exit;
      end;
    end;
    label2.caption := '000';
    Label4.Caption := '000';
    nova := True;
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
  else
  begin
    ImgEdit1.Image := img;
    ImgEdit1.Display;
    ImgEdit1.FitTo(0, True);
    StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
    StatusBar1.UpDate;
    Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 2, 3);
    Label2.update;
    contar;
  end;
  Speedbutton1.enabled := true;
  Speedbutton2.enabled := true;
  bitbtn4.enabled := true;
  bitbtn5.enabled := true;
  bitbtn6.enabled := true;
  bitbtn7.enabled := true;
  Panel2.enabled := false;
  bitbtn1.enabled := false;
  bitbtn2.enabled := false;
  bitbtn3.enabled := false;
end;

procedure TF_DigDup.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
  if key = 27 then close;
end;

procedure TF_DigDup.SpeedButton1Click(Sender: TObject);
begin
  arq1 := andar(ImgEdit1.Image, '+');
  if arq1 = '' then
  Begin
    showmessage('Não existe próxima página');
    exit;
  end
  else
  begin
    ImgEdit1.Image := arq1;
    ImgEdit1.Display;
    StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
    StatusBar1.UpDate;
    Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 2, 3);
    Label2.update;
    arq := arq1;
  end;
end;

procedure TF_DigDup.SpeedButton2Click(Sender: TObject);
begin
  arq1 := andar(ImgEdit1.Image, '-');
  if arq1 = '' then
  Begin
    showmessage('Não existe página anterior');
    exit;
  end
  else
  begin
    ImgEdit1.Image := arq1;
    ImgEdit1.Display;
    StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
    StatusBar1.UpDate;
    Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 2, 3);
    Label2.update;
    arq := arq1;
  end;
end;

procedure TF_DigDup.BitBtn5Click(Sender: TObject);
var
  extt, novo1, novo, ext, ext1 : String;
  ignora, outra : boolean;
  x : Integer;
begin
  if ImgEdit1.Image <> '' then
  Begin
    contar;
    ext := copy (imgedit1.image, length(imgedit1.image) - 2, 3);
  end
  else ext := '001';
  outra := true;
  while outra do
  begin
    inicializar;
    if ImgEdit1.Image <> '' then
    Begin
      ext := '000' + inttostr(strtoint(ext) + 1);
      ext := copy(ext, length(ext) - 2, 3);
      novo := copy(imgedit1.image,1, length(imgedit1.image) - 3) + ext;
      ext1 := '000' + inttostr(strtoint(ext) + 1);
      ext1 := copy(ext1, length(ext1) - 2, 3);
      novo1 := copy(imgedit1.image,1, length(imgedit1.image) - 3) + ext1;
      operacao := 'N';
      ficha := '001';
    end
    else
    begin
      novo := cam1 + sub + arq + '.001';
      ImgEdit1.Image := novo;
      ext1 := copy(novo, length(novo) - 2, 3);
      ext1 := '000' + inttostr(strtoint(ext1) + 1);
      ext1 := copy(ext1, length(ext1) - 2, 3);
      novo1 := copy(novo, 1, length(novo) - 3) + ext1;
      ImgEdit1.Image := novo1;
      operacao := 'I';
      ficha := copy(novo, length(novo) - 2, 3);
      ficha1 := copy(novo1, length(novo1) - 2, 3);
    end;
    ignora := false;
    StatusBar1.SimpleText := 'Digitalizando Nova Imagem em ' + novo;
    StatusBar1.UpDate;
    showmessage('Nova em ' + novo);
    Label2.caption := ext;
    Label4.caption := ext;
    StatusBar1.SimpleText := 'Imagem digitalizada em ' + novo;
    StatusBar1.UpDate;
    { Iniciando digitalização multipage }
    ImgScan1.OpenScanner;
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
      ImgEdit2.Image := 'c:\siscart\temp\brancof.tif';
      ImgEdit2.Display;
      ImgEdit2.ClipboardPaste(0,0);
      ImgEdit2.FitTo(2, true);
      if fileexists(novo) then deletefile(novo);
      ImgEdit2.SaveAs(novo, 1, 1, 3, 0, false);
      atual_logs(maskedit1.text, '1', label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'INCLUSAO');
      { Verso }
      x := x + 1;
      if not ignora then
      begin
        if IMgEdit1.PageCount >= x then
        begin
          ImgEdit1.Page := x;
          ImgEdit1.Display;
          ImgEdit1.Fitto(2, true);
          ImgEdit1.ClipboardCopy(0,0,2000,2000);
          ImgEdit3.image := 'c:\siscart\temp\brancov.tif';
          ImgEdit3.Display;
          ImgEdit3.ClipboardPaste(0,0);
          ImgEdit3.FitTo(2, true);
          ImgEdit3.SaveAs(novo1, 1, 1, 3, 0, false);
          label4.caption := '000' + inttostr(strtoint(label4.caption) + 1);
          label4.caption := copy(label4.caption, length(label4.caption) - 2, 3);
          atual_logs(maskedit1.text, '1', label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'INCLUSAO');
        end
        else
        begin
          ImgEdit3.image := 'c:\siscart\temp\brancov.tif';
          ImgEdit3.Display;
          ImgEdit3.FitTo(2, true);
          ImgEdit3.SaveAs(novo1, 1, 1, 3, 0, false);
          label4.caption := '000' + inttostr(strtoint(label4.caption) + 1);
          label4.caption := copy(label4.caption, length(label4.caption) - 2, 3);
          atual_logs(maskedit1.text, '1', label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'INCLUSAO BRANCO');
          showmessage('Verso em Branco !');
        end;
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
    if ignora then
    begin
      ImgEdit1.Page := 1;
      ImgEdit1.Image := novo;
      ImgEdit1.Display;
      Imgedit1.Update;      
      Label2.caption := '001';
    end
    else
    begin
      if fileexists(novo1) then
      begin
        ImgEdit1.Page := 1;
        ImgEdit1.Image := novo1;
        ImgEdit1.Display;
        imgedit1.update;
        Label2.caption := Label4.caption;
      end;
    end;
    { Fim }
    ImgScan1.CloseScanner;    
    if Messagedlg('Digitalizar outra página ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      outra := true;
      if not ignora then ext := ext1;
    end
    else
    begin
      outra := false;
      F_DigDup.BitBtn1Click(F_DigDup);
    end;  
  end;
  operacao := '';
  ficha := '';
end;

procedure TF_DigDup.BitBtn4Click(Sender: TObject);
var
  extt, novo, novo1, ext1 : string;
  ignora : boolean;
  x : Integer;
begin
  if MessageDlg('Tem certeza que deseja substituir a imagem ' + imgedit1.image + ' ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    operacao := 'S';
    novo := imgedit1.image;
    ext1 := copy(novo, length(novo) - 2, 3);
    ext1 := '000' + inttostr(strtoint(ext1) + 1);
    ext1 := copy(ext1, length(ext1) - 2, 3);
    novo1 := copy(novo, 1, length(novo) - 3) + ext1;
    ficha := copy(novo, length(novo) - 2, 3);
    ficha1 := copy(novo1, length(novo1) - 2, 3);
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
      ImgEdit2.Image := 'c:\siscart\temp\brancof.tif';
      ImgEdit2.Display;
      ImgEdit2.ClipboardPaste(0,0);
      ImgEdit2.FitTo(2, true);
      if fileexists(novo) then deletefile(novo);
      ImgEdit2.SaveAs(novo, 1, 1, 3, 0, false);
      atual_logs(maskedit1.text, '1', label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'SUBSTITUICAO');
      { Verso }
      x := x + 1;
      if not ignora then
      begin
        ImgEdit1.Page := x;
        ImgEdit1.Display;
        ImgEdit1.Fitto(2, true);
        ImgEdit1.ClipboardCopy(0,0,2000,2000);
        ImgEdit3.image := 'c:\siscart\temp\brancov.tif';
        ImgEdit3.Display;
        ImgEdit3.ClipboardPaste(0,0);
        ImgEdit3.FitTo(2, true);
        if fileexists(novo1) then deletefile(novo1);
        ImgEdit3.SaveAs(novo1, 1, 1, 3, 0, false);
        label4.caption := '000' + inttostr(strtoint(label4.caption) + 1);
        label4.caption := copy(label4.caption, length(label4.caption) - 2, 3);
        atual_logs(maskedit1.text, '1', label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'SUBSTITUICAO');
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
      atual_logs(maskedit1.text, '1', label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'SUBSTITUICAO');
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
        atual_logs(maskedit1.text, '1', label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'SUBSTITUICAO');
        StatusBar1.SimpleText := 'Imagem substituída em ' + novo1;
        StatusBar1.UpDate;
      end;
    end;
    if ignora then
    begin
      ImgEdit1.Page := 1;
      ImgEdit1.Image := novo;
      ImgEdit1.Display;
      Label2.caption := '001';
    end
    else
    begin
      ImgEdit1.Page := 1;
      ImgEdit1.Image := novo1;
      ImgEdit1.Display;
      Label2.caption := Label4.caption;
    end;
    contar;
  end;
  operacao := ' ';
  ficha := '';
end;

procedure TF_DigDup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Panel1.Enabled := False;
  label2.caption := '000';
  label4.caption := '000';
  maskedit1.text := '';
  imgedit1.ClearDisplay;
end;

procedure TF_DigDup.Zoom1Click(Sender: TObject);
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

procedure TF_DigDup.BitBtn6Click(Sender: TObject);
begin
  if label4.caption = '000' then
  begin
    showmessage('Não existem imagens para excluir');
    exit;
  end;
  if copy(arq, length(arq) - 2, 3) <> label4.caption then
  begin
    showmessage('Somente a última imagem deste documento pode ser apagada');
    exit;
  end;
  if messagedlg('Tem certeza que deseja excluir esta imagem ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  Deletefile(arq);
  atual_logs(maskedit1.text, '1', label2.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'EXCLUSAO');
  if label4.caption = '001' then
  begin
    label2.caption := '000';
    label4.caption := '000';
    imgedit1.ClearDisplay;
  end
  else
  begin
    arq := andar(arq, '-');
    imgedit1.image := arq;
    imgedit1.display;
    label2.caption := copy(arq, length(arq) - 2,3);
    label4.caption := copy(arq, length(arq) - 2,3);
  end;
end;

procedure TF_DigDup.BitBtn7Click(Sender: TObject);
begin
  label2.caption := '000';
  label4.caption := '000';
  imgedit1.ClearDisplay;
  imgedit2.ClearDisplay;
  imgedit3.ClearDisplay;
  Panel1.enabled := false;
  Panel3.enabled := false;
  Speedbutton1.enabled := false;
  Speedbutton2.enabled := false;
  bitbtn4.enabled := false;
  bitbtn5.enabled := false;
  bitbtn6.enabled := false;
  bitbtn7.enabled := false;
  Panel2.enabled := true;
  bitbtn1.enabled := true;
  bitbtn2.enabled := true;
  bitbtn3.enabled := true;
  bitbtn2.setfocus;
end;

procedure TF_DigDup.FormActivate(Sender: TObject);
begin
  maskedit1.setfocus;
end;

procedure TF_DigDup.ImgEdit1DblClick(Sender: TObject);
begin
  Application.CreateForm(TF_Zoom, F_Zoom);
  F_zoom.imgedit1.Image := imgedit1.image;
  F_Zoom.showmodal;
  F_Zoom.destroy;
end;

end.
