unit TAB_AUX1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Grids, DBGrids, ToolEdit,
  CurrEdit, jpeg;

type
  TF_TabAux1 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    MaskEdit1: TMaskEdit;
    BitBtn4: TBitBtn;
    BitBtn7: TBitBtn;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    Label8: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    ComboBox2: TComboBox;
    Label4: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    MaskEdit4: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure Atualizar(Sender : TObject; data : String);
    Procedure Carregar(Sender : TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CurrencyEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
 //   Procedure Soma(Sender : TObject; Calcula : Boolean);
    procedure FormActivate(Sender: TObject);
    Procedure Carrega_Tab1(Sender : TObject);
    Procedure Carrega_ItensTab(Sender : TOBject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_TabAux1: TF_TabAux1;
  nova_tab :  Boolean;

implementation

uses DMTD, Menu, QkTab, FuncGeral, ProcGeral;

{$R *.DFM}

Function Acha_Tabela(Tipo : String) : String;
var
  x : Integer;
begin
  Result := '';
  x      := 0;
  while x <= (F_TabAux1.ComboBox2.Items.Count - 1) do
  begin
    if (Tipo = Trim(Copy(F_TabAux1.ComboBox2.Items.Strings[x], 1,3))) then
    begin
      Result := F_TabAux1.ComboBox2.Items.Strings[x];
      x      := F_TabAux1.ComboBox2.Items.Count;  
    end;
    x := x + 1;
  end;
end;

Procedure TF_TabAux1.Carrega_ItensTab(Sender : TOBject);
begin
  ComboBox2.Clear;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM cad_tab');
  Dm.ArqAux.Sql.Add('ORDER BY tabela, item DESC');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    ComboBox2.Text := StrBranco(StrZero(Dm.ArqAux.FieldByName('tabela').asString, 2) + Trim(Dm.ArqAux.FieldByName('item').asString) + Trim(Dm.ArqAux.FieldByName('subitem').asString) , 3, 'D') + ' - ' + Dm.ArqAux.FieldByName('descricao').AsString;
    while (not Dm.ArqAux.Eof) do
    begin
      ComboBox2.Items.Add(StrBranco(StrZero(Dm.ArqAux.FieldByName('tabela').asString, 2) + Trim(Dm.ArqAux.FieldByName('item').asString) + Trim(Dm.ArqAux.FieldByName('subitem').asString), 3, 'D') + ' - ' + Dm.ArqAux.FieldByName('descricao').AsString);
      Dm.ArqAux.Next;
    end;
  end;
  Dm.ArqAux.Close;
end;

Procedure TF_TabAux1.Carrega_Tab1(Sender : TObject);
var
  x : Integer;
begin
  ComboBox1.Clear;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT data FROM cad_cus');
  Dm.ArqAux.Sql.Add('GROUP BY data');
  Dm.ArqAux.Sql.Add('ORDER BY data DESC, tabela');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    ComboBox1.Text := Dm.ArqAux.FieldByName('data').AsString;
    x              := 0;
    while (not Dm.ArqAux.Eof) do
    begin
      x := x + 1;
      ComboBox1.Items.Add(Dm.ArqAux.FieldByName('data').AsString);
      Dm.ArqAux.Next;
    end;
    ComboBox1.ItemIndex := 0;
  end;
  Dm.ArqAux.Close;
end;

{Procedure TF_TabAux1.Soma(Sender : TObject; Calcula : Boolean);
begin
  if (calcula) then
  begin
    CurrencyEdit4.Value := (CurrencyEdit3.Value * 0.284211);
    CurrencyEdit5.Value := (CurrencyEdit3.Value * 0.210526);
    CurrencyEdit6.Value := (CurrencyEdit3.Value * 0.052632);
    CurrencyEdit7.Value := (CurrencyEdit3.Value * 0.052632);
    CurrencyEdit8.Value := 0.00; // (CurrencyEdit3.Value * 0.01);
  end;
  CurrencyEdit9.Value := (CurrencyEdit3.Value + CurrencyEdit4.Value + CurrencyEdit5.Value +
                          CurrencyEdit6.Value + CurrencyEdit7.Value + CurrencyEdit8.Value);
end;
 }
Procedure TF_TabAux1.Atualizar(Sender : TObject; data : String);
begin
  Dm.Cad_Cus.Close;
  Dm.Cad_Cus.Sql.Clear;
  Dm.Cad_Cus.Sql.Add('SELECT * FROM cad_cus');
  Dm.Cad_Cus.Sql.Add('WHERE');
  if (ValidData(data)) then
  begin
    Dm.Cad_Cus.Sql.Add('data = ' + Chr(39) + ConvData(data) + Chr(39));
  end
  else Dm.Cad_Cus.Sql.Add('data = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.Cad_Cus.Sql.Add('ORDER BY data, tabela');
  Dm.Cad_Cus.Open;
  Dm.Cad_Cus.FindLast;
  Carregar(F_TabAux1);
end;

Procedure TF_TabAux1.Carregar(Sender : TObject);
begin
  MaskEdit1.Text      := Dm.Cad_Cus.FieldByName('data').asString;
  MaskEdit2.Text      := Dm.Cad_Cus.FieldByName('tabela').asString;
  MaskEdit3.Text      := Dm.Cad_Cus.FieldByName('item').asString;
  MaskEdit4.Text      := dm.cad_cus.FieldByName('subitem').AsString;
  ComboBox2.Text      := Dm.Cad_Cus.FieldByName('descricao').asString;
  CurrencyEdit3.Value := Dm.Cad_Cus.FieldByName('v_emolumentos').asCurrency;
end;

procedure TF_TabAux1.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_TabAux1.BitBtn5Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Visualizar outras tabelas cadastradas ?'), 'AVANÇAR', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    ComboBox1.ItemIndex := (ComboBox1.ItemIndex - 1);
    if (Trim(ComboBox1.Items.Strings[ComboBox1.ItemIndex]) <> '') then
    begin
      Atualizar(F_TabAux1, ComboBox1.Items.Strings[ComboBox1.ItemIndex]);
    end
    else
    begin
      ComboBox1.ItemIndex := (ComboBox1.ItemIndex + 1);
      MessageBox(Handle, PChar('Não existem mais tabelas cadastradas !'), 'AVANÇAR', MB_OK + MB_ICONWARNING);      
    end;  
  end
  else
  begin
    Dm.Cad_Cus.Next;
    Carregar(F_TabAux1);
  end;  
end;

procedure TF_TabAux1.BitBtn6Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Visualizar outras tabelas cadastradas ?'), 'RETORNAR', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    ComboBox1.ItemIndex := (ComboBox1.ItemIndex + 1);
    if (Trim(ComboBox1.Items.Strings[ComboBox1.ItemIndex]) <> '') then
    begin
      Atualizar(F_TabAux1, ComboBox1.Items.Strings[ComboBox1.ItemIndex]);
    end
    else
    begin
      ComboBox1.ItemIndex := (ComboBox1.ItemIndex - 1);
      MessageBox(Handle, PChar('Não existem mais tabelas cadastradas !'), 'RETORNAR', MB_OK + MB_ICONWARNING);
    end;        
  end
  else
  begin
    Dm.Cad_Cus.Prior;
    Carregar(F_TabAux1);
  end;  
end;

procedure TF_TabAux1.BitBtn3Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir este lançamento ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão do lançamento da tabela ' + Trim(MaskEdit2.Text) + Trim(MaskEdit3.Text), '0');
    Dm.Cad_Cus.Delete;
    Carregar(F_TabAux1);
  end
  else
  begin
    if (MessageBox(Handle, PChar('Deseja excluir todos os lançamentos desta data ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then  
    begin
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão de todos os lançamentos do dia ' + Trim(MaskEdit1.Text), '0');
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('DELETE FROM cad_cus');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('data = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
      Dm.ArqAux.ExecSql;
      Atualizar(F_TabAux1, '');
    end
    else
    begin
      MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão dos lançamentos da tabela do dia ' + Trim(MaskEdit1.Text), '0');
      BitBtn1.SetFocus;
    end;  
  end;
end;

procedure TF_TabAux1.BitBtn2Click(Sender: TObject);
begin
  if BitBtn2.Caption = '&Corrigir' then
  begin
    BitBtn1.Enabled := False;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := False;
    BitBtn6.Enabled := False;
    Panel3.Enabled  := True;    
    BitBtn2.Caption := '&Gravar';
    MaskEdit1.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Dados OK ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      Dm.Cad_Cus.Edit;
      Dm.Cad_Cus.FieldByName('data').asDateTime             := StrToDate(MaskEdit1.Text);
      Dm.Cad_Cus.FieldByName('tabela').asInteger            := StrToInt(MaskEdit2.Text);
      Dm.Cad_Cus.FieldByName('item').asString               := Trim(MaskEdit3.Text);
      dm.Cad_Cus.FieldByName('subitem').AsString            := Trim(MaskEdit4.Text);
      Dm.Cad_Cus.FieldByName('descricao').asString          := Trim(ComboBox2.Text);
      Dm.Cad_Cus.FieldByName('v_emolumentos').asCurrency    := CurrencyEdit3.Value;
      Dm.Cad_Cus.Post;
    end;
    BitBtn1.Enabled := True;
    BitBtn3.Enabled := True;
    BitBtn4.Enabled := True;
    BitBtn5.Enabled := True;
    BitBtn6.Enabled := True;
    Panel3.Enabled  := False;
    BitBtn2.Caption := '&Corrigir';
    BitBtn2.SetFocus;
  end;
end;

procedure TF_TabAux1.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption = '&Incluir' then
  begin
    BitBtn2.Enabled := False;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := False;
    BitBtn6.Enabled := False;
    BitBtn7.Enabled := False;
    BitBtn8.Enabled := False;
    Panel3.Enabled  := True;
    BitBtn1.Caption := '&Gravar';
    MaskEdit1.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Gravar Dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      Dm.Cad_Cus.Close;
      Dm.Cad_Cus.Sql.Clear;
      Dm.Cad_Cus.Sql.Add('SELECT * FROM cad_cus');
      Dm.Cad_Cus.Sql.Add('WHERE');
      Dm.Cad_Cus.Sql.Add('1 = 2');
      Dm.Cad_Cus.Open;
      Dm.Cad_Cus.Append;
      Dm.Cad_Cus.FieldByName('data').asDateTime             := StrToDate(MaskEdit1.Text);
      Dm.Cad_Cus.FieldByName('tabela').asInteger            := StrToInt(MaskEdit2.Text);
      Dm.Cad_Cus.FieldByName('item').asString               := Trim(MaskEdit3.Text);
      dm.Cad_Cus.FieldByName('subitem').AsString            := Trim(MaskEdit4.Text);
      Dm.Cad_Cus.FieldByName('descricao').asString          := Trim(ComboBox2.Text);
      Dm.Cad_Cus.FieldByName('v_emolumentos').asCurrency    := CurrencyEdit3.Value;
      Dm.Cad_Cus.Post;
      Dm.Cad_Cus.Close;
    end;
    Carrega_Tab1(F_TabAux1);
    Atualizar(F_TabAux1, MaskEdit1.Text);
    BitBtn2.Enabled := True;
    BitBtn3.Enabled := True;
    BitBtn4.Enabled := True;
    BitBtn5.Enabled := True;
    BitBtn6.Enabled := True;
    BitBtn7.Enabled := True;
    BitBtn8.Enabled := True;
    Panel3.Enabled  := False;
    BitBtn1.Caption := '&Incluir';
    BitBtn1.SetFocus;
  end;
end;

procedure TF_TabAux1.BitBtn4Click(Sender: TObject);
var
  datafil : String;
begin
  datafil := InputBox('Pesquisa', 'Filtrar tabela do dia : ', DateToStr(Date));
  if (ValidData(datafil)) then Atualizar(F_TabAux1, datafil) else MessageBox(Handle, PChar('Data inválida !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
end;

procedure TF_TabAux1.BitBtn7Click(Sender: TObject);
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM cad_cus');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('data = ' + Chr(39) + ConvData(ComboBox1.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('ORDER BY tabela, item, subitem');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('Problemas para localizar a tabela do dia ' + Trim(MaskEdit1.Text)), 'IMPRESSÃO', MB_OK + MB_ICONWARNING);
    Dm.ArqAux.Close;
    Exit;
  end;
  Application.CreateForm(TQk_Tab, Qk_Tab);
  Qk_Tab.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_Tab.QrLabel2.Caption := F_Menu.Label11.Caption;
  Qk_Tab.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_Tab.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_Tab.QrLabel5.Caption := 'TABELA DE CUSTAS EM VIGOR A PARTIR DO DIA ' + Trim(MaskEdit1.Text);
  Qk_Tab.QuickRep1.Preview;
  Qk_Tab.Destroy;
  Qk_Tab := NIL;
end;

procedure TF_TabAux1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.Cad_Cus.Close;
end;

procedure TF_TabAux1.CurrencyEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if F_TabAux1.BitBtn1.Enabled = True then F_TabAux1.BitBtn1.SetFocus else F_TabAux1.BitBtn2.SetFocus;
end;

procedure TF_TabAux1.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_TabAux1.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_TabAux1.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_TabAux1.FormActivate(Sender: TObject);
begin
  Carrega_ItensTab(F_TabAux1);
  Carrega_Tab1(F_TabAux1);
  Atualizar(F_TabAux1, ComboBox1.Text);
end;

procedure TF_TabAux1.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit3.SetFocus;
end;

procedure TF_TabAux1.MaskEdit3Exit(Sender: TObject);
begin
  ComboBox2.Text := Acha_Tabela(StrZero(Trim(MaskEdit2.Text), 2) + Trim(MaskEdit3.Text)); 
end;

procedure TF_TabAux1.ComboBox2Exit(Sender: TObject);
begin
  if (Trim(ComboBox2.Text) <> '') then
  begin
    MaskEdit2.Text := Copy(ComboBox2.Text, 1,2);
    MaskEdit3.Text := Copy(ComboBox2.Text, 3,1);
  end;
end;

end.
