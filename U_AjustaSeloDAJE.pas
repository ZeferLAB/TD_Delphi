unit U_AjustaSeloDAJE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pngimage, ExtCtrls, StdCtrls, Mask, ComCtrls;

type
  TF_AjustaSeloDAJE = class(TForm)
    EdNumeroSELO: TMaskEdit;
    Label1: TLabel;
    EdCodigoValidacao: TMaskEdit;
    LbLabelPesquisa: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure EdNumeroSELOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodigoValidacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label6Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    { Private declarations }
  public
    sNumeroDaje,
    sSerieDaje,
    sId: String;

    { Public declarations }
  end;

var
  F_AjustaSeloDAJE: TF_AjustaSeloDAJE;

implementation

uses DMTD, U_ConsDaje;

{$R *.DFM}

procedure TF_AjustaSeloDAJE.FormShow(Sender: TObject);
begin
  DM.qryGenerico.close;
  DM.qryGenerico.sql.clear;
  DM.qryGenerico.sql.add('select * from usuarios order by u_apel');
  DM.qryGenerico.open;
  ComboBox1.Clear;
  ComboBox1.text := dm.qryGenerico.fieldbyname('u_apel').AsString;
  DM.qryGenerico.First;
  while not DM.qryGenerico.eof do
  begin
    combobox1.Items.Add(DM.qryGenerico.fieldbyname('u_apel').asstring);
    DM.qryGenerico.next;
  end;

  MaskEdit1.Text := sNumeroDaje;
  MaskEdit2.Text := sSerieDaje;

end;

procedure TF_AjustaSeloDAJE.EdNumeroSELOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = 13 then EdCodigoValidacao.SetFocus;
end;

procedure TF_AjustaSeloDAJE.EdCodigoValidacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = 13 then ComboBox1.SetFocus;
end;

procedure TF_AjustaSeloDAJE.ComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = 13 then Label6.OnClick(Sender);
end;

procedure TF_AjustaSeloDAJE.MaskEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_AjustaSeloDAJE.MaskEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = 13 then EdNumeroSELO.SetFocus;
end;

procedure TF_AjustaSeloDAJE.Label6Click(Sender: TObject);
begin
  If (Not(DM.ArqAux.FieldByName('numero_selo').IsNull)) or (DM.ArqAux.FieldByName('numero_selo').AsString <> '') Then
  Begin
    ShowMessage('Número do Selo, ja informado!');
    Abort;
  End;

  if (DM.ArqAux.FieldByName('status').AsString = 'Liberado Manualmente') or
    (DM.ArqAux.FieldByName('status').AsString = 'Pago') or
    (DM.ArqAux.FieldByName('status').AsString = 'Isento') or
    (DM.ArqAux.FieldByName('status').AsString = 'Utilizado') Then
  Begin
    if EdNumeroSELO.Text = '' Then
    Begin
      ShowMessage('Campo: Número do Selo, deve ser preenchido!');
      Abort;
    End;

    if ComboBox1.Text = '' Then
    Begin
      ShowMessage('Campo: Usuário, deve ser preenchido!');
      Abort;
    End;

    If (DM.ArqAux.FieldByName('cod_validacao').IsNull) or (DM.ArqAux.FieldByName('cod_validacao').AsString = '') Then
    Begin
      DM.qryGenerico.Close;
      DM.qryGenerico.SQL.Clear;
      DM.qryGenerico.SQL.Add('UPDATE daje SET numero_selo = :numero_selo, usuario_selo = :usuario_selo');
      DM.qryGenerico.SQL.Add('WHERE numero_daje = :numero_daje and serie_daje = :serie_daje and id = :id');
      DM.qryGenerico.ParamByName('numero_selo').AsString  := EdNumeroSELO.Text;
      DM.qryGenerico.ParamByName('numero_daje').AsString  := sNumeroDaje;
      DM.qryGenerico.ParamByName('serie_daje').AsString   := sSerieDaje;
      DM.qryGenerico.ParamByName('usuario_selo').AsString := ComboBox1.Text;
      DM.qryGenerico.ParamByName('id').AsString           := sId;
      DM.qryGenerico.ExecSQL;
    End
    Else
    Begin
      ShowMessage('Campo: Cód. Validação e Número do Selo, ja informado na tabela daje!');
    End;

    DM.qryGenerico.Close;
    DM.qryGenerico.SQL.Clear;
    DM.qryGenerico.SQL.Add('select selo, selo_validador from td where daje = :daje and serie_daje = :serie_daje');
    DM.qryGenerico.ParamByName('daje').AsString         := sNumeroDaje;
    DM.qryGenerico.ParamByName('serie_daje').AsString   := sSerieDaje;
    DM.qryGenerico.Open;

    If (DM.qryGenerico.FieldByName('selo').IsNull) or (DM.qryGenerico.FieldByName('selo').AsString = '') Then
    Begin
      DM.qryGenerico.Close;
      DM.qryGenerico.SQL.Clear;
      DM.qryGenerico.SQL.Add('UPDATE td SET selo_validador = :selo_validador, selo = :selo');
      DM.qryGenerico.SQL.Add('WHERE daje = :daje and serie_daje = :serie_daje');
      DM.qryGenerico.ParamByName('selo').AsString          := EdNumeroSELO.Text;
      DM.qryGenerico.ParamByName('selo_validador').AsString:= EdCodigoValidacao.Text;
      DM.qryGenerico.ParamByName('daje').AsString          := sNumeroDaje;
      DM.qryGenerico.ParamByName('serie_daje').AsString    := sSerieDaje;
      DM.qryGenerico.ExecSQL;
    End
    Else
    Begin
      ShowMessage('Campo: Cód. Validação e Número do Selo, ja informado na tabela TD!');
      Abort;
    End;
    F_ConsDaje.BitBtn1.Click;
    ShowMessage('Selo vinculado com sucesso!');
  End
  Else
  Begin
    ShowMessage('Para vincular o selo ao daje informado é necessário baixá-lo!');
    Abort;
  End;

end;

procedure TF_AjustaSeloDAJE.Label5Click(Sender: TObject);
begin
  Close;
end;

end.
