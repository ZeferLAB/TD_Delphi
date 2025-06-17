unit U_ExcluN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, jpeg;

type
  TF_ExcluN = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    MaskEdit1: TMaskEdit;
    Bevel2: TBevel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ExcluN: TF_ExcluN;

implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_ExcluN.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) OR (MaskEdit1.Text = '0') then
  begin
    MessageBox(Handle, PChar('Nº do recibo inválido.'), 'EXCLUSÃO DE TÍTULOS', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT recibo FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('recibo = ' + MaskEdit1.Text);
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('Nº do recibo não encontrado.'), 'EXCLUSÃO DE TÍTULOS', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  if (MessageBox(Handle, PChar('Confirma exclusão do título recepcionado sob o nº ' + MaskEdit1.Text + ' ?'), 'EXCLUSÃO DE TÍTULO', MB_YESNO	+ MB_ICONQUESTION + MB_DEFBUTTON2) = IDYes) then
  begin
    // Excluindo TD
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('DELETE FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('recibo = ' + MaskEdit1.Text);
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Exclusão do Recibo nº ' + MaskEdit1.Text + '(TABELA TD)', MaskEdit1.Text);
    except
      Exit;
    end;
    // Excluindo Td_Pesso
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('DELETE FROM td_pesso');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('recibo = ' + MaskEdit1.Text);
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Exclusão do Recibo nº ' + MaskEdit1.Text + '(TABELA TD_PESSO)', MaskEdit1.Text);
    except
      Exit;
    end;
    // Excluindo Td_Cert
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('DELETE FROM td_cert');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('recibo = ' + MaskEdit1.Text);
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Exclusão do Recibo nº ' + MaskEdit1.Text + '(TABELA TD_CERT)', MaskEdit1.Text);
    except
      Exit;
    end;

    // Excluindo Td_Pedid
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('DELETE FROM td_pedid');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('recibo = ' + MaskEdit1.Text);
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Exclusão do Recibo nº ' + MaskEdit1.Text + '(TABELA TD_PEDID)', MaskEdit1.Text);
    except
      Exit;
    end;

    //Exclusao TD_MOV
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('DELETE FROM td_mov');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + MaskEdit1.Text);
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Exclusão do Recibo nº ' + MaskEdit1.Text + '(TABELA TD)', MaskEdit1.Text);
    except
      Exit;
    end;
    // Excluindo do Caixa
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('DELETE FROM caixa');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    protocolo = ' + MaskEdit1.Text);
    Dm.ArqAux.Sql.Add('AND tp_prot   = "T"');
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Exclusão do Recibo nº ' + MaskEdit1.Text + '(TABELA CAIXA)', MaskEdit1.Text);
    except
      Exit;
    end;
    MessageBox(Handle,PChar('Protocolo excluído com sucesso. '),'EXCLUSÃO DE TÍTULOS',MB_OK + MB_ICONWARNING);
  end
  else MessageBox(Handle,PChar('Exclusão cancelada. '),'EXCLUSÃO DE TÍTULOS',MB_OK + MB_ICONWARNING);
  MaskEdit1.Clear;
  MaskEdit1.SetFocus;
end;

procedure TF_ExcluN.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.setfocus;
end;

procedure TF_ExcluN.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ExcluN.FormActivate(Sender: TObject);
begin
 MaskEdit1.SetFocus;
end;

procedure TF_ExcluN.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

end.
