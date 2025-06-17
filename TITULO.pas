unit Titulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask;

type
  TF_Titulo = class(TForm)
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Titulo: TF_Titulo;

implementation

{$R *.DFM}

procedure TF_Titulo.FormActivate(Sender: TObject);
begin
//  F_Titulo.MaskEdit1.SetFocus;
end;

procedure TF_Titulo.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_Titulo.MaskEdit2.SetFocus;
end;

procedure TF_Titulo.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_Titulo.BitBtn1.SetFocus;
end;

procedure TF_Titulo.BitBtn1Click(Sender: TObject);
begin
  F_Titulo.Close;
end;

end.
