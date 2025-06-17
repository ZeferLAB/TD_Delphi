unit ExameC;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, StdCtrls, Mask, Buttons, ToolEdit, CurrEdit, Grids,
  DBGrids, ComCtrls, Menus, jpeg, DB, DBTables,shellapi;

type
  TF_ExameC = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Panel2: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label18: TLabel;
    MaskEdit13: TMaskEdit;
    Panel3: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    BitBtn5: TBitBtn;
    Label20: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label9: TLabel;
    RichEdit1: TRichEdit;
    Label3: TLabel;
    Label10: TLabel;
    Panel4: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    Label26: TLabel;
    MaskEdit7: TMaskEdit;
    CurrencyEdit14: TCurrencyEdit;
    Label35: TLabel;
    Label36: TLabel;
    CurrencyEdit15: TCurrencyEdit;
    Label12: TLabel;
    CurrencyEdit16: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    Label5: TLabel;
    Label19: TLabel;
    MaskEdit2: TMaskEdit;
    Label27: TLabel;
    MaskEdit6: TMaskEdit;
    Label17: TLabel;
    ComboBox1: TComboBox;
    Label21: TLabel;
    ComboBox6: TComboBox;
    Label28: TLabel;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit9: TCurrencyEdit;
    Label29: TLabel;
    ComboBox4: TComboBox;
    MaskEdit27: TMaskEdit;
    ComboBox11: TComboBox;
    MaskEdit8: TMaskEdit;
    Label33: TLabel;
    MaskEdit14: TMaskEdit;
    ControlBar1: TControlBar;
    Label34: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    Label40: TLabel;
    CurrencyEdit10: TCurrencyEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    MaskEdit18: TMaskEdit;
    MaskEdit19: TMaskEdit;
    MaskEdit20: TMaskEdit;
    MaskEdit21: TMaskEdit;
    MaskEdit22: TMaskEdit;
    MaskEdit23: TMaskEdit;
    CurrencyEdit11: TCurrencyEdit;
    CurrencyEdit12: TCurrencyEdit;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel6: TPanel;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    Label32: TLabel;
    Label39: TLabel;
    MaskEdit9: TMaskEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    MaskEdit12: TMaskEdit;
    MaskEdit17: TMaskEdit;
    Label11: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    MaskEdit24: TMaskEdit;
    PopupMenu1: TPopupMenu;
    IncluirItem1: TMenuItem;
    CorrigirItem1: TMenuItem;
    ExcluirItem1: TMenuItem;
    Label51: TLabel;
    MaskEdit25: TMaskEdit;
    BitBtn6: TBitBtn;
    Image1: TImage;
    BitBtn7: TBitBtn;
    Label30: TLabel;
    EdNumeroDAJE: TMaskEdit;
    Label31: TLabel;
    EdNumeroSerie: TMaskEdit;
    BitBtn9: TBitBtn;
    BitBtn8: TBitBtn;
    Label52: TLabel;
    edtAverbacao: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Limpar(Sender : TOBject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Gravar(Sender : TOBject);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3Enter(Sender: TObject);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox6Exit(Sender: TObject);
    procedure ComboBox6Enter(Sender: TObject);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Corrigir2Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    Procedure Grava_Cota(Sender : TObject);
    procedure MaskEdit9Exit(Sender: TObject);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4Exit(Sender: TObject);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Exit(Sender: TObject);
    procedure MaskEdit12Exit(Sender: TObject);
    procedure MaskEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure IncluirItem1Click(Sender: TObject);
    procedure CorrigirItem1Click(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit23Exit(Sender: TObject);
    procedure MaskEdit23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MaskEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure CurrencyEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtAverbacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    nr_protocolo: String;
  public
    { Public declarations }
    v_sql : String;
    qry : TQuery;
    function VerificaStatusDaCertidao(value: String): String;
    function VerificaSeCertidaoLiberado(value: String): String;
    procedure AtualizarCampoLiberado_da_CERTIDAO( value,nr_protoc : String );
  end;

var
  F_ExameC: TF_ExameC;
  emol, bus, des, inf, tri, pro, def, sub, tot : Currency;
  ofi, est, ipe, sin,  cus : Currency;
  ofip, estp, ipep, sinp, trip, cusp : Currency;
  dt_tab, subDiretorio : String;
implementation

uses DMTD, Menu, Prot, FuncGeral, ProcGeral, U_Daje, U_Certidao, ImagemDaje,
  Status, StatusC, U_RegistroAnimal;

{$R *.DFM}

Procedure Abre_CadTab;
begin
  Dm.Cad_Tab2.Close;
  Dm.Cad_Tab2.Sql.Clear;
  Dm.Cad_Tab2.Sql.Add('SELECT * FROM cad_tab order by tabela, item');
  Dm.Cad_Tab2.Open;
  Dm.Cad_Tab2.FindFirst;
end;

Procedure Carrega_CadTab;
begin
  With F_ExameC do
  begin
    MaskEdit19.Text      := Dm.Cad_Tab2.fieldbyname('tabela').AsString;
    MaskEdit20.Text      := Dm.Cad_Tab2.fieldbyname('item').AsString;
    MaskEdit21.Text      := Dm.Cad_Tab2.fieldbyname('subitem').AsString;
    MaskEdit22.Text      := Dm.Cad_Tab2.fieldbyname('descricao').AsString;
    CurrencyEdit11.Value := Dm.Cad_Tab2.fieldbyname('valor').AsCurrency;
    CurrencyEdit12.Value := Dm.Cad_Tab2.fieldbyname('valor').AsCurrency;
  end;
end;

Procedure Carrega_Pedid;
begin
  DM.TD_Pedid.Close;
  DM.TD_Pedid.Sql.Clear;
  DM.TD_Pedid.Sql.Add('SELECT * FROM td_pedid');
  //DM.TD_Pedid.Sql.Add('WHERE');
  DM.TD_Pedid.Sql.Add('where p_auxiliar = ' + Trim(F_ExameC.nr_protocolo) + ' AND tipo_prot = "C"');
  DM.TD_Pedid.Open;
  DM.TD_Pedid.FindFirst;

  with (F_ExameC) do
  begin
    MaskEdit18.Text := DM.TD_Pedid.fieldbyname('cod_lae').AsString;
    MaskEdit19.Text := DM.TD_Pedid.fieldbyname('tabela').AsString;
    MaskEdit20.Text := DM.TD_Pedid.fieldbyname('item').AsString;
    MaskEdit21.Text := DM.TD_Pedid.fieldbyname('subitem').AsString;
    MaskEdit22.Text := DM.TD_Pedid.fieldbyname('descricao').AsString;
    MaskEdit23.Text := DM.TD_Pedid.fieldbyname('qtde').AsString;
    CurrencyEdit11.Value := DM.TD_Pedid.fieldbyname('valor_unit').AsCurrency;
    CurrencyEdit12.Value := DM.TD_Pedid.fieldbyname('valor_calc').AsCurrency;
  end;
end;

Procedure Carrega_Pedid2;
begin
  with (F_ExameC) do
  begin
    MaskEdit18.Text := DM.TD_Pedid.fieldbyname('cod_lae').AsString;
    MaskEdit19.Text := DM.TD_Pedid.fieldbyname('tabela').AsString;
    MaskEdit20.Text := DM.TD_Pedid.fieldbyname('item').AsString;
    MaskEdit21.Text := DM.TD_Pedid.fieldbyname('subitem').AsString;
    MaskEdit22.Text := DM.TD_Pedid.fieldbyname('descricao').AsString;
    MaskEdit23.Text := DM.TD_Pedid.fieldbyname('qtde').AsString;
    CurrencyEdit11.Value := DM.TD_Pedid.fieldbyname('valor_unit').AsCurrency;
    CurrencyEdit12.Value := DM.TD_Pedid.fieldbyname('valor_calc').AsCurrency;
  end;
end;

Procedure TF_ExameC.Grava_Cota(Sender : TObject);
begin
  if (StrToInt(MaskEdit9.Text) <= 0) then
  begin
    ShowMessage('Gravação não efetuada !');
    Exit;
  end;
  // atualizando após o append.
  if (Label3.Caption <> 'C') then
  begin
    Dm.CotaCert.Close;
    Dm.CotaCert.Sql.Clear;
    Dm.CotaCert.Sql.Add('SELECT * FROM cotacert');
    Dm.CotaCert.Sql.Add('WHERE');
    Dm.CotaCert.Sql.Add('recno = 0');
    Dm.CotaCert.Open;
    Dm.CotaCert.Append;
  end
  else Dm.CotaCert.Edit;
{  Dm.CotaCert.FieldByName('data_cota').asString           := MaskEdit11.Text;
  Dm.CotaCert.FieldByName('nr_protoc').asString           := Trim(MaskEdit1.Text);
  Dm.CotaCert.FieldByName('qtde_cer').asInteger           := StrToInt(MaskEdit9.Text);
  Dm.CotaCert.FieldByName('qtde_pag').asInteger           := 0;
  Dm.CotaCert.FieldByName('qtde').asInteger               := (StrToInt(MaskEdit9.Text));
  Dm.CotaCert.FieldByName('tabela').asString              := Trim(Copy(ComboBox1.Text, 1,3));
  Dm.CotaCert.FieldByName('divisor').asString             := Trim(Copy(ComboBox6.Text, 1,2));
  dm.cotacert.fieldByName('v_busca').AsCurrency           := VrBusca;
  dm.cotacert.FieldByName('v_emolumento').AsCurrency      := VrEmolumentos;
  dm.cotacert.FieldByName('v_desarquivamento').AsCurrency := VrDesarquivamento;
  dm.cotacert.FieldByName('v_informatica').AsCurrency     := VrInformatica;
  DM.cotacert.FieldByName('v_subtotal').ascurrency        := VrSubTotal;
  DM.CotaCert.FieldByName('defensoria').AsCurrency        := VrDefensoria;
  DM.CotaCert.FieldByName('procuradoria').AsCurrency      := VrProcuradoria;
  DM.CotaCert.FieldByName('tribunal').AsCurrency          := VrTribunal;
  Dm.CotaCert.FieldByName('total').asCurrency             := (CurrencyEdit7.Value);
  Dm.CotaCert.Post;
  // atualizando após o append.
  Dm.CotaCert.Close;
  Dm.CotaCert.Sql.Clear;
  Dm.CotaCert.Sql.Add('SELECT * FROM cotacert');
  Dm.CotaCert.Sql.Add('WHERE');
  Dm.CotaCert.Sql.Add('nr_protoc = ' + Trim(F_ExameC.MaskEdit1.Text));
  Dm.CotaCert.Open;
  Dm.CotaCert.FindLast;
 }
end;

Procedure TF_ExameC.Gravar(Sender : TOBject);
var
  mudouMovimento,
  mudouRecibo,
  mudouRegistro,
  mudouNatureza,
  mudouDeposito,
  mudouCustas,
  mudouApresentan,
  mudouTipDoc1,
  mudouDoc1,
  mudouTipDoc2,
  mudouDoc2,
  mudouTelefone,
  mudouPropriet,
  mudouDescricao,
  mudouTabela,
  mudouDivisor,
  mudouFolha,
  mudouPag,
  mudouValorPagina,
  mudouValorFolha,
  mudouValorEmolumento,
  mudouValorTribunal,
  mudouLivroC,
  mudouFolhaC,
  mudouAnos: String;  
begin

  Dm.qryGenerico.Close;
  Dm.qryGenerico.Sql.Clear;
  Dm.qryGenerico.Sql.Add('SELECT * FROM certidao');
  Dm.qryGenerico.Sql.Add('WHERE');
  Dm.qryGenerico.Sql.Add('nr_protoc = ' + MaskEdit1.Text);
  Dm.qryGenerico.Sql.Add('or averbacao = ' + QuotedStr(MaskEdit1.Text));
  Dm.qryGenerico.Open;

  Dm.Certidao.Close;
  Dm.Certidao.Sql.Clear;
  Dm.Certidao.Sql.Add('SELECT * FROM certidao');
  Dm.Certidao.Sql.Add('WHERE');
  Dm.Certidao.Sql.Add('nr_protoc = ' + MaskEdit1.Text);
  Dm.Certidao.Sql.Add('or averbacao = ' + QuotedStr(MaskEdit1.Text));  
  Dm.Certidao.Open;
  if (Dm.Certidao.RecordCount <> 0) then
  begin

    if Dm.qryGenerico.FieldByName('movimento').AsString <> Trim(MaskEdit13.Text) Then
    begin
      mudouMovimento:= Trim(MaskEdit13.Text);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Data, foi alterado de: '+Dm.qryGenerico.FieldByName('movimento').asstring+' para: '+mudouMovimento+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('recibo').AsString <> Trim(MaskEdit2.Text) Then
    begin
      mudouRecibo:= Trim(MaskEdit2.Text);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Recibo, foi alterado de: '+Dm.qryGenerico.FieldByName('recibo').asstring+' para: '+mudouRecibo+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('protocolo').AsString <> Trim(MaskEdit6.Text) Then
    begin
      mudouRegistro:= Trim(MaskEdit6.Text);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Registro para Cetiudão, foi alterado de: '+Dm.qryGenerico.FieldByName('protocolo').asstring+' para: '+mudouRegistro+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('averbacao').AsString <> Trim(edtAverbacao.Text) Then
    begin
      mudouRegistro:= Trim(edtAverbacao.Text);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Averbação, foi alterado de: '+Dm.qryGenerico.FieldByName('averbacao').asstring+' para: '+mudouRegistro+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('natureza').AsString <> Copy(ComboBox3.Text, 1,3) Then
    begin
      mudouNatureza:= Trim(Copy(ComboBox3.Text, 1,3));
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Natureza, foi alterado de: '+Dm.qryGenerico.FieldByName('natureza').asstring+' para: '+mudouNatureza+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('deposito').AsCurrency <> CurrencyEdit1.Value Then
    begin
      mudouDeposito:= FloatToStr(CurrencyEdit1.Value);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Depósito, foi alterado de: '+Dm.qryGenerico.FieldByName('deposito').asstring+' para: '+mudouDeposito+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('custas').AsCurrency <> CurrencyEdit10.Value Then
    begin
      mudouCustas:= FloatToStr(CurrencyEdit10.Value);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Custas, foi alterado de: '+Dm.qryGenerico.FieldByName('custas').asstring+' para: '+mudouCustas+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('apresentan').AsString <> MaskEdit3.Text Then
    begin
      mudouApresentan:= MaskEdit3.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Apresentante, foi alterado de: '+Dm.qryGenerico.FieldByName('apresentan').asstring+' para: '+mudouApresentan+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('tip_doc1').AsString <> trim(ComboBox4.text) Then
    begin
      mudouTipDoc1:= trim(ComboBox4.text);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: CPF/CNPJ, foi alterado de: '+Dm.qryGenerico.FieldByName('tip_doc1').asstring+' para: '+mudouTipDoc1+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('doc1').AsString <> TirarTudo(Maskedit27.Text, '.', '/', '-') Then
    begin
      mudouDoc1:= TirarTudo(Maskedit27.Text, '.', '/', '-');
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Documento, foi alterado de: '+Dm.qryGenerico.FieldByName('doc1').asstring+' para: '+mudouDoc1+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('tip_doc2').AsString <> trim(ComboBox11.text) Then
    begin
      mudouTipDoc2:= trim(ComboBox11.text);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Tipo RG, foi alterado de: '+Dm.qryGenerico.FieldByName('tip_doc2').asstring+' para: '+mudouTipDoc2+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('doc2').AsString <> trim(Maskedit8.text) Then
    begin
      mudouDoc2:= trim(Maskedit8.text);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Documento RG, foi alterado de: '+Dm.qryGenerico.FieldByName('doc2').asstring+' para: '+mudouDoc2+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('telefone').AsString <> Trim(MaskEdit4.Text) Then
    begin
      mudouTelefone:= Trim(MaskEdit4.Text);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Telefone, foi alterado de: '+Dm.qryGenerico.FieldByName('telefone').asstring+' para: '+mudouTelefone+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('propriet').AsString <> Trim(MaskEdit5.Text) Then
    begin
      mudouPropriet:= Trim(MaskEdit5.Text);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Nome para Busca, foi alterado de: '+Dm.qryGenerico.FieldByName('propriet').asstring+' para: '+mudouPropriet+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('ext_nat').AsString <> Trim(ComboBox3.Text) Then
    begin
      mudouNatureza:= Trim(ComboBox3.Text);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Natureza, foi alterado de: '+Dm.qryGenerico.FieldByName('ext_nat').asstring+' para: '+mudouNatureza+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('descricao').AsString <> Trim(RichEdit1.Lines.Text) Then
    begin
      mudouDescricao:= Trim(RichEdit1.Lines.Text);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Descrição, foi alterado de: '+Dm.qryGenerico.FieldByName('ext_nat').asstring+' para: '+mudouNatureza+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('tabela').AsString <> trim(copy(ComboBox1.text, 1, 3)) Then
    begin
      mudouTabela:= ComboBox1.text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Tabela, foi alterado de: '+Dm.qryGenerico.FieldByName('tabela').asstring+' para: '+mudouTabela+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('divisor').AsString <> Trim(Copy(ComboBox6.Text, 1,2)) Then
    begin
      mudouDivisor:= ComboBox6.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Divisor, foi alterado de: '+Dm.qryGenerico.FieldByName('divisor').asstring+' para: '+mudouDivisor+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('folha').AsString <> Trim(MaskEdit14.Text) Then
    begin
      mudouFolha:= MaskEdit14.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Folha, foi alterado de: '+Dm.qryGenerico.FieldByName('folha').asstring+' para: '+mudouFolha+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('pag').AsString <> Trim(MaskEdit25.Text) Then
    begin
      mudouPag:= MaskEdit25.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Página, foi alterado de: '+Dm.qryGenerico.FieldByName('folha').asstring+' para: '+mudouPag+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('vl_pag').AsString <> FloatToStr(CurrencyEdit8.Value) Then
    begin
      mudouValorPagina:= FloatToStr(CurrencyEdit8.Value);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Valor da Pág., foi alterado de: '+Dm.qryGenerico.FieldByName('vl_pag').asstring+' para: '+mudouValorPagina+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('vl_fol').AsString <> FloatToStr(CurrencyEdit9.Value) Then
    begin
      mudouValorFolha:= FloatToStr(CurrencyEdit9.Value);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Valor da Folha, foi alterado de: '+Dm.qryGenerico.FieldByName('vl_fol').asstring+' para: '+mudouValorFolha+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('v_emolumento').AsString <> FloatToStr(calc_emol) Then
    begin
      mudouValorEmolumento:= FloatToStr(calc_emol);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Valor da Folha, foi alterado de: '+Dm.qryGenerico.FieldByName('v_emolumento').asstring+' para: '+mudouValorEmolumento+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('tribunal').AsString <> FloatToStr(calc_vfetj) Then
    begin
      mudouValorTribunal:= FloatToStr(calc_vfetj);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Valor do Tribunal, foi alterado de: '+Dm.qryGenerico.FieldByName('v_emolumento').asstring+' para: '+mudouValorTribunal+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('livro_c').AsString <> MaskEdit15.Text Then
    begin
      mudouLivroC:= MaskEdit15.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Livro C, foi alterado de: '+Dm.qryGenerico.FieldByName('livro_c').asstring+' para: '+mudouLivroC+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('folha_c').AsString <> MaskEdit16.Text Then
    begin
      mudouFolhaC:= MaskEdit16.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Folha C, foi alterado de: '+Dm.qryGenerico.FieldByName('folha_c').asstring+' para: '+mudouFolhaC+'', nr_protocolo);
    End;

    if Dm.qryGenerico.FieldByName('anos').AsString <> MaskEdit17.Text Then
    begin
      mudouAnos:= MaskEdit17.Text;
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Campo: Ano, foi alterado de: '+Dm.qryGenerico.FieldByName('anos').asstring+' para: '+mudouAnos+'', nr_protocolo);
    End;

    Dm.Certidao.Edit;
    Dm.Certidao.FieldByName('movimento').asString           := Trim(MaskEdit13.Text);
    dm.certidao.FieldByName('recibo').AsString              := MaskEdit2.Text;
    dm.certidao.FieldByName('protocolo').AsString           := MaskEdit6.Text;
    dm.certidao.FieldByName('averbacao').AsString           := edtAverbacao.Text;
    Dm.Certidao.FieldByName('natureza').asString            := Copy(ComboBox3.Text, 1,3);
    Dm.Certidao.FieldByName('deposito').asCurrency          := CurrencyEdit1.Value;
    Dm.Certidao.FieldByName('custas').asCurrency            := CurrencyEdit10.Value;
    Dm.Certidao.FieldByName('apresentan').asString          := Trim(MaskEdit3.Text);
    dm.Certidao.FieldByName('tip_doc1').AsString            := trim(ComboBox4.text);
    dm.certidao.FieldByName('doc1').AsString                := TirarTudo(Maskedit27.Text, '.', '/', '-');
    dm.Certidao.FieldByName('tip_doc2').AsString            := trim(ComboBox11.text);
    dm.certidao.FieldByName('doc2').AsString                := trim(MaskEdit8.Text);
    Dm.Certidao.FieldByName('telefone').asString            := Trim(MaskEdit4.Text);
    Dm.Certidao.FieldByName('propriet').asString            := Trim(MaskEdit5.Text);
    Dm.Certidao.FieldByName('ext_nat').asString             := Trim(ComboBox3.Text);
    Dm.certidao.FieldByName('descricao').asString           := Trim(RichEdit1.Lines.Text);
    Dm.certidao.FieldByName('tabela').AsString              := trim(copy(ComboBox1.text, 1, 3));
    Dm.certidao.FieldByName('divisor').asString             := Trim(Copy(ComboBox6.Text, 1,2));
    dm.certidao.FieldByName('folha').AsString               := MaskEdit14.Text;
    dm.certidao.FieldByName('pag').AsString                 := MaskEdit25.Text;
    dm.certidao.FieldByName('vl_pag').AsCurrency            := CurrencyEdit8.Value;
    dm.certidao.FieldByName('vl_fol').AsCurrency            := CurrencyEdit9.Value;
    Dm.certidao.FieldByName('v_emolumento').AsCurrency      := calc_emol;
    DM.certidao.FieldByName('tribunal').AsCurrency          := calc_vfetj;
    dm.Certidao.FieldByName('livro_c').AsString             := MaskEdit15.Text;
    dm.Certidao.FieldByName('folha_c').AsString             := MaskEdit16.Text;
    dm.Certidao.FieldByName('anos').AsString                := MaskEdit17.Text;
    Dm.Certidao.Post;




  end;
  Dm.Certidao.Close;
end;

Procedure TF_ExameC.Limpar(Sender : TOBject);
Begin
  Dm.CotaCert.Close;
  RichEdit1.Lines.Clear;
  nr_protocolo         := ''; 
  BitBtn1.Enabled      := False;
  BitBtn5.Enabled      := False;
  ComboBox3.Text       := '';
  CurrencyEdit1.Value  := 0.00;
  CurrencyEdit10.Value  := 0.00;
  MaskEdit2.Text       := '';
  MaskEdit3.Text       := '';
  MaskEdit4.Text       := '';
  MaskEdit5.Text       := '';
  MaskEdit6.Text       := '';
  edtAverbacao.Text    := '';
  MaskEdit7.Text       := '0';
  MaskEdit8.Text       := '';
  MaskEdit9.Text       := '1';
  //MaskEdit10.Text      := '';
  //MaskEdit11.Text      := '';
  MaskEdit13.Text      := '';
  MaskEdit14.Text      := '0';
  MaskEdit15.Text      := '';
  MaskEdit16.Text      := '';
  MaskEdit27.Text      := '1';
  MaskEdit17.Text      := '';
  Label16.Visible      := False;
  Label16.Caption      := 'Label16';
  MaskEdit1.Enabled    := True;
  currencyedit2.value  := 0;
  currencyedit3.value  := 0;
  currencyedit4.value  := 0;
  currencyedit5.value  := 0;
  currencyedit6.value  := 0;
  currencyedit7.value  := 0;
  currencyedit8.value  := 0;
  currencyedit9.value  := 0;
  currencyedit14.value := 0;
  currencyedit15.value := 0;
  currencyedit16.value := 0;
  EdNumeroDAJE.Text    := '';
  EdNumeroSerie.Text   := '';
  CheckBox1.Checked := False;
  CheckBox2.Checked := False;
  Dm.Certidao.Close;
end;

Function LocalizaProt(Protocolo :String) : Boolean;
Begin
  Dm.Certidao.Close;
  Dm.Certidao.Sql.Clear;
  Dm.Certidao.Sql.Add('SELECT * FROM certidao');
  Dm.Certidao.Sql.Add('WHERE');
  Dm.Certidao.Sql.Add('nr_protoc = ' + QuotedStr(Trim(protocolo)));
  Dm.Certidao.Sql.Add('or averbacao = ' + QuotedStr(Trim(protocolo)));
  Dm.Certidao.Open;
  if (Dm.Certidao.RecordCount = 0) then
  begin
    Result := False;
    Dm.Certidao.Close;
    Exit;
  end;
  Result := True;
  with F_ExameC do
  begin
    nr_protocolo         := Dm.Certidao.FieldByName('nr_protoc').asString;
    MaskEdit13.Text      := Dm.Certidao.FieldByName('movimento').asString;
    MaskEdit2.Text       := dm.certidao.FieldByName('recibo').AsString;
    MaskEdit6.Text       := dm.certidao.FieldByName('protocolo').AsString;
    edtAverbacao.Text    := dm.certidao.FieldByName('averbacao').AsString;
    ComboBox3.Text       := Ver_NatCer(Dm.Certidao.FieldByName('natureza').asString, True);
    ComboBox1.Text       := Def_Tab(Dm.certidao.FieldByName('tabela').asstring, True);
    CurrencyEdit1.Value  := Dm.Certidao.FieldByName('deposito').asCurrency;
    CurrencyEdit10.Value := Dm.Certidao.FieldByName('custas').asCurrency;
    MaskEdit3.Text       := Dm.Certidao.FieldByName('apresentan').asString;
    MaskEdit4.Text       := Dm.Certidao.FieldByName('telefone').asString;
    MaskEdit5.Text       := Dm.Certidao.FieldByName('propriet').asString;
    MaskEdit9.Text       := Dm.Certidao.FieldByName('pag').asString;
    MaskEdit7.Text       := dm.certidao.FieldByName('pag').AsString;
    MaskEdit25.Text      := dm.certidao.FieldByName('pag').AsString;
    MaskEdit12.Text      := dm.certidao.FieldByName('folha').AsString;
    MaskEdit14.Text      := dm.certidao.FieldByName('folha').AsString;
    ComboBox4.Text       := dm.Certidao.fieldbyname('tip_doc1').AsString;
    MaskEdit27.Text      := dm.Certidao.fieldbyname('doc1').AsString;
    ComboBox11.Text      := dm.Certidao.fieldbyname('tip_doc2').AsString;
    MaskEdit8.Text       := dm.Certidao.fieldbyname('doc2').AsString;
    //MaskEdit10.Text      := dm.Certidao.fieldbyname('selo_serie').AsString;
    //MaskEdit11.Text      := dm.Certidao.fieldbyname('selo_numero').AsString;
    MaskEdit15.Text      := dm.Certidao.fieldbyname('livro_c').AsString;
    MaskEdit16.Text      := dm.Certidao.fieldbyname('folha_c').AsString;
    MaskEdit17.Text      := dm.Certidao.FieldByName('anos').AsString;
    EdNumeroDAJE.Text    := dm.Certidao.fieldbyname('daje').AsString;
    EdNumeroSerie.Text   := dm.Certidao.FieldByName('serie_daje').AsString;
    if dm.Certidao.FieldByName('cert_5anos').AsString = 'S' then CheckBox1.Checked := True else CheckBox1.Checked := False;
    if dm.Certidao.FieldByName('v_digitalizacao').AsInteger = 0 then CheckBox2.Checked := False else CheckBox2.Checked := True;
    //ComboBox1.Text       := Def_Tab(dm.Certidao.FieldByName('tabela').AsString, True);
    ComboBox6.Text       := Def_Div(dm.certidao.FieldByName('divisor').AsString, True);
    CurrencyEdit2.Value  := dm.Certidao.FieldByName('v_emolumento').AsCurrency;
    CurrencyEdit3.Value  := dm.Certidao.FieldByName('v_busca').AsCurrency;
    CurrencyEdit4.Value  := dm.Certidao.FieldByName('v_desarquivamento').AsCurrency;
    CurrencyEdit5.Value  := dm.Certidao.FieldByName('v_informatica').AsCurrency;
    CurrencyEdit8.Value  := dm.Certidao.FieldByName('v_digitalizacao').AsCurrency;
    CurrencyEdit9.Value  := dm.Certidao.FieldByName('v_conferencia').AsCurrency;
    CurrencyEdit6.Value  := dm.Certidao.FieldByName('v_subtotal').AsCurrency;
    CurrencyEdit7.Value  := dm.Certidao.FieldByName('tribunal').AsCurrency;
    CurrencyEdit14.Value := dm.Certidao.FieldByName('defensoria').AsCurrency;
    CurrencyEdit15.Value := dm.Certidao.FieldByName('procuradoria').AsCurrency;
    CurrencyEdit16.Value := dm.Certidao.FieldByname('custas').AsCurrency;
    Label16.Visible      := True;
    Label16.Caption      := Dm.Certidao.FieldByName('status').asString + ' EM ' + Dm.Certidao.FieldByName('stat_data').asString;
    RichEdit1.Lines.Add(Dm.Certidao.FieldByName('descricao').asString);
    BitBtn1.Enabled      := True;
    if (Dm.Certidao.FieldByName('status').asString = 'EM PROCESSO') then
    Begin
      BitBtn5.Enabled := True;
      BitBtn6.Enabled := False;
      BitBtn8.Enabled := False;
    End
    else
    Begin
      BitBtn5.Enabled := False;
      BitBtn6.Enabled := True;
      BitBtn8.Enabled := True;
      if Dm.Certidao.FieldByName('status').asString = 'PRONTO' then
      begin

        BitBtn7.Enabled := True;
        v_sql := '';
        v_sql := ' select liberado from certidao where nr_protoc = '+quotedstr(Protocolo)+' or averbacao ='+quotedstr(protocolo);
        if  VerificaSeCertidaoLiberado(v_sql) = 'S'  then
          BitBtn7.Caption := '&Bloqueado'
        else
          BitBtn7.Caption := '&Liberado';
      end
      else
        BitBtn7.Enabled := False;
    End;
  end;
  Carrega_Pedid;
end;

procedure TF_ExameC.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
  Panel4.Visible := False;
  //MaskEdit11.Text := DateToStr(Date);
end;

procedure TF_ExameC.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    if (not LocalizaProt(Trim(MaskEdit1.Text))) then
    Begin
      BitBtn2Click(F_ExameC);
      Exit;
    end;
    if (BitBtn5.Enabled) then BitBtn5.SetFocus else BitBtn1.SetFocus;
  end;
end;

procedure TF_ExameC.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_ExameC.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_ExameC.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox4.setfocus;
end;

procedure TF_ExameC.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit15.SetFocus;
end;

procedure TF_ExameC.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ExameC.BitBtn2Click(Sender: TObject);
begin
  Limpar(F_ExameC);
  MaskEdit1.SetFocus;
end;

procedure TF_ExameC.BitBtn4Click(Sender: TObject);
begin
  BitBtn2Click(F_ExameC);
  Application.CreateForm(TF_Prot, F_Prot);
  F_Prot.Label1.Caption := 'C';
  F_Prot.ShowModal;
  F_Prot.Destroy;
  F_Prot := NIL;
  MaskEdit1.SetFocus;
end;

procedure TF_ExameC.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_ExameC.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit25.SetFocus;
end;

procedure TF_ExameC.BitBtn1Click(Sender: TObject);
begin
  If Dm.Certidao.FieldByName('status').asString = 'PRONTO' THEN
  Begin
    Application.MessageBox('ATENÇÃO: Para Correção do Pedido, tem que utilizar a opção de Volta de Status.!', 'Exame de Certidão.', Mb_IconWarning);
    Exit;
  End;

  if (BitBtn1.Caption = '&Corrigir') then
  begin
    BitBtn1.Caption := '&Gravar';
    MaskEdit1.Enabled := False;
    BitBtn4.Enabled   := False;
    BitBtn5.Enabled   := False;
    BitBtn2.Enabled   := False;
    BitBtn3.Enabled   := False;
    Panel2.Enabled    := True;
    MaskEdit2.SetFocus;
  end
  else
  begin
    if (BitBtn1.Caption = '&Gravar') then
    begin
      if (MessageBox(Handle, PChar('Confirma correção dos dados ?'), 'EXAME - CERTIDÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
      begin
        Gravar(F_ExameC);
      end;
    end;
    BitBtn1.Caption := '&Corrigir';
    MaskEdit1.Enabled := True;
    BitBtn4.Enabled   := True;
    BitBtn5.Enabled   := True;
    BitBtn2.Enabled   := True;
    BitBtn3.Enabled   := True;
    Panel2.Enabled    := False;
    BitBtn2Click(F_ExameC);
  end;
end;

procedure TF_ExameC.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

procedure TF_ExameC.BitBtn5Click(Sender: TObject);
begin
  Label3.Caption    := 'I';
  BitBtn1.Enabled   := False;
  BitBtn2.Enabled   := False;
  BitBtn3.Enabled   := False;
  BitBtn4.Enabled   := False;
  BitBtn5.Enabled   := False;
  MaskEdit1.Enabled := False;
  Panel3.Enabled    := True;
  ComboBox2.SetFocus;
end;

procedure TF_ExameC.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  selo, validador, _cod_emissor_ : String;
  Par,
  dajes,
  codigoCartorio,
  funcionario,
  numSeloFisico,
  nomeParte,
  numeroCertidao,
  descricaoMotivo,
  numeroProtocolo,
  livro,
  folha,
  tipoAto,
  diretorio,
  motivoisencao,  
  alias,
  iddaje,
  Sistema,
  usuario: String;

begin
  if key = 13 then
  begin
    dajes:= '';
    codigoCartorio:= '';
    funcionario:= '';
    numSeloFisico:= '';
    nomeParte:= '';
    numeroCertidao:= '';
    motivoisencao:= '';
    descricaoMotivo:= '';
    numeroProtocolo:= '';
    livro:= '';
    folha:= '';
    tipoAto:= '';
    diretorio:= '';
    alias:= '';
    Par:= '';
    iddaje:= '';
    usuario:= '';

    if F_Menu.Label53.Caption = 'F' Then
    begin
      ShowMessage('Usuário não possui permissão para realizar a baixa da certidão!');
      Exit;
    end;

    if (MessageBox(Handle, PChar('Baixar Pedido ?'), 'COTA/BAIXA DE CERTIDÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin
      if (ComboBox2.Text = 'PRONTO') Then
      Begin
        Dm.ArqAux1.Close;
        Dm.ArqAux1.Sql.Clear;
        Dm.ArqAux1.Sql.Add('SELECT * FROM daje');
        Dm.ArqAux1.Sql.Add('WHERE serie_daje = ' + QuotedStr(Dm.Certidao.FieldByName('serie_daje').AsString));
        Dm.ArqAux1.Sql.Add('and numero_daje = ' + IntToStr(StrToInt(Dm.Certidao.FieldByName('daje').AsString)));
        Dm.ArqAux1.Open;

        _cod_emissor_ := id_eselo;

        if (Dm.ArqAux1.FieldByname('iddaje_tj').AsString = '9999') then
          _cod_emissor_ := '9999';

        if (Dm.ArqAux1.FieldByname('iddaje_tj').AsString = '') then
          _cod_emissor_ := id_eselo;

        if (Dm.ArqAux1.FieldByname('iddaje_tj').AsString <> '') then
          _cod_emissor_ := Dm.ArqAux1.FieldByname('iddaje_tj').AsString;

        if ((F_Menu.Label54.Caption = '1-Produção') or (F_Menu.Label54.Caption = '')) Then
        begin
          if FALSE THEN //(TrabalhaComQRCode) Then //Eder de Valença
          begin

            dajes              := Strzero(_cod_emissor_,4) + StrZero(Dm.ArqAux1.FieldByName('serie_daje').AsString, 3) + StrZero(Dm.ArqAux1.FieldByName('numero_daje').AsString, 6);
            codigoCartorio     := Strzero(_cod_emissor_, 4);
            funcionario        := F_Menu.Label1.Caption;
            numSeloFisico      := '';
            nomeParte          := Dm.ArqAux1.FieldByName('contribuinte').AsString;
            numeroCertidao     := '';
            descricaoMotivo    := Dm.ArqAux1.FieldByName('desc_motivo_isento').AsString;
            numeroProtocolo    := '0';
            livro              := ''; //Não levar aspas
            folha              := ''; //Não levar aspas
            tipoAto            := '0';
            diretorio          := caminho_imgselo;
            alias              := 'DBTD';
            motivoisencao      := Dm.ArqAux1.FieldByName('cod_motivo_isento').AsString;
            iddaje             := Dm.ArqAux1.FieldByName('id').AsString;
            Sistema            := 'TD';
            usuario            := '';

            if motivoisencao <> '' then
            begin
              Par              := 'Q;'+dajes+';'+codigoCartorio+';'+funcionario+';'+numSeloFisico+';'+nomeParte+';'+
                                  numeroCertidao+';'+descricaoMotivo+';'+numeroProtocolo+';'+livro+';'+folha+';'+tipoAto+';'+diretorio+';'+alias+';'+motivoisencao+';'+iddaje+';'+Sistema+';';
            end
            else
            begin
              Par              := 'Q;'+dajes+';'+codigoCartorio+';'+funcionario+';'+numSeloFisico+';'+nomeParte+';'+
                                  numeroCertidao+';'+';'+numeroProtocolo+';'+livro+';'+folha+';'+tipoAto+';'+diretorio+';'+alias+';'+';'+iddaje+';'+Sistema+';';
            end;

            WinExec(pchar(F_Menu.LbCaminhoDajeIntegracao.Caption+'Daje.exe'+' '+Par), SW_NORMAL);
            Dm.KillTask(F_Menu.LbCaminhoDajeIntegracao.Caption+'Daje.exe');

            dm.qryGenerico.Close;
            dm.qryGenerico.SQL.Clear;
            dm.qryGenerico.SQL.Add('select numero_selo, cod_validacao, usuario from daje where id in (' + iddaje + ') group by 1');
            dm.qryGenerico.Open;

            _codigoValidacao:= dm.qryGenerico.FieldByName('cod_validacao').AsString;
            _numeroSelo     := dm.qryGenerico.FieldByName('numero_selo').AsString;
            selo            := dm.qryGenerico.FieldByName('numero_selo').AsString;
            usuario         := dm.qryGenerico.FieldByName('usuario').AsString;

            if _numeroSelo <> '' then
              Application.MessageBox(Pchar('Selo: ' + _numeroSelo + ' Código de Validação: ' + _codigoValidacao), 'GERADO COM SUCESSO', Mb_IconInformation)
            else
              Application.MessageBox(Pchar('Selo não pode ser gerado!'), 'GERADO COM SUCESSO', Mb_IconInformation)


          End
          Else
          Begin
            selo := SeloComDaje(_cod_emissor_, F_Menu.Label25.Caption, Dm.ArqAux1.FieldByName('cod_motivo_isento').AsString,
                                Dm.ArqAux1.FieldByName('desc_motivo_isento').AsString, _cod_emissor_ +
                                Dm.Certidao.FieldByName('serie_daje').AsString + Dm.Certidao.FieldByName('daje').AsString, '', '',
                                '', '', '', Trim(Dm.ArqAux1.FieldByName('contribuinte').AsString), _cod_emissor_);
          End
        end
        else
        begin
          validador := 'selo teste';
          selo      := 'validacao teste';  //Copy(selo, 1, Length(selo) - Length(validador) - 2);
        end;

        if (selo = '') Then
        Begin
          Application.MessageBox('A conexão com o tribunal foi perdida ou houve erro na passagem dos parametros, por favor, tente novamente!', 'Mensagem do Sistema', mb_ok);
          Abort;
        End;

        validador := _codigoValidacao;
        selo      := _numeroSelo;  //Copy(selo, 1, Length(selo) - Length(validador) - 2);


        Dm.Certidao.Close;
        Dm.Certidao.Sql.Clear;
        Dm.Certidao.Sql.Add('SELECT tabela, divisor, stat_data, data_cota, status, vl_certid, qde,');
        Dm.Certidao.Sql.Add('pag, v_emolumento, v_busca, v_desarquivamento, v_informatica, v_subtotal,');
        Dm.certidao.sql.add('tribunal, procuradoria, defensoria, custas, selo, selo_validador');
        Dm.Certidao.Sql.Add('FROM certidao');
        Dm.Certidao.Sql.Add('WHERE');
        Dm.Certidao.Sql.Add('nr_protoc = ' + MaskEdit1.Text);
        Dm.Certidao.Sql.Add('or averbacao = ' + MaskEdit1.Text);
        Dm.Certidao.Open;
        if (Dm.Certidao.RecordCount <> 0) then
        begin
          Dm.Certidao.Edit;
          Dm.Certidao.FieldByName('tabela').asString              := Trim(Copy(TirarTudo(ComboBox1.Text,'-','-','-'), 1,5));
          Dm.Certidao.FieldByName('divisor').asInteger            := StrToInt(Copy(ComboBox6.Text, 1,2));
          Dm.Certidao.FieldByName('stat_data').asString           := datetostr(date);
          Dm.Certidao.FieldByName('status').asString              := Trim(ComboBox2.Text);
          Dm.Certidao.FieldByName('pag').asInteger                := StrToInt(MaskEdit9.Text); //StrToInt(MaskEdit10.Text);
          Dm.Certidao.FieldByName('v_emolumento').asCurrency      := CurrencyEdit2.Value;
          Dm.Certidao.FieldByName('v_busca').asCurrency           := CurrencyEdit3.Value;
          Dm.Certidao.FieldByName('v_desarquivamento').asCurrency := CurrencyEdit4.Value;
          Dm.Certidao.FieldByName('v_informatica').asCurrency     := CurrencyEdit5.Value;
          Dm.Certidao.FieldByName('v_subtotal').asCurrency        := CurrencyEdit6.Value;
          Dm.Certidao.FieldByName('tribunal').asCurrency          := CurrencyEdit7.Value;
          Dm.Certidao.FieldByName('procuradoria').asCurrency      := CurrencyEdit14.Value;
          Dm.Certidao.FieldByName('defensoria').asCurrency        := CurrencyEdit15.Value;
          Dm.Certidao.FieldByName('custas').asCurrency            := CurrencyEdit16.Value;
          Dm.Certidao.FieldByName('selo').asString                := selo;
          Dm.Certidao.FieldByName('selo_validador').asString      := validador;
          Dm.Certidao.Post;
        end;
        Dm.Certidao.Close;
      End
      Else
      Begin
        if (ComboBox2.Text = 'IRREGULAR') Then
        Begin
          Dm.qryGenerico.Close;
          Dm.qryGenerico.SQL.Clear;
          Dm.qryGenerico.Sql.Add('UPDATE certidao SET');
          Dm.qryGenerico.Sql.Add('status  = "IRREGULAR",');
          Dm.qryGenerico.Sql.Add('stat_data = ' + Chr(39) + ConvData(dateToStr(date)) + Chr(39) + ',');
          Dm.qryGenerico.Sql.Add('daje = NULL,');
          Dm.qryGenerico.Sql.Add('serie_daje = NULL');
          Dm.qryGenerico.Sql.Add('WHERE');
          Dm.qryGenerico.Sql.Add('NR_PROTOC = ' + QuotedStr(nr_protocolo));
          Dm.qryGenerico.Sql.Add('and averbacao = ' + QuotedStr(edtAverbacao.Text));
          Dm.qryGenerico.ExecSql;
        End
        Else
        if (ComboBox2.Text = 'CANCELADO') Then
        Begin
          Dm.qryGenerico.Close;
          Dm.qryGenerico.SQL.Clear;
          Dm.qryGenerico.Sql.Add('UPDATE certidao SET');
          Dm.qryGenerico.Sql.Add('status  = "CANCELADO",');
          Dm.qryGenerico.Sql.Add('stat_data = ' + Chr(39) + ConvData(dateToStr(date)) + Chr(39) + ',');
          Dm.qryGenerico.Sql.Add('daje = NULL,');
          Dm.qryGenerico.Sql.Add('serie_daje = NULL');
          Dm.qryGenerico.Sql.Add('WHERE');
          Dm.qryGenerico.Sql.Add('NR_PROTOC = ' + QuotedStr(nr_protocolo));
          Dm.qryGenerico.Sql.Add('and averbacao = ' + QuotedStr(edtAverbacao.Text));
          Dm.qryGenerico.ExecSql;
        End
        Else
        if (ComboBox2.Text = 'RESULTADO POSITIVO') Then
        Begin
          Dm.qryGenerico.Close;
          Dm.qryGenerico.SQL.Clear;
          Dm.qryGenerico.Sql.Add('UPDATE certidao SET');
          Dm.qryGenerico.Sql.Add('status  = "RESULTADO POSITIVO" ');
          Dm.qryGenerico.Sql.Add(',stat_data = ' + Chr(39) + ConvData(dateToStr(date)) + Chr(39) + ' ');
          Dm.qryGenerico.Sql.Add('WHERE');
          Dm.qryGenerico.Sql.Add('NR_PROTOC = ' + QuotedStr(nr_protocolo));
          Dm.qryGenerico.Sql.Add('and averbacao = ' + QuotedStr(edtAverbacao.Text));
          Dm.qryGenerico.ExecSql;

          if Application.MessageBox( Pchar('Deseja realizar a liberação do protocolo?'), PChar(F_ExameC.Caption),MB_ICONQUESTION + MB_YESNO ) = Id_yes then
          begin
            AtualizarCampoLiberado_da_CERTIDAO('S',trim(nr_protocolo));
          end;


        End
        Else
        if (ComboBox2.Text = 'RESULTADO NEGATIVO') Then
        Begin
          Dm.qryGenerico.Close;
          Dm.qryGenerico.SQL.Clear;
          Dm.qryGenerico.Sql.Add('UPDATE certidao SET');
          Dm.qryGenerico.Sql.Add('status  = "RESULTADO NEGATIVO" ');
          Dm.qryGenerico.Sql.Add(',stat_data = ' + Chr(39) + ConvData(dateToStr(date)) + Chr(39) + ' ');
          Dm.qryGenerico.Sql.Add('WHERE');
          Dm.qryGenerico.Sql.Add('NR_PROTOC = ' + QuotedStr(nr_protocolo));
          Dm.qryGenerico.Sql.Add('and averbacao = ' + QuotedStr(edtAverbacao.Text));
          Dm.qryGenerico.ExecSql;

          if Application.MessageBox( Pchar('Deseja realizar a liberação do protocolo?'), PChar(F_ExameC.Caption),MB_ICONQUESTION + MB_YESNO ) = Id_yes then
          begin
            AtualizarCampoLiberado_da_CERTIDAO('S',trim(nr_protocolo));
          end;
        End;
      End
    End;
    Panel3.Enabled    := False;
    BitBtn1.Enabled   := True;
    BitBtn2.Enabled   := True;
    BitBtn3.Enabled   := True;
    BitBtn4.Enabled   := True;
    BitBtn5.Enabled   := True;
    BitBtn2Click(F_ExameC);
  end;
end;

procedure TF_ExameC.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_ExameC.ComboBox3Enter(Sender: TObject);
begin
  SendMessage(ComboBox3.handle, CB_SHOWDROPDOWN, Integer(True), 0);
  if (Trim(ComboBox3.Text) = '') then ComboBox3.Text := ComboBox3.Items.Strings[0];
end;

procedure TF_ExameC.ComboBox3KeyPress(Sender: TObject; var Key: Char);
var
  Found: boolean;
  i,SelSt: Integer;
  TmpStr: string;
begin
  if Key in ['a'..'z'] then Dec(Key,32);
  with (Sender as TComboBox) do
  begin
    SelSt := SelStart;
    if (Key = Chr(vk_Back)) and (SelLength <> 0) then
     TmpStr := Copy(Text,1,SelStart)+Copy(Text,SelLength+SelStart+1,255)
    else if Key = Chr(vk_Back) then
     TmpStr := Copy(Text,1,SelStart-1)+Copy(Text,SelStart+1,255)
    else TmpStr := Copy(Text,1,SelStart)+Key+Copy(Text,SelLength+SelStart+1,255);
    if TmpStr = '' then Exit;
    if (Key = Chr(vk_Back)) and (SelSt > 0) then
     Dec(SelSt)
    else if Key <> Chr(vk_Back) then Inc(SelSt);
    Key := #0;
    if SelSt = 0 then
    begin
      Text:= '';
      Exit;
    end;
    Found := False;
    for i := 1 to Items.Count do
      if UpperCase(Copy(Items[i-1],1,Length(TmpStr))) = UpperCase(TmpStr) then
      begin
        Text := Items[i-1];
        ItemIndex := i-1;
        Found := True;
        Break;
      end;
    if Found then
    begin
      SelStart := SelSt;
      SelLength := Length(Text)-SelSt;
    end
    else Beep;
  end;
end;

procedure TF_ExameC.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit10.SetFocus;
end;

procedure TF_ExameC.MaskEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    CurrencyEdit1.SetFocus;
end;

procedure TF_ExameC.ComboBox6Exit(Sender: TObject);
begin
  if (not ValidNumero(Copy(ComboBox6.Text, 1,2))) then ComboBox6.Text := '01 - Custas Integrais';

  try
   if (MaskEdit25.Text = '') and (StrToInt(MaskEdit25.Text) < 1) then
   begin
     Application.MessageBox('Campo Numerico Preencher com número maior que 0(ZERO)', 'Mensagem do Sistema', mb_ok);
     MaskEdit25.SetFocus;
     exit;
   end;
  except
   Application.MessageBox('Valido apenas Numeros, favor verificar', 'Mensagem do Sistema', mb_ok);
   MaskEdit25.SetFocus;
   exit;
  end;

  If ValidData(MaskEdit13.Text) then dat_calc := QuotedStr(ConvData(MaskEdit13.Text))
  Else dat_calc := QuotedStr(ConvData(DateToStr(now)));
  DM.Tab_Atos.RequestLive := False;
  DM.Tab_Atos.Close;
  DM.Tab_Atos.Sql.Clear;
  DM.Tab_Atos.Sql.Add('select * from tab_ato2 where data <= ' + dat_calc);
  DM.Tab_Atos.Sql.Add('group by data');
  DM.Tab_Atos.Open;
  DM.Tab_Atos.FindLast;
  dat := DM.Tab_Atos.FieldByname('data').AsString;

  DM.Tab_Atos.Close;
  DM.Tab_Atos.Sql.Clear;
  DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
  DM.Tab_Atos.Sql.Add('     data = '   + QuotedStr(ConvData(dat)));
  DM.Tab_Atos.Sql.Add(' AND tabela = ' + QuotedStr(copy(ComboBox1.Text,1,1)));
  DM.Tab_Atos.Sql.Add(' AND item_tab = ' + QuotedStr(copy(ComboBox1.Text,3,1)));
  DM.Tab_Atos.Open;

  calc_emol  := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency;
  calc_vfetj := DM.Tab_Atos.FieldByName('taxa').ASCurrency;
  calc_total := DM.Tab_Atos.FieldByName('total').ASCurrency;

  CurrencyEdit10.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;

  if StrToInt(MaskEdit25.Text) > 0 then
  begin
    DM.Tab_Atos.Close;
    DM.Tab_Atos.Sql.Clear;
    DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
    DM.Tab_Atos.Sql.Add('     data = '   + QuotedStr(ConvData(dat)));
    DM.Tab_Atos.Sql.Add(' AND tabela = "4"');
    DM.Tab_Atos.Sql.Add(' AND item_tab = "9"');
    DM.Tab_Atos.Sql.Add(' AND subitem = "B"');
    DM.Tab_Atos.Open;

    CurrencyEdit10.Value := CurrencyEdit10.Value + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit25.Text));
  end;
end;

procedure TF_ExameC.ComboBox6Enter(Sender: TObject);
begin
  SendMessage(ComboBox6.handle, CB_SHOWDROPDOWN, Integer(True), 0);
  if (Trim(ComboBox6.Text) = '') then ComboBox6.Text := ComboBox6.Items.Strings[0];
end;

procedure TF_ExameC.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox3.SetFocus;
end;

procedure TF_ExameC.Corrigir2Click(Sender: TObject);
begin
  if (Panel3.Enabled) then
  begin
    Label3.Caption := 'C';
    ComboBox1.SetFocus;
  end;
end;

procedure TF_ExameC.Excluir1Click(Sender: TObject);
begin
  if (Panel3.Enabled) then
  begin
    if (Dm.CotaCert.FieldByName('recno').asInteger > 0) then
    begin
      if (MessageBox(Handle, PChar('Deletar esta cota ?'), 'COTA DE CERTIDÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
      begin
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('DELETE FROM cotacert');
        Dm.ArqAux.Sql.Add('WHERE');
        Dm.ArqAux.Sql.Add('recno = '+ Dm.CotaCert.FieldByName('recno').asString);
        Dm.ArqAux.ExecSQL;
        Atualiza_His(DateToStr(date), TimeToStr(time), 'C', F_menu.Label1.Caption, 'Deletada cota do pedido ' + Trim(nr_protocolo), Trim(nr_protocolo));
        // atualizando após o delete.
        Dm.CotaCert.Close;
        Dm.CotaCert.Sql.Clear;
        Dm.CotaCert.Sql.Add('SELECT * FROM cotacert');
        Dm.CotaCert.Sql.Add('WHERE');
        Dm.CotaCert.Sql.Add('nr_protoc = ' + Trim(F_ExameC.nr_protocolo));
        Dm.CotaCert.Open;
      end;
    end;
  end;
end;

procedure TF_ExameC.MaskEdit9Exit(Sender: TObject);
var
  anos : Integer;
  mic  : String;
begin
  if CheckBox1.Checked then anos := 1 else anos := 0;
  if CheckBox2.Checked then mic := 'S' else mic := 'N';
  //CalculoCert(MaskEdit13.Text, copy(combobox1.text, 1, 5), 0.00, StrToInt(Copy(ComboBox6.Text, 1,2)) , StrToInt(MaskEdit9.Text), StrToInt(MaskEdit12.Text), 0, 0, 0, anos, mic, strtoint(maskedit17.text));

  if (DM.Config_Adm.FieldByName('chk_04').AsBoolean) then
  begin
    CalculoCert(MaskEdit13.Text, copy(combobox1.text, 1, 5), 0.00, StrToInt(Copy(ComboBox6.Text, 1,2)) , StrToInt(MaskEdit9.Text), StrToInt(MaskEdit12.Text), 0, 0, 0, anos, mic, StrToInt(MaskEdit17.Text));
    CurrencyEdit1.Value := VrTotG;
    CurrencyEdit5.Value := VrTotG;
  end;

  if (DM.Config_Adm.FieldByName('chk_05').AsBoolean) then
  begin
    CalculoCert2(MaskEdit13.Text, copy(combobox1.text, 1, 5), 0.00, StrToInt(Copy(ComboBox6.Text, 1,2)) , StrToInt(MaskEdit9.Text), StrToInt(MaskEdit12.Text), 0, 0, 0, anos, mic, True);
    CurrencyEdit1.Value := VrTotG;
    CurrencyEdit5.Value := VrTotG;
  end;

  MaskEdit7.Text       := MaskEdit9.Text;
  MaskEdit14.Text      := MaskEdit12.Text;
  CurrencyEdit2.Value  := VrEmolumentos;
  CurrencyEdit3.Value  := VrBusca;
  CurrencyEdit4.Value  := VrDesarquivamento;
  CurrencyEdit5.Value  := VrInformatica;
  CurrencyEdit8.Value  := VrDigitalizacao;
  CurrencyEdit9.Value  := VrConferencia;
  CurrencyEdit6.Value  := VrSubTotal;
  CurrencyEdit7.Value  := VrTribunal;
  CurrencyEdit14.Value := VrProcuradoria;
  CurrencyEdit15.Value := VrDefensoria;
  CurrencyEdit16.Value := VrTotG;
end;

procedure TF_ExameC.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then edtAverbacao.SetFocus;
end;

procedure TF_ExameC.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_ExameC.ComboBox4Exit(Sender: TObject);
begin
//  MaskEdit27.EditMask := '';
//  MaskEdit27.Clear;
  if (Trim(ComboBox4.Text) = 'CPF') then
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') = '') then MaskEdit27.EditMask := '###.###.###-##';
  end;
  if (Trim(ComboBox4.Text) = 'CNPJ') then
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') = '') then MaskEdit27.EditMask := '##.###.###/####-##';
    ComboBox11.Text := '';
    MaskEdit7.Text  := '';
    MaskEdit14.Text := '';
  end;
end;

procedure TF_ExameC.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit27.SetFocus;
end;

procedure TF_ExameC.MaskEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox11.SetFocus;
end;

procedure TF_ExameC.ComboBox11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_ExameC.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit9.SetFocus;
end;

procedure TF_ExameC.ComboBox1Exit(Sender: TObject);
begin
  Dm.Calculo.Close;
  Dm.Calculo.Sql.Clear;
  Dm.Calculo.Sql.Add('SELECT data FROM cad_cus');
  Dm.Calculo.Sql.Add('GROUP BY data');
  Dm.Calculo.Sql.Add('ORDER BY data DESC');
  Dm.Calculo.Open;

  SeparaTabela(ComboBox1.Text);

{  if (tab = '10') and (item = '7') and (subitem = 'A') then
  begin
    MaskEdit12.Enabled := True;
    MaskEdit9.Enabled  := False;
    MaskEdit9.Text     := '0';
  end
  else
  begin
    MaskEdit12.Enabled := False;
    MaskEdit12.Text    := '0';
    MaskEdit9.Enabled  := True;
  end;}
end;

procedure TF_ExameC.MaskEdit12Exit(Sender: TObject);
var
  anos : Integer;
  mic  : String;
begin
{  if CheckBox1.Checked then anos := 1 else anos := 0;
  if CheckBox2.Checked then mic := 'S' else mic := 'N';
  CalculoCert(MaskEdit13.Text, copy(combobox1.text, 1, 5), 0.00, StrToInt(Copy(ComboBox6.Text, 1,2)) , StrToInt(MaskEdit9.Text), StrToInt(MaskEdit12.Text), 0, 0, 0, anos, mic, strtoint(maskedit17.text));

  if (DM.Config_Adm.FieldByName('chk_04').AsBoolean) then
  begin
    CalculoCert(MaskEdit1.Text, copy(combobox5.text, 1, 5), 0.00, StrToInt(Copy(ComboBox6.Text, 1,2)) , StrToInt(MaskEdit10.Text), StrToInt(MaskEdit8.Text), 0, 0, 0, anos, mic, StrToInt(MaskEdit13.Text));
    CurrencyEdit1.Value := VrTotG;
    CurrencyEdit5.Value := VrTotG;
  end;

  if (DM.Config_Adm.FieldByName('chk_05').AsBoolean) then
  begin
    CalculoCert2(MaskEdit1.Text, copy(combobox5.text, 1, 5), 0.00, StrToInt(Copy(ComboBox6.Text, 1,2)) , StrToInt(MaskEdit10.Text), StrToInt(MaskEdit8.Text), 0, 0, 0, anos, mic, True);
    CurrencyEdit1.Value := VrTotG;
    CurrencyEdit5.Value := VrTotG;
  end;

  MaskEdit7.Text       := MaskEdit9.Text;
  MaskEdit14.Text      := MaskEdit12.Text;
  CurrencyEdit2.Value  := VrEmolumentos;
  CurrencyEdit3.Value  := VrBusca;
  CurrencyEdit4.Value  := VrDesarquivamento;
  CurrencyEdit5.Value  := VrInformatica;
  CurrencyEdit8.Value  := VrDigitalizacao;
  CurrencyEdit9.Value  := VrConferencia;
  CurrencyEdit6.Value  := VrSubTotal;
  CurrencyEdit7.Value  := VrTribunal;
  CurrencyEdit14.Value := VrProcuradoria;
  CurrencyEdit15.Value := VrDefensoria;
  CurrencyEdit16.Value := VrTotG;}
end;

procedure TF_ExameC.MaskEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit16.SetFocus;
end;

procedure TF_ExameC.MaskEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_ExameC.MaskEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if MaskEdit12.Enabled = True then MaskEdit12.SetFocus else MaskEdit9.SetFocus;
  end;
end;

procedure TF_ExameC.SpeedButton3Click(Sender: TObject);
begin
  Panel4.Visible := False;
  CurrencyEdit10.Value := CurrencyEdit16.Value;
end;

procedure TF_ExameC.SpeedButton1Click(Sender: TObject);
begin
  if Label50.Caption = 'incluir' then
  begin
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('INSERT INTO td_pedid(data_r, p_auxiliar, recibo, cod_lae, descricao, tabela, item, subitem, valor_unit, qtde, valor_calc, tipo_prot)');
    DM.ArqAux.Sql.Add(' VALUES(');
    DM.ArqAux.Sql.Add(QuotedStr(ConvData(MaskEdit13.Text)) + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(nr_protocolo)       + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit2.Text)      + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(Trim(MaskEdit18.Text))       + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit22.Text) + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit19.Text)  + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit20.Text)  + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit21.Text)  + ', ');
    DM.ArqAux.Sql.Add(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit11.Value)) + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit23.Text)  + ', ');
    DM.ArqAux.Sql.Add(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit12.Value)) + ',');
    DM.ArqAux.Sql.Add('"C")');
    DM.ArqAux.ExecSQL;

    ShowMessage('Item incluído !');
    Carrega_Pedid;
  end;

  if Label50.Caption = 'corrigir' then
  begin
    if messagedlg('Dados Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM.ArqAux.Active := False;
      DM.ArqAux.Sql.Clear;
      DM.ArqAux.Sql.Add('UPDATE td_pedid SET');
      DM.ArqAux.Sql.Add(' data_r = '     + QuotedStr(ConvData(MaskEdit13.Text))  + ',');
      DM.ArqAux.Sql.Add(' descricao = '  + QuotedStr(MaskEdit22.Text) + ',');
      DM.ArqAux.Sql.Add(' tabela = '     + QuotedStr(MaskEdit19.Text)  + ',');
      DM.ArqAux.Sql.Add(' item = '       + QuotedStr(MaskEdit20.Text)  + ',');
      DM.ArqAux.Sql.Add(' subitem = '    + QuotedStr(MaskEdit21.Text)  + ',');
      DM.ArqAux.Sql.Add(' valor_unit = ' + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit11.Value)) + ',');
      DM.ArqAux.Sql.Add(' qtde = '       + QuotedStr(MaskEdit23.Text)  + ',');
      DM.ArqAux.Sql.Add(' valor_calc = ' + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit12.Value)));
      DM.ArqAux.Sql.Add(' WHERE id = '   + DM.Pedid_Aux.fieldbyname('id').AsString);
      Dm.ArqAux.ExecSQL;

      ShowMessage('Correção concluída !');
      Carrega_Pedid;
    end
    else
    ShowMessage('Correção não realizada !');
  end;
  Panel5.Enabled := False;
  SpeedButton1.Visible := False;
  SpeedButton2.Enabled := True;
  SpeedButton3.Enabled := True;
end;

procedure TF_ExameC.IncluirItem1Click(Sender: TObject);
begin
  Abre_CadTab;
  Panel5.Enabled       := True;
  Panel6.Visible       := True;  
  SpeedButton2.Enabled := False;
  SpeedButton3.Enabled := False;
  Label50.Caption      := 'incluir';
  SpeedButton1.Caption := '&Incluir Item';
  SpeedButton1.Visible := True;
  DBGrid2.SetFocus;
end;

procedure TF_ExameC.CorrigirItem1Click(Sender: TObject);
begin
  Abre_CadTab;
  Panel5.Enabled       := True;
  SpeedButton2.Enabled := False;
  SpeedButton3.Enabled := False;
  Label50.Caption      := 'corrigir';
  SpeedButton1.Caption := '&Gravar Correção';
  SpeedButton1.Visible := True;
  MaskEdit23.SetFocus;
end;

procedure TF_ExameC.ExcluirItem1Click(Sender: TObject);
var
  id : String;
begin
  if MessageDlg('Deseja excluir este item do calculo ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    id := inttostr(DM.TD_Pedid.fieldbyname('id').AsInteger);
    DM.TD_Pedid.delete;
    DM.TD_Pedid.close;
    DM.TD_Pedid.open;
    if id < '1' then DM.TD_Pedid.FindFirst else
    begin
      DM.TD_Pedid.FindFirst;
      if not DM.TD_Pedid.Locate('id', id, []) then DM.TD_Pedid.FindLast;
    end;
  end;
end;

procedure TF_ExameC.DBGrid1DblClick(Sender: TObject);
begin
  Carrega_Pedid2;
  MaskEdit23.SetFocus;
end;

procedure TF_ExameC.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit23.SetFocus;
end;

procedure TF_ExameC.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Carrega_Pedid2;
end;

procedure TF_ExameC.DBGrid2DblClick(Sender: TObject);
begin
  Carrega_CadTab;
  MaskEdit23.SetFocus;
  Panel6.Visible := False;
end;

procedure TF_ExameC.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Panel6.Visible := False;
  if key = 13 then
  begin
    Carrega_CadTab;
    MaskEdit23.SetFocus;
    Panel6.Visible := False;
  end;
end;

procedure TF_ExameC.DBGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Carrega_CadTab;
end;

procedure TF_ExameC.ComboBox6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_ExameC.MaskEdit23Exit(Sender: TObject);
var
  Multip : Currency;
begin
  Multip := 0;
  Multip := (StrToInt(MaskEdit23.Text) * CurrencyEdit11.Value);
  CurrencyEdit12.Value := Multip;
end;

procedure TF_ExameC.MaskEdit23KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit11.SetFocus;
end;

procedure TF_ExameC.CurrencyEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_ExameC.SpeedButton1Click(F_ExameC);
end;

procedure TF_ExameC.SpeedButton2Click(Sender: TObject);
begin
  qtd_pag_cert := 0;
  qtd_fol_cert := 0;
  VrTribCert   := 0;
  VrDefeCert   := 0;
  VrProcCert   := 0;
  vl_pag_cert  := 0;
  vl_fol_cert  := 0;
  VrPagCert    := 0;
  VrFolCert    := 0;

  dt_tab := MaskEdit24.Text;

  DM.Tab_atoemol.Close;
  DM.Tab_atoemol.sql.Clear;
  DM.Tab_atoemol.sql.Add('SELECT * from tab_atoemol');
  DM.Tab_atoemol.sql.Add('where');
  DM.Tab_atoemol.sql.Add('data = ' + QuotedStr(ConvData(dt_tab)));
  DM.Tab_atoemol.open;
  if (DM.Tab_atoemol.RecordCount = 0) then
  begin
    DM.Tab_atoemol.Close;
//  MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA CADASTRADA !'), 'CALCULO', MB_OK + MB_ICONSTOP);
    Exit;
  end;

  DM.TabDemais.Close;
  DM.TabDemais.sql.Clear;
  DM.TabDemais.sql.Add('SELECT * from cad_tabdemais');
  DM.TabDemais.sql.Add('where');
  DM.TabDemais.sql.Add('data = ' + QuotedStr(ConvData(dt_tab)));
  DM.TabDemais.open;
  if (DM.TabDemais.RecordCount = 0) then
  begin
    DM.TabDemais.Close;
    MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR DEMAIS TABELAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
    Exit;
  end;

  DM.ArqAux2.Close;
  DM.ArqAux2.Sql.Clear;
  DM.ArqAux2.Sql.Add('SELECT SUM(valor_calc) as subtotal FROM td_pedid WHERE p_auxiliar = ' + nr_protocolo);
  DM.ArqAux2.Open;

  VrSubTotal := DM.ArqAux2.fieldbyname('subtotal').AsCurrency;

  VrTribunal     := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('tribunal').AsCurrency) / 100);
  VrDefensoria   := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
  VrProcuradoria := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);


  if (MaskEdit14.Text <> '0') then
  begin
    VrTribCert  := 0;
    VrDefeCert  := 0;
    VrProcCert  := 0;

    vl_pag_cert := (StrToInt(MaskEdit14.Text) * DM.TabDemais.fieldbyname('vl_pag_cert').AsCurrency);

    VrTribCert := TruncaV((vl_pag_cert * DM.TabDemais.FieldByName('tribunal').AsCurrency) / 100);
    VrDefeCert := TruncaV((vl_pag_cert * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
    VrProcCert := TruncaV((vl_pag_cert * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);

    VrPagCert    := vl_pag_cert + VrTribCert + VrDefeCert + VrProcCert;
    qtd_pag_cert := StrToInt(MaskEdit14.Text);
  end;

  if (MaskEdit7.Text <> '0') then
  begin
    VrTribCert  := 0;
    VrDefeCert  := 0;
    VrProcCert  := 0;

    vl_fol_cert := (StrToInt(MaskEdit7.Text) * DM.TabDemais.fieldbyname('vl_fol_cert').AsCurrency);

    VrTribCert := TruncaV((vl_fol_cert * DM.TabDemais.FieldByName('tribunal').AsCurrency) / 100);
    VrDefeCert := TruncaV((vl_fol_cert * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
    VrProcCert := TruncaV((vl_fol_cert * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);

    VrFolCert    := vl_pag_cert + VrTribCert + VrDefeCert + VrProcCert;
    qtd_fol_cert := StrToInt(MaskEdit7.Text);
  end;

  VrTotG := VrSubTotal + VrTribunal + VrDefensoria + VrProcuradoria + VrPagCert + VrFolCert;


  CurrencyEdit8.Value  := VrPagCert;
  CurrencyEdit9.Value  := VrFolCert;
  CurrencyEdit7.Value  := VrTribunal;
  CurrencyEdit14.Value := VrDefensoria;
  CurrencyEdit15.Value := VrProcuradoria;
  CurrencyEdit6.Value  := VrSubTotal;
  CurrencyEdit16.Value := VrTotG;
end;

procedure TF_ExameC.MaskEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_ExameC.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_ExameC.SpeedButton2Click(F_ExameC);
end;

procedure TF_ExameC.MaskEdit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox6.SetFocus;
end;

procedure TF_ExameC.BitBtn6Click(Sender: TObject);
var
  dir_ato, nome_pdf : String;
  s : WordBool;
begin
  dir_ato  := dir_daje + 'Atos\';
  Nome_PDF := 'CER_' + nr_protocolo + '.' + 'PDF';
  If FileExists(dir_ato + nome_pdf) then
  Begin
   { FrmImagemDaje:= TfrmImagemDaje.Create(Nil);
    FrmImagemDaje.AcroPDF1.LoadFile(dir_ato + nome_pdf, s);
    FrmImagemDaje.ShowModal;
    if FrmImagemDaje <> Nil Then
      FrmImagemDaje := Nil;}
      ShellExecute(Handle, 'open', PChar(dir_ato + nome_pdf), nil, nil, SW_SHOWNORMAL);
    Exit;
  End;

  if (F_Menu.Label39.Caption = '27180782000144') or (F_Menu.Label39.Caption = '27.180.782/0001-44')
    or (F_Menu.Label39.Caption = '27357717000141') or (F_Menu.Label39.Caption = '27.357.717/0001-41')
    or (F_Menu.Label39.Caption = '28224408000166') or (F_Menu.Label39.Caption = '28.224.408/0001-66') Then
  Begin
    If FileExists(F_Menu.Label51.Caption + Nome_PDF) then
    Begin
     { FrmImagemDaje:= TfrmImagemDaje.Create(Nil);
      FrmImagemDaje.AcroPDF1.LoadFile(F_Menu.Label51.Caption + Nome_PDF, s);
      FrmImagemDaje.ShowModal;
      if FrmImagemDaje <> Nil Then
        FrmImagemDaje := Nil;}
      ShellExecute(Handle, 'open', PChar(F_Menu.Label51.Caption + Nome_PDF), nil, nil, SW_SHOWNORMAL);
      Exit;
    End;
  End;

  F_Certidao:= TF_Certidao.Create(Nil);
  F_Certidao.MaskEdit1.Text    := nr_protocolo;
  F_Certidao.edtAverbacao.Text := edtAverbacao.Text;
  F_Certidao.MaskEdit3.Text    := MaskEdit15.Text;
  F_Certidao.ShowModal;
  F_Certidao.free;
  F_Certidao:=nil;
  {if F_Certidao <> Nil Then
    F_Certidao := Nil;}
end;

function TF_ExameC.VerificaStatusDaCertidao(value: String): String;
var
  qry  : TQuery;
begin
  qry  := TQuery.Create(Application);
  qry.DatabaseName  := DM.DBTD.DatabaseName;
  try
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add(value);
    qry.Open;
    qry.First;

    result := trim(qry.FieldByName('status').AsString);

  except
    on E: Exception do
       begin
         MessageDlg('Ocorreu um erro ao consultar a tabela ! '+value+
                    'Tente Novamente ou comunique ao Administrador SISCART!'+#10+#10+E.Message,mtError,[mbOk],0);

         result := '';
       end;

  end;
  if qry <> nil then
  begin
    qry.Destroy;
    qry := nil;
  end;
end;


function TF_ExameC.VerificaSeCertidaoLiberado(value: String): String;
var
  qry  : TQuery;
begin
  qry  := TQuery.Create(Application);
  qry.DatabaseName  := DM.DBTD.DatabaseName;
  try
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add(value);
    qry.Open;
    qry.First;

    result := trim(qry.FieldByName('liberado').AsString);

  except
    on E: Exception do
       begin
         MessageDlg('Ocorreu um erro ao consultar a tabela ! '+value+
                    'Tente Novamente ou comunique ao Administrador SISCART!'+#10+#10+E.Message,mtError,[mbOk],0);

         result := '';
       end;

  end;
  if qry <> nil then
  begin
    qry.Destroy;
    qry := nil;
  end;
end;

procedure TF_ExameC.BitBtn7Click(Sender: TObject);
var
  msg,tipo : String;
begin

  if ( BitBtn7.Caption = '&Bloqueado' ) then
  begin
    msg := 'Liberar o Protocolo para Entrega?';
    tipo := 'L';
  end
  else
  begin
    msg := 'Bloquear o Protocolo para Entrega?';
    tipo := 'B';
  end;
  
  if Application.MessageBox( Pchar(msg),'Baixa de Certidão',MB_ICONQUESTION + MB_YESNO ) = Id_yes then
  begin
    if tipo = 'L' then
    begin
      AtualizarCampoLiberado_da_CERTIDAO('NULL',trim(nr_protocolo));
    end
    else
    begin
      AtualizarCampoLiberado_da_CERTIDAO('S',trim(nr_protocolo));
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'A certidão de Nº: '+nr_protocolo+', foi bloqueada para entrega', nr_protocolo);
    end;
  end;

 v_Sql := '';
 v_Sql := ' select liberado from certidao where nr_protoc = '+QuotedStr(trim(nr_protocolo))+ ' and averbacao = '+QuotedStr(edtAverbacao.Text);
 if VerificaSeCertidaoLiberado(v_Sql) = 'S' then
   BitBtn7.Caption := '&Bloqueado'
 else
   BitBtn7.Caption := '&Liberar';

end;


procedure TF_ExameC.AtualizarCampoLiberado_da_CERTIDAO(value, nr_protoc: String);
var
   qry  : TQuery;
begin
    v_Sql := '';
    if value = 'S' then
    begin
      v_Sql := 'UPDATE certidao SET liberado = '+QuotedStr('S')+' where nr_protoc = '+nr_protoc+ ' and averbacao=' +QuotedStr(edtAverbacao.Text);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'A certidão de Nº: '+nr_protoc+', foi liberada para entrega', nr_protoc);
    end
    else
    begin
      v_Sql := 'UPDATE certidao SET liberado = null '+' where nr_protoc = '+nr_protoc+ ' and averbacao=' +QuotedStr(edtAverbacao.Text);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'A certidão de Nº: '+nr_protoc+', foi bloqueado para entrega', nr_protoc);
    end;

    qry  := TQuery.Create(Application);
    qry.DatabaseName  := DM.DBTD.DatabaseName;
    try
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add(v_Sql);
      qry.ExecSQL;
    except
      on E: Exception do
         begin
           MessageDlg('Ocorreu um erro ao Atualizar a tabela ! '+v_Sql+
                      'Tente Novamente ou comunique ao Administrador SISCART!'+#10+#10+E.Message,mtError,[mbOk],0);
         end;

    end;
    if qry <> nil then
    begin
      qry.Destroy;
      qry := nil;
    end;
end;

procedure TF_ExameC.CurrencyEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_ExameC.BitBtn9Click(Sender: TObject);
begin
  if (not Permissao('acesso018')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  F_StatC:= TF_StatC.Create(Self);
  sPedidoEstorno:= nr_protocolo;
  F_StatC.BringToFront;
  F_StatC.Showmodal;
  F_StatC.Destroy;
  F_StatC := NIL;

  if (not LocalizaProt(Trim(MaskEdit1.Text))) then
  Begin
    BitBtn2Click(F_ExameC);
    Exit;
  end;

  sPedidoEstorno:= '';
end;

procedure TF_ExameC.BitBtn8Click(Sender: TObject);
begin
  F_RegistroAnimal:= TF_RegistroAnimal.Create(Self);
  F_RegistroAnimal.BringToFront;
  F_RegistroAnimal.Showmodal;
  F_RegistroAnimal.Destroy;
  F_RegistroAnimal := NIL;

end;

procedure TF_ExameC.FormShow(Sender: TObject);
begin
 { if (F_Menu.Label39.Caption = '34377622000155') or (F_Menu.Label39.Caption = '34.377.622/0001-55') or
    (F_Menu.Label39.Caption = '27215296000114') or (F_Menu.Label39.Caption = '27.215.296/0001-14') Then 
  Begin
    BitBtn8.Visible:= True
  End
  Else
  BitBtn8.Visible:= False; }
end;

procedure TF_ExameC.edtAverbacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

end.
