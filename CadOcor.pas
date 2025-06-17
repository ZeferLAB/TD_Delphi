unit CadOcor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, Printers, DBCtrls,
  jpeg;

type
  TF_CadOcor = class(TForm)
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
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
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
  F_CadOcor: TF_CadOcor;
  ocoant   : String;

implementation

uses DMTD, Menu, QkCOcor, PCOcor, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_CadOcor.Carregar(Sender : TObject; Pesquisa, Clique : Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.Cad_Ir.Close;
    Dm.Cad_Ir.Sql.Clear;
    Dm.Cad_Ir.Sql.Add('SELECT * FROM cad_ir');
    Dm.Cad_Ir.Sql.Add('ORDER BY codigo');
    Dm.Cad_Ir.Open;
  end;
  MaskEdit1.Text      := Dm.Cad_Ir.FieldByName('codigo').asString;
  MaskEdit2.Text      := Dm.Cad_Ir.FieldByName('motivo').asString;
  MaskEdit3.Text      := Dm.Cad_Ir.FieldByName('codcorreio').asString;
  MaskEdit4.Text      := Dm.Cad_Ir.FieldByName('tipo').asString;
  if (Clique) then DbGrid1.ShowHint := False;  
end;

Procedure TF_CadOcor.Gravar(Sender : TOBject; Modo : Integer);
begin
  if (modo = 0) then
  begin
    Dm.Cad_Ir.Close;
    Dm.Cad_Ir.Sql.Clear;
    Dm.Cad_Ir.Sql.Add('SELECT * FROM cad_ir');
    Dm.Cad_Ir.Sql.Add('WHERE');
    Dm.Cad_Ir.Sql.Add('codigo = ' + MaskEdit1.Text);
    Dm.Cad_Ir.Open;
    if (Dm.Cad_Ir.RecordCount <> 0) then
    begin
      MessageBox(Handle, PChar('ATENÇÃO - CÓDIGO ENCONTRADO !'), 'INCLUSÃO', MB_OK + MB_ICONWARNING);
      Carregar(F_CadOcor, False, False);
      Exit;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Inclusa a ocorrência de notificação ' + Trim(MaskEdit2.Text), '0');
    Dm.Cad_Ir.Append;
  end
  else Dm.Cad_Ir.Edit;
  Dm.Cad_Ir.FieldByName('codigo').asString     := MaskEdit1.Text;
  Dm.Cad_Ir.FieldByName('motivo').asString     := Trim(MaskEdit2.Text);
  if (ValidNumero(MaskEdit3.Text)) then
    Dm.Cad_Ir.FieldByName('codcorreio').asString := Trim(MaskEdit3.Text);
    dm.Cad_Ir.FieldByName('tipo').AsString := trim(maskedit4.Text); 
  Dm.Cad_Ir.Post;
  if (modo = 0) then Carregar(F_CadOcor, True, False);  
end;

procedure TF_CadOcor.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CadOcor.BitBtn1Click(Sender: TObject);
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
    MaskEdit1.Text  := Busca_Codigo('cad_ir', 'codigo');
    MaskEdit2.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Confirma Inclusão de Dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      Gravar(F_CadOcor, 0);
    end
    else
    begin
      MessageBox(Handle, PChar('Os dados não foram incluídos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da inclusão da ocorrência ' + Trim(MaskEdit2.Text), '0');
      Carregar(F_CadOcor, False, False);
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

procedure TF_CadOcor.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir os dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    // Código de Baixa Postiva e Parcial.
    if (StrToInt(MaskEdit1.Text) <> 1)  AND
       (StrToInt(MaskEdit1.Text) <> 2) then
    begin   
      Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão da ocorrência ' + Trim(MaskEdit2.Text), '0');
      Dm.Cad_Ir.Delete;
      Carregar(F_CadOcor, False, False);
    end;  
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão da ocorrência ' + Trim(MaskEdit2.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_CadOcor.BitBtn3Click(Sender: TObject);
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
    ocoant := '';
    ocoant := MaskEdit2.Text;
    MaskEdit2.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma correção dos dados ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_CadOcor, 1);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Alterada a ocorrência ' + ocoant + ' para ' + Trim(MaskEdit2.Text), '0');
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da alteração da ocorrência ' + ocoant + ' para ' + Trim(MaskEdit2.Text), '0');
        Carregar(F_CadOcor, False, False);
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

procedure TF_CadOcor.BitBtn5Click(Sender: TObject);
begin
  Dm.Cad_Ir.Next;
  Carregar(F_CadOcor, False, False);
end;

procedure TF_CadOcor.BitBtn6Click(Sender: TObject);
begin
  Dm.Cad_Ir.Prior;
  Carregar(F_CadOcor, False, False);
end;

procedure TF_CadOcor.BitBtn7Click(Sender: TObject);
begin
  Dm.Cad_Ir.Close;
  Dm.Cad_Ir.Sql.Clear;
  Dm.Cad_Ir.Sql.Add('SELECT * FROM cad_ir');
  Dm.Cad_Ir.Sql.Add('ORDER BY codigo');
  Dm.Cad_Ir.Open;
  if (Dm.Cad_Ir.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - NÃO EXISTEM DADOS PARA SEREM IMPRESSOS !'), 'IMPRESSÃO', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TQk_CadOcor, Qk_CadOcor);
  Qk_CadOcor.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_CadOcor.QrLabel2.Caption := F_Menu.Label11.Caption;
  Qk_CadOcor.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_CadOcor.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_CadOcor.QrLabel5.Caption := 'RELATÓRIO DE OCORRÊNCIAS DE NOTIFICAÇÃO';
  Qk_CadOcor.QuickRep1.Preview;
  Qk_CadOcor.Destroy;
  Qk_CadOcor := NIL;
end;

procedure TF_CadOcor.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PCOcor, F_PCOcor);
  F_PCOcor.ShowModal;
  F_PCOcor.Destroy;
  F_PCOcor := NIL;
  if (Dm.Cad_Ir.Active) then
  begin
    DbGrid1.ShowHint := True;
    Carregar(F_CadOcor, False, False);
  end
  else Carregar(F_CadOcor, True, False);
end;

procedure TF_CadOcor.FormActive(Sender: TObject);
begin
  Carregar(F_CadOcor, True, False);
  BitBtn1.SetFocus;
end;

procedure TF_CadOcor.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_CadOcor.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if (BitBtn1.Enabled) then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

procedure TF_CadOcor.FormDestroy(Sender: TObject);
begin
  Dm.Cad_Ir.Close;
end;

procedure TF_CadOcor.DBGrid1DblClick(Sender: TObject);
begin
  if (DbGrid1.ShowHint) then Carregar(F_CadOcor, True, True);
end;

end.
