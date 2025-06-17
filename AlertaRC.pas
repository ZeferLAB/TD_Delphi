unit AlertaRC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TF_AlertaRC = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    RichEdit1: TRichEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_AlertaRC: TF_AlertaRC;

implementation

{$R *.DFM}

procedure TF_AlertaRC.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TF_AlertaRC.FormActivate(Sender: TObject);
begin
  BitBtn1.setfocus;
end;

end.
