unit QGrafico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, TeeProcs, TeEngine;

type
  TQk_Grafico = class(TForm)
    QuickRep1: TQuickRep;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_Grafico: TQk_Grafico;

implementation

USES DMTD;

{$R *.DFM}

end.
