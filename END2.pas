unit End2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, Printers, DBCtrls,
  ToolEdit, CurrEdit;

type
  TF_End2 = class(TForm)
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_End2  : TF_End2;
  locant   : String;
  valant   : Currency;

implementation

uses DMTD, Menu;

{$R *.DFM}

procedure TF_End2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 27 then close;  
end;

end.
