unit Tel_Avi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TF_TelAviso = class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
//    procedure BitBtn2Click(Sender: TObject);
//    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    respo : boolean;
    sim   : boolean;    
  end;

var

  F_TelAviso: TF_TelAviso;


implementation

{$R *.DFM}

procedure TF_TelAviso.BitBtn1Click(Sender: TObject);
begin
//  Respo  := True;
  close;
end;

procedure TF_TelAviso.FormActivate(Sender: TObject);
begin
  if (UpperCase(Label1.Caption) = 'TRUE') then
  begin
    BitBtn1.SetFocus;
  end
  else
  begin
    Panel1.SetFocus;
  end;  
end;

end.
