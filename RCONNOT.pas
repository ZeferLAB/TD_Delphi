unit RConNot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_RConNot = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RConNot: TF_RConNot;

implementation

uses QkRCNot;

{$R *.DFM}

procedure TF_RConNot.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RConNot.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RConNot.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TQk_RConNot, Qk_RConNot);
  Qk_RConNot.QuickRep1.PrinterSettings.Copies := StrToInt(MaskEdit1.Text);
  Qk_RConNot.QuickRep1.Preview;
  Qk_RConNot.Destroy;
  Qk_RConNot := NIL;
end;

end.
