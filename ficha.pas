unit ficha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids, Printers, DBCtrls,
  jpeg;

type
  TF_Fich = class(TForm)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    MaskEdit1: TMaskEdit;
    ComboBox1: TComboBox;
    MaskEdit2: TMaskEdit;
    ComboBox2: TComboBox;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label3: TLabel;
    MaskEdit5: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Carregar(Sender : TObject; Pesquisa, Clique : Boolean);
    procedure ComboBox1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    Procedure Gravar(Sender : TOBject; Modo : Integer);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Fich: TF_Fich;

implementation

uses DMTD, Menu, imp_fic, PFich, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Fich.Carregar(Sender : TObject; Pesquisa, Clique : Boolean);
begin
  if (pesquisa) then
  begin
    Dm.Fichario.Close;
    Dm.Fichario.Sql.Clear;
    Dm.Fichario.Sql.Add('SELECT * FROM fichario');
    Dm.Fichario.Sql.Add('ORDER BY NOME');
    Dm.Fichario.Open;
  end;
  MaskEdit5.Text     := Dm.Fichario.FieldByName('data').asString;
  MaskEdit1.Text     := Dm.Fichario.FieldByName('nome').asString;
  ComboBox1.Text     := Dm.Fichario.FieldByName('tip_doc1').asString;
  MaskEdit2.Text     := ConvDoc(Dm.Fichario.FieldByName('doc1').asString, ComboBox1.Text);
  ComboBox2.Text     := Dm.Fichario.FieldByName('tip_doc2').asString;
  MaskEdit3.Text     := Dm.Fichario.FieldByName('doc2').asString;
  MaskEdit4.Text     := Dm.Fichario.FieldByName('registro').asString;
  if (Clique) then DbGrid1.ShowHint := False;
end;

Procedure TF_Fich.Gravar(Sender : TOBject; Modo : Integer);
begin
  if (not ValidData(MaskEdit5.Text)) then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - DATA INVÁLIDA !'), 'INCLUSÃO', MB_OK + MB_ICONWARNING);
    MaskEdit5.SetFocus;
    Exit;    
  end;
  if (Modo = 0) then
  begin
    Dm.Fichario.Close;
    Dm.Fichario.Sql.Clear;
    Dm.Fichario.Sql.Add('SELECT * FROM fichario');
    Dm.Fichario.Sql.Add('WHERE');
    Dm.Fichario.Sql.Add('    nome     = ' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39));
    Dm.Fichario.Sql.Add('AND registro = ' + Trim(MaskEdit4.Text));
    Dm.Fichario.Open;
    if (Dm.Fichario.RecordCount <> 0) then
    begin
      MessageBox(Handle, PChar('ATENÇÃO - FICHARIO ENCONTRADO !'), 'INCLUSÃO', MB_OK + MB_ICONWARNING);
      Carregar(F_Fich, False, False);
      Exit;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Inclusão de ficha em nome de ' + Trim(MaskEdit1.Text) + ' no registro nº ' + Trim(MaskEdit4.Text), '0');
    Dm.Fichario.Append;
  end
  else Dm.Fichario.Edit;
  Dm.Fichario.FieldByName('data').asDateTime   := StrToDate(MaskEdit5.Text);
  Dm.Fichario.FieldByName('nome').asString     := Trim(MaskEdit1.Text);
  Dm.Fichario.FieldByName('tip_doc1').asString := Trim(ComboBox1.Text);
  Dm.Fichario.FieldByName('doc1').asString     := TirarTudo(MaskEdit2.Text, '.','/','-');
  Dm.Fichario.FieldByName('tip_doc2').asString := Trim(ComboBox2.Text);
  Dm.Fichario.FieldByName('doc2').asString     := Trim(MaskEdit3.Text);
  Dm.Fichario.FieldByName('registro').asString := Trim(MaskEdit4.Text);
  Dm.Fichario.Post;
  if (modo = 0) then Carregar(F_Fich, True, False);
end;

procedure TF_Fich.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Fich.FormActivate(Sender: TObject);
begin
  Carregar(F_Fich, True, False);
  BitBtn1.SetFocus;
end;

procedure TF_Fich.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption = '&Incluir' then
  begin
    BitBtn1.Caption := '&Salvar';
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := false;
    BitBtn4.Enabled := false;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    MaskEdit5.Text  := DateToStr(date);
    MaskEdit5.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Confirma inclusão de dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      Gravar(F_Fich, 0);
    end
    else
    begin
      MessageBox(Handle, PChar('Os dados não foram incluídos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da inclusão da ficha em nome de ' + Trim(MaskEdit1.Text) + ' registro nº ' + Trim(MaskEdit4.Text), '0');
    end;
    Carregar(F_Fich, True, False);
    BitBtn1.Caption := '&Incluir';
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := true;
    BitBtn4.Enabled := true;
    BitBtn5.Enabled := true;
    BitBtn6.Enabled := true;
    BitBtn7.Enabled := true;
    BitBtn8.Enabled := true;
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Fich.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir os dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão da ficha em nome de ' + Trim(MaskEdit1.Text), '0');
    Dm.Fichario.Delete;
    Carregar(F_Fich, False, False);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);  
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão da ficha em nome de ' + Trim(MaskEdit1.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Fich.BitBtn3Click(Sender: TObject);
begin
  if BitBtn3.Caption = '&Correção' then
  begin
    BitBtn3.Caption := '&Salvar';
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := false;
    BitBtn4.Enabled := false;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    MaskEdit5.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma correção dos dados ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_Fich, 1);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Alterada a ficha em nome de ' + Trim(MaskEdit1.Text), '0');
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da alteração da ficha ' + Trim(MaskEdit1.Text), '0');
        Carregar(F_Fich, False, False);
      end;
      BitBtn3.Caption := '&Correção';
      BitBtn1.Enabled := true;
      BitBtn2.Enabled := true;
      BitBtn4.Enabled := true;
      BitBtn5.Enabled := true;
      BitBtn6.Enabled := true;
      BitBtn7.Enabled := true;
      BitBtn8.Enabled := true;
      BitBtn3.SetFocus;
    end;
  end;  
end;

procedure TF_Fich.BitBtn5Click(Sender: TObject);
begin
  Dm.Fichario.Next;
  Carregar(F_Fich, False, False);
end;

procedure TF_Fich.BitBtn6Click(Sender: TObject);
begin
  Dm.Fichario.Next;
  Carregar(F_Fich, False, False);
end;

procedure TF_Fich.BitBtn7Click(Sender: TObject);
begin
  Application.CreateForm(TF_ImpFic, F_ImpFic);
  F_ImpFic.ShowModal;
  F_ImpFic.Destroy;
  F_ImpFic := NIL;
end;

procedure TF_Fich.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (BitBtn1.Enabled = true) and (BitBtn1.Caption = '&Salvar') then BitBtn1.SetFocus;
    if (BitBtn3.Enabled = true) and (BitBtn3.Caption = '&Salvar') then BitBtn3.SetFocus;
  end;
end;

procedure TF_Fich.ComboBox1Exit(Sender: TObject);
begin
  if (Trim(Combobox1.Text) = 'CPF') then
  begin
    MaskEdit2.EditMask := '';
    MaskEdit2.Text     := TirarTudo(MaskEdit2.Text, '.', '/', '');
    MaskEdit2.EditMask := '###.###.###-##'
  end;
  if (Trim(Combobox1.Text) = 'CNPJ') then
  begin
    MaskEdit2.EditMask := '';
    MaskEdit2.Text     := TirarTudo(MaskEdit2.Text, '.', '/', '');
    MaskEdit2.EditMask := '##.###.###/####-##'
  end;
end;

procedure TF_Fich.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PFich, F_PFich);
  F_PFich.ShowModal;
  F_PFich.Destroy;
  F_PFich := NIL;
  if (Dm.Fichario.Active) then
  begin
    Carregar(F_Fich, False, False);
    DbGrid1.ShowHint := True;   
  end
  else Carregar(F_Fich, True, False);
end;

procedure TF_Fich.FormDestroy(Sender: TObject);
begin
  Dm.Fichario.Close;
end;

procedure TF_Fich.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_Fich.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_Fich.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Fich.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_Fich.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_Fich.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_Fich.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if (BitBtn1.Enabled) then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

procedure TF_Fich.DBGrid1DblClick(Sender: TObject);
begin
  if (DbGrid1.ShowHint) then Carregar(F_Fich, True, True);
end;

end.
