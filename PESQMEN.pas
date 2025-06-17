unit PesqMen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  Tf_pesqmen = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure MaskEdit1onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActive(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_pesqmen: Tf_pesqmen;

implementation

uses Tabelas, Mensagem;

{$R *.DFM}

procedure Tf_pesqmen.MaskEdit1onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure Tf_pesqmen.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tf_pesqmen.BitBtn1Click(Sender: TObject);
begin
    if Tabela.mensagem.Seek(MaskEdit1.Text) = true then
     begin
      Close;
     end
   else
    begin
      ShowMessage('Código não localizado');
      MaskEdit1.Text :='';
      MaskEdit1.SetFocus;
    end;
  end;



procedure Tf_pesqmen.FormActive(Sender: TObject);
begin
  Maskedit1.Text :='';
  MaskEdit1.SetFocus;
end;

end.
