unit U_PesqImagemDigDOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls, AdminLibCtl_TLB, FileCtrl,
  AxCtrls, OleCtrls, DbOleCtl, ImgeditLibCtl_TLB;

type
  TF_PesqImagemDigDOC = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    ImgEdit1: TImgEdit;
    Label8: TLabel;
    Label9: TLabel;
    FileListBox1: TFileListBox;
    ImgAdmin1: TImgAdmin;
    MaskEdit2: TMaskEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ImgEdit1DblClick(Sender: TObject);
    procedure ImgEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PesqImagemDigDOC: TF_PesqImagemDigDOC;
  img_a, img, img2, arq, sub : String;

implementation

uses Config, DMTD, Zoom{, U_ZoomProt};

{$R *.DFM}

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

Function Pega_Ext(Arq : String) : String;
var
  x : Integer;
Begin
  x := length(arq);
  result := '';
  while x > 0 do
  begin
    if copy(arq, x,1) <> '.' then
    result := copy(arq, x,1) + result
    else x := 0;
    x := x - 1;
  end;
end;

Function Andar(arq_img, sentido : String) : String;
var
  arq_ant, ext : String;
Begin
  ext := pega_ext(arq_img);
  if strtoint(ext) >= 99 then
  begin
    arq_ant := pega_arq(arq_img);
    if sentido = '+' then ext := inttostr(strtoint(ext) + 1) else ext := inttostr(strtoint(ext) - 1);
  end
  else
  begin
    arq_ant := pega_arq(arq_img);
    if sentido = '+' then ext := '000' + inttostr(strtoint(ext) + 1) else ext := '000' + inttostr(strtoint(ext) - 1);
    ext := copy(ext, length(ext) - 2, 3);
  end;
  arq_img := arq_ant + '.' + ext;
  if not fileexists(arq_img) then
  begin
    result := '';
  end
  else
  begin
    result := arq_img;
  end;
end;

Function StrZero( ValorInteiro, Tamanho : Integer) : String;
begin
  if tamanho > 20 then ShowMessage('Tamanho máximo de 20 caracteres');
  result := '00000000000000000000' + IntToStr(ValorInteiro);
  result := Copy(result, length(result) - (tamanho - 1), tamanho);
end;


Function DefineSub(arq_img : String) : String;
Begin
  arq_img := '000000' + inttostr(strtoint(arq_img));
  arq_img := copy(arq_img, length(arq_img) - 5, 6);
  if strtoint(arq_img) < 1000 then result := '0000\' else
  begin
    result := '0000' + inttostr(strtoint(copy(arq_img,1,3)));
    result := copy(result, length(result) - 3, 4) + '\';
  end;
end;

Procedure Contar;
var
  qq, ult_img : String;
  q : Integer;
Begin
  with F_PesqImagemDigDOC do
  begin
    Screen.Cursor := crHourglass;
    StatusBar1.SimpleText := 'Localizando Imagem...';
    StatusBar1.UpDate;
    qq := pega_arq(imgedit1.image) + '.' + '001';
    q := 0;
    while qq <> '' do
    Begin
      ult_img := qq;
      qq := andar(qq, '+');
      q := q + 1;
      StatusBar1.SimpleText := 'Qtde. Paginas Localizadas... ' + inttostr(q);
      StatusBar1.UpDate;
    end;
    if q > 100 then
    begin
      Label2.Caption := inttostr(q);
      Label4.Caption := inttostr(q);
    end
    else
    begin


//      Label2.Caption := copy('0000' + inttostr(q),1,4);
//      Label4.Caption := copy('0000' + inttostr(q),1,4);

      Label2.Caption := strZero(q,4);
      Label4.Caption := strZero(q,4);


    end;
    ImgEdit1.Image := ult_img;
    ImgEdit1.Display;
    ImgEdit1.FitTo(0, True);
    StatusBar1.SimpleText := 'Imagem localizada em ' + imgedit1.image;
    StatusBar1.UpDate;
    Screen.Cursor := crDefault;
  end;
end;


procedure TF_PesqImagemDigDOC.BitBtn1Click(Sender: TObject);
begin                         
  if Trim(Maskedit1.Text) = '' then
  Begin
    Showmessage('O campo não pode estar vazio');
    maskedit1.setfocus;
    exit;
  end;
  arq := '000000' + inttostr(strtoint(maskedit1.text));
  arq := copy(arq, length(arq) - 5, 6);
  sub := DefineSub(maskedit1.text);

  if RadioButton7.Checked then
  begin
    img   := Dm.Configur.FieldByName('dir_contratos').AsString + sub + arq + '.001';
    img_a := Dm.Configur.FieldByName('dir_contratos').AsString + 'P\' + sub + arq + '.001';
  end
  else if RadioButton8.Checked then
  begin
    img   := Dm.Configur.FieldByName('dir_oficio').AsString + sub + arq + '.001';
    img_a := Dm.Configur.FieldByName('dir_oficio').AsString + 'P\' + sub + arq + '.001';
  end
  else if RadioButton9.Checked then
  begin
    img   := Dm.Configur.FieldByName('dir_averbacoes').AsString + sub + arq + '.001';
    img_a := Dm.Configur.FieldByName('dir_averbacoes').AsString + 'P\' + sub + arq + '.001';
  end
  else if RadioButton10.Checked then
  begin
    img   := Dm.Configur.FieldByName('dir_pendencias').AsString + sub + arq + '.001';
    img_a := Dm.Configur.FieldByName('dir_pendencias').AsString + 'P\' + sub + arq + '.001';
  end
  else if RadioButton11.Checked then
  begin
    img   := Dm.Configur.FieldByName('dir_diversos').AsString + sub + arq + '.001';
    img_a := Dm.Configur.FieldByName('dir_diversos').AsString + 'P\' + sub + arq + '.001';
  end
  else if RadioButton1.Checked then
  begin
    img   := Dm.Configur.FieldByName('dir_examecalculo').AsString + sub + arq + '.001';
    img_a := Dm.Configur.FieldByName('dir_examecalculo').AsString + 'P\' + sub + arq + '.001';
  end
  else if RadioButton2.Checked then
  begin
    img   := Dm.Configur.FieldByName('dir_prenotacao').AsString + sub + arq + '.001';
    img_a := Dm.Configur.FieldByName('dir_prenotacao').AsString + 'P\' + sub + arq + '.001';
  end
  else if RadioButton3.Checked then
  begin
    img   := Dm.Configur.FieldByName('dir_certidao').AsString + sub + arq + '.001';
    img_a := Dm.Configur.FieldByName('dir_certidao').AsString + 'C\' + sub + arq + '.001';
  end;

  if (not fileexists(img)) and (not fileexists(img_a)) then
  begin
    showmessage('Imagem não localizada ' + img);
    maskedit1.setfocus;
    exit;
  end;
  ImgEdit1.Image := img;
  if fileexists(img_a) then
  begin
    if Messagedlg('Existe matrícula série "A". Deseja Visalizá-la ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
     ImgEdit1.Image := img_a;
  end;
  ImgEdit1.Display;
  ImgEdit1.FitTo(1, True);
  Label2.caption := pega_ext(imgedit1.image);
  Label2.update;
  Label9.Caption := IMG2;
  Label9.update;
  contar;                 
end;

Function AndarAteFim(arq_img, sentido : String) : String;
var
  ext, arq_fim : String;
Begin
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


procedure TF_PesqImagemDigDOC.BitBtn5Click(Sender: TObject);
var
  arq1 : String;
begin
  arq1 := andaratefim(ImgEdit1.Image, '-');
  if arq1 <> '' then
  begin
    ImgEdit1.Image := arq1;
    ImgEdit1.Display;
    if ImgEdit1.ImageWidth > ImgEdit1.ImageHeight then ImgEdit1.RotateRight(900);
    ImgEdit1.Update;
    Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 2, 3);
    Label2.update;
  end;
end;

procedure TF_PesqImagemDigDOC.BitBtn3Click(Sender: TObject);
var
  arq1 : String;
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
    Label2.caption := pega_ext(imgedit1.image);
    Label2.update;
  end;
end;
procedure TF_PesqImagemDigDOC.BitBtn2Click(Sender: TObject);
var
  arq1 : String;
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
    Label2.caption := pega_ext(imgedit1.image);
    Label2.update;
  end;
end;
procedure TF_PesqImagemDigDOC.BitBtn6Click(Sender: TObject);
var
  arq1 : String;
begin
  arq1 := andaratefim(ImgEdit1.Image, '+');
  if arq1 <> '' then
  begin
    ImgEdit1.Image := arq1;
    ImgEdit1.Display;
    if ImgEdit1.ImageWidth > ImgEdit1.ImageHeight then ImgEdit1.RotateRight(900);
    ImgEdit1.Update;
    Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 2, 3);
    Label2.update;
  end;
end;

Procedure BuscaImg (Ext, Diretorio : String);
var
  Numero, SoDir : String;
begin
  SoDir  := Copy(Diretorio,1,Length(Diretorio)- 10);
  Numero := Copy(Diretorio,Length(Diretorio)- 9, 7);

  if FileExists(SoDir + Numero + StrZero(StrToInt(Ext),3)) then
  begin
    with F_PesqImagemDigDOC do
    begin
      ImgEdit1.Image := SoDir + Numero + StrZero(StrToInt(Ext),3);
      ImgEdit1.Display;
      if ImgEdit1.ImageWidth > ImgEdit1.ImageHeight then ImgEdit1.RotateRight(900);
      ImgEdit1.Update;
      Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 2, 3);
      Label2.update;
    end;
  end
  else
    ShowMessage('Imagem não localizada ' + SoDir + Numero + StrZero(StrToInt(Ext),3));
  F_PesqImagemDigDOC.MaskEdit2.Clear;
end;

procedure TF_PesqImagemDigDOC.BitBtn9Click(Sender: TObject);
begin
  if (Trim(MaskEdit2.Text) <> '') then
  begin
    if MaskEdit1.Text <> '' then
      BuscaImg(Trim(MaskEdit2.Text), ImgEdit1.Image)
    else
      MessageBox(0, PChar('Número inválido'), 'DIGITALIZAÇÃO', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TF_PesqImagemDigDOC.BitBtn4Click(Sender: TObject);
var
  arq_ant, arq1, arq2 : String;
begin
  if MessageDlg('Imprimir a matrícula inteira ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then
  Begin
    ImgEdit1.PrintImage(1, 1, 2, false, 0, 0, 0);
  end
  else
  Begin
    arq_ant := ImgEdit1.Image;
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
      imgedit1.image := arq1;
      imgedit1.display;
      ImgEdit1.PrintImage(1, 1, 2, false, 0, 0, 0);
      arq1 := andar(arq1,'+');
    end;
    imgedit1.image := arq_ant;
    imgedit1.display;
  end;
end;

procedure TF_PesqImagemDigDOC.BitBtn7Click(Sender: TObject);
begin
  label2.caption := '000';
  label4.caption := '000';
  {Bitbtn2.enabled := False;
  Bitbtn3.enabled := False;
  Bitbtn4.enabled := False;
  Bitbtn5.enabled := False;
  Bitbtn6.enabled := False;
  Bitbtn7.enabled := False;
  Bitbtn9.enabled := False;}
  Maskedit1.setfocus;
  ImgEdit1.ClearDisplay;
end;

procedure TF_PesqImagemDigDOC.BitBtn8Click(Sender: TObject);
begin
  close;
end;

procedure TF_PesqImagemDigDOC.FormShow(Sender: TObject);
begin
  if Not(Dm.Configur.Active) then
    Dm.Configur.Open;
end;

procedure TF_PesqImagemDigDOC.MaskEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    BitBtn1.SetFocus;
  end;
end;

procedure TF_PesqImagemDigDOC.ImgEdit1DblClick(Sender: TObject);
begin
  if ImgEdit1.Image <> '' then
  begin
    F_Zoom:= TF_Zoom.Create(Nil);
    F_Zoom.ImgEdit1.Image := ImgEdit1.Image;
    F_Zoom.imgedit1.zoom := 6000;
    F_Zoom.showmodal;
    F_Zoom:= Nil;
  end;
end;

procedure TF_PesqImagemDigDOC.ImgEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 107 then ImgEdit1.Zoom := ImgEdit1.Zoom + 10;
  if key = 109 then ImgEdit1.Zoom := ImgEdit1.Zoom - 10;
end;

end.
