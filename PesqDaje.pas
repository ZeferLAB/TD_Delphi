unit PesqDAJE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids;

type
  TF_PesqDaje = class(TForm)
    Panel1: TPanel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MaskEdit2: TMaskEdit;
    Label4: TLabel;
    ComboBox1: TComboBox;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label7: TLabel;
    MaskEdit7: TMaskEdit;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    Label8: TLabel;
    MaskEdit8: TMaskEdit;
    BitBtn4: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7Exit(Sender: TObject);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PesqDaje: TF_PesqDaje;

  alt_daje, alt_selo : Boolean;

implementation

uses Menu, DMTD, FuncGeral;

{$R *.DFM}

procedure TF_PesqDaje.BitBtn2Click(Sender: TObject);
begin
  DM.Selos.Close;
  Close;
end;

procedure TF_PesqDaje.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure Carregar;
begin
  with F_PesqDaje do
  begin
    MaskEdit2.Text := DM.Selos.FieldByName('p_auxiliar').AsString;
    MaskEdit3.Text := DM.Selos.FieldByName('data_r').AsString;
    MaskEdit4.Text := DM.Selos.FieldByName('selo_validador').AsString;
    MaskEdit5.Text := DM.Selos.FieldByName('selo').AsString;
    MaskEdit7.Text := DM.Selos.FieldByName('daje').AsString;
    MaskEdit8.Text := DM.Selos.FieldByName('serie_daje').AsString;
    Label6.Caption := DM.Selos.FieldByName('status').AsString;
  end;
end;

procedure Limpar;
begin
  with F_PesqDaje do
  begin
    MaskEdit2.Clear;
    MaskEdit3.Clear;
    MaskEdit4.Clear;
    MaskEdit5.Clear;
    MaskEdit7.Clear;
    Label6.Caption := '';
  end;
end;

procedure TF_PesqDaje.BitBtn1Click(Sender: TObject);
begin
  if ComboBox1.Text = 'Protocolo' then
  begin
    DM.Selos.Close;
    DM.Selos.Sql.Clear;
    DM.Selos.Sql.Add('SELECT * FROM td WHERE p_auxiliar = ' + QuotedStr(MaskEdit1.Text));
    DM.Selos.Open;
    if DM.Selos.RecordCount = 0 then
    begin
      showmessage('Protocolo não localizado.');
      DM.Selos.Close;
      Panel2.Visible := False;
      F_PesqDaje.BitBtn3Click(F_PesqDaje);
      Exit;
    end;
  end;

  if ComboBox1.Text = 'Registro' then
  begin
    DM.Selos.Close;
    DM.Selos.Sql.Clear;
    DM.Selos.Sql.Add('SELECT * FROM td WHERE registro = ' + QuotedStr(MaskEdit1.Text));
    DM.Selos.Open;
    if DM.Selos.RecordCount = 0 then
    begin
      showmessage('Registro não localizado.');
      DM.Selos.Close;
      Panel2.Visible := False;
      F_PesqDaje.BitBtn3Click(F_PesqDaje);
      Exit;
    end;
  end;

  if ComboBox1.Text = 'Data' then
  begin
    DM.Selos.Close;
    DM.Selos.Sql.Clear;
    DM.Selos.Sql.Add('SELECT * FROM td WHERE data_r = ' + QuotedStr(ConvData(MaskEdit1.Text)));
    DM.Selos.Open;
    if DM.Selos.RecordCount = 0 then
    begin
      showmessage('Data não localizada.');
      DM.Selos.Close;
      Panel2.Visible := False;
      F_PesqDaje.BitBtn3Click(F_PesqDaje);
      Exit;
    end;
  end;

  if ComboBox1.Text = 'DAJE' then
  begin
    DM.Selos.Close;
    DM.Selos.Sql.Clear;
    DM.Selos.Sql.Add('SELECT * FROM td WHERE daje = ' + QuotedStr(Strzero(MaskEdit1.Text, 6)));
    DM.Selos.Open;
    if DM.Selos.RecordCount = 0 then
    begin
      showmessage('DAJE não localizada.');
      DM.Selos.Close;
      Panel2.Visible := False;
      F_PesqDaje.BitBtn3Click(F_PesqDaje);
      Exit;
    end;
  end;

  DM.Selos.FindFirst;
  Carregar;
  Panel2.Visible  := True;
end;

procedure TF_PesqDaje.BitBtn3Click(Sender: TObject);
begin
  DM.Selos.Close;
  Panel2.Visible := False;
  MaskEdit1.Text := '';
  MaskEdit1.SetFocus;
  Limpar;
end;

procedure TF_PesqDaje.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_PesqDaje.DBGrid1DblClick(Sender: TObject);
begin
  if BitBtn1.Enabled = True then Carregar;
end;

procedure TF_PesqDaje.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if BitBtn1.Enabled = True then Carregar;
end;

procedure TF_PesqDaje.FormActivate(Sender: TObject);
begin
  ComboBox1.Text := 'DAJE';
  ComboBox1.SetFocus;
end;

procedure TF_PesqDaje.ComboBox1Exit(Sender: TObject);
begin
  if ComboBox1.Text = 'Data' then MaskEdit1.EditMask := '!99/99/9999;1;_' else MaskEdit1.EditMask := '';
end;

procedure TF_PesqDaje.BitBtn4Click(Sender: TObject);
begin
  if BitBtn4.Caption = '&Corrigir' then
  begin
    BitBtn4.Caption := '&Salvar';
    BitBtn1.Enabled := False;
    BitBtn2.Enabled := False;
    BitBtn3.Enabled := False;
    Panel2.Enabled  := True;
    MaskEdit4.SetFocus;
  end
  else
  begin
    if BitBtn4.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Correção dos Dados ?'), 'CORREÇÃO', MB_YESNO + MB_ICONQUESTION) = IDYes) then
      begin
        if alt_daje then
        begin
          DM.Selos.Close;
          DM.Selos.Sql.Clear;
          DM.Selos.Sql.Add('SELECT * FROM selos WHERE daje = ' + QuotedStr(MaskEdit7.Text));
          DM.Selos.Open;
          if DM.Selos.RecordCount <> 0 then
          begin
            showmessage('Nº de DAJE já informado no sistema! Favor Verificar !');
            DM.Selos.Close;
            Exit;
          end;
        end;
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('UPDATE selos SET');
        Dm.ArqAux.Sql.Add(' recibo      = ' + QuotedStr(MaskEdit2.Text) + ',');
        if alt_selo then
        begin
          Dm.ArqAux.Sql.Add(' selo_serie  = ' + QuotedStr(MaskEdit4.Text) + ',');
          Dm.ArqAux.Sql.Add(' selo_numero = ' + QuotedStr(MaskEdit5.Text) + ',');
        end;
        if alt_daje then
          Dm.ArqAux.Sql.Add(' daje        = '        + QuotedStr(MaskEdit7.Text) + ',');
        Dm.ArqAux.Sql.Add(' data          = '        + QuotedStr(ConvData(MaskEdit3.Text)));
        Dm.ArqAux.Sql.Add(' WHERE id      = ' + Dm.Selos.FieldByName('id').AsString);
        Dm.ArqAux.ExecSQL;

        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('UPDATE td SET');

        if alt_selo then
        begin
          Dm.ArqAux.Sql.Add(' selo_serie  = ' + QuotedStr(MaskEdit4.Text) + ',');
          Dm.ArqAux.Sql.Add(' selo_numero = ' + QuotedStr(MaskEdit5.Text));
        end;

        if alt_daje then
        begin
          Dm.ArqAux.Sql.Add('  daje = ' + QuotedStr(MaskEdit7.Text));
          Dm.ArqAux.Sql.Add(', serie_daje = ' + QuotedStr(StrZero(MaskEdit8.Text,3)));
        end;

        Dm.ArqAux.Sql.Add(' WHERE p_auxiliar = ' + QuotedStr(MaskEdit2.Text));
        Dm.ArqAux.ExecSQL;

        Application.MessageBox('Correção efetuada com sucesso !' , 'Mensegem do Sistema', mb_ok);
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados !'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
      end;
      Panel2.Enabled  := False;
      BitBtn4.Caption := '&Corrigir';
      BitBtn1.Enabled := True;
      BitBtn2.Enabled := True;
      BitBtn3.Enabled := True;
      BitBtn4.SetFocus;
    end;
  end;
end;

procedure TF_PesqDaje.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_PesqDaje.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_PesqDaje.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_PesqDaje.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_PesqDaje.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn4.SetFocus;
end;

procedure TF_PesqDaje.MaskEdit7Exit(Sender: TObject);
begin
  DM.ArqAux.Close;
  DM.ArqAux.Sql.Clear;
  DM.ArqAux.Sql.Add('SELECT daje FROM td WHERE daje = ' + QuotedStr(DM.Selos.FieldByName('daje').AsString));
  DM.ArqAux.Open;

  if DM.ArqAux.FieldByName('daje').AsString <> MaskEdit1.Text then alt_daje := True else alt_daje := False;
end;

procedure TF_PesqDaje.MaskEdit5Exit(Sender: TObject);
begin
  DM.ArqAux.Close;
  DM.ArqAux.Sql.Clear;
  DM.ArqAux.Sql.Add('SELECT selo_serie, selo_numero FROM td WHERE');
  DM.ArqAux.Sql.Add('     selo_serie = '  + QuotedStr(DM.Selos.FieldByName('selo_serie').AsString));
  DM.ArqAux.Sql.Add(' AND selo_numero = ' + QuotedStr(DM.Selos.FieldByName('selo_numero').AsString));
  DM.ArqAux.Open;

  if DM.ArqAux.FieldByName('selo_numero').AsString <> MaskEdit4.Text then alt_selo := True else alt_selo := False;
end;

procedure TF_PesqDaje.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

end.
