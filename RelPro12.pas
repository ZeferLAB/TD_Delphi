unit RelPro12;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_RelPro12 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    SaveDialog1: TSaveDialog;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label5: TLabel;
    MaskEdit3: TMaskEdit;
    Label6: TLabel;
    MaskEdit4: TMaskEdit;
    CheckBox2: TCheckBox;
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
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RelPro12: TF_RelPro12;
  tpbx              : String;
  F1                : TextFile;
  tot_pos, tot_neg, fim_de_semana,x,dias_uteis  : integer;
  dt                : TDateTime;
   

implementation

uses DMTD, Menu, QkRelP12, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure Grava_linha(linha : String);
begin
  WriteLn(F1, linha);
end;

Procedure TF_RelPro12.GerarArquivoTxt(Sender : TOBject);
var
  linha, docdev, nomdev, arqu, cam : String;
  qde   : Integer;
  vr : Currency;
begin
 // if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 6) then cam := F_Menu.Label27.Caption + 'Intercap\' else cam := F_Menu.Label27.Caption;
  cam := F_Menu.Label27.Caption;
  arqu := Trim(Copy(ComboBox1.Text, 7, 3)) + TrimChar(Copy(maskedit1.text,1,5),'/') + Copy(combobox2.text,1,2) + '.TXT';
  arqu := cam + '\' + arqu;
  { Edson inicio }
  F_RelPro12.SaveDialog1.FileName := arqu;
  F_RelPro12.SaveDialog1.Execute;
  arqu := F_RelPro12.SaveDialog1.FileName;
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
//  linha := '| REGISTRO | DT. REGISTRO | PROTOCOLO | DESTINATÁRIO                             |  ENDERECO                                |  RL       |  OCORRENCIA    |  CONTRATO |  PARCELA  |';
  linha := '| REGISTRO | DT. REGISTRO | DESTINATÁRIO                             |  ENDERECO                                |  OCORRÊNCIA    |  CONTRATO |  PARCELA  |    GRUPO  | COTA      |';
  Grava_Linha(linha);
  linha := StringOfChar('-', 200);
  Grava_Linha(linha);
  while (not Dm.ArqAux.Eof) do
  begin
    linha := '';
    linha :=         '|'  + StrBranco(Dm.ArqAux.FieldByName('registro').asString, 10, 'C');
    linha := linha + '|'  + StrBranco(Dm.ArqAux.FieldByName('data_p').asString, 14, 'C');
   // linha := linha + '|'  + StrBranco(Dm.ArqAux.FieldByName('p_auxiliar').asString, 11, 'C');
    linha := linha + '| ' + StrBranco(Dm.ArqAux.FieldByName('destinatario').asString, 41, 'D');
    linha := linha + '| ' + StrBranco(Dm.ArqAux.FieldByName('endereco').asString, 41, 'D');
   // linha := linha + '| ' + StrBranco(Dm.ArqAux.FieldByName('rl').asString, 10, 'D');
    linha := linha + '| ' + StrBranco(Dm.ArqAux.FieldByName('ocorrencia').asString, 15, 'D');
    linha := linha + '| ' + StrBranco(Dm.ArqAux.FieldByName('contrato').asString, 10, 'D');
    linha := linha + '| ' + StrBranco(Dm.ArqAux.FieldByName('parcela').asString, 10, 'D');
    linha := linha + '| ' + StrBranco(Dm.ArqAux.FieldByName('grupo').asString, 10, 'D');
    linha := linha + '| ' + StrBranco(Dm.ArqAux.FieldByName('cota').asString, 10, 'D');
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

procedure TF_RelPro12.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RelPro12.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit2.Clear;
  MaskEdit2.Text := DateToStr(date);
  MaskEdit3.SetFocus;
end;

procedure TF_RelPro12.BitBtn1Click(Sender: TObject);
var
  arq : String;
  contrato : String;
begin
  fim_de_semana := 0;
  tot_pos       := 0;
  tot_neg       := 0;
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  DM.Join.Close;
  DM.Join.Sql.Clear;
  DM.Join.Sql.Add('SELECT a.a_nome, a.contrato, a.parcelas, a.ven_parc, a.val_parc, a.arquivo,');
  DM.Join.Sql.Add('a.parc2, a.ven_parc2, a.valor2, a.val_parc2,');
  DM.Join.Sql.Add('a.parc3, a.ven_parc3, a.valor3, a.val_parc3,');
  DM.Join.Sql.Add('a.parc4, a.ven_parc4, a.valor4, a.val_parc4,');
  DM.Join.Sql.Add('a.parc5, a.ven_parc5, a.valor5, a.val_parc5,');
  DM.Join.Sql.Add('a.parc6, a.ven_parc6, a.valor6, a.val_parc6,');
  DM.Join.Sql.Add('a.parc7, a.ven_parc7, a.val_parc7,');
  DM.Join.Sql.Add('a.parc8, a.ven_parc8, a.val_parc8,');
  DM.Join.Sql.Add('a.parc9, a.ven_parc9, a.val_parc9,');
  DM.Join.Sql.Add('a.parc10, a.ven_parc10, a.val_parc10,');
  DM.Join.Sql.Add('a.parc11, a.ven_parc11, a.val_parc11,');
  DM.Join.Sql.Add('a.parc12, a.ven_parc12, a.val_parc12,');
  DM.Join.Sql.Add('a.parc13, a.ven_parc13, a.val_parc13,');
  DM.Join.Sql.Add('a.parc14, a.ven_parc14, a.val_parc14,');
  DM.Join.Sql.Add('a.parc15, a.ven_parc15, a.val_parc15,');
  DM.Join.Sql.Add('a.data_p, a.registro, a.p_auxiliar, a.data_not1, a.data_not2, a.data_not3,');
  DM.Join.Sql.Add('a.sit_not1, a.sit_not2, a.sit_not3, a.cod_ir1, a.cod_ir2, a.cod_ir3,a.rl,a.ncliente,');
  DM.Join.Sql.Add('a.grupo, a.cota, a.data_impr, a.data_reti, a.data_not1, a.sit_not1, a.cod_ir1, a.protocolo,');
  DM.Join.Sql.Add('b.nome, b.endereco, b.situacao');
 // DM.Join.Sql.Add('FROM td');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
  Dm.Join.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
  DM.Join.Sql.Add('WHERE b.situacao = "D"');
  DM.Join.Sql.Add('AND (a.protocolo < 77419 or a.protocolo > 77461)');
  if radiobutton1.checked = true then
   begin
    If (CheckBox2.Checked = true) then
     begin
       DM.Join.Sql.Add('AND ((a.data_impr >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39)  +'AND a.data_impr <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39)+')');
       DM.Join.Sql.Add('AND ((a.data_not1 >= ' + Chr(39) + ConvData(MaskEdit3.Text) + Chr(39)  +'AND a.data_not1 <= ' + Chr(39) + ConvData(MaskEdit4.Text) + Chr(39)+'))');
       DM.Join.Sql.Add('AND (a.ncliente   = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3)))+ '))');
     end
     else
      begin
       DM.Join.Sql.Add('AND ((a.data_impr >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39)  +'AND a.data_impr <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39)+')');
       DM.Join.Sql.Add('AND ((a.data_not1 >= ' + Chr(39) + ConvData(MaskEdit3.Text) + Chr(39)  +'AND a.data_not1 <= ' + Chr(39) + ConvData(MaskEdit4.Text) + Chr(39)+')or a.data_not1 is null)');
       DM.Join.Sql.Add('AND (a.ncliente   = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3)))+ '))');
      end;
       end;
  if radiobutton2.checked = true then
   begin
    if (CheckBox2.checked = true) then
     begin
      DM.Join.Sql.Add('AND ((a.data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39)  +'AND a.data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39)+')');
      DM.Join.Sql.Add('AND ((a.data_not1 >= ' + Chr(39) + ConvData(MaskEdit3.Text) + Chr(39)  +'AND a.data_not1 <= ' + Chr(39) + ConvData(MaskEdit4.Text) + Chr(39)+'))');
      DM.Join.Sql.Add('AND (a.ncliente   = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3)))+ '))');
     end
     else
      begin
       DM.Join.Sql.Add('AND ((a.data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39)  +'AND a.data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39)+')');
       DM.Join.Sql.Add('AND ((a.data_not1 >= ' + Chr(39) + ConvData(MaskEdit3.Text) + Chr(39)  +'AND a.data_not1 <= ' + Chr(39) + ConvData(MaskEdit4.Text) + Chr(39)+')or a.data_not1 is null)');
       DM.Join.Sql.Add('AND (a.ncliente   = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3)))+ '))');
      end;
    end;
 { DM.Join.Sql.Add('AND ((a.data_prov1 >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39)  +'AND a.data_prov1 <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39)+')');
  DM.Join.Sql.Add('AND (a.ncliente   = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3)))+ '))');
 // DM.Join.Sql.Add('AND (a.sit_prov1   = ' + Chr(39) + tpbx + Chr(39) + '))');
  DM.Join.Sql.Add('OR  ((a.data_prov2 >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) +'AND a.data_prov2 <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39)+')');
  DM.Join.Sql.Add('AND (a.ncliente  = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3)))+ '))');
 // DM.Join.Sql.Add('AND (a.sit_prov2   = ' + Chr(39) + tpbx + Chr(39) + '))');
  DM.Join.Sql.Add('OR  ((a.data_prov3 >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) +'AND a.data_prov3 <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39)+')');
  DM.Join.Sql.Add('AND (a.ncliente  = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3)))+ '))');
 // DM.Join.Sql.Add('AND (a.sit_prov3   = ' + Chr(39) + tpbx + Chr(39) + '))');}
  DM.Join.Sql.Add('ORDER BY a.registro');
  DM.Join.Open;

  if (DM.Join.RecordCount = 0) then
  begin
    DM.Join.Close;
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
  while (not DM.Join.Eof) do
  begin
    contrato := '';
    if (Trim(DM.Join.FieldByName('contrato').asString) <> '') then
     contrato := Trim(DM.Join.FieldByName('contrato').asString)
    else
     contrato := Busca_Contrato(DM.Join.FieldByName('registro').asString);
     
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByName('indexador').asInteger   := DM.Join.FieldByName('registro').asInteger;
    Dm.ArqAux.FieldByName('data').asString         := MaskEdit1.Text;
    Dm.ArqAux.FieldByName('registro').asString     := StrZero(DM.Join.FieldByName('registro').asString, 6);
    Dm.ArqAux.FieldByName('data_p').asString       := DM.Join.FieldByName('data_p').asString;
    Dm.ArqAux.FieldByName('p_auxiliar').asString   := DM.Join.FieldByName('p_auxiliar').asString;
    Dm.ArqAux.FieldByName('empresa').asString      := TirarTudo(DM.Join.FieldByName('a_nome').asString, '/', '', '');
    Dm.ArqAux.FieldByName('destinatario').asString := Busca_NomePessoal(DM.Join.FieldByName('p_auxiliar').asString, 'D');
    Dm.ArqAux.FieldByName('contrato').asString     := contrato;
    Dm.ArqAux.FieldByName('grupo').asString        := DM.Join.FieldByName('grupo').asString;
    Dm.ArqAux.FieldByName('cota').asString         := DM.Join.FieldByName('cota').asString;
    Dm.ArqAux.FieldByName('rl').asString           := DM.Join.FieldByName('rl').asString;
    Dm.ArqAux.FieldByName('data_impr').asString    := DM.Join.FieldByName('data_impr').asString;
    Dm.ArqAux.FieldByName('data_reti').asString    := DM.Join.FieldByName('data_reti').asString;
    Dm.ArqAux.FieldByName('endereco').asString     := DM.Join.FieldByName('endereco').asString;
    {Dm.ArqAux.FieldByName('data_not1').asString    := DM.Join.FieldByName('data_not1').asString;
    if DM.Join.FieldByName('sit_not1').asString = 'P' then
     Dm.ArqAux.FieldByName('ocorrencia1').asString  := 'POSITIVA';
    if DM.Join.FieldByName('sit_not1').asString = 'N' then
     Dm.ArqAux.FieldByName('ocorrencia1').asString  := 'NEGATIVA';
    Dm.ArqAux.FieldByName('motivo1').asString      := Ver_Ocorrencia(DM.Join.FieldByName('cod_ir1').asString);}


    
    if (StrToInt(Copy(ComboBox1.Text, 1,3)) = 6) then
    begin
      if (Trim(DM.Join.FieldByName('arquivo').asString) <> '') then
       Dm.ArqAux.FieldByName('parcela').asString := Copy(DM.Join.FieldByName('parcelas').asString, 1, 3) + '/' + Copy(DM.Join.FieldByName('parcelas').asString, 4, 3)
      else
       Dm.ArqAux.FieldByName('parcela').asString := DM.Join.FieldByName('parcelas').asString;
    end
    else Dm.ArqAux.FieldByName('parcelas').asString := DM.Join.FieldByName('parcelas').asString;
    Dm.ArqAux.FieldByName('parc2').asString         := DM.Join.FieldByName('parc2').asString;
    Dm.ArqAux.FieldByName('parc3').asString         := DM.Join.FieldByName('parc3').asString;
    Dm.ArqAux.FieldByName('parc4').asString         := DM.Join.FieldByName('parc4').asString;
    Dm.ArqAux.FieldByName('parc5').asString         := DM.Join.FieldByName('parc5').asString;
    Dm.ArqAux.FieldByName('parc6').asString         := DM.Join.FieldByName('parc6').asString;
    Dm.ArqAux.FieldByName('parc7').asString         := DM.Join.FieldByName('parc7').asString;
    Dm.ArqAux.FieldByName('parc8').asString         := DM.Join.FieldByName('parc8').asString;
    Dm.ArqAux.FieldByName('parc9').asString         := DM.Join.FieldByName('parc9').asString;
    Dm.ArqAux.FieldByName('parc10').asString        := DM.Join.FieldByName('parc10').asString;
    Dm.ArqAux.FieldByName('parc11').asString        := DM.Join.FieldByName('parc11').asString;
    Dm.ArqAux.FieldByName('parc12').asString        := DM.Join.FieldByName('parc12').asString;
    Dm.ArqAux.FieldByName('parc13').asString        := DM.Join.FieldByName('parc13').asString;
    Dm.ArqAux.FieldByName('parc14').asString        := DM.Join.FieldByName('parc14').asString;
    Dm.ArqAux.FieldByName('parc15').asString        := DM.Join.FieldByName('parc15').asString;
    Dm.ArqAux.FieldByName('ven_parc').asString      := Trim(DM.Join.FieldByName('ven_parc').asString);
    Dm.ArqAux.FieldByName('valor').asString         := StrCurr(DM.Join.FieldByName('val_parc').asCurrency, 14, True);
    Dm.ArqAux.FieldByName('tipo').asInteger         := StrToInt(Copy(ComboBox1.Text, 1,3));


   { if ((DM.Join.FieldByName('data_prov3').asDateTime >= StrToDate(MaskEdit1.Text))or
        (DM.Join.FieldByName('data_prov3').asDateTime <= StrToDate(MaskEdit2.Text))) then  }
   if (DM.Join.FieldByName('data_not3').asString <> '') then
    begin
      if (DM.Join.FieldByName('sit_not3').asString = 'P') then
      begin
        Dm.ArqAux.FieldbyName('ocorrencia').asString := 'POSITIVA';
        Dm.ArqAux.FieldByName('data_not1').asString    := DM.Join.FieldByName('data_not3').asString;
        tot_pos := tot_pos + 1;
      end
      else
      begin
        if (DM.Join.FieldByName('sit_not3').asString = 'L') then
        begin
          Dm.ArqAux.FieldbyName('ocorrencia').asString := 'CERTIDÃO PARCIAL';
          //Dm.ArqAux.FieldByName('data_not1').asString    := DM.Join.FieldByName('data_not3').asString;
        end
        else
        begin
          if (DM.Join.FieldByName('sit_not3').asString = 'N') then
          begin
            Dm.ArqAux.FieldByName('ocorrencia').asString := 'NEGATIVA';
            Dm.ArqAux.FieldbyName('motivo').asString     := Ver_Ocorrencia(DM.Join.FieldByName('cod_ir3').asString);
            Dm.ArqAux.FieldByName('data_not1').asString  := DM.Join.FieldByName('data_not3').asString;
            tot_neg := tot_neg + 1;
          end;
        end;
      end;
    end
    else
    begin
     { if ((DM.Join.FieldByName('data_prov2').asDateTime >= StrToDate(MaskEdit1.Text)) or
          (DM.Join.FieldByName('data_prov2').asDateTime <= StrToDate(MaskEdit2.Text))) then  }
    if (DM.Join.FieldByName('data_not2').asString <> '') then
      begin
        if (DM.Join.FieldByName('sit_not2').asString = 'P') then
        begin
          Dm.ArqAux.FieldbyName('ocorrencia').asString := 'POSITIVA';
          Dm.ArqAux.FieldByName('data_not1').asString    := DM.Join.FieldByName('data_not2').asString;
          tot_pos := tot_pos + 1;
        end
        else
        begin
          if (DM.Join.FieldByName('sit_not2').asString = 'L') then
          begin
            Dm.ArqAux.FieldbyName('ocorrencia').asString := 'CERTIDÃO PARCIAL';
           // Dm.ArqAux.FieldByName('data_not1').asString    := DM.Join.FieldByName('data_not2').asString;
          end
          else
          begin
            if (DM.Join.FieldByName('sit_not2').asString = 'N') then
            begin
              Dm.ArqAux.FieldByName('ocorrencia').asString := 'NEGATIVA';
              Dm.ArqAux.FieldbyName('motivo').asString     := Ver_Ocorrencia(DM.Join.FieldByName('cod_ir2').asString);
              Dm.ArqAux.FieldByName('data_not1').asString  := DM.Join.FieldByName('data_not2').asString;
              tot_neg := tot_neg + 1;
            end;
          end;
        end;
      end
      else
      begin
       {if((DM.Join.FieldByName('data_prov1').asDateTime >= StrToDate(MaskEdit1.Text)) or
          (DM.Join.FieldByName('data_prov1').asDateTime <= StrToDate(MaskEdit2.Text))) then }
       if (DM.Join.FieldByName('data_not1').asString <> '') then
        begin
          if (DM.Join.FieldByName('sit_not1').asString = 'P') then
          begin
            Dm.ArqAux.FieldbyName('ocorrencia').asString := 'POSITIVA';
            Dm.ArqAux.FieldByName('data_not1').asString    := DM.Join.FieldByName('data_not1').asString;
            tot_pos := tot_pos + 1;
          end
          else
          begin
            if (DM.Join.FieldByName('sit_not1').asString = 'L') then
            begin
              Dm.ArqAux.FieldbyName('ocorrencia').asString := 'CERTIDÃO PARCIAL';
              //Dm.ArqAux.FieldByName('data_not1').asString    := DM.Join.FieldByName('data_not1').asString;
            end
            else
            begin
              if (DM.Join.FieldByName('sit_not1').asString = 'N') then
              begin
                Dm.ArqAux.FieldByName('ocorrencia').asString := 'NEGATIVA';
                Dm.ArqAux.FieldbyName('motivo').asString     := Ver_Ocorrencia(DM.Join.FieldByName('cod_ir1').asString);
                Dm.ArqAux.FieldByName('data_not1').asString  := DM.Join.FieldByName('data_not1').asString;
                tot_neg := tot_neg +1;
              end;
            end;
          end;
        end;
      end;
    end;
    dias_uteis    := 0;
    fim_de_semana := 0;
    dias_uteis := strtoint(currtostr((Dm.ArqAux.FieldByName('data_not1').asdatetime) - (Dm.ArqAux.FieldByName('data_p').asdatetime)));
    dt := Dm.ArqAux.FieldByName('data_p').asdatetime;
    for x := 1 to dias_uteis do
     begin
      dt     := dt + 1;
      if ((DayOfWeek(dt) = 1) or (DayOfWeek(dt) = 7)) then
       fim_de_semana := fim_de_semana + 1;
     end;

    dias_uteis := dias_uteis - fim_de_semana;
    //dias_uteis := currtostr((Dm.ArqAux.FieldByName('data_prov1').asdatetime) - (Dm.ArqAux.FieldByName('data_p').asdatetime));
    if dias_uteis < 0 then dias_uteis := 0;
    Dm.ArqAux.FieldByName('dias_uteis').asstring := inttostr(dias_uteis);
    Dm.ArqAux.Post;
    DM.Join.Next;
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
    GerarArquivoTxt(F_RelPro12);
  end
  else
   begin
    Application.CreateForm(TQk_RelPro12, Qk_RelPro12);
    Qk_RelPro12.QrLabel1.Caption := F_Menu.Label29.Caption;
    Qk_RelPro12.QrLabel5.Caption := 'RELATÓRIO DE BAIXA EFETIVA DAS NOTIFICAÇÕES NO PERÍODO  DE  ' + MaskEdit1.Text+ ' ATÉ ' +MaskEdit2.Text ;
    Qk_RelPro12.QuickRep1.Preview;
    Qk_RelPro12.Destroy;
    Qk_RelPro12 := NIL;
   end;
  Dm.ArqAux.Close;
end;

procedure TF_RelPro12.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Maskedit2.SetFocus;
end;

procedure TF_RelPro12.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = 13 then
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT ncliente FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    if radiobutton1.checked = true then
     begin
      Dm.ArqAux.Sql.Add('   data_impr >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) +'AND data_impr <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
      DM.ArqAux.Sql.Add('AND ((data_not1 >= ' + Chr(39) + ConvData(MaskEdit3.Text) + Chr(39)  +'AND data_not1 <= ' + Chr(39) + ConvData(MaskEdit4.Text) + Chr(39)+')or data_not1 is null)');
     end;

     if radiobutton2.checked = true then
     begin
      Dm.ArqAux.Sql.Add('   data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) +'AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
      DM.ArqAux.Sql.Add('AND ((data_not1 >= ' + Chr(39) + ConvData(MaskEdit3.Text) + Chr(39)  +'AND data_not1 <= ' + Chr(39) + ConvData(MaskEdit4.Text) + Chr(39)+')or data_not1 is null)');
     end;
   // Dm.ArqAux.Sql.Add('   data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) +'AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
   // Dm.ArqAux.Sql.Add('AND sit_not1   = ""');
   { Dm.ArqAux.Sql.Add('   data_prov1 >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39) +'AND data_prov1 <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('OR data_prov2 >= '  + Chr(39) + ConvData(MaskEdit1.Text)  + Chr(39) +'AND data_prov2 <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('OR data_prov3 >= '  + Chr(39) + ConvData(MaskEdit1.Text)  + Chr(39) +'AND data_prov3 <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));}
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

procedure TF_RelPro12.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 // if key = 13 then ComboBox2.SetFocus;
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RelPro12.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RelPro12.ComboBox2Exit(Sender: TObject);
begin
//  TpBx := 'P';
  TpBx := Copy(ComboBox2.Text, 1,1);
end;

procedure TF_RelPro12.ComboBox1Enter(Sender: TObject);
begin
  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RelPro12.ComboBox2Enter(Sender: TObject);
begin
  SendMessage(ComboBox2.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RelPro12.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_RelPro12.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_RelPro12.FormActivate(Sender: TObject);
begin
   F_RelPro12.MaskEdit3.SetFocus;
end;

end.
