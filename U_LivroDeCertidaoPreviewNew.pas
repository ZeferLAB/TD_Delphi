unit U_LivroDeCertidaoPreviewNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TF_LivroDeCertidaoPreviewNew = class(TForm)
    QuickRep2: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape15: TQRShape;
    QRShape20: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRBand2: TQRBand;
    QRShape29: TQRShape;
    QRLabel16: TQRLabel;
    QRShape9: TQRShape;
    QRLabel28: TQRLabel;
    QRShape34: TQRShape;
    QRLabel19: TQRLabel;
    QRShape16: TQRShape;
    QRShape19: TQRShape;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel18: TQRLabel;
    QRGroup2: TQRGroup;
    QRBand3: TQRBand;
    QRAssinadoDigitalmente: TQRLabel;
    QRShape5: TQRShape;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_LivroDeCertidaoPreviewNew: TF_LivroDeCertidaoPreviewNew;

implementation

uses U_LivroCertidaoRel;

{$R *.DFM}

procedure TF_LivroDeCertidaoPreviewNew.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel19.Caption := F_LivroCertidaoRel.Certidao.FieldByName('movimento').AsString;
  QRLabel12.Caption := F_LivroCertidaoRel.Certidao.FieldByName('protocolo').AsString;
  QRLabel18.Caption := F_LivroCertidaoRel.Certidao.FieldByName('contribuinte').AsString;
  QRLabel16.Caption := F_LivroCertidaoRel.Certidao.FieldByName('atribuicao').AsString;
  QRLabel10.Caption := F_LivroCertidaoRel.Certidao.FieldByName('status').AsString;
  QRLabel14.Caption := F_LivroCertidaoRel.Certidao.FieldByName('stat_data').AsString;
  QRLabel17.Caption := F_LivroCertidaoRel.Certidao.FieldByName('numero_daje').AsString;
  QRLabel28.Caption := F_LivroCertidaoRel.Certidao.FieldByName('numero_selo').AsString;
end;

end.
