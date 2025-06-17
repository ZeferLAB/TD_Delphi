unit U_Protocolo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  WPDefs, WPPrint, WpWinCtr, WPRich, StdCtrls, Buttons;

type
  TVProtocolo = class(TForm)
    WPRichText1: TWPRichText;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VProtocolo: TVProtocolo;

implementation

{$R *.DFM}



procedure TVProtocolo.FormShow(Sender: TObject);
begin
  WPRichText1.SetFocus;
end;

procedure TVProtocolo.BitBtn1Click(Sender: TObject);
begin
  WPRichText1.PrintDialog;
end;

end.
