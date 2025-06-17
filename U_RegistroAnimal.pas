unit U_RegistroAnimal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, DBCtrls, Mask, jpeg, StdCtrls, Buttons, Db, DBTables,
  Grids, DBGrids, AxCtrls, OleCtrls, DbOleCtl, ImgeditLibCtl_TLB, JLCVideo,
  pngimage, FileCtrl, WPDefs, WPPrint, WpWinCtr, WPRich, ExtDlgs;

type
  TF_RegistroAnimal = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    ControlBar1: TControlBar;
    Label34: TLabel;
    qryCertidao: TQuery;
    Ds_Certidao: TDataSource;
    qryCertidaorecno: TIntegerField;
    qryCertidaonome: TStringField;
    qryCertidaoespecie: TStringField;
    qryCertidaoraca: TStringField;
    qryCertidaocor: TStringField;
    qryCertidaopeso: TStringField;
    qryCertidaoaltura: TStringField;
    qryCertidaovalor: TFloatField;
    qryCertidaodata_nascimento: TDateField;
    qryCertidaolocal_nascimento: TStringField;
    qryCertidaonome_mae: TStringField;
    qryCertidaonome_pai: TStringField;
    qryCertidaonome_guardiao: TStringField;
    qryCertidaocpf_guardiao: TStringField;
    qryCertidaonacional_guardiao: TStringField;
    qryCertidaoestado_civil: TStringField;
    qryCertidaoprofissao: TStringField;
    qryCertidaoendereco: TStringField;
    qryCertidaobairro: TStringField;
    qryCertidaocep: TStringField;
    qryCertidaoUF: TStringField;
    qryCertidaocidade: TStringField;
    qryCertidaotelefone: TStringField;
    qryCertidaocelular: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label20: TLabel;
    DBEdit19: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label23: TLabel;
    BitBtn1: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label24: TLabel;
    qryCertidaonr_protoc: TIntegerField;
    qryCertidaoregistro: TIntegerField;
    ImgIncluirFoto: TImage;
    Label1: TLabel;
    BitBtn10: TBitBtn;
    WPRichText1: TWPRichText;
    Label25: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Label26: TLabel;
    DBComboBox1: TDBComboBox;
    qryCertidaosexo: TStringField;
    DBRichEdit1: TDBRichEdit;
    DBRichEdit2: TDBRichEdit;
    qryCertidaocaracteristicas: TStringField;
    qryCertidaoobservacao: TStringField;
    Label27: TLabel;
    DBEdit22: TDBEdit;
    qryCertidaoregistro_pedigree: TStringField;
    BitBtn5: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure ImgIncluirFotoClick(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure qryCertidaoAfterScroll(DataSet: TDataSet);
    procedure qryCertidaoBeforeScroll(DataSet: TDataSet);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure AtualizaImagem;
    { Public declarations }
  end;

var
  F_RegistroAnimal: TF_RegistroAnimal;

implementation

uses ExameC, Menu, DMTD, U_RegistroAnimalPreview, Exame,
  U_RegistroAnimalPreview_MOD1, U_RegistroAnimalPreview_MOD2,
  U_RegistroAnimalPreview_MiniMOD1;

{$R *.DFM}

procedure TF_RegistroAnimal.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RegistroAnimal.BitBtn1Click(Sender: TObject);
var
  i:integer;
begin
  if BitBtn1.Caption = 'Novo' Then
  Begin
    for i:=0 to Self.ComponentCount -1 do
    begin
      if Self.Components[i].ClassType = TDBEdit then  (Self.Components[i] as TDBEdit).enabled :=true;
    end;
    DBRichEdit1.enabled:=true;
    DBRichEdit2.enabled:=true;
    DBComboBox1.Enabled:=true;
    ImgIncluirFoto.enabled:=true;
    DBEdit1.SetFocus;
    BitBtn1.Caption := 'Gravar';
    qryCertidao.Insert;
    qryCertidao.FieldByName('nr_protoc').AsString:= F_Exame.MaskEdit1.Text;
    qryCertidao.FieldByName('registro').AsString := F_Exame.Label29.Caption;
    Image1.Picture:= Nil;
  End
  Else
  if BitBtn1.Caption = 'Gravar' Then
  Begin

    if DBEdit1.Text = '' Then
    Begin
      ShowMessage('Campo: Nome, deve ser preenchido!');
      Abort;
    End;

    if DBEdit10.Text = '' Then
    Begin
      ShowMessage('Campo: Nome do Pai, deve ser preenchido!');
      Abort;
    End;


    if DBEdit11.Text = '' Then
    Begin
      ShowMessage('Campo: Nome do Mãe, deve ser preenchido!');
      Abort;
    End;

    if DBEdit12.Text = '' Then
    Begin
      ShowMessage('Campo: Guardião do Animal, deve ser preenchido!');
      Abort;
    End;

    If (Image1.Picture <> Nil) Then
      Image1.Picture.SaveToFile(F_Menu.CaminhoImagemAnimal.Caption + strzero(F_Exame.Label29.Caption,7) + '.JPG')
    else
    Image1.Picture:= Nil;


    qryCertidao.FieldByName('registro').AsString:= F_Exame.Label29.Caption;

    qryCertidao.Post;
    Application.MessageBox('Registro salvo com sucesso!', 'Certidão', Mb_IconInformation);
    qryCertidao.Insert;
    BitBtn2.OnClick(Nil);
    for i:=0 to Self.ComponentCount -1 do
    begin
      if Self.Components[i].ClassType = TDBEdit then  (Self.Components[i] as TDBEdit).enabled :=false;
    end;
    DBRichEdit1.enabled:=false;
    DBRichEdit2.enabled:=false;
    DBComboBox1.Enabled:=false;
    ImgIncluirFoto.enabled:=false;
  End;

end;

procedure TF_RegistroAnimal.BitBtn7Click(Sender: TObject);
var
  I:integer;
begin
    for i:=0 to Self.ComponentCount -1 do
  begin
    if Self.Components[i].ClassType = TDBEdit then  (Self.Components[i] as TDBEdit).enabled :=true;
  end;
  DBRichEdit1.enabled:=true;
  DBRichEdit2.enabled:=true;
  DBComboBox1.Enabled:=true;
  ImgIncluirFoto.enabled:=true;
  BitBtn1.Caption := 'Gravar';
  qryCertidao.Edit;
end;

procedure TF_RegistroAnimal.BitBtn2Click(Sender: TObject);
begin
  BitBtn1.Caption := 'Novo';
  qryCertidao.Cancel;
end;

procedure TF_RegistroAnimal.BitBtn3Click(Sender: TObject);
begin
  if (Not(qryCertidao.Active)) Then
  begin
    qryCertidao.Close;
    qryCertidao.SQL.Clear;
    qryCertidao.SQL.Add('Select * From registro_animal where nr_protoc = '+QuotedStr(F_Exame.MaskEdit1.Text)+'');
    qryCertidao.Open;
  End;

  if Application.MessageBox( Pchar('Deseja realmente excluir o registro do animal?'),'Registro Animal',MB_ICONQUESTION + MB_YESNO ) = Id_yes then
  Begin
    Image1.Picture:= Nil;
    qryCertidao.Delete;
  End;  
end;

procedure TF_RegistroAnimal.FormShow(Sender: TObject);
var
 caminho:string;
 i:integer;
begin
  qryCertidao.Close;
  qryCertidao.SQL.Clear;
  qryCertidao.SQL.Add('Select * From registro_animal where nr_protoc = '+QuotedStr(F_Exame.MaskEdit1.Text)+'');
  qryCertidao.Open;
  caminho :=F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG';

  if  FileExists(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG') Then
    Image1.Picture.LoadFromFile(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG');

  for i:=0 to Self.ComponentCount -1 do
  begin
    if Self.Components[i].ClassType = TDBEdit then  (Self.Components[i] as TDBEdit).enabled :=false;
  end;
  DBRichEdit1.enabled:=false;
  DBRichEdit2.enabled:=false;
  DBComboBox1.Enabled:=false;
  ImgIncluirFoto.enabled:=false;
end;

procedure TF_RegistroAnimal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCertidao.Close;
end;

procedure TF_RegistroAnimal.DBEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    perform(wm_nextdlgctl,0,0);
  end;
end;

procedure TF_RegistroAnimal.ImgIncluirFotoClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute Then
  Begin
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  End

end;

procedure TF_RegistroAnimal.BitBtn10Click(Sender: TObject);
begin
  If (F_Menu.Label39.Caption = '13225586000134') or (F_Menu.Label39.Caption = '13.225.586/0001-34') Then // Lauro de Freitas RTD
  Begin
    F_RegistroAnimalPreview_MOD1:= TF_RegistroAnimalPreview_MOD1.Create(Nil);

    F_RegistroAnimalPreview_MOD1.QRLabel2.Caption := 'ESTADO DA BAHIA - COMARCA DE SALVADOR';//
    F_RegistroAnimalPreview_MOD1.QRLabel3.Caption := F_menu.Label29.Caption;
    F_RegistroAnimalPreview_MOD1.QRLabel4.Caption := F_Menu.Label11.Caption +' - '+F_Menu.Label36.Caption;
    F_RegistroAnimalPreview_MOD1.QRLabel5.Caption := F_Menu.Label12.Caption +' - '+F_Menu.Label55.Caption;


    {F_RegistroAnimalPreview_MOD1.QRMemo1.Lines.Clear;
    F_RegistroAnimalPreview_MOD1.QRMemo1.Lines.Add(UpperCase(F_Menu.LbNomeTitular.Caption) +', Titular do 2º Ofício de Registro de Títulos e Documentos e Pessoa Jurídica da '+
                                              'comarca de Maceió, Capital do Estado de Alagoas, na forma da lei.'); }

    dm.qryGenerico_Auxiliar3.Close;
    dm.qryGenerico_Auxiliar3.SQL.Clear;
    dm.qryGenerico_Auxiliar3.SQL.Add('select data_r, data_p, selo, selo_validador  from td where p_auxiliar = '+QuotedStr(F_Exame.MaskEdit1.Text)+'');
    dm.qryGenerico_Auxiliar3.Open;


    F_RegistroAnimalPreview_MOD1.QRLabel17.Caption:= F_Exame.MaskEdit1.Text;
    F_RegistroAnimalPreview_MOD1.QRLabel18.Caption:= Dm.qryGenerico_Auxiliar3.FieldByName('data_r').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel19.Caption:= F_Exame.Label29.Caption;
    F_RegistroAnimalPreview_MOD1.QRLabel20.Caption:= Dm.qryGenerico_Auxiliar3.FieldByName('data_p').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel22.Caption:= qryCertidao.FieldByName('nome').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel21.Caption:= qryCertidao.FieldByName('nome_guardiao').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel45.Caption:= qryCertidao.FieldByName('registro_pedigree').AsString;


    F_RegistroAnimalPreview_MOD1.QRLabel43.Caption:= qryCertidao.FieldByName('data_nascimento').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel44.Caption:= qryCertidao.FieldByName('sexo').AsString;

    F_RegistroAnimalPreview_MOD1.QRLabel23.Caption:= qryCertidao.FieldByName('especie').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel24.Caption:= qryCertidao.FieldByName('cor').AsString;
    F_RegistroAnimalPreview_MOD1.QRMemo2.Lines.Add(qryCertidao.FieldByName('caracteristicas').AsString);
    F_RegistroAnimalPreview_MOD1.QRMemo3.Lines.Add(qryCertidao.FieldByName('observacao').AsString);
    F_RegistroAnimalPreview_MOD1.QRLabel25.Caption:= F_Menu.Label7.Caption +', '+DateToStr(Now);
    F_RegistroAnimalPreview_MOD1.QrLabel33.Caption := Dm.qryGenerico_Auxiliar3.FieldByName('selo').AsString;
    F_RegistroAnimalPreview_MOD1.QrLabel34.Caption := Dm.qryGenerico_Auxiliar3.FieldByName('selo_validador').AsString;
    if  FileExists(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG') Then
      F_RegistroAnimalPreview_MOD1.QRImage1.Picture.LoadFromFile(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG');

    F_RegistroAnimalPreview_MOD1.QRLabel26.Caption:= F_Menu.LbNomeTitular.Caption;
    AtualizaImagem;
    F_RegistroAnimalPreview_MOD1.QuickRep1.Preview;
    F_RegistroAnimalPreview_MOD1.Destroy;
    F_RegistroAnimalPreview_MOD1 := NIL;

  End
  Else
  If (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66') Then // Feira de Santana RTD
  Begin
    F_RegistroAnimalPreview_MOD2:= TF_RegistroAnimalPreview_MOD2.Create(Nil);

    {F_RegistroAnimalPreview_MOD1.QRMemo1.Lines.Clear;
    F_RegistroAnimalPreview_MOD1.QRMemo1.Lines.Add(UpperCase(F_Menu.LbNomeTitular.Caption) +', Titular do 2º Ofício de Registro de Títulos e Documentos e Pessoa Jurídica da '+
                                              'comarca de Maceió, Capital do Estado de Alagoas, na forma da lei.'); }

    dm.qryGenerico_Auxiliar3.Close;
    dm.qryGenerico_Auxiliar3.SQL.Clear;
    dm.qryGenerico_Auxiliar3.SQL.Add('select data_r, data_p, selo, selo_validador  from td where p_auxiliar = '+QuotedStr(F_Exame.MaskEdit1.Text)+'');
    dm.qryGenerico_Auxiliar3.Open;


    F_RegistroAnimalPreview_MOD2.QRLabel17.Caption:= F_Exame.MaskEdit1.Text;
    F_RegistroAnimalPreview_MOD2.QRLabel18.Caption:= Dm.qryGenerico_Auxiliar3.FieldByName('data_r').AsString;
    F_RegistroAnimalPreview_MOD2.QRLabel19.Caption:= F_Exame.Label29.Caption;
    F_RegistroAnimalPreview_MOD2.QRLabel20.Caption:= Dm.qryGenerico_Auxiliar3.FieldByName('data_p').AsString;
    F_RegistroAnimalPreview_MOD2.QRLabel22.Caption:= qryCertidao.FieldByName('nome').AsString;
    F_RegistroAnimalPreview_MOD2.QRLabel21.Caption:= qryCertidao.FieldByName('nome_guardiao').AsString;
    F_RegistroAnimalPreview_MOD2.QRLabel45.Caption:= qryCertidao.FieldByName('registro_pedigree').AsString;


    F_RegistroAnimalPreview_MOD2.QRLabel43.Caption:= qryCertidao.FieldByName('data_nascimento').AsString;
    F_RegistroAnimalPreview_MOD2.QRLabel44.Caption:= qryCertidao.FieldByName('sexo').AsString;

    F_RegistroAnimalPreview_MOD2.QRLabel23.Caption:= qryCertidao.FieldByName('especie').AsString;
    F_RegistroAnimalPreview_MOD2.QRLabel24.Caption:= qryCertidao.FieldByName('cor').AsString;
    F_RegistroAnimalPreview_MOD2.QRMemo2.Lines.Add(qryCertidao.FieldByName('caracteristicas').AsString);
    F_RegistroAnimalPreview_MOD2.QRMemo3.Lines.Add(qryCertidao.FieldByName('observacao').AsString);
    F_RegistroAnimalPreview_MOD2.QRLabel25.Caption:= F_Menu.Label7.Caption +', '+DateToStr(Now);
    F_RegistroAnimalPreview_MOD2.QrLabel33.Caption := Dm.qryGenerico_Auxiliar3.FieldByName('selo').AsString;
    F_RegistroAnimalPreview_MOD2.QrLabel34.Caption := Dm.qryGenerico_Auxiliar3.FieldByName('selo_validador').AsString;
    if  FileExists(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG') Then
      F_RegistroAnimalPreview_MOD2.QRImage1.Picture.LoadFromFile(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG');

    F_RegistroAnimalPreview_MOD2.QRLabel26.Caption:= F_Menu.LbNomeTitular.Caption;
    AtualizaImagem;
    F_RegistroAnimalPreview_MOD2.QuickRep1.Preview;
    F_RegistroAnimalPreview_MOD2.Destroy;
    F_RegistroAnimalPreview_MOD2 := NIL;

  End
  Else
  Begin
    F_RegistroAnimalPreview_MOD1:= TF_RegistroAnimalPreview_MOD1.Create(Nil);

    F_RegistroAnimalPreview_MOD1.QRLabel2.Caption := 'ESTADO DA BAHIA - COMARCA DE ' + UpperCase(F_Menu.Label7.Caption);//
    F_RegistroAnimalPreview_MOD1.QRLabel3.Caption := F_menu.Label29.Caption;
    F_RegistroAnimalPreview_MOD1.QRLabel4.Caption := F_Menu.Label11.Caption +' - '+F_Menu.Labelcep.Caption;
    F_RegistroAnimalPreview_MOD1.QRLabel5.Caption := F_Menu.Label12.Caption +' - '+F_Menu.Label55.Caption;


    {F_RegistroAnimalPreview_MOD1.QRMemo1.Lines.Clear;
    F_RegistroAnimalPreview_MOD1.QRMemo1.Lines.Add(UpperCase(F_Menu.LbNomeTitular.Caption) +', Titular do 2º Ofício de Registro de Títulos e Documentos e Pessoa Jurídica da '+
                                              'comarca de Maceió, Capital do Estado de Alagoas, na forma da lei.'); }

    dm.qryGenerico_Auxiliar3.Close;
    dm.qryGenerico_Auxiliar3.SQL.Clear;
    dm.qryGenerico_Auxiliar3.SQL.Add('select data_r, data_p, selo, selo_validador  from td where p_auxiliar = '+QuotedStr(F_Exame.MaskEdit1.Text)+'');
    dm.qryGenerico_Auxiliar3.Open;


    F_RegistroAnimalPreview_MOD1.QRLabel17.Caption:= F_Exame.MaskEdit1.Text;
    F_RegistroAnimalPreview_MOD1.QRLabel18.Caption:= Dm.qryGenerico_Auxiliar3.FieldByName('data_r').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel19.Caption:= F_Exame.Label29.Caption;
    F_RegistroAnimalPreview_MOD1.QRLabel20.Caption:= Dm.qryGenerico_Auxiliar3.FieldByName('data_p').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel22.Caption:= qryCertidao.FieldByName('nome').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel21.Caption:= qryCertidao.FieldByName('nome_guardiao').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel45.Caption:= qryCertidao.FieldByName('registro_pedigree').AsString;


    F_RegistroAnimalPreview_MOD1.QRLabel43.Caption:= qryCertidao.FieldByName('data_nascimento').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel44.Caption:= qryCertidao.FieldByName('sexo').AsString;

    F_RegistroAnimalPreview_MOD1.QRLabel23.Caption:= qryCertidao.FieldByName('especie').AsString;
    F_RegistroAnimalPreview_MOD1.QRLabel24.Caption:= qryCertidao.FieldByName('cor').AsString;
    F_RegistroAnimalPreview_MOD1.QRMemo2.Lines.Add(qryCertidao.FieldByName('caracteristicas').AsString);
    F_RegistroAnimalPreview_MOD1.QRMemo3.Lines.Add(qryCertidao.FieldByName('observacao').AsString);
    F_RegistroAnimalPreview_MOD1.QRLabel25.Caption:= F_Menu.Label7.Caption +', '+DateToStr(Now);
    F_RegistroAnimalPreview_MOD1.QrLabel33.Caption := Dm.qryGenerico_Auxiliar3.FieldByName('selo').AsString;
    F_RegistroAnimalPreview_MOD1.QrLabel34.Caption := Dm.qryGenerico_Auxiliar3.FieldByName('selo_validador').AsString;
    if  FileExists(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG') Then
      F_RegistroAnimalPreview_MOD1.QRImage1.Picture.LoadFromFile(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG');

    F_RegistroAnimalPreview_MOD1.QRLabel26.Caption:= F_Menu.LbNomeTitular.Caption;
    AtualizaImagem;
    F_RegistroAnimalPreview_MOD1.QuickRep1.Preview;
    F_RegistroAnimalPreview_MOD1.Destroy;
    F_RegistroAnimalPreview_MOD1 := NIL;
  
    {F_RegistroAnimalPreview:= TF_RegistroAnimalPreview.Create(Nil);

    F_RegistroAnimalPreview.QRLabel2.Caption := 'ESTADO DA BAHIA - COMARCA DE SALVADOR';//
    F_RegistroAnimalPreview.QRLabel3.Caption := F_menu.Label29.Caption;
    F_RegistroAnimalPreview.QRLabel4.Caption := F_Menu.Label11.Caption +' - '+F_Menu.Label36.Caption;
    F_RegistroAnimalPreview.QRLabel5.Caption := F_Menu.Label12.Caption +' - '+F_Menu.Label55.Caption;


    F_RegistroAnimalPreview.QRMemo1.Lines.Clear;
    F_RegistroAnimalPreview.QRMemo1.Lines.Add(UpperCase(F_Menu.LbNomeTitular.Caption) +', Titular do 2º Ofício de Registro de Títulos e Documentos e Pessoa Jurídica da '+
                                              'comarca de Salvador, Capital do Estado de Alagoas, na forma da lei.');

    dm.qryGenerico_Auxiliar3.Close;
    dm.qryGenerico_Auxiliar3.SQL.Clear;
    dm.qryGenerico_Auxiliar3.SQL.Add('select data_r, data_p, selo, selo_validador  from td where p_auxiliar = '+QuotedStr(F_Exame.MaskEdit1.Text)+'');
    dm.qryGenerico_Auxiliar3.Open;


    F_RegistroAnimalPreview.QRLabel17.Caption:= F_Exame.MaskEdit1.Text;
    F_RegistroAnimalPreview.QRLabel18.Caption:= Dm.qryGenerico_Auxiliar3.FieldByName('data_r').AsString;
    F_RegistroAnimalPreview.QRLabel19.Caption:= F_Exame.MaskEdit1.Text;
    F_RegistroAnimalPreview.QRLabel20.Caption:= Dm.qryGenerico_Auxiliar3.FieldByName('data_p').AsString;
    F_RegistroAnimalPreview.QRLabel22.Caption:= qryCertidao.FieldByName('nome').AsString;
    F_RegistroAnimalPreview.QRLabel21.Caption:= qryCertidao.FieldByName('nome_guardiao').AsString;
    F_RegistroAnimalPreview.QRLabel23.Caption:= qryCertidao.FieldByName('especie').AsString;
    F_RegistroAnimalPreview.QRLabel24.Caption:= qryCertidao.FieldByName('cor').AsString;
    F_RegistroAnimalPreview.QRMemo2.Lines.Add(qryCertidao.FieldByName('caracteristicas').AsString);
    F_RegistroAnimalPreview.QRMemo3.Lines.Add(qryCertidao.FieldByName('observacao').AsString);
    F_RegistroAnimalPreview.QRLabel25.Caption:= F_Menu.Label7.Caption +', '+DateToStr(Now);
    F_RegistroAnimalPreview.QrLabel33.Caption := Dm.qryGenerico_Auxiliar3.FieldByName('selo').AsString;
    F_RegistroAnimalPreview.QrLabel34.Caption := Dm.qryGenerico_Auxiliar3.FieldByName('selo_validador').AsString;
    if  FileExists(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG') Then
      F_RegistroAnimalPreview.QRImage1.Picture.LoadFromFile(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG');

    F_RegistroAnimalPreview.QRLabel26.Caption:= F_Menu.LbNomeTitular.Caption;
    AtualizaImagem;
    F_RegistroAnimalPreview.QuickRep1.Preview;
    F_RegistroAnimalPreview.Destroy;
    F_RegistroAnimalPreview := NIL;}
  End;
end;

procedure TF_RegistroAnimal.AtualizaImagem;
begin
  if qryCertidao.FieldByName('registro').AsString <> '' Then
  Begin
    if (FileExists(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG')) Then
      Image1.Picture.LoadFromFile(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG');
  End;
end;

procedure TF_RegistroAnimal.qryCertidaoAfterScroll(DataSet: TDataSet);
begin
  AtualizaImagem;
end;

procedure TF_RegistroAnimal.qryCertidaoBeforeScroll(DataSet: TDataSet);
begin
  AtualizaImagem;
end;

procedure TF_RegistroAnimal.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    perform(wm_nextdlgctl,0,0);
  end;
end;

procedure TF_RegistroAnimal.BitBtn5Click(Sender: TObject);
begin
// 01221489000194


 { If (F_Menu.Label39.Caption = '13225586000134') or (F_Menu.Label39.Caption = '13.225.586/0001-34') or (TirarTudo(F_Menu.Label39.Caption, '-', '.', '/') ='01221489000194') Then // Lauro de Freitas RTD
  Begin    }
    F_RegistroAnimalPreview_MiniMOD1:= TF_RegistroAnimalPreview_MiniMOD1.Create(Nil);

    {F_RegistroAnimalPreview_MiniMOD1.QRLabel2.Caption := 'ESTADO DA BAHIA - COMARCA DE SALVADOR';//
    F_RegistroAnimalPreview_MiniMOD1.QRLabel3.Caption := F_menu.Label29.Caption;
    F_RegistroAnimalPreview_MiniMOD1.QRLabel4.Caption := F_Menu.Label11.Caption +' - '+F_Menu.Label36.Caption;
    F_RegistroAnimalPreview_MiniMOD1.QRLabel5.Caption := F_Menu.Label12.Caption +' - '+F_Menu.Label55.Caption;


    {F_RegistroAnimalPreview_MiniMOD1.QRMemo1.Lines.Clear;
    F_RegistroAnimalPreview_MiniMOD1.QRMemo1.Lines.Add(UpperCase(F_Menu.LbNomeTitular.Caption) +', Titular do 2º Ofício de Registro de Títulos e Documentos e Pessoa Jurídica da '+
                                              'comarca de Maceió, Capital do Estado de Alagoas, na forma da lei.'); }

    dm.qryGenerico_Auxiliar3.Close;
    dm.qryGenerico_Auxiliar3.SQL.Clear;
    dm.qryGenerico_Auxiliar3.SQL.Add('select data_r, data_p, selo, selo_validador  from td where p_auxiliar = '+QuotedStr(F_Exame.MaskEdit1.Text)+'');
    dm.qryGenerico_Auxiliar3.Open;


    F_RegistroAnimalPreview_MiniMOD1.QRLabel17.Caption:= F_Exame.MaskEdit1.Text;
    F_RegistroAnimalPreview_MiniMOD1.QRLabel18.Caption:= Dm.qryGenerico_Auxiliar3.FieldByName('data_r').AsString;
    F_RegistroAnimalPreview_MiniMOD1.QRLabel19.Caption:= F_Exame.Label29.Caption;
    F_RegistroAnimalPreview_MiniMOD1.QRLabel20.Caption:= Dm.qryGenerico_Auxiliar3.FieldByName('data_p').AsString;
    F_RegistroAnimalPreview_MiniMOD1.QRLabel22.Caption:= qryCertidao.FieldByName('nome').AsString;
    F_RegistroAnimalPreview_MiniMOD1.QRLabel21.Caption:= qryCertidao.FieldByName('nome_guardiao').AsString;
    F_RegistroAnimalPreview_MiniMOD1.QRLabel45.Caption:= qryCertidao.FieldByName('registro_pedigree').AsString;


    F_RegistroAnimalPreview_MiniMOD1.QRLabel43.Caption:= qryCertidao.FieldByName('data_nascimento').AsString;
    F_RegistroAnimalPreview_MiniMOD1.QRLabel44.Caption:= qryCertidao.FieldByName('sexo').AsString;

    F_RegistroAnimalPreview_MiniMOD1.QRLabel23.Caption:= qryCertidao.FieldByName('especie').AsString;
    F_RegistroAnimalPreview_MiniMOD1.QRLabel24.Caption:= qryCertidao.FieldByName('cor').AsString;
    F_RegistroAnimalPreview_MiniMOD1.QRMemo2.Lines.Add(qryCertidao.FieldByName('caracteristicas').AsString);
    F_RegistroAnimalPreview_MiniMOD1.QRMemo3.Lines.Add(qryCertidao.FieldByName('observacao').AsString);
    F_RegistroAnimalPreview_MiniMOD1.QRLabel25.Caption:= F_Menu.Label7.Caption +', '+DateToStr(Now);
    F_RegistroAnimalPreview_MiniMOD1.QrLabel33.Caption := Dm.qryGenerico_Auxiliar3.FieldByName('selo').AsString;
    F_RegistroAnimalPreview_MiniMOD1.QrLabel34.Caption := Dm.qryGenerico_Auxiliar3.FieldByName('selo_validador').AsString;
    if  FileExists(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG') Then
      F_RegistroAnimalPreview_MiniMOD1.QRImage1.Picture.LoadFromFile(F_Menu.CaminhoImagemAnimal.Caption + strzero(qryCertidao.FieldByName('registro').AsString,7) + '.JPG');

    F_RegistroAnimalPreview_MiniMOD1.QRLabel26.Caption:= F_Menu.LbNomeTitular.Caption;
    AtualizaImagem;
    F_RegistroAnimalPreview_MiniMOD1.QuickRep1.Preview;
    F_RegistroAnimalPreview_MiniMOD1.Destroy;
    F_RegistroAnimalPreview_MiniMOD1 := NIL;

  //End

end;

end.
