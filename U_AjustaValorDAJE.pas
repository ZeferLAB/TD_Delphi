unit U_AjustaValorDAJE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, unMath;

type
  TF_AjustaValorDAJE = class(TForm)
    StatusBar1: TStatusBar;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    Label5: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_AjustaValorDAJE: TF_AjustaValorDAJE;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_AjustaValorDAJE.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_AjustaValorDAJE.BitBtn1Click(Sender: TObject);
var
  dat1, dat2, status : String;
  i: Integer;
  _ValorEmolLocal,
  _ValorTxFiscLocal,
  _ValorFecomLocal,
  _ValorDefPubLocal,
  _PGELocal,
  _FMMPBALocal: Double;
begin
  i:= 0;

  dat1 := QuotedStr(ConvData(MaskEdit1.Text));
  dat2 := QuotedStr(ConvData(MaskEdit2.Text));

  _ValorEmolLocal   := 0; 
  _ValorTxFiscLocal := 0;
  _ValorFecomLocal  := 0;
  _ValorDefPubLocal := 0;
  _PGELocal         := 0;
  _FMMPBALocal      := 0;

  if (Not(DM.Configur.Active)) then
    DM.Configur.Open;

  dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('select count(*) as total from daje where data_emi BETWEEN ' + dat1 + ' AND ' + dat2);
  dm.qryGenerico.Open;

  Label2.Caption:= 'Total: '+inttostr(Dm.qryGenerico.FieldByName('total').AsInteger);

  dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('select * from daje where data_emi BETWEEN ' + dat1 + ' AND ' + dat2);
  dm.qryGenerico.Open;

  dm.qryGenerico.First;
  while not dm.qryGenerico.eof do
  begin

    _ValorEmolLocal    := SimpleRoundTo(((dm.qryGenerico.FieldByName('vr_daje').AsCurrency * DM.Configur.FieldByName('emol_daje').AsCurrency)/100),-2);
    _ValorTxFiscLocal  := SimpleRoundTo(((dm.qryGenerico.FieldByName('vr_daje').AsCurrency * DM.Configur.FieldByName('tx_fiscal_daje').AsCurrency)/100),-2);
    _ValorFecomLocal   := SimpleRoundTo(((dm.qryGenerico.FieldByName('vr_daje').AsCurrency * DM.Configur.FieldByName('fecom_daje').AsCurrency)/100),-2);
    _ValorDefPubLocal  := SimpleRoundTo(((dm.qryGenerico.FieldByName('vr_daje').AsCurrency * DM.Configur.FieldByName('def_pub_daje').AsCurrency)/100),-2);
    _PGELocal          := SimpleRoundTo(((dm.qryGenerico.FieldByName('vr_daje').AsCurrency * DM.Configur.FieldByName('vr_pge').AsCurrency)/100),-2);
    _FMMPBALocal       := SimpleRoundTo(((dm.qryGenerico.FieldByName('vr_daje').AsCurrency * DM.Configur.FieldByName('fmmpba').AsCurrency)/100),-2);

    if dm.qryGenerico.FieldByName('iddaje_tj').AsString = '' then
    begin
      showmessage('Daje com codigo do emissor não preenchido: '+dm.qryGenerico.FieldByName('numero_daje').AsString+' '+dm.qryGenerico.FieldByName('serie_daje').AsString);
      Abort;
    end;

    Dm.qryGenerico_Aux.Close;
    Dm.qryGenerico_Aux.SQL.Clear;
    Dm.qryGenerico_Aux.SQL.Add('UPDATE daje SET ');
    Dm.qryGenerico_Aux.SQL.Add(' emol_daje = ' + QuotedStr(StringReplace(FloatToStr(_ValorEmolLocal), ',', '.', [rfReplaceAll])));
    Dm.qryGenerico_Aux.SQL.Add(', tx_fisca_daje = ' + QuotedStr(StringReplace(FloatToStr(_ValorTxFiscLocal), ',', '.', [rfReplaceAll])));
    Dm.qryGenerico_Aux.SQL.Add(', fecom_daje = ' + QuotedStr(StringReplace(FloatToStr(_ValorFecomLocal), ',', '.', [rfReplaceAll])));
    Dm.qryGenerico_Aux.SQL.Add(', def_pub_daje = ' + QuotedStr(StringReplace(FloatToStr(_ValorDefPubLocal), ',', '.', [rfReplaceAll])));
    Dm.qryGenerico_Aux.SQL.Add(', vr_pge = ' + QuotedStr(StringReplace(FloatToStr(_PGELocal), ',', '.', [rfReplaceAll])));
    Dm.qryGenerico_Aux.SQL.Add(', fmmpba = ' + QuotedStr(StringReplace(FloatToStr(_FMMPBALocal), ',', '.', [rfReplaceAll])));
    Dm.qryGenerico_Aux.SQL.Add('WHERE numero_daje = '+QuotedStr(dm.qryGenerico.FieldByName('numero_daje').AsString)+' and serie_daje = '+QuotedStr(dm.qryGenerico.FieldByName('serie_daje').AsString)+' and iddaje_tj = '+QuotedStr(dm.qryGenerico.FieldByName('iddaje_tj').AsString)+' ');

    Dm.qryGenerico_Aux.SQL.SaveToFile('c:\select.txt');

    Dm.qryGenerico_Aux.ExecSql;

    inc(i);

    Label3.Caption:= 'Quant. Daje Processada ...'+ inttostr(i);
    Label3.Update;

    dm.qryGenerico.Next;
  end;




end;

procedure TF_AjustaValorDAJE.MaskEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  Begin
    MaskEdit2.SetFocus;
  End;

end;

procedure TF_AjustaValorDAJE.MaskEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  Begin
    BitBtn1.SetFocus;
  End;

end;

end.
