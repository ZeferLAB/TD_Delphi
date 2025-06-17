unit Dep1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, ToolEdit, CurrEdit, jpeg;

type
  TF_Dep1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MaskEdit1: TMaskEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    Label6: TLabel;
    CurrencyEdit5: TCurrencyEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure CurrencyEdit3Exit(Sender: TObject);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit5Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Dep1: TF_Dep1;

implementation

{$R *.DFM}

procedure TF_Dep1.BitBtn1Click(Sender: TObject);
begin
  CurrencyEdit4.Value := (CurrencyEdit1.Value + CurrencyEdit2.Value + CurrencyEdit3.Value + CurrencyEdit5.Value);
  Close;
end;

procedure TF_Dep1.FormActivate(Sender: TObject);
begin
  Bitbtn1.setfocus;
//  CurrencyEdit1.SetFocus;
end;

procedure TF_Dep1.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit2.SetFocus;
end;

procedure TF_Dep1.CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_Dep1.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit3.SetFocus;
end;

procedure TF_Dep1.CurrencyEdit1Exit(Sender: TObject);
begin
  CurrencyEdit4.Value := (CurrencyEdit1.Value + CurrencyEdit2.Value + CurrencyEdit3.Value);
end;

procedure TF_Dep1.CurrencyEdit2Exit(Sender: TObject);
begin
  CurrencyEdit4.Value := (CurrencyEdit1.Value + CurrencyEdit2.Value + CurrencyEdit3.Value);
end;

procedure TF_Dep1.CurrencyEdit3Exit(Sender: TObject);
begin
  CurrencyEdit4.Value := (CurrencyEdit1.Value + CurrencyEdit2.Value + CurrencyEdit3.Value);
end;

procedure TF_Dep1.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit5.SetFocus;
end;

procedure TF_Dep1.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

procedure TF_Dep1.CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_Dep1.CurrencyEdit5Exit(Sender: TObject);
begin
  CurrencyEdit4.Value := (CurrencyEdit1.Value + CurrencyEdit2.Value + CurrencyEdit3.Value + CurrencyEdit5.Value);
end;

end.
