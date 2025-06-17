unit BxRetPro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Buttons, WPDefs, WPPrint, WpWinCtr,
  WPRich, jpeg;

type
  TF_BxRetPro = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    BitBtn8: TBitBtn;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    WPRichText1: TWPRichText;
    Label7: TLabel;
    Timer1: TTimer;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn8Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure BuscaTextoCombo(Sender : TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    Procedure BaixaRetorno(Sender : TObject; NumBaixa : Integer);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_BxRetPro: TF_BxRetPro;
  NumRL, NumCert   : String;  

implementation

Uses Menu, DMTD, ChecaB, ChecaB2, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_BxRetPro.BuscaTextoCombo(Sender : TObject);
var
  x : Integer;
begin
  x := 0;
  while x <= (ComboBox1.Items.Count - 1) do
  begin
    if (Copy(ComboBox1.Items.Strings[x], 1, 5) = MaskEdit2.Text) then
    begin
      ComboBox1.Text := ComboBox1.Items.Strings[x];
      x := ComboBox1.Items.Count;
    end;
    x := x + 1;
  end;
  UpdateWindow(Handle);
end;

Procedure TF_BxRetPro.BaixaRetorno(Sender : TObject; NumBaixa : Integer);
var
  cdata, csit, ccod, chora : String;
  cod_ocor : Integer;
begin
  if (Trim(NumRl) = '')   then NumRL   := Dm.BxRet.FieldByName('rl').asString;
  if (Trim(NumCert) = '') then NumCert := Dm.BxRet.FieldByName('anotacao').asString;
  cdata    := 'data_prov' + IntToStr(NumBaixa);
  csit     := 'sit_prov'  + IntToStr(NumBaixa);
  ccod     := 'cod_prov'   + IntToStr(NumBaixa);
 // chora    := 'hora_not' + IntToStr(NumBaixa);
  cod_ocor := 0;
  if (RadioGroup1.ItemIndex = 0) then cod_ocor := 1;
  if (RadioGroup1.ItemIndex = 1) then cod_ocor := StrToInt(MaskEdit2.Text);
//  if (RadioGroup1.ItemIndex = 2) then cod_ocor := 2;
  Dm.BxRet.Edit;
  Dm.BxRet.FieldByName(cdata).asString        := MaskEdit3.Text;
  Dm.BxRet.FieldByName(csit).asString         := Label5.Caption;
  Dm.BxRet.FieldByName(ccod).asInteger        := cod_ocor;
 // Dm.BxRet.FieldByName(chora).asString        := Copy(TimeToStr(Time), 1,5);
  if (StrToInt(NumRl) > Dm.BxRet.FieldByName('rl').asInteger) then
  begin
    Dm.BxRet.FieldByName('rlcertid').asString   := NumRL;
  end
  else Dm.BxRet.FieldByName('rlcertid').asString   := Dm.BxRet.FieldByName('rl').asString;
  Dm.BxRet.FieldByName('certcertif').asString := NumCert;
  Dm.BxRet.Post;
  AtualizaTabela('td', Label4.Caption,
                 (cdata + ',' + csit + ',' + ccod + ',rl' ),
                 (ConvData(MaskEdit3.Text) + ',' + Label5.Caption + ',' + IntToStr(cod_ocor) + ',' + Label6.Caption));
  if (Label5.Caption = 'N') then
    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Notificação-Baixa Provisória como ' + Ver_TipoBaixaNotificacao(Label5.Caption) + ' em ' + MaskEdit3.Text + ' pelo motivo ' + Copy(ComboBox1.Text, 7, 120), Label4.Caption)
  else
    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Notificação-Baixa Provisória como ' + Ver_TipoBaixaNotificacao(Label5.Caption) + ' em ' + MaskEdit3.Text, Label4.Caption);
      
  WpRichText1.Lines.Insert(0, StrBranco(MaskEdit1.Text, 20, 'D') + ' - Destinatário : ' + Busca_NomePessoal(Label4.Caption, 'D'));
  WpRichText1.Refresh;
end;

procedure TF_BxRetPro.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_BxRetPro.RadioGroup1Click(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex = 1) then
  begin
    Label5.Caption := 'N';
    Panel2.Visible := True;
    MaskEdit2.SetFocus;
  end
  else
  begin
    if (RadioGroup1.ItemIndex = 0) then Label5.Caption := 'P';
  //  if (RadioGroup1.ItemIndex = 2) then Label5.Caption := 'L';
    Panel2.Visible := False;
    MaskEdit2.Text := '0';
    MaskEdit1.SetFocus;
  end;  
end;

procedure TF_BxRetPro.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_BxRetPro.ComboBox1Enter(Sender: TObject);
begin
  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_BxRetPro.ComboBox1Exit(Sender: TObject);
begin
  MaskEdit2.Text := Copy(ComboBox1.Text, 1,5);
end;

procedure TF_BxRetPro.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_BxRetPro.FormActivate(Sender: TObject);
begin
  WpRichText1.Font.Name  := 'Courier New';
  WpRichText1.Font.Size  := 10;
  WpRichText1.Font.Style := [afsbold];
  MaskEdit3.Text := DateToStr(Date);
  MaskEdit1.SetFocus;
end;

procedure TF_BxRetPro.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ItemBusca, arq : String;
  CodRL, AchouPosi : Boolean;
begin
  if key = 13 then
  begin
    CodRL   := False;
    NumRL   := '';
    NumCert := '';
    if (Copy(MaskEdit1.Text, 1, 2) = 'RZ') or (Copy(MaskEdit1.Text, 1, 2) = 'RC') then
    begin
      ItemBusca := ExtraiNumero(MaskEdit1.Text);
      CodRL     := True;
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT numreg, codigo_barra, numcerti FROM acertifi');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('codigo_barra = ' + Chr(39) + ItemBusca + Chr(39));
      Dm.ArqAux.Open;
      if Dm.ArqAux.recordCount <> 0 then
      Begin
       ItemBusca := Dm.ArqAux.FieldByName('numreg').asString;
       NumRL     := Dm.ArqAux.FieldByName('codigo_barra').asString;
       NumCert   := Dm.ArqAux.FieldByName('numcerti').asString;
       Dm.ArqAux.Close;
      end else
       Begin
         Showmessage('URL NÃO LOCALIZADA, FAVOR UTILIZAR O NÚMERO DE REGISTRO!');
         maskedit1.setfocus;
         exit;
       end;
    end
    else ItemBusca := MaskEdit1.Text;
    AchouPosi := False;
    { Verificando se já está baixado no sistema deles }
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT datasitu, situacao, observacoes FROM acertifi');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    numreg = ' + ItemBusca);
    Dm.ArqAux.Sql.Add('AND situacao not in(1, 2, 11)');
    Dm.ArqAux.Sql.Add('ORDER BY datasitu DESC');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount <> 0) then
    begin
      arq := '';
      arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'CHECABAIXA';
      CriaTabela('CHECABAIXA', arq);
      while (not Dm.ArqAux.Eof) do
      begin
        Dm.ArqAux1.Close;
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
        Dm.ArqAux1.Sql.Add('(data, codigo, descricao)');
        Dm.ArqAux1.Sql.Add('VALUES(');
        Dm.ArqAux1.Sql.Add(Chr(39) + ConvData(Dm.ArqAux.FieldByName('datasitu').asString) + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('situacao').asString + Chr(39) + ',');
        if (Dm.ArqAux.FieldByName('situacao').asInteger > 0) then
        begin
          Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('situacao').asString) + Chr(39) + ')');
        end
        else Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('observacoes').asString) + Chr(39) + ')');
        Dm.ArqAux1.ExecSql;
        Dm.ArqAux.Next;
      end;
      Dm.ArqAux.Close;
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('SELECT * FROM ' + arq);
      Dm.ArqAux1.Sql.Add('ORDER BY recno');
      Dm.ArqAux1.Open;
      Application.CreateForm(TF_ChecaBaixa, F_ChecaBaixa);
      F_ChecaBaixa.ShowModal;
      F_ChecaBaixa.Destroy;
      F_ChecaBaixa := NIL;
      Dm.ArqAux1.Close;
      DestroeTabela(arq);
      AchouPosi := True;
    end;
    //

    //Verificando se o protocolo já possui alguma baixa definitiva
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT anotacao, rl, data_not1, sit_not1, cod_ir1, obs_not1, hora_not1,');
    Dm.ArqAux.Sql.Add('data_not2, sit_not2, cod_ir2, obs_not2, hora_not2,');
    Dm.ArqAux.Sql.Add('data_not3, sit_not3, cod_ir3, obs_not3, hora_not3,');
    Dm.ArqAux.Sql.Add('p_auxiliar, protocolo, rlcertid, certcertif');
    Dm.ArqAux.Sql.Add('FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('registro = ' + ItemBusca);
    Dm.ArqAux.Sql.Add('AND natureza = 197');
    Dm.ArqAux.Sql.Add('AND ((cod_ir1 <> 0) or (cod_ir2 <> 0) or (cod_ir3 <> 0))');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount <> 0) then
    begin
      arq := '';
      //arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'CHECABAIXA';
      //CriaTabela('CHECABAIXA', arq);
      arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ANDANOT';
      CriaTabela('ANDANOT', arq);

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
//    Dm.Arqaux1.Sql.Add(Chr(39) + 'RC ' + Dm.ArqAux.FieldByName('rl').asString + ' BR' + Chr(39) + ',');
      Dm.Arqaux1.Sql.Add(Chr(39) + F_Menu.Label34.Caption + Dm.ArqAux.FieldByName('rl').asString + ' BR' + Chr(39) + ',');

      if (Dm.ArqAux.FieldByName('cod_ir1').asInteger = 1) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'POSITIVA' + Chr(39) + ',');
      end
      else if (Dm.ArqAux.FieldByName('cod_ir1').asInteger = 2) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'PARCIAL' + Chr(39) + ',');
      end
      else Dm.ArqAux1.Sql.Add(Chr(39) + 'NEGATIVA' + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('obs_not1').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir1').asString) + Chr(39) + ',');
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
//    Dm.Arqaux1.Sql.Add(Chr(39) + 'RC ' + Dm.ArqAux.FieldByName('rl').asString + ' BR' + Chr(39) + ',');
      Dm.Arqaux1.Sql.Add(Chr(39) + F_Menu.Label34.Caption + Dm.ArqAux.FieldByName('rl').asString + ' BR' + Chr(39) + ',');
      if (Dm.ArqAux.FieldByName('cod_ir2').asInteger = 1) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'POSITIVA' + Chr(39) + ',');
      end
      else if (Dm.ArqAux.FieldByName('cod_ir2').asInteger = 2) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'PARCIAL' + Chr(39) + ',');
      end
      else Dm.ArqAux1.Sql.Add(Chr(39) + 'NEGATIVA' + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('obs_not2').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir2').asString) + Chr(39) + ',');
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
      Dm.Arqaux1.Sql.Add(Chr(39) + F_Menu.Label34.Caption + Dm.ArqAux.FieldByName('rl').asString + ' BR' + Chr(39) + ',');
//    Dm.Arqaux1.Sql.Add(Chr(39) + 'RC ' + Dm.ArqAux.FieldByName('rl').asString + ' BR' + Chr(39) + ',');
      if (Dm.ArqAux.FieldByName('cod_ir3').asInteger = 1) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'POSITIVA' + Chr(39) + ',');
      end
      else if (Dm.ArqAux.FieldByName('cod_ir3').asInteger = 2) then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + 'PARCIAL' + Chr(39) + ',');
      end
      else Dm.ArqAux1.Sql.Add(Chr(39) + 'NEGATIVA' + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Trim(Dm.ArqAux.FieldByName('obs_not3').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir3').asString) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add('3)');
      Dm.ArqAux1.ExecSQL;
    end;

    {  while (not Dm.ArqAux.Eof) do
      begin
        Dm.ArqAux1.Close;
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
        Dm.ArqAux1.Sql.Add('(data_not1, data_not2, data_not3, p_auxiliar, protocolo,');
        Dm.ArqAux1.Sql.Add('cod_ir1, cod_ir2, cod_ir3, sit_not1, sit_not2, sit_not3, descricao, descricao1, descricao2)');
        Dm.ArqAux1.Sql.Add('VALUES(');
        if  Dm.ArqAux.FieldByName('data_not1').asString <> '' then
        Dm.ArqAux1.Sql.Add(Chr(39) + ConvData(Dm.ArqAux.FieldByName('data_not1').asString) + Chr(39) + ',')
        else
        Dm.ArqAux1.Sql.Add(Chr(39) + '' + Chr(39)+ ',');
        if  Dm.ArqAux.FieldByName('data_not1').asString <> '' then

        if  Dm.ArqAux.FieldByName('data_not2').asString <> '' then
        Dm.ArqAux1.Sql.Add(Chr(39) + ConvData(Dm.ArqAux.FieldByName('data_not2').asString) + Chr(39) + ',')
        else
        Dm.ArqAux1.Sql.Add(Chr(39) + '' + Chr(39)+ ',');

        if  Dm.ArqAux.FieldByName('data_not3').asString <> '' then
        Dm.ArqAux1.Sql.Add(Chr(39) + ConvData(Dm.ArqAux.FieldByName('data_not3').asString) + Chr(39) + ',')
        else
        Dm.ArqAux1.Sql.Add(Chr(39) + '' + Chr(39)+ ',');

        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('p_auxiliar').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('protocolo').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('cod_ir1').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('cod_ir2').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('cod_ir3').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('sit_not1').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('sit_not2').asString + Chr(39) + ',');
        Dm.ArqAux1.Sql.Add(Chr(39) + Dm.ArqAux.FieldByName('sit_not3').asString + Chr(39) + ',');
        if (Dm.ArqAux.FieldByName('cod_ir1').asInteger > 0) then
         Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir1').asString) + Chr(39) + ',')
        else
         Dm.ArqAux1.Sql.Add(Chr(39) + ''+ Chr(39)+ ',');

        if (Dm.ArqAux.FieldByName('cod_ir2').asInteger > 0) then
         Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir2').asString) + Chr(39) + ',')
        else
         Dm.ArqAux1.Sql.Add(Chr(39) + ''+ Chr(39)+ ',');

        if (Dm.ArqAux.FieldByName('cod_ir3').asInteger > 0) then
         Dm.ArqAux1.Sql.Add(Chr(39) + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_ir3').asString) + Chr(39) + ')')
        else
         Dm.ArqAux1.Sql.Add(Chr(39) + ''+ Chr(39)+')');


        Dm.ArqAux1.ExecSql;
        Dm.ArqAux.Next;
      end;}


      Dm.ArqAux.Close;
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('SELECT * FROM ' + arq);
      Dm.ArqAux1.Sql.Add('ORDER BY recno');
      Dm.ArqAux1.Open;
      Application.CreateForm(TF_ChecaBaixa2, F_ChecaBaixa2);
      F_ChecaBaixa2.ShowModal;
      F_ChecaBaixa2.Destroy;
      F_ChecaBaixa2 := NIL;
      Dm.ArqAux1.Close;
      DestroeTabela(arq);
    end;
  //término da verificação se já existe alguma baixa Definitiva para o Registro,
//  a ser baixado provisoriamente.

    Dm.BxRet.Close;
    Dm.BxRet.Sql.Clear;
    Dm.BxRet.Sql.Add('SELECT p_auxiliar, rl, anotacao, rlcertid, certcertif,');
    Dm.BxRet.Sql.Add('data_prov1, cod_prov1, sit_prov1,');
    Dm.BxRet.Sql.Add('data_prov2, cod_prov2, sit_prov2,');
    Dm.BxRet.Sql.Add('data_prov3, cod_prov3, sit_prov3');
    Dm.BxRet.Sql.Add('FROM td');
    Dm.BxRet.Sql.Add('WHERE');
    Dm.BxRet.Sql.Add('registro = ' + ItemBusca);
    Dm.BxRet.Sql.Add('AND natureza = 197');
    Dm.BxRet.Open;
    if (Dm.BxRet.RecordCount = 0) then
    begin
      Dm.BxRet.Close;
      if (CodRL) then ShowMessage('ATENÇÃO - CÓDIGO DO CORREIO NÃO ENCONTRADO !') else ShowMessage('ATENÇÃO - N. REGISTRO NÃO ENCONTRADO !');
      MaskEdit1.SetFocus;
      WpRichText1.Lines.Insert(0, MaskEdit1.Text + ' - NOTIFICAÇÃO NÃO BAIXADA.');
      UpDateWindow(Handle);
      Exit;
    end;
    Label4.Caption := '0';
    Label4.Caption := Dm.BxRet.FieldByName('p_auxiliar').asString;
    Label6.Caption := '';
    Label6.Caption := Dm.BxRet.FieldByName('rl').asString;
    if (Trim(Dm.BxRet.FieldByName('sit_prov3').asString) = '') AND
       (Trim(Dm.BxRet.FieldByName('sit_prov2').asString) = '') AND
       (Trim(Dm.BxRet.FieldByName('sit_prov1').asString) = '') then
    begin
      if (AchouPosi) then
      begin
        // Verificando se já existe uma baixa.
        if (MessageBox(Handle, PChar('ATENÇÃO - ESTE TÍTULO JÁ POSSUI UMA BAIXA - DESEJA REALIZAR NOVA BAIXA ?'), 'ATENÇÃO - BAIXA JÁ ENCONTRADA.', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then BaixaRetorno(F_BxRetPro, 1);
      end
      else
      begin
        // Verificando se já existe uma baixa.
        if (Trim(Dm.BxRet.FieldByName('sit_prov3').asString) <> '') then
        begin
          Dm.BxRet.Close;
          ShowMessage('ATENÇÃO - NÃO HÁ MAIS POSSIBILIDADES DE EFETUAR O RETORNO DA NOTIFICAÇÃO.');
          Exit;
        end;
        // Verificando se já existe uma baixa.
        if (Trim(Dm.BxRet.FieldByName('sit_prov2').asString) <> '') AND
           (Trim(Dm.BxRet.FieldByName('sit_prov2').asString) <> 'L') then
        begin
          if (MessageBox(Handle, PChar('ATENÇÃO - ESTE TÍTULO JÁ POSSUI A BAIXA DE ' + Ver_TipoBaixaNotificacao(Dm.BxRet.FieldByName('sit_prov2').asString) + ' EM ' + Dm.BxRet.FieldByName('data_prov2').asString + '. DESEJA REALIZAR NOVA BAIXA ?'), 'ATENÇÃO - BAIXA JÁ ENCONTRADA.', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
          begin
            BaixaRetorno(F_BxRetPro, 3);
          end;
        end
        else
        begin
          // Verificando se já existe uma baixa.
          if (Trim(Dm.BxRet.FieldByName('sit_prov1').asString) <> '') AND
             (Trim(Dm.BxRet.FieldByName('sit_prov1').asString) <> 'L') then
          begin
            if (MessageBox(Handle, PChar('ATENÇÃO - ESTE TÍTULO JÁ POSSUI A BAIXA DE ' + Ver_TipoBaixaNotificacao(Dm.BxRet.FieldByName('sit_prov1').asString) + ' EM ' + Dm.BxRet.FieldByName('data_prov1').asString + '. DESEJA REALIZAR NOVA BAIXA ?'), 'ATENÇÃO - BAIXA JÁ ENCONTRADA.', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
            begin
              BaixaRetorno(F_BxRetPro, 2);
            end;
          end
          else
          begin
            BaixaRetorno(F_BxRetPro, 1);
          end;
        end;
      end;
    end
    else
    begin
      // Verificando se já existe uma baixa.
      if (Trim(Dm.BxRet.FieldByName('sit_prov3').asString) <> '') then
      begin
        Dm.BxRet.Close;
        ShowMessage('ATENÇÃO - NÃO HÁ MAIS POSSIBILIDADES DE EFETUAR O RETORNO DA NOTIFICAÇÃO.');
        Exit;
      end;
      // Verificando se já existe uma baixa.
      if (Trim(Dm.BxRet.FieldByName('sit_prov2').asString) <> '') AND
         (Trim(Dm.BxRet.FieldByName('sit_prov2').asString) <> 'L') then
      begin
        if (MessageBox(Handle, PChar('ATENÇÃO - ESTE TÍTULO JÁ POSSUI A BAIXA DE ' + Ver_TipoBaixaNotificacao(Dm.BxRet.FieldByName('sit_prov2').asString) + ' EM ' + Dm.BxRet.FieldByName('data_prov2').asString + '. DESEJA REALIZAR NOVA BAIXA ?'), 'ATENÇÃO - BAIXA JÁ ENCONTRADA.', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
        begin
          BaixaRetorno(F_BxRetPro, 3);
        end;
      end
      else
      begin
        // Verificando se já existe uma baixa.
        if (Trim(Dm.BxRet.FieldByName('sit_prov1').asString) <> '') AND
           (Trim(Dm.BxRet.FieldByName('sit_prov1').asString) <> 'L') then
        begin
          if (MessageBox(Handle, PChar('ATENÇÃO - ESTE TÍTULO JÁ POSSUI A BAIXA DE ' + Ver_TipoBaixaNotificacao(Dm.BxRet.FieldByName('sit_prov1').asString) + ' EM ' + Dm.BxRet.FieldByName('data_prov1').asString + '. DESEJA REALIZAR NOVA BAIXA ?'), 'ATENÇÃO - BAIXA JÁ ENCONTRADA.', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
          begin
            BaixaRetorno(F_BxRetPro, 2);
          end;
        end
        else
        begin
          if (Trim(Dm.BxRet.FieldByName('sit_prov1').asString) = '') then
          begin
            BaixaRetorno(F_BxRetPro, 1);
          end
          else BaixaRetorno(F_BxRetPro, 2);
        end;
      end;
    end;  
    MaskEdit1.Clear;
    MaskEdit1.SetFocus;
  end;
end;

procedure TF_BxRetPro.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

procedure TF_BxRetPro.MaskEdit2Exit(Sender: TObject);
begin
  if (Not ValidNumero(MaskEdit2.Text)) OR
     (StrToInt(MaskEdit2.Text) = 0)    then
  begin
    MaskEdit2.Text := '0';
    ComboBox1.SetFocus;
  end
  else
  begin
    MaskEdit2.Text := StrZero(Trim(MaskEdit2.Text), 5);
    BuscaTextoCombo(F_BxRetPro);
  end;
end;

procedure TF_BxRetPro.Timer1Timer(Sender: TObject);
begin
   if Label7.Caption = '' then
    Label7.Caption := 'B A I X A  P R O V I S Ó R I A'
   else Label7.Caption := '';
end;

end.
