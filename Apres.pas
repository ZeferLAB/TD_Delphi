unit Apres;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons;

type
  TF_Apres = class(TForm)
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Apres: TF_Apres;

implementation

{$R *.DFM}

procedure TF_Apres.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEDit2.setfocus;
end;

procedure TF_Apres.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEDit3.setfocus;
end;

procedure TF_Apres.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEDit4.setfocus;
end;

procedure TF_Apres.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEDit5.setfocus;
end;

procedure TF_Apres.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEDit6.setfocus;
end;

procedure TF_Apres.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEDit7.setfocus;
end;

procedure TF_Apres.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Bitbtn2.setfocus;
end;

procedure TF_Apres.FormActivate(Sender: TObject);
begin
  DBEdit1.setfocus;
end;

procedure TF_Apres.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bitbtn1.enabled := false;
  bitbtn3.enabled := false;
  bitbtn2.enabled := true;
end;

procedure TF_Apres.BitBtn2Click(Sender: TObject);
begin
//  if messagedlg('Confirma Gravação ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then tabela.td.post else tabela.td.cancel;
  bitbtn1.enabled := true;
  bitbtn2.enabled := false;
  bitbtn3.enabled := true;
  bitbtn3.setfocus;
end;

procedure TF_Apres.BitBtn1Click(Sender: TObject);
begin
  bitbtn1.enabled := False;
  bitbtn3.enabled := False;
  bitbtn2.enabled := true;
//  tabela.Td.edit;
  DBEdit1.setfocus;
end;

procedure TF_Apres.BitBtn3Click(Sender: TObject);
begin
  close;
end;

end.
