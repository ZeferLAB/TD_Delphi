unit cer_neg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, WPDefs, WPPrint, WpWinCtr, WPRich,
  ComCtrls, jpeg;

type
  TF_CNEG = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    WPRichText1: TWPRichText;
    RichEdit1: TRichEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    Label7: TLabel;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    Procedure Imprimi_WPNeg(Sender : TObject);
    procedure RichEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CNEG: TF_CNEG;
  prot : String;

implementation

uses Menu, DMTD, U_WRecep, WRecep2, FuncGeral;

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


Procedure TF_CNeg.Imprimi_WPNeg(Sender : TObject);
var
  cidade : String;
begin
  while (not Dm.Certidao.Eof) do
  begin
   With F_WRecep2 do
    begin
    WpRichText1.ReadOnly := False;
    WpRichText1.Clear;
    WpRichText1.LoadFromFile(F_Menu.Label4.Caption + 'Negativa.RTF');
    WpRichText1.Refresh;

    WpRichText1.Find('<oficial>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<oficial>', F_Menu.Label5.Caption);
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<c_num>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<c_num>', MaskEdit2.Text);
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<livro>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<livro>', MaskEdit3.Text);
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<folha>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<folha>', MaskEdit4.Text);
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

    WpRichText1.Find('<cidade>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<cidade>', F_Menu.Label7.Caption);
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<estado>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<estado>', F_Menu.Label6.Caption);
      WpRichText1.Refresh;
    end;       

    WpRichText1.Find('<auxiliar>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<auxiliar>', ComboBox1.Text);
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<texto>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<texto>', RichEdit1.Lines.Strings[0]+RichEdit1.Lines.Strings[1]+RichEdit1.Lines.Strings[2]);
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<carg>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<carg>', ComboBox2.Text);
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<v_emo>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<v_emo>', StrCurr(Dm.Certidao.FieldByName('v_emolumento').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<v_busca>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<v_busca>', StrCurr(Dm.Certidao.FieldByName('v_busca').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<v_des>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<v_des>', StrCurr(Dm.Certidao.FieldByName('v_desarquivamento').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<v_info>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<v_info>', StrCurr(Dm.Certidao.FieldByName('v_informatica').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<v_sub>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<v_sub>', StrCurr(Dm.Certidao.FieldByName('v_subtotal').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<v_tri>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<v_tri>', StrCurr(Dm.Certidao.FieldByName('tribunal').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<v_def>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<v_def>', StrCurr(Dm.Certidao.FieldByName('defensoria').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<v_pro>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<v_pro>', StrCurr(Dm.Certidao.FieldByName('procuradoria').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;

    WpRichText1.Find('<v_cus>', False);
    if WpRichText1.Finder.Found = True then
    begin
      WpRichText1.Finder.Clear;
      WpRichText1.Finder.ReplaceAll('<v_cus>', StrCurr(Dm.Certidao.FieldByName('custas').asCurrency, 10, True));
      WpRichText1.Refresh;
    end;

    WpRichText1.MovePosition(WpmHome, False);
    WpRichText1.ReadOnly := True;
    F_WRecep2.Showmodal;
    Dm.Certidao.Next;
   end;
  end;
end;

procedure TF_CNEG.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_CNEG.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_CNEG.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then ComboBox2.SetFocus;
end;

procedure TF_CNEG.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then RichEdit1.SetFocus;
end;

procedure TF_CNEG.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CNEG.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure TF_CNEG.BitBtn1Click(Sender: TObject);
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
  Imprimi_WPNeg(F_CNeg);
  Dm.Certidao.Close;
end;

procedure TF_CNEG.RichEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 Begin
  if RichEdit1.Lines.Count > 2 then
  Begin
   Showmessage('Máximo de 3 linhas');
   bitbtn1.setfocus;
  end;
 end;
end;

procedure TF_CNEG.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_CNEG.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_CNEG.FormActivate(Sender: TObject);
begin
  MaskEdit3.Text := '';
  MaskEdit4.Text := '';
end;

procedure TF_CNEG.ComboBox1Change(Sender: TObject);
begin
//  ComboBox2.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

end.
