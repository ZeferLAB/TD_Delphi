unit feriados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, Printers, DBCtrls,
  jpeg;

type
  TF_Feriados = class(TForm)
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
  F_Feriados: TF_Feriados;
  datant : String;

implementation

uses DMTD, Menu, QkFer, PFer, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Feriados.Carregar(Sender : TObject; Pesquisa, Clique : Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.Feriados.Close;
    Dm.Feriados.Sql.Clear;
    Dm.Feriados.Sql.Add('SELECT * FROM feriados');
    Dm.Feriados.Sql.Add('ORDER BY data DESC');
    Dm.Feriados.Open;
  end;
  MaskEdit1.Text      := Dm.Feriados.FieldByName('data').asString;
  MaskEdit2.Text      := Dm.Feriados.FieldByName('descricao').asString;
  if (Clique) then DbGrid1.ShowHint := False;  
end;

Procedure TF_Feriados.Gravar(Sender : TOBject; Modo : Integer);
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - DATA INVÁLIDA !'), 'INCLUSÃO/CORREÇÃO', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  if (modo = 0) then
  begin
    Dm.Feriados.Close;
    Dm.Feriados.Sql.Clear;
    Dm.Feriados.Sql.Add('SELECT * FROM feriados');
    Dm.Feriados.Sql.Add('WHERE');
    Dm.Feriados.Sql.Add('data = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.Feriados.Open;
    if (Dm.Feriados.RecordCount <> 0) then
    begin
      MessageBox(Handle, PChar('ATENÇÃO - FERIADO ENCONTRADO !'), 'INCLUSÃO', MB_OK + MB_ICONWARNING);
      Carregar(F_Feriados, False, False);
      Exit;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Incluso a feriado do dia ' + Trim(MaskEdit1.Text), '0');
    Dm.Feriados.Append;
  end
  else Dm.Feriados.Edit;
  Dm.Feriados.FieldByName('data').asString        := MaskEdit1.Text;
  Dm.Feriados.FieldByName('descricao').asString   := Trim(MaskEdit2.Text);
  Dm.Feriados.Post;
  if (modo = 0) then Carregar(F_Feriados, True, False);  
end;

procedure TF_Feriados.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Feriados.BitBtn1Click(Sender: TObject);
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
    Panel3.Enabled  := True;
    MaskEdit1.Text  := DateToStr(date);
    MaskEdit1.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Confirma Inclusão de Dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      Gravar(F_Feriados, 0);
    end
    else
    begin
      MessageBox(Handle, PChar('Os dados não foram incluídos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da inclusão da Feriado do dia ' + Trim(MaskEdit1.Text), '0');
      Carregar(F_Feriados, False, False);
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

procedure TF_Feriados.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir os dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão da feriado do dia ' + Trim(MaskEdit1.Text), '0');
    Dm.Feriados.Delete;
    Carregar(F_Feriados, False, False);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão do feriado do dia ' + Trim(MaskEdit1.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Feriados.BitBtn3Click(Sender: TObject);
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
    datant := '';
    datant := MaskEdit1.Text;
    MaskEdit1.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma correção dos dados ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_Feriados, 1);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Alterada o feriado do dia ' + datant + ' para o dia ' + Trim(MaskEdit1.Text), '0');
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da alteração do feriado do dia ' + datant + ' para o dia ' + Trim(MaskEdit1.Text), '0');
        Carregar(F_Feriados, False, False);
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

procedure TF_Feriados.BitBtn5Click(Sender: TObject);
begin
  Dm.Feriados.Next;
  Carregar(F_Feriados, False, False);
end;

procedure TF_Feriados.BitBtn6Click(Sender: TObject);
begin
  Dm.Feriados.Prior;
  Carregar(F_Feriados, False, False);
end;

procedure TF_Feriados.BitBtn7Click(Sender: TObject);
begin
  Dm.Feriados.Close;
  Dm.Feriados.Sql.Clear;
  Dm.Feriados.Sql.Add('SELECT * FROM feriados');
  Dm.Feriados.Sql.Add('ORDER BY data DESC');
  Dm.Feriados.Open;
  if (Dm.Feriados.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - NÃO EXISTEM DADOS PARA SEREM IMPRESSOS !'), 'IMPRESSÃO', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TQk_Fer, Qk_Fer);
  Qk_Fer.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_Fer.QrLabel2.Caption := F_Menu.Label11.Caption;
  Qk_Fer.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_Fer.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_Fer.QrLabel5.Caption := 'RELATÓRIO DE FERIADOS';
  Qk_Fer.QuickRep1.Preview;
  Qk_Fer.Destroy;
  Qk_Fer := NIL;
end;

procedure TF_Feriados.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PFer, F_PFer);
  F_PFer.ShowModal;
  F_PFer.Destroy;
  F_PFer := NIL;
  if (Dm.Feriados.Active) then
  begin
    DbGrid1.ShowHint := True;
    Carregar(F_Feriados, False, False);
  end
  else Carregar(F_Feriados, True, False);
end;

procedure TF_Feriados.FormActive(Sender: TObject);
begin
  Carregar(F_Feriados, True, False);
  BitBtn1.SetFocus;
end;

procedure TF_Feriados.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Feriados.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if (BitBtn1.Enabled) then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

procedure TF_Feriados.FormDestroy(Sender: TObject);
begin
  Dm.Feriados.Close;
end;

procedure TF_Feriados.DBGrid1DblClick(Sender: TObject);
begin
  if (DbGrid1.ShowHint) then Carregar(F_Feriados, True, True);
end;

end.
