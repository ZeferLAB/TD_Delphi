unit U_EmissDAJE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, ToolEdit, CurrEdit, ExtCtrls, Buttons, ComCtrls;

type
  TF_EmissDAJE = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label3: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label4: TLabel;
    ComboBox2: TComboBox;
    Label29: TLabel;
    Label16: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Panel8: TPanel;
    Panel9: TPanel;
    Label34: TLabel;
    ComboBox4: TComboBox;
    Label35: TLabel;
    ComboBox5: TComboBox;
    Label36: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel11: TPanel;
    Label33: TLabel;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    Label6: TLabel;
    MaskEdit6: TMaskEdit;
    Label7: TLabel;
    MaskEdit7: TMaskEdit;
    CheckBox1: TCheckBox;
    Panel3: TPanel;
    Panel10: TPanel;
    Label37: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    ComboBox3: TComboBox;
    MaskEdit4: TMaskEdit;
    CheckBox2: TCheckBox;
    Memo1: TMemo;
    ComboBox6: TComboBox;
    Panel4: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    MaskEdit8: TMaskEdit;
    BitBtn5: TBitBtn;
    Label12: TLabel;
    RichEdit1: TRichEdit;
    Panel5: TPanel;
    CheckBox3: TCheckBox;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox5Exit(Sender: TObject);
    procedure ComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6Exit(Sender: TObject);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ComboBox6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure AlimentaAtosAdicionais;
    procedure AlimentaEndereco;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_EmissDAJE: TF_EmissDAJE;
  ajuste, total, adic : Currency;
  dt_calc, codigo, verdoc, texto, ato, isento, motivo : String;
  codigoAtoAdicional, qtdeAtoAdicional: String;
implementation

uses Menu, DMTD, U_Daje, FuncGeral, U_ReImpDAJE, U_ConsDaje, Exame,
  U_DAJE_TJ;

{$R *.DFM}

Function StrCurr(Cadeia : Currency; Casas : Integer; Mascara : Boolean) : String;
var
  branco : String;
begin
  branco := StringOfChar(' ', casas);
  if (mascara) then
  begin
    result := branco + FormatCurr('###,###,###,##0.00', cadeia);
  end
  else
  begin
    result := branco + FormatCurr('###########0.00', cadeia);
  end;
  result := Copy(result, length(result) - (casas -1), casas);
end;

Function StrCurrPesq(Cadeia : Currency) : String;
begin
  result := Trim(Copy(StrCurr(cadeia, 14, False), 1,11) + '.' + Copy(StrCurr(cadeia, 14, False), 13,2));
end;

Function ConvDoc1(saga, suga, siga: string) : string;
Var
  con : integer;
  xy  : integer;
begin
  result := '';
  if suga  = '1' then
  begin
    xy := 1;
    con := length(saga);
    while (xy - 1) < con do
    begin
      if (copy(saga,xy,1) <> '.') and (copy(saga,xy,1) <> '-') and (copy(saga,xy,1) <> '/') and (copy(saga,xy,1) <> '\') then result := result + copy(saga,xy,1);
      xy := xy + 1;
    end;
  end
  else
  begin
    xy  := 1;
    con := length(saga);
    if siga = 'CPF' then
    begin
      while (xy - 1) < con do
      begin
        if xy = 4 then
        begin
          Result := Result + '.' + copy(saga,xy,1);
        end;
        if xy = 7 then
        begin
          Result := Result + '.' + copy(saga,xy,1);
        end;
        if xy = 10 then
        begin
           Result := Result + '-' + copy(saga,xy,1);
        end;
        if (xy <> 4) and (xy <> 7) and (xy <> 10) then
        begin
          Result := Result + copy(saga,xy,1);
        end;
        xy := xy + 1;
      end;
    end
    else
    begin
      while (xy - 1) < con do
      begin
        if xy = 3 then
        begin
          Result := Result + '.' + copy(saga,xy,1);
        end;
        if xy = 6 then
        begin
          Result := Result + '.' + copy(saga,xy,1);
        end;
        if xy = 9 then
        begin
          Result := Result + '/' + copy(saga,xy,1);
        end;
        if xy = 13 then
        begin
          Result := Result + '-' + copy(saga,xy,1);
        end;
        if (xy <> 3) and (xy <> 6) and (xy <> 9) and (xy <> 13) then
        begin
          Result := Result + copy(saga,xy,1);
        end;
        xy := xy + 1;
      end;
    end;
  end;
end;

Procedure Controle_DAJE(data_emi, hora, data_ven, cod_ato, atribuicao, qtd, contribuinte, tipo_doc, doc, serie_daje, numero_daje, usuario, obs, pags : String;
                        emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_daje, vr_declarado : Currency; endereco, cidade: String; tx_pge, fmmpba: Currency);
var
  sTexto: String;
  x: Integer;
Begin
  x := 0;
  sTexto:= '';
  for x := 0 to (F_EmissDAJE.RichEdit1.Lines.Count - 1) do
  begin
    sTexto := sTexto + F_EmissDAJE.RichEdit1.Lines.Strings[x];
  end; 

  DM.ArqAux.Close;
  DM.ArqAux.SQL.Clear;
  DM.ArqAux.SQL.Add('insert into daje (data_emi, hora, data_ven, cod_ato, atribuicao, qtd, contribuinte, pags,  ');
  DM.ArqAux.SQL.Add('tipo_doc, doc, serie_daje, numero_daje, usuario, obs, emol_daje, tx_fisca_daje, fecom_daje,');
  DM.ArqAux.SQL.Add('def_pub_daje, vr_daje, vr_declarado, endereco, cidade, isento, cod_motivo_isento, desc_motivo_isento, status, observacao, iddaje_tj, vr_pge, fmmpba)'); //2017 - _PGE
  {DM.ArqAux.SQL.Add('def_pub_daje, vr_daje, vr_declarado, status, numero_selo, cod_validacao, usuario_selo, numero_selo_canc,');
  DM.ArqAux.SQL.Add('cod_validacao_canc, usuario_selo_canc, serie_daje_complementar, numero_daje_complementar, usuario_complementar, emol_daje_complementar)');}
  DM.ArqAux.SQL.Add('values (');
  DM.ArqAux.SQL.Add(       QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(data_emi))));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(hora));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(data_ven))));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(cod_ato));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(atribuicao));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(qtd));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(contribuinte));
  DM.ArqAux.SQL.Add(', ' + pags);
  DM.ArqAux.SQL.Add(', ' + QuotedStr(tipo_doc));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(doc));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(serie_daje));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(numero_daje));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(usuario));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(obs));
  DM.ArqAux.SQL.Add(', ' + StringReplace(FloatToStr(emol_daje), ',', '.', [rfReplaceAll]));
  DM.ArqAux.SQL.Add(', ' + StringReplace(FloatToStr(tx_fisca_daje), ',', '.', [rfReplaceAll]));
  DM.ArqAux.SQL.Add(', ' + StringReplace(FloatToStr(fecom_daje), ',', '.', [rfReplaceAll]));
  DM.ArqAux.SQL.Add(', ' + StringReplace(FloatToStr(def_pub_daje), ',', '.', [rfReplaceAll]));
  DM.ArqAux.SQL.Add(', ' + StringReplace(FloatToStr(vr_daje), ',', '.', [rfReplaceAll]));
  DM.ArqAux.SQL.Add(', ' + StringReplace(FloatToStr(vr_declarado), ',', '.', [rfReplaceAll]));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(endereco));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(cidade));
  DM.ArqAux.SQL.Add(', ' + QuotedStr(isento));
  if (Trim(motivo) <> '') then
  begin
    DM.ArqAux.SQL.Add(', ' + QuotedStr(Copy(motivo, 1, Pos(' - ', motivo)-1)));
    DM.ArqAux.SQL.Add(', ' + QuotedStr(Copy(motivo, Pos(' - ', motivo)+3, Length(motivo))));
    DM.ArqAux.SQL.Add(', "Isento"');
    //DM.ArqAux.SQL.Add(', ' + QuotedStr(id_eselo));    
  end
  else
  begin
    DM.ArqAux.SQL.Add(', null');
    DM.ArqAux.SQL.Add(', null');
    DM.ArqAux.SQL.Add(', "Não Pago"');
  end;
  DM.ArqAux.SQL.Add(', '+QuotedStr(sTexto)+'');
  DM.ArqAux.SQL.Add(', '+QuotedStr(id_eselo)+'');
  DM.ArqAux.SQL.Add(', ' + StringReplace(FloatToStr(tx_pge), ',', '.', [rfReplaceAll]));
  DM.ArqAux.SQL.Add(', ' + StringReplace(FloatToStr(fmmpba), ',', '.', [rfReplaceAll]));
  DM.ArqAux.SQL.Add(') ');
  try
    DM.ArqAux.ExecSQL;
  Except
    Application.MessageBox('DAJE não pode ser gravado. Possívelmente algum campo na tabela está sendo exigido para gravação. Por favor entre em contato com o suporte!', 'Mensagem do Sistema', mb_ok);
    Abort;
  End;
End;

procedure TF_EmissDAJE.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then
  Begin
    If (ComboBox1.ItemIndex = 0) then
    Begin
      CurrencyEdit1.Enabled := True;
      ComboBox2.Text        := '1';
      ComboBox2.Enabled     := False;
      CurrencyEdit1.Value   := 0;
      CurrencyEdit2.Value   := 0;
      CurrencyEdit3.Value   := 0;
      Panel9.Visible        := False;
      CurrencyEdit1.SetFocus;
    End
    Else
    Begin
      CurrencyEdit1.Value   := 0;
      CurrencyEdit1.Enabled := False;
      ComboBox2.Text        := '1';
      ComboBox2.Enabled     := False;
      CurrencyEdit1.Value   := 0;
      CurrencyEdit2.Value   := 0;
      CurrencyEdit3.Value   := 0;
      Panel3.Enabled        := True;
      ComboBox3.SetFocus;
    End;

    AlimentaAtosAdicionais;
  End;

end;

procedure TF_EmissDAJE.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then ComboBox3.SetFocus;
end;

procedure TF_EmissDAJE.CurrencyEdit1Exit(Sender: TObject);
begin
  {if (CurrencyEdit1.Value = 0) then
  begin
    Application.MessageBox('Valor Declarado Inválido!', 'Emissão DAJE', Mb_IconWarning);
    Exit;
  end;}

  codigo  := '0';
  dt_calc := DateToStr(Now);

  DM.ArqAux.Close;
  DM.ArqAux.SQL.Clear;
  DM.ArqAux.SQL.Add('select * from tab_ato2');
  DM.ArqAux.SQL.Add('where data <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(dt_calc))));
  DM.ArqAux.SQL.Add('and ' + StrCurrPesq(CurrencyEdit1.Value) + ' >= de');
  DM.ArqAux.SQL.Add('and ' + StrCurrPesq(CurrencyEdit1.Value) + ' <= ate');
  DM.ArqAux.SQL.Add('and tabela = 4 and item_tab = 1 order by data desc');
  DM.ArqAux.Open;

  If (DM.ArqAux.RecordCount = 0) then
  Begin
    Application.MessageBox('Ato não Localizado!', 'Emissão DAJE', Mb_IconWarning);
    Exit;
  End;
  codigoAtoAdicional := '';
  qtdeAtoAdicional   := '';
  codigo := DM.ArqAux.FieldByName('cod_ato').AsString;
  total  := DM.ArqAux.FieldByName('total').AsCurrency;
  CurrencyEdit2.Value := 0.00; //CurrencyEdit1.Value;
  currencyEdit3.Value := total;

  {// adriel 07-10-2020 O.S1033
  if CheckBox3.Checked then
  begin
    CurrencyEdit3.Value:= CurrencyEdit3.Value - (CurrencyEdit3.Value * 0.4);
  end else
  begin
    CurrencyEdit3.Value:=total;
  end; }
end;

procedure TF_EmissDAJE.ComboBox1Exit(Sender: TObject);
var
  i   : Integer;
begin
 { // adriel 07-10-2020 O.S1033
  If (ComboBox1.ItemIndex = 0)then
  begin
    Panel5.Visible:=true;
  end
  else
  begin
    CheckBox3.Checked:=false;
    Panel5.Visible:=false;
  end; }


  If (ComboBox1.Text <> '') then
  Begin
    ato := 'REGISTRO';
    If (ComboBox1.ItemIndex <> 0) then //I - REGISTRO INTEGRAL DE CONTRATOS, TITULO OU DOCUMENTO, AVERBACAO COM VALOR ECONOMICO
    Begin
      dt_calc := DateToStr(Now);
      codigo  := '';
      Panel9.Visible := False;

      Case (ComboBox1.ItemIndex) Of
        2 :  ato := 'CANCELAMENTO';
        3 :  ato := 'INSCRICAO';
        4 :  ato := 'INSCRICAO';
        5 :  ato := 'CANCELAMENTO';
        6 :  ato := 'AVERBACAO';
        7 :  ato := 'NOTIFICAÇÃO EXTRAJUDICIAL';
        8 :  ato := 'CERTIDÃO';
        9 :  ato := 'REGISTRO DE TÍTULOS E DOCUMENTOS E PESSOA JURÍDICA';
        10 : ato := 'APOSTILA DE HAIA';
        11 : ato := 'BUSCA INCLUIDA A CERTIDÃO NEGATIVA';
        12 : ato := 'LIVROS FISCAIS OU CONTABEIS';
      End;

      If (ComboBox1.ItemIndex = 1) then   //II - REGISTRO INTEGRAL DE CONTRATOS, TITULO OU DOCUMENTO, AVERBACAO SEM VALOR ECONOMICO OU DECLARADO: A) PRIMEIRA PAGINA
//         (ComboBox1.ItemIndex = 8) then //IX - CERTIDOES: A) PELA PRIMEIRA PAGINA
      Begin
        DM.ArqAux.Close;
        DM.ArqAux.SQL.Clear;
        DM.ArqAux.SQL.Add('select * from tab_ato2');
        DM.ArqAux.SQL.Add(' where data <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(dt_calc))));
        DM.ArqAux.SQL.Add(' and tabela = 4');

        If (ComboBox1.ItemIndex = 1) then
          DM.ArqAux.SQL.Add(' and item_tab = 2')
        else
          DM.ArqAux.SQL.Add(' and item_tab = 9');
        DM.ArqAux.SQL.Add(' and subitem = "B" order by data desc');

        DM.ArqAux.Open;
        DM.ArqAux.FindLast;
        If (DM.ArqAux.RecordCount <> 0) then
        begin
          DM.ArqAux.FindFirst;
          Label36.Caption := FormatCurr('R$ ###,###,##0.00', DM.ArqAux.FieldByName('total').AsCurrency);
        end
        Else
          Label36.Caption := 'R$ 0,00';

        Panel9.Visible := True;

        If (ComboBox1.ItemIndex = 1) then
          ComboBox4.Items.Add('II - REGISTRO INTEGRAL DE CONTRATOS, TITULO OU DOCUMENTO, AVERBACAO SEM VALOR ECONOMICO OU DECLARADO: B) PAGINA ADICIONAL')
        Else
          ComboBox4.Items.Add('IX - CERTIDOES: B) PAGINA ADICIONAL');

        ComboBox4.ItemIndex := 0;

        For i := 0 to 500 Do
        Begin
          ComboBox5.Items.Add(IntToStr(i));
        End;

        ComboBox5.Text := '0';
        ComboBox5.SetFocus;
      end
      else If (ComboBox1.ItemIndex = 9) then //IV - TARIFA POSTAGEM - INTIMAÇÃO VIA POSTAL (CARTORIO TJBA NÃO DELEGATARIO)
      begin
        For i := 1 to 500 Do
        Begin
          ComboBox2.Items.Add(IntToStr(i));
        End;

        ComboBox2.Enabled := True;
        ComboBox2.Text    := '1';
        ComboBox2.SetFocus;
      end;


      if (ComboBox1.ItemIndex <> 11) and (ComboBox1.ItemIndex <> 12) Then
      begin
        DM.ArqAux.Close;
        DM.ArqAux.SQL.Clear;
        DM.ArqAux.SQL.Add('select * from tab_ato2');
        DM.ArqAux.SQL.Add(' where data <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(dt_calc))));
        DM.ArqAux.SQL.Add(' and tabela = 4');

        Case (ComboBox1.ItemIndex) Of
          1 :  DM.ArqAux.SQL.Add(' and item_tab = 2 and subitem = "A"');
          2 :  DM.ArqAux.SQL.Add(' and item_tab = 3');
          3 :  DM.ArqAux.SQL.Add(' and item_tab = 4');
          4 :  DM.ArqAux.SQL.Add(' and item_tab = 5');
          5 :  DM.ArqAux.SQL.Add(' and item_tab = 6');
          6 :  DM.ArqAux.SQL.Add(' and item_tab = 7');
          7 :  DM.ArqAux.SQL.Add(' and item_tab = 8');
          8 :  DM.ArqAux.SQL.Add(' and item_tab = 9 and subitem = "A"');
          9 :  DM.ArqAux.SQL.Add(' and item_tab = 0');
          10 :  DM.ArqAux.SQL.Add(' and item_tab = 8 and subitem = "B"');
        End;

        if pos('NOTIFICAÇÃO', ComboBox1.Text) > 0 then
          DM.ArqAux.SQL.Add(' and subitem = ""');
        DM.ArqAux.SQL.Add(' order by data desc');
        //DM.ArqAux.SQL.SaveToFile('c:\\ssc.txt');
        DM.ArqAux.Open;
      End
      Else
      begin
        DM.ArqAux.Close;
        DM.ArqAux.SQL.Clear;
        DM.ArqAux.SQL.Add('select * from tab_ato2');
        DM.ArqAux.SQL.Add(' where data <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(dt_calc))));
        DM.ArqAux.SQL.Add(' and tabela = 5');

        Case (ComboBox1.ItemIndex) Of
         11 :  DM.ArqAux.SQL.Add(' and item_tab = 1');
         12 :  DM.ArqAux.SQL.Add(' and item_tab = 2');
       End;

       DM.ArqAux.SQL.Add(' order by data desc');
       DM.ArqAux.Open;
      End;



      If (DM.ArqAux.RecordCount <> 0) then
      begin
        DM.ArqAux.FindFirst;

        codigo := StrZero(Dm.ArqAux.FieldByName('cod_ato').AsString, 5);
        total  := DM.ArqAux.FieldByName('total').AsCurrency;

        CurrencyEdit3.Value := total;

        If not ((ComboBox1.ItemIndex = 1) or   //II - REGISTRO INTEGRAL DE CONTRATOS, TITULO OU DOCUMENTO, AVERBACAO SEM VALOR ECONOMICO OU DECLARADO: A) PRIMEIRA PAGINA
               // (ComboBox1.ItemIndex = 8) or   //IX - CERTIDOES: A) PELA PRIMEIRA PAGINA
                (ComboBox1.ItemIndex = 9)) then //IV - TARIFA POSTAGEM - INTIMAÇÃO VIA POSTAL (CARTORIO TJBA NÃO DELEGATARIO)
          ComboBox3.SetFocus;
      end
      else
      Begin
        Application.MessageBox('Ato não Localizado!', 'Emissão DAJE', Mb_IconWarning);
        Exit;
      End;
    End;
  End;
end;

procedure TF_EmissDAJE.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then ComboBox3.SetFocus;
end;

procedure TF_EmissDAJE.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_EmissDAJE.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_EmissDAJE.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then BitBtn1.SetFocus;
end;

procedure TF_EmissDAJE.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_EmissDAJE.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then ComboBox5.SetFocus; 
end;

procedure TF_EmissDAJE.ComboBox5Exit(Sender: TObject);
var
  valor: String;
begin
  adic  := 0;
  valor := Copy(Label36.Caption, 4, Length(Label36.Caption));
  adic  := StrToCurr(valor) * StrToInt(ComboBox5.Text);
  CurrencyEdit3.Value := total + adic;
  AlimentaAtosAdicionais;
end;

procedure TF_EmissDAJE.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then
  Begin
    ComboBox3.SetFocus;
  End;
end;

procedure TF_EmissDAJE.BitBtn3Click(Sender: TObject);
begin
  DM.ArqAux.Close;
  Close;
end;

procedure TF_EmissDAJE.ComboBox3Exit(Sender: TObject);
begin
  If (ComboBox3.ItemIndex = 0) then //CPF
  Begin
    MaskEdit4.EditMask := '';
    MaskEdit4.Text     := TirarTudo(MaskEdit4.Text, '-','.','/');
    MaskEdit4.EditMask := '999.999.999-99';
  End
  Else If (ComboBox3.ItemIndex = 1) then //CNPJ
  Begin
    MaskEdit4.EditMask := '';
    MaskEdit4.Text     := TirarTudo(MaskEdit4.Text, '-','.','/');
    MaskEdit4.EditMask := '99.999.999/9999-99';
  End
  Else
    MaskEdit4.EditMask := '';

  AlimentaEndereco;    
end;

procedure TF_EmissDAJE.MaskEdit4Exit(Sender: TObject);
begin
  If (Trim(TirarTudo(MaskEdit4.Text, '-','.','/')) <> '') then
  Begin
    If (ComboBox3.ItemIndex = 0) then //CPF
    Begin
      verdoc := CheckCpf(TirarTudo(MaskEdit4.Text, '.','/','-'));
      If (verdoc <> ConvDoc1(MaskEdit4.text, '1', 'CPF')) then
      Begin
        texto := ConvDoc1(VerDoc,'2','CPF');
        Application.MessageBox(Pchar('CPF Correto: ' + (texto)), 'Emissão DAJE', Mb_IconWarning);
        MaskEdit1.SetFocus;
        Exit;
      End;
    End;
    If (ComboBox3.ItemIndex = 1) then //CNPJ
    Begin
      verdoc := CheckCGC(TirarTudo(MaskEdit4.Text, '.','/','-'));
      If (verdoc <> ConvDoc1(MaskEdit4.Text, '1', 'CNPJ')) then
      Begin
        texto := ConvDoc1(VerDoc,'2','CNPJ');
        Application.MessageBox(Pchar('CNPJ Correto: ' + (texto)), 'Emissão DAJE', Mb_IconWarning);
        MaskEdit1.SetFocus;
        Exit;
      End;
    End;
  End;
  AlimentaEndereco;
end;

procedure TF_EmissDAJE.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_EmissDAJE.BitBtn1Click(Sender: TObject);
var
  x: Integer;
  sTexto, obs : String;
begin
  obs := '';

  If (ComboBox1.Text = '') then
  Begin
    Application.MessageBox('Ato Inválido!', 'Emissão DAJE', Mb_IconWarning);
    ComboBox1.SetFocus;
    Exit;
  End;

  If (CurrencyEdit3.Value = 0) then
  Begin
    Application.MessageBox('Valor do DAJE Inválido!', 'Emissão DAJE', Mb_IconWarning);
    ComboBox1.SetFocus;
    Exit;
  End;

  if not CheckBox1.Checked then
  begin
    If (MaskEdit1.Text = '') then
    Begin
      Application.MessageBox('Nome do Contribuinte Inválido!', 'Emissão DAJE', Mb_IconWarning);
      MaskEdit1.SetFocus;
      Exit;
    End;

    If (MaskEdit2.Text = '') then
    Begin
      Application.MessageBox('Endereço do Contribuinte Inválido!', 'Emissão DAJE', Mb_IconWarning);
      MaskEdit2.SetFocus;
      Exit;
    End;

    If (MaskEdit3.Text = '') then
    Begin
      Application.MessageBox('Cidade do Contribuinte Inválido!', 'Emissão DAJE', Mb_IconWarning);
      MaskEdit3.SetFocus;
      Exit;
    End;

    If (ComboBox3.Text = '') then
    Begin
      Application.MessageBox('Tipo Documento do Contribuinte Inválido!', 'Emissão DAJE', Mb_IconWarning);
      ComboBox3.SetFocus;
      Exit;
    End;

    If (TirarTudo(MaskEdit4.Text,'-','.','/') = '') then
    Begin
      Application.MessageBox('Documento do Contribuinte Inválido!', 'Emissão DAJE', Mb_IconWarning);
      MaskEdit4.SetFocus;
      Exit;
    End
    Else If (ComboBox3.ItemIndex = 0) then //CPF
    Begin
      verdoc := CheckCpf(TirarTudo(MaskEdit4.Text, '.','/','-'));
      If (verdoc <> ConvDoc1(MaskEdit4.text, '1', 'CPF')) then
      Begin
        Application.MessageBox('Documento do Contribuinte Inválido!', 'Emissão DAJE', Mb_IconWarning);
        MaskEdit4.SetFocus;
        Exit;
      End;
    End;
    If (ComboBox3.ItemIndex = 1) then //CNPJ
    Begin
      verdoc := CheckCGC(TirarTudo(MaskEdit4.Text, '.','/','-'));
      If (verdoc <> ConvDoc1(MaskEdit4.Text, '1', 'CNPJ')) then
      Begin
        Application.MessageBox('Documento do Contribuinte Inválido!', 'Emissão DAJE', Mb_IconWarning);
        MaskEdit4.SetFocus;
        Exit;
      End;
    End;

    if CheckBox2.Checked then
    begin
      isento := 'S';
      motivo := ComboBox6.Text + ' ' + Trim(MaskEdit8.Text);
      CurrencyEdit3.Value := 0.00;
    end
    else
    begin
      isento := 'N';
      motivo := '';
    end;

    for x := 0 to (F_EmissDAJE.RichEdit1.Lines.Count - 1) do
    begin
      sTexto := sTexto + F_EmissDAJE.RichEdit1.Lines.Strings[x];
    end;


    If GerarDaje(MaskEdit1.Text, DateToStr(Date), TimeToStr(Time), DateToStr(Date + 5), MaskEdit2.Text, RichEdit1.text, TirarTudo(MaskEdit4.Text,'.','-','/'),
                 StrZero(codigo, 5), isento, '', '', CurrencyEdit3.Value, CurrencyEdit2.Value, CurrencyEdit1.Value, StrToInt(id_eselo), StrToInt(id_eselo), StrToInt(ComboBox2.Text), False, codigoAtoAdicional, qtdeAtoAdicional) then
    Begin
      if (isento <> 'S') or ((isento = 'S') and (F_Menu.gerarDajeIsento)) then
      begin
        ImprimirDaje(CurrencyEdit3.Value, DateToStr(Date + 5), MaskEdit1.Text, DateToStr(Date), MaskEdit2.Text, MaskEdit3.Text,
                     F_Menu.Label9.Caption, 'X', '', codigo, ComboBox2.Text, ComboBox1.Text, TirarTudo(MaskEdit4.Text,'.','-','/'), RichEdit1.text, sTexto);
      end;

      Controle_DAJE(DateToStr(Date), TimeToStr(Time), DateToStr(Date + 5), codigo, ato, ComboBox2.Text, MaskEdit1.Text, ComboBox3.Text,
                    TirarTudo(MaskEdit4.Text,'.','-','/'), StrZero(IntToStr(_SerieDaje), 3), StrZero(IntToStr(_NumeroDaje), 6), F_Menu.Label25.Caption, RichEdit1.text,      // 2017 - _PGE
                    StrZero(ComboBox5.Text, 1), _EmolumentosDaje, _TaxaFiscalDaje, _FecomDaje, _DefPublicaDaje, _ValorDaje_WS {CurrencyEdit3.Value}, CurrencyEdit1.Value, MaskEdit2.Text, MaskEdit3.Text, _PGE, _FMMPBA);
                                                                                                                // 2017 - _PGE
      Application.MessageBox(Pchar('Daje ' + StrZero(IntToStr(_SerieDaje), 3) + ' ' + StrZero(IntToStr(_NumeroDaje), 6) + ' Gerado com Sucesso!'), 'Emissão DAJE', Mb_IconInformation);
    End;
  end
  else
  begin
    If (trim(MaskEdit5.Text) = '') or (trim(MaskEdit5.Text) = '000') then
    Begin
      Application.MessageBox('Emissor do DAJE Inválido!', 'Emissão DAJE Complementar', Mb_IconWarning);
      MaskEdit5.SetFocus;
      Exit;
    End;

    If (trim(MaskEdit6.Text) = '') or (trim(MaskEdit6.Text) = '000') then
    Begin
      Application.MessageBox('Série do DAJE Inválido!', 'Emissão DAJE Complementar', Mb_IconWarning);
      MaskEdit6.SetFocus;
      Exit;
    End;

    If (trim(MaskEdit7.Text) = '') or (trim(MaskEdit7.Text) = '000') then
    Begin
      Application.MessageBox('Número do DAJE Inválido!', 'Emissão DAJE Complementar', Mb_IconWarning);
      MaskEdit7.SetFocus;
      Exit;
    End;

    {If GerarDaje_Compl(_ContribuinteDaje, DateToStr(Date), TimeToStr(Time), DateToStr(Date + 5), _EnderecoContribuinteDaje, obs, _CpfCnpjContribuinteDaje,
                 codigo, MaskEdit6.Text, MaskEdit7.Text, _ValorDajeCompl, CurrencyEdit1.Value, StrToInt(MaskEdit5.Text), StrToInt(MaskEdit5.Text), StrToInt(ComboBox2.Text),False) then}

    if GerarDaje_Compl(StrZero(codigo,5), StrZero(MaskEdit6.Text,3), StrZero(MaskEdit7.Text,6), 1, StrToInt(MaskEdit5.Text), StrToInt(MaskEdit5.Text), 0, CurrencyEdit1.Value) then
    begin

      for x := 0 to (F_EmissDAJE.RichEdit1.Lines.Count - 1) do
      begin
        sTexto := sTexto + F_EmissDAJE.RichEdit1.Lines.Strings[x];
      end;

      ImprimirDaje(_ValorDajeCompl, DateToStr(Date + 5), _ContribuinteDaje, DateToStr(Date), _EnderecoContribuinteDaje, F_Menu.Label8.Caption,
                       F_Menu.Label9.Caption, 'X', '', codigo, ComboBox2.Text, ComboBox1.Text, _CpfCnpjContribuinteDaje, RichEdit1.text, sTexto);

      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('update daje set serie_daje_complementar = ' + QuotedStr(StrZero(IntToStr(_SerieDaje), 3)) + ', numero_daje_complementar = ' + IntToStr(_NumeroDaje));
      Dm.ArqAux.Sql.Add(', usuario_complementar = ' + QuotedStr(F_Menu.Label25.Caption) + ', emol_daje_complementar = ' + StringReplace(FloatToStr(_EmolumentosDaje), ',', '.', [rfReplaceAll]));
      Dm.ArqAux.Sql.Add(' where serie_daje = ' + QuotedStr(MaskEdit6.Text) + ' AND numero_daje = ' + IntToStr(StrToInt(MaskEdit7.Text)));
      Try
        Dm.ArqAux.ExecSql;
      Except
      End;

      Controle_DAJE(DateToStr(Date), TimeToStr(Time), DateToStr(Date + 5), codigo, ato, ComboBox2.Text, _ContribuinteDaje, ComboBox3.Text,
                    TirarTudo(_CpfCnpjContribuinteDaje,'.','-','/'), StrZero(IntToStr(_SerieDaje), 3), StrZero(IntToStr(_NumeroDaje), 6), F_Menu.Label25.Caption, RichEdit1.text,
                    StrZero(ComboBox5.Text, 1), _EmolumentosDaje, _TaxaFiscalDaje, _FecomDaje, _DefPublicaDaje, CurrencyEdit3.Value, CurrencyEdit1.Value, MaskEdit2.Text, MaskEdit3.Text, _PGE, _FMMPBA);

      Application.MessageBox(Pchar('Daje ' + StrZero(IntToStr(_SerieDaje), 3) + ' ' + StrZero(IntToStr(_NumeroDaje), 6) + ' Gerado com Sucesso!'), 'Emissão DAJE', Mb_IconInformation);
    End;
  end;
end;

procedure TF_EmissDAJE.BitBtn2Click(Sender: TObject);
begin
  ComboBox1.ItemIndex   := -1;
  CurrencyEdit1.Value   := 0;
  CurrencyEdit1.Enabled := False;
  ComboBox2.Text        := '1';
  ComboBox2.Enabled     := False;
  CurrencyEdit2.Value   := 0;
  Panel9.Visible        := False;
  CurrencyEdit3.Value   := 0;
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  MaskEdit3.Clear;
  ComboBox3.ItemIndex   := -1;
  MaskEdit4.Clear;
  MaskEdit4.EditMask    := '';
  CheckBox2.Checked     := False;
  ComboBox6.Clear;
  MaskEdit8.Clear;
  ComboBox6.Visible     := False;
  MaskEdit8.Visible     := False;
  CheckBox1.Enabled     := True;
  CheckBox1.Checked     := False;
  MaskEdit5.Clear;
  MaskEdit6.Clear;
  MaskEdit7.Clear;
  Panel2.Visible        := False;
  Panel1.Enabled        := True;
  ComboBox1.SetFocus;
end;

procedure TF_EmissDAJE.ComboBox2Exit(Sender: TObject);
begin
  If Not ValidNumero(ComboBox2.Text) then ComboBox2.Text := '1'; 

  total := (total * StrToInt(ComboBox2.Text));
  CurrencyEdit3.Value := total;
end;

procedure TF_EmissDAJE.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_EmissDAJE.ComboBox2KeyPress(Sender: TObject; var Key: Char);
var
  Found: boolean;
  i,SelSt: Integer;
  TmpStr: string;
begin
  If Key in ['a'..'z'] then Dec(Key,32);
  with (Sender as TComboBox) do
  begin
    SelSt := SelStart;
    if (Key = Chr(vk_Back)) and (SelLength <> 0) then
     TmpStr := Copy(Text,1,SelStart)+Copy(Text,SelLength+SelStart+1,255)

    else if Key = Chr(vk_Back) then
     TmpStr := Copy(Text,1,SelStart-1)+Copy(Text,SelStart+1,255)
    else
     TmpStr := Copy(Text,1,SelStart)+Key+Copy(Text,SelLength+SelStart+1,255);
    if TmpStr = '' then Exit;

    if (Key = Chr(vk_Back)) and (SelSt > 0) then Dec(SelSt)

    else if Key <> Chr(vk_Back) then Inc(SelSt);
    Key := #0;
    if SelSt = 0 then
    begin
      Text:= '';
      Exit;
    end;

    Found := False;
    for i := 1 to Items.Count do
      if UpperCase(Copy(Items[i-1],1,Length(TmpStr))) = UpperCase(TmpStr) then
      begin
        Text := Items[i-1];
        ItemIndex := i-1;
        Found := True;
        Break;
      end;
    if Found then
    begin
      SelStart := SelSt;
      SelLength := Length(Text)-SelSt;
    end
    else Beep;
  end;
end;

procedure TF_EmissDAJE.BitBtn4Click(Sender: TObject);
begin
  {Application.CreateForm(TF_ReImpDAJE, F_ReImpDAJE);
  F_ReImpDAJE.ShowModal;
  F_ReImpDAJE.Destroy;
  F_ReImpDAJE := Nil;}
  Application.CreateForm(TF_ConsDaje, F_ConsDaje);
  F_ConsDaje.ShowModal;
  F_ConsDaje.Destroy;
  F_ConsDaje := Nil;
end;

procedure TF_EmissDAJE.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    Panel2.Visible := True;
    Panel3.Enabled := False;
    MaskEdit5.Text := id_eselo;
    MaskEdit6.SetFocus;
  end
  else
  begin
    Panel2.Visible := False;
    Panel3.Enabled := True;
    Panel4.Visible := False;
    MaskEdit1.SetFocus;
  end;
end;

procedure TF_EmissDAJE.MaskEdit5Exit(Sender: TObject);
begin
  if (trim(copy(MaskEdit5.Text,1,3)) <> '') then
    MaskEdit5.Text := StrZero(Trim(MaskEdit5.Text), 3);
end;

procedure TF_EmissDAJE.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_EmissDAJE.MaskEdit6Exit(Sender: TObject);
begin
  if (trim(copy(MaskEdit6.Text,1,3)) <> '') then
    MaskEdit6.Text := StrZero(Trim(MaskEdit6.Text), 3);
end;

procedure TF_EmissDAJE.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_EmissDAJE.Button1Click(Sender: TObject);
var texto : String;
begin
  texto := MotivoIsencao(id_eselo);
end;

procedure TF_EmissDAJE.CheckBox2Click(Sender: TObject);
var
  texto, codigo, descricao : string;
begin

  ComboBox6.Visible := CheckBox2.Checked;
  MaskEdit8.Visible := CheckBox2.Checked;

  CheckBox1.Checked := False;
  CheckBox1.Enabled := not CheckBox2.Checked;
  MaskEdit5.Clear;
  MaskEdit6.Clear;
  MaskEdit7.Clear;
  Panel2.Visible    := False;

  if CheckBox2.Checked then
  begin
    if (ComboBox6.Items.Count = 0) then
    begin
      texto := MotivoIsencao(id_eselo);
      Memo1.Text := texto;
      while (Pos('<codigoMotivo>', Memo1.Text) > 0) do
      begin
        codigo     := Copy(Memo1.Text, Pos('<codigoMotivo>', Memo1.Text) + 14, Pos('</codigoMotivo>', Memo1.Text) - Pos('<codigoMotivo>', Memo1.Text) - 14);
        descricao  := Copy(Memo1.Text, Pos('<descricao>', Memo1.Text) + 11, Pos('</descricao>', Memo1.Text) - Pos('<descricao>', Memo1.Text) - 11);
        Memo1.Text := Copy(Memo1.Text, Pos('</descricao>', Memo1.Text) + 12, Length(Memo1.Text) - Pos('</descricao>', Memo1.Text) - 12);
        ComboBox6.Items.Add(codigo + ' - ' + descricao);
      end;
    end;
  end;
end;

procedure TF_EmissDAJE.ComboBox6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_EmissDAJE.ComboBox1Change(Sender: TObject);
begin
  ComboBox5.Text := '0';
end;

procedure TF_EmissDAJE.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_EmissDAJE.BitBtn5Click(Sender: TObject);
var
  daje_sistema : string;
begin
  if (trim(copy(MaskEdit7.Text,1,6)) <> '') then
    MaskEdit7.Text := StrZero(Trim(MaskEdit7.Text), 6);

  if not ValidNumero(MaskEdit6.Text) then
  begin
    Application.MessageBox('Série do DAJE Inválida!', 'Emissão DAJE Complementar', Mb_IconWarning);
    MaskEdit6.SetFocus;
    Exit;
  end;

  if not ValidNumero(MaskEdit7.Text) then
  begin
    Application.MessageBox('Nº. do DAJE Inválida!', 'Emissão DAJE Complementar', Mb_IconWarning);
    MaskEdit7.SetFocus;
    Exit;
  end;

  if ConsultarDaje_Compl(codigo, MaskEdit6.Text, Trim(MaskEdit7.Text), 1, StrToInt(MaskEdit5.Text), StrToInt(MaskEdit5.Text), 0,CurrencyEdit1.Value) then
  begin
    Panel4.Visible  := True;
    Label9.Caption  := FormatCurr('R$ ###,###,##0.00', _ValorDaje);
    Label10.Caption := FormatCurr('R$ ###,###,##0.00', _ValorDajeCompl);
    Panel1.Enabled  := False;

    daje_sistema := VerStatusDajeSistema(MaskEdit6.Text, MaskEdit7.Text);
    if (daje_sistema = 'Liberado Manualmente') or (_StatusDaje = 'Pago') then
    begin
      BitBtn1.Enabled := True;
      BitBtn1.SetFocus;
    end
    else
    begin
      Application.MessageBox('Daje Principal Não esta PAGO OU LIBERADO MANUALMENTE !', 'Emissão DAJE Complementar', Mb_IconWarning);
      Panel1.Enabled  := True;
      BitBtn1.Enabled := False;
      MaskEdit7.SetFocus;
      Exit;
    end;
  end;
end;

procedure TF_EmissDAJE.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then BitBtn5.SetFocus;
end;

procedure TF_EmissDAJE.AlimentaAtosAdicionais;
begin
  If Copy(ComboBox1.Text,1,2) = 'IX' then
  Begin
    codigoAtoAdicional := '24031';
    qtdeAtoAdicional   := ComboBox5.Text;
  End;

  If Copy(ComboBox1.Text,1,2) = 'II' then
  Begin
    codigoAtoAdicional := '18023';
    qtdeAtoAdicional   := ComboBox5.Text;
  End
  
end;

procedure TF_EmissDAJE.AlimentaEndereco;
begin
    dm.QryGenerico.Close;
    dm.QryGenerico.SQL.Clear;
    dm.QryGenerico.SQL.Add('select * from daje where doc = '+QuotedStr(TirarTudo(MaskEdit4.Text, '.','/','-'))+'');
    dm.QryGenerico.Open;

    dm.QryGenerico.Last;

    if (Not(dm.QryGenerico.IsEmpty)) Then
    Begin
      MaskEdit1.Text:= dm.QryGenerico.FieldByName('contribuinte').AsString;
      MaskEdit2.Text:= dm.QryGenerico.FieldByName('endereco').AsString;
      MaskEdit3.Text:= dm.QryGenerico.FieldByName('cidade').AsString;
    End;

end;

procedure TF_EmissDAJE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (F_Exame <> Nil) and (sProtocoloVinculado = '' ) Then
  Begin
    if (MessageBox(Handle, PChar('Deseja informar o daje na tela de recepção de título ?'), 'Titulos e Documentos', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    Begin
      F_Exame.BitBtn16.Click;
    End;
  End
  Else
  if (F_Exame <> Nil) and (sProtocoloVinculado <> '' ) Then
  Begin
    if (MessageBox(Handle, PChar('Deseja chamar o protocolo vinculado ao daje na tela de exame ?'), 'Titulos e Documentos', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    Begin
      F_Exame.MaskEdit1.Text:= sProtocoloVinculado;
      F_Exame.BitBtn1.Click;
    End;
    sProtocoloVinculado:= '';
  End

end;

procedure TF_EmissDAJE.CheckBox3Click(Sender: TObject);
begin
 { // adriel 07-10-2020 O.S1033
  if CheckBox3.Checked then
  begin
    CurrencyEdit3.Value:= CurrencyEdit3.Value - (CurrencyEdit3.Value * 0.4);
  end else
  begin
    CurrencyEdit3.Value:=total;
  end; }
end;

procedure TF_EmissDAJE.FormActivate(Sender: TObject);
begin
   if (not Permissao('acesso116')) then
    CheckBox2.enabled := false
  else
    CheckBox2.enabled := true;
end;

end.
