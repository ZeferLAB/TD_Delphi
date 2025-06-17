unit local;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, Printers, DBCtrls,
  ToolEdit, CurrEdit;

type
  TF_Local = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    CurrencyEdit1: TCurrencyEdit;
    procedure BitBtn8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBedit3onkeydown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Gravar(Sender : TOBject; Modo : Integer);
    Procedure Atualizar(Sender : TOBject; Clique : Boolean);
    Procedure Carregar(Sender : TOBject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Local  : TF_Local;
  locant   : String;
  valant   : Currency;

implementation

uses DMTD, Menu, PesqLoc, QkLoc, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Local.Gravar(Sender : TOBject; Modo : Integer);
begin
  if (Modo = 0) then
  begin
    Dm.Local.Close;
    Dm.Local.Sql.Clear;
    Dm.Local.Sql.Add('SELECT * FROM local');
    Dm.Local.Sql.Add('WHERE');
    Dm.Local.Sql.Add('local = ' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39));
    Dm.Local.Open;
    if (Dm.Local.RecordCount <> 0) then
    begin
      MessageBox(Handle, PChar('ATENÇÃO - LOCALIDADE ENCONTRADA !'), 'INCLUSÃO', MB_OK + MB_ICONWARNING);
      Carregar(F_Local);
      Exit;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Inclusa a localidade ' + Trim(MaskEdit2.Text) + ' no valor de R$ ' + Trim(StrCurr(CurrencyEdit1.Value, 14, True)), '0');
    Dm.Local.Append;
  end
  else Dm.Local.Edit;
  Dm.Local.FieldByName('cod').asInteger     := StrToInt(MaskEdit1.Text);
  Dm.Local.FieldByName('local').asString    := Trim(MaskEdit2.Text);
  Dm.Local.FieldByName('valor').asCurrency  := CurrencyEdit1.Value;
  Dm.Local.Post;
  if (modo = 0) then Atualizar(F_Local, False);
end;

Procedure TF_Local.Atualizar(Sender : TObject; Clique : Boolean);
begin
  Dm.Local.Close;
  Dm.Local.Sql.Clear;
  Dm.Local.Sql.Add('SELECT * FROM local');
  Dm.Local.Sql.Add('ORDER BY local');
  Dm.Local.Open;
  if (Clique) then DbGrid1.ShowHint := False;  
  Carregar(F_Local);
end;

Procedure TF_Local.Carregar(Sender : TObject);
begin
  MaskEdit1.Text      := Dm.Local.FieldByName('cod').asString;
  MaskEdit2.Text      := Dm.Local.FieldByName('local').asString;
  CurrencyEdit1.Value := Dm.Local.FieldByName('valor').asCurrency;
end;

procedure TF_Local.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Local.FormActivate(Sender: TObject);
begin
  Atualizar(F_Local, False);
  BitBtn1.SetFocus;
end;

procedure TF_Local.BitBtn1Click(Sender: TObject);
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
    MaskEdit1.Text  := Busca_Codigo('local', 'cod');
    MaskEdit2.SetFocus; 
  end
  else
  begin
    if BitBtn1.Caption = '&Salvar' then
    begin
      if MessageDlg('Confirma Inclusão de Dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Gravar(F_Local, 0);
      end
      else
      begin
        MessageBox(Handle, PChar('Os dados não foram incluídos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da inclusão da localidade ' + Trim(MaskEdit2.Text), '0');        
        Atualizar(F_Local, False);        
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


procedure TF_Local.BitBtn5Click(Sender: TObject);
begin
  Dm.Local.Next;
  Carregar(F_Local);
end;

procedure TF_Local.BitBtn6Click(Sender: TObject);
begin
  Dm.Local.Prior;
  Carregar(F_Local);
end;

procedure TF_Local.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir os dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão da localidade ' + Trim(MaskEdit2.Text), '0');  
    Dm.Local.Delete;
    Carregar(F_Local);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);  
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão da localidade ' + Trim(MaskEdit2.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Local.BitBtn3Click(Sender: TObject);
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
    locant := '';
    valant := 0.00;
    locant := MaskEdit2.Text;
    valant := CurrencyEdit1.Value;   
    MaskEdit2.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if MessageDlg('Confirma Correção dos Dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Gravar(F_Local, 1);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Alterada a localidade de ' + locant + ' com o valor de R$ ' + Trim(StrCurr(valant, 14, True)) + ' para ' + Trim(MaskEdit2.Text) + ' com o valor de R$ ' + Trim(StrCurr(CurrencyEdit1.Value, 14, True)), '0');
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da alteração da localidade ' + locant + ' com o valor de R$ ' + Trim(StrCurr(valant, 14, True)) + ' para ' + Trim(MaskEdit2.Text) + ' com o valor de R$ ' + Trim(StrCurr(CurrencyEdit1.Value, 14, True)), '0');
        Atualizar(F_Local, False);
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

procedure TF_Local.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PesqLoc, F_PesqLoc);
  F_PesqLoc.ShowModal;
  F_PesqLoc.Destroy;
  F_PesqLoc := NIL;
  if (Dm.Local.Active) then
  begin
    DbGrid1.ShowHint := True;
    Carregar(F_Local);
  end
  else Atualizar(F_Local, False);
end;

procedure TF_Local.BitBtn7Click(Sender: TObject);
begin
  Dm.Local.FindFirst;
  Application.CreateForm(TQk_Loc, Qk_Loc);
  Qk_Loc.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_Loc.QrLabel2.Caption := F_Menu.Label11.Caption;
  Qk_Loc.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_Loc.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_Loc.QrLabel5.Caption := 'RELATÓRIO DAS LOCALIDADES';
  Qk_Loc.QuickRep1.Preview;
  Qk_Loc.Destroy;
  Qk_Loc := NIL;
end;  


procedure TF_Local.DBedit3onkeydown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = 13 then
   begin
     if (BitBtn1.Enabled = true) and (BitBtn1.Caption = '&Salvar') then BitBtn1.SetFocus
     else if (BitBtn3.Enabled = true) and (BitBtn3.Caption = '&Salvar') then BitBtn3.SetFocus;
   end;
end;

procedure TF_Local.FormOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [SSALT]) or (key = Vk_F4) then key:= Vk_Clear;
end;

procedure TF_Local.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_Local.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if BitBtn1.Enabled then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

procedure TF_Local.FormDestroy(Sender: TObject);
begin
  Dm.Local.Close;
end;

procedure TF_Local.DBGrid1DblClick(Sender: TObject);
begin
  if (DbGrid1.ShowHint) then Atualizar(F_Local, True);
end;

end.
