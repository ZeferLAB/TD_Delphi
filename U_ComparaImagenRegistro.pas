unit U_ComparaImagenRegistro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Db, MemTable, DBTables, Mask, Grids, DBGrids,
  ExtCtrls;

type
  TF_ComparaImagenRegistro = class(TForm)
    StatusBar1: TStatusBar;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    ComboBox1: TComboBox;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    qryImagemRegistro: TQuery;
    tbTemp: TMemoryTable;
    Dts_Temp: TDataSource;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    tbTempregistro: TStringField;
    tbTempp_auxiliar: TStringField;
    tbTempdata_r: TDateField;
    tbTempdata_p: TDateField;
    tbTemplivro: TStringField;
    tbTemptipo: TStringField;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ComparaImagenRegistro: TF_ComparaImagenRegistro;

implementation

uses Menu, DMTD, U_ComparaImagenRegistroPreview;

{$R *.DFM}

procedure TF_ComparaImagenRegistro.BitBtn10Click(Sender: TObject);
begin
  Close;
end;

Function DefineSub(arq_img : String) : String;
Begin
  Result := '';
  if StrToInt(arq_img) < 1000 then result := '0000\' else
  begin
    Result := IntToStr(StrToInt(arq_img));
    Result := Copy(Result, 1, length(Result) - 3);
    Result := floattostr(strtofloat(result));
    Result := strzero(Result, 4) + '\';
  end;
end;



procedure TF_ComparaImagenRegistro.BitBtn9Click(Sender: TObject);
VAR
  camA,
  camB,
  camC: String;
begin

  camA:= '';
  camB:= '';
  camC:= '';

  if ComboBox1.Text = 'Livro A' then
  begin
    camA := F_Menu.Label17.Caption + 'livroA\';
  end
  else
  if ComboBox1.Text = 'Livro B' then
  begin
    camB := F_Menu.Label17.Caption + 'livroB\';
  end
  else
  if ComboBox1.Text = 'Livro C' then
  begin
    camC := F_Menu.Label17.Caption + 'livroC\';
  end
  else
  if ComboBox1.Text = 'Todos' then
  begin
    camA := F_Menu.Label17.Caption + 'livroA\';
    camB := F_Menu.Label17.Caption + 'livroB\';
    camC := F_Menu.Label17.Caption + 'livroC\';
  end;


  if RadioButton2.Checked Then // Data de Registro
  Begin
    qryImagemRegistro.Close;
    qryImagemRegistro.SQL.Clear;
    qryImagemRegistro.SQL.Add('select registro, p_auxiliar, data_r, data_p, "Registro" as tipo from td where registro <> "" and data_p >= '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit1.Text)))+' and data_p <= '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit2.Text)))+' group by registro');
    qryImagemRegistro.Open;
  End
  Else
  if RadioButton1.Checked Then // Data de Recepção
  Begin
    qryImagemRegistro.Close;
    qryImagemRegistro.SQL.Clear;
    qryImagemRegistro.SQL.Add('select registro, p_auxiliar, data_r, data_p, "Registro" as tipo from td where registro <> "" and data_r >= '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit1.Text)))+' and data_r <= '+QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit2.Text)))+' group by registro');
    qryImagemRegistro.Open;
  End;

  tbTemp.Close;                                                                                                            //005469
  tbTemp.Open;

  {if ComboBox1.Text = 'Todos' then
  begin
    qryImagemRegistro.First;
    while (Not(qryImagemRegistro.Eof)) do
    Begin
      if Dm.VerificaArquivoRegistros(StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6), camA+DefineSub(qryImagemRegistro.FieldByName('registro').AsString)) = '' Then
      begin
        tbTemp.Insert;
        tbTempregistro.AsString  := StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6);
        tbTempp_auxiliar.AsString:= qryImagemRegistro.FieldByName('p_auxiliar').AsString;
        tbTempdata_r.AsString    := qryImagemRegistro.FieldByName('data_r').AsString;
        tbTempdata_p.AsString    := qryImagemRegistro.FieldByName('data_p').AsString;
        tbTemplivro.AsString     := ComboBox1.Text;
        tbTemptipo.AsString      := qryImagemRegistro.FieldByName('tipo').AsString;
        tbTemp.Post;
      end;
      qryImagemRegistro.Next;
    End;

    qryImagemRegistro.First;
    while (Not(qryImagemRegistro.Eof)) do
    Begin
      if Dm.VerificaArquivoRegistros(StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6), camB+DefineSub(qryImagemRegistro.FieldByName('registro').AsString)) = '' Then
      begin
        tbTemp.Insert;
        tbTempregistro.AsString  := StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6);
        tbTempp_auxiliar.AsString:= qryImagemRegistro.FieldByName('p_auxiliar').AsString;
        tbTempdata_r.AsString    := qryImagemRegistro.FieldByName('data_r').AsString;
        tbTempdata_p.AsString    := qryImagemRegistro.FieldByName('data_p').AsString;
        tbTemplivro.AsString     := ComboBox1.Text;
        tbTemptipo.AsString      := qryImagemRegistro.FieldByName('tipo').AsString;
        tbTemp.Post;
      end;
      qryImagemRegistro.Next;
    End;

    qryImagemRegistro.First;
    while (Not(qryImagemRegistro.Eof)) do
    Begin
      if Dm.VerificaArquivoRegistros(StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6), camC+DefineSub(qryImagemRegistro.FieldByName('registro').AsString)) = '' Then
      begin
        tbTemp.Insert;
        tbTempregistro.AsString  := StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6);
        tbTempp_auxiliar.AsString:= qryImagemRegistro.FieldByName('p_auxiliar').AsString;
        tbTempdata_r.AsString    := qryImagemRegistro.FieldByName('data_r').AsString;
        tbTempdata_p.AsString    := qryImagemRegistro.FieldByName('data_p').AsString;
        tbTemplivro.AsString     := ComboBox1.Text;
        tbTemptipo.AsString      := qryImagemRegistro.FieldByName('tipo').AsString;
        tbTemp.Post;
      end;
      qryImagemRegistro.Next;
    End;
  End
  Else }
  if ComboBox1.Text = 'Livro A' then
  Begin
    qryImagemRegistro.First;
    while (Not(qryImagemRegistro.Eof)) do
    Begin
      if Dm.VerificaArquivoRegistros(StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6), camA+DefineSub(qryImagemRegistro.FieldByName('registro').AsString)) = '' Then
      begin
        tbTemp.Insert;
        tbTempregistro.AsString  := StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6);
        tbTempp_auxiliar.AsString:= qryImagemRegistro.FieldByName('p_auxiliar').AsString;
        tbTempdata_r.AsString    := qryImagemRegistro.FieldByName('data_r').AsString;
        tbTempdata_p.AsString    := qryImagemRegistro.FieldByName('data_p').AsString;
        tbTemplivro.AsString     := ComboBox1.Text;
        tbTemptipo.AsString      := qryImagemRegistro.FieldByName('tipo').AsString;
        tbTemp.Post;
      end;
      qryImagemRegistro.Next;
    End;
  End
  Else
  if ComboBox1.Text = 'Livro B' then
  Begin
    qryImagemRegistro.First;
    while (Not(qryImagemRegistro.Eof)) do
    Begin
      if Dm.VerificaArquivoRegistros(StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6), camB+DefineSub(qryImagemRegistro.FieldByName('registro').AsString)) = '' Then
      begin
        tbTemp.Insert;
        tbTempregistro.AsString  := StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6);
        tbTempp_auxiliar.AsString:= qryImagemRegistro.FieldByName('p_auxiliar').AsString;
        tbTempdata_r.AsString    := qryImagemRegistro.FieldByName('data_r').AsString;
        tbTempdata_p.AsString    := qryImagemRegistro.FieldByName('data_p').AsString;
        tbTemplivro.AsString     := ComboBox1.Text;
        tbTemptipo.AsString      := qryImagemRegistro.FieldByName('tipo').AsString;
        tbTemp.Post;
      end;
      qryImagemRegistro.Next;
    End;
  End
  Else
  if ComboBox1.Text = 'Livro C' then
  Begin
    qryImagemRegistro.First;
    while (Not(qryImagemRegistro.Eof)) do
    Begin
      if Dm.VerificaArquivoRegistros(StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6), camC+DefineSub(qryImagemRegistro.FieldByName('registro').AsString)) = '' Then
      begin
        tbTemp.Insert;
        tbTempregistro.AsString  := StrZero(qryImagemRegistro.FieldByName('registro').AsString, 6);
        tbTempp_auxiliar.AsString:= qryImagemRegistro.FieldByName('p_auxiliar').AsString;
        tbTempdata_r.AsString    := qryImagemRegistro.FieldByName('data_r').AsString;
        tbTempdata_p.AsString    := qryImagemRegistro.FieldByName('data_p').AsString;
        tbTemplivro.AsString     := ComboBox1.Text;
        tbTemptipo.AsString      := qryImagemRegistro.FieldByName('tipo').AsString;
        tbTemp.Post;
      end;
      qryImagemRegistro.Next;
    End;
  End;

  F_ComparaImagenRegistroPreview:= TF_ComparaImagenRegistroPreview.Create(Nil);
  F_ComparaImagenRegistroPreview.QRLabel1.Caption  := F_Menu.Label29.Caption;
  F_ComparaImagenRegistroPreview.QRLabel10.Caption := F_Menu.Label13.Caption + ' ' + F_Menu.LbNomeTitular.Caption;
  F_ComparaImagenRegistroPreview.QRLabel11.Caption := 'RELATÓRIO REGISTRO SEM IMAGENS DIGITALIZADAS';
  F_ComparaImagenRegistroPreview.QrLabel18.Caption := MaskEdit1.Text+' a '+MaskEdit2.Text;
  F_ComparaImagenRegistroPreview.QuickRep1.Preview;
  F_ComparaImagenRegistroPreview.Destroy;
  F_ComparaImagenRegistroPreview:= Nil;

end;

procedure TF_ComparaImagenRegistro.MaskEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_ComparaImagenRegistro.MaskEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = 13 then ComboBox1.SetFocus;

end;

procedure TF_ComparaImagenRegistro.ComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If key = 13 then BitBtn9.SetFocus;

end;

end.
