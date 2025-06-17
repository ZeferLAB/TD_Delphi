unit RRecM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls, Printers;

type
  TF_RRecM = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    MaskEdit1: TMaskEdit;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel3: TBevel;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    ComboBox1: TComboBox;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox2: TComboBox;
    Label7: TLabel;
    MaskEdit5: TMaskEdit;
    Label2: TLabel;
    ComboBox3: TComboBox;
    Label8: TLabel;
    ComboBox4: TComboBox;
    Label9: TLabel;
    ComboBox5: TComboBox;
    CheckBox1: TCheckBox;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RRecM: TF_RRecM;
  
implementation

uses DMTD, Menu, RECR;

{$R *.DFM}

procedure TF_RRecM.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit5.setfocus;
end;

procedure TF_RRecM.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RRecM.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit4.setfocus;
end;

procedure TF_RRecM.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RRecM.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.text := '';
  MaskEdit5.text := '';
  MaskEdit1.SetFocus;
end;

procedure TF_RRecM.BitBtn1Click(Sender: TObject);
var
  arq : String;
  SIT1 : string;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('Data inválida !'), 'RECIBO', MB_OK + MB_ICONINFORMATION);
    MaskEdit1.SetFocus;
    Exit;
  end;
  StatusBar1.SimpleText := 'Gerando relatório....';
  StatusBar1.UpDate;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT protocolo, a_nome, ext_nat, data_p, registro, data_r,');
  Dm.ArqAux.Sql.Add('a_nome, a_cidade, natureza, contrato, agencia,');
  Dm.ArqAux.Sql.Add('(v_cartorio+vo_mic+vo_pag+vo_adc) oficial,');
  Dm.ArqAux.Sql.Add('(v_estado+ve_mic+ve_pag+ve_adc) estado,');
  Dm.ArqAux.Sql.Add('(v_ipesp+vi_mic+vi_pag+vi_adc) ipesp,');
  Dm.ArqAux.Sql.Add('(v_sinoreg+vs_mic+vs_pag+vs_adc) sinoreg,');
  Dm.ArqAux.Sql.Add('(v_tribunal+vt_mic+vt_pag+vt_adc) tribunal,');
  Dm.ArqAux.Sql.Add('(v_total+v_mic+v_pag+v_adc) total,');
  Dm.ArqAux.Sql.Add('v_conducao, deposito, custas');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    data_r    >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('AND data_r    <= ' + Chr(39) + ConvData(MaskEdit5.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('AND a.ncliente = ' + IntToStr(StrToInt(Trim(Copy(ComboBox3.Text, 1,3)))));
  Dm.ArqAux.Sql.Add('AND a.a_nome   = ' + Chr(39) + Trim(ComboBox4.Text) + Chr(39));
  if (Trim(ComboBox5.Text) <> '') then Dm.ArqAux.Sql.Add('AND a.agencia = ' + Chr(39) + Trim(ComboBox5.Text) + Chr(39));
  if (StrToInt(MaskEdit3.Text) > 0) AND (StrToInt(MaskEdit4.Text) > 0) then
  begin
    Dm.ArqAux.Sql.Add('AND registro >= ' + Trim(MaskEdit3.Text));
    Dm.ArqAux.Sql.Add('AND registro <= ' + Trim(MaskEdit4.Text));
  end;
  Dm.ArqAux.Sql.Add('GROUP BY protocolo');
  Dm.ArqAux.Sql.Add('ORDER BY registro');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    MessageBox(Handle, PChar('Movimento não localizado !'), 'RECIBO', MB_OK + MB_ICONINFORMATION);
    MaskEdit1.SetFocus;
    Exit;
  end;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'RECIBO';
  CriaTabela('RECIBO', arq);
  while (not Dm.ArqAux.Eof) do
  begin

  end;






  
  Application.CreateForm(TQK_RecR, QK_RecR);
  Qk_RecR.QrLabel1.Caption  := F_Menu.Label30.Caption;
  Qk_RecR.QrLabel2.Caption  := F_Menu.Label11.Caption;
  Qk_RecR.QrLabel3.Caption  := F_Menu.Label5.Caption;
  Qk_RecR.QrLabel4.Caption  := F_Menu.Label13.Caption;
  Qk_RecR.QrLabel26.Caption := DataExtenso(MaskEdit1.Text, True, '');
  Qk_RecR.QrLabel28.Caption := Trim(Combobox1.Text);
  Qk_RecR.QrLabel27.Caption := Trim(ComboBox2.Text);
  Qk_RecR.QuickRep1.Preview;
  Qk_RecR.Destroy;
  Qk_RecR := NIL;
  StatusBar1.SimpleText := 'Fim do Relatório.';
  StatusBar1.UpDate;
  Screen.Cursor := crdefault;
  BitBtn3.SetFocus;
end;

procedure TF_RRecM.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then ComboBox1.Setfocus;
end;

procedure TF_RRecM.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.setfocus;
end;

procedure TF_RRecM.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then bitbtn1.setfocus;
end;

procedure TF_RRecM.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure TF_RRecM.MaskEdit4Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit4.Text)) then MaskEdit4.Text := '0';
end;

procedure TF_RRecM.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
end;

procedure TF_RRecM.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (not ValidData(MaskEdit1.Text)) then
    begin
      ShowMessage('Data inválida ');
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT ncliente FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    data_r >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND data_r <= ' + Chr(39) + ConvData(MaskEdit4.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('GROUP BY ncliente');
    Dm.ArqAux.Sql.Add('ORDER BY ncliente');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      Dm.ArqAux.Close;
      ShowMessage('Movimento não encontrado !');
      Exit;
    end;
    ComboBox3.Clear;
    while (not Dm.ArqAux.Eof) do
    begin
      ComboBox3.Items.Add(StrZero(Dm.ArqAux.FieldByName('ncliente').asString, 3) + ' - ' + BuscaNomeEmpresa(Dm.ArqAux.FieldByName('ncliente').asString, False));
      Dm.ArqAux.Next;
    end;
    Dm.ArqAux.Close;
    ComboBox3.SetFocus;
  end;
end;

procedure TF_RRecM.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (not ValidData(MaskEdit1.Text)) then
    begin
      ShowMessage('Data inválida ');
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT a_nome FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    data_r  >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND data_r  <= ' + Chr(39) + ConvData(MaskEdit4.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND ncliente = ' + IntToStr(StrToInt(Copy(ComboBox3.Text, 1,3))));
    Dm.ArqAux.Sql.Add('GROUP BY a_nome');
    Dm.ArqAux.Sql.Add('ORDER BY a_nome');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      Dm.ArqAux.Close;
      ShowMessage('Movimento não encontrado !');
      Exit;
    end;
    ComboBox4.Clear;
    while (not Dm.ArqAux.Eof) do
    begin
      ComboBox4.Items.Add(Trim(Dm.ArqAux.FieldByName('a_nome').asString));
      Dm.ArqAux.Next;
    end;
    Dm.ArqAux.Close;
    ComboBox4.SetFocus;
  end;
end;

procedure TF_RRecM.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (not ValidData(MaskEdit1.Text)) then
    begin
      ShowMessage('Data inválida ');
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT agencia FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    data_r  >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND data_r  <= ' + Chr(39) + ConvData(MaskEdit4.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND a_nome   = ' + Chr(39) + Trim(ComboBox4.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND ncliente = ' + IntToStr(StrToInt(Copy(ComboBox4.Text, 1,3))));    
    Dm.ArqAux.Sql.Add('GROUP BY agencia');
    Dm.ArqAux.Sql.Add('ORDER BY agencia');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      Dm.ArqAux.Close;
      ShowMessage('Movimento não encontrado !');
      Exit;
    end;
    ComboBox5.Clear;
    while (not Dm.ArqAux.Eof) do
    begin
      ComboBox5.Items.Add(Trim(Dm.ArqAux.FieldByName('agencia').asString));
      Dm.ArqAux.Next;
    end;
    Dm.ArqAux.Close;
    ComboBox5.SetFocus;
  end;
end;

procedure TF_RRecM.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

end.
