unit PesqLoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_PesqLoc = class(TForm)
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
  F_PesqLoc: TF_PesqLoc;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_PesqLoc.BitBtn2Click(Sender: TObject);
begin
  Dm.Local.Close;
  Close;
end;

procedure TF_PesqLoc.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_PesqLoc.FormActivate(Sender: TObject);
begin
  ComboBox1.SetFocus;
end;

procedure TF_PesqLoc.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_PesqLoc.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(Copy(ComboBox1.Text, 1, 2))) OR (StrToInt(Copy(ComboBox1.Text, 1, 2)) > 2) then
  begin
    MessageBox(Handle, PChar('Op��o de pesquisa inv�lida !'), 'ERRO', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    MessageBox(Handle, PChar('Favor optar por uma op��o v�lida !'), 'ERRO', MB_OK + MB_ICONWARNING);
    ComboBox1.SetFocus;
    Exit;
  end;
  Dm.Local.Close;
  Dm.Local.Sql.Clear;
  Dm.Local.Sql.Add('SELECT * FROM local');
  Dm.Local.Sql.Add('WHERE');
  if (Copy(ComboBox1.Text, 1, 2) = '01') then
  begin
    if (not ValidNumero(MaskEdit1.Text)) then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inv�lido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Voc� deve digitar apenas caracteres num�ricos !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;      
      Exit;
    end;
    Dm.Local.Sql.Add('cod = ' + Trim(MaskEdit1.Text));
  end;
  if (Copy(ComboBox1.Text, 1, 2) = '02') then
  begin
    if (Trim(MaskEdit1.Text) = '') then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inv�lido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Voc� n�o deve deixar de digitar dados para a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.Local.Sql.Add('local like ' + Chr(39) + Trim(MaskEdit1.Text) + '%' + Chr(39));
    Dm.Local.Sql.Add('ORDER BY local');
  end;
  Dm.Local.Open;
  if (Dm.Local.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('Dados n�o localizados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end
  else Close;  
end;

end.
