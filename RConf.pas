unit RConf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers, jpeg;

type
  TF_RConf = class(TForm)
    Bevel3: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RConf: TF_RConf;

implementation

uses Menu, DMTD, QkRConf, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RConf.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RConf.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Text := '';
  MaskEdit2.Text := '';
  MaskEdit1.SetFocus;
end;

procedure TF_RConf.BitBtn1Click(Sender: TObject);
var
  arq : String;
  reg : Integer;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('Data Inválida.'), 'LISTAGEM DE CONFERÊNCIA', MB_OK + MB_ICONQUESTION);
    MaskEdit1.SetFocus;
    Exit;
  end;

  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT a.p_auxiliar, a.protocolo, a.registro, a.valor_base,');
  Dm.Join.Sql.Add('a.anotacao,');
  Dm.Join.Sql.Add('b.nome, b.tip_doc1, b.doc1, b.situacao');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
  Dm.Join.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('    a.data_p    = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.Join.Sql.Add('AND a.registro >= ' + Trim(MaskEdit2.Text));
  Dm.Join.Sql.Add('AND a.registro <= ' + Trim(MaskEdit3.Text));
  Dm.Join.Sql.Add('ORDER BY a.registro, b.recno');
  Dm.Join.Open;
  if (Dm.Join.RecordCount = 0) then
  begin
    Dm.Join.Close;
    MessageBox(Handle, PChar('Movimento não localizado.'), 'LISTAGEM DE CONFERÊNCIA', MB_OK + MB_ICONQUESTION);
    MaskEdit1.SetFocus;
    Exit;
  end;

  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ','','') + 'RELCONF';
  CriaTabela('RELCONF', arq);
  reg := 0;

  while (not Dm.Join.Eof) do
  begin
    if (reg <> Dm.Join.FieldByName('registro').asInteger) then
    begin
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
      Dm.ArqAux.Sql.Add('(indexador, protocolo, registro, nome, documento, valor, qualidade, anotacao)');
      Dm.ArqAux.Sql.Add('VALUES(');
      Dm.ArqAux.Sql.Add(Dm.Join.FieldByName('registro').asString  + ',');
      Dm.ArqAux.Sql.Add(Dm.Join.FieldByName('p_auxiliar').asString + ',');
      Dm.ArqAux.Sql.Add(Dm.Join.FieldByName('registro').asString + ',');
      Dm.ArqAux.Sql.Add(Chr(39) + TirarTudo(Dm.Join.FieldByName('nome').asString, Chr(39), '', '') + Chr(39) + ',');
      Dm.ArqAux.Sql.Add(Chr(39) + FormataDoc(Dm.Join.FieldByName('doc1').asString, Dm.Join.FieldByName('tip_doc1').asString) + Chr(39) + ',');
      Dm.ArqAux.Sql.Add(Chr(39) + StrCurr(Dm.Join.FieldByName('valor_base').asCurrency, 14, True) + Chr(39) + ',');
      Dm.ArqAux.Sql.Add(Chr(39) + Ver_Situacao(Dm.Join.FieldByName('situacao').asString, False) + Chr(39) + ',');
      Dm.ArqAux.Sql.Add(Chr(39) + Trim(Dm.Join.FieldByName('anotacao').asString) + Chr(39) + ')');
      Dm.ArqAux.ExecSQL;
    end
    else
    begin
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
      Dm.ArqAux.Sql.Add('(indexador, nome, documento, qualidade)');
      Dm.ArqAux.Sql.Add('VALUES(');
      Dm.ArqAux.Sql.Add(Dm.Join.FieldByName('registro').asString  + ',');
      Dm.ArqAux.Sql.Add(Chr(39) + TirarTudo(Dm.Join.FieldByName('nome').asString, Chr(39), '', '') + Chr(39) + ',');
      Dm.ArqAux.Sql.Add(Chr(39) + FormataDoc(Dm.Join.FieldByName('doc1').asString, Dm.Join.FieldByName('tip_doc1').asString) + Chr(39) + ',');
      Dm.ArqAux.Sql.Add(Chr(39) + Ver_Situacao(Dm.Join.FieldByName('situacao').asString, False) + Chr(39) + ')');
      Dm.ArqAux.ExecSQL;
    end;

    reg := Dm.Join.FieldByName('registro').asInteger;
    Dm.Join.Next;
  end;

  Dm.Join.Close;

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY recno');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    MessageBox(Handle, PChar('Problemas para carregar movimento.'), 'LISTAGEM DE CONFERÊNCIA', MB_OK + MB_ICONQUESTION);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Application.CreateForm(TQk_RConf, Qk_RConf);
  Qk_RConf.QrLabel1.Caption := F_Menu.Caption;
  Qk_RConf.QrLabel5.Caption := 'LISTAGEM PARA CONFERÊNCIA DE TÍTULOS REGISTRADOS NO DIA ' + MaskEdit1.Text;
  Qk_RConf.QuickRep1.Preview;
  Qk_RConf.Destroy;
  Qk_RConf := NIL;
  DestroeTabela(arq);
  BitBtn2Click(F_RConf);
end;

procedure TF_RConf.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_RConf.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then MaskEdit3.Setfocus;
end;

procedure TF_RConf.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(Date);
  MaskEdit1.SetFocus;
end;

procedure TF_RConf.MaskEdit2Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit2.Text)) then MaskEdit2.Text := '0';
end;

procedure TF_RConf.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure TF_RConf.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

end.
