unit U_ExcluC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons;

type
  TF_ExcluC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    MaskEdit1: TMaskEdit;
    Bevel2: TBevel;
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ExcluC: TF_ExcluC;

implementation

uses Func, Tabelas;

{$R *.DFM}

procedure TF_ExcluC.BitBtn1Click(Sender: TObject);
Var
Prot : String;
begin
  prot := '      ' + maskedit1.text;
  prot := copy(prot, length(prot) - 5, 6);
  Funcoes.Abre_CertidaoClick(Funcoes);
  tabela.Certidao.setorder(1);
  if not tabela.certidao.Seek(prot) then
  Begin
    Funcoes.Fecha_CertidaoClick(Funcoes);
    showmessage('Protocolo não Localizado');
    maskedit1.setfocus;
    exit;
  end;
  if MessageBox(Handle,PChar('Confirma exclusão do protocolo ' + maskedit1.text +'?'),'Excluir',MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  Tabela.certidao.delete;
  Funcoes.Fecha_CertidaoClick(Funcoes);
  MessageBox(Handle,PChar('Protocolo excluído com sucesso!!.'),'Exclusão Certidão',MB_OK + MB_ICONWARNING);
  bitbtn2.setfocus;



end;

procedure TF_ExcluC.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = 13 then bitbtn1.setfocus;
end;

procedure TF_ExcluC.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TF_ExcluC.FormActivate(Sender: TObject);
begin
 maskedit1.setfocus;
end;

end.
