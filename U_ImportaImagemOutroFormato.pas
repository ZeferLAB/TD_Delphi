unit U_ImportaImagemOutroFormato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, WPObj, FileCtrl;

type
  TF_ImportaImagem = class(TForm)
    StatusBar1: TStatusBar;
    Label1: TLabel;
    MkNumero: TMaskEdit;
    BitBtn1: TBitBtn;
    lbMsg: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MkNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function VerificaArquivosBMP(sCaminhoDoArquivo, sNumeroArquivo: String): String;
    function DefineSub(arq_img : String) : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ImportaImagem: TF_ImportaImagem;

implementation

uses U_IncluiImagemEditor, DMTD;

{$R *.DFM}

procedure TF_ImportaImagem.FormDestroy(Sender: TObject);
begin
  Sender:= Nil;
end;            

procedure TF_ImportaImagem.BitBtn1Click(Sender: TObject);
begin
  if (MkNumero.Text = '') or (ComboBox1.Text = '')  Then
  Begin
    Application.messagebox(pchar('Informe o número do registro e lívro para prosseguir!'),'ATENÇÃO', MB_ICONINFORMATION);
    Abort;
  End
  Else
  Begin
    //lbMsg.Caption:= 'Processando as imagens, por favor, aguarde ...';
    //F_IncluiImagemEditor.Refresh;
    VerificaArquivosBMP(Dm.Dir_CamImagensNotificBMP, MkNumero.Text);
  End;

end;

Function Strzero(Numero : String;Casas : Integer) : String;
Begin
  result := stringofchar('0',(casas-length(trim(numero)))) + trim(numero);
end;

function GetFileList(const Path: string): TStringList;
 var
   I: Integer;
   SearchRec: TSearchRec;
 begin
   Result := TStringList.Create;
   try
     I := FindFirst(Path, 0, SearchRec);
     while I = 0 do
     begin
       Result.Add(SearchRec.Name);
       I := FindNext(SearchRec);
     end;
   except
     Result.Free;
     raise;
   end;
end;

Function TF_ImportaImagem.DefineSub(arq_img : String) : String;
Begin
  arq_img := '000000' + inttostr(strtoint(arq_img));
  arq_img := copy(arq_img, length(arq_img) - 5, 6);
  if strtoint(arq_img) < 1000 then
    result := '0000\'
  else
  begin
    result := '0000' + inttostr(strtoint(copy(arq_img,1,3)));
    result := copy(result, length(result) - 3, 4) + '\';
  end;
end;

function TF_ImportaImagem.VerificaArquivosBMP(sCaminhoDoArquivo, sNumeroArquivo: String): String;
var
  i, x: Integer;
  sListaArqs: TStringList;
  c: cardinal;
  teste,
  sNome,
  NomeDoArquivo,
  sub,
  livro,
  diretorioTemp: String;
begin
  result:= '';

  sListaArqs    :=TStringList.Create;
  diretorioTemp := 'c:\siscart\temp\td\imgcel\';
  sListaArqs    := GetFileList(diretorioTemp+'*.jpg');

  Dm.DirList(diretorioTemp+'*.jpg',sListaArqs, sNumeroArquivo);

  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;

  if not DirectoryExists('c:\siscart\temp\td\imgcel\') then
    ForceDirectories('c:\siscart\temp\td\imgcel\');

  if ComboBox1.Text = 'A' then
  begin
    livro := 'livroA\';
    livro := 'livroA\'
  end
  else
  if ComboBox1.Text = 'B' then
  begin
    livro := 'livroB\';
    livro := 'livroB\'
  end
  else
  if ComboBox1.Text = 'C' then
  begin
    livro := 'livroC\';
    livro := 'livroC\'
  end;

  If sListaArqs.Count>0 Then
  Begin
    Try
      for i := 1 to sListaArqs.Count do
      Begin
        ExisteArquivo:=True;

        sub := DefineSub(MkNumero.text);

        if not DirectoryExists(Dm.Configur.FieldByName('imagens').asString + livro+'\'+sub) then
          ForceDirectories(Dm.Configur.FieldByName('imagens').asString + livro+'\'+sub);

        CopyFile(Pchar(diretorioTemp+DM.ExtractName(sListaArqs[i-1])+'.jpg'), PChar(Dm.Configur.FieldByName('imagens').asString+livro+sub+Strzero(MkNumero.Text, 6)+'.'+Strzero(inttostr(i), 3)), True);

        RenameFile(PChar(Dm.Configur.FieldByName('imagens').asString+sub+Strzero(DM.ExtractName(sListaArqs[i-1]), 6)+'.'+Strzero(inttostr(i), 3)), Dm.Configur.FieldByName('imagens').asString+livro+sub+Strzero(MkNumero.Text, 6)+'.'+Strzero(inttostr(i), 3));

        F_ImportaImagem.lbMsg.Caption:= 'Aguarde enquanto a imagem: '+DM.ExtractName(sListaArqs[i-1])+', está sendo processada ...';
        F_ImportaImagem.Refresh;
        DeleteFile(diretorioTemp+DM.ExtractName(sListaArqs[i-1])+'.jpg');
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
  if F_ImportaImagem <> Nil Then
    F_ImportaImagem.Close;

end;

procedure TF_ImportaImagem.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MkNumero.setfocus;
end;

procedure TF_ImportaImagem.MkNumeroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.setfocus;
end;

end.
