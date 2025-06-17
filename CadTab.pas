unit CadTab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids, jpeg, ToolEdit,
  CurrEdit;

type
  TF_CadTab = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    Procedure Carregar(Sender : TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Atualizar(Sender : TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadTab: TF_CadTab;

implementation

uses DMTD, Menu, QkCadTab, PCadTab, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_CadTab.Atualizar(Sender : TObject);
begin
  Dm.Cad_Tab2.Close;
  Dm.Cad_Tab2.Sql.Clear;
  Dm.Cad_Tab2.Sql.Add('SELECT * FROM cad_tab');
  Dm.Cad_Tab2.Sql.Add('ORDER BY descricao');
  Dm.Cad_Tab2.Open;
  Carregar(F_CadTab);
end;

Procedure TF_CadTab.Carregar(Sender : TObject);
begin
  MaskEdit1.Text      := Dm.Cad_Tab2.FieldByName('tabela').asString;
  MaskEdit2.Text      := Dm.Cad_Tab2.FieldByName('descricao').asString;
  MaskEdit3.Text      := Dm.Cad_Tab2.FieldByName('item').asString;
  maskedit4.text      := Dm.Cad_Tab2.FieldByName('subitem').AsString;
  MaskEdit5.Text      := Dm.Cad_Tab2.FieldByname('tipo').AsString;
  CurrencyEdit1.Value := Dm.Cad_Tab2.FieldByname('valor').AsCurrency;
end;

procedure TF_CadTab.FormActivate(Sender: TObject);
begin
  Atualizar(F_CadTab);
end;

procedure TF_CadTab.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_CadTab.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if (BitBtn1.Enabled) then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

procedure TF_CadTab.BitBtn1Click(Sender: TObject);
begin
  if (BitBtn1.Caption = '&Incluir') then
  begin
    BitBtn1.Caption := '&Gravar';
    BitBtn2.Enabled := False;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := False;
    BitBtn6.Enabled := False;
    BitBtn7.Enabled := False;
    BitBtn8.Enabled := False;
    Panel1.Enabled  := True;
    MaskEdit1.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Confirma inclusão dos dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      Dm.Cad_Tab2.Append;
      Dm.Cad_Tab2.FieldByName('tabela').asString    := Trim(MaskEdit1.Text);
      Dm.Cad_Tab2.FieldByName('descricao').asString := Trim(MaskEdit2.Text);
      Dm.Cad_Tab2.FieldByName('item').asString      := Trim(MaskEdit3.Text);
      Dm.Cad_Tab2.FieldByName('subitem').AsString   := Trim(maskedit4.Text);
      Dm.Cad_Tab2.FieldByName('tipo').AsString      := Trim(maskedit5.Text);
      Dm.Cad_Tab2.FieldByName('valor').AsString     := CurrencyEdit1.Text;
      Dm.Cad_Tab2.Post;
    end;
    Atualizar(F_CadTab);
    BitBtn1.Caption := '&Incluir';
    BitBtn2.Enabled := True;
    BitBtn3.Enabled := True;
    BitBtn4.Enabled := True;
    BitBtn5.Enabled := True;
    BitBtn6.Enabled := True;
    BitBtn7.Enabled := True;
    BitBtn8.Enabled := True;
    Panel1.Enabled  := False;
  end;
end;

procedure TF_CadTab.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Excluir os dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão do item da tabela ' + StrZero(MaskEdit1.Text, 2) + Trim(MaskEdit3.Text) + ' - ' + Trim(MaskEdit2.Text), '0');
    Dm.Cad_Tab2.Delete;
    Carregar(F_CadTab);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão do item de tabela ' + StrZero(MaskEdit1.Text, 2) + Trim(MaskEdit3.Text) + ' - ' + Trim(MaskEdit2.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_CadTab.BitBtn5Click(Sender: TObject);
begin
  Dm.Cad_Tab2.Next;
  Carregar(F_CadTab);
end;

procedure TF_CadTab.BitBtn6Click(Sender: TObject);
begin
  Dm.Cad_Tab2.Prior;
  Carregar(F_CadTab);
end;

procedure TF_CadTab.BitBtn3Click(Sender: TObject);
begin
  if (BitBtn3.Caption = '&Correção') then
  begin
    BitBtn3.Caption := '&Gravar';
    BitBtn2.Enabled := False;
    BitBtn1.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := False;
    BitBtn6.Enabled := False;
    BitBtn7.Enabled := False;
    BitBtn8.Enabled := False;
    Panel1.Enabled  := True;
    MaskEdit1.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Confirma correção dos dados ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      Dm.Cad_Tab2.Edit;
      Dm.Cad_Tab2.FieldByName('tabela').asString    := Trim(MaskEdit1.Text);
      Dm.Cad_Tab2.FieldByName('descricao').asString := Trim(MaskEdit2.Text);
      Dm.Cad_Tab2.FieldByName('item').asString      := Trim(MaskEdit3.Text);
      Dm.Cad_Tab2.FieldByName('subitem').AsString   := trim(MaskEdit4.Text);
      Dm.Cad_Tab2.FieldByName('tipo').AsString      := trim(MaskEdit5.Text);
      Dm.Cad_Tab2.FieldByName('valor').AsString     := CurrencyEdit1.Text;
      Dm.Cad_Tab2.Post;
    end;
    BitBtn3.Caption := '&Correção';
    BitBtn2.Enabled := True;
    BitBtn1.Enabled := True;
    BitBtn4.Enabled := True;
    BitBtn5.Enabled := True;
    BitBtn6.Enabled := True;
    BitBtn7.Enabled := True;
    BitBtn8.Enabled := True;
    Panel1.Enabled  := False;
  end;
end;

procedure TF_CadTab.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CadTab.MaskEdit1Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('Favor digitar apenas caracteres numéricos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
  end;
end;

procedure TF_CadTab.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_CadTab.BitBtn7Click(Sender: TObject);
begin
  Dm.Cad_Tab2.FindFirst;
  Application.CreateForm(TQk_CadTab, Qk_CadTab);
  Qk_CadTab.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_CadTab.QrLabel2.Caption := F_Menu.Label11.Caption;
  Qk_CadTab.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_CadTab.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_CadTab.QrLabel5.Caption := 'RELATÓRIO DOS ITENS DA TABELA DE CUSTAS';
  Qk_CadTab.QuickRep1.Preview;
  Qk_CadTab.Destroy;
  Qk_CadTab := NIL;
end;

procedure TF_CadTab.FormDestroy(Sender: TObject);
begin
  Dm.Cad_Tab2.Close;
end;

procedure TF_CadTab.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PCadtab, F_PCadTab);
  F_PCadTab.ShowModal;
  F_PCadTab.Destroy;
  F_PCadTab := NIL;
  if (Dm.Cad_Tab2.Active) then Carregar(F_CadTab) else Atualizar(F_CadTab);
end;

procedure TF_CadTab.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_CadTab.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_CadTab.MaskEdit5Exit(Sender: TObject);
begin
  if (MaskEdit5.Text <> 'C') and (MaskEdit5.Text <> 'R') then
  begin
    Application.MessageBox('Preencher apenas com C - Ceridão ou R - Registro','Mensagem do Sistema', mb_ok);
    MaskEdit5.SetFocus;
    exit;
  end;
end;

procedure TF_CadTab.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then MaskEdit2.SetFocus;
end;

end.
