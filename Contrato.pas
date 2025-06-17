unit Contrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, jpeg;

type
  TF_Cont = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel1: TBevel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cont: TF_Cont;

implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_Cont.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

procedure TF_Cont.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 pesq : string;
begin
  if key = 27 then close;
  if key = 13 then
  begin
    if (not ValidNumero(MaskEdit1.Text)) then
    begin
      MessageBox(Handle, PChar('ATENÇÃO - Digitar apenas caracteres numéricos !'), 'CONTRATO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT contrato, agencia');
    Dm.Td.Sql.Add('FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
    Dm.Td.Open;
    if (Dm.Td.RecordCount <> 0) then
    begin
      BitBtn1.Enabled := True;
      MaskEdit2.Text  := Dm.Td.FieldByName('contrato').asString;
      MaskEdit3.Text  := Dm.Td.FieldByName('agencia').asString;
      if (Trim(MaskEdit2.Text) <> '') and (Trim(MaskEdit3.Text) <> '') then BitBtn3.SetFocus
      else if (Trim(MaskEdit2.Text) <> '') then MaskEdit3.SetFocus else MaskEdit2.SetFocus;
    end
    else
    begin
      MessageBox(Handle, PChar('Protocolo auxiliar não encontrado !'), 'CONTRATO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
    end;
    Dm.Td.Close;
  end;
end;

procedure TF_Cont.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_Cont.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_Cont.BitBtn2Click(Sender: TObject);
begin

  close;
end;

procedure TF_Cont.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - Digitar apenas caracteres numéricos !'), 'CONTRATO', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;     
  end;
  Dm.Td.Close;
  Dm.Td.Sql.Clear;
  Dm.Td.Sql.Add('SELECT contrato, agencia');
  Dm.Td.Sql.Add('FROM td');
  Dm.Td.Sql.Add('WHERE');
  Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
  Dm.Td.Open;
  if (Dm.Td.RecordCount <> 0) then
  begin
    while (not Dm.Td.Eof) do
    begin
      Dm.Td.Edit;
      Dm.Td.FieldByName('contrato').asString := Trim(MaskEdit2.Text);
      Dm.Td.FieldByName('agencia').asString  := Trim(MaskEdit3.Text);
      Dm.Td.Post;
      Dm.Td.Next;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Gravação de nº de contrato e agência.(TABELA TD)', Trim(MaskEdit1.Text));    
  end;
  Dm.Td.Close;
  // Gravação no TD_CERT
  Dm.Td_Cert.Close;
  Dm.Td_Cert.Sql.Clear;
  Dm.Td_Cert.Sql.Add('SELECT contrato');
  Dm.Td_Cert.Sql.Add('FROM td_cert');
  Dm.Td_Cert.Sql.Add('WHERE');
  Dm.Td_Cert.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
  Dm.Td_Cert.Open;
  if (Dm.Td_Cert.RecordCount <> 0) then
  begin
    while (not Dm.Td_Cert.Eof) do
    begin
      Dm.Td_Cert.Edit;
      Dm.Td_Cert.FieldByName('contrato').asString := Trim(MaskEdit2.Text);
      Dm.Td_Cert.Post;
      Dm.Td_Cert.Next;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Gravação de nº de contrato.(TABELA TD_CERT)', Trim(MaskEdit1.Text));    
  end;
  Dm.Td_Cert.Close;
  BitBtn3.SetFocus;
  BitBtn1.Enabled := False;  
end;

procedure TF_Cont.BitBtn3Click(Sender: TObject);
begin
  MaskEdit1.Text := '';
  MaskEdit2.Text := '';
  MaskEdit3.Text := '';
  MaskEdit1.SetFocus;
end;

end.
