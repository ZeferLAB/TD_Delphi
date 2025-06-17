unit U_ReciboDevolucaoTitulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, jpeg, ExtCtrls, Db, DBTables;

type
  TF_ReciboDevolucaoTitulo = class(TForm)
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label1: TLabel;
    Mk_Protocolo: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    StatusBar1: TStatusBar;
    qryRelatorio: TQuery;
    DsRelatorio: TDataSource;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Mk_ProtocoloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ReciboDevolucaoTitulo: TF_ReciboDevolucaoTitulo;

implementation

uses U_ReciboDevolucaoTituloPreview, Menu, FuncGeral, DMTD,
  U_ReciboNotificacaoCobradaPreview;

{$R *.DFM}

procedure TF_ReciboDevolucaoTitulo.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ReciboDevolucaoTitulo.BitBtn1Click(Sender: TObject);
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
    qryRelatorio.Sql.Add('SELECT * FROM td');
    qryRelatorio.Sql.Add('WHERE');
    qryRelatorio.Sql.Add('p_auxiliar = ' + Trim(Mk_Protocolo.Text));
    qryRelatorio.Open;  

    F_ReciboDevolucaoTituloPreview.QRRichText1.Lines.Clear;
    F_ReciboDevolucaoTituloPreview.QRRichText1.Lines.Add('   PROTOCOLO: '+qryRelatorio.FieldByName('p_auxiliar').AsString+'     REGISTRO: '+qryRelatorio.FieldByName('protocolo').AsString+' ');
    F_ReciboDevolucaoTituloPreview.QRRichText1.Lines.Add('   NATUREZA DO DOCUMENTO: '+qryRelatorio.FieldByName('ext_nat').AsString+' ');
    F_ReciboDevolucaoTituloPreview.QRRichText1.Lines.Add('   RETIRADO POR: '+qryRelatorio.FieldByName('nome_ret').AsString+' ');
    F_ReciboDevolucaoTituloPreview.QRRichText1.Lines.Add('   DATA: '+qryRelatorio.FieldByName('data_d').AsString+'');

    F_ReciboDevolucaoTituloPreview.QRRichText3.Lines.Clear;
    F_ReciboDevolucaoTituloPreview.QRRichText3.Lines.Add('   PROTOCOLO: '+qryRelatorio.FieldByName('p_auxiliar').AsString+'     REGISTRO: '+qryRelatorio.FieldByName('protocolo').AsString+' ');
    F_ReciboDevolucaoTituloPreview.QRRichText3.Lines.Add('   NATUREZA DO DOCUMENTO: '+qryRelatorio.FieldByName('ext_nat').AsString+' ');
    F_ReciboDevolucaoTituloPreview.QRRichText3.Lines.Add('   RETIRADO POR: '+qryRelatorio.FieldByName('nome_ret').AsString+' ');
    F_ReciboDevolucaoTituloPreview.QRRichText3.Lines.Add('   DATA: '+qryRelatorio.FieldByName('data_d').AsString+'');

  end
  Else
  Begin
    Application.MessageBox('Número e Série do Daje devem ser preenchido!', 'Recibo de Notificações Cobradas', mb_ok);
    Abort;
  End;

  F_ReciboDevolucaoTituloPreview.QuickRep1.Preview;
  F_ReciboDevolucaoTituloPreview := NIL;

  Mk_Protocolo.Text:= '';

end;

procedure TF_ReciboDevolucaoTitulo.Mk_ProtocoloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then BitBtn1.setfocus;
end;

end.
