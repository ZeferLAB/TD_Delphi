unit Cor_distr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, ExtCtrls, jpeg;

type
  TF_CorDistr = class(TForm)
    ControlBar1: TControlBar;
    Label36: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CorDistr: TF_CorDistr;

implementation

uses DMTD;

{$R *.DFM}

procedure TF_CorDistr.SpeedButton1Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Iniciar Correção ?'), 'Siscart', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
  begin
    DM.TD.Close;
    DM.TD.Sql.Clear;
    DM.TD.Sql.Add('UPDATE td SET');
    DM.TD.Sql.Add(' v_subtotal = v_subtotal - 2.32');
    DM.TD.Sql.Add(' WHERE data_r >= ' + QuotedStr(MaskEdit1.Text) + ' and data_r <= ' + QuotedStr(MaskEdit2.Text));
    DM.TD.ExecSQL;

    ShowMessage('Foram corrigidos ' + IntToStr(DM.TD.RowsAffected) + ' protocolos !!!');
  end
end;

procedure TF_CorDistr.SpeedButton2Click(Sender: TObject);
begin
  Self.MaskEdit1.Clear;
  Self.MaskEdit2.Clear;
end;

procedure TF_CorDistr.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

procedure TF_CorDistr.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CorDistr.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

end.
