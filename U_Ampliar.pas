unit U_Ampliar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AxCtrls, OleCtrls, DbOleCtl, ImgeditLibCtl_TLB, StdCtrls;

type
  TF_Ampliar = class(TForm)
    ImgEdit1: TImgEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Ampliar: TF_Ampliar;

implementation

{$R *.DFM}

procedure TF_Ampliar.FormActivate(Sender: TObject);
begin
  ImgEdit1.Display;
  ImgEdit1.Fitto(1,true);
  ImgEdit1.Refresh;
end;

end.
