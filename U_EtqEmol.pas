unit U_EtqEmol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers, CheckLst, Db,
  DBTables, RDprint, jpeg, ToolEdit, CurrEdit;

type
  TF_RETQEMOL = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Label6: TLabel;
    MaskEdit2: TMaskEdit;
    Label11: TLabel;
    Label12: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    ComboBox2: TComboBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RETQEMOL: TF_RETQEMOL;
  Vr_SubTotal, Vr_Busca, Vr_Total, Vr_Mutua, Vr_Acoterj,
  Vr_Tribunal, Vr_Defensoria, Vr_Procuradoria,
  emo_vex, bus_vex, con_vex, inf_exc, gui_exc, sub_vex,
  lei20_vex, lei05_vex, lei05a_vex, tot_vex, emol_tit,
  fetj_tit, fund_tit, funp_tit, tota_tit : Currency;


implementation

uses Menu, EtiqQk, EtiqQk1, EtiqQk2, DMTD, FuncGeral, ProcGeral, UQetqEmol;

{$R *.DFM}
Function Strzero(Numero : String;Casas : Integer) : String;
var
  zeros : String;
Begin
  zeros := '00000000000000000000000000000000000000000';
  result := copy(zeros,1,casas) + numero;
  result := copy(result, length(result) - (casas - 1), casas);
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

procedure TF_RETQEMOL.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RETQEMOL.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RETQEMOL.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_RETQEMOL.BitBtn2Click(Sender: TObject);
begin
  maskedit2.clear;
  maskedit3.clear;
  maskedit1.setfocus;
end;

procedure TF_RETQEMOL.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RETQEMOL.RadioButton2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_RETQEMOL.FormActivate(Sender: TObject);
begin
  BitBtn2.Click;
end;

procedure TF_RETQEMOL.BitBtn1Click(Sender: TObject);
var
  sair, jaentrou, jaentroudef : Boolean;
  protseek, arq : String;
  quant, lin, col, x, linha_conta, index, nlinha : integer;
  linhatxt : String;
  somaleis : Currency;
begin

  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data Inválida !!!');
    exit;
  end;

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT p_auxiliar, protocolo, registro, data_r, data_p, custas ');
  Dm.ArqAux.Sql.Add(' v_emolumentos, v_nome, v_distrib, v_subtotal, v_tribunal, v_infodistrib,');
  Dm.ArqAux.Sql.Add(' v_procuradoria, v_defensoria, v_mutua, v_acoterj, v_total, v_leis_dist');
  Dm.ArqAux.Sql.Add(' FROM td ');
  Dm.ArqAux.Sql.Add(' WHERE');
  Dm.ArqAux.Sql.Add(' data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  if (Trim(MaskEdit3.Text) <> '')  AND  (Trim(MaskEdit2.Text) <> '') AND
     (Trim(MaskEdit3.Text) <> '0') AND  (Trim(MaskEdit2.Text) <> '0')AND
     (ValidNumero(MaskEdit3.Text)) AND  (ValidNumero(MaskEdit2.Text))then
     begin
       Dm.ArqAux.Sql.Add(' AND protocolo >= ' + Trim(MaskEdit3.Text));
       Dm.Arqaux.Sql.Add(' AND protocolo <= ' + Trim(MaskEdit2.Text));
     end;
  Dm.ArqAux.Sql.Add(' ORDER BY protocolo');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    ShowMessage('Dados insuficientes para impressão !');
    MaskEdit1.SetFocus;
    Exit;
  end;

  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ETQ';
  CriaTabela('ETQ33', arq);
  quant := 0;
  col   := StrToInt(ComboBox1.Text);
  lin   := StrToInt(ComboBox2.Text);
  linhatxt := '';
  jaentrou := False;
  linha_conta := 0;
  jaentroudef := False;
  If col = 2 then linha_conta := 11
  Else If col = 3 then linha_conta := 22;
  index := 1;
  nlinha := 1;
  while (not Dm.ArqAux.Eof) do
  begin
    linhatxt := 'Reg. ' + Dm.ArqAux.FieldByname('protocolo').AsString + '  ';
    Dm.ArqAux2.Close;
    Dm.ArqAux2.Sql.Clear;
    Dm.ArqAux2.Sql.Add('select * from td_pedid where protocolo = ' + Dm.ArqAux.FieldByname('protocolo').AsString);
    Dm.ArqAux2.Open;
    While (NOT Dm.ArqAux2.Eof) Do
    Begin
      linhatxt := linhatxt + Dm.ArqAux2.FieldByname('descricao').AsString + ' R$ ' + Dm.ArqAux2.FieldByname('valor_calc').AsString + ' ';
      Dm.ArqAux2.Next;
    end;
    somaleis := 0.00;

    somaleis := Dm.ArqAux.FieldByname('v_nome').AsCurrency + Dm.ArqAux.FieldByname('v_distrib').AsCurrency +
                Dm.ArqAux.FieldByname('v_leis_dist').AsCurrency + Dm.ArqAux.FieldByname('v_infodistrib').AsCurrency;
{    linhatxt := linhatxt + 'Lei 3217 R$ ' + Dm.ArqAux.FieldByname('v_tribunal').AsString + ' ' +
                           'Lei 4664 R$ ' + Dm.ArqAux.FieldByname('v_procuradoria').AsString + ' ' +
                           'Lei 111 R$ ' + Dm.ArqAux.FieldByname('v_defensoria').AsString + ' ' +
                           'Lei 3761 R$ ' + Dm.ArqAux.FieldByname('v_mutua').AsString + ' ' +
                           'Acoterj R$ ' + Dm.ArqAux.FieldByname('v_acoterj').AsString + ' ' +
                           'V.Distrib R$ ' + CurrToStr(somaleis) + ' ' +
                           'V.Total R$ ' + Dm.ArqAux.FieldByname('v_total').AsString;}

    linhatxt := linhatxt + ' Tribunal R$ ' + formatcurr('###,###,##0.00', Dm.ArqAux.FieldByname('v_tribunal').Ascurrency) + ' ' +
                           ' Valor Total R$ ' + formatcurr('###,###,##0.00', Dm.ArqAux.FieldByname('v_emolumentos').Ascurrency);

    If col = 1 then
    Begin
      jaentroudef := True;
      If lin = 1 then
      Begin
        Dm.ArqAux1.Close;
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
        Dm.ArqAux1.Sql.Add('(indexador, n_linha, linha1)');
        Dm.ArqAux1.Sql.Add('Values (');
        Dm.ArqAux1.Sql.Add(IntToStr(index));
        Dm.ArqAux1.Sql.Add(', ' + IntToStr(nlinha));
        Dm.ArqAux1.Sql.Add(', ' + QuotedStr(linhatxt));
        Dm.ArqAux1.Sql.Add(')');
        Dm.ArqAux1.ExecSql;
        inc(index);
        inc(nlinha);
        If nlinha >= 11 then nlinha := 1;
      End
      Else
      begin
        If (NOT jaentrou) then
        Begin
          For x := 1 to lin do
          Begin
            If x < lin then
            Begin
              Dm.ArqAux1.Close;
              Dm.ArqAux1.Sql.Clear;
              Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
              Dm.ArqAux1.Sql.Add('(indexador, n_linha, linha1)');
              Dm.ArqAux1.Sql.Add('Values (');
              Dm.ArqAux1.Sql.Add(IntToStr(index));
              Dm.ArqAux1.Sql.Add(', ' + IntToStr(nlinha));
              Dm.ArqAux1.Sql.Add(', NULL');
              Dm.ArqAux1.Sql.Add(')');
              Dm.ArqAux1.ExecSql;
              inc(index);
              inc(nlinha);
              If nlinha >= 11 then nlinha := 1;
            End
            Else
            Begin
              Dm.ArqAux1.Close;
              Dm.ArqAux1.Sql.Clear;
              Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
              Dm.ArqAux1.Sql.Add('(indexador, n_linha, linha1)');
              Dm.ArqAux1.Sql.Add('Values (');
              Dm.ArqAux1.Sql.Add(IntToStr(index));
              Dm.ArqAux1.Sql.Add(', ' + IntToStr(nlinha));
              Dm.ArqAux1.Sql.Add(', ' + QuotedStr(linhatxt));
              Dm.ArqAux1.Sql.Add(')');
              Dm.ArqAux1.ExecSql;
              jaentrou := True;
              inc(index);
              inc(nlinha);
              If nlinha >= 11 then nlinha := 1;
            End;
          End;
        End
        Else
        Begin
          Dm.ArqAux1.Close;
          Dm.ArqAux1.Sql.Clear;
          Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
          Dm.ArqAux1.Sql.Add('(indexador, n_linha, linha1)');
          Dm.ArqAux1.Sql.Add('Values (');
          Dm.ArqAux1.Sql.Add(IntToStr(index));
          Dm.ArqAux1.Sql.Add(', ' + IntToStr(nlinha));
          Dm.ArqAux1.Sql.Add(', ' + QuotedStr(linhatxt));
          Dm.ArqAux1.Sql.Add(')');
          Dm.ArqAux1.ExecSql;
          inc(index);
          inc(nlinha);
          If nlinha >= 11 then nlinha := 1;
        End;
      End;
    End
    Else
    Begin
      If (NOT jaentroudef) then
      Begin
        If ((col = 2) OR (col = 3)) AND (NOT jaentrou) then
        Begin
          If (lin = 1) AND (NOT jaentrou) then
          Begin
            For x := 1 to linha_conta do
            Begin
              Dm.ArqAux1.Close;
              Dm.ArqAux1.Sql.Clear;
              Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
              Dm.ArqAux1.Sql.Add('(indexador, n_linha, linha1)');
              Dm.ArqAux1.Sql.Add('Values (');
              Dm.ArqAux1.Sql.Add(IntToStr(index));
              Dm.ArqAux1.Sql.Add(', ' + IntToStr(nlinha));
              Dm.ArqAux1.Sql.Add(', NULL');
              Dm.ArqAux1.Sql.Add(')');
              Dm.ArqAux1.ExecSql;
              inc(index);
              inc(nlinha);
              If nlinha >= 11 then nlinha := 1;
            End;
            Dm.ArqAux1.Close;
            Dm.ArqAux1.Sql.Clear;
            Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
            Dm.ArqAux1.Sql.Add('(indexador, n_linha, linha1)');
            Dm.ArqAux1.Sql.Add('Values (');
            Dm.ArqAux1.Sql.Add(IntToStr(index));
            Dm.ArqAux1.Sql.Add(', ' + IntToStr(nlinha));
            Dm.ArqAux1.Sql.Add(', ' + QuotedStr(linhatxt));
            Dm.ArqAux1.Sql.Add(')');
            Dm.ArqAux1.ExecSql;
            jaentrou := True;
            inc(index);
            inc(nlinha);
            If nlinha >= 11 then nlinha := 1;
          End
          Else If (lin > 1) AND (NOT jaentrou) then
          Begin
            For x := 1 to (lin+linha_conta) do
            Begin
              If x < (lin+linha_conta) then
              Begin
                Dm.ArqAux1.Close;
                Dm.ArqAux1.Sql.Clear;
                Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
                Dm.ArqAux1.Sql.Add('(indexador, n_linha, linha1)');
                Dm.ArqAux1.Sql.Add('Values (');
                Dm.ArqAux1.Sql.Add(IntToStr(index));
                Dm.ArqAux1.Sql.Add(', ' + IntToStr(nlinha));
                Dm.ArqAux1.Sql.Add(', NULL');
                Dm.ArqAux1.Sql.Add(')');
                Dm.ArqAux1.ExecSql;
                inc(index);
                inc(nlinha);
                If nlinha >= 11 then nlinha := 1;
              End
              Else
              Begin
                Dm.ArqAux1.Close;
                Dm.ArqAux1.Sql.Clear;
                Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
                Dm.ArqAux1.Sql.Add('(indexador, n_linha, linha1)');
                Dm.ArqAux1.Sql.Add('Values (');
                Dm.ArqAux1.Sql.Add(IntToStr(index));
                Dm.ArqAux1.Sql.Add(', ' + IntToStr(nlinha));
                Dm.ArqAux1.Sql.Add(', ' + QuotedStr(linhatxt));
                Dm.ArqAux1.Sql.Add(')');
                Dm.ArqAux1.ExecSql;
                jaentrou := True;
                inc(index);
                inc(nlinha);
                If nlinha >= 11 then nlinha := 1;
              End;
            End;
          End;
        End
        Else
        Begin
          Dm.ArqAux1.Close;
          Dm.ArqAux1.Sql.Clear;
          Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
          Dm.ArqAux1.Sql.Add('(indexador, n_linha, linha1)');
          Dm.ArqAux1.Sql.Add('Values (');
          Dm.ArqAux1.Sql.Add(IntToStr(index));
          Dm.ArqAux1.Sql.Add(', ' + IntToStr(nlinha));
          Dm.ArqAux1.Sql.Add(', ' + QuotedStr(linhatxt));
          Dm.ArqAux1.Sql.Add(')');
          Dm.ArqAux1.ExecSql;
          inc(index);
          inc(nlinha);
          If nlinha >= 11 then nlinha := 1;
        End;
      End;
    End;
    Dm.ArqAux.Next;
    linhatxt := '';
//  jaentrou := False;
    jaentroudef := False;
    If nlinha >= 11 then nlinha := 1;
  end;

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY indexador');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    ShowMessage('Problemas para carregar movimento !');
    Dm.ArqAux.Close;
    Exit;
  end;

  Application.CreateForm(TFQk_EtqEmol, FQk_EtqEmol);
  FQk_EtqEmol.QuickRep1.preview;
  FQk_EtqEmol.Destroy;
  FQk_EtqEmol := nil;

  Dm.ArqAux.close;
  DestroeTabela(arq);
//  StatusBar1.SimpleText := 'Fim do Relatório';
//  StatusBar1.UpDate;
  Screen.cursor := crdefault;
end;

end.
