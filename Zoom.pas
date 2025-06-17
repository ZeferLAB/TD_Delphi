unit Zoom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, AxCtrls, OleCtrls, DbOleCtl, ImgeditLibCtl_TLB, StdCtrls, Buttons;

type
  TF_Zoom = class(TForm)
    ImgEdit1: TImgEdit;
    PopupMenu1: TPopupMenu;
    Zoom1: TMenuItem;
    Zoom2: TMenuItem;
    Altura1: TMenuItem;
    Largura1: TMenuItem;
    Imprimir1: TMenuItem;
    Fechar1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure Zoom1Click(Sender: TObject);
    procedure Zoom2Click(Sender: TObject);
    procedure Altura1Click(Sender: TObject);
    procedure Largura1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Zoom: TF_Zoom;

implementation

uses Menu, DigDup2;

{$R *.DFM}


function TiraPorcento( stringa : string ):string;
var
  xx : integer;
begin
  result := '';
  for xx := 1 to length(stringa) do
  begin
    if copy(stringa,xx,1) = '%' then
    begin
      result := result + '';
    end
    else
    begin
      result := result + copy(stringa,xx,1);
    end;
  end;
end;


procedure TF_Zoom.Zoom1Click(Sender: TObject);
begin
  imgedit1.zoom := imgedit1.zoom + 5;
end;

procedure TF_Zoom.Zoom2Click(Sender: TObject);
begin
  imgedit1.zoom := imgedit1.zoom - 5;
end;

procedure TF_Zoom.Altura1Click(Sender: TObject);
begin
  imgedit1.fitto(2,true);
end;

procedure TF_Zoom.Largura1Click(Sender: TObject);
begin
  imgedit1.fitto(1,true);
end;

procedure TF_Zoom.Imprimir1Click(Sender: TObject);
begin
  ImgEdit1.PrintImage(1, 1, 1, false, 0, 0, 0);
end;

procedure TF_Zoom.Fechar1Click(Sender: TObject);
begin
  close;
end;

procedure TF_Zoom.FormActivate(Sender: TObject);
begin
  imgedit1.display;
  imgedit1.fitto(1,true);
end;

procedure TF_Zoom.BitBtn1Click(Sender: TObject);
begin
  if F_zoom.Label1.Caption = 'SIMPLEX' then
  begin
    andar(F_Zoom.ImgEdit1.Image, '-');
    F_Zoom.Label2.Caption := F_DigDup2.Label2.Caption;
    F_Zoom.Label4.Caption := F_DigDup2.Label4.Caption;
    F_zoom.imgedit1.Image := F_DigDup2.imgedit1.image;
  end
  else
  begin
    andar(F_Zoom.ImgEdit1.Image, '-');
    F_Zoom.Label2.Caption := F_DigDup2.Label2.Caption;
    F_Zoom.Label4.Caption := F_DigDup2.Label4.Caption;
    F_zoom.imgedit1.Image := F_DigDup2.imgedit1.image;
  end;
  F_zoom.imgedit1.display;
  F_zoom.imgedit1.fitto(1,true);
  F_zoom.imgedit1.Zoom := StrToInt(Copy(TiraPorcento(ComboBox1.Text), 1, 3));
end;

procedure TF_Zoom.BitBtn2Click(Sender: TObject);
begin
  if F_zoom.Label1.Caption = 'SIMPLEX' then
  begin
    andar(F_Zoom.ImgEdit1.Image, '+');
    F_Zoom.Label2.Caption := F_DigDup2.Label2.Caption;
    F_Zoom.Label4.Caption := F_DigDup2.Label4.Caption;
    F_zoom.imgedit1.Image := F_DigDup2.imgedit1.image;
  end
  else
  begin
    andar(F_Zoom.ImgEdit1.Image, '+');
    F_Zoom.Label2.Caption := F_DigDup2.Label2.Caption;
    F_Zoom.Label4.Caption := F_DigDup2.Label4.Caption;
    F_zoom.imgedit1.Image := F_DigDup2.imgedit1.image;
  end;
  F_zoom.imgedit1.display;
  F_zoom.imgedit1.fitto(1,true);
  F_zoom.imgedit1.Zoom := StrToInt(Copy(TiraPorcento(ComboBox1.Text), 1, 3));
end;

procedure TF_Zoom.BitBtn3Click(Sender: TObject);
begin
  Close;
end;


procedure TF_Zoom.ComboBox1Change(Sender: TObject);
begin
  F_zoom.imgedit1.Zoom := StrToInt(Copy(TiraPorcento(ComboBox1.Text), 1, 3));
end;

end.
