unit TrocaC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, ToolEdit, CurrEdit, jpeg;

type
  TF_TrocaC = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel3: TPanel;
    Label13: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    MaskEdit6: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MaskEdit2: TMaskEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Limpa_Tela(Sender : TOBject);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_TrocaC: TF_TrocaC;

implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_TrocaC.Limpa_Tela(Sender : TOBject);
begin
  Panel3.Enabled      := False;
  Label3.Caption      := '';
  Label5.Caption      := '';
  Label7.Caption      := '';
  Label9.Caption      := '';
  MaskEdit1.Text      := '';
  CurrencyEdit1.Value := 0.00;
  CurrencyEdit2.Value := 0.00;
  MaskEdit2.Text      := '';
  MaskEdit6.Text      := '';
end;

procedure TF_TrocaC.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_TrocaC.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_TrocaC.BitBtn2Click(Sender: TObject);
begin
  Limpa_Tela(F_TrocaC);
  MaskEdit1.Enabled := True;
  MaskEdit1.SetFocus;
end;

procedure TF_TrocaC.BitBtn1Click(Sender: TObject);
begin
  if (Trim(MaskEdit1.Text) = '') OR (not ValidNumero(MaskEdit1.Text)) then
  begin
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Certidao.Close;
  Dm.Certidao.Sql.Clear;
  Dm.Certidao.Sql.Add('SELECT * FROM certidao');
  Dm.Certidao.Sql.Add('WHERE');
  Dm.Certidao.Sql.Add('nr_protoc = ' + Trim(MaskEdit1.Text));
  Dm.Certidao.Open;
  if (Dm.Certidao.RecordCount = 0) then
  begin
    Dm.Td.Close;
    MessageBox(Handle, PChar('Protocolo auxiliar não localizado.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
    BitBtn2Click(F_TrocaC);
    Exit;
  end;
  MaskEdit1.Enabled   := False;
  Panel3.Enabled      := True;
  Label3.caption      := Dm.Certidao.fieldbyname('status').asstring;
  Label5.caption      := Dm.Certidao.fieldbyname('data').asstring;
  Label7.caption      := Dm.Certidao.fieldbyname('apresentan').asstring;
  Label9.caption      := Dm.Certidao.fieldbyname('natureza').asstring;
  CurrencyEdit1.Value := Dm.Certidao.FieldByName('deposito').asCurrency;
  MaskEdit2.Text      := Dm.Certidao.FieldByName('apresentan').asString;
  CurrencyEdit2.SetFocus;
end;

procedure TF_TrocaC.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then SpeedButton1Click(F_TrocaC);
end;

procedure TF_TrocaC.CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_TrocaC.SpeedButton1Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Iniciar rotina de troca ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDNo) then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - CANCELADA EXECUÇÃO DA ROTINA DE TROCA.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
    BitBtn2Click(F_TrocaC);
    Exit;
  end;
  // valor do depósito
  if (CurrencyEdit2.Value > 0) then
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE certidao SET');
    Dm.ArqAux.Sql.Add('deposito = ' + StrCurrPesq(CurrencyEdit2.Value));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('nr_protoc = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'Trocado valor do depósito do pedido de certidão nº ' + Trim(MaskEdit1.Text) + ' de ' + CurrencyEdit1.DisplayText  + ' para ' + CurrencyEdit2.DisplayText + '(CERTIDÃO).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do valor do depósito do pedido de certidão nº ' + Trim(MaskEdit1.Text) + ' de ' + CurrencyEdit1.DisplayText  + ' para ' + CurrencyEdit2.DisplayText + '(CERTIDÃO).', Trim(MaskEdit1.Text));
    end;
  end;
  // nome do apresentante
  if (Trim(MaskEdit6.Text) <> '') then
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('UPDATE certidao SET');
    Dm.ArqAux.Sql.Add('apresentan = ' + Chr(39) + Trim(MaskEdit6.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('nr_protoc = ' + Trim(MaskEdit1.Text));
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'Trocado o nome do apresentante de ' + Trim(MaskEdit2.Text) + ' para ' + Trim(MaskEdit6.Text) + '(CERTIDÃO).', Trim(MaskEdit1.Text));
    except
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'Problemas para efetuar a troca do nome do apresentante de ' + Trim(MaskEdit2.Text) + ' para ' + Trim(MaskEdit6.Text) + '(CERTIDÃO).', Trim(MaskEdit1.Text));
    end;
  end;
  ShowMessage('Troca efetuada.');
  BitBtn2Click(F_TrocaC);
end;

procedure TF_TrocaC.FormActivate(Sender: TObject);
begin
  Limpa_Tela(F_TrocaC);
  MaskEdit1.SetFocus;
end;

end.
