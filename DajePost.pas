unit DajePost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, StdCtrls, Mask, RXCtrls, Buttons, ToolEdit, CurrEdit;

type
  TF_DajePost = class(TForm)
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    RxLabel1: TRxLabel;
    MaskEdit1: TMaskEdit;
    RxLabel2: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_DajePost: TF_DajePost;
  DAJEjausado : String;

implementation

uses DMTD, RecepR;

{$R *.DFM}

procedure TF_DajePost.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TF_DajePost.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    DAJEjausado := '';

    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('SELECT daje FROM td WHERE (daje = ' + QuotedStr(MaskEdit1.Text));
    DM.ArqAux.Sql.Add(') or (dajepost = ' + QuotedStr(MaskEdit1.Text));
    DM.ArqAux.Sql.Add(') or (dajevias = ' + QuotedStr(MaskEdit1.Text) + ')');
    DM.ArqAux.Open;

    DM.ArqAux1.Close;
    DM.ArqAux1.Sql.Clear;
    DM.ArqAux1.Sql.Add('SELECT daje FROM certidao WHERE daje = ' + QuotedStr(MaskEdit1.Text));
    DM.ArqAux1.Open;

    if ((DM.ArqAux.RecordCount <> 0) or (DM.ArqAux1.RecordCount <> 0) or (MaskEdit1.Text = F_RecepR.ndaje)) and (Trim(MaskEdit1.Text) <> '') then
    begin
      MessageBox(0, PChar('Nº de DAJE já informado no sistema! Favor Verificar !'), 'ALERTA', MB_OK + MB_ICONWARNING);
      DAJEjausado := MaskEdit1.Text;
      MaskEdit1.SetFocus;
      Exit;
    end
    else
    begin
      CurrencyEdit1.SetFocus;
      //SpeedButton1Click(Sender);
    end;
  end;
end;

procedure TF_DajePost.FormCreate(Sender: TObject);
begin
  DAJEjausado := '';
end;

procedure TF_DajePost.SpeedButton2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  Close;
end;

procedure TF_DajePost.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then SpeedButton1Click(Sender);
end;

end.
