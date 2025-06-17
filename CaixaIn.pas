unit CaixaIn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, ToolEdit, CurrEdit, Grids,
  DBGrids, ComCtrls, jpeg;

type
  TF_CaixaIn = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBGrid1: TDBGrid;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    Panel2: TPanel;
    Label9: TLabel;
    Memo1: TMemo;
    CurrencyEdit8: TCurrencyEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn8: TBitBtn;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CurrencyEdit3Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CaixaIn: TF_CaixaIn;
  dataseek : String;

implementation

uses Menu, Func, DMTD, QK_CaixaIn, FuncGeral;

{$R *.DFM}

procedure atualiza_tab;
begin
  Dm.CaixaIn.Close;
  Dm.CaixaIn.Sql.Clear;  
  Dm.CaixaIn.Sql.Add('select * from caixaind where data = ' + Chr(39) + ConvData(F_CaixaIn.MaskEdit1.Text) + Chr(39));
  Dm.CaixaIn.Open;
end;

procedure hab_botao;
begin
  With F_CaixaIn do
  begin
    Bitbtn2.Enabled := True;
    Bitbtn3.Enabled := True;
    Bitbtn4.Enabled := True;
    BitBtn8.Enabled := True;
    Bitbtn6.Enabled := True;
    Bitbtn7.Enabled := True;
  end;
end;

procedure des_botao;
begin
  With F_CaixaIn do
  begin
    Bitbtn2.Enabled := False;
    Bitbtn3.Enabled := False;
    Bitbtn4.Enabled := False;
    BitBtn8.Enabled := False;
    Bitbtn6.Enabled := False;
    Bitbtn7.Enabled := False;
  end;
end;

procedure zera_vars;
begin
  With F_CaixaIn do
  begin
    MaskEdit1.Text := '';
    MaskEdit2.Text := '';
    CurrencyEdit1.Value := 0;
    CurrencyEdit2.Value := 0;
    CurrencyEdit3.Value := 0;
    CurrencyEdit4.Value := 0;
    CurrencyEdit5.Value := 0;
    CurrencyEdit6.Value := 0;
    CurrencyEdit7.Value := 0;
  end;
end;

{procedure Busca_Fundo;
var
  vr_fundo : Currency;
begin
  dataseek := copy(F_CaixaIn.MaskEdit1.Text,7,4) + '-' + copy(F_CaixaIn.MaskEdit1.Text,4,2) + '-' + copy(F_CaixaIn.MaskEdit1.Text,1,2);
  vr_fundo := 0;
  if not TabSql.FundoCx.Active then TabSql.FundoCx.Open;
  TabSql.FundoCx.Sql.Clear;
  TabSql.FundoCx.Close;
  TabSql.FundoCx.Sql.Add('select * from fundocx where data = "' + dataseek + '" and caixa = "' + F_Caixain.MaskEdit2.Text + '"');
  TabSql.FundoCx.Open;
  if TabSql.FundoCx.RecordCount <> 0 then
  begin
    TabSql.FundoCx.FindFirst;
    while not TabSql.FundoCx.Eof do
    begin
      vr_fundo := vr_fundo + TabSql.FundoCx.FieldByName('saldo').AsCurrency;
      TabSql.FundoCx.Next;
    end;
  end;
  F_CaixaIn.CurrencyEdit4.Value := vr_fundo;
end; }

Procedure Carregar;
begin
  With F_CaixaIn do
  begin
    MaskEdit1.Text      := Dm.CaixaIn.FieldByName('data').AsString;
    MaskEdit2.Text      := Dm.CaixaIn.FieldByName('caixa').AsString;
    CurrencyEdit1.Value := Dm.CaixaIn.FieldByName('dinheiro').AsCurrency;
    CurrencyEdit2.Value := Dm.CaixaIn.FieldByName('cheque').AsCurrency;
    CurrencyEdit3.Value := Dm.CaixaIn.FieldByName('moeda').AsCurrency;
    CurrencyEdit8.Value := dm.CaixaIn.FieldByName('faturado').AsCurrency;
//    Busca_Fundo;
    CurrencyEdit5.Value := (Dm.CaixaIn.FieldByName('dinheiro').AsCurrency +
                            Dm.CaixaIn.FieldByName('cheque').AsCurrency +
                            Dm.CaixaIn.FieldByName('moeda').AsCurrency +
                            Dm.CaixaIn.FieldByName('faturado').AsCurrency);
    CurrencyEdit6.Value := Dm.CaixaIn.FieldByName('despesas').AsCurrency;
    CurrencyEdit7.Value := Dm.CaixaIn.FieldByName('cheque_canc').AsCurrency;
    Memo1.Text          := Dm.CaixaIn.FieldByName('esp_despesas').AsString;
  end;
end;

procedure TF_CaixaIn.BitBtn5Click(Sender: TObject);
begin
  Close;
  des_botao;
end;

procedure TF_CaixaIn.BitBtn4Click(Sender: TObject);
begin
  Dm.CaixaIn.Next;
  carregar;
end;

procedure TF_CaixaIn.BitBtn6Click(Sender: TObject);
begin
  Dm.CaixaIn.Prior;
  carregar;
end;

procedure TF_CaixaIn.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit2.SetFocus;
end;

procedure TF_CaixaIn.CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit3.SetFocus;
end;

procedure TF_CaixaIn.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit7.SetFocus;
end;

procedure TF_CaixaIn.CurrencyEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Memo1.SetFocus;
  {begin
   if CurrencyEdit6.Value <> 0 then DbMemo1.SetFocus else
    begin
      if BitBtn1.Enabled = True then bitBtn1.SetFocus else BitBtn3.SetFocus;
    end;
  end;}
end;

procedure TF_CaixaIn.BitBtn1Click(Sender: TObject);
begin
  if Bitbtn1.Caption = '&Incluir' then
  Begin
    Bitbtn1.Caption := '&Gravar';
    if F_Menu.Label15.Caption = 'T' then
    begin
      Bitbtn2.Enabled := False;
      Bitbtn3.Enabled := False;
      Bitbtn4.Enabled := False;
      BitBtn8.Enabled := False;
      Bitbtn5.Enabled := False;
      Bitbtn6.Enabled := False;
      Bitbtn7.Enabled := False;
    end;
    Panel1.Enabled := True;
    Dm.CaixaIn.Append;
    MaskEdit1.Text := DateToStr(date);
    MaskEdit2.Text := F_Menu.Label1.Caption;
//    Busca_Fundo;
    CurrencyEdit1.SetFocus;
  end
  else
  Begin
    if MessageDlg('Dados Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Dm.CaixaIn.FieldByName('data').AsString           := MaskEdit1.Text;
      Dm.CaixaIn.FieldByName('caixa').AsString          := MaskEdit2.Text;
      Dm.CaixaIn.FieldByName('dinheiro').AsCurrency     := CurrencyEdit1.Value;
      Dm.CaixaIn.FieldByName('cheque').AsCurrency       := CurrencyEdit2.Value;
      Dm.CaixaIn.FieldByName('faturado').AsCurrency     := CurrencyEdit8.Value;
      Dm.CaixaIn.FieldByName('moeda').AsCurrency        := CurrencyEdit3.Value;
      Dm.CaixaIn.FieldByName('despesas').AsCurrency     := CurrencyEdit6.Value;
      Dm.CaixaIn.FieldByName('cheque_canc').AsCurrency  := CurrencyEdit7.Value;
      Dm.CaixaIn.FieldByName('esp_despesas').AsString   := Trim(Memo1.Text);
      Dm.CaixaIn.Post;
      atualiza_tab;
      if F_Menu.Label15.Caption = 'T' then Bitbtn1.Enabled := True else Bitbtn1.Enabled := False;
      BitBtn7.Enabled := True;
      BitBtn7.SetFocus;
    end
    else
    begin
      Dm.CaixaIn.Cancel;
      atualiza_tab;
      carregar;
      des_botao;
      Zera_Vars;
    end;

    Bitbtn1.Caption := '&Incluir';
    if F_Menu.Label15.Caption = 'T' then
    begin
      Bitbtn2.Enabled := True;
      Bitbtn3.Enabled := True;
      Bitbtn4.Enabled := True;
      BitBtn8.Enabled := True;
      Bitbtn5.Enabled := True;
      Bitbtn6.Enabled := True;
      Bitbtn7.Enabled := True;
    end;

    Panel1.Enabled  := False;
  end;
end;

procedure TF_CaixaIn.FormActivate(Sender: TObject);
begin
  if F_menu.Label15.Caption = 'T' then hab_botao;
  carregar;
  if BitBtn1.Enabled = True then BitBtn1.SetFocus else BitBtn5.Enabled := True;
end;

procedure TF_CaixaIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.CaixaIn.Close;
end;

procedure TF_CaixaIn.CurrencyEdit3Exit(Sender: TObject);
begin
  CurrencyEdit5.Value := (CurrencyEdit1.Value + CurrencyEdit2.Value + CurrencyEdit3.Value + CurrencyEdit8.Value);
end;

procedure TF_CaixaIn.BitBtn7Click(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Impressora OK ?'), 'COMPLEMENTO DE DEPÓSITO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes then
  begin
    F_QK_CaixaIn := TF_QK_CaixaIn.create(application);
    {Montando relatório resumo}
    F_Qk_CaixaIn.QrLabel1.Caption  := F_Menu.Caption;
    F_Qk_CaixaIn.QrLabel2.Caption  := F_Menu.Label11.Caption;
    F_Qk_CaixaIn.QrLabel3.Caption  := F_Menu.Label5.Caption;
    F_Qk_CaixaIn.QrLabel23.Caption := F_Menu.Label13.Caption;
    F_Qk_CaixaIn.QrLabel5.Caption  := 'Resumo referente ao Caixa de ' + MaskEdit2.Text + ' do dia ' + maskedit1.text + ' .' ;
    F_Qk_CaixaIn.QrLabel15.Caption := 'R$ ' + FormatCurr('###,###,###,###,#0.00',CurrencyEdit1.Value);
    F_Qk_CaixaIn.QrLabel16.Caption := 'R$ ' + FormatCurr('###,###,###,###,#0.00',CurrencyEdit2.Value);
    F_Qk_CaixaIn.QrLabel17.Caption := 'R$ ' + FormatCurr('###,###,###,###,#0.00',CurrencyEdit3.Value);
    F_Qk_CaixaIn.QrLabel18.Caption := 'R$ ' + FormatCurr('###,###,###,###,#0.00',CurrencyEdit5.Value);
    F_Qk_CaixaIn.QrLabel19.Caption := 'R$ ' + FormatCurr('###,###,###,###,#0.00',CurrencyEdit6.Value);
    F_Qk_CaixaIn.QrLabel20.Caption := 'R$ ' + FormatCurr('###,###,###,###,#0.00',CurrencyEdit7.Value);
    F_QK_CaixaIn.QRLabel27.Caption := 'R$ ' + FormatCurr('###,###,###,###,#0.00',CurrencyEdit8.Value);
    F_Qk_CaixaIn.QrLabel21.Caption := 'R$ ' + FormatCurr('###,###,###,###,#0.00',CurrencyEdit1.Value + CurrencyEdit2.Value + CurrencyEdit3.Value + CurrencyEdit6.Value + CurrencyEdit7.Value + CurrencyEdit8.Value);
    F_Qk_CaixaIn.QrLabel22.Caption := 'R$ ' + FormatCurr('###,###,###,###,#0.00',CurrencyEdit4.Value);
    F_Qk_CaixaIn.QrLabel24.Caption := 'Caixa - ' + MaskEdit2.Text;
    F_Qk_CaixaIn.QRRichText1.Lines.Add(Dm.Caixain.FieldByName('esp_despesas').AsString);
    F_QK_CaixaIn.QuickRep1.Preview;
    F_QK_CaixaIn.Free;
  end;
  if F_menu.Label15.Caption <> 'T' then BitBtn7.Enabled := False;
  Dm.CaixaIn.Edit;
  Dm.CaixaIn.FieldByName('encerrado').AsString := 'S';
  Dm.CaixaIn.Post;
  bitBtn5.SetFocus;
end;

procedure TF_CaixaIn.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Confirma Exclusão ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then Dm.CaixaIn.Delete;
  Carregar;
end;

procedure TF_CaixaIn.BitBtn3Click(Sender: TObject);
begin
  if Bitbtn3.Caption = '&Corrigir' then
  Begin
    Bitbtn3.Caption := '&Gravar';
    if F_Menu.Label15.Caption = 'T' then
    begin
      Bitbtn1.Enabled := False;
      Bitbtn2.Enabled := False;
      Bitbtn4.Enabled := False;
      BitBtn8.Enabled := False;
      Bitbtn5.Enabled := False;
      Bitbtn6.Enabled := False;
      Bitbtn7.Enabled := False;
    end;
    Panel1.Enabled := True;
    Dm.CaixaIn.Edit;
    CurrencyEdit1.SetFocus;
  end
  else
  Begin
    if MessageDlg('Dados Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Dm.CaixaIn.FieldByName('data').AsString           := MaskEdit1.Text;
      Dm.CaixaIn.FieldByName('caixa').AsString          := MaskEdit2.Text;
      Dm.CaixaIn.FieldByName('dinheiro').AsCurrency     := CurrencyEdit1.Value;
      Dm.CaixaIn.FieldByName('cheque').AsCurrency       := CurrencyEdit2.Value;
      Dm.CaixaIn.FieldByName('faturado').AsCurrency     := CurrencyEdit8.Value;
      Dm.CaixaIn.FieldByName('moeda').AsCurrency        := CurrencyEdit3.Value;
      Dm.CaixaIn.FieldByName('despesas').AsCurrency     := CurrencyEdit6.Value;
      Dm.CaixaIn.FieldByName('cheque_canc').AsCurrency  := CurrencyEdit7.Value;
      Dm.CaixaIn.FieldByName('esp_despesas').AsString   := Trim(Memo1.Text);
      Dm.CaixaIn.Post;
    end
    else Dm.CaixaIn.Cancel;
    Bitbtn3.Caption := '&Corrigir';
    if F_Menu.Label15.Caption = 'T' then
    begin
      Bitbtn1.Enabled := True;
      Bitbtn2.Enabled := True;
      Bitbtn4.Enabled := True;
      BitBtn8.Enabled := True;
      Bitbtn5.Enabled := True;
      Bitbtn6.Enabled := True;
      Bitbtn7.Enabled := True;
    end;
    Panel1.Enabled  := False;
    BitBtn7.Enabled := True;
    BitBtn7.SetFocus;
  end;
end;

procedure TF_CaixaIn.DBMemo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 9 then
  begin
    if BitBtn1.Enabled then BitBtn1.SetFocus else BitBtn3.SetFocus;
  end;
end;

procedure TF_CaixaIn.CurrencyEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit6.SetFocus;
end;

procedure TF_CaixaIn.BitBtn8Click(Sender: TObject);
var
  data : String;
begin
  data := InputBox('Data : ', 'Pesquisa', DateToStr(date));
  if (ValidData(data)) then
  begin
    Dm.CaixaIn.Close;  
    Dm.CaixaIn.Sql.Clear;
    Dm.CaixaIn.Sql.Add('SELECT * FROM caixaind');
    Dm.CaixaIn.Sql.Add('WHERE');
    Dm.CaixaIn.Sql.Add('data = ' + Chr(39) + ConvData(data) + Chr(39));
    Dm.CaixaIn.Sql.Add('ORDER BY caixa');
    Dm.CaixaIn.Open;
    if (Dm.CaixaIn.RecordCount = 0) then
    begin
      ShowMessage('Data não encontrada !');
      Exit;
    end;
    carregar;
  end;
end;

end.
