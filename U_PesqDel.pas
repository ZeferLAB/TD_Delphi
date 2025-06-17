unit U_PesqDel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls, jpeg;

type
  TF_PesqDel = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    ControlBar1: TControlBar;
    Label36: TLabel;
    cbEscrevente: TComboBox;
    Label20: TLabel;
    GroupBox1: TGroupBox;
    RadDataNotificacao: TRadioButton;
    RadEscrevente: TRadioButton;
    RadPeriodo: TRadioButton;
    Label1: TLabel;
    EdDataInicial: TMaskEdit;
    Label3: TLabel;
    EdDataFinal: TMaskEdit;
    Label4: TLabel;
    cbStatus: TComboBox;
    RadStatus: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure RadDataNotificacaoClick(Sender: TObject);
    procedure RadEscreventeClick(Sender: TObject);
    procedure RadPeriodoClick(Sender: TObject);
    procedure cbEscreventeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbStatusKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdDataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdDataFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadStatusClick(Sender: TObject);
    function RetornaTipoDoStatus(Texto: String): String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PesqDel: TF_PesqDel;

implementation

uses DMTD, Menu, QK_PesDel, FuncGeral;

{$R *.DFM}

procedure TF_PesqDel.BitBtn1Click(Sender: TObject);
begin

  if RadDataNotificacao.Checked Then
  Begin

    if MaskEdit1.Text = '  /  /    ' Then
    Begin
      ShowMessage('Data deve ser informada!');
      Abort;
    End;

    DM.Td_Pesso.close;
    DM.Td_Pesso.Sql.Clear;
    DM.Td_Pesso.Sql.add('select data,data_not1, data_not2, data_not3, nome, protocolo from td_pesso where (data_not1 = ' + Chr(39) + ConvData(maskedit1.text) + Chr(39) + ' or data_not2 = ' + Chr(39) + convdata(maskedit1.text) + Chr(39) + ' or data_not3 = ' + Chr(39) + maskedit1.text + Chr(39) + ') order by protocolo');
    StatusBar1.Panels.Items[0].Text := '..Aguarde enquanto é realizada a pesquisa';
    StatusBar1.Refresh;
    DM.TD_pesso.open;

    if DM.TD_pesso.RecordCount = 0 then
    Begin
      Showmessage('Movimento não encontrado!');
      exit;
    End;
  End;

  if RadEscrevente.Checked Then
  Begin

    if cbEscrevente.Text = '' Then
    Begin
      ShowMessage('Escrevente deve ser informado!');
      Abort;
    End;

    DM.Td_Pesso.close;
    DM.Td_Pesso.Sql.Clear;
    DM.Td_Pesso.Sql.add('select data,data_not1, data_not2, data_not3, nome, protocolo from td_pesso where notificador = '+QuotedStr(cbEscrevente.Text)+' order by protocolo');
    StatusBar1.Panels.Items[0].Text := '..Aguarde enquanto é realizada a pesquisa';
    StatusBar1.Refresh;
    DM.TD_pesso.open;

    if DM.TD_pesso.RecordCount = 0 then
    Begin
      Showmessage('Movimento não encontrado!');
      exit;
    End;
  End;

  if RadStatus.Checked Then
  Begin

    if cbStatus.Text = '' Then
    Begin
      ShowMessage('Status deve ser informado!');
      Abort;
    End;

    DM.Td_Pesso.close;
    DM.Td_Pesso.Sql.Clear;
    DM.Td_Pesso.Sql.add('select b.data, b.data_not1, b.data_not2, b.data_not3, b.nome, b.protocolo from td_pesso b INNER JOIN td a ON (a.protocolo = b.protocolo) where b.sit_not1 = '+QuotedStr(RetornaTipoDoStatus(cbStatus.Text))+' or '+
    ' b.sit_not2 = '+QuotedStr(RetornaTipoDoStatus(cbStatus.Text))+' or b.sit_not3 = '+QuotedStr(RetornaTipoDoStatus(cbStatus.Text))+' order by protocolo');
    StatusBar1.Panels.Items[0].Text := '..Aguarde enquanto é realizada a pesquisa';
    StatusBar1.Refresh;
    DM.TD_pesso.open;

    if DM.TD_pesso.RecordCount = 0 then
    Begin
      Showmessage('Movimento não encontrado!');
      exit;
    End;
  End;


  if RadPeriodo.Checked Then
  Begin

    if EdDataInicial.Text = '  /  /    ' Then
    Begin
      ShowMessage('Data de Inicio deve ser informada!');
      Abort;
    End;

    if EdDataFinal.Text = '  /  /    ' Then
    Begin
      ShowMessage('Data de Término deve ser informado!');
      Abort;
    End;


    DM.Td_Pesso.close;
    DM.Td_Pesso.Sql.Clear;
    DM.Td_Pesso.Sql.add('select data,data_not1, data_not2, data_not3, nome, protocolo from td_pesso where (data_not1 >= ' + Chr(39) + ConvData(EdDataInicial.text) + Chr(39) + ' or data_not2 >= ' + Chr(39) + convdata(EdDataInicial.text) + Chr(39) + ' or data_not3 >= ' + Chr(39) + EdDataInicial.text + Chr(39) + ') and '+
    ' (data_not1 <= ' + Chr(39) + ConvData(EdDataFinal.text) + Chr(39) + ' or data_not2 <= ' + Chr(39) + convdata(EdDataFinal.text) + Chr(39) + ' or data_not3 <= ' + Chr(39) + EdDataFinal.text + Chr(39) + ') order by protocolo');
    StatusBar1.Panels.Items[0].Text := '..Aguarde enquanto é realizada a pesquisa';
    StatusBar1.Refresh;
    DM.TD_pesso.open;

    if DM.TD_pesso.RecordCount = 0 then
    Begin
      Showmessage('Movimento não encontrado!');
      exit;
    End;
  End;

  bitbtn1.enabled := false;
  Application.CreateForm(TF_QPesDel, F_QPesDel);
  StatusBar1.Panels.Items[0].Text := 'Preparando relatório';
  F_QPesDel.QuickRep1.prepare;
  F_QPesDel.QuickRep1.preview;
  F_QPesDel.Destroy;
  StatusBar1.Panels.Items[0].Text := 'Digite o movimento desejado';
  StatusBar1.Refresh;
  bitbtn1.Enabled := true;
  DM.TD_pesso.Close;
  DM.ArqAux.Close;

end;

procedure TF_PesqDel.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TF_PesqDel.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 Begin
  bitbtn1.enabled := true;
  bitbtn1.setfocus;
 end;
end;

procedure TF_PesqDel.FormActivate(Sender: TObject);
begin
 //maskedit1.setfocus;

  dm.cad_not.close;
  dm.cad_not.sql.clear;
  dm.cad_not.sql.add('select * from cad_not');
  dm.cad_not.open;
  cbEscrevente.Clear;
  dm.cad_not.First;

  while not dm.cad_not.eof do
  begin
    cbEscrevente.Items.add(dm.cad_not.FieldByName('nome').AsString);
    dm.cad_not.Next;
  end;


  dm.Cad_Ir.close;
  dm.cad_ir.sql.clear;
  dm.cad_ir.sql.add('select * from cad_ir');
  dm.Cad_Ir.open;
  cbStatus.Clear;
  dm.Cad_Ir.First;
  while not dm.Cad_Ir.eof do
  begin
    cbStatus.Items.add(dm.Cad_Ir.FieldByName('motivo').AsString);
    dm.Cad_Ir.Next;
  end;



end;

procedure TF_PesqDel.RadDataNotificacaoClick(Sender: TObject);
begin
  MaskEdit1.Enabled    := True;
  cbEscrevente.Enabled := False;
  EdDataInicial.Enabled:= False;
  EdDataFinal.Enabled  := False;
  CbStatus.Enabled     := False;
end;

procedure TF_PesqDel.RadEscreventeClick(Sender: TObject);
begin
  MaskEdit1.Enabled    := False;
  cbEscrevente.Enabled := True;
  EdDataInicial.Enabled:= True;
  EdDataFinal.Enabled  := True;
  CbStatus.Enabled     := False;

end;

procedure TF_PesqDel.RadPeriodoClick(Sender: TObject);
begin
  MaskEdit1.Enabled    := False;
  cbEscrevente.Enabled := False;
  CbStatus.Enabled     := False;  
  EdDataInicial.Enabled:= True;
  EdDataFinal.Enabled  := True;
end;

procedure TF_PesqDel.cbEscreventeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 Begin
  bitbtn1.enabled := true;
  bitbtn1.setfocus;
 end;
end;

procedure TF_PesqDel.cbStatusKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 Begin
  bitbtn1.enabled := true;
  bitbtn1.setfocus;
 end;

end;

procedure TF_PesqDel.EdDataInicialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 Begin
  EdDataFinal.setfocus;
 end;

end;

procedure TF_PesqDel.EdDataFinalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 Begin
  bitbtn1.enabled := true;
  bitbtn1.setfocus;
 end;

end;

procedure TF_PesqDel.RadStatusClick(Sender: TObject);
begin
  MaskEdit1.Enabled    := False;
  cbEscrevente.Enabled := False;
  CbStatus.Enabled     := True;
  EdDataInicial.Enabled:= True;
  EdDataFinal.Enabled  := True;
end;

function TF_PesqDel.RetornaTipoDoStatus(Texto: String): String;
begin
  Result:= '';
  dm.Cad_Ir.close;
  dm.cad_ir.sql.clear;
  dm.cad_ir.sql.add('select * from cad_ir where motivo = ' + QuotedStr(Texto));
  dm.Cad_Ir.open;
  Result:=dm.cad_ir.FieldByName('tipo').AsString;
end;

end.


