unit U_LogCertidao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, Db, DBTables, Mask, Buttons, ComCtrls, Grids,
  DBGrids;

type
  TF_LogRegitros = class(TForm)
    ControlBar1: TControlBar;
    Label34: TLabel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    MkProtocolo: TMaskEdit;
    BitBtn3: TBitBtn;
    HisTD: TQuery;
    Ds_HisTD: TDataSource;
    RadioGroup2: TRadioGroup;
    Label5: TLabel;
    CbUsuario: TComboBox;
    Label4: TLabel;
    Rad_Protocolo: TRadioButton;
    Rad_ProtocoloUsuario: TRadioButton;
    Rad_Data: TRadioButton;
    Rad_UsuarioData: TRadioButton;
    Label15: TLabel;
    MkDataInicial: TMaskEdit;
    Label1: TLabel;
    MkDataFinal: TMaskEdit;
    Rad_Usuario: TRadioButton;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Rad_Registro: TRadioButton;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MkProtocoloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MkDataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MkDataFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_LogRegitros: TF_LogRegitros;

implementation

uses DMTD, RRec, FuncGeral;

{$R *.DFM}

procedure TF_LogRegitros.BitBtn3Click(Sender: TObject);
var
  TipoHistorico: String;
begin
  if RadioGroup2.ItemIndex = 0 Then
    TipoHistorico:= 'T'
  Else
  if RadioGroup2.ItemIndex = 1 Then
    TipoHistorico:= 'C'
  Else
  if RadioGroup2.ItemIndex = 2 Then
    TipoHistorico:= '';


  HisTD.Close;
  HisTD.SQL.Clear;
  HisTD.SQL.Add('SELECT * FROM histd where tipo = '+QuotedStr(TipoHistorico)+'');

  if TipoHistorico <> '' Then
  begin
    if Rad_Protocolo.Checked then
    begin
      if MkProtocolo.Text = '' Then
      begin
        Application.MessageBox('Campo: Nº do Protocolo, deve ser preenchido!' , 'Log', mb_ok);
        Abort;
      End;
      HisTD.SQL.Add('and protocolo = '+QuotedStr(MkProtocolo.Text)+' order by data');
    End;

    if Rad_ProtocoloUsuario.Checked Then
    begin
      if (MkProtocolo.Text = '') or ((CbUsuario.Text = '')) Then
      begin
        Application.MessageBox('Campo: Nº do Protocolo e Usuário, deve ser preenchido!' , 'Log', mb_ok);
        Abort;
      End;
      HisTD.SQL.Add('and protocolo = '+QuotedStr(MkProtocolo.Text)+' and usuario = '+QuotedStr(CbUsuario.Text)+' order by data');
    end;
  End;

  if Rad_Registro.Checked then
  begin
    if MaskEdit1.Text = '' Then
    begin
      Application.MessageBox('Campo: Nº do Registro, deve ser preenchido!' , 'Log', mb_ok);
      Abort;
    End;
    HisTD.SQL.Add('and protocolo = '+QuotedStr(MaskEdit1.Text)+' order by data');
  end;

  if Rad_Data.Checked Then
  begin
    if (MkDataInicial.Text = '  /  /    ') or ((MkDataFinal.Text = '  /  /    ')) Then
    begin
      Application.MessageBox('Campo: Data, deve ser preenchido!' , 'Log', mb_ok);
      Abort;
    End;
    HisTD.SQL.Add('and data >= '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MkDataInicial.Text)))+' and data <= '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MkDataFinal.Text)))+' order by data');
  end;

  if Rad_UsuarioData.Checked Then
  begin
    if (CbUsuario.Text = '') or (MkDataInicial.Text = '  /  /    ') or ((MkDataFinal.Text = '  /  /    ')) Then
    begin
      Application.MessageBox('Campo: Data e Usuário, devem ser preenchido!' , 'Log', mb_ok);
      Abort;
    End;
    HisTD.SQL.Add('and data >= '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MkDataInicial.Text)))+' and data <= '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MkDataFinal.Text)))+' and usuario = '+QuotedStr(CbUsuario.Text)+' order by data');
  end;

  if Rad_Usuario.Checked Then
  begin
    if (CbUsuario.Text = '') Then
    begin
      Application.MessageBox('Campo: Usuário, deve ser preenchido!' , 'Log', mb_ok);
      Abort;
    End;
    HisTD.SQL.Add('and usuario = '+QuotedStr(CbUsuario.Text)+' order by data');
  end;


  HisTD.Open; 
end;

procedure TF_LogRegitros.FormShow(Sender: TObject);
begin
  CbUsuario.Clear;
  Dm.qryGenerico_Aux.Close;
  Dm.qryGenerico_Aux.Sql.Clear;
  Dm.qryGenerico_Aux.Sql.Add('SELECT u_apel FROM usuarios');
  Dm.qryGenerico_Aux.Open;
  Dm.qryGenerico_Aux.First;

  while not Dm.qryGenerico_Aux.Eof do          
  begin
    CbUsuario.Items.Add(Dm.qryGenerico_Aux.FieldByName('u_apel').AsString);
    Dm.qryGenerico_Aux.Next;
  end;
end;

procedure TF_LogRegitros.BitBtn1Click(Sender: TObject);
begin
  Close;  
end;

procedure TF_LogRegitros.MkProtocoloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    CbUsuario.SetFocus;
end;

procedure TF_LogRegitros.CbUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    MkDataInicial.SetFocus;
end;

procedure TF_LogRegitros.MkDataInicialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    MkDataFinal.SetFocus;
end;

procedure TF_LogRegitros.MkDataFinalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    MaskEdit1.SetFocus;
end;

procedure TF_LogRegitros.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    BitBtn3.SetFocus;
end;

end.
