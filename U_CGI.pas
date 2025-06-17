unit U_cgi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXCtrls;

type
  TF_Cgi = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DBText1: TDBText;
    Label1: TLabel;
    RxLabel1: TRxLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cgi: TF_Cgi;

implementation

uses DMTD;

{$R *.DFM}

procedure TF_Cgi.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TF_Cgi.FormActivate(Sender: TObject);
begin
 bitbtn1.setfocus;
end;

end.
