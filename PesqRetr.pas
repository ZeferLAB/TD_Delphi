unit PesqRetr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls;

type
  TF_PesqRetr = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    StatusBar1: TStatusBar;
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
  F_PesqRetr: TF_PesqRetr;

implementation

uses DMTD, Menu;

{$R *.DFM}

procedure TF_PesqRetr.BitBtn2Click(Sender: TObject);
begin
  Dm.Retroativo.Close;
  Close;
end;

procedure TF_PesqRetr.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_PesqRetr.FormActivate(Sender: TObject);
begin
  ComboBox1.SetFocus;
end;

procedure TF_PesqRetr.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_PesqRetr.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(Copy(ComboBox1.Text, 1, 2))) OR (StrToInt(Copy(ComboBox1.Text, 1, 2)) > 4) then
  begin
    MessageBox(Handle, PChar('Opção de pesquisa inválida !'), 'ERRO', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    MessageBox(Handle, PChar('Favor optar por uma opção válida !'), 'ERRO', MB_OK + MB_ICONWARNING);
    ComboBox1.SetFocus;
    Exit;                                
  end;
  Dm.Retroativo.Close;
  Dm.Retroativo.Sql.Clear;
  Dm.Retroativo.Sql.Add('SELECT * FROM td_cert');
  Dm.Retroativo.Sql.Add('WHERE');
  if (Copy(ComboBox1.Text, 1, 2) = '01') then
  begin
    if (Trim(MaskEdit1.Text) = '') then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você não deve deixar de digitar dados para a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.Retroativo.Sql.Add(' nome LIKE ' + Chr(39) + Trim(MaskEdit1.Text) + '%' + Chr(39));
    if F_Menu.cnpj <> '34377622000155' then
      Dm.Retroativo.Sql.Add(' AND retro = "X"');
    Dm.Retroativo.Sql.Add(' ORDER BY nome');
  end;
  if (Copy(ComboBox1.Text, 1, 2) = '02') then
  begin
    if (Trim(MaskEdit1.Text) = '') then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você não deve deixar de digitar dados para a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.Retroativo.Sql.Add(' p_auxiliar = ' + QuotedStr(Trim(MaskEdit1.Text)));
    if F_Menu.cnpj <> '34377622000155' then
      Dm.Retroativo.Sql.Add(' AND retro = "X"');
    Dm.Retroativo.Sql.Add(' ORDER BY p_auxiliar');
  end;
  if (Copy(ComboBox1.Text, 1, 2) = '03') then
  begin
    if (Trim(MaskEdit1.Text) = '') then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você não deve deixar de digitar dados para a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.Retroativo.Sql.Add(' registro =' + Chr(39) + Trim(MaskEdit1.Text)+ Chr(39));
    if F_Menu.cnpj <> '34377622000155' then
      Dm.Retroativo.Sql.Add(' AND retro = "X"');
    Dm.Retroativo.Sql.Add(' ORDER BY nome');
  end;
  if (Copy(ComboBox1.Text, 1, 2) = '04') then
  begin
    if (Trim(MaskEdit1.Text) = '') then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você não deve deixar de digitar dados para a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.Retroativo.Sql.Add(' doc1 LIKE ' + Chr(39) + Trim(MaskEdit1.Text) + '%' + Chr(39));
    if F_Menu.cnpj <> '34377622000155' then
      Dm.Retroativo.Sql.Add(' AND retro = "X"');
    Dm.Retroativo.Sql.Add(' ORDER BY nome');
  end;  

  Dm.Retroativo.Open;
  if (Dm.Retroativo.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('Dados não localizados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end
  else
    Close;
end;

end.
