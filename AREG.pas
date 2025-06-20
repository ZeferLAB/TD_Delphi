unit AREG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls;

type
  TF_AReg = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_AReg: TF_AReg;

implementation

{$R *.DFM}

uses Baixa1, Exame, DMTD;

procedure TF_AReg.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if key = 13 then MaskEdit2.SetFocus;
  if key = 13 then
  begin

    Dm.ArqAux.Close;
    Dm.ArqAux.SQL.Clear;
    Dm.ArqAux.SQL.Add('select averba from td where registro = ' + QuotedStr(MaskEdit1.Text)+' order by recno asc');
    Dm.ArqAux.Open;
    Dm.ArqAux.Last;

    if Dm.ArqAux.FieldByName('averba').AsString <> '' then
      MaskEdit2.Text := IntToStr(strtoint(Dm.ArqAux.FieldByName('averba').AsString) + 1)
    else
    MaskEdit2.Text := '1';
    MaskEdit2.SetFocus;
  end;
end;

procedure TF_AReg.BitBtn1Click(Sender: TObject);
begin
  if (Maskedit1.Text = '') or (Maskedit1.Text = '0') then
  Begin
    ShowMessage('N�mero de Registro Inv�lido.');
    Maskedit1.SetFocus;
  end
  else Close;
end;

procedure TF_AReg.FormActivate(Sender: TObject);
begin
  Maskedit1.Setfocus;
end;

procedure TF_AReg.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Bitbtn1.Setfocus;
end;

procedure TF_AReg.BitBtn2Click(Sender: TObject);
begin
  F_Baixa1.cancelouRegistro := True;
end;

end.
