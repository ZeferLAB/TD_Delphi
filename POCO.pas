unit POco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls;

type
  TF_POCO = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_POCO: TF_POCO;

implementation

Uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_POCO.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then
  begin
    Label2.Caption := '0';
    Close;
  end; 
  if key = 13 then
  begin
    Label2.Caption := Dm.Cad_Oco.FieldByName('codigo').asString;
    Close;
  end;
end;

procedure TF_POCO.FormActivate(Sender: TObject);
begin
  Dm.Cad_Oco.Close;
  Dm.Cad_Oco.Sql.Clear;
  Dm.Cad_Oco.Sql.Add('SELECT * FROM cad_oco');
  Dm.Cad_Oco.Sql.Add('ORDER BY codigo');
  Dm.Cad_Oco.Open;
  if (ValidNumero(Label2.Caption)) then
  begin
    Dm.Cad_Oco.Locate('codigo', IntToStr(StrToInt(Label2.Caption)), []);
  end;
  DbGrid1.SetFocus;
end;

procedure TF_POCO.FormDestroy(Sender: TObject);
begin
  Dm.Cad_Oco.Close;
end;

end.
