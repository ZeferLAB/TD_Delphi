unit TRecep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_TelaRecep = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn3: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_TelaRecep: TF_TelaRecep;

implementation

Uses Menu, FuncGeral;

{$R *.DFM}

procedure TF_TelaRecep.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := IntToStr(cert_vias);
  MaskEdit1.SetFocus;
end;

procedure TF_TelaRecep.BitBtn3Click(Sender: TObject);
begin
  MaskEdit1.Text := '0';
  Close;
end;

procedure TF_TelaRecep.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TF_TelaRecep.MaskEdit1Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then MaskEdit1.Text := '0';
end;

procedure TF_TelaRecep.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Close;
end;

end.
