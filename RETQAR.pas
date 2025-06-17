unit RETQAR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers, jpeg;

type
  TF_RETQAR = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit3: TMaskEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label4: TLabel;
    Label6: TLabel;
    MaskEdit2: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
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
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RETQAR: TF_RETQAR;

implementation

uses Menu, DMTD, QkEtqAR, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RETQAR.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RETQAR.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RETQAR.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_RETQAR.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then Combobox2.SetFocus;
end;

procedure TF_RETQAR.BitBtn1Click(Sender: TObject);
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
  if (StrToInt(MaskEdit3.Text) > 0) AND (StrToInt(MaskEdit2.Text) > 0) then
  begin
    Dm.Join.Sql.Add('a.registro >= ' + Trim(MaskEdit3.Text));
    Dm.Join.Sql.Add('AND a.registro <= ' + Trim(MaskEdit2.Text));
  end
  else
  begin
    Dm.Join.Sql.Add('    a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  end;
  Dm.Join.Sql.Add('AND ((a.natureza = 197) or (a.natureza = 300))');
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
  lin := 0;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '', '') + 'ETQ';
  CriaTabela('ETQ', arq);
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Open;
  if (StrToInt(ComboBox3.Text) > 2) then
  begin
    for x := 1 to (StrToInt(ComboBox3.Text) div 2) do
    begin
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
      Dm.ArqAux.Sql.Add('(linha)');
      Dm.ArqAux.Sql.Add('VALUES(');
      Dm.ArqAux.Sql.Add(IntToStr(x));
      Dm.ArqAux.Sql.Add(')');
      Dm.ArqAux.ExecSQL;
      lin := lin + 1;
    end;
    Dm.ArqAux.Close;
  end
  else
  begin
    if ((StrToInt(ComboBox3.Text) mod 2) = 0) then
    begin
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
      Dm.ArqAux.Sql.Add('(linha)');
      Dm.ArqAux.Sql.Add('VALUES(');
      Dm.ArqAux.Sql.Add('1');
      Dm.ArqAux.Sql.Add(')');
      Dm.ArqAux.ExecSQL;
      lin := 1;
    end;  
  end;
  x := 0;
  y := (StrToInt(ComboBox3.Text) mod 2);
  while (not Dm.Join.Eof) do
  begin
    for x := 1 to 1 do
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
        ende := ende + ' ' + Dm.Join.FieldByName('complem').asString;
      end;
      compl := '';
      if (Trim(Dm.Join.FieldByName('bairro').asString) <> '') then
      begin
        compl := Dm.Join.FieldByName('bairro').asString;
      end;      
      if (y = 1) then
      begin
        lin    := lin + 1;
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
        Dm.ArqAux.Sql.Add('(nome0, endereco0, complemento0, cidade0, cep0, texto0, rl0, linha)');
        Dm.ArqAux.Sql.Add('VALUES(');
        Dm.ArqAux.Sql.Add(Chr(39) + TirarTudo(Dm.Join.FieldByName('nome').asString, Chr(39), '', '') + Chr(39) + ',');
        Dm.ArqAux.Sql.Add(Chr(39) + TirarTudo(ende, Chr(39), '', '') + Chr(39) + ',');
        Dm.ArqAux.Sql.Add(Chr(39) + TirarTudo(compl, Chr(39), '', '') + Chr(39) + ',');
        Dm.ArqAux.Sql.Add(Chr(39) + TirarTudo(Dm.Join.FieldByName('cidade').asString, Chr(39), '', '') + ' - ' + Dm.Join.FieldByName('estado').asString + Chr(39) + ',');
        Dm.ArqAux.Sql.Add(Chr(39) + 'CEP ' + FormataCep(Dm.Join.FieldByName('cep').asString) + Chr(39) + ',');
        Dm.ArqAux.Sql.Add(Chr(39) + 'Registrado e Microfilmado sob o Nº ' + Copy(StrZero(Dm.Join.FieldByName('registro').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.Join.FieldByName('registro').asString, 6), 4,3) + Chr(39) + ',');
//        Dm.ArqAux.Sql.Add(Chr(39) + 'RZ' + Dm.Join.FieldByName('rl').asString + 'BR' + Chr(39) + ',');
        Dm.ArqAux.Sql.Add(Chr(39) + F_Menu.Label34.Caption + Dm.Join.FieldByName('rl').asString + 'BR' + Chr(39) + ',');
        Dm.ArqAux.Sql.Add(IntToStr(lin) + ')');
        Dm.ArqAux.ExecSQL;
        y := 0;
      end
      else
      begin
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('UPDATE ' + arq + ' SET');
        Dm.ArqAux.Sql.Add('nome1        = ' + Chr(39) + TirarTudo(Dm.Join.FieldByName('nome').asString, Chr(39), '', '') + Chr(39) + ',');
        Dm.ArqAux.Sql.Add('endereco1    = ' + Chr(39) + TirarTudo(ende, Chr(39), '', '') + Chr(39) + ',');
        Dm.ArqAux.Sql.Add('complemento1 = ' + Chr(39) + TirarTudo(compl, Chr(39), '', '') + Chr(39) + ',');
        Dm.ArqAux.Sql.Add('cidade1      = ' + Chr(39) + TirarTudo(Dm.Join.FieldByName('cidade').asString, Chr(39), '', '') + ' - ' + Dm.Join.FieldByName('estado').asString + Chr(39) + ',');
        Dm.ArqAux.Sql.Add('cep1         = ' + Chr(39) + 'CEP ' + FormataCep(Dm.Join.FieldByName('cep').asString) + Chr(39) + ',');
        Dm.ArqAux.Sql.Add('texto1       = ' + Chr(39) + 'Registrado e Microfilmado sob o Nº ' + Copy(StrZero(Dm.Join.FieldByName('registro').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.Join.FieldByName('registro').asString, 6), 4,3) + Chr(39) + ',');
       // Dm.ArqAux.Sql.Add('rl1          = ' + Chr(39) + 'RZ' + Dm.Join.FieldByName('rl').asString + 'BR' + Chr(39));
//        Dm.ArqAux.Sql.Add('rl1          = ' + Chr(39) + 'RC' + Dm.Join.FieldByName('rl').asString + 'BR' + Chr(39));
        Dm.ArqAux.Sql.Add('rl1          = ' + Chr(39) + F_Menu.Label34.Caption + Dm.Join.FieldByName('rl').asString + 'BR' + Chr(39));
        Dm.ArqAux.Sql.Add('WHERE');
        Dm.ArqAux.Sql.Add('linha = ' + IntToStr(lin));              
        Dm.ArqAux.ExecSQL;
        y := 1;
      end;
    end;
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
  Application.CreateForm(TQk_EtqAR, Qk_EtqAR);
  Qk_EtqAR.QuickRep1.Preview;
  Qk_EtqAR.Destroy;
  Qk_EtqAR := NIL;
  DestroeTabela(arq);
end;

procedure TF_RETQAR.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text    := '';
  maskedit3.text    := '';
  MaskEdit2.Text    := '01';
  MaskEdit2.Enabled := False;
  maskedit1.setfocus;
end;

procedure TF_RETQAR.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then ComboBox3.setfocus;
end;

procedure TF_RETQAR.MaskEdit2Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit2.Text)) then MaskEdit2.Text := '0';
end;

procedure TF_RETQAR.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RETQAR.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure TF_RETQAR.FormActivate(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(Date);
end;

procedure TF_RETQAR.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.setfocus;
end;

procedure TF_RETQAR.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

procedure TF_RETQAR.FormShow(Sender: TObject);
begin
  Carrega_Assina;
end;

end.
