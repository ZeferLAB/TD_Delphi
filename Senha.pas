unit Senha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  Tf_senha = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }
    senha_ok : boolean;
  end;

var
  f_senha: Tf_senha;

implementation

uses DMTD, Menu, baixan, FuncGeral, ProcGeral;

{$R *.DFM}

procedure Tf_senha.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tf_senha.FormActivate(Sender: TObject);
begin
  maskedit1.text := '';
  senha_ok       := false;
  F_menu.senha.caption := 'N';
  maskedit1.setfocus;
end;

procedure Tf_senha.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (Trim(MaskEdit1.Text) <> '') then
    begin 
      Dm.Usuarios.Close;
      Dm.Usuarios.Sql.Clear;
      Dm.Usuarios.Sql.Add('SELECT * FROM usuarios');
      Dm.Usuarios.Sql.Add('WHERE');
      Dm.Usuarios.Sql.Add('u_senh = ' + Chr(39) + Cript(Trim(MaskEdit1.Text)) + Chr(39));
      Dm.Usuarios.Open;
      if (Dm.Usuarios.RecordCount <> 0) then
      begin
        if (Dm.Usuarios.FieldByName('master').asString = 'T') then
        begin
          Label3.Caption := Dm.Usuarios.FieldByName('u_apel').asString;
          Senha_Ok       := True;
          F_menu.senha.caption := 'S';
          //Atualiza_His(DateToStr(Date), TimeToStr(Time), 'S', Dm.Usuarios.FieldByName('u_apel').asString, 'Liberação de data fora do prazo Diligência ' + F_baixaN.maskedit2.text + '.', F_baixaN.maskedit1.text);
        end
        else
        begin
          ShowMessage('USUÁRIO NÃO AUTORIZADO !');
        end;
      end
      else
      begin
        ShowMessage('Senha Incorreta !');
      end;
      Dm.Usuarios.Close;
    end;  
    Close;
  end;
end;

end.
