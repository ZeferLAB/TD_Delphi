unit GArqPost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, jpeg;

type
  TF_GArqPost = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    SaveDialog1: TSaveDialog;
    Label5: TLabel;
    MaskEdit4: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ControlBar1: TControlBar;
    Label34: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure GerarArquivoCorreio(Sender : TOBject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_GArqPost  : TF_GArqPost;
  tpbx    : String;
  F1      : TextFile;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

Procedure Grava_linha(linha : String);
begin
  WriteLn(F1, linha);
end;

Procedure TF_GArqPost.GerarArquivoCorreio(Sender : TOBject);
var
  linha, docdev, nomdev, arqu : String;
  qde   : Integer;
  vr : Currency;
begin
  SaveDialog1.InitialDir := F_Menu.Label33.Caption;
  SaveDialog1.FileName   := 'E' + FormatDateTime('yymmdd', StrToDate(MaskEdit4.Text)) + '.014';
   if (FileExists(SaveDialog1.InitialDir + SaveDialog1.FileName)) then
    DeleteFile(SaveDialog1.InitialDir + SaveDialog1.FileName);
  if (SaveDialog1.Execute) then
  begin
    AssignFile(F1, SaveDialog1.FileName);
    ReWrite(F1);
    linha := '';
    qde   := 0;
    vr    := 0.00;
    While (not Dm.Join.Eof) do
    Begin
      linha :=         StrZero(Trim(Dm.Join.FieldByName('rl').asString), 9);
      linha := linha + StrBranco(Trim(Dm.Join.FieldByName('nome').asString), 44, 'D');
      linha := linha + StrBranco(Trim(Dm.Join.FieldByName('endereco').asString + ' ' + Dm.Join.FieldByName('numero').asString + ' ' + Dm.Join.FieldByName('complem').asString), 44, 'D');
      linha := linha + StrBranco(Trim(Dm.Join.FieldByName('cidade').asString), 15, 'D');
      linha := linha + StrBranco(Trim(Dm.Join.FieldByName('estado').asString), 2, 'D');
      linha := linha + StrBranco(Trim(Dm.Join.FieldByName('cep').asString), 8, 'D');
      linha := linha + StrBranco(Trim(Busca_NomePessoal(Dm.Join.FieldByName('p_auxiliar').asString, 'R')), 47, 'D');
      linha := linha + StrZero(Dm.Join.FieldByName('registro').asString, 7);
      linha := linha + StrZero(Dm.Join.FieldByName('p_auxiliar').asString, 7);
      linha := linha + FormatDateTime('yyyymmdd', StrToDate(MaskEdit1.Text));
      Grava_Linha(linha);
      Dm.Join.Next;
    end;
    Dm.Join.Close;
    CloseFile(F1);
  end;  
end;

procedure TF_GArqPost.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_GArqPost.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit4.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit2.Text := '0';
  MaskEdit3.Text := '0';
  MaskEdit1.SetFocus;
end;

procedure TF_GArqPost.BitBtn1Click(Sender: TObject);
var
  arq : String;
  ende, compl, linha : String;
begin
  if (not ValidData(MaskEdit1.Text)) OR
     (not ValidData(MaskEdit4.Text)) then
  begin
    ShowMessage('Data de registro inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT a.p_auxiliar, a.registro, a.data_p, a.rl,');
  Dm.Join.Sql.Add('b.nome, b.endereco, b.numero, b.bairro, b.cidade, b.cep, b.complem, b.estado');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
  Dm.Join.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('    a.DATA_P >= ' + QuotedStr(ConvData(MaskEdit1.Text)));
  Dm.Join.Sql.Add('AND a.DATA_P <= ' + QuotedStr(ConvData(MaskEdit4.Text)));
  if (StrToInt(MaskEdit2.Text) > 0) AND
     (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.Join.Sql.Add('AND a.registro >= ' + Trim(MaskEdit2.Text));
    Dm.Join.Sql.Add('AND a.registro <= ' + Trim(MaskEdit3.Text));
  end;  
  Dm.Join.Sql.Add('AND a.natureza   = 197');
  Dm.Join.Sql.Add('AND b.situacao   = "D"');
  Dm.Join.Sql.Add('ORDER BY a.RL');
  Dm.Join.Open;
  if (Dm.Join.RecordCount = 0) then
  begin
    Dm.Join.Close;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;
  GerarArquivoCorreio(Sender);
  Dm.Join.Close;
end;

procedure TF_GArqPost.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_GArqPost.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
end;

procedure TF_GArqPost.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_GArqPost.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_GArqPost.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_GArqPost.MaskEdit2Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit2.Text)) then MaskEdit2.Text := '0';
end;

procedure TF_GArqPost.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure TF_GArqPost.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_GArqPost.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

end.
