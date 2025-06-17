unit U_F_RetratoLivroDeCertidaoPreviewNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, StdCtrls, ExtCtrls, ValorPor,U_LivroCertidaoRel,DBTables;

type
  TF_RetratoLivroDeCertidaoPreviewNew2 = class(TForm)
    Extenso: TValorPorExtenso;
    QuickRep11: TQuickRep;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QuickRep1: TQuickRep;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape6: TQRShape;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRLabel17: TQRLabel;
    QRShape10: TQRShape;
    QRShape17: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape24: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape1: TQRShape;
    QRShape21: TQRShape;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape5: TQRShape;
    QRDBText6: TQRDBText;
    QRShape11: TQRShape;
    QRDBText8: TQRDBText;
    QRShape18: TQRShape;
    QRDBText11: TQRDBText;
    QRShape22: TQRShape;
    QRDBText12: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape23: TQRShape;
    QRDBText13: TQRDBText;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand7: TQRBand;
    QrLabel11: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel10: TQRLabel;
    QRLblAssinado: TQRLabel;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape26: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep11BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    folhabranca : Boolean;
    livro: integer;


  end;

var
  F_RetratoLivroDeCertidaoPreviewNew2: TF_RetratoLivroDeCertidaoPreviewNew2;
  protini, protfim : String;
  pag : Integer;

implementation

uses  Menu;

{$R *.DFM}

procedure TF_RetratoLivroDeCertidaoPreviewNew2.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  x,i : Integer;
  dat1 : String;
  query1 : Tquery;
  qtdpre2:integer;
  protocoloinicial,
  protocolofinal: String;
begin

  query1:=Tquery.create(self);
  query1.Sql.Clear;
  query1.RequestLive := False;
  query1.databasename:= F_LivroCertidaoRel.Certidao.databasename;
  query1.sql.add('select count(*) qtdpre1 from certidao WHERE movimento = '+  #39 + F_LivroCertidaoRel.convData2(F_LivroCertidaoRel.Certidao.FieldByName('movimento').AsString, 'ano') + #39 );
  query1.Sql.Add('ORDER BY movimento, nr_protoc');
  query1.open;

  if (query1.RecordCount <> 0) then
  begin
   qtdpre2 := query1.fieldbyname('qtdpre1').AsInteger;
   //F_OfiNew2.Label12.Caption:= inttostr(qtdpre);
  end else
  begin
    qtdpre2 :=0;
  end;

  query1.Close;
  query1.Sql.Clear;
  query1.RequestLive := False;
  query1.Sql.Add('select nr_protoc as protocolo from certidao WHERE movimento  = ' + #39 + F_LivroCertidaoRel.ConvData2(F_LivroCertidaoRel.Certidao.FieldByName('movimento').AsString, 'ano') + #39);
  query1.Sql.Add('ORDER BY movimento, nr_protoc');
  query1.Open;

  if (query1.RecordCount <> 0) then
  begin
    query1.First;
    protocoloinicial:= query1.FieldByName('protocolo').AsString;
    query1.Last;
    protocolofinal  := query1.FieldByName('protocolo').AsString;
    query1.First;
    query1.free;
  end;


  if qtdpre2 = 0 then
  begin
    for i:=0 to Self.ComponentCount -1 do
    begin
      if Self.Components[i].ClassType = TQRShape then (Self.Components[i] as TQRShape).Visible :=false;
    end;

    QRGroup1.visible:=false;
    QRBand1.visible:=false;
    QRBand2.visible:=false;
    QRBand3.visible:=false;
    QRBand5.visible:=false;
    QRBand4.visible:=false;
    QRBand4.enabled:=false;

    QRLabel25.visible:=true;
    QRLabel26.visible:=true;
    QRLabel25.enabled:=true;
    QRLabel26.enabled:=true;

    QRLabel25.caption:= 'Assinatura._______________________________________________________ Data: '+F_LivroCertidaoRel.Certidao.FieldByName('movimento').AsString; //TabSql.Oficial.FieldByName('datap').AsString;
    QRLabel26.caption:= 'Certifico que encerrei o expediente de hoje, na hora regulamentar, não tendo sido recepcionado nenhum pedido.';

    QrLabel23.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, não tendo sido recepcionado nenhum pedido.';
    QRLabel24.Caption := 'Assinatura._______________________________________________________ Data: '+ F_LivroCertidaoRel.Certidao.FieldByName('movimento').AsString;
  end
  else
  begin
    QRLabel25.visible:=false;
    QRLabel26.visible:=false;
    QRLabel25.enabled:=false;
    QRLabel26.enabled:=false;
                                                                                             //+ '(' + Trim(Label1.Caption) + ')
    QrLabel23.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, tendo sido recepcionado ' + StrZero(inttostr(qtdpre2), 3) + ' pedidos, numerados de ' + protocoloinicial+' a '+ protocolofinal + '.';
    QRLabel24.Caption := 'Assinatura._______________________________________________________ Data: '+ F_LivroCertidaoRel.Certidao.FieldByName('movimento').AsString;
  end;


end;

procedure TF_RetratoLivroDeCertidaoPreviewNew2.QuickRep11BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  protini := '';
  protfim := '';
  pag     := 0;
  livro   := 0;


  if folhabranca then
  begin
    QrBand2.Height := 0;
    QRBand2.Enabled := False;
    QRBand2.Visible := False;

    QrBand3.Height := 136; //184
    QRBand3.Enabled := True;
    QRBand3.Visible := True;

    QRLabel23.Enabled := False;
    QRLabel23.Top := -5;//9

    QRLabel11.Enabled := True;
    QRLabel11.Top := 74;//108

  end;
end;

procedure TF_RetratoLivroDeCertidaoPreviewNew2.QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
  newliv : String;
begin

  {
  OS.33.884

  newliv := Trim(F_OfiNew2.MaskEdit3.Text);
  if (pag = 300) then
  begin
    newliv := InputBox('Novo Livro', 'Informe novo Livro : ', F_OfiNew2.MaskEdit3.Text);
    pag    := 2;
  end;
  }
//  QrLabel6.Caption  := IntToStr(pag);
  //QrLabel6.Caption  := 'Livro nº ' + newliv + ' Folha nº ' + IntToStr(pag);

{ if (pag = 300) then
  begin
    pag := 0;
    livro := livro + 1;
  end;}
  pag     := pag + 1;

  QrLabel6.Caption  := IntToStr(pag);
  //QRLabel2.Caption := 'Livro '+IntToStr(livro)+ ' - Protocolo';


end;

procedure TF_RetratoLivroDeCertidaoPreviewNew2.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin



  {
    STATUS REG_HIS

    status = A (Recepcionado)
    Status = B (Prenotado)
    status = F (Baixa de Irregular)
    status = K (Devolvido Irregular)
    status = S (Reentrada)
    status = D (Baixa de Registrado)
    status = I (Devolvido Registrado)
    status = U (volta de status)
    status = M (Baixa de Indisponibilidade)
    status = H (Baixa de Duvida)
    status = G (Baixa de Cancelado)
    status = L (Devolvido Cancelado)


    tabela REG_ATO
    ----------------------------
    status = R ( REGISTRADO)
    status = C ( CANCELADO )
    status = E (EXAME)
    status = I ( IRREGULAR)
  }



end;

procedure TF_RetratoLivroDeCertidaoPreviewNew2.QRBand6BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  newliv : String;
begin

  {
  OS.33.884

  newliv := Trim(F_OfiNew2.MaskEdit3.Text);
  if (pag = 300) then
  begin
    newliv := InputBox('Novo Livro', 'Informe novo Livro : ', F_OfiNew2.MaskEdit3.Text);
    pag    := 2;
  end;
  }
  QrLabel6.Caption  := IntToStr(pag);
  //QrLabel6.Caption  := 'Livro nº ' + newliv + ' Folha nº ' + IntToStr(pag);


{ if (pag = 300) then
  begin
    pag := 0;
    livro := livro + 1;
  end;}
  pag     := pag + 1;


end;


procedure TF_RetratoLivroDeCertidaoPreviewNew2.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  x : Integer;
  dat1 : String;
  protocoloinicial,
  protocolofinal: String;
  query2: Tquery;
  qtdpre:integer;
begin
  query2:=Tquery.create(self);
  query2.Sql.Clear;
  query2.RequestLive := False;
  query2.databasename:= F_LivroCertidaoRel.Certidao.databasename;
  query2.sql.add('select count(*) qtdpre1 from certidao WHERE movimento = '+  #39 + F_LivroCertidaoRel.ConvData2(F_LivroCertidaoRel.Certidao.FieldByName('movimento').AsString, 'ano') + #39 );
  query2.Sql.Add('ORDER BY movimento, nr_protoc');
  query2.open;

  if (query2.RecordCount <> 0) then
  begin
   qtdpre := query2.fieldbyname('qtdpre1').AsInteger;
   //F_OfiNew2.Label12.Caption:= inttostr(qtdpre);
  end else
  begin
    qtdpre :=0;
  end;

  query2.Close;
  query2.Sql.Clear;
  query2.RequestLive := False;
  query2.Sql.Add('select nr_protoc as protocolo from certidao WHERE movimento  = ' + #39 + F_LivroCertidaoRel.ConvData2(F_LivroCertidaoRel.Certidao.FieldByName('movimento').AsString, 'ano') + #39);
  query2.Sql.Add('ORDER BY movimento, nr_protoc');
  query2.Open;

  if (query2.RecordCount <> 0) then
  begin
    query2.First;
    protocoloinicial:= query2.FieldByName('protocolo').AsString;
    query2.Last;
    protocolofinal  := query2.FieldByName('protocolo').AsString;
    query2.First;
    query2.free;
  end;
  //If Trim(F_OfiNew1.Label9.Caption) <> '0' then
  if (F_LivroCertidaoRel.Certidao.RecordCount = 0)then
  begin
    QRLabel23.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, não tendo sido recepcionado nenhum pedido.';
    QRLabel24.Caption := 'Assinatura._______________________________________________________ Data: '+ F_LivroCertidaoRel.Certidao.FieldByName('movimento').AsString;
  end
  else                                                                                          //+ '(' + Trim(Label1.Caption) + ')
  begin

    QrLabel23.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, tendo sido recepcionado ' + StrZero(inttostr(qtdpre), 3) + ' pedidos, numerados de ' + protocoloinicial+' a '+ protocolofinal + '.';
    QRLabel24.Caption := 'Assinatura._______________________________________________________ Data: '+ F_LivroCertidaoRel.Certidao.FieldByName('movimento').AsString;
  end;
  //QrLabel10.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, tendo sido prenotados ' + StrZero(StrToInt(F_OfiNew2.Label12.Caption), 3) + '(' + Trim(Label1.Caption) + ') títulos, numerados de ' + F_OfiNew2.Label13.Caption + ', e tendo sido registrados ' + F_OfiNew2.Label9.Caption + ' títulos protocolados sob números ' + F_OfiNew2.Label14.Caption + '.';
  //Else
  //  QrLabel10.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, tendo sido prenotados ' + StrZero(StrToInt(F_OfiNew1.Label12.Caption), 3) + '(' + Trim(Label1.Caption) + ') títulos, numerados de ' + F_OfiNew1.Label13.Caption + ', e tendo sido registrados ' + F_OfiNew1.Label9.Caption + ' títulos';



end;

procedure TF_RetratoLivroDeCertidaoPreviewNew2.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  protini := '';
  protfim := '';
  pag     := StrToInt(F_LivroCertidaoRel.MaskEdit4.Text);

  if folhabranca then
  begin
    QrBand2.Height := 0;
    QRBand2.Enabled := False;
    QRBand2.Visible := False;

    QrBand3.Height := 136; //184
    QRBand3.Enabled := True;
    QRBand3.Visible := True;

    QRLabel23.Enabled := False;
    QRLabel23.Top := -5;//9

    QRLabel11.Enabled := True;
    QRLabel11.Top := 74;//108
  end;
end;

procedure TF_RetratoLivroDeCertidaoPreviewNew2.FormCreate(Sender: TObject);
var
 i: integer;
begin
if (F_LivroCertidaoRel.Certidao.RecordCount = 0) then
  begin
    for i:=0 to Self.ComponentCount -1 do
    begin
      if Self.Components[i].ClassType = TQRShape then (Self.Components[i] as TQRShape).Visible :=false;
    end;

    QRGroup1.visible:=false;
    QRBand1.visible:=false;
    QRBand2.visible:=false;
    QRBand3.visible:=false;
    QRBand5.visible:=false;
    QRBand4.visible:=false;
    QRBand4.enabled:=false;
  end
  else
  begin
    QRGroup1.visible:=true;
    QRBand1.visible:=true;
    QRBand2.visible:=true;
    QRBand3.visible:=true;
    QRBand5.visible:=true;
    QRBand4.visible:=true;
    QRBand4.enabled:=true;
  end
end;

end.


