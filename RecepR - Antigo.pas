unit RecepR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, DBCtrls, Printers, Buttons, RDprint, ToolEdit,
  CurrEdit, Grids, DBGrids, Menus, RpCon, RpConDS, RpBase, RpSystem,
  RpDefine, RpRave, ComCtrls, jpeg;

type
  TF_RecepR = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    MaskEdit16: TMaskEdit;
    Label25: TLabel;
    Label27: TLabel;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    Label11: TLabel;
    ComboBox3: TComboBox;
    Label13: TLabel;
    ComboBox5: TComboBox;
    Label14: TLabel;
    ComboBox6: TComboBox;
    Label38: TLabel;
    MaskEdit24: TMaskEdit;
    Label16: TLabel;
    MaskEdit9: TMaskEdit;
    Label17: TLabel;
    MaskEdit10: TMaskEdit;
    Label41: TLabel;
    MaskEdit26: TMaskEdit;
    BitBtn4: TBitBtn;
    GroupBox4: TGroupBox;
    Label22: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label32: TLabel;
    MaskEdit17: TMaskEdit;
    MaskEdit18: TMaskEdit;
    MaskEdit19: TMaskEdit;
    ComboBox1: TComboBox;
    MaskEdit27: TMaskEdit;
    ComboBox7: TComboBox;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    Label35: TLabel;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    Label37: TLabel;
    Label4: TLabel;
    ComboBox2: TComboBox;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    ComboBox8: TComboBox;
    Label5: TLabel;
    MaskEdit4: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    CurrencyEdit7: TCurrencyEdit;
    Label8: TLabel;
    CurrencyEdit8: TCurrencyEdit;
    Label12: TLabel;
    ComboBox4: TComboBox;
    Label29: TLabel;
    ComboBox9: TComboBox;
    Label30: TLabel;
    MaskEdit5: TMaskEdit;
    Label31: TLabel;
    ComboBox10: TComboBox;
    MaskEdit6: TMaskEdit;
    Label33: TLabel;
    PrintDialog1: TPrintDialog;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    CurrencyEdit9: TCurrencyEdit;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    RichEdit4: TRichEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label39: TLabel;
    MaskEdit11: TMaskEdit;
    RichEdit5: TRichEdit;
    RichEdit6: TRichEdit;
    RichEdit7: TRichEdit;
    RichEdit8: TRichEdit;
    RvDataSetConnection1: TRvDataSetConnection;
    Label34: TLabel;
    MaskEdit8: TMaskEdit;
    Label10: TLabel;
    Label9: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    CurrencyEdit10: TCurrencyEdit;
    Label43: TLabel;
    MaskEdit12: TMaskEdit;
    RvDataSetConnection2: TRvDataSetConnection;
    RvSystem2: TRvSystem;
    RvProject2: TRvProject;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit28KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit26KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Gravar(Sender : TOBject);
    Procedure Gravar_New(Sender : TOBject);    
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    Procedure Limpar_Tela(Sender : TOBject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit17Exit(Sender: TObject);
    procedure ComboBox7Enter(Sender: TObject);
    procedure ComboBox7KeyPress(Sender: TObject; var Key: Char);
    Procedure Limpa_TelaPessoal(Sender : TOBject);
    procedure ComboBox5Enter(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure CurrencyEdit3Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Exit(Sender: TObject);
    Procedure BuscaTextoCombo(Sender : TObject; Combo : Integer);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Enter(Sender: TObject);
    procedure ComboBox8Exit(Sender: TObject);
    procedure ComboBox8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure MaskEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Enter(Sender: TObject);
    procedure MaskEdit27Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit24Exit(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Enter(Sender: TObject);
    procedure ComboBox8Enter(Sender: TObject);
    procedure ComboBox5KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox6KeyPress(Sender: TObject; var Key: Char);
    procedure CurrencyEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox10Exit(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure MaskEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function Gera_Recibo : Integer;

  end;

var
  F_RecepR: TF_RecepR;
  tipo_, arq : String;
  codcli     : String;
  qcartorio  : String;
  num_rec    : Integer;
implementation

uses DMTD, Menu, Func, Dep1, U_Autent, TRecep, Alerta2, FuncGeral, ProcGeral,
  New_CalcT;

{$R *.DFM}

function trunca2casa( valor:currency ):currency;
var
  vv : String;
begin
  vv := formatcurr('###,###,###,###,#0.0000',valor);
  vv := Copy(vv,1,length(vv) - 2);
  result := strtocurr(vv);
end;

Procedure Grava_TDPedid;
begin
  DM.ArqAux.Close;
  DM.ArqAux.Sql.Clear;
  DM.ArqAux.Sql.Add('SELECT * FROM ' + F_RecepR.Label40.Caption);
  DM.ArqAux.Open;

  DM.ArqAux.FindFirst;

  while not DM.ArqAux.Eof do
  begin
    DM.TD_Pedid.Close;
    DM.TD_Pedid.Sql.Clear;
    DM.TD_Pedid.Sql.Add('INSERT INTO td_pedid (data_r, p_auxiliar, recibo, cod_lae, tabela, item, subitem, descricao, valor_unit,');
    DM.TD_Pedid.Sql.Add(' qtde, valor_calc, tipo_prot)');
    DM.TD_Pedid.Sql.Add(' VALUES (');
    DM.TD_Pedid.Sql.Add(QuotedStr(ConvData(F_RecepR.MaskEdit1.Text)) + ', ');
    DM.TD_Pedid.Sql.Add(F_RecepR.Label3.Caption + ', ');
    DM.TD_Pedid.Sql.Add(F_RecepR.MaskEdit8.Text + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('codigo').AsString)     + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('tabela').AsString)     + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('item_tab').AsString)   + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('subitem').AsString)    + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('descr_tab').AsString)  + ', ');
    DM.TD_Pedid.Sql.Add(TrocaVirgulaporPonto(CurrToStr(DM.ArqAux.fieldbyname('valor_unit').AsCurrency)) + ', ');
    DM.TD_Pedid.Sql.Add(QuotedStr(DM.ArqAux.fieldbyname('qtde').AsString)       + ', ');
    DM.TD_Pedid.Sql.Add(TrocaVirgulaporPonto(CurrToStr(DM.ArqAux.fieldbyname('valor_calc').AsCurrency)) + ', ');
    DM.TD_Pedid.Sql.Add('"T" )');
    DM.TD_Pedid.ExecSQL;
    DM.ArqAux.Next;
  end;
end;


Procedure TF_RecepR.BuscaTextoCombo(Sender : TObject; Combo : Integer);
var
  x : Integer;
begin
  // Mostrando clientes.
  if (Combo = 1) then
  begin
    x := 0;
    while x <= (F_RecepR.ComboBox2.Items.Count - 1) do
    begin
      if (Copy(F_RecepR.ComboBox2.Items.Strings[x], 1, 3) = F_RecepR.MaskEdit2.Text) then
      begin
        F_RecepR.ComboBox2.Text := F_RecepR.ComboBox2.Items.Strings[x];
        x := F_RecepR.ComboBox2.Items.Count;
      end;
      x := x + 1;
    end;
  end;
  // mostrando filiais
  if (Combo = 2) then
  begin
    x := 0;
    while x <= (F_RecepR.ComboBox8.Items.Count - 1) do
    begin
      if (Copy(F_RecepR.ComboBox8.Items.Strings[x], 1, 3) = F_RecepR.MaskEdit3.Text) then
      begin
        F_RecepR.ComboBox8.Text := F_RecepR.ComboBox8.Items.Strings[x];
        x := F_RecepR.ComboBox8.Items.Count;
      end;
      x := x + 1;
    end;
  end;
  // mostrando naturezas
  if (Combo = 3) then
  begin
    x := 0;
    while x <= (F_RecepR.ComboBox3.Items.Count - 1) do
    begin
      if (Copy(F_RecepR.ComboBox3.Items.Strings[x], 1, 3) = F_RecepR.MaskEdit4.Text) then
      begin
        F_RecepR.ComboBox3.Text := F_RecepR.ComboBox3.Items.Strings[x];
        x := F_RecepR.ComboBox3.Items.Count;
      end;
      x := x + 1;
    end;
  end;
  UpdateWindow(Handle);
end;

Procedure Abre_Configur;
begin
  DM.Configur.Close;
  DM.Configur.Sql.Clear;
  DM.Configur.Sql.Add('select * from configur');
  DM.Configur.Open;
end;


Function TF_RecepR.Gera_Recibo : Integer;
Begin
  If F_Menu.Label7.Caption <> 'Saquarema' then
  Begin
    DM.Configur.close;
    DM.Configur.sql.clear;
    DM.Configur.sql.add('select * from configur');
    DM.Configur.open;

    result := DM.Configur.fieldbyname('recibo').asinteger + 1;

    DM.Configur.close;
    DM.Configur.sql.clear;
    DM.Configur.sql.add('UPDATE configur set recibo = ' + QuotedStr((IntToStr(result))));
    DM.Configur.ExecSQL;
  End
  Else
  Begin
    DM.CaixaPJ.close;
    DM.CaixaPJ.sql.clear;
    DM.CaixaPJ.sql.add('select * from configur');
    DM.CaixaPJ.open;

    result := DM.CaixaPJ.fieldbyname('recibo').asinteger + 1;

    DM.CaixaPJ.close;
    DM.CaixaPJ.sql.clear;
    DM.CaixaPJ.sql.add('UPDATE configur set recibo = ' + QuotedStr((IntToStr(result))));
    DM.CaixaPJ.ExecSQL;
  End;
end;


Procedure TF_RecepR.Limpa_TelaPessoal(Sender : TOBject);
begin
  MaskEdit17.Text := '';
  MaskEdit27.Text := '';
  MaskEdit18.Text := '';
  MaskEdit19.Text := '';
  MaskEdit12.Text := '';
  ComboBox7.Text  := '';
end;

Procedure TF_RecepR.Limpar_Tela(Sender : TOBject);
begin
  BitBtn4.Enabled     := False;
  Label3.Caption      := '000000';
  MaskEdit8.Text      := '000000';
  //CodCli              := '0';
  tipo_               := 'T';
  Label35.Caption     := '';
  CurrencyEdit4.Value := 0.00;
  CurrencyEdit5.Value := 0.00;
  CurrencyEdit6.Value := 0.00;
  CurrencyEdit7.Value := 0.00;
  CurrencyEdit8.Value := 0.00;
  CurrencyEdit10.Value:= 0.00;
  Label6.Caption      := 'R$ 0,00';
  GroupBox1.Visible   := False;
  GroupBox4.Enabled   := True;
  MaskEdit5.Text      := '0';
  MaskEdit6.Text      := '';
  MaskEdit6.Visible   := False;
  Label33.Visible     := False;
  ComboBox9.Text      := '';
  ComboBox5.Text      := '4.1 - REGISTRO / AVERB. INTEGRAL COM VALOR';
  MaskEdit6.Text      := '';
  ListBox1.Clear;
  if (F_Menu.Label15.Caption = 'T') then MaskEdit1.Enabled := True else MaskEdit1.Enabled := False;
end;

procedure TF_RecepR.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RecepR.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit17.SetFocus;
end;

procedure TF_RecepR.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (F_Menu.Label26.Caption = 'F') then MaskEdit2.SetFocus else ComboBox1.SetFocus;
  end
end;

procedure TF_RecepR.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit8.SetFocus;
end;

procedure TF_RecepR.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

Function GerarProtocolo : Boolean;
var
  geraprot : Boolean;
Begin
  Result := False;
  if (StrToInt(F_RecepR.Label3.Caption) = 0) then
  begin
    //verificando se o sistema est� travado
    geraprot := False;
    while (not geraprot) do
    begin
      Dm.Seq_Bal.Close;
      Dm.Seq_Bal.Sql.Clear;
      if F_Menu.Label37.Caption = 'D' then
      Dm.Seq_Bal.Sql.Add('SELECT trava FROM seq_bal where cartorio = "D"')
      else
      Dm.Seq_Bal.Sql.Add('SELECT trava FROM seq_bal where cartorio = "' + qcartorio + '"');
      Dm.Seq_Bal.Open;
      if (Dm.Seq_Bal.FieldByName('trava').asString = 'N') then
      begin
        geraprot := True;
      end
      else ShowMessage('AGUARDE, VERIFICANDO CONFIGURA��ES...');
      Dm.Seq_Bal.Close;
    end;
    Dm.Seq_Bal.Close;
    Dm.Seq_Bal.RequestLive := False;
    Dm.Seq_Bal.Sql.Clear;
    Dm.Seq_Bal.Sql.Add('UPDATE seq_bal SET');
    Dm.Seq_Bal.Sql.Add('oficial = (oficial + 1)');
    if F_Menu.Label37.Caption = 'D' then
    dm.Seq_Bal.sql.add('where cartorio = "D"')
    else
    dm.Seq_Bal.sql.add('where cartorio = "' + qcartorio + '"');
    Dm.Seq_Bal.ExecSql;
    Dm.Seq_Bal.Close;
    Dm.Seq_Bal.RequestLive := True;
    Dm.Seq_Bal.Sql.Clear;
    if F_Menu.Label37.Caption = 'D' then
    Dm.Seq_Bal.Sql.Add('SELECT oficial FROM seq_bal where cartorio = ''D''')
    else
    Dm.Seq_Bal.Sql.Add('SELECT oficial FROM seq_bal where cartorio = "' + qcartorio + '"');
    Dm.Seq_Bal.Open;
    F_RecepR.Label3.Caption := StrZero(Dm.Seq_Bal.FieldByName('oficial').asString, 6);
    Result := True;
    Dm.Seq_Bal.Close;
  end;
end;

Procedure TF_RecepR.Gravar(Sender : TOBject);
begin
  Dm.Td.Append;
  Dm.Td.FieldByName('data_r').asString               := MaskEdit1.text;
  Dm.Td.FieldByName('p_auxiliar').asString           := Label3.Caption;
  DM.TD.FieldByName('recibo').AsString               := trim(MaskEdit8.Text);
  Dm.Td.FieldByName('ncliente').asInteger            := StrToInt(CodCli);
  Dm.Td.FieldByName('cod_cli').asstring              := CodCli;
  Dm.Td.FieldByName('cod_port').asstring             := CodCli;
  Label37.Caption                                    := TimeToStr(time);
  Dm.Td.FieldByName('hora_p').asString               := Label37.Caption;
  Dm.Td.FieldByName('status').asString               := 'RECEPCAO';
  Dm.Td.FieldByName('data_entr').asString            := Trim(Maskedit16.text);
  Dm.Td.FieldByName('identifica').asString           := F_Menu.Label1.Caption;
  Dm.Td.FieldByName('a_nome').asstring               := Trim(MaskEdit17.Text);
  Dm.Td.FieldByName('a_cidade').asString             := Trim(Copy(ComboBox8.Text, 7, 100));
  Dm.Td.FieldByName('agencia').asString              := Trim(Copy(ComboBox8.Text, 7, 100));
  Dm.Td.FieldByName('a_telefone').asstring           := Trim(MaskEdit18.Text);
  Dm.Td.FieldByName('contato').asstring              := Trim(MaskEdit19.Text);
  Dm.Td.FieldByName('a_cpff').asstring               := Trim(MaskEdit12.Text);
  Dm.Td.FieldByName('tip_doc').asString              := Trim(ComboBox1.Text);
  Dm.Td.FieldByName('doc').asString                  := TirarTudo(MaskEdit27.Text, '.', '/', '-');
  Dm.Td.FieldByName('tipo').asString                 := tipo_;
  Dm.Td.FieldByName('ext_nat').asString              := Trim(Copy(ComboBox3.Text, 1, 50));
  Dm.Td.FieldByName('natureza').asInteger            := StrToInt(MaskEdit4.Text);
  Dm.Td.FieldByName('tabela').asString               := Trim(Copy(ComboBox5.Text, 1,5));
  Dm.Td.FieldByName('divisor').asInteger             := StrToInt(Copy(ComboBox6.Text, 1,2));
  Dm.Td.FieldByName('v_total').asCurrency            := VrTotG;
  dm.td.FieldByName('v_doi').AsCurrency              := VrDoi;
  dm.td.FieldByName('v_doi_info').AsCurrency         := VrDoiInfo;
  dm.td.FieldByName('v_tribunal').AsCurrency         := calc_vfetj;//VrTribunal;
  dm.td.FieldByName('v_emolumentos').AsCurrency      := calc_emol;
  dm.td.FieldByName('v_procuradoria').AsCurrency     := VrProcuradoria;
  dm.td.FieldByName('v_defensoria').AsCurrency       := VrDefensoria;
  dm.td.FieldByName('v_mutua').AsCurrency            := VrMutua;
  dm.td.FieldByName('v_acoterj').AsCurrency          := VrAcoterj;
  dm.td.FieldByName('v_distrib').AsCurrency          := VrDistrib;
  dm.td.FieldByName('v_subtotal').AsCurrency         := VrSubTotal;
  Dm.Td.FieldByName('custas').asCurrency             := CurrencyEdit2.Value;
  Dm.Td.FieldByName('valor_base').asCurrency         := CurrencyEdit1.Value;
  Dm.Td.FieldByName('deposito').asCurrency           := CurrencyEdit3.Value;
  dm.td.FieldByName('doi').AsString                  := ComboBox4.Text;
  dm.td.FieldByName('qtd_doi').AsString              := MaskEdit11.Text;

  if ComboBox4.Text = 'S' then
  begin
    dm.td.FieldByName('v_doi').AsCurrency             := VrDoi;
    dm.td.FieldByName('v_doi_info').AsCurrency        := VrDoiInfo;
  end;

  dm.td.FieldByName('v_guia').AsCurrency             := VrGuia;
  dm.td.FieldByName('v_guia_info').AsCurrency        := VrGuiaInfo;

  if F_Menu.Label37.Caption = 'D' then
    //Distribuicao para qual cart�rio
  dm.td.FieldByName('cartorio').AsString             := qcartorio
  else
  dm.td.FieldByName('cartorio').AsString             := F_Menu.Label37.Caption;
  dm.TD.FieldByName('anotacao').AsString             := MaskEdit6.Text;
  dm.td.FieldByName('tipo_reg').AsString             := ComboBox10.Text;
  Dm.Td.Post;

  // Atualizando Td_Pesso
  Dm.Td_Pesso.Append;
  Dm.Td_Pesso.FieldByName('data').asString           := MaskEdit1.Text;
  Dm.Td_Pesso.FieldByName('tipo').asString           := tipo_;
  Dm.Td_Pesso.FieldByName('p_auxiliar').asString     := Trim(Label3.Caption);
  Dm.Td_Pesso.FieldByName('recibo').asString         := Trim(MaskEdit8.Text);
  Dm.Td_Pesso.FieldByName('nome').asString           := Trim(MaskEdit17.Text);
  Dm.Td_Pesso.FieldByName('tip_doc1').asString       := Trim(ComboBox1.Text);
  Dm.Td_Pesso.FieldByName('doc1').asString           := TirarTudo(MaskEdit27.Text, '.', '/', '-');
  Dm.Td_Pesso.FieldByName('tip_doc2').asString       := Trim(ComboBox11.Text);
  Dm.Td_Pesso.FieldByName('doc2').asString           := MaskEdit7.Text;

  Dm.Td_Pesso.FieldByName('situacao').asString       := Ver_Situacao1(Trim(ComboBox7.Text));
  dm.Td_Pesso.FieldByName('cartorio').AsString       := F_Menu.Label37.Caption;
  Dm.Td_Pesso.Post;
  //*************
  if F_Menu.Label37.Caption = 'D' then
  begin
    if (not Guarda_Mov(qcartorio, MaskEdit1.text, Label3.Caption, Trim(Copy(ComboBox5.Text, 1,5)), MaskEdit4.Text, CurrencyEdit2.Value)) then
    ShowMessage('Problemas para atualizar a Distribuicao.');
  end;

  if (not Atualiza_Caixa(MaskEdit1.Text, '10', 'E', 'T�TULO PARA REGISTRO', Label3.Caption, Label35.Caption, F_Menu.Label1.Caption, Trim(MaskEdit17.Text), CurrencyEdit3.Value, CurrencyEdit4.Value, CurrencyEdit6.Value, CurrencyEdit5.Value, CurrencyEdit9.Value)) then
  begin
    ShowMessage('Problemas para atualizar o caixa.');
  end;

  Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'T�tulo recepcionado em ' + MaskEdit1.Text + '.', Label3.Caption);
end;

Procedure TF_RecepR.Gravar_New(Sender : TOBject);
begin
  Dm.Td.Append;
  Dm.Td.FieldByName('data_r').asString               := MaskEdit1.text;
  Dm.Td.FieldByName('p_auxiliar').asString           := Label3.Caption;
  DM.TD.FieldByName('recibo').AsString               := trim(MaskEdit8.Text);
  Dm.Td.FieldByName('ncliente').asInteger            := StrToInt(CodCli);
  Dm.Td.FieldByName('cod_cli').asstring              := CodCli;
  Dm.Td.FieldByName('cod_port').asstring             := CodCli;
  Label37.Caption                                    := TimeToStr(time);
  Dm.Td.FieldByName('hora_p').asString               := Label37.Caption;
  Dm.Td.FieldByName('status').asString               := 'RECEPCAO';
  Dm.Td.FieldByName('data_entr').asString            := Trim(Maskedit16.text);
  Dm.Td.FieldByName('identifica').asString           := F_Menu.Label1.Caption;
  Dm.Td.FieldByName('a_nome').asstring               := Trim(MaskEdit17.Text);
  Dm.Td.FieldByName('a_cidade').asString             := Trim(Copy(ComboBox8.Text, 7, 100));
  Dm.Td.FieldByName('agencia').asString              := Trim(Copy(ComboBox8.Text, 7, 100));
  Dm.Td.FieldByName('a_telefone').asstring           := Trim(MaskEdit18.Text);
  Dm.Td.FieldByName('contato').asstring              := Trim(MaskEdit19.Text);
  Dm.Td.FieldByName('a_cpff').asstring               := Trim(MaskEdit12.Text);
  Dm.Td.FieldByName('tip_doc').asString              := Trim(ComboBox1.Text);
  Dm.Td.FieldByName('doc').asString                  := TirarTudo(MaskEdit27.Text, '.', '/', '-');
  Dm.Td.FieldByName('tipo').asString                 := tipo_;
  Dm.Td.FieldByName('ext_nat').asString              := Trim(Copy(ComboBox3.Text, 1, 50));
  Dm.Td.FieldByName('natureza').asInteger            := StrToInt(MaskEdit4.Text);
  Dm.Td.FieldByName('tabela').asString               := Trim(Copy(ComboBox5.Text, 1,3));
  Dm.Td.FieldByName('divisor').asInteger             := StrToInt(Copy(ComboBox6.Text, 1,2));

  Dm.Td.FieldByName('qtde_nome').AsInteger           := qtd_nom;
  Dm.Td.FieldByName('v_nome').AsCurrency             := tot_nomexc;
  dm.td.FieldByName('v_infodistrib').AsCurrency      := VrTrib_nom + VrDefen_nom + VrProcu_nom;

  Dm.Td.FieldByName('pag_adic').AsInteger            := qtd_pg;
  Dm.Td.FieldByName('v_pag').AsCurrency              := v_qtd_pg;

  dm.td.FieldByName('v_emolumentos').AsCurrency      := calc_emol;
  dm.td.FieldByName('v_tribunal').AsCurrency         := calc_vfetj;//VrTribunal;
  dm.td.FieldByName('v_procuradoria').AsCurrency     := VrProcuradoria;
  dm.td.FieldByName('v_defensoria').AsCurrency       := VrDefensoria;
  dm.td.FieldByName('v_mutua').AsCurrency            := VrMutua;
  dm.td.FieldByName('v_acoterj').AsCurrency          := VrAcoterj;
  dm.td.FieldByName('v_distrib').AsCurrency          := VrDistrib;
  dm.td.FieldByName('v_leis_dist').AsCurrency        := VrTrib_DIST + VrDefen_DIST + VrProcu_DIST;
  dm.td.FieldByName('v_subtotal').AsCurrency         := VrSubTotal;
  dm.td.FieldByName('v_total').AsCurrency            := VrTotG;
  Dm.Td.FieldByName('custas').asCurrency             := CurrencyEdit2.Value;
  Dm.Td.FieldByName('valor_base').asCurrency         := CurrencyEdit1.Value;
  Dm.Td.FieldByName('deposito').asCurrency           := CurrencyEdit3.Value;
  Dm.Td.FieldByName('v_cus_ter').asCurrency          := CurrencyEdit8.Value;
  dm.td.FieldByName('doi').AsString                  := ComboBox4.Text;
  dm.td.FieldByName('qtd_doi').AsString              := MaskEdit11.Text;

  if ComboBox4.Text = 'S' then
  begin
    dm.td.FieldByName('v_doi').AsCurrency             := VrDoi;
    dm.td.FieldByName('v_doi_info').AsCurrency        := VrDoiInfo;
  end;

  dm.td.FieldByName('v_guia').AsCurrency             := VrGuia;
  dm.td.FieldByName('v_guia_info').AsCurrency        := VrGuiaInfo;

  if F_Menu.Label37.Caption = 'D' then
    //Distribuicao para qual cart�rio
  dm.td.FieldByName('cartorio').AsString             := qcartorio
  else
  dm.td.FieldByName('cartorio').AsString             := F_Menu.Label37.Caption;
  dm.TD.FieldByName('anotacao').AsString             := MaskEdit6.Text;
  dm.td.FieldByName('tipo_reg').AsString             := ComboBox10.Text;
  Dm.Td.Post;

  // Atualizando Td_Pesso
  Dm.Td_Pesso.Append;
  Dm.Td_Pesso.FieldByName('data').asString           := MaskEdit1.Text;
  Dm.Td_Pesso.FieldByName('tipo').asString           := tipo_;
  Dm.Td_Pesso.FieldByName('p_auxiliar').asString     := Trim(Label3.Caption);
  Dm.Td_Pesso.FieldByName('recibo').asString         := Trim(MaskEdit8.Text);
  Dm.Td_Pesso.FieldByName('nome').asString           := Trim(MaskEdit17.Text);
  Dm.Td_Pesso.FieldByName('tip_doc1').asString       := Trim(ComboBox1.Text);
  Dm.Td_Pesso.FieldByName('doc1').asString           := TirarTudo(MaskEdit27.Text, '.', '/', '-');
  Dm.Td_Pesso.FieldByName('tip_doc2').asString       := Trim(ComboBox11.Text);
  Dm.Td_Pesso.FieldByName('doc2').asString           := MaskEdit7.Text;

  Dm.Td_Pesso.FieldByName('situacao').asString       := Ver_Situacao1(Trim(ComboBox7.Text));
  dm.Td_Pesso.FieldByName('cartorio').AsString       := F_Menu.Label37.Caption;
  Dm.Td_Pesso.Post;
  //*************
  if F_Menu.Label37.Caption = 'D' then
  begin
    if (not Guarda_Mov(qcartorio, MaskEdit1.text, Label3.Caption, Trim(Copy(ComboBox5.Text, 1,5)), MaskEdit4.Text, CurrencyEdit2.Value)) then
    ShowMessage('Problemas para atualizar a Distribuicao.');
  end;                                                                                                                                                   //CurrencyEdit3.Value, CurrencyEdit4.Value

  If CurrencyEdit4.Value > 0 then CurrencyEdit4.Value := CurrencyEdit2.Value;

  if (not Atualiza_Caixa(MaskEdit1.Text, '10', 'E', 'T�TULO PARA REGISTRO', Label3.Caption, Label35.Caption, F_Menu.Label1.Caption, Trim(MaskEdit19.Text), CurrencyEdit2.Value, CurrencyEdit4.Value, CurrencyEdit6.Value, CurrencyEdit5.Value, CurrencyEdit9.Value)) then
  begin
    ShowMessage('Problemas para atualizar o caixa.');
  end;

  //Grava��o dos itens utilizados no calculo do t�tulo.
//  If Copy(ComboBox6.Text,1,2) <> '06' then
//    Grava_TDPedid;

  Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'T�tulo recepcionado em ' + MaskEdit1.Text + '.', Label3.Caption);
end;


procedure TF_RecepR.MaskEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit19.SetFocus;
end;

procedure TF_RecepR.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RecepR.BitBtn1Click(Sender: TObject);
begin
{  if MaskEdit13.Text <> '3' then
  begin
    imprimir_matrix;
  end
  else
  begin
    imprimir_not;
  end; }
end;

procedure TF_RecepR.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit27.SetFocus;
end;

procedure TF_RecepR.MaskEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
  if key = 13 then ComboBox11.SetFocus;
end;

procedure TF_RecepR.MaskEdit28KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit17.SetFocus;
end;

procedure TF_RecepR.MaskEdit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit18.SetFocus;
end;

procedure TF_RecepR.MaskEdit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox7.SetFocus;
end;

procedure TF_RecepR.ComboBox7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit18.SetFocus;
end;

procedure TF_RecepR.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if ComboBox4.Text = 'S' then
    begin
      Label39.Visible    := True;
      MaskEdit11.Visible := True;
      MaskEdit11.SetFocus;
    end
    else
    begin
      Label39.Visible    := False;
      MaskEdit11.Visible := False;
      CurrencyEdit1.SetFocus;
    end;
  end;
end;

procedure TF_RecepR.ComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 vezes : String;
begin
  if key = 13 then
  Begin
   vezes := '';
   F_menu.vezes.caption := '';
   if copy(combobox5.text,1,2) = '03' then
   Begin
    F_menu.vezes.caption := InputBox('QTDADE DE DESTINAT�RIO', 'Digite a quantidade de destinat�rios :', '1');
   end;
   ComboBox6.SetFocus;
  end;
end;

procedure TF_RecepR.ComboBox6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepR.MaskEdit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepR.MaskEdit26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_RecepR.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vr_calc_fim, ufir_min, ufir_max : Currency;
begin
  if key = 13 then CurrencyEdit2.SetFocus;
{
  begin
    RichEdit1.Lines.Clear;
    RichEdit2.Lines.Clear;
    RichEdit3.Lines.Clear;
    RichEdit4.Lines.Clear;
    RichEdit5.Lines.Clear;
    RichEdit6.Lines.Clear;
    RichEdit7.Lines.Clear;
    RichEdit8.Lines.Clear;

    If Copy(ComboBox6.Text,1,2) <> '06' then
    Begin
      if (DM.Config_Adm.FieldByName('chk_01').AsBoolean) then
      begin
        CalculoGeral(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value
      end;

      if (DM.Config_Adm.FieldByName('chk_02').AsBoolean) then //Calculo feito para Resende
      begin
        CalculoGeral2(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      end;

      if (DM.Config_Adm.FieldByName('chk_03').AsBoolean) then //Calculo feito para Itatiaia e Demais Cart�rios
      begin
        CalculoGeral3(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      end;

//    if (DM.Config_Adm.FieldByName('chk_08').AsBoolean) then //Calculo Aberto
      if True then //Calculo Aberto
      begin
        Application.CreateForm(TF_NewCalcT, F_NewCalcT);
        F_NewCalcT.CurrencyEdit22.Value := 0.00;
        vr_calc_fim := 0.00;
        ufir_min    := 0.00;
        ufir_max    := 0.00;
        If (Copy(ComboBox5.Text,1,4) = '1001') OR (Copy(ComboBox5.Text,1,5) = '1003A') then
        Begin
          dm.TabDemais.close;
          dm.TabDemais.sql.Clear;
          dm.TabDemais.sql.Add('select ufir_min, ufir_max from cad_tabdemais');
          dm.TabDemais.sql.add('order by data');
          dm.TabDemais.Open;
          dm.TabDemais.FindLast;
          ufir_min := (dm.TabDemais.FieldByName('ufir_min').AsCurrency * 100);
          ufir_max := (dm.TabDemais.FieldByName('ufir_max').AsCurrency * 100);
          If CurrencyEdit1.Value <= ufir_min then
            vr_calc_fim := dm.TabDemais.FieldByName('ufir_min').AsCurrency
          Else If CurrencyEdit1.Value >= ufir_max then
            vr_calc_fim := dm.TabDemais.FieldByName('ufir_max').AsCurrency
          Else
            vr_calc_fim := TruncaV(((CurrencyEdit1.Value * 1) / 100));

          If (Copy(ComboBox5.Text,1,5) = '1003A') then
            vr_calc_fim := TruncaV(vr_calc_fim / 2);

          F_NewCalcT.CurrencyEdit22.Value := vr_calc_fim;

          If (Copy(ComboBox5.Text,1,4) = '1001') then
            F_NewCalcT.MaskEdit1.Text := '6001'
          Else
            F_NewCalcT.MaskEdit1.Text := '6003'

        End;
        F_NewCalcT.ShowModal;
        F_NewCalcT.Destroy;
        F_NewCalcT := Nil;
        If Copy(ComboBox6.Text,1,2) = '05' then
        Begin
          VrSubTotal     := 0;
          VrTotG         := VrTribunal + VrDefensoria + VrProcuradoria + VrMutua + VrAcoterj + VrDistrib +
                            tot_nomexc + VrTrib_DIST + VrDefen_DIST + VrProcu_DIST +
                            VrTrib_nom + VrDefen_nom + VrProcu_nom;
          CurrencyEdit2.Value := VrTotG;
        End;
      end;
    End
    Else
    Begin
      VrTribunal     := 0;
      VrDefensoria   := 0;
      VrProcuradoria := 0;
      VrMutua        := 0;
      VrAcoterj      := 0;
      VrSubTotal     := 0;
      VrDistrib      := 0;
      VrTotG         := 0;
    End;

 //   if (F_Menu.Label26.Caption = 'T') then
 //   begin
      CurrencyEdit3.SetFocus;
 //   end
 //   else
 //   begin
      BitBtn4.Enabled := True;
      BitBtn4.SetFocus;
 //   end;
  end;}    
end;

procedure TF_RecepR.CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit3.SetFocus;
end;

procedure TF_RecepR.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    BitBtn4.Enabled := True;
    BitBtn4.SetFocus;
  end;
end;

procedure TF_RecepR.BitBtn4Click(Sender: TObject);
var
  vezes, vez, DtCalc : String;
  x, y : Integer;
  impport : String;
  impporti : integer;
  sair   : Boolean;
  emo_vex, bus_vex, con_vex, inf_exc, gui_exc, sub_vex,
  lei20_vex, lei05_vex, lei05a_vex, tot_vex, emol_tit,
  fetj_tit, fund_tit, funp_tit, tota_tit, nome_exc : Currency;
begin
  if (not ValidNumero(MaskEdit4.Text)) then
  begin
    ShowMessage('Natureza Inv�lida !');
    MaskEdit4.SetFocus;
    Exit;
  end;
  if trim(MaskEdit19.Text) = '' then
  begin
    Application.MessageBox('Obrigat�rio Preencher o campo Apresentante!', 'Mensagem do Sistema', mb_ok);
    MaskEdit19.SetFocus;
    exit;
  end;
  if trim(MaskEdit17.Text) = '' then
  begin
    Application.MessageBox('Obrigat�rio Informar uma das Partes!', 'Mensagem do Sistema', mb_ok);
    MaskEdit17.SetFocus;
    exit
  end;

{    if (DM.Config_Adm.FieldByName('chk_01').AsBoolean) then
    begin
      CalculoGeral(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text);
      CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value
    end;

    if (DM.Config_Adm.FieldByName('chk_02').AsBoolean) then //Calculo feito para Resende
    begin
      CalculoGeral2(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
      CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
    end;     }

{ Application.CreateForm(TF_TelaRecep, F_TelaRecep);
  F_TelaRecep.ShowModal;
  F_TelaRecep.Label1.Caption := 'Gerar esta recep��o quantas vezes ?';
  vezes := F_TelaRecep.MaskEdit1.Text;
  F_TelaRecep.Destroy;
  F_TelaRecep := NIL;}
  vezes := '1';

  if (F_Menu.Label37.Caption = 'D')  then
  begin
    if (trim(ComboBox9.Text) = '') then
    begin
      //Distribui��o para qual cart�rio
      dm.qrmenor.ParamByName('PARTABELA').Value := trim(copy(ComboBox5.Text, 1, 5));
      DM.qrMenor.active := True;

      qcartorio := dm.qrmenor.FieldByName('codigo').asstring;
      dm.qrMenor.Active := False;
      Label9.Caption := qcartorio;
    end
    else
    begin
      qcartorio := ComboBox9.Text;
      Label9.Caption := qcartorio;
    end;
  end
  else
  begin
    qcartorio := F_Menu.label37.Caption;
    Label9.Caption := qcartorio;
  end;

  if (StrToInt(vezes) > 0) then
  begin
    if (MessageBox(Handle, PChar('Confirma recep��o ? '), 'RECEP��O DE T�TULOS', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin
      // Abrindo Tabela TD

      Dm.Td.Close;
      Dm.Td.Sql.Clear;
      Dm.Td.Sql.Add('SELECT * FROM td');
      Dm.Td.Sql.Add('WHERE');
      Dm.Td.Sql.Add('recno = 0');
      Dm.Td.Open;
      //Abrindo Tabela Td_Pesso
      Dm.Td_Pesso.Close;
      Dm.Td_Pesso.Sql.Clear;
      Dm.Td_Pesso.Sql.Add('SELECT * FROM td_pesso');
      Dm.Td_Pesso.Sql.Add('WHERE');
      Dm.Td_Pesso.Sql.Add('recno = 0');
      Dm.Td_Pesso.Open;
      GroupBox1.Visible := True;

      if DM.Configur.FieldByName('chk_17').AsString = 'T' then
      begin
        num_rec        := Gera_Recibo;
        MaskEdit8.Text := strzero(inttostr(num_rec),6);
      end;

      Abre_Configur;

      for x := 1 to StrToInt(vezes) do
      begin
        if (not GerarProtocolo) then
        begin
          ShowMessage('Problemas para gerar o protocolo auxiliar.');
          ShowMessage('Recep��o cancelada.');
          Exit;
        end;

//      if (DM.Config_Adm.FieldByName('chk_08').AsBoolean) then
        if True then
        begin
          Gravar_New(F_RecepR);
        end
        else
        begin
          Gravar(F_RecepR);
        end;

        if MessageDlg('Deseja imprimir?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          if (F_Menu.laser.Caption = '1') then
          begin
            if (F_Menu.Label24.Caption = 'T') then
            begin
              Dm.ArqAux.Close;
              Dm.ArqAux.Sql.Clear;
              Dm.ArqAux.Sql.Add('SELECT * FROM td');
              Dm.ArqAux.Sql.Add('WHERE');
              Dm.ArqAux.Sql.Add('p_auxiliar = ' + QuotedStr(Label3.Caption));
              Dm.ArqAux.Open;

              Dm.ArqAux2.Close;
              Dm.ArqAux2.Sql.Clear;
              Dm.ArqAux2.Sql.Add('SELECT * FROM td_pedid');
              Dm.ArqAux2.Sql.Add('WHERE');
              Dm.ArqAux2.Sql.Add('p_auxiliar = ' + QuotedStr(Label3.Caption));
              Dm.ArqAux2.Open;
              DM.ArqAux2.FindFirst;
              
              if (DM.Config_Adm.FieldByName('chk_08').AsBoolean) then
              begin

                while not DM.ArqAux2.Eof do
                begin
                  F_RecepR.RichEdit1.Lines.Add(DM.ArqAux2.fieldbyname('tabela').AsString + '.' + DM.ArqAux2.fieldbyname('item').AsString + ' ' + DM.ArqAux2.fieldbyname('subitem').AsString);
                  F_RecepR.RichEdit2.Lines.Add(DM.ArqAux2.fieldbyname('descricao').AsString);
                  F_RecepR.RichEdit3.Lines.Add(DM.ArqAux2.fieldbyname('qtde').AsString + ' x');
                  F_RecepR.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.fieldbyname('valor_calc').AsCurrency));
                  DM.ArqAux2.Next;
                end;

                RvDataSetConnection1.DataSet := dm.ArqAux;

                RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
                RvProject1.SetParam('data', F_menu.Label7.caption + formatdatetime('" ," dd "de" mmmm "de" yyyy', date));

                RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency +
                                                                             DM.ArqAux.fieldbyname('v_tribunal').AsCurrency +
                                                                             DM.ArqAux.fieldbyname('v_defensoria').AsCurrency +
                                                                             DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency +
                                                                             DM.ArqAux.fieldbyname('v_mutua').AsCurrency +
                                                                             DM.ArqAux.fieldbyname('v_acoterj').AsCurrency +
                                                                             (VrDistrib+VrTrib_DIST + VrDefen_DIST + VrProcu_DIST + VrTrib_nom + VrDefen_nom + VrProcu_nom+tot_nomexc)));
//                                                                             DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

                If cert_vias > 1 then RvProject1.ExecuteReport('report1'); // RECIBO PRENOTA��O


                If cert_vias > 1 then
                Begin
                  RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
                  RvProject1.SetParam('cnpj_cart', F_Menu.Label39.Caption);
                  RvProject1.SetParam('end_cart',  F_Menu.Label11.Caption);
                  RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
                  RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
                  RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
                  RvProject1.SetParam('Descricao',  F_RecepR.RichEdit1.Text);
                  RvProject1.SetParam('Descricao2', F_RecepR.RichEdit2.Text);
                  RvProject1.SetParam('Descricao3', F_RecepR.RichEdit3.Text);
                  RvProject1.SetParam('Descricao4', F_RecepR.RichEdit4.Text);
                  RvProject1.SetParam('situacao',  ComboBox7.Text);

                  RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
                  RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                  RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_defensoria').AsCurrency));
                  RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency));
                  RvProject1.SetParam('nome_exc', FormatCurr('###,###,##0.00', (VrDistrib+VrTrib_DIST + VrDefen_DIST + VrProcu_DIST + VrTrib_nom + VrDefen_nom + VrProcu_nom+tot_nomexc)));
  //                DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

                  RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumentos').AsCurrency +
                                                                               DM.ArqAux.fieldbyname('v_tribunal').AsCurrency +
                                                                               DM.ArqAux.fieldbyname('v_defensoria').AsCurrency +
                                                                               DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency +
                                                                               DM.ArqAux.fieldbyname('v_mutua').AsCurrency +
                                                                               DM.ArqAux.fieldbyname('v_acoterj').AsCurrency +
                                                                               (VrDistrib+VrTrib_DIST + VrDefen_DIST + VrProcu_DIST + VrTrib_nom + VrDefen_nom + VrProcu_nom+tot_nomexc)));
                                                                               //DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

                  RvProject1.ExecuteReport('report2');  //RECIBO TITULOS
                End
                Else
                Begin
                  RvProject2.SetParam('nome_cart', F_Menu.Label29.Caption);
                  RvProject2.SetParam('cnpj_cart', F_Menu.Label39.Caption);
                  RvProject2.SetParam('end_cart',  F_Menu.Label11.Caption);
                  RvProject2.SetParam('fone_cart',  F_Menu.Label12.Caption);
                  RvProject2.SetParam('usuario',    F_Menu.Label25.Caption);
                  RvProject2.SetParam('doc_usu',    F_Menu.Label38.Caption);
                  RvProject2.SetParam('Descricao',  F_RecepR.RichEdit1.Text);
                  RvProject2.SetParam('Descricao2', F_RecepR.RichEdit2.Text);
                  RvProject2.SetParam('Descricao3', F_RecepR.RichEdit3.Text);
                  RvProject2.SetParam('Descricao4', F_RecepR.RichEdit4.Text);
                  RvProject2.SetParam('situacao',  ComboBox7.Text);

                  RvProject2.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumentos').AsCurrency));
                  RvProject2.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_tribunal').AsCurrency));
                  RvProject2.SetParam('fund_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_defensoria').AsCurrency));
                  RvProject2.SetParam('funp_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency));
                  RvProject2.SetParam('nome_exc', FormatCurr('###,###,##0.00', (VrDistrib+VrTrib_DIST + VrDefen_DIST + VrProcu_DIST + VrTrib_nom + VrDefen_nom + VrProcu_nom+tot_nomexc)));
  //                DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

                  RvProject2.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_emolumentos').AsCurrency +
                                                                               DM.ArqAux.fieldbyname('v_tribunal').AsCurrency +
                                                                               DM.ArqAux.fieldbyname('v_defensoria').AsCurrency +
                                                                               DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency +
                                                                               DM.ArqAux.fieldbyname('v_mutua').AsCurrency +
                                                                               DM.ArqAux.fieldbyname('v_acoterj').AsCurrency +
                                                                               (VrDistrib+VrTrib_DIST + VrDefen_DIST + VrProcu_DIST + VrTrib_nom + VrDefen_nom + VrProcu_nom+tot_nomexc)));
                                                                               //DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

                  RvProject2.ExecuteReport('report2')  //RECIBO TITULOS
                End;

              end;

//            if (DM.Configur.FieldByName('chk_11').AsBoolean) then
              if False then
              begin
                VrTrib_nom  := 0;
                VrDefen_nom := 0;
                VrProcu_nom := 0;
                tot_nomexc  := 0;
                nome_dist   := 0;
                v_nome      := 0;

                // RECIBO DE VIAS EXCEDENTES - RESENDE
                if (F_RecepR.MaskEdit26.Text <> '0') then
                begin
                  Dm.Calculo.Close;
                  Dm.Calculo.Sql.Clear;
                  Dm.Calculo.Sql.Add('SELECT data FROM cad_cus');
                  Dm.Calculo.Sql.Add('GROUP BY data');
                  Dm.Calculo.Sql.Add('ORDER BY data DESC');
                  Dm.Calculo.Open;
                  if (Dm.Calculo.RecordCount = 0) then
                  begin
                    Dm.Calculo.Close;
                    MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
                    Exit;
                  end;
                  while (not Sair) AND (not Dm.Calculo.Eof) do
                  begin
                    if (StrToDate(MaskEdit1.Text) >= Dm.Calculo.FieldByName('data').asDateTime) then
                    begin
                      DtCalc := Dm.Calculo.FieldByName('data').AsString;
                      Sair   := True;
                    end;
                    Dm.Calculo.Next;
                  end;


                  { Calculo para a Via Excedente }
                  Dm.Calculo.Close;
                  Dm.Calculo.Sql.Clear;
                  Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
                  Dm.Calculo.Sql.Add('WHERE');
                  Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
                  Dm.Calculo.Sql.Add('AND tabela = ''10''');
                  Dm.Calculo.Sql.Add('AND item  = ''4''');
                  Dm.Calculo.Open;
                  if (Dm.Calculo.RecordCount = 0) then
                  begin
                    Dm.Calculo.Close;
                    MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR A TABELA DE VIAS EXCEDENTES !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
                    Exit;
                  end;
                  emo_vex := Dm.Calculo.FieldByName('v_emolumentos').asCurrency * StrToInt(MaskEdit26.Text);
                  Dm.Calculo.Close;

                  { Conferencia }
                  Dm.Calculo.Close;
                  Dm.Calculo.Sql.Clear;
                  Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
                  Dm.Calculo.Sql.Add('WHERE');
                  Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
                  Dm.Calculo.Sql.Add('AND tabela = ''1''');
                  Dm.Calculo.Sql.Add('AND item  = ''5''' );
                  Dm.Calculo.Open;
                  if (Dm.Calculo.RecordCount = 0) then
                  begin
                    Dm.Calculo.Close;
                    MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
                    Exit;
                  end;
                  con_vex := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
                  Dm.Calculo.Close;

                  //Busca
                  Dm.Calculo.Close;
                  Dm.Calculo.Sql.Clear;
                  Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
                  Dm.Calculo.Sql.Add('WHERE');
                  Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
                  Dm.Calculo.Sql.Add('AND tabela = ''1''');
                  Dm.Calculo.Sql.Add('AND item  = ''1''' );
                  Dm.Calculo.Open;
                  if (Dm.Calculo.RecordCount = 0) then
                  begin
                    Dm.Calculo.Close;
                    MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
                    Exit;
                  end;
                  bus_vex := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
                  Dm.Calculo.Close;

                  //Informatica
                  Dm.Calculo.Close;
                  Dm.Calculo.Sql.Clear;
                  Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
                  Dm.Calculo.Sql.Add('WHERE');
                  Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
                  Dm.Calculo.Sql.Add('AND tabela = ''1''');
                  Dm.Calculo.Sql.Add('AND item  = ''9''');
                  Dm.Calculo.Open;
                  if (Dm.Calculo.RecordCount = 0) then
                  begin
                    Dm.Calculo.Close;
                    MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
                    Exit;
                  end;
                  inf_exc := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
                  Dm.Calculo.Close;
                  gui_exc := dm.TabDemais.FieldByName('guia_informatica').AsCurrency  * StrToInt(MaskEdit26.Text);

                  sub_vex := emo_vex + con_vex + bus_vex + inf_exc + gui_exc;

                  lei20_vex := truncav((sub_vex * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
                  lei05_vex := truncav((sub_vex * dm.tabdemais.FieldByName('defensoria').ascurrency) / 100);
                  lei05a_vex:= truncav((sub_vex * dm.tabdemais.FieldByName('procuradoria').ascurrency) / 100);

                  tot_vex := sub_vex + lei20_vex + lei05_vex + lei05a_vex;
                end;


                RvDataSetConnection1.DataSet := dm.ArqAux;


                RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
                RvProject1.SetParam('data', F_menu.Label7.caption + formatdatetime('" ," dd "de" mmmm "de" yyyy', date));
                RvProject1.ExecuteReport('report1'); // RECIBO PRENOTA��O


                RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
                RvProject1.SetParam('cnpj_cart', F_Menu.Label39.Caption);
                RvProject1.SetParam('end_cart',  F_Menu.Label11.Caption);
                RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
                RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
                RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
                RvProject1.SetParam('Descricao',  F_RecepR.RichEdit1.Text);
                RvProject1.SetParam('Descricao2', F_RecepR.RichEdit2.Text);
                RvProject1.SetParam('Descricao3', F_RecepR.RichEdit3.Text);
                RvProject1.SetParam('Descricao4', F_RecepR.RichEdit4.Text);

                emol_tit := DM.ArqAux.fieldbyname('v_subtotal').AsCurrency - sub_vex;
                fetj_tit := DM.ArqAux.fieldbyname('v_tribunal').AsCurrency - lei20_vex;
                fund_tit := DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency - lei05_vex;
                funp_tit := DM.ArqAux.fieldbyname('v_defensoria').AsCurrency - lei05a_vex;
                tota_tit := DM.ArqAux.fieldbyname('v_total').AsCurrency - tot_vex;


                if (DM.ArqAux.fieldbyname('v_nome').AsCurrency = 0) then
                begin
                  nome_dist := DM.ArqAux.fieldbyname('v_distrib').AsCurrency;

                  //Tribunal
                  VrTrib_nom  := trunca2casa((nome_dist * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
                  //Defensoria
                  VrDefen_nom := trunca2casa((nome_dist * dm.tabdemais.FieldByName('defensoria').ascurrency) / 100);
                  //Procuradoria
                  VrProcu_nom := trunca2casa((nome_dist * dm.tabdemais.FieldByName('procuradoria').ascurrency) / 100);

                  tot_nomexc :=  nome_dist + VrTrib_nom + VrDefen_nom + VrProcu_nom;
                end
                else
                begin
                  tot_nomexc := DM.ArqAux.fieldbyname('v_nome').AsCurrency;
                end;

                nome_exc := tot_nomexc;

                RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', emol_tit));
                RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', fetj_tit));
                RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', fund_tit));
                RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', funp_tit));
                RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', tota_tit));
                RvProject1.SetParam('nome_exc', FormatCurr('###,###,##0.00', nome_exc +
                                                                             DM.ArqAux.fieldbyname('v_distrib').AsCurrency +
                                                                             DM.ArqAux.fieldbyname('v_leis_dist').AsCurrency));

                RvProject1.ExecuteReport('report2');  //RECIBO TITULOS


                if (F_RecepR.MaskEdit26.Text <> '0') then
                begin
                  RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
                  RvProject1.SetParam('cnpj_cart', F_Menu.Label39.Caption);
                  RvProject1.SetParam('end_cart',  F_Menu.Label11.Caption);
                  RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
                  RvProject1.SetParam('usuario', F_Menu.Label25.Caption);
                  RvProject1.SetParam('doc_usu', F_Menu.Label38.Caption);
                  RvProject1.SetParam('Descricao',  F_RecepR.RichEdit5.Text);
                  RvProject1.SetParam('Descricao2', F_RecepR.RichEdit6.Text);
                  RvProject1.SetParam('Descricao3', F_RecepR.RichEdit7.Text);
                  RvProject1.SetParam('Descricao4', F_RecepR.RichEdit8.Text);
                  RvProject1.SetParam('emol', FormatCurr('###,###,##0.00', sub_vex));
                  RvProject1.SetParam('fetj', FormatCurr('###,###,##0.00', lei20_vex));
                  RvProject1.SetParam('fund', FormatCurr('###,###,##0.00', lei05a_vex));
                  RvProject1.SetParam('funp', FormatCurr('###,###,##0.00', lei05_vex));
                  RvProject1.SetParam('vtot', FormatCurr('###,###,##0.00', tot_vex));
                  RvProject1.ExecuteReport('report3');  //RECIBO VIAS EXCEDENTES
                end;
              end;
            end
            else
            Begin
              ReciboRec(Funcoes, False, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit19.Text), Trim(MaskEdit18.Text), Trim(Copy(ComboBox3.Text, 7, 50)), MaskEdit16.Text, Label37.Caption, Trim(MaskEdit17.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'TD C', False), CurrencyEdit3.Value, CurrencyEdit2.Value, VrEmolumentos, VrEmolAdicional, VrPag, VrViasExcedente, VrMicrofilme, VrDigitalizacao, VrInformatica, VrGravEletronica, VrConferencia,
                          VrDistrib, VrInfoDistrib, VrGravEletrDistrib, VrNomeExc, calc_vfetj, VrProcuradoria, VrDefensoria, VrMutua, VrAcoterj, VrSubTotal, VrTotG);
            end;                                                                   // VrTribunal,
          end
          else
          Begin
            if f_menu.matricial.Caption = '1' then
            begin
              if (F_Menu.Label24.Caption = 'T') then
              begin
                Funcoes.ReciboTitulos(Funcoes, True, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit17.Text), Trim(MaskEdit18.Text), Trim(Copy(ComboBox3.Text, 7, 50)), MaskEdit16.Text, Label37.Caption, Trim(MaskEdit19.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'TD C', False), CurrencyEdit3.Value,
                              VrEmolumentos, VrEmolAdicional, VrPag, VrViasExcedente, VrMicrofilme, VrDigitalizacao, VrInformatica, VrGravEletronica, VrConferencia,
                              VrDistrib, VrInfoDistrib, VrGravEletrDistrib, VrNomeExc, calc_vfetj, VrProcuradoria, VrDefensoria, VrMutua, VrAcoterj, VrSubTotal, VrTotG);
              end                                                                      //VrTribunal,
              else
              Begin
                Funcoes.ReciboTitulos(Funcoes, False, MaskEdit1.Text, Label3.Caption, Trim(MaskEdit17.Text), Trim(MaskEdit18.Text), Trim(Copy(ComboBox3.Text, 7, 50)), MaskEdit16.Text, Label37.Caption, Trim(MaskEdit19.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'TD C', False), CurrencyEdit3.Value,
                              VrEmolumentos, VrEmolAdicional, VrPag, VrViasExcedente, VrMicrofilme, VrDigitalizacao, VrInformatica, VrGravEletronica, VrConferencia,
                              VrDistrib, VrInfoDistrib, VrGravEletrDistrib, VrNomeExc, calc_vfetj, VrProcuradoria, VrDefensoria, VrMutua, VrAcoterj, VrSubTotal, VrTotG);
              end;                                                                     //VrTribunal,
            end
            else
            begin
              Application.CreateForm(TF_TelaRecep, F_TelaRecep);
              F_TelaRecep.Label1.Caption := 'Gerar impress�o quantas vezes ?';
              F_TelaRecep.ShowModal;
              vez := F_TelaRecep.MaskEdit1.Text;
              F_TelaRecep.Destroy;
              F_TelaRecep := NIL;

              for y := 1 to strtoint(vez) do
              begin
                impport := Bematech_porta;
                ReciboRecBem(Funcoes, True, MaskEdit1.Text, Label3.Caption, MaskEdit8.Text, Trim(MaskEdit19.Text), Trim(MaskEdit18.Text), Trim(Copy(ComboBox3.Text, 1, 50)), MaskEdit16.Text, Label37.Caption, Trim(MaskEdit12.Text), Autentica(Label3.Caption, MaskEdit1.Text, StrAsterisco(Trim(StrCurr(CurrencyEdit3.Value, 14, True)), 14), 'TD C', False),  Label9.Caption , copy(ComboBox5.text, 1, 5) , MaskEdit24.Text, Maskedit9.text, MaskEdit10.Text, Maskedit26.Text, impport, MaskEdit5.Text, F_Menu.Label1.Caption,
                             CurrencyEdit3.Value, CurrencyEdit2.Value, VrEmolumentos, VrEmolAdicional, VrPag, VrViasExcedente, VrMicrofilme, VrDigitalizacao, Vr_Notpag, VrInformatica, VrGravEletronica, VrConferencia, (VrDoi + VrDoiInfo), VrProcEst, VrPorDist,
                             (VrDistrib+VrTrib_DIST + VrDefen_DIST + VrProcu_DIST + VrTrib_nom + VrDefen_nom + VrProcu_nom+tot_nomexc), VrInfoDistrib, VrGravEletrDistrib, VrNomeExc, calc_vfetj, VrProcuradoria, VrDefensoria, VrMutua, VrAcoterj, VrSubTotal, VrTotG);
              end;                                                                                                                                                                    //VrTribunal, 
            end;
          end;
        end;
        if F_Menu.Label9.Caption = 'D' then
          ListBox1.Items.Add(qcartorio + '  ' + Label3.Caption)
        else ListBox1.Items.Add(Label3.Caption);
        ListBox1.ItemIndex := (ListBox1.Items.Count -1);
        Label3.Caption := '000000';
        MaskEdit8.Text := '000000';
      end;
      Dm.Td.Close;
      Dm.Td_Pesso.Close;
      BitBtn4.Enabled     := False;
    end
    else ShowMessage('Recep��o n�o gerada !');
  end
  else ShowMessage('Recep��o n�o gerada !');
  GroupBox4.Enabled := False;
  BitBtn2.SetFocus;
end;

procedure TF_RecepR.BitBtn2Click(Sender: TObject);
begin
  Limpar_Tela(F_RecepR);

  F_RecepR.RichEdit1.Clear;
  F_RecepR.RichEdit2.Clear;
  F_RecepR.RichEdit3.Clear;
  F_RecepR.RichEdit4.Clear;
  F_RecepR.RichEdit5.Clear;
  F_RecepR.RichEdit6.Clear;
  F_RecepR.RichEdit7.Clear;
  F_RecepR.RichEdit8.Clear;  

  MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), StrToInt(F_Menu.Label42.Caption)));

  if not (DM.Configur.FieldByName('chk_17').AsBoolean) then
  begin
    MaskEdit8.SetFocus;
  end
  else
  begin
    if (F_Menu.Label26.Caption = 'F') then
      MaskEdit2.SetFocus else ComboBox1.SetFocus;
  end;

  Label9.Caption := '0';
end;

procedure TF_RecepR.FormActivate(Sender: TObject);
begin
  CodCli         := '0';
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(Date);

  if F_Menu.Label37.Caption = 'D' then
  begin
    Label9.Visible  := True;
    Label10.Visible := True;
  end;

  ComboBox9.Clear;
  dm.qr_cartorio.close;
  dm.qr_cartorio.sql.Clear;
  dm.qr_cartorio.sql.add('select * from catorios');
  dm.qr_cartorio.Open;

  //Abrindo Configur
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur');
  Dm.Configur.Open;

  //Abrindo Config_adm
  Dm.Config_Adm.Close;
  Dm.Config_Adm.Sql.Clear;
  Dm.Config_Adm.Sql.Add('SELECT * FROM config_adm');
  Dm.Config_Adm.Open;

  if not (DM.Configur.FieldByName('chk_17').AsBoolean) then
  begin
    MaskEdit8.Enabled := True;
  end;

  while not dm.qr_cartorio.Eof do
  begin
    ComboBox9.Items.Add(dm.qr_cartorio.FieldByName('codigo').AsString);
    dm.qr_cartorio.Next;
  end;
//  BitBtn2Click(F_RecepR);
end;

procedure TF_RecepR.MaskEdit17Exit(Sender: TObject);
begin
  if (Label26.Caption <> 'C') then
  begin
   if Procura_Contra('nome', Trim(MaskEdit17.Text)) then F_Alerta2.Showmodal;
  end;
  MaskEdit19.Text := MaskEdit17.Text;
  MaskEdit12.Text := MasKEdit27.Text;
end;

procedure TF_RecepR.ComboBox7Enter(Sender: TObject);
begin
//  SendMessage(ComboBox7.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RecepR.ComboBox7KeyPress(Sender: TObject; var Key: Char);
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

procedure TF_RecepR.ComboBox5Enter(Sender: TObject);
begin
  SendMessage(ComboBox5.handle, CB_SHOWDROPDOWN, Integer(True), 0);
  if (Trim(ComboBox5.Text) = '') then ComboBox5.Text := ComboBox5.Items.Strings[0];
end;

procedure TF_RecepR.ComboBox3Exit(Sender: TObject);
var
  util : String;
  pz   : Integer;
begin
  if ComboBox3.Text <> '' then
  begin
    dm.Natureza.Close;
    dm.Natureza.sql.Clear;
    dm.natureza.SQL.add('select * from natureza where natureza = "' + trim(copy(ComboBox3.Text, 1, 50)) + '"');
    dm.natureza.Open;
    MaskEdit4.Text := dm.Natureza.FieldByName('cod').AsString;
  //  util := dm.Natureza.FieldByName('uteis').AsString;
  //  pz   := dm.Natureza.FieldByName('prazo').AsInteger;
  //  pz   := pz - 1;
  //  if (util = 'N') then
 //   begin
 //     MaskEdit16.Text := DateToStr(Ver_DiaUtil(StrToDate(MaskEdit1.Text) + pz));
 //   end
 //   else MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), pz));
  end;
//  else MaskEdit16.Text := DateToStr(date);
  Tipo_ := Copy(ComboBox3.Text, Length(ComboBox3.Text), 1);
  if (Tipo_ = 'N') then
  begin
    ComboBox5.Text  := ComboBox5.Items.Strings[3];
    MaskEdit24.Text := Copy(ComboBox3.Text, (Length(ComboBox3.Text) - 2), 2);
  end
  else
  begin
    ComboBox5.Items.Strings[0];
    MaskEdit24.Text := '1';
  end;
  if (StrToInt(MaskEdit4.Text) = 2) then
  begin
    ComboBox5.Text  := '1006 - Notifica��o';
    if (StrToInt(MaskEdit4.Text) = 197) OR (StrToInt(MaskEdit4.Text) = 300) then MaskEdit24.Text := '1';
  end;


 {if (Trim(MaskEdit4.Text) = '0') then MaskEdit4.Text := Copy(ComboBox3.Text, 1,3);
  if (Trim(ComboBox3.Text) <> '') then
  begin
    dm.Natureza.Close;
    dm.Natureza.sql.Clear;
    dm.natureza.SQL.add('select * from natureza where natureza = "' + ComboBox3.Text + '"');
    dm.natureza.Open;

    util := dm.Natureza.FieldByName('uteis').AsString;
    pz   := dm.Natureza.FieldByName('prazo').AsInteger;
    pz   := pz - 1;
    if (util = 'N') then
    begin
      MaskEdit16.Text := DateToStr(Ver_DiaUtil(StrToDate(MaskEdit1.Text) + pz));
    end
    else MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), pz));
  end
  else MaskEdit16.Text := DateToStr(date);
  Tipo_ := Copy(ComboBox3.Text, Length(ComboBox3.Text), 1);
  if (Tipo_ = 'N') then
  begin
    ComboBox5.Text  := ComboBox5.Items.Strings[3];
    MaskEdit24.Text := Copy(ComboBox3.Text, (Length(ComboBox3.Text) - 2), 2);
  end
  else
  begin
    ComboBox5.Items.Strings[0];
    MaskEdit24.Text := '0';
  end;
  if (StrToInt(MaskEdit4.Text) = 2) then
  begin
    ComboBox7.Text  := 'R   - REMETENTE';
    ComboBox5.Text  := '03 - Notifica��o';
    if (StrToInt(MaskEdit4.Text) = 197) OR (StrToInt(MaskEdit4.Text) = 300) then MaskEdit24.Text := '5';
  end;}
end;

procedure TF_RecepR.ListBox1DblClick(Sender: TObject);
var
  DtCalc : String;
  sair   : Boolean;
  emo_vex, bus_vex, con_vex, inf_exc, gui_exc, sub_vex,
  lei20_vex, lei05_vex, lei05a_vex, tot_vex, emol_tit,
  fetj_tit, fund_tit, funp_tit, tota_tit : Currency;
begin
  F_RecepR.RichEdit1.Clear;
  F_RecepR.RichEdit2.Clear;
  F_RecepR.RichEdit3.Clear;
  F_RecepR.RichEdit4.Clear;
  F_RecepR.RichEdit5.Clear;
  F_RecepR.RichEdit6.Clear;
  F_RecepR.RichEdit7.Clear;
  F_RecepR.RichEdit8.Clear;

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('p_auxiliar = ' + ListBox1.Items.Strings[ListBox1.ItemIndex]);
  Dm.ArqAux.Open;

  Dm.ArqAux2.Close;
  Dm.ArqAux2.Sql.Clear;
  Dm.ArqAux2.Sql.Add('SELECT * FROM td_pedid');
  Dm.ArqAux2.Sql.Add('WHERE');
  Dm.ArqAux2.Sql.Add('p_auxiliar = ' + ListBox1.Items.Strings[ListBox1.ItemIndex]);
  Dm.ArqAux2.Open;
  DM.ArqAux2.FindFirst;

  if (DM.Config_Adm.FieldByName('chk_08').AsBoolean) then
  begin
    while not DM.ArqAux2.Eof do
    begin
      F_RecepR.RichEdit1.Lines.Add(DM.ArqAux2.fieldbyname('tabela').AsString + '.' + DM.ArqAux2.fieldbyname('item').AsString + ' ' + DM.ArqAux2.fieldbyname('subitem').AsString);
      F_RecepR.RichEdit2.Lines.Add(DM.ArqAux2.fieldbyname('descricao').AsString);
      F_RecepR.RichEdit3.Lines.Add(DM.ArqAux2.fieldbyname('qtde').AsString + ' x');
      F_RecepR.RichEdit4.Lines.Add(FormatCurr('###,##0.00', DM.ArqAux2.fieldbyname('valor_calc').AsCurrency));
      DM.ArqAux2.Next;
    end;

    RvDataSetConnection1.DataSet := dm.ArqAux;

    RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
    RvProject1.SetParam('data', F_menu.Label7.caption + formatdatetime('" ," dd "de" mmmm "de" yyyy', date));
    RvProject1.ExecuteReport('report1'); // RECIBO PRENOTA��O


    RvProject1.SetParam('nome_cart', F_Menu.Label29.Caption);
    RvProject1.SetParam('cnpj_cart', F_Menu.Label39.Caption);
    RvProject1.SetParam('end_cart',  F_Menu.Label11.Caption);
    RvProject1.SetParam('fone_cart',  F_Menu.Label12.Caption);
    RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
    RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
    RvProject1.SetParam('Descricao',  F_RecepR.RichEdit1.Text);
    RvProject1.SetParam('Descricao2', F_RecepR.RichEdit2.Text);
    RvProject1.SetParam('Descricao3', F_RecepR.RichEdit3.Text);
    RvProject1.SetParam('Descricao4', F_RecepR.RichEdit4.Text);


    RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency));
    RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_tribunal').AsCurrency));
    RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_defensoria').AsCurrency));
    RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency));
    RvProject1.SetParam('nome_exc', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

    RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', DM.ArqAux.fieldbyname('v_subtotal').AsCurrency +
                                                                 DM.ArqAux.fieldbyname('v_tribunal').AsCurrency +
                                                                 DM.ArqAux.fieldbyname('v_defensoria').AsCurrency +
                                                                 DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency +
                                                                 DM.ArqAux.fieldbyname('v_mutua').AsCurrency +
                                                                 DM.ArqAux.fieldbyname('v_acoterj').AsCurrency +
                                                                 DM.ArqAux.fieldbyname('v_distrib').AsCurrency));

    RvProject1.ExecuteReport('report2');  //RECIBO TITULOS
  end;

  if (DM.Configur.FieldByName('chk_11').AsBoolean) then
  begin
    // RECIBO DE VIAS EXCEDENTES - RESENDE
    if (F_RecepR.MaskEdit26.Text <> '0') then
    begin
      Dm.Calculo.Close;
      Dm.Calculo.Sql.Clear;
      Dm.Calculo.Sql.Add('SELECT data FROM cad_cus');
      Dm.Calculo.Sql.Add('GROUP BY data');
      Dm.Calculo.Sql.Add('ORDER BY data DESC');
      Dm.Calculo.Open;
      if (Dm.Calculo.RecordCount = 0) then
      begin
        Dm.Calculo.Close;
        MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
        Exit;
      end;
      while (not Sair) AND (not Dm.Calculo.Eof) do
      begin
        if (StrToDate(MaskEdit1.Text) >= Dm.Calculo.FieldByName('data').asDateTime) then
        begin
          DtCalc := Dm.Calculo.FieldByName('data').AsString;
          Sair   := True;
        end;
        Dm.Calculo.Next;
      end;

      if (F_RecepR.MaskEdit26.Text <> '0') then
      begin
        { Calculo para a Via Excedente }
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''10''');
        Dm.Calculo.Sql.Add('AND item  = ''4''');
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR A TABELA DE VIAS EXCEDENTES !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        emo_vex := Dm.Calculo.FieldByName('v_emolumentos').asCurrency * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;

        { Conferencia }
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''1''');
        Dm.Calculo.Sql.Add('AND item  = ''5''' );
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        con_vex := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;

        //Busca
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''1''');
        Dm.Calculo.Sql.Add('AND item  = ''1''' );
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        bus_vex := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;

        //Informatica
        Dm.Calculo.Close;
        Dm.Calculo.Sql.Clear;
        Dm.Calculo.Sql.Add('SELECT * FROM cad_cus');
        Dm.Calculo.Sql.Add('WHERE');
        Dm.Calculo.Sql.Add('    data   = ' + Chr(39) + ConvData(DtCalc) + Chr(39));
        Dm.Calculo.Sql.Add('AND tabela = ''1''');
        Dm.Calculo.Sql.Add('AND item  = ''9''');
        Dm.Calculo.Open;
        if (Dm.Calculo.RecordCount = 0) then
        begin
          Dm.Calculo.Close;
          MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA DE CUSTAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
          Exit;
        end;
        inf_exc := dm.calculo.FieldByName('v_emolumentos').ascurrency  * StrToInt(MaskEdit26.Text);
        Dm.Calculo.Close;
        gui_exc := dm.TabDemais.FieldByName('guia_informatica').AsCurrency  * StrToInt(MaskEdit26.Text);

        sub_vex := emo_vex + con_vex + bus_vex + inf_exc + gui_exc;

        lei20_vex := truncav((sub_vex * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
        lei05_vex := truncav((sub_vex * dm.tabdemais.FieldByName('defensoria').ascurrency) / 100);
        lei05a_vex:= truncav((sub_vex * dm.tabdemais.FieldByName('procuradoria').ascurrency) / 100);

        tot_vex := sub_vex + lei20_vex + lei05_vex + lei05a_vex;
      end;
    end;

    //Recibo Resende
    RvDataSetConnection1.DataSet := dm.ArqAux;

    RvProject1.SetParam('data', F_menu.Label7.caption + formatdatetime('" ," dd "de" mmmm "de" yyyy', date));
    RvProject1.ExecuteReport('report1'); // RECIBO PRENOTA��O

    RvProject1.SetParam('usuario',    F_Menu.Label25.Caption);
    RvProject1.SetParam('doc_usu',    F_Menu.Label38.Caption);
    RvProject1.SetParam('Descricao',  F_RecepR.RichEdit1.Text);
    RvProject1.SetParam('Descricao2', F_RecepR.RichEdit2.Text);
    RvProject1.SetParam('Descricao3', F_RecepR.RichEdit3.Text);
    RvProject1.SetParam('Descricao4', F_RecepR.RichEdit4.Text);

    emol_tit := DM.ArqAux.fieldbyname('v_subtotal').AsCurrency - sub_vex;
    fetj_tit := DM.ArqAux.fieldbyname('v_tribunal').AsCurrency - lei20_vex;
    fund_tit := DM.ArqAux.fieldbyname('v_procuradoria').AsCurrency - lei05_vex;
    funp_tit := DM.ArqAux.fieldbyname('v_defensoria').AsCurrency - lei05a_vex;
    tota_tit := DM.ArqAux.fieldbyname('v_total').AsCurrency - tot_vex;

    RvProject1.SetParam('emol_tit', FormatCurr('###,###,##0.00', emol_tit));
    RvProject1.SetParam('fetj_tit', FormatCurr('###,###,##0.00', fetj_tit));
    RvProject1.SetParam('fund_tit', FormatCurr('###,###,##0.00', fund_tit));
    RvProject1.SetParam('funp_tit', FormatCurr('###,###,##0.00', funp_tit));
    RvProject1.SetParam('tota_tit', FormatCurr('###,###,##0.00', tota_tit));

    RvProject1.ExecuteReport('report2');  //RECIBO TITULOS


    if (F_RecepR.MaskEdit26.Text <> '0') then
    begin
      RvProject1.SetParam('usuario', F_Menu.Label25.Caption);
      RvProject1.SetParam('doc_usu', F_Menu.Label38.Caption);
      RvProject1.SetParam('Descricao',  F_RecepR.RichEdit5.Text);
      RvProject1.SetParam('Descricao2', F_RecepR.RichEdit6.Text);
      RvProject1.SetParam('Descricao3', F_RecepR.RichEdit7.Text);
      RvProject1.SetParam('Descricao4', F_RecepR.RichEdit8.Text);
      RvProject1.SetParam('emol', FormatCurr('###,###,##0.00', sub_vex));
      RvProject1.SetParam('fetj', FormatCurr('###,###,##0.00', lei20_vex));
      RvProject1.SetParam('fund', FormatCurr('###,###,##0.00', lei05a_vex));
      RvProject1.SetParam('funp', FormatCurr('###,###,##0.00', lei05_vex));
      RvProject1.SetParam('vtot', FormatCurr('###,###,##0.00', tot_vex));
      RvProject1.ExecuteReport('report3');  //RECIBO VIAS EXCEDENTES
    end;
  end;


{  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT p_auxiliar, data_r, a_nome, a_telefone, natureza,');
  Dm.ArqAux.Sql.Add('data_entr, hora_p, deposito, contato, custas,');
  Dm.ArqAux.Sql.Add('v_emolumentos, v_emoladicional, v_pag, v_viaexec,');
  Dm.ArqAux.Sql.Add('v_mic, v_digitalizacao, v_informatica, v_graveletr,');
  Dm.ArqAux.Sql.Add('v_conferencia, v_distrib, v_infodistrib, v_infodistrib,');
  dm.ArqAux.sql.add('v_infodistrib, v_graveletrdistrib, v_nome, v_tribunal,');
  dm.ArqAux.sql.add('v_procuradoria, v_defensoria, v_mutua, v_acoterj, v_subtotal, v_total');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('p_auxiliar = ' + ListBox1.Items.Strings[ListBox1.ItemIndex]);
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    if (F_Menu.Label24.Caption = 'T') then
    begin
      if F_menu.laser.caption = '1' then
      Begin
       ReciboRec(Funcoes, True, Dm.ArqAux.FieldByName('data_r').asString,
                            Dm.ArqAux.FieldByName('p_auxiliar').asString,
                            Dm.ArqAux.FieldByName('a_nome').asString,
                            Dm.ArqAux.FieldByName('a_telefone').asString,
                            Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False),
                            Dm.ArqAux.FieldByName('data_entr').asString,
                            Dm.arqAux.FieldByName('hora_p').asString,
                            Dm.ArqAux.FieldByName('contato').asString,
                            Autentica(Dm.ArqAux.FieldByName('p_auxiliar').asString,
                                      Dm.ArqAux.FieldByName('data_r').asString,
                                      StrAsterisco(Trim(StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True)), 14),
                                      'TDR C', False),
                            Dm.ArqAux.FieldByName('deposito').asCurrency,
                            Dm.ArqAux.FieldByName('custas').asCurrency,
                            Dm.ArqAux.FieldByName('v_emolumentos').asCurrency,
                            Dm.ArqAux.FieldByName('v_emoladicional').asCurrency,
                            Dm.ArqAux.FieldByName('v_pag').asCurrency,
                            Dm.ArqAux.FieldByName('v_viaexec').asCurrency,
                            Dm.ArqAux.FieldByName('v_mic').asCurrency,
                            Dm.ArqAux.FieldByName('v_digitalizacao').asCurrency,
                            Dm.ArqAux.FieldByName('v_informatica').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletr').asCurrency,
                            Dm.ArqAux.FieldByName('v_conferencia').asCurrency,
                            Dm.ArqAux.FieldByName('v_distrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_infodistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletrdistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_nome').asCurrency,
                            Dm.ArqAux.FieldByName('v_tribunal').asCurrency,
                            Dm.ArqAux.FieldByName('v_procuradoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_defensoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_mutua').asCurrency,
                            Dm.ArqAux.FieldByName('v_acoterj').asCurrency,
                            Dm.ArqAux.FieldByName('v_subtotal').asCurrency,
                            Dm.ArqAux.FieldByName('v_total').asCurrency);
      end
       else
        Funcoes.ReciboTitulos(Funcoes, True, Dm.ArqAux.FieldByName('data_r').asString,
                            Dm.ArqAux.FieldByName('p_auxiliar').asString,
                            Dm.ArqAux.FieldByName('a_nome').asString,
                            Dm.ArqAux.FieldByName('a_telefone').asString,
                            Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False),
                            Dm.ArqAux.FieldByName('data_entr').asString,
                            Dm.arqAux.FieldByName('hora_p').asString,
                            Dm.ArqAux.FieldByName('contato').asString,
                            Autentica(Dm.ArqAux.FieldByName('p_auxiliar').asString,
                                      Dm.ArqAux.FieldByName('data_r').asString,
                                      StrAsterisco(Trim(StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True)), 14),
                                      'TDR C', False),
                            Dm.ArqAux.FieldByName('deposito').asCurrency,
                            Dm.ArqAux.FieldByName('v_emolumentos').asCurrency,
                            Dm.ArqAux.FieldByName('v_emoladicional').asCurrency,
                            Dm.ArqAux.FieldByName('v_pag').asCurrency,
                            Dm.ArqAux.FieldByName('v_viaexec').asCurrency,
                            Dm.ArqAux.FieldByName('v_mic').asCurrency,
                            Dm.ArqAux.FieldByName('v_digitalizacao').asCurrency,
                            Dm.ArqAux.FieldByName('v_informatica').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletr').asCurrency,
                            Dm.ArqAux.FieldByName('v_conferencia').asCurrency,
                            Dm.ArqAux.FieldByName('v_distrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_infodistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletrdistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_nome').asCurrency,
                            Dm.ArqAux.FieldByName('v_tribunal').asCurrency,
                            Dm.ArqAux.FieldByName('v_procuradoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_defensoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_mutua').asCurrency,
                            Dm.ArqAux.FieldByName('v_acoterj').asCurrency,
                            Dm.ArqAux.FieldByName('v_subtotal').asCurrency,
                            Dm.ArqAux.FieldByName('v_total').asCurrency);
    end
    else
    begin
      if F_menu.laser.caption = '1' then
      Begin
       ReciboRec(Funcoes, False, Dm.ArqAux.FieldByName('data_r').asString,
                            Dm.ArqAux.FieldByName('p_auxiliar').asString,
                            Dm.ArqAux.FieldByName('a_nome').asString,
                            Dm.ArqAux.FieldByName('a_telefone').asString,
                            Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False),
                            Dm.ArqAux.FieldByName('data_entr').asString,
                            Dm.arqAux.FieldByName('hora_p').asString,
                            Dm.ArqAux.FieldByName('contato').asString,
                            Autentica(Dm.ArqAux.FieldByName('p_auxiliar').asString,
                                      Dm.ArqAux.FieldByName('data_r').asString,
                                      StrAsterisco(Trim(StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True)), 14),
                                      'TDR C', False),
                            Dm.ArqAux.FieldByName('deposito').asCurrency,
                            Dm.ArqAux.FieldByName('custas').asCurrency,
                            Dm.ArqAux.FieldByName('v_emolumentos').asCurrency,
                            Dm.ArqAux.FieldByName('v_emoladicional').asCurrency,
                            Dm.ArqAux.FieldByName('v_pag').asCurrency,
                            Dm.ArqAux.FieldByName('v_viaexec').asCurrency,
                            Dm.ArqAux.FieldByName('v_mic').asCurrency,
                            Dm.ArqAux.FieldByName('v_digitalizacao').asCurrency,
                            Dm.ArqAux.FieldByName('v_informatica').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletr').asCurrency,
                            Dm.ArqAux.FieldByName('v_conferencia').asCurrency,
                            Dm.ArqAux.FieldByName('v_distrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_infodistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletrdistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_nome').asCurrency,
                            Dm.ArqAux.FieldByName('v_tribunal').asCurrency,
                            Dm.ArqAux.FieldByName('v_procuradoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_defensoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_mutua').asCurrency,
                            Dm.ArqAux.FieldByName('v_acoterj').asCurrency,
                            Dm.ArqAux.FieldByName('v_subtotal').asCurrency,
                            Dm.ArqAux.FieldByName('v_total').asCurrency);
      end
       else
       Begin
         Funcoes.ReciboTitulos(Funcoes, False, Dm.ArqAux.FieldByName('data_r').asString,
                            Dm.ArqAux.FieldByName('p_auxiliar').asString,
                            Dm.ArqAux.FieldByName('a_nome').asString,
                            Dm.ArqAux.FieldByName('a_telefone').asString,
                            Ver_Natureza(Dm.ArqAux.FieldByName('natureza').asString, False),
                            Dm.ArqAux.FieldByName('data_entr').asString,
                            Dm.arqAux.FieldByName('hora_p').asString,
                            Dm.ArqAux.FieldByName('contato').asString,
                            Autentica(Dm.ArqAux.FieldByName('p_auxiliar').asString,
                                      Dm.ArqAux.FieldByName('data_r').asString,
                                      StrAsterisco(Trim(StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True)), 14),
                                      'TDR C', False),
                            Dm.ArqAux.FieldByName('deposito').asCurrency,
                            Dm.ArqAux.FieldByName('v_emolumentos').asCurrency,
                            Dm.ArqAux.FieldByName('v_emoladicional').asCurrency,
                            Dm.ArqAux.FieldByName('v_pag').asCurrency,
                            Dm.ArqAux.FieldByName('v_viaexc').asCurrency,
                            Dm.ArqAux.FieldByName('v_mic').asCurrency,
                            Dm.ArqAux.FieldByName('v_digitalizacao').asCurrency,
                            Dm.ArqAux.FieldByName('v_informatica').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletr').asCurrency,
                            Dm.ArqAux.FieldByName('v_conferencia').asCurrency,
                            Dm.ArqAux.FieldByName('v_distrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_infodistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_graveletrdistrib').asCurrency,
                            Dm.ArqAux.FieldByName('v_nome').asCurrency,
                            Dm.ArqAux.FieldByName('v_tribunal').asCurrency,
                            Dm.ArqAux.FieldByName('v_procuradoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_defensoria').asCurrency,
                            Dm.ArqAux.FieldByName('v_mutua').asCurrency,
                            Dm.ArqAux.FieldByName('v_acoterj').asCurrency,
                            Dm.ArqAux.FieldByName('v_subtotal').asCurrency,
                            Dm.ArqAux.FieldByName('v_total').asCurrency);

       end
    end;
  end;
  Dm.ArqAux.Close; }
end;

procedure TF_RecepR.CurrencyEdit3Exit(Sender: TObject);
begin
  if f_dep1 = nil then Application.CreateForm(TF_Dep1, F_Dep1);
  F_dep1.CurrencyEdit1.value := currencyedit2.value;
  F_Dep1.ShowModal;
  CurrencyEdit4.Value := F_Dep1.CurrencyEdit1.Value;
  CurrencyEdit5.Value := F_Dep1.CurrencyEdit2.Value;
  CurrencyEdit6.Value := F_Dep1.CurrencyEdit3.Value;
  CurrencyEdit3.Value := F_Dep1.CurrencyEdit4.Value;
  CurrencyEdit9.Value := F_Dep1.CurrencyEdit5.Value;
  Label35.Caption     := F_Dep1.MaskEdit1.Text;
  if CurrencyEdit3.Value < CurrencyEdit2.Value then
  begin
    Application.MessageBox('Valor do Deposito Inferior ao valor das CUSTAS!', 'Mensagem do sistema', mb_ok);
    CurrencyEdit3Exit(sender);
    exit;
  end;

  If CurrencyEdit3.Value > CurrencyEdit2.Value then CurrencyEdit10.Value := (CurrencyEdit3.Value - CurrencyEdit2.Value); 

  F_Dep1.Destroy;
  F_Dep1 := NIL;
  BitBtn4.Enabled := True;
  BitBtn4.SetFocus;
//  MaskEdit8.SetFocus;
end;

procedure TF_RecepR.MaskEdit2Exit(Sender: TObject);
begin
  codcli := '0';
  if (not ValidNumero(MaskEdit2.Text)) OR (MaskEdit2.Text = '0') then
  begin
    MaskEdit2.Text := '0';
    Combobox2.SetFocus;
  end
  else
  begin
    MaskEdit2.Text := StrZero(Trim(MaskEdit2.Text), 3);
    BuscaTextoCombo(F_RecepR, 1);
    SendMessage(ComboBox2.handle, CB_SHOWDROPDOWN, Integer(False), 0);
    MaskEdit17.Text := Trim(Copy(ComboBox2.Text, 7, 60));
    ComboBox1.Text  := Trim(Copy(ComboBox2.Text, 68, 4));
    MaskEdit27.Text := ConvDoc(Trim(Copy(ComboBox2.Text, 72, 20)), ComboBox1.Text);
    MaskEdit18.Text := Trim(Copy(ComboBox2.Text, 94, 20));
    MaskEdit19.Text := Trim(Copy(ComboBox2.Text, 114, 60));
    CodCli          := Copy(ComboBox2.Text, 176, 3);
    if (Trim(codcli) = '') then codcli := '0';
//    MaskEdit4.Text  := '180';
//    ComboBox5.Text  := '03  - Notifica��o.';
//    ComboBox7.Text  := 'R  - Remetente';
    UpdateWindow(Handle);
  end;
end;

procedure TF_RecepR.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_RecepR.ComboBox2Exit(Sender: TObject);
begin
  codcli := '0';
  if (Trim(ComboBox2.Text) <> '') then
  begin
    MaskEdit2.Text := Copy(ComboBox2.Text, 1,3);
    BuscaTextoCombo(F_RecepR, 1);
    SendMessage(ComboBox2.handle, CB_SHOWDROPDOWN, Integer(False), 0);
    MaskEdit17.Text := Trim(Copy(ComboBox2.Text, 7, 60));
    ComboBox1.Text  := Trim(Copy(ComboBox2.Text, 68, 4));
    MaskEdit27.Text := ConvDoc(Trim(Copy(ComboBox2.Text, 72, 20)), ComboBox1.Text);
    MaskEdit18.Text := Trim(Copy(ComboBox2.Text, 94, 20));
    MaskEdit19.Text := Trim(Copy(ComboBox2.Text, 114, 60));
    CodCli          := Copy(ComboBox2.Text, 176, 3);
    if (Trim(codcli) = '') then codcli := '0';
    UpdateWindow(Handle);
  end;  
end;

procedure TF_RecepR.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_RecepR.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (Trim(MaskEdit17.Text) = '') then
    begin
      ComboBox1.SetFocus;
    end
    else MaskEdit19.SetFocus;
  end;  
end;

procedure TF_RecepR.MaskEdit3Enter(Sender: TObject);
begin
  if (Trim(MaskEdit2.Text) <> '') then Carrega_Filiais(Trim(MaskEdit2.Text));
end;

procedure TF_RecepR.ComboBox8Exit(Sender: TObject);
begin
  if (Trim(ComboBox8.Text) <> '') then MaskEdit3.Text := Copy(ComboBox8.Text, 1,3);
end;

procedure TF_RecepR.ComboBox8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (Trim(MaskEdit17.Text) = '') then
    begin
      ComboBox1.SetFocus;
    end
    else
    begin
       MaskEdit19.SetFocus;
    end;
  end;  
end;

procedure TF_RecepR.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) OR (Trim(MaskEdit3.Text) = '0') then
  begin
    MaskEdit3.Text := '0';
    Combobox8.SetFocus;
  end
  else
  begin
    MaskEdit3.Text := StrZero(Trim(MaskEdit3.Text), 3);
    BuscaTextoCombo(F_RecepR, 2);
    SendMessage(ComboBox8.handle, CB_SHOWDROPDOWN, Integer(False), 0);
    UpDateWindow(Handle);
  end;
end;

procedure TF_RecepR.ComboBox1Exit(Sender: TObject);
begin
  MaskEdit27.EditMask := '';
  MaskEdit27.Clear;
  if (Trim(ComboBox1.Text) = 'CPF') then
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') = '') then MaskEdit27.EditMask := '###.###.###-##';
  end;
  if (Trim(ComboBox1.Text) = 'CNPJ') then
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') = '') then MaskEdit27.EditMask := '##.###.###/####-##';
    ComboBox11.Text := '';
    MaskEdit7.Text := '';
  end;
end;

procedure TF_RecepR.MaskEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox7.SetFocus;
end;

procedure TF_RecepR.MaskEdit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit12.SetFocus;
end;

procedure TF_RecepR.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox10.SetFocus;
end;

procedure TF_RecepR.ComboBox1Enter(Sender: TObject);
begin
  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RecepR.MaskEdit27Exit(Sender: TObject);
begin
  if (Trim(ComboBox1.Text) = 'CPF') then
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') <> '') then
    begin
      if (CheckCPF(TirarTudo(MaskEdit27.Text, '.', '/', '-')) <> TirarTudo(MaskEdit27.Text, '.', '/', '-')) then
      begin
        ShowMessage('ATEN��O - DOCUMENTO INV�LIDO !');
      end;
    end;
  end
  else
  begin
    if (TirarTudo(MaskEdit27.Text, '.', '/', '-') <> '') then
    begin
      if (CheckCGC(TirarTudo(MaskEdit27.Text, '.', '/', '-')) <> TirarTudo(MaskEdit27.Text, '.', '/', '-')) then
      begin
        ShowMessage('ATEN��O - DOCUMENTO INV�LIDO !');
      end;
    end;
  end;
  if (TirarTudo(MaskEdit27.Text, '.', '-', '/') <> '') AND (Trim(MaskEdit17.Text) = '') then
  begin
    Dm.BuscaPartes.Close;
    Dm.BuscaPartes.Sql.Clear;
    Dm.BuscaPartes.Sql.Add('SELECT a_nome, a_telefone, contato');
    Dm.BuscaPartes.Sql.Add('FROM td');
    Dm.BuscaPartes.Sql.Add('WHERE');
    Dm.BuscaPartes.Sql.Add('doc = ' + Chr(39) + TirarTudo(MaskEdit27.Text, '.', '/', '-') + Chr(39));
    Dm.BuscaPartes.Sql.Add('ORDER BY p_auxiliar DESC');
    Dm.BuscaPartes.Open;
    if (Dm.BuscaPartes.RecordCount <> 0) then
    begin
      MaskEdit17.Text := Dm.BuscaPartes.FieldByName('a_nome').asString;
      MaskEdit18.Text := Dm.BuscaPartes.FieldByName('a_telefone').asString;
      MaskEdit19.Text := Dm.BuscaPartes.FieldByName('contato').asString;
    end
    else
    begin
      MaskEdit17.Text := '';
      MaskEdit18.Text := '';
      MaskEdit19.Text := '';
    end;
    Dm.BuscaPartes.Close;
  end; 
end;

procedure TF_RecepR.MaskEdit4Exit(Sender: TObject);
var
  util : String;
  pz   : Integer;
begin
  if (not ValidNumero(MaskEdit4.Text)) OR (MaskEdit4.Text = '0') then
  begin
    MaskEdit4.Text := '0';
    Combobox3.SetFocus;
  end
  else
  begin
    dm.Natureza.close;
    dm.Natureza.sql.clear;
    dm.natureza.sql.add('select * from natureza where cod = ' + MaskEdit4.Text);
    dm.Natureza.Open;
    if dm.Natureza.RecordCount <> 0 then
      ComboBox3.Text := Dm.Natureza.FieldByName('natureza').AsString;
      ComboBox3Exit(sender);
    UpdateWindow(Handle);
  end;
  if (StrToInt(MaskEdit4.Text) = 197) OR (StrToInt(MaskEdit4.Text) = 96)OR (StrToInt(MaskEdit4.Text) = 300)  then
  begin
    ComboBox5.Text  := '1006 - Notifica��o';
    MaskEdit5.text := '1';
    if (StrToInt(MaskEdit4.Text) = 197)OR (StrToInt(MaskEdit4.Text) = 300) then MaskEdit24.Text := '1';
  end;
end;

procedure TF_RecepR.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox10.SetFocus;
end;

procedure TF_RecepR.MaskEdit24Exit(Sender: TObject);
begin
{  MaskEdit24.Text := Trim(MaskEdit24.Text);
  if (not ValidNumero(MaskEdit24.Text)) then MaskEdit24.Text := '0';
  if (MaskEdit24.Text <> '0') then
  begin
    Dm.Local.Close;
    Dm.Local.Sql.Clear;
    Dm.Local.Sql.Add('SELECT valor FROM local');
    Dm.Local.Sql.Add('WHERE');
    Dm.Local.Sql.Add('cod = ' + MaskEdit24.Text);
    Dm.Local.Open;
    if (Dm.Local.RecordCount <> 0) then
    begin
      Label6.Caption := 'R$ ' + Trim(StrCurr(Dm.Local.FieldByName('valor').asCurrency, 14, True));
    end;
    Dm.Local.Close;
  end;
  }
end;

procedure TF_RecepR.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT p_auxiliar, data_r, deposito');
    Dm.ArqAux.Sql.Add('FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('p_auxiliar = ' + ListBox1.Items.Strings[ListBox1.ItemIndex]);
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount <> 0) then
    begin
      Autentica(Dm.ArqAux.FieldByName('p_auxiliar').asString,
                Dm.ArqAux.FieldByName('data_r').asString,
                StrAsterisco(Trim(StrCurr(Dm.ArqAux.FieldByName('deposito').asCurrency, 14, True)), 14),
                'TD C',
                True);
    end;
    Dm.ArqAux.Close;  
  end;
end;

procedure TF_RecepR.ComboBox2Enter(Sender: TObject);
begin
  SendMessage(ComboBox2.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RecepR.ComboBox8Enter(Sender: TObject);
begin
  SendMessage(ComboBox8.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RecepR.ComboBox5KeyPress(Sender: TObject; var Key: Char);
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

procedure TF_RecepR.ComboBox6KeyPress(Sender: TObject; var Key: Char);
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

procedure TF_RecepR.CurrencyEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_RecepR.CurrencyEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_RecepR.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if MaskEdit5.Text = '' then MaskEdit5.Text := '0';
    if (trim(copy(ComboBox5.Text, 1, 5)) = '1002') or
       (trim(copy(ComboBox5.Text, 1, 5)) = '1003B') or
       (trim(copy(ComboBox5.Text, 1, 5)) = '1003D') then
    begin
      if (DM.Config_Adm.FieldByName('chk_01').AsBoolean) then
      begin
        CalculoGeral(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      end;

      if (DM.Config_Adm.FieldByName('chk_02').AsBoolean) then //Calculo feito para Resende
      begin
        CalculoGeral2(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      end;

      if (DM.Config_Adm.FieldByName('chk_03').AsBoolean) then //Calculo feito para Itatiaia e Demais Cartorios
      begin
        CalculoGeral3(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text, True);
        CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      end;


//      CalculoGeral(MaskEdit1.Text, Trim(Copy(ComboBox5.Text, 1,5)), CurrencyEdit1.Value, StrToInt(Copy(ComboBox6.Text, 1,2)), StrToInt(MaskEdit10.Text), StrToInt(MaskEdit9.Text), StrToInt(MaskEdit26.Text), StrToInt(MaskEdit24.Text), StrToInt(MaskEdit5.Text), ComboBox4.Text);
//      CurrencyEdit2.Value := VrTotG + CurrencyEdit7.Value + CurrencyEdit8.Value;
      if (F_Menu.Label26.Caption = 'T') then
      begin
        CurrencyEdit3.SetFocus;
      end
      else
      begin
        BitBtn4.Enabled := True;
        BitBtn4.SetFocus;
      end;

    end;
    ComboBox4.SetFocus;
  end;
end;

procedure TF_RecepR.ComboBox10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if Trim(ComboBox10.Text) = 'Reg.' then ComboBox5.SetFocus;
    if (Trim(ComboBox10.Text) = 'Av.') or (Trim(ComboBox10.Text) = 'Conser.')  then
    begin
      Label33.Visible   := True;
      MaskEdit6.Visible := True;
      MaskEdit6.SetFocus;
    end;
  end;
end;

procedure TF_RecepR.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox5.SetFocus;
end;

procedure TF_RecepR.ComboBox11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_RecepR.ComboBox10Exit(Sender: TObject);
begin
  if trim(ComboBox10.Text) = 'Conser.' then
    MaskEdit6.Text := 'Reg. p/ conserva��o LRP Art. 127, VII'
  else MaskEdit6.Text := '';
end;

procedure TF_RecepR.ComboBox5Exit(Sender: TObject);
begin
   if (trim(copy(ComboBox5.text, 1, 5)) = '1002') or
      (trim(copy(ComboBox5.text, 1, 5)) = '1003B') or
      (trim(copy(ComboBox5.text, 1, 5)) = '1003D') or
      (trim(copy(ComboBox5.text, 1, 5)) = '1006') or
      (trim(copy(ComboBox5.text, 1, 5)) = '1009') then
    begin
      CurrencyEdit1.Value := 0;
    end;

   MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), StrToInt(F_Menu.Label42.Caption)));
   if (trim(copy(ComboBox5.text, 1, 5)) = '1006') or
      (trim(copy(ComboBox5.text, 1, 5)) = '1009') then
   begin
     MaskEdit16.Text := DateToStr(Ver_Feriado(StrToDate(MaskEdit1.Text), StrToInt(F_Menu.Label43.Caption)));
   end;
end;

procedure TF_RecepR.MaskEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_RecepR.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_RecepR.CurrencyEdit1Exit(Sender: TObject);
begin
  calc_emol  := 0.00;
  calc_vfetj := 0.00;
  calc_total := 0.00;

  If (Copy(ComboBox6.Text,1,2) = '01') then
  begin
    If ValidData(MaskEdit1.Text) then dat_calc := QuotedStr(ConvData(MaskEdit1.Text))
    Else dat_calc := QuotedStr(ConvData(DateToStr(now)));
    DM.Tab_Atos.RequestLive := False;
    DM.Tab_Atos.Close;
    DM.Tab_Atos.Sql.Clear;
    DM.Tab_Atos.Sql.Add('select * from tab_ato2 where data <= ' + dat_calc);
    DM.Tab_Atos.Sql.Add('group by data');
    DM.Tab_Atos.Open;
    DM.Tab_Atos.FindLast;
    dat := DM.Tab_Atos.FieldByname('data').AsString;

    //REGISTRO COM VALOR DECLARADO
    if copy(ComboBox5.Text,1,3) = '4.1' then
    begin
      if CurrencyEdit1.Value = 0 then
      begin
        ShowMessage('FAVOR INFORMAR O VALOR A SER CALCULADO !');
        CurrencyEdit1.SetFocus;
        Exit;
      end;

      DM.Tab_Atos.Close;
      DM.Tab_Atos.Sql.Clear;
      DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE data = ' + QuotedStr(ConvData(dat)));
      DM.Tab_Atos.Sql.Add(' AND ate > 0');
      DM.Tab_Atos.Sql.Add(' ORDER BY de, ate');
      DM.Tab_Atos.Open;

      DM.Tab_Atos.Open;
      While (NOT DM.Tab_Atos.Eof) do
      Begin
        If (CurrencyEdit1.Value >= DM.Tab_Atos.FieldByName('de').ASCurrency) AND (CurrencyEdit1.Value <= DM.Tab_Atos.FieldByName('ate').ASCurrency) then
        begin
          calc_emol  := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency;
          calc_vfetj := DM.Tab_Atos.FieldByName('taxa').ASCurrency;
          calc_total := DM.Tab_Atos.FieldByName('total').ASCurrency;
          CurrencyEdit2.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;
        end;
        DM.Tab_Atos.Next;
      end;
    end
    else
    begin
      DM.Tab_Atos.Close;
      DM.Tab_Atos.Sql.Clear;
      DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
      DM.Tab_Atos.Sql.Add('     data = '   + QuotedStr(ConvData(dat)));
      DM.Tab_Atos.Sql.Add(' AND tabela = ' + QuotedStr(copy(ComboBox5.Text,1,1)));
      DM.Tab_Atos.Sql.Add(' AND item_tab = ' + QuotedStr(copy(ComboBox5.Text,3,1)));
      DM.Tab_Atos.Open;

      calc_emol  := DM.Tab_Atos.FieldByName('valor_tab').ASCurrency;
      calc_vfetj := DM.Tab_Atos.FieldByName('taxa').ASCurrency;
      calc_total := DM.Tab_Atos.FieldByName('total').ASCurrency;

      CurrencyEdit2.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;
    end;
  end
  else CurrencyEdit2.Value := DM.Tab_Atos.FieldByName('total').ASCurrency;

  if StrToInt(MaskEdit10.Text) > 0 then
  begin
    if messagedlg('Cobrar Paginas Adicionais ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      DM.Tab_Atos.Close;
      DM.Tab_Atos.Sql.Clear;
      DM.Tab_Atos.Sql.Add('SELECT * FROM tab_ato2 WHERE');
      DM.Tab_Atos.Sql.Add('     data = '   + QuotedStr(ConvData(dat)));
      DM.Tab_Atos.Sql.Add(' AND tabela = "4"');
      DM.Tab_Atos.Sql.Add(' AND item_tab = "2"');
      DM.Tab_Atos.Sql.Add(' AND subitem = "B"');
      DM.Tab_Atos.Open;

      CurrencyEdit2.Value := CurrencyEdit2.Value + (DM.Tab_Atos.FieldByName('total').ASCurrency * StrToInt(MaskEdit10.Text));
    end;
  end;

end;

procedure TF_RecepR.CurrencyEdit2Exit(Sender: TObject);
begin
  currencyedit3.value := currencyedit2.value;
end;

end.
