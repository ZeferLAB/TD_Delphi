unit Partes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls;

type
  TF_Partes = class(TForm)
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit7: TDBEdit;
    Label3: TLabel;
    DBEdit8: TDBEdit;
    BitBtn4: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Partes: TF_Partes;

implementation

uses Tabelas, Func, PSit, Exame;

{$R *.DFM}

procedure TF_Partes.BitBtn3Click(Sender: TObject);
begin
  close;
end;
Procedure Mostra_Partes(Reg : Integer);
Begin
  with F_Exame do
  begin
    tabela.td_pesso.go(reg);
    maskedit17.text := tabela.td_pesso.fieldbyname('nome').asstring;
    maskedit18.text := tabela.td_pesso.fieldbyname('endereco').asstring;
    maskedit19.text := tabela.td_pesso.fieldbyname('bairro').asstring;
    maskedit20.text := tabela.td_pesso.fieldbyname('cidade').asstring;
    maskedit21.text := tabela.td_pesso.fieldbyname('estado').asstring;
    maskedit22.text := tabela.td_pesso.fieldbyname('cep').asstring;
    maskedit23.text := tabela.td_pesso.fieldbyname('situacao').asstring;
    maskedit25.text := tabela.td_pesso.fieldbyname('e_mail').asstring;
  end;
end;
procedure TF_Partes.BitBtn2Click(Sender: TObject);
begin
  if messagedlg('Confirma Gravação ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if label1.caption = 'incluir' then
    begin
      tabela.td_pesso.FieldByName('data').asstring := tabela.td.fieldbyname('data_r').asstring;
      tabela.td_pesso.FieldByName('p_auxiliar').asstring := tabela.td.fieldbyname('p_auxiliar').asstring;
    end;
    tabela.td_pesso.post;
    f_Exame.ListBox1.Items.Add(copy(tabela.td_pesso.fieldbyname('nome').asstring,1,35) + ' - ' + tabela.td_pesso.fieldbyname('situacao').asstring);
    f_Exame.ListBox2.Items.Add(inttostr(tabela.td_pesso.recno));
    f_Exame.ListBox1.Update;
    f_Exame.ListBox2.Update;
    Mostra_partes(tabela.td_pesso.recno);

    if F_Exame.label43.caption = 'corrigir' then
      F_Partes.BitBtn4.Enabled := false;
    if F_Exame.label43.Caption = 'incluir'then
      F_Partes.BitBtn4.Enabled := true;
  end
  else
  Begin
    tabela.td_pesso.cancel;
    if label1.caption = 'incluir' then
    begin
      label1.caption := '';
      close;
    end;
  end;
  bitbtn1.enabled := true;
  bitbtn2.enabled := false;
  bitbtn3.enabled := true;
 // bitbtn4.enabled := true;
  bitbtn3.setfocus;
end;

procedure TF_Partes.BitBtn1Click(Sender: TObject);
begin
  bitbtn1.enabled := False;
  bitbtn3.enabled := False;
  bitbtn2.enabled := true;
  tabela.Td_Pesso.edit;
  DBEdit1.setfocus;
end;

procedure TF_Partes.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Dbedit2.setfocus;
end;

procedure TF_Partes.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Dbedit3.setfocus;
end;

procedure TF_Partes.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Dbedit4.setfocus;
end;

procedure TF_Partes.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Dbedit7.setfocus;
end;

procedure TF_Partes.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Bitbtn2.setfocus;
end;

procedure TF_Partes.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Dbedit5.setfocus;
end;

procedure TF_Partes.FormActivate(Sender: TObject);
begin
  DBEdit1.setfocus;
end;

procedure TF_Partes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bitbtn1.enabled := false;
  bitbtn3.enabled := false;
  bitbtn2.enabled := true;    
end;

procedure TF_Partes.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Dbedit8.setfocus;
end;

procedure TF_Partes.DBEdit8Exit(Sender: TObject);
begin
  Application.CreateForm(TF_PSit, F_PSit);
  Funcoes.Abre_Cad_SitClick(Funcoes);
  if tabela.td_pesso.fieldbyname('situacao').asstring <> '' then if not tabela.cad_sit.seek(tabela.td_pesso.fieldbyname('situacao').asstring) then tabela.cad_sit.gotop;
  F_PSit.Showmodal;
  tabela.td_pesso.fieldbyname('situacao').asstring := tabela.cad_sit.fieldbyname('codigo').asstring;
  Funcoes.Fecha_Cad_SitClick(Funcoes);
  F_PSit.destroy;
end;

procedure TF_Partes.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Dbedit6.setfocus;
end;

procedure TF_Partes.BitBtn4Click(Sender: TObject);
begin
  bitbtn1.enabled := False;
  bitbtn3.enabled := False;
  bitbtn2.enabled := true;
  tabela.Td_Pesso.append;
  DBEdit1.setfocus;
end;

end.



