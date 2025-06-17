unit U_DajeCorrecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, ToolEdit, CurrEdit, Mask,
  Buttons, Db, DBTables;

type
  TF_DajeCorrecao = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Panel10: TPanel;
    Label37: TLabel;
    Panel1: TPanel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label16: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ArqAux: TQuery;
    Ds_ArqAux: TDataSource;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    MaskEdit5: TMaskEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit6Exit(Sender: TObject);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure CurrencyEdit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_DajeCorrecao: TF_DajeCorrecao;

implementation

uses DMTD, FuncGeral;
             
{$R *.DFM}

procedure TF_DajeCorrecao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_DajeCorrecao.FormShow(Sender: TObject);
begin
  ArqAux.Close;
  ArqAux.SQL.Clear;
  ArqAux.SQL.Add(' select * from  daje where ');
  ArqAux.SQL.Add(' id ='+QuotedStr('0'));
  ArqAux.open;
end;

procedure TF_DajeCorrecao.BitBtn3Click(Sender: TObject);
begin
  if (MaskEdit6.Text = '') or (MaskEdit7.Text = '') Then
  Begin
    Application.MessageBox('Campo: Série e Número do Daje, devem ser preenchido!', Pchar(F_DajeCorrecao.Caption), MB_OK + MB_ICONERROR);
    Abort;
  End
  Else
  Begin
    ArqAux.Close;
    ArqAux.SQL.Clear;
    ArqAux.SQL.Add(' select * from  daje where ');
    ArqAux.SQL.Add(' serie_daje ='+QuotedStr(StrZero(MaskEdit6.Text,3)));
    ArqAux.SQL.Add(' and numero_daje ='+QuotedStr(MaskEdit7.Text));
    ArqAux.open;
  End;

end;

procedure TF_DajeCorrecao.DBGrid1DblClick(Sender: TObject);
begin

  MaskEdit5.Text:= ArqAux.FieldByName('tipo_doc').AsString;
  MaskEdit4.Text:= ArqAux.FieldByName('doc').AsString;
  MaskEdit1.Text:= ArqAux.FieldByName('contribuinte').AsString;
  MaskEdit2.Text:= ArqAux.FieldByName('endereco').AsString;
  MaskEdit3.Text:= ArqAux.FieldByName('cidade').AsString;
  CurrencyEdit1.Value:= ArqAux.FieldByName('vr_declarado').AsCurrency;
  CurrencyEdit3.Value:= ArqAux.FieldByName('vr_daje').AsCurrency;

  CurrencyEdit2.Value:= ArqAux.FieldByName('emol_daje').AsCurrency;
  CurrencyEdit5.Value:= ArqAux.FieldByName('tx_fisca_daje').AsCurrency;
  CurrencyEdit7.Value:= ArqAux.FieldByName('fecom_daje').AsCurrency;
  CurrencyEdit4.Value:= ArqAux.FieldByName('def_pub_daje').AsCurrency;
  CurrencyEdit6.Value:= ArqAux.FieldByName('vr_pge').AsCurrency;
  CurrencyEdit3.Value:= ArqAux.FieldByName('vr_daje').AsCurrency;
  CurrencyEdit1.Value:= ArqAux.FieldByName('vr_declarado').AsCurrency;


  PageControl1.ActivePage:= TabSheet2;
end;

procedure TF_DajeCorrecao.BitBtn1Click(Sender: TObject);
begin

  Try
    Dm.qryGenerico.Close;
    Dm.qryGenerico.SQL.Clear;
    Dm.qryGenerico.SQL.Add('update daje set');
    Dm.qryGenerico.SQL.Add('contribuinte = ' + QuotedStr(MaskEdit1.Text));
    Dm.qryGenerico.SQL.Add(', emol_daje = ' + QuotedStr(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit2.Value))));
    Dm.qryGenerico.SQL.Add(', tx_fisca_daje = ' + QuotedStr(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit5.Value))));
    Dm.qryGenerico.SQL.Add(', fecom_daje = ' + QuotedStr(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit7.Value))));
    Dm.qryGenerico.SQL.Add(', def_pub_daje = ' + QuotedStr(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit4.Value))));
    Dm.qryGenerico.SQL.Add(', vr_pge = ' + QuotedStr(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit6.Value))));
    Dm.qryGenerico.SQL.Add(', vr_daje = ' + QuotedStr(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit3.Value))));
    Dm.qryGenerico.SQL.Add(', vr_declarado = ' + QuotedStr(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit1.Value))));

    Dm.qryGenerico.SQL.Add('where serie_daje = ' + StrZero(MaskEdit6.Text,3)+' and numero_daje = '+QuotedStr(MaskEdit7.Text)+'' );
    Dm.qryGenerico.ExecSQL;

    Application.MessageBox('Registro atualizado com sucesso!', Pchar(F_DajeCorrecao.Caption), MB_OK + MB_ICONINFORMATION);

  Except
    Begin
      Application.MessageBox('Erro ao tentar atualizar o registro!', Pchar(F_DajeCorrecao.Caption), MB_OK + MB_ICONERROR);
      Abort;
    End;
  End;
end;

procedure TF_DajeCorrecao.MaskEdit6Exit(Sender: TObject);
begin
  MaskEdit6.Text:= StrZero(MaskEdit6.Text,3);
end;

procedure TF_DajeCorrecao.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then
    MaskEdit7.SetFocus;
end;

procedure TF_DajeCorrecao.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then
    BitBtn3.Click;

end;

procedure TF_DajeCorrecao.MaskEdit5KeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #13 then
  Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TF_DajeCorrecao.CurrencyEdit3KeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #13 then
  Begin
    Key:= #0;
    BitBtn1.Click;
  end;
end;

end.
