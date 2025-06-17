unit Dig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScanLibCtl_TLB, AxCtrls, OleCtrls, DbOleCtl, ImgeditLibCtl_TLB, StdCtrls,
  Buttons, Mask, FileCtrl, ExtCtrls;

type
  TF_Dig = class(TForm)
    ImgEdit1: TImgEdit;
    ImgScan1: TImgScan;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ImgEdit1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Dig: TF_Dig;
  cam1, sub1, arq1, arq2, ext1, arg : string;

implementation

uses Tabelas, Func, Zoom, Menu;

{$R *.DFM}
Procedure Atual_Logs(Protocolo, Tipo, Pagina, Data, Hora, Usuario, Operacao : String);
Begin
  tabela.logs.open;
  tabela.logs.append;
  tabela.logs.fieldbyname('protocolo').asstring := protocolo;
  tabela.logs.fieldbyname('tipo').asstring := tipo;
  tabela.logs.fieldbyname('pagina').asstring := pagina;
  tabela.logs.fieldbyname('data').asstring := data;
  tabela.logs.fieldbyname('hora').asstring := hora;
  tabela.logs.fieldbyname('usuario').asstring := usuario;
  tabela.logs.fieldbyname('operacao').asstring := operacao;
  tabela.logs.post;
  tabela.logs.close;
end;

Function Tem_Prot(Protocolo : String) : Boolean;
Begin
  if tabela.td.active then Funcoes.Fecha_TDClick(Funcoes);
  Funcoes.Abre_TDClick(Funcoes);
  tabela.td.setorder(1);
  arg := '      ' + protocolo;
  arg := copy(arg, length(arg) - 5, 6);
  result := tabela.td.Seek(arg);
  Funcoes.Fecha_TDClick(Funcoes);
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

Function DefineSub(arq_img : String) : String;
Begin
//  arq_img := '000000' + inttostr(strtoint(arq_img));
//  arq_img := copy(arq_img, length(arq_img) - 5, 6);
  if strtoint(arq_img) < 1000 then result := '0000\' else
  begin
    result := '0000' + inttostr(strtoint(copy(arq_img,1,3)));
    result := copy(result, length(result) - 3, 4) + '\';
  end;
end;

Function Contar(arq_img : String) : Integer;
var
  qq : String;
  q : Integer;
Begin
  with F_Dig do
  begin
    Screen.cursor := crHourglass;
    qq := copy(arq_img,1,length(arq_img) - 3) + '001';
    q := 0;
    while qq <> '' do
    Begin
      q := q + 1;
      qq := andar(qq, '+');
    end;
    result := q;
    Screen.cursor := crDefault;
  end;
end;

procedure TF_Dig.BitBtn1Click(Sender: TObject);
begin
  if not tem_prot(maskedit1.text) then
  begin
    showmessage('Protocolo inexistente');
    maskedit1.setfocus;
    exit;
  end;
  { Carregando caminho das imagens }
  tabela.configur.open;
  cam1 := tabela.configur.fieldbyname('imagens').asstring;
  tabela.configur.close;
  if copy(cam1, length(cam1),1) <> '\' then cam1 := cam1 + '\';
  { Definindo subdiretório }
  sub1 := definesub(maskedit1.text);
  { Nome da imagem }
  ext1 := '001';
  arq1 := cam1 + sub1 + maskedit1.text + '.' + ext1;
  { Verificando imagens existentes }
  if fileexists(arq1) then
  begin
    arq2 := arq1;
    while arq2 <> '' do
    begin
      arq1 := arq2;
      arq2 := andar(arq1, '+');
    end;
    imgedit1.image := arq1;
    imgedit1.display;
    imgedit1.FitTo(2, true);
    Label4.Caption := copy(arq1, length(arq1) - 2,3);
    label2.caption := label4.caption;    
  end
  else
  begin
    if not DirectoryExists(cam1 + sub1) then
    begin
      ForceDirectories(cam1 + sub1);
      if not DirectoryExists(cam1 + sub1) then
      begin
        showmessage('Problemas para criar diretorio ' + cam1 + sub1);
        exit;
      end;
    end;
    label2.caption := '000';
    Label4.Caption := '000';
  end;
  panel1.enabled := false;
  bitbtn1.enabled := false;
  bitbtn2.enabled := false;
  bitbtn3.enabled := false;
  panel2.enabled := true;
  bitbtn4.enabled := true;
  bitbtn5.enabled := true;
  bitbtn6.enabled := true;
  bitbtn7.enabled := true;
  bitbtn4.setfocus;
end;

procedure TF_Dig.BitBtn7Click(Sender: TObject);
begin
  label2.caption := '000';
  label4.caption := '000';
  imgedit1.ClearDisplay;
  Panel2.enabled := false;
  bitbtn4.enabled := false;
  bitbtn5.enabled := false;
  bitbtn6.enabled := false;
  bitbtn7.enabled := false;
  Panel1.enabled := true;
  bitbtn1.enabled := true;
  bitbtn2.enabled := true;
  bitbtn3.enabled := true;
  bitbtn2.setfocus;
end;

procedure TF_Dig.BitBtn9Click(Sender: TObject);
var
  aaa : String;
begin
  aaa := andar(imgedit1.image, '+');
  if aaa <> '' then
  begin
    imgedit1.image := aaa;
    imgedit1.display;
    arq1 := aaa;
    label2.caption := copy(arq1, length(arq1) - 2,3);
  end;
end;

procedure TF_Dig.BitBtn8Click(Sender: TObject);
var
  aaa : String;
begin
  aaa := andar(imgedit1.image, '-');
  if aaa <> '' then
  begin
    imgedit1.image := aaa;
    imgedit1.display;
    arq1 := aaa;
    label2.caption := copy(arq1, length(arq1) - 2,3);
  end;
end;

procedure TF_Dig.BitBtn4Click(Sender: TObject);
var
  sair : Boolean;
begin
  sair := false;
  while not sair do
  begin
    ext1 := '000' + inttostr(strtoint(label4.caption) + 1);
    ext1 := copy(ext1, length(ext1) - 2, 3);
    arq1 := copy(arq1, 1, length(arq1) - 3) + ext1;
    imgscan1.image :=  arq1;
    imgscan1.StartScan;
    if not fileexists(arq1) then
    begin
      showmessage('Problemas para digitalizar ' + arq1);
      exit;
    end;
    label4.caption := ext1;
    label2.caption := label4.caption;
    imgedit1.image := arq1;
    imgedit1.display;
    imgedit1.FitTo(2, false);
    atual_logs(maskedit1.text, '1', label4.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'INCLUSAO');
    if messagedlg('Deseja digitalizar mais ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then sair := true;
  end;
end;

procedure TF_Dig.BitBtn5Click(Sender: TObject);
begin
  if messagedlg('Tem certeza que deseja substituir esta imagem ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  Deletefile(arq1);
  if fileexists(arq1) then
  begin
    showmessage('Problemas para substituir ' + arq1);
    exit;
  end;
  imgedit1.ClearDisplay;
  imgscan1.image :=  arq1;
  imgscan1.StartScan;
  if not fileexists(arq1) then
  begin
    showmessage('Problemas para digitalizar ' + arq1);
    exit;
  end;
  imgedit1.image := arq1;
  imgedit1.display;
  atual_logs(maskedit1.text, '1', label2.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'SUBSTITUICAO');  
end;

procedure TF_Dig.BitBtn6Click(Sender: TObject);
begin
  if label4.caption = '000' then
  begin
    showmessage('Não existem imagens para excluir');
    exit;
  end;
  if copy(arq1, length(arq1) - 2, 3) <> label4.caption then
  begin
    showmessage('Somente a última imagem deste documento pode ser apagada');
    exit;
  end;
  if messagedlg('Tem certeza que deseja excluir esta imagem ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  Deletefile(arq1);
  atual_logs(maskedit1.text, '1', label2.caption, datetostr(date), timetostr(time), F_Menu.label1.caption, 'EXCLUSAO');  
  if label4.caption = '001' then
  begin
    label2.caption := '000';
    label4.caption := '000';
    imgedit1.ClearDisplay;
  end
  else
  begin
    arq1 := andar(arq1, '-');
    imgedit1.image := arq1;
    imgedit1.display;
    label2.caption := copy(arq1, length(arq1) - 2,3);
    label4.caption := copy(arq1, length(arq1) - 2,3);
  end;
end;

procedure TF_Dig.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_Dig.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
  if key = 27 then close;
end;

procedure TF_Dig.FormActivate(Sender: TObject);
begin
  maskedit1.setfocus;
end;

procedure TF_Dig.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit1.setfocus;
end;

procedure TF_Dig.ImgEdit1DblClick(Sender: TObject);
begin
  Application.CreateForm(TF_Zoom, F_Zoom);
  F_zoom.imgedit1.Image := imgedit1.image;
  F_Zoom.showmodal;
  F_Zoom.destroy;
end;

end.
