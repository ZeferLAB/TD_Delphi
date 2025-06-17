unit Rav1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers;

type
  TF_Rav1 = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit3: TMaskEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Rav1: TF_Rav1;
  col1, col, lin, pulo : Integer;
  dia, mes, ano, prot : String;
  old_font : String;

implementation

uses Func, Tabelas;

{$R *.DFM}
Procedure Cabec;
Begin
  with F_RAV1 do
  begin
    Printer.Canvas.Font.Name := old_font;
    Printer.Canvas.Font.Size := 16;
    Printer.Canvas.TextOut(col + 250, lin, '2º OFICIAL DE REGISTRO DE TÍTULOS E DOCUMENTOS');
    lin := lin + pulo + 30;
    Printer.Canvas.TextOut(col + 650, lin, 'SÃO JOSÉ DOS CAMPOS - SP');
    lin := lin + pulo + 20;
    Printer.Canvas.Rectangle(col, lin, col + 2700 , lin + 1);
    Printer.Canvas.Font.Size := 10;
    lin := lin + pulo - 20;
    Printer.Canvas.TextOut(col + 400, lin, 'PRAÇA SEBASTIÃO HUMEL, 148 - CENTRO - TELEFONE (12) - 3942-4303');
    lin := lin + pulo;
    Printer.Canvas.Font.Size := 12;
    Printer.Canvas.TextOut(col + 900, lin, 'AMILTON ALVARES');
    lin := lin + pulo;
    Printer.Canvas.TextOut(col + 890,lin, 'OFICIAL DELEGADO');
    lin := lin + (pulo * 2);
    Printer.Canvas.Font.Size := 14;
    Printer.Canvas.TextOut(col + 800, lin, 'RECIBO DE NOTIFICAÇÃO');
    lin := lin + (pulo * 2);
    Printer.Canvas.Font.Size := 10;
    Printer.Canvas.TextOut(col, lin, 'REMETENTE');
    lin := lin + (pulo * 2);
    Printer.Canvas.Font.Size := 10;
  end;
end;

procedure TF_Rav1.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_Rav1.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit3.text := '';
  maskedit1.setfocus;
end;

procedure TF_Rav1.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_Rav1.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_Rav1.BitBtn1Click(Sender: TObject);
var
  ok : boolean;
  prot : String;
begin
  dia := '  ' + inttostr(strtoint(copy(maskedit1.text,1,2)));
  dia := copy(dia, length(dia) - 1, 2);
  mes := '  ' + inttostr(strtoint(copy(maskedit1.text,4,2)));
  mes := copy(mes, length(mes) - 1, 2);
  ano := copy(maskedit1.text,7,4);
  Funcoes.Abre_TDClick(Funcoes);
  tabela.td.setorder(5);
  if (maskedit3.text <> '') and (maskedit3.text <> '0') then
  begin
    prot := '      ' + maskedit3.text;
    prot := copy(prot, length(prot) - 5, 6);
  end;
  if not tabela.td.seek(ano + mes + dia + prot) then
  begin
    Funcoes.Fecha_TDClick(Funcoes);
    showmessage('Movimento não localizado');
    F_RAV1.maskedit1.setfocus;
    ok := False;
    exit;
  end;
  ok := true;
  if messagedlg('Impressora Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    Funcoes.Fecha_TDClick(Funcoes);
    exit;
  end;
  Funcoes.Abre_PessoClick(Funcoes);
  tabela.Td_Pesso.setorder(2);
  Screen.cursor := crhourglass;
  statusbar1.simpletext := 'Imprimindo...';
  statusbar1.update;
  col := 150;
  col1 := 1250;
  lin := 100;
  pulo := 60;
  while (not tabela.td.eof) and (ok) do
  begin
    prot := '      ' + tabela.td.fieldbyname('p_auxiliar').asstring;
    prot := copy(Prot, length(prot) - 5, 6);
    if (copy(tabela.td.fieldbyname('tabela').asstring,1,2) = '3') and (tabela.td.fieldbyname('status').asstring = 'PRONTO') then
    begin
      if tabela.td_pesso.Seek(prot) then
      Begin
        while (not tabela.td_pesso.eof) and (tabela.td_pesso.fieldbyname('p_auxiliar').asstring = tabela.td.fieldbyname('p_auxiliar').asstring) do
        begin
          if copy(tabela.td_pesso.fieldbyname('situacao').asstring,1,1) = 'D' then
          Begin
            Printer.BeginDoc;
            old_font := printer.canvas.font.Name;
            cabec;
            Printer.Canvas.TextOut(col, lin, 'REGISTRO POR MICROFILME SOB O Nº ' + tabela.td.fieldbyname('protocolo').asstring);
            lin := lin + (pulo * 2);
            printer.canvas.font.Name := 'Courier New';
            Printer.Canvas.Font.Size := 11;
            Printer.Canvas.TextOut(col, lin, '              Recebi nesta  data,  o  documento  protocolado,  registrado');
            lin := lin + pulo;
            Printer.Canvas.TextOut(col, lin, 'e microfilmado no Cartório de Registro  de  Títulos  e  Documentos  desta');
            lin := lin + pulo;
            Printer.Canvas.TextOut(col, lin, 'Comarca de São José dos Campos - SP, sob o número acima.');
            lin := lin + pulo;
            Printer.Canvas.TextOut(col, lin, 'DESTINATÁRIO : ' + tabela.td_pesso.fieldbyname('nome').asstring);
            lin := lin + pulo;
            Printer.Canvas.TextOut(col, lin, 'ENDEREÇO : ' + tabela.td_pesso.fieldbyname('endereco').asstring);
            lin := lin + (pulo * 4);
            Printer.Canvas.TextOut(col + 300, lin, '           Data, _______/_______/________.');
            lin := lin + (pulo * 2);
            Printer.Canvas.TextOut(col + 300, lin, '           _______________________________');
            lin := lin + (pulo * 5);
            printer.canvas.font.Name := old_font;
            Printer.Canvas.Font.Size := 14;
            Printer.Canvas.Font.Style := [fsBold];
            Printer.Canvas.TextOut(col + 750, lin, 'C E R T I D Ã O');
            printer.canvas.font.Name := 'Courier New';
            Printer.Canvas.Font.Size := 11;
            Printer.Canvas.Font.Style := [];
            lin := lin + pulo + 20;
            Printer.Canvas.Rectangle(col, lin, col + 2080 , lin + 1);
            lin := lin + pulo + 30;
            Printer.Canvas.TextOut(col, lin, '              CERTIFICO e dou  fé,  que  o  documento  registrado  sob  o');
            lin := lin + pulo + 30;
            Printer.Canvas.TextOut(col, lin, 'número acima foi entregue por este Cartório, ao destinatário:');
            lin := lin + pulo + 30;
            Printer.Canvas.TextOut(col, lin, tabela.td_pesso.fieldbyname('nome').asstring);
            lin := lin + pulo + 30;
            Printer.Canvas.TextOut(col, lin, 'na forma do art. 160 da lei dos  Registros Públicos (Lei nº 6015/73), aos');
            lin := lin + pulo + 30;
            Printer.Canvas.TextOut(col, lin, '________/_________/_____________.');
            lin := lin + pulo + 30;
            Printer.Canvas.TextOut(col, lin, '              CERTIFICO mais e finalmente  que  a  ocorrência  supra  faz');
            lin := lin + pulo + 30;
            Printer.Canvas.TextOut(col, lin, 'parte  das  anotações  do   registro   supra   mencionado,   tendo   sido');
            lin := lin + pulo + 30;
            Printer.Canvas.TextOut(col, lin, 'regularmente microfilmada.');
            lin := lin + (pulo * 2);
            Printer.Canvas.TextOut(col, lin, '       São José dos Campos, _______ de _______________ de ________');
            lin := lin + (pulo * 4);
            Printer.Canvas.TextOut(col, lin, '            _________________________________________________');
            lin := lin + pulo;
            Printer.Canvas.TextOut(col, lin, '                                 AMILTON ALVARES');
            lin := lin + pulo;
            Printer.Canvas.TextOut(col, lin, '                                 Oficial Delagado');
            lin := lin + pulo;
            Printer.Canvas.Font.Name := old_font;
            Printer.EndDoc;
            lin := 100;
          end;
          tabela.td_pesso.next;
        end;
      end;
    end;
    // Proximo
    tabela.td.next;
    if maskedit3.text <> '' then
    begin
      if (tabela.td.fieldbyname('data_p').asstring = F_RAV1.Maskedit1.text) and (tabela.td.fieldbyname('protocolo').asstring = F_RAV1.Maskedit3.text) then
      begin
        ok := true;
      end
      else ok := false;
    end
    else
    begin
      if tabela.td.fieldbyname('data_p').asstring = F_RAV1.Maskedit1.text then
      begin
        ok := true;
      end
      else ok := false;
    end;
  end;
  Funcoes.Fecha_TDClick(Funcoes);
  Funcoes.Fecha_PessoClick(Funcoes);
  statusbar1.simpletext := 'Fim do Relatório';
  statusbar1.update;
  Screen.cursor := crdefault;
  bitbtn3.setfocus;
end;

end.
