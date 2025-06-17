unit acesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, jpeg;

type
  TF_Acesso = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Acesso: TF_Acesso;

implementation

uses Menu, DMTD;

{$R *.DFM}

procedure TF_Acesso.FormActivate(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  MaskEdit1.SetFocus;
End;

procedure TF_Acesso.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Acesso.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_Acesso.BitBtn2Click(Sender: TObject);
begin
   Close;
   FecharProg := True;
   Application.Terminate;
end;

procedure TF_Acesso.BitBtn1Click(Sender: TObject);
begin
  Dm.Usuarios.Close;
  Dm.Usuarios.Sql.Clear;
  Dm.Usuarios.Sql.Add('SELECT * FROM usuarios');
  Dm.Usuarios.Sql.Add('WHERE');
  Dm.Usuarios.Sql.Add('u_apel = ' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39));
  Dm.Usuarios.Open;
  if (Dm.Usuarios.RecordCount <> 0) then
  begin
    if UnCript(Dm.Usuarios.fieldbyname('u_senh').AsString) = Trim(MaskEdit2.Text) then
    begin
      if TimeToStr(Now) < '12:00' then
      begin
        ShowMessage('Bom dia ' + UnCript(Dm.Usuarios.fieldbyname('u_nome').AsString));
      end
      else if (TimeToStr(Now) > '12:00') and (TimeToStr(Now) < '18:00') then
      begin
        ShowMessage('Boa tarde ' + UnCript(Dm.Usuarios.fieldbyname('u_nome').AsString));
      end
      else ShowMessage('Boa noite ' + UnCript(Dm.Usuarios.fieldbyname('u_nome').AsString));
      F_Menu.Label1.Caption   := Trim(MaskEdit1.Text);
      F_Menu.Label25.Caption  := UnCript(Dm.usuarios.fieldbyname('u_nome').AsString);
      F_Menu.Label14.Caption  := Dm.Usuarios.FieldByName('recno').asString;
      F_Menu.Label15.Caption  := Dm.Usuarios.FieldByName('master').asString;
      F_Menu.Label24.Caption := Dm.Usuarios.FieldByName('verrel').asString;      
      F_Menu.StatusBar1.Panels.Items[1].Text := 'Usuário ' + Dm.Usuarios.fieldbyname('u_apel').AsString;
      Dm.Usuarios.Close;
      if (Permissao('acesso063')) then F_Menu.Label26.Caption := 'T' else F_Menu.Label26.Caption := 'F';
      Dm.Configur.Close;
      Dm.Configur.Sql.Clear;
      Dm.Configur.Sql.Add('SELECT * FROM configur');
      Dm.Configur.Open;
      F_Menu.Label4.Caption  := Trim(Dm.Configur.FieldByName('dir_cert').asString);
      F_Menu.Label5.Caption  := Trim(Dm.Configur.FieldByName('titular').asString);
      F_Menu.Label6.Caption  := Trim(Dm.Configur.FieldByName('estado').asString);
      F_Menu.Label7.Caption  := Trim(Dm.Configur.FieldByName('cidade').asString);
      F_Menu.Label8.Caption  := Trim(Dm.Configur.FieldByName('dir_modrec').asString);
      F_Menu.Label16.Caption := Dm.Configur.FieldByName('dir_modexig').asString;
      F_Menu.Label17.Caption := Dm.Configur.FieldByName('imagens').asString;
      F_Menu.Label27.Caption := Dm.Configur.FieldByName('dir_ret').asString;      
      F_Menu.Label18.Caption := Trim(Dm.Configur.FieldByName('dir_exig').asString);      
      F_Menu.Label9.Caption  := Trim(Dm.Configur.FieldByName('cartorio').asString) + ' de ' + Trim(Dm.Configur.FieldByName('cidade').asString) + ' / ' + Trim(Dm.Configur.FieldByName('estado').asString);
      F_Menu.Caption         := F_Menu.Label9.Caption;
      F_Menu.Label11.Caption := Trim(Dm.Configur.FieldByName('endereco').asString);
      F_Menu.Label12.Caption := 'Pabx: ' + Trim(Dm.Configur.FieldByName('telefone').asString); // + ' - ' + Trim(Dm.Configur.FieldByName('fax').asString);      
      F_Menu.Label11.Caption := F_Menu.Label11.Caption + ' ' + F_Menu.Label7.Caption + ' / ' + F_Menu.Label12.Caption;
      F_Menu.Label13.Caption := Trim(Dm.Configur.FieldByName('titulo').asString);
      F_Menu.Label20.Caption := Dm.Configur.FieldByName('mensagem1').asString;
      F_Menu.Label21.Caption := Dm.Configur.FieldByName('mensagem2').asString;
      F_Menu.Label22.Caption := Dm.Configur.FieldByName('mensagem3').asString;
      F_Menu.Label23.Caption := Dm.Configur.FieldByName('mensagem4').asString;
      Dm.Configur.Close;
      Close;
    end
    else
    begin
      ShowMessage('Senha Inválida');
      MaskEdit2.SetFocus;
    end;
  end
  else
  begin
    Dm.Usuarios.Close;
    ShowMessage('Usuário não localizado');
    MaskEdit1.SetFocus;
  end;
end;

procedure TF_Acesso.BitBtn3Click(Sender: TObject);
begin
  MaskEdit1.Text := '';
  MaskEdit2.Text := '';
  MaskEdit1.SetFocus;
end;

procedure TF_Acesso.FormOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Shift = [SSALT]) or ( key = Vk_F4) then key := Vk_Clear;
end;

end.
