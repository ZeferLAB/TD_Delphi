unit ReemC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Printers, RDprint;

type
  TF_ReemC = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel1: TBevel;
    Maskedit1: TMaskEdit;
    RDprint1: TRDprint;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Maskedit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ReemC: TF_ReemC;

implementation

uses Tabelas, Func, Menu;

{$R *.DFM}

/// Impressao Laser

Procedure Imprimir;
var
  x, vias, col, lin, pulo : Integer;
begin
  while true do
  Begin
    if messagedlg('Impressora Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then exit;
    col := 50;
    lin := 100;
    pulo := 60;
    vias := 2;
    Printer.begindoc;
    for x := 1 to vias do
    Begin
      Printer.Canvas.Font.Size := 16;
      Printer.Canvas.TextOut(col + 250, lin, 'OFICIAL DE REGISTRO DE TÍTULOS E DOCUMENTOS DE DIADEMA - SP');
//      lin := lin + pulo + 30;
//      Printer.Canvas.TextOut(col + 700, lin, 'SÃO JOSÉ DOS CAMPOS - SP');
      lin := lin + pulo + 20;
      Printer.Canvas.Rectangle(col, lin, col + 2700 , lin + 1);
      Printer.Canvas.Font.Size := 10;
      lin := lin + pulo - 20;
      Printer.Canvas.TextOut(col + 400, lin, 'RUA GRACIOSA, 406 - CENTRO - TELEFONE (11) - 4056-1987 / 4057-2813');
      lin := lin + pulo;
      Printer.Canvas.Font.Size := 12;
      Printer.Canvas.TextOut(col + 900, lin, 'PATRICIA ANDRÉ DE CAMARGO FERRAZ');
      lin := lin + pulo;
      Printer.Canvas.TextOut(col + 890,lin, 'OFICIAL');
      lin := lin + (pulo * 2);
      Printer.Canvas.TextOut(col + 800, lin, 'RECIBO - PROTOCOLO Nº ' + F_ReemC.Maskedit1.text);
      lin := lin + (pulo * 2);
      Printer.Canvas.Font.Size := 10;
      Printer.Canvas.TextOut(col, lin, 'Recebemos como deposito prévio o valor abaixo para certidão de : ' + tabela.certidao.fieldbyname('natureza').asstring);
      lin := lin + (pulo * 2);
      pulo := 50;
      Printer.Canvas.TextOut(col, lin, 'Interessado : ' + tabela.certidao.fieldbyname('propriet').asstring);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, 'Apresentante : ' + tabela.certidao.fieldbyname('apresentan').asstring);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, 'Telefone : ' + tabela.certidao.fieldbyname('telefone').asstring);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, 'Depósito Prévio : ' + formatcurr('###,###,##0.00', tabela.certidao.fieldbyname('deposito').ascurrency));
      lin := lin + (pulo * 2);
      Printer.Canvas.TextOut(col, lin, 'Data Prevista para Devolução : ' + tabela.certidao.fieldbyname('data_entr').asstring);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, 'Obs.: ');
      Printer.Canvas.TextOut(col + 200, lin, tabela.certidao.fieldbyname('imovel1').asstring);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col + 200, lin, tabela.certidao.fieldbyname('imovel2').asstring);
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col + 200, lin, tabela.certidao.fieldbyname('imovel3').asstring);
      lin := lin + (pulo * 2);
      Printer.Canvas.TextOut(col, lin, 'Diadema, ' + formatdatetime('dd "de" mmmm "de" yyyy', strtodate(tabela.certidao.fieldbyname('movimento').asstring)));
      lin := lin + (pulo * 2);
      Printer.Canvas.TextOut(col, lin, '_________________________________');
      lin := lin + (pulo * 1);
      Printer.Canvas.TextOut(col, lin, tabela.certidao.fieldbyname('identifica').asstring);
      lin := lin + (pulo * 1);
      Printer.Canvas.Rectangle(col, lin, col + 2700 , lin + 1);
      lin := lin + (pulo * 1) - 20;
      Printer.Canvas.Font.Size := 10;
      Printer.Canvas.TextOut(col, lin, '      Informações e retiradas de documentos só com a apresentação deste protocolo no horário das 10:00 às 17:00 horas.');
      lin := lin + (pulo * 2);
      Printer.Canvas.Font.Size := 6;
      Printer.Canvas.TextOut(col, lin, 'Siscart Informática Ltda');
      pulo := 60;
      lin := lin + (pulo * 3);
    end;
    Printer.Enddoc;
  end;
end;

//// Impressora maticial

Procedure Imprimir_Matrix;
var

  x, vias, contlin : Integer;
  DEP : currency;
begin
  while true do
  Begin
    if messagedlg('Impressora Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then exit;
    vias := 2;
    contlin := 2;
    F_Reemc.Rdprint1.Abrir;
    for x := 1 to vias do
    Begin
      F_Reemc.rdprint1.impf(contlin + 02,03, '  OFICIAL DE REGISTRO DE TITULOS E DOCUMENTOS DE DIADEMA - SP',[COMP12,NORMAL]);
//      F_Reemc.rdprint1.impf(contlin + 03,03, 'RUA TURMALINAS, 77 - JD. DONINI - TEL. (11) 4056-1987/4057-2813       ',[COMP12,NORMAL]);
      F_Reemc.rdprint1.impf(contlin + 03,03, 'RUA GRACIOSA, 406 -   CENTRO      TEL. (11) 4056-1987/4057-2813       ',[COMP12,NORMAL]);
      F_Reemc.rdprint1.impf(contlin + 04,03, '                PATRICIA ANDRÉ DE CAMARGO FERRAZ',[COMP12,NORMAL]);
      F_Reemc.rdprint1.impf(contlin + 05,03, '                              OFICIAL ',[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 07,03, 'RECIBO - PROTOCOLO Nº ' + F_ReemC.Maskedit1.text,[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 09,03, 'Recebemos como deposito prévio o valor abaixo para certidao de : ' + tabela.certidao.fieldbyname('natureza').asstring,[COMP12,NORMAL]);
//    F_Reemc.Rdprint1.impf(contlin + 10,03, tabela.certidao.fieldbyname('natureza').asstring,[COMP12,NEGRITO]);
      F_Reemc.Rdprint1.impf(contlin + 11,03, 'Interessado : ' + tabela.certidao.fieldbyname('propriet').asstring,[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 12,03, 'Apresentante : ' + tabela.certidao.fieldbyname('apresentan').asstring,[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 13,03, 'Telefone : ' + tabela.certidao.fieldbyname('telefone').asstring,[COMP12,NORMAL]);
//      dep := tabela.certidao.fieldbyname('deposito').ascurrency;
      F_Reemc.RDprint1.ImpVal(contlin + 14,03, 'Depósito Prévio : ' + '##,###,##0.00',tabela.certidao.fieldbyname('deposito').ascurrency,[Normal]);
//      F_Reemc.Rdprint1.impf(contlin + 14,03, 'Depósito Prévio : ' + currtostr(dep),[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 15,03, 'Data Prevista para Devoluçao : ' + tabela.certidao.fieldbyname('data_entr').asstring,[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 16,03, 'Obs.: ',[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 17,03, tabela.certidao.fieldbyname('imovel1').asstring,[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 18,03, tabela.certidao.fieldbyname('imovel2').asstring,[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 19,03, tabela.certidao.fieldbyname('imovel3').asstring,[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 21,42, 'Diadema, ' + tabela.certidao.fieldbyname('movimento').asstring,[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 23,45, '_____________________________',[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 24,50, F_Menu.Label1.caption,[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 27,03, 'Informacoes e retiradas de documentos só com a apresentaçao deste protocolo no',[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 28,03, 'horário das 10:00 às 16:30 horas.',[COMP12,NORMAL]);
      F_Reemc.Rdprint1.impf(contlin + 29,03, 'Siscart Informática Ltda',[COMP12,NORMAL]);
      contlin := contlin + 30;
    end;
    F_Reemc.Rdprint1.Fechar;
  end;
end;

procedure TF_ReemC.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_ReemC.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit1.setfocus;
end;

procedure TF_ReemC.BitBtn1Click(Sender: TObject);
var
  prot : String;
begin
  if maskedit1.text = '' then maskedit1.setfocus;
  prot := '      ' + maskedit1.text;
  prot := copy(prot, length(prot) - 5, 6);
  Funcoes.Abre_CertidaoClick(Funcoes);
  if not tabela.certidao.seek(prot) then
  Begin
    showmessage('Protocolo não Localizado');
    Funcoes.Fecha_CertidaoClick(Funcoes);
    maskedit1.setfocus;
    exit;
  end;
  Screen.cursor := crhourglass;
//  if messagedlg('Impressora Laser?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then
//  begin
  imprimir_matrix;
//  end
 // else
//  begin
//    imprimir
//  end;
  Funcoes.Fecha_CertidaoClick(Funcoes);
  Screen.cursor := crdefault;
  bitbtn3.setfocus;
end;

procedure TF_ReemC.Maskedit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
  if key = 27 then close;
end;

end.
