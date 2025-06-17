unit Monta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  WpParBrd, WpParPrp, WpPagPrp, WPDefs, WPPrint, WpWinCtr, WPRich, WPTbar,
  StdCtrls, Buttons;

type
  TF_Monta = class(TForm)
    WPRichText1: TWPRichText;
    WPRichText2: TWPRichText;
    WPRichText3: TWPRichText;
    WPPagePropDlg1: TWPPagePropDlg;
    WPPagePropDlg2: TWPPagePropDlg;
    WPPagePropDlg3: TWPPagePropDlg;
    WPParagraphPropDlg1: TWPParagraphPropDlg;
    WPParagraphPropDlg2: TWPParagraphPropDlg;
    WPParagraphPropDlg3: TWPParagraphPropDlg;
    WPParagraphBorderDlg1: TWPParagraphBorderDlg;
    WPParagraphBorderDlg2: TWPParagraphBorderDlg;
    WPParagraphBorderDlg3: TWPParagraphBorderDlg;
    WPToolBar1: TWPToolBar;
    WPRichText4: TWPRichText;
    WPPagePropDlg4: TWPPagePropDlg;
    WPParagraphPropDlg4: TWPParagraphPropDlg;
    WPParagraphBorderDlg4: TWPParagraphBorderDlg;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    RECPRE: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    REEMIPRE: TBitBtn;
    REC_CER: TBitBtn;
    REEPRE: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure Cabecalho(Sender : TObject; fic_imp : Integer; tipo : String);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RECPREClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure REEMIPREClick(Sender: TObject);
    procedure REC_CERClick(Sender: TObject);
    procedure REEPREClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Monta: TF_Monta;
  y, i     : Integer;
  Matriculas : string;

implementation

uses Func, Menu, DMTD, RecepC;

{$R *.DFM}


Function StrZero( ValorInteiro, Tamanho : Integer) : String;
begin
  if tamanho > 20 then ShowMessage('Tamanho máximo de 20 caracteres');
  result := '00000000000000000000' + IntToStr(ValorInteiro);
  result := Copy(result, length(result) - (tamanho - 1), tamanho);
end;

Procedure TF_Monta.Cabecalho(Sender : TObject; fic_imp : Integer; tipo : String);
var
  ficha : String;
begin
  if y = 4 then y := 1 else y := y + 1;
  WpRichText2.Clear;
  if (tipo = 'PESSOAL') then
  begin
    WpRichText2.LoadFromFile(F_Menu.Label10.Caption + 'MODREL\Fic2.RTF');
  end
  else WpRichText2.LoadFromFile(F_Menu.Label10.Caption + 'MODREL\Fic2I.RTF');
  ficha := StrZero(fic_imp,3);
  WpRichText2.Find('<numfic>',False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<numfic>',ficha);
  end;
  WpRichText2.Find('<nome>',False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    //WpRichText2.Finder.ReplaceAll('<nome>',TabSql.Pes_Imp2.FieldByName('nome').AsString);
  end;
  WpRichText2.Find('<doc2>',False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    //WpRichText2.Finder.ReplaceAll('<doc2>',TabSql.Pes_Imp2.FieldByName('rg').AsString);
  end;
  WpRichText2.Find('<doc1>',False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    //WpRichText2.Finder.ReplaceAll('<doc1>',TabSql.Pes_Imp2.FieldByName('cic_cgc').AsString);
  end;
  WpRichText2.Find('<aqui>',False);
  if WpRichText2.Finder.Found = True then
  begin
    WpRichText2.Finder.Clear;
    WpRichText2.Finder.ReplaceAll('<aqui>','    ');
  end;
  WpRichText2.Refresh;
end;

procedure TF_Monta.BitBtn2Click(Sender: TObject);
var
  nom, doc1, doc2 : String;
  num_fic, x : Integer;
  ato_f, seq_f, tip_f, mat_f  : String;
  liberado : Boolean;
begin
  WpRichText1.PrintDialog;
end;

procedure TF_Monta.FormActivate(Sender: TObject);
begin
 { if FindWindow('TF_Recep1', nil) <> 0 then
    RECPRECLICK(F_Monta);
  if FindWindow('TF_Reemi', nil)  <> 0 then
    REEMIPRECLICK(F_Monta);
  if FindWindow('TF_RecepC', nil) <> 0 then
    REC_CERCLICK(F_Monta);
  if FindWindow('TF_Reen', nil)  <> 0 then
    REEPRECLICK(F_Monta);}
  if f_menu.label28.caption = 'F_RECEP1' then RECPRECLICK(F_Monta);
  if f_menu.label28.caption = 'F_REEMI'  then REEMIPRECLICK(F_Monta);
  if f_menu.label28.caption = 'F_REEN'   then REEPRECLICK(F_Monta);
  if f_menu.label28.caption = 'F_RECEPC' then REC_CERCLICK(F_Monta);
end;

procedure TF_Monta.BitBtn1Click(Sender: TObject);
var
  nom, doc1, doc2 : String;
  num_fic, x : Integer;
  ato_f, seq_f, tip_f, mat_f  : String;
  liberado : Boolean;
begin
  WpRichText1.PrintDialog;
end;

procedure TF_Monta.BitBtn3Click(Sender: TObject);
var
  x : Integer;
begin
  WpRichText1.PrintDialog;
end;

procedure TF_Monta.RECPREClick(Sender: TObject);
begin
WpRichText1.ReadOnly := False;
  WpRichText1.Clear;
  WpRichText1.LoadFromFile(F_Menu.Label8.Caption + '\MODRECEP\recepN.RTF');
  WpRichText1.Refresh;
  WpRichText1.Find('<cartorio>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cartorio>', F_Menu.Label13.Caption + ' da Comarca de ' + F_Menu.Label14.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<endereco>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<endereco>', F_Menu.Label15.Caption + ' - ' + F_Menu.Label16.Caption + ' - ' + F_Menu.Label17.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<telefone>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<telefone>', F_Menu.Label18.Caption + ' - ' + F_Menu.Label19.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<oficial>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<oficial>', F_Menu.Label20.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cargo>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cargo>', F_Menu.Label21.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<horario>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<horario>', F_Menu.Label26.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<protocolo>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<protocolo>', F_RecepC.Label9.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<data_aponta>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<data_aponta>', F_RecepC.MaskEdit1.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<hora_aponta>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<hora_aponta>', FormatDateTime('HH:MM' , Now));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<tipo>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<tipo>', F_RecepC.ComboBox1.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<apresentante>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<apresentante>', apresentante);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<fone_apre>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<fone_apre>', F_RecepC.MaskEdit3.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<CPF>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<CPF>', F_RecepC.MaskEdit5.Text);
    WpRichText1.Refresh;
  end;
 WpRichText1.Find('<RG>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<RG>', F_RecepC.MaskEdit4.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<deposito>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<deposito>', F_RecepC.CurrencyEdit2.DisplayText);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<obs2>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<obs2>', F_RecepC.MaskEdit9.Text );
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<funcionario>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<funcionario>', F_Menu.Label1.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.MovePosition(WpmHome, False);
  WpRichText1.ReadOnly := True;
 end;
end;

procedure TF_Monta.BitBtn4Click(Sender: TObject);
begin
  WpRichText1.Print;
  Close;
end;

procedure TF_Monta.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Monta.REEMIPREClick(Sender: TObject);
Var
  dados : string;
begin

end;

procedure TF_Monta.REC_CERClick(Sender: TObject);
begin
  WpRichText1.ReadOnly := False;
  WpRichText1.Clear;
  if (F_Menu.Label25.Caption = '1') then
  begin
    WpRichText1.LoadFromFile(F_Menu.Label10.Caption + '\MODRECEP\RecCerM.RTF');
  end
  else WpRichText1.LoadFromFile(F_Menu.Label10.Caption + '\MODRECEP\Certidao.RTF');
  WpRichText1.Refresh;
  WpRichText1.Find('<cartorio>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cartorio>', F_Menu.Label13.Caption + ' da Comarca de ' + F_Menu.Label14.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<endereco>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<endereco>', F_Menu.Label15.Caption + ' - ' + F_Menu.Label16.Caption + ' - ' + F_Menu.Label17.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<telefone>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<telefone>', F_Menu.Label18.Caption + ' - ' + F_Menu.Label19.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<oficial>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<oficial>', F_Menu.Label20.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cargo>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cargo>', F_Menu.Label21.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<horario>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<horario>', F_Menu.Label26.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<protocolo>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<protocolo>', F_RecepC.Label9.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<data_aponta>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<data_aponta>', F_RecepC.MaskEdit1.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<hora_aponta>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<hora_aponta>', FormatDateTime('HH:MM' , Now));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<tipo>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<tipo>', F_RecepC.ComboBox1.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<apresentante>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<apresentante>', F_RecepC.MaskEdit2.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<fone_apre>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<fone_apre>', F_RecepC.MaskEdit3.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<proprietario>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<proprietario>', F_RecepC.MaskEdit11.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<CPF>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<CPF>', F_RecepC.MaskEdit5.Text);
    WpRichText1.Refresh;
  end;
 WpRichText1.Find('<RG>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<RG>', F_RecepC.MaskEdit4.Text);
    WpRichText1.Refresh;
  end;
  Matriculas := '';
  for i := 0 to (F_RecepC.ListBox1.Items.Count - 1) do
    Matriculas := Matriculas + F_RecepC.ListBox1.Items.Strings[i] + '/';
  WpRichText1.Find('<matriculas>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<matriculas>', Matriculas);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<deposito>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<deposito>', F_RecepC.CurrencyEdit2.DisplayText);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<obs1>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<obs1>', F_RecepC.MaskEdit7.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<obs2>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<obs2>', F_RecepC.MaskEdit9.Text );
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<obs3>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<obs3>', F_RecepC.MaskEdit10.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<registro>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<registro>', F_RecepC.MaskEdit8.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<funcionario>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<funcionario>', F_Menu.Label1.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.MovePosition(WpmHome, False);
  WpRichText1.ReadOnly := True;
  if (F_Menu.Label24.Caption <> '1') then WpRichText1.Print;
end;

procedure TF_Monta.REEPREClick(Sender: TObject);
begin

  WpRichText1.ReadOnly := False;
  WpRichText1.Clear;
  WPRichText1.LoadFromFile(F_Menu.Label10.Caption + 'MODRECEP\ReePreM.RTF');
  WpRichText1.Refresh;
  WpRichText1.Find('<cartorio>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cartorio>', F_Menu.Label13.Caption + ' da Comarca de ' + F_Menu.Label14.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<endereco>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<endereco>', F_Menu.Label15.Caption + ' - ' + F_Menu.Label16.Caption + ' - ' + F_Menu.Label17.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<telefone>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<telefone>', F_Menu.Label18.Caption + ' - ' + F_Menu.Label19.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<oficial>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<oficial>', F_Menu.Label20.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cargo>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cargo>', F_Menu.Label21.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<horario>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<horario>', F_Menu.Label26.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<protocolo>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<protocolo>', F_Reen.maskedit18.text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<data_aponta>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<data_aponta>', F_Reen.MaskEdit1.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<data_pren>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<data_pren>', F_Reen.MaskEdit19.Text);
    WpRichText1.Refresh;
  end;

  WpRichText1.Find('<hora_aponta>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<hora_aponta>', copy(FormatDateTime('HH:MM',Now),1,5));
    WpRichText1.Refresh;
  end;

  WpRichText1.Find('<tipo>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<tipo>', F_Reen.ComboBox1.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<apresentante>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<apresentante>', F_Reen.MaskEdit2.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<fone_apre>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<fone_apre>', F_Reen.MaskEdit3.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<parte1>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<parte1>', F_Reen.MaskEdit4.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<parte2>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<parte2>', F_Reen.MaskEdit6.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<deposito>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<deposito>', F_Reen.CurrencyEdit2.DisplayText);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<exige>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<exige>', F_Reen.MaskEdit9.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<registro>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<registro>', F_Reen.MaskEdit8.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<prenotacao>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<prenotacao>', F_Reen.MaskEdit10.Text);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<funcionario>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<funcionario>', F_Menu.Label1.Caption);
    WpRichText1.Refresh;
  end;
  WpRichText1.MovePosition(WpmHome, False);
  WpRichText1.ReadOnly := True;
  if (F_Menu.Label24.Caption <> '1') then WPRichText1.Print;

end;

end.


