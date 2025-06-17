unit ALERTA1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TF_Alerta1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Alerta1: TF_Alerta1;

implementation

{$R *.DFM}

procedure TF_Alerta1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
