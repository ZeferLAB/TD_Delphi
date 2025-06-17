unit PosFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, Printers, Menus, jpeg;

type
  TF_PosFin = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PosFin: TF_PosFin;

implementation

uses DMTD, Menu, QkPosFin, FuncGeral;

{$R *.DFM}

procedure TF_PosFin.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

procedure TF_PosFin.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_PosFin.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_PosFin.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) AND (not ValidNumero(MaskEdit2.Text)) then
  begin
    MessageBox(Handle, PChar('Nº DO PROTOCOLO INVÁLIDO !'), 'POSIÇÃO', MB_OK + MB_ICONINFORMATION);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT p_auxiliar, protocolo, data_p, status, custas, deposito');
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

procedure TF_PosFin.BitBtn2Click(Sender: TObject);
begin
  Dm.ArqAux.FindFirst;
  Application.CreateForm(TQk_PosFin, Qk_PosFin);
  Qk_PosFin.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_PosFin.QrLabel2.Caption := F_Menu.Label11.Caption;
  Qk_PosFin.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_PosFin.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_PosFin.QrLabel5.Caption := 'POSIÇÃO FINANCEIRA DE PROTOCOLOS';
  Qk_PosFin.QuickRep1.Preview;
  Qk_PosFin.Destroy;
  Qk_PosFin := NIL;
end;

procedure TF_PosFin.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_PosFin.FormDestroy(Sender: TObject);
begin
  Dm.ArqAux.Close;
end;

end.
