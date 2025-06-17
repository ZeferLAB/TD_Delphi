unit PesqP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, jpeg, ExtCtrls;

type
  TF_PesqP = class(TForm)
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PesqP: TF_PesqP;

implementation

Uses DMTD;

{$R *.DFM}

procedure TF_PesqP.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_PesqP.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_PesqP.BitBtn3Click(F_PesqP);
end;

end.
