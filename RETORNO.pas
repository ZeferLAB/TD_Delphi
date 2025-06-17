unit Retorno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Db, jpeg;

type
  TF_Ret = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    MaskEdit2: TMaskEdit;
    ControlBar1: TControlBar;
    Label34: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDwn(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Enter(Sender: TObject);
    Procedure GerarArquivoAval(Sender : TOBject);
    Procedure GerarArquivoRoss(Sender : TOBject);
    Procedure GerarArquivoPoin(Sender : TOBject);
    Procedure GerarArquivoMLGomes(Sender : TOBject);
    Procedure GerarArquivoHeckler(Sender : TOBject);        
    procedure MaskEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Ret: TF_Ret;
  F1   : TextFile;
  arq  : String;
  cam  : String;


implementation

uses Menu, DMTD, FuncGeral, ProcGeral;

{$R *.DFM}

Function BuscaSequencia(NomeArq : String) : String;
var
  x, y : Integer;
  arqq : String;
begin
  Result := '';
  x := 1;
  y := 1;
  while x <= 99999 do
  begin
    arqq := cam + NomeArq + StrZero(IntToStr(x), 5) + '.RET';
    if (FileExists(arqq)) then y := y + 1 else x := 99999;
    x := x + 1;
  end;
  Result := StrZero(IntToStr(y), 5);
end;

Procedure Grava_linha(linha : String);
begin
  WriteLn(F1, linha);
end;

Procedure TF_Ret.GerarArquivoAval(Sender : TOBject);
var
  linha, docdev, nomdev : String;
  qde   : Integer;
begin
  cam := F_Menu.Label27.Caption + 'Aval\';
  arq := 'CTO' + Copy(TirarTudo(MaskEdit3.Text, '/','',''), 1,4);
  arq := arq + BuscaSequencia(arq) + '.RET';
  Label4.Caption := arq;
  Label4.Visible := True;
  arq := cam + arq;
  AssignFile(F1, arq);
  ReWrite(F1);
  linha := '';
  qde   := 0;
  //linha Header
  linha := '0' + TirarTudo(MaskEdit3.Text, '/', '','') + Copy(TimeToStr(time), 1, 5) + StrBranco(F_Menu.Label29.Caption, 60, 'D') + StrBranco('', 726, 'D');
  Grava_Linha(linha);
  while (not Dm.ArqAux.Eof) do
  begin
    docdev := '';
    nomdev := '';
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('SELECT nome, doc1');
    Dm.PessAux.Sql.Add('FROM td_pesso');
    Dm.PessAux.Sql.Add('WHERE');
    Dm.PessAux.Sql.Add('    p_auxiliar = ' + Dm.ArqAux.FieldByName('p_auxiliar').asString);
    Dm.PessAux.Sql.Add('AND situacao   = "D"');
    Dm.PessAux.Open;
    if (Dm.PessAux.RecordCount <> 0) then
    begin
      docdev := Dm.PessAux.FieldByName('doc1').asString;
      nomdev := Dm.PessAux.FieldByName('nome').asString;
    end;
    Dm.PessAux.Close;
    qde := qde + 1;
    linha := '';
    //código do registro
    linha := '1';
    // nº do Lote
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('lote').asString), 10, 'D');
    // Cod. Financeira
    linha := linha + StrZero(Dm.ArqAux.FieldByName('versao').asString, 5);
    // Documento do Portador
    linha := linha + StrBranco(Trim(docdev), 15, 'D');
    // Cod. Operação
    linha := linha + StrBranco('', 5, 'D');
    // Contrato
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('contrato').asString), 20, 'D');
    // Parcelas
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('parcelas').asString), 7, 'D');
    // Tipo (Parcela/Residual)
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('pr1').asString), 1, 'D');
    // Nome do Devedor
    linha := linha + StrBranco(Trim(nomdev), 60, 'D');
    // Nº do Registro
    linha := linha + StrZero(Trim(Dm.ArqAux.FieldByName('registro').asString), 8);
    // Data do Registro
    linha := linha + StrZero(TirarTudo(Dm.ArqAux.FieldByName('data_p').asString, '/', '',''), 8);
    // Nº do Protocolo
    linha := linha + StrZero(TirarTudo(Dm.ArqAux.FieldByName('p_auxiliar').asString, '/', '',''), 8);
    // Situação da Notificação - (1)
    if (Dm.ArqAux.FieldByName('data_not1').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('sit_not1').asString), 1, 'D');
      // Código da Ocorrência
      linha := linha + StrBranco(TirarTudo(Dm.ArqAux.FieldByName('cod_ir1').asString, '/', '',''), 5, 'E');
      // Descrição da Ocorrência.
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir1').asString), 60, 'D');
    end // Situação da Notificação - (2)
    else if (Dm.ArqAux.FieldByName('data_not2').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('sit_not2').asString), 1, 'D');
      // Código da Ocorrência
      linha := linha + StrBranco(TirarTudo(Dm.ArqAux.FieldByName('cod_ir2').asString, '/', '',''), 5, 'E');
      // Descrição da Ocorrência.
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir2').asString), 60, 'D');
    end // Situação da Notificação - (3)
    else if (Dm.ArqAux.FieldByName('data_not3').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('sit_not3').asString), 1, 'D');
      // Código da Ocorrência
      linha := linha + StrBranco(TirarTudo(Dm.ArqAux.FieldByName('cod_ir3').asString, '/', '',''), 5, 'E');
      // Descrição da Ocorrência.
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir3').asString), 60, 'D');
    end;
    // Espaços em Branco
    linha := linha + StrBranco('', 586, 'D');
    Grava_Linha(linha);
    Dm.ArqAux.Next;
  end;
  Dm.ArqAux.Close;
  linha := '';
  //Linha Trailler
  linha := '9' + StrZero(IntToStr(qde), 6) + StrBranco('', 793, 'D');
  Grava_Linha(linha);
  CloseFile(F1);
end;

Procedure TF_Ret.GerarArquivoMLGomes(Sender : TOBject);
var
  linha, docdev, nomdev : String;
  qde   : Integer;
begin
  cam := F_Menu.Label27.Caption + 'ML\';
  arq := 'MLR' + Copy(TirarTudo(MaskEdit3.Text, '/','',''), 1,4);
  arq := arq + '.TXT';
  Label4.Caption := arq;
  Label4.Visible := True;
  arq := cam + arq;
  AssignFile(F1, arq);
  ReWrite(F1);
  linha := '';
  qde   := 0;
  while (not Dm.ArqAux.Eof) do
  begin
    docdev := '';
    nomdev := '';
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('SELECT nome, doc1');
    Dm.PessAux.Sql.Add('FROM td_pesso');
    Dm.PessAux.Sql.Add('WHERE');
    Dm.PessAux.Sql.Add('    p_auxiliar = ' + Dm.ArqAux.FieldByName('p_auxiliar').asString);
    Dm.PessAux.Sql.Add('AND situacao   = "D"');
    Dm.PessAux.Open;
    if (Dm.PessAux.RecordCount <> 0) then
    begin
      docdev := Dm.PessAux.FieldByName('doc1').asString;
      nomdev := Dm.PessAux.FieldByName('nome').asString;
    end;
    Dm.PessAux.Close;
    qde := qde + 1;
    linha := '';
    // Cliente
    linha := linha + StrZero(Trim(Dm.ArqAux.FieldByName('versao').asString), 3);
    // Contrato
    linha := linha + StrBranco(Dm.ArqAux.FieldByName('contrato').asString, 10, 'D');
    // Data de Registro/Notificação
    linha := linha + Dm.ArqAux.FieldByName('data_p').asString;
    // nº do registro
    linha := linha + StrBranco(Dm.ArqAux.FieldByName('registro').asString, 8, 'D');
    // Data de baixa
    if (Dm.ArqAux.FieldByName('data_not3').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      linha := linha + Dm.ArqAux.FieldByName('data_not3').asString;
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir3').asString), 25, 'D');
    end
    else if (Dm.ArqAux.FieldByName('data_not2').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      linha := linha + Dm.ArqAux.FieldByName('data_not2').asString;
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir2').asString), 25, 'D');
    end
    else if (Dm.ArqAux.FieldByName('data_not1').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      linha := linha + Dm.ArqAux.FieldByName('data_not1').asString;
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir1').asString), 25, 'D');
    end;
    linha   := linha + StrBranco(nomdev, 40, 'D');
    linha   := linha + StringOfChar(' ', 10);
    Grava_Linha(linha);
    Dm.ArqAux.Next;
  end;
  Dm.ArqAux.Close;
  CloseFile(F1);
end;

Procedure TF_Ret.GerarArquivoRoss(Sender : TOBject);
var
  linha, docdev, nomdev : String;
  qde, numarq : Integer;
  arqq  : String;
begin
  arqq := '';
  arqq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ROSTMP';
  CriaTabela('ROSTMP', arqq);
  Dm.ArqAux1.Close;
  Dm.ArqAux1.RequestLive := True;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('SELECT * FROM ' + arqq);
  Dm.ArqAux1.Open;
  ///
  while (not Dm.ArqAux.Eof) do
  begin
    docdev := '';
    nomdev := '';
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('SELECT nome, doc1');
    Dm.PessAux.Sql.Add('FROM td_pesso');
    Dm.PessAux.Sql.Add('WHERE');
    Dm.PessAux.Sql.Add('    p_auxiliar = ' + Dm.ArqAux.FieldByName('p_auxiliar').asString);
    Dm.PessAux.Sql.Add('AND situacao   = "D"');
    Dm.PessAux.Open;
    if (Dm.PessAux.RecordCount <> 0) then
    begin
      docdev := Dm.PessAux.FieldByName('doc1').asString;
      nomdev := Dm.PessAux.FieldByName('nome').asString;
    end;
    Dm.PessAux.Close;
    Dm.ArqAux1.Append;
    Dm.ArqAux1.FieldByName('nomdev').asString      := StrBranco(Trim(nomdev), 55, 'D');
    Dm.ArqAux1.FieldByName('docdev').asString      := StrBranco(Trim(docdev), 20, 'D');
    Dm.ArqAux1.FieldByName('grupo').asString       := Strzero2(Trim(Dm.ArqAux.FieldByName('grupo').asString), 6, 'D');
    Dm.ArqAux1.FieldByName('cota').asString        := Strzero(Trim(Dm.ArqAux.FieldByName('cota').asString), 6);
    Dm.ArqAux1.FieldByName('certcertifi').asString := Strzero(Trim(Dm.ArqAux.FieldByName('certcertif').asString), 8);
    // Situação da Notificação - (1)
    if (Dm.ArqAux.FieldByName('data_not1').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      // Código da Ocorrência
      Dm.ArqAux1.FieldByName('cod_ir').asString      := Strzero(TirarTudo(Dm.ArqAux.FieldByName('cod_ir1').asString, '/', '',''), 4);
      // Descrição da Ocorrência.
      Dm.ArqAux1.FieldByName('ocorrencia').asString  := StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir1').asString), 30, 'D');
      // Situação da Notificação
      Dm.ArqAux1.FieldByName('situacao').asString    := StrBranco(Trim(Dm.ArqAux.FieldByName('sit_not1').asString), 1, 'D');
      // Data da Situação
      Dm.ArqAux1.FieldByName('datasit').asString     := StrBranco(TirarTudo(Dm.ArqAux.FieldByName('data_not1').asString, '/', '',''), 8, 'D');
    end    // Situação da Notificação - (2)
    else if (Dm.ArqAux.FieldByName('data_not2').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      // Código da Ocorrência
      Dm.ArqAux1.FieldByName('cod_ir').asString      := Strzero(TirarTudo(Dm.ArqAux.FieldByName('cod_ir2').asString, '/', '',''), 4);
      // Descrição da Ocorrência.
      Dm.ArqAux1.FieldByName('ocorrencia').asString      := StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir2').asString), 30, 'D');
      // Situação da Notificação
      Dm.ArqAux1.FieldByName('situacao').asString      := StrBranco(Trim(Dm.ArqAux.FieldByName('sit_not2').asString), 1, 'D');
      // Data da Situação
      Dm.ArqAux1.FieldByName('datasit').asString      := StrBranco(TirarTudo(Dm.ArqAux.FieldByName('data_not2').asString, '/', '',''), 8, 'D');
    end // Situação da Notificação - (3)
    else if (Dm.ArqAux.FieldByName('data_not3').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      // Código da Ocorrência
      Dm.ArqAux1.FieldByName('cod_ir').asString      := Strzero(TirarTudo(Dm.ArqAux.FieldByName('cod_ir3').asString, '/', '',''), 4);
      // Descrição da Ocorrência.
      Dm.ArqAux1.FieldByName('ocorrencia').asString      := StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir3').asString), 30, 'D');
      // Situação da Notificação
      Dm.ArqAux1.FieldByName('situacao').asString      := StrBranco(Trim(Dm.ArqAux.FieldByName('sit_not3').asString), 1, 'D');
      // Data da Situação
      Dm.ArqAux1.FieldByName('datasit').asString      := StrBranco(TirarTudo(Dm.ArqAux.FieldByName('data_not3').asString, '/', '',''), 8, 'D');
    end;
    Dm.ArqAux1.FieldByName('registro').asString       := StrZero(Trim(Dm.ArqAux.FieldByName('registro').asString), 8);
    Dm.ArqAux1.FieldByName('arquivo').asInteger       := StrToInt(Copy(Dm.ArqAux.FieldByName('arquivo').asstring,3,2));
    Dm.ArqAux1.FieldByName('data_p').asString         := StrBranco(TirarTudo(Dm.ArqAux.FieldByName('data_p').asString, '/', '',''), 8, 'D');
    Dm.ArqAux1.Post;
    Dm.ArqAux.Next;
  end;
  Dm.ArqAux.Close;
  //
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('SELECT * FROM ' + arqq);
  Dm.ArqAux1.Sql.Add('ORDER BY arquivo');
  Dm.ArqAux1.Open;
  if (Dm.ArqAux1.RecordCount <> 0) then
  begin
    while (not Dm.ArqAux1.Eof) do
    begin
      numarq := 0;
      numarq := Dm.ArqAux1.FieldByName('arquivo').asInteger;
      cam := F_Menu.Label27.Caption + 'Rossi\';
      arq := 'CR' + StrZero(IntToStr(numarq), 2) + copy(f_ret.maskedit3.text,1,2) + copy(f_ret.maskedit3.text,4,2);
      arq := arq + '.RET';
      Label4.Caption := arq;
      Label4.Visible := True;
      arq := cam + arq;
      AssignFile(F1, arq);
      ReWrite(F1);
      qde    := 0;
      while (not Dm.ArqAux1.Eof) AND (Dm.ArqAux1.FieldByName('arquivo').asInteger = numarq) do
      begin
        qde := qde + 1;
        linha := '';
        // Nome do Devedor
        linha := linha + Dm.ArqAux1.FieldByName('nomdev').asString;
        // Tipo do Documento
        linha := linha + StrBranco(Trim(''), 4, 'D');
        // Documento
        linha := linha + Dm.ArqAux1.FieldByName('docdev').asString;
        // Grupo
        linha := linha + Dm.ArqAux1.FieldByName('grupo').asString;
        // Cota
        linha := linha + Dm.ArqAux1.FieldByName('cota').asString;
        // Número do Certificado
        linha := linha + Dm.ArqAux1.FieldByName('certcertifi').asString;
        // Código da Ocorrência
        linha := linha + Dm.ArqAux1.FieldByName('cod_ir').asString;
        // Descrição da Ocorrência.
        linha := linha + Dm.ArqAux1.FieldByName('ocorrencia').asString;
        // Situação da Notificação
        linha := linha + Dm.ArqAux1.FieldByName('situacao').asString;
        // Data da Situação
        linha := linha + Dm.ArqAux1.FieldByName('datasit').asString;
        // Nº do Registro
        linha := linha + Dm.ArqAux1.FieldByName('registro').asString;
        // Data do Registro
        linha := linha + Dm.ArqAux1.FieldByName('data_p').asString;
        Grava_Linha(linha);
        Dm.ArqAux1.Next;
      end;
      linha := '';
      CloseFile(F1);
    end;
  end;
  Dm.ArqAux1.Close;
end;

Procedure TF_Ret.GerarArquivoPoin(Sender : TOBject);
var
  linha, docdev, nomdev, datbx : String;
  qde   : Integer;
begin
  cam := F_Menu.Label27.Caption + 'InterPoint\';
  arq := 'INT' + copy(f_ret.maskedit3.text,1,2) + copy(f_ret.maskedit3.text,4,2) + copy(f_ret.maskedit3.text,7,4);
  arq := arq + '.TXT';
  Label4.Caption := arq;
  Label4.Visible := True;
  arq := cam + arq;
  AssignFile(F1, arq);
  ReWrite(F1);
  linha := '';
  qde   := 0;
  while (not Dm.ArqAux.Eof) do
  begin
    datbx  := '';
    docdev := '';
    nomdev := '';
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('SELECT nome, doc1');
    Dm.PessAux.Sql.Add('FROM td_pesso');
    Dm.PessAux.Sql.Add('WHERE');
    Dm.PessAux.Sql.Add('    p_auxiliar = ' + Dm.ArqAux.FieldByName('p_auxiliar').asString);
    Dm.PessAux.Sql.Add('AND situacao   = "D"');
    Dm.PessAux.Open;
    if (Dm.PessAux.RecordCount <> 0) then
    begin
     docdev := Copy(Dm.PessAux.FieldByName('doc1').asString, 3, 18);
     nomdev := Dm.PessAux.FieldByName('nome').asString;
    end;
    Dm.PessAux.Close;
    qde := qde + 1;
    linha := '';
    // Codigo do credor + cod_operador -> da empresa
    linha := linha + '9999911';
    // Documento
    linha := linha + StrBranco(Trim(docdev), 18, 'D');
    // Situação da Notificação - (3)
    if (Dm.ArqAux.FieldByName('data_not3').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      if Trim(Dm.ArqAux.FieldByName('sit_not3').asString) = 'P' then
        linha := linha + '9110 - FIN NOTIFICAÇÃO RETORNOU POSITIVA EM ' + Dm.ArqAux.FieldByName('data_not3').asString;
      if Trim(Dm.ArqAux.FieldByName('sit_not3').asString) = 'N' then
        linha := linha + '9111 - FIN NOTIFICAÇÃO RETORNOU NEGATIVA EM ' + Dm.ArqAux.FieldByName('data_not3').asString;
      // data da baixa
      datbx := TirarTudo(Dm.ArqAux.FieldByName('data_not3').asString, '/', '',''); 
      linha := linha + StrBranco(TirarTudo(Dm.ArqAux.FieldByName('data_not3').asString, '/', '',''), 8, 'D');
      // Contrato
      linha := linha + Strzero2(Trim(Dm.ArqAux.FieldByName('contrato').asString), 20, 'D');
      // Descrição da Ocorrência.
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir3').asString), 30, 'D') + StringOfChar(' ', 197);
    end // Situação da Notificação - (2)
    else if (Dm.ArqAux.FieldByName('data_not2').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      if Trim(Dm.ArqAux.FieldByName('sit_not2').asString) = 'P' then
        linha := linha + '9110 - FIN NOTIFICAÇÃO RETORNOU POSITIVA EM ' + Dm.ArqAux.FieldByName('data_not2').asString;
      if Trim(Dm.ArqAux.FieldByName('sit_not2').asString) = 'N' then
        linha := linha + '9111 - FIN NOTIFICAÇÃO RETORNOU NEGATIVA EM ' + Dm.ArqAux.FieldByName('data_not2').asString;
      // data da baixa
      datbx := TirarTudo(Dm.ArqAux.FieldByName('data_not2').asString, '/', '','');
      linha := linha + StrBranco(TirarTudo(Dm.ArqAux.FieldByName('data_not2').asString, '/', '',''), 8, 'D');
      // Contrato
      linha := linha + Strzero2(Trim(Dm.ArqAux.FieldByName('contrato').asString), 20, 'D');
      // Descrição da Ocorrência.
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir2').asString), 30, 'D') + StringOfChar(' ', 197);
    end   // Situação da Notificação - (1)
    else if (Dm.ArqAux.FieldByName('data_not1').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      if Trim(Dm.ArqAux.FieldByName('sit_not1').asString) = 'P' then
        linha := linha + '9110 - FIN NOTIFICAÇÃO RETORNOU POSITIVA EM ' + Dm.ArqAux.FieldByName('data_not1').asString;
      if Trim(Dm.ArqAux.FieldByName('sit_not1').asString) = 'N' then
        linha := linha + '9111 - FIN NOTIFICAÇÃO RETORNOU NEGATIVA EM ' + Dm.ArqAux.FieldByName('data_not1').asString;
      // data da baixa
      datbx := TirarTudo(Dm.ArqAux.FieldByName('data_not1').asString, '/', '','');
      linha := linha + StrBranco(TirarTudo(Dm.ArqAux.FieldByName('data_not1').asString, '/', '',''), 8, 'D');
      // Contrato
      linha := linha + Strzero2(Trim(Dm.ArqAux.FieldByName('contrato').asString), 20, 'D');
      // Descrição da Ocorrência.
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir1').asString), 30, 'D') + StringOfChar(' ', 197);
    end;
    ///Filler
    linha := linha + '        ';
    //data da ocorrência
    linha := linha + datbx;
    // Espaços em Branco
    linha := linha + StringOfChar(' ', 23);
    Grava_Linha(linha);
    Dm.ArqAux.Next;
  end;
  Dm.ArqAux.Close;
  linha := '';
  CloseFile(F1);
end;

Procedure TF_Ret.GerarArquivoHeckler(Sender : TOBject);
var
  linha, docdev, nomdev : String;
  qde   : Integer;
begin
  cam := F_Menu.Label27.Caption + 'Heckler\';
  arq := 'HEC' + Copy(TirarTudo(MaskEdit3.Text, '/', '',''), 1,4); 
  arq := arq + '.RET';
  Label4.Caption := arq;
  Label4.Visible := True;
  arq := cam + arq;
  AssignFile(F1, arq);
  ReWrite(F1);
  linha := '';
  qde   := 0;
  while (not Dm.ArqAux.Eof) do
  begin
    docdev := '';
    nomdev := '';
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('SELECT nome, doc1');
    Dm.PessAux.Sql.Add('FROM td_pesso');
    Dm.PessAux.Sql.Add('WHERE');
    Dm.PessAux.Sql.Add('    p_auxiliar = ' + Dm.ArqAux.FieldByName('p_auxiliar').asString);
    Dm.PessAux.Sql.Add('AND situacao   = "D"');
    Dm.PessAux.Open;
    if (Dm.PessAux.RecordCount <> 0) then
    begin
      docdev := Dm.PessAux.FieldByName('doc1').asString;
      nomdev := Dm.PessAux.FieldByName('nome').asString;
    end;
    Dm.PessAux.Close;
    qde := qde + 1;
    linha := '';
    // Nome do Devedor
    linha := linha + StrBranco(Trim(nomdev), 50, 'D');
    // Documento
    linha := linha + StrZero(Trim(docdev), 14);
    // Contrato
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('contrato').asString), 20, 'D');
    // parcela
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('parcelas').asString), 9, 'D');
    // Nº Certificado
    linha := linha + StrZero(Dm.ArqAux.FieldByName('certcertif').asString, 8);
    // Situação da Notificação - (3)
    if (Dm.ArqAux.FieldByName('data_not3').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      // Código da Ocorrência
      linha := linha + Strzero(TirarTudo(Dm.ArqAux.FieldByName('cod_ir3').asString, '/', '',''), 4);
      // Descrição da Ocorrência.
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir3').asString), 30, 'D');
      // Situação da Notificação
      linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('sit_not3').asString), 1, 'D');
      // Data da Situação
      linha := linha + StrBranco(TirarTudo(Dm.ArqAux.FieldByName('data_not3').asString, '/', '',''), 8, 'D');
    end    // Situação da Notificação - (2)
    else if (Dm.ArqAux.FieldByName('data_not2').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      // Código da Ocorrência
      linha := linha + Strzero(TirarTudo(Dm.ArqAux.FieldByName('cod_ir2').asString, '/', '',''), 4);
      // Descrição da Ocorrência.
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir2').asString), 30, 'D');
      // Situação da Notificação
      linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('sit_not2').asString), 1, 'D');
      // Data da Situação
      linha := linha + StrBranco(TirarTudo(Dm.ArqAux.FieldByName('data_not2').asString, '/', '',''), 8, 'D');
    end // Situação da Notificação - (1)
    else if (Dm.ArqAux.FieldByName('data_not1').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      // Código da Ocorrência
      linha := linha + Strzero(TirarTudo(Dm.ArqAux.FieldByName('cod_ir1').asString, '/', '',''), 4);
      // Descrição da Ocorrência.
      linha := linha + StrBranco(Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir1').asString), 30, 'D');
      // Situação da Notificação
      linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('sit_not1').asString), 1, 'D');
      // Data da Situação
      linha := linha + StrBranco(TirarTudo(Dm.ArqAux.FieldByName('data_not1').asString, '/', '',''), 8, 'D');
    end;
    // Nº do Registro
    linha := linha + StrZero(Trim(Dm.ArqAux.FieldByName('registro').asString), 8);
    // Data do Registro
    linha := linha + StrBranco(TirarTudo(Dm.ArqAux.FieldByName('data_p').asString, '/', '',''), 8, 'D');
    Grava_Linha(linha);
    Dm.ArqAux.Next;
  end;
  Dm.ArqAux.Close;
  linha := '';
  CloseFile(F1);
end;

procedure TF_Ret.BitBtn2Click(Sender: TObject);
begin
  Label4.Visible := False;
  Label4.Caption := '';
  MaskEdit1.Text := '';
  MaskEdit3.Text := '';
  MaskEdit1.SetFocus;
end;

procedure TF_Ret.MaskEdit1KeyDwn(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Ret.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
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
    Dm.ArqAux.Sql.Add('    (data_not1 >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND data_not1 <= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) + ')');
    Dm.ArqAux.Sql.Add('OR  (data_not2  >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND  data_not2 <= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) + ')');
    Dm.ArqAux.Sql.Add('OR  (data_not3  >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND  data_not3 <= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) + ')');
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
    MaskEdit3.SetFocus;
  end;
end;

procedure TF_Ret.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_Ret.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Ret.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
  MaskEdit3.Text := DateToStr(date);
  MaskEdit1.SetFocus;
end;

procedure TF_Ret.BitBtn1Click(Sender: TObject);
begin
  if (not ValidData(MaskEdit1.Text)) OR
     (not ValidData(MaskEdit3.Text)) then
  begin
    ShowMessage('Data Inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT arquivo, lote, a_cpff, contrato, parcelas, pr1, registro, versao, carta,');
  Dm.ArqAux.Sql.Add('data_p, p_auxiliar, data_not1, data_not2, data_not3,');
  Dm.ArqAux.Sql.Add('agencia, regional, certcertif,');
  Dm.ArqAux.Sql.Add('sit_not1, sit_not2, sit_not3, cod_ir1, cod_ir2, cod_ir3, grupo, cota');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    (data_not1 >= ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  Dm.ArqAux.Sql.Add('AND  data_not1 <= ' +  Chr(39) + ConvData(MaskEdit1.Text)           + Chr(39));
  Dm.ArqAux.Sql.Add('AND ncliente    = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3))));
  Dm.ArqAux.Sql.Add('AND sit_not1   <> "L")');
  Dm.ArqAux.Sql.Add('OR  (data_not2 >= ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  Dm.ArqAux.Sql.Add('AND  data_not2 <= ' +  Chr(39) + ConvData(MaskEdit1.Text)           + Chr(39));
  Dm.ArqAux.Sql.Add('AND  ncliente   = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3))));
  Dm.ArqAux.Sql.Add('AND sit_not2   <> "L")');
  Dm.ArqAux.Sql.Add('OR  (data_not3 >= ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  Dm.ArqAux.Sql.Add('AND  data_not3 <= ' +  Chr(39) + ConvData(MaskEdit1.Text)           + Chr(39));
  Dm.ArqAux.Sql.Add('AND  ncliente   = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3))));
  Dm.ArqAux.Sql.Add('AND sit_not3   <> "L")');
  Dm.ArqAux.Sql.Add('ORDER BY registro'); 
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;
  arq := '';
  cam := '';
  if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 1)  then GerarArquivoAval(F_Ret);
  if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 3)  then GerarArquivoRoss(F_Ret);
  if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 4)  then GerarArquivoPoin(F_Ret);
  if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 18) then GerarArquivoMLGomes(F_Ret);
  if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 10) then GerarArquivoHeckler(F_Ret);
  Dm.ArqAux.Close;
end;

procedure TF_Ret.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_Ret.ComboBox1Enter(Sender: TObject);
begin
  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_Ret.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit2.Text := MaskEdit1.Text;
end;

end.
