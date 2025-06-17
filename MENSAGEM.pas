unit Mensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, Printers, DBCtrls;

type
  Tf_mensagem = class(TForm)
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
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure FormActive(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit1onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2onKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_mensagem: Tf_mensagem;

implementation

uses Func, Tabelas, PesqMen;

{$R *.DFM}

procedure Tf_mensagem.FormActive(Sender: TObject);
begin
   Funcoes.Abre_mensagemClick(Funcoes);
   BitBtn1.SetFocus;
end;

procedure Tf_mensagem.BitBtn8Click(Sender: TObject);
begin
 Funcoes.Fecha_mensagemClick(Funcoes);
  close;
end;

procedure Tf_mensagem.BitBtn5Click(Sender: TObject);
begin
  Tabela.mensagem.next;
end;

procedure Tf_mensagem.BitBtn6Click(Sender: TObject);
begin
  Tabela.mensagem.Prior;
end;

procedure Tf_mensagem.BitBtn7Click(Sender: TObject);
var
   coluna, linha, pulo, pag : integer;
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
     Printer.Canvas.TextOut(coluna + 300, linha, 'Relação de Mensagens');
     Printer.Canvas.Font.Style := [];
     linha := linha + (pulo * 2);
     Printer.Canvas.TextOut(coluna, linha, 'Codigo                            Mensagem');
     linha := linha + (pulo * 2);
     Printer.Canvas.Font.Size := 10;
     Tabela.mensagem.GoTop;
     while (Tabela.mensagem.eof = false) do
      begin
       Printer.Canvas.TextOut(coluna + 20, linha, Tabela.mensagem.fieldbyname('codigo').AsString);
       Printer.Canvas.TextOut(coluna + 500, linha, Tabela.mensagem.fieldbyname('mensagem').AsString);
       linha := linha + (pulo * 2);
       Tabela.mensagem.Next;
      end;
    Printer.EndDoc;
    Screen.Cursor := crDefault;
   end;
end;

procedure Tf_mensagem.BitBtn1Click(Sender: TObject);
var
cont : integer;
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
      DBEdit1.Text := '';
      DBEdit2.Text := '';
      Tabela.mensagem.Append;
      DBEdit1.SetFocus;
    end
   else
    if BitBtn1.Caption = '&Salvar' then
     begin
       if MessageDlg('Confirma Inclusão de Dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Tabela.mensagem.Post;
        end
       else
        begin
          ShowMessage('Os dados não foram incluídos');
          Tabela.mensagem.Cancel;
        end;
      BitBtn1.Caption   := '&Incluir';
      BitBtn2.Enabled   := true;
      BitBtn3.Enabled   := true;
      BitBtn4.Enabled   := true;
      BitBtn5.Enabled   := true;
      BitBtn6.Enabled   := true;
      BitBtn7.Enabled   := true;
      BitBtn8.Enabled   := true;
      DBEdit1.Enabled := true;
      BitBtn1.SetFocus;
     end;
end;

procedure Tf_mensagem.BitBtn2Click(Sender: TObject);
begin
 Tabela.mensagem.OrderRecNo;
 if MessageDlg('Deseja excluir os dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Tabela.mensagem.Delete;
      Tabela.mensagem.Prior;
   end
  else
   begin
    ShowMessage('Os dados não foram excluídos');
    BitBtn1.SetFocus;
   end;
end;

procedure Tf_mensagem.BitBtn3Click(Sender: TObject);
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
     DBEdit1.Enabled := true;
     DBEdit1.SetFocus;
   end
  else
   if BitBtn3.Caption = '&Salvar' then
    begin
     if MessageDlg('Confirma Correção dos Dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       Tabela.mensagem.Edit;
       Tabela.mensagem.Post;
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

procedure Tf_mensagem.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(Tf_pesqmen, f_pesqmen);
  f_pesqmen.showmodal;
  F_PesqMen.destroy;
end;

procedure Tf_mensagem.DBEdit1onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEdit2.SetFocus;
end;

procedure Tf_mensagem.DBEdit2onKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    begin
      if (BitBtn1.Enabled = true) and (BitBtn1.Caption = '&Salvar') then BitBtn1.SetFocus;
      if (BitBtn3.Enabled = true) and (BitBtn3.Caption = '&Salvar') then BitBtn3.SetFocus;
    end;
end;

procedure Tf_mensagem.FormOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If (Shift = [SSALT]) or (key = Vk_F4) then key:= Vk_Clear; 
end;

end.
