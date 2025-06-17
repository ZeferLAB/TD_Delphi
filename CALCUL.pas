unit CALCUL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, ExtCtrls, ToolEdit, CurrEdit, Buttons, jpeg;

type
  TF_Calcul = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    Label20: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    Bevel1: TBevel;
    Label13: TLabel;
    Bevel2: TBevel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label38: TLabel;
    Label41: TLabel;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit24: TMaskEdit;
    MaskEdit26: TMaskEdit;
    CurrencyEdit1: TCurrencyEdit;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Label4: TLabel;
    CurrencyEdit7: TCurrencyEdit;
    Label5: TLabel;
    CurrencyEdit9: TCurrencyEdit;
    Label16: TLabel;
    CurrencyEdit10: TCurrencyEdit;
    Label17: TLabel;
    CurrencyEdit11: TCurrencyEdit;
    Label18: TLabel;
    CurrencyEdit12: TCurrencyEdit;
    Label19: TLabel;
    CurrencyEdit13: TCurrencyEdit;
    Label21: TLabel;
    CurrencyEdit14: TCurrencyEdit;
    Label22: TLabel;
    CurrencyEdit15: TCurrencyEdit;
    Label23: TLabel;
    CurrencyEdit16: TCurrencyEdit;
    Label24: TLabel;
    CurrencyEdit17: TCurrencyEdit;
    Label25: TLabel;
    CurrencyEdit18: TCurrencyEdit;
    CurrencyEdit19: TCurrencyEdit;
    Label26: TLabel;
    Label27: TLabel;
    CurrencyEdit20: TCurrencyEdit;
    Label28: TLabel;
    CurrencyEdit21: TCurrencyEdit;
    Label29: TLabel;
    MaskEdit2: TMaskEdit;
    Label30: TLabel;
    CurrencyEdit22: TCurrencyEdit;
    Label31: TLabel;
    CurrencyEdit23: TCurrencyEdit;
    Label32: TLabel;
    ComboBox1: TComboBox;
    Label33: TLabel;
    Label34: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label35: TLabel;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    Label36: TLabel;
    Label37: TLabel;
    CurrencyEdit24: TCurrencyEdit;
    Label39: TLabel;
    CurrencyEdit25: TCurrencyEdit;
    Label40: TLabel;
    CurrencyEdit26: TCurrencyEdit;
    ControlBar1: TControlBar;
    Label42: TLabel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    Procedure Limpar(Sender : TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit26KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit24Exit(Sender: TObject);
    procedure MaskEdit7Exit(Sender: TObject);
    procedure MaskEdit8Exit(Sender: TObject);
    procedure MaskEdit26Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Calcul: TF_Calcul;

implementation

Uses Menu, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Calcul.Limpar(Sender : TObject);
begin
  MaskEdit1.Text       := DateToStr(date);
  ComboBox5.Text       := '';
  ComboBox6.Text       := '';
  MaskEdit7.Text       := '0';
  MaskEdit8.Text       := '0';
  MaskEdit24.Text      := '0';
  MaskEdit26.Text      := '0';
  CurrencyEdit1.Value  := 0.00;
  CurrencyEdit2.Value  := 0.00;
  CurrencyEdit3.Value  := 0.00;
  CurrencyEdit4.Value  := 0.00;
  CurrencyEdit5.Value  := 0.00;
  CurrencyEdit6.Value  := 0.00;
  CurrencyEdit8.Value  := 0.00;
  CurrencyEdit9.Value  := 0.00;
  CurrencyEdit10.Value := 0.00;
  CurrencyEdit11.Value := 0.00;
  CurrencyEdit12.Value := 0.00;
  CurrencyEdit13.Value := 0.00;
  CurrencyEdit14.Value := 0.00;
  CurrencyEdit15.Value := 0.00;
  CurrencyEdit16.Value := 0.00;
  CurrencyEdit17.Value := 0.00;
  CurrencyEdit18.Value := 0.00;
  CurrencyEdit19.Value := 0.00;
  CurrencyEdit20.Value := 0.00;
  CurrencyEdit21.Value := 0.00;
  CurrencyEdit25.Value := 0.00;
  F_Menu.Vezes.Caption := '0';
end;

procedure TF_Calcul.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.Setfocus;
end;

procedure TF_Calcul.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.Setfocus;
end;

procedure TF_Calcul.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Calcul.FormActivate(Sender: TObject);
begin
  Limpar(F_Calcul);
end;

procedure TF_Calcul.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Bitbtn1.Setfocus;
end;

procedure TF_Calcul.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Maskedit3.Setfocus;
end;

procedure TF_Calcul.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_Calcul.BitBtn2Click(Sender: TObject);
begin
  Limpar(F_Calcul);
  MaskEdit1.SetFocus;
end;

procedure TF_Calcul.BitBtn1Click(Sender: TObject);
begin
  CalculoGeral(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit8.Text), StrToInt(MaskEdit7.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit2.Text), ComboBox1.Text, True);
  CurrencyEdit2.Value   :=  VrEmolumentos;
  CurrencyEdit3.Value   :=  VrEmolAdicional;
  CurrencyEdit4.Value   :=  VrPag;
  CurrencyEdit25.Value  :=  Vr_Notpag;
  CurrencyEdit5.Value   :=  VrViasExcedente;
  CurrencyEdit6.Value   :=  VrMicrofilme + VrMicroDistrib;
  CurrencyEdit8.Value   :=  VrDigitalizacao;
  CurrencyEdit7.Value   :=  VrInformatica;
  CurrencyEdit9.Value   :=  VrGravEletronica;
  CurrencyEdit10.Value  :=  VrConferencia;
  CurrencyEdit11.Value  :=  VrNomeExc;
  CurrencyEdit12.Value  :=  VrDistrib;
  CurrencyEdit13.Value  :=  VrInfoDistrib;
  CurrencyEdit14.Value  :=  VrGravEletrDistrib;
  CurrencyEdit24.Value  :=  VrPorDist;
  CurrencyEdit15.Value  :=  VrSubTotal;
  CurrencyEdit16.Value  :=  VrTribunal;
  CurrencyEdit17.Value  :=  VrProcuradoria;
  CurrencyEdit18.Value  :=  VrDefensoria;
  CurrencyEdit19.Value  :=  VrMutua;
  CurrencyEdit20.Value  :=  VrAcoterj;
  CurrencyEdit22.Value  :=  VrDoi + VrDoiInfo;
  CurrencyEdit23.Value  :=  VrProcEst;
  CurrencyEdit26.Value  :=  VrGuia + VrGuiaInfo;
  CurrencyEdit21.Value  :=  VrTotG;
  ComboBox5.SetFocus;
end;

procedure TF_Calcul.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  Begin
   F_menu.vezes.caption := '';
   if copy(combobox5.text,1,2) = '03' then
   Begin
    F_menu.vezes.caption := InputBox('QTDE DE DESTINATÁRIO', 'Digite a quantidade de destinatários :', '1');
   end;
   ComboBox6.SetFocus;
  end;
end;

procedure TF_Calcul.ComboBox6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit24.SetFocus;
end;

procedure TF_Calcul.MaskEdit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Calcul.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_Calcul.MaskEdit26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_Calcul.MaskEdit24Exit(Sender: TObject);
begin
  if (Trim(MaskEdit24.Text) = '') then MaskEdit24.Text := '0';
end;

procedure TF_Calcul.MaskEdit7Exit(Sender: TObject);
begin
  if (Trim(MaskEdit7.Text) = '') then MaskEdit7.Text := '0';
end;

procedure TF_Calcul.MaskEdit8Exit(Sender: TObject);
begin
  if (Trim(MaskEdit8.Text) = '') then MaskEdit8.Text := '0';
end;

procedure TF_Calcul.MaskEdit26Exit(Sender: TObject);
begin
  if (Trim(MaskEdit26.Text) = '') then MaskEdit26.Text := '0';
end;

procedure TF_Calcul.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit26.SetFocus;
end;

procedure TF_Calcul.MaskEdit2Exit(Sender: TObject);
begin
  if MaskEdit2.Text = '' then MaskEdit2.Text := '0';
end;

procedure TF_Calcul.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_Calcul.BitBtn4Click(Sender: TObject);
var
  linha, porta, qtde_talao  : Integer;
  branco, texto, buffer, primeiro, ultimo : String;
  F : TextFile;
  l6, l3, l20, l7, l11, l13 : String;
begin
   BitBtn1Click(sender);
   l6  := F_Menu.Label9.Caption;
   l3  := F_Menu.Label7.Caption;
   l7  := F_Menu.label11.Caption;
   l13 := F_Menu.label13.Caption;

   AssignFile(F, Bematech_porta);
   Rewrite(F);

   buffer := Copy(branco,1, (28 - (length(Trim(l6)) div 2))) + Trim(l6);
   Writeln(F, buffer);
//   buffer := Copy(branco,1, (20 - (length(Trim(l3)) div 2))) + Trim(l3);
//   Writeln(F, buffer);
//   buffer := Copy(branco,1, (20 - (length(Trim(l7)) div 2))) + Trim(l7);
//   Writeln(F, buffer);
//   buffer := Copy(branco,1, (20 - (length(Trim(l11)) div 2))) + Trim(l11);
   buffer := '      ORCAMENT0';
   Writeln(F, buffer);
   Writeln(F, '');
//   buffer := Copy(branco,1, (20 - (length('RECIBO Final' + strzero(MaskEdit4.Text,6)) div 2))) + 'RECIBO Final' + strzero(MaskEdit4.Text,6);
//   Writeln(F, buffer);
//   buffer := Copy(branco,1, (20 - (length('RECIBO Rec' + strzero(MaskEdit4.Text,6)) div 2))) + 'RECIBO Rec' + strzero(MaskEdit4.Text,6);
//   Writeln(F, buffer);
   buffer := 'Apres. ' + MaskEdit6.Text;
   Writeln(F, buffer);
//   buffer := 'Atendente : ' + F_Menu.Label1.Caption;
//   Writeln(F, buffer);
//   buffer := 'Natureza : ' + natureza;
//   Writeln(F, buffer);
//   buffer := 'Cartorio : ' + MaskEdit5.Text;
//   Writeln(F, buffer);
//   Writeln(F, '');
   buffer := 'Tabela : ' + ComboBox5.Text;
   Writeln(F, buffer);
   buffer := 'Nomes : ' + MaskEdit24.Text + '  Pag.: ' + Maskedit8.Text + ' Vias : ' + Maskedit26.Text;
   Writeln(F, buffer);
   buffer := 'Diligencias : ' + MaskEdit2.Text;
   Writeln(F, buffer);
   buffer := 'Valor Base..: ' + Trim(StrCurr(CurrencyEdit1.Value, 14, True));
   Writeln(F, buffer);
   Writeln(F, '');
   if CurrencyEdit2.Value > 0 then
   begin
     buffer := 'TAB 10.01  Emolumentos....: R$ ' + Trim(StrCurr(CurrencyEdit2.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit3.Value > 0 then
   begin
     if (trim(copy(ComboBox5.text, 1, 5)) = '1001') or (trim(copy(ComboBox5.text, 1, 5)) = '1003A') or (trim(copy(ComboBox5.text, 1, 5)) = '1003C') then
       buffer := 'TAB10.1.I  5PrimeirasPag..: R$ ' + Trim(StrCurr(CurrencyEdit3.Value, 14, True));
     if (trim(copy(ComboBox5.text, 1, 5)) = '1002') or (trim(copy(ComboBox5.text, 1, 5)) = '1003B') or (trim(copy(ComboBox5.text, 1, 5)) = '1003D') then
       buffer := 'TAB10.2.I 1Pagina........: R$ ' + Trim(StrCurr(CurrencyEdit3.Value, 14, True));
     if (trim(copy(ComboBox5.text, 1, 5)) = '1006') or (trim(copy(ComboBox5.text, 1, 5)) = '1009') then
       buffer := 'TAB10.6    Diligencia.....: R$ ' + Trim(StrCurr(CurrencyEdit3.Value, 14, True));
     Writeln(F, buffer);
   end;

   if CurrencyEdit25.Value > 0 then
   begin
      buffer := 'TAB10.2.I  1Pagina........: R$ ' + Trim(StrCurr(CurrencyEdit25.Value, 14, True));
      Writeln(F, buffer);
   end;
   if CurrencyEdit4.Value > 0 then
   begin
     if (trim(copy(ComboBox5.text, 1, 5)) = '1001') or (trim(copy(ComboBox5.text, 1, 5)) = '1003A') or (trim(copy(ComboBox5.text, 1, 5)) = '1003C') then
         buffer := 'TAB10.1.II Pag.Excedente..: R$ ' + Trim(StrCurr(CurrencyEdit4.Value, 14, True));
     if (trim(copy(ComboBox5.text, 1, 5)) = '1002') or (trim(copy(ComboBox5.text, 1, 5)) = '1003B') or (trim(copy(ComboBox5.text, 1, 5)) = '1003D') or (trim(copy(ComboBox5.text, 1, 5)) = '1006') then
       buffer := 'TAB10.2.II Pag.Excedente..: R$ ' + Trim(StrCurr(CurrencyEdit4.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit5.Value > 0 then
   begin
     buffer := 'TAB10.4    Via Excedente..: R$ ' + Trim(StrCurr(CurrencyEdit5.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit6.Value > 0 then
   begin
     buffer := 'TAB1.7    Microfilme.....: R$ ' + Trim(StrCurr(CurrencyEdit6.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit8.Value > 0 then
   begin
     buffer := 'TAB10.6    Digitalizacao..: R$ ' + Trim(StrCurr(CurrencyEdit8.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit7.Value > 0 then
   begin
     buffer := 'TAB1.9     Informatica....: R$ ' + Trim(StrCurr(CurrencyEdit7.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit9.Value > 0 then
   begin
     buffer := 'TAB1.10    Grav Eletronica: R$ ' + Trim(StrCurr(CurrencyEdit9.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit10.Value > 0 then
   begin
     buffer := 'TAB1.5     Conferencia....: R$ ' + Trim(StrCurr(CurrencyEdit10.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit22.Value > 0 then
   begin
     buffer := 'TAB1.6/1.9 Doi............: R$ ' + Trim(StrCurr(CurrencyEdit22.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit23.Value > 0 then
   begin
     buffer := 'TAB10.5   ProcEstrangeira: R$ ' + Trim(StrCurr(CurrencyEdit23.Value, 14, True));
     Writeln(F, buffer);
   end;

//   if CurrencyEdit23.Value > 0 then
//   begin
//     buffer := 'Guia............: R$ ' + Trim(StrCurr(CurrencyEdit23.Value, 14, True));
//     Writeln(F, buffer);
//   end;
   if CurrencyEdit15.Value > 0 then
   begin
     buffer := '           SubTotal.......: R$ ' + Trim(StrCurr(CurrencyEdit15.Value, 14, True));
     Writeln(F, buffer);
   end;

   if CurrencyEdit11.Value > 0 then
   begin
     buffer := 'TAB4       Nomes Exced....: R$ ' + Trim(StrCurr(CurrencyEdit11.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit12.Value > 0 then
   begin
     buffer := 'TAB4       Distribuicao...: R$ ' + Trim(StrCurr(CurrencyEdit12.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit13.Value > 0 then
   begin
     buffer := 'TAB1.9     Info Distrib...: R$ ' + Trim(StrCurr(CurrencyEdit13.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit14.Value > 0 then
   begin
     buffer := 'TAB1.10    Grav.Elet.Dist.: R$ ' + Trim(StrCurr(CurrencyEdit14.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit24.Value > 0 then
   begin
     buffer := 'TAB4       Leis Distrib...: R$ ' + Trim(StrCurr(CurrencyEdit24.Value , 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit16.Value > 0 then
   begin
     buffer := '           Lei 3217/99....: R$ ' + Trim(StrCurr(CurrencyEdit16.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit17.Value > 0 then
   begin
     buffer := '           Lei 4664/05....: R$ ' + Trim(StrCurr(CurrencyEdit17.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit18.Value > 0 then
   begin
     buffer := '           Lei 111/06.....: R$ ' + Trim(StrCurr(CurrencyEdit18.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit19.Value > 0 then
   begin
     buffer := '           Lei 3761/02....: R$ ' + Trim(StrCurr(CurrencyEdit19.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit20.Value > 0 then
   begin
     buffer := '           Lei 590/82.....: R$ ' + Trim(StrCurr(CurrencyEdit20.Value, 14, True));
     Writeln(F, buffer);
   end;
   if CurrencyEdit21.Value > 0 then
   begin
     buffer := '           Total..........: R$ ' + Trim(StrCurr(CurrencyEdit21.Value, 14, True));
     Writeln(F, buffer);
   end;
   Writeln(F, '');
   Writeln(F, '');


//   buffer := '__________________________';
//   Writeln(F, buffer);

   buffer := F_Menu.Label25.Caption;
   Writeln(F, buffer);


   Writeln(F, '');
   Writeln(F, '');
   Writeln(F, '');
   Writeln(F, '');
   Writeln(F, '');
   Writeln(F, '');
   Writeln(F, '');
   Writeln(F, '');
   Writeln(F, '');
   Writeln(F, '');
   CloseFile(F);


end;

procedure TF_Calcul.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_Calcul.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then ComboBox5.SetFocus;
end;

end.

