unit PCadNot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, ComCtrls, Buttons;

type
  TF_PCadNot = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PCadNot: TF_PCadNot;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_PCadNot.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_PCadNot.BitBtn2Click(Sender: TObject);
begin
  Dm.Notifica.Close;
  Close;
end;

procedure TF_PCadNot.BitBtn1Click(Sender: TObject);
var
  item, linha : String;
  VrDepR, VrDepA, VrCusR, VrCusA  : Currency;
begin
  if (not ValidNumero(Copy(ComboBox1.Text, 1, 2))) OR (StrToInt(Copy(ComboBox1.Text, 1, 2)) > 6) then
  begin
    MessageBox(Handle, PChar('Opção de pesquisa inválida !'), 'ERRO', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    MessageBox(Handle, PChar('Favor optar por uma opção válida !'), 'ERRO', MB_OK + MB_ICONWARNING);
    ComboBox1.SetFocus;
    Exit;
  end;
  if (StrToInt(Copy(ComboBox1.Text, 1, 2)) < 6) then
  begin
    if (not ValidNumero(MaskEdit1.Text)) then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você deve digitar apenas caracteres numéricos !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
  end
  else
  begin
    if (Trim(MaskEdit1.Text) = '') then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você não deve deixar de digitar dados para a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
  end;
  Dm.Notifica.Close;
  Dm.Notifica.Sql.Clear;
  Dm.Notifica.Sql.Add('SELECT * FROM notifica');
  Dm.Notifica.Sql.Add('WHERE');
  if (Copy(ComboBox1.Text, 1,2) = '01') then
  begin
    Dm.Notifica.Sql.Add('pauxiliar1 = ' + Trim(MaskEdit1.Text));
  end;
  if (Copy(ComboBox1.Text, 1,2) = '02') then
  begin
    Dm.Notifica.Sql.Add('protocolo1 = ' + Trim(MaskEdit1.Text));
  end;
  if (Copy(ComboBox1.Text, 1,2) = '03') then
  begin
    Dm.Notifica.Sql.Add('pauxiliar2 = ' + Trim(MaskEdit1.Text));
  end;
  if (Copy(ComboBox1.Text, 1,2) = '04') then
  begin
    Dm.Notifica.Sql.Add('protocolo2 = ' + Trim(MaskEdit1.Text));
  end;
  if (Copy(ComboBox1.Text, 1,2) = '05') then
  begin
    Dm.Notifica.Sql.Add('reg_cart = ' + Trim(MaskEdit1.Text));
  end;
  if (Copy(ComboBox1.Text, 1,2) = '06') then
  begin
    Dm.Notifica.Sql.Add('nom_cart like ' + Chr(39) + '%' + Trim(MaskEdit1.Text) + '%' + Chr(39));
  end;
  Dm.Notifica.Open;
  if (Dm.Notifica.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('Dados não localizados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end
  else Close;  
end;

procedure TF_PCadNot.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

end.
