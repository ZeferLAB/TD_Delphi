unit RAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons;

type
  TF_RAp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RAp: TF_RAp;

implementation

uses DMTD, Menu, QkRAp, FuncGeral, ProcGeral;

{$R *.DFM}


procedure TF_RAp.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RAp.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  MaskEdit1.SetFocus;
end;

procedure TF_RAp.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RAp.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RAp.MaskEdit1Exit(Sender: TObject);
begin
  if (ValidData(MaskEdit1.Text)) then MaskEdit2.Text := MaskEdit1.Text;
end;

procedure TF_RAp.BitBtn1Click(Sender: TObject);
var
  arq : String;
begin
  if (not ValidData(MaskEdit1.Text)) OR
     (not ValidData(MaskEdit2.Text)) then
  begin
    MessageBox(Handle, PChar('DATA INVÁLIDA !'), 'ATOS PRATICADOS', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ','','') + 'ATOS';
  CriaTabela('ATOS', arq);
  Dm.ArqAux.Close;
  Dm.ArqAux.RequestLive := True;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Open;
  // Pegando Movimento de títulos
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('SELECT protocolo, natureza, v_conducao,');
  Dm.ArqAux1.Sql.Add('microfilme, pag_adic, vias_adc,');  
  Dm.ArqAux1.Sql.Add('v_cartorio, vo_mic, vo_pag, vo_adc,');
  Dm.ArqAux1.Sql.Add('v_estado,   ve_mic, ve_pag, ve_adc,');
  Dm.ArqAux1.Sql.Add('v_ipesp,    vi_mic, vi_pag, vi_adc,');
  Dm.ArqAux1.Sql.Add('v_sinoreg,  vs_mic, vs_pag, vs_adc,');
  Dm.ArqAux1.Sql.Add('v_tribunal, vt_mic, vt_pag, vt_adc,');
  Dm.ArqAux1.Sql.Add('v_total,    v_mic,  v_pag,  v_adc');
  Dm.ArqAux1.Sql.Add('FROM td');
  Dm.ArqAux1.Sql.Add('WHERE');
  Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('ORDER BY protocolo');
  Dm.ArqAux1.Open;
  if (Dm.ArqAux1.RecordCount <> 0) then
  begin
    while (not Dm.ArqAux1.Eof) do
    begin
      // Ato praticado
      Dm.ArqAux.Append;
      Dm.ArqAux.FieldByName('protocolo').asString  := Dm.ArqAux1.FieldByName('protocolo').asString;
      Dm.ArqAux.FieldByName('qde').asInteger       := 1;
      Dm.ArqAux.FieldByName('prott').asString      := Dm.ArqAux1.FieldByName('protocolo').asString;
      Dm.ArqAux.FieldByname('descricao').asString  := Ver_Natureza(Dm.ArqAux1.FieldByName('natureza').asString, False);
      Dm.ArqAux.FieldByName('oficial').asCurrency  := Dm.ArqAux1.FieldByName('v_cartorio').asCurrency;
      Dm.ArqAux.FieldByName('estado').asCurrency   := Dm.ArqAux1.FieldByName('v_estado').asCurrency;
      Dm.ArqAux.FieldByName('ipesp').asCurrency    := Dm.ArqAux1.FieldByName('v_ipesp').asCurrency;
      Dm.ArqAux.FieldByName('sinoreg').asCurrency  := Dm.ArqAux1.FieldByName('v_sinoreg').asCurrency;
      Dm.ArqAux.FieldByName('tribunal').asCurrency := Dm.ArqAux1.FieldByName('v_tribunal').asCurrency;
      Dm.ArqAux.FieldByName('conducao').asCurrency := Dm.ArqAux1.FieldByName('v_conducao').asCurrency;
      Dm.ArqAux.FieldByName('total').asCurrency    := Dm.ArqAux1.FieldByName('v_total').asCurrency;
      Dm.ArqAux.FieldByName('tipo').asInteger      := 1;
      Dm.ArqAux.FieldByName('conta').asInteger     := 1;
      Dm.ArqAux.Post;
      // microfilme
      if (Dm.ArqAux1.FieldByName('microfilme').asInteger > 0) then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('prott').asString      := Dm.ArqAux1.FieldByName('protocolo').asString;
        Dm.ArqAux.FieldByname('descricao').asString  := 'MICROFILME (' + StrZero(Dm.ArqAux1.FieldByName('microfilme').asString, 3) + ')';
        Dm.ArqAux.FieldByName('qde').asInteger       := Dm.ArqAux1.FieldByName('microfilme').asInteger;        
        Dm.ArqAux.FieldByName('oficial').asCurrency  := Dm.ArqAux1.FieldByName('vo_mic').asCurrency;
        Dm.ArqAux.FieldByName('estado').asCurrency   := Dm.ArqAux1.FieldByName('ve_mic').asCurrency;
        Dm.ArqAux.FieldByName('ipesp').asCurrency    := Dm.ArqAux1.FieldByName('vi_mic').asCurrency;
        Dm.ArqAux.FieldByName('sinoreg').asCurrency  := Dm.ArqAux1.FieldByName('vs_mic').asCurrency;
        Dm.ArqAux.FieldByName('tribunal').asCurrency := Dm.ArqAux1.FieldByName('vt_mic').asCurrency;
        Dm.ArqAux.FieldByName('total').asCurrency    := Dm.ArqAux1.FieldByName('v_mic').asCurrency;
        Dm.ArqAux.FieldByName('tipo').asInteger      := 1;
        Dm.ArqAux.FieldByName('conta').asInteger     := 2;
        Dm.ArqAux.Post;
      end;
      //páginas adiconais
      if (Dm.ArqAux1.FieldByName('pag_adic').asInteger > 0) then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('prott').asString      := Dm.ArqAux1.FieldByName('protocolo').asString;
        Dm.ArqAux.FieldByName('qde').asInteger       := Dm.ArqAux1.FieldByName('pag_adic').asInteger;        
        Dm.ArqAux.FieldByname('descricao').asString  := 'PÁGINAS ADICIONAIS  (' + StrZero(Dm.ArqAux1.FieldByName('pag_adic').asString, 3) + ')';
        Dm.ArqAux.FieldByName('oficial').asCurrency  := Dm.ArqAux1.FieldByName('vo_pag').asCurrency;
        Dm.ArqAux.FieldByName('estado').asCurrency   := Dm.ArqAux1.FieldByName('ve_pag').asCurrency;
        Dm.ArqAux.FieldByName('ipesp').asCurrency    := Dm.ArqAux1.FieldByName('vi_pag').asCurrency;
        Dm.ArqAux.FieldByName('sinoreg').asCurrency  := Dm.ArqAux1.FieldByName('vs_pag').asCurrency;
        Dm.ArqAux.FieldByName('tribunal').asCurrency := Dm.ArqAux1.FieldByName('vt_pag').asCurrency;
        Dm.ArqAux.FieldByName('total').asCurrency    := Dm.ArqAux1.FieldByName('v_pag').asCurrency;
        Dm.ArqAux.FieldByName('tipo').asInteger      := 1;
        Dm.ArqAux.FieldByName('conta').asInteger     := 3;
        Dm.ArqAux.Post;
      end;
      //vias execentes
      if (Dm.ArqAux1.FieldByName('vias_adc').asInteger > 0) then
      begin
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('prott').asString      := Dm.ArqAux1.FieldByName('protocolo').asString;
        Dm.ArqAux.FieldByName('qde').asInteger       := Dm.ArqAux1.FieldByName('vias_adc').asInteger;        
        Dm.ArqAux.FieldByname('descricao').asString  := 'VIAS EXCEDENTES  (' + StrZero(Dm.ArqAux1.FieldByName('vias_adc').asString, 3) + ')';
        Dm.ArqAux.FieldByName('oficial').asCurrency  := Dm.ArqAux1.FieldByName('vo_adc').asCurrency;
        Dm.ArqAux.FieldByName('estado').asCurrency   := Dm.ArqAux1.FieldByName('ve_adc').asCurrency;
        Dm.ArqAux.FieldByName('ipesp').asCurrency    := Dm.ArqAux1.FieldByName('vi_adc').asCurrency;
        Dm.ArqAux.FieldByName('sinoreg').asCurrency  := Dm.ArqAux1.FieldByName('vs_adc').asCurrency;
        Dm.ArqAux.FieldByName('tribunal').asCurrency := Dm.ArqAux1.FieldByName('vt_adc').asCurrency;
        Dm.ArqAux.FieldByName('total').asCurrency    := Dm.ArqAux1.FieldByName('v_adc').asCurrency;
        Dm.ArqAux.FieldByName('tipo').asInteger      := 1;
        Dm.ArqAux.FieldByName('conta').asInteger     := 4;
        Dm.ArqAux.FieldByName('traco').asString      := 'S';
        Dm.ArqAux.Post;
      end;
      //Sub-Total
      Dm.ArqAux.Append;
      Dm.ArqAux.FieldByname('descricao').asString  := 'SUB-TOTAL';
      Dm.ArqAux.FieldByName('prott').asString      := Dm.ArqAux1.FieldByName('protocolo').asString;
      Dm.ArqAux.FieldByName('oficial').asCurrency  := SomaValores(arq, 'oficial', '1,2,3,4', Dm.ArqAux1.FieldByName('protocolo').asString, 1);
      Dm.ArqAux.FieldByName('estado').asCurrency   := SomaValores(arq, 'estado', '1,2,3,4', Dm.ArqAux1.FieldByName('protocolo').asString, 1);
      Dm.ArqAux.FieldByName('ipesp').asCurrency    := SomaValores(arq, 'ipesp', '1,2,3,4', Dm.ArqAux1.FieldByName('protocolo').asString, 1);
      Dm.ArqAux.FieldByName('sinoreg').asCurrency  := SomaValores(arq, 'sinoreg', '1,2,3,4', Dm.ArqAux1.FieldByName('protocolo').asString, 1);
      Dm.ArqAux.FieldByName('tribunal').asCurrency := SomaValores(arq, 'tribunal', '1,2,3,4', Dm.ArqAux1.FieldByName('protocolo').asString, 1);
      Dm.ArqAux.FieldByName('conducao').asCurrency := Dm.ArqAux1.FieldByName('v_conducao').asCurrency;
      Dm.ArqAux.FieldByName('total').asCurrency    := SomaValores(arq, 'total', '1,2,3,4', Dm.ArqAux1.FieldByName('protocolo').asString, 1);
      Dm.ArqAux.FieldByName('tipo').asInteger      := 1;
      Dm.ArqAux.FieldByName('conta').asInteger     := 99;
      Dm.ArqAux.FieldByName('traco').asString      := 'S';
      Dm.ArqAux.Post;
      Dm.ArqAux1.Next;
    end;
    Dm.ArqAux1.Close;
    // Incluindo total de títulos
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByname('descricao').asString  := 'TOTAL DE ' + SomaQuantidade(arq, 'qde', '1', '', 1) + ' TÍTULOS REGISTRADOS';
    Dm.ArqAux.FieldByName('oficial').asCurrency  := SomaValores(arq, 'oficial',  '1', '', 1);
    Dm.ArqAux.FieldByName('estado').asCurrency   := SomaValores(arq, 'estado',   '1', '', 1);
    Dm.ArqAux.FieldByName('ipesp').asCurrency    := SomaValores(arq, 'ipesp',    '1', '', 1);
    Dm.ArqAux.FieldByName('sinoreg').asCurrency  := SomaValores(arq, 'sinoreg',  '1', '', 1);
    Dm.ArqAux.FieldByName('tribunal').asCurrency := SomaValores(arq, 'tribunal', '1', '', 1);
    Dm.ArqAux.FieldByName('conducao').asCurrency := SomaValores(arq, 'conducao', '1', '', 1);
    Dm.ArqAux.FieldByName('total').asCurrency    := SomaValores(arq, 'total',    '1', '', 1);
    Dm.ArqAux.FieldByName('tipo').asInteger      := 1;
    Dm.ArqAux.FieldByName('conta').asInteger     := 98;
    Dm.ArqAux.Post;
    // Incluindo total de microfilmes
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByname('descricao').asString  := 'TOTAL DE ' + SomaQuantidade(arq, 'qde', '2', '', 1) + ' MICROFILMES';
    Dm.ArqAux.FieldByName('oficial').asCurrency  := SomaValores(arq, 'oficial',  '2', '', 1);
    Dm.ArqAux.FieldByName('estado').asCurrency   := SomaValores(arq, 'estado',   '2', '', 1);
    Dm.ArqAux.FieldByName('ipesp').asCurrency    := SomaValores(arq, 'ipesp',    '2', '', 1);
    Dm.ArqAux.FieldByName('sinoreg').asCurrency  := SomaValores(arq, 'sinoreg',  '2', '', 1);
    Dm.ArqAux.FieldByName('tribunal').asCurrency := SomaValores(arq, 'tribunal', '2', '', 1);
    Dm.ArqAux.FieldByName('conducao').asCurrency := SomaValores(arq, 'conducao', '2', '', 1);
    Dm.ArqAux.FieldByName('total').asCurrency    := SomaValores(arq, 'total',    '2', '', 1);
    Dm.ArqAux.FieldByName('tipo').asInteger      := 1;
    Dm.ArqAux.FieldByName('conta').asInteger     := 98;
    Dm.ArqAux.Post;
    // Incluindo total de páginas adicionais
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByname('descricao').asString  := 'TOTAL DE ' + SomaQuantidade(arq, 'qde', '3', '', 1) + ' PÁGINAS ADICIONAIS';
    Dm.ArqAux.FieldByName('oficial').asCurrency  := SomaValores(arq, 'oficial',  '3', '', 1);
    Dm.ArqAux.FieldByName('estado').asCurrency   := SomaValores(arq, 'estado',   '3', '', 1);
    Dm.ArqAux.FieldByName('ipesp').asCurrency    := SomaValores(arq, 'ipesp',    '3', '', 1);
    Dm.ArqAux.FieldByName('sinoreg').asCurrency  := SomaValores(arq, 'sinoreg',  '3', '', 1);
    Dm.ArqAux.FieldByName('tribunal').asCurrency := SomaValores(arq, 'tribunal', '3', '', 1);
    Dm.ArqAux.FieldByName('conducao').asCurrency := SomaValores(arq, 'conducao', '3', '', 1);
    Dm.ArqAux.FieldByName('total').asCurrency    := SomaValores(arq, 'total',    '3', '', 1);
    Dm.ArqAux.FieldByName('tipo').asInteger      := 1;
    Dm.ArqAux.FieldByName('conta').asInteger     := 98;
    Dm.ArqAux.Post;
    // Incluindo total de vias excedentes
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByname('descricao').asString  := 'TOTAL DE ' + SomaQuantidade(arq, 'qde', '4', '', 1) + ' VIAS EXCEDENTES';
    Dm.ArqAux.FieldByName('oficial').asCurrency  := SomaValores(arq, 'oficial',  '4', '', 1);
    Dm.ArqAux.FieldByName('estado').asCurrency   := SomaValores(arq, 'estado',   '4', '', 1);
    Dm.ArqAux.FieldByName('ipesp').asCurrency    := SomaValores(arq, 'ipesp',    '4', '', 1);
    Dm.ArqAux.FieldByName('sinoreg').asCurrency  := SomaValores(arq, 'sinoreg',  '4', '', 1);
    Dm.ArqAux.FieldByName('tribunal').asCurrency := SomaValores(arq, 'tribunal', '4', '', 1);
    Dm.ArqAux.FieldByName('conducao').asCurrency := SomaValores(arq, 'conducao', '4', '', 1);
    Dm.ArqAux.FieldByName('total').asCurrency    := SomaValores(arq, 'total',    '4', '', 1);
    Dm.ArqAux.FieldByName('tipo').asInteger      := 1;
    Dm.ArqAux.FieldByName('conta').asInteger     := 98;
    Dm.ArqAux.FieldByName('traco').asString      := 'S';
    Dm.ArqAux.Post;
    // Incluindo total GERAL de títulos
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByname('descricao').asString  := 'TOTAL GERAL DOS TÍTULOS REGISTRADOS';
    Dm.ArqAux.FieldByName('oficial').asCurrency  := SomaValores(arq, 'oficial',  '99', '', 1);
    Dm.ArqAux.FieldByName('estado').asCurrency   := SomaValores(arq, 'estado',   '99', '', 1);
    Dm.ArqAux.FieldByName('ipesp').asCurrency    := SomaValores(arq, 'ipesp',    '99', '', 1);
    Dm.ArqAux.FieldByName('sinoreg').asCurrency  := SomaValores(arq, 'sinoreg',  '99', '', 1);
    Dm.ArqAux.FieldByName('tribunal').asCurrency := SomaValores(arq, 'tribunal', '99', '', 1);
    Dm.ArqAux.FieldByName('conducao').asCurrency := SomaValores(arq, 'conducao', '99', '', 1);
    Dm.ArqAux.FieldByName('total').asCurrency    := SomaValores(arq, 'total',    '99', '', 1);
    Dm.ArqAux.FieldByName('tipo').asInteger      := 1;
    Dm.ArqAux.FieldByName('conta').asInteger     := 100;
    Dm.ArqAux.FieldByName('traco').asString      := 'S';
    Dm.ArqAux.Post;
  end;
  //***************************
  //Buscando Certidões.
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('SELECT * FROM certidao');
  Dm.ArqAux1.Sql.Add('WHERE');
  Dm.ArqAux1.Sql.Add('    data_cota >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND data_cota <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('ORDER BY nr_protoc');
  Dm.ArqAux1.Open;
  if (Dm.ArqAux1.RecordCount <> 0) then
  begin
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByname('descricao').asString  := 'CERTIDÕES';
    Dm.Arqaux.FieldByName('cabecalho').asString  := 'S';
    Dm.ArqAux.FieldByName('traco').asString      := 'S';
    Dm.ArqAux.FieldByName('tipo').asInteger      := 3;
    Dm.ArqAux.Post;
    while (not Dm.ArqAux1.Eof) do
    begin
      //Appendando somente certidões
      Dm.ArqAux.Append;
      Dm.ArqAux.FieldByName('protocolo').asString  := Dm.ArqAux1.FieldByName('nr_protoc').asString;
      Dm.ArqAux.FieldByName('qde').asInteger       := Dm.ArqAux1.FieldByName('qde').asInteger;
      Dm.ArqAux.FieldByname('descricao').asString  := Dm.ArqAux1.FieldByName('natureza').asString + '(' + StrZero(Dm.ArqAux1.FieldByName('qde').asString, 3) + ')';
      Dm.ArqAux.FieldByName('oficial').asCurrency  := Dm.ArqAux1.FieldByName('oficial').asCurrency;
      Dm.ArqAux.FieldByName('estado').asCurrency   := Dm.ArqAux1.FieldByName('estado').asCurrency;
      Dm.ArqAux.FieldByName('ipesp').asCurrency    := Dm.ArqAux1.FieldByName('ipesp').asCurrency;
      Dm.ArqAux.FieldByName('sinoreg').asCurrency  := Dm.ArqAux1.FieldByName('sinoreg').asCurrency;
      Dm.ArqAux.FieldByName('tribunal').asCurrency := Dm.ArqAux1.FieldByName('tribunal').asCurrency;
      Dm.ArqAux.FieldByName('total').asCurrency    := Dm.ArqAux1.FieldByName('custas').asCurrency;
      Dm.ArqAux.FieldByName('tipo').asInteger      := 3;
      Dm.ArqAux.FieldByName('conta').asInteger     := 1;
      if (Dm.ArqAux1.FieldByName('pag').asInteger = 0) then Dm.ArqAux.FieldByName('traco').asString := 'S';
      Dm.ArqAux.Post;
      if (Dm.ArqAux1.FieldByName('pag').asInteger > 0) then
      begin
        // Appendando páginas adicionais
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByName('protocolo').asString  := Dm.ArqAux1.FieldByName('nr_protoc').asString;
        Dm.ArqAux.FieldByName('qde').asInteger       := Dm.ArqAux1.FieldByName('pag').asInteger;
        Dm.ArqAux.FieldByname('descricao').asString  := 'Páginas Adicionais(' + StrZero(Dm.ArqAux1.FieldByName('pag').asString, 3) + ')';
        Dm.ArqAux.FieldByName('oficial').asCurrency  := Dm.ArqAux1.FieldByName('vo_pag').asCurrency;
        Dm.ArqAux.FieldByName('estado').asCurrency   := Dm.ArqAux1.FieldByName('ve_pag').asCurrency;
        Dm.ArqAux.FieldByName('ipesp').asCurrency    := Dm.ArqAux1.FieldByName('vi_pag').asCurrency;
        Dm.ArqAux.FieldByName('sinoreg').asCurrency  := Dm.ArqAux1.FieldByName('vs_pag').asCurrency;
        Dm.ArqAux.FieldByName('tribunal').asCurrency := Dm.ArqAux1.FieldByName('vt_pag').asCurrency;
        Dm.ArqAux.FieldByName('total').asCurrency    := Dm.ArqAux1.FieldByName('v_pag').asCurrency;
        Dm.ArqAux.FieldByName('tipo').asInteger      := 3;
        Dm.ArqAux.FieldByName('conta').asInteger     := 2;
        Dm.ArqAux.FieldByName('traco').asString      := 'S';
        Dm.ArqAux.Post;
        // incluindo subtotal de cada protocolo de certidão
        Dm.ArqAux.Append;
        Dm.ArqAux.FieldByname('descricao').asString  := 'SUB-TOTAL';
        Dm.ArqAux.FieldByName('oficial').asCurrency  := SomaValores(arq, 'oficial',  '1,2', '', 3);
        Dm.ArqAux.FieldByName('estado').asCurrency   := SomaValores(arq, 'estado',   '1,2', '', 3);
        Dm.ArqAux.FieldByName('ipesp').asCurrency    := SomaValores(arq, 'ipesp',    '1,2', '', 3);
        Dm.ArqAux.FieldByName('sinoreg').asCurrency  := SomaValores(arq, 'sinoreg',  '1,2', '', 3);
        Dm.ArqAux.FieldByName('tribunal').asCurrency := SomaValores(arq, 'tribunal', '1,2', '', 3);;
        Dm.ArqAux.FieldByName('total').asCurrency    := SomaValores(arq, 'total',    '1,2', '', 3);;
        Dm.ArqAux.FieldByName('tipo').asInteger      := 3;
        Dm.ArqAux.FieldByName('traco').asString      := 'S';
        Dm.ArqAux.FieldByName('conta').asInteger     := 99;
        Dm.ArqAux.Post;
      end;
      Dm.ArqAux1.Next;
    end;
    //Incluindo total de certidões
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByname('descricao').asString  := 'TOTAL DE ' + SomaQuantidade(arq, 'qde', '1', '', 3) + ' CERTIDÕES/CÓPIA';
    Dm.ArqAux.FieldByName('oficial').asCurrency  := SomaValores(arq, 'oficial',  '1', '', 3);
    Dm.ArqAux.FieldByName('estado').asCurrency   := SomaValores(arq, 'estado',   '1', '', 3);
    Dm.ArqAux.FieldByName('ipesp').asCurrency    := SomaValores(arq, 'ipesp',    '1', '', 3);
    Dm.ArqAux.FieldByName('sinoreg').asCurrency  := SomaValores(arq, 'sinoreg',  '1', '', 3);
    Dm.ArqAux.FieldByName('tribunal').asCurrency := SomaValores(arq, 'tribunal', '1', '', 3);
    Dm.ArqAux.FieldByName('total').asCurrency    := SomaValores(arq, 'total',    '1', '', 3);
    Dm.ArqAux.FieldByName('tipo').asInteger      := 3;
    Dm.ArqAux.FieldByName('tipo').asInteger      := 98;
    Dm.ArqAux.Post;
    //Incluindo total de páginas adicionais
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByname('descricao').asString  := 'TOTAL DE ' + SomaQuantidade(arq, 'qde', '2', '', 3) + ' PÁGINAS ADICIONAIS';
    Dm.ArqAux.FieldByName('oficial').asCurrency  := SomaValores(arq, 'oficial',  '2', '', 3);
    Dm.ArqAux.FieldByName('estado').asCurrency   := SomaValores(arq, 'estado',   '2', '', 3);
    Dm.ArqAux.FieldByName('ipesp').asCurrency    := SomaValores(arq, 'ipesp',    '2', '', 3);
    Dm.ArqAux.FieldByName('sinoreg').asCurrency  := SomaValores(arq, 'sinoreg',  '2', '', 3);
    Dm.ArqAux.FieldByName('tribunal').asCurrency := SomaValores(arq, 'tribunal', '2', '', 3);
    Dm.ArqAux.FieldByName('total').asCurrency    := SomaValores(arq, 'total',    '2', '', 3);
    Dm.ArqAux.FieldByName('tipo').asInteger      := 3;
    Dm.ArqAux.FieldByName('tipo').asInteger      := 98;
    Dm.ArqAux.Post;
    //Incluindo total de certidões/cópias
    Dm.ArqAux.Append;
    Dm.ArqAux.FieldByname('descricao').asString  := 'TOTAL GERAL DE CERTIDÕES';
    Dm.ArqAux.FieldByName('oficial').asCurrency  := SomaValores(arq, 'oficial',  '1,2', '', 3);
    Dm.ArqAux.FieldByName('estado').asCurrency   := SomaValores(arq, 'estado',   '1,2', '', 3);
    Dm.ArqAux.FieldByName('ipesp').asCurrency    := SomaValores(arq, 'ipesp',    '1,2', '', 3);
    Dm.ArqAux.FieldByName('sinoreg').asCurrency  := SomaValores(arq, 'sinoreg',  '1,2', '', 3);
    Dm.ArqAux.FieldByName('tribunal').asCurrency := SomaValores(arq, 'tribunal', '1,2', '', 3);
    Dm.ArqAux.FieldByName('total').asCurrency    := SomaValores(arq, 'total',    '1,2', '', 3);
    Dm.ArqAux.FieldByName('tipo').asInteger      := 3;
    Dm.ArqAux.FieldByName('conta').asInteger     := 100;
    Dm.ArqAux.Post;
  end;
  Dm.ArqAux1.Close;
  //Incluindo total geral títulos + certidões. }
  Dm.ArqAux.Append;
  Dm.ArqAux.FieldByname('descricao').asString  := 'TOTAL GERAL TÍTULOS E CERTIDÕES';
  Dm.ArqAux.FieldByName('oficial').asCurrency  := SomaValores(arq, 'oficial',  '100', '', 1) + SomaValores(arq, 'oficial',  '100', '', 3);
  Dm.ArqAux.FieldByName('estado').asCurrency   := SomaValores(arq, 'estado',   '100', '', 1) + SomaValores(arq, 'estado',   '100', '', 3);
  Dm.ArqAux.FieldByName('ipesp').asCurrency    := SomaValores(arq, 'ipesp',    '100', '', 1) + SomaValores(arq, 'ipesp',    '100', '', 3);
  Dm.ArqAux.FieldByName('sinoreg').asCurrency  := SomaValores(arq, 'sinoreg',  '100', '', 1) + SomaValores(arq, 'sinoreg',  '100', '', 3);
  Dm.ArqAux.FieldByName('tribunal').asCurrency := SomaValores(arq, 'tribunal', '100', '', 1) + SomaValores(arq, 'tribunal', '100', '', 3);
  Dm.ArqAux.FieldByName('total').asCurrency    := SomaValores(arq, 'total',    '100', '', 1) + SomaValores(arq, 'total',    '100', '', 3);
  Dm.ArqAux.FieldByName('tipo').asInteger      := 3;
  Dm.ArqAux.Post;
  //Abrindo Arquivo
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY recno, tipo, prott');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    MessageBox(Handle, PChar('Movimento não encontrado.'), 'ATOS PRATICADOS', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Application.CreateForm(TQk_RAp, Qk_RAp);
  Qk_RAp.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_RAp.QrLabel2.Caption := F_Menu.Label11.Caption;
  Qk_RAp.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_RAp.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_RAp.QrLabel5.Caption := 'ATOS PRATICADOS REFERENTE AOS REGISTROS DO PERÍODO DE ' + MaskEdit1.Text + ' ATÉ ' + MaskEdit2.Text;
  Qk_RAp.QuickRep1.Preview;
  Qk_RAp.Destroy;
  Qk_RAp := NIL;
  Dm.ArqAux.Close;
  Dm.ArqAux.RequestLive := False;
  DestroeTabela(arq);
end;

end.

