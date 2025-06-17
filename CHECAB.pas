unit ChecaB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TF_ChecaBaixa = class(TForm)
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
  F_ChecaBaixa: TF_ChecaBaixa;

implementation

Uses DMTD;

{$R *.DFM}

procedure TF_ChecaBaixa.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ChecaBaixa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure TF_ChecaBaixa.FormActivate(Sender: TObject);
begin
  DbGrid1.SetFocus;
end;

end.
