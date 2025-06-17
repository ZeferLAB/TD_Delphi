unit Res_Atos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, Mask, ExtCtrls, Printers, RDprint, RpCon,
  RpConDS, RpBase, RpSystem, RpDefine, RpRave;

type
  TF_ResAtos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    RvResumoAtos: TRvProject;
    SYSResumoAtos: TRvSystem;
    DSCResumoAtos: TRvDataSetConnection;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure MontaRave(campo1, Valor1, campo2: String; Valor2 : Currency);      
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ResAtos: TF_ResAtos;
  
implementation

uses Func, Menu, DMTD, FuncGeral;

{$R *.DFM}

Procedure TF_ResAtos.MontaRave(campo1, Valor1, campo2: String; Valor2 : Currency);
begin
  RvResumoAtos.SetParam(campo1, StrZero(Valor1, 4));
  RvResumoAtos.SetParam(campo2, FormatCurr('###,###,##0.00', Valor2));
end;

procedure TF_ResAtos.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TF_ResAtos.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    F_ResAtos.MaskEdit2.Text := F_ResAtos.MaskEdit1.Text;
    F_ResAtos.MaskEdit2.SetFocus;
  end;
  if key = 27 then close;
end;


procedure TF_ResAtos.BitBtn1Click(Sender: TObject);
var
  arq  : String;
  x    : Integer;
  flag : Boolean;
begin
  if (not ValidData(MaskEdit1.Text)) OR (not ValidData(MaskEdit2.Text)) then
  begin
    ShowMessage('Período Inválido');
    MaskEdit1.SetFocus;
    close;
    Exit;
  end;
  if StrToDateTime(MaskEdit1.Text) > StrToDateTime(MaskEdit2.Text) then
  begin
    ShowMessage('Período Inválido');
    MaskEdit1.SetFocus;
    close;
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT count(*) as qtde, portal, ');
  Dm.ArqAux.Sql.Add('sum(v_cartorio + vo_mic + vo_pag + vo_adc) oficial,');
  Dm.ArqAux.Sql.Add('sum(v_estado   + ve_mic + ve_pag + ve_adc) estado,');
  Dm.ArqAux.Sql.Add('sum(v_ipesp    + vi_mic + vi_pag + vi_adc) ipesp,');
  Dm.ArqAux.Sql.Add('sum(v_sinoreg  + vs_mic + vs_pag + vs_adc) sinoreg,');
  Dm.ArqAux.Sql.Add('sum(v_tribunal + vt_mic + vt_pag + vt_adc) tribunal,');
  Dm.ArqAux.Sql.Add('sum(v_total    + v_mic  + v_pag  + v_adc) total');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('GROUP BY portal');
  Dm.ArqAux.Sql.Add('ORDER BY portal');
  Dm.ArqAux.Open;

  if Dm.ArqAux.RecordCount = 0 then
  begin
    ShowMessage('Não Existem Registrados neste Período!');
    Dm.ArqAux.Close;
    MaskEdit1.SetFocus;
    Exit;
  end;

  RvResumoAtos.SetParam('Periodo', 'PERÍODO DE ' + F_ResAtos.MaskEdit1.Text + ' A ' + F_ResAtos.MaskEdit2.Text);

  // Preenchendo dados do Rave - TD 3 a 10
  Dm.ArqAux.FindFirst;
  for x := 3 to 10 do
  begin
    if not Dm.ArqAux.Locate(('portal'),x, []) then
      MontaRave(strzero(IntToSTr(x), 2), '', 'Val' + strzero(IntToStr(x), 2), 0)
    else
      MontaRave(strzero(IntToSTr(x), 2), Dm.ArqAux.FieldByName('qtde').AsString, 'Val' + strzero(IntToStr(x), 2), Dm.ArqAux.FieldByName('total').AsCurrency)
  end;

  
  // Certidões de Busca
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('SELECT count(*) as qtde, ');
  Dm.ArqAux1.Sql.Add('sum(custas) as custas');
  Dm.ArqAux1.Sql.Add('FROM certidao');
  Dm.ArqAux1.Sql.Add('WHERE');
  Dm.ArqAux1.Sql.Add('    data_cota >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND data_cota <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND (status   = "PRONTO"  or status   = "DEVOLVIDO PRONTO")');
  Dm.ArqAux1.Sql.Add('AND ext_nat like "%BUSCA%"');
  Dm.ArqAux1.Open;
  RvResumoAtos.SetParam('01', StrZero(Dm.ArqAux1.FieldByName('qtde').AsString, 4));
  RvResumoAtos.SetParam('Val01', FormatCurr('###,###,##0.00', Dm.ArqAux1.FieldByName('custas').AsCurrency));


  // Demais Certidões
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('SELECT count(*) as qtde, ');
  Dm.ArqAux1.Sql.Add('sum(custas) as custas');
  Dm.ArqAux1.Sql.Add('FROM certidao');
  Dm.ArqAux1.Sql.Add('WHERE');
  Dm.ArqAux1.Sql.Add('    data_cota >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND data_cota <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND (status   = "PRONTO"  or status   = "DEVOLVIDO PRONTO")');
  Dm.ArqAux1.Sql.Add('AND ext_nat not like "%BUSCA%"');
  Dm.ArqAux1.Open;

  
  RvResumoAtos.SetParam('02', StrZero(Dm.ArqAux1.FieldByName('qtde').AsString, 4));
  RvResumoAtos.SetParam('Val02', FormatCurr('###,###,##0.00', Dm.ArqAux1.FieldByName('custas').AsCurrency));


  RvResumoAtos.SetParam('Cartorio', F_Menu.Caption);
  RvResumoAtos.ExecuteReport('rptResumoAtos');

  
  showmessage('Fim da Impressão');
  Dm.ArqAux.Close;
  Dm.ArqAux1.Close;
  BitBtn2.SetFocus;
  BitBtn1.Enabled := FALSE;

end;



procedure TF_ResAtos.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    BitBtn1.Enabled := True;
    BitBtn1.setfocus;
  end;
end;

procedure TF_ResAtos.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
  MaskEdit1.Text  := DateToStr (now);
  MaskEdit2.Text  := DateToStr (now);
end;

procedure TF_ResAtos.BitBtn4Click(Sender: TObject);
begin
  MaskEdit1.SetFocus;
  BitBtn1.Enabled := FALSE;
  MaskEdit1.Text  := DateToStr (now);
  MaskEdit2.Text  := DateToStr (now);
end;

procedure TF_ResAtos.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    BitBtn1.Enabled := True;
    BitBtn1.setfocus;
  end;
end;

end.
