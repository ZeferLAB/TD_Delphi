unit PSta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TF_PSta = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PSta: TF_PSta;

implementation

{$R *.DFM}

procedure TF_PSta.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then close;
end;

procedure TF_PSta.FormActivate(Sender: TObject);
begin
  listbox1.setfocus;
end;

end.
