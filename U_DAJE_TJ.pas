unit U_DAJE_TJ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, RXCtrls, jpeg, ExtCtrls;

type
  TF_DAJE_TJ = class(TForm)
    Image1: TImage;
    MaskEdit1: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MaskEdit2: TMaskEdit;
    RxLabel1: TRxLabel;
    MaskEdit3: TMaskEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_DAJE_TJ: TF_DAJE_TJ;

implementation

uses DMTD, RecepR, RecepC, Menu;

{$R *.DFM}

procedure TF_DAJE_TJ.SpeedButton1Click(Sender: TObject);
begin
  if (Trim(MaskEdit1.Text) <> '') and (Trim(MaskEdit2.Text) <> '') then
  begin
    if MaskEdit3.Text <> '' Then //iddaje_tj
    begin
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('select * from daje where ');
      Dm.ArqAux.Sql.Add(' iddaje_tj = '+QuotedStr(MaskEdit3.Text)+' and serie_daje = ' + QuotedStr(MasKedit1.Text) + ' AND numero_daje = ' + MaskEdit2.Text);
      Dm.ArqAux.Sql.Add(' order by serie_daje, numero_daje');
      Dm.ArqAux.Open;
    End
    Else
    Begin
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('select * from daje where ');
      Dm.ArqAux.Sql.Add(' serie_daje = ' + QuotedStr(MasKedit1.Text) + ' AND numero_daje = ' + MaskEdit2.Text);
      Dm.ArqAux.Sql.Add(' order by serie_daje, numero_daje');
      Dm.ArqAux.Open;
    End;

    If Dm.ArqAux.RecordCount = 0 then
    begin
      if (Assigned(F_RecepR)) then F_RecepR.NaoInserirRecepcao := True;
      if (Assigned(F_RecepC)) then F_RecepC.NaoInserirRecepcao := True;
      ShowMessage('Dados não Localizados.');
    end
    Else
    begin
      if (Trim(Dm.ArqAux.FieldByName('status').AsString) = 'Pago') or (Trim(Dm.ArqAux.FieldByName('status').AsString) = 'Liberado Manualmente') or
         (Trim(Dm.ArqAux.FieldByName('status').AsString) = 'Isento') then
      begin
        if (Assigned(F_RecepR)) then F_RecepR.NaoInserirRecepcao := False;
        if (Assigned(F_RecepC)) then F_RecepC.NaoInserirRecepcao := False;
      end
      else
      begin
        if (Assigned(F_RecepR)) then F_RecepR.NaoInserirRecepcao := True;
        if (Assigned(F_RecepC)) then F_RecepC.NaoInserirRecepcao := True;
        ShowMessage('DAJE não pago!!!');
      end;
    end;
  end
  else
  begin
    DM.Configur.Open;
    if not (DM.Configur.FieldByName('PermiteRecepcaoSemDAJE').AsBoolean) then
    begin
      if (Assigned(F_RecepR)) then F_RecepR.NaoInserirRecepcao := True;
      if (Assigned(F_RecepC)) then F_RecepC.NaoInserirRecepcao := True;
    end;
  end;
  Close;
end;

procedure TF_DAJE_TJ.MaskEdit1Exit(Sender: TObject);
begin
  if (trim(copy(MaskEdit1.Text,1,3)) <> '') then
    MaskEdit1.Text := StrZero(Trim(MaskEdit1.Text), 3);
end;

procedure TF_DAJE_TJ.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_DAJE_TJ.MaskEdit2Exit(Sender: TObject);
begin
  if (trim(copy(MaskEdit2.Text,1,6)) <> '') then
    MaskEdit2.Text := StrZero(Trim(MaskEdit2.Text), 6);
end;

procedure TF_DAJE_TJ.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then
  begin
    MaskEdit1.SetFocus;
    SpeedButton1Click(Sender);
  end;
end;

procedure TF_DAJE_TJ.FormCreate(Sender: TObject);
begin
  if (Assigned(F_RecepR)) then F_RecepR.NaoInserirRecepcao := False;
  if (Assigned(F_RecepC)) then F_RecepC.NaoInserirRecepcao := False;

  MaskEdit3.Text:= id_eselo; 

end;

procedure TF_DAJE_TJ.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    //Desativa o ALT F4 - Tem que deixar o KEYPREVIEW do form como True
    if (Shift = [SSALT]) or (key = Vk_F4) then key := Vk_Clear;
end;

procedure TF_DAJE_TJ.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit1.SetFocus;

end;

procedure TF_DAJE_TJ.MaskEdit3Exit(Sender: TObject);
begin
  if MaskEdit3.Text <> '' then
    MaskEdit3.Text := StrZero(Trim(MaskEdit3.Text), 4);

end;

end.
