unit ChecaB2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TF_ChecaBaixa2 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ChecaBaixa2: TF_ChecaBaixa2;

implementation

Uses DMTD;

{$R *.DFM}

procedure TF_ChecaBaixa2.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ChecaBaixa2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure TF_ChecaBaixa2.FormActivate(Sender: TObject);
begin
  DbGrid1.SetFocus;
end;

end.
