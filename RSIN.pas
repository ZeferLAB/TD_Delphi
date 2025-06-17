unit RSIN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers;

type
  TF_RSIN = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit2: TMaskEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RSIN: TF_RSIN;
  col, lin, pag, pulo : Integer;
  data, old_font, linha, dia, mes, ano : String;
  total, totdia : currency;

implementation

uses Func, Tabelas, Menu;

{$R *.DFM}
Function Alinha(Sentido, Tamanho, Cadeia : String) : String;
var
  branco : String;
  tam, tam1 : Integer;
Begin
  branco := '                                                            ';
  if sentido = 'D' then
  begin
    tam := strtoint(tamanho);
    tam1 := strtoint(tamanho) - 1;
    result := copy(branco,1,tam) + cadeia;
    result := copy(result, length(result) - tam1, tam);
  end
  else
  begin
    result := copy(cadeia + branco,1,tam);
  end;
end;

Function Def_Nat(Codigo : String) : String;
Begin
  Funcoes.Abre_Td_NatClick(Funcoes);
  if tabela.td_Nat.seek(codigo) then result := uppercase(tabela.td_Nat.fieldbyname('natureza').asstring) else result := '';
  Funcoes.Fecha_Td_NatClick(Funcoes);
end;

Function Def_Lan(Codigo : String) : String;
Begin
  Funcoes.Abre_Cad_lanClick(Funcoes);
  if tabela.Cad_lan.seek(codigo) then result := uppercase(tabela.Cad_Lan.fieldbyname('abreviado').asstring) else result := '';
  Funcoes.Fecha_Cad_LanClick(Funcoes);
end;

Procedure Cabec;
Begin
  with F_RSIN do
  begin
    pag := pag + 1;
    Printer.Canvas.Font.Name := old_font;
    Printer.Canvas.Font.Size := 16;
    Printer.Canvas.TextOut(col + 250, lin, 'OFICIAL DE REGISTRO DE TÍTULOS E DOCUMENTOS DE DIADEMA - SP');
//    lin := lin + pulo + 30;
//    Printer.Canvas.TextOut(col + 800, lin, 'SÃO JOSÉ DOS CAMPOS - SP');
    lin := lin + pulo + 20;
    Printer.Canvas.Font.Size := 12;
    lin := lin + pulo - 20;
    Printer.Canvas.Font.Size := 9;
    Printer.Canvas.TextOut(col, lin, 'Relatório para Recolhimento de Verba do Sinoreg no período de ' + F_RSIN.Maskedit1.text + ' até ' + F_RSIN.Maskedit2.text);
    Printer.Canvas.TextOut(col + 2100, lin, 'Pag.: ' + inttostr(pag));
    lin := lin + pulo;
    Printer.Canvas.Rectangle(col, lin, col + 2300 , lin + 1);
    lin := lin + pulo - 20;
    Printer.Canvas.Font.Name := 'Courier New';
    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.Font.Style := [fsBold];
    Printer.Canvas.TextOut(col, lin, '   Data             Valor ');
    Printer.Canvas.Font.Style := [];
    lin := lin + pulo;
    Printer.Canvas.Rectangle(col, lin, col + 2300 , lin + 1);
    lin := lin + pulo - 20;
  end;
end;

procedure TF_RSIN.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RSIN.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit1.setfocus;
end;

procedure TF_RSIN.BitBtn1Click(Sender: TObject);
begin
  dia := '  ' + inttostr(strtoint(copy(maskedit1.text,1,2)));
  dia := copy(dia, length(dia) - 1, 2);
  mes := '  ' + inttostr(strtoint(copy(maskedit1.text,4,2)));
  mes := copy(mes, length(mes) - 1, 2);
  ano := copy(maskedit1.text,7,4);
  Funcoes.Abre_TDClick(Funcoes);
  F_Menu.ApolloEnv1.SoftSeek := true;
  tabela.td.setorder(5);
  tabela.td.seek(ano + mes + dia);  
  if tabela.td.eof then
  begin
    Funcoes.Fecha_TDClick(Funcoes);
    showmessage('Movimento não localizado');
    F_RSIN.maskedit1.setfocus;
    exit;
  end;
  F_Menu.ApolloEnv1.SoftSeek := false;
  if messagedlg('Impressora Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    Funcoes.Fecha_TDClick(Funcoes);
    exit;
  end;
  Screen.cursor := crhourglass;
  statusbar1.simpletext := 'Imprimindo...';
  statusbar1.update;
  col := 80;
  lin := 100;
  pulo := 60;
  pag := 0;
  data := '';
  total := 0;
  totdia := 0;
  Printer.BeginDoc;
  old_font := printer.canvas.font.Name;
  while (not tabela.td.eof) and (tabela.td.fieldbyname('data_p').asDatetime >= strtodate(F_RSIN.Maskedit1.Text)) and (tabela.td.fieldbyname('data_p').asDatetime <= strtodate(F_RSIN.Maskedit2.Text)) do
  begin
    cabec;
    while (not tabela.td.eof) and (tabela.td.fieldbyname('data_p').asDatetime >= strtodate(F_RSIN.Maskedit1.Text)) and (tabela.td.fieldbyname('data_p').asDatetime <= strtodate(F_RSIN.Maskedit2.Text)) and (lin < 3100) do
    begin
      data := tabela.td.fieldbyname('data_p').asstring;
      while (not tabela.td.eof) and (tabela.td.fieldbyname('data_p').asstring = data) do
      begin
        total := total + tabela.td.fieldbyname('v_sinoreg').ascurrency + tabela.td.fieldbyname('vs_pag').ascurrency + tabela.td.fieldbyname('vs_mic').ascurrency;
        totdia := totdia + tabela.td.fieldbyname('v_sinoreg').ascurrency + tabela.td.fieldbyname('vs_pag').ascurrency + tabela.td.fieldbyname('vs_mic').ascurrency;
        tabela.td.next;
      end;
      linha := data;
      linha := linha + ' ' + alinha('D', '14', formatcurr('###,###,##0.00', totdia));
      Printer.Canvas.TextOut(col, lin, linha);
      totdia := 0;
      lin := lin + pulo;
      if lin >= 3100 then
      begin
        Printer.NewPage;
        lin := 100;
        cabec;
      end;
    end;
    if lin >= 3100 then
    begin
      Printer.NewPage;
      lin := 100;
    end;
  end;
  Printer.Canvas.Rectangle(col, lin, col + 2300 , lin + 1);
  lin := lin + pulo;
  linha := '  TOTAL   ';
  linha := linha + ' ' + alinha('D', '14', formatcurr('###,###,##0.00', total));
  Printer.Canvas.TextOut(col, lin, linha);
  lin := lin + pulo;
  Printer.Canvas.Font.Name := old_font;
  Printer.Canvas.Rectangle(col, lin, col + 2300 , lin + 1);
  lin := lin + pulo;
  Printer.EndDoc;
  Funcoes.Fecha_TDClick(Funcoes);
  statusbar1.simpletext := 'Fim do Relatório';
  statusbar1.update;
  Screen.cursor := crdefault;
  bitbtn3.setfocus;
end;

procedure TF_RSIN.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_RSIN.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then bitbtn1.setfocus;
end;

end.
