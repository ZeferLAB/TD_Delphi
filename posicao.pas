unit posicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Mask, ExtCtrls, Printers, Menus;

type
  TF_Pos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Pos: TF_Pos;

implementation

uses DMTD, Loc, Menu, QkPos, FuncGeral ;

{$R *.DFM}

procedure TF_Pos.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Pos.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_Pos.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Pos.FormActivate(Sender: TObject);
begin

  MaskEdit1.SetFocus;
end;

procedure TF_Pos.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) AND (not ValidNumero(MaskEdit2.Text)) then
  begin
    MessageBox(Handle, PChar('Nº DO PROTOCOLO INVÁLIDO !'), 'POSIÇÃO', MB_OK + MB_ICONINFORMATION);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT p_auxiliar, protocolo, data_p, status, data_d, ext_nat');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    protocolo >= ' + Trim(MaskEdit1.Text));
  Dm.ArqAux.Sql.Add('AND protocolo <= ' + Trim(MaskEdit2.Text));
  Dm.ArqAux.Sql.Add('ORDER BY protocolo');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    DbGrid1.SetFocus;
  end
  else
  begin
    Dm.ArqAux.Close;
    MessageBox(Handle, PChar('MOVIMENTO NÃO ENCONTRADO !'), 'POSIÇÃO', MB_OK + MB_ICONINFORMATION);
    MaskEdit1.SetFocus;
  end;
end;

procedure TF_Pos.BitBtn3Click(Sender: TObject);
begin
  Dm.ArqAux.FindFirst;
  Application.CreateForm(TQk_Pos, Qk_Pos);
  Qk_Pos.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_Pos.QrLabel2.Caption := F_Menu.Label11.Caption;
  Qk_Pos.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_Pos.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_Pos.QrLabel5.Caption := 'POSIÇÃO DE PROTOCOLOS';
  Qk_Pos.QuickRep1.Preview;
  Qk_Pos.Destroy;
  Qk_Pos := NIL;
end;

procedure TF_Pos.BitBtn4Click(Sender: TObject);
begin
  if (not Permissao('acesso023')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(TF_Loc, F_Loc);
  F_Loc.Maskedit1.Text := Dm.ArqAux.FieldByName('protocolo').asString;
  F_Loc.Label5.Caption := 'sim';
  F_Loc.Showmodal;
  F_Loc.Destroy;
  F_Loc := NIL;
end;

procedure TF_Pos.FormDestroy(Sender: TObject);
begin
  Dm.ArqAux.Close;
end;

end.
