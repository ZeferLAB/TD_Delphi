unit DajeVias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, RXCtrls, Buttons, jpeg, ExtCtrls, Menu;

type
  TF_DajeVias = class(TForm)
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    RxLabel1: TRxLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    TelaDeExame, MestreDetail: Boolean;
    x: integer;

    { Public declarations }
  end;

  Function Strzero(Numero : String;Casas : Integer) : String;
var
  F_DajeVias: TF_DajeVias;
implementation

uses DMTD, RecepR, FuncGeral, Exame;

{$R *.DFM}

procedure TF_DajeVias.SpeedButton1Click(Sender: TObject);
var
  sProtocolo,
  sData: String;
begin
  // 3º
  if (Not(TelaDeExame)) Then
  Begin
    if (x >= 0) and (F_RecepR.Label3.Caption <> '000000') Then
    Begin

      dm.qryGenerico.Close;
      dm.qryGenerico.SQL.Clear;
      dm.qryGenerico.SQL.Add('select count(id) as id from daje where numero_daje = '+QuotedStr(Strzero(MaskEdit2.Text, 6))+' and serie_daje = '+QuotedStr(MaskEdit1.Text)+'');
      dm.qryGenerico.Open;

      if (MaskEdit2.Text <> '') and (MaskEdit1.Text <> '') Then
      Begin
        if (dm.qryGenerico.FieldByName('id').AsInteger <= 0) Then
        Begin
          Application.MessageBox('Daje não informado!', 'Mensagem do Sistema', mb_ok);
          Abort;
        End;  
      End; 

      dm.qryGenerico.Close;
      dm.qryGenerico.SQL.Clear;
      dm.qryGenerico.SQL.Add('select * from selos where daje = '+QuotedStr(Strzero(MaskEdit2.Text, 6))+' and serie_daje = '+QuotedStr(MaskEdit1.Text)+'' );
      dm.qryGenerico.Open;

      if dm.qryGenerico.RecordCount <= 0 Then
      Begin
        if (x < strtoint(F_RecepR.MaskEdit15.Text)) Then
        Begin
          if (StrToInt(MaskEdit2.Text) > 0) and (StrToInt(MaskEdit1.Text) > 0) Then
          begin
            Dm.Selos.close;
            Dm.Selos.SQL.Clear;
            Dm.Selos.SQL.add('INSERT INTO selos (recibo, daje, serie_daje, data, tp_prot) VALUES (');
            Dm.Selos.sql.add(QuotedStr(F_RecepR.Label3.Caption) + ',');
            Dm.Selos.sql.add(QuotedStr(Strzero(MaskEdit2.Text, 6))     + ',');
            Dm.Selos.sql.add(QuotedStr(Strzero(MaskEdit1.Text, 3))     + ',');
            Dm.Selos.sql.add(QuotedStr(ConvData(F_RecepR.MaskEdit1.Text)) + ', "T")');
            Dm.Selos.ExecSQL;
            MaskEdit1.Text:= '';
            MaskEdit2.Text:= '';
          End  
        End;
        x:= x + 1;

        if (x < strtoint(F_RecepR.MaskEdit15.Text)) Then
        Begin
          Abort;
        End
        Else
        Begin
          MaskEdit1.Text:= '';
          MaskEdit2.Text:= '';
          Close;
        End
        end
      Else
      Begin
        Application.MessageBox('O Daje informado ja está em uso!', 'Mensagem do Sistema', mb_ok);
        Exit;
      End;

    End
    Else
    Begin
      Close;
      F_RecepR.BringToFront;
    End
  End
  Else
  Begin
    if F_RecepR <> Nil Then
    Begin
      sProtocolo:= F_RecepR.Label3.Caption;
      sData     := F_RecepR.MaskEdit1.Text;
    End
    Else
    if F_Exame <> Nil Then
    Begin
      sProtocolo:= F_Exame.MaskEdit1.Text;
      sData     := F_Exame.MaskEdit2.Text;    
    End;

    if (MaskEdit2.Text = '') or (MaskEdit1.Text = '') Then
    Begin
      Close;
    End;


    dm.qryGenerico.Close;
    dm.qryGenerico.SQL.Clear;
    dm.qryGenerico.SQL.Add('select count(id) as id from daje where numero_daje = '+QuotedStr(Strzero(MaskEdit2.Text, 6))+' and serie_daje = '+QuotedStr(MaskEdit1.Text)+'');
    dm.qryGenerico.Open;

    if (MaskEdit2.Text <> '') and (MaskEdit1.Text <> '') Then
    Begin
      if (dm.qryGenerico.FieldByName('id').AsInteger <= 0) Then
      Begin
        Application.MessageBox('Número/Série do Daje não localizado na tabela DAJE!', 'Mensagem do Sistema', mb_ok);
        Abort;
      End;
    End;


    dm.qryGenerico.Close;
    dm.qryGenerico.SQL.Clear;
    dm.qryGenerico.SQL.Add('select * from selos where daje = '+QuotedStr(Strzero(MaskEdit2.Text, 6))+' and serie_daje = '+QuotedStr(MaskEdit1.Text)+'' );
    dm.qryGenerico.Open;

    if (MaskEdit2.Text <> '') and (MaskEdit1.Text <> '') Then
    Begin

      if (MaskEdit2.Text <> '') and (MaskEdit1.Text <> '') Then
      Begin
        if (dm.qryGenerico.FieldByName('id').AsInteger > 0) Then
        Begin
          Application.MessageBox('Daje já informado na tabela SELOS!', 'Mensagem do Sistema', mb_ok);
          Abort;
        End;
      End;


      if dm.qryGenerico.RecordCount <= 0 Then
      Begin
        if (StrToInt(MaskEdit2.Text) > 0) and (StrToInt(MaskEdit1.Text) > 0) Then
        Begin
          Dm.Selos.close;
          Dm.Selos.SQL.Clear;
          Dm.Selos.SQL.add('INSERT INTO selos (recibo, daje, serie_daje, data, tp_prot) VALUES (');
          Dm.Selos.sql.add(QuotedStr(sProtocolo) + ',');
          Dm.Selos.sql.add(QuotedStr(Strzero(MaskEdit2.Text, 6))     + ',');
          Dm.Selos.sql.add(QuotedStr(Strzero(MaskEdit1.Text, 3))     + ',');
          Dm.Selos.sql.add(QuotedStr(ConvData(sData)) + ', "T")');
          Dm.Selos.ExecSQL;
          MaskEdit1.Text:= '';
          MaskEdit2.Text:= '';
        End
      End
      Else
      Begin
        Application.MessageBox('O Daje informado ja está em uso!', 'Mensagem do Sistema', mb_ok);
      End;
    End;
  End;

end;

procedure TF_DajeVias.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    MaskEdit2.SetFocus;
    MaskEdit1.Text:= Strzero(MaskEdit1.Text, 3);
  end;

end;

procedure TF_DajeVias.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
{    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('SELECT daje FROM td WHERE (daje = ' + QuotedStr(MaskEdit1.Text));
    DM.ArqAux.Sql.Add(') or (dajepost = ' + QuotedStr(MaskEdit1.Text));
    DM.ArqAux.Sql.Add(') or (dajevias = ' + QuotedStr(MaskEdit1.Text) + ')');
    DM.ArqAux.Open;}

    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('SELECT daje FROM td WHERE ((daje = ' + QuotedStr(MaskEdit2.Text) +') and (serie_daje = '+ QuotedStr(MaskEdit1.Text) +' )) or ((serie_vias = ' + QuotedStr(MaskEdit1.Text) +') and (dajevias = ' + QuotedStr(MaskEdit2.Text) + '))');
    DM.ArqAux.Open;


    DM.ArqAux1.Close;
    DM.ArqAux1.Sql.Clear;
    DM.ArqAux1.Sql.Add('SELECT daje FROM certidao WHERE daje = ' + QuotedStr(MaskEdit2.Text)+' and serie_daje = ' + QuotedStr(MaskEdit1.Text));
    DM.ArqAux1.Open;

    if F_RecepR <> Nil Then
    Begin
      if ((DM.ArqAux.RecordCount <> 0) or (DM.ArqAux1.RecordCount <> 0) or (MaskEdit1.Text = F_RecepR.ndaje)) and (Trim(MaskEdit2.Text) <> '') then
      begin
        MessageBox(0, PChar('Nº de DAJE já informado no sistema! Favor Verificar !'), 'ALERTA', MB_OK + MB_ICONWARNING);
        MaskEdit2.SetFocus;
        Exit;
      end
    End
    Else
    Begin
      if ((DM.ArqAux.RecordCount <> 0)) then
      begin
        MessageBox(0, PChar('Nº de DAJE já informado no sistema! Favor Verificar !'), 'ALERTA', MB_OK + MB_ICONWARNING);
        MaskEdit1.SetFocus;
        Exit;
      end
    End;
    SpeedButton1Click(Sender);
  end;

end;

Function Strzero(Numero : String;Casas : Integer) : String;
Begin
  result := stringofchar('0',(casas-length(trim(numero)))) + trim(numero);
end;


end.
