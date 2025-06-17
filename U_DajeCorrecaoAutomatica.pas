unit U_DajeCorrecaoAutomatica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, unMath;

type
  TF_DajeCorrecaoAutomatica = class(TForm)
    MkDataIni: TMaskEdit;
    MkDataFim: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MkDataIniKeyPress(Sender: TObject; var Key: Char);
    procedure MkDataFimKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_DajeCorrecaoAutomatica: TF_DajeCorrecaoAutomatica;

implementation

uses DMTD;

{$R *.DFM}

procedure TF_DajeCorrecaoAutomatica.BitBtn1Click(Sender: TObject);
var
  _ValorDaje, _ValorDajeComplementar, _EmolDaje, _TaxaFiscalDaje, _FecomDaje, _DefPublicaDaje, _PGE, _TotaDAJE : Currency;
begin

  dm.Configur.Close;
  dm.Configur.Open;
  
  dm.qryGenerico_Aux.RequestLive := False;
  dm.qryGenerico_Aux.Close;
  dm.qryGenerico_Aux.Sql.Clear;
  dm.qryGenerico_Aux.Sql.Add('select * from daje where data_emi >= '+QuotedStr(FormatDateTime('yyyy-mm-dd', strtodate(MkDataIni.Text)))+' and data_emi <= '+QuotedStr(FormatDateTime('yyyy-mm-dd', strtodate(MkDataFim.Text)))+'');
  dm.qryGenerico_Aux.Sql.Add('order by data_emi');
  dm.qryGenerico_Aux.Open;

  dm.qryGenerico_Aux.First;


  while not dm.qryGenerico_Aux.Eof do
  Begin
    dm.qryGenerico.RequestLive := False;
    dm.qryGenerico.Close;
    dm.qryGenerico.Sql.Clear;
    dm.qryGenerico.Sql.Add('select * from tab_ato2 where cod_ato = '+QuotedStr(dm.qryGenerico_Aux.FieldByName('cod_ato').AsString));
    dm.qryGenerico.Sql.Add('group by data');
    dm.qryGenerico.Open;
    dm.qryGenerico.FindLast;

    if _ValorDaje <> dm.qryGenerico.FieldByName('total').AsCurrency Then
      _ValorDaje:= dm.qryGenerico.FieldByName('total').AsCurrency;

    if (dm.Configur.RecordCount <> 0) then
    begin
      _EmolDaje    := RoundTo(((_ValorDaje * dm.Configur.FieldByName('emol_daje').AsCurrency)/100),-2);
      _TaxaFiscalDaje  := RoundTo(((_ValorDaje * dm.Configur.FieldByName('tx_fiscal_daje').AsCurrency)/100),-2);
      _FecomDaje   := RoundTo(((_ValorDaje * dm.Configur.FieldByName('fecom_daje').AsCurrency)/100),-2);
      _DefPublicaDaje  := RoundTo(((_ValorDaje * dm.Configur.FieldByName('def_pub_daje').AsCurrency)/100),-2);
      _PGE          := RoundTo(((_ValorDaje * dm.Configur.FieldByName('vr_pge').AsCurrency)/100),-2);

      _TotaDAJE     := (_EmolDaje + _TaxaFiscalDaje + _FecomDaje + _DefPublicaDaje + _PGE);

      if (_ValorDaje <> _TotaDAJE) then
        _DefPublicaDaje := _DefPublicaDaje + (_ValorDaje - _TotaDAJE);

      Dm.qryGenerico_Auxiliar2.Close;
      Dm.qryGenerico_Auxiliar2.SQL.Clear;
      Dm.qryGenerico_Auxiliar2.SQL.Add('UPDATE daje SET vr_daje = ' + QuotedStr(StringReplace(FloatToStr(_ValorDaje), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar2.SQL.Add(', emol_daje = ' + QuotedStr(StringReplace(FloatToStr(_EmolDaje), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar2.SQL.Add(', tx_fisca_daje = ' + QuotedStr(StringReplace(FloatToStr(_TaxaFiscalDaje), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar2.SQL.Add(', fecom_daje = ' + QuotedStr(StringReplace(FloatToStr(_FecomDaje), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar2.SQL.Add(', def_pub_daje = ' + QuotedStr(StringReplace(FloatToStr(_DefPublicaDaje), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar2.SQL.Add(', vr_pge = ' + QuotedStr(StringReplace(FloatToStr(_PGE), ',', '.', [rfReplaceAll])));
      Dm.qryGenerico_Auxiliar2.SQL.Add('WHERE numero_daje = '+QuotedStr(dm.qryGenerico_Aux.FieldByName('numero_daje').AsString)+' and serie_daje = '+QuotedStr(dm.qryGenerico_Aux.FieldByName('serie_daje').AsString)+'');
      Dm.qryGenerico_Auxiliar2.ExecSql;

    end;
    dm.qryGenerico_Aux.Next;
  end;
  ShowMessage('Rotina executada com sucesso!');

end;

procedure TF_DajeCorrecaoAutomatica.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_DajeCorrecaoAutomatica.MkDataIniKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 Then
    MkDataFim.SetFocus;
end;

procedure TF_DajeCorrecaoAutomatica.MkDataFimKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 Then
    BitBtn1.SetFocus;
end;

end.
