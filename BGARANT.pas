unit bgarant;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, Printers, DBCtrls;

type
  Tf_bgarantia = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActive(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit1onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit6onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit7onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit9onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit10onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormonKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_bgarantia: Tf_bgarantia;

implementation

uses Func, Tabelas, Pbens;

{$R *.DFM}

procedure Tf_bgarantia.BitBtn8Click(Sender: TObject);
begin
  Funcoes.Fecha_bgarantiaClick(Funcoes);
  close;
end;

procedure Tf_bgarantia.BitBtn5Click(Sender: TObject);
begin
  Tabela.bgarantia.Next;
end;

procedure Tf_bgarantia.BitBtn6Click(Sender: TObject);
begin
  Tabela.bgarantia.Prior;
end;

procedure Tf_bgarantia.BitBtn7Click(Sender: TObject);
var
coluna : integer;
linha  : integer;
pulo   : integer;
pag    : integer;
begin
  if MessageDlg('Impressora ok ? ', mtConfirmation, [mbYes, mbNO], 0) = mrYes then
   begin
    coluna := 200;
    linha  := 200;
    pulo   := 50;
    pag    := 1;
    Screen.Cursor := crHourglass;
    Printer.BeginDoc;
    if linha > 3600 then
      begin
        pag:= pag + 1;
        coluna := 200;
        linha := 200;
        pulo := 50;
        Printer.NewPage;
      end;
     Printer.Canvas.Font.Name  := 'Times New Roman';
     Printer.Canvas.Font.Style := [fsbold];
     Printer.Canvas.Font.Size  := 14;
     Printer.Canvas.TextOut(coluna + 200, linha, 'Oficial de Títulos e Documentos e Registro Civil de Pessoa Juridica');
     linha := linha + (pulo * 2);
     Printer.Canvas.Font.Size := 9;
     Printer.Canvas.Font.Style := [];
     Printer.Canvas.TextOut(coluna, linha, DateToStr(date));
     Printer.Canvas.TextOut(coluna + 1900, linha, 'Pag.: ' + IntToStr(pag));
     linha := linha + (pulo * 4);
     Printer.Canvas.Font.Size := 12;
     Printer.Canvas.Font.Style := [fsbold];
     Printer.Canvas.TextOut(coluna + 600, linha, 'Relação de Bens de Garantia');
     Printer.Canvas.Font.Style := [];
     linha := linha + (pulo * 2);
     Printer.Canvas.TextOut(coluna, linha, 'Data            Protocolo        Nome                   Obs');
     linha := linha + (pulo * 2);
     Printer.Canvas.Font.Size := 10;
     Tabela.bgarantia.GoTop;
     while (Tabela.bgarantia.eof = false) do
      begin
       Printer.Canvas.TextOut(coluna + 10, linha, Tabela.bgarantia.fieldbyname('data').AsString);
       Printer.Canvas.TextOut(coluna + 250, linha, Tabela.bgarantia.fieldbyname('protocolo').AsString);
       Printer.Canvas.TextOut(coluna + 550, linha, Tabela.bgarantia.fieldbyname('nome').AsString);
       Printer.Canvas.TextOut(coluna + 950, linha, Tabela.bgarantia.fieldbyname('observa1').AsString);
       Printer.Canvas.TextOut(coluna + 1100, linha, Tabela.bgarantia.fieldbyname('observa2').AsString);
       Printer.Canvas.TextOut(coluna + 1250, linha, Tabela.bgarantia.fieldbyname('observa3').AsString);
       Printer.Canvas.TextOut(coluna + 1400, linha, Tabela.bgarantia.fieldbyname('observa4').AsString);
       Printer.Canvas.TextOut(coluna + 1550, linha, Tabela.bgarantia.fieldbyname('observa5').AsString);
       linha := linha+ (pulo * 2);
       Printer.Canvas.TextOut(coluna + 950, linha, Tabela.bgarantia.fieldbyname('observa6').AsString);
       Printer.Canvas.TextOut(coluna + 1100, linha, Tabela.bgarantia.fieldbyname('observa7').AsString);
       Printer.Canvas.TextOut(coluna + 1250, linha, Tabela.bgarantia.fieldbyname('observa8').AsString);
       Printer.Canvas.TextOut(coluna + 1400, linha, Tabela.bgarantia.fieldbyname('observa9').AsString);
       linha := linha+ (pulo * 2);
       Printer.Canvas.TextOut(coluna + 950, linha, Tabela.bgarantia.fieldbyname('observa10').AsString);
       Printer.Canvas.TextOut(coluna + 1100, linha, Tabela.bgarantia.fieldbyname('observa11').AsString);
       Printer.Canvas.TextOut(coluna + 1250, linha, Tabela.bgarantia.fieldbyname('observa12').AsString);
       Printer.Canvas.TextOut(coluna + 1400, linha, Tabela.bgarantia.fieldbyname('observa13').AsString);
       linha := linha+ (pulo * 2);
       Printer.Canvas.TextOut(coluna + 950, linha, Tabela.bgarantia.fieldbyname('observa14').AsString);
       Printer.Canvas.TextOut(coluna + 1100, linha, Tabela.bgarantia.fieldbyname('observa15').AsString);
       Printer.Canvas.TextOut(coluna + 1250, linha, Tabela.bgarantia.fieldbyname('observa16').AsString);
       Printer.Canvas.TextOut(coluna + 1400, linha, Tabela.bgarantia.fieldbyname('observa17').AsString);
       linha := linha + (pulo * 3);
       Tabela.bgarantia.Next;
      end;
    Printer.EndDoc;
    Screen.Cursor := crDefault;
   end;

end;

procedure Tf_bgarantia.BitBtn1Click(Sender: TObject);
begin
   if BitBtn1.Caption = '&Incluir' then
    begin
      BitBtn1.Caption := '&Salvar';
      BitBtn2.Enabled := false;
      BitBtn3.Enabled := False;
      BitBtn4.Enabled := False;
      BitBtn5.Enabled := false;
      BitBtn6.Enabled := false;
      BitBtn7.Enabled := false;
      BitBtn8.Enabled := false;
      DBEdit1.Text  := '';
      DBEdit2.Text  := '';
      DBEdit3.Text  := '';
      DBEdit4.Text  := '';
      DBEdit5.Text  := '';
      DBEdit6.Text  := '';
      DBEdit7.Text  := '';
      DBEdit8.Text  := '';
      DBEdit9.Text  := '';
      DBEdit10.Text := '';
      DBEdit11.Text := '';
      DBEdit12.Text := '';
      DBEdit13.Text := '';
      DBEdit14.Text := '';
      DBEdit15.Text := '';
      DBEdit16.Text := '';
      DBEdit17.Text := '';
      DBEdit18.Text := '';
      DBEdit19.Text := '';
      DBEdit20.Text := '';
      Tabela.bgarantia.Append;
      DBEdit1.SetFocus;
    end
   else
    if BitBtn1.Caption = '&Salvar' then
     begin
       if MessageDlg('Confirma Inclusão de Dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Tabela.bgarantia.Post;
        end
       else
        begin
          ShowMessage('Os dados não foram incluídos');
          Tabela.bgarantia.Cancel;
        end;
      BitBtn1.Caption := '&Incluir';
      BitBtn2.Enabled := true;
      BitBtn3.Enabled := true;
      BitBtn4.Enabled := true;
      BitBtn5.Enabled := true;
      BitBtn6.Enabled := true;
      BitBtn7.Enabled := true;
      BitBtn8.Enabled := true;
      BitBtn1.SetFocus;
     end;
end;

procedure Tf_bgarantia.BitBtn2Click(Sender: TObject);
begin
  Tabela.bgarantia.OrderRecNo;
  if MessageDlg('Deseja excluir os dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Tabela.bgarantia.Delete;
      Tabela.bgarantia.Prior;
   end
  else
   begin
    ShowMessage('Os dados não foram excluídos');
    BitBtn1.SetFocus;
   end;
end;

procedure Tf_bgarantia.BitBtn3Click(Sender: TObject);
begin
 if BitBtn3.Caption = '&Correção' then
   begin
     BitBtn3.Caption := '&Salvar';
     BitBtn1.Enabled := false;
     BitBtn2.Enabled := false;
     BitBtn4.Enabled := False;
     BitBtn5.Enabled := false;
     BitBtn6.Enabled := false;
     BitBtn7.Enabled := false;
     BitBtn8.Enabled := false;
     DBEdit1.SetFocus;
     Tabela.bgarantia.Edit;
   end
  else
   if BitBtn3.Caption = '&Salvar' then
    begin
     if MessageDlg('Confirma Correção dos Dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       Tabela.bgarantia.Post;
      end
     else ShowMessage('Dados não alterados');
     BitBtn3.Caption := '&Correção';
     BitBtn1.Enabled := true;
     BitBtn2.Enabled := true;
     BitBtn4.Enabled := true;
     BitBtn5.Enabled := true;
     BitBtn6.Enabled := true;
     BitBtn7.Enabled := true;
     BitBtn8.Enabled := true;
     BitBtn3.SetFocus;
    end;
end;

procedure Tf_bgarantia.FormActive(Sender: TObject);
begin
   Funcoes.Abre_bgarantiaClick(Funcoes);
   BitBtn1.SetFocus;
end;

procedure Tf_bgarantia.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(Tf_bens, f_bens);
  f_bens.showmodal;
  F_Bens.destroy;
end;

procedure Tf_bgarantia.DBEdit1onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEdit2.SetFocus;
end;

procedure Tf_bgarantia.DBEdit2onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEdit3.SetFocus;
end;

procedure Tf_bgarantia.DBEdit3onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then DBEdit4.Setfocus;
end;

procedure Tf_bgarantia.DBEdit4onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEdit5.Setfocus;
end;

procedure Tf_bgarantia.DBEdit5onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13  then DBEdit6.Setfocus;
end;

procedure Tf_bgarantia.DBEdit6onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEdit7.Setfocus;
end;

procedure Tf_bgarantia.DBEdit7onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEdit8.SetFocus;
end;

procedure Tf_bgarantia.DBEdit8onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEdit9.SetFocus;
end;

procedure Tf_bgarantia.DBEdit9onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then DBEdit10.SetFocus;
end;

procedure Tf_bgarantia.DBEdit10onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then DBEdit11.SetFocus;
end;

procedure Tf_bgarantia.DBEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then DBEdit12.SetFocus;
end;

procedure Tf_bgarantia.DBEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then DBEdit13.SetFocus;
end;

procedure Tf_bgarantia.DBEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then DBEdit14.SetFocus;
end;

procedure Tf_bgarantia.DBEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if key = 13 then DBEdit15.SetFocus;
end;

procedure Tf_bgarantia.DBEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then DBEdit16.SetFocus;
end;

procedure Tf_bgarantia.DBEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then DBEdit17.SetFocus;
end;

procedure Tf_bgarantia.DBEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then DBEdit18.SetFocus;
end;

procedure Tf_bgarantia.DBEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then DBEdit19.SetFocus;
end;

procedure Tf_bgarantia.DBEdit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then DBEdit20.SetFocus;
end;

procedure Tf_bgarantia.FormonKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
If (Shift = [SSALT]) or (key = Vk_F4) then key:= Vk_Clear; 
end;

procedure Tf_bgarantia.DBEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then
    begin
     if (BitBtn1.Enabled = true) and (BitBtn1.Caption = '&Salvar') then BitBtn1.SetFocus;
     if (BitBtn3.Enabled = true) and (BitBtn3.Caption = '&Salvar') then BitBtn3.SetFocus;
    end;
end;

end.
