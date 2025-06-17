unit U_ReciboNotificacaoCobrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, Mask, ComCtrls, Buttons, DBCtrls, Db, DBTables,
  Grids, DBGrids;

type
  TF_ReciboNotificacaoCobrada = class(TForm)
    ControlBar1: TControlBar;
    Label36: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    StatusBar1: TStatusBar;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    qryRelatorio: TQuery;
    DsRelatorio: TDataSource;
    qryRelatoriocontribuinte: TStringField;
    qryRelatoriovr_daje: TFloatField;
    qryRelatoriovr_declarado: TFloatField;
    qryRelatorioserie_daje: TStringField;
    qryRelatorionumero_daje: TIntegerField;
    qryRelatoriotipo_doc: TStringField;
    qryRelatoriodoc: TStringField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ReciboNotificacaoCobrada: TF_ReciboNotificacaoCobrada;

implementation

uses U_ReciboNotificacaoCobradaPreview, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_ReciboNotificacaoCobrada.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ReciboNotificacaoCobrada.BitBtn1Click(Sender: TObject);
var
  fvalor, Texto: String;
begin
  F_ReciboNotificacaoCobradaPreview:= TF_ReciboNotificacaoCobradaPreview.Create(Nil);

  F_ReciboNotificacaoCobradaPreview.QRLabel1.Caption  := F_Menu.Label29.Caption;
  F_ReciboNotificacaoCobradaPreview.QRLabel9.Caption  := F_Menu.Label55.Caption;
  F_ReciboNotificacaoCobradaPreview.QRLabel10.Caption := F_Menu.Label13.Caption + ' ' + F_Menu.LbNomeTitular.Caption;
  F_ReciboNotificacaoCobradaPreview.QRLabel6.Caption  := DataExtenso(DateToStr(Now), True, TimeToStr(now));

  F_ReciboNotificacaoCobradaPreview.QRLabel18.Caption := F_Menu.Label29.Caption;        
  F_ReciboNotificacaoCobradaPreview.QRLabel19.Caption := F_Menu.Label55.Caption;
  F_ReciboNotificacaoCobradaPreview.QRLabel20.Caption := F_Menu.Label13.Caption + ' ' + F_Menu.LbNomeTitular.Caption;
  F_ReciboNotificacaoCobradaPreview.QRLabel24.Caption  := DataExtenso(DateToStr(Now), True, TimeToStr(now));

  if (MaskEdit1.Text <> '') and (MaskEdit2.Text <> '') Then
  begin

    qryRelatorio.Close;
    qryRelatorio.SQL.Clear;
    qryRelatorio.SQL.Add('select contribuinte, vr_daje, vr_declarado, serie_daje, numero_daje, tipo_doc, doc from daje where numero_daje = '+QuotedStr(StrZero(MaskEdit1.Text, 6))+' and serie_daje = '+QuotedStr(StrZero(MaskEdit2.Text, 3))+'');
    qryRelatorio.Open;

    F_ReciboNotificacaoCobradaPreview.ValorPorExtenso1.Valor:= qryRelatoriovr_daje.AsCurrency;

    fvalor:= F_ReciboNotificacaoCobradaPreview.ValorPorExtenso1.Texto;

    F_ReciboNotificacaoCobradaPreview.QRRichText1.Lines.Clear;
    F_ReciboNotificacaoCobradaPreview.QRRichText1.Lines.Add('Recebemos de ('+qryRelatoriocontribuinte.AsString+') a importância de '+fvalor+'('+qryRelatoriovr_daje.AsString+') referente ao pagamento de DAJE ('+Strzero(qryRelatorioserie_daje.AsString, 3)+''+Strzero(qryRelatorionumero_daje.AsString, 6)+').');

    F_ReciboNotificacaoCobradaPreview.QRRichText3.Lines.Clear;
    F_ReciboNotificacaoCobradaPreview.QRRichText3.Lines.Add('Recebemos de ('+qryRelatoriocontribuinte.AsString+') a importância de '+fvalor+'('+qryRelatoriovr_daje.AsString+') referente ao pagamento de DAJE ('+Strzero(qryRelatorioserie_daje.AsString, 3)+''+Strzero(qryRelatorionumero_daje.AsString, 6)+').');

    F_ReciboNotificacaoCobradaPreview.QRLabel26.Caption:= qryRelatoriovr_daje.AsString;
    F_ReciboNotificacaoCobradaPreview.QRLabel27.Caption:= qryRelatoriovr_daje.AsString;

    Texto:= 'Recebemos de ('+qryRelatoriocontribuinte.AsString+') a importância de '+fvalor+'('+qryRelatoriovr_daje.AsString+') referente ao pagamento de DAJE ('+Strzero(qryRelatorioserie_daje.AsString, 3)+''+Strzero(qryRelatorionumero_daje.AsString, 6)+').';
  end
  Else
  Begin
    Application.MessageBox('Número e Série do Daje devem ser preenchido!', 'Recibo de Notificações Cobradas', mb_ok);
    Abort;
  End;

  F_ReciboNotificacaoCobradaPreview.QuickRep1.Preview;
  F_ReciboNotificacaoCobradaPreview := NIL;

  MaskEdit1.Text:= '';
  MaskEdit2.Text:= '';
  DBEdit1.Text  := '';

end;

procedure TF_ReciboNotificacaoCobrada.FormShow(Sender: TObject);
begin
  qryRelatorio.Close;
  qryRelatorio.SQL.Clear;
  qryRelatorio.SQL.Add('select contribuinte, vr_daje, vr_declarado, serie_daje, numero_daje, tipo_doc, doc from daje where id = 0');
  qryRelatorio.Open;
end;

procedure TF_ReciboNotificacaoCobrada.MaskEdit2Exit(Sender: TObject);
begin
  if (MaskEdit1.Text <> '') and (MaskEdit2.Text <> '') Then
  begin
    qryRelatorio.Close;
    qryRelatorio.SQL.Clear;
    qryRelatorio.SQL.Add('select contribuinte, vr_daje, vr_declarado, serie_daje, numero_daje, tipo_doc, doc from daje where numero_daje = '+QuotedStr(StrZero(MaskEdit1.Text, 6))+' and serie_daje = '+QuotedStr(StrZero(MaskEdit2.Text, 3))+'');
    qryRelatorio.Open;
  end;
end;

procedure TF_ReciboNotificacaoCobrada.MaskEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    MaskEdit2.SetFocus;
  end;

end;

procedure TF_ReciboNotificacaoCobrada.MaskEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    DBEdit1.SetFocus;
  end;

end;

procedure TF_ReciboNotificacaoCobrada.DBEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    BitBtn1.SetFocus;
  end;
end;

procedure TF_ReciboNotificacaoCobrada.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text:= Strzero(MaskEdit1.Text, 6);
  MaskEdit2.Text:= Strzero(MaskEdit2.Text, 3);

end;

end.
