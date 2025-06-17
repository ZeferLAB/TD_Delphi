unit cer_pos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, WPDefs, WPPrint, WpWinCtr, WPRich,
  ToolEdit, CurrEdit;

type
  TF_CPos = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    WPRichText1: TWPRichText;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    Procedure Imprimi_WPPos(Sender : TObject);
    procedure CurrencyEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CPos: TF_CPos;
  Prot : String;

implementation

uses Menu, DMTD, FuncGeral;

{$R *.DFM}


Function Mes(mes, MaiMin : String) : String;
begin
  Result := '';
  if (MaiMin = 'm') then
  begin
    if StrToInt(mes) =  1 then Result := 'Janeiro       ';
    if StrToInt(mes) =  2 then Result := 'Fevereiro     ';
    if StrToInt(mes) =  3 then Result := 'Março         ';
    if StrToInt(mes) =  4 then Result := 'Abril         ';
    if StrToInt(mes) =  5 then Result := 'Maio          ';
    if StrToInt(mes) =  6 then Result := 'Junho         ';
    if StrToInt(mes) =  7 then Result := 'Julho         ';
    if StrToInt(mes) =  8 then Result := 'Agosto        ';
    if StrToInt(mes) =  9 then Result := 'Setembro      ';
    if StrToInt(mes) = 10 then Result := 'Outubro       ';
    if StrToInt(mes) = 11 then Result := 'Novembro      ';
    if StrToInt(mes) = 12 then Result := 'Dezembro      ';
  end
  else
  begin
    if StrToInt(mes) =  1 then Result := 'JANEIRO       ';
    if StrToInt(mes) =  2 then Result := 'FEVEREIRO     ';
    if StrToInt(mes) =  3 then Result := 'MARÇO         ';
    if StrToInt(mes) =  4 then Result := 'ABRIL         ';
    if StrToInt(mes) =  5 then Result := 'MAIO          ';
    if StrToInt(mes) =  6 then Result := 'JUNHO         ';
    if StrToInt(mes) =  7 then Result := 'JULHO         ';
    if StrToInt(mes) =  8 then Result := 'AGOSTO        ';
    if StrToInt(mes) =  9 then Result := 'SETEMBRO      ';
    if StrToInt(mes) = 10 then Result := 'OUTUBRO       ';
    if StrToInt(mes) = 11 then Result := 'NOVEMBRO      ';
    if StrToInt(mes) = 12 then Result := 'DEZEMBRO      ';
  end;
end;

Procedure TF_CPos.Imprimi_WPPos(Sender : TObject);
var
  cidade : String;
begin
  while (not Dm.Certidao.Eof) do
  begin
    WpRichText1.Clear;
    if (CheckBox1.Checked) then
    begin
      WpRichText1.LoadFromFile(F_Menu.Label4.Caption + 'Positiva.RTF');
    end
    else
    begin
      WpRichText1.LoadFromFile(F_Menu.Label4.Caption + 'Positiva1.RTF');
    end;
    WpRichText1.Refresh;
    WpRichText1.Find('<cidade>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<cidade>', F_Menu.Label7.Caption);
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<oficial>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<oficial>', F_Menu.Label5.Caption);
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<estado>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<estado>', Ver_Estado(F_Menu.Label6.Caption));
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<c_num>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<c_num>', MaskEdit2.Text);
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<intere>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<intere>', Trim(Dm.Certidao.FieldByName('propriet').asString));
      WpRichText1.Refresh;
    end;
    cidade := F_Menu.Label7.Caption + ', ' + Copy(MaskEdit1.Text, 1,2) + ' de ' + Trim(Mes(Copy(MaskEdit1.Text, 4,2), 'm')) + ' de ' + Copy(MaskEdit1.Text, 7,4);
    WpRichText1.Find('<data>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<data>', cidade);
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<regi>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<regi>', Trim(MaskEdit3.Text));
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<pag>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<pag>', Trim(MaskEdit4.Text));
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<auxiliar>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<auxiliar>', ComboBox1.Text);
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<carg>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<carg>', ComboBox2.Text);
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<ave>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<ave>', Trim(Maskedit5.Text));
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<ofi>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<ofi>', StrCurr(Dm.Certidao.FieldByName('oficial').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<est>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<est>', StrCurr(Dm.Certidao.FieldByName('estado').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<ipe>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<ipe>', StrCurr(Dm.Certidao.FieldByName('ipesp').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<sin>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<sin>', StrCurr(Dm.Certidao.FieldByName('sinoreg').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<tri>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<tri>', StrCurr(Dm.Certidao.FieldByName('tribunal').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;
    WpRichText1.Find('<tot>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<tot>', StrCurr(Dm.Certidao.FieldByName('custas').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;
    WpRichText1.Print;
    Dm.Certidao.Next;
  end;
end;


procedure TF_CPos.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_CPos.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_CPos.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_CPos.CheckBox1Click(Sender: TObject);
begin
  If CheckBox1.Checked then
  begin
    Label5.Enabled    := True;
    MaskEdit5.Enabled := True;
    MaskEdit5.SetFocus;
  end
  Else
  Begin
    Label5.Enabled    := False;
    MaskEdit5.Enabled := False;
    MaskEdit5.Clear;
  End;
end;

procedure TF_CPos.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CPos.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_CPos.BitBtn1Click(Sender: TObject);
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('Data inválida !'), 'EMISSÃO DE CERTIDÃO NEGATIVA', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Certidao.Close;
  Dm.Certidao.Sql.Clear;
  Dm.Certidao.Sql.Add('SELECT * FROM certidao');
  Dm.Certidao.Sql.Add('WHERE');
  Dm.Certidao.Sql.Add('nr_protoc = ' + Trim(MaskEdit2.Text));
  Dm.Certidao.Open;
  if (Dm.Certidao.RecordCount = 0) then
  begin
    Dm.Certidao.Close;
    MessageBox(Handle, PChar('Pedido não encontrado !'), 'EMISSÃO DE CERTIDÃO NEGATIVA', MB_OK + MB_ICONWARNING);
    MaskEdit2.SetFocus;
    Exit;
  end;
  Imprimi_WPPos(F_CPos);
  Dm.Certidao.Close;
end;

procedure TF_CPos.CurrencyEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_CPos.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_CPos.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CheckBox1.SetFocus;
end;

procedure TF_CPos.CheckBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_CPos.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

end.
