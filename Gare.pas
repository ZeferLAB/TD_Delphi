unit Gare;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, NcsAlignment, ComCtrls, DBCtrls, Printers,
  ToolEdit, CurrEdit, RDprint;

type
  TF_Gare = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    Label6: TLabel;
    MaskEdit6: TMaskEdit;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    RDprint1: TRDprint;
    Panel1: TPanel;
    Label7: TLabel;
    MaskEdit7: TMaskEdit;
    Label8: TLabel;
    MaskEdit8: TMaskEdit;
    Label9: TLabel;
    MaskEdit9: TMaskEdit;
    RichEdit1: TRichEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Gare: TF_Gare;
  lin, coluna, pulo : Integer;
  data1, data2 : String;

implementation

uses Menu, DMTD, FuncGeral;

{$R *.DFM}

procedure TF_Gare.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TF_Gare.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Gare.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_Gare.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_Gare.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_Gare.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_Gare.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_Gare.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit9.SetFocus;
end;

procedure TF_Gare.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit9.SetFocus;
end;

procedure TF_Gare.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn2.SetFocus;
end;

procedure TF_Gare.FormActivate(Sender: TObject);
begin
  MaskEdit7.SetFocus;
end;

procedure TF_Gare.BitBtn2Click(Sender: TObject);
var
  vez, x : Integer;
  porta  : String;
begin
  if messageDlg('Impressora Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT ');
    Dm.ArqAux.Sql.Add('protocoloi,');
    Dm.ArqAux.Sql.Add('protocolof,');
    Dm.ArqAux.Sql.Add('guia,');
    Dm.ArqAux.Sql.Add('oficial,');
    Dm.ArqAux.Sql.Add('estado,');
    Dm.ArqAux.Sql.Add('ipesp,');
    Dm.ArqAux.Sql.Add('sinoreg,');
    Dm.ArqAux.Sql.Add('tribunal,');
    Dm.ArqAux.Sql.Add('total');
    Dm.ArqAux.Sql.Add('FROM resmen');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('data     = ' + Chr(39) + ConvData(MaskEdit7.Text) + Chr(39));
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount <> 0) then
    begin
      for x := 1 to 2 do
      begin
        RichEdit1.Lines.Clear;
        RichEdit1.Lines.Add('ATOS PRATICADOS NO SETOR DE REGISTRO DE TÍTULOS E DOCUMENTOS EM ' + MaskEdit7.Text + ' REGISTROS Ns. ' +  '.');
        // imprimir Gare
        lin  := 2;
        RdPrint1.Abrir;
        RdPrint1.Imp(lin, 60, '');
        lin := lin + 1;
        RdPrint1.Imp(lin, 67, Copy(MaskEdit9.Text, 1,2) + '  ' + Copy(MaskEdit9.Text, 4,2) + '  ' + Copy(MaskEdit9.Text, 7,4));
        lin := lin + 2;
        RdPrint1.ImpF(lin, 3, MaskEdit1.Text, [comp12]);
        if (x = 1) then
        begin
          RdPrint1.ImpF(lin, 60, '244-6', [comp12]);
        end
        else RdPrint1.ImpF(lin, 60, '318-9', [comp12]);
        lin := lin + 1;
        RdPrint1.ImpF(lin, 5, MaskEdit2.Text, [comp12]);
        RdPrint1.ImpF(lin, 60, 'ISENTO', [comp12]);
        lin := lin + 1;
        RdPrint1.ImpF(lin, 8,  MaskEdit3.Text, [comp12]);
        RdPrint1.ImpF(lin, 32, 'SP', [comp12]);
        RdPrint1.ImpF(lin, 42, Copy(MaskEdit5.Text, 1, 16), [comp12]);
        RdPrint1.ImpF(lin, 62, MaskEdit6.Text, [comp12]);
        lin := lin + 2;
        if (x = 1) then
        begin
          RdPrint1.ImpF(lin, 5, 'CUSTAS PERTENCENTES AO ESTADO', [comp12]);
          lin := lin + 1;
          RdPrint1.ImpF(lin, 5, '(Atos Extrajudiciais)', [comp12]);
        end
        else
        begin
          RdPrint1.ImpF(lin, 5, 'CARTEIRA DE PREV. DAS SERVENTIAS', [comp12]);
          lin := lin + 1;
          RdPrint1.ImpF(lin, 5, 'NÃO OFICIALIZADAS (Lei 10.393/70).', [comp12]);
        end;
        lin := lin + 4;
        if (x = 1) then
        begin
          RdPrint1.ImpF(lin, 60, '         R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByName('estado').asCurrency, 14, True)), [comp12]);
        end
        else RdPrint1.ImpF(lin, 60, '         R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByName('ipesp').asCurrency, 14, True)), [comp12]);
        RdPrint1.ImpF(lin, 5, 'ATOS PRATICADOS NO SETOR DE REGISTRO DE TÍTULOS E', [normal]);
        lin := lin + 1;
        RdPrint1.ImpF(lin, 5, 'DOCUMENTOS EM', [normal]);
        RdPrint1.ImpF(lin, 19, MaskEdit7.Text, [normal, negrito]);
        RdPrint1.ImpF(lin, 30, 'REGISTROS Ns.', [normal]);
        RdPrint1.ImpF(lin, 44, StrZero(Dm.ArqAux.FieldByName('protocoloi').asString, 6), [normal, negrito]);
        lin := lin + 1;
        RdPrint1.ImpF(lin, 5, 'A ' + StrZero(Dm.ArqAux.FieldByName('protocolof').asString, 6), [normal, negrito]);
        RdPrint1.ImpF(lin, 14, 'GUIA Nº ' + Dm.ArqAux.FieldByName('guia').asString + '.', [normal]);
        lin := lin + 5;
        if (x = 1) then
        begin
          RdPrint1.ImpF(lin, 60, '         R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByName('estado').asCurrency, 14, True)), [comp12]);
        end
        else RdPrint1.ImpF(lin, 60, '         R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByName('ipesp').asCurrency, 14, True)), [comp12]);
        RdPrint1.Fechar;
      end;  
    end;
  end;
  Bitbtn1.SetFocus;
end;

procedure TF_Gare.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Richedit1.SetFocus;
end;

procedure TF_Gare.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Maskedit8.SetFocus;
end;

end.

