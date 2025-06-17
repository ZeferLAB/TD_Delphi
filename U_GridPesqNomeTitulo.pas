unit U_GridPesqNomeTitulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, ExtCtrls, ComCtrls, Db, DBTables, Buttons,
  jpeg;

type
  TF_GridPesqNomeTitulo = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    DBGrid3: TDBGrid;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    qryGenerico: TQuery;
    Dts_Generico: TDataSource;
    SpeedButton2: TSpeedButton;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_GridPesqNomeTitulo: TF_GridPesqNomeTitulo;

implementation

uses Pesq, DMTD;

{$R *.DFM}

procedure TF_GridPesqNomeTitulo.FormShow(Sender: TObject);
begin
  qryGenerico.Close;
  qryGenerico.Sql.Clear;
  qryGenerico.Sql.Add('SELECT p_auxiliar, nome FROM td_pesso where p_auxiliar <> "1" LIMIT 50');
  qryGenerico.Open;

end;

procedure TF_GridPesqNomeTitulo.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_GridPesqNomeTitulo.MaskEdit1Change(Sender: TObject);
begin
  if MaskEdit1.Text <> '' Then
  Begin
    qryGenerico.Close;
    qryGenerico.SQL.Clear;
    qryGenerico.SQL.Add('SELECT p_auxiliar, nome FROM td_pesso where nome like '+QuotedStr(MaskEdit1.Text+'%')+' and nome <> "" and nome <> "," ');
    qryGenerico.SQL.Add('group by nome order by nome ');
    qryGenerico.SQL.Text;
    qryGenerico.Open;
  End;
end;

procedure TF_GridPesqNomeTitulo.MaskEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    F_Pesq.MaskEdit1.Text:= qryGenerico.FieldByName('nome').AsString;
    DBGrid3.SetFocus;
  end;

end;

procedure TF_GridPesqNomeTitulo.DBGrid3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    Close;
end;

end.
