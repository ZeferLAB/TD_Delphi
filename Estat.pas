unit Estat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, jpeg;

type
  TF_Estat = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel2: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label22: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Estat: TF_Estat;

implementation

uses Menu, DMTD, QkEstat, FuncGeral;

{$R *.DFM}

procedure TF_Estat.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TF_Estat.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_Estat.BitBtn1Click(Sender: TObject);
var
  texto : String;
  x : Integer;
begin
  for x := 1 to 3 do
  begin
    if (x = 1) then // Acumulando Notificação AR
    begin
      texto := '';
      texto := 'AND natureza = 197';
    end
    else if (x = 2) then
    begin
      texto := '';
      texto := 'AND natureza = 96';
    end
    else if (x = 3) then
    begin
      texto := '';
      texto := 'AND natureza not in("197","96")';
    end;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT COUNT(*) qde,');
    Dm.ArqAux.Sql.Add('SUM(v_cartorio + vo_mic + vo_pag + vo_adc) oficial,');
    Dm.ArqAux.Sql.Add('SUM(v_estado   + ve_mic + ve_pag + ve_adc) estado,');
    Dm.ArqAux.Sql.Add('SUM(v_ipesp    + vi_mic + vi_pag + vi_adc) ipesp,');
    Dm.ArqAux.Sql.Add('SUM(v_sinoreg  + vs_mic + vs_pag + vs_adc) sinoreg,');
    Dm.ArqAux.Sql.Add('SUM(v_tribunal + vt_mic + vt_pag + vt_adc) tribunal,');
    Dm.ArqAux.Sql.Add('SUM(v_total    + v_mic  + v_pag  + v_adc) total');
    Dm.ArqAux.Sql.Add('FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
    Dm.ArqAux.Sql.Add(texto);
    Dm.ArqAux.Open;
    if (x = 1) then Label6.Caption := Dm.ArqAux.FieldByName('qde').asString;
    if (x = 2) then Label4.Caption := Dm.ArqAux.FieldByName('qde').asString;
    if (x = 3) then Label7.Caption := Dm.ArqAux.FieldByName('qde').asString;
    Label16.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label16.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('oficial').asCurrency), 14, True);
    Label17.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label17.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('estado').asCurrency), 14, True);
    Label18.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label18.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('ipesp').asCurrency), 14, True);
    Label19.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label19.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('sinoreg').asCurrency), 14, True);
    Label20.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label20.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('tribunal').asCurrency), 14, True);
    Label21.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label21.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('total').asCurrency), 14, True);
    Dm.ArqAux.Close;
  end;
  //Buscando Certidões
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT COUNT(*) qde,');
  Dm.ArqAux.Sql.Add('SUM(oficial)  oficial,');
  Dm.ArqAux.Sql.Add('SUM(estado)   estado,');
  Dm.ArqAux.Sql.Add('SUM(ipesp)    ipesp,');
  Dm.ArqAux.Sql.Add('SUM(sinoreg)  sinoreg,');
  Dm.ArqAux.Sql.Add('SUM(tribunal) tribunal,');
  Dm.ArqAux.Sql.Add('SUM(custas)    total');
  Dm.ArqAux.Sql.Add('FROM certidao');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    entrega >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('AND entrega <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('AND divisor not in (6, 7, 8)');
  Dm.ArqAux.Sql.Add('AND status   = "DEVOLVIDO PRONTO"');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    Label9.Caption := Dm.ArqAux.FieldByName('qde').asString;
    Label16.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label16.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('oficial').asCurrency), 14, True);
    Label17.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label17.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('estado').asCurrency), 14, True);
    Label18.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label18.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('ipesp').asCurrency), 14, True);
    Label19.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label19.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('sinoreg').asCurrency), 14, True);
    Label20.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label20.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('tribunal').asCurrency), 14, True);
    Label21.Caption := 'R$' + StrCurr((StrToCurr(TirarTudo(Label21.Caption, '.','R$','')) + Dm.ArqAux.FieldByName('total').asCurrency), 14, True);
  end;
  Dm.ArqAux.Close;
  BitBtn4.Enabled := True;
end;

procedure TF_Estat.BitBtn3Click(Sender: TObject);
begin
  MaskEdit1.Text  := '';
  MaskEdit2.Text  := '';
  Label6.Caption  := '000000';
  Label4.Caption  := '000000';
  Label7.Caption  := '000000';
  Label9.Caption  := '000000';
  Label16.Caption := 'R$ 0,00';
  Label17.Caption := 'R$ 0,00';
  Label18.Caption := 'R$ 0,00';
  Label19.Caption := 'R$ 0,00';
  Label20.Caption := 'R$ 0,00';
  Label21.Caption := 'R$ 0,00';
  BitBtn4.Enabled := False;  
  MaskEdit1.SetFocus;
end;

procedure TF_Estat.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

procedure TF_Estat.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Estat.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_Estat.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TQk_Estat, Qk_Estat);
  Qk_Estat.QrLabel1.Caption  := F_Menu.Caption;
  Qk_Estat.QrLabel2.Caption  := 'ESTATÍSTICA DE REGISTRO DE TÍTULOS NO PERÍODO DE ' + MaskEdit1.Text + ' ATÉ ' + MaskEdit2.Text + '.';
  Qk_Estat.QrLabel7.Caption  := Label6.Caption;
  Qk_Estat.QrLabel8.Caption  := Label4.Caption;
  Qk_Estat.QrLabel9.Caption  := Label7.Caption;
  Qk_Estat.QrLabel10.Caption := Label9.Caption;
  Qk_Estat.QrLabel17.Caption := Label16.Caption;
  Qk_Estat.QrLabel18.Caption := Label17.Caption;
  Qk_Estat.QrLabel19.Caption := Label18.Caption;
  Qk_Estat.QrLabel20.Caption := Label19.Caption;
  Qk_Estat.QrLabel21.Caption := Label20.Caption;
  Qk_Estat.QrLabel22.Caption := Label21.Caption;   
  Qk_Estat.QuickRep1.Preview;
  Qk_Estat.Destroy;
  Qk_Estat := NIL;
end;

end.


