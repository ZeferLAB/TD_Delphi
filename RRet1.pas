unit RRet1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, jpeg;

type
  TF_RRetor1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    SaveDialog1: TSaveDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    Procedure GerarArquivoTxt(Sender : TOBject);    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RRetor1: TF_RRetor1;
  tpbx    : String;
  F1      : TextFile;

implementation

uses DMTD, Menu, QkRetPad, QkRetI, RRet, QkRetPad1, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure Grava_linha(linha : String);
begin
  WriteLn(F1, linha);
end;

Procedure TF_RRetor1.GerarArquivoTxt(Sender : TOBject);
var
  linha, docdev, nomdev, arqu, cam : String;
  qde   : Integer;
  vr : Currency;
begin

  if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 6) then cam := F_Menu.Label27.Caption + 'Intercap\' else cam := F_Menu.Label27.Caption;
  //arqu := Trim(Copy(ComboBox2.Text, 5, 20)) + '.TXT';
  //Coutinho 17/02 OS26649
  arqu := Trim(Copy(ComboBox1.Text, 7, 3)) + TrimChar(Copy(maskedit1.text,1,5),'/') + Copy(combobox2.text,1,2) + '.TXT';
  arqu := cam + '\' + arqu;
  { Edson inicio }
  F_RRetor1.SaveDialog1.FileName := arqu;
  F_RRetor1.SaveDialog1.Execute;
  arqu := F_RRetor1.SaveDialog1.FileName;
  { Edson fim }
  AssignFile(F1, arqu);
  ReWrite(F1);
  linha := '';
  qde   := 0;
  //linha Header
  linha := F_Menu.Caption;
  Grava_Linha(linha);
  linha := Dm.ArqAux.FieldByName('empresa').asString;
  Grava_Linha(linha);
  linha := StringOfChar('-', 200);
  Grava_Linha(linha);
  linha := '| REGISTRO | DT. REGISTRO | PROTOCOLO | DESTINATÁRIO                             |        CONTRATO        | PARCELA | VENCIMENTO |             VALOR | OCORRÊNCIA                                      |';
  Grava_Linha(linha);
  linha := StringOfChar('-', 200);
  Grava_Linha(linha);
  while (not Dm.ArqAux.Eof) do
  begin
    linha := '';
    linha :=         '|'  + StrBranco(Dm.ArqAux.FieldByName('registro').asString, 10, 'C');
    linha := linha + '|'  + StrBranco(Dm.ArqAux.FieldByName('data_p').asString, 14, 'C');
    linha := linha + '|'  + StrBranco(Dm.ArqAux.FieldByName('p_auxiliar').asString, 11, 'C');
    linha := linha + '| ' + StrBranco(Dm.ArqAux.FieldByName('destinatario').asString, 41, 'D');
    linha := linha + '|'  + StrBranco(Dm.ArqAux.FieldByName('contrato').asString, 24, 'C');
    linha := linha + '|'  + StrBranco(Dm.ArqAux.FieldByName('parcela').asString, 9, 'C');
    linha := linha + '|'  + StrBranco(Dm.ArqAux.FieldByName('ven_parc').asString, 12, 'C');
    linha := linha + '|'  + StrBranco(Dm.ArqAux.FieldByName('valor').asString, 19, 'E');
    linha := linha + '| ' + StrBranco(Dm.ArqAux.FieldByName('ocorrencia').asString, 48, 'D');
    linha := linha + '|';
    Grava_Linha(linha);
    if (Trim(Dm.ArqAux.FieldByName('destinatario').asString) <> '') then qde := qde + 1; 
    Dm.ArqAux.Next;
  end;
  linha := StringOfChar('-', 200);
  Grava_Linha(linha);
  linha := StrZero(IntToStr(qde), 4) + ' NOTIFICAÇÕES CERTIFICADAS.';
  Grava_Linha(linha);  
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

procedure TF_RRetor1.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RRetor1.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit1.SetFocus;
end;

procedure TF_RRetor1.BitBtn1Click(Sender: TObject);
var
  arq : String;
  contrato : String;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Td.Close;
  Dm.Td.Sql.Clear;
  Dm.Td.Sql.Add('SELECT a_nome, contrato, parcelas, ven_parc, val_parc, arquivo,');
  Dm.Td.Sql.Add('parc2, ven_parc2, valor2, val_parc2,');
  Dm.Td.Sql.Add('parc3, ven_parc3, valor3, val_parc3,');
  Dm.Td.Sql.Add('parc4, ven_parc4, valor4, val_parc4,');
  Dm.Td.Sql.Add('parc5, ven_parc5, valor5, val_parc5,');
  Dm.Td.Sql.Add('parc6, ven_parc6, valor6, val_parc6,');
  Dm.Td.Sql.Add('data_p, registro, p_auxiliar, data_not1, data_not2, data_not3,');
  Dm.Td.Sql.Add('sit_not1, sit_not2, sit_not3, cod_ir1, cod_ir2, cod_ir3');
  Dm.Td.Sql.Add('FROM td');
  Dm.Td.Sql.Add('WHERE');
  Dm.Td.Sql.Add('    (data_not1 = ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  Dm.Td.Sql.Add('AND ncliente   = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3))));
  Dm.Td.Sql.Add('AND sit_not1   = ' + Chr(39) + tpbx + Chr(39) + ')');
  Dm.Td.Sql.Add('OR  (data_not2 = ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  Dm.Td.Sql.Add('AND  ncliente  = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3))));
  Dm.Td.Sql.Add('AND sit_not2   = ' + Chr(39) + tpbx + Chr(39) + ')');
  Dm.Td.Sql.Add('OR  (data_not3 = ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  Dm.Td.Sql.Add('AND  ncliente  = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3))));
  Dm.Td.Sql.Add('AND sit_not3   = ' + Chr(39) + tpbx + Chr(39) + ')');
  Dm.Td.Sql.Add('ORDER BY registro');
  Dm.Td.Open;
  if (Dm.Td.RecordCount = 0) then
  begin
    Dm.Td.Close;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'RET';
  CriaTabela('RET', arq);
  //Limpar cas de pau na criacao e destruicao - Coutinho
  Dm.ArqAux.Close;
  Dm.ArqAux.RequestLive := True;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('delete from ' + arq);
  Dm.ArqAux.ExecSql;

  Dm.ArqAux.Close;
  Dm.ArqAux.RequestLive := True;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Open;
  while (not Dm.Td.Eof) do
  begin
    contrato := '';
    if (Trim(Dm.Td.FieldByName('contrato').asString) <> '') then
    begin
      contrato := Trim(Dm.Td.FieldByName('contrato').asString);
    end
    else contrato := Busca_Contrato(Dm.Td.FieldByName('registro').asString);
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.TD.FieldByName('registro').asInteger;
    Dm.ArqAux.FieldByName('data').asString         := MaskEdit1.Text;
    Dm.ArqAux.FieldByName('registro').asString     := StrZero(Dm.Td.FieldByName('registro').asString, 8);
    Dm.ArqAux.FieldByName('data_p').asString       := Dm.Td.FieldByName('data_p').asString;
    Dm.ArqAux.FieldByName('p_auxiliar').asString   := Dm.Td.FieldByName('p_auxiliar').asString;
    Dm.ArqAux.FieldByName('empresa').asString      := TirarTudo(Dm.Td.FieldByName('a_nome').asString, '/', '', '');
    Dm.ArqAux.FieldByName('destinatario').asString := Busca_NomePessoal(Dm.Td.FieldByName('p_auxiliar').asString, 'D');
    Dm.ArqAux.FieldByName('contrato').asString     := contrato;
    if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 6) then
    begin
      if (Trim(Dm.Td.FieldByName('arquivo').asString) <> '') then
      begin
        Dm.ArqAux.FieldByName('parcela').asString := Copy(Dm.Td.FieldByName('parcelas').asString, 1, 3) + '/' + Copy(Dm.Td.FieldByName('parcelas').asString, 4, 3);
      end
      else Dm.ArqAux.FieldByName('parcela').asString := Dm.Td.FieldByName('parcelas').asString;  
    end
    else Dm.ArqAux.FieldByName('parcela').asString      := StrZero(Dm.Td.FieldByName('parcelas').asString, 7);
    Dm.ArqAux.FieldByName('ven_parc').asString     := Trim(Dm.Td.FieldByName('ven_parc').asString);
    Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Td.FieldByName('val_parc').asCurrency, 14, True);
    Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
    if (Dm.Td.FieldByName('data_not3').asDateTime = StrToDate(MaskEdit1.Text)) then
    begin
      if (Dm.Td.FieldByName('sit_not3').asString = 'P') then
      begin
        Dm.ArqAux.FieldbyName('ocorrencia').asString := 'POSITIVA';
      end
      else
      begin
        if (Dm.Td.FieldByName('sit_not3').asString = 'L') then
        begin
          Dm.ArqAux.FieldbyName('ocorrencia').asString := 'CERTIDÃO PARCIAL';
        end
        else
        begin
          if (Dm.Td.FieldByName('sit_not3').asString = 'N') then
          begin
            Dm.ArqAux.FieldByName('ocorrencia').asString := Ver_Ocorrencia(Dm.Td.FieldByName('cod_ir3').asString);
          end;
        end;
      end;
    end
    else
    begin
      if (Dm.Td.FieldByName('data_not2').asDateTime = StrToDate(MaskEdit1.Text)) then
      begin
        if (Dm.Td.FieldByName('sit_not2').asString = 'P') then
        begin
          Dm.ArqAux.FieldbyName('ocorrencia').asString := 'POSITIVA';
        end
        else
        begin
          if (Dm.Td.FieldByName('sit_not2').asString = 'L') then
          begin
            Dm.ArqAux.FieldbyName('ocorrencia').asString := 'CERTIDÃO PARCIAL';
          end
          else
          begin
            if (Dm.Td.FieldByName('sit_not2').asString = 'N') then
            begin
              Dm.ArqAux.FieldByName('ocorrencia').asString := Ver_Ocorrencia(Dm.Td.FieldByName('cod_ir2').asString);
            end;
          end;
        end;
      end
      else
      begin
        if (Dm.Td.FieldByName('data_not1').asDateTime = StrToDate(MaskEdit1.Text)) then
        begin
          if (Dm.Td.FieldByName('sit_not1').asString = 'P') then
          begin
            Dm.ArqAux.FieldbyName('ocorrencia').asString := 'POSITIVA';
          end
          else
          begin
            if (Dm.Td.FieldByName('sit_not1').asString = 'L') then
            begin
              Dm.ArqAux.FieldbyName('ocorrencia').asString := 'CERTIDÃO PARCIAL';
            end
            else
            begin
              if (Dm.Td.FieldByName('sit_not1').asString = 'N') then
              begin
                Dm.ArqAux.FieldByName('ocorrencia').asString := Ver_Ocorrencia(Dm.Td.FieldByName('cod_ir1').asString);
              end;
            end;
          end;
        end;
      end;
    end;
    Dm.ArqAux.Post;
    //Verificando se é a empresa 06 - Intercap
    if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 6) then
    begin
      if (Trim(Dm.Td.FieldByName('parc2').asString) <> '') then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.TD.FieldByName('registro').asInteger;
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Td.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('contrato').asString     := contrato;
        if (Trim(Dm.Td.FieldByName('arquivo').asString) <> '') then
        begin
          Dm.ArqAux.FieldByName('parcela').asString      := Copy(Dm.Td.FieldByName('parc2').asString, 1, 3) + '/' + Copy(Dm.Td.FieldByName('parc2').asString, 4, 3);
        end
        else Dm.ArqAux.FieldByName('parcela').asString   := Dm.Td.FieldByName('parc2').asString;  
        Dm.ArqAux.FieldByName('ven_parc').asString       := Trim(Dm.Td.FieldByName('ven_parc2').asString);
        if (Dm.Td.FieldByName('val_parc2').asCurrency > 0) then
        begin
          Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Td.FieldByName('val_parc2').asCurrency, 14, True);
        end
        else Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Td.FieldByName('valor2').asCurrency, 14, True);
        Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
        Dm.ArqAux.Post;
      end
      else ColocaTraco(arq, Dm.Td.FieldByName('p_auxiliar').asString);
      if (Trim(Dm.Td.FieldByName('parc3').asString) <> '') then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.TD.FieldByName('registro').asInteger;
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Td.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('contrato').asString     := contrato;
        if (Trim(Dm.Td.FieldByName('arquivo').asString) <> '') then
        begin
          Dm.ArqAux.FieldByName('parcela').asString      := Copy(Dm.Td.FieldByName('parc3').asString, 1, 3) + '/' + Copy(Dm.Td.FieldByName('parc3').asString, 4, 3);
        end
        else Dm.ArqAux.FieldByName('parcela').asString   := Dm.Td.FieldByName('parc3').asString;
        Dm.ArqAux.FieldByName('ven_parc').asString     := Trim(Dm.Td.FieldByName('ven_parc3').asString);
        if (Dm.Td.FieldByName('val_parc3').asCurrency > 0) then
        begin
          Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Td.FieldByName('val_parc3').asCurrency, 14, True);
        end
        else Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Td.FieldByName('valor3').asCurrency, 14, True);
        Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
        Dm.ArqAux.Post;
      end
      else ColocaTraco(arq, Dm.Td.FieldByName('p_auxiliar').asString);
      if (Trim(Dm.Td.FieldByName('parc4').asString) <> '') then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.TD.FieldByName('registro').asInteger;
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Td.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('contrato').asString     := contrato;
        if (Trim(Dm.Td.FieldByName('arquivo').asString) <> '') then
        begin
          Dm.ArqAux.FieldByName('parcela').asString      := Copy(Dm.Td.FieldByName('parc4').asString, 1, 3) + '/' + Copy(Dm.Td.FieldByName('parc4').asString, 4, 3);
        end
        else Dm.ArqAux.FieldByName('parcela').asString   := Dm.Td.FieldByName('parc4').asString;
        Dm.ArqAux.FieldByName('ven_parc').asString     := Trim(Dm.Td.FieldByName('ven_parc4').asString);
        if (Dm.Td.FieldByName('val_parc4').asCurrency > 0) then
        begin
          Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Td.FieldByName('val_parc4').asCurrency, 14, True);
        end
        else Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Td.FieldByName('valor4').asCurrency, 14, True);
        Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
        Dm.ArqAux.Post;
      end
      else ColocaTraco(arq, Dm.Td.FieldByName('p_auxiliar').asString);
      if (Trim(Dm.Td.FieldByName('parc5').asString) <> '') then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.TD.FieldByName('registro').asInteger;
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Td.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('contrato').asString     := contrato;
        if (Trim(Dm.Td.FieldByName('arquivo').asString) <> '') then
        begin
          Dm.ArqAux.FieldByName('parcela').asString      := Copy(Dm.Td.FieldByName('parc5').asString, 1, 3) + '/' + Copy(Dm.Td.FieldByName('parc5').asString, 4, 3);
        end
        else Dm.ArqAux.FieldByName('parcela').asString   := Dm.Td.FieldByName('parc5').asString;
        Dm.ArqAux.FieldByName('ven_parc').asString     := Trim(Dm.Td.FieldByName('ven_parc5').asString);
        if (Dm.Td.FieldByName('val_parc5').asCurrency > 0) then
        begin
          Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Td.FieldByName('val_parc5').asCurrency, 14, True);
        end
        else Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Td.FieldByName('valor5').asCurrency, 14, True);
        Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
        Dm.ArqAux.Post;
      end
      else ColocaTraco(arq, Dm.Td.FieldByName('p_auxiliar').asString);
      if (Trim(Dm.Td.FieldByName('parc6').asString) <> '') then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.TD.FieldByName('registro').asInteger;
        Dm.ArqAux.FieldByName('empresa').asString      := Trim(Dm.Td.FieldByName('a_nome').asString);
        Dm.ArqAux.FieldByName('contrato').asString     := contrato;
        if (Trim(Dm.Td.FieldByName('arquivo').asString) <> '') then
        begin
          Dm.ArqAux.FieldByName('parcela').asString      := Copy(Dm.Td.FieldByName('parc6').asString, 1, 3) + '/' + Copy(Dm.Td.FieldByName('parc6').asString, 4, 3);
        end
        else Dm.ArqAux.FieldByName('parcela').asString   := Dm.Td.FieldByName('parc6').asString;
        Dm.ArqAux.FieldByName('ven_parc').asString       := Trim(Dm.Td.FieldByName('ven_parc6').asString);
        if (Dm.Td.FieldByName('val_parc6').asCurrency > 0) then
        begin
          Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Td.FieldByName('val_parc6').asCurrency, 14, True);
        end
        else Dm.ArqAux.FieldByName('valor').asString        := StrCurr(Dm.Td.FieldByName('valor6').asCurrency, 14, True);
        Dm.ArqAux.FieldByName('tipo').asInteger        := StrToInt(Copy(ComboBox1.Text, 1,3));
        Dm.ArqAux.Post;
      end
      else ColocaTraco(arq, Dm.Td.FieldByName('p_auxiliar').asString);
    end;
    Dm.Td.Next;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.RequestLive := False;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY empresa, indexador');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    ShowMessage('Movimento não encontrado !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  QrDestroi;
  if (CheckBox1.Checked) then
  begin
    GerarArquivoTxt(F_RRetor1);
  end
  else
  begin
    if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 6) then
    begin
      Application.CreateForm(TQk_RetI, Qk_RetI);
      Qk_RetI.QrLabel1.Caption := F_Menu.Label29.Caption;
      Qk_RetI.QrLabel5.Caption := 'RETORNO DAS NOTIFICAÇÕES CERTIFICADAS NO DIA ' + MaskEdit1.Text;
      Qk_RetI.QuickRep1.Preview;
      Qk_RetI.Destroy;
      Qk_RetI := NIL;
    end
    else
    begin
      Application.CreateForm(TQk_RetPadrao1, Qk_RetPadrao1);
      Qk_RetPadrao1.QrLabel1.Caption := F_Menu.Label29.Caption;
      Qk_RetPadrao1.QrLabel5.Caption := 'RETORNO DAS NOTIFICAÇÕES CERTIFICADAS NO DIA ' + MaskEdit1.Text;
      Qk_RetPadrao1.QuickRep1.Preview;
      Qk_RetPadrao1.Destroy;
      Qk_RetPadrao1 := NIL;
    end;
  end;
  Dm.ArqAux.Close;
//  DestroeTabela(arq);
end;

procedure TF_RRetor1.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT ncliente FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('   data_not1 = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('OR data_not2 = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('OR data_not3 = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('GROUP BY ncliente');
    Dm.ArqAux.Sql.Add('ORDER BY ncliente');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      Dm.ArqAux.Close;
      ShowMessage('Movimento não encontrado !');
      MaskEdit1.SetFocus;
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

procedure TF_RRetor1.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RRetor1.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_RRetor1.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RRetor1.ComboBox2Exit(Sender: TObject);
begin
  TpBx := 'P';
  TpBx := Copy(ComboBox2.Text, 1,1);  
end;

procedure TF_RRetor1.ComboBox1Enter(Sender: TObject);
begin
  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RRetor1.ComboBox2Enter(Sender: TObject);
begin
  SendMessage(ComboBox2.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

end.
