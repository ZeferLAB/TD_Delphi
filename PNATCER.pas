unit PNatCer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_PNatCer = class(TForm)
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
  F_PNatCer: TF_PNatCer;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_PNatCer.BitBtn2Click(Sender: TObject);
begin
  Dm.NatCer.Close;
  Close;
end;

procedure TF_PNatCer.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_PNatCer.FormActivate(Sender: TObject);
begin
  ComboBox1.SetFocus;
end;

procedure TF_PNatCer.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_PNatCer.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(Copy(ComboBox1.Text, 1, 2))) OR (StrToInt(Copy(ComboBox1.Text, 1, 2)) > 2) then
  begin
    MessageBox(Handle, PChar('Opção de pesquisa inválida !'), 'ERRO', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    MessageBox(Handle, PChar('Favor optar por uma opção válida !'), 'ERRO', MB_OK + MB_ICONWARNING);
    ComboBox1.SetFocus;
    Exit;
  end;
  Dm.NatCer.Close;
  Dm.NatCer.Sql.Clear;
  Dm.NatCer.Sql.Add('SELECT * FROM natcer');
  Dm.NatCer.Sql.Add('WHERE');
  if (Copy(ComboBox1.Text, 1, 2) = '01') then
  begin
    if (not ValidNumero(MaskEdit1.Text)) then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você deve digitar apenas caracteres numéricos !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.NatCer.Sql.Add('cod = ' + Trim(MaskEdit1.Text));
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
    Dm.NatCer.Sql.Add('natcer like ' + Chr(39) + Trim(MaskEdit1.Text) + '%' + Chr(39));
    Dm.NatCer.Sql.Add('ORDER BY natureza');
  end;
  Dm.NatCer.Open;
  if (Dm.NatCer.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('Dados não localizados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end
  else Close;  
end;

end.
