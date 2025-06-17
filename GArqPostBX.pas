unit GArqPostBX;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, jpeg;

type
  TF_GArqPostBX = class(TForm)
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
  F_GArqPostBX  : TF_GArqPostBX;
  tpbx    : String;
  F1      : TextFile;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

Procedure Grava_linha(linha : String);
begin
  WriteLn(F1, linha);
end;

Procedure TF_GArqPostBX.GerarArquivoCorreio(Sender : TOBject);
var
  linha, docdev, nomdev, arqu : String;
  qde   : Integer;
  vr : Currency;
begin
  SaveDialog1.InitialDir := F_Menu.Label33.Caption;
  SaveDialog1.FileName   := 'B' + FormatDateTime('yymmdd', StrToDate(MaskEdit4.Text)) + '.014';
   if (FileExists(SaveDialog1.InitialDir + SaveDialog1.FileName)) then
    DeleteFile(SaveDialog1.InitialDir + SaveDialog1.FileName);
  if (SaveDialog1.Execute) then
  begin
    AssignFile(F1, SaveDialog1.FileName);
    ReWrite(F1);
    linha := '';
    qde   := 0;
    vr    := 0.00;
    while (not Dm.Join.Eof) do
    begin
      linha :=         StrZero(Trim(Dm.Join.FieldByName('rl').asString), 9);
      linha := linha + FormatDateTime('yyyymmdd', Dm.Join.FieldByName('data_not1').asDateTime);
      if (Trim(Dm.Join.FieldByName('codcorreio').asString) = '') then
      begin
        linha := linha + '23';
        linha := linha + StrBranco('', 21, 'D');
        linha := linha + StrBranco(Trim(Dm.Join.FieldByName('motivo').asString), 60, 'D');
      end
      else
      begin
        linha := linha + StrZero(Dm.Join.FieldByName('codcorreio').asString, 2);
        linha := linha + StrBranco(Trim(Dm.Join.FieldByName('motivo').asString), 21, 'D');
        linha := linha + StrBranco('', 60, 'D');
      end;
      Grava_Linha(linha);
      Dm.Join.Next;
    end;
    Dm.Join.Close;
    CloseFile(F1);
  end;
end;

procedure TF_GArqPostBX.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_GArqPostBX.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit4.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit2.Text := '0';
  MaskEdit3.Text := '0';
  MaskEdit1.SetFocus;
end;

procedure TF_GArqPostBX.BitBtn1Click(Sender: TObject);
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
  Dm.Join.Sql.Add('SELECT A.MOTIVO, A.CODCORREIO, B.RL, B.DATA_NOT1, B.COD_IR1');
  Dm.Join.Sql.Add('FROM cad_ir A, td B');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('A.CODIGO = B.COD_IR1');
  Dm.Join.Sql.Add('AND B.DATA_NOT1 >= ' + QuotedStr(ConvData(MaskEdit1.Text)));
  Dm.Join.Sql.Add('AND B.DATA_NOT1 <= ' + QuotedStr(ConvData(MaskEdit4.Text)));
  if (StrToInt(MaskEdit2.Text) > 0) AND
     (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.Join.Sql.Add('AND B.REGISTRO >= ' + Trim(MaskEdit2.Text));
    Dm.Join.Sql.Add('AND B.REGISTRO <= ' + Trim(MaskEdit3.Text));
  end;
  Dm.Join.Sql.Add('AND B.NATUREZA   = 197');
  Dm.Join.Sql.Add('ORDER BY B.RL');
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

procedure TF_GArqPostBX.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_GArqPostBX.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
end;

procedure TF_GArqPostBX.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_GArqPostBX.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_GArqPostBX.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_GArqPostBX.MaskEdit2Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit2.Text)) then MaskEdit2.Text := '0';
end;

procedure TF_GArqPostBX.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure TF_GArqPostBX.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_GArqPostBX.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

end.
