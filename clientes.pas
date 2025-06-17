unit clientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Db, Grids, DBGrids, Printers,
  DBCtrls;

type
  TF_Clientes = class(TForm)
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
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Clientes: TF_Clientes;
  natant    : String;

implementation

uses PesqNat, DMTD, Menu, QkNat, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Clientes.Gravar(Sender : TOBject; Modo : Integer);
begin
  if (Modo = 0) then
  begin
    Dm.Clientes.Close;
    Dm.Clientes.Sql.Clear;
    Dm.Clientes.Sql.Add('SELECT * FROM clientes');
    Dm.Clientes.Sql.Add('WHERE');
    Dm.Clientes.Sql.Add('codigo = ' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39));
    Dm.Clientes.Open;
    if (Dm.Clientes.RecordCount <> 0) then
    begin
      MessageBox(Handle, PChar('ATENÇÃO - CLIENTE NÃO ENCONTRADO !'), 'INCLUSÃO', MB_OK + MB_ICONWARNING);
      Carregar(F_Clientes);
      Exit;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Cliente Incluído ' + Trim(MaskEdit2.Text), '0');
    Dm.Clientes.Append;
  end
  else Dm.Clientes.Edit;
  Dm.Clientes.FieldByName('codigo').asInteger       := StrToInt(MaskEdit1.Text);
  Dm.Clientes.FieldByName('cliente').asString       := Trim(MaskEdit2.Text);
  Dm.Clientes.Post;
  //Dm.Clientes.FieldByName('prazo').asInteger     := StrToInt(ComboBox1.Text);
  //Dm.Clientes.FieldByName('uteis').asString      := Trim(ComboBox2.Text);
  //Dm.Clientes.FieldByName('cod_local').asInteger := StrToInt(ComboBox3.Text);
  {if (Dm.Clientes.FieldByName('cod_local').asInteger > 0) then
  begin
    Dm.Clientes.FieldByName('tipo').asString       := 'N';
  end
  else Dm.Clientes.FieldByName('tipo').asString       := 'T';
  if (modo = 0) then Atualizar(F_Clientes, False);}
end;

Procedure TF_Clientes.Atualizar(Sender : TObject; Clique : Boolean);
begin
  Dm.Clientes.Close;
  Dm.Clientes.Sql.Clear;
  Dm.Clientes.Sql.Add('SELECT * FROM clientes');
  Dm.Clientes.Sql.Add('ORDER BY codigo,cliente');
  Dm.Clientes.Open;
  if (Clique) then DbGrid1.ShowHint := False;
  Carregar(F_Clientes);
end;

Procedure TF_Clientes.Carregar(Sender : TObject);
begin
  MaskEdit1.Text := Dm.Clientes.FieldByName('codigo').asString;
  MaskEdit2.Text := Dm.Clientes.FieldByName('cliente').asString;
  //ComboBox1.Text := Dm.Clientes.FieldByName('prazo').asString;
  //ComboBox2.Text := Dm.Clientes.FieldByName('uteis').asString;
  //ComboBox3.Text := StrZero(Dm.Clientes.FieldByName('cod_local').asString, 2);
end;

procedure TF_Clientes.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Clientes.FormActivate(Sender: TObject);
begin
  Atualizar(F_Clientes, False);
  BitBtn1.SetFocus;
end;

procedure TF_Clientes.BitBtn1Click(Sender: TObject);
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
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('select * from clientes order by codigo');
    DM.ArqAux.Open;

    DM.ArqAux.FindLast;
    MaskEdit1.Text  := inttoStr(DM.ArqAux.fieldbyname('codigo').AsInteger + 1);
    maskedit2.setfocus;
  end
  else
  begin
    if BitBtn1.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Inclusão de Dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_Clientes, 0);
      end
      else
      begin
        MessageBox(Handle, PChar('Os dados não foram incluídos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da inclusão da cliente ' + Trim(MaskEdit2.Text), '0');
        Atualizar(F_Clientes, False);
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

procedure TF_Clientes.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir os dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão de Clientes ' + Trim(MaskEdit2.Text), '0');
    Dm.Clientes.Delete;
    Carregar(F_Clientes);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão do Cliente ' + Trim(MaskEdit2.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Clientes.BitBtn3Click(Sender: TObject);
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
    maskedit1.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Correção dos Dados ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_Clientes, 1);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Alterada o cliente de ' + natant + ' para ' + Trim(MaskEdit2.Text), '0');
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da alteração do Cliente ' + natant + ' para ' + Trim(MaskEdit2.Text), '0');
        Atualizar(F_Clientes, False);
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

procedure TF_Clientes.BitBtn5Click(Sender: TObject);
begin
  Dm.Clientes.Next;
  Carregar(F_Clientes);
end;

procedure TF_Clientes.BitBtn6Click(Sender: TObject);
begin
  Dm.Clientes.Prior;
  Carregar(F_Clientes);
end;

procedure TF_Clientes.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PesqNat, F_PesqNat);
  F_PesqNat.ShowModal;
  F_PesqNat.Destroy;
  F_PesqNat := NIL;
  if (Dm.Clientes.Active) then
  begin
    DbGrid1.ShowHint := True;
    Carregar(F_Clientes);
  end
  else Atualizar(F_Clientes, False);
end;

procedure TF_Clientes.FormOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [SSALT]) or (key = Vk_F4) then key:= Vk_Clear;
end;

procedure TF_Clientes.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if BitBtn1.Enabled then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

procedure TF_Clientes.BitBtn7Click(Sender: TObject);
begin
  Dm.Clientes.FindFirst;
  Application.CreateForm(TQk_Nat, Qk_Nat);
  Qk_Nat.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_Nat.QrLabel2.Caption := F_Menu.Label11.Caption; 
  Qk_Nat.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_Nat.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_Nat.QrLabel5.Caption := 'RELATÓRIO DOS CLIENTES';
  Qk_Nat.QuickRep1.Preview;
  Qk_Nat.Destroy;
  Qk_Nat := NIL;
end;

procedure TF_Clientes.FormDestroy(Sender: TObject);
begin
  Dm.Clientes.Close;
end;

procedure TF_Clientes.DBGrid1DblClick(Sender: TObject);
begin
  if (DbGrid1.ShowHint) then Atualizar(F_Clientes, True);
end;

procedure TF_Clientes.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_Clientes.ComboBox1Exit(Sender: TObject);
begin
  //if (not ValidNumero(ComboBox1.Text)) then ComboBox1.Text := '0';
end;

procedure TF_Clientes.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if key = 13 then ComboBox3.SetFocus;
end;

procedure TF_Clientes.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Clientes.ComboBox3Exit(Sender: TObject);
begin
  //if (not ValidNumero(ComboBox3.Text)) then ComboBox3.Text := '00';
end;

end.
