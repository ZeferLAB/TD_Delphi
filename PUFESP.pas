unit PUfesp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_PUfesp = class(TForm)
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
    procedure ComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PUfesp: TF_PUfesp;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_PUfesp.BitBtn2Click(Sender: TObject);
begin
  Dm.Local.Close;
  Close;
end;

procedure TF_PUfesp.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_PUfesp.FormActivate(Sender: TObject);
begin
  ComboBox1.SetFocus;
end;

procedure TF_PUfesp.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_PUfesp.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(Copy(ComboBox1.Text, 1, 2))) OR (StrToInt(Copy(ComboBox1.Text, 1, 2)) > 1) then
  begin
    MessageBox(Handle, PChar('Opção de pesquisa inválida !'), 'ERRO', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    MessageBox(Handle, PChar('Favor optar por uma opção válida !'), 'ERRO', MB_OK + MB_ICONWARNING);
    ComboBox1.SetFocus;
    Exit;
  end;
  Dm.Ufesp.Close;
  Dm.Ufesp.Sql.Clear;
  Dm.Ufesp.Sql.Add('SELECT * FROM ufesp');
  Dm.Ufesp.Sql.Add('WHERE');
  if (Copy(ComboBox1.Text, 1, 2) = '01') then
  begin
    if (not ValidData(MaskEdit1.Text)) then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você deve digitar uma data válida !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;      
      Exit;
    end;
    Dm.Ufesp.Sql.Add('data = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  end;
  Dm.Ufesp.Open;
  if (Dm.Ufesp.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('Dados não localizados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end
  else Close;  
end;

procedure TF_PUfesp.ComboBox1Exit(Sender: TObject);
begin
  if (ValidNumero(Copy(ComboBox1.Text, 1,2))) then
  begin
    if (StrToInt(Copy(ComboBox1.Text, 1,2)) = 1) then
    begin
      MaskEdit1.Width    := 90;
      MaskEdit1.EditMask := '99/99/9999';
    end
    else
    begin
      MaskEdit1.Width    := 329;
      MaskEdit1.EditMask := '';
    end;
  end;  
end;

end.
