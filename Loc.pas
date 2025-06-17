unit Loc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, AxCtrls, OleCtrls, ImgeditLibCtl_TLB,
  Menus, DbOleCtl, jpeg, PicClip, FileCtrl, StrUtils, shellApi, ComCtrls,
  ImagXpr7_TLB,U_TIFFToPDF, AdminLibCtl_TLB,ImagemDaje;

type
  TF_Loc = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    ImgEdit1: TImgEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PopupMenu1: TPopupMenu;
    PrimeiraPgina1: TMenuItem;
    ltimaPgina1: TMenuItem;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label5: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    CheckBox1: TCheckBox;
    MaskEdit2: TMaskEdit;
    Label6: TLabel;
    BitBtn9: TBitBtn;
    PrintDialog1: TPrintDialog;
    PicClip1: TPicClip;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    LbContador: TLabel;
    BitBtn12: TBitBtn;
    CheckBox2: TCheckBox;
    BitBtn16: TBitBtn;
    Panel2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    StatusBar1: TStatusBar;
    edtDiretorio: TEdit;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    OpenDialog1: TOpenDialog;
    Bevel3: TBevel;
    BitBtn17: TBitBtn;
    edtAverbacao: TMaskEdit;
    Label7: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Label15: TLabel;
    ImgAdmin1: TImgAdmin;
    Label10: TLabel;
    Bevel4: TBevel;
    Label11: TLabel;
    procedure BitBtn8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ImgEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure PrimeiraPgina1Click(Sender: TObject);
    procedure ltimaPgina1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DeletarArquivo;
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    function pesquisaImagem(numero, livro: String): String;
    function pesquisaUltimaImagem(numero, livro: String): String;
  private
    { Private declarations }
    procedure SetJPGCompression(ACompression: integer; const AInFile: string;  const AOutFile, SequenciaArquivo: string);
    procedure ConverteImagem(sCaminhoArquivoASerConvertido, sCaminhoArquivoConvertido: String);
  public
    { Public declarations }
    contadorx,verificadorx, ajustCont: integer;
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure ListarArquivos(Diretorio: string; Sub:Boolean;Arq:string);
    procedure get_averba;
    procedure Ordenar(Valores: tStrings);
    procedure OpenPDF(aFile : TFileName; TypeForm : Integer = SW_NORMAL);
     function Andar(arq_img, sentido : String) : String;
  end;

var
  F_Loc: TF_Loc;
  cam1, img, arq, sub, f_ini : String;
  localizou_img : Boolean;
  extensao_localiz,extensao_convert : Integer;

implementation

uses Menu, FuncGeral, U_OpcoesImp, ProcGeral;

{$R *.DFM}

procedure TF_loc.OpenPDF(aFile : TFileName; TypeForm : Integer = SW_NORMAL);
var
  Pdir: PChar;
begin
  GetMem(pDir, 256);
  StrPCopy(pDir, aFile);
  ShellExecute(0, nil, Pchar(aFile), nil, Pdir, TypeForm);
  FreeMem(pdir, 256);
end;


Function TF_loc.Andar(arq_img, sentido : String) : String;
var
  ext : String;
begin                                      
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

Procedure Contar;
var
  qq : String;
  q : Integer;
begin
  with F_Loc do
  begin
    qq := copy(imgedit1.image,1,length(imgedit1.image) - 3) + '001';
    q := 0;
    while qq <> '' do
    begin
      qq := andar(qq, '+');
      q := q + 1;
      LbContador.Caption:= 'Carregando página: '+ inttostr(q)+', por favor aguarde ...  ';
      LbContador.Update;
    end;
    if Length(inttostr(q)) < 4 Then
      Label4.Caption := copy('000' + inttostr(q), length('000' + inttostr(q)) -2, 3)
    else
      Label4.Caption := copy('000' + inttostr(q), length('000' + inttostr(q)) -3, 4);

    LbContador.Caption:= 'Contagem concluída. Páginas carregadas: '+ inttostr(q)+'';
    LbContador.Update;
  end;              
end;

procedure TF_Loc.BitBtn8Click(Sender: TObject);
begin
  close;
end;

procedure TF_Loc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  label2.caption := '0000';
  label4.caption := '0000';
  Bitbtn2.enabled := False;
  Bitbtn3.enabled := False;
  Bitbtn4.enabled := False;
  Bitbtn5.enabled := False;
  Bitbtn6.enabled := False;
  Bitbtn7.enabled := False;
  BitBtn11.Enabled:= False;
  BitBtn10.Enabled:= False;

  ImgEdit1.ClearDisplay;
end;

procedure TF_Loc.BitBtn1Click(Sender: TObject);
var
  s : WordBool;
  Arquivo: TSearchRec;
  nomeArquivo, pArquivo, primeiroNome: String;
  contador, qtdZeros: integer;
begin
  img := '';
  if (Trim(MaskEdit1.Text) = '') then
  begin
    if (edtAverbacao.Text = '') then
    begin
      ShowMessage('Registro e Averbação Inválidos');
      MaskEdit1.SetFocus;
      exit;
    end;
  end;

  if CheckBox2.Checked Then
  Begin
    If FileExists(F_Menu.Label51.Caption + Maskedit1.text + '.pdf') then
    Begin
      FrmImagemDaje:= TfrmImagemDaje.Create(Nil);
      FrmImagemDaje.AcroPDF1.LoadFile(F_Menu.Label51.Caption + Maskedit1.text + '.pdf', s);
      FrmImagemDaje.ShowModal;
      if FrmImagemDaje <> Nil Then
        FrmImagemDaje := Nil;
      Exit;
    End
    Else
    Begin
      ShowMessage('Arquivo: '+Maskedit1.text + '.pdf, não encontrado');
      Abort;
    End;
    Abort;
  End;

  LbContador.Caption:= 'Aguardando para carregar página ...';
  LbContador.Update;
  {
  if MaskEdit2.Text = 'B' then
    cam1 := F_Menu.Label17.Caption + 'LivroB\'
  else
  if MaskEdit2.Text = 'A' then
    cam1 := F_Menu.Label17.Caption + 'LivroA\'
  else
  if MaskEdit2.Text = 'C' then
    cam1 := F_Menu.Label17.Caption + 'LivroC\'
  Else
    cam1 := F_Menu.Label17.Caption + 'LivroIndP\';  //Pasta Criada para Digitalização de Fichas do Ind Pessoal
   }
   sub := F_Menu.DefineSub(maskedit1.text);
   arq := strzero(maskedit1.text, 6);
  if MaskEdit2.Text = 'A' then
  begin
    cam1 := F_Menu.Label17.Caption + 'LivroA\' ;
    arq := strzero(arq, 6);
  end;

  if MaskEdit2.Text = 'B' then
  begin
    cam1 := F_Menu.Label17.Caption + 'LivroB\';
    arq := strzero(arq, 6);
  end;

  if MaskEdit2.Text = 'C' then
  begin
    cam1 := F_Menu.Label17.Caption + 'LivroC\';
    arq := strzero(arq, 6);
  end;

  if MaskEdit2.Text = 'F' then
  begin
    cam1 := F_Menu.Label17.Caption + 'LivroF\';
    arq := strzero(arq, 6);
  end;

  if  ((MaskEdit2.Text <> 'F') and
       (MaskEdit2.Text <> 'B') and
       (MaskEdit2.Text <> 'C') and
       (MaskEdit2.Text <> 'A')) then
  begin
    arq := strzero(arq, 8);
    sub := strzero(sub, 9);
    cam1 := F_Menu.Label17.Caption + 'LivroIndP\';  //Pasta Criada para Digitalização de Fichas do Ind Pessoal
  end;

  contador := 0;
  primeiroNome := '.999';
  qtdZeros := 6;

  { JOSE 18052023  }
  while qtdZeros <= 14 do
  begin
    if (MaskEdit1.Text <> '') and (edtAverbacao.Text <> '') then
    begin
      pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'_'+edtAverbacao.Text+ '*';
      if CheckBox1.Checked then
        pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'A_'+edtAverbacao.Text+ '*';
    end
    else
    begin
      pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'*';
      if CheckBox1.Checked then
        pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'A*';
    end;

    if FindFirst(cam1 + sub + pArquivo , faAnyFile, Arquivo) = 0 then
    begin
      repeat
        nomeArquivo := Arquivo.Name;
        if copy(nomeArquivo, pos('.', nomeArquivo)+1, 3) < copy(primeiroNome, pos('.', primeiroNome)+1, 3) then
          primeiroNome := nomeArquivo;
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
  end;
  label4.Caption := StrZero(IntToStr(contador), 3); ///FIM
  label11.Caption := StrZero(IntToStr(contador), 4);


  extensao_localiz := StrToInt(label4.Caption);
{ rotina pra verificar se existe a próxima imagem da sequencia. }
  localizou_img := True;
  While localizou_img do
  Begin
    If NOT FileExists(cam1 + sub + StrZero(MaskEdit1.Text,6) + '.' + StrZero(IntToStr(extensao_localiz),3)) then
    Begin
      localizou_img := False;
      extensao_localiz := extensao_localiz -1;
      label4.Caption := StrZero(IntToStr(extensao_localiz),3);
    End
    Else
      inc(extensao_localiz);

//    If extensao_localiz > StrToInt(Label11.Caption) then localizou_img := False;

  End;
  

 { while qtdZeros <= 14 do
  begin
    if (MaskEdit1.Text <> '') and (edtAverbacao.Text <> '') then
    begin
      pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'_'+edtAverbacao.Text+ '*';
      if CheckBox1.Checked then
        pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'A_'+edtAverbacao.Text+ '*';
    end
    else
    begin
      pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'*';
      if CheckBox1.Checked then
        pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'A*';
    end;

    if FindFirst(cam1 + sub + pArquivo , faAnyFile, Arquivo) = 0 then
    begin
      repeat
        nomeArquivo := Arquivo.Name;
        if copy(nomeArquivo, pos('.', nomeArquivo)+1, 3) < copy(primeiroNome, pos('.', primeiroNome)+1, 3) then
          primeiroNome := nomeArquivo;
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
  end;   }
//  label4.Caption := StrZero(IntToStr(contador), 3);
  {else if (Trim(MaskEdit1.Text) <> '') then
  begin
    //img := pesquisaImagem(MaskEdit1.Text, MaskEdit2.Text);
    //if (not fileexists(img)) then
    begin
      qtdZeros := 4;
      while qtdZeros <= 14 do
      begin
        if CheckBox1.Checked then
          pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'A*'
        else
          pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'*';
        if FindFirst(cam1 + sub + pArquivo , faAnyFile, Arquivo) = 0 then
        begin
          {nomeArquivo := Arquivo.Name;
          if nomeArquivo <> '' then
          begin
            arq := copy(nomeArquivo, 0, pos('.', nomeArquivo)-1);
            img := cam1 + sub + nomeArquivo;
            if (not fileexists(img)) then
              img := '';
          end;
          repeat
            contador := contador + 1;
          until FindNext(Arquivo) <> 0;
          FindClose(Arquivo);
          break;}
          {repeat
            nomeArquivo := Arquivo.Name;
            if copy(nomeArquivo, pos('.', nomeArquivo)+1, 3) < copy(primeiroNome, pos('.', primeiroNome)+1, 3) then
              primeiroNome := nomeArquivo;
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
      end;
      FindClose(Arquivo);
    end;
    label4.Caption := StrZero(IntToStr(contador), 3);
  end; }

  {if (Trim(MaskEdit1.Text) <> '') and (Trim(edtAverbacao.Text) <> '') then
    img := pesquisaImagem(MaskEdit1.Text+'_'+edtAverbacao.Text, MaskEdit2.Text)
  else if (Trim(MaskEdit1.Text) <> '') then
    img := pesquisaImagem(MaskEdit1.Text, MaskEdit2.Text)}

  {arq  := inttostr(strtoint(maskedit1.text));

  sub  := DefineSub(maskedit1.text);

  if MaskEdit2.Text = 'B' then
    cam1 := F_Menu.Label17.Caption + 'LivroB\'
  else
    cam1 := F_Menu.Label17.Caption + 'LivroC\';

  if copy(cam1, length(cam1),1) <> '\' then cam1 := cam1 + '\';

  if CheckBox1.Checked then
    img := cam1 + sub + arq + 'A.001'
  else
    img := cam1 + sub + arq + '.001';

  if not fileexists(img) then
  begin
    arq := strzero(arq, 1);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 2);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
    img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 3);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
    img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 4);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 5);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 6);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 7);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    Else
    img := cam1 + sub + arq + '.001';
  End;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 8);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    Else
    img := cam1 + sub + arq + '.001';
  End;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 9);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    Else
    img := cam1 + sub + arq + '.001';
  End;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 10);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    Else
    img := cam1 + sub + arq + '.001';
  End;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 12);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  End;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 13);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  End;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 14);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  End;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 15);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  End;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 16);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  End;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 17);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  End;}


  If MaskEdit2.Text = '' then  /// DESCOMENTADO JOSE 
  Begin
    sub := '';
    if StrToInt(MaskEdit1.Text) < 1000 then
      sub := '00000000\'
    else
    begin
      sub := IntToStr(StrToInt(MaskEdit1.Text));
      sub := Copy(sub, 1, length(sub) - 3);
      sub := floattostr(strtofloat(sub));
      sub := strzero(sub, 8) + '\';
    end;

    img := cam1 + sub + StrZero(MaskEdit1.Text,8) + '.TIF';
  End;


//  memo1.Lines.clear;  JOSE 18052023
//  memo2.lines.clear;


  //arq := strzero(maskedit1.text, 6);


  { JOSE 18052023  }
{ if edtAverbacao.Text <> '' then
  begin
    ListarArquivos(cam1 + sub,false,arq);
    Ordenar(memo1.lines);
    get_averba;
    ordenar(memo2.lines);
   end
   else
   begin
     ListarArquivos(cam1 + sub,false,arq);
     Ordenar(memo1.lines);
     get_averba;
     ordenar(memo2.lines);
   end;
  img  := cam1 + sub + memo2.Lines.Strings[0];
  contadorx:=0;}


  if not fileexists(img) then
  begin
    showmessage('Imagem não localizada ' + img);
    maskedit1.setfocus;
    exit;
  end;

  ImgEdit1.Image := img;
  ImgEdit1.Display;
  ImgEdit1.FitTo(1, True);
  Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 2, 3);
  Label2.update;
  f_ini := Label2.Caption;
  //contar;
  Bitbtn2.enabled := True;
  Bitbtn3.enabled := True;
  Bitbtn4.enabled := True;
  Bitbtn5.enabled := True;
  Bitbtn6.enabled := True;
  Bitbtn7.enabled := True;
  BitBtn11.Enabled:= True;
  BitBtn10.Enabled:= True;
end;

function TF_Loc.pesquisaUltimaImagem(numero, livro: String): String;
var
  arq, cam1, img: String;
  i: integer;
  Arquivo: TSearchRec;
  nomeArquivo: String;
begin
  if livro = 'B' then
    cam1 := F_Menu.Label17.Caption + 'LivroB\'
  else
    cam1 := F_Menu.Label17.Caption + 'LivroF\';
  if copy(cam1, length(cam1),1) <> '\' then
    cam1 := cam1 + '\';

  //sub  := DefineSub(numero);
  arq := strzero(numero, 6);

  if CheckBox1.Checked then
    img := cam1 + sub + arq + 'A.'+StrZero(trim(label4.Caption), 3)
  else
    img := cam1 + sub + arq + '.'+StrZero(trim(label4.Caption), 3);

  if (not FileExists(img)) then
  begin
    img := '';
    for i:= 1 to 17 do
    begin
      arq := strzero(numero, i);
      if CheckBox1.Checked then
        img := cam1 + sub + arq + 'A.'+StrZero((label4.Caption), 3)
      else
        img := cam1 + sub + arq + '.'+StrZero((label4.Caption), 3);
      if fileexists(img) then
        Exit
      else
        img := '';
    end;

    if (img = '') and (numero <> '') and (FindFirst(cam1 + sub + '*'+numero+'*' , faAnyFile, Arquivo) = 0) then
    begin
      repeat
        nomeArquivo := Arquivo.Name;
        if copy(nomeArquivo, pos('.', nomeArquivo)+1, 3) = StrZero(trim(Label4.Caption), 3) then
        begin
          arq := copy(nomeArquivo, 0, pos('.', nomeArquivo)-1);
          img := cam1 + sub + nomeArquivo;
          if (not fileexists(img)) then
            img := ''
          else
          begin
            ImgEdit1.Image := img;
            ImgEdit1.Display;
            Label2.caption := StrZero(trim(Label4.Caption), 3);
          end;
          Exit;
        end;
      until FindNext(Arquivo) <> 0;
      if img = '' then
      begin
        if fileexists(cam1 + sub + nomeArquivo) then
        begin
          arq := copy(nomeArquivo, 0, pos('.', nomeArquivo)-1);
          img := cam1 + sub + nomeArquivo;
          ImgEdit1.Image := img;
          ImgEdit1.Display;
          Label2.caption := copy(nomeArquivo, pos('.', nomeArquivo)+1, 3)
        end;
      end;
    end;
    FindClose(Arquivo);
  end;
  result := img;
end;

function TF_Loc.pesquisaImagem(numero, livro: String): String;
var
  arq, sub, cam1, img: String;
  i: integer;
begin
  img := '';
  if livro = 'B' then
    cam1 := F_Menu.Label17.Caption + 'LivroB\'
  else
    cam1 := F_Menu.Label17.Caption + 'LivroF\';
  if copy(cam1, length(cam1),1) <> '\' then
    cam1 := cam1 + '\';

  sub  := DefineSub(numero);
  arq := strzero(numero, 6);

  if CheckBox1.Checked then
    img := cam1 + sub + arq + 'A.001'
  else
    img := cam1 + sub + arq + '.001';

  //************************************
  if (not FileExists(img)) then
  begin
    for i:= 1 to 11 do
    begin
      arq := strzero(numero, i);
      if CheckBox1.Checked then
        img := cam1 + sub + arq + 'A.001'
      else
        img := cam1 + sub + arq + '.001';
      if fileexists(img) then
        Exit;
    end;

    for i:= 12 to 17 do
    begin
      arq := strzero(numero, i);
      If CheckBox1.Checked then
        img := cam1 + sub + arq + 'A.'+Label2.Caption
      else
        img := cam1 + sub + arq + '.'+Label2.Caption;
      if fileexists(img) then
        Exit;
    end;
  end;
  result := img;

  //************************************

  {if not fileexists(img) then
  begin
    arq := strzero(arq, 1);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 2);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 3);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 4);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 5);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 6);
    if CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 7);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 8);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 9);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 10);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.001'
    else
      img := cam1 + sub + arq + '.001';
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 12);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    else
      img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 13);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    else
      img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 14);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    else
      img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 15);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    else
      img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 16);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    else
      img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  begin
    arq := strzero(arq, 17);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    else
      img := cam1 + sub + arq + '.'+Label2.Caption;
  end;
  result := img;}
end;

procedure TF_Loc.BitBtn7Click(Sender: TObject);
begin
  label2.caption := '0000';
  label4.caption := '0000';
  Bitbtn2.enabled := False;
  Bitbtn3.enabled := False;
  Bitbtn4.enabled := False;
  Bitbtn5.enabled := False;
  Bitbtn6.enabled := False;
  Bitbtn7.enabled := False;
  BitBtn11.Enabled:= False;
  BitBtn10.Enabled:= False;
  Maskedit1.setfocus;
  ImgEdit1.ClearDisplay;
  LbContador.Caption:= 'Aguardando para carregar página ...';
  LbContador.Update;

end;

procedure TF_Loc.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
  if key = 27 then close;  
end;

procedure TF_Loc.BitBtn6Click(Sender: TObject);
begin
  ImgEdit1.FitTo(1, True);
end;

procedure TF_Loc.BitBtn5Click(Sender: TObject);
begin
  ImgEdit1.FitTo(0, True);
end;

procedure TF_Loc.BitBtn2Click(Sender: TObject);
var
  arq1, pxExtensao, nomeArquivo, pArquivo: String;
  Arquivo: TSearchRec;
  qtdZeros: integer;
begin

{      COMENTADO JOSE
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
    label4.caption:= Memo2.lines.strings[contadorx];
    label4.Update;
  end;}


  extensao_convert := StrToInt(Label2.Caption);

  If extensao_convert <= 999 then
    pxExtensao := StrZero(IntToStr(StrToInt(copy(ImgEdit1.Image, pos('.', ImgEdit1.Image)+1, 3))+1), 3)
  Else
    pxExtensao := StrZero(IntToStr(StrToInt(copy(ImgEdit1.Image, pos('.', ImgEdit1.Image)+1, 4))+1), 4);

  extensao_localiz := StrToInt(pxExtensao);
{ rotina pra verificar se existe a próxima imagem da sequencia. }
  localizou_img := False;
  While NOT localizou_img do
  Begin
    If FileExists(cam1 + sub + StrZero(MaskEdit1.Text,6) + '.' + StrZero(IntToStr(extensao_localiz),3)) then
    Begin
      localizou_img := True;
      pxExtensao := StrZero(IntToStr(extensao_localiz),3);
    End
    Else
      inc(extensao_localiz);

    If extensao_localiz > StrToInt(Label4.Caption) then localizou_img := True;
  End;

  If NOT FileExists(cam1 + sub + StrZero(MaskEdit1.Text,6) + '.' + StrZero(IntToStr(extensao_localiz),3)) then
    localizou_img := False;

  qtdZeros := 6;
  while qtdZeros <= 14 do
  begin
    if (MaskEdit1.Text <> '') and (edtAverbacao.Text <> '') then
    begin
      pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'_'+edtAverbacao.Text+ '*';
      if CheckBox1.Checked then
        pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'A_'+edtAverbacao.Text+ '*';
    end
    else
    begin
      pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'*';
      if CheckBox1.Checked then
        pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'A*';
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

  if (localizou_img) AND (extensao_localiz >= 1000) then
  Begin
    img := cam1 + sub + StrZero(MaskEdit1.Text,6) + '.' + StrZero(IntToStr(extensao_localiz),4);
    ImgEdit1.Image := img;
    ImgEdit1.Display;
    Label2.caption := StrZero(pxExtensao,4);
    extensao_localiz := extensao_localiz + 1;
  End;

  if img = '' then
  begin
    ShowMessage('Não existe próxima página.');
    Exit;
  end;
end;

procedure TF_Loc.BitBtn3Click(Sender: TObject);
var
  pxExtensao, nomeArquivo, pArquivo: String;
  Arquivo: TSearchRec;
  qtdZeros: integer;
begin
{ if contadorx < 0 then
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
    label4.caption:= Memo2.lines.strings[contadorx];
    label4.Update;
  end;}

  extensao_convert := StrToInt(Label2.Caption);

  If extensao_convert <= 999 then
    pxExtensao := StrZero(IntToStr(StrToInt(copy(ImgEdit1.Image, pos('.', ImgEdit1.Image)+1, 3))-1), 3)
  Else
    pxExtensao := StrZero(IntToStr(StrToInt(copy(ImgEdit1.Image, pos('.', ImgEdit1.Image)+1, 4))-1), 4);
  extensao_localiz := StrToInt(pxExtensao);

{ rotina pra verificar se existe a próxima imagem da sequencia. }
  localizou_img := False;
  While NOT localizou_img do
  Begin
    If FileExists(cam1 + sub + StrZero(MaskEdit1.Text,6) + '.' + StrZero(IntToStr(extensao_localiz),3)) then
    Begin
      localizou_img := True;
      pxExtensao := StrZero(IntToStr(extensao_localiz),3);
    End
    Else
      extensao_localiz := extensao_localiz - 1; 

    If extensao_localiz <= 0 then localizou_img := True;

  End;

  qtdZeros := 6;
  while qtdZeros <= 14 do
  begin
    if (MaskEdit1.Text <> '') and (edtAverbacao.Text <> '') then
    begin
      pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'_'+edtAverbacao.Text+ '*';
      if CheckBox1.Checked then
        pArquivo :=  StrZero(MaskEdit1.Text, qtdZeros)+'A_'+edtAverbacao.Text+ '*';
    end
    else
    begin
      pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'*';
      if CheckBox1.Checked then
        pArquivo := StrZero(MaskEdit1.Text, qtdZeros)+'A*';
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

  if (localizou_img) then //AND (extensao_localiz >= 1000) then
  Begin
    img := cam1 + sub + StrZero(MaskEdit1.Text,6) + '.' + StrZero(IntToStr(extensao_localiz),4);
    ImgEdit1.Image := img;
    ImgEdit1.Display;
    Label2.caption := StrZero(pxExtensao,4);
    extensao_localiz := extensao_localiz + 1;
  End;

  if img = '' then
  begin
    ShowMessage('Não existe página anterior.');
    Exit;
  end;

  //arq1 := andar(ImgEdit1.Image, '-');
  {if arq1 = '' then
  begin
    extensao := copy(ImgEdit1.Image, pos('.', ImgEdit1.Image)+1, length(ImgEdit1.Image));
    if extensao = '001' then
    begin
      showmessage('Não existe página anterior.');
      exit;
    end
    else if ImgEdit1.Image <> '' then
    begin
      extensao := StrZero(IntToStr(StrToInt(extensao)-1), 3);
      if (Trim(MaskEdit1.Text) <> '') and (Trim(edtAverbacao.Text) = '') then
      begin
        img := pesquisaImagem(MaskEdit1.Text, MaskEdit2.Text);
        if (not fileexists(img)) then
        begin
          if FindFirst(cam1 + sub + '*'+MaskEdit1.Text+'*' , faAnyFile, Arquivo) = 0 then
          begin
            repeat
              nomeArquivo := Arquivo.Name;
              if copy(nomeArquivo, pos('.', nomeArquivo)+1, 3) = extensao then
              begin
                arq := copy(nomeArquivo, 0, pos('.', nomeArquivo)-1);
                img := cam1 + sub + nomeArquivo;
                if (not fileexists(img)) then
                  img := ''
                else
                begin
                  ImgEdit1.Image := img;
                  ImgEdit1.Display;
                  Label2.caption := extensao;
                end;
                Exit;
              end;
            until FindNext(Arquivo) <> 0;
          end;
          FindClose(Arquivo);
        end;
      end
      else
      begin
        ShowMessage('Não existe página anterior.');
        Exit;
      end;
    end;
  end
  else
  begin
    ImgEdit1.Image := arq1;
    ImgEdit1.Display;

    if (length(imgedit1.image)-pos('.',imgedit1.image) < 4) Then
      Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 2, 3)
    else
      Label2.caption := copy(imgedit1.image,length(imgedit1.image) - 3, 4);

    Label2.update;
  end;}
end;


procedure TF_Loc.ImgEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 107 then ImgEdit1.Zoom := ImgEdit1.Zoom + 10;
  if key = 109 then ImgEdit1.Zoom := ImgEdit1.Zoom - 10;
end;

procedure TF_Loc.BitBtn4Click(Sender: TObject);
//var
  //arq_ant, arq1, arq2 : String;
  var
   I : integer;
   objPDF : T_TIFFToPDF;
   s : WordBool;
begin
  Application.CreateForm(TF_OpcoesImp, F_OpcoesImp);
  F_OpcoesImp.ini   := f_ini;
  F_OpcoesImp.atual := IntToStr(StrToInt(Label2.Caption));
  F_OpcoesImp.ult   := IntToStr(StrToInt(Label4.Caption));
  F_OpcoesImp.ShowModal;
  F_OpcoesImp.Destroy;
  F_OpcoesImp := nil;

  Exit; // jose fernando.


 //ImgEdit1.PrintImage(1, 1, 1, false, 0, 0, 0);

  If Not DirectoryExists('C:\Siscart\temp\td\pesquisa_img\') then   
  ForceDirectories('C:\Siscart\temp\td\pesquisa_img\');

  if FileExists('C:\Siscart\temp\td\pesquisa_img\pesquisa.tiff') then
    DeleteFile('C:\Siscart\temp\td\pesquisa_img\pesquisa.tiff');

  if FileExists('C:\Siscart\temp\td\pesquisa_img\Convert\') then
    DeleteFile('C:\Siscart\temp\td\pesquisa_img\Convert\');

  if FileExists('C:\Siscart\temp\td\pesquisa_img\pesq_temp.pdf') then
    DeleteFile('C:\Siscart\temp\td\pesquisa_img\pesq_temp.pdf');

  if MessageDlg('Imprimir todas as páginas ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then
  Begin
    ImgEdit1.PrintImage(1, 1, 1, false, 0, 0, 0);
  end
  else
  Begin
    ImgAdmin1.Image:= 'C:\Siscart\temp\td\pesquisa_img\pesquisa.tiff';
    for I := 0 to Memo2.Lines.Count - 1 do
    Begin
      ImgAdmin1.Append(cam1+sub+Memo2.Lines.Strings[I],1,1);
    end;

    objPDF := T_TIFFToPDF.Create;
    with objPDF do
    begin
      sFolderImage := 'C:\Siscart\temp\td\pesquisa_img\'; // + Nome_TIF;
      sFolderToOut := 'C:\Siscart\temp\td\pesquisa_img\';//'C:\siscart\temp\td\'; //dir_ato; // + Nome_PDF;
      sFileNameSav := 'pesq_temp';
      F_Author      := 'TÍTULOS E DOCUMENTOS';
      F_Producer    := 'Siscart Informática';
      F_Title       := 'Imagem';
      F_Subject     := 'Imagem';

      F_Keywords    := 'Registro: '+ F_Loc.MaskEdit1.Text;

      if GenTIFFToPDFA(self) then
      begin
        DeleteFile('C:\Siscart\temp\td\pesquisa_img\pesquisa.tiff');
       // DeleteFile(dir_out + Nome_TIF);
      end;
      Destroy;


    end;
      //OpenPDF('C:\Siscart\temp\td\pesquisa_img\pesq_temp.pdf', SW_SHOWMAXIMIZED);

    {Application.CreateForm(TfrmImagemDaje, FrmImagemDaje);
    FrmImagemDaje.AcroPDF1.LoadFile('C:\Siscart\temp\td\pesquisa_img\pesq_temp.pdf', s);
    FrmImagemDaje.ShowModal;
    FrmImagemDaje.Destroy;
    FrmImagemDaje := Nil; }
  ShellExecute(Handle, 'open',PChar('C:\Siscart\temp\td\pesquisa_img\pesq_temp.pdf'), nil, nil, SW_SHOW);
  end;
end;

procedure TF_Loc.PrimeiraPgina1Click(Sender: TObject);
begin
  ImgEdit1.Image := Copy(ImgEdit1.Image, 1, length(ImgEdit1.Image) - 3) + '001';
  ImgEdit1.display;
  label2.caption := '001';
end;

procedure TF_Loc.ltimaPgina1Click(Sender: TObject);
begin
  ImgEdit1.Image := Copy(ImgEdit1.Image, 1, length(ImgEdit1.Image) - 3) + label4.caption;
  ImgEdit1.display;
  label2.caption := label4.caption;
end;

procedure TF_Loc.FormActivate(Sender: TObject);
begin
  if label5.caption = 'sim' then
  begin
    F_Loc.BitBtn1Click(F_loc);
    label5.caption := 'nao';
  end;
end;

procedure TF_Loc.DeletarArquivo;
var
  qq : String;
  q : Integer;
Begin
  if (Trim(MaskEdit1.Text) = '') then
  Begin
    ShowMessage('Registro inválido');
    MaskEdit1.SetFocus;
    exit;
  end;

  if (MessageBox(Handle, PChar('Deseja excluir a imagen atual?'), 'EXCLUSÃO DE IMAGENS', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_No) then
    Abort;

  arq  := inttostr(strtoint(maskedit1.text));
  arq := strzero(arq, 6);
  sub  := DefineSub(maskedit1.text);


  if MaskEdit2.Text = 'B' then
    cam1 := F_Menu.Label17.Caption + 'LivroB\'
  else
  cam1 := F_Menu.Label17.Caption + 'LivroF\';

  if copy(cam1, length(cam1),1) <> '\' then
    cam1 := cam1 + '\';

  If CheckBox1.Checked then
    img := cam1 + sub + arq + 'A.'+Label2.Caption
  Else
  img := cam1 + sub + arq + '.'+Label2.Caption;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 3);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 4);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 5);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 6);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 7);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 8);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 9);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;

  if not fileexists(img) then
  Begin
    arq := strzero(arq, 10);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 11);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 12);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 13);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 14);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 15);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 16);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;
  if not fileexists(img) then
  Begin
    arq := strzero(arq, 17);
    If CheckBox1.Checked then
      img := cam1 + sub + arq + 'A.'+Label2.Caption
    Else
    img := cam1 + sub + arq + '.'+Label2.Caption;
  end;


  if not fileexists(img) then
  begin
    showmessage('Imagem não localizada ' + img);
    maskedit1.setfocus;
    exit;
  end
  else
  Begin
    DeleteFile(img);
    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Imagem: '+Label2.Caption+' do  registro: '+MaskEdit1.Text+', protocolo: '+retornaProtocolo(MaskEdit1.Text)+' foi excluída do diretório: '+img, retornaProtocolo(MaskEdit1.Text));
  end;
  F_Loc.ImgEdit1.ClearDisplay;

  MessageBox(Handle, PChar('Arquivos deletados com sucesso !'), 'IMAGENS', MB_OK + MB_ICONWARNING);

end;

procedure TF_Loc.BitBtn9Click(Sender: TObject);
begin
  if (Not(Permissao('acesso113'))) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end
  Else
  Begin
    DeletarArquivo;
  end;

end;

procedure TF_Loc.SetJPGCompression(ACompression: integer; const AInFile: string;  const AOutFile, SequenciaArquivo: string);
begin

end;

procedure TF_Loc.ConverteImagem(sCaminhoArquivoASerConvertido, sCaminhoArquivoConvertido: String);
begin

end;

procedure TF_Loc.BitBtn10Click(Sender: TObject);
var
  nomePesquisa, nomeArquivo, ultimoNome: String;
  qtdZeros: integer;
  Arquivo: TSearchRec;
begin

{ ImgEdit1.Image := cam1 + sub+ memo2.lines.Strings[verificadorx-1];
  ImgEdit1.Display;


  contadorx:= verificadorx;
  Label2.caption := inttostr(contadorx);
  Label2.update;}

  If FileExists(cam1 + sub + StrZero(MaskEdit1.Text,6) + '.' + StrZero(Label4.Caption,4)) then
  Begin
    img := cam1 + sub + StrZero(MaskEdit1.Text,6) + '.' + StrZero(Label4.Caption,4);
    ImgEdit1.Image := img;
    ImgEdit1.Display;
    Label2.caption := StrZero(Label4.Caption,4);
    exit;
  End;

  qtdZeros := 6;
  while qtdZeros <= 14 do
  begin
    if (MaskEdit1.Text <> '') and (edtAverbacao.Text <> '') then
    begin
      nomePesquisa :=  StrZero(MaskEdit1.Text, qtdZeros)+'_'+edtAverbacao.Text+ '*';
      if CheckBox1.Checked then
        nomePesquisa :=  StrZero(MaskEdit1.Text, qtdZeros)+'A_'+edtAverbacao.Text+ '*';
    end
    else
    begin
      nomePesquisa := StrZero(MaskEdit1.Text, qtdZeros)+'*';
      if CheckBox1.Checked then
        nomePesquisa := StrZero(MaskEdit1.Text, qtdZeros)+'A*';
    end;
    ultimoNome := '.000';
    if (FindFirst(cam1 + sub + nomePesquisa, faDirectory, Arquivo) = 0) then
    begin
      img := '';
      repeat
        nomeArquivo := Arquivo.Name;
        if copy(nomeArquivo, pos('.', nomeArquivo)+1, 3) > copy(ultimoNome, pos('.', ultimoNome)+1, 3) then
          ultimoNome := nomeArquivo;
      until FindNext(Arquivo) <> 0;

      arq := copy(ultimoNome, 0, pos('.', ultimoNome)-1);
      img := cam1 + sub + ultimoNome;
      if (not fileexists(img)) then
        img := ''
      else
      begin
        ImgEdit1.Image := img;
        ImgEdit1.Display;
        Label2.caption := copy(img, pos('.', img)+1, 3);
        Exit;
      end;
      break;
    end;
    inc(qtdZeros);
  end;
  FindClose(Arquivo);
end;

procedure TF_Loc.BitBtn11Click(Sender: TObject);
var
  nomeArquivo, nomePesquisa, primeiroNome: String;
  Arquivo: TSearchRec;
  qtdZeros: integer;
begin
{ ImgEdit1.Image := cam1 + sub+ memo2.lines.Strings[0];
  ImgEdit1.Display;
  Label2.caption := '000';
  Label2.update;
  contadorx:= 0;}

  qtdZeros := 6;
  while qtdZeros <= 14 do
  begin
    if (MaskEdit1.Text <> '') and (edtAverbacao.Text <> '') then
    begin
      nomePesquisa :=  StrZero(MaskEdit1.Text, qtdZeros)+'_'+edtAverbacao.Text+ '*';
      if CheckBox1.Checked then
        nomePesquisa :=  StrZero(MaskEdit1.Text, qtdZeros)+'A_'+edtAverbacao.Text+ '*';
    end
    else
    begin
      nomePesquisa := StrZero(MaskEdit1.Text, qtdZeros)+'*';
      if CheckBox1.Checked then
        nomePesquisa := StrZero(MaskEdit1.Text, qtdZeros)+'A*';
    end;
    if (FindFirst(cam1 + sub + nomePesquisa, faDirectory, Arquivo) = 0) then
    begin
      img := '';
      primeiroNome := '.999';
      if (FindFirst(cam1 + sub + nomePesquisa, faDirectory, Arquivo) = 0) then
      begin
        img := '';
        repeat
          nomeArquivo := Arquivo.Name;
          if copy(nomeArquivo, pos('.', nomeArquivo)+1, 3) < copy(primeiroNome, pos('.', primeiroNome)+1, 3) then
            primeiroNome := nomeArquivo;
        until FindNext(Arquivo) <> 0;

        arq := copy(primeiroNome, 0, pos('.', primeiroNome)-1);
        img := cam1 + sub + primeiroNome;
        if (not fileexists(img)) then
          img := ''
        else
        begin
          ImgEdit1.Image := img;
          ImgEdit1.Display;
          Label2.caption := copy(img, pos('.', img)+1, 3);
          Exit;
        end;
        break;
      end;
      break;
    end;
    inc(qtdZeros);
  end;
  FindClose(Arquivo);
end;

procedure TF_Loc.BitBtn12Click(Sender: TObject);
var
  sArquivo: String;
  msg: String;
begin
  msg:= 'Deseja abrir a imagem pelo editor de imagem PAINT do windows?';

  if (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66')Then
  Begin
    if Application.MessageBox( Pchar(msg),'Pesquisa de Imagem',MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = Id_yes then
    begin
      sArquivo:= ImgEdit1.Image;

      ShellExecute(Handle, 'open', PChar('mspaint.exe'), PChar(sArquivo), PChar(sArquivo),SW_SHOW);
    end
    else
    begin
      sArquivo:= 'C:\Windows\System32\shimgvw.dll, ImageView_Fullscreen '+ImgEdit1.Image;

      ShellExecute(0, 'Open', 'C:\Windows\System32\rundll32.exe', PChar(sArquivo), '', SW_NORMAL);
    end;
  end
  Else
  Begin
    sArquivo:= 'C:\Windows\System32\shimgvw.dll, ImageView_Fullscreen '+ImgEdit1.Image;

    ShellExecute(0, 'Open', 'C:\Windows\System32\rundll32.exe', PChar(sArquivo), '', SW_NORMAL);
  end;  

end;


procedure TF_Loc.FormShow(Sender: TObject);
begin
  if (F_Menu.Label39.Caption = '27180782000144') or (F_Menu.Label39.Caption = '27.180.782/0001-44')
     or (F_Menu.Label39.Caption = '27357717000141') or (F_Menu.Label39.Caption = '27.357.717/0001-41')
     or (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66') Then
    CheckBox2.Visible:= True;

end;

procedure TF_Loc.BitBtn13Click(Sender: TObject);
var
  sOrigem,
  sDestino,
  sArquivo,
  arq: String;
  TamanhoStr: Integer;
begin
  //arq:= strzero(MaskEdit1.Text, 6);
  if MaskEdit2.Text = 'A' then
    cam1 := F_Menu.Label17.Caption + 'LivroA\'
  else if MaskEdit2.Text = 'B' then
    cam1 := F_Menu.Label17.Caption + 'LivroB\'
  else
    cam1 := F_Menu.Label17.Caption + 'LivroF\';

  sub := DefineSub(maskedit1.text);
  arq:= strzero(MaskEdit1.Text, 6);
  if CheckBox1.Checked then
    arq := arq + 'A';
  if edtAverbacao.Text <> '' then
    arq := arq +'_'+edtAverbacao.Text;
  img := cam1 + sub + arq + '.'+Strzero(IntToStr(StrToInt(Label4.caption)+1), 3);

  sOrigem := edtDiretorio.Text;
  sDestino:= img;

  if Application.MessageBox('Deseja realmente atualizar o registro?', 'Imagens dos Livros', MB_ICONQUESTION + MB_YESNO) = ID_Yes then
  begin
    try
    //além do executável, é necessário ter a gsdll32.dll e a pasta lib na pasta do sistema
      //WinExec(Pchar(F_Menu.LbCaminhoExportaPDF.Caption + 'econvertePDF_IMG.EXE ' + edtDiretorio.Text +';'+ cam1+sub +';'+ arq +';'+ Strzero(IntToStr(StrToInt(Label4.caption)+1), 3) + ';'), SW_SHOWNORMAL);
      //ShellExecute(Handle,'open',pchar('econvertePDF_IMG.EXE'),pChar(edtDiretorio.Text+';'+ cam1+sub +';'+ arq +';'+ Strzero(IntToStr(StrToInt(Label4.caption)+1), 3) + ';'),pchar(F_Menu.LbCaminhoExportaPDF.Caption),sw_show);
      ShellExecute(Handle,'open',pchar('econvertePDF_IMG.EXE'),pChar(edtDiretorio.Text+';'+ cam1+sub +';'+ arq +';'+ Strzero(IntToStr(StrToInt(Label4.caption)+1), 3) + ';'),pchar('c:\siscart\convertePDFImagem\'), sw_show);
    except
      ShowMessage('Problema ao copiar o arquivo!');
      exit;
    end;
  end;
  {if CheckBox1.Checked then
    img := cam1 + sub + arq + 'A.001'
  else
    img := cam1 + sub + arq + '.' +Strzero(IntToStr(StrToInt(Label4.caption)+1), 3);

  sOrigem := Edit1.Text;
  sDestino:= img;

  if Application.MessageBox('Deseja realmente atualizar o registro?', 'Imagens dos Livros', MB_ICONQUESTION + MB_YESNO) = ID_Yes then
  begin
    if CopyFile(PChar(Edit1.Text), PChar(sDestino), False) then
    begin
      ShowMessage('Arquivo copiado com sucesso!');
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Imagem: '+arq + '.' +Strzero(IntToStr(StrToInt(Label4.caption)+1), 3)+' do  registro: '+MaskEdit1.Text+', protocolo: '+retornaProtocolo(MaskEdit1.Text)+' foi adicionada manualmente ao diretório das imagens: '+img, retornaProtocolo(MaskEdit1.Text));
    end
    else
      ShowMessage('Problema ao copiar o arquivo!');

    contar;
    ImgEdit1.Image := img;
    ImgEdit1.Display;
    ImgEdit1.FitTo(1, True);
  end;}
end;


procedure TF_Loc.BitBtn16Click(Sender: TObject);
begin
  BitBtn1.OnClick(Nil);
  Panel2.Visible:= True;
end;

procedure TF_Loc.BitBtn14Click(Sender: TObject);
begin
  Panel2.Visible:= False;
end;

procedure TF_Loc.BitBtn15Click(Sender: TObject);
begin
  Opendialog1.Execute;
  edtDiretorio.Text:= Opendialog1.FileName;
end;

procedure TF_Loc.BitBtn17Click(Sender: TObject);
var
  qq : String;
  q : Integer;
begin
  if (Not(Permissao('acesso113'))) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end
  Else
  Begin

  if (Trim(MaskEdit1.Text) = '') then
  Begin
    ShowMessage('Registro inválido');
    MaskEdit1.SetFocus;
    exit;
  end;

  if (MessageBox(Handle, PChar('Deseja excluir as imagens?'), 'EXCLUSÃO DE IMAGENS', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_No) then
    Abort;

  if (MessageBox(Handle, PChar('Deseja realmente excluir todas as imagens relacionadas ?'), 'EXCLUSÃO DE IMAGENS', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
  begin
    with F_Loc do
    begin
      qq := copy(imgedit1.image,1,length(imgedit1.image) - 3) + '001';
      q := 0;
      while qq <> '' do
      Begin
      qq := F_Loc.Andar (qq, '+');
      q := q + 1;

       arq  := inttostr(strtoint(maskedit1.text));
       arq := strzero(arq, 6);
       sub  := DefineSub(maskedit1.text);


       if MaskEdit2.Text = 'B' then
         cam1 := F_Menu.Label17.Caption + 'LivroB\'
       else
       cam1 := F_Menu.Label17.Caption + 'LivroF\';

       if copy(cam1, length(cam1),1) <> '\' then
         cam1 := cam1 + '\';

       If CheckBox1.Checked then
         img := cam1 + sub + arq + 'A.00'+inttostr(q)
       Else
       img := cam1 + sub + arq + '.00'+inttostr(q);

       if not fileexists(img) then
       Begin
         arq := strzero(arq, 3);
         If CheckBox1.Checked then
           img := cam1 + sub + arq + 'A.00'+inttostr(q)
         Else
         img := cam1 + sub + arq + '.00'+inttostr(q);
       end;

       if not fileexists(img) then
       Begin
         arq := strzero(arq, 4);
         If CheckBox1.Checked then
           img := cam1 + sub + arq + 'A.00'+inttostr(q)
         Else
         img := cam1 + sub + arq + '.00'+inttostr(q);
       end;

       if not fileexists(img) then
       Begin
         arq := strzero(arq, 5);
         If CheckBox1.Checked then
          img := cam1 + sub + arq + 'A.00'+inttostr(q)
         Else
         img := cam1 + sub + arq + '.00'+inttostr(q);
       end;

       if not fileexists(img) then
       Begin
         arq := strzero(arq, 6);
         If CheckBox1.Checked then
          img := cam1 + sub + arq + 'A.00'+inttostr(q)
         Else
         img := cam1 + sub + arq + '.00'+inttostr(q);
       end;

       if not fileexists(img) then
       Begin
         arq := strzero(arq, 7);
         If CheckBox1.Checked then
           img := cam1 + sub + arq + 'A.00'+inttostr(q)
         Else
         img := cam1 + sub + arq + '.00'+inttostr(q);
       end;

      if not fileexists(img) then
      Begin
       arq := strzero(arq, 8);
       If CheckBox1.Checked then
        img := cam1 + sub + arq + 'A.00'+inttostr(q)
       Else
       img := cam1 + sub + arq + '.00'+inttostr(q);
      end;

      if not fileexists(img) then
      Begin
        arq := strzero(arq, 9);
        If CheckBox1.Checked then
          img := cam1 + sub + arq + 'A.00'+inttostr(q)
        Else
        img := cam1 + sub + arq + '.00'+inttostr(q);
      end;

      if not fileexists(img) then
      Begin
        arq := strzero(arq, 10);
        If CheckBox1.Checked then
          img := cam1 + sub + arq + 'A.00'+inttostr(q)
        Else
        img := cam1 + sub + arq + '.00'+inttostr(q);
      end;

      if not fileexists(img) then
      begin
        showmessage('Imagem não localizada ' + img);
        maskedit1.setfocus;
        exit;
      end
      else
      Begin
        DeleteFile(img);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Imagem: '+Label2.Caption+' do  registro: '+MaskEdit1.Text+', protocolo: '+retornaProtocolo(MaskEdit1.Text)+', foi excluída do diretório assim como seus respectivos anexos '+img, retornaProtocolo(MaskEdit1.Text));
      end
    end;
    Label4.Caption := copy('000' + inttostr(q), length('000' + inttostr(q)) -2, 3);
  end;
  Label2.Caption := '0000';
  Label4.Caption := '0000';

  ImgEdit1.ClearDisplay;
end;
end;  
end;

procedure TF_Loc.get_averba;
var
 x, ipos, linha,tamanho : Integer;
 buffer : string;
begin
 for x := 0 to memo1.Lines.Count - 1 do
 begin
  if edtAverbacao.Text <> '' then
  begin
    if Pos(MaskEdit1.text+'_'+trim(edtAverbacao.Text),memo1.Lines.Strings[x]) > 0 then
    begin
      tamanho := Length(memo1.Lines.Strings[x]);
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

procedure TF_Loc.ListarArquivos(Diretorio: string; Sub: Boolean; Arq:string);
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
         if Pos(Arq+'_'+trim(edtAverbacao.Text),F.Name) > 0 then
         Memo1.Lines.Add(F.Name);
       end
       else
       begin
         if Pos(Arq,F.Name) > 0   then
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

procedure TF_Loc.Ordenar(Valores: tStrings);
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

function TF_Loc.TemAtributo(Attr, Val: Integer): Boolean;
begin
 Result := Attr and Val = Val;
end;

end.
