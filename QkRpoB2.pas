unit QkRpoB2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, StdCtrls;

type
  TF_QkRpoB2 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRMemo1: TQRMemo;
    QRShape1: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape2: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel18: TQRLabel;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRMemo2: TQRMemo;
    QRShape3: TQRShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1AfterPrint(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_QkRpoB2: TF_QkRpoB2;
  x, qdetit, livro, pag : Integer;
  pritit, ultit : String;

implementation

Uses DMTD, Menu, FuncGeral, ProcGeral , URPOLB, URPOLC;
{$R *.DFM}

procedure TF_QkRpoB2.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel7.Caption := Ver_Situacao(dm.td_pesso.FieldByName('situacao').AsString, False);
  qrlabel12.Caption := dm.td_pesso.FieldByName('nome').AsString + ' ';
  if trim(dm.td_pesso.FieldByName('doc1').AsString) <> '' then
    QRLabel12.Caption := QRLabel12.Caption + dm.td_pesso.FieldByName('tip_doc1').AsString + ' ' + dm.td_pesso.FieldByName('doc1').AsString + ' ';
  if trim(dm.td_pesso.FieldByName('doc2').AsString) <> '' then
    QRLabel12.Caption := QRLabel12.Caption + dm.td_pesso.FieldByName('tip_doc2').AsString + ' ' + dm.td_pesso.FieldByName('doc2').AsString + ' ';
  if (trim(dm.td_pesso.FieldByName('doc1').AsString) <> '') and (trim(dm.td_pesso.FieldByName('doc2').AsString) <> '') and (trim(dm.td_pesso.FieldByName('tip_doc2').AsString) <> '')then
    QRLabel12.Caption := QRLabel12.Caption + '';
  if (trim(dm.td_pesso.FieldByName('doc1').AsString) <> '') and (trim(dm.td_pesso.FieldByName('doc2').AsString) = '') and (trim(dm.td_pesso.FieldByName('tip_doc2').AsString) = '')then
    QRLabel12.Caption := QRLabel12.Caption +'Identidade: N/C';
end;

procedure TF_QkRpoB2.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRMemo1.Lines.Clear;
  if dm.ArqAux.FieldByName('tipo_reg').AsString <> 'Reg.' Then
    QRMemo1.Lines.add('Registro de ' + dm.ArqAux.FieldByName('ext_nat').AsString +
                      ', protocolizado no Livro A nº ' + dm.ArqAux.FieldByName('livro_a').AsString +
                      ', folha ' + dm.ArqAux.FieldByName('folha_a').AsString + ', sob o número ' + dm.ArqAux.FieldByName('p_auxiliar').AsString +
                      ','+ dm.ArqAux.FieldByName('tipo_reg').AsString +' '+dm.ArqAux.FieldByName('averba').AsString +
                      ', em ' + dm.ArqAux.FieldByName('data_r').AsString + ' apresentado por ' + dm.ArqAux.FieldByName('apresentante').AsString +
                      ', cuja(s) a(s) parte(s) é/são :')
  else
  QRMemo1.Lines.add('Registro de ' + dm.ArqAux.FieldByName('ext_nat').AsString +
                    ', protocolizado no Livro A nº ' + dm.ArqAux.FieldByName('livro_a').AsString +
                    ', folha ' + dm.ArqAux.FieldByName('folha_a').AsString + ', sob o número ' + dm.ArqAux.FieldByName('p_auxiliar').AsString +
                    ', em ' + dm.ArqAux.FieldByName('data_r').AsString + ' apresentado por ' + dm.ArqAux.FieldByName('apresentante').AsString +
                    ', cuja(s) a(s) parte(s) é/são :');


  dm.TD.close;
  dm.TD.sql.Clear;
  dm.TD.sql.add('select recno, livro_b, folha_b from td where p_auxiliar = ' + dm.ArqAux.FieldByName('p_auxiliar').AsString);
  dm.td.open;


//if (a_chk06) then - Zefer 23/07 - Nao sei pq existia essa comparação, pois nem EXISTIA ESSE CAMPO NA TABELA !!!
  if (True) then
  begin
    if dm.td.RecordCount <> 0 then
    begin
      Dm.ArqAux1.close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('update td set livro_b = ' + inttostr(livro) + ', folha_b = ' + inttostr(pag));
      Dm.ArqAux1.Sql.Add(' where recno = ' + Dm.Td.FieldByName('recno').ASString);
      Try
        Dm.ArqAux1.ExecSql;
      Except
        ShowMessage('Problemas para gerar o Livro');
      End;
{      dm.TD.Edit;
      dm.td.FieldByName('livro_b').AsString := inttostr(livro);
      dm.td.FieldByName('folha_b').AsString := inttostr(pag);
      dm.td.Post;}
    end;
  end;
  dm.TD.close;

  qdetit := qdetit + 1;
  dm.Td_Pesso.Close;
  dm.Td_Pesso.sql.Clear;
  dm.Td_Pesso.sql.add('select situacao, nome, tip_doc1, doc1, tip_doc2, doc2');
  dm.td_pesso.sql.add('from td_pesso');
  dm.td_pesso.sql.add('where');
  dm.td_pesso.sql.add('p_auxiliar = ' + dm.ArqAux.FieldByName('p_auxiliar').AsString);
  dm.Td_Pesso.open;
end;

procedure TF_QkRpoB2.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel18.Caption := DataExtenso(dm.ArqAux.FieldByName('data_p').AsString, False, '');
end;

procedure TF_QkRpoB2.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel8.Caption := 'Certifico que encerrei o dia tendo registrado a quantidade de ' + strzero(inttostr(qdetit), 4) + ' Títulos.';
  qdetit := 0;
end;

procedure TF_QkRpoB2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  try
    livro  := StrToInt(F_RPOLB.MaskEdit3.Text);
    pag    := StrToInt(F_RPOLB.MaskEdit4.Text);
  Except
    livro  := StrToInt(F_RPOLC.MaskEdit3.Text);
    pag    := StrToInt(F_RPOLC.MaskEdit4.Text);
  end;
end;

procedure TF_QkRpoB2.QuickRep1AfterPrint(Sender: TObject);
begin
  qdetit := 0;
end;

procedure TF_QkRpoB2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (a_chk07) then
  begin
    pag := pag + 1;
    if pag = 300 then
    begin
      Label2.Caption := inttostr(strtoint(label2.Caption) + 1);
      pag := 2;
      livro := livro + 1;
    end;
  end
  else
  begin
    pag := pag + 1;
    if pag = 301 then
    begin
      Label2.Caption := inttostr(strtoint(label2.Caption) + 1);
      pag := 1;
      livro := livro + 1;
    end;
  end;
  QrLabel15.Caption := 'Livro nº ' + strzero(IntToStr(livro), 3) +  '   Folha nº ' + StrZero(IntTostr(pag), 3);
end;

procedure TF_QkRpoB2.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  texto, texto1 : string;
  temdaje       : Boolean;
begin
  dm.Selos.Close;
  dm.Selos.sql.Clear;
  //dm.selos.sql.add('select * from selos where recibo = ' + dm.ArqAux.FieldByName('registro').AsString);
  dm.selos.sql.add('select daje, serie_daje, selo, selo_validador from td where p_auxiliar = ' + dm.ArqAux.FieldByName('p_auxiliar').AsString);
  dm.Selos.Open;
  texto  := '';
  texto1 := '';
  QRMemo2.Lines.Clear;

  texto :=  texto + 'no valor de ' + trim(StrCurr(dm.ArqAux.FieldByName('valor_base').AsCurrency, 14, True)) + ', com o(s) selo(s) nº ';

  while not dm.Selos.eof do
  begin
    texto := texto +  dm.Selos.FieldByName('selo_validador').AsString + dm.Selos.FieldByName('selo').AsString + ', ' ;
    if dm.Selos.FieldByName('daje').AsString <> '' then
    begin
      texto1 := texto1 + dm.Selos.FieldByName('daje').AsString;
      temdaje := True;
    end;
    if temdaje then
      texto1 := texto1 + ', ';
    temdaje := False;
    dm.Selos.Next;
  end;
  if texto1 <> '' then
    texto := texto +  ' com o(s) DAJE(s) n° ' + Copy(texto1,1,Length(texto1)-2);

  texto := texto + ' e custas no valor de ' + trim(StrCurr(dm.ArqAux.FieldByName('custas').AsCurrency, 14, True));
  QRMemo2.Lines.add(texto + ', digitalizado, que faz parte integrante e complementar ' +
                            'do presente registro. Do que dou fé. O Oficial________________');
end;

end.
