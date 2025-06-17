unit QkSeloB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TQk_SeloB = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape1: TQRShape;
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel127: TQRLabel;
    QRLabel129: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel132: TQRLabel;
    QRLabel128: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRLabel133: TQRLabel;
    QRShape8: TQRShape;
    QRLabel11: TQRLabel;
    QRShape10: TQRShape;
    QRLabel12: TQRLabel;
    QRShape18: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape20: TQRShape;
    QRShape25: TQRShape;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Qk_SeloB: TQk_SeloB;
  x, qtde, qtd_tit : Integer;
  emol, tri, pro, def, mut, aco, tot, dis : Currency;
  cemol, ctri, cpro, cdef, cmut, caco, ctot, cdis : Currency;

  qtde_rcv, qtde_rsv, qtde_not, qtde_rrcv, qtde_rrsv, qtde_pecv, qtde_pesv, qtde_rnot : Integer;
  emol_rcv, tri_rcv, pro_rcv, def_rcv, mut_rcv, aco_rcv, tot_rcv, dis_rcv : Currency;
  emol_rsv, tri_rsv, pro_rsv, def_rsv, mut_rsv, aco_rsv, tot_rsv, dis_rsv : Currency;
  emol_not, tri_not, pro_not, def_not, mut_not, aco_not, tot_not, dis_not : Currency;
  emol_rrcv, tri_rrcv, pro_rrcv, def_rrcv, mut_rrcv, aco_rrcv, tot_rrcv, dis_rrcv : Currency;
  emol_rrsv, tri_rrsv, pro_rrsv, def_rrsv, mut_rrsv, aco_rrsv, tot_rrsv, dis_rrsv : Currency;
  emol_pecv, tri_pecv, pro_pecv, def_pecv, mut_pecv, aco_pecv, tot_pecv, dis_pecv : Currency;
  emol_pesv, tri_pesv, pro_pesv, def_pesv, mut_pesv, aco_pesv, tot_pesv, dis_pesv : Currency;
  emol_rnot, tri_rnot, pro_rnot, def_rnot, mut_rnot, aco_rnot, tot_rnot, dis_rnot : Currency;

  ofi, est, ipe, sin,  con : Currency;
  ofic, estc, ipec, sinc, tric, totc : Currency;


  protini, protfim : String;

implementation

Uses DMTD, Menu, SeloB, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TQk_SeloB.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  trib, defe, proc : Currency;
begin
  QRLabel129.Caption := '0,00';
  QRLabel128.Caption := '';
  QRLabel13.Caption  := '';

  if Dm.ArqAux.RecordCount <> 0 then
  begin
    if (Trim(protini) = '') then protini := Dm.ArqAux.FieldByName('registro').asString;
    protfim := Dm.ArqAux.FieldByName('registro').asString;
    if (Dm.ArqAux.Eof) OR (x = 30) then
    begin
      QrShape1.Enabled := True;
      x := 0;
    end
    else
    begin
      x := x + 1;
      QrShape1.Enabled := False;
    end;
    if v_chk_07 then
    begin
      trib := TruncaV(dm.ArqAux.FieldByName('v_tribunal').AsCurrency) +
                                        TruncaV(dm.ArqAux.FieldByName('v_disttribunal').AsCurrency) +
                                        TruncaV(dm.ArqAux.FieldByName('v_nometribunal').AsCurrency);

      proc := TruncaV(dm.ArqAux.FieldByName('v_procuradoria').AsCurrency) +
                                       TruncaV(dm.ArqAux.FieldByName('v_distprocuradoria').AsCurrency) +
                                       TruncaV(dm.ArqAux.FieldByName('v_nomeprocuradoria').AsCurrency);

      defe := TruncaV(dm.ArqAux.FieldByName('v_defensoria').AsCurrency) +
                                        TruncaV(dm.ArqAux.FieldByName('v_distdefensoria').AsCurrency) +
                                        TruncaV(dm.ArqAux.FieldByName('v_nomedefensoria').AsCurrency);
    end
    else
    begin
      trib := TruncaV(dm.ArqAux.FieldByName('v_tribunal').AsCurrency);
      proc := TruncaV(dm.ArqAux.FieldByName('v_procuradoria').AsCurrency);
      defe := TruncaV(dm.ArqAux.FieldByName('v_defensoria').AsCurrency);
    end;

    QRLabel129.Caption := trim(StrCurr(trib , 14, True));


    if dm.arqaux.fieldbyname('tp_prot').AsString = '1' then
    begin
      emol := emol + dm.ArqAux.fieldbyname('v_emolumentos').ascurrency;
      tri  := tri  + trib;
      pro  := pro  + proc;
      def  := def  + defe;
      mut  := mut  + dm.ArqAux.FieldByName('v_mutua').AsCurrency;
      aco  := aco  + dm.ArqAux.FieldByName('v_acoterj').AsCurrency;
      tot  := tot  + dm.ArqAux.FieldByName('custas').AsCurrency;
      dis  := dis  + dm.ArqAux.FieldByName('v_distrib').AsCurrency;
      qtd_tit := qtd_tit + 1;
    end;
    qtde := qtde + 1;

    if trim(dm.ArqAux.FieldByName('tabela').AsString) = '4.1' then
    begin
      qtde_rcv := qtde_rcv + 1;
      emol_rcv := emol_rcv + dm.ArqAux.fieldbyname('v_emolumentos').ascurrency;
      tri_rcv  := tri_rcv + trib;
      pro_rcv  := pro_rcv + proc;
      def_rcv  := def_rcv + defe;
      mut_rcv  := mut_rcv + dm.ArqAux.FieldByName('v_mutua').AsCurrency;
      aco_rcv  := aco_rcv + dm.ArqAux.FieldByName('v_acoterj').AsCurrency;
      tot_rcv  := tot_rcv + dm.ArqAux.FieldByName('custas').AsCurrency;
      dis_rcv  := dis_rcv + dm.ArqAux.FieldByName('v_distrib').AsCurrency;
    end;
    if trim(dm.ArqAux.FieldByName('tabela').AsString) = '4.2' then
    begin
      qtde_rsv := qtde_rsv + 1;
      emol_rsv := emol_rsv + dm.ArqAux.fieldbyname('v_emolumentos').ascurrency;
      tri_rsv  := tri_rsv + trib;
      pro_rsv  := pro_rsv + proc;
      def_rsv  := def_rsv + defe;
      mut_rsv  := mut_rsv + dm.ArqAux.FieldByName('v_mutua').AsCurrency;
      aco_rsv  := aco_rsv + dm.ArqAux.FieldByName('v_acoterj').AsCurrency;
      tot_rsv  := tot_rsv + dm.ArqAux.FieldByName('custas').AsCurrency;
      dis_rsv  := dis_rsv + dm.ArqAux.FieldByName('v_distrib').AsCurrency;
    end;
    if trim(dm.ArqAux.FieldByName('tabela').AsString) = '4.8' then
    begin
      qtde_not := qtde_not + 1;
      emol_not := emol_not + dm.ArqAux.fieldbyname('v_emolumentos').ascurrency;
      tri_not  := tri_not + trib;
      pro_not  := pro_not + proc;
      def_not  := def_not + defe;
      mut_not  := mut_not + dm.ArqAux.FieldByName('v_mutua').AsCurrency;
      aco_not  := aco_not + dm.ArqAux.FieldByName('v_acoterj').AsCurrency;
      tot_not  := tot_not + dm.ArqAux.FieldByName('custas').AsCurrency;
      dis_not  := dis_not + dm.ArqAux.FieldByName('v_distrib').AsCurrency;
    end;
    if trim(dm.ArqAux.FieldByName('tabela').AsString) = '4.5' then
    begin
      qtde_rrcv := qtde_rrcv + 1;
      emol_rrcv := emol_rrcv + dm.ArqAux.fieldbyname('v_emolumentos').ascurrency;
      tri_rrcv  := tri_rrcv + trib;
      pro_rrcv  := pro_rrcv + proc;
      def_rrcv  := def_rrcv + defe;
      mut_rrcv  := mut_rrcv + dm.ArqAux.FieldByName('v_mutua').AsCurrency;
      aco_rrcv  := aco_rrcv + dm.ArqAux.FieldByName('v_acoterj').AsCurrency;
      tot_rrcv  := tot_rrcv + dm.ArqAux.FieldByName('custas').AsCurrency;
      dis_rrcv  := dis_rrcv + dm.ArqAux.FieldByName('v_distrib').AsCurrency;
    end;
    if trim(dm.ArqAux.FieldByName('tabela').AsString) = '4.4' then
    begin
      qtde_rrsv := qtde_rrsv + 1;
      emol_rrsv := emol_rrsv + dm.ArqAux.fieldbyname('v_emolumentos').ascurrency;
      tri_rrsv  := tri_rrsv + trib;
      pro_rrsv  := pro_rrsv + proc;
      def_rrsv  := def_rrsv + defe;
      mut_rrsv  := mut_rrsv + dm.ArqAux.FieldByName('v_mutua').AsCurrency;
      aco_rrsv  := aco_rrsv + dm.ArqAux.FieldByName('v_acoterj').AsCurrency;
      tot_rrsv  := tot_rrsv + dm.ArqAux.FieldByName('custas').AsCurrency;
      dis_rrsv  := dis_rrsv + dm.ArqAux.FieldByName('v_distrib').AsCurrency;
    end;
    if trim(dm.ArqAux.FieldByName('tabela').AsString) = '4.3' then
    begin
      qtde_pecv := qtde_pecv + 1;
      emol_pecv := emol_pecv + dm.ArqAux.fieldbyname('v_emolumentos').ascurrency;
      tri_pecv  := tri_pecv + trib;
      pro_pecv  := pro_pecv + proc;
      def_pecv  := def_pecv + defe;
      mut_pecv  := mut_pecv + dm.ArqAux.FieldByName('v_mutua').AsCurrency;
      aco_pecv  := aco_pecv + dm.ArqAux.FieldByName('v_acoterj').AsCurrency;
      tot_pecv  := tot_pecv + dm.ArqAux.FieldByName('custas').AsCurrency;
      dis_pecv  := dis_pecv + dm.ArqAux.FieldByName('v_distrib').AsCurrency;
    end;
    if trim(dm.ArqAux.FieldByName('tabela').AsString) = '4.6' then
    begin
      qtde_pesv := qtde_pesv + 1;
      emol_pesv := emol_pesv + dm.ArqAux.fieldbyname('v_emolumentos').ascurrency;
      tri_pesv  := tri_pesv + trib;
      pro_pesv  := pro_pesv + proc;
      def_pesv  := def_pesv + defe;
      mut_pesv  := mut_pesv + dm.ArqAux.FieldByName('v_mutua').AsCurrency;
      aco_pesv  := aco_pesv + dm.ArqAux.FieldByName('v_acoterj').AsCurrency;
      tot_pesv  := tot_pesv + dm.ArqAux.FieldByName('custas').AsCurrency;
      dis_pesv  := dis_pesv + dm.ArqAux.FieldByName('v_distrib').AsCurrency;
    end;
    if trim(dm.ArqAux.FieldByName('tabela').AsString) = '4.7' then
    begin
      qtde_rnot := qtde_rnot + 1;
      emol_rnot := emol_rnot + dm.ArqAux.fieldbyname('v_emolumentos').ascurrency;
      tri_rnot  := tri_rnot + trib;
      pro_rnot  := pro_rnot + proc;
      def_rnot  := def_rnot + defe;
      mut_rnot  := mut_rnot + dm.ArqAux.FieldByName('v_mutua').AsCurrency;
      aco_rnot  := aco_rnot + dm.ArqAux.FieldByName('v_acoterj').AsCurrency;
      tot_rnot  := tot_rnot + dm.ArqAux.FieldByName('custas').AsCurrency;
      dis_rnot  := dis_rnot + dm.ArqAux.FieldByName('v_distrib').AsCurrency;
    end;
    
    if (trim(dm.ArqAux.FieldByName('tabela').AsString) = '4.9') then
      QRLabel128.Caption := 'C'
    else QRLabel128.Caption := 'B';

    if dm.ArqAux.fieldbyname('tp_prot').asstring = '1' then
      qrlabel133.Caption := 'Total de Títulos ' + inttostr(qtde);
    if dm.ArqAux.fieldbyname('tp_prot').asstring = '2' then
      qrlabel133.Caption := 'Total de Certidões do dia ' + inttostr(qtde);
    If dm.ArqAux.fieldbyname('tp_prot').asstring = '3' then
      qrlabel133.Caption := 'Total de Certidões Seladas no dia ' + inttostr(qtde);

    QRLabel13.Caption := dm.ArqAux.FieldByName('selo_serie').AsString + dm.ArqAux.FieldByName('selo_numero').AsString;
  end;
end;

procedure TQk_SeloB.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  x    := 0;
  qtde := 0;
  emol := 0;
  tri  := 0;
  pro  := 0;
  def  := 0;
  mut  := 0;
  aco  := 0;
  tot  := 0;
  dis  := 0;
  protini := '';
  protfim := '';


  qtde_rcv  := 0;
  emol_rcv  := 0;
  tri_rcv   := 0;
  pro_rcv   := 0;
  def_rcv   := 0;
  mut_rcv   := 0;
  aco_rcv   := 0;
  tot_rcv   := 0;
  dis_rcv   := 0;

  qtde_rsv  := 0;
  emol_rsv  := 0;
  tri_rsv   := 0;
  pro_rsv   := 0;
  def_rsv   := 0;
  mut_rsv   := 0;
  aco_rsv   := 0;
  tot_rsv   := 0;
  dis_rsv   := 0;

  qtde_not  := 0;
  emol_not  := 0;
  tri_not   := 0;
  pro_not   := 0;
  def_not   := 0;
  mut_not   := 0;
  aco_not   := 0;
  tot_not   := 0;
  dis_not   := 0;

  qtde_rrcv := 0;
  emol_rrcv := 0;
  tri_rrcv  := 0;
  pro_rrcv  := 0;
  def_rrcv  := 0;
  mut_rrcv  := 0;
  aco_rrcv  := 0;
  tot_rrcv  := 0;
  dis_rrcv  := 0;

  qtde_rrsv  := 0;
  emol_rrsv  := 0;
  tri_rrsv   := 0;
  pro_rrsv   := 0;
  def_rrsv   := 0;
  mut_rrsv   := 0;
  aco_rrsv   := 0;
  tot_rrsv   := 0;
  dis_rrsv   := 0;

  qtde_pecv  := 0;
  emol_pecv  := 0;
  tri_pecv   := 0;
  pro_pecv   := 0;
  def_pecv   := 0;
  mut_pecv   := 0;
  aco_pecv   := 0;
  tot_pecv   := 0;
  dis_pecv   := 0;

  qtde_pesv  := 0;
  emol_pesv  := 0;
  tri_pesv   := 0;
  pro_pesv   := 0;
  def_pesv   := 0;
  mut_pesv   := 0;
  aco_pesv   := 0;
  tot_pesv   := 0;
  dis_pesv   := 0;

  qtde_rnot  := 0;
  emol_rnot  := 0;
  tri_rnot   := 0;
  pro_rnot   := 0;
  def_rnot   := 0;
  mut_rnot   := 0;
  aco_rnot   := 0;
  tot_rnot   := 0;
  dis_rnot   := 0;

  qtd_tit    := 0;
end;

procedure TQk_SeloB.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  qde : Integer;
begin
  QrLabel18.Caption := StrZero(IntToStr(qtd_tit), 4) + ' Títulos Registrados nesta data';
  QrLabel19.Caption := Trim(StrCurr(emol, 14, True));
  QrLabel20.Caption := Trim(StrCurr(tri, 14, True));
  QrLabel25.Caption := Trim(StrCurr(tot, 14, True));


  //Somando as Certidões
  cemol := 0.00;
  ctri  := 0.00;
  cpro  := 0.00;
  cdef  := 0.00;
  cmut  := 0.00;
  caco  := 0.00;
  ctot  := 0.00;
  cdis  := 0.00;
  qde   := 0;
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('SELECT entrega, COUNT(*) qde,');
  Dm.ArqAux1.Sql.Add('SUM(v_emolumento)  v_emolumento,');
  Dm.ArqAux1.Sql.Add('SUM(tribunal)   tribunal,');
  Dm.ArqAux1.Sql.Add('SUM(defensoria) defensoria,');
  Dm.ArqAux1.Sql.Add('SUM(procuradoria)  procuradoria,');
  Dm.ArqAux1.Sql.Add('SUM(custas)    total');
  Dm.ArqAux1.Sql.Add('FROM certidao');
  Dm.ArqAux1.Sql.Add('WHERE');
  Dm.ArqAux1.Sql.Add('    entrega >= ' + Chr(39) + ConvData(F_SeloB.MaskEdit1.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND entrega <= ' + Chr(39) + ConvData(F_SeloB.MaskEdit7.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND divisor not in (6, 7, 8)');
  Dm.ArqAux1.Sql.Add('AND status   = "DEVOLVIDO PRONTO"');
  Dm.ArqAux1.Sql.Add('GROUP BY entrega');
  Dm.ArqAux1.Open;
  if (Dm.ArqAux1.RecordCount <> 0) then
  begin

    qde   := Dm.ArqAux1.FieldByName('qde').asInteger;
    cemol := Dm.ArqAux1.FieldByName('v_emolumento').asCurrency;
    ctri  := Dm.ArqAux1.FieldByName('tribunal').asCurrency;
    cpro  := Dm.ArqAux1.FieldByName('procuradoria').asCurrency;
    cdef  := Dm.ArqAux1.FieldByName('defensoria').asCurrency;
    cmut  := 0.00;
    caco  := 0.00;
    ctot  := Dm.ArqAux1.FieldByName('total').asCurrency;
    cdis  := 0.00;
  end;
  Dm.ArqAux1.Close;
  //Carregando valores
  if (qde > 1) then
  begin
    QrLabel26.Caption := StrZero(IntToStr(qde), 3) + ' Certidões entregues nesta data';
  end
  else if (qde = 1) then
  begin
    QrLabel26.Caption := StrZero(IntToStr(qde), 3) + ' Certidão entregue nesta data';
  end
  else QrLabel26.Caption := 'Nenhuma certidão entregue nesta data';

  QrLabel27.Caption := Trim(StrCurr(cemol, 14, True));
  QrLabel28.Caption := Trim(StrCurr(ctri, 14, True));
  QrLabel33.Caption := Trim(StrCurr(ctot, 14, True));
  //Carregando total geral
  QrLabel35.Caption := Trim(StrCurr((emol + cemol), 14, True));
  QrLabel36.Caption := Trim(StrCurr((tri + ctri), 14, True));
  QrLabel41.Caption := Trim(StrCurr((tot + ctot), 14, True));

  QRLabel119.Caption := StrZero(IntToStr(qtde_rcv), 3);
  QRLabel47.Caption := trim(StrCurr((emol_rcv), 14, True));
  QRLabel48.Caption := trim(StrCurr((tri_rcv), 14, True));
  QRLabel54.Caption := trim(StrCurr((tot_rcv), 14, True));

  QRLabel120.Caption := StrZero(IntToStr(qtde_rsv), 3);
  QRLabel55.Caption := trim(StrCurr((emol_rsv), 14, True));
  QRLabel56.Caption := trim(StrCurr((tri_rsv), 14, True));
  QRLabel62.Caption := trim(StrCurr((tot_rsv), 14, True));

  QRLabel121.Caption := strzero(inttostr(qtde_not),3);
  QRLabel63.Caption := trim(StrCurr((emol_not), 14, True));
  QRLabel64.Caption := trim(StrCurr((tri_not), 14, True));
  QRLabel70.Caption := trim(StrCurr((tot_not), 14, True));

  QRLabel122.Caption :=  StrZero(IntToStr(qtde_rrcv), 3);
  QRLabel71.Caption := trim(StrCurr((emol_rrcv), 14, True));
  QRLabel72.Caption := trim(StrCurr((tri_rrcv), 14, True));
  QRLabel78.Caption := trim(StrCurr((tot_rrcv), 14, True));

  QRLabel123.Caption := StrZero(IntToStr(qtde_rrsv), 3);
  QRLabel79.Caption := trim(StrCurr((emol_rrsv), 14, True));
  QRLabel80.Caption := trim(StrCurr((tri_rrsv), 14, True));
  QRLabel86.Caption := trim(StrCurr((tot_rrsv), 14, True));

  QRLabel124.Caption :=  StrZero(IntToStr(qtde_pecv), 3);
  QRLabel87.Caption := trim(StrCurr((emol_pecv), 14, True));
  QRLabel88.Caption := trim(StrCurr((tri_pecv), 14, True));
  QRLabel94.Caption := trim(StrCurr((tot_pecv), 14, True));

  QRLabel125.Caption := StrZero(IntToStr(qtde_pesv), 3);
  QRLabel102.Caption := trim(StrCurr((emol_pesv), 14, True));
  QRLabel101.Caption := trim(StrCurr((tri_pesv), 14, True));
  QRLabel95.Caption  := trim(StrCurr((tot_pesv), 14, True));

  QRLabel126.Caption := StrZero(IntToStr(qtde_rnot), 3);
  QRLabel110.Caption := trim(StrCurr((emol_rnot), 14, True));
  QRLabel109.Caption := trim(StrCurr((tri_rnot), 14, True));
  QRLabel103.Caption := trim(StrCurr((tot_rnot), 14, True));


  {
  // Appendando total para gare.
  Dm.ResMen.Close;
  Dm.ResMen.Sql.Clear;
  Dm.ResMen.Sql.Add('SELECT * FROM resmen');
  Dm.ResMen.Sql.Add('WHERE');
  Dm.ResMen.Sql.Add('data = ' + Chr(39) + ConvData(F_SeloB.MaskEdit1.Text) + Chr(39));
  Dm.ResMen.Open;
  if (Dm.ResMen.RecordCount = 0) then
  begin
    Dm.ResMen.Append;
  end
  else Dm.ResMen.Edit;
  Dm.ResMen.FieldByName('data').asString       := F_SeloB.MaskEdit1.Text;
  Dm.ResMen.FieldByName('protocoloi').asString := protini;
  Dm.ResMen.FieldByName('protocolof').asString := protfim;
  Dm.ResMen.FieldByName('guia').asString       := Trim(F_SeloB.MaskEdit2.Text);
  Dm.ResMen.FieldByName('oficial').asCurrency  := (ofi + ofic);
  Dm.ResMen.FieldByName('estado').asCurrency   := (est + estc);
  Dm.ResMen.FieldByName('ipesp').asCurrency    := (ipe + ipec);
  Dm.ResMen.FieldByName('sinoreg').asCurrency  := (sin + sinc);
  Dm.ResMen.FieldByName('tribunal').asCurrency := (tri + tric);
  Dm.ResMen.FieldByName('total').asCurrency    := (tot + totc);
  Dm.ResMen.Post;
  Dm.ResMen.Close;
  }
end;

procedure TQk_SeloB.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  qtde := 0;
end;

end.
