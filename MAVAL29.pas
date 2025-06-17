unit maval29;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg;

type
  TF_maval29 = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
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
    QRShape1: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText33: TQRDBText;
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
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRImage2: TQRImage;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel44: TQRLabel;
    QRLabel43: TQRLabel;
    QRAngledLabel2: TQRAngledLabel;
    QRAngledDBText2: TQRAngledDBText;
    QRImage3: TQRImage;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel32: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRImage1: TQRImage;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel9: TQRLabel;
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
  F_maval29: TF_maval29;

implementation

uses DMTD;

{$R *.DFM}

procedure TF_maval29.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
  if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;
  Qrlabel42.caption := dm.arqaux.fieldbyname('bairro').asstring + ' - ' + dm.arqaux.fieldbyname('cidade').asstring + ' - ' + dm.arqaux.fieldbyname('cep').asstring;
  Qrlabel43.caption := dm.arqaux.fieldbyname('endereco').asstring + ' - ' + dm.arqaux.fieldbyname('bairro').asstring;
 { if (strtoint(dm.arqaux.fieldbyname('model').asstring) = 34) or (strtoint(dm.arqaux.fieldbyname('model').asstring) = 35) or (strtoint(dm.arqaux.fieldbyname('model').asstring) = 133) then
   begin
     qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
     if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;
     qrlabel5.Enabled   := true;
     qrlabel7.Enabled   := true;
     qrlabel8.Enabled   := true;
     qrlabel6.Enabled   := true;
     qrlabel5.Enabled   := true;
     qrlabel33.Enabled  := true;
     qrdbtext17.Enabled := true;
     qrdbtext25.Enabled := true;
     qrdbtext26.Enabled := true;
     qrdbtext27.Enabled := true;
     qrdbtext15.Enabled := true;
     qrdbtext34.Enabled := true;
     qrlabel4.Enabled   := false;
     qrlabel35.Enabled  := false;
     qrlabel36.Enabled  := false;
     qrlabel37.Enabled  := false;
     qrlabel38.Enabled  := false;
     qrlabel39.Enabled  := false;
     qrlabel40.Enabled  := false;
     qrlabel41.Enabled  := false;
     qrlabel42.Enabled  := false;
     qrlabel43.Enabled  := false;

     qrlabel44.Enabled  := false;
     qrlabel45.Enabled  := false;
     qrlabel46.Enabled  := false;
     qrlabel47.Enabled  := false;
     qrlabel48.Enabled  := false;
     qrlabel49.Enabled  := false;
     qrlabel50.Enabled  := false;
     qrlabel51.Enabled  := false;
     qrlabel52.Enabled  := false;
     qrlabel53.Enabled  := false;
     qrlabel54.Enabled  := false;
     qrlabel55.Enabled  := false;
     qrlabel56.Enabled  := false;
     qrlabel57.Enabled  := false;
     qrlabel58.Enabled  := false;
     qrlabel59.Enabled  := false;
     qrlabel60.Enabled  := false;
     qrlabel61.Enabled  := false;


     qrdbtext14.Enabled := false;
     qrdbtext32.Enabled := false;
     qrdbtext34.Enabled := false;
     qrdbtext35.Enabled := false;
     qrdbtext36.Enabled := false;
     qrdbtext37.Enabled := false;
     qrdbtext38.Enabled := false;
     qrdbtext39.Enabled := false;
     qrdbtext40.Enabled := false;
     qrdbtext41.Enabled := false;
     qrdbtext42.Enabled := false;
     qrdbtext43.Enabled := false;
     qrdbtext44.Enabled := false;
     qrdbtext45.Enabled := false;
     qrdbtext46.Enabled := false;
     qrdbtext47.Enabled := false;
     qrdbtext48.Enabled := false;
     qrdbtext49.Enabled := false;
     qrdbtext50.Enabled := false;
     qrdbtext51.Enabled := false;

     qrdbtext7.Enabled := true;
     qrdbtext8.Enabled := true;
     qrdbtext9.Enabled := true;
     qrdbtext10.Enabled := true;
     qrdbtext11.Enabled := true;
     qrdbtext12.Enabled := true;
     qrdbtext13.Enabled := true;
     qrdbtext15.Enabled := true;
     qrlabel34.Enabled  := true;

     qrshape12.Enabled  := false;
     qrlabel1.Font.Size := 16;
     qrlabel1.caption   := 'NOTIFICAÇÃO';
     qrlabel9.caption := 'Atenciosamente,';
     qrlabel8.caption := 'VALOR R$';
     qrlabel5.caption := 'Firmado em: ';
     qrimage1.Height := 54;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura waldir azul1.jpg');
     qrlabel33.caption := 'Contrato No.: ' + dm.arqaux.fieldbyname('contrato').asstring;

     qrrichtext1.Lines.Clear;
     qrrichtext1.Lines.Add('Vimos por meio desta, em decorrência do contrato supra  firmado por V.Sa., notificá-lo(a) para que no');
     qrrichtext1.Lines.Add('prazo de 48 (quarenta e oito) horas, a contar do recebimento desta, efetue o pagamento, no endereço');
     qrrichtext1.Lines.Add('abaixo indicado, da(s) prestação(ões) em atraso e relativa(s) ao contrato em referência.');

     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('O(s) valor(res) da(s) prestações em atraso será(ão) acrescido(s) dos encargos contratuais e da  mora');
     qrrichtext2.Lines.Add('até sua efetiva liquidação.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Outrossim,  caso  V.Sa., já  tenha  pago a(s) referidas  prestação(ões), objeto da presente notificação,');
     qrrichtext2.Lines.Add('rogamos considerar a mesma sem efeito, exibindo-nos entretanto, os devidos comprovantes.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Alertamos que o não pagamento da(s) prestação(ões) em epígrafe, ensejará V.Sa., em mora para  os');
     qrrichtext2.Lines.Add('efeitos legais (Decreto-Lei nº 911 de 01/10/69), e adoção de medidas judiciais cabíveis, possibilitando');
     qrrichtext2.Lines.Add('promover a imediata  ação de busca e apreensão do bem alienado fiduciariamente.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Na expectativa de suas providências, subscrevemo-nos.');
   end;

  if (strtoint(dm.arqaux.fieldbyname('model').asstring) = 411) or (strtoint(dm.arqaux.fieldbyname('model').asstring) = 412) or (strtoint(dm.arqaux.fieldbyname('model').asstring) = 1157) or (strtoint(dm.arqaux.fieldbyname('model').asstring) = 157) then
   begin
     qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
     if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;
     qrlabel5.Enabled   := true;
     qrlabel7.Enabled   := true;
     qrlabel8.Enabled   := true;
     qrlabel6.Enabled   := true;
     qrlabel5.Enabled   := true;
     qrlabel33.Enabled  := true;
     qrdbtext17.Enabled := true;
     qrdbtext25.Enabled := true;
     qrdbtext26.Enabled := true;
     qrdbtext27.Enabled := true;
     qrdbtext15.Enabled := true;

     qrlabel4.Enabled   := false;

     qrlabel35.Enabled  := false;
     qrlabel36.Enabled  := false;
     qrlabel37.Enabled  := false;
     qrlabel38.Enabled  := false;
     qrlabel39.Enabled  := false;
     qrlabel40.Enabled  := false;
     qrlabel41.Enabled  := false;
     qrlabel42.Enabled  := false;
     qrlabel43.Enabled  := false;

     qrlabel44.Enabled  := false;
     qrlabel45.Enabled  := false;
     qrlabel46.Enabled  := false;
     qrlabel47.Enabled  := false;
     qrlabel48.Enabled  := false;
     qrlabel49.Enabled  := false;
     qrlabel50.Enabled  := false;
     qrlabel51.Enabled  := false;
     qrlabel52.Enabled  := false;
     qrlabel53.Enabled  := false;
     qrlabel54.Enabled  := false;
     qrlabel55.Enabled  := false;
     qrlabel56.Enabled  := false;
     qrlabel57.Enabled  := false;
     qrlabel58.Enabled  := false;
     qrlabel59.Enabled  := false;
     qrlabel60.Enabled  := false;
     qrlabel61.Enabled  := false;


     qrdbtext14.Enabled := false;
     qrdbtext32.Enabled := false;
     qrdbtext34.Enabled := false;
     qrdbtext35.Enabled := false;
     qrdbtext36.Enabled := false;
     qrdbtext37.Enabled := false;
     qrdbtext38.Enabled := false;
     qrdbtext39.Enabled := false;
     qrdbtext40.Enabled := false;
     qrdbtext41.Enabled := false;
     qrdbtext42.Enabled := false;
     qrdbtext43.Enabled := false;
     qrdbtext44.Enabled := false;
     qrdbtext45.Enabled := false;
     qrdbtext46.Enabled := false;
     qrdbtext47.Enabled := false;
     qrdbtext48.Enabled := false;
     qrdbtext49.Enabled := false;
     qrdbtext50.Enabled := false;
     qrdbtext51.Enabled := false;

     qrshape12.Enabled  := false;
     qrdbtext34.Enabled := true;

     qrdbtext7.Enabled := true;
     qrdbtext8.Enabled := true;
     qrdbtext9.Enabled := true;
     qrdbtext10.Enabled := true;
     qrdbtext11.Enabled := true;
     qrdbtext12.Enabled := true;
     qrdbtext13.Enabled := true;
     qrdbtext15.Enabled := true;
     qrlabel34.Enabled  := true;

     qrlabel1.Font.Size := 16;
     qrlabel1.caption   := 'NOTIFICAÇÃO';
     qrlabel9.caption := '';
     qrlabel8.caption := 'VALOR R$';
     qrlabel5.caption := 'Firmado em: ';
     qrimage1.Height := 121;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura fernando luz.jpg');
     qrlabel33.caption := 'Ref.: Contrato de Financiamento com Alienação Fiduciária no.: ' + dm.arqaux.fieldbyname('contrato').asstring;

     qrrichtext1.Lines.Clear;
     qrrichtext1.Lines.Add('Vimos por meio desta, em decorrência  do  contrato supra firmado por V.Sa., notificá-lo  para  que  no');
     qrrichtext1.Lines.Add('prazo   de   48 (quarenta e oito)  horas,  a  contar  do  recebimento  desta,  efetue  o  pagamento,  no');
     qrrichtext1.Lines.Add('endereço abaixo indicado, da(s) prestação(ões) em atraso e relativa(s) ao contrato referido.');

     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('O(s) valor(res) da(s) prestações em atraso será(ão) acrescido(s) dos encargos contratuais e da  mora');
     qrrichtext2.Lines.Add('até sua efetiva liquidação.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Outrossim,  caso  V.Sa., já  tenha  pago  a(s) referidas  prestação(ões), objeto da presente notificação,');
     qrrichtext2.Lines.Add('rogamos considerar a mesma sem efeito, exibindo-nos entretanto, os devidos comprovantes.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Alertamos que o não pagamento da(s)  prestação(ões) em epígrafe, constituirá  V.Sa., em  mora para');
     qrrichtext2.Lines.Add('os efeitos legais (Decreto-Lei nº 911  de  01/10/69), possibilitando  tomar  medidas  judiciais  cabíveis,');
     qrrichtext2.Lines.Add('inclusive promover a imediata  ação de busca e apreensão do bem alienado fiduciariamente.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Na expectativa de suas providências, subscrevemo-nos.');
   end;

  if (strtoint(dm.arqaux.fieldbyname('model').asstring) = 33)  then
   begin
     qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
     if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;
     qrlabel4.Enabled   := true;
     qrlabel5.Enabled   := true;
     qrlabel7.Enabled   := true;
     qrlabel8.Enabled   := true;
     qrlabel35.Enabled  := true;
     qrlabel5.Enabled   := true;
     qrlabel33.Enabled  := true;
     qrdbtext14.Enabled := true;
     qrdbtext17.Enabled := true;
     qrdbtext32.Enabled := true;
     qrdbtext26.Enabled := true;
     qrdbtext27.Enabled := true;
     qrdbtext15.Enabled := true;

     qrlabel6.Enabled   := false;
     qrlabel36.Enabled  := false;
     qrlabel37.Enabled  := false;
     qrlabel38.Enabled  := false;
     qrlabel39.Enabled  := false;
     qrlabel40.Enabled  := false;
     qrlabel41.Enabled  := false;
     qrlabel42.Enabled  := false;
     qrlabel43.Enabled  := false;

     qrlabel44.Enabled  := false;
     qrlabel45.Enabled  := false;
     qrlabel46.Enabled  := false;
     qrlabel47.Enabled  := false;
     qrlabel48.Enabled  := false;
     qrlabel49.Enabled  := false;
     qrlabel50.Enabled  := false;
     qrlabel51.Enabled  := false;
     qrlabel52.Enabled  := false;
     qrlabel53.Enabled  := false;
     qrlabel54.Enabled  := false;
     qrlabel55.Enabled  := false;
     qrlabel56.Enabled  := false;
     qrlabel57.Enabled  := false;
     qrlabel58.Enabled  := false;
     qrlabel59.Enabled  := false;
     qrlabel60.Enabled  := false;
     qrlabel61.Enabled  := false;



     qrdbtext14.Enabled := false;
     qrdbtext25.Enabled := false;
     qrdbtext34.Enabled := false;
     qrdbtext35.Enabled := false;
     qrdbtext36.Enabled := false;
     qrdbtext37.Enabled := false;
     qrdbtext38.Enabled := false;
     qrdbtext39.Enabled := false;

     qrdbtext40.Enabled := false;
     qrdbtext41.Enabled := false;
     qrdbtext42.Enabled := false;
     qrdbtext43.Enabled := false;
     qrdbtext44.Enabled := false;
     qrdbtext45.Enabled := false;
     qrdbtext46.Enabled := false;
     qrdbtext47.Enabled := false;
     qrdbtext48.Enabled := false;
     qrdbtext49.Enabled := false;
     qrdbtext50.Enabled := false;
     qrdbtext51.Enabled := false;


     qrshape12.Enabled  := false;


     qrlabel6.Enabled   := false;
     qrdbtext25.Enabled := false;
     qrlabel4.Enabled   := true;
     qrlabel35.Enabled  := true;

     qrdbtext7.Enabled := true;
     qrdbtext8.Enabled := true;
     qrdbtext9.Enabled := true;
     qrdbtext10.Enabled := true;
     qrdbtext11.Enabled := true;
     qrdbtext12.Enabled := true;
     qrdbtext13.Enabled := true;
     qrdbtext15.Enabled := true;
     qrlabel34.Enabled  := true;     


     qrdbtext14.Enabled := true;
     qrdbtext32.Enabled := true;
     qrdbtext34.Enabled := true;
     qrlabel1.Font.Size := 16;
     qrlabel1.caption   := 'NOTIFICAÇÃO';
     qrlabel9.caption := 'Atenciosamente,';
     qrlabel8.caption := 'VALOR NO VENCIMENTO R$';
     qrlabel5.caption := 'Prezado(a) Senhor(a),';
     qrimage1.Height := 54;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura waldir azul1.jpg');
     qrlabel33.caption := 'Ref.: Contrato de Arrendamento Mercantil No.: ' + dm.arqaux.fieldbyname('contrato').asstring;

     qrrichtext1.Lines.Clear;
     qrrichtext1.Lines.Add('Vimos através da presente, em decorrência do contrato supra firmado por V.Sa., notificá-lo(a)(s) para');
     qrrichtext1.Lines.Add('que efetue o pagamento, no endereço  abaixo  indicado, da(s)  parcela(s)  e  residual(ais)  em  atraso');
     qrrichtext1.Lines.Add('relativo(s) ao contrato em referência:');

     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('O(s)   valor(res)  da(s)   parcela(s)  e/ou   residual(ais)  acima   será(ão)  acrescido(s)  dos  encargos');
     qrrichtext2.Lines.Add('contratuais e da mora até sua efetiva liquidação.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Outrossim, caso V.Sa., já tenha pago  referida(s)  parcela(s)  e/ou  residual(ais),  objeto  da  presente');
     qrrichtext2.Lines.Add('notificação, rogamos considerar sem efeito, exibindo-nos entretanto, os devidos comprovantes.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Sendo assim, fica V.Sa. notificado(a) para  que no  prazo  de  48(quarenta e oito) horas, contadas do');
     qrrichtext2.Lines.Add('recebimento desta, efetue o pagamento do débito ou proceda a imediata devolução do veículo objeto');
     qrrichtext2.Lines.Add('do arrendamento mercantil, na');
     qrrichtext2.Lines.Add(dm.arqaux.fieldbyname('end_banco').asstring );
     qrrichtext2.Lines.Add('não fazendo, vir a sofrer as medidas judiciais cabíveis, dentre elas a Reintegração de Posse do Bem.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Outrossim, Alertamos que o não atendimento a esta notificação implicará na  inscrição  do  nome  de');
     qrrichtext2.Lines.Add('V.Sa. nos Serviços de  Cadastro do sistema  de  Proteção  ao  Crédito, e  entidades  assemelhadas,');
     qrrichtext2.Lines.Add('independentemente de qualquer outro aviso por parte desta empresa.');

   end;


  if (strtoint(dm.arqaux.fieldbyname('model').asstring) = 313)  then
   begin
     qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
     if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;
     qrlabel36.Enabled  := true;
     qrlabel37.Enabled  := true;
     qrlabel38.Enabled  := true;
     qrlabel39.Enabled  := true;
     qrlabel40.Enabled  := true;
     qrlabel41.Enabled  := true;
     qrlabel42.Enabled  := true;
     qrlabel43.Enabled  := true;

     qrlabel44.Enabled  := true;
     qrlabel45.Enabled  := true;
     qrlabel46.Enabled  := true;
     qrlabel47.Enabled  := true;
     qrlabel48.Enabled  := true;
     qrlabel49.Enabled  := true;
     qrlabel50.Enabled  := true;
     qrlabel51.Enabled  := true;
     qrlabel52.Enabled  := true;
     qrlabel53.Enabled  := true;
     qrlabel54.Enabled  := true;
     qrlabel55.Enabled  := true;
     qrlabel56.Enabled  := true;
     qrlabel57.Enabled  := true;


     qrdbtext34.Enabled := true;
     qrdbtext35.Enabled := true;
     qrdbtext36.Enabled := true;
     qrdbtext37.Enabled := true;
     qrdbtext38.Enabled := true;
     qrdbtext39.Enabled := true;

     qrdbtext40.Enabled := true;
     qrdbtext41.Enabled := true;
     qrdbtext42.Enabled := true;
     qrdbtext43.Enabled := true;
     qrdbtext44.Enabled := true;
     qrdbtext45.Enabled := true;
     qrdbtext46.Enabled := true;
     qrdbtext47.Enabled := true;
     qrdbtext48.Enabled := true;
     qrdbtext49.Enabled := true;
     qrdbtext50.Enabled := true;
     qrdbtext51.Enabled := true;


     qrlabel58.Enabled  := false;
     qrlabel59.Enabled  := false;
     qrlabel60.Enabled  := false;
     qrlabel61.Enabled  := false;


     qrdbtext17.Enabled := false;
     qrshape12.Enabled  := true;


     qrdbtext7.Enabled  := false;
     qrdbtext8.Enabled  := false;
     qrdbtext9.Enabled  := false;
     qrdbtext10.Enabled := false;
     qrdbtext11.Enabled := false;
     qrdbtext12.Enabled := false;
     qrdbtext13.Enabled := false;
     qrdbtext15.Enabled := false;
     qrlabel34.Enabled  := false;     

     qrlabel4.Enabled   := false;
     qrlabel5.Enabled   := false;
     qrlabel4.Enabled   := false;
     qrlabel6.Enabled   := false;
     qrlabel7.Enabled   := false;
     qrlabel8.Enabled   := false;
     qrlabel33.Enabled  := false;
     qrlabel35.Enabled  := false;
     qrdbtext15.Enabled := false;
     qrdbtext25.Enabled := false;
     qrdbtext14.Enabled := false;
     qrdbtext27.Enabled := false;
     qrdbtext26.Enabled := false;
     qrdbtext32.Enabled := false;

     qrlabel1.caption   := 'NOTIFICAÇÃO EXTRAJUDICIAL';
     qrlabel1.Font.Size := 14;
     qrlabel9.caption := 'Atenciosamente,';
     qrlabel39.caption := 'Prezado(a) Senhor(a),';
     qrimage1.Height := 121;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura fernando luz.jpg');
     qrlabel33.caption := 'Ref.: Contrato de Arrendamento Mercantil No.: ' + dm.arqaux.fieldbyname('contrato').asstring;
     qrlabel42.caption := 'CONTRATO : ' + dm.arqaux.fieldbyname('contrato').asstring;

     qrrichtext1.Lines.Clear;

     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Nossos    registros   acusam    ATRASO    NO    PAGAMENTO    do   Contrato   de   Arrendamento  de');
     qrrichtext2.Lines.Add('responsabilidade de V.Sa. conforme acima indicado.');
     qrrichtext2.Lines.Add('Informamos que V.Sa. está NOTIFICADO(A)  a  comparecer  no(s)  endereço(s), acima relacionado(s),');
     qrrichtext2.Lines.Add('para efetuar o pagamento das obrigações vencidas com os acréscimos contratuais previstos, DENTRO');
     qrrichtext2.Lines.Add('DO PRAZO MÁXIMO DE 2 (DOIS) DIAS ÚTEIS,  a contar do recebimento da presente.');
     qrrichtext2.Lines.Add('Informamos ainda que, ultrapassado esse prazo sem a devida quitação, passarão a  ser  devidas todas');
     qrrichtext2.Lines.Add('as obrigações contratuais e demais  consequências  de  direito, inclusive  o  ajuizamento  das  medidas');
     qrrichtext2.Lines.Add('judiciais cabíveis.');
     qrrichtext2.Lines.Add('Caso o pagamento tenha sido efetuado no período que  compreende  a emissão da presente e o efetivo');
     qrrichtext2.Lines.Add('recebimento, pedimos desconsiderar esta notificação.');
     
   end;

  if (strtoint(dm.arqaux.fieldbyname('model').asstring) = 311)  then
   begin
     qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
     if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;
     qrlabel36.Enabled  := true;
     qrlabel37.Enabled  := true;
     qrlabel38.Enabled  := true;
     qrlabel39.Enabled  := true;
     qrlabel40.Enabled  := true;
     qrlabel41.Enabled  := true;
     qrlabel42.Enabled  := true;
     qrlabel43.Enabled  := true;

     qrlabel44.Enabled  := true;
     qrlabel45.Enabled  := true;
     qrlabel46.Enabled  := true;
     qrlabel47.Enabled  := true;
     qrlabel48.Enabled  := true;
     qrlabel49.Enabled  := true;
     qrlabel50.Enabled  := true;
     qrlabel51.Enabled  := true;
     qrlabel52.Enabled  := true;
     qrlabel53.Enabled  := true;
     qrlabel54.Enabled  := true;
     qrlabel55.Enabled  := true;
     qrlabel56.Enabled  := true;
     qrlabel57.Enabled  := true;

     qrlabel58.Enabled  := false;
     qrlabel59.Enabled  := false;
     qrlabel60.Enabled  := false;
     qrlabel61.Enabled  := false;

     qrdbtext34.Enabled := true;
     qrdbtext35.Enabled := true;
     qrdbtext36.Enabled := true;
     qrdbtext37.Enabled := true;
     qrdbtext38.Enabled := true;
     qrdbtext39.Enabled := true;

     qrdbtext40.Enabled := true;
     qrdbtext41.Enabled := true;
     qrdbtext42.Enabled := true;
     qrdbtext43.Enabled := true;
     qrdbtext44.Enabled := true;
     qrdbtext45.Enabled := true;
     qrdbtext46.Enabled := true;
     qrdbtext47.Enabled := true;
     qrdbtext48.Enabled := true;
     qrdbtext49.Enabled := true;
     qrdbtext50.Enabled := true;
     qrdbtext51.Enabled := true;

     qrdbtext17.Enabled := false;
     qrshape12.Enabled  := true;


     qrdbtext7.Enabled  := false;
     qrdbtext8.Enabled  := false;
     qrdbtext9.Enabled  := false;
     qrdbtext10.Enabled := false;
     qrdbtext11.Enabled := false;
     qrdbtext12.Enabled := false;
     qrdbtext13.Enabled := false;
     qrdbtext15.Enabled := false;
     qrlabel34.Enabled  := false;     

     qrlabel4.Enabled   := false;
     qrlabel5.Enabled   := false;
     qrlabel4.Enabled   := false;
     qrlabel6.Enabled   := false;
     qrlabel7.Enabled   := false;
     qrlabel8.Enabled   := false;
     qrlabel33.Enabled  := false;
     qrlabel35.Enabled  := false;
     qrdbtext15.Enabled := false;
     qrdbtext25.Enabled := false;
     qrdbtext14.Enabled := false;
     qrdbtext27.Enabled := false;
     qrdbtext26.Enabled := false;
     qrdbtext32.Enabled := false;

     qrlabel1.caption   := 'NOTIFICAÇÃO EXTRAJUDICIAL';
     qrlabel1.Font.Size := 14;
     qrlabel9.caption := 'Atenciosamente,';
     qrlabel39.caption := 'Prezado(a) Senhor(a),';
     qrimage1.Height := 121;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura fernando luz.jpg');
     qrlabel33.caption := 'Ref.: Contrato de Arrendamento Mercantil No.: ' + dm.arqaux.fieldbyname('contrato').asstring;
     qrlabel42.caption := 'CONTRATO : ' + dm.arqaux.fieldbyname('contrato').asstring;

     qrrichtext1.Lines.Clear;

     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Nossos registros acusam ATRASO  NO  PAGAMENTO  do  Contrato  de  Crédito  de  responsabilidade');
     qrrichtext2.Lines.Add('de V.Sa. conforme acima indicado.');
     qrrichtext2.Lines.Add('Sentimos  informar-lhe,  para os efeitos previstos  no  parágrafo 2º,  do  art 2º,  Decreto-Lei  Nº 911,  de');
     qrrichtext2.Lines.Add('01/10/69, que V.Sa está NOTIFICADO(A) a comparecer no(s) endereço(s), acima  relacionado(s), para');
     qrrichtext2.Lines.Add('efetuar o pagamento  das  obrigações  vencidas  com  os  acréscimos  contratuais  previstos, DENTRO');
     qrrichtext2.Lines.Add('DO PRAZO MÁXIMO DE 2 (DOIS) DIAS ÚTEIS,  a contar do recebimento da presente.');
     qrrichtext2.Lines.Add('Informamos ainda que, ultrapassado esse prazo sem a devida quitação, passarão a  ser  devidas todas');
     qrrichtext2.Lines.Add('as obrigações contratuais e demais  consequências  de  direito, inclusive  o  ajuizamento  das  medidas');
     qrrichtext2.Lines.Add('judiciais cabíveis.');
     qrrichtext2.Lines.Add('Caso o pagamento tenha sido efetuado no período que  compreende  a  emissão  da  presente  e  o');
     qrrichtext2.Lines.Add('efetivo recebimento, pedimos desconsiderar esta notificação.');

   end;


  if (strtoint(dm.arqaux.fieldbyname('model').asstring) = 317)  then
   begin
     qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
     if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;
     qrlabel36.Enabled  := false;
     qrlabel37.Enabled  := false;
     qrlabel38.Enabled  := false;
     qrlabel39.Enabled  := false;
     qrlabel40.Enabled  := false;
     qrlabel41.Enabled  := false;
     qrlabel42.Enabled  := true;
     qrlabel43.Enabled  := true;

     qrlabel44.Enabled  := true;
     qrlabel45.Enabled  := true;
     qrlabel46.Enabled  := true;
     qrlabel47.Enabled  := true;
     qrlabel48.Enabled  := true;
     qrlabel49.Enabled  := true;
     qrlabel50.Enabled  := true;
     qrlabel51.Enabled  := true;
     qrlabel52.Enabled  := true;
     qrlabel53.Enabled  := true;
     qrlabel54.Enabled  := true;
     qrlabel55.Enabled  := true;
     qrlabel56.Enabled  := true;
     qrlabel57.Enabled  := true;

     qrlabel58.Enabled  := true;
     qrlabel59.Enabled  := true;
     qrlabel60.Enabled  := true;
     qrlabel61.Enabled  := true;


     qrdbtext34.Enabled := false;
     qrdbtext35.Enabled := false;
     qrdbtext36.Enabled := false;
     qrdbtext37.Enabled := true;
     qrdbtext38.Enabled := false;
     qrdbtext39.Enabled := true;

     qrdbtext40.Enabled := true;
     qrdbtext41.Enabled := true;
     qrdbtext42.Enabled := true;
     qrdbtext43.Enabled := true;
     qrdbtext44.Enabled := true;
     qrdbtext45.Enabled := true;
     qrdbtext46.Enabled := true;
     qrdbtext47.Enabled := true;
     qrdbtext48.Enabled := true;
     qrdbtext49.Enabled := true;
     qrdbtext50.Enabled := true;
     qrdbtext51.Enabled := true;

     qrdbtext17.Enabled := false;
     qrshape12.Enabled  := false;

     qrdbtext7.Enabled  := false;
     qrdbtext8.Enabled  := false;
     qrdbtext9.Enabled  := false;
     qrdbtext10.Enabled := false;
     qrdbtext11.Enabled := false;
     qrdbtext12.Enabled := false;
     qrdbtext13.Enabled := false;
     qrdbtext15.Enabled := false;
     qrlabel34.Enabled  := false;     

     qrlabel4.Enabled   := false;
     qrlabel5.Enabled   := false;
     qrlabel4.Enabled   := false;
     qrlabel6.Enabled   := false;
     qrlabel7.Enabled   := false;
     qrlabel8.Enabled   := false;
     qrlabel33.Enabled  := false;
     qrlabel35.Enabled  := false;
     qrdbtext15.Enabled := false;
     qrdbtext25.Enabled := false;
     qrdbtext14.Enabled := false;
     qrdbtext27.Enabled := false;
     qrdbtext26.Enabled := false;
     qrdbtext32.Enabled := false;

     qrlabel1.caption   := 'NOTIFICAÇÃO EXTRAJUDICIAL';
     qrlabel1.Font.Size := 14;
     qrlabel9.caption := 'Atenciosamente,';
     qrlabel39.caption := 'Prezado(a) Senhor(a),';
     qrimage1.Height := 121;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura fernando luz.jpg');
     qrlabel60.caption := dm.arqaux.fieldbyname('contrato').asstring;
     qrlabel61.caption := dm.arqaux.fieldbyname('end_banco').asstring;

     qrrichtext1.Lines.Clear;

     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('        Estando V.Sa. em débito com a empresa em epígrafe, sirvo-me da presente para NOTIFICÁ-LO');
     qrrichtext2.Lines.Add('(A), nos termos do artigo 2º, parágrafo 2º do Decreto-Lei 911 de 01/10/69, a efetuar no prazo');
     qrrichtext2.Lines.Add('improrrogável de 2 (dois) dias após o recebimento desta, o(s) pagamento(s) da(s) parcela(s) e ');
     qrrichtext2.Lines.Add('diferença de parcelas em atraso junto no endereço:');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('        O não atendimento da presente NOTIFICAÇÃO ensejerá conforme a legislação presente e o');
     qrrichtext2.Lines.Add('contrato de Alienação Fiduciária firmado com a Administradora, o vencimento antecipado de todo o saldo');
     qrrichtext2.Lines.Add('devedor, caso já não esteja vencido e a tomada de medidas judiciais cabíveis - Busca e Apreensão, que');
     qrrichtext2.Lines.Add('serão promovidas pela notificante, não sendo considerados os pagamentos efetuados parcialmente na');
     qrrichtext2.Lines.Add('Administradora ou em nossa Assessoria Juridica, para fins de "desconstituição de mora".');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('        Caso V.Sa. tenha efetuado o pagamento das parcelas concernentes ao débito, ANTERIORMENTE ao');
     qrrichtext2.Lines.Add('recebimento da presente notificação, solicitamos a fineza de desconsidera-la e aceitar nossas escusas,');
     qrrichtext2.Lines.Add('prevalecendo, todavia está, para que nos apresente os respectivos comprovantes de pagamento no prazo');
     qrrichtext2.Lines.Add('acima mencionado.');
     qrrichtext2.Lines.Add('Salientamos que pagamentos através de depósitos deverão ser efetuados somente com autorização expressa');
     qrrichtext2.Lines.Add('de nossa Assessoria, não sendo admitidos depósitos realizados em conta conrrente da Administradora após');
     qrrichtext2.Lines.Add('o recebimento desta.');

   end;}




end;

procedure TF_maval29.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrRdBarra1.Text := 'RL' + dm.arqaux.fieldbyname('rld').asstring + 'BR';
  QrRdBarra2.Text := 'RL' + dm.arqaux.fieldbyname('rld').asstring + 'BR';
end;

end.
