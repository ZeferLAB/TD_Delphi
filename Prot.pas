unit Prot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids;

type
  TF_Prot = class(TForm)
    Label2: TLabel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    procedure ListBox1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Prot: TF_Prot;

implementation

uses DMTD, ExameC, Exame, Menu, USelos;

{$R *.DFM}

procedure TF_Prot.ListBox1Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Prot.FormActivate(Sender: TObject);
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  if (Label1.Caption = 'C') then
  begin
    Dm.ArqAux.Sql.Add('SELECT movimento data, nr_protoc protocolo FROM certidao');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('status = "EM PROCESSO"');
    Dm.ArqAux.sql.add('and cartorio = "' + F_Menu.Label37.Caption + '"');
    Dm.ArqAux.Sql.Add('ORDER BY movimento, nr_protoc');
  end;
  if (Label1.Caption = 'T') then
  begin
    Dm.ArqAux.Sql.Add('SELECT data_r data , p_auxiliar protocolo FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('   status = "EM PROCESSO"');
    Dm.ArqAux.Sql.Add('OR status = "RECEPCAO"');
    dm.ArqAux.sql.add('and cartorio = "' + F_Menu.Label37.Caption + '"');
    Dm.ArqAux.Sql.Add('ORDER BY data_r, p_auxiliar');
  end;
  if (Label1.Caption = 'R') then
  begin
    Dm.ArqAux.Sql.Add('SELECT data_r data , protocolo FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('status = "PRONTO"');
    dm.ArqAux.sql.add('and cartorio = "' + F_Menu.Label37.Caption + '"');
    Dm.ArqAux.Sql.Add('ORDER BY data_r, protocolo');
  end;
  Dm.ArqAux.Open;
end;

procedure TF_Prot.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
  if key = 13 then
  begin
    if (Label1.Caption = 'C') then F_ExameC.MaskEdit1.Text := Dm.ArqAux.FieldByName('protocolo').asString;
    if (Label1.Caption = 'T') then F_Exame.MaskEdit1.Text  := Dm.ArqAux.FieldByName('protocolo').asString;
    if (label1.Caption = 'R') then F_Selos.MaskEdit1.Text  := Dm.ArqAux.FieldByName('protocolo').asString;
    Close;
  end;
end;

procedure TF_Prot.FormDestroy(Sender: TObject);
begin
  Dm.ArqAux.Close;
end;

procedure TF_Prot.DBGrid1DblClick(Sender: TObject);
begin
  if (Label1.Caption = 'C') then F_ExameC.MaskEdit1.Text := Dm.ArqAux.FieldByName('protocolo').asString;
  if (Label1.Caption = 'T') then F_Exame.MaskEdit1.Text  := Dm.ArqAux.FieldByName('protocolo').asString;
  if (label1.Caption = 'R') then F_Selos.MaskEdit1.Text  := Dm.ArqAux.FieldByName('protocolo').asString;
  Close;
end;

end.
