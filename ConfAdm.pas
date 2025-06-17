unit ConfAdm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, ComCtrls, Tabnotbk, Buttons;

type
  TF_ConfAdm = class(TForm)
    ControlBar1: TControlBar;
    Label54: TLabel;
    TabbedNotebook1: TTabbedNotebook;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Panel2: TPanel;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Panel3: TPanel;
    CheckBox6: TCheckBox;
    Panel4: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    CheckBox10: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    Procedure Carregar(Sender : TOBject);
    procedure FormActivate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ConfAdm: TF_ConfAdm;

implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_ConfAdm.Carregar(Sender : TOBject);
begin
  // Tabela de Configurações Administrativas.
  Dm.Config_Adm.Close;
  Dm.Config_Adm.Sql.Clear;
  Dm.Config_Adm.Sql.Add('SELECT * FROM config_adm');
  Dm.Config_Adm.Open;

  if dm.Config_Adm.FieldByName('chk_01').AsBoolean = True then CheckBox1.Checked  := True else CheckBox1.Checked  := False;
  if dm.Config_Adm.FieldByName('chk_02').AsBoolean = True then CheckBox2.Checked  := True else CheckBox2.Checked  := False;
  if dm.Config_Adm.FieldByName('chk_03').AsBoolean = True then CheckBox3.Checked  := True else CheckBox3.Checked  := False;
  if dm.Config_Adm.FieldByName('chk_04').AsBoolean = True then CheckBox4.Checked  := True else CheckBox4.Checked  := False;
  if dm.Config_Adm.FieldByName('chk_05').AsBoolean = True then CheckBox5.Checked  := True else CheckBox5.Checked  := False;
  if dm.Config_Adm.FieldByName('chk_06').AsBoolean = True then CheckBox6.Checked  := True else CheckBox6.Checked  := False;
  if dm.Config_Adm.FieldByName('chk_07').AsBoolean = True then CheckBox7.Checked  := True else CheckBox7.Checked  := False;
  if dm.Config_Adm.FieldByName('chk_08').AsBoolean = True then CheckBox8.Checked  := True else CheckBox8.Checked  := False;
  if dm.Config_Adm.FieldByName('chk_09').AsBoolean = True then CheckBox9.Checked  := True else CheckBox9.Checked  := False;

  if dm.Config_Adm.FieldByName('imp_lva1').AsBoolean = True then RadioGroup1.ItemIndex := 0;
  if dm.Config_Adm.FieldByName('imp_lva2').AsBoolean = True then RadioGroup1.ItemIndex := 1;
  if dm.Config_Adm.FieldByName('imp_lva3').AsBoolean = True then RadioGroup1.ItemIndex := 2;
  if dm.Config_Adm.FieldByName('imp_lva4').AsBoolean = True then RadioGroup1.ItemIndex := 3;
  if dm.Config_Adm.FieldByName('chk_11').AsBoolean   = True then RadioGroup1.ItemIndex := 4;
  if dm.Config_Adm.FieldByName('chk_12').AsBoolean   = True then RadioGroup1.ItemIndex := 5;

  if dm.Config_Adm.FieldByName('imp_lvb1').AsBoolean = True then RadioGroup2.ItemIndex := 0;
  if dm.Config_Adm.FieldByName('imp_lvb2').AsBoolean = True then RadioGroup2.ItemIndex := 1;
  if dm.Config_Adm.FieldByName('imp_lvb3').AsBoolean = True then RadioGroup2.ItemIndex := 2;
  if dm.Config_Adm.FieldByName('imp_lvb4').AsBoolean = True then RadioGroup2.ItemIndex := 3;

  a_chk06   := Dm.Config_Adm.fieldbyname('chk_06').AsBoolean;
  a_chk07   := Dm.Config_Adm.fieldbyname('chk_07').AsBoolean;
  a_chk11   := Dm.Config_Adm.fieldbyname('chk_11').AsBoolean;
  a_chk12   := Dm.Config_Adm.fieldbyname('chk_12').AsBoolean;
  a_implva1 := Dm.Config_Adm.fieldbyname('imp_lva1').AsBoolean;
  a_implva2 := Dm.Config_Adm.fieldbyname('imp_lva2').AsBoolean;
  a_implva3 := Dm.Config_Adm.fieldbyname('imp_lva3').AsBoolean;
  a_implva4 := Dm.Config_Adm.fieldbyname('imp_lva4').AsBoolean;
  a_implvb1 := Dm.Config_Adm.fieldbyname('imp_lvb1').AsBoolean;
  a_implvb2 := Dm.Config_Adm.fieldbyname('imp_lvb2').AsBoolean;
  a_implvb3 := Dm.Config_Adm.fieldbyname('imp_lvb3').AsBoolean;
  a_implvb4 := Dm.Config_Adm.fieldbyname('imp_lvb4').AsBoolean;
end;


procedure TF_ConfAdm.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ConfAdm.SpeedButton1Click(Sender: TObject);
begin
  if SpeedButton1.Caption = '&Alterar' then
  begin
    SpeedButton1.Caption := '&Gravar';
    SpeedButton2.Enabled := False;
    Panel1.Enabled  := True;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Gravar as alterações ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      // Gravando Config_Adm
      DM.Config_Adm.Close;
      if DM.Config_Adm.RequestLive = False then DM.Config_Adm.RequestLive := True;
      Dm.Config_Adm.Sql.Clear;
      Dm.Config_Adm.Sql.Add('SELECT * FROM config_adm');
      Dm.Config_Adm.Open;

      if (Dm.Config_Adm.RecordCount = 0) then
      begin
        Dm.Config_Adm.Close;
        Dm.Config_Adm.Sql.Clear;
        Dm.Config_Adm.SQL.Add('INSERT INTO config_adm (');
        Dm.Config_Adm.SQL.Add(' chk_01, chk_02, chk_03, chk_04, chk_05, chk_06, chk_07, chk_08, chk_09, chk_10,');
        Dm.Config_Adm.SQL.Add(' imp_lva1, imp_lva2, imp_lva3, imp_lva4, chk_11, chk_12, imp_lvb1, imp_lvb2, imp_lvb3, imp_lvb4');
        Dm.Config_Adm.SQL.Add(' )');
        Dm.Config_Adm.SQL.Add('VALUES (');
        if CheckBox1.Checked then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if CheckBox2.Checked then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if CheckBox3.Checked then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if CheckBox4.Checked then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if CheckBox5.Checked then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if CheckBox6.Checked then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if CheckBox7.Checked then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if CheckBox8.Checked then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if CheckBox9.Checked then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if CheckBox10.Checked then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');

        if RadioGroup1.ItemIndex = 0 then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if RadioGroup1.ItemIndex = 1 then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if RadioGroup1.ItemIndex = 2 then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if RadioGroup1.ItemIndex = 3 then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if RadioGroup1.ItemIndex = 4 then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');
        if RadioGroup1.ItemIndex = 5 then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F" ,');

        if RadioGroup2.ItemIndex = 0 then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F", ');
        if RadioGroup2.ItemIndex = 1 then Dm.Config_Adm.Sql.Add('"T" ,') else Dm.Config_Adm.Sql.Add('"F", ');
        if RadioGroup2.ItemIndex = 2 then Dm.Config_Adm.Sql.Add('"T", ') else Dm.Config_Adm.Sql.Add('"F", ');
        if RadioGroup2.ItemIndex = 3 then Dm.Config_Adm.Sql.Add('"T"  ') else Dm.Config_Adm.Sql.Add('"F"');


        Dm.Config_Adm.SQL.Add(')');
        Dm.Config_Adm.ExecSQL;
      end
      else
      begin
        Dm.Config_Adm.Close;
        Dm.Config_Adm.Sql.Clear;
        Dm.Config_Adm.Sql.Add('UPDATE config_adm SET');
        if CheckBox1.Checked then Dm.Config_Adm.Sql.Add('chk_01 = "T" ,') else Dm.Config_Adm.Sql.Add('chk_01 = "F" ,');
        if CheckBox2.Checked then Dm.Config_Adm.Sql.Add('chk_02 = "T" ,') else Dm.Config_Adm.Sql.Add('chk_02 = "F" ,');
        if CheckBox3.Checked then Dm.Config_Adm.Sql.Add('chk_03 = "T" ,') else Dm.Config_Adm.Sql.Add('chk_03 = "F" ,');
        if CheckBox4.Checked then Dm.Config_Adm.Sql.Add('chk_04 = "T" ,') else Dm.Config_Adm.Sql.Add('chk_04 = "F" ,');
        if CheckBox5.Checked then Dm.Config_Adm.Sql.Add('chk_05 = "T" ,') else Dm.Config_Adm.Sql.Add('chk_05 = "F" ,');
        if CheckBox6.Checked then Dm.Config_Adm.Sql.Add('chk_06 = "T" ,') else Dm.Config_Adm.Sql.Add('chk_06 = "F" ,');
        if CheckBox7.Checked then Dm.Config_Adm.Sql.Add('chk_07 = "T" ,') else Dm.Config_Adm.Sql.Add('chk_07 = "F" ,');
        if CheckBox8.Checked then Dm.Config_Adm.Sql.Add('chk_08 = "T" ,') else Dm.Config_Adm.Sql.Add('chk_08 = "F" ,');
        if CheckBox9.Checked then Dm.Config_Adm.Sql.Add('chk_09 = "T" ,') else Dm.Config_Adm.Sql.Add('chk_09 = "F" ,');
        if CheckBox10.Checked then Dm.Config_Adm.Sql.Add('chk_10 = "T" ,') else Dm.Config_Adm.Sql.Add('chk_10 = "F" ,');

        if RadioGroup1.ItemIndex = 0 then Dm.Config_Adm.Sql.Add('imp_lva1 = "T" ,') else Dm.Config_Adm.Sql.Add('imp_lva1 = "F" ,');
        if RadioGroup1.ItemIndex = 1 then Dm.Config_Adm.Sql.Add('imp_lva2 = "T" ,') else Dm.Config_Adm.Sql.Add('imp_lva2 = "F" ,');
        if RadioGroup1.ItemIndex = 2 then Dm.Config_Adm.Sql.Add('imp_lva3 = "T" ,') else Dm.Config_Adm.Sql.Add('imp_lva3 = "F" ,');
        if RadioGroup1.ItemIndex = 3 then Dm.Config_Adm.Sql.Add('imp_lva4 = "T" ,') else Dm.Config_Adm.Sql.Add('imp_lva4 = "F" ,');
        if RadioGroup1.ItemIndex = 4 then Dm.Config_Adm.Sql.Add('chk_11   = "T" ,') else Dm.Config_Adm.Sql.Add('chk_11   = "F" ,');
        if RadioGroup1.ItemIndex = 5 then Dm.Config_Adm.Sql.Add('chk_12   = "T" ,') else Dm.Config_Adm.Sql.Add('chk_11   = "F" ,');

        if RadioGroup2.ItemIndex = 0 then Dm.Config_Adm.Sql.Add('imp_lvb1 = "T" ,') else Dm.Config_Adm.Sql.Add('imp_lvb1 = "F" ,');
        if RadioGroup2.ItemIndex = 1 then Dm.Config_Adm.Sql.Add('imp_lvb2 = "T" ,') else Dm.Config_Adm.Sql.Add('imp_lvb2 = "F" ,');
        if RadioGroup2.ItemIndex = 2 then Dm.Config_Adm.Sql.Add('imp_lvb3 = "T" ,') else Dm.Config_Adm.Sql.Add('imp_lvb3 = "F" ,');
        if RadioGroup2.ItemIndex = 3 then Dm.Config_Adm.Sql.Add('imp_lvb4 = "T"') else Dm.Config_Adm.Sql.Add('imp_lvb4 = "F"');
        Dm.Config_Adm.ExecSQL;

      end;
    end;
    Carregar(F_ConfAdm);
    Panel1.Enabled       := False;
    SpeedButton1.Caption := '&Alterar';
    SpeedButton2.Enabled := True;
  end;
end;

procedure TF_ConfAdm.FormActivate(Sender: TObject);
begin
  Carregar(F_ConfAdm);
end;

procedure TF_ConfAdm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    CheckBox2.Checked := False;
    CheckBox3.Checked := False;
    CheckBox8.Checked := False;
  end;
end;

procedure TF_ConfAdm.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
    CheckBox1.Checked := False;
    CheckBox3.Checked := False;
    CheckBox8.Checked := False;
  end;
end;

procedure TF_ConfAdm.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
  begin
    CheckBox1.Checked := False;
    CheckBox2.Checked := False;
    CheckBox8.Checked := False;
  end;
end;

procedure TF_ConfAdm.CheckBox8Click(Sender: TObject);
begin
  if CheckBox8.Checked then
  begin
    CheckBox1.Checked := False;
    CheckBox2.Checked := False;
    CheckBox3.Checked := False;
  end;
end;

procedure TF_ConfAdm.CheckBox9Click(Sender: TObject);
begin
  if CheckBox9.Checked then
  begin
    CheckBox4.Checked := False;
    CheckBox5.Checked := False;
  end;
end;

end.
