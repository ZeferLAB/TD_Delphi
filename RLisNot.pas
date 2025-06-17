unit RLisNot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_RLisNot = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    ComboBox1: TComboBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RLisNot: TF_RLisNot;
  tpbx    : String;

implementation

uses DMTD, Menu, QkLisNot, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RLisNot.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RLisNot.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit1.SetFocus;
end;

procedure TF_RLisNot.BitBtn1Click(Sender: TObject);
var
  arq : String;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Td.Close;
  Dm.Td.Sql.Clear;
  Dm.Td.Sql.Add('SELECT registro, protocolo FROM td');
  Dm.Td.Sql.Add('WHERE');
  Dm.Td.Sql.Add('    data_p   = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.Td.Sql.Add('AND natureza = ' + IntToStr(StrToInt(Trim(Copy(ComboBox1.Text, 1,3)))));
  Dm.Td.Sql.Add('ORDER BY registro');
  Dm.Td.Open;
  if (Dm.Td.RecordCount = 0) then
  begin
    Dm.Td.Close;
    ShowMessage('Registros não localizado !');
    Exit;
  end;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '', '') + 'LISNOT';
  CriaTabela('LISNOT', arq);
  while (not Dm.Td.Eof) do
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
    Dm.ArqAux.Sql.Add('(indexador, protocolo, notificante, notificado)');
    Dm.ArqAux.Sql.Add('VALUES(');
    Dm.ArqAux.Sql.Add(Dm.Td.FieldByName('registro').asString + ',');
    Dm.ArqAux.Sql.Add(Dm.Td.FieldByName('protocolo').asString + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + TirarTudo(Busca_NomePessoal(Dm.Td.FieldByName('protocolo').asString, 'R'), Chr(39), '','') + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + TirarTudo(Busca_NomePessoal(Dm.Td.FieldByName('protocolo').asString, 'D'), Chr(39), '','') + Chr(39) + ')');
    Dm.ArqAux.ExecSql;
    Dm.Td.Next;
  end;
  Dm.Td.Close;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY recno');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    DestroeTabela(arq);
    ShowMessage('Problemas carregar o movimento.');
    Exit;
  end;
  Application.CreateForm(TQk_LisNot, Qk_LisNot);
  Qk_LisNot.QrLabel1.Caption := F_Menu.Caption;
  if (Copy(ComboBox1.Text, 1,2) = '96') then
  begin
    Qk_LisNot.QrLabel5.Caption := 'LISTAGEM DE NOTIFICAÇÕES REGISTRADAS EM ' + MaskEdit1.Text + ' - NATUREZA 96.';
  end
  else Qk_LisNot.QrLabel5.Caption := 'LISTAGEM DE NOTIFICAÇÕES REGISTRADAS EM ' + MaskEdit1.Text + ' - NATUREZA 197.';
  Qk_LisNot.QuickRep1.Preview;
  Qk_LisNot.Destroy;
  Qk_LisNot := NIL;
  Dm.ArqAux.Close; 
  DestroeTabela(arq);
end;

procedure TF_RLisNot.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RLisNot.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RLisNot.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RLisNot.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
end;

procedure TF_RLisNot.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RLisNot.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

end.
