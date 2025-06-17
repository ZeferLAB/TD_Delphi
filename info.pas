unit info;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, Grids, DBGrids, Menus, jpeg;

type
  TF_Info = class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    PopupMenu1: TPopupMenu;
    AndamentoNotificao1: TMenuItem;
    Label26: TLabel;
    Label27: TLabel;
    VisualizarExignciaF41: TMenuItem;
    Label28: TLabel;
    Label29: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    MaskEdit2: TMaskEdit;
    RadioGroup1: TRadioGroup;
    BitBtn3: TBitBtn;
    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    Procedure Limpa_Tela(Sender : TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AndamentoNotificao1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VisualizarExignciaF41Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Info: TF_Info;

implementation

Uses DMTD, Menu, AndaNot, AndaNotB, VerExige, FuncGeral, Anotacao;

{$R *.DFM}

Procedure TF_Info.Limpa_Tela(Sender : TObject);
begin
  Label4.Visible  := False;
  Label5.Visible  := False;
  Label6.Visible  := False;
  Label7.Visible  := False;
  Label9.Visible  := False;
  Label11.Visible := False;
  Label13.Visible := False;
  Label15.Visible := False;
  Label16.Visible := False;
  Label17.Visible := False;
  Label19.Visible := False;
  Label21.Visible := False;
  Label23.Visible := False;
  BitBtn3.Enabled := False;
  
  Label4.Caption   := '';
  Label5.Caption   := '';
  Label6.Caption   := '';
  Label7.Caption   := '';
  Label9.Caption   := '';
  Label11.Caption  := '';
  Label13.Caption  := '';
  Label15.Caption  := '';
  Label16.Caption  := '';
  Label17.Caption  := '';
  Label19.Caption  := '';
  Label21.Caption  := '';
  Label23.Caption  := ''; 
end;

procedure TF_Info.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Info.BitBtn2Click(Sender: TObject);
begin
  Limpa_Tela(F_Info);
  Dm.HisTd.Close;
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  MaskEdit1.SetFocus;
end;

procedure TF_Info.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
    if (ValidNumero(MaskEdit1.Text)) then
      Button1Click(F_Info);
end;

procedure TF_Info.FormDestroy(Sender: TObject);
begin
  Dm.HisTd.Close;
end;

procedure TF_Info.Button1Click(Sender: TObject);
var
  vrsaldo : Currency;
begin
  if (RadioGroup1.ItemIndex = -1) then
  begin
    ShowMessage('Favor selecionar uma opção de pesquisa !');
    MaskEdit1.SetFocus;
    Exit;
  end;

  if (MaskEdit1.Text = '') or (MaskEdit1.Text = '0') then
  begin
    ShowMessage('Numeração inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;                         

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT p_auxiliar,protocolo, registro, deposito, custas, natureza,');
  Dm.ArqAux.Sql.Add('data_r, data_p, data_d, data_i, status, a_nome, data_entr,');
  Dm.ArqAux.Sql.Add('anotacao, cartorio');
  Dm.ArqAux.Sql.Add('FROM td where ');
  if RadioGroup1.ItemIndex = 0 then Dm.ArqAux.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
  if RadioGroup1.ItemIndex = 1 then Dm.ArqAux.Sql.Add('registro   = ' + Trim(MaskEdit1.Text));
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    if RadioGroup1.ItemIndex = 0 then ShowMessage('Protocolo não encontrado !');
    if RadioGroup1.ItemIndex = 1 then ShowMessage('Registro não encontrado !');
    Exit;
  end;
  Label25.Caption := Dm.ArqAux.FieldByName('p_auxiliar').asString;
  Label26.Caption := Dm.ArqAux.FieldByName('registro').asString;
  Label4.Caption  := Dm.ArqAux.FieldByName('data_r').asString;
  Label5.Caption  := '';
  Label9.Caption  := Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False);
  Label27.Caption := Dm.ArqAux.FieldByName('natureza').asString;
  Label11.Caption := 'R$ ' + StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True);
  Label13.Caption := 'R$ ' + StrCurr(Dm.ArqAux.FieldByName('custas').asCurrency, 14, True);

  if (Trim(Dm.ArqAux.FieldByName('status').asString) = 'IRREGULAR')           OR
     (Copy(Dm.ArqAux.FieldByName('status').asString, 1, 11) = 'DEVOLVIDO I')  OR
     (Trim(Dm.ArqAux.FieldByName('status').asString) = 'CANCELADO')           OR
     (Copy(Dm.ArqAux.FieldByName('status').asString, 1, 11) = 'DEVOLVIDO C')  OR
     (Trim(Dm.ArqAux.FieldByName('status').asString) = 'EXAME')               OR
     (Trim(Dm.ArqAux.FieldByName('status').asString) = 'RECEPCAO')            then
  begin
    Label15.Caption     := 'DEVOLVER';
    Label16.Caption     := StrCurr(Dm.ArqAux.fieldbyname('deposito').ascurrency, 14, True);
  end;
  if (Trim(Dm.ArqAux.FieldByName('status').asString) = 'PRONTO')             OR
     (Copy(Dm.ArqAux.FieldByName('status').asString, 1, 11) = 'DEVOLVIDO P') OR
     (Copy(Dm.ArqAux.FieldByName('status').asString, 1, 11) = 'DEVOLVIDO R') then
  begin
    if (Dm.ArqAux.FieldByName('custas').asCurrency > Dm.ArqAux.FieldByName('deposito').asCurrency) then
    begin
      Label15.Caption     := 'RECEBER';
      Label16.Caption     := StrCurr((Dm.ArqAux.fieldbyname('custas').ascurrency - Dm.ArqAux.fieldbyname('deposito').ascurrency), 14, True);
    end
    else
    begin
      if (Dm.ArqAux.FieldByName('custas').asCurrency < Dm.ArqAux.FieldByName('deposito').asCurrency) then
      begin
        Label15.Caption     := 'DEVOLVER';
        Label16.Caption     := StrCurr((Dm.ArqAux.fieldbyname('deposito').ascurrency - Dm.ArqAux.fieldbyname('custas').ascurrency), 14, True);
      end
      else
      begin
        Label15.Caption     := 'SEM DIFERENÇA';
        Label16.Caption     := '0.00';
      end;
    end;
  end;

  if (Dm.ArqAux.FieldByName('status').asString = 'PRONTO')    then
    Label6.Caption  := 'REGISTRADO EM  ' + Dm.ArqAux.FieldByName('data_p').asString;
  Label5.Caption  := Dm.ArqAux.FieldByName('registro').asString;
  if (Dm.ArqAux.FieldByName('data_p').asDateTime > 0) then Label5.Caption := Label5.Caption + ' EM ' + Dm.ArqAux.FieldByName('data_p').asString;
  if (Dm.ArqAux.FieldByName('status').asString = 'EXAME')     OR
     (Dm.ArqAux.FieldByName('status').asString = 'RECEPCAO')  then Label6.Caption  := 'EM ABERTO';
  if (Dm.ArqAux.FieldByName('status').asString = 'IRREGULAR')  then Label6.Caption  := 'IRREGULAR EM  ' + Dm.ArqAux.FieldByName('data_i').asString;
  if (Copy(Dm.ArqAux.FieldByName('status').asString, 1, 11) = 'DEVOLVIDO R') then Label6.Caption  := 'RETIRADO REGISTRADO EM ' + Dm.ArqAux.FieldByName('data_d').asString;
  if (Copy(Dm.ArqAux.FieldByName('status').asString, 1, 11) = 'DEVOLVIDO I') then Label6.Caption  := 'RETIRADO IRREGULAR EM ' + Dm.ArqAux.FieldByName('data_d').asString;
  if (Copy(Dm.ArqAux.FieldByName('status').asString, 1, 11) = 'DEVOLVIDO D') then Label6.Caption  := 'RETIRADO EM DÚVIDA EM ' + Dm.ArqAux.FieldByName('data_d').asString;
  if (Copy(Dm.ArqAux.FieldByName('status').asString, 1, 11) = 'DEVOLVIDO C') then Label6.Caption  := 'RETIRADO CANCELADO EM ' + Dm.ArqAux.FieldByName('data_d').asString;
  Label19.Caption := Dm.ArqAux.FieldByName('a_nome').asString;
  Label23.Caption := Dm.ArqAux.FieldByName('data_entr').asString;
  frmAnotacao.RichEdit1.Text := Dm.ArqAux.FieldByName('anotacao').asString;
  Label21.Caption := Dm.ArqAux.FieldByName('anotacao').asString;
  Label29.Caption := dm.ArqAux.FieldByName('cartorio').AsString;
  Label4.Visible   := True;
  Label5.Visible   := True;
  Label6.Visible   := True;
  Label7.Visible   := True;
  Label9.Visible   := True;
  Label11.Visible  := True;
  Label13.Visible  := True;
  Label15.Visible  := True;
  Label16.Visible  := True;
  Label17.Visible  := True;
  Label19.Visible  := True;
  Label23.Visible  := True;
  //Label21.Visible  := True;
  BitBtn3.Enabled  := True;
  Dm.ArqAux.Close;
  //Buscando reg_his
  Dm.HisTd.Close;
  Dm.HisTd.Sql.Clear;
  Dm.HisTd.Sql.Add('SELECT protocolo, data, hora, usuario, historico FROM histd ');
  Dm.HisTd.Sql.Add('where protocolo = ' + Label25.Caption);
  Dm.HisTd.Sql.Add(' union ');
  Dm.HisTd.Sql.Add('SELECT protocolo, data, hora, usuario, operacao FROM log_dig ');
  Dm.HisTd.Sql.Add('where protocolo = ' + Label25.Caption);
  Dm.HisTd.Sql.Add('ORDER BY protocolo, data, hora');
  Dm.HisTd.Open;
  F_Info.Label7.Caption := Dm.HisTd.FieldByName('usuario').asString;
  if (Dm.HisTd.FieldByName('data').asDateTime > 0) then F_Info.Label17.Caption := Dm.HisTd.FieldByName('data').asString + ' - ' + Dm.HisTd.FieldByName('hora').asString else F_Info.Label17.Caption := '';
  DbGrid1.SetFocus;
end;

procedure TF_Info.FormActivate(Sender: TObject);
begin
  if (Label14.Caption = 'remoto') then
  begin
    Button1Click(F_Info);
  end
  else MaskEdit1.SetFocus;
end;

procedure TF_Info.MaskEdit1Exit(Sender: TObject);
begin
  if (Trim(MaskEdit1.Text) = '0') then
    MaskEdit1.Text := '';
end;

procedure TF_Info.MaskEdit2Exit(Sender: TObject);
begin
//  if (Trim(MaskEdit2.Text) = '0') then MaskEdit2.Text := '';
end;

procedure TF_Info.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (key = 13) then if (ValidNumero(MaskEdit2.Text)) then Button1Click(F_Info) else MaskEdit2.SetFocus;
end;

procedure TF_Info.AndamentoNotificao1Click(Sender: TObject);
begin
  if (StrToInt(Label26.Caption) > 0) then
  begin
    //if (StrToInt(Label27.Caption) = 232) or (StrToInt(Label27.Caption) = 180) or (StrToInt(Label27.Caption) = 2) then
    if (StrToInt(Label27.Caption) = 197) or (StrToInt(Label27.Caption) = 300) then
    begin
      Application.CreateForm(TF_AndaNot, F_AndaNot);
      F_AndaNot.Label1.Caption := Label26.Caption;
      F_AndaNot.ShowModal;
      F_AndaNot.Destroy;
      F_AndaNot := NIL;
    end
    else
    begin
      Application.CreateForm(TF_AndaNotB, F_AndaNotB);
      F_AndaNotB.Label1.Caption := Label26.Caption;
      F_AndaNotB.ShowModal;
      F_AndaNotB.Destroy;
      F_AndaNotB := NIL;
    end;
  end
  else ShowMessage('Número do registro inválido !');
end;

procedure TF_Info.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  F_Info.Label7.Caption := Dm.HisTd.FieldByName('usuario').asString;
  if (Dm.HisTd.FieldByName('data').asDateTime > 0) then F_Info.Label17.Caption := Dm.HisTd.FieldByName('data').asString + ' - ' + Dm.HisTd.FieldByName('hora').asString else F_Info.Label17.Caption := '';
  if key = 113 then F_Info.AndamentoNotificao1Click(F_Info);
  if key = 114 then F_Info.VisualizarExignciaF41Click(F_Info);
  if key = 27  then BitBtn2Click(F_Info);
end;

procedure TF_Info.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 113 then F_Info.AndamentoNotificao1Click(F_Info);
end;

procedure TF_Info.VisualizarExignciaF41Click(Sender: TObject);
begin
  Application.CreateForm(TF_VerExige, F_VerExige);
  F_VerExige.Label3.Caption := Label25.Caption;
  F_VerExige.ShowModal;
  F_VerExige.Destroy;
  F_VerExige := NIL;
end;

procedure TF_Info.RadioGroup1Click(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

procedure TF_Info.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  F_Info.Label7.Caption := Dm.HisTd.FieldByName('usuario').asString;
  if (Dm.HisTd.FieldByName('data').asDateTime > 0) then F_Info.Label17.Caption := Dm.HisTd.FieldByName('data').asString + ' - ' + Dm.HisTd.FieldByName('hora').asString else F_Info.Label17.Caption := '';
end;

procedure TF_Info.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  F_Info.Label7.Caption := Dm.HisTd.FieldByName('usuario').asString;
  if (Dm.HisTd.FieldByName('data').asDateTime > 0) then F_Info.Label17.Caption := Dm.HisTd.FieldByName('data').asString + ' - ' + Dm.HisTd.FieldByName('hora').asString else F_Info.Label17.Caption := '';
end;

procedure TF_Info.BitBtn3Click(Sender: TObject);
begin
  frmAnotacao.ShowModal;
end;

end.
