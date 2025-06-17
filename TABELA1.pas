unit Tabela1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, Db, Apodset, Printers,
  Menus;

type
  TF_Tab1 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    Impresso1: TMenuItem;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Impresso1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Tab1: TF_Tab1;
  qtde_item : Integer;
  filtro : String;

implementation

uses TAB_AUX1, DMTD, Tabelas, Func;

{$R *.DFM}

Procedure Carrega_Tab1;
var
  dada : String;
Begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT data FROM cad_cus');
  Dm.ArqAux.Sql.Add('GROUP BY data');
  Dm.ArqAux.Sql.Add('ORDER BY data DESC');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    F_Tab1.ComboBox1.Text := Dm.ArqAux.FieldByName('data').AsString;
    dada                  := Dm.ArqAux.FieldByName('data').AsString;
    F_Tab1.ComboBox1.Items.Add(Dm.ArqAux.FieldByName('data').AsString);
  end;
  Dm.ArqAux.Close;
end;

Function Alinha( CadeiaCaracteres : String; Tamanho : Integer; DireitaEsquerda : String): String;
var
  espacos : String;
  x : Integer;
begin
  espacos := '';
  for x := 1 to tamanho do espacos := espacos + ' ';
  if direitaesquerda = 'D' then
  begin
    result := espacos + cadeiacaracteres;
    result := Copy(result, length(result) - (tamanho - 1), tamanho);
  end
  else result := copy(cadeiacaracteres + espacos,1,tamanho);
end;

{
Procedure Carrega_Tab1;
var
  dada : String;
Begin
  Tabela.cad_cus.Filtered := False;
  Tabela.cad_cus.SetOrder(1);
  Tabela.cad_cus.GoTop;
  F_Tab1.ComboBox1.Clear;
  dada := '';
  While not Tabela.cad_cus.eof do
  Begin
    if dada <> Tabela.cad_cus.FieldByName('data').AsString then
    begin
      F_Tab1.ComboBox1.Text := Tabela.cad_cus.FieldByName('data').AsString;
      F_Tab1.ComboBox1.Items.Add(Tabela.cad_cus.FieldByName('data').AsString);
      dada := Tabela.cad_cus.FieldByName('data').AsString;
    end;
    Tabela.cad_cus.Next;
  end;
end;
}

procedure TF_Tab1.BitBtn6Click(Sender: TObject);
begin
  Tabela.cad_cus.Filtered := False;
  Close;
end;

procedure TF_Tab1.BitBtn5Click(Sender: TObject);
var
  item_atual : Integer;
  fil1 : string;

begin
  item_atual := StrToInt(Label3.Caption) - 1;
  if item_atual < 0 then
  begin
    showmessage('Não há tabelas anteriores!!!');
    exit;
  end;
  Label3.Caption := IntToStr(item_atual);
  F_Tab1.ComboBox1.ItemIndex := item_atual;
  fil1 := copy(F_Tab1.ComboBox1.Text,1,2) + '/' + copy(F_Tab1.ComboBox1.Text,4,2) + '/' + Copy(F_Tab1.ComboBox1.Text,7,4);
  filtro := '"' + fil1 + '" = dtoc(data)';
  Tabela.cad_cus.Filtered := False;
  Tabela.cad_cus.Filter := filtro;
  Tabela.cad_cus.Filtered := True;
  Tabela.cad_cus.GoTop;
  Label2.Caption := Tabela.cad_cus.FieldByName('data').AsString;
end;

procedure TF_Tab1.FormActivate(Sender: TObject);
var
  fil1 :  string;

begin
  Carrega_Tab1;
  qtde_item := (F_Tab1.ComboBox1.Items.Count - 1);
  F_Tab1.ComboBox1.ItemIndex := qtde_item;
  Label3.Caption := IntToStr(qtde_item);
  fil1 := copy(F_Tab1.ComboBox1.Text,1,2) + '/' + copy(F_Tab1.ComboBox1.Text,4,2) + '/' + Copy(F_Tab1.ComboBox1.Text,7,4);
  filtro := '"' + fil1 + '" = dtoc(data)';
  Tabela.cad_cus.Filtered := False;
  Tabela.cad_cus.Filter := filtro;
  Tabela.cad_cus.Filtered := True;
  Tabela.cad_cus.GoTop;
  Label2.Caption := Tabela.cad_cus.FieldByName('data').AsString;
end;

procedure TF_Tab1.BitBtn4Click(Sender: TObject);
var
  item_atual : Integer;
  fil1 : string;
begin
  item_atual := StrToInt(Label3.Caption) + 1;
  if item_atual > qtde_item then
  begin
    showmessage('Não há mais tabelas !!!');
    exit;
  end;
  Label3.Caption := IntToStr(item_atual);
  F_Tab1.ComboBox1.ItemIndex := item_atual;
  fil1 := copy(F_Tab1.ComboBox1.Text,1,2) + '/' + copy(F_Tab1.ComboBox1.Text,4,2) + '/' + Copy(F_Tab1.ComboBox1.Text,7,4);
  filtro := '"' + fil1 + '" = dtoc(data)';
  Tabela.cad_cus.Filtered := False;
  Tabela.cad_cus.Filter := filtro;
  Tabela.cad_cus.Filtered := True;
  Tabela.cad_cus.GoTop;
  Label2.Caption := Tabela.cad_cus.FieldByName('data').AsString;
end;


procedure TF_Tab1.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TF_TabAux1, F_TabAux1);
  F_TabAux1.ShowModal;
  F_TabAux1.destroy;  
end;

procedure TF_Tab1.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TF_TabAux1, F_TabAux1);
  F_TabAux1.ShowModal;
  F_TabAux1.destroy;
end;

procedure TF_Tab1.BitBtn3Click(Sender: TObject);
var
  fil1 : string;

begin
  if messagedlg('Deseja Excluir todos os Registros da Tabela do dia ' + F_Tab1.Label2.Caption, mtconfirmation, [MbYes, MbNo], 0) = MrYes then
  begin
    while not Tabela.cad_cus.Eof do
    begin
      Tabela.cad_cus.Delete;
    end;
    Funcoes.Fecha_Cad_CusClick(Funcoes);
    Funcoes.Abre_Cad_CusClick(Funcoes);
    Carrega_Tab1;
    Tabela.cad_cus.GoBottom;
    F_Tab1.Label2.Caption := Tabela.cad_cus.FieldByName('data').AsString;
    qtde_item := (F_Tab1.ComboBox1.Items.Count - 1);
    F_Tab1.ComboBox1.ItemIndex := qtde_item;
    F_Tab1.Label3.Caption := IntToStr(qtde_item);
    fil1 := copy(F_Tab1.ComboBox1.Text,1,2) + '/' + copy(F_Tab1.ComboBox1.Text,4,2) + '/' + Copy(F_Tab1.ComboBox1.Text,7,4);
    filtro := '"' + fil1 + '" = dtoc(data)';
    Tabela.cad_cus.Filtered := False;
    Tabela.cad_cus.Filter := filtro;
    Tabela.cad_cus.Filtered := True;
    F_Tab1.Label2.Caption := Tabela.cad_cus.FieldByName('data').AsString;
  end;
end;

procedure TF_Tab1.Impresso1Click(Sender: TObject);
var
  col, lin, x : integer;
  cadeia, letra : String;

begin
  if messagedlg('Deseja Imprimir a Tabela ?', mtconfirmation, [MbYes, MbNo], 0) = MrYes then
  begin
    cadeia := 'ABCDEFGHIJKLMNOPQRSTUVXWYZ';
    x := 2;
    col := 800;
    lin := 0;
    Printer.Orientation := poLandscape;
    Printer.Canvas.Font.Size := 20;
    Printer.Canvas.Font.Style := [];
    Printer.Canvas.Font.Name := 'Verdana';
    Printer.BeginDoc;
    Printer.Canvas.TextOut(col + 900,lin,'Tabela de Custas do Protesto');
    Printer.Canvas.Rectangle(col +  100, lin +  200, col + 3000, lin +  201);
    Printer.Canvas.Rectangle(col +  100, lin +  200, col +  101, lin +  300);
    Printer.Canvas.Rectangle(col + 3000, lin +  200, col + 3001, lin +  300);
    Printer.Canvas.Rectangle(col +  100, lin +  300, col + 3000, lin +  301);
    Printer.Canvas.Font.Size := 10;
    Printer.Canvas.TextOut(col + 1600, lin + 220,'Ao Tabelião    Ao Estado      Ao Ipesp       Apamagis         Total');
    Printer.Canvas.TextOut(col +  200, lin + 220,'Data : ' + Tabela.cad_cus.FieldByName('data').AsString);
    lin := lin + 100;
    Printer.Canvas.Font.Size := 20;
    Printer.Canvas.Rectangle(col +  100, lin +  200, col +  101, lin +  270);
    Printer.Canvas.Rectangle(col + 3000, lin +  200, col + 3001, lin +  270);
    Printer.Canvas.Rectangle(col +  100, lin +  270, col + 3000, lin +  271);
    Printer.Canvas.Font.Size := 9;
    Tabela.cad_cus.GoTop;
    Printer.Canvas.TextOut(col +  150, lin +  220,'A) ATÉ');

    Printer.Canvas.TextOut(col + 1100, lin +  220, Alinha(FormatCurr('###,##0.00',Tabela.cad_cus.FieldByName('ate').AsCurrency), 10, 'D'));
    Printer.Canvas.TextOut(col + 1600, lin +  220, Alinha(FormatCurr('###,##0.00',Tabela.cad_cus.FieldByName('oficial').AsCurrency), 10, 'D'));
    Printer.Canvas.TextOut(col + 1900, lin +  220, Alinha(FormatCurr('###,##0.00',Tabela.cad_cus.FieldByName('estado').AsCurrency), 10, 'D'));
    Printer.Canvas.TextOut(col + 2200, lin +  220, Alinha(FormatCurr('###,##0.00',Tabela.cad_cus.FieldByName('ipesp').AsCurrency), 10, 'D'));
    Printer.Canvas.TextOut(col + 2500, lin +  220, Alinha(FormatCurr('###,##0.00',Tabela.cad_cus.FieldByName('total').AsCurrency), 10, 'D'));
    Tabela.cad_cus.Next;
    while not Tabela.cad_cus.Eof do
    begin
      letra := Copy(cadeia, x, 1);
      x := x + 1;
      lin := lin + 70;
      Printer.Canvas.Font.Size := 20;
      Printer.Canvas.Rectangle(col +  100, lin +  200, col +  101, lin +  270);
      Printer.Canvas.Rectangle(col + 3000, lin +  200, col + 3001, lin +  270);
      Printer.Canvas.Rectangle(col +  100, lin +  270, col + 3000, lin +  271);
      Printer.Canvas.Font.Size := 9;
      Printer.Canvas.TextOut(col +  150, lin +  220, letra + ') Acima de ');
      Printer.Canvas.TextOut(col +  500, lin +  220, Alinha(FormatCurr('###,##0.00',Tabela.cad_cus.FieldByName('de').AsCurrency), 10, 'D'));
      Printer.Canvas.TextOut(col +  850, lin +  220, 'até');
      Printer.Canvas.TextOut(col + 1100, lin +  220, Alinha(FormatCurr('###,##0.00',Tabela.cad_cus.FieldByName('ate').AsCurrency), 10, 'D'));
      Printer.Canvas.TextOut(col + 1600, lin +  220, Alinha(FormatCurr('###,##0.00',Tabela.cad_cus.FieldByName('oficial').AsCurrency), 10, 'D'));
      Printer.Canvas.TextOut(col + 1900, lin +  220, Alinha(FormatCurr('###,##0.00',Tabela.cad_cus.FieldByName('estado').AsCurrency), 10, 'D'));
      Printer.Canvas.TextOut(col + 2200, lin +  220, Alinha(FormatCurr('###,##0.00',Tabela.cad_cus.FieldByName('ipesp').AsCurrency), 10, 'D'));
      Printer.Canvas.TextOut(col + 2500, lin +  220, Alinha(FormatCurr('###,##0.00',Tabela.cad_cus.FieldByName('total').AsCurrency), 10, 'D'));
      Tabela.cad_cus.Next;
    end;

    Printer.EndDoc;
    Printer.Orientation := poPortrait;
  end;
end;

end.
