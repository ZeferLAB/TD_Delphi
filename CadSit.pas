unit CadSit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, Printers, DBCtrls,
  jpeg;

type
  TF_Sit = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActive(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Carregar(Sender : TObject; Pesquisa, Clique : Boolean);
    procedure FormDestroy(Sender: TObject);
    Procedure Gravar(Sender : TOBject; Modo : Integer);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Sit: TF_Sit;
  desant : String;

implementation

uses DMTD, Menu, QkCadSit, PCadSit, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Sit.Carregar(Sender : TObject; Pesquisa, Clique : Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.Cad_Sit.Close;
    Dm.Cad_Sit.Sql.Clear;
    Dm.Cad_Sit.Sql.Add('SELECT * FROM cad_sit');
    Dm.Cad_Sit.Sql.Add('ORDER BY descricao');
    Dm.Cad_Sit.Open;
  end;
  MaskEdit1.Text      := Dm.Cad_Sit.FieldByName('codigo').asString;
  MaskEdit2.Text      := Dm.Cad_Sit.FieldByName('descricao').asString;

  If (Dm.Cad_Sit.FieldByName('tipoDoi').AsString = '2') then
    ComboBox1.Text := 'Alienante'
  Else
  If (Dm.Cad_Sit.FieldByName('tipoDoi').AsString = '3') then
    ComboBox1.Text := 'Adquirente'
  Else
  ComboBox1.Text := '';

  if (Clique) then DbGrid1.ShowHint := False;  
end;

Procedure TF_Sit.Gravar(Sender : TOBject; Modo : Integer);
begin
  if (modo = 0) then
  begin
    Dm.Cad_Sit.Close;
    Dm.Cad_Sit.Sql.Clear;
    Dm.Cad_Sit.Sql.Add('SELECT * FROM cad_sit');
    Dm.Cad_Sit.Sql.Add('WHERE');
    Dm.Cad_Sit.Sql.Add('descricao = ' + Chr(39) + Trim(MaskEdit2.Text) + Chr(39));
    Dm.Cad_Sit.Open;
    if (Dm.Cad_Sit.RecordCount <> 0) then
    begin
      MessageBox(Handle, PChar('ATENÇÃO - SITUAÇÃO ENCONTRADA !'), 'INCLUSÃO', MB_OK + MB_ICONWARNING);
      Carregar(F_Sit, False, False);
      Exit;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Inclusa a situação ' + Trim(MaskEdit2.Text), '0');
    Dm.Cad_Sit.Append;
  end
  else Dm.Cad_Sit.Edit;
  Dm.Cad_Sit.FieldByName('codigo').asString      := Trim(MaskEdit1.Text);
  Dm.Cad_Sit.FieldByName('descricao').asString   := Trim(MaskEdit2.Text);

  If (ComboBox1.Text = 'Alienante') then
    Dm.Cad_Sit.FieldByName('tipoDoi').AsString := '2'
  Else
  If (ComboBox1.Text = 'Adquirente') then
    Dm.Cad_Sit.FieldByName('tipoDoi').AsString := '3'
  Else
  Dm.Cad_Sit.FieldByName('tipoDoi').AsString := '0';


  Dm.Cad_Sit.Post;
  if (modo = 0) then Carregar(F_Sit, True, False);
end;

procedure TF_Sit.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Sit.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption = '&Incluir' then
  begin
    BitBtn1.Caption := '&Salvar';
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    dm.qryGenerico.Close;
    dm.qryGenerico.SQL.Clear;
    dm.qryGenerico.SQL.Add('select max(codigo + 1) as Codigo from cad_sit');
    dm.qryGenerico.Open;
    Panel3.Enabled:= True;
    MaskEdit1.Text:= dm.qryGenerico.FieldByName('Codigo').AsString;
    MaskEdit2.Text:= '';
  end
  else
  begin
    if (MessageBox(Handle, PChar('Confirma inclusão de dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      Gravar(F_Sit, 0);
    end
    else
    begin
      MessageBox(Handle, PChar('Os dados não foram incluídos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da inclusão da situação ' + Trim(MaskEdit2.Text), '0');
      Carregar(F_Sit, False, False);
    end;
    BitBtn1.Caption := '&Incluir';
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := true;
    BitBtn4.Enabled := true;
    BitBtn5.Enabled := true;
    BitBtn6.Enabled := true;
    BitBtn7.Enabled := true;
    BitBtn8.Enabled := true;
    Panel3.Enabled  := False;
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Sit.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir os dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão da situação ' + Trim(MaskEdit2.Text), '0');
    Dm.Cad_Sit.Delete;
    Carregar(F_Sit, False, False);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão da situação ' + Trim(MaskEdit2.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Sit.BitBtn3Click(Sender: TObject);
begin
  if BitBtn3.Caption = '&Correção' then
  begin
    BitBtn3.Caption := '&Salvar';
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := false;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    Panel3.enabled  := true;
    desant := '';
    desant := Trim(MaskEdit2.Text);
    MaskEdit1.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma correção dos dados ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_Sit, 1);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Alterada a situação de ' + desant + ' para ' + Trim(MaskEdit2.Text), '0');
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da alteração da situação ' + desant + ' para ' + Trim(MaskEdit2.Text), '0');
        Carregar(F_Sit, False, False);
      end;
      Panel3.enabled  := False;
      BitBtn3.Caption := '&Correção';
      BitBtn1.Enabled := True;
      BitBtn2.Enabled := True;
      BitBtn4.Enabled := True;
      BitBtn5.Enabled := True;
      BitBtn6.Enabled := True;
      BitBtn7.Enabled := True;
      BitBtn8.Enabled := True;
      BitBtn3.SetFocus;
    end;
  end;
end;

procedure TF_Sit.BitBtn5Click(Sender: TObject);
begin
  Dm.Cad_Sit.Next;
  Carregar(F_Sit, False, False);
end;

procedure TF_Sit.BitBtn6Click(Sender: TObject);
begin
  Dm.Cad_Sit.Prior;
  Carregar(F_Sit, False, False);
end;

procedure TF_Sit.BitBtn7Click(Sender: TObject);
begin
  Dm.Cad_Sit.Close;
  Dm.Cad_Sit.Sql.Clear;
  Dm.Cad_Sit.Sql.Add('SELECT * FROM cad_sit');
  Dm.Cad_Sit.Sql.Add('ORDER BY descricao');
  Dm.Cad_Sit.Open;
  if (Dm.Cad_Sit.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - NÃO EXISTEM DADOS PARA SEREM IMPRESSOS !'), 'IMPRESSÃO', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TQk_CadSit, Qk_CadSit);
  Qk_CadSit.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_CadSit.QrLabel2.Caption := F_Menu.Label11.Caption;
  Qk_CadSit.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_CadSit.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_CadSit.QrLabel5.Caption := 'RELATÓRIO DE SITUAÇÃO DAS PARTES';
  Qk_CadSit.QuickRep1.Preview;
  Qk_CadSit.Destroy;
  Qk_CadSit := NIL;
end;

procedure TF_Sit.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PCadSit, F_PCadSit);
  F_PCadSit.ShowModal;
  F_PCadSit.Destroy;
  F_PCadSit := NIL;
  if (Dm.Cad_Sit.Active) then
  begin
    DbGrid1.ShowHint := True;
    Carregar(F_Sit, False, False);
  end
  else Carregar(F_Sit, True, False);
end;

procedure TF_Sit.FormActive(Sender: TObject);
begin
  Carregar(F_Sit, True, False);
  BitBtn1.SetFocus;
end;

procedure TF_Sit.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Sit.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if (BitBtn1.Enabled) then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

procedure TF_Sit.FormDestroy(Sender: TObject);
begin
  Dm.Cad_Sit.Close;
end;

procedure TF_Sit.DBGrid1DblClick(Sender: TObject);
begin
  if (DbGrid1.ShowHint) then Carregar(F_Sit, True, True);
end;

end.
