unit imp_fic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, Printers;

type
  TF_ImpFic = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ImpFic: TF_ImpFic;

implementation

uses DMTD, QkImpFic, Menu, FuncGeral;

{$R *.DFM}

procedure TF_ImpFic.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  MaskEdit1.SetFocus;
end;

procedure TF_ImpFic.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_ImpFic.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_ImpFic.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

procedure TF_ImpFic.BitBtn1Click(Sender: TObject);
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - DATA INVÁLIDA !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  if (not ValidData(MaskEdit2.Text)) then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - DATA INVÁLIDA !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
    MaskEdit2.SetFocus;
    Exit;
  end;
  Dm.Fichario.Close;
  Dm.Fichario.Sql.Clear;
  Dm.Fichario.Sql.Add('SELECT * FROM fichario');
  Dm.Fichario.Sql.Add('WHERE');
  Dm.Fichario.Sql.Add('    data >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.Fichario.Sql.Add('AND data <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.Fichario.Open;
  if (Dm.Fichario.RecordCount = 0) then
  begin
    Dm.Fichario.Close;
    MessageBox(Handle, PChar('ATENÇÃO - MOVIMENTO NÃO LOCALIZADO !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
//  QrDestroi;
  Application.CreateForm(TQk_ImpFic, Qk_ImpFic);
  Qk_ImpFic.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_ImpFic.QrLabel2.Caption := F_Menu.Label11.Caption;
  Qk_ImpFic.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_ImpFic.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_ImpFic.QrLabel5.Caption := 'IMPRESSÃO DOS FICHÁRIOS';
  Qk_ImpFic.QuickRep1.Preview;
  Qk_ImpFic.Destroy;
  Qk_ImpFic := NIL;
end;

procedure TF_ImpFic.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.
