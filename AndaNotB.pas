unit AndaNotB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, DBCtrls, Grids, DBGrids, Mask;

type
  TF_AndaNotB = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    DBRichEdit1: TDBRichEdit;
    BitBtn3: TBitBtn;
    DBGrid2: TDBGrid;
    DBRichEdit2: TDBRichEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBRichEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_AndaNotB: TF_AndaNotB;
  arq : String;
  
implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_AndaNotB.FormActivate(Sender: TObject);
var
  ende : String;
  foi : boolean;
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
    foi := False;
    while (not Dm.ArqAux.Eof) do
    begin
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('INSERT ' + arq);
      Dm.ArqAux1.Sql.Add('(data, hora, certificado, situacao, observacao, nome, descricao)');
      Dm.ArqAux1.Sql.Add('VALUES(');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('datasitu').asString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('horadilig').asString + ':' + Dm.ArqAux.FieldByName('minudilig').asString + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('numcerti').asString  + Chr(39) + ',');
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
      Dm.ArqAux1.Sql.Add(Chr(39) + 'INFORMAÇÕES ARQUIVO SIPLAN' + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('situacao').asString) + Chr(39) + ')');
      Dm.ArqAux1.ExecSQL;
      Dm.ArqAux.Next;
    end;
  end;
  Dm.ArqAux.Close;
  //Appendando pelo arquivo da siscart.
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT nome, data_not1, sit_not1, cod_not1, obs_not1, hora_not1,');
  Dm.ArqAux.Sql.Add('data_not2, sit_not2, cod_not2, obs_not2, hora_not2,');
  Dm.ArqAux.Sql.Add('data_not3, sit_not3, cod_not3, obs_not3, hora_not3,');
  Dm.ArqAux.Sql.Add('endereco, numero, complem, bairro, cidade, estado, cep, notificador, dt_desig');
  Dm.ArqAux.Sql.Add('FROM td_pesso');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    registro = ' + Label1.Caption);
  Dm.ArqAux.Sql.Add('AND (situacao = "38" or situacao = "107")');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    while (not Dm.ArqAux.Eof) do
    begin
      //Endereço das Partes
      ende := '';
      ende := Trim(Dm.ArqAux.FieldByName('endereco').asString);
      if (Trim(Dm.ArqAux.FieldByName('numero').asString) <> '') then
      begin
        ende := ende + ' Nº ' + Trim(Dm.ArqAux.FieldByName('numero').asString);
      end;
      if (Trim(Dm.ArqAux.FieldByName('complem').asString) <> '') then
      begin
        ende := ende + ' - ' + Trim(Dm.ArqAux.FieldByName('complem').asString);
      end;
      if (Trim(Dm.ArqAux.FieldByName('bairro').asString) <> '') then
      begin
        ende := ende + ' - ' + Trim(Dm.ArqAux.FieldByName('bairro').asString);
      end;
      if (Trim(Dm.ArqAux.FieldByName('cidade').asString) <> '') then
      begin
        ende := ende + ' - ' + Trim(Dm.ArqAux.FieldByName('cidade').asString);
      end;
      if (Trim(Dm.ArqAux.FieldByName('estado').asString) <> '') then
      begin
        ende := ende + ' - ' + Trim(Dm.ArqAux.FieldByName('estado').asString);
      end;
      if (Trim(Dm.ArqAux.FieldByName('cep').asString) <> '') then
      begin
        ende := ende + ' - CEP. ' + Trim(Dm.ArqAux.FieldByName('cep').asString);
      end;
      //**********************
      if (Dm.ArqAux.FieldByName('dt_desig').asDateTime > 0) and (not foi) then
      begin
        Dm.ArqAux1.Close;
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('INSERT ' + arq);
        Dm.ArqAux1.Sql.Add('(data, hora, nome, situacao, observacao, descricao, destinatario, notificador)');
        Dm.ArqAux1.Sql.Add('VALUES(');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('dt_desig').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + '' + Chr(39) + ',');
        Dm.Arqaux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('notificador').asString) + Chr(39) + ',');

          Dm.ArqAux1.Sql.Add(Chr(39) + 'DESIGNAÇÃO' + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + 'DESGNAÇÃO PARA DILIGENCIA ' + Trim(Dm.ArqAux.FieldByName('notificador').asString)  + ' NA DATA DE '  + Dm.ArqAux.FieldByName('dt_desig').asString  + Chr(39) +  ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + 'DESGNAÇÃO PARA DILIGENCIA ' + Trim(Dm.ArqAux.FieldByName('notificador').asString)  + ' NA DATA DE '  + Dm.ArqAux.FieldByName('dt_desig').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + '' + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.FieldByName('notificador').AsString + Chr(39) + ')');
        Dm.ArqAux1.ExecSQL;
        foi := True;
      end;

      if (Dm.ArqAux.FieldByName('data_not1').asDateTime > 0) then
      begin
        Dm.ArqAux1.Close;
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('INSERT ' + arq);
        Dm.ArqAux1.Sql.Add('(data, hora, nome, situacao, observacao, descricao, destinatario, notificador)');
        Dm.ArqAux1.Sql.Add('VALUES(');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('data_not1').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('hora_not1').asString + Chr(39) + ',');
        Dm.Arqaux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('nome').asString) + Chr(39) + ',');
        if (Dm.ArqAux.FieldByName('cod_not1').asInteger = 1) then
        begin
          Dm.ArqAux1.Sql.Add(Chr(39) + 'POSITIVA' + Chr(39) + ',');
        end
        else if (Dm.ArqAux.FieldByName('cod_not1').asInteger = 2) then
        begin
          Dm.ArqAux1.Sql.Add(Chr(39) + 'PARCIAL' + Chr(39) + ',');
        end
        else Dm.ArqAux1.Sql.Add(Chr(39) + 'NEGATIVA' + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('obs_not1').asString) + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_not1').asString) + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + ende + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.FieldByName('notificador').AsString + Chr(39) + ')');
        Dm.ArqAux1.ExecSQL;
      end;
      //2ª data de notificação
      if (Dm.ArqAux.FieldByName('data_not2').asDateTime > 0) then
      begin
        Dm.ArqAux1.Close;
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('INSERT ' + arq);
        Dm.ArqAux1.Sql.Add('(data, hora, nome, situacao, observacao, descricao, destinatario, notificador )');
        Dm.ArqAux1.Sql.Add('VALUES(');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('data_not2').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('hora_not2').asString + Chr(39) + ',');
        Dm.Arqaux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('nome').asString) + Chr(39) + ',');
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
        Dm.ArqAux1.Sql.Add(Chr(39) + ende + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.FieldByName('notificador').AsString + Chr(39) + ')');
        Dm.ArqAux1.ExecSQL;
      end;
      //3ª data de notificação
      if (Dm.ArqAux.FieldByName('data_not3').asDateTime > 0) then
      begin
        Dm.ArqAux1.Close;
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('INSERT ' + arq);
        Dm.ArqAux1.Sql.Add('(data, hora, nome, situacao, observacao, descricao, destinatario, notificador)');
        Dm.ArqAux1.Sql.Add('VALUES(');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('data_not3').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('hora_not3').asString + Chr(39) + ',');
        Dm.Arqaux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('nome').asString) + Chr(39) + ',');
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
        Dm.ArqAux1.Sql.Add(Chr(39) + ende + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + dm.ArqAux.FieldByName('notificador').AsString + Chr(39) + ')');
        Dm.ArqAux1.ExecSQL;
      end;
      Dm.ArqAux.Next;
    end;
  end;
  Dm.ArqAux.Close;
  Dm.NomeTabela := arq;
  Dm.FiltroNomes.Close;
  Dm.FiltroNomes.Sql.Clear;
  Dm.FiltroNomes.Sql.Add('SELECT nome FROM ' + arq);
  Dm.FiltroNomes.Sql.Add('WHERE');
  Dm.FiltroNomes.Sql.Add('nome is not null');
  Dm.FiltroNomes.Sql.Add('GROUP BY nome');
  Dm.FiltroNomes.Sql.Add('ORDER BY data, nome');
  Dm.FiltroNomes.Open;
  if (Dm.FiltroNomes.RecordCount = 0) then
  begin
    Dm.FiltroNomes.Close;
    ShowMessage('Andamento não localizado !');
    Close;
  end;
end;

procedure TF_AndaNotB.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_AndaNotB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.FiltroNomes.Close;
  Dm.ArqAux1.Close;
  DestroeTabela(arq);
end;

procedure TF_AndaNotB.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure TF_AndaNotB.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure TF_AndaNotB.DBRichEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

end.
