unit U_OpcoesImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, OleCtrls, AdminLibCtl_TLB, U_TIFFToPDF, ShellAPI;

type
  TF_OpcoesImp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ImgAdmin1: TImgAdmin;
    procedure FormActivate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure OpenPDF(aFile : TFileName; TypeForm : Integer = SW_NORMAL);
  private
    { Private declarations }
  public
    ini, atual, ult : string;
    { Public declarations }
  end;

var
  F_OpcoesImp: TF_OpcoesImp;
  localizou_img : Boolean;
  extensao_localiz,extensao_convert : Integer;
  pxExtensao : String;

implementation

uses Loc, Menu, ImagemDaje, FileCtrl;

{$R *.DFM}

Function Andar(arq_img, sentido : String) : String;
var
  ext : String;
Begin

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

Function Andar2(arq_img, sentido : string; casas : integer) : string;
var
  ext : string;
begin
  ext := copy(arq_img, length(arq_img) - 2, 3);

  if sentido = '+' then
    ext := '000' + inttostr(strtoint(ext) + casas)
  else
    ext := '000' + inttostr(strtoint(ext) - casas);

  ext := copy(ext, length(ext) - 2, 3);
  arq_img := copy(arq_img,1, length(arq_img) - 3) + ext;

  if not fileexists(arq_img) then
    result := ''
  else
    result := arq_img;
end;

procedure TF_OpcoesImp.FormActivate(Sender: TObject);
begin
  RadioButton2.Enabled := True;
  RadioButton3.Enabled := True;

  RadioButton1.Checked := True;
  RadioButton2.Checked := False;
  RadioButton3.Checked := False;
  MaskEdit1.Text       := ini;
  MaskEdit2.Text       := ult;
  MaskEdit1.Enabled    := False;
  MaskEdit2.Enabled    := False;

  if (StrToInt(ult) = 1) then
  begin
    RadioButton2.Enabled := False;
    RadioButton3.Enabled := False;
  end;
end;

procedure TF_OpcoesImp.RadioButton1Click(Sender: TObject);
begin
  RadioButton1.Checked := True;
  RadioButton2.Checked := False;
  RadioButton3.Checked := False;
  MaskEdit1.Text       := ini;
  MaskEdit2.Text       := ult;
  MaskEdit1.Enabled    := False;
  MaskEdit2.Enabled    := False;
end;

procedure TF_OpcoesImp.RadioButton2Click(Sender: TObject);
begin
  RadioButton1.Checked := False;
  RadioButton2.Checked := True;
  RadioButton3.Checked := False;
  MaskEdit1.Text       := atual;
  MaskEdit2.Text       := atual;
  MaskEdit1.Enabled    := False;
  MaskEdit2.Enabled    := False;
end;

procedure TF_OpcoesImp.RadioButton3Click(Sender: TObject);
begin
  RadioButton1.Checked := False;
  RadioButton2.Checked := False;
  RadioButton3.Checked := True;
  MaskEdit1.Text       := ini;
  MaskEdit2.Text       := ult;
  MaskEdit1.Enabled    := True;
  MaskEdit2.Enabled    := True;
end;

procedure TF_OpcoesImp.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_OpcoesImp.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then BitBtn1.SetFocus;
end;

procedure TF_OpcoesImp.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0'..'9'] = False) and (Word(Key) <> VK_BACK)) then Key := #0;
end;

procedure TF_OpcoesImp.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0'..'9'] = False) and (Word(Key) <> VK_BACK)) then Key := #0;
end;

procedure TF_OpcoesImp.OpenPDF(aFile : TFileName; TypeForm : Integer = SW_NORMAL);
var
  Pdir: PChar;
begin
  GetMem(pDir, 256);
  StrPCopy(pDir, aFile);
  ShellExecute(0, nil, Pchar(aFile), nil, Pdir, TypeForm);
  FreeMem(pdir, 256);
end;

procedure TF_OpcoesImp.BitBtn1Click(Sender: TObject);
var
  arq_ant, arq1, arq2, direcao : string;
  casas : integer;
  objPDF : T_TIFFToPDF;
  s : WordBool;
  dir_temp, dir_out, Nome_PDF, Nome_TIF: String;
begin

  dir_temp := 'C:\siscart\temp\td\convtif';
  dir_out  := 'C:\siscart\temp\td\convtif\PDF';
  Nome_PDF := 'ArquivoTemp';
  Nome_TIF := 'ArquivoTemp.TIF';

  if FileExists(dir_temp+'\'+Nome_TIF) then
    DeleteFile(dir_temp+'\'+Nome_TIF);

  If Not DirectoryExists(ImgAdmin1.Image) then
    CreateDir(dir_out);

  ImgAdmin1.Image:= 'C:\siscart\temp\td\convtif\ArquivoTemp.TIF';

  if (RadioButton1.Checked = True) then //Todas
  begin
    pxExtensao := StrZero(MaskEdit1.Text,3);

    extensao_localiz := StrToInt(pxExtensao);
  { rotina pra verificar se existe a próxima imagem da sequencia. }
    localizou_img := True;
    While localizou_img do
    Begin
      If FileExists(cam1 + sub + StrZero(F_Loc.MaskEdit1.Text,6) + '.' + StrZero(IntToStr(extensao_localiz),3)) then
      Begin
        arq1 := cam1 + sub + StrZero(F_Loc.MaskEdit1.Text,6) + '.' + StrZero(IntToStr(extensao_localiz),3);
        localizou_img := True;
        F_Loc.imgedit1.image := arq1;
        F_Loc.imgedit1.display;
        ImgAdmin1.Append(arq1,1,1);
        inc(extensao_localiz);
        pxExtensao := StrZero(IntToStr(extensao_localiz),3);
      End
      Else
        inc(extensao_localiz);

      If extensao_localiz > StrToInt(MaskEdit2.Text) then localizou_img := False;
    End;

//    If NOT FileExists(cam1 + sub + StrZero(F_Loc.MaskEdit1.Text,6) + '.' + StrZero(IntToStr(extensao_localiz),3)) then
  //    localizou_img := False;



{  JOSE
    arq_ant := F_Loc.ImgEdit1.Image;
    arq2    := arq_ant;
    arq1    := andar(F_Loc.imgedit1.image, '-');

    while (arq1 <> '') do
    begin
      arq2 := arq1;
      arq1 := andar(arq1, '-');
    end;

    arq1 := arq2;
    while (arq1 <> '') do
    begin
      F_Loc.imgedit1.image := arq1;
      F_Loc.imgedit1.display;
      ImgAdmin1.Append(arq1,1,1);
      //F_Loc.ImgEdit1.PrintImage(1, 1, 1, false, 0, 0, 0);
      arq1 := andar(arq1,'+');
    end;

    //F_Loc.PrintDialog1.execute;
    //F_Loc.ImgEdit1.PrintImage(1, 1, 1, false, 0, 0, 0);
    F_Loc.imgedit1.image := arq_ant;
    F_Loc.imgedit1.display; }

  end
  else if (RadioButton2.Checked = True) then //Página atual
  begin

     F_Loc.imgedit1.display;
     //if F_Loc.PrintDialog1.execute Then
       //F_Loc.ImgEdit1.PrintImage(1, 1, 1, false, 0, 0, 0);
     ImgAdmin1.Append(F_Loc.ImgEdit1.Image,1,1);

  end
  else if (RadioButton3.Checked = True) then //Páginas
  begin
    if not ValidNumero(MaskEdit1.Text) then
    begin
      Application.MessageBox('Página inicial inválida!', 'Imprimir', Mb_IconInformation);
      MaskEdit1.SetFocus;
      Exit;
    end;

    if not ValidNumero(MaskEdit2.Text) then
    begin
      Application.MessageBox('Página final inválida!', 'Imprimir', Mb_IconInformation);
      MaskEdit2.SetFocus;
      Exit;
    end;

    if (StrToInt(MaskEdit1.Text) < StrToInt(ini)) or (StrToInt(MaskEdit1.Text) > StrToInt(ult)) then
    begin
      Application.MessageBox(Pchar('A página inicial deve ser entre ' + ini + ' e ' + ult + ' !'), 'Imprimir', Mb_IconInformation);
      MaskEdit1.SetFocus;
      Exit;
    end;

    if (StrToInt(MaskEdit2.Text) < StrToInt(ini)) or (StrToInt(MaskEdit2.Text) > StrToInt(ult)) then
    begin
      Application.MessageBox(Pchar('A página final deve ser entre ' + ini + ' e ' + ult + ' !'), 'Imprimir', Mb_IconInformation);
      MaskEdit2.SetFocus;
      Exit;
    end;

    if StrToInt(MaskEdit1.Text) > StrToInt(MaskEdit2.Text) then
    begin
      Application.MessageBox('A página inicial deve ser menor que a página final!', 'Imprimir', Mb_IconInformation);
      MaskEdit1.SetFocus;
      Exit;
    end;


    pxExtensao := StrZero(MaskEdit1.Text,3);

    extensao_localiz := StrToInt(pxExtensao);
  { rotina pra verificar se existe a próxima imagem da sequencia. }
    localizou_img := True;
    While localizou_img do
    Begin
      If FileExists(cam1 + sub + StrZero(F_Loc.MaskEdit1.Text,6) + '.' + StrZero(IntToStr(extensao_localiz),3)) then
      Begin
        arq1 := cam1 + sub + StrZero(F_Loc.MaskEdit1.Text,6) + '.' + StrZero(IntToStr(extensao_localiz),3);
        localizou_img := True;
        F_Loc.imgedit1.image := arq1;
        F_Loc.imgedit1.display;
        ImgAdmin1.Append(arq1,1,1);
        inc(extensao_localiz);
        pxExtensao := StrZero(IntToStr(extensao_localiz),3);
      End
      Else
        inc(extensao_localiz);

      If extensao_localiz > StrToInt(MaskEdit2.Text) then localizou_img := False;
    End;


{   if StrToInt(MaskEdit1.Text) > StrToInt(atual) then
    begin
      casas   := StrToInt(MaskEdit1.Text) - StrToInt(atual);
      direcao := '+';

      arq_ant := F_Loc.ImgEdit1.Image;
      arq2    := arq_ant;
      arq1    := andar2(F_Loc.imgedit1.image, direcao, casas);
    end
    else if StrToInt(MaskEdit1.Text) < StrToInt(atual) then
    begin
      casas   := StrToInt(atual) - StrToInt(MaskEdit1.Text);
      direcao := '-';

      arq_ant := F_Loc.ImgEdit1.Image;
      arq2    := arq_ant;
      arq1    := andar2(F_Loc.imgedit1.image, direcao, casas);
    end
    else
    begin
      arq_ant := F_Loc.ImgEdit1.Image;
      arq1    := arq_ant;
    end;

    while (arq1 <> '') do
    begin
      F_Loc.ImgEdit1.Image := arq1;
      F_Loc.ImgEdit1.Display;
      //F_Loc.ImgEdit1.PrintImage(1, 1, 1, false, 0, 0, 0);
      ImgAdmin1.Append(F_Loc.ImgEdit1.Image,1,1);

      if Copy(arq1,Length(arq1) - 2, 3) = (StrZero(MaskEdit2.Text,3)) then
      begin
        break;
      end;

      arq1 := andar(arq1,'+');
    end;

    F_Loc.imgedit1.image := arq_ant;
    F_Loc.imgedit1.display;}
    //F_Loc.PrintDialog1.execute;
  end;

  objPDF := T_TIFFToPDF.Create;
  with objPDF do
  begin
    sFolderImage := dir_temp; // + Nome_TIF;
    sFolderToOut := dir_out;//'C:\siscart\temp\td\'; //dir_ato; // + Nome_PDF;
    sFileNameSav := Nome_PDF;
    F_Author      := 'OFICIAL DE REGISTRO DE TÍTULOS E DOCUMENTOS';
    F_Producer    := 'Siscart Informática';
    F_Title       := 'Imagem';
    F_Subject     := 'Imagem';

    F_Keywords    := 'Registro: '+ F_Loc.MaskEdit1.Text;

    if GenTIFFToPDFA(self) then
    begin
      DeleteFile(dir_temp + Nome_TIF);
      DeleteFile(dir_out + Nome_TIF);
    end;
    Destroy;

    OpenPDF(dir_out + '\' +Nome_PDF + '.pdf', SW_SHOWMAXIMIZED);

  end;
  Close;
end;

procedure TF_OpcoesImp.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
