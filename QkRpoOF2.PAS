unit QkRpoOF2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, StdCtrls, ExtCtrls;

type
  TF_QkRpoOF2 = class(TForm)
    QuickRep1: TQuickRep;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRShape8: TQRShape;
    QRShape16: TQRShape;
    QRLabel14: TQRLabel;
    QRBand3: TQRBand;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRShape7: TQRShape;
    QRLabel18: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape15: TQRShape;
    QRLabel16: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    ContaDetalhes: Integer;
    { Public declarations }
  end;

var
  F_QkRpoOF2: TF_QkRpoOF2;
  x, qdetit, livro,  pag : Integer;
  pritit, ultit : String;
  

implementation

uses DMTD, RPO, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_QkRpoOF2.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  linha : String;
begin
  if (Label4.Caption = 'COM MOV') then begin
    if (pritit = '') then pritit := Dm.ArqAux.FieldByName('p_auxiliar').asString;
    ultit := Dm.ArqAux.FieldByName('p_auxiliar').asString;
    qdetit := qdetit + 1;
  end else begin
    QrDbText1.Enabled := False;
    QrDbText2.Enabled := False;
    QrDbText3.Enabled := False;
    QrDbText4.Enabled := False;
    QrLabel10.Enabled := False;
  end;
  if (Dm.ArqAux.FieldByName('registro').asInteger = 0) then begin
    QrDbText2.Enabled := False;
  end else begin
    QrDbText2.Enabled := True;
  end;
  x := x + 1;
//  if (x = 56) then
//  begin
    QrShape1.Enabled := True;
    x := 0;
//  end
//  else QrShape1.Enabled := False;

  dm.TD.close;
  dm.TD.sql.Clear;
  dm.TD.sql.add('select recno, livro_a, folha_a from td where p_auxiliar = ' + dm.ArqAux.FieldByName('p_auxiliar').AsString);
  dm.td.open;

//if (a_chk06) then - Zefer 23/07 - Nao sei pq existia essa comparação, pois nem EXISTIA ESSE CAMPO NA TABELA !!!  ,
  If (Not(v_chk_17)) Then
  Begin
    if (True) then
    begin
      if dm.td.RecordCount <> 0 then
      begin
        Dm.ArqAux1.close;
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('update td set livro_a = ' + inttostr(livro) + ', folha_a = ' + inttostr(pag));
        Dm.ArqAux1.Sql.Add(' where recno = ' + Dm.Td.FieldByName('recno').ASString);
        Try
          Dm.ArqAux1.ExecSql;
        Except
          ShowMessage('Problemas para gerar o Livro');
        End;
      end;
    end;
  end;
  dm.TD.close;

  if (trim(dm.ArqAux.FieldByName('livro_b').AsString) <> '') and (trim(dm.ArqAux.FieldByNAme('folha_b').AsString) <> '') then
  begin
    QRLabel14.Caption := 'B   -  ' + dm.ArqAux.FieldByName('livro_b').AsString + '  /   ' + dm.ArqAux.FieldByNAme('folha_b').AsString;
  end;
  if (trim(dm.ArqAux.FieldByName('livro_c').AsString) <> '') and (trim(dm.ArqAux.FieldByNAme('folha_c').AsString) <> '') then
  begin
    QRLabel14.Caption := 'C   -  ' + dm.ArqAux.FieldByName('livro_c').AsString + '  /   ' + dm.ArqAux.FieldByNAme('folha_c').AsString;
  end;

  {if (F_Menu.Label39.Caption = '28.287.131/0001-10') or (F_Menu.Label39.Caption = '28287131000110') or
    (F_Menu.Label39.Caption = '28.508.639/0001-00') or (F_Menu.Label39.Caption = '28508639000100') or
    (F_Menu.Label39.Caption = '27.215.296/0001-14') or (F_Menu.Label39.Caption = '27215296000114') or
    (F_Menu.Label39.Caption = '29.603.272/0001-68') or (F_Menu.Label39.Caption = '29603272000168') or
    (F_Menu.Label39.Caption = '27.251.207/0001-95') or (F_Menu.Label39.Caption = '27251207000195') or
    (F_Menu.Label39.Caption = '28.344.918/0001-77') or (F_Menu.Label39.Caption = '28344918000177') or
    (F_Menu.Label39.Caption = '27.282.471/0001-96') or (F_Menu.Label39.Caption = '27282471000196') or
    (F_Menu.Label39.Caption = '29.649.551/0001-62') or (F_Menu.Label39.Caption = '29649551000162') or
    (F_Menu.Label39.Caption = '27.146.890/0001-09') or (F_Menu.Label39.Caption = '27146890000109') or
    (F_Menu.Label39.Caption = '01.221.489/0001-94') or (F_Menu.Label39.Caption = '01221489000194') Then}
  if (F_Menu.livroAutomatico) then
  begin
    if F_Menu.Label54.Caption = '1-Produção' Then
    Begin
      if (F_Menu.livroAutomatico) then
      begin
        ContaDetalhes:= ContaDetalhes + 1;
        if ContaDetalhes = strtoint(F_Menu.Label58.Caption) Then
        begin
          QuickRep1.NewPage;
          ContaDetalhes:= 0;
        end
      End;
    End;
  End;
end;

procedure TF_QkRpoOF2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x      := 0;
  qdetit := 0;
  pritit := '';
  ultit  := '';
  livro  := StrToInt(F_RPO.MaskEdit3.Text);
  pag    := StrToInt(F_RPO.MaskEdit4.Text);
end;

procedure TF_QkRpoOF2.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel13.Caption := '';

  if (qdetit = 0) then
  begin
    QrLabel13.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, não tendo recepcionado nenhum título. O Oficial_____________';
  end
  else
  begin
    if (qdetit = 1) then
    begin
      QrLabel13.Caption := 'Certifico que encerrei o expediente de hoje, na hora regulamentar, com ' + inttostr(qdetit) + ' título protocolado de ' + pritit + ' a ' + ultit + '. O Oficial_____________';
    end
    else QrLabel13.Caption := 'Certifico que encerrei o expediente de hoje ' + dm.ArqAux.FieldByName('data_p').AsString + ', na hora  regulamentar, com ' + inttostr(qdetit) + ' títulos protocolados de ' + pritit + ' a ' + ultit + '. O Oficial_____________';
  end;
  pritit := '';
  qdetit := 0;
end;

procedure TF_QkRpoOF2.QRBand1BeforePrint(Sender: TQRCustomBand;
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

procedure TF_QkRpoOF2.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  F_QkRpoOF2.QrLabel18.Caption := DataExtenso(dm.ArqAux.FieldByName('data_p').AsString, False, '');
end;

end.
