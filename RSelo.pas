unit RSelo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Printers, ComCtrls, ExtCtrls, jpeg;

type
  TF_RSelo = class(TForm)
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel2: TBevel;
    Bevel3: TBevel;
    MaskEdit7: TMaskEdit;
    Label7: TLabel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Carrega_Certidao(Sender : TOBject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RSelo: TF_RSelo;
  
implementation

uses DMTD, Menu, QkSelo, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure ColocaTraco(tabela : String);
var
  rec : String;
begin
  Dm.ArqAux2.Close;
  Dm.ArqAux2.Sql.Clear;
  Dm.ArqAux2.Sql.Add('SELECT count(*) rec FROM ' + tabela);
  Dm.ArqAux2.Open;
  rec := Dm.ArqAux2.FieldByName('rec').asString;
  Dm.ArqAux2.Close;
  Dm.ArqAux2.Sql.Clear;
  Dm.ArqAux2.Sql.Add('UPDATE ' + tabela + ' SET');
  Dm.ArqAux2.Sql.Add('traco = "S"');
  Dm.ArqAux2.Sql.Add('WHERE');
  Dm.ArqAux2.Sql.Add('recno = ' + rec);
  Dm.ArqAux2.ExecSQL;
  Dm.ArqAux2.Close;
end;

Procedure TF_RSelo.Carrega_Certidao(Sender : TOBject);
begin
  Dm.ArqAux2.Close;
  Dm.ArqAux2.Sql.Clear;
  Dm.ArqAux2.Sql.Add('SELECT entrega, COUNT(*) qde,');
  Dm.ArqAux2.Sql.Add('SUM(oficial)  oficial,');
  Dm.ArqAux2.Sql.Add('SUM(estado)   estado,');
  Dm.ArqAux2.Sql.Add('SUM(ipesp)    ipesp,');
  Dm.ArqAux2.Sql.Add('SUM(sinoreg)  sinoreg,');
  Dm.ArqAux2.Sql.Add('SUM(tribunal) tribunal,');
  Dm.ArqAux2.Sql.Add('SUM(custas)    total');
  Dm.ArqAux2.Sql.Add('FROM certidao');
  Dm.ArqAux2.Sql.Add('WHERE');
  Dm.ArqAux2.Sql.Add('    entrega  = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux2.Sql.Add('AND status   = "DEVOLVIDO PRONTO"');
  Dm.ArqAux2.Sql.Add('GROUP BY entrega');
  Dm.ArqAux2.Open;
  if (Dm.ArqAux2.RecordCount <> 0) then
  begin
    Dm.ArqAux1.Append;
    Dm.ArqAux1.FieldByName('descricao').asString  := 'CERTIDÕS ENTREGUES';
    Dm.ArqAux1.FieldByName('qde').asInteger       := Dm.ArqAux2.FieldByName('qde').asInteger;
    Dm.ArqAux1.FieldByName('oficial').asCurrency  := Dm.ArqAux2.FieldByName('oficial').asCurrency;
    Dm.ArqAux1.FieldByName('estado').asCurrency   := Dm.ArqAux2.FieldByName('estado').asCurrency;
    Dm.ArqAux1.FieldByName('ipesp').asCurrency    := Dm.ArqAux2.FieldByName('ipesp').asCurrency;
    Dm.ArqAux1.FieldByName('sinoreg').asCurrency  := Dm.ArqAux2.FieldByName('sinoreg').asCurrency;
    Dm.ArqAux1.FieldByName('tribunal').asCurrency := Dm.ArqAux2.FieldByName('tribunal').asCurrency;
    Dm.ArqAux1.FieldByName('conducao').asCurrency := 0.00;
    Dm.ArqAux1.FieldByName('total').asCurrency    := Dm.ArqAux2.FieldByName('total').asCurrency;
    Dm.ArqAux1.FieldByName('tipo').asInteger      := 2;
    Dm.ArqAux1.FieldByName('conta').asInteger     := 1;
    Dm.ArqAux1.FieldByName('traco').asString      := 'S';    
    Dm.ArqAux1.Post;
  end;
  Dm.ArqAux2.Close;
end;

procedure TF_RSelo.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

procedure TF_RSelo.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_RSelo.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_RSelo.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RSelo.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit2.text := '';
  maskedit7.text := '';
  maskedit1.setfocus;
end;

procedure TF_RSelo.BitBtn1Click(Sender: TObject);
var
  arq : String;
begin
  dm.ArqAux.close;
  dm.ArqAux.SQL.clear;
  dm.ArqAux.sql.add('SELECT a.data_p, a.protocolo, a.recibo, h, b.selo_serie, b.selo_numero, "T" as tipo');
  dm.ArqAux.SQL.add(' FROM td a');
  dm.ArqAux.sql.add(' LEFT OUTER JOIN selos b');
  dm.ArqAux.sql.add(' on(b.registro = a.protocolo)');
  dm.ArqAux.sql.add(' WHERE');
  Dm.ArqAux.Sql.Add('     a.data_p >= ' + QuotedStr(ConvData(MaskEdit1.Text)));
  Dm.ArqAux.Sql.Add(' AND a.data_p <= ' + QuotedStr(ConvData(MaskEdit7.Text)));
  dm.ArqAux.sql.add(' UNION ');
  DM.ArqAux.Sql.Add(' SELECT stat_data as data_p, nr_protoc as protocolo, recibo, tipo as h, selo_serie, selo_numero, "C" as tipo FROM certidao');
  DM.ArqAux.Sql.Add(' WHERE stat_data >= ' + QuotedStr(ConvData(MaskEdit1.Text)));
  Dm.ArqAux.Sql.Add(' AND   stat_data <= ' + QuotedStr(ConvData(MaskEdit7.Text)));
  Dm.ArqAux.Sql.Add(' ORDER BY tipo desc, protocolo');
  dm.ArqAux.open;

  if dm.ArqAux.RecordCount = 0 then
  begin
    Application.MessageBox('Movimento não Localizado, favor verificar!','Mensagem do Sistema', mb_ok);
    BitBtn2Click(sender);
    exit;
  end;

  Qk_Selo.QRLabel1.Caption :=  F_Menu.Label29.Caption;
  Qk_Selo.QRLabel2.Caption := 'Relação de Selos do período ' + MaskEdit1.Text + ' até ' + MaskEdit7.Text;
  qk_selo.QuickRep1.Prepare; 
  Qk_Selo.QuickRep1.Preview;
  Bitbtn3.setfocus;
end;

procedure TF_RSelo.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then BitBtn1.SetFocus;
end;

end.
