unit RDEP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers, jpeg;

type
  TF_RDep = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    ComboBox1: TComboBox;
    MaskEdit5: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label7: TLabel;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    Procedure Atualiza_LivroFolhaDep(Sender : TOBject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RDep: TF_RDep;

implementation

uses DMTD, Menu, QkRDep, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_RDep.Atualiza_LivroFolhaDep(Sender : TOBject);
begin
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('UPDATE configur SET');
  Dm.Configur.Sql.Add('l_dep = ' + MaskEdit3.Text + ',');
  Dm.Configur.Sql.Add('f_dep = ' + MaskEdit4.Text);
  Dm.Configur.Sql.Add('WHERE');
  Dm.Configur.Sql.Add('    l_dep <= ' + MaskEdit3.Text);
  Dm.Configur.Sql.Add('AND f_dep <= ' + MaskEdit4.Text);
  Dm.Configur.ExecSql;
end;

procedure TF_RDep.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RDep.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  MaskEdit2.Text := '';
  maskedit3.text := '0';
  maskedit4.text := '0';
  MaskEdit1.setfocus;
end;

procedure TF_RDep.BitBtn1Click(Sender: TObject);
begin
  if (not ValidData(MaskEdit1.Text)) AND (not ValidData(MaskEdit2.Text)) then
    begin
      MessageBox(Handle, PChar('Data inválida !'), 'LIVRO DE DEPÓSITO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
  //
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT p_auxiliar, a_nome, natureza, deposito, contato');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    data_r >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('AND data_r <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('ORDER BY p_auxiliar');
  Dm.ArqAux.Open;
  //
  Application.CreateForm(TQk_RDep, Qk_RDep);
  Qk_RDep.Label4.Caption  := 'COM MOV';
  //
  if (Dm.ArqAux.RecordCount = 0) then
    begin
      Qk_RDep.Label4.Caption  := 'SEM MOV';
      MessageBox(Handle, PChar('Movimento não localizado !'), 'LIVRO DE DEPÓSITO', MB_OK + MB_ICONWARNING);
      //MaskEdit1.SetFocus;
      //Dm.ArqAux.Close;
      //Exit;
    end;
  //
  Qk_RDep.QrLabel1.Caption  := F_Menu.Label9.Caption;
  Qk_RDep.QrLabel5.Caption  := 'LIVRO DE DEPÓSITO PRÉVIO';
  Qk_RDep.QrLabel6.Caption  := 'Movimento de ' + MaskEdit1.Text + ' até ' + MaskEdit2.Text;
  Qk_RDep.QrLabel16.Caption := DataExtenso(MaskEdit2.Text, True, '');
  Qk_RDep.QrLabel17.Caption := ComboBox1.Text + ' - ' + Trim(ComboBox2.Text);
  Qk_RDep.Label1.Caption    := Trim(MaskEdit3.Text);
  Qk_RDep.Label2.Caption    := Trim(MaskEdit5.Text);
  if (StrToInt(MaskEdit4.Text) > 0) then Qk_RDep.Label3.Caption := IntToStr(StrToInt(MaskEdit4.Text) - 1) else Qk_RDep.Label3.Caption := Trim(MaskEdit4.Text);
  Qk_RDep.QuickRep1.Preview;
  Qk_RDep.Destroy;
  Qk_RDep := NIL;
  Dm.ArqAux.Close;
  BitBtn2Click(F_RDep);
end;

procedure TF_RDep.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_RDep.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit4.setfocus;
end;

procedure TF_RDep.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit4.setfocus;
end;

procedure TF_RDep.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then combobox1.setfocus;
end;

procedure TF_RDep.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then ComboBox2.setfocus;
end;

procedure TF_RDep.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RDep.FormActivate(Sender: TObject);
begin
{  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT l_dep, f_dep FROM configur');
  Dm.Configur.Open;
  if (Dm.Configur.RecordCount <> 0) then
  begin
    MaskEdit3.Text := Dm.Configur.FieldByName('l_dep').asString;
    MaskEdit4.Text := Dm.Configur.FieldByName('f_dep').asString;
  end;
  Dm.Configur.Close; }
  MaskEdit1.SetFocus;
end;

procedure TF_RDep.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.text := '0';
end;

procedure TF_RDep.MaskEdit4Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit4.Text)) then MaskEdit4.text := '0';
end;

procedure TF_RDep.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit2.Text := MaskEdit1.Text;
end;

procedure TF_RDep.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_RDep.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

end.
