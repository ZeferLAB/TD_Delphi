unit CadCertificos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, WPDefs, WPPrint, WpWinCtr, WPRich,
  NcsAlignment, ComCtrls, Mask, Grids, DBGrids,DMT;

type
  TfrmCadCertificos = class(TForm)
    Panel1: TPanel;
    btnIncluir: TBitBtn;
    btneditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnRetornar: TBitBtn;
    btnAvancar: TBitBtn;
    btnSair: TBitBtn;
    Panel2: TPanel;
    RichEdit1: TRichEdit;
    NcsAlignment1: TNcsAlignment;
    btnJustificar: TBitBtn;
    RichEdit2: TRichEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    mskDescricao: TMaskEdit;
    DBGrid1: TDBGrid;
    procedure btnSairClick(Sender: TObject);
    procedure btnJustificarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure mskDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btneditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCertificos: TfrmCadCertificos;
  _recno : String;

implementation



{$R *.DFM}


procedure TfrmCadCertificos.btnSairClick(Sender: TObject);
begin
  DM_IMG.qryCertificados.Close;
  Close;
end;

procedure TfrmCadCertificos.btnJustificarClick(Sender: TObject);
var
  x : Integer;
begin
  NcsAlignment1.Width := 65;
  RichEdit2.Clear;
  for x := 0 to RichEdit1.Lines.Count do
  Begin
    Edit1.Text := RichEdit1.Lines.Strings[x];
    if (pos(Copy(Edit1.Text, length(edit1.text), 1), '.:') = 0) and (length(edit1.Text) > (65/2)) then
    Begin
      NcsAlignment1.Text := Edit1.Text;
      Edit2.text := NcsAlignment1.Result;
    end
    else
    begin
      Edit2.Text := Edit1.Text;
    end;
    RichEdit2.Lines.Add(Edit2.Text);
  end;

  RichEdit1.Clear;
  for x := 0 to RichEdit2.Lines.Count do RichEdit1.Lines.Add(RichEdit2.Lines.strings[x]);

end;

procedure TfrmCadCertificos.btnIncluirClick(Sender: TObject);
begin
  if frmCadCertificos.btnIncluir.Caption = '&Incluir' then
  begin
    frmCadCertificos.btnIncluir.Caption  := '&Salvar';
    frmCadCertificos.btnEditar.Enabled   := False;
    frmCadCertificos.btnExcluir.Enabled  := False;
    frmCadCertificos.btnRetornar.Enabled := False;
    frmCadCertificos.btnAvancar.Enabled  := False;
    frmCadCertificos.btnSair.Enabled     := False;
    frmCadCertificos.Panel2.Enabled      := True;
    frmCadCertificos.mskDescricao.Text   := '';
    frmCadCertificos.mskDescricao.SetFocus;
  end
  else
  begin
    if application.messagebox('Salvar Modelo ?','Certifico', mb_yesno + MB_ICONQUESTION) = mrYes then
    begin
      DM_IMG.qryAuxCertificados.Active := False;
      DM_IMG.qryAuxCertificados.Sql.Clear;
      DM_IMG.qryAuxCertificados.Sql.Add('INSERT INTO certificos (descricao, texto) ');
      DM_IMG.qryAuxCertificados.Sql.Add('VALUES (');
      DM_IMG.qryAuxCertificados.Sql.Add(#39 + Trim(frmCadCertificos.mskDescricao.Text) + #39 + ', ');
      DM_IMG.qryAuxCertificados.Sql.Add(#39 + Trim(frmCadCertificos.RichEdit1.Text) + #39 + ') ');
      DM_IMG.qryAuxCertificados.ExecSql;
    end;
    
    frmCadCertificos.btnIncluir.Caption  := '&Incluir';
    frmCadCertificos.btnEditar.Enabled   := True;
    frmCadCertificos.btnExcluir.Enabled  := True;
    frmCadCertificos.btnRetornar.Enabled := True;
    frmCadCertificos.btnAvancar.Enabled  := True;
    frmCadCertificos.btnSair.Enabled     := True;
    frmCadCertificos.Panel2.Enabled      := False;
    DM_IMG.qryCertificados.Active := False;
    DM_IMG.qryCertificados.Sql.Clear;
    DM_IMG.qryCertificados.Sql.Add('SELECT * FROM certificos ORDER BY descricao');
    DM_IMG.qryCertificados.Active := True;
    DM_IMG.qryCertificados.Locate('descricao', Trim(frmCadCertificos.mskDescricao.Text), []);
    frmCadCertificos.mskDescricao.Text := DM_IMG.qryCertificados.FieldByName('descricao').AsString;
    frmCadCertificos.RichEdit1.Text := DM_IMG.qryCertificados.FieldByName('texto').AsString;
    frmCadCertificos.btnIncluir.SetFocus;
  end;
end;

procedure TfrmCadCertificos.mskDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then frmCadCertificos.RichEdit1.SetFocus;
end;

procedure TfrmCadCertificos.btneditarClick(Sender: TObject);
begin
  if frmCadCertificos.btnEditar.Caption = '&Editar' then
  begin
    _recno := DM_IMG.qryCertificados.FieldByName('recno').AsString;
    frmCadCertificos.btnEditar.Caption  := '&Salvar';
    frmCadCertificos.btnIncluir.Enabled  := False;
    frmCadCertificos.btnExcluir.Enabled  := False;
    frmCadCertificos.btnRetornar.Enabled := False;
    frmCadCertificos.btnAvancar.Enabled  := False;
    frmCadCertificos.btnSair.Enabled     := False;
    frmCadCertificos.Panel2.Enabled      := True;
    frmCadCertificos.mskDescricao.SetFocus;
  end
  else
  begin
    if application.messagebox('Salvar Alteração ?','Certifico', mb_yesno + MB_ICONQUESTION) = mrYes then
    begin
      DM_IMG.qryAuxCertificados.Active := False;
      DM_IMG.qryAuxCertificados.Sql.Clear;
      DM_IMG.qryAuxCertificados.Sql.Add('UPDATE certificos SET ');
      DM_IMG.qryAuxCertificados.Sql.Add('descricao = ' + #39 + Trim(frmCadCertificos.mskDescricao.Text) + #39 + ', ');
      DM_IMG.qryAuxCertificados.Sql.Add('texto = ' + #39 + Trim(frmCadCertificos.RichEdit1.Text) + #39 + ' ');
      DM_IMG.qryAuxCertificados.Sql.Add('WHERE recno = ' + #39 + _recno + #39);
      DM_IMG.qryAuxCertificados.ExecSql;
    end;
    frmCadCertificos.btnEditar.Caption   := '&Editar';
    frmCadCertificos.btnIncluir.Enabled  := True;
    frmCadCertificos.btnExcluir.Enabled  := True;
    frmCadCertificos.btnRetornar.Enabled := True;
    frmCadCertificos.btnAvancar.Enabled  := True;
    frmCadCertificos.btnSair.Enabled     := True;
    frmCadCertificos.Panel2.Enabled      := False;
    DM_IMG.qryCertificados.Active := False;
    DM_IMG.qryCertificados.Sql.Clear;
    DM_IMG.qryCertificados.Sql.Add('SELECT * FROM certificos ORDER BY descricao');
    DM_IMG.qryCertificados.Active := True;
    DM_IMG.qryCertificados.Locate('recno', _recno, []);
    frmCadCertificos.mskDescricao.Text := DM_IMG.qryCertificados.FieldByName('descricao').AsString;
    frmCadCertificos.RichEdit1.Text := DM_IMG.qryCertificados.FieldByName('texto').AsString;
    frmCadCertificos.btnEditar.SetFocus;
  end;
end;

procedure TfrmCadCertificos.btnExcluirClick(Sender: TObject);
begin
  if application.messagebox('Confirma Exclusão deste Modelo ?','EXCLUSÃO', mb_yesno + MB_ICONWARNING) = mrYes then
  begin
    DM_IMG.qryAuxCertificados.Active := False;
    DM_IMG.qryAuxCertificados.Sql.Clear;
    DM_IMG.qryAuxCertificados.Sql.Add('DELETE FROM certificos ');
    DM_IMG.qryAuxCertificados.Sql.Add('WHERE recno = ' + #39 + DM_IMG.qryCertificados.FieldByName('recno').AsString + #39);
    DM_IMG.qryAuxCertificados.ExecSql;
    DM_IMG.qryCertificados.Active := False;
    DM_IMG.qryCertificados.Sql.Clear;
    DM_IMG.qryCertificados.Sql.Add('SELECT * FROM certificos ORDER BY descricao');
    DM_IMG.qryCertificados.Active := True;
    frmCadCertificos.mskDescricao.Text := DM_IMG.qryCertificados.FieldByName('descricao').AsString;
    frmCadCertificos.RichEdit1.Text := DM_IMG.qryCertificados.FieldByName('texto').AsString;
  end;
end;

procedure TfrmCadCertificos.btnRetornarClick(Sender: TObject);
begin
  DM_IMG.qryCertificados.Prior;
  frmCadCertificos.mskDescricao.Text := DM_IMG.qryCertificados.FieldByName('descricao').AsString;
  frmCadCertificos.RichEdit1.Text := DM_IMG.qryCertificados.FieldByName('texto').AsString;
end;

procedure TfrmCadCertificos.btnAvancarClick(Sender: TObject);
begin
  DM_IMG.qryCertificados.Next;
  frmCadCertificos.mskDescricao.Text := DM_IMG.qryCertificados.FieldByName('descricao').AsString;
  frmCadCertificos.RichEdit1.Text := DM_IMG.qryCertificados.FieldByName('texto').AsString;
end;

procedure TfrmCadCertificos.FormActivate(Sender: TObject);
begin
  Application.CreateForm(TDM_IMG,DM_IMG);
  DM_IMG.qryCertificados.Active := False;
  DM_IMG.qryCertificados.Sql.Clear;
  DM_IMG.qryCertificados.Sql.Add('SELECT * FROM certificos ORDER BY descricao');
  DM_IMG.qryCertificados.Active := True;
  frmCadCertificos.mskDescricao.Text := DM_IMG.qryCertificados.FieldByName('descricao').AsString;
  frmCadCertificos.RichEdit1.Text := DM_IMG.qryCertificados.FieldByName('texto').AsString;
end;

end.
