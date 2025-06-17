unit AuxRFat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask;

type
  TF_AuxRFat = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_AuxRFat: TF_AuxRFat;

implementation

uses DMTD, RelNot;

{$R *.DFM}

procedure TF_AuxRFat.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TF_AuxRFat.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_AuxRFat.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_AuxRFat.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_AuxRFat.FormActivate(Sender: TObject);
 var
 cliente : String;
begin
 cliente := '';
 cliente := InttoStr(StrtoInt(copy(F_RelNot.combobox1.text,1,3)));
 DM.ArqAux.Close;
 DM.ArqAux.Sql.Clear;
 DM.ArqAux.Sql.Add('select fatura from escrit where ncliente = ' + cliente);
 DM.ArqAux.open;

 maskedit3.text := InttoStr(DM.ArqAux.fieldbyname('fatura').AsInteger + 1);


end;

end.
