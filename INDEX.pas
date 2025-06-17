unit Index;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TF_Index = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ListBox1: TListBox;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    Bevel1: TBevel;
    ProgressBar1: TProgressBar;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Index: TF_Index;

implementation

uses Tabelas, Menu;

{$R *.DFM}
function Indexar( arquivodbf, arquivontx, chave : String): Boolean;
begin
  With Tabela do
  begin
    F_Index.StatusBar1.SimpleText := '';
    F_Index.StatusBar1.update;
    Result := False;
    if not fileexists(arquivodbf) then
    begin
      ShowMessage('Não foi localizado o arquivo ' + arquivodbf);
      Exit;
    end;
    if FileExists(arquivontx) then DeleteFile(arquivontx);
    F_Index.StatusBar1.SimpleText := 'Indexando ' + arquivontx + '...';
    Screen.Cursor := crHourglass;
    Indexa.TableName := arquivodbf;
    Indexa.Open;
    Indexa.Index(arquivontx, chave, 0, false, '');
    Indexa.IndexClose;
    Indexa.Close;
    Screen.Cursor := crDefault;
    if not FileExists(arquivontx) then
    begin
      ShowMessage('Não foi possível criar o arquivo ' + arquivontx);
      Exit;
    end
    else Result := true;
    F_index.StatusBar1.SimpleText := '';
  end;
end;

Procedure Ler_Ini;
var
  F: TextFile;
  S: string;
  sair : Boolean;
Begin
  if not fileexists('siscart.ini') then
  begin
    showmessage('Está faltando um dos componentes do Sistema (siscart.ini)');
    exit;
  end;
  sair := false;
  AssignFile(F, 'siscart.ini');
  Reset(F);
  while not sair do
  begin
    Readln(F, S);
    if s = '[INDEX]' then
    begin
      Readln(F, S);
      while copy(s,1,1) <> '[' do
      Begin
        if s = '' then
        Begin
          Readln(F, S);
          if copy(s,1,5) = '[FIM]' then sair := true;
          if (s <> '') and (not sair) then
          Begin
            F_Index.Combobox1.items.add(s);
            while s <> '' do
            begin
              Readln(F, S);
            end;
          end;
        end;
      end;
    end;
    if copy(s,1,5) = '[FIM]' then sair := true;
  end;
  F_Index.Combobox1.items.add('***Indexar todos os Arquivos***');
  CloseFile(F);
end;

Procedure Procurar(Arquivo : String);
var
  F: TextFile;
  S, S1: string;
  sair : Boolean;
Begin
  if not fileexists('siscart.ini') then
  begin
    showmessage('Está faltando um dos componentes do Sistema (siscart.ini)');
    exit;
  end;
  sair := false;
  AssignFile(F, 'siscart.ini');
  Reset(F);
  while not sair do
  begin
    Readln(F, S);
    if s = '[INDEX]' then
    begin
      Readln(F, S);
      while (copy(s,1,1) <> '[') and (not sair) do
      Begin
        if s = '' then
        Begin
          Readln(F, S);
          if copy(s,1,5) = '[FIM]' then sair := true;
          if (s <> '') and (not sair) then
          Begin
            if s = arquivo then
            begin
              Readln(F, S);
              while s <> '' do
              begin
                F_Index.ListBox1.Items.Add(s);
                Readln(F, S);
                if s = '' then sair := true;
              end;
            end;
          end;
        end;
        Readln(F, S);
      end;
    end;
    if copy(s,1,5) = '[FIM]' then sair := true;
  end;
  CloseFile(F);
end;


procedure TF_Index.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TF_Index.FormActivate(Sender: TObject);
begin
  ler_ini;
end;

procedure TF_Index.ComboBox1Change(Sender: TObject);
begin
  if combobox1.text <> '' then
  begin
    Listbox1.Clear;
    procurar(combobox1.text);
  end;
end;

Function TiraNtx(Cadeia : String) : String;
var
  y : Integer;
  carac : String;
  pronto : Boolean;
begin
  result := '';
  pronto := false;
  for y := 1 to length(cadeia) do
  begin
    carac := copy(cadeia,y,1);
    if carac = ' ' then pronto := true;
    if not pronto then result := result + carac;
  end;
end;

Function TiraChave(Cadeia : String) : String;
var
  y : Integer;
  carac : String;
  iniciar : Boolean;
begin
  result := '';
  iniciar := false;
  for y := 1 to length(cadeia) do
  begin
    carac := copy(cadeia,y,1);
    if carac = '>' then iniciar := true else
    Begin
      if iniciar then result := result + carac;
    end;
  end;
  result := trimright(trimleft(result));
end;

procedure TF_Index.BitBtn1Click(Sender: TObject);
var
  dbf, ntx, chave : String;
  x1, x : Integer;
begin
  if combobox1.text = '' then exit;
  bitbtn1.enabled := false;
  bitbtn2.enabled := false;
  bitbtn1.Update;
  bitbtn2.Update;
  if copy(combobox1.text,1,1) = '*' then
  Begin
    ProgressBar1.Position := 0;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := combobox1.Items.Count - 1;
    for x1 := 0 to combobox1.Items.Count - 1 do
    begin
      ProgressBar1.Position := x1;    
      combobox1.text := combobox1.items.Strings[x1];
      F_Index.ComboBox1Change(F_Index);
      ListBox1.Update;
      for x := 0 to ListBox1.Items.Count - 1 do
      begin
        dbf := combobox1.text;
        ntx := tirantx(listbox1.items.strings[x]);
        chave := tirachave(listbox1.items.strings[x]);
        indexar(dbf, ntx, chave);
      end;
    end;
  end
  else
  begin
    ProgressBar1.Position := 0;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := Listbox1.Items.Count - 1;
    for x := 0 to ListBox1.Items.Count - 1 do
    begin
      ProgressBar1.Position := x;    
      dbf := combobox1.text;
      ntx := tirantx(listbox1.items.strings[x]);
      chave := tirachave(listbox1.items.strings[x]);
      indexar(dbf, ntx, chave);
    end;
  end;
  bitbtn1.enabled := true;
  bitbtn2.enabled := true;
  bitbtn1.Update;
  bitbtn2.Update;
  StatusBar1.SimpleText := 'Fim da Indexação !!!';
  Statusbar1.Update;
  bitbtn2.setfocus;
end;

end.
