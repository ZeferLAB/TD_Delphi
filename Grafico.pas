unit Grafico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons;

type
  TF_Grafico = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    Procedure Carregar_Grafico(Sender : TOBJect);    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Grafico: TF_Grafico;
  arq      : String;

implementation

uses DMTD, Menu, QGrafico, FuncGeral, ProcGeral;

{$R *.DFM}

Function Soma(ncliente, a_nome, agencia, Argumento : String) : String;
begin
  Result := '';
  Dm.Soma.Close;
  Dm.Soma.Sql.Clear;
  Dm.Soma.Sql.Add('SELECT COUNT(*) qde FROM td');
  Dm.Soma.Sql.Add('WHERE');
  Dm.Soma.Sql.Add('    data_p  >= ' + Chr(39) + ConvData(F_Grafico.MaskEdit1.Text) + Chr(39));
  Dm.Soma.Sql.Add('AND data_p  <= ' + Chr(39) + ConvData(F_Grafico.MaskEdit2.Text) + Chr(39));
  Dm.Soma.Sql.Add('AND ncliente = ' + ncliente);
  Dm.Soma.Sql.Add('AND a_nome   = ' + Chr(39) + a_nome + Chr(39));
  Dm.Soma.Sql.Add('AND agencia  = ' + Chr(39) + agencia + Chr(39));
  if (Trim(argumento) <> '') then Dm.Soma.Sql.Add('AND ' + argumento);
  Dm.Soma.Open;
  Result := Dm.Soma.FieldByName('qde').asString;
  Dm.Soma.Close;
end;

Procedure TF_Grafico.Carregar_Grafico(Sender : TOBJect);
var
  cliente : Integer;
  empresa, filial, nome : String;
begin
  while (not Dm.ArqAux.Eof) do
  begin
    cliente := 0;
    empresa := '';
    filial  := '';
    nome    := '';
    cliente := Dm.ArqAux.FieldByName('ncliente').asInteger;
    empresa := Trim(Dm.ArqAux.FieldByName('a_nome').asString);
    filial  := Trim(Dm.ArqAux.FieldByName('agencia').asString);
    if (Trim(filial) = '') then
    begin
      nome := empresa;
    end
    else nome := empresa + '(' + filial + ')';
    //
    Dm.ArqAux1.Close;
    Dm.ArqAux1.Sql.Clear;
    Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
    Dm.ArqAux1.Sql.Add('(cliente, periodo, total de notificações, total_notcert, total_notpos, total_notneg,');
    Dm.ArqAux1.Sql.Add('total_codneg03, total_codneg04, total_codneg05, total_codneg06, total_codneg07,');
    Dm.ArqAux1.Sql.Add('total_codneg08, total_codneg09)');
    Dm.ArqAux1.Sql.Add('VALUES(');
    Dm.ArqAux1.Sql.Add(Chr(39) + nome + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Chr(39) + MaskEdit1.Text + ' A ' + MaskEdit2.Text + Chr(39) + ',');
    Dm.ArqAux1.Sql.Add(Soma(IntToStr(cliente), empresa, filial, '') + ',');
    Dm.ArqAux1.Sql.Add(Soma(IntToStr(cliente), empresa, filial, 'sit_not1 <> "" OR sit_not2 <> "" OR sit_not3 <> ""') + ',');
    Dm.ArqAux1.Sql.Add(Soma(IntToStr(cliente), empresa, filial, 'sit_not1 = "P" OR sit_not2 = "P" OR sit_not3 = "P"') + ',');
    Dm.ArqAux1.Sql.Add(Soma(IntToStr(cliente), empresa, filial, 'sit_not1 = "N" OR sit_not2 = "N" OR sit_not3 = "N"') + ',');
    Dm.ArqAux1.Sql.Add(Soma(IntToStr(cliente), empresa, filial, 'cod_ir1 = 3 OR cod_ir2 = 3 OR cod_ir3 = 3') + ',');
    Dm.ArqAux1.Sql.Add(Soma(IntToStr(cliente), empresa, filial, 'cod_ir1 = 4 OR cod_ir2 = 4 OR cod_ir3 = 4') + ',');
    Dm.ArqAux1.Sql.Add(Soma(IntToStr(cliente), empresa, filial, 'cod_ir1 = 5 OR cod_ir2 = 5 OR cod_ir3 = 5') + ',');
    Dm.ArqAux1.Sql.Add(Soma(IntToStr(cliente), empresa, filial, 'cod_ir1 = 6 OR cod_ir2 = 6 OR cod_ir3 = 6') + ',');
    Dm.ArqAux1.Sql.Add(Soma(IntToStr(cliente), empresa, filial, 'cod_ir1 = 7 OR cod_ir2 = 7 OR cod_ir3 = 7') + ',');
    Dm.ArqAux1.Sql.Add(Soma(IntToStr(cliente), empresa, filial, 'cod_ir1 = 8 OR cod_ir2 = 8 OR cod_ir3 = 8') + ',');
    Dm.ArqAux1.Sql.Add(Soma(IntToStr(cliente), empresa, filial, 'cod_ir1 = 9 OR cod_ir2 = 9 OR cod_ir3 = 9'));
    Dm.ArqAux1.Sql.Add(')');
//    ShowMessage(Dm.ArqAux1.Text);
    Dm.ArqAux1.ExecSql;

    Dm.ArqAux.Next;
  end;
end;

procedure TF_Grafico.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Grafico.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (not ValidData(MaskEdit1.Text)) then
    begin
      ShowMessage('Data inválida ');
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT ncliente FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('GROUP BY ncliente');
    Dm.ArqAux.Sql.Add('ORDER BY ncliente');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      Dm.ArqAux.Close;
      ShowMessage('Movimento não encontrado !');
      Exit;
    end;
    ComboBox1.Clear;
    while (not Dm.ArqAux.Eof) do
    begin
      ComboBox1.Items.Add(StrZero(Dm.ArqAux.FieldByName('ncliente').asString, 3) + ' - ' + BuscaNomeEmpresa(Dm.ArqAux.FieldByName('ncliente').asString, False));
      Dm.ArqAux.Next;
    end;
    Dm.ArqAux.Close;
    ComboBox1.SetFocus;
  end;
end;

procedure TF_Grafico.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  ComboBox1.Clear;
  MaskEdit1.SetFocus;
end;

procedure TF_Grafico.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Grafico.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_Grafico.BitBtn1Click(Sender: TObject);
var
  x : Integer;
begin
  if (Trim(ComboBox1.Text) <> '') then
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT ncliente, a_nome, agencia');
    Dm.ArqAux.Sql.Add('FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    data_p  >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND data_p  <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND ncliente = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1, 3))));
    Dm.ArqAux.Sql.Add('GROUP BY ncliente, a_nome, agencia');
    Dm.ArqAux.Sql.Add('ORDER BY ncliente, a_nome, agencia');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      Dm.ArqAux.Close;
      ShowMessage('Movimento não encontrado !');
      MaskEdit1.SetFocus;
      Exit;
    end;
    // Limpando tabela
    Dm.Grafico.Close;
    Dm.Grafico.Sql.Clear;
    Dm.Grafico.Sql.Add('TRUNCATE TABLE grafico');
    Dm.Grafico.ExecSql;
    //********************
    Carregar_Grafico(F_Grafico);
  end
  else
  begin
    arq := '';
    arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'GRAFICO';
    CriaTabela('GRAFICO', arq);
    for x := 0 to (ComboBox1.Items.Count - 1) do
    begin
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT ncliente, a_nome, agencia,');
      Dm.ArqAux.Sql.Add('data_not1, cod_ir1, sit_not1, hora_not1,');
      Dm.ArqAux.Sql.Add('data_not2, cod_ir2, sit_not2, hora_not2,');
      Dm.ArqAux.Sql.Add('data_not3, cod_ir3, sit_not3, hora_not3');
      Dm.ArqAux.Sql.Add('FROM td');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('    data_p  >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
      Dm.ArqAux.Sql.Add('AND data_p  <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
      Dm.ArqAux.Sql.Add('AND ncliente = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1, 3))));
      Dm.ArqAux.Sql.Add('ORDER BY ncliente, a_nome, agencia');
      Dm.ArqAux.Open;
      if (Dm.ArqAux.RecordCount = 0) then
      begin
        Dm.ArqAux.Close;
        ShowMessage('Movimento não encontrado !');
        MaskEdit1.SetFocus;
        Exit;
      end;
      Carregar_Grafico(F_Grafico);
    end;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY recno');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    DestroeTabela(arq);
    ShowMessage('Problemas para carregar o sistema !');
    Exit;
  end;
  Application.CreateForm(TQk_Grafico, Qk_Grafico);
  Qk_Grafico.ShowModal;
  Qk_Grafico.Destroy;
  Qk_Grafico := NIL;
end;

end.
