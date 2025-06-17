unit RNE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers;

type
  TF_RNE = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit3: TMaskEdit;
    MaskEdit2: TMaskEdit;
    GroupBox1: TGroupBox;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RNE: TF_RNE;
  col1, col, lin, pulo : Integer;
  dia, mes, ano, prot : String;
  old_font : String;

implementation

uses Func, Tabelas;

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

Procedure Cabec;
Begin
  with F_RNE do
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
//    Printer.Canvas.TextOut(col + 800, lin, 'RECIBO DE NOTIFICAÇÃO');
    lin := lin + (pulo * 2);
    Printer.Canvas.Font.Size := 10;
  end;
end;

procedure TF_RNE.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RNE.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit2.text := '1';  
  maskedit3.text := '';
  maskedit1.setfocus;
end;

procedure TF_RNE.BitBtn1Click(Sender: TObject);
var
  ok : boolean;
  x, qq : Integer;
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
    F_RNE.maskedit1.setfocus;
    ok := False;
    exit;
  end;
  ok := true;
  if messagedlg('Impressora Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    Funcoes.Fecha_TDClick(Funcoes);
    exit;
  end;
  if (maskedit2.text = '') or (maskedit2.text = '0') then maskedit2.text := '1';
  qq := strtoint(maskedit2.text);
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
            for x := 1 to qq do
            begin
              Printer.BeginDoc;
              old_font := printer.canvas.font.Name;
              cabec;
              printer.canvas.font.Name := 'Courier New';
              Printer.Canvas.Font.Size := 11;
              Printer.Canvas.Font.Style := [fsBold];
              Printer.Canvas.TextOut(col, lin, 'Sr.(a) ' + tabela.Td_Pesso.fieldbyname('nome').asstring + '      - Protocolo nº ' + tabela.Td.fieldbyname('protocolo').asstring);
              lin := lin + (pulo * 2);
              Printer.Canvas.TextOut(col, lin, 'Endereço : ' + tabela.Td_Pesso.fieldbyname('endereco').asstring );
              Printer.Canvas.Font.Style := [];
              printer.canvas.font.Name := old_font;
              Printer.Canvas.Font.Size := 14;
              Printer.Canvas.Font.Style := [fsBold];
              lin := lin + (pulo * 4);
              Printer.Canvas.TextOut(col + 750, lin, 'C E R T I D Ã O');
              printer.canvas.font.Name := 'Courier New';
              Printer.Canvas.Font.Size := 11;
              Printer.Canvas.Font.Style := [];
              lin := lin + pulo + 20;
              Printer.Canvas.Rectangle(col, lin, col + 2080 , lin + 1);
              lin := lin + pulo + 30;
              Printer.Canvas.TextOut(col, lin, 'CERTIFICO E DOU FÉ, haver deixado  de  entregar  a  carta  de  notificação');
              lin := lin + pulo + 30;
              Printer.Canvas.TextOut(col, lin, 'registrada em microfilme sob número acima, pelo motivo abaixo.');
              lin := lin + pulo + 30;
              Printer.Canvas.TextOut(col, lin, 'MOTIVO : ' + maskedit4.text);
              lin := lin + pulo + 30;
              Printer.Canvas.TextOut(col, lin, '         ' + maskedit5.text);
              lin := lin + pulo + 30;
              Printer.Canvas.TextOut(col, lin, '         ' + maskedit6.text);
              lin := lin + pulo + 30;
              Printer.Canvas.TextOut(col, lin, '         ' + maskedit7.text);
              lin := lin + pulo + 30;
              Printer.Canvas.TextOut(col, lin, '         ' + maskedit8.text);
              lin := lin + pulo + 30;
              Printer.Canvas.TextOut(col, lin, '         ' + maskedit9.text);
              lin := lin + pulo + 30;
              Printer.Canvas.TextOut(col, lin, '         ' + maskedit10.text);
              lin := lin + (pulo * 3);
              Printer.Canvas.TextOut(col, lin, '       São José dos Campos, _______ de _______________ de ________');
              lin := lin + (pulo * 4);
              Printer.Canvas.TextOut(col, lin, '            _________________________________________________');
              lin := lin + pulo;
              Printer.Canvas.TextOut(col, lin, '                                Oficial');
              Printer.Canvas.Font.Name := old_font;
              Printer.Canvas.Font.Size := 11;
              Printer.EndDoc;
              lin := 100;
            end;
          end;
          tabela.td_pesso.next;
        end;
      end;
    end;
    // Proximo
    tabela.td.next;
    if maskedit3.text <> '' then
    begin
      if (tabela.td.fieldbyname('data_p').asstring = F_RNE.Maskedit1.text) and (tabela.td.fieldbyname('protocolo').asstring = F_RNE.Maskedit3.text) then
      begin
        ok := true;
      end
      else ok := false;
    end
    else
    begin
      if tabela.td.fieldbyname('data_p').asstring = F_RNE.Maskedit1.text then
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

procedure TF_RNE.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RNE.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_RNE.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then bitbtn1.setfocus;
end;

end.
