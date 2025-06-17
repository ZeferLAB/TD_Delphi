unit ImagemDaje;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, AcroPDFLib_TLB;

type
  TfrmImagemDaje = class(TForm)
    AcroPDF1: TAcroPDF;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImagemDaje: TfrmImagemDaje;

implementation

{$R *.DFM}

end.
