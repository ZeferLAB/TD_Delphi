unit escrit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Db, Apodset, Grids, DBGrids, Printers,
  DBCtrls;

type
  Tf_escrit = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure BitBtn8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBedit1onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBedit2onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_escrit: Tf_escrit;

implementation

uses Tabelas, Func, PesqNat;

{$R *.DFM}

procedure Tf_escrit.BitBtn8Click(Sender: TObject);
begin
  Funcoes.Fecha_Td_NatClick(Funcoes);
  close;
end;

procedure Tf_escrit.FormActivate(Sender: TObject);
begin
   Funcoes.Abre_Td_NatClick(Funcoes);
   Tabela.Td_Nat.First;
   BitBtn1.SetFocus;
end;

procedure Tf_escrit.BitBtn1Click(Sender: TObject);
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
      Panel2.enabled := true;
      DBEdit1.Clear;
      DBEdit2.Clear;
      DBEdit1.SetFocus;
      Tabela.Td_Nat.Append;
    end
   else
    if BitBtn1.Caption = '&Salvar' then
     begin
       if MessageDlg('Confirma Inclusão de Dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Tabela.Td_Nat.Post;
        end
       else
        begin
          ShowMessage('Os dados não foram incluídos');
          Tabela.Td_Nat.Cancel;
        end;
      Panel2.enabled := false;
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

procedure Tf_escrit.BitBtn2Click(Sender: TObject);
begin
  Tabela.Td_Nat.OrderRecNo;
  if MessageDlg('Deseja excluir os dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
    Tabela.Td_Nat.OrderRecNo;
    Tabela.Td_Nat.Delete;
    Tabela.Td_Nat.Prior;
   end
  else
   begin
    ShowMessage('Os dados não foram excluídos');
    BitBtn1.SetFocus;
   end;
end;

procedure Tf_escrit.BitBtn3Click(Sender: TObject);
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
     Panel2.enabled := true;
     DBEdit1.SetFocus;
   end
  else
   if BitBtn3.Caption = '&Salvar' then
    begin
     if MessageDlg('Confirma Correção dos Dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       Tabela.Td_Nat.Edit;
       Tabela.Td_Nat.Post;
      end
     else ShowMessage('Dados não alterados');
     Panel2.enabled := false;     
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

procedure Tf_escrit.BitBtn5Click(Sender: TObject);
begin
  Tabela.Td_Nat.Next;
end;

procedure Tf_escrit.BitBtn6Click(Sender: TObject);
begin
  Tabela.Td_Nat.Prior;
end;

procedure Tf_escrit.BitBtn4Click(Sender: TObject);
begin
  f_pesqNat.ShowModal;
end;

procedure Tf_escrit.BitBtn7Click(Sender: TObject);
var
coluna : integer;
linha  : integer;
pulo   : integer;
pag    : integer;
lin    : integer;
begin
  if MessageDlg('Impressora ok ? ', mtConfirmation, [mbYes, mbNO], 0) = mrYes then
   begin
   Printer.BeginDoc;
    while not Tabela.Td_Nat.Eof do
     begin
      coluna := 200;
      linha  := 200;
      pulo   := 50;
      pag    := 1;
      lin    := 0;
       Screen.Cursor := crHourglass;
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
       Printer.Canvas.TextOut(coluna + 600, linha, 'Relação das Naturezas');
       linha := linha + (pulo * 2);
       //Printer.Canvas.Rectangle(coluna - 20, linha - 20, coluna + 1720, linha + 70);
       Printer.Canvas.TextOut(coluna, linha, 'Cod                                 Natureza');
       linha := linha + (pulo * 2);
       Printer.Canvas.Font.Size := 10;
       Tabela.Td_Nat.GoTop;
       while (Tabela.Td_Nat.eof = false) and (linha < 3300) do
        begin
         Printer.Canvas.TextOut(coluna + 20, linha, Tabela.Td_Nat.fieldbyname('cod').AsString);
         Printer.Canvas.TextOut(coluna + 500, linha, Tabela.Td_Nat.fieldbyname('natureza').AsString);
         linha := linha + (pulo * 2);
         Tabela.Td_Nat.Next;
        end;
       if linha > 3300 then Printer.NewPage;
     end;
    Printer.EndDoc;
    Screen.Cursor := crDefault;
   end;
end;

procedure Tf_escrit.DBedit1onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key =13 then DBEdit2.SetFocus;
end;

procedure Tf_escrit.DBedit2onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
   begin
    if (BitBtn1.Enabled = true) and (BitBtn1.Caption = '&Salvar') then BitBtn1.SetFocus;
    if (BitBtn3.Enabled = true) and (BitBtn3.Caption = '&Salvar') then BitBtn3.SetFocus;
    end;
end;

procedure Tf_escrit.FormOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If (Shift = [SSALT]) or (key = Vk_F4) then key:= Vk_Clear;

end;

end.
