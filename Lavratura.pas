unit Lavratura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls;

type
  TfrmLavratura = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    Label6: TLabel;
    RichEdit1: TRichEdit;
    BitBtn1: TBitBtn;
    lblDataProtocolo: TLabel;
    lblProtocolo: TLabel;
    lblOperacao: TLabel;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLavratura: TfrmLavratura;

implementation

uses DMTD, FuncGeral;

{$R *.DFM}

procedure TfrmLavratura.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TfrmLavratura.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TfrmLavratura.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TfrmLavratura.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TfrmLavratura.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then RichEdit1.SetFocus;
end;

procedure TfrmLavratura.BitBtn1Click(Sender: TObject);
begin
  if lblOperacao.Caption = 'INCLUIR' then
  begin
    DM.qryLavratura.Close;
    DM.qryLavratura.Sql.Clear;
    DM.qryLavratura.Sql.Add('INSERT INTO lavratura (data_protocolo, protocolo, data_lavratura, livro, folha, selo, termo, observacao) VALUES (');
    DM.qryLavratura.Sql.Add(#39 + ConvData(lblDataProtocolo.Caption) + #39 + ', ');
    DM.qryLavratura.Sql.Add(#39 + lblProtocolo.Caption + #39 + ', ');
    if ValidData(MaskEdit1.Text) then
      DM.qryLavratura.Sql.Add(#39 + ConvData(MaskEdit1.Text) + #39 + ', ')
    else
      DM.qryLavratura.Sql.Add('NULL, ');
    DM.qryLavratura.Sql.Add(#39 + MaskEdit2.Text + #39 + ', ');
    DM.qryLavratura.Sql.Add(#39 + MaskEdit3.Text + #39 + ', ');
    DM.qryLavratura.Sql.Add(#39 + MaskEdit4.Text + #39 + ', ');
    DM.qryLavratura.Sql.Add(#39 + MaskEdit5.Text + #39 + ', ');
    DM.qryLavratura.Sql.Add(#39 + RichEdit1.Text + #39 + ') ');
    DM.qryLavratura.ExecSQL;
  end;
  if lblOperacao.Caption = 'CORRIGIR' then
  begin
    DM.qryLavratura.Close;
    DM.qryLavratura.Sql.Clear;
    DM.qryLavratura.Sql.Add('UPDATE lavratura SET ');
    if ValidData(MaskEdit1.Text) then
      DM.qryLavratura.Sql.Add('data_lavratura = ' + #39 + ConvData(MaskEdit1.Text) + #39 + ', ')
    else
      DM.qryLavratura.Sql.Add('data_lavratura = NULL, ');
    DM.qryLavratura.Sql.Add('livro = '#39 + MaskEdit2.Text + #39 + ', ');
    DM.qryLavratura.Sql.Add('folha = '#39 + MaskEdit3.Text + #39 + ', ');
    DM.qryLavratura.Sql.Add('selo = '#39 + MaskEdit4.Text + #39 + ', ');
    DM.qryLavratura.Sql.Add('termo = '#39 + MaskEdit5.Text + #39 + ', ');
    DM.qryLavratura.Sql.Add('observacao = '#39 + RichEdit1.Text + #39);
    DM.qryLavratura.Sql.Add(' WHERE ');
    DM.qryLavratura.Sql.Add('data_protocolo = ' + #39 + ConvData(lblDataProtocolo.Caption) + #39);
    DM.qryLavratura.Sql.Add('AND protocolo = ' + #39 + lblProtocolo.Caption + #39);
    DM.qryLavratura.ExecSQL;
  end;
  Close;
end;

end.
