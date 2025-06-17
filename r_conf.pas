unit r_conf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, jpeg;

type
  Tf_relconf = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    SaveDialog1: TSaveDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    Procedure GerarArquivoTxt(Sender : TOBject; Tipo : Integer);
    Procedure GerarArquivoCorreio(Sender : TOBject; Tipo : Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_relconf: Tf_relconf;
  dat, cam : String;
  F1 : TextFile;

implementation

uses Menu, DMTD, QkConfI, QkConf, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure Grava_linha(linha : String);
begin
  WriteLn(F1, linha);
end;

Procedure TF_RelConf.GerarArquivoTxt(Sender : TOBject; Tipo : Integer);
var
  linha, docdev, nomdev, arqu : String;
  qde   : Integer;
  vr : Currency;
begin
  SaveDialog1.InitialDir := F_Menu.Label27.Caption;
  SaveDialog1.FileName   := 'C' + TirarTudo(MaskEdit1.Text, '/', '', '') + '.TXT';
  if (SaveDialog1.Execute) then
  begin
    AssignFile(F1, SaveDialog1.FileName);
    ReWrite(F1);
    linha := '';
    qde   := 0;
    //linha Header
    linha := F_Menu.Caption;
    Grava_Linha(linha);
    if (Tipo = 0) then
    begin
      linha := 'CONFIRMAÇÃO DE NOTIFICAÇÕES RECEBIDAS EM ' + MaskEdit1.Text + '  - DATA DO ARQUIVO DE ORIGEM : ' + dat
    end
    else linha := 'CONFIRMAÇÃO DE NOTIFICAÇÕES RECEBIDAS EM ' + MaskEdit1.Text;
    Grava_Linha(linha);
    linha := StringOfChar('-', 272);
    Grava_Linha(linha);
    linha := ':     CONTRATO     : PARCELA :  VALOR PARCELA  : VENCIMENTO : PROTOCOLO : REGISTRO :     CUSTAS     :' +
             ' DESTINATÁRIO                                                : ENDEREÇO                                                                                 :    NÚMERO AR    :';
    Grava_Linha(linha);
    linha := StringOfChar('-', 272);
    Grava_Linha(linha);
    qde := 0;
    vr  := 0.00;
    while (not Dm.ArqAux.Eof) do
    begin
      linha :=         ':'   + StrBranco(Dm.ArqAux.FieldByName('contrato').asString, 18, 'D');
      linha := linha + ':'   + StrBranco(Dm.ArqAux.FieldByName('parcela').asString,   9, 'E');
      linha := linha + ':'   + StrBranco('R$' + Trim(Dm.ArqAux.FieldByName('valor').asString), 17, 'E');
      if (Trim(Dm.ArqAux.FieldByName('ven_parc').asString) <> '') then
      begin
        linha := linha + ':'   + ' ' + Dm.ArqAux.FieldByName('ven_parc').asString + ' ';
      end
      else linha := linha + ':'   + '            ';  
      linha := linha + ':'   + StrBranco(StrZero(Dm.ArqAux.FieldByName('p_auxiliar').asString, 8), 11, 'E');
      linha := linha + ':'   + StrBranco(Dm.ArqAux.FieldByName('registro').asString,  10, 'E');
      if (Trim(Dm.ArqAux.FieldByName('custas').asString) = '') then
      begin
        linha := linha + ':'   + StrBranco('', 16, 'E');
      end
      else linha := linha + ':'   + StrBranco('R$' + Trim(Dm.ArqAux.FieldByName('custas').asString), 16, 'E');
      linha := linha + ': '  + StrBranco(Trim(Dm.ArqAux.FieldByName('destinatario').asString), 60, 'D');
      linha := linha + ': '  + StrBranco(Trim(Dm.ArqAux.FieldByName('endereco').asString), 89, 'D');
      linha := linha + ': '  + StrBranco(Trim(Dm.ArqAux.FieldByName('rl').asString), 16, 'E');
      linha := linha + ':';
      Grava_Linha(linha);
      linha := StringOfChar('-', 272);
      if (Dm.ArqAux.FieldByName('traco').asString = 'S') then Grava_Linha(linha);
      if (Dm.ArqAux.FieldByName('custasv').asCurrency > 0) then
      begin
        qde := qde + 1;
        vr  := vr  + Dm.ArqAux.FieldByName('custasv').asCurrency;
      end;  
      Dm.ArqAux.Next;
    end;
    linha := 'TOTAL DE REGISTROS ' + StrZero(IntToStr(qde), 4) + '  VALOR DAS CUSTAS : R$ ' + Trim(StrCurr(vr, 14, True));
    Grava_Linha(linha);
    Dm.ArqAux.Close;
    CloseFile(F1);
  end;  
end;

Procedure TF_RelConf.GerarArquivoCorreio(Sender : TOBject; Tipo : Integer);
var
  linha, docdev, nomdev, arqu : String;
  qde   : Integer;
  vr : Currency;
begin
//  if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 6) then cam := F_Menu.Label27.Caption + 'Intercap\' else cam := F_Menu.Label27.Caption;
  cam := F_Menu.Label33.Caption;
  arqu := 'C' + TirarTudo(MaskEdit1.Text, '/', '', '') + '.TXT';
  arqu := cam + arqu;
  AssignFile(F1, arqu);
  ReWrite(F1);
  linha := '';
  qde   := 0;
  vr    := 0.00;
  While (not Dm.ArqAux.Eof) do
  Begin
    linha :=         StrBranco(Trim(Dm.ArqAux.FieldByName('rl').asString), 9, 'E');
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('destinatario').asString), 44, 'D');
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('endereco2').asString + ' ' + Dm.ArqAux.FieldByName('numero').asString + ' ' + Dm.ArqAux.FieldByName('complemento').asString), 44, 'D');
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('cidade').asString), 15, 'D');
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('estado').asString), 2, 'D');
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('cep').asString), 8, 'D');
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('empresa').asString), 47, 'D');
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('p_auxiliar').asString), 7, 'E');
    linha := linha + StrBranco(Trim(Dm.ArqAux.FieldByName('n_talao').asString), 7, 'E');
    linha := linha + Copy(MaskEdit1.Text,7,4) + Copy(MaskEdit1.Text,4,2) + Copy(MaskEdit1.Text,1,2);
    Grava_Linha(linha);
    Dm.ArqAux.Next;
  end;
  Dm.ArqAux.Close;
  CloseFile(F1);
end;


Procedure ColocaTraco(tabela, registro : String);
var
  rec : String;
begin
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('SELECT count(*) rec FROM ' + tabela);
  Dm.ArqAux1.Open;
  rec := Dm.ArqAux1.FieldByName('rec').asString;
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('UPDATE ' + tabela + ' SET');
  Dm.ArqAux1.Sql.Add('traco = "S"');
  Dm.ArqAux1.Sql.Add('WHERE');
  Dm.ArqAux1.Sql.Add('recno = ' + rec);
  Dm.ArqAux1.ExecSQL;
  Dm.ArqAux1.Close;
end;

procedure Tf_relconf.BitBtn3Click(Sender: TObject);
begin
 Close;
end;

procedure Tf_relconf.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
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
    Dm.ArqAux.Sql.Add('data_r = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
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

procedure Tf_relconf.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit3.setfocus;
end;

procedure Tf_relconf.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
end;

procedure Tf_relconf.BitBtn1Click(Sender: TObject);
var
  arq, ende : String;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT a.a_nome, a.a_cidade, a.contrato, a.parcelas, a.ven_parc, a.val_parc, a.custas, a.arquivo, a.agencia,');
  Dm.Join.Sql.Add('a.parc2, a.ven_parc2, a.val_parc2, a.rl,');
  Dm.Join.Sql.Add('a.parc3, a.ven_parc3, a.val_parc3,');
  Dm.Join.Sql.Add('a.parc4, a.ven_parc4, a.val_parc4,');
  Dm.Join.Sql.Add('a.parc5, a.ven_parc5, a.val_parc5,');
  Dm.Join.Sql.Add('a.parc6, a.ven_parc6, a.val_parc6,');
  Dm.Join.Sql.Add('a.data_p, a.registro, a.p_auxiliar, a.ncliente,');
  Dm.Join.Sql.Add('b.nome, b.endereco, b.numero, b.complem,');
  Dm.Join.Sql.Add('b.cidade, b.cep, b.estado, b.bairro');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
  Dm.Join.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('    a.data_r = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  if (StrToInt(MaskEdit2.Text) > 0) AND (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.Join.Sql.Add('AND a.protocolo >= ' + Trim(MaskEdit2.Text) +  ' AND a.protocolo <= ' + Trim(MaskEdit3.Text));
  end;
  Dm.Join.Sql.Add('AND a.ncliente = ' + IntToStr(StrToInt(Trim(Copy(ComboBox1.Text, 1,3)))));
  Dm.Join.Sql.Add('AND a.natureza = 197');
  Dm.Join.Sql.Add('AND b.situacao = "D"');
  Dm.Join.Open;
  if (Dm.Join.RecordCount = 0) then
  begin
    Dm.Join.Close;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'RET';
  CriaTabela('RET', arq);
  Dm.ArqAux.Close;
  Dm.ArqAux.RequestLive := True;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Open;
  while (not Dm.Join.Eof) do
  begin
    ende := '';
    ende := Dm.Join.FieldByName('endereco').asString;
    if (Trim(Dm.Join.FieldByName('numero').asString) <> '') then
    begin
      ende := ende + ' Nº ' + Dm.Join.FieldByName('numero').asString;
    end;
    ende := Trim(ende) + Trim(Dm.Join.FieldByName('complem').asString) + ' ';
    if (Trim(Dm.Join.FieldByName('bairro').asString) <> '') then
    begin
      ende := Trim(ende) + ' ' + Trim(Dm.Join.FieldByName('bairro').asString);
    end;
    if (Trim(Dm.Join.FieldByName('cidade').asString) <> '') then
    begin
      ende := Trim(ende) + ' ' + Trim(Dm.Join.FieldByName('cidade').asString) + ' - ' + Trim(Dm.Join.FieldByName('estado').asString) + ' ' + FormataCep(Dm.Join.FieldByName('cep').asString);
    end;
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.Join.FieldByName('registro').asInteger;
    Dm.ArqAux.FieldByName('data').asString         := MaskEdit1.Text;
    Dm.ArqAux.FieldByName('registro').asString     := StrZero(Dm.Join.FieldByName('registro').asString, 8);
    Dm.ArqAux.FieldByName('data_p').asString       := Dm.Join.FieldByName('data_p').asString;
    Dm.ArqAux.FieldByName('p_auxiliar').asString   := Dm.Join.FieldByName('p_auxiliar').asString;
    Dm.ArqAux.FieldByName('ncliente').asString     := Dm.Join.FieldByName('ncliente').asString;
    if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 20) then
    begin
      Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('agencia').asString);
    end
    else
    if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 1) then
    begin
      if (Trim(Dm.Join.FieldByName('agencia').asString) <> '') then
      begin
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString) + ' - Filial : ' + Trim(Dm.Join.FieldByName('agencia').asString);
      end
      else Dm.ArqAux.FieldByName('empresa').asString   := Trim(Dm.Join.FieldByName('a_nome').asString);
    end
    else
    begin
      if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 6) then
      begin
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString);
      end
      else Dm.ArqAux.FieldByName('empresa').asString   := Trim(Dm.Join.FieldByName('a_nome').asString  + ' - ' + Trim(Dm.Join.FieldByName('agencia').asString));
    end;
    Dm.ArqAux.FieldByName('filial').asString       := Trim(Dm.Join.FieldByName('a_cidade').asString);
    Dm.ArqAux.FieldByname('endereco').asString     := ende;

    { Edson - inicio }
    Dm.ArqAux.FieldByname('numero').asString       := Trim(Dm.Join.FieldByName('numero').asString);
    Dm.ArqAux.FieldByname('complemento').asString  := Trim(Dm.Join.FieldByName('complem').asString);
    Dm.ArqAux.FieldByname('endereco2').asString    := Trim(Dm.Join.FieldByName('endereco').asString);
    Dm.ArqAux.FieldByname('cidade').asString       := Trim(Dm.Join.FieldByName('cidade').asString);
    Dm.ArqAux.FieldByname('estado').asString       := Trim(Dm.Join.FieldByName('estado').asString);
    Dm.ArqAux.FieldByname('cep').asString          := Trim(Dm.Join.FieldByName('cep').asString);
    Dm.ArqAux.FieldByName('rl2').asString          := Trim(Dm.Join.FieldByName('rl').asString);
    { Edson - fim }

    Dm.ArqAux.FieldByName('destinatario').asString := Dm.Join.FieldByName('nome').asString;
    Dm.ArqAux.FieldByName('contrato').asString     := Trim(Dm.Join.FieldByName('contrato').asString);
    if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
    begin
      Dm.ArqAux.FieldByName('parcela').asString      := Copy(TirarTudo(Dm.Join.FieldByName('parcelas').asString, '/','',''), 1, 3) + '/' + Copy(TirarTudo(Dm.Join.FieldByName('parcelas').asString, '/','',''), 4, 3);
    end
    else Dm.ArqAux.FieldByName('parcela').asString   := Dm.Join.FieldByName('parcelas').asString;

    if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 20) then Dm.ArqAux.FieldByName('parcela').asString := Dm.Join.FieldByName('parcelas').asString;

    Dm.ArqAux.FieldByName('ven_parc').asString     := Trim(Dm.Join.FieldByName('ven_parc').asString);
    Dm.ArqAux.FieldByName('valor').asString        := Trim(StrCurr(Dm.Join.FieldByName('val_parc').asCurrency, 14, True));
    Dm.ArqAux.FieldByName('custas').asString       := Trim(StrCurr(Dm.Join.FieldByName('custas').asCurrency, 14, True));
    Dm.ArqAux.FieldByName('custasv').asCurrency    := Dm.Join.FieldByName('custas').asCurrency;
    Dm.ArqAux.FieldByName('rl').asString           := 'RZ ' + Trim(Dm.Join.FieldByName('rl').asString) + ' BR';
    Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
    Dm.ArqAux.Post;
{    //Verificando se é a empresa 04 - Intercap
    if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 6) then
    begin
      if (Trim(Dm.Join.FieldByName('parc2').asString) <> '') then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.Join.FieldByName('registro').asInteger;
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('contrato').asString     := Trim(Dm.Join.FieldByName('contrato').asString);
        if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
        begin
          Dm.ArqAux.FieldByName('parcela').asString      := Copy(Dm.Join.FieldByName('parc2').asString, 1, 3) + '/' + Copy(Dm.Join.FieldByName('parc2').asString, 4, 3);
        end
        else Dm.ArqAux.FieldByName('parcela').asString   := Dm.Join.FieldByName('parc2').asString;
        Dm.ArqAux.FieldByName('ven_parc').asString     := Trim(Dm.Join.FieldByName('ven_parc2').asString);
        Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Join.FieldByName('val_parc2').asCurrency, 14, True);
        Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
        Dm.ArqAux.Post;
      end
      else ColocaTraco(arq, Dm.Join.FieldByName('p_auxiliar').asString);
      if (Trim(Dm.Join.FieldByName('parc3').asString) <> '') then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.Join.FieldByName('registro').asInteger;
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('contrato').asString     := Trim(Dm.Join.FieldByName('contrato').asString);
        if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
        begin
          Dm.ArqAux.FieldByName('parcela').asString      := Copy(Dm.Join.FieldByName('parc3').asString, 1, 3) + '/' + Copy(Dm.Join.FieldByName('parc3').asString, 4, 3);
        end
        else Dm.ArqAux.FieldByName('parcela').asString   := Dm.Join.FieldByName('parc3').asString;
        Dm.ArqAux.FieldByName('ven_parc').asString     := Trim(Dm.Join.FieldByName('ven_parc3').asString);
        Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Join.FieldByName('val_parc3').asCurrency, 14, True);
        Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
        Dm.ArqAux.Post;
      end
      else ColocaTraco(arq, Dm.Join.FieldByName('p_auxiliar').asString);
      if (Trim(Dm.Join.FieldByName('parc4').asString) <> '') then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.Join.FieldByName('registro').asInteger;
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('contrato').asString     := Trim(Dm.Join.FieldByName('contrato').asString);
        if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
        begin
          Dm.ArqAux.FieldByName('parcela').asString      := Copy(Dm.Join.FieldByName('parc4').asString, 1, 3) + '/' + Copy(Dm.Join.FieldByName('parc4').asString, 4, 3);
        end
        else Dm.ArqAux.FieldByName('parcela').asString   := Dm.Join.FieldByName('parc4').asString;
        Dm.ArqAux.FieldByName('ven_parc').asString     := Trim(Dm.Join.FieldByName('ven_parc4').asString);
        Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Join.FieldByName('val_parc4').asCurrency, 14, True);
        Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
        Dm.ArqAux.Post;
      end
      else ColocaTraco(arq, Dm.Join.FieldByName('p_auxiliar').asString);
      if (Trim(Dm.Join.FieldByName('parc5').asString) <> '') then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.Join.FieldByName('registro').asInteger;
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('contrato').asString     := Trim(Dm.Join.FieldByName('contrato').asString);
        if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
        begin
          Dm.ArqAux.FieldByName('parcela').asString      := Copy(Dm.Join.FieldByName('parc5').asString, 1, 3) + '/' + Copy(Dm.Join.FieldByName('parc5').asString, 4, 3);
        end
        else Dm.ArqAux.FieldByName('parcela').asString   := Dm.Join.FieldByName('parc5').asString;
        Dm.ArqAux.FieldByName('ven_parc').asString     := Trim(Dm.Join.FieldByName('ven_parc5').asString);
        Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Join.FieldByName('val_parc5').asCurrency, 14, True);
        Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
        Dm.ArqAux.Post;
      end
      else ColocaTraco(arq, Dm.Join.FieldByName('p_auxiliar').asString);
      if (Trim(Dm.Join.FieldByName('parc6').asString) <> '') then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.Join.FieldByName('registro').asInteger;
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Join.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('contrato').asString     := Trim(Dm.Join.FieldByName('contrato').asString);
        if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
        begin
          Dm.ArqAux.FieldByName('parcela').asString      := Copy(Dm.Join.FieldByName('parc6').asString, 1, 3) + '/' + Copy(Dm.Join.FieldByName('parc6').asString, 4, 3);
        end
        else Dm.ArqAux.FieldByName('parcela').asString   := Dm.Join.FieldByName('parc6').asString;
        Dm.ArqAux.FieldByName('ven_parc').asString     := Trim(Dm.Join.FieldByName('ven_parc6').asString);
        Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Join.FieldByName('val_parc6').asCurrency, 14, True);
        Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
        Dm.ArqAux.Post;
      end
      else ColocaTraco(arq, Dm.Join.FieldByName('p_auxiliar').asString);
    end; }
    Dm.Join.Next;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.RequestLive := False;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 1) OR
     (StrToInt(Copy(ComboBox1.Text, 1,3)) = 6) then
  begin
    Dm.ArqAux.Sql.Add('ORDER BY indexador, empresa');
  end
  else Dm.ArqAux.Sql.Add('ORDER BY empresa, indexador');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    ShowMessage('Movimento não encontrado !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  //Verificando se é a empresa 06 - Intercap
  if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 6) then
  begin
    dat := '';
    while (not ValidData(dat)) do
    begin
      dat := InputBox('CONFIRMAÇÃO INTERCAP', 'Data do arquivo origem : ', DateToStr(date));
    end;
    if (CheckBox1.Checked) then
    begin
      if CheckBox1.Checked then GerarArquivoTxt(F_RelConf, 0);
    end
    else
    begin
      QrDestroi;
      Application.CreateForm(TQk_ConfI, Qk_ConfI);
      Qk_ConfI.QrLabel1.Caption  := F_Menu.Label29.Caption;
      Qk_ConfI.QrLabel2.Caption  := 'CONFIRMAÇÃO DE NOTIFICAÇÕES RECEBIDAS EM ' + MaskEdit1.Text + '  - DATA DO ARQUIVO DE ORIGEM : ' + dat;
      Qk_ConfI.Somareg := 0;
      Qk_ConfI.Somavlr := 0;
      Qk_ConfI.QuickRep1.Preview;
      Qk_ConfI.Destroy;
      Qk_ConfI := NIL;
    end;
  end
  else
  begin
    if (CheckBox1.Checked) then
    begin
      if CheckBox1.Checked then GerarArquivoTxt(F_RelConf, 1);
    end
    else
    begin
      QrDestroi;
      Application.CreateForm(TQk_Conf, Qk_Conf);
      Qk_Conf.QrLabel1.Caption  := F_Menu.Label29.Caption;
      Qk_Conf.QrLabel2.Caption  := 'CONFIRMAÇÃO DE NOTIFICAÇÕES RECEBIDAS EM ' + MaskEdit1.Text;
      if (StrToInt(Copy(ComboBox1.Text, 1,3)) <> 1) then Qk_Conf.Label1.Caption    := Busca_NomePortador(Copy(ComboBox1.Text, 1,3)) else Qk_Conf.Label1.Caption := '';
      Qk_Conf.Somareg := 0;
      Qk_Conf.Somavlr := 0;
      Qk_Conf.QuickRep1.Preview;
      Qk_Conf.Destroy;
      Qk_Conf := NIL;
    end;
  end;
  DestroeTabela(arq);
end;

procedure Tf_relconf.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  MaskEdit3.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit1.SetFocus;
end;

procedure Tf_relconf.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(Date);
end;

procedure Tf_relconf.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure Tf_relconf.MaskEdit2Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit2.Text)) then MaskEdit2.Text := '0';
end;

procedure Tf_relconf.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure Tf_relconf.ComboBox1Enter(Sender: TObject);
begin
  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

end.
