unit U_GradAverbacoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, jpeg, ExtCtrls, Buttons, Grids, DBGrids, Db, DBTables;

type
  TF_GradAverbacoes = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    ControlBar1: TControlBar;
    Label36: TLabel;
    StatusBar1: TStatusBar;
    qryRelatorio: TQuery;
    DsRelatorio: TDataSource;
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_GradAverbacoes: TF_GradAverbacoes;

implementation

{$R *.DFM}

procedure TF_GradAverbacoes.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.
