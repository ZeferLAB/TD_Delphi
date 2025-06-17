unit PIrr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls;

type
  TF_PIRR = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PIRR: TF_PIRR;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_PIRR.FormActivate(Sender: TObject);
begin
  Dm.Cad_Ir.Close;
  Dm.Cad_Ir.Sql.Clear;
  Dm.Cad_Ir.Sql.Add('SELECT * FROM cad_ir');
  Dm.Cad_Ir.Sql.Add('ORDER BY motivo');
  Dm.Cad_Ir.Open;
  if (ValidNumero(Label2.Caption)) then
  begin
    Dm.Cad_Ir.Locate('codigo', IntToStr(StrToInt(Label2.Caption)), []);
  end;
  DbGrid1.SetFocus;
end;

procedure TF_PIRR.FormDestroy(Sender: TObject);
begin
  Dm.Cad_Ir.Close;
end;

procedure TF_PIRR.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then
  begin
    Label2.Caption := '0';
    Close;
  end; 
  if key = 13 then
  begin
    Label2.Caption := Dm.Cad_Ir.FieldByName('codigo').asString;
    Close;
  end;  
end;

end.
