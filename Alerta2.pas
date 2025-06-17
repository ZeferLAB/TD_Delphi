unit Alerta2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TF_Alerta2 = class(TForm)
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
  F_Alerta2: TF_Alerta2;

implementation

{$R *.DFM}

procedure TF_Alerta2.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
