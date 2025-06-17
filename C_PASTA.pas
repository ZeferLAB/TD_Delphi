unit c_pasta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  Tf_pasta = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel1: TBevel;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    Label6: TLabel;
    MaskEdit6: TMaskEdit;
    Label7: TLabel;
    MaskEdit7: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_pasta: Tf_pasta;

implementation

uses Tabelas, Func;

{$R *.DFM}
Function Def_Nat(Codigo : String) : String;
Begin
  Funcoes.Abre_Td_NatClick(Funcoes);
  if tabela.td_Nat.seek(codigo) then result := uppercase(tabela.td_Nat.fieldbyname('natureza').asstring) else result := '';
  Funcoes.Fecha_Td_NatClick(Funcoes);
end;

procedure Tf_pasta.BitBtn1Click(Sender: TObject);
begin

  close;
end;

procedure Tf_pasta.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

procedure Tf_pasta.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
pesq : string;
begin
  if key = 27 then close;
  if key = 13 then
  begin
    Funcoes.Abre_CertClick(Funcoes);
    Tabela.TD_Cert.SetOrder(7);
    pesq := copy('      ',1,6 - length(trim(MaskEdit1.Text))) + trim(MaskEdit1.Text);
    if Tabela.td_cert.Seek(pesq) = true then
    begin
      MaskEdit2.Text := Tabela.Td_cert.fieldbyname('pasta').AsString;
      MaskEdit3.Text := def_nat(Tabela.Td_cert.fieldbyname('natureza').AsString);
      MaskEdit4.Text := Tabela.Td_cert.fieldbyname('data_r').AsString;
      MaskEdit5.Text := Tabela.Td_cert.fieldbyname('data_p').AsString;
      MaskEdit6.Text := Tabela.Td_cert.fieldbyname('protocolo').AsString;
      MaskEdit7.Text := Tabela.Td_cert.fieldbyname('registro').AsString;
      if Tabela.Td_cert.fieldbyname('pasta').AsString = '' then MaskEdit2.SetFocus else bitbtn3.setfocus;
      bitbtn2.enabled := true;
    end
    else
    begin
      maskedit3.text := '';
      showmessage('Protocolo não localizado');
      maskedit1.setfocus;
    end;
  end;
end;

procedure Tf_pasta.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (MaskEdit2.Text <> '') then BitBtn2.SetFocus
   else if (MaskEdit2.Text = '') and (key = 13) then bitbtn3.SetFocus;
end;

procedure Tf_pasta.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn2.SetFocus;
end;

procedure Tf_pasta.BitBtn2Click(Sender: TObject);
var
 pesq : string;
begin
  while (Tabela.TD_Cert.Eof = false) and (Tabela.TD_Cert.fieldbyname('p_auxiliar').AsString = maskedit1.text) do
  begin
    Tabela.TD_Cert.Edit;
    Tabela.TD_Cert.fieldbyname('pasta').AsString := MaskEdit2.Text;
    Tabela.TD_Cert.Post;
    Tabela.TD_Cert.Next;
  end;
  Funcoes.Fecha_CertClick(Funcoes);
  bitbtn2.enabled := False;
  BitBtn3.SetFocus;
end;

procedure Tf_pasta.BitBtn3Click(Sender: TObject);
begin
  Funcoes.Fecha_CertClick(Funcoes);
  bitbtn2.enabled := False;
  maskedit1.text := '';
  maskedit2.text := '';
  maskedit3.text := '';
  maskedit4.text := '';
  maskedit5.text := '';
  maskedit6.text := '';
  maskedit7.text := '';
  maskedit1.setfocus;
end;

procedure Tf_pasta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Funcoes.Fecha_CertClick(Funcoes);
end;

end.
