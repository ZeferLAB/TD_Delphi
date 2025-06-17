unit U_ExameCalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, DBCtrls, RxDBComb, Mask, ToolEdit, RXDBCtrl,
  Buttons, ComCtrls, Db, DBTables, Grids, DBGrids,FuncGeral;

type
  TF_ExameCalculo = class(TForm)
    ControlBar1: TControlBar;
    Label36: TLabel;
    StatusBar1: TStatusBar;
    qryNotificacao: TQuery;
    DS_Notificacao: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBDateEdit1: TDBDateEdit;
    RxDBComboBox1: TRxDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBRichEdit1: TDBRichEdit;
    Label16: TLabel;
    ComboBox1: TComboBox;
    EdPesq: TEdit;
    DBGrid1: TDBGrid;
    BitBtn5: TBitBtn;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    qryNotificacao_novo: TQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    DateField1: TDateField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    DtsNotificacao_novo: TDataSource;
    Label18: TLabel;
    Label20: TLabel;
    DBDateEdit2: TDBDateEdit;
    DBComboBox1: TDBComboBox;
    qryNotificacao_novoqtd_dia_devolucao: TIntegerField;
    qryNotificacao_novodata_devolucao: TDateField;
    btnBaixa: TBitBtn;
    Label19: TLabel;
    dsNatureza: TDataSource;
    qryNatureza: TQuery;
    lblStatus: TLabel;
    lblDataBaixa: TLabel;
    dbNatureza: TDBComboBox;
    qryNotificacaoid: TIntegerField;
    qryNotificacaoprotocolo: TIntegerField;
    qryNotificacaodata_lancamento: TDateField;
    qryNotificacaonome: TStringField;
    qryNotificacaocelular: TStringField;
    qryNotificacaorg: TStringField;
    qryNotificacaotipo_doc: TStringField;
    qryNotificacaocpf: TStringField;
    qryNotificacaotelefone: TStringField;
    qryNotificacaoendereco: TStringField;
    qryNotificacaocomplemento: TStringField;
    qryNotificacaocep: TStringField;
    qryNotificacaobairro: TStringField;
    qryNotificacaocidade: TStringField;
    qryNotificacaouf: TStringField;
    qryNotificacaoobservacao: TStringField;
    qryNotificacaonome_solicitante: TStringField;
    qryNotificacaotelefone_solicitante: TStringField;
    qryNotificacaoqtd_dia_devolucao: TIntegerField;
    qryNotificacaodata_devolucao: TDateField;
    qryNotificacaodataBaixa: TStringField;
    qryNotificacaonatureza: TStringField;
    qryNotificacaostatusBaixa: TStringField;
    dbStatus: TDBText;
    dbDataBaixa: TDBText;
    BitBtn8: TBitBtn;
    qryNotificacao_novostatusBaixa: TStringField;
    qryNotificacao_novodataBaixa: TStringField;
    qryNotificacao_novonatureza: TStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBDateEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure btnBaixaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryNotificacaoAfterPost(DataSet: TDataSet);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdPesqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn8Click(Sender: TObject);

  private
    function retornaDataDevolucao(Data: TDateTime): TDateTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ExameCalculo: TF_ExameCalculo;

implementation

uses DMTD, U_RelExameCalculoTD, Baixa_ExameCalculo, EXIGENC2,
  ExigenciaExameCalculo, ProcGeral, Menu;

{$R *.DFM}

procedure TF_ExameCalculo.BitBtn4Click(Sender: TObject);
begin
  IF (qryNotificacao.State = DsInsert) or (qryNotificacao.State = DsEdit) Then
    qryNotificacao.Cancel;
  Close;
end;

procedure TF_ExameCalculo.BitBtn1Click(Sender: TObject);
var
  sequencia: Integer;
begin
  if BitBtn1.Caption = 'Novo' Then
  begin
    Panel2.Enabled:= True;
    DBComboBox1.SetFocus;
    BitBtn1.Caption := 'Gravar';
    qryNotificacao.Insert;
    qryNotificacaostatusBaixa.AsString := 'EXAME';
    qryNotificacaodata_lancamento.AsDateTime := Now;
    qryNotificacaoqtd_dia_devolucao.AsInteger:= 30;
    dbStatus.Field.Text := 'EXAME';
    BitBtn7.Enabled:= False;
    BitBtn3.Enabled:= False;
  end
  else if BitBtn1.Caption = 'Gravar' Then
  begin
    if DBEdit2.Text = '' Then                         
    begin
      ShowMessage('Campo: Nome, deve ser preenchido!');
      Abort;
    end;

    dm.qryGenerico_Auxiliar3.Close;
    dm.qryGenerico_Auxiliar3.SQL.Clear;
    dm.qryGenerico_Auxiliar3.SQL.Add('select seq_protoc_exame_calc from seq_bal');
    dm.qryGenerico_Auxiliar3.Open;

    sequencia:= dm.qryGenerico_Auxiliar3.FieldByName('seq_protoc_exame_calc').AsInteger;

    if (sequencia < 1) Then
      sequencia := 1;

    if qryNotificacao.State = DsInsert Then
      qryNotificacaoprotocolo.AsInteger:= sequencia;

    if DBEdit1.Text = '' Then
    begin
      ShowMessage('Campo: Nº do Exame Cálculo, deve ser preenchido!');
      Abort;
    end;

    if qryNotificacao.State = DsInsert Then
    begin
      sequencia := sequencia + 1;

      dm.qryGenerico.Close;
      dm.qryGenerico.SQL.Clear;
      dm.qryGenerico.SQL.Add('update seq_bal set seq_protoc_exame_calc = '+QuotedStr(IntToStr(sequencia))+'');
      dm.qryGenerico.ExecSQL;
    end;

    qryNotificacao.Post;

   // qryNotificacao.Close;
    //qryNotificacao.Open;

    Application.MessageBox('Registro salvo com sucesso!', 'Exame e Cálculo', Mb_IconInformation);

    if Application.MessageBox( Pchar('Deseja inserir novo registro ?'),PChar('Exame e Cálculo'),MB_ICONQUESTION + MB_YESNO ) = Id_yes then
    begin
      qryNotificacao.Close;
      qryNotificacao.Open;
      Panel2.Enabled:= True;
      DBEdit2.SetFocus;
      BitBtn1.Caption := 'Gravar';
      qryNotificacao.Insert;
      qryNotificacaostatusBaixa.AsString := 'E';
      qryNotificacaodata_lancamento.AsDateTime:= Now;
      qryNotificacaoqtd_dia_devolucao.AsInteger:= 30;
      BitBtn7.Enabled:= False;
      BitBtn3.Enabled:= False;
    end
    else
    begin
      BitBtn2.Click;
    end;
  end    
end;

procedure TF_ExameCalculo.BitBtn7Click(Sender: TObject);
begin
  BitBtn1.Caption := 'Gravar';
  Panel2.Enabled:= True;
  DBEdit2.SetFocus;
  BitBtn7.Enabled:= False;
  BitBtn3.Enabled:= False;
  qryNotificacao.Edit;
end;

procedure TF_ExameCalculo.BitBtn2Click(Sender: TObject);
begin
  BitBtn1.Caption := 'Novo';
  Panel2.Enabled:= False;
  BitBtn7.Enabled:= True;
  BitBtn3.Enabled:= True;
  BitBtn1.Enabled:= True;
  qryNotificacao.Cancel; 
end;

procedure TF_ExameCalculo.BitBtn3Click(Sender: TObject);
begin
  qryNotificacao.Delete;
end;

procedure TF_ExameCalculo.DBDateEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key=#13 Then
  Begin
    Key:=#0;
    Perform(Wm_NextDlgCtl,0,0);
  End
end;

procedure TF_ExameCalculo.FormShow(Sender: TObject);
begin
  qryNotificacao.Open;
end;

procedure TF_ExameCalculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryNotificacao.Close;
end;

procedure TF_ExameCalculo.BitBtn5Click(Sender: TObject);
begin
   if ComboBox1.Text = '' Then
   Begin
     qryNotificacao.Close;
     qryNotificacao.SQL.Clear;
     qryNotificacao.SQL.Add('select * from td_exame_calculo ');
     qryNotificacao.Open;
   End;

  if EdPesq.Text <> '' Then
  begin
    if ComboBox1.ItemIndex = 0 Then
    begin
      qryNotificacao.Close;
      qryNotificacao.SQL.Clear;
      qryNotificacao.SQL.Add('select * from td_exame_calculo where nome like '+QuotedStr(EdPesq.Text+'%')+' ');
      qryNotificacao.Open;
    end;

    if ComboBox1.ItemIndex = 1 Then
    begin
      qryNotificacao.Close;
      qryNotificacao.SQL.Clear;
      qryNotificacao.SQL.Add('select * from td_exame_calculo where rg like '+QuotedStr(EdPesq.Text+'%')+' ');
      qryNotificacao.Open;
    end;

    if ComboBox1.ItemIndex = 2 Then
    begin
      qryNotificacao.Close;
      qryNotificacao.SQL.Clear;
      qryNotificacao.SQL.Add('select * from td_exame_calculo where cpf like '+QuotedStr(EdPesq.Text+'%')+' ');
      qryNotificacao.Open;
    end;

    if ComboBox1.ItemIndex = 3 Then
    begin
      qryNotificacao.Close;
      qryNotificacao.SQL.Clear;
      qryNotificacao.SQL.Add('select * from td_exame_calculo where protocolo like '+QuotedStr(EdPesq.Text+'%')+' ');
      qryNotificacao.Open;
    end;
  end;
end;

procedure TF_ExameCalculo.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePage:= TabSheet1;
end;

procedure TF_ExameCalculo.BitBtn6Click(Sender: TObject);
begin
  DM.Configur.Open;
  qryNotificacao_novo.Close;
  qryNotificacao_novo.SQL.Clear;
  qryNotificacao_novo.SQL.Add('select * from td_exame_calculo where protocolo = '+QuotedStr(DBEdit1.Text)+'');
  qryNotificacao_novo.Open;
  if Assigned(F_RelExameCalculoTD) then
    F_RelExameCalculoTD:= Nil;
  F_RelExameCalculoTD:= TF_RelExameCalculoTD.Create(Nil);
  F_RelExameCalculoTD.QrLabel6.Caption  := F_Menu.Label25.Caption;
  F_RelExameCalculoTD.QrLabel46.Caption := F_Menu.Label25.Caption;
  if ((F_menu.LbCnpj.Caption= '15.258.382/0001-25') or (F_menu.LbCnpj.Caption= '15258382000125')) then
  begin
    F_RelExameCalculoTD.qrmemo1.Enabled:=true;
    F_RelExameCalculoTD.qrmemo1.visible:=true;
  end else
  begin
    F_RelExameCalculoTD.qrmemo1.Enabled:=false;
    F_RelExameCalculoTD.qrmemo1.visible:=false;
  end;
  F_RelExameCalculoTD.QuickRep1.Preview;
  F_RelExameCalculoTD.Destroy;
  DM.Configur.Close;  
end;

function TF_ExameCalculo.retornaDataDevolucao(Data: TDateTime): TDateTime;
var
  dat_aux,
  prazo: String;
begin
  prazo:= DBComboBox1.Text;
  if prazo <> '' then
  begin
    dat_aux := DateToStr(Ver_Feriado(now , StrToInt(prazo)));

    if Application.MessageBox( Pchar('Deseja que o prazo seja calculado em dias úteis?'),PChar('Exame e Cálculo'),MB_ICONQUESTION + MB_YESNO ) = Id_yes then
    Begin
      if (dayofweek(StrToDate(dat_aux)) = 1) then
        dat_aux := DateToStr(Ver_Feriado(StrToDate(dat_aux) + 1,StrToInt(prazo)));

      if (dayofweek(StrToDate(dat_aux)) = 7) then
        dat_aux := DateToStr(Ver_Feriado(StrToDate(dat_aux) + 2,StrToInt(prazo)));
    End;

    result:= strtodate(dat_aux);
  End
  else
  begin
    result:= (now + 1);  
  end;
end;
procedure TF_ExameCalculo.DBComboBox1Exit(Sender: TObject);
begin
  if qryNotificacao.State = DsInsert Then
    qryNotificacaodata_devolucao.AsDateTime:= retornaDataDevolucao(now);    
  if qryNotificacao.State = DsEdit Then
    qryNotificacaodata_devolucao.AsDateTime:= retornaDataDevolucao(now);
end;

procedure TF_ExameCalculo.btnBaixaClick(Sender: TObject);
begin
  if F_ExameCalculo.qryNotificacao.Active then
  begin
    Application.CreateForm(TFrm_Baixa, Frm_Baixa);
    Frm_Baixa.protocolo := qryNotificacao.FieldByName('protocolo').AsString;
    Frm_Baixa.ShowModal;
    Frm_Baixa.Free;
  end;  
end;

procedure TF_ExameCalculo.FormActivate(Sender: TObject);
begin
  qryNatureza.Open;
  while (not qryNatureza.eof) do
  begin
    dbNatureza.Items.Add(qryNatureza.FieldByName('natureza').AsString);
    qryNatureza.next;
  end;  
end;

procedure TF_ExameCalculo.qryNotificacaoAfterPost(DataSet: TDataSet);
begin
  if dbStatus.Field.Text ='E' then
    dbStatus.Field.Text := 'Exame';
end;

procedure TF_ExameCalculo.ComboBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  EdPesq.SetFocus;
end;

procedure TF_ExameCalculo.EdPesqKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  BitBtn5.SetFocus;
end;

procedure TF_ExameCalculo.BitBtn8Click(Sender: TObject);
begin
  if (not Permissao('acesso049')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  if F_ExameCalculo.qryNotificacao.Active then
  begin
    Application.CreateForm(TF_ExigenciaExameCalculo, F_ExigenciaExameCalculo);
    Carrega_Assina;
    F_ExigenciaExameCalculo.MaskEdit1.Text:= qryNotificacao.FieldByName('protocolo').AsString;
    F_ExigenciaExameCalculo.Maskedit2.Text := DateToStr(date);
    F_ExigenciaExameCalculo.pesquisaProtocolo;
    F_ExigenciaExameCalculo.Showmodal;
    F_ExigenciaExameCalculo.Destroy;
    F_ExigenciaExameCalculo := NIL;
  end;
end;

end.
