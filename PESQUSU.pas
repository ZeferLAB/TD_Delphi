unit PesqUsu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_PesqUsu = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PesqUsu: TF_PesqUsu;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_PesqUsu.BitBtn2Click(Sender: TObject);
begin
  Dm.Usuarios.Close;
  Close;
end;

procedure TF_PesqUsu.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_PesqUsu.FormActivate(Sender: TObject);
begin
  ComboBox1.SetFocus;
end;

procedure TF_PesqUsu.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_PesqUsu.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(Copy(ComboBox1.Text, 1, 2))) OR (StrToInt(Copy(ComboBox1.Text, 1, 2)) > 1) then
  begin
    MessageBox(Handle, PChar('Opção de pesquisa inválida !'), 'ERRO', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    MessageBox(Handle, PChar('Favor optar por uma opção válida !'), 'ERRO', MB_OK + MB_ICONWARNING);
    ComboBox1.SetFocus;
    Exit;
  end;
  Dm.Usuarios.Close;
  Dm.Usuarios.Sql.Clear;
  Dm.Usuarios.Sql.Add('SELECT * FROM usuarios');
  Dm.Usuarios.Sql.Add('WHERE');
  if (Copy(ComboBox1.Text, 1, 2) = '01') then
  begin
    if (Trim(MaskEdit1.Text) = '') then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você não deve deixar de digitar dados para a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.Usuarios.Sql.Add('u_apel like ' + Chr(39) + Trim(MaskEdit1.Text) + '%' + Chr(39));
    Dm.Usuarios.Sql.Add('ORDER BY u_apel');
  end;
  Dm.Usuarios.Open;
  if (Dm.Usuarios.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('Dados não localizados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end
  else Close;  
end;

end.
