
unit WRecep2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  WPDefs, WPPrint, WpWinCtr, WPRich, StdCtrls, Buttons;

type
  TF_WRecep2 = class(TForm)
    WPRichText1: TWPRichText;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_WRecep2: TF_WRecep2;

implementation

uses Menu, cer_neg, RecepC;

{$R *.DFM}

procedure TF_WRecep2.BitBtn1Click(Sender: TObject);
begin
 //F_Menu.PrinterSetupDialog1.Execute;
  WPRichText1.Print;  
 close;
end;

end.
