unit maval19;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg, StdCtrls,
  ComCtrls, NcsAlignment;

type
  TF_maval19 = class(TForm)
    QuickRep1: TQuickRep;
    QRChildBand1: TQRChildBand;
    QRRDbarra1: TQRRDbarra;
    QRAngledDBText1: TQRAngledDBText;
    QRAngledLabel1: TQRAngledLabel;
    QRAngledLabel3: TQRAngledLabel;
    QRAngledDBText4: TQRAngledDBText;
    QRAngledLabel4: TQRAngledLabel;
    QRAngledDBText5: TQRAngledDBText;
    QRAngledLabel5: TQRAngledLabel;
    QRAngledDBText6: TQRAngledDBText;
    QRAngledLabel6: TQRAngledLabel;
    QRAngledDBText7: TQRAngledDBText;
    QRRDbarra2: TQRRDbarra;
    QRAngledDBText3: TQRAngledDBText;
    QRImage2: TQRImage;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText42: TQRDBText;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRLabel31: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRImage1: TQRImage;
    QRDBText52: TQRDBText;
    QRRichText3: TQRRichText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    RichEdit1: TRichEdit;
    NcsAlignment1: TNcsAlignment;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    ChildBand1: TQRChildBand;
    QRDBText5: TQRDBText;
    QRRichText2: TQRRichText;
    QRRichText1: TQRRichText;
    QRAngledDBText2: TQRAngledDBText;
    QRAngledLabel2: TQRAngledLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_maval19: TF_maval19;

implementation

uses DMTD, menu;

{$R *.DFM}

procedure TF_maval19.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
 linha, linha2 : string;
  x : Integer;
begin
  RichEdit1.Lines.Clear; 
  qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
  qrimage1.Picture.LoadFromFile('s:\td\assinatura\Mlgomes.jpg');
  if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;
  linha := 'Servimo-nos da presente para notificá-lo(a), nos termos do parágrafo 2º do Artigo';
  linha := linha + ' 2º do Decreto Lei 911 de 01/10/69, do débito em atraso apurado no contrato ' + dm.arqaux.fieldbyname('contrato').asstring + ', ';
  linha := linha + 'perante ' + Trim(dm.arqaux.fieldbyname('banco').asstring) + ', '+ 'correspondente as parcelas dos vencimentos ';
  linha := linha + trim(dm.arqaux.fieldbyname('cid_banco').asstring) + ', cujo valor conhecido nesta data é de R$ ' + dm.arqaux.fieldbyname('vr_venc').asstring + '.';
  richedit1.Lines.Add(linha);
  QrRichText1.Lines.Clear;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    if (Length(RichEdit1.Lines.Strings[x]) >= 65) then
    begin
      NcsAlignment1.Text     := RichEdit1.Lines.Strings[x];
      Qrrichtext1.Lines.Add(NcsAlignment1.result);
    end
    else
    begin
      Qrrichtext1.Lines.Add(RichEdit1.Lines.Strings[x]);
    end;
  end;
  linha2 := '';

  linha2 := 'Solicitamos que o pagamento do débito ora apontado seja efetuado dentro do prazo improrrogável de 3 (três) dias a contar do recebimento desta, sob pena de, não o ' +
  'fazendo, ensejar o vencimento antecipado  da  dívida vincenda  conforme contrato ' +
  'firmado por V. Sa., e a tomada  das  medidas  judiciais  cabíveis,  bem como o ' +
  'a pontamento do débito junto ao Órgãos de Proteção ao Crédito.';

  richedit1.Lines.clear;
  richedit1.Lines.Add(linha2);
  QrRichText2.Lines.Clear;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    if (Length(RichEdit1.Lines.Strings[x]) >= 65) then
    begin
      NcsAlignment1.Text     := RichEdit1.Lines.Strings[x];
      Qrrichtext2.Lines.Add(NcsAlignment1.result);
    end
    else
    begin
      Qrrichtext2.Lines.Add(RichEdit1.Lines.Strings[x]);
    end;
  end;


  qrlabel32.caption := dm.arqaux.fieldbyname('cep').asstring + ' - ' + dm.arqaux.fieldbyname('cidade').asstring;
  qrlabel52.caption := 'São Paulo, ' + dataextenso(dm.arqaux.fieldbyname('data_reg').asstring, False, '');
end;

procedure TF_maval19.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrRdBarra1.Text := 'RL' + dm.arqaux.fieldbyname('rld').asstring + 'BR';
  QrRdBarra2.Text := 'RL' + dm.arqaux.fieldbyname('rld').asstring + 'BR';
end;

end.
