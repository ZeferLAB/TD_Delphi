unit ImpOFN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  WPDefs, WPPrint, WpWinCtr, WPRich, StdCtrls, Buttons;

type
  TF_ImpOFN = class(TForm)
    WPRichText1: TWPRichText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ImpOFN: TF_ImpOFN;

implementation

uses Menu, DMTD, FuncGeral;

{$R *.DFM}

procedure TF_ImpOFN.FormActivate(Sender: TObject);
begin
  WpRichText1.Clear;
  WpRichText1.LoadFromFile(F_Menu.Label16.Caption + 'OficioN.RTF');
  WpRichText1.Refresh;
  WpRichText1.Find('<num_ofi>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<num_ofi>', Dm.Notifica.FieldByName('n_oficio').asString);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<data>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<data>', F_Menu.Label7.Caption + ', ' + FormatDateTime('dd " de " mmmm " de " yyyy', Dm.Notifica.FieldByName('data_of').asDateTime) + '.');
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<protocolo>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<protocolo>', Dm.Notifica.FieldByName('protocolo1').asString);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<destinatario>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<destinatario>', Busca_NomePessoal(Dm.Notifica.FieldByName('pauxiliar1').asString, 'D'));
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<cartorio solicitante>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<cartorio solicitante>', Dm.Notifica.FieldByName('nom_cart').asString);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<a/c>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<a/c>', Dm.Notifica.FieldByName('ac_nome').asString);
    WpRichText1.Refresh;
  end;
  WpRichText1.Find('<endereco>', False);
  if WpRichText1.Finder.Found = True then
  begin
    WpRichText1.Finder.Clear;
    WpRichText1.Finder.ReplaceAll('<endereco>', Dm.Notifica.FieldByName('end_cart').asString);
    WpRichText1.Refresh;
  end;
  WpRichText1.MovePosition(WPMHome, False);
end;

procedure TF_ImpOFN.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ImpOFN.BitBtn1Click(Sender: TObject);
begin
  WpRichText1.PrintDialog;
end;

end.
