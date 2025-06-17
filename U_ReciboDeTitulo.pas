unit U_ReciboDeTitulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, jpeg, ExtCtrls, Mask, Buttons, Grids, DBGrids,
  MemTable, ToolEdit, CurrEdit, DBCtrls;

type
  TF_ReciboDeTitulo = class(TForm)
    btImprimir: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    EdProtocolo: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    qryRecibo: TQuery;
    DBGrid1: TDBGrid;
    tbTemp: TMemoryTable;
    tbTempQuantidade: TFloatField;
    tbTempTabela: TStringField;
    tbTempValor: TFloatField;
    Dts_Temp: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    DbNome: TDBEdit;
    DbQuantidade: TDBEdit;
    DbValor: TDBEdit;
    SpeedButton3: TSpeedButton;
    tbTempTotalGeral: TCurrencyField;
    procedure btImprimirClick(Sender: TObject);
    Function Ver_Natureza(codigo : String; ComNum : Boolean) : String;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdProtocoloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    function RetornaPortaCom: String;
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ReciboDeTitulo: TF_ReciboDeTitulo;
  fValorTotaPedido: Currency;
implementation

uses ProcGeral, Menu, DMTD;

{$R *.DFM}

procedure TF_ReciboDeTitulo.btImprimirClick(Sender: TObject);
var
  sPortaCom,
  sNomeCartorio,
  sCnpj,
  sEndereco,
  sCep,
  sCidade,
  sBairro,
  sProtocolo,
  sNatureza,
  sApresentante,
  sDataProtocolo,
  sTelefone,
  sNotificado,
  sNotificante,
  sRegistro: String;
begin

  sNomeCartorio   := F_Menu.Label29.Caption;
  sCnpj           := F_Menu.Label39.Caption;
  sEndereco       := F_Menu.label11.Caption;
  sCep            := F_Menu.Label36.Caption;
  sCidade         := F_Menu.Label7.Caption;
  sBairro         := '';
  sProtocolo      := qryRecibo.FieldByName('p_auxiliar').AsString;
  sNatureza       := Ver_Natureza(qryRecibo.FieldByName('natureza').asstring, True);
  sApresentante   := qryRecibo.FieldByName('contato').AsString;
  sNotificado     := qryRecibo.FieldByName('notificado').AsString;
  sNotificante    := qryRecibo.FieldByName('a_nome').AsString;
  sDataProtocolo  := DateToStr(qryRecibo.FieldByName('data_r').AsDateTime);
  sTelefone       := F_Menu.label12.Caption;
  sPortaCom       := RetornaPortaCom;
  sRegistro       := qryRecibo.FieldByName('registro').asString;

  ReciboDeTitulosRecebidos(sPortaCom,
                           sNomeCartorio,
                           sCnpj,
                           sEndereco,
                           sCep,
                           sCidade,
                           sBairro,
                           sProtocolo,
                           sNatureza,
                           sApresentante,
                           sDataProtocolo,
                           sTelefone,
                           sNotificado,
                           tbTemp,
                           sRegistro,
                           sNotificante);
  if (MessageBox(Handle, PChar('Deseja lancar novo registro ?'), 'Cupom', MB_YESNO + MB_ICONQUESTION) = IDYes) then
  Begin
   tbTemp.Close;
   tbTemp.CreateTable;
   fValorTotaPedido    := 0;
   EdProtocolo.Text:= '';
  End;


end;

Function TF_ReciboDeTitulo.Ver_Natureza(codigo : String; ComNum : Boolean) : String;
begin
  Result := '';
  Dm.Natureza.Close;
  Dm.Natureza.Sql.Clear;
  Dm.Natureza.Sql.Add('SELECT cod, natureza FROM natureza');
  Dm.Natureza.Sql.Add('WHERE');
  Dm.Natureza.Sql.Add('cod = ' + codigo);
  Dm.Natureza.Open;
  if (Dm.Natureza.RecordCount <> 0) then
  begin
    Result := Dm.Natureza.FieldByName('natureza').AsString;
  end;
end;


procedure TF_ReciboDeTitulo.SpeedButton1Click(Sender: TObject);
begin
  fValorTotaPedido    :=0;
  tbTemp.Append;
  DbNome.Enabled      :=True;
  DbQuantidade.Enabled:=True;
  DbValor.Enabled     :=True;
  DbNome.SetFocus;
end;

procedure TF_ReciboDeTitulo.SpeedButton3Click(Sender: TObject);
begin
  if (EdProtocolo.Text = '') Then
  Begin
    Application.MessageBox('Campo: Protocolo, deve ser preenchido!', 'Cupom', Mb_IconWarning);
    EdProtocolo.SetFocus;
    Abort;
  End;
  if (DbNome.Text = '') Then
  Begin
    Application.MessageBox('Campo: Descrição, deve ser preenchido!', 'Cupom', Mb_IconWarning);
    DbNome.SetFocus;
    Abort;
  End;
  if (DbQuantidade.Text = '') Then
  Begin
    Application.MessageBox('Campo: Qtd, deve ser preenchido!', 'Cupom', Mb_IconWarning);
    DbQuantidade.SetFocus;
    Abort;
  End;
  if (DbValor.Text = '') Then
  Begin
    Application.MessageBox('Campo: Valor R$, deve ser preenchido!', 'Cupom', Mb_IconWarning);
    DbValor.SetFocus;
    Abort;

  End;   

  fValorTotaPedido    := fValorTotaPedido + (tbTempValor.Value * tbTempQuantidade.Value);

  tbTempTotalGeral.AsCurrency:= fValorTotaPedido;
  tbTemp.Post;
  DbNome.Enabled:=False;
  DbQuantidade.Enabled:=False;
  DbValor.Enabled:=False;
  SpeedButton1.Click;
  
end;

procedure TF_ReciboDeTitulo.SpeedButton2Click(Sender: TObject);
begin
  tbTemp.Delete;
  fValorTotaPedido    := fValorTotaPedido + (tbTempValor.Value * tbTempQuantidade.Value);
end;

procedure TF_ReciboDeTitulo.FormShow(Sender: TObject);
begin
  tbTemp.Open;
  EdProtocolo.SetFocus;
end;

procedure TF_ReciboDeTitulo.EdProtocoloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  begin

    if (Not(tbTemp.State in [DsInsert])) Then
      tbTemp.Append;

    qryRecibo.Close;
    qryRecibo.SQL.Clear;
    qryRecibo.SQL.Add('select b.nome as Notificado, a.*, b.* from td a INNER JOIN td_pesso b ON (a.protocolo = b.protocolo) where a.p_auxiliar = '+QuotedStr(EdProtocolo.Text)+' and situacao = '+QuotedStr('38')+'');
    qryRecibo.Open;                   

    if qryRecibo.IsEmpty Then
    Begin
      MessageBox(Handle, PChar('Protocolo não encontrado!'), 'Cupom', MB_OK + MB_ICONWARNING);
    End;
    SpeedButton1.Click;
  end;

  If (Key = VK_F5) Then
     btImprimir.OnClick(Sender);
  
end;

procedure TF_ReciboDeTitulo.DbQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    DbValor.SetFocus;
  end;
  If (Key = VK_F5) Then
     btImprimir.OnClick(Sender);
  
end;

procedure TF_ReciboDeTitulo.DbNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    DbQuantidade.SetFocus;
  end;
  
  If (Key = VK_F5) Then
     btImprimir.OnClick(Sender);

end;

procedure TF_ReciboDeTitulo.DbValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    EdProtocolo.SetFocus; 
    SpeedButton3.Click;
  end;

  If (Key = VK_F5) Then
     btImprimir.OnClick(Sender);

end;

procedure TF_ReciboDeTitulo.BitBtn3Click(Sender: TObject);
begin
  Close;
end;


function TF_ReciboDeTitulo.RetornaPortaCom: String;
begin
  result:= '';
  dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('select porta_com_recibo_cupom from configur');
  dm.qryGenerico.Open;
  result:= dm.qryGenerico.FieldByName('porta_com_recibo_cupom').AsString;
end;

end.
