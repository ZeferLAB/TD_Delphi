unit PesqFer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  Tf_pesqFer = class(TForm)
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActive(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_pesqFer: Tf_pesqFer;

implementation

uses Tabelas, Feriados;

{$R *.DFM}

procedure Tf_pesqFer.BitBtn1Click(Sender: TObject);
var
ano : string;
mes : string;
dia : string;
begin
  if RadioButton1.Checked = true then
  begin
    dia := copy(MaskEdit1.Text, 1, 2);
    mes := Copy(MaskEdit1.text,4,2);
    ano := Copy(MaskEdit1.text,7,4);
    dia := '  ' + IntToStr(StrToInt(dia));
    dia := Copy(dia, length(dia) - 1, 2);
    mes := '  ' + IntToStr(StrToInt(mes));
    mes := Copy(mes, length(mes) - 1, 2);
    if Tabela.Feriados.Seek(ano + mes + dia) = true then
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
    if Tabela.Feriados.Seek(MaskEdit1.Text) = true then
     begin
      close;
     end
    else
     begin
       ShowMessage('Descrição não localizada');
       MaskEdit1.Text :='';
       MaskEdit1.SetFocus;
     end;
  end;
end;

procedure Tf_pesqFer.RadioButton1Click(Sender: TObject);
begin
  Tabela.Feriados.SetOrder(1);
  Label1.Caption := 'Data';
  MaskEdit1.EditMask := '!99/99/0000;1;_';
  MaskEdit1.MaxLength := 8;
  MaskEdit1.Text := '';
  MaskEdit1.SetFocus;
end;

procedure Tf_pesqFer.RadioButton2Click(Sender: TObject);
begin
  Tabela.Feriados.SetOrder(2);
  Label1.Caption := 'Descrição';
  MaskEdit1.MaxLength := 40;
  MaskEdit1.EditMask := '';
  MaskEdit1.SetFocus;
end;

procedure Tf_pesqFer.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tf_pesqFer.MaskEdit1onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = 13 then BitBtn1.SetFocus;
end;

procedure Tf_pesqFer.FormActive(Sender: TObject);
begin
  if RadioButton1.Checked then MaskEdit1.MaxLength := 8;
  if RadioButton2.Checked then MaskEdit1.MaxLength := 40;
  MaskEdit1.Text :='';
  MaskEdit1.SetFocus;
end;

end.
