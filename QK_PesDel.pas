unit QK_PesDel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TF_QPesDel = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_QPesDel: TF_QPesDel;

implementation

uses DMTD, U_PesqDel, Menu;

{$R *.DFM}

procedure TF_QPesDel.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 qrlabel8.caption := '';
 DM.ArqAux.Close;
 DM.ArqAux.Sql.Clear;
 DM.ArqAux.Sql.Add('select usuario from histd where protocolo = ' + Chr(39) + DM.TD_Pesso.fieldbyname('protocolo').AsString + Chr(39) + ' and tipo = "S" order by recno');
 DM.ArqAux.Open;

 DM.ArqAux.Findlast;


 qrlabel8.caption := DM.ArqAux.fieldbyname('usuario').AsString;

end;

procedure TF_QPesDel.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 qrlabel11.caption := 'Movimento de: ' + F_PesqDel.maskedit1.text;
end;

procedure TF_QPesDel.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 qrlabel12.caption := 'por ' + F_menu.label1.caption;
end;

end.
