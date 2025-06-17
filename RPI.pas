unit RPI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, WPDefs, WPPrint, WpWinCtr, WPRich;

type
  TF_RPI = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    ComboBox1: TComboBox;
    WPRichText1: TWPRichText;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RPI: TF_RPI;

implementation

uses DMTD, Menu, QkPI, QkPISP, QkPIOco, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RPI.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Text := '';
  MaskEdit2.Text := '';
  MaskEdit1.SetFocus;
end;

procedure TF_RPI.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RPI.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RPI.BitBtn1Click(Sender: TObject);
var
  arq : String;
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM cadpi');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    dataped = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  if (Trim(ComboBox1.Text) = 'SÃO PAULO') then
  begin
    Dm.ArqAux.Sql.Add('AND estado = "SP"');
  end
  else Dm.ArqAux.Sql.Add('AND estado <> "SP"');
  if (Trim(MaskEdit2.Text) <> '') then Dm.ArqAux.Sql.Add('AND rl = ' + Chr(39) + Trim(MaskEdit2.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('ORDER BY rl');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    ShowMessage('Pedidos não localizado !');
    Exit;
  end;
  if (Dm.ArqAux.FieldByName('estado').asString <> 'SP') then
  begin
    Application.CreateForm(TQk_PI, Qk_PI);
    Qk_PI.QuickRep1.Preview;
    Qk_PI.Close;
    Qk_PI := NIL;
  end
  else
  begin
    arq := '';
    arq := TirarTudo(F_Menu.Label1.Caption, ' ','','') + 'PITMP';
    CriaTabela('PITMP', arq);
    while (not Dm.ArqAux.Eof) do
    begin
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
      Dm.ArqAux1.Sql.Add('(dataped, numped, protocolo, data_p, rl, nome,');
      Dm.ArqAux1.Sql.Add('endereco, numero, complem, bairro, cidade, estado, cep,');
      Dm.ArqAux1.Sql.Add('numped1, protocolo1, data_p1, rl1, nome1,');
      Dm.ArqAux1.Sql.Add('endereco1, numero1, complem1, bairro1, cidade1, estado1, cep1)');
      Dm.ArqAux1.Sql.Add('VALUES(');
      Dm.ArqAux1.Sql.Add(Chr(39) + ConvData(Dm.ArqAux.FieldByName('dataped').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('numped').asString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('protocolo').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + ConvData(Dm.ArqAux.FieldByName('data_p').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('rl').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('nome').asString, Chr(39), '','') + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('endereco').asString, Chr(39), '','') + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('numero').asString, Chr(39), '','') + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('complem').asString, Chr(39), '','') + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('bairro').asString, Chr(39), '','') + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('cidade').asString, Chr(39), '','') + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('estado').asString, Chr(39), '','') + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('cep').asString, Chr(39), '','') + Chr(39) + ',');
      Dm.ArqAux.Next;
      if (not Dm.ArqAux.Eof) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('numped').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('protocolo').asString) + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + ConvData(Dm.ArqAux.FieldByName('data_p').asString) + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('rl').asString) + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('nome').asString, Chr(39), '','') + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('endereco').asString, Chr(39), '','') + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('numero').asString, Chr(39), '','') + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('complem').asString, Chr(39), '','') + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('bairro').asString, Chr(39), '','') + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('cidade').asString, Chr(39), '','') + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('estado').asString, Chr(39), '','') + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('cep').asString, Chr(39), '','') + Chr(39) + ')');
        Dm.ArqAux1.Sql.Savetofile('c:\teste1.txt');
        Dm.ArqAux1.ExecSQL;
      end
      else
      begin
        Dm.ArqAux1.Sql.Add('0,');
        Dm.ArqAux1.Sql.Add('0,');
        Dm.ArqAux1.Sql.Add('NULL,');
        Dm.ArqAux1.Sql.Add('"",');
        Dm.ArqAux1.Sql.Add('"",');
        Dm.ArqAux1.Sql.Add('"",');
        Dm.ArqAux1.Sql.Add('"",');
        Dm.ArqAux1.Sql.Add('"",');
        Dm.ArqAux1.Sql.Add('"",');
        Dm.ArqAux1.Sql.Add('"",');
        Dm.ArqAux1.Sql.Add('"",');
        Dm.ArqAux1.Sql.Add('"")');
        Dm.ArqAux1.Sql.Savetofile('c:\teste.txt');
        Dm.ArqAux1.ExecSQL;
      end;
      Dm.ArqAux.Next;
    end;
    Dm.ArqAux1.Close;
    Dm.ArqAux1.Sql.Clear;
    Dm.ArqAux1.Sql.Add('SELECT * FROM ' + arq);
    Dm.ArqAux1.Sql.Add('ORDER BY recno');
    Dm.ArqAux1.Open;
    if (Dm.ArqAux1.RecordCount = 0) then
    begin
      Dm.ArqAux1.Close;
      DestroeTabela(arq);
      ShowMessage('PROBLEMAS PARA CARREGAR MOVIMENTO !');
      Exit;
    end;
    Application.CreateForm(TQk_PISP, Qk_PISP);
    Qk_PISP.QuickRep1.Preview;
    Qk_PISP.Close;
    Qk_PISP := NIL;
    DestroeTabela(arq);
    // Imprimindo carta de ocorrência
    Dm.ArqAux.FindFirst;
    Application.CreateForm(TQk_PIOco, Qk_PIOco);
    Qk_PIOco.QuickRep1.Preview;
    Qk_PIOco.Destroy;
    Qk_PIOco := NIL;
  end;
end;

procedure TF_RPI.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RPI.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

end.
