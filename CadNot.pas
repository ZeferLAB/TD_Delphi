unit CadNot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, Printers, DBCtrls,
  WPDefs, WPPrint, WpWinCtr, WPRich, jpeg;

type
  TF_CadNot = class(TForm)
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
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActive(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Gravar_Dados(Sender : TOBject);
    Procedure Carregar(Sender : TOBject; Pesquisa : Boolean);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadNot: TF_CadNot;

implementation

uses PCadNot, Menu, ImpOFN, DMTD, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_CadNot.Gravar_Dados(Sender : TOBject);
begin
  Dm.Notifica.FieldByName('pauxiliar1').asString   := Trim(MaskEdit1.Text);
  Dm.Notifica.FieldByName('protocolo1').asString   := Trim(MaskEdit2.Text);
  Dm.Notifica.FieldByName('pauxiliar2').asString   := Trim(MaskEdit3.Text);
  Dm.Notifica.FieldByName('protocolo2').asString   := Trim(MaskEdit4.Text);
  Dm.Notifica.FieldByName('reg_cart').asString     := Trim(MaskEdit5.Text);
  Dm.Notifica.FieldByName('nom_cart').asString     := Trim(MaskEdit6.Text);
  Dm.Notifica.FieldByName('end_cart').asString     := Trim(MaskEdit7.Text);
  Dm.Notifica.FieldByName('n_oficio').asString     := Trim(MaskEdit8.Text);
  if ValidData(MaskEdit9.Text)  then Dm.Notifica.FieldByName('data_of').asDateTime    := StrToDate(MaskEdit9.Text);
  if ValidData(MaskEdit11.Text) then Dm.Notifica.FieldByName('data_post').asDateTime  := StrToDate(MaskEdit11.Text);
  Dm.Notifica.FieldByName('ac_nome').asString      := Trim(MaskEdit10.Text);    
end;

Procedure TF_CadNot.Carregar(Sender : TOBject; Pesquisa : Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.Notifica.Close;
    Dm.Notifica.Sql.Clear;
    Dm.Notifica.Sql.Add('SELECT * FROM notifica');
    Dm.Notifica.Sql.Add('ORDER BY pauxiliar1');
    Dm.Notifica.Open;
    DbGrid1.ShowHint := False;
  end;
  MaskEdit1.Text  := Dm.Notifica.FieldByName('pauxiliar1').asString;
  MaskEdit2.Text  := Dm.Notifica.FieldByName('protocolo1').asString;
  MaskEdit3.Text  := Dm.Notifica.FieldByName('pauxiliar2').asString;
  MaskEdit4.Text  := Dm.Notifica.FieldByName('protocolo2').asString;
  MaskEdit5.Text  := Dm.Notifica.FieldByName('reg_cart').asString;
  MaskEdit6.Text  := Dm.Notifica.FieldByName('nom_cart').asString;
  MaskEdit7.Text  := Dm.Notifica.FieldByName('end_cart').asString;
  MaskEdit8.Text  := Dm.Notifica.FieldByName('n_oficio').asString;
  MaskEdit9.Text  := Dm.Notifica.FieldByName('data_of').asString;
  MaskEdit11.Text := Dm.Notifica.FieldByName('data_post').asString;
  MaskEdit10.Text := Dm.Notifica.FieldByName('ac_nome').asString;
end;

procedure TF_CadNot.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CadNot.BitBtn1Click(Sender: TObject);
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
    MaskEdit1.SetFocus;
  end
  else
  begin
    if BitBtn1.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma inclusão dos dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Dm.Notifica.Append;
        Gravar_Dados(F_CadNot);
        Dm.Notifica.Post;
      end
      else MessageBox(Handle, PChar('Os dados não foram incluídos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
      Carregar(F_CadNot, True);
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
end;

procedure TF_CadNot.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir os dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão da notificação de outra comarca(protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ')', '0');
    Dm.Notifica.Delete;
    Carregar(F_CadNot, False);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);  
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão da notificação de outra comarca(protocolo auxiliar nº ' + Trim(MaskEdit1.Text) + ')', '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_CadNot.BitBtn3Click(Sender: TObject);
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
    Panel3.Enabled  := True;
    MaskEdit1.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma correção dos dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Dm.Notifica.Edit;
        Gravar_Dados(F_CadNot);
        Dm.Notifica.Post;
      end
      else MessageBox(Handle, PChar('Os dados não foram corrigidos'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
      Carregar(F_CadNot, False);      
      BitBtn3.Caption := '&Correção';
      BitBtn1.Enabled := True;
      BitBtn2.Enabled := True;
      BitBtn4.Enabled := True;
      BitBtn5.Enabled := True;
      BitBtn6.Enabled := True;
      BitBtn7.Enabled := True;
      BitBtn8.Enabled := True;
      Panel3.Enabled  := False;      
      BitBtn3.SetFocus;
    end;
  end;  
end;

procedure TF_CadNot.BitBtn5Click(Sender: TObject);
begin
  Dm.Notifica.Next;
  Carregar(F_CadNot, False);
end;

procedure TF_CadNot.BitBtn6Click(Sender: TObject);
begin
  Dm.Notifica.Prior;
  Carregar(F_CadNot, False);
end;

procedure TF_CadNot.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PCadNot, F_PCadNot);
  F_PCadNot.ShowModal;
  F_PCadNot.Destroy;
  F_PCadNot := NIL;
  if (Dm.Notifica.Active) then
  begin
    DbGrid1.ShowHint := True;
    Carregar(F_CadNot, False);
  end
  else Carregar(F_CadNot, True);
end;

procedure TF_CadNot.FormActive(Sender: TObject);
begin
  Carregar(F_CadNot, True);
  BitBtn1.SetFocus;
end;

procedure TF_CadNot.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If (Shift = [SSALT]) or (key = Vk_F4) then key:= Vk_Clear; 
end;

procedure TF_CadNot.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
   begin
     if (BitBtn1.Enabled = true) AND (BitBtn1.Caption = '&Salvar') THEN BitBtn1.SetFocus;
     if (BitBtn3.Enabled = true) AND (BitBtn3.Caption = '&Salvar') THEN BitBtn3.SetFocus;
   end;
end;

procedure TF_CadNot.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_CadNot.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_CadNot.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_CadNot.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_CadNot.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_CadNot.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_CadNot.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_CadNot.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit9.SetFocus;
end;

procedure TF_CadNot.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit11.SetFocus;
end;

procedure TF_CadNot.MaskEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_CadNot.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if BitBtn1.Enabled then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

procedure TF_CadNot.BitBtn7Click(Sender: TObject);
begin
  if (not ValidData(MaskEdit9.Text)) then
  begin
    ShowMessage('Data do Ofício Inválida !');
  end;
  Application.CreateForm(TF_ImpOFN, F_ImpOFN);
  F_ImpOFN.ShowModal;
  F_ImpOFN.Destroy;
  F_ImpOFN := NIL;
end;

procedure TF_CadNot.DBGrid1DblClick(Sender: TObject);
begin
  if (DbGrid1.ShowHint) then Carregar(F_CadNot, True);
end;

end.
