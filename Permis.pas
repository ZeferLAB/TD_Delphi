unit Permis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Spin, Tabnotbk, ExtCtrls, Buttons, jpeg;

type
  TF_Permis = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    Panel2: TPanel;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    Panel3: TPanel;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    Panel4: TPanel;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox41: TCheckBox;
    Panel5: TPanel;
    CheckBox42: TCheckBox;
    CheckBox43: TCheckBox;
    Panel6: TPanel;
    CheckBox44: TCheckBox;
    CheckBox45: TCheckBox;
    CheckBox46: TCheckBox;
    CheckBox47: TCheckBox;
    CheckBox48: TCheckBox;
    CheckBox49: TCheckBox;
    Panel7: TPanel;
    CheckBox50: TCheckBox;
    CheckBox51: TCheckBox;
    CheckBox52: TCheckBox;
    CheckBox53: TCheckBox;
    CheckBox54: TCheckBox;
    CheckBox55: TCheckBox;
    CheckBox56: TCheckBox;
    CheckBox57: TCheckBox;
    CheckBox58: TCheckBox;
    CheckBox59: TCheckBox;
    CheckBox60: TCheckBox;
    CheckBox61: TCheckBox;
    CheckBox62: TCheckBox;
    CheckBox63: TCheckBox;
    CheckBox64: TCheckBox;
    CheckBox65: TCheckBox;
    CheckBox66: TCheckBox;
    CheckBox67: TCheckBox;
    CheckBox68: TCheckBox;
    CheckBox69: TCheckBox;
    CheckBox70: TCheckBox;
    ControlBar1: TControlBar;
    Label36: TLabel;
    CheckBox71: TCheckBox;
    CheckBox72: TCheckBox;
    CheckBox112: TCheckBox;
    CheckBox113: TCheckBox;
    CheckBox114: TCheckBox;
    CheckBox115: TCheckBox;
    CheckBox116: TCheckBox;
    Procedure Carregar(Sender : TOBject; Modo : Integer);
    Procedure Gravar(Sender : TOBject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
   
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Permis: TF_Permis;

implementation

uses DMTD, usuar, Menu, FuncGeral;

{$R *.DFM}

Procedure TF_Permis.Gravar(Sender : TOBject);
var
  campo : String;
  x  : Integer;
begin
  // posicionando na tabela de permissões
  Dm.Permissao.Close;
  Dm.Permissao.Sql.Clear;
  Dm.Permissao.Sql.Add('SELECT * FROM permissao');
  Dm.Permissao.Sql.Add('WHERE');
  Dm.Permissao.Sql.Add('usuario = ' + Dm.Usuarios.FieldByName('recno').asString);
  Dm.Permissao.Open;
  if (Dm.Permissao.RecordCount = 0) then
  begin
    Dm.Permissao.Append;
  end
  else Dm.Permissao.Edit;
  Dm.Permissao.FieldByName('usuario').asInteger := Dm.Usuarios.FieldByName('recno').asInteger;
  for x := 0 to (ComponentCount - 1) do
  begin
{
    if (Components[x] is TCheckBox) then
    begin
      campo := '';
      campo := 'acesso' + StrZero(PegaNumeroCheck(TCheckBox(Components[x]).Name), 3);
      if (TCheckBox(Components[x]).Checked = True) then Dm.Permissao.FieldByName(campo).asString := 'T' else Dm.Permissao.FieldByName(campo).asString := 'F';
    end;
}
    if Components[x] is TCheckBox then
    begin
      campo := '';
//      campo := 'acesso' + StrZero(PegaNumeroCheck(TCheckBox(Components[x]).Name), 3);
//      campo := 'acesso' + strzero(strtoint(Copy(Components[X].Name, 9, length(Components[X].Name)-8)),3);

      campo := 'acesso' + strzero(Copy(Components[X].Name, 9, length(Components[X].Name)-8),3);

      if TCheckBox(Components[x]).Checked = True then
        DM.Permissao.FieldByName(campo).asString := 'T'
      else
      DM.Permissao.FieldByName(campo).asString := 'F';
    end;
  end;
  Dm.Permissao.Post;
  Dm.Permissao.Close;
end;

Procedure TF_Permis.Carregar(Sender : TOBject; Modo : Integer);
var
  x     : Integer;
  campo : String;
begin
  if (F_Usu.BitBtn1.Caption = '&Salvar') OR (F_Usu.BitBtn3.Caption = '&Salvar') then
  begin
    Panel1.Enabled := True;
    Panel2.Enabled := True;
    Panel3.Enabled := True;
    Panel4.Enabled := True;
    Panel5.Enabled := True;
    Panel6.Enabled := True;
    Panel7.Enabled := True;
  end
  else
  begin
    Panel1.Enabled := False;
    Panel2.Enabled := False;
    Panel3.Enabled := True;
    Panel4.Enabled := False;
    Panel5.Enabled := False;
    Panel6.Enabled := False;
    Panel7.Enabled := False;
  end;
  if (modo = 0) then
  begin
    for x := 0 to (ComponentCount - 1) do
    begin
{
      if (Components[x] is TCheckBox) then
      begin
        campo := '';
        campo := 'acesso' + StrZero(PegaNumeroCheck(TCheckBox(Components[x]).Name), 3);
        if (Dm.Permissao.FieldByName(campo).asString = 'T') then (TCheckBox(Components[x]).Checked := True) else (TCheckBox(Components[x]).Checked := False);
      end;
}
      if Components[x] is TCheckBox then
      begin
        campo := '';
        campo := 'acesso' + strzero(Copy(Components[X].Name, 9, length(Components[X].Name)-8),3);
        if (Dm.Permissao.FieldByName(campo).asString = 'T') then
          (TCheckBox(Components[x]).Checked := True)
        else
        (TCheckBox(Components[x]).Checked := False);
      end;
    end;
  end
  else
  begin
    for x := 0 to (ComponentCount - 1) do
    begin
      //if (Components[x] is TCheckBox) then TCheckBox(Components[x]).Checked := True;
    end;
  end;
end;

procedure TF_Permis.FormActivate(Sender: TObject);
begin
  if (Dm.Usuarios.FieldByName('recno').asInteger > 0) AND (not F_Usu.CheckBox1.Checked) then
  begin
    Dm.Permissao.Close;
    Dm.Permissao.Sql.Clear;
    Dm.Permissao.Sql.Add('SELECT * FROM permissao');
    Dm.Permissao.Sql.Add('WHERE');
    Dm.Permissao.Sql.Add('usuario = ' + Dm.Usuarios.FieldByName('recno').asString);
    Dm.Permissao.Open;
    if (Dm.Permissao.RecordCount <> 0) then
      F_Permis.Carregar(F_Permis, 0)
    else
    F_Permis.Carregar(F_Permis, 1);
    Dm.Permissao.Close;
  end
  else Carregar(F_Permis, 1);
end;

procedure TF_Permis.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
