unit termos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, Buttons, ValorPor, Printers, WpParBrd,
  WpParPrp, WpPagPrp, WPDefs, WPPrint, WpWinCtr, WPRich, WPTbar, ComCtrls;

type
  Tf_termos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    BitBtn3: TBitBtn;
    ValorPorExtenso1: TValorPorExtenso;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label4: TLabel;
    WPToolBar1: TWPToolBar;
    WPRichText1: TWPRichText;
    WPParagraphPropDlg1: TWPParagraphPropDlg;
    WPPagePropDlg1: TWPPagePropDlg;
    WPParagraphBorderDlg1: TWPParagraphBorderDlg;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    Procedure Abertura_OF(Sender : TObject);
    Procedure Abertura_EX(Sender : TObject);
    Procedure Encerramento_OF(Sender : TObject);
    Procedure Encerramento_EX(Sender : TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_termos: Tf_termos;
  col, lin, pulo : integer;

implementation

uses Menu, U_Protocolo, FuncGeral, ProcGeral;

{$R *.DFM}

Function NumRomano(num : String) : String;
begin
  Result := '';
  if num = '1º' then Result := 'PRIMEIRO';
  if num = '2º' then Result := 'SEGUNDO';
  if num = '3º' then Result := 'TERCEIRO';
  if num = '4º' then Result := 'QUARTO';
  if num = '5º' then Result := 'QUINTO';
  if num = '6º' then Result := 'SEXTO';
  if num = '7º' then Result := 'SÉTIMO';
  if num = '8º' then Result := 'OITAVO';
  if num = '9º' then Result := 'NONO';
  if num = '10º' then Result := 'DÉCIMO';

end;

Procedure TF_Termos.Abertura_OF(Sender : TObject);
var
  cidade, liv, text_liv : String;
begin
  cidade   := '';
  liv      := '';
  text_liv := '';
  WpRichText1.Clear;
  WpRichText1.LoadFromFile(F_Menu.Label16.Caption + 'MODREL\TAbOf.RTF');
  WpRichText1.Find('<num_liv>',False);
  if WpRichText1.Finder.Found = True then
  begin
    if (Trim(MaskEdit3.Text) = '') then
    begin
      ValorPorExtenso1.Valor := StrToInt(MaskEdit2.Text);
      liv := MaskEdit2.Text; // + '(' + UpperCase(Label2.Caption) + ')';
    end
    else
    begin
      liv := MaskEdit2.Text + ' - ' + MaskEdit3.Text ;
    end;
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<num_liv>', liv);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<data_extenso>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<data_extenso>', DataExtenso(MaskEdit1.Text, False, ''));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<ano>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<ano>', Copy(MaskEdit1.Text, 7,4));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<mês>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<mês>', Trim(Ver_Mes(Copy(MaskEdit1.Text, 4,2))));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<text_liv>',False);
  if WpRichText1.Finder.Found = True then
  begin
    ValorPorExtenso1.Valor := StrToInt(MaskEdit2.Text);  
    if (Trim(MaskEdit3.Text) = '') then
    begin
      text_liv := MaskEdit2.Text + '(' + UpperCase(Label2.Caption) + ')';
    end
    else
    begin
      text_liv := MaskEdit2.Text + '(' + UpperCase(Label2.Caption) + '), letra "' + MaskEdit3.Text + '"';
    end;
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<text_liv>', text_liv);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cidade>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;    
    cidade := F_Menu.Label7.Caption + ', ' + Copy(MaskEdit1.Text, 1,2) + ' de ' + Trim(Ver_Mes(Copy(MaskEdit1.Text, 4,2))) + ' de ' + Copy(MaskEdit1.Text, 7,4);
    WpRichText1.Finder.ReplaceAll('<cidade>', cidade);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<traço>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<traço>', StringOfChar('_', Length(cidade)));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<oficial>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<oficial>', ComboBox1.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cargo>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cargo>', ComboBox2.Text);
    WpRichText1.Refresh;
  end;

  Application.CreateForm(TVProtocolo, VProtocolo);
  VProtocolo.WPRichText1.RtfText := WPRichText1.RtfText;
  VProtocolo.WpRichText1.Refresh;
  VProtocolo.WpRichText1.ReadOnly := true;
  VProtocolo.WpRichText1.Refresh;
  VProtocolo.ShowModal;
  VProtocolo.destroy;
  VProtocolo := Nil;

end;

Procedure TF_Termos.Encerramento_OF(Sender : TObject);
var
  cidade, liv, text_liv : String;
begin
  cidade   := '';
  liv      := '';
  text_liv := '';
  WpRichText1.Clear;
  WpRichText1.LoadFromFile(F_Menu.Label16.Caption + 'MODREL\TEcOF.RTF');
  WpRichText1.Find('<num_liv>',False);
  if WpRichText1.Finder.Found = True then
  begin
    if (Trim(MaskEdit3.Text) = '') then
    begin
      ValorPorExtenso1.Valor := StrToInt(MaskEdit2.Text);
      liv := MaskEdit2.Text + '(' + UpperCase(Label2.Caption) + ')';
    end
    else
    begin
      liv := MaskEdit2.Text + '(' + MaskEdit3.Text + ')';
    end;
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<num_liv>', liv);
    WpRichText1.Refresh;
  end;
    WpRichText1.Find('<num_fol>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<num_fol>', trim(MaskEdit4.Text));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<data_extenso>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<data_extenso>', DataExtenso(MaskEdit1.Text, False, ''));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<ano>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<ano>', Copy(MaskEdit1.Text, 7,4));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<mês>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<mês>', Trim(Ver_Mes(Copy(MaskEdit1.Text, 4,2))));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<text_liv>',False);
  if WpRichText1.Finder.Found = True then
  begin
    ValorPorExtenso1.Valor := StrToInt(MaskEdit2.Text);
    if (Trim(MaskEdit3.Text) = '') then
    begin
      text_liv := MaskEdit2.Text + '(' + UpperCase(Label2.Caption) + ')';
    end
    else
    begin
      text_liv := MaskEdit2.Text + '(' + UpperCase(Label2.Caption) + '), letra "' + MaskEdit3.Text + '"';
    end;
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<text_liv>', text_liv);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cidade>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    cidade := F_Menu.Label7.caption + ', ' + Copy(MaskEdit1.Text, 1,2) + ' de ' + Trim(Ver_Mes(Copy(MaskEdit1.Text, 4,2))) + ' de ' + Copy(MaskEdit1.Text, 7,4);
    WpRichText1.Finder.ReplaceAll('<cidade>', cidade);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<traço>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<traço>', StringOfChar('_', Length(cidade)));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<oficial>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<oficial>', ComboBox1.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cargo>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cargo>', ComboBox2.Text);
    WpRichText1.Refresh;
  end;
  Application.CreateForm(TVProtocolo, VProtocolo);
  VProtocolo.WPRichText1.RtfText := WPRichText1.RtfText;
  VProtocolo.WpRichText1.Refresh;
  VProtocolo.WpRichText1.ReadOnly := true;
  VProtocolo.WpRichText1.Refresh;
  VProtocolo.ShowModal;
  VProtocolo.destroy;
  VProtocolo := Nil;
end;

Procedure TF_Termos.Abertura_EX(Sender : TObject);
var
  cidade, liv, text_liv : String;
begin
  cidade   := '';
  liv      := '';
  text_liv := '';
  WpRichText1.Clear;
  WpRichText1.LoadFromFile(F_Menu.Label16.Caption + 'MODREL\TAbEx.RTF');
  WpRichText1.Find('<num_liv>',False);
  if WpRichText1.Finder.Found = True then
  begin
    liv := MaskEdit2.Text;
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<num_liv>', liv);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<ano>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<ano>', Copy(MaskEdit1.Text, 7,4));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<mês>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<mês>', Trim(Ver_Mes(Copy(MaskEdit1.Text, 4,2))));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<text_liv>',False);
  if WpRichText1.Finder.Found = True then
  begin
    text_liv := NumRomano(MaskEdit2.Text);
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<text_liv>', text_liv);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cidade>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    cidade := F_Menu.Label7.caption + ', ' + Copy(MaskEdit1.Text, 1,2) + ' de ' + Trim(Ver_Mes(Copy(MaskEdit1.Text, 4,2))) + ' de ' + Copy(MaskEdit1.Text, 7,4);
    WpRichText1.Finder.ReplaceAll('<cidade>', cidade);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<traço>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<traço>', StringOfChar('_', Length(cidade)));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<oficial>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<oficial>', ComboBox1.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cargo>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cargo>', ComboBox2.Text);
    WpRichText1.Refresh;
  end;
  Application.CreateForm(TVProtocolo, VProtocolo);
  VProtocolo.WPRichText1.RtfText := WPRichText1.RtfText;
  VProtocolo.WpRichText1.Refresh;
  VProtocolo.WpRichText1.ReadOnly := true;
  VProtocolo.WpRichText1.Refresh;
  VProtocolo.ShowModal;
  VProtocolo.destroy;
  VProtocolo := Nil;
end;

Procedure TF_Termos.Encerramento_EX(Sender : TObject);
var
  cidade, liv, text_liv : String;
begin
  cidade   := '';
  liv      := '';
  text_liv := '';
  WpRichText1.Clear;
  WpRichText1.LoadFromFile(F_Menu.Label16.Caption + 'MODREL\TEcEX.RTF');
  WpRichText1.Find('<num_liv>',False);
  if WpRichText1.Finder.Found = True then
  begin
    if (Trim(MaskEdit3.Text) = '') then
    begin
      ValorPorExtenso1.Valor := StrToInt(MaskEdit2.Text);
      liv := MaskEdit2.Text + '(' + UpperCase(Label2.Caption) + ')';
    end
    else
    begin
      liv := MaskEdit2.Text + '(' + MaskEdit3.Text + ')';
    end;
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<num_liv>', liv);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<ano>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<ano>', Copy(MaskEdit1.Text, 7,4));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<mês>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<mês>', Trim(Ver_Mes(Copy(MaskEdit1.Text, 4,2))));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<text_liv>',False);
  if WpRichText1.Finder.Found = True then
  begin
    ValorPorExtenso1.Valor := StrToInt(MaskEdit2.Text);
    if (Trim(MaskEdit3.Text) = '') then
    begin
      text_liv := MaskEdit2.Text + '(' + UpperCase(Label2.Caption) + ')';
    end
    else
    begin
      text_liv := MaskEdit2.Text + '(' + UpperCase(Label2.Caption) + '), letra "' + MaskEdit3.Text + '"';
    end;
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<text_liv>', text_liv);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cidade>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    cidade := F_Menu.label14.caption + ', ' + Copy(MaskEdit1.Text, 1,2) + ' de ' + Trim(Ver_Mes(Copy(MaskEdit1.Text, 4,2))) + ' de ' + Copy(MaskEdit1.Text, 7,4);
    WpRichText1.Finder.ReplaceAll('<cidade>', cidade);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<traço>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<traço>', StringOfChar('_', Length(cidade)));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<oficial>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<oficial>', ComboBox1.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cargo>',False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cargo>', ComboBox2.Text);
    WpRichText1.Refresh;
  end;
  Application.CreateForm(TVProtocolo, VProtocolo);
  VProtocolo.WPRichText1.RtfText := WPRichText1.RtfText;
  VProtocolo.WpRichText1.Refresh;
  VProtocolo.WpRichText1.ReadOnly := true;
  VProtocolo.WpRichText1.Refresh;
  VProtocolo.ShowModal;
  VProtocolo.destroy;
  VProtocolo := Nil;

end;

procedure Tf_termos.BitBtn2Click(Sender: TObject);
begin
  maskedit1.clear;
  maskedit2.clear;
  radiobutton1.checked := true;
  radiobutton3.checked := true;
  maskedit1.setfocus;
end;

procedure Tf_termos.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure Tf_termos.BitBtn1Click(Sender: TObject);
begin
  if (RadioButton3.Checked) then
  begin
    if (RadioButton1.Checked) then Abertura_OF(F_Termos);
    if (RadioButton2.Checked) then Encerramento_OF(F_Termos);
  end;
  {if (RadioButton4.Checked) then
  begin
    if (RadioButton1.Checked) then Abertura_EX(F_Termos);
    if (RadioButton2.Checked) then Encerramento_EX(F_Termos);
  end;}
end;

procedure Tf_termos.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit2.setfocus;
end;

procedure Tf_termos.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if key = 13 then ComboBox1.SetFocus;
   if key = 13 then maskedit4.Setfocus
end;

procedure Tf_termos.FormActivate(Sender: TObject);
begin
  bitbtn2click(f_termos);
end;

procedure Tf_termos.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure Tf_termos.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

procedure Tf_termos.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure Tf_termos.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;  
end;

procedure Tf_termos.FormShow(Sender: TObject);
begin
  Carrega_Assina;
end;

end.

