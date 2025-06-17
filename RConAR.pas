unit RConAR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers;

type
  TF_RConAr = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit3: TMaskEdit;
    Label6: TLabel;
    MaskEdit2: TMaskEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RConAr: TF_RConAr;

implementation

uses Menu, DMTD, QkConAr, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RConAr.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RConAr.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RConAr.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_RConAr.BitBtn1Click(Sender: TObject);
var
  arq, ende, compl : String;
  x, y, lin : Integer;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data Inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT a.p_auxiliar, a.rl, a.registro,');
  Dm.Join.Sql.Add('b.nome, b.endereco, b.cidade, b.bairro, b.cep, b.numero, b.complem, b.estado');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
  Dm.Join.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('    a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  if (StrToInt(MaskEdit3.Text) > 0) AND (StrToInt(MaskEdit2.Text) > 0) then
  begin
    Dm.Join.Sql.Add('AND a.registro >= ' + Trim(MaskEdit3.Text));
    Dm.Join.Sql.Add('AND a.registro <= ' + Trim(MaskEdit2.Text));
  end;
  Dm.Join.Sql.Add('AND a.natureza = 197');  
  Dm.Join.Sql.Add('AND b.situacao = "D"');
  Dm.Join.Sql.Add('ORDER BY a.registro');
  Dm.Join.Open;
  if (Dm.Join.RecordCount = 0) then
  begin
    Dm.Join.Close;  
    ShowMessage('Movimento não encontrado !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '', '') + 'CONAR';
  CriaTabela('CONAR', arq);
  while (not Dm.Join.Eof) do
  begin
    ende  := '';
    compl := '';
    ende  := Dm.Join.FieldByName('endereco').asString;
    if (Trim(Dm.Join.FieldByName('numero').asString) <> '') then
    begin
      ende := ende + ' Nº ' + Dm.Join.FieldByName('numero').asString;
    end;
    if (Trim(Dm.Join.FieldByName('complem').asString) <> '') then
    begin
      ende := Trim(ende) + ' ' + Dm.Join.FieldByName('complem').asString + ' ';
    end;  
    if (Trim(Dm.Join.FieldByName('bairro').asString) <> '') then
    begin
      ende := Trim(ende) + ' ' + Dm.Join.FieldByName('bairro').asString;
    end;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
    Dm.ArqAux.Sql.Add('(indexador, nome, endereco, bairro, cep, rl)');
    Dm.ArqAux.Sql.Add('VALUES(');
    Dm.ArqAux.Sql.Add(Dm.Join.FieldByName('registro').asString + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + TirarTudo(Dm.Join.FieldByName('nome').asString, Chr(39), '', '') + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + TirarTudo(ende, Chr(39), '','') + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + TirarTudo(compl, Chr(39), '', '') + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + FormataCep(Dm.Join.FieldByName('cep').asString) + ' - ' + Dm.Join.FieldByName('cidade').asString + ' - ' + Dm.Join.FieldByName('estado').asString + Chr(39) + ',');
//    Dm.ArqAux.Sql.Add(Chr(39) + 'RZ' + Dm.Join.FieldByName('rl').asString + 'BR' + Chr(39) + ')');
    Dm.ArqAux.Sql.Add(Chr(39) + 'RC' + Dm.Join.FieldByName('rl').asString + 'BR' + Chr(39) + ')');
    Dm.ArqAux.ExecSQL;
    Dm.Join.Next;
  end;
  Dm.Join.Close;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY indexador');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    ShowMessage('Problemas para carregar o movimento !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  QrDestroi;  
  Application.CreateForm(TQk_ConAR, Qk_ConAR);
  Qk_ConAR.QuickRep1.Preview;
  Qk_ConAR.Destroy;
  Qk_ConAR := NIL;
  DestroeTabela(arq);
end;

procedure TF_RConAr.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text    := '';
  maskedit3.text    := '';
  MaskEdit2.Text    := '01';
  MaskEdit2.Enabled := False;
  maskedit1.setfocus;
end;

procedure TF_RConAr.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
end;

procedure TF_RConAr.MaskEdit2Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit2.Text)) then MaskEdit2.Text := '0';
end;

procedure TF_RConAr.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RConAr.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure TF_RConAr.FormActivate(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(Date);
end;

procedure TF_RConAr.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.setfocus;
end;

end.
