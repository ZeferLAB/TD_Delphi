unit U_GraficoEmolumentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Buttons, Db, DBTables, TeeProcs, TeEngine,
  Chart, DBChart, Series;

type
  TF_GraficoEmolumentos = class(TForm)
    Panel10: TPanel;
    Label37: TLabel;
    StatusBar1: TStatusBar;
    DBChart1: TDBChart;
    qryGrafico: TQuery;
    Ds_Grafico: TDataSource;
    BitBtn1: TBitBtn;
    EdAno: TEdit;
    Series1: TPieSeries;
    Label1: TLabel;
    DBChart2: TDBChart;
    Series2: TBarSeries;
    Label2: TLabel;
    qryTotalGeral: TQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure EdAnoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_GraficoEmolumentos: TF_GraficoEmolumentos;

implementation

{$R *.DFM}

procedure TF_GraficoEmolumentos.BitBtn1Click(Sender: TObject);
begin
  if (EdAno.Text = '') Then
  Begin
    Application.MessageBox('Campo: Exercício deve ser preenchido!', Pchar(F_GraficoEmolumentos.Caption), MB_OK + MB_ICONERROR);
    Abort;
  End
  Else
  Begin
    Label2.Caption:= 'Total Geral dos Emolumentos do Cartório: ';    
    qryGrafico.Close;
    qryGrafico.ParamByName('ano').AsInteger:= strtoint(EdAno.Text);
    qryGrafico.Open;

    qryTotalGeral.Close;
    qryTotalGeral.ParamByName('ano').AsInteger:= strtoint(EdAno.Text);
    qryTotalGeral.Open;

    Label2.Caption:= Label2.Caption + 'R$' + FormatFloat(',0.00', qryTotalGeral.FieldByName('Total_Emolumento').AsFloat);
    
  End;
end;

procedure TF_GraficoEmolumentos.EdAnoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 13 then
    BitBtn1.Click;
end;

end.
