unit maval02;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QrAngLbl, Qrctrls, qrRDBarra, QuickRpt, ExtCtrls, jpeg;

type
  TF_maval02 = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRChildBand1: TQRChildBand;
    QRRDbarra1: TQRRDbarra;
    QRAngledDBText1: TQRAngledDBText;
    QRAngledLabel1: TQRAngledLabel;
    QRAngledDBText2: TQRAngledDBText;
    QRAngledLabel2: TQRAngledLabel;
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
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText15: TQRDBText;
    QRRichText1: TQRRichText;
    QRLabel33: TQRLabel;
    QRShape12: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText27: TQRDBText;
    QRRichText2: TQRRichText;
    QRLabel4: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRLabel61: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
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
    QRLabel32: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRLabel62: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRDBText53: TQRDBText;
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
  F_maval02: TF_maval02;

implementation

uses DMTD;

{$R *.DFM}


Function TrimChar(Texto: String; DelChar: Char): String;
Var S: String;
begin
  // Removendo espa�os/caracteres de uma string
  S := Texto;
  While Pos(DelChar,S) > 0 do
    Delete(S,Pos(DelChar,S),1);
  Result := Trim(S);
end;


procedure TF_maval02.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (Trim(Dm.ArqAux.FieldByName('cidadeestado').asString) <> '') then
  begin
    QrDbText52.Enabled := False;
    QrDbText53.Enabled := True;
  end
  else
  begin
    QrDbText52.Enabled := True;
    QrDbText53.Enabled := False;
  end;    




  if (trimchar(dm.arqaux.fieldbyname('model').asstring,'0') = '311') or (trimchar(dm.arqaux.fieldbyname('model').asstring,'0') = '313') then
   begin
    qrlabel74.Enabled := true;
    qrlabel74.caption := dm.arqaux.fieldbyname('cidade').asstring + ' - ' + dm.arqaux.fieldbyname('uf').asstring;
    QRAngledDBText6.Enabled := false;
   end
  else
   begin
    QRAngledDBText6.Enabled := true;   
    qrlabel74.Enabled := false;
   end;
  Qrlabel63.caption := dm.arqaux.fieldbyname('endereco').asstring + ' - ' + dm.arqaux.fieldbyname('bairro').asstring;

  if (strtoint(dm.arqaux.fieldbyname('model').asstring) = 34) or (strtoint(dm.arqaux.fieldbyname('model').asstring) = 35) or (strtoint(dm.arqaux.fieldbyname('model').asstring) = 133) then
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
     qrlabel62.Enabled  := false;


     qrlabel64.Enabled  := false;
     qrlabel65.Enabled  := false;
     qrlabel66.Enabled  := false;
     qrlabel67.Enabled  := false;
     qrlabel68.Enabled  := false;
     qrlabel69.Enabled  := false;
     qrlabel70.Enabled  := false;
     qrlabel71.Enabled  := false;
     qrlabel72.Enabled  := false;
     qrlabel73.Enabled  := false;



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

     qrlabel7.Font.Size := 12;
     qrlabel8.Font.Size := 12;
     qrlabel6.Font.Size := 12;

     qrlabel4.Top   := 679;
     qrlabel7.Top   := 679;
     qrlabel8.Top   := 679;
     qrlabel35.Top  := 679;
     qrdbtext14.top := 700;
     qrdbtext32.top := 700;
     qrdbtext26.top := 700;
     qrdbtext27.top := 700;
     qrrichtext2.Top:= 766;
     qrdbtext16.Font.Style := [fsbold];     
     qrshape12.Enabled  := false;
     qrlabel1.Font.Size := 16;
     qrlabel1.caption   := 'NOTIFICA��O';
     qrlabel9.caption := 'Atenciosamente,';
     qrlabel8.caption := 'VALOR R$';
     qrlabel5.caption := 'Firmado em: ';
     qrimage1.Height := 54;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura waldir preta.jpg');
     qrlabel33.caption := 'Contrato No.: ' + dm.arqaux.fieldbyname('contrato').asstring;
     qrrichtext1.Top := 589;
     qrrichtext1.Lines.Clear;
     qrrichtext1.Lines.Add('Vimos por meio desta, em  decorr�ncia  do  contrato supra  firmado  por  V.Sa., notific�-lo(a) para  que no');
     qrrichtext1.Lines.Add('prazo de 48 (quarenta e oito)  horas, a  contar do  recebimento  desta, efetue  o pagamento, no endere�o');
     qrrichtext1.Lines.Add('abaixo indicado, da(s) presta��o(�es) em atraso e relativa(s) ao contrato em refer�ncia.');
     qrrichtext2.Font.Size := 11;
     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('O(s) valor(res) da(s)  presta��o(�es) em atraso ser�(�o) acrescido(s) dos encargos contratuais e da mora');
     qrrichtext2.Lines.Add('at� sua efetiva liquida��o.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Outrossim,  caso  V.Sa., j�  tenha  pago  a(s) referida(s) presta��o(�es),  objeto  da  presente  notifica��o,');
     qrrichtext2.Lines.Add('rogamos considerar a mesma sem efeito, exibindo-nos entretanto, os devidos comprovantes.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Alertamos que o n�o  pagamento  da(s) presta��o(�es) em  ep�grafe, ensejar�  V.Sa., em  mora  para  os');
     qrrichtext2.Lines.Add('efeitos legais (Decreto-Lei  n� 911 de 01/10/69), e  ado��o  de  medidas  judiciais  cab�veis, possibilitando');
     qrrichtext2.Lines.Add('promover a imediata  a��o de busca e apreens�o do bem alienado fiduciariamente.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Na expectativa de suas provid�ncias, subscrevemo-nos.');
   end;

  if (strtoint(dm.arqaux.fieldbyname('model').asstring) = 411) or (strtoint(dm.arqaux.fieldbyname('model').asstring) = 412) or (strtoint(dm.arqaux.fieldbyname('model').asstring) = 1157) or (strtoint(dm.arqaux.fieldbyname('model').asstring) = 157) then
   begin
     qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
     if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;
     {qrlabel6.Enabled   := true;
     qrdbtext25.Enabled := true;
     qrlabel4.Enabled   := false;
     qrlabel35.Enabled  := false;
     qrdbtext14.Enabled := false;}
     qrlabel5.Enabled   := true;
     qrlabel7.Enabled   := true;
     qrlabel8.Enabled   := true;
     qrlabel6.Enabled   := FALSE;
     qrlabel62.Enabled  := TRUE;
     qrlabel5.Enabled   := true;
     qrlabel33.Enabled  := true;
     qrdbtext17.Enabled := true;
     qrdbtext25.Enabled := true;
     qrdbtext26.Enabled := true;
     qrdbtext27.Enabled := true;
     qrdbtext15.Enabled := true;

     qrlabel4.Enabled   := false;

     qrdbtext34.Enabled := false;
     qrdbtext32.Enabled := false;
     qrlabel35.Enabled  := false;
     qrlabel36.Enabled  := false;
     qrlabel37.Enabled  := false;
     qrlabel38.Enabled  := false;
     qrlabel39.Enabled  := false;
     qrlabel40.Enabled  := false;
     qrlabel41.Enabled  := false;
     qrlabel42.Enabled  := false;
     qrlabel43.Enabled  := false;

     qrlabel64.Enabled  := false;
     qrlabel65.Enabled  := false;
     qrlabel66.Enabled  := false;
     qrlabel67.Enabled  := false;
     qrlabel68.Enabled  := false;
     qrlabel69.Enabled  := false;
     qrlabel70.Enabled  := false;
     qrlabel71.Enabled  := false;
     qrlabel72.Enabled  := false;
     qrlabel73.Enabled  := false;



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

     qrlabel6.Font.Size := 10;
     qrlabel7.Font.Size := 10;
     qrlabel8.Font.Size := 10;

     qrshape12.Enabled  := false;
//   qrdbtext34.Enabled := true;

     qrdbtext7.Enabled := true;
     qrdbtext8.Enabled := true;
     qrdbtext9.Enabled := true;
     qrdbtext10.Enabled := true;
     qrdbtext11.Enabled := true;
     qrdbtext12.Enabled := true;
     qrdbtext13.Enabled := true;
     qrdbtext15.Enabled := true;
     qrlabel34.Enabled  := true;
     qrdbtext16.Font.Style := [fsbold];
     qrlabel4.Top   := 679;
     qrlabel7.Top   := 679;
     qrlabel8.Top   := 679;
     qrlabel35.Top  := 679;
     qrdbtext14.top := 700;
     qrdbtext32.top := 700;
     qrdbtext26.top := 700;
     qrdbtext27.top := 700;
     qrrichtext2.Top:= 766;
     qrlabel1.Font.Size := 16;
     qrlabel1.caption   := 'NOTIFICA��O';
     qrlabel9.caption := '';
     qrlabel8.caption := 'VALOR R$';
     qrlabel5.caption := 'Firmado em: ';
     qrimage1.Height := 121;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura fernando luz preta.jpg');
     qrlabel33.caption := 'Ref.: Contrato de Financiamento com Aliena��o Fiduci�ria no.: ' + dm.arqaux.fieldbyname('contrato').asstring;
     qrrichtext1.Top := 589;
     qrrichtext1.Lines.Clear;
     qrrichtext1.Lines.Add('Vimos por meio desta, em decorr�ncia do contrato supra firmado por V.Sa., notific�-lo para que no prazo');
     qrrichtext1.Lines.Add('de 48 (quarenta e oito) horas, a contar do recebimento desta, efetue o  pagamento, no  endere�o abaixo');
     qrrichtext1.Lines.Add('indicado, da(s) presta��o(�es) em atraso,  relativa(s) ao contrato referido.');

    { qrrichtext1.Lines.Add('Vimos por meio desta, em decorr�ncia  do  contrato supra firmado por V.Sa., notific�-lo  para  que  no');
     qrrichtext1.Lines.Add('prazo   de   48 (quarenta e oito)  horas,  a  contar  do  recebimento  desta,  efetue  o  pagamento,  no');
     qrrichtext1.Lines.Add('endere�o abaixo indicado, da(s) presta��o(�es) em atraso e relativa(s) ao contrato referido.');}

     qrrichtext2.Font.Size := 11;
     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('O(s) valor(es) da(s) presta��o(�es) em atraso ser�(�o) acrescido(s) dos encargos contratuais e da mora');
     qrrichtext2.Lines.Add('at� sua efetiva liquida��o.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Outrossim,  caso  V.Sa.,  j� tenha pago  a(s) referida(s) presta��o(�es), objeto  da  presente  notifica��o,');
     qrrichtext2.Lines.Add('rogamos considerar a mesma sem efeito, exibindo-nos entretanto, os devidos comprovantes.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Alertamos que o  n�o pagamento da(s) presta��o(�es) em  ep�grafe, constituir� V.Sa., em mora para os');
     qrrichtext2.Lines.Add('efeitos legais (Decreto-Lei n� 911 de 01/10/69), possibilitando tomar medidas judiciais cab�veis, inclusive');
     qrrichtext2.Lines.Add('promover a imediata  a��o de busca e apreens�o do bem alienado fiduciariamente.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Na expectativa de suas provid�ncias, subscrevemo-nos.');
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
     qrlabel62.Enabled  := false;


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

     qrlabel64.Enabled  := false;
     qrlabel65.Enabled  := false;
     qrlabel66.Enabled  := false;
     qrlabel67.Enabled  := false;
     qrlabel68.Enabled  := false;
     qrlabel69.Enabled  := false;
     qrlabel70.Enabled  := false;
     qrlabel71.Enabled  := false;
     qrlabel72.Enabled  := false;
     qrlabel73.Enabled  := false;

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

     qrlabel7.Font.Size := 12;
     qrlabel8.Font.Size := 12;

     qrdbtext14.Enabled := true;
     qrdbtext32.Enabled := true;
//   qrdbtext34.Enabled := true;

     qrlabel4.Top   := 605;
     qrlabel7.Top   := 605;
     qrlabel8.Top   := 605;
     qrlabel35.Top  := 605;
     qrdbtext14.top := 630;
     qrdbtext32.top := 630;
     qrdbtext26.top := 630;
     qrdbtext27.top := 630;
     qrrichtext2.Top:= 680;   //665
     qrlabel1.Font.Size := 16;
     qrlabel1.caption   := 'NOTIFICA��O';
     qrlabel9.caption := 'Atenciosamente,';
     qrlabel8.caption := 'VALOR NO VENCIMENTO R$';
     qrlabel5.caption := 'Prezado(a) Senhor(a),';
     qrimage1.Height := 54;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura waldir preta.jpg');
     qrlabel33.caption := 'Ref.: Contrato de Arrendamento Mercantil No.: ' + dm.arqaux.fieldbyname('contrato').asstring;
     qrrichtext1.Top := 545;
     qrrichtext1.Lines.Clear;
     qrrichtext1.Lines.Add('Vimos atrav�s da presente, em decorr�ncia do contrato supra firmado por V.Sa., notific�-lo(a)(s) para  que');
     qrrichtext1.Lines.Add('efetue o pagamento, no endere�o abaixo indicado, da(s) parcela(s) e residual(ais) em atraso relativo(s) ao');
     qrrichtext1.Lines.Add('contrato em refer�ncia:');
     qrrichtext2.Font.Size := 11;
     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('O(s) valor(es) da(s) parcela(s) e/ou residual(ais) acima ser�(�o) acrescido(s) dos encargos  contratuais  e');
     qrrichtext2.Lines.Add('da mora at� sua efetiva liquida��o.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Outrossim,  caso  V.Sa., j�  tenha  pago  referida(s)  parcela(s)   e/ou   residual(ais),  objeto   da  presente');
     qrrichtext2.Lines.Add('notifica��o, rogamos considerar sem efeito, exibindo-nos entretanto  os devidos comprovantes.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Sendo    assim,     fica    V.Sa.    notificado(a)    para   que     no    prazo    de     48  (quarenta     e    oito)   ');
     qrrichtext2.Lines.Add('horas, contadas  do   recebimento     desta,    efetue     o   pagamento     do    d�bito    ou    proceda     a  ');
     qrrichtext2.Lines.Add('imediata        devolu��o         do        ve�culo       objeto         do          arrendamento        mercantil,      na');
     qrrichtext2.Lines.Add(dm.arqaux.fieldbyname('end_banco').asstring );
     qrrichtext2.Lines.Add(',das 9:00 �s 18:00 horas, respondendo  por  eventual  d�bito  remanescente  de  contrato, sob  pena  de,');
     qrrichtext2.Lines.Add('assim n�o fazendo, vir a sofrer  as  medidas  judiciais  cab�veis, dentre  elas  a  Reintegra��o  de   Posse');
     qrrichtext2.Lines.Add('do Bem.');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Outrossim, alertamos que o n�o  atendimento a  esta notifica��o implicar� na inscri��o do nome de V.Sa.');
     qrrichtext2.Lines.Add('nos  Servi�os   de    Cadastro   do   sistema    de    Prote��o   ao   Cr�dito,  e  entidades   assemelhadas,');
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
     qrlabel62.Enabled  := false;

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

     qrlabel64.Enabled  := true;
     qrlabel65.Enabled  := true;
     qrlabel66.Enabled  := true;
     qrlabel67.Enabled  := true;
     qrlabel68.Enabled  := true;
     qrlabel69.Enabled  := true;
     qrlabel70.Enabled  := true;
     qrlabel71.Enabled  := true;
     qrlabel72.Enabled  := true;
     qrlabel73.Enabled  := true;



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
     qrdbtext16.Font.Style := [];
     qrlabel4.Top   := 679;
     qrlabel7.Top   := 679;
     qrlabel8.Top   := 679;
     qrlabel35.Top  := 679;
     qrdbtext14.top := 700;
     qrdbtext32.top := 700;
     qrdbtext26.top := 700;
     qrdbtext27.top := 700;
     qrrichtext2.Top:= 766;
     qrlabel1.caption   := 'NOTIFICA��O EXTRAJUDICIAL';
     qrlabel1.Font.Size := 14;
     qrlabel9.caption := 'Atenciosamente,';
     qrlabel39.caption := 'Prezado(a) Senhor(a),';
     qrimage1.Height := 121;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura fernando luz preta.jpg');
     qrlabel33.caption := 'Ref.: Contrato de Arrendamento Mercantil No.: ' + dm.arqaux.fieldbyname('contrato').asstring;
     qrlabel42.caption := 'CONTRATO  :' + dm.arqaux.fieldbyname('contrato').asstring;

     qrrichtext1.Lines.Clear;
     qrrichtext2.Font.Size := 10;
     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Nossos registros acusam ATRASO NO PAGAMENTO do Contrato de Arrendamento de  responsabilidade  de  V.Sa,');
     qrrichtext2.Lines.Add('conforme acima indicado.');
     qrrichtext2.Lines.Add('Informamos que V.Sa. est� NOTIFICADO(A) a comparecer no(s) endere�o(s), acima  relacionado(s),  para  efetuar o');
     qrrichtext2.Lines.Add('pagamento das obriga��es vencidas com os acr�scimos contratuais previstos,  DENTRO DO PRAZO M�XIMO DE 2');
     qrrichtext2.Lines.Add('(DOIS) DIAS �TEIS,  a contar do recebimento da presente.');
     qrrichtext2.Lines.Add('Informamos ainda que, ultrapassado esse prazo sem a devida quita��o, passar�o a ser devidas todas as obriga��es');
     qrrichtext2.Lines.Add('contratuais e demais  consequ�ncias de direito, inclusive o ajuizamento das medidas judiciais cab�veis.');
//   qrrichtext2.Lines.Add('judiciais cab�veis.');
     qrrichtext2.Lines.Add('Caso o pagamento tenha sido efetuado no per�odo que  compreende a emiss�o da presente e o efetivo recebimento,');
     qrrichtext2.Lines.Add('pedimos desconsiderar esta notifica��o.');

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
     qrlabel62.Enabled  := false;
     qrdbtext34.Enabled := true;
     qrdbtext35.Enabled := true;
     qrdbtext36.Enabled := true;
     qrdbtext37.Enabled := true;
     qrdbtext38.Enabled := true;
     qrdbtext39.Enabled := true;

     qrlabel64.Enabled  := true;
     qrlabel65.Enabled  := true;
     qrlabel66.Enabled  := true;
     qrlabel67.Enabled  := true;
     qrlabel68.Enabled  := true;
     qrlabel69.Enabled  := true;
     qrlabel70.Enabled  := true;
     qrlabel71.Enabled  := true;
     qrlabel72.Enabled  := true;
     qrlabel73.Enabled  := true;



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
     qrdbtext16.Font.Style := [];
     qrlabel4.Top   := 679;
     qrlabel7.Top   := 679;
     qrlabel8.Top   := 679;
     qrlabel35.Top  := 679;
     qrdbtext14.top := 700;
     qrdbtext32.top := 700;
     qrdbtext26.top := 700;
     qrdbtext27.top := 700;
     qrrichtext2.Top:= 766;
     qrlabel1.caption   := 'NOTIFICA��O EXTRAJUDICIAL';
     qrlabel1.Font.Size := 14;
     qrlabel9.caption := 'Atenciosamente,';
     qrlabel39.caption := 'Prezado(a) Senhor(a),';
     qrimage1.Height := 121;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura fernando luz preta.jpg');
     qrlabel33.caption := 'Ref.: Contrato de Arrendamento Mercantil No.: ' + dm.arqaux.fieldbyname('contrato').asstring;
     qrlabel42.caption := 'CONTRATO  :' + dm.arqaux.fieldbyname('contrato').asstring;

     qrrichtext1.Lines.Clear;
     qrrichtext2.Font.Size := 10;
     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('Nossos registros acusam ATRASO NO PAGAMENTO do Contrato de Cr�dito de responsabilidade de V.Sa, conforme');
     qrrichtext2.Lines.Add('acima indicado.');
     qrrichtext2.Lines.Add('Sentimos  informar-lhe, para  os  efeitos  previstos no par�grafo 2�, do art 2�, do Decreto-Lei N� 911, de 01/10/69, que');
     qrrichtext2.Lines.Add('V.Sa. est� NOTIFICADO(A) a comparecer no(s) endere�o(s),  acima  relacionado(s), para  efetuar  o  pagamento das');
     qrrichtext2.Lines.Add('obriga��es  vencidas  com os acr�scimos contratuais previstos, DENTRO  DO  PRAZO  M�XIMO DE  2 (DOIS) DIAS');
     qrrichtext2.Lines.Add('�TEIS, a contar do recebimento da presente.');
     qrrichtext2.Lines.Add('Informamos ainda que, ultrapassado esse prazo sem a devida quita��o, passar�o a  ser devidas todas as obriga��es');
     qrrichtext2.Lines.Add('contratuais e demais consequ�ncias de direito, inclusive o ajuizamento das medidas judiciais cab�veis.');
//     qrrichtext2.Lines.Add('judiciais cab�veis.');
     qrrichtext2.Lines.Add('Caso o pagamento tenha sido efetuado no per�odo que compreende a emiss�o da presente  e o efetivo  recebimento,');
     qrrichtext2.Lines.Add('pedimos desconsiderar esta notifica��o.');

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
     qrlabel62.Enabled  := false;

     qrlabel64.Enabled  := true;
     qrlabel65.Enabled  := true;
     qrlabel66.Enabled  := true;
     qrlabel67.Enabled  := true;
     qrlabel68.Enabled  := true;
     qrlabel69.Enabled  := true;
     qrlabel70.Enabled  := true;
     qrlabel71.Enabled  := true;
     qrlabel72.Enabled  := true;
     qrlabel73.Enabled  := true;


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
     qrlabel4.Top   := 679;
     qrlabel7.Top   := 679;
     qrlabel8.Top   := 679;
     qrlabel35.Top  := 679;
     qrdbtext14.top := 700;
     qrdbtext32.top := 700;
     qrdbtext26.top := 700;
     qrdbtext27.top := 700;
     qrrichtext2.Top:= 766;
     qrlabel1.caption   := 'NOTIFICA��O EXTRAJUDICIAL';
     qrlabel1.Font.Size := 14;
     qrlabel6.caption := 'passou';
     qrlabel9.caption := 'Atenciosamente,';
     qrlabel39.caption := 'Prezado(a) Senhor(a),';
     qrimage1.Height := 121;
     qrimage1.Picture.LoadFromFile('s:\td\assinatura\assinatura fernando luz.jpg');
     qrlabel60.caption := dm.arqaux.fieldbyname('contrato').asstring;
     qrlabel61.caption := dm.arqaux.fieldbyname('end_banco').asstring;

     qrrichtext1.Lines.Clear;

     qrrichtext2.Lines.Clear;
     qrrichtext2.Lines.Add('        Estando V.Sa. em d�bito com a empresa em ep�grafe, sirvo-me da presente para NOTIFIC�-LO');
     qrrichtext2.Lines.Add('(A), nos termos do artigo 2�, par�grafo 2� do Decreto-Lei 911 de 01/10/69, a efetuar no prazo');
     qrrichtext2.Lines.Add('improrrog�vel de 2 (dois) dias ap�s o recebimento desta, o(s) pagamento(s) da(s) parcela(s) e ');
     qrrichtext2.Lines.Add('diferen�a de parcelas em atraso junto no endere�o:');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('        O n�o atendimento da presente NOTIFICA��O ensejer� conforme a legisla��o presente e o');
     qrrichtext2.Lines.Add('contrato de Aliena��o Fiduci�ria firmado com a Administradora, o vencimento antecipado de todo o saldo');
     qrrichtext2.Lines.Add('devedor, caso j� n�o esteja vencido e a tomada de medidas judiciais cab�veis - Busca e Apreens�o, que');
     qrrichtext2.Lines.Add('ser�o promovidas pela notificante, n�o sendo considerados os pagamentos efetuados parcialmente na');
     qrrichtext2.Lines.Add('Administradora ou em nossa Assessoria Juridica, para fins de "desconstitui��o de mora".');
     qrrichtext2.Lines.Add('');
     qrrichtext2.Lines.Add('        Caso V.Sa. tenha efetuado o pagamento das parcelas concernentes ao d�bito, ANTERIORMENTE ao');
     qrrichtext2.Lines.Add('recebimento da presente notifica��o, solicitamos a fineza de desconsidera-la e aceitar nossas escusas,');
     qrrichtext2.Lines.Add('prevalecendo, todavia est�, para que nos apresente os respectivos comprovantes de pagamento no prazo');
     qrrichtext2.Lines.Add('acima mencionado.');
     qrrichtext2.Lines.Add('Salientamos que pagamentos atrav�s de dep�sitos dever�o ser efetuados somente com autoriza��o expressa');
     qrrichtext2.Lines.Add('de nossa Assessoria, n�o sendo admitidos dep�sitos realizados em conta conrrente da Administradora ap�s');
     qrrichtext2.Lines.Add('o recebimento desta.');

   end;




end;

procedure TF_maval02.QRChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrRdBarra1.Text := 'RL' + dm.arqaux.fieldbyname('rld').asstring + 'BR';
  QrRdBarra2.Text := 'RL' + dm.arqaux.fieldbyname('rld').asstring + 'BR';
end;

end.
