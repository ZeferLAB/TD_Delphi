unit IMP_FAT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers, Grids, DBGrids,
  WPDefs, WPPrint, WpWinCtr, WPRich, ValorPor, jpeg;

type
  TF_RecFat = class(TForm)
    Label1: TLabel;
    Bevel3: TBevel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel2: TBevel;
    Label6: TLabel;
    MaskEdit6: TMaskEdit;
    Label3: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    Extenso: TValorPorExtenso;
    Label8: TLabel;
    ValorPorExtenso1: TValorPorExtenso;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Panel1: TPanel;
    WPRichText1: TWPRichText;
    BitBtn4: TBitBtn;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6Exit(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Imprime(Sender : TOBject; Todos : Boolean);
    Procedure Imprime_ReciboWP(Sender : TOBject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RecFat: TF_RecFat;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

Procedure TF_RecFat.Imprime_ReciboWP(Sender : TOBject);
var
  recibo : String;
begin
  //impressão
  WpRichText1.Clear;
  WpRichText1.LoadFromFile(F_Menu.Label16.Caption + 'Recibo.rtf');
  WpRichText1.Refresh;
  recibo := '';
  recibo := InputBox('RECIBOS', 'Informe nº do recibo :', '');

  WpRichText1.Find('<cabecalho>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cabecalho>', F_Menu.Label9.Caption);
  end;

  WpRichText1.Find('<cnpj>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cnpj>', F_Menu.Label39.Caption);
  end;

  WpRichText1.Find('<endereco>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<endereco>', F_Menu.Label11.Caption);
  end;

  WpRichText1.Find('<tel>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<tel>', F_Menu.Label12.Caption);
  end;

  WpRichText1.Find('<cartorio>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cartorio>', F_Menu.Label9.Caption);
  end;


  //Alterando nº do Recibo
  WpRichText1.Find('<recibo>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<recibo>', Trim(recibo));
  end;
  //Alterando Valor
  WpRichText1.Find('<valor>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<valor>', 'R$ ' + Trim(StrCurr(Dm.ArqAux.FieldByName('valor').asCurrency, 14, True)));
  end;
  //Alterando agencia
  WpRichText1.Find('<agencia>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<agencia>', Dm.ArqAux.FieldByName('agencia').asString);
  end;
  //Alterando CNPJ da Agencia
  WpRichText1.Find('<doc_ag>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<doc_ag>', BuscaDocumentoCliente(IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3))), Trim(Dm.ArqAux.FieldByName('agencia').asString)));
  end;
  //Alterando valor por extenso
  Extenso.Valor := 0;
  Extenso.Valor := Dm.ArqAux.FieldByName('valor').asCurrency;
  WpRichText1.Find('<valor_extenso>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<valor_extenso>', Label8.Caption);
  end;
  //Alterando nome da assessoria
  WpRichText1.Find('<assessoria>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<assessoria>', Trim(Copy(ComboBox1.Text, 7,100)));
  end;
  //Alterando nome do apresentante
  WpRichText1.Find('<apresentante>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<apresentante>', Dm.ArqAux.FieldByName('a_nome').asString);
  end;
  //Alterando nome do apresentante
  WpRichText1.Find('<data>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<data>', DataExtenso(MaskEdit4.Text, True, ''));
  end;
  WpRichText1.Refresh;
//  WpRichText1.Print;
  BitBtn1.SetFocus;
end;

Procedure TF_RecFat.Imprime(Sender : TOBject; Todos : Boolean);
begin
  if (Todos) then
  begin
    Dm.ArqAux.FindFirst;
    while (not Dm.ArqAux.Eof) do
    begin
      Imprime_ReciboWP(F_RecFat);
      Dm.ArqAux.Next;
    end;
  end
  else Imprime_ReciboWP(F_RecFat);
end;

procedure TF_RecFat.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit6.setfocus;
end;

procedure TF_RecFat.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RecFat.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RecFat.BitBtn2Click(Sender: TObject);
begin
  Dm.ArqAux.Close;
  DbGrid1.Visible := False;
  MaskEdit1.Text  := '';
  MaskEdit2.Text  := '0';
  MaskEdit3.Text  := '0';
  MaskEdit4.Text  := '';
  MaskEdit6.Text  := '';
  ComboBox1.Text  := '';
  WpRichText1.Clear;
  MaskEdit1.SetFocus;
end;


procedure TF_RecFat.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_RecFat.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RecFat.MaskEdit6Exit(Sender: TObject);
begin
 if (not ValidData(MaskEdit1.Text)) OR
     (not ValidData(MaskEdit6.Text)) then
  begin
    ShowMessage('Data inválida ');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT ncliente FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit6.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('GROUP BY ncliente');
  Dm.ArqAux.Sql.Add('ORDER BY ncliente');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;
  ComboBox1.Clear;
  while (not Dm.ArqAux.Eof) do
  begin
    ComboBox1.Items.Add(StrZero(Dm.ArqAux.FieldByName('ncliente').asString, 3) + ' - ' + BuscaNomeEmpresa(Dm.ArqAux.FieldByName('ncliente').asString, False));
    Dm.ArqAux.Next;
  end;
  Dm.ArqAux.Close;
  ComboBox1.SetFocus;
end;

procedure TF_RecFat.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn4.SetFocus;
end;

procedure TF_RecFat.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn4.SetFocus;
end;

procedure TF_RecFat.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_RecFat.BitBtn1Click(Sender: TObject);
begin
  WPRichText1.Print;
end;

procedure TF_RecFat.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure TF_RecFat.MaskEdit2Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit2.Text)) then MaskEdit2.Text := '0';
end;

procedure TF_RecFat.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Imprime(F_RecFat, False);
  if key = 84 then Imprime(F_RecFat, True);
end;

procedure TF_RecFat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.ArqAux.Close;
end;

procedure TF_RecFat.BitBtn4Click(Sender: TObject);
begin
  if (not ValidData(MaskEdit1.Text)) OR
     (not ValidData(MaskEdit6.Text)) then
  begin
    ShowMessage('DATA INVÁLIDA !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT a_nome, agencia, SUM(v_total) valor, COUNT(*) qde');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    data_p  >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('AND data_p  <= ' + Chr(39) + ConvData(MaskEdit6.Text) + Chr(39));
  if trim(ComboBox1.Text) <> '' then
  Dm.ArqAux.Sql.Add('AND ncliente = ' + IntToStr(StrToInt(Copy(ComboBox1.Text, 1,3))))
  else Dm.ArqAux.Sql.Add('AND ncliente > 0');
  if (StrToInt(MaskEdit2.Text) > 0) AND (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.ArqAux.Sql.Add('AND registro >= ' + Trim(MaskEdit3.Text));
    Dm.ArqAux.Sql.Add('AND registro <= ' + Trim(MaskEdit2.Text));
  end;
  Dm.ArqAux.Sql.Add('GROUP BY ncliente');
  Dm.ArqAux.Sql.Add('ORDER BY a_nome');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;
  DbGrid1.Visible := True;
  DbGrid1.SetFocus;
end;

end.
