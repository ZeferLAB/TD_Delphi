unit Cod_cus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, CurrEdit, Grids, DBGrids,
  jpeg;

type
  TF_Cod_cus = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Bevel2: TBevel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Bevel3: TBevel;
    DBGrid1: TDBGrid;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit9: TCurrencyEdit;
    CurrencyEdit10: TCurrencyEdit;
    CurrencyEdit11: TCurrencyEdit;
    CurrencyEdit12: TCurrencyEdit;
    CurrencyEdit13: TCurrencyEdit;
    MaskEdit2: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure Atualizar(Sender : TObject);
    Procedure Carregar(Sender : TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cod_cus: TF_Cod_cus;

implementation

uses DMTD;

{$R *.DFM}
Procedure TF_Cod_cus.Atualizar(Sender : TObject);
begin
  DM.Cad_icus.Close;
  DM.Cad_icus.Sql.Clear;
  DM.Cad_icus.Sql.Add('SELECT * FROM cad_icus');
  DM.Cad_icus.Open;
  DM.Cad_icus.FindLast;
  Carregar(F_Cod_cus);
end;

Procedure TF_Cod_cus.Carregar(Sender : TObject);
begin
  MaskEdit1.Text       := DM.Cad_icus.FieldByName('codigo').AsString;
  MaskEdit2.Text       := DM.Cad_icus.FieldByName('ato').AsString;
  CurrencyEdit1.Value  := DM.Cad_icus.FieldByName('v_microf17').asCurrency;
  CurrencyEdit2.Value  := DM.Cad_icus.FieldByName('v_tab104').AsCurrency;
  CurrencyEdit3.Value  := DM.Cad_icus.FieldByName('v_adv101').AsCurrency;
  CurrencyEdit4.Value  := DM.Cad_icus.FieldByName('v_desarq14').AsCurrency;
  CurrencyEdit5.Value  := DM.Cad_icus.FieldByName('v_busca11').AsCurrency;
  CurrencyEdit6.Value  := DM.Cad_icus.FieldByName('v_conf15').AsCurrency;
  CurrencyEdit7.Value  := DM.Cad_icus.FieldByName('v_reg101').AsCurrency;
  CurrencyEdit8.Value  := DM.Cad_icus.FieldByName('v_inform19').AsCurrency;
  CurrencyEdit9.Value  := DM.Cad_icus.FieldByName('v_dilig107').AsCurrency;
  CurrencyEdit10.Value := DM.Cad_icus.FieldByName('v_certidao14').AsCurrency;
  CurrencyEdit11.Value := DM.Cad_icus.FieldByName('v_gic19').AsCurrency;
  CurrencyEdit12.Value := DM.Cad_icus.FieldByName('v_gic15').AsCurrency;
  CurrencyEdit13.Value := DM.Cad_icus.FieldByName('v_gic16').AsCurrency;
end;

procedure TF_Cod_cus.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Cod_cus.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption = '&Incluir' then
  begin
    BitBtn2.Enabled := False;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := False;
    BitBtn6.Enabled := False;
    Panel1.Enabled  := True;
    BitBtn1.Caption := '&Gravar';
    MaskEdit1.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Gravar Dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      DM.Cad_icus.Close;
      DM.Cad_icus.Sql.Clear;
      DM.Cad_icus.Sql.Add('SELECT * FROM cad_icus');
      DM.Cad_icus.Sql.Add('WHERE');
      DM.Cad_icus.Sql.Add('1 = 2');
      DM.Cad_icus.Open;
      DM.Cad_icus.Append;
      DM.Cad_icus.FieldByName('codigo').AsString          := MaskEdit1.Text;
      DM.Cad_icus.FieldByName('ato').AsString             := MaskEdit2.Text;
      DM.Cad_icus.FieldByName('v_microf17').asCurrency    := CurrencyEdit1.Value;
      DM.Cad_icus.FieldByName('v_tab104').AsCurrency      := CurrencyEdit2.Value;
      DM.Cad_icus.FieldByName('v_adv101').AsCurrency      := CurrencyEdit3.Value;
      DM.Cad_icus.FieldByName('v_desarq14').AsCurrency    := CurrencyEdit4.Value;
      DM.Cad_icus.FieldByName('v_busca11').AsCurrency     := CurrencyEdit5.Value;
      DM.Cad_icus.FieldByName('v_conf15').AsCurrency      := CurrencyEdit6.Value;
      DM.Cad_icus.FieldByName('v_reg101').AsCurrency      := CurrencyEdit7.Value;
      DM.Cad_icus.FieldByName('v_inform19').AsCurrency    := CurrencyEdit8.Value;
      DM.Cad_icus.FieldByName('v_dilig107').AsCurrency    := CurrencyEdit9.Value;
      DM.Cad_icus.FieldByName('v_certidao14').AsCurrency  := CurrencyEdit10.Value;
      DM.Cad_icus.FieldByName('v_gic19').AsCurrency       := CurrencyEdit11.Value;
      DM.Cad_icus.FieldByName('v_gic15').AsCurrency       := CurrencyEdit12.Value;
      DM.Cad_icus.FieldByName('v_gic16').AsCurrency       := CurrencyEdit13.Value;
      DM.Cad_icus.Post;
      DM.Cad_icus.Close;
    end;
    Atualizar(F_Cod_cus);
    BitBtn2.Enabled := True;
    BitBtn3.Enabled := True;
    BitBtn4.Enabled := True;
    BitBtn5.Enabled := True;
    BitBtn6.Enabled := True;
    Panel1.Enabled  := False;
    BitBtn1.Caption := '&Incluir';
    BitBtn1.SetFocus;
  end;

end;

procedure TF_Cod_cus.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Cod_cus.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit2.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit3.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit4.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit5.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit6.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit7.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit8.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit9.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit10.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit11.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit12.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit13.SetFocus;
end;

procedure TF_Cod_cus.CurrencyEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if BitBtn1.Enabled then BitBtn1.SetFocus else BitBtn2.SetFocus;
end;

procedure TF_Cod_cus.BitBtn2Click(Sender: TObject);
begin
  if BitBtn2.Caption = '&Corrigir' then
  begin
    BitBtn1.Enabled := False;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := False;
    BitBtn6.Enabled := False;
    Panel1.Enabled  := True;
    BitBtn2.Caption := '&Gravar';
    MaskEdit1.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Gravar correção ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      Dm.Cad_iCus.Edit;
      DM.Cad_icus.FieldByName('codigo').AsString          := MaskEdit1.Text;
      DM.Cad_icus.FieldByName('ato').AsString             := MaskEdit2.Text;
      DM.Cad_icus.FieldByName('v_microf17').asCurrency    := CurrencyEdit1.Value;
      DM.Cad_icus.FieldByName('v_tab104').AsCurrency      := CurrencyEdit2.Value;
      DM.Cad_icus.FieldByName('v_adv101').AsCurrency      := CurrencyEdit3.Value;
      DM.Cad_icus.FieldByName('v_desarq14').AsCurrency    := CurrencyEdit4.Value;
      DM.Cad_icus.FieldByName('v_busca11').AsCurrency     := CurrencyEdit5.Value;
      DM.Cad_icus.FieldByName('v_conf15').AsCurrency      := CurrencyEdit6.Value;
      DM.Cad_icus.FieldByName('v_reg101').AsCurrency      := CurrencyEdit7.Value;
      DM.Cad_icus.FieldByName('v_inform19').AsCurrency    := CurrencyEdit8.Value;
      DM.Cad_icus.FieldByName('v_dilig107').AsCurrency    := CurrencyEdit9.Value;
      DM.Cad_icus.FieldByName('v_certidao14').AsCurrency  := CurrencyEdit10.Value;
      DM.Cad_icus.FieldByName('v_gic19').AsCurrency       := CurrencyEdit11.Value;
      DM.Cad_icus.FieldByName('v_gic15').AsCurrency       := CurrencyEdit12.Value;
      DM.Cad_icus.FieldByName('v_gic16').AsCurrency       := CurrencyEdit13.Value;
      Dm.Cad_iCus.Post;
    end;
    BitBtn1.Enabled := True;
    BitBtn3.Enabled := True;
    BitBtn4.Enabled := True;
    BitBtn5.Enabled := True;
    BitBtn6.Enabled := True;
    Panel1.Enabled  := False;
    BitBtn2.Caption := '&Corrigir';
    BitBtn2.SetFocus;
  end;
end;

procedure TF_Cod_cus.BitBtn3Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir todos os lançamentos deste codigo ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    DM.Cad_icus.Close;
    Dm.Cad_icus.Sql.Clear;
    Dm.Cad_icus.Sql.Add('DELETE FROM cad_icus');
    Dm.Cad_icus.Sql.Add('WHERE');
    Dm.Cad_icus.Sql.Add('codigo = ' + Chr(39) + MaskEdit1.Text + Chr(39));
    Dm.Cad_icus.ExecSql;
    Atualizar(F_Cod_cus);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Cod_cus.BitBtn5Click(Sender: TObject);
begin
  DM.Cad_icus.Next;
  Carregar(F_Cod_cus);
end;

procedure TF_Cod_cus.BitBtn4Click(Sender: TObject);
begin
  DM.Cad_icus.Prior;
  Carregar(F_Cod_cus);
end;

procedure TF_Cod_cus.FormActivate(Sender: TObject);
begin
  Atualizar(F_Cod_cus);
end;

end.
