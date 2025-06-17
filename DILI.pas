unit Dili;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TF_Dili = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label6: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word;
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
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Carrega(Sender : TObject);      
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Dili: TF_Dili;

implementation

uses DMTD, Menu;

{$R *.DFM}

Procedure TF_Dili.Carrega(Sender : TObject);
begin
  MaskEdit2.Text  := Dm.ArqAux.FieldByName('data_not1').asString;
  MaskEdit3.Text  := Dm.ArqAux.FieldByName('sit_not1').asString;
  MaskEdit4.Text  := Dm.ArqAux.FieldByName('obs_not1').asString;
  MaskEdit5.Text  := Dm.ArqAux.FieldByName('data_not2').asString;
  MaskEdit6.Text  := Dm.ArqAux.FieldByName('sit_not2').asString;
  MaskEdit7.Text  := Dm.ArqAux.FieldByName('obs_not2').asString;
  MaskEdit8.Text  := Dm.ArqAux.FieldByName('data_not3').asString;
  MaskEdit9.Text  := Dm.ArqAux.FieldByName('sit_not3').asString;
  MaskEdit10.Text := Dm.ArqAux.FieldByName('obs_not3').asString;
end;

procedure TF_Dili.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key =13 then bitbtn2.setfocus;
  if key = 27 then close;
end;

procedure TF_Dili.BitBtn3Click(Sender: TObject);
begin
  Panel2.Visible := False;
  MaskEdit1.Text := '';
  MaskEdit1.SetFocus;
end;

procedure TF_Dili.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Dili.BitBtn2Click(Sender: TObject);
var
  prot : String;
begin
  panel2.Visible := False;
  if (Trim(MaskEdit1.Text) = '') then
  begin
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('protocolo = ' + Trim(MaskEdit1.Text));
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    MessageBox(Handle, PChar('Protocolo oficial não encontrado !'), 'PESQUISA', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  MaskEdit1.Enabled := False;
  Carrega(F_Dili);
  Panel2.Visible     := True;
  if (Label6.Caption = 'remoto') then
  begin
    Panel2.Enabled := False;
  end
  else MaskEdit2.SetFocus;
  Dm.ArqAux.Close;
end;

procedure TF_Dili.BitBtn1Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Gravar esta anotação à margem do protocolo nº ' + Trim(MaskEdit1.Text) + ' ?'), 'DILIGÊNCIAS', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE td_cert SET');
    if (ValidData(MaskEdit2.Text)) then Dm.ArqAux.Sql.Add('data_anot1 = ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('sit_anot1 = ' + Chr(39) + Trim(MaskEdit3.Text) + Chr(39) + ',');
    Dm.ArqAux.Sql.Add('obs_anot1 = ' + Chr(39) + Trim(MaskEdit4.Text) + Chr(39) + ',');
    if (ValidData(MaskEdit5.Text)) then Dm.ArqAux.Sql.Add('data_anot2 = ' + Chr(39) + ConvData(MaskEdit5.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('sit_anot2 = ' + Chr(39) + Trim(MaskEdit6.Text) + Chr(39) + ',');
    Dm.ArqAux.Sql.Add('obs_anot2 = ' + Chr(39) + Trim(MaskEdit7.Text) + Chr(39) + ',');
    if (ValidData(MaskEdit8.Text)) then Dm.ArqAux.Sql.Add('data_anot1 = ' + Chr(39) + ConvData(MaskEdit8.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('sit_anot3 = ' + Chr(39) + Trim(MaskEdit9.Text) + Chr(39) + ',');
    Dm.ArqAux.Sql.Add('obs_anot3 = ' + Chr(39) + Trim(MaskEdit10.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('protocolo = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      if (Label6.Caption = 'remoto') then
      begin
        BitBtn3.Enabled := True;
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Gravada diligência no protocolo oficial nº ' + Trim(MaskEdit1.Text) + '(TELA DE PESQUISA)', MaskEdit1.Text);
      end
      else Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Gravada diligência no protocolo oficial nº ' + Trim(MaskEdit1.Text) + '(MENU)', MaskEdit1.Text);
      Showmessage('Gravação Ok !');
    except
      Showmessage('Problemas para efetuar a gravação !');
    end;
    F_Dili.BitBtn3Click(F_Dili);
  end;  
end;

procedure TF_Dili.FormActivate(Sender: TObject);
begin
  if (Label6.Caption = 'remoto') then
  begin
    bitbtn2.OnClick(f_dili);
    bitbtn1.Enabled   := False;
    bitbtn2.Enabled   := False;
    bitbtn3.Enabled   := False;
    MaskEdit1.Enabled := False;
  end
  else MaskEdit1.SetFocus;
end;

procedure TF_Dili.DBEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_Dili.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_Dili.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if ValidarCampo(MaskEdit3.Text, 'S×N') then MaskEdit4.SetFocus;
end;

procedure TF_Dili.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_Dili.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_Dili.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_Dili.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_Dili.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit9.SetFocus;
end;

procedure TF_Dili.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_Dili.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

end.
