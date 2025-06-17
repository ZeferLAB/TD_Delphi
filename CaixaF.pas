unit CaixaF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls, DBCtrls, Printers, jpeg;

type
  TF_CaixaF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ControlBar1: TControlBar;
    Label34: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Cabec(Sender : TOBject; operacao, sistema : String; codigo : Integer);
    Procedure Rodape(Sender : TObject; operacao : String; tipo : Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CaixaF: TF_CaixaF;
  arq     : String;
  tp      : Integer;

implementation

uses Func, CAIXAI, acesso, caixaM, DMTD, Menu, QkCaixa, FuncGeral, ProcGeral;

{$R *.DFM}

Function SomaValores(tabela, campo, conta, protocolo : String; tipo : Integer) : Currency;
begin
  Result := 0.00;
  Dm.Soma.Close;
  Dm.Soma.Sql.Clear;
  Dm.Soma.Sql.Add('SELECT SUM(' + campo + ') valor');
  Dm.Soma.Sql.Add('FROM ' + tabela);
  Dm.Soma.Sql.Add('WHERE');
  if (tipo > 0) then
  begin
    Dm.Soma.Sql.Add('tipo  = ' + IntToStr(tipo));
    if (conta <> '')     then Dm.Soma.Sql.Add('AND conta in (' + chr(39) + conta + chr(39) + ')');
    if (protocolo <> '') then Dm.Soma.Sql.Add('AND prott = ' + chr(39) + protocolo + chr(39));
  end
  else
  begin
    if (conta <> '')     then Dm.Soma.Sql.Add('conta in (' + chr(39) + conta + chr(39) + ')');
  end;
  Dm.Soma.Open;
  Result := Dm.Soma.FieldByName('valor').asCurrency;
  Dm.Soma.Close;
end;



Procedure ColocaTraco(tabela : String);
var
  rec : String;
begin
  Dm.ArqAux2.Close;
  Dm.ArqAux2.Sql.Clear;
  Dm.ArqAux2.Sql.Add('SELECT count(*) rec FROM ' + tabela);
  Dm.ArqAux2.Open;
  rec := Dm.ArqAux2.FieldByName('rec').asString;
  Dm.ArqAux2.Close;
  Dm.ArqAux2.Sql.Clear;
  Dm.ArqAux2.Sql.Add('UPDATE ' + tabela + ' SET');
  Dm.ArqAux2.Sql.Add('traco = "S"');
  Dm.ArqAux2.Sql.Add('WHERE');
  Dm.ArqAux2.Sql.Add('recno = ' + rec);
  Dm.ArqAux2.ExecSQL;
  Dm.ArqAux2.Close;
end;

Procedure TF_CaixaF.Rodape(Sender : TObject; operacao : String; tipo : Integer);
begin
  //Inserindo na tabela temporária.
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
  Dm.ArqAux.Sql.Add('(data, historico, conta, tipo, valor_di, valor_ch, valor_fat, valor_de, valor_to, rodape, traco)');
  Dm.ArqAux.Sql.Add('VALUES(');
  Dm.ArqAux.Sql.Add(Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add(Chr(39) + 'TOTAL' + Chr(39) + ',');
  if (operacao = 'E') then Dm.ArqAux.Sql.Add(Chr(39) + '20' + Chr(39) + ',') else Dm.ArqAux.Sql.Add(Chr(39) + '30' + Chr(39) + ',');
  Dm.ArqAux.Sql.Add(Chr(39) + IntToStr(tipo) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add(StrCurrPesq(SomaValores(arq, 'valor_di', '', '', tipo)) + ',');
  Dm.ArqAux.Sql.Add(StrCurrPesq(SomaValores(arq, 'valor_ch', '', '', tipo)) + ',');
  Dm.ArqAux.Sql.Add(StrCurrPesq(SomaValores(arq, 'valor_fat', '', '', tipo)) + ',');
  Dm.ArqAux.Sql.Add(StrCurrPesq(SomaValores(arq, 'valor_de', '', '', tipo)) + ',');
  Dm.ArqAux.Sql.Add(StrCurrPesq(SomaValores(arq, 'valor_to', '', '', tipo)) + ',');
  Dm.ArqAux.Sql.Add('"S",');
  Dm.ArqAux.Sql.Add(Chr(39) + 'S' + Chr(39) + ')');
  Dm.ArqAux.ExecSql;
end;

Procedure TF_CaixaF.Cabec(Sender : TOBject; operacao, sistema : String; codigo : Integer);
var
  his : String;
begin
  tp  := 0;
  his := '';
  if (codigo = 10) AND (sistema = 'TD') then
  begin
    his := 'ENTRADAS DE TÍTULOS (TD)';
    tp  := 1;
  end;
  if (codigo = 10) AND (sistema = 'PJ') then
  begin
    his := 'ENTRADAS DE TÍTULOS (PJ)';
    tp  := 2;
  end;
  //
  if (codigo = 15) AND (sistema = 'PJ') then
  begin
    his := 'REENTRADAS DE TÍTULOS (PJ)';
    tp  := 3;
  end;
  //
  if (codigo = 5)  AND (sistema = 'TD') then
  begin
    his := 'ENTRADAS DE PEDIDOS DE CERTIDÃO (TD)';
    tp  := 4;
  end;
  if (codigo = 5)  AND (sistema = 'PJ') then
  begin
    his := 'ENTRADAS DE PEDIDOS DE CERTIDÃO (PJ)';
    tp  := 5;
  end;
  //
  if (codigo = 13) AND (sistema = 'TD') AND (operacao = 'E') then
  begin
    his := 'RETIRADA DE TÍTULO(TD) - RECEBIDO';
    tp  := 6;
  end;
  if (codigo = 13) AND (sistema = 'PJ') AND (operacao = 'E') then
  begin
    his := 'RETIRADA DE TÍTULO(PJ) - RECEBIDO';
    tp  := 7;
  end;
  //
  if (codigo = 13) AND (sistema = 'TD') AND (operacao = 'S') then
  begin
    his := 'RETIRADA DE TÍTULO(TD) - DEVOLVIDO';
    tp  := 8;
  end;
  if (codigo = 13) AND (sistema = 'PJ') AND (operacao = 'S') then
  begin
    his := 'RETIRADA DE TÍTULO(PJ) - DEVOLVIDO';
    tp  := 9;
  end;
  //
  if (codigo = 14) AND (sistema = 'TD') AND (operacao = 'E') then
  begin
    his := 'RETIRADA DE CERTIDÃO(TD) - RECEBIDO';
    tp  := 10;
  end;
  if (codigo = 14) AND (sistema = 'PJ') AND (operacao = 'E') then
  begin
    his := 'RETIRADA DE CERTIDÃO(PJ) - RECEBIDO';
    tp  := 11;
  end;
  //
  if (codigo = 14) AND (sistema = 'TD') AND (operacao = 'S') then
  begin
    his := 'RETIRADA DE CERTIDÃO(TD) - DEVOLVIDO';
    tp  := 12;
  end;
  if (codigo = 14) AND (sistema = 'PJ') AND (operacao = 'S') then
  begin
    his := 'RETIRADA DE CERTIDÃO(PJ) - DEVOLVIDO';
    tp  := 13;
  end;
  if (codigo = 23) then
  begin
    his := '';
    tp  := 23;
  end;

  //Inserindo na tabela temporária.
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
  Dm.ArqAux.Sql.Add('(data, operacao, historico, tipo, cabecalho, conta, traco)');
  Dm.ArqAux.Sql.Add('VALUES(');
  Dm.ArqAux.Sql.Add(Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add(Chr(39) + operacao + Chr(39) + ',');
  Dm.ArqAux.Sql.Add(Chr(39) + his + Chr(39) + ',');
  Dm.ArqAux.Sql.Add(Chr(39) + IntToStr(tp) + Chr(39) + ',');
  Dm.ArqAux.Sql.Add('"S",');
  Dm.ArqAux.Sql.Add(IntToStr(Tp) + ',');
  Dm.ArqAux.Sql.Add(Chr(39) + 'N' + Chr(39) + ')');
  Dm.ArqAux.ExecSql;
end;

Function Alinha(Sentido, Tamanho, Cadeia : String) : String;
var
  branco : String;
  tam, tam1 : Integer;
Begin
  branco := '                                                            ';
  if sentido = 'D' then
  begin
    tam := strtoint(tamanho);
    tam1 := strtoint(tamanho) - 1;
    result := copy(branco,1,tam) + cadeia;
    result := copy(result, length(result) - tam1, tam);
  end
  else
  begin
    result := copy(cadeia + branco,1,tam);
  end;
end;

procedure TF_CaixaF.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CaixaF.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.setfocus;
  if key = 27 then close;
end;

procedure TF_CaixaF.BitBtn2Click(Sender: TObject);
begin
  ComboBox1.Text := 'GERAL';
  MaskEdit1.SetFocus;
end;

procedure TF_CaixaF.BitBtn4Click(Sender: TObject);
var
  codc : Integer;
  ope : String;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit1.setFocus;
    Exit;
  end;
  arq    := '';
  arq    := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'CXTMP';
  CriaTabela('CXTMP', arq);
  Dm.Caixa.Close;
  Dm.Caixa.Sql.Clear;
  Dm.Caixa.Sql.Add('SELECT * FROM caixa');
  Dm.Caixa.Sql.Add('WHERE');
  Dm.Caixa.Sql.Add('data = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  if (Maiusculo(Trim(ComboBox1.Text)) <> 'GERAL') then Dm.Caixa.Sql.Add('AND identifica = ' + Chr(39) + Trim(ComboBox1.Text) + Chr(39));
  Dm.Caixa.Sql.Add('AND historico <> "TÍTULO PARA REGISTRO - N.E."');
  Dm.Caixa.Sql.Add('ORDER BY operacao, codc, protocolo');
  Dm.Caixa.Open;
  if (Dm.Caixa.RecordCount = 0) then
  begin
    Dm.Caixa.Close;
    ShowMessage('Movimento não encontrado !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  while (not Dm.Caixa.Eof) do
  begin
    Cabec(F_CaixaF, Dm.Caixa.FieldByName('operacao').asString, 'TD', Dm.Caixa.FieldByName('codc').asInteger);
    codc := 0;
    ope  := '';
    codc := Dm.Caixa.FieldByName('codc').asInteger;
    ope  := Dm.Caixa.FieldByName('operacao').asString;
    while (not Dm.Caixa.Eof) AND (Dm.Caixa.FieldByName('codc').asInteger = codc) AND (Dm.Caixa.FieldByName('operacao').asString = ope) do
    begin
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
      Dm.ArqAux.Sql.Add('(data, protocolo, nome, valor_di, valor_ch, valor_fat, valor_de, valor_to, cheque, conta, tipo)');
      Dm.ArqAux.Sql.Add('VALUES(');
      Dm.ArqAux.Sql.Add(Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) + ',');
      Dm.ArqAux.Sql.Add(Dm.Caixa.FieldByName('protocolo').asString + ',');
      Dm.ArqAux.Sql.Add(Chr(39) + Dm.Caixa.FieldByName('apresentante').asString + Chr(39) + ',');
      Dm.Arqaux.Sql.Add(StrCurrPesq(Dm.Caixa.FieldByName('valor_di').asCurrency) + ',');
      Dm.Arqaux.Sql.Add(StrCurrPesq(Dm.Caixa.FieldByName('valor_ch').asCurrency) + ',');
      Dm.Arqaux.Sql.Add(StrCurrPesq(Dm.Caixa.FieldByName('valor_fat').asCurrency) + ',');
      Dm.Arqaux.Sql.Add(StrCurrPesq(Dm.Caixa.FieldByName('val_dep').asCurrency) + ',');
      Dm.Arqaux.Sql.Add(StrCurrPesq(Dm.Caixa.FieldByName('valor').asCurrency) + ',');
      Dm.ArqAux.Sql.Add(Chr(39) + Dm.Caixa.FieldByName('cheque').asString + Chr(39) + ',');
      Dm.ArqAux.Sql.Add(IntToStr(tp) + ',');
      Dm.ArqAux.Sql.Add(IntToStr(tp));
      Dm.ArqAux.Sql.Add(')');
      Dm.ArqAux.ExecSql;
      Dm.Caixa.Next;
    end;
    ColocaTraco(arq);
    Rodape(F_CaixaF, ope, tp);
  end;


  //Abrindo para impressão
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY tipo, recno');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    QrDestroi;
    Application.CreateForm(TQk_Caixa, Qk_Caixa);
    Qk_Caixa.Label1.Caption   := arq;
    Qk_Caixa.QrLabel1.Caption := F_Menu.Caption;
    Qk_Caixa.QrLabel2.Caption := 'Fechamento de caixa do dia ' + MaskEdit1.Text + '.';
    Qk_Caixa.QrLabel4.Caption := 'Caixa : ' + Trim(ComboBox1.Text);
    Qk_Caixa.QuickRep1.Preview;
    Qk_Caixa.Destroy;
    Qk_Caixa := NIL;
  end;
  Dm.ArqAux.Close;
  DestroeTabela(arq);
  MaskEdit1.SetFocus; 
end;

procedure TF_CaixaF.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
end;

procedure TF_CaixaF.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn4.SetFocus;
end;

end.
