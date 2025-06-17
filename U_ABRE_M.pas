unit u_abre_m;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask;

type
  Tf_abre_m = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_abre_m: Tf_abre_m;

implementation

uses U_Editor, DMTD;

{$R *.DFM}

procedure Tf_abre_m.BitBtn1Click(Sender: TObject);
begin
  Label1.Caption := 'cancelou';
  close;
end;

procedure Tf_abre_m.DBGrid1DblClick(Sender: TObject);
begin
  label1.caption := 'normal';
  close;
end;

procedure Tf_abre_m.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    label1.caption := 'normal';
    close;
  end;
end;

procedure TF_Abre_M.FormActivate(Sender: TObject);
begin
  Dm.Modelos.Close;
  Dm.Modelos.Sql.Clear;
  Dm.Modelos.Sql.Add('SELECT * FROM modelos');
  Dm.Modelos.Sql.Add('ORDER BY tipo, nome');
  Dm.Modelos.Open; 
end;

procedure Tf_abre_m.FormDestroy(Sender: TObject);
begin
  Dm.Modelos.Close;
end;

procedure Tf_abre_m.MaskEdit1Change(Sender: TObject);
var
  scope : string;
begin
  scope := trim(MaskEdit1.text);
  Dm.Modelos.Close;
  Dm.Modelos.Sql.Clear;
  Dm.Modelos.Sql.Add('SELECT * FROM modelos');
  Dm.Modelos.Sql.Add('WHERE');
  Dm.Modelos.Sql.Add('nome like ' + Chr(39) + scope + '%' + Chr(39));
  Dm.Modelos.Sql.Add('ORDER BY tipo, nome');
  Dm.Modelos.Open;
end;

end.
