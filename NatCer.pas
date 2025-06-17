unit NatCer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Db, Grids, DBGrids, Printers,
  DBCtrls, jpeg;

type
  TF_NatCer = class(TForm)
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
    Label2: TLabel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    ComboBox2: TComboBox;
    Label5: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Gravar(Sender : TOBject; Modo : Integer);
    Procedure Atualizar(Sender : TOBject; Clique : Boolean);
    Procedure Carregar(Sender : TOBject);    
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_NatCer: TF_NatCer;
  natant    : String;

implementation

uses PNatCer, DMTD, Menu, QkNatCer, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_NatCer.Gravar(Sender : TOBject; Modo : Integer);
begin
  if (Modo = 0) then
  begin
    Dm.NatCer.Close;
    Dm.NatCer.Sql.Clear;
    Dm.NatCer.Sql.Add('SELECT * FROM natcer');
    Dm.NatCer.Sql.Add('WHERE');
    Dm.NatCer.Sql.Add('natureza = ' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39));
    Dm.NatCer.Open;
    if (Dm.NatCer.RecordCount <> 0) then
    begin
      MessageBox(Handle, PChar('ATENÇÃO - NATUREZA ENCONTRADA !'), 'INCLUSÃO', MB_OK + MB_ICONWARNING);
      Carregar(F_NatCer);
      Exit;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Inclusa a natureza ' + Trim(MaskEdit2.Text), '0');
    Dm.NatCer.Append;
  end
  else Dm.NatCer.Edit;
  Dm.NatCer.FieldByName('cod').asInteger     := StrToInt(MaskEdit1.Text);
  Dm.NatCer.FieldByName('natureza').asString := Trim(MaskEdit2.Text);
  Dm.NatCer.FieldByName('prazo').asInteger   := StrToInt(ComboBox1.Text);
  Dm.NatCer.FieldByName('uteis').asString    := Trim(ComboBox2.Text);  
  Dm.NatCer.Post;
  if (modo = 0) then Atualizar(F_NatCer, False);
end;

Procedure TF_NatCer.Atualizar(Sender : TObject; Clique : Boolean);
begin
  Dm.NatCer.Close;
  Dm.NatCer.Sql.Clear;
  Dm.NatCer.Sql.Add('SELECT * FROM natcer');
  Dm.NatCer.Sql.Add('ORDER BY natureza');
  Dm.NatCer.Open;
  if (Clique) then DbGrid1.ShowHint := False;  
  Carregar(F_NatCer);
end;

Procedure TF_NatCer.Carregar(Sender : TObject);
begin
  MaskEdit1.Text := Dm.NatCer.FieldByName('cod').asString;
  MaskEdit2.Text := Dm.NatCer.FieldByName('natureza').asString;
  ComboBox1.Text := Dm.NatCer.FieldByName('prazo').asString;
  ComboBox2.Text := Dm.NatCer.FieldByName('uteis').asString; 
end;

procedure TF_NatCer.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_NatCer.FormActivate(Sender: TObject);
begin
  Atualizar(F_NatCer, False);
  BitBtn1.SetFocus;
end;

procedure TF_NatCer.BitBtn1Click(Sender: TObject);
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
    Panel2.Enabled  := True;
    MaskEdit1.Text  := Busca_Codigo('natcer', 'cod');
    ComboBox1.SetFocus; 
  end
  else
  begin
    if BitBtn1.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Inclusão de Dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_NatCer, 0);
      end
      else
      begin
        MessageBox(Handle, PChar('Os dados não foram incluídos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da inclusão da natureza ' + Trim(MaskEdit2.Text), '0');        
        Atualizar(F_NatCer, False);        
      end;
      Panel2.enabled := false;
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
end;

procedure TF_NatCer.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir os dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão da natureza ' + Trim(MaskEdit2.Text), '0');
    Dm.NatCer.Delete;
    Carregar(F_NatCer);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);  
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão da natureza ' + Trim(MaskEdit2.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_NatCer.BitBtn3Click(Sender: TObject);
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
    Panel2.enabled := true;
    natant := '';
    natant := MaskEdit2.Text;   
    ComboBox1.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Correção dos Dados ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_NatCer, 1);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Alterada a natureza de ' + natant + ' para ' + Trim(MaskEdit2.Text), '0');
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da alteração da natureza ' + natant + ' para ' + Trim(MaskEdit2.Text), '0');
        Atualizar(F_NatCer, False);
      end;
      Panel2.enabled  := False;
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

procedure TF_NatCer.BitBtn5Click(Sender: TObject);
begin
  Dm.NatCer.Next;
  Carregar(F_NatCer);
end;

procedure TF_NatCer.BitBtn6Click(Sender: TObject);
begin
  Dm.NatCer.Prior;
  Carregar(F_NatCer);
end;

procedure TF_NatCer.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PNatCer, F_PNatCer);
  F_PNatCer.ShowModal;
  F_PNatCer.Destroy;
  F_PNatCer := NIL;
  if (Dm.NatCer.Active) then
  begin
    DbGrid1.ShowHint := True;
    Carregar(F_NatCer);
  end
  else Atualizar(F_NatCer, False);
end;

procedure TF_NatCer.FormOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [SSALT]) or (key = Vk_F4) then key:= Vk_Clear;
end;

procedure TF_NatCer.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if BitBtn1.Enabled then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

procedure TF_NatCer.BitBtn7Click(Sender: TObject);
begin
  Dm.NatCer.FindFirst;
  Application.CreateForm(TQk_NatCer, Qk_NatCer);
  Qk_NatCer.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_NatCer.QrLabel2.Caption := F_Menu.Label11.Caption;
  Qk_NatCer.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_NatCer.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_NatCer.QrLabel5.Caption := 'RELATÓRIO DAS NATUREZAS';
  Qk_NatCer.QuickRep1.Preview;
  Qk_NatCer.Destroy;
  Qk_NatCer := NIL;
end;

procedure TF_NatCer.FormDestroy(Sender: TObject);
begin
  Dm.NatCer.Close;
end;

procedure TF_NatCer.DBGrid1DblClick(Sender: TObject);
begin
  if (DbGrid1.ShowHint) then Atualizar(F_NatCer, True);
end;

procedure TF_NatCer.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_NatCer.ComboBox1Exit(Sender: TObject);
begin
  if (not ValidNumero(ComboBox1.Text)) then ComboBox1.Text := '0';
end;

procedure TF_NatCer.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

end.
