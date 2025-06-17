unit U_ReciboDevolucaoCertidao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, ComCtrls, Db, DBTables, Buttons, Mask;

type
  TF_ReciboDevolucaoCertidao = class(TForm)
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label1: TLabel;
    Mk_Protocolo: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    qryRelatorio: TQuery;
    DsRelatorio: TDataSource;
    StatusBar1: TStatusBar;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ReciboDevolucaoCertidao: TF_ReciboDevolucaoCertidao;

implementation

uses U_ReciboDevolucaoTituloPreview, Menu, FuncGeral;

{$R *.DFM}

procedure TF_ReciboDevolucaoCertidao.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ReciboDevolucaoCertidao.BitBtn1Click(Sender: TObject);
begin
  F_ReciboDevolucaoTituloPreview:= TF_ReciboDevolucaoTituloPreview.Create(Nil);

  F_ReciboDevolucaoTituloPreview.QRLabel1.Caption  := F_Menu.Label29.Caption;
  F_ReciboDevolucaoTituloPreview.QRLabel9.Caption  := F_Menu.Label55.Caption;
  F_ReciboDevolucaoTituloPreview.QRLabel10.Caption := F_Menu.Label13.Caption + ' ' + F_Menu.LbNomeTitular.Caption;
  F_ReciboDevolucaoTituloPreview.QRLabel6.Caption  := DataExtenso(DateToStr(Now), True, TimeToStr(now));

  F_ReciboDevolucaoTituloPreview.QRLabel18.Caption := F_Menu.Label29.Caption;
  F_ReciboDevolucaoTituloPreview.QRLabel19.Caption := F_Menu.Label55.Caption;
  F_ReciboDevolucaoTituloPreview.QRLabel20.Caption := F_Menu.Label13.Caption + ' ' + F_Menu.LbNomeTitular.Caption;
  F_ReciboDevolucaoTituloPreview.QRLabel24.Caption  := DataExtenso(DateToStr(Now), True, TimeToStr(now));

  if (Mk_Protocolo.Text <> '') Then
  begin

    qryRelatorio.Close;
    qryRelatorio.Sql.Clear;
    qryRelatorio.Sql.Add('SELECT * FROM certidao');
    qryRelatorio.Sql.Add('WHERE');
    qryRelatorio.Sql.Add('nr_protoc = ' + Trim(Mk_Protocolo.Text));
    qryRelatorio.Open;  

    F_ReciboDevolucaoTituloPreview.QRRichText1.Lines.Clear;
    F_ReciboDevolucaoTituloPreview.QRRichText1.Lines.Add('   PROTOCOLO: '+qryRelatorio.FieldByName('nr_protoc').AsString+'     REGISTRO: '+qryRelatorio.FieldByName('protocolo').AsString+' ');
    F_ReciboDevolucaoTituloPreview.QRRichText1.Lines.Add('   NATUREZA DO DOCUMENTO: '+qryRelatorio.FieldByName('ext_nat').AsString+' ');
    F_ReciboDevolucaoTituloPreview.QRRichText1.Lines.Add('   RETIRADO POR: '+qryRelatorio.FieldByName('Retirante').AsString+' DOC: '+qryRelatorio.FieldByName('imovel1').AsString+'');
    F_ReciboDevolucaoTituloPreview.QRRichText1.Lines.Add('   DATA: '+qryRelatorio.FieldByName('entrega').AsString+'');

    F_ReciboDevolucaoTituloPreview.QRRichText3.Lines.Clear;
    F_ReciboDevolucaoTituloPreview.QRRichText3.Lines.Add('   PROTOCOLO: '+qryRelatorio.FieldByName('nr_protoc').AsString+'     REGISTRO: '+qryRelatorio.FieldByName('protocolo').AsString+' ');
    F_ReciboDevolucaoTituloPreview.QRRichText3.Lines.Add('   NATUREZA DO DOCUMENTO: '+qryRelatorio.FieldByName('ext_nat').AsString+' ');
    F_ReciboDevolucaoTituloPreview.QRRichText3.Lines.Add('   RETIRADO POR: '+qryRelatorio.FieldByName('Retirante').AsString+' DOC: '+qryRelatorio.FieldByName('imovel1').AsString+'');
    F_ReciboDevolucaoTituloPreview.QRRichText3.Lines.Add('   DATA: '+qryRelatorio.FieldByName('entrega').AsString+'');

  end
  Else
  Begin
    Application.MessageBox('Número do protocolo deve ser preenchido!', 'Recibo de Notificações Cobradas', mb_ok);
    Abort;
  End;

  F_ReciboDevolucaoTituloPreview.QuickRep1.Preview;
  F_ReciboDevolucaoTituloPreview := NIL;

  Mk_Protocolo.Text:= '';

end;

end.
