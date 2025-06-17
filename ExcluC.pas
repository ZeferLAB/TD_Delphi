unit ExcluC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, jpeg;

type
  TF_ExcluC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
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
  F_ExcluC: TF_ExcluC;

implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_ExcluC.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('Nº do pedido de certidão inválido.'), 'EXCLUSÃO DE CERTIDÃO', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT nr_protoc FROM certidao');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('nr_protoc = ' + MaskEdit1.Text);
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    MessageBox(Handle, PChar('Nº do pedido de certidão não encontrado.'), 'EXCLUSÃO DE CERTIDÃO', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  if (MessageBox(Handle, PChar('Confirma exclusão do pedido de certidão nº ' + MaskEdit1.Text + ' ?'), 'EXCLUSÃO DE CERTIDÃO', MB_YESNO	+ MB_ICONQUESTION + MB_DEFBUTTON2) = IDYes) then
  begin 
    // Excluindo Certidão
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('DELETE FROM certidao');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('nr_protoc = ' + MaskEdit1.Text);
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'Exclusão do pedido de certidão nº ' + MaskEdit1.Text + '(TABELA CERTIDÃO)', MaskEdit1.Text);
    except
      Exit;
    end;
    // Excluindo do Caixa
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('DELETE FROM caixa');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    protocolo = ' + MaskEdit1.Text);
    Dm.ArqAux.Sql.Add('AND tp_prot   = "C"'); 
    try
      Dm.ArqAux.ExecSql;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'Exclusão do pedido de certidão nº ' + MaskEdit1.Text + '(TABELA CAIXA)', MaskEdit1.Text);
    except
      Exit;
    end;
    MessageBox(Handle,PChar('Pedido excluído com sucesso. '),'EXCLUSÃO DE CERTIDÃO',MB_OK + MB_ICONWARNING);
  end
  else MessageBox(Handle,PChar('Exclusão cancelada. '),'EXCLUSÃO DE CERTIDÃO',MB_OK + MB_ICONWARNING);
  MaskEdit1.Clear;
  MaskEdit1.SetFocus;
end;

procedure TF_ExcluC.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.setfocus;
end;

procedure TF_ExcluC.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ExcluC.FormActivate(Sender: TObject);
begin
 MaskEdit1.SetFocus;
end;

procedure TF_ExcluC.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

end.
 
