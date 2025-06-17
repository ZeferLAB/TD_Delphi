unit Daje;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, RXCtrls, Buttons, jpeg, ExtCtrls;

type
  TF_Daje = class(TForm)
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    RxLabel1: TRxLabel;
    MaskEdit1: TMaskEdit;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Daje: TF_Daje;
  DAJEjausado : String;

implementation

uses DMTD, RecepR, RecepC;

{$R *.DFM}

procedure TF_Daje.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Daje.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
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

    if ((DM.ArqAux.RecordCount <> 0) or (DM.ArqAux1.RecordCount <> 0)) and (Trim(MaskEdit1.Text) <> '') then
    begin
      MessageBox(0, PChar('Nº de DAJE já informado no sistema! Favor Verificar !'), 'ALERTA', MB_OK + MB_ICONWARNING);
      DAJEjausado := MaskEdit1.Text;
      MaskEdit1.SetFocus;
      Exit;
    end
    else
    begin
      if (Assigned(F_RecepR)) then F_RecepR.NaoInserirRecepcao := False;
      if (Assigned(F_RecepC)) then F_RecepC.NaoInserirRecepcao := False;
      if (Trim(MaskEdit1.Text) <> '') then
        Label1.Visible := False;
      SpeedButton1Click(Sender);
    end;
  end;
end;

procedure TF_Daje.FormCreate(Sender: TObject);
begin
  if (Assigned(F_RecepR)) then F_RecepR.NaoInserirRecepcao := False;
  if (Assigned(F_RecepC)) then F_RecepC.NaoInserirRecepcao := False;
  Label1.Visible := False;
  DAJEjausado := '';
end;

procedure TF_Daje.SpeedButton2Click(Sender: TObject);
begin
  if (Assigned(F_RecepR)) then F_RecepR.NaoInserirRecepcao := True;
  if (Assigned(F_RecepC)) then F_RecepC.NaoInserirRecepcao := True;
  MaskEdit1.Clear;
  Close;
end;

procedure TF_Daje.MaskEdit1Change(Sender: TObject);
begin
  if (Trim(DAJEjausado) <> '') and (Trim(MaskEdit1.Text) = '') then
    Label1.Visible := True
  else
    Label1.Visible := False;
  DAJEjausado := '';
end;

end.
