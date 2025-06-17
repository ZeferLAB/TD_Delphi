unit pbens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  Tf_bens = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure FormActive(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_bens: Tf_bens;

implementation

uses Tabelas, Bgarant;

{$R *.DFM}

procedure Tf_bens.FormActive(Sender: TObject);
begin
  if RadioButton2.Checked then MaskEdit1.MaxLength := 8;
  if RadioButton3.Checked then MaskEdit1.MaxLength := 6;
  MaskEdit1.Text :='';
  MaskEdit1.Setfocus;
end;

procedure Tf_bens.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tf_bens.RadioButton2Click(Sender: TObject);
begin
  Tabela.bgarantia.SetOrder(1);
  Label1.Caption := 'Data';
  MaskEdit1.EditMask := '!99/99/0000;1;_';
  MaskEdit1.MaxLength := 8;
  MaskEdit1.Text :='';
  MaskEdit1.SetFocus;
end;

procedure Tf_bens.RadioButton3Click(Sender: TObject);
begin
  Tabela.bgarantia.SetOrder(2);
  Label1.Caption := 'Protocolo';
  MaskEdit1.EditMask := '';
  maskEdit1.Text := '';
  MaskEdit1.MaxLength := 6; 
  MaskEdit1.SetFocus;
end;

procedure Tf_bens.BitBtn1Click(Sender: TObject);
var
ano : string;
mes : string;
dia : string;
begin
  if RadioButton2.Checked = true then
  begin
    dia := copy(MaskEdit1.Text, 1, 2);
    mes := Copy(MaskEdit1.text,4,2);
    ano := Copy(MaskEdit1.text,7,4);
    dia := '  ' + IntToStr(StrToInt(dia));
    dia := Copy(dia, length(dia) - 1, 2);
    mes := '  ' + IntToStr(StrToInt(mes));
    mes := Copy(mes, length(mes) - 1, 2);
    if Tabela.bgarantia.Seek(ano + mes + dia) = true then
     begin
      Close;
     end
   else
    begin
      ShowMessage('Data não localizado');
      MaskEdit1.Text :='';
      MaskEdit1.SetFocus;
    end;
  end
  else
  begin
    if Tabela.bgarantia.Seek(MaskEdit1.Text) = true then
     begin
      close;
     end
    else
     begin
       ShowMessage('Protocolo não localizado');
       MaskEdit1.Text :='';
       MaskEdit1.SetFocus;
     end;
  end;
end;

procedure Tf_bens.MaskEdit1onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

end.
