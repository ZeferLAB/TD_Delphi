unit Recende;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls;

type
  TF_Recende = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Recende: TF_Recende;

implementation

Uses DMTD;

{$R *.DFM}

procedure TF_Recende.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) or (key = 27) then close;
end;

procedure TF_Recende.FormDestroy(Sender: TObject);
begin
  Dm.Escrit.Close;
end;

procedure TF_Recende.FormActivate(Sender: TObject);
begin
  Dm.Escrit.Close;
  Dm.Escrit.Sql.Clear;
  Dm.Escrit.Sql.Add('SELECT * FROM escrit');
  Dm.Escrit.Sql.Add('ORDER BY escritorio');
  Dm.Escrit.Open;
end;

end.
