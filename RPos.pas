unit RPos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_RPos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    SaveDialog1: TSaveDialog;
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
    procedure ComboBox1Enter(Sender: TObject);
    Procedure GerarArquivoCorreio(Sender : TOBject; Tipo : Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RPos  : TF_RPos;
  tpbx    : String;
  F1      : TextFile;

implementation

uses DMTD, Menu, QkRPos, FuncGeral;

{$R *.DFM}

Procedure Grava_linha(linha : String);
begin
  WriteLn(F1, linha);
end;

Procedure TF_RPos.GerarArquivoCorreio(Sender : TOBject; Tipo : Integer);
var
  linha, docdev, nomdev, arqu : String;
  qde   : Integer;
  vr : Currency;
begin
  SaveDialog1.InitialDir := F_Menu.Label33.Caption;
  SaveDialog1.FileName   := FormatDateTime('ddmmyy', StrToDate(MaskEdit1.Text)) + '.014';
  if (SaveDialog1.Execute) then
  begin
    AssignFile(F1, SaveDialog1.FileName);
    ReWrite(F1);
    linha := '';
    qde   := 0;
    vr    := 0.00;
    While (not Dm.Join.Eof) do
    Begin
      linha :=         StrBranco(Trim(Dm.Join.FieldByName('rl').asString), 9, 'E');
      linha := linha + StrBranco(Trim(Dm.Join.FieldByName('nome').asString), 44, 'D');
      linha := linha + StrBranco(Trim(Dm.Join.FieldByName('endereco').asString + ' ' + Dm.Join.FieldByName('numero').asString + ' ' + Dm.Join.FieldByName('complem').asString), 44, 'D');
      linha := linha + StrBranco(Trim(Dm.Join.FieldByName('cidade').asString), 15, 'D');
      linha := linha + StrBranco(Trim(Dm.Join.FieldByName('estado').asString), 2, 'D');
      linha := linha + StrBranco(Trim(Dm.Join.FieldByName('cep').asString), 8, 'D');
      linha := linha + StrBranco(Trim(Busca_NomePessoal(Dm.Join.FieldByName('p_auxiliar').asString, 'R')), 47, 'D');
      linha := linha + StrZero(Dm.Join.FieldByName('p_auxiliar').asString, 7);
      linha := linha + StrZero(Dm.Join.FieldByName('registro').asString, 7);
      linha := linha + FormatDateTime('yyyymmdd', StrToDate(MaskEdit1.Text));
      Grava_Linha(linha);
      Dm.Join.Next;
    end;
    Dm.Join.Close;
    CloseFile(F1);
  end;  
end;

procedure TF_RPos.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RPos.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit1.SetFocus;
end;

procedure TF_RPos.BitBtn1Click(Sender: TObject);
var
  arq : String;
  ende, compl, linha : String;
begin
  if (StrToInt(MaskEdit2.Text) = 0) OR
     (StrToInt(MaskEdit3.Text) = 0) then
  begin
    ShowMessage('Nº de registro inválido !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT a.p_auxiliar, a.registro, a.data_p, a.rl,a.a_nome,');
  Dm.Join.Sql.Add('b.nome, b.endereco, b.numero, b.bairro, b.cidade, b.cep, b.complem, b.estado');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b ON (a.p_auxiliar = b.p_auxiliar)');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('    a.registro >= ' + Trim(MaskEdit2.Text));
  Dm.Join.Sql.Add('AND a.registro <= ' + Trim(MaskEdit3.Text));
  Dm.Join.Sql.Add('AND a.natureza  = 197');
  Dm.Join.Sql.Add('AND b.situacao  = "D"');
  if (Trim(ComboBox1.Text) <> '') then
  begin
    if (Trim(ComboBox1.Text) = 'SÃO PAULO') then
    begin
      Dm.Join.Sql.Add('AND b.estado = "SP"');
    end
    else Dm.Join.Sql.Add('AND b.estado <> "SP"');
  end;  
  Dm.Join.Sql.Add('ORDER BY a.registro');
  Dm.Join.Open;
  if (Dm.Join.RecordCount = 0) then
  begin
    Dm.Join.Close;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;
  if CheckBox1.Checked then
  begin
    GerarArquivoCorreio(F_RPos, 0);
  end
  else
  begin
    Application.CreateForm(TQk_RPos, Qk_RPos);
    Qk_RPos.QrLabel1.Caption := F_Menu.Label29.Caption;
    Qk_RPos.QrLabel5.Caption := 'LISTAGEM DE AR ENVIADOS PARA O CORREIO EM ' + MaskEdit1.Text;
    Qk_RPos.QuickRep1.Preview;
    Qk_RPos.Destroy;
    Qk_RPos := NIL;
  end;  
end;

procedure TF_RPos.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RPos.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
end;

procedure TF_RPos.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_RPos.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RPos.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RPos.MaskEdit2Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit2.Text)) then MaskEdit2.Text := '0';
end;

procedure TF_RPos.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure TF_RPos.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RPos.ComboBox1Enter(Sender: TObject);
begin
  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

end.
