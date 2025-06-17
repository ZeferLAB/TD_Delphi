unit LivProt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, Buttons, Mask;

type
  TF_LivProt = class(TForm)
    ControlBar1: TControlBar;
    Label36: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    BitBtn1: TBitBtn;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_LivProt: TF_LivProt;

implementation

uses DMTD;

{$R *.DFM}

Procedure Limpa_Tela;
begin
  with F_LivProt do
  begin
    MaskEdit1.Clear;
    MaskEdit2.Clear;
    MaskEdit3.Clear;
    MaskEdit4.Clear;
    MaskEdit5.Clear;
    MaskEdit6.Clear;
    MaskEdit7.Clear;
    MaskEdit8.Clear;
  end;  
end;

procedure TF_LivProt.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_LivProt.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_LivProt.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_LivProt.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_LivProt.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_LivProt.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_LivProt.SpeedButton1Click(Sender: TObject);
begin
  if SpeedButton1.Caption = 'Alterar Livro &A' then
  begin
    SpeedButton1.Caption := '&Gravar';
    SpeedButton2.Enabled := False;
    SpeedButton3.Enabled := False;
    Panel2.Enabled       := True;
    GroupBox1.Enabled    := True;
    GroupBox1.Font.Color := clRed;
    Limpa_Tela;
    MaskEdit1.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Confirma correção ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      DM.ArqAux.Close;
      DM.ArqAux.SQL.Clear;
      DM.ArqAux.sql.Add('UPDATE td SET');
      DM.ArqAux.sql.Add(' livro_a = ' + QuotedStr(MaskEdit1.Text) + ',');
      DM.ArqAux.sql.Add(' folha_a = ' + QuotedStr(MaskEdit2.Text));
      DM.ArqAux.sql.Add(' WHERE protocolo BETWEEN ' + QuotedStr(MaskEdit3.Text) + ' AND ' + QuotedStr(MaskEdit4.Text));
      DM.ArqAux.ExecSQL;
    end
    else
    begin
      Application.MessageBox('Correção não realizada !' , 'Mensagem do Sistema', mb_ok);
    end;
    Panel2.Enabled       := False;
    GroupBox1.Enabled    := False;
    GroupBox1.Font.Color := clBlack;
    SpeedButton1.Caption := 'Alterar Livro &A';
    SpeedButton2.Enabled := True;
    SpeedButton3.Enabled := True;
  end;
end;

procedure TF_LivProt.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_LivProt.SpeedButton2Click(Sender: TObject);
begin
  if SpeedButton2.Caption = 'Alterar Livro &B' then
  begin
    SpeedButton2.Caption := '&Gravar';
    SpeedButton1.Enabled := False;
    SpeedButton3.Enabled := False;
    Panel2.Enabled       := True;
    GroupBox2.Enabled    := True;
    GroupBox2.Font.Color := clRed;
    Limpa_Tela;
    MaskEdit5.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Confirma correção ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      DM.ArqAux.Close;
      DM.ArqAux.SQL.Clear;
      DM.ArqAux.sql.Add('UPDATE td SET');
      DM.ArqAux.sql.Add(' livro_b = ' + QuotedStr(MaskEdit5.Text) + ',');
      DM.ArqAux.sql.Add(' folha_b = ' + QuotedStr(MaskEdit6.Text));
      DM.ArqAux.sql.Add(' WHERE protocolo BETWEEN ' + QuotedStr(MaskEdit7.Text) + ' AND ' + QuotedStr(MaskEdit8.Text));
      DM.ArqAux.ExecSQL;
    end
    else
    begin
      Application.MessageBox('Correção não realizada !' , 'Mensagem do Sistema', mb_ok);
    end;
    Panel2.Enabled       := False;
    GroupBox2.Enabled    := False;
    GroupBox2.Font.Color := clBlack;
    SpeedButton2.Caption := 'Alterar Livro &B';
    SpeedButton1.Enabled := True;
    SpeedButton3.Enabled := True;
  end;
end;

procedure TF_LivProt.BitBtn1Click(Sender: TObject);
var
  folha_,folha_ini,folha_fim,tot_folha,livro_ : Integer;
begin
  Application.MessageBox('ATENÇÃO. O Sistema irá renumerar todas as folhas do Livro B !' , 'Mensagem do Sistema', mb_ok);
  if (MessageBox(Handle, PChar('Confirma Operação ?'), 'MANUTENÇAO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('select folhap,livrop from configur');
    Dm.ArqAux.Open;
    folha_ := Dm.ArqAux.FieldByname('folhap').AsInteger;
    livro_ := Dm.ArqAux.FieldByname('livrop').AsInteger;

    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('select recno,data_p,protocolo,livro_b,folha_b,folha_b_f,pag_adic from td where protocolo > 0 order by data_p,protocolo');
    Dm.Td.Open;
    While (NOT Dm.Td.Eof) Do
    Begin
      If Dm.Td.FieldByname('pag_adic').AsInteger > 0 then
        tot_folha := Dm.Td.FieldByname('pag_adic').AsInteger
      Else
        tot_folha := 1;
      folha_ini := folha_;
      folha_fim := (folha_ + tot_folha) -1;
      DM.ArqAux.Close;
      DM.ArqAux.SQL.Clear;
      DM.ArqAux.sql.Add('UPDATE td SET');
      DM.ArqAux.sql.Add(' livro_b   = ' + IntToStr(livro_));
      DM.ArqAux.sql.Add(',folha_b   = ' + IntToStr(folha_ini));
      DM.ArqAux.sql.Add(',folha_b_f = ' + IntToStr(folha_fim));
      DM.ArqAux.sql.Add(' WHERE recno = ' + Dm.Td.FieldByname('recno').AsString);
      DM.ArqAux.ExecSQL;
      folha_ := (folha_ + tot_folha);
      if folha_ > 300 then
      Begin
        livro_ := livro_ + 1;
        folha_ := 2;
      End;
      Dm.Td.Next;
    End;

    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('update configur set folhap = ' + IntToStr(folha_) + ', livrop = ' + IntToStr(livro_));
    Dm.ArqAux.ExecSql;
    ShowMessage('FIM');
  End;
end;

end.
