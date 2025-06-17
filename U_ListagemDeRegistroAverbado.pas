unit U_ListagemDeRegistroAverbado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Db, DBTables, StdCtrls, Buttons, Mask, Grids, DBGrids;

type
  TF_ListagemDeRegistroAverbado = class(TForm)
    Label5: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Rd_DataRecepcao: TRadioButton;
    Rd_DataBaixa: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    qryRelatorio: TQuery;
    DsRelatorio: TDataSource;
    StatusBar1: TStatusBar;
    Rd_Registro: TRadioButton;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ListagemDeRegistroAverbado: TF_ListagemDeRegistroAverbado;

implementation

uses U_ListagemDeRegistroAverbadoReport;

{$R *.DFM}

procedure TF_ListagemDeRegistroAverbado.BitBtn1Click(Sender: TObject);
begin

  if (Not(Rd_Registro.Checked)) Then
  begin
    if (MaskEdit3.Text = '  /  /    ') and (MaskEdit4.Text = '  /  /    ') Then
    Begin
      MessageBox(Handle, PChar('Informe a Data Inicial e a Data Final!'), PChar(F_ListagemDeRegistroAverbado.Caption), MB_OK + MB_ICONWARNING);
      Exit;
    End;
  End
  Else
  Begin
    if (MaskEdit1.Text = '') Then
    Begin
      MessageBox(Handle, PChar('Informe o Número do Registro!'), PChar(F_ListagemDeRegistroAverbado.Caption), MB_OK + MB_ICONWARNING);
      Exit;
    End;
  End;

  qryRelatorio.Close;
  qryRelatorio.SQL.Clear;
  qryRelatorio.SQL.Add('select MID(nome_parte,1, 50) as nome_parte, protocolo , registro, averbacao, data_recepcao, data_baixa, cod_natureza, nome_parte, nome_apresentante from historicoregistro ');

  if Rd_DataRecepcao.Checked Then
    qryRelatorio.SQL.Add('Where data_recepcao >= '+QuotedStr(FormatDateTime('yyyy-mm-dd', strtodate(MaskEdit3.Text)))+' and data_recepcao <= '+QuotedStr(FormatDateTime('yyyy-mm-dd', strtodate(MaskEdit4.Text)))+' order by registro, protocolo ');

  if Rd_DataBaixa.Checked Then
    qryRelatorio.SQL.Add('Where data_baixa >= '+QuotedStr(FormatDateTime('yyyy-mm-dd', strtodate(MaskEdit3.Text)))+' and data_baixa <= '+QuotedStr(FormatDateTime('yyyy-mm-dd', strtodate(MaskEdit4.Text)))+' order by registro, protocolo  ');

  if Rd_Registro.Checked Then
    qryRelatorio.SQL.Add('Where registro = '+QuotedStr(MaskEdit1.Text)+' order by registro, protocolo');  

  qryRelatorio.Open;

  If qryRelatorio.IsEmpty Then
  Begin
    MessageBox(Handle, PChar('O critério informado não retornou informações suficientes para exibição do relatório!'), PChar(F_ListagemDeRegistroAverbado.Caption), MB_OK + MB_ICONWARNING);
    Exit;
  End;

  F_ListagemDeRegistroAverbadoReport:= TF_ListagemDeRegistroAverbadoReport.Create(Nil);
  F_ListagemDeRegistroAverbadoReport.QuickRep1.Preview;
  F_ListagemDeRegistroAverbadoReport.Destroy;
  F_ListagemDeRegistroAverbadoReport:= Nil;


end;

procedure TF_ListagemDeRegistroAverbado.MaskEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    MaskEdit3.SetFocus;
  end;
end;

procedure TF_ListagemDeRegistroAverbado.MaskEdit3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    MaskEdit4.SetFocus;
  end;

end;

procedure TF_ListagemDeRegistroAverbado.MaskEdit4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin
    BitBtn1.SetFocus;
  end;

end;

procedure TF_ListagemDeRegistroAverbado.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.
