unit Logs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, jpeg;

type
  TF_Logs = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Memo1: TMemo;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Logs: TF_Logs;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_Logs.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Logs.BitBtn2Click(Sender: TObject);
begin
  Memo1.Clear;
  MaskEdit1.Text := '';
  MaskEdit1.SetFocus;
end;

procedure TF_Logs.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key =13 then bitbtn1.setfocus;
  if key = 27 then close;
end;

procedure TF_Logs.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('Nº do protocolo inválido.'), 'LOGS DAS IMAGENS', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Log_Dig.Close;
  Dm.Log_Dig.Sql.Clear;
  Dm.Log_Dig.Sql.Add('SELECT * FROM log_dig');
  Dm.Log_Dig.Sql.Add('WHERE');
  Dm.Log_Dig.Sql.Add('protocolo = ' + MaskEdit1.Text);
  Dm.Log_Dig.Open;
  if (Dm.Log_Dig.RecordCount = 0) then
  begin
    Dm.Log_Dig.Close;
    MessageBox(Handle, PChar('Protocolo não localizado.'), 'LOGS DAS IMAGENS', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Memo1.Lines.Clear;
  while (not Dm.Log_Dig.Eof) do
  begin
    Memo1.Lines.Add('Página ' + Dm.Log_Dig.FieldByName('pagina').asString + ' em ' + Dm.Log_Dig.FieldByName('data').asString + ' às ' + Dm.Log_Dig.FieldByName('hora').asString + ' por ' + Dm.Log_Dig.FieldByName('usuario').asstring + ' executou uma ' + Dm.Log_Dig.FieldByName('operacao').asstring);
    Dm.Log_Dig.Next;
  end;
  Dm.Log_Dig.Close;
end;

procedure TF_Logs.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

end.
