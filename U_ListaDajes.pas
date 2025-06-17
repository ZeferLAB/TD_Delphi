unit U_ListaDajes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, QuickRpt;

type
  TF_ListaDajes = class(TForm)
    StatusBar1: TStatusBar;
    QuickRep1: TQuickRep;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ListaDajes: TF_ListaDajes;

implementation

{$R *.DFM}

end.
