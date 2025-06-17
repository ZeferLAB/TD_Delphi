unit PDiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls;

type
  TF_PDiv = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PDiv: TF_PDiv;

implementation

{$R *.DFM}

procedure TF_PDiv.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) or (key = 27) then close;
end;

end.
