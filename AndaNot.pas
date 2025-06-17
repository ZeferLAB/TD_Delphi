unit AndaNot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, DBCtrls, Grids, DBGrids, Menus;

type
  TF_AndaNot = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    DBRichEdit1: TDBRichEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    Button1: TButton;
    DBRichEdit2: TDBRichEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBRichEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Excluir1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_AndaNot: TF_AndaNot;
  arq : String;
  
implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_AndaNot.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_AndaNot.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DestroeTabela(arq);
end;

procedure TF_AndaNot.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure TF_AndaNot.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure TF_AndaNot.DBRichEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure TF_AndaNot.Excluir1Click(Sender: TObject);
var
  campo1, campo2, campo3, campo4, campo5 : String;
begin
  if (Dm.ArqAux1.FieldByName('baixa').asInteger > 0) then
  begin
    if (MessageBox(Handle, PChar('Excluir a baixa nº ' + Dm.ArqAux1.FieldByName('baixa').asString + '?'), 'EXCLUSÃO DE BAIXA DE NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
    begin
      campo1 := '';
      campo2 := '';
      campo3 := '';
      campo4 := '';
      campo5 := '';
      campo1 := 'data_not' + Dm.ArqAux1.FieldByName('baixa').asString;
      campo2 := 'hora_not' + Dm.ArqAux1.FieldByName('baixa').asString;
      campo3 := 'sit_not'  + Dm.ArqAux1.FieldByName('baixa').asString;
      campo4 := 'cod_ir'   + Dm.ArqAux1.FieldByName('baixa').asString;
      campo5 := 'obs_not'  + Dm.ArqAux1.FieldByName('baixa').asString;
      Dm.ArqAux2.Close;
      Dm.ArqAux2.Sql.Clear;
      Dm.ArqAux2.Sql.Add('UPDATE td_pesso SET');
      Dm.ArqAux2.Sql.Add(campo1 + ' = NULL,');
      Dm.ArqAux2.Sql.Add(campo2 + ' = NULL,');
      Dm.ArqAux2.Sql.Add(campo3 + ' = NULL,');
      Dm.ArqAux2.Sql.Add(campo4 + ' = NULL,');
      Dm.ArqAux2.Sql.Add(campo5 + ' = NULL');
      Dm.ArqAux2.Sql.Add('WHERE');
      Dm.ArqAux2.Sql.Add('registro = ' + Label1.Caption);
      Dm.ArqAux2.ExecSQL;
      Button1Click(F_AndaNot);
    end;
  end;
end;

procedure TF_AndaNot.Button1Click(Sender: TObject);
var
  Texto : TStringList;
  ende  : String;
begin
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ANDANOT';
  CriaTabela('ANDANOT', arq);
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM acertifi');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('numreg = ' + Label1.Caption);
  Dm.ArqAux.Sql.Add('ORDER BY datasitu');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    while (not Dm.ArqAux.Eof) do
    begin
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('INSERT ' + arq);
      Dm.ArqAux1.Sql.Add('(data, hora, certificado, rl, situacao, observacao, descricao)');
      Dm.ArqAux1.Sql.Add('VALUES(');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('datasitu').asString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('horadilig').asString + ':' + Dm.ArqAux.FieldByName('minudilig').asString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('numcerti').asString  + Chr(39) + ',');
      if (Trim(Dm.ArqAux.FieldByName('codigo_barra').asString) <> '') then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'RZ ' + Dm.ArqAux.FieldByName('codigo_barra').asString + ' BR' + Chr(39) + ',');
      end
      else Dm.ArqAux1.Sql.Add('NULL,');
      if (Dm.ArqAux.FieldByName('situacao').asInteger = 1) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'POSITIVA' + Chr(39) + ',');
      end
      else if (Dm.ArqAux.FieldByName('situacao').asInteger = 2) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'PARCIAL' + Chr(39) + ',');
      end
      else
      begin
        if (Dm.ArqAux.FieldByName('situacao').asInteger = 11) then
        begin
          Dm.ArqAux1.Sql.Add(Chr(39) + 'EM ABERTO' + Chr(39) + ',');
        end
        else Dm.ArqAux1.Sql.Add(Chr(39) + 'NEGATIVA' + Chr(39) + ',');
      end;
      Dm.ArqAux1.Sql.Add(Chr(39) + TirarTudo(Dm.ArqAux.FieldByName('observacoes').asString, Chr(39), '','') + Chr(39) + ',');
      if (Trim(Dm.ArqAux.FieldByName('situacao').asString) <> '') then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('situacao').asString) + Chr(39) + ')');
      end
      else Dm.ArqAux1.Sql.Add('"")'); 
      Dm.ArqAux1.ExecSQL;
      Dm.ArqAux.Next;
    end;
  end;
  Dm.ArqAux.Close;
  //Appendando pelo arquivo da siscart.
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT a.anotacao, a.rl, b.data_not1, b.sit_not1, b.cod_not1, b.obs_not1, b.hora_not1,');
  Dm.ArqAux.Sql.Add('b.data_not2, b.sit_not2, b.cod_not2, b.obs_not2, b.hora_not2,');
  Dm.ArqAux.Sql.Add('b.data_not3, b.sit_not3, b.cod_not3, b.obs_not3, b.hora_not3, a.bxcorreio');
  Dm.ArqAux.Sql.Add('FROM td a left outer join td_pesso b');
  Dm.ArqAux.Sql.Add('on(b.p_auxiliar = a.p_auxiliar)');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('a.registro = ' + Label1.Caption);
  Dm.ArqAux.Sql.Add('AND (b.situacao = "38" or b.situacao = "107"');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    if (Dm.ArqAux.FieldByName('data_not1').asDateTime > 0) then
    begin
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('INSERT ' + arq);
      Dm.ArqAux1.Sql.Add('(data, hora, certificado, rl, situacao, observacao, descricao, baixa)');
      Dm.ArqAux1.Sql.Add('VALUES(');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('data_not1').asString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('hora_not1').asString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('anotacao').asString  + Chr(39) + ',');
      Dm.Arqaux1.Sql.Add(Chr(39) + 'RZ ' + Dm.ArqAux.FieldByName('rl').asString + ' BR' + Chr(39) + ',');
      if (Dm.ArqAux.FieldByName('sit_not1').asstring = 'P') then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'POSITIVA' + Chr(39) + ',');
      end
      else if (Dm.ArqAux.FieldByName('sit_not1').asstring = 'L') then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'PARCIAL' + Chr(39) + ',');
      end
      else Dm.ArqAux1.Sql.Add(Chr(39) + 'NEGATIVA' + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('obs_not1').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_not1').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add('1)');
      Dm.ArqAux1.ExecSQL;
    end;
    //2ª data de notificação
    if (Dm.ArqAux.FieldByName('data_not2').asDateTime > 0) then
    begin
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('INSERT ' + arq);
      Dm.ArqAux1.Sql.Add('(data, hora, certificado, rl, situacao, observacao, descricao, baixa)');
      Dm.ArqAux1.Sql.Add('VALUES(');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('data_not2').asString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('hora_not2').asString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('anotacao').asString  + Chr(39) + ',');
      Dm.Arqaux1.Sql.Add(Chr(39) + 'RZ ' + Dm.ArqAux.FieldByName('rl').asString + ' BR' + Chr(39) + ',');
      if (Dm.ArqAux.FieldByName('cod_not2').asInteger = 1) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'POSITIVA' + Chr(39) + ',');
      end
      else if (Dm.ArqAux.FieldByName('cod_not2').asInteger = 2) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'PARCIAL' + Chr(39) + ',');
      end
      else Dm.ArqAux1.Sql.Add(Chr(39) + 'NEGATIVA' + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('obs_not2').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_not2').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add('2)');
      Dm.ArqAux1.ExecSQL;
    end;
    //3ª data de notificação
    if (Dm.ArqAux.FieldByName('data_not3').asDateTime > 0) then
    begin
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('INSERT ' + arq);
      Dm.ArqAux1.Sql.Add('(data, hora, certificado, rl, situacao, observacao, descricao, baixa)');
      Dm.ArqAux1.Sql.Add('VALUES(');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('data_not3').asString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('hora_not3').asString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('anotacao').asString  + Chr(39) + ',');
      Dm.Arqaux1.Sql.Add(Chr(39) + 'RZ ' + Dm.ArqAux.FieldByName('rl').asString + ' BR' + Chr(39) + ',');
      if (Dm.ArqAux.FieldByName('cod_not3').asInteger = 1) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'POSITIVA' + Chr(39) + ',');
      end
      else if (Dm.ArqAux.FieldByName('cod_not3').asInteger = 2) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'PARCIAL' + Chr(39) + ',');
      end
      else Dm.ArqAux1.Sql.Add(Chr(39) + 'NEGATIVA' + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('obs_not3').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_not3').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add('3)');
      Dm.ArqAux1.ExecSQL;
    end;
  end;
  Dm.ArqAux.Close;
  // Carregando nome do Destinatário e o Endereço
  Dm.BuscaPartes.Close;
  Dm.BuscaPartes.Sql.Clear;
  Dm.BuscaPartes.Sql.Add('SELECT nome, endereco, numero, complem, bairro, cidade, cep, estado');
  Dm.BuscaPartes.Sql.Add('FROM td_pesso');
  Dm.BuscaPartes.Sql.Add('WHERE');
  Dm.BuscaPartes.Sql.Add('    registro = ' + Label1.Caption);
  Dm.BuscaPartes.Sql.Add('AND situacao = "38"');
  Dm.BuscaPartes.Sql.Add('ORDER BY recno');
  Dm.BuscaPartes.Open;
  if (Dm.BuscaPartes.RecordCount <> 0) then
  begin
    Texto  := TStringList.Create;
    Texto.Clear;
    while (not Dm.BuscaPartes.Eof) do
    begin
      ende := '';    
      ende := Trim(Dm.BuscaPartes.FieldByName('endereco').asString);
      if (Trim(Dm.BuscaPartes.FieldByName('numero').asString) <> '') then
      begin
        ende := ende + ' Nº ' + Trim(Dm.BuscaPartes.FieldByName('numero').asString);
      end;
      if (Trim(Dm.BuscaPartes.FieldByName('complem').asString) <> '') then
      begin
        ende := ende + ' - ' + Trim(Dm.BuscaPartes.FieldByName('complem').asString);
      end;
      if (Trim(Dm.BuscaPartes.FieldByName('bairro').asString) <> '') then
      begin
        ende := ende + ' - ' + Trim(Dm.BuscaPartes.FieldByName('bairro').asString);
      end;
      if (Trim(Dm.BuscaPartes.FieldByName('cidade').asString) <> '') then
      begin
        ende := ende + ' - ' + Trim(Dm.BuscaPartes.FieldByName('cidade').asString);
      end;
      if (Trim(Dm.BuscaPartes.FieldByName('estado').asString) <> '') then
      begin
        ende := ende + ' - ' + Trim(Dm.BuscaPartes.FieldByName('estado').asString);
      end;
      if (Trim(Dm.BuscaPartes.FieldByName('cep').asString) <> '') then
      begin
        ende := ende + ' - CEP. ' + Trim(Dm.BuscaPartes.FieldByName('cep').asString);
      end;
      Texto.Add(Dm.BuscaPartes.FieldByName('nome').asString);
      Texto.Add(ende);
      Texto.Add('');      
      Dm.BuscaPartes.Next;
    end;
    Dm.BuscaPartes.Close;
    Dm.BuscaPartes.Sql.Clear;
    Dm.BuscaPartes.Sql.Add('UPDATE ' + arq + ' SET');
    Dm.BuscaPartes.Sql.Add('destinatario = ' + Chr(39) + Texto.Text + Chr(39));
    Dm.BuscaPartes.ExecSQL;
    Texto.Free;    
  end;
  Dm.BuscaPartes.Close;
  //***********
  // Abrindo a tabela temporária
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux1.Sql.Add('ORDER BY recno');
  Dm.ArqAux1.Open;
  if (Dm.ArqAux1.RecordCount = 0) then
  begin
    Dm.ArqAux1.Close;
    ShowMessage('Andamento não localizado !');
    Close;
  end;
end;

procedure TF_AndaNot.FormActivate(Sender: TObject);
begin
  Button1Click(F_AndaNot);
end;

end.

