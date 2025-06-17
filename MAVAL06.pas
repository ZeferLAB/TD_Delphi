unit maval06;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, jpeg, Qrctrls, QrAngLbl, qrRDBarra;

type
  Tf_maval06 = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRImage3: TQRImage;
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
    QRLabel33: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
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
    QRLabel56: TQRLabel;
    QRMemo5: TQRMemo;
    QRDBText2: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText52: TQRDBText;
    QRRichText1: TQRRichText;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRRichText2: TQRRichText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel46: TQRLabel;
    QRRichText3: TQRRichText;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRRichText4: TQRRichText;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRAngledDBText2: TQRAngledDBText;
    QRAngledLabel2: TQRAngledLabel;
    QRLabel55: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_maval06: Tf_maval06;

implementation

uses DMTD;

{$R *.DFM}

procedure Tf_maval06.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  QrRichText2.Enabled := False;
  qrlabel34.Enabled   := false;
  qrlabel35.Enabled   := false;
  qrlabel46.Enabled   := false;

  QrRichText1.Enabled := False;
  qrlabel57.Enabled   := false;
  qrlabel58.Enabled   := false;
  qrlabel59.Enabled   := false;
  qrlabel60.Enabled   := false;


  QrRichText3.Enabled := False;
  qrlabel61.Enabled   := false;
  qrlabel62.Enabled   := false;
  qrlabel63.Enabled   := false;

  QrRichText4.Enabled := False;
  qrlabel64.Enabled   := false;
  qrlabel65.Enabled   := false;
  qrlabel66.Enabled   := false;
  qrlabel67.Enabled   := false;


  if copy(Dm.ArqAux.FieldByName('arquivo').asstring,3,2) = '01' then
  begin
    QrRichText2.Enabled := True;
    QrRichText2.BringToFront;
    qrlabel34.Enabled   := true;
    qrlabel35.Enabled   := true;
    qrlabel46.Enabled   := true;
  end;

  if copy(Dm.ArqAux.FieldByName('arquivo').asstring,3,2) = '02' then
  begin
    QrRichText1.Enabled := True;
    QrRichText1.BringToFront;
    qrlabel57.Enabled   := true;
    qrlabel57.BringToFront;
    qrlabel58.Enabled   := true;
    qrlabel58.BringToFront;
    qrlabel59.Enabled   := true;
    qrlabel59.BringToFront;
    qrlabel60.Enabled   := true;
    qrlabel60.BringToFront;
  end;

  if copy(Dm.ArqAux.FieldByName('arquivo').asstring,3,2) = '03' then
  begin
    QrRichText3.Enabled := True;
    QrLabel61.Enabled   := True;
    QrLabel62.Enabled   := True;
    QrLabel63.Enabled   := True;
  end;

  if copy(Dm.ArqAux.FieldByName('arquivo').asstring,3,2) = '04' then
  begin
    QrRichText4.Enabled := True;
    Qrlabel64.Enabled   := True;
    Qrlabel65.Enabled   := True;
    Qrlabel66.Enabled   := True;
    Qrlabel67.Enabled   := True;
  end;

  qrimage2.Picture.LoadFromFile('s:\td\assinatura\correio.jpg');
  if strtoint(copy(dm.arqaux.fieldbyname('cep').asstring,1,1)) < 2 then qrimage2.Enabled := true else qrimage2.Enabled := false;

  qrlabel47.caption := Dm.ArqAux.FieldByName('vr_venc').asstring;
  qrlabel51.caption := formatdatetime('dd/mm/yyyy',Dm.ArqAux.FieldByName('data_ven').asdatetime);
  qrlabel48.enabled := false;
  qrlabel52.enabled := false;
  qrlabel50.enabled := false;
  qrlabel54.enabled := false;
  qrlabel49.enabled := false;
  qrlabel53.enabled := false;

  qrlabel36.enabled := false;
  qrlabel37.enabled := false;
  qrlabel38.enabled := false;

  qrlabel39.enabled := false;
  qrlabel40.enabled := false;
  qrlabel41.enabled := false;

  qrlabel42.enabled := false;
  qrlabel43.enabled := false;
  qrlabel44.enabled := false;

  if copy(Dm.ArqAux.FieldByName('ven_parc2').asstring,1,1) <> '' then
   begin
    qrlabel48.enabled := true;
    qrlabel52.enabled := true;
    qrlabel36.enabled := true;
    qrlabel37.enabled := true;
    qrlabel38.enabled := true;
    qrlabel48.caption := Dm.ArqAux.FieldByName('val_parc2').asstring;
    qrlabel52.caption := formatdatetime('dd/mm/yyyy',Dm.ArqAux.FieldByName('ven_parc2').asdatetime);
   end;

  if copy(Dm.ArqAux.FieldByName('ven_parc3').asstring,1,1) <> '' then
   begin
    qrlabel39.enabled := true;
    qrlabel40.enabled := true;
    qrlabel41.enabled := true;
    qrlabel49.enabled := true;
    qrlabel53.enabled := true;
    qrlabel49.caption := Dm.ArqAux.FieldByName('val_parc3').asstring;
    qrlabel53.caption := formatdatetime('dd/mm/yyyy',Dm.ArqAux.FieldByName('ven_parc3').asdatetime);
   end;

  if copy(Dm.ArqAux.FieldByName('ven_parc4').asstring,1,1) <> '' then
   begin
    qrlabel42.enabled := true;
    qrlabel43.enabled := true;
    qrlabel44.enabled := true;
    qrlabel50.enabled := true;
    qrlabel54.enabled := true;
    qrlabel50.caption := Dm.ArqAux.FieldByName('val_parc4').asstring;
    qrlabel54.caption := formatdatetime('dd/mm/yyyy',Dm.ArqAux.FieldByName('ven_parc4').asdatetime);
   end;

   if copy(Dm.ArqAux.FieldByName('ven_parc5').asstring,1,1) <> '' then
   begin
    qrlabel55.enabled := true;
    qrlabel68.enabled := true;
    qrlabel69.enabled := true;
    qrlabel70.enabled := true;
    qrlabel71.enabled := true;
    qrlabel70.caption := Dm.ArqAux.FieldByName('val_parc5').asstring;
    qrlabel71.caption := formatdatetime('dd/mm/yyyy',Dm.ArqAux.FieldByName('ven_parc5').asdatetime);
   end else
   Begin
    qrlabel55.enabled := false;
    qrlabel68.enabled := false;
    qrlabel69.enabled := false;
    qrlabel70.enabled := false;
    qrlabel71.enabled := false;

   end;
end;

procedure Tf_maval06.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  QrRdBarra1.Text := 'RL' + dm.arqaux.fieldbyname('rld').asstring + 'BR';
  QrRdBarra2.Text := 'RL' + dm.arqaux.fieldbyname('rld').asstring + 'BR';
  
end;

end.
