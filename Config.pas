unit Config;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, ComCtrls, Tabnotbk, jpeg;

type
  TF_Config = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit24: TMaskEdit;
    MaskEdit25: TMaskEdit;
    Label42: TLabel;
    MaskEdit38: TMaskEdit;
    Label48: TLabel;
    MaskEdit44: TMaskEdit;
    MaskEdit48: TMaskEdit;
    Label52: TLabel;
    ControlBar1: TControlBar;
    Label54: TLabel;
    TreeView1: TTreeView;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    Label26: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel2: TBevel;
    Label49: TLabel;
    MaskEdit18: TMaskEdit;
    MaskEdit19: TMaskEdit;
    MaskEdit20: TMaskEdit;
    MaskEdit21: TMaskEdit;
    MaskEdit22: TMaskEdit;
    MaskEdit23: TMaskEdit;
    MaskEdit45: TMaskEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox20: TCheckBox;
    Panel4: TPanel;
    Label7: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label25: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit34: TMaskEdit;
    MaskEdit35: TMaskEdit;
    MaskEdit36: TMaskEdit;
    MaskEdit37: TMaskEdit;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label55: TLabel;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit17: TMaskEdit;
    MaskEdit50: TMaskEdit;
    CheckBox21: TCheckBox;
    Image2: TImage;
    Image3: TImage;
    Bevel3: TBevel;
    Label43: TLabel;
    MaskEdit39: TMaskEdit;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Bevel4: TBevel;
    Label60: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    MaskEdit47: TMaskEdit;
    MaskEdit49: TMaskEdit;
    Label61: TLabel;
    Label62: TLabel;
    Image4: TImage;
    Bevel5: TBevel;
    Label63: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label50: TLabel;
    MaskEdit40: TMaskEdit;
    MaskEdit41: TMaskEdit;
    MaskEdit42: TMaskEdit;
    Maskedit43: TMaskEdit;
    MaskEdit46: TMaskEdit;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Image5: TImage;
    Image6: TImage;
    Label71: TLabel;
    Bevel6: TBevel;
    Label72: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label41: TLabel;
    MaskEdit26: TMaskEdit;
    MaskEdit27: TMaskEdit;
    MaskEdit28: TMaskEdit;
    MaskEdit29: TMaskEdit;
    MaskEdit30: TMaskEdit;
    MaskEdit31: TMaskEdit;
    MaskEdit32: TMaskEdit;
    MaskEdit33: TMaskEdit;
    ComboBox1: TComboBox;
    Bevel7: TBevel;
    Label73: TLabel;
    Label74: TLabel;
    MaskEdit51: TMaskEdit;
    Label75: TLabel;
    MaskEdit52: TMaskEdit;
    Bevel8: TBevel;
    Label76: TLabel;
    Label77: TLabel;
    MaskEdit53: TMaskEdit;
    Label78: TLabel;
    Label79: TLabel;
    Bevel9: TBevel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    MaskEdit54: TMaskEdit;
    MaskEdit55: TMaskEdit;
    Label83: TLabel;
    MaskEdit56: TMaskEdit;
    CheckBox24: TCheckBox;
    Label84: TLabel;
    Panel6: TPanel;
    Image7: TImage;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    MaskEdit57: TMaskEdit;
    MaskEdit58: TMaskEdit;
    MaskEdit59: TMaskEdit;
    MaskEdit61: TMaskEdit;
    MaskEdit63: TMaskEdit;
    MaskEdit64: TMaskEdit;
    MaskEdit68: TMaskEdit;
    MaskEdit69: TMaskEdit;
    Label86: TLabel;
    CheckBox26: TCheckBox;
    Label95: TLabel;
    MaskEdit60: TMaskEdit;
    MaskEdit62: TMaskEdit;
    Label96: TLabel;
    Label97: TLabel;
    CheckBox27: TCheckBox;
    CheckBox29: TCheckBox;
    Label98: TLabel;
    Label99: TLabel;
    CheckBox28: TCheckBox;
    Label100: TLabel;
    MkCaminhoNotifBMP: TMaskEdit;
    Label101: TLabel;
    MaskEdit65: TMaskEdit;
    Label102: TLabel;
    CheckBox31: TCheckBox;
    Bevel10: TBevel;
    Label103: TLabel;
    Label104: TLabel;
    MaskEdit66: TMaskEdit;
    Label105: TLabel;
    MaskEdit67: TMaskEdit;
    Label85: TLabel;
    CheckBox25: TCheckBox;
    Label106: TLabel;
    CheckBox30: TCheckBox;
    Label107: TLabel;
    MaskEdit70: TMaskEdit;
    Label108: TLabel;
    MaskEdit71: TMaskEdit;
    Label109: TLabel;
    MaskEdit72: TMaskEdit;
    Label110: TLabel;
    CheckBox32: TCheckBox;
    Label111: TLabel;
    CheckBox33: TCheckBox;
    Label112: TLabel;
    MaskEdit73: TMaskEdit;
    Label114: TLabel;
    MaskEdit75: TMaskEdit;
    Bevel11: TBevel;
    Label113: TLabel;
    MaskEdit74: TMaskEdit;
    Label115: TLabel;
    MaskEdit76: TMaskEdit;
    Label116: TLabel;
    MaskEdit77: TMaskEdit;
    Label117: TLabel;
    Label118: TLabel;
    MaskEdit78: TMaskEdit;
    Label119: TLabel;
    MaskEdit79: TMaskEdit;
    Label120: TLabel;
    CheckBox34: TCheckBox;
    MaskEdit80: TMaskEdit;
    Label121: TLabel;
    CheckBox35: TCheckBox;
    Label122: TLabel;
    Label123: TLabel;
    MaskEdit81: TMaskEdit;
    Label124: TLabel;
    MaskEdit82: TMaskEdit;
    Label125: TLabel;
    Label126: TLabel;
    MaskEdit83: TMaskEdit;
    MaskEdit84: TMaskEdit;
    Label127: TLabel;
    prazo_diasUteis: TCheckBox;
    CheckBox38: TCheckBox;
    Label128: TLabel;
    MaskEdit85: TMaskEdit;
    Label129: TLabel;
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    Procedure Carregar(Sender : TOBject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure MaskEdit38KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit35KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit36KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit44KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit45KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox19Click(Sender: TObject);
    procedure CheckBox18Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MaskEdit37KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit60KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit62KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit71KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit65KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit67KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit70KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Config: TF_Config;

implementation

uses DMTD, Menu;

{$R *.DFM}

Procedure TF_Config.Carregar(Sender : TOBject);
begin
  // Tabela de Configurações.
  Dm.Configur.Close;
  Dm.Configur.Sql.Clear;
  Dm.Configur.Sql.Add('SELECT * FROM configur where tcartorio = "' + F_Menu.Label37.Caption + '"');
  Dm.Configur.Open;
  MaskEdit1.Text  := Dm.Configur.FieldByName('cartorio').asString;
  MaskEdit2.Text  := Dm.Configur.FieldByName('endereco').asString;
  MaskEdit3.Text  := Dm.Configur.FieldByName('cidade').asString;
  MaskEdit4.Text  := Dm.Configur.FieldByName('estado').asString;
  MaskEdit5.Text  := Dm.Configur.FieldByName('telefone').asString;
  MaskEdit6.Text  := Dm.Configur.FieldByName('fax').asString;
  MaskEdit7.Text  := Dm.Configur.FieldByName('titular').asString;
  MaskEdit8.Text  := Dm.Configur.FieldByName('titulo').asString;
  MaskEdit9.Text  := Dm.Configur.FieldByName('imagens').asString;
  MaskEdit10.Text := Dm.Configur.FieldByName('dir_modrec').asString;
  MaskEdit11.Text := Dm.Configur.FieldByName('dir_modexig').asString;
  MaskEdit12.Text := Dm.Configur.FieldByName('dir_exig').asString;
  MaskEdit13.Text := Dm.Configur.FieldByName('dir_cert').asString;
  MaskEdit19.Text := Dm.Configur.FieldByName('l_dep').asString;
  MaskEdit20.Text := Dm.Configur.FieldByName('f_dep').asString;
  MaskEdit21.Text := Dm.Configur.FieldByName('data_p').asString;
  prazo_diasUteis.Checked := Dm.Configur.FieldByName('prazo_diasUteis').AsBoolean;
  MaskEdit24.Text := Dm.Configur.FieldByName('prazo_t_n').asString;
  MaskEdit25.Text := Dm.Configur.FieldByName('prazo_t_t').asString;
  MaskEdit82.Text := Dm.Configur.FieldByName('prazo_analise_titulo').asString;
  MaskEdit34.Text := Dm.Configur.FieldByName('dir_ret').asString;
  MaskEdit35.Text := Dm.Configur.FieldByName('dir_conf').asString;
  MaskEdit36.Text := Dm.Configur.FieldByName('import_csv').asString;
  MaskEdit37.Text := Dm.Configur.FieldByName('dir_cor').asString;
  MaskEdit38.Text := Dm.Configur.FieldByName('cnpj').asString;

  ComboBox1.Text  := Dm.Configur.FieldByName('cod_correio').asString;                
  if Dm.Configur.FieldByName('imp_laser').asInteger     = 1 then CheckBox1.Checked  := true else CheckBox1.Checked  := false;
  if DM.Configur.FieldByName('imp_matricial').asInteger = 1 then CheckBox2.Checked  := True else CheckBox2.Checked  := False;
  if DM.Configur.FieldByName('imp_bematech').AsInteger  = 1 then CheckBox3.Checked  := True else CheckBox3.Checked  := False;
  if DM.Configur.FieldByName('imp_laser2').AsInteger    = 1 then CheckBox19.Checked := True else CheckBox19.Checked := False;
  if DM.Configur.FieldByName('imp_bematech2').AsInteger = 1 then CheckBox18.Checked := True else CheckBox18.Checked := False;
  MaskEdit39.Text := Dm.Configur.FieldByName('bematech_porta').asString;
  MaskEdit40.text := dm.Configur.FieldByName('nomeescrevente').AsString;
  MaskEdit41.Text := dm.configur.FieldByName('cpfescrevente').AsString;
  MaskEdit42.Text := dm.Configur.FieldByName('matriculaescrevente').AsString;
  MaskEdit43.Text := dm.Configur.FieldByName('caminho_xml').AsString;
  MaskEdit44.Text := dm.Configur.FieldByName('email').AsString;
  MaskEdit71.Text := dm.Configur.FieldByName('site').AsString;
  MaskEdit46.Text := dm.Configur.FieldByName('serventia').AsString;
  MaskEdit47.Text := dm.Configur.fieldbyname('porta_cert').AsString;
  maskedit48.text := dm.configur.fieldbyname('horario_atendimento').asstring;
  MaskEdit49.Text := dm.Configur.fieldbyname('cert_vias').AsString;
  MaskEdit50.Text := dm.Configur.fieldbyname('recibo').AsString;
  MaskEdit53.Text := dm.Configur.fieldbyname('imp_etq_matr').AsString;
  MaskEdit66.Text := dm.Configur.fieldbyname('porta_com_recibo_cupom').AsString;
  MaskEdit60.Text := dm.Configur.FieldByName('imgSeloCertidaoImagem').AsString;
  MaskEdit62.Text := dm.Configur.FieldByName('dir_cert_notificacao').AsString;
  MaskEdit65.Text := dm.Configur.FieldByName('Caminho_Carimbo').AsString;
  MaskEdit67.Text := dm.Configur.FieldByName('caminhoExecutavel').AsString;
  MaskEdit70.Text := dm.Configur.FieldByName('caminhoDoExportaPDF').AsString;
  MaskEdit72.Text := dm.Configur.FieldByName('dir_centralrtd').AsString;
  MaskEdit79.Text := dm.Configur.FieldByName('dir_imagem_animal').AsString;


  MaskEdit51.Text := Dm.Configur.FieldByName('livrop').asString;
  MaskEdit52.Text := Dm.Configur.FieldByName('folhap').asString;
  MaskEdit73.Text := Dm.Configur.FieldByName('tot_folha_lvb_p').asString;

  MaskEdit55.Text := Dm.Configur.FieldByName('livro_c').asString;
  MaskEdit54.Text := Dm.Configur.FieldByName('folha_c').asString;
  MaskEdit75.Text := Dm.Configur.FieldByName('tot_folha_lvc_p').asString;

  MaskEdit74.Text := Dm.Configur.FieldByName('tot_folha_lva_p').asString;
  MaskEdit78.Text := Dm.Configur.FieldByName('tot_prot_lva_p').asString;
  MaskEdit76.Text := Dm.Configur.FieldByName('livro_lva_p').asString;
  MaskEdit77.Text := Dm.Configur.FieldByName('folha_lva_p').asString;

  if dm.Configur.fieldByName('chk_01').AsBoolean = True then CheckBox4.Checked  := True else CheckBox4.Checked  := False;
  if dm.Configur.fieldByName('chk_02').AsBoolean = True then CheckBox5.Checked  := True else CheckBox5.Checked  := False;
  if dm.Configur.fieldByName('chk_03').AsBoolean = True then CheckBox6.Checked  := True else CheckBox6.Checked  := False;
  if dm.Configur.fieldByName('chk_04').AsBoolean = True then CheckBox7.Checked  := True else CheckBox7.Checked  := False;
  if dm.Configur.fieldByName('chk_05').AsBoolean = True then CheckBox8.Checked  := True else CheckBox8.Checked  := False;
  if dm.Configur.fieldByName('chk_06').AsBoolean = True then CheckBox9.Checked  := True else CheckBox9.Checked  := False;
  if dm.Configur.fieldByName('chk_07').AsBoolean = True then CheckBox10.Checked := True else CheckBox10.Checked := False;
  if dm.Configur.fieldByName('chk_08').AsBoolean = True then CheckBox11.Checked := True else CheckBox11.Checked := False;
  if dm.Configur.fieldByName('chk_09').AsBoolean = True then CheckBox12.Checked := True else CheckBox12.Checked := False;
  if dm.Configur.fieldByName('chk_10').AsBoolean = True then CheckBox13.Checked := True else CheckBox13.Checked := False;
  if dm.Configur.FieldByName('chk_11').AsBoolean = True then CheckBox14.Checked := True else CheckBox14.Checked := False;
  if dm.Configur.FieldByName('chk_16').AsBoolean = True then CheckBox15.Checked := True else CheckBox15.Checked := False;
  if dm.Configur.FieldByName('chk_13').AsBoolean = True then CheckBox16.Checked := True else CheckBox16.Checked := False;
  if dm.Configur.FieldByName('chk_14').AsBoolean = True then CheckBox17.Checked := True else CheckBox17.Checked := False;
  if dm.Configur.FieldByName('chk_15').AsBoolean = True then CheckBox20.Checked := True else CheckBox20.Checked := False;
  if dm.Configur.FieldByName('chk_17').AsBoolean = True then CheckBox21.Checked := True else CheckBox21.Checked := False;
  if dm.Configur.FieldByName('chk_18').AsBoolean = True then CheckBox22.Checked := True else CheckBox22.Checked := False;
  if dm.Configur.FieldByName('chk_19').AsBoolean = True then CheckBox23.Checked := True else CheckBox23.Checked := False;
  if dm.Configur.FieldByName('chk_20').AsBoolean = True then CheckBox24.Checked := True else CheckBox24.Checked := False;
  if dm.Configur.FieldByName('chk_21').AsBoolean = True then CheckBox25.Checked := True else CheckBox25.Checked := False;
  if dm.Configur.FieldByName('chk_30').AsBoolean = True then CheckBox30.Checked := True else CheckBox30.Checked := False;

  if dm.Configur.FieldByName('chk_Image_Averb').AsBoolean = True then CheckBox32.Checked := True else CheckBox32.Checked := False;
  CheckBox35.Checked := dm.Configur.FieldByName('gerarDajeIsento').AsBoolean;
  if dm.Configur.FieldByName('PermiteRecepcaoSemDAJE').AsBoolean = True then
    CheckBox34.Checked := True
  else
  CheckBox34.Checked := False;

  if dm.Configur.FieldByName('desab_lf_cabec').AsBoolean = True then
    CheckBox38.Checked := True
  else
  CheckBox38.Checked := False;


  if dm.Configur.FieldByName('AlteraPartesExames').AsBoolean = True then CheckBox26.Checked := True else CheckBox26.Checked := False;
  if dm.Configur.FieldByName('PermiteEdicaoNaturesaExame').AsBoolean = True then CheckBox27.Checked := True else CheckBox27.Checked := False;
  if dm.Configur.FieldByName('ModalidadeAverbacaoCapital').AsBoolean = True then CheckBox29.Checked := True else CheckBox29.Checked := False;
  if dm.Configur.FieldByName('PermiteSelecionarFolCert').AsBoolean = True then CheckBox28.Checked := True else CheckBox28.Checked := False;
  if dm.Configur.FieldByName('BuscaExataEmTituloRegEProtoc').AsBoolean = True then
    CheckBox31.Checked := True
  else
    CheckBox31.Checked := False;
  CheckBox33.Checked := dm.Configur.FieldByName('trab_livro_automat').AsBoolean;
  MkCaminhoNotifBMP.Text:=  dm.Configur.FieldByName('dir_CamImagensNotificBMP').AsString;
  //E-Selo
  MaskEdit57.Text := dm.Configur.FieldByName('servidor_proxy').AsString;
  MaskEdit58.Text := dm.Configur.FieldByName('porta_proxy').AsString;
  MaskEdit59.Text := dm.Configur.fieldbyname('usuario_proxy').AsString;
  maskedit61.text := dm.configur.fieldbyname('senha_proxy').asstring;
  MaskEdit63.Text := dm.Configur.fieldbyname('loginclient').AsString;
  MaskEdit64.Text := dm.Configur.fieldbyname('senhaclient').AsString;
  MaskEdit68.Text := dm.Configur.fieldbyname('id_eselo').AsString;
  MaskEdit69.Text := dm.Configur.FieldByName('imagensdaje').AsString;
  MaskEdit81.Text := Dm.Configur.FieldByName('caminho_daje_integra').asString;

  MaskEdit83.Text := Dm.Configur.FieldByName('imgdigregistroantigo').asString;
  MaskEdit84.Text := Dm.Configur.FieldByName('imgmicrofilme_antigo').asString;

  Dm.Configur.Close;
  //Tabela de Sequências
  Dm.Seq_Bal.Close;
  Dm.Seq_Bal.Sql.Clear;
  Dm.Seq_Bal.Sql.Add('SELECT * FROM seq_bal where cartorio = "' + F_Menu.Label37.Caption + '"');
  Dm.Seq_Bal.Open;
  MaskEdit14.Text := Dm.Seq_Bal.FieldByName('certifica').asString;
  MaskEdit15.Text := Dm.Seq_Bal.FieldByName('oficial').asString;

  MaskEdit80.Text := Dm.Seq_Bal.FieldByName('seq_protoc_exame_calc').asString;
  MaskEdit85.Text := Dm.Seq_Bal.FieldByName('seq_reg_f').asString;

  MaskEdit16.Text := Dm.Seq_Bal.FieldByName('certidao').asString;
  MaskEdit17.Text := Dm.Seq_Bal.FieldByName('microfilme').asString;
//MaskEdit45.Text := dm.Seq_Bal.FieldByName('oficial_c').AsString;
  MaskEdit18.Text := Dm.Seq_Bal.FieldByName('rz').asString;
  MaskEdit26.Text := Dm.Seq_Bal.FieldByName('rl_dest_i').asString;
  MaskEdit27.Text := Dm.Seq_Bal.FieldByName('rl_dest_f').asString;
  MaskEdit28.Text := Dm.Seq_Bal.FieldByName('pi_dest').asString;
  MaskEdit29.Text := Dm.Seq_Bal.FieldByName('rl_fest_i').asString;
  MaskEdit30.Text := Dm.Seq_Bal.FieldByName('rl_fest_f').asString;
  MaskEdit31.Text := Dm.Seq_Bal.FieldByName('pi_fest').asString;
  MaskEdit32.Text := Dm.Seq_Bal.FieldByName('rl_dest_a').asString;
  MaskEdit33.Text := Dm.Seq_Bal.FieldByName('rl_fest_a').asString;
  MaskEdit56.Text := Dm.Seq_Bal.FieldByName('oficial_c').asString;

  Dm.Seq_Bal.Close;
end;

procedure TF_Config.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit38.SetFocus;
end;

procedure TF_Config.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_Config.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_Config.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_Config.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_Config.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit44.SetFocus;
end;

procedure TF_Config.MaskEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit15.SetFocus;
end;

procedure TF_Config.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit65.SetFocus;
end;

procedure TF_Config.MaskEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit16.SetFocus;
end;

procedure TF_Config.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit11.SetFocus;
end;

procedure TF_Config.MaskEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit17.SetFocus;
end;

procedure TF_Config.MaskEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit12.SetFocus;
end;

procedure TF_Config.MaskEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit45.SetFocus;
end;

procedure TF_Config.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit13.SetFocus;
end;

procedure TF_Config.MaskEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit24.SetFocus;
end;

procedure TF_Config.MaskEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit35.SetFocus;
end;

procedure TF_Config.MaskEdit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit25.SetFocus;
end;

procedure TF_Config.MaskEdit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit20.SetFocus;
end;

procedure TF_Config.MaskEdit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit25.SetFocus;
end;

procedure TF_Config.MaskEdit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit23.SetFocus;
end;

procedure TF_Config.MaskEdit21KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit22.SetFocus;
end;

procedure TF_Config.FormActivate(Sender: TObject);
begin
  Carregar(F_Config);
end;

procedure TF_Config.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Config.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_Config.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  F_Menu.Label4.Caption  := Trim(MaskEdit13.Text);
  F_Menu.Label5.Caption  := Trim(MaskEdit7.Text);
  F_Menu.Label6.Caption  := Trim(MaskEdit4.Text);
  F_Menu.Label7.Caption  := Trim(MaskEdit3.Text);
  F_Menu.Label8.Caption  := Trim(MaskEdit10.Text);
  F_Menu.Label16.Caption := Trim(MaskEdit11.Text);
  F_Menu.Label9.Caption  := Trim(MaskEdit1.Text) + ' da Comarca de ' + Trim(MaskEdit3.Text) + ' / ' + Trim(MaskEdit4.Text);
  F_Menu.Caption         := F_Menu.Label9.Caption;
//  F_Menu.Label11.Caption := Trim(MaskEdit2.Text);
  F_Menu.Label12.Caption := 'TEL.: ' + Trim(MaskEdit5.Text) + ' - ' + Trim(MaskEdit6.Text);
  F_Menu.Label13.Caption := Trim(MaskEdit8.Text);
  F_Menu.Label17.Caption := Trim(MaskEdit9.Text);  
end;

procedure TF_Config.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    CheckBox2.Checked := False;
    CheckBox3.Checked := False;
  end;
end;

procedure TF_Config.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
     CheckBox1.Checked := False;
     CheckBox3.Checked := False;
  end;
end;

procedure TF_Config.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
  begin
     CheckBox1.Checked := False;
     CheckBox2.Checked := False;
  end;
end;

procedure TF_Config.MaskEdit38KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_Config.MaskEdit35KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit36.SetFocus;
end;

procedure TF_Config.MaskEdit36KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit37.SetFocus;
end;

procedure TF_Config.MaskEdit44KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit71.setfocus;
end;

procedure TF_Config.MaskEdit45KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit18.SetFocus;
end;

procedure TF_Config.CheckBox19Click(Sender: TObject);
begin
  if CheckBox19.Checked then
  begin
    CheckBox18.Checked := False;
  end;
end;

procedure TF_Config.CheckBox18Click(Sender: TObject);
begin
  if CheckBox18.Checked then
  begin
    CheckBox19.Checked := False;
  end;
end;

procedure TF_Config.TreeView1Click(Sender: TObject);
begin
  if TreeView1.Selected.StateIndex = -1 then TabbedNotebook1.PageIndex := 0;
  if TreeView1.Selected.StateIndex = 0  then TabbedNotebook1.PageIndex := 1;
  if TreeView1.Selected.StateIndex = 1  then TabbedNotebook1.PageIndex := 2;
  if TreeView1.Selected.StateIndex = 2  then TabbedNotebook1.PageIndex := 3;
  if TreeView1.Selected.StateIndex = 3  then TabbedNotebook1.PageIndex := 4;
  if TreeView1.Selected.StateIndex = 4  then TabbedNotebook1.PageIndex := 5;
end;

procedure TF_Config.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TF_Config.SpeedButton1Click(Sender: TObject);
begin
  if SpeedButton1.Caption = '&Alterar' then
  begin
    SpeedButton1.Caption    := '&Gravar';
    SpeedButton2.Enabled    := False;
    TabbedNotebook1.Enabled := True;
    Panel1.Enabled := True;
    Panel6.Enabled := True;
    if TabbedNotebook1.PageIndex = 0 then MaskEdit1.SetFocus;
    if TabbedNotebook1.PageIndex = 1 then MaskEdit39.SetFocus;
    if TabbedNotebook1.PageIndex = 2 then MaskEdit40.SetFocus;
    if TabbedNotebook1.PageIndex = 3 then MaskEdit9.SetFocus;
    if TabbedNotebook1.PageIndex = 4 then MaskEdit14.SetFocus;
    if TabbedNotebook1.PageIndex = 5 then MaskEdit57.SetFocus;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Gravar as alterações ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      // Gravando Configur
      Dm.Configur.Close;
      if DM.Configur.RequestLive = False then DM.Configur.RequestLive := True;
      Dm.Configur.Sql.Clear;
      Dm.Configur.Sql.Add('SELECT * FROM configur where tcartorio = "' + F_Menu.Label37.Caption + '"');
      Dm.Configur.Open;
      if (Dm.Configur.RecordCount = 0) then
      begin
        Dm.Configur.Append;
      end
      else Dm.Configur.Edit;
      Dm.Configur.FieldByName('cartorio').asString    := Trim(MaskEdit1.Text);
      Dm.Configur.FieldByName('endereco').asString    := Trim(MaskEdit2.Text);
      Dm.Configur.FieldByName('cidade').asString      := Trim(MaskEdit3.Text);
      dm.Configur.FieldByName('cnpj').AsString        := trim(MaskEdit38.text);
      Dm.Configur.FieldByName('estado').asString      := Trim(MaskEdit4.Text);
      Dm.Configur.FieldByName('telefone').asString    := Trim(MaskEdit5.Text);
      Dm.Configur.FieldByName('fax').asString         := Trim(MaskEdit6.Text);
      Dm.Configur.FieldByName('titular').asString     := Trim(MaskEdit7.Text);
      Dm.Configur.FieldByName('titulo').asString      := Trim(MaskEdit8.Text);
      Dm.Configur.FieldByName('imagens').asString     := Trim(MaskEdit9.Text);
      Dm.Configur.FieldByName('dir_modrec').asString  := Trim(MaskEdit10.Text);
      Dm.Configur.FieldByName('dir_modexig').asString := Trim(MaskEdit11.Text);
      Dm.Configur.FieldByName('dir_exig').asString    := Trim(MaskEdit12.Text);
      Dm.Configur.FieldByName('dir_cert').asString    := Trim(MaskEdit13.Text);
      Dm.Configur.FieldByName('dir_ret').asString     := Trim(MaskEdit34.Text);
      Dm.Configur.FieldByName('dir_conf').asString    := Trim(MaskEdit35.Text);
      Dm.Configur.FieldByName('import_csv').asString  := Trim(MaskEdit36.Text);
      Dm.Configur.FieldByName('dir_cor').asString     := Trim(MaskEdit37.Text);
      Dm.Configur.FieldByName('l_dep').asString       := Trim(MaskEdit19.Text);
      Dm.Configur.FieldByName('f_dep').asString       := Trim(MaskEdit20.Text);
      Dm.Configur.FieldByName('prazo_diasUteis').AsBoolean := prazo_diasUteis.Checked;
      Dm.Configur.FieldByName('prazo_t_n').asString           := Trim(MaskEdit24.Text);
      Dm.Configur.FieldByName('prazo_t_t').asString           := Trim(MaskEdit25.Text);
      Dm.Configur.FieldByName('prazo_analise_titulo').asString:= MaskEdit82.Text;
      Dm.Configur.FieldByName('cod_correio').asString         := Trim(ComboBox1.Text);
      dm.Configur.FieldByName('nomeescrevente').AsString      := trim(MaskEdit40.text);
      dm.configur.FieldByName('cpfescrevente').AsString       :=  trim(MaskEdit41.Text);
      dm.Configur.FieldByName('matriculaescrevente').AsString := trim(MaskEdit42.Text);
      dm.Configur.FieldByName('caminho_xml').AsString         := trim(MaskEdit43.Text);
      dm.Configur.FieldByName('email').AsString               := trim(maskedit44.Text);
      dm.Configur.FieldByName('site').AsString                := trim(MaskEdit71.Text);
      dm.configur.FieldByName('serventia').AsString           := trim(maskedit46.Text);
      dm.Configur.FieldByName('porta_cert').AsString          := Trim(MaskEdit47.Text);
      DM.Configur.FieldByName('horario_atendimento').AsString := Trim(maskedit48.text);
      dm.Configur.FieldByName('cert_vias').AsString           := Trim(MaskEdit49.Text);
      dm.Configur.FieldByName('recibo').AsString              := Trim(MaskEdit50.Text);
      dm.Configur.FieldByName('imp_etq_matr').AsString        := Trim(MaskEdit53.Text);
      dm.Configur.fieldbyname('porta_com_recibo_cupom').AsString:= MaskEdit66.Text;
      dm.Configur.FieldByName('imgSeloCertidaoImagem').AsString := Trim(MaskEdit60.Text);
      dm.Configur.FieldByName('dir_cert_notificacao').AsString := Trim(MaskEdit62.Text);
      dm.Configur.FieldByName('Caminho_Carimbo').AsString     :=  MaskEdit65.Text;
      dm.Configur.FieldByName('caminhoExecutavel').AsString   := MaskEdit67.Text;
      dm.Configur.FieldByName('caminhoDoExportaPDF').AsString  := MaskEdit70.Text;
      dm.Configur.FieldByName('dir_centralrtd').AsString := MaskEdit72.Text;
      dm.Configur.FieldByName('dir_imagem_animal').AsString := MaskEdit79.Text;
      Dm.Configur.FieldByName('livrop').asString               := Trim(MaskEdit51.Text);
      Dm.Configur.FieldByName('folhap').asString               := Trim(MaskEdit52.Text);
      Dm.Configur.FieldByName('tot_folha_lvb_p').asString      := Trim(MaskEdit73.Text);
      Dm.Configur.FieldByName('livro_c').asString              := Trim(MaskEdit55.Text);
      Dm.Configur.FieldByName('folha_c').asString              := Trim(MaskEdit54.Text);
      Dm.Configur.FieldByName('tot_folha_lvc_p').asString      := Trim(MaskEdit75.Text);
      Dm.Configur.FieldByName('tot_folha_lva_p').asString      := Trim(MaskEdit74.Text);
      Dm.Configur.FieldByName('tot_prot_lva_p').asString       := Trim(MaskEdit78.Text);
      Dm.Configur.FieldByName('livro_lva_p').asString          := Trim(MaskEdit76.Text);
      Dm.Configur.FieldByName('folha_lva_p').asString          := Trim(MaskEdit77.Text);

      if CheckBox4.Checked  then dm.configur.FieldByName('chk_01').AsBoolean := True else dm.configur.FieldByName('chk_01').AsBoolean := False;
      if CheckBox5.Checked  then dm.configur.FieldByName('chk_02').AsBoolean := True else dm.configur.FieldByName('chk_02').AsBoolean := False;
      if CheckBox6.Checked  then dm.configur.FieldByName('chk_03').AsBoolean := True else dm.configur.FieldByName('chk_03').AsBoolean := False;
      if CheckBox7.Checked  then dm.configur.FieldByName('chk_04').AsBoolean := True else dm.configur.FieldByName('chk_04').AsBoolean := False;
      if CheckBox8.Checked  then dm.configur.FieldByName('chk_05').AsBoolean := True else dm.configur.FieldByName('chk_05').AsBoolean := False;
      if CheckBox9.Checked  then dm.configur.FieldByName('chk_06').AsBoolean := True else dm.configur.FieldByName('chk_06').AsBoolean := False;
      if CheckBox10.Checked then dm.configur.FieldByName('chk_07').AsBoolean := True else dm.configur.FieldByName('chk_07').AsBoolean := False;
      if CheckBox11.Checked then dm.configur.FieldByName('chk_08').AsBoolean := True else dm.configur.FieldByName('chk_08').AsBoolean := False;
      if CheckBox12.Checked then dm.configur.FieldByName('chk_09').AsBoolean := True else dm.configur.FieldByName('chk_09').AsBoolean := False;
      if CheckBox13.Checked then dm.configur.FieldByName('chk_10').AsBoolean := True else dm.configur.FieldByName('chk_10').AsBoolean := False;
      if CheckBox14.Checked then dm.Configur.FieldByName('chk_11').AsBoolean := True else dm.Configur.FieldByName('chk_11').AsBoolean := False;
      if CheckBox15.Checked then dm.Configur.FieldByName('chk_16').AsBoolean := True else dm.Configur.FieldByName('chk_16').AsBoolean := False;
      if CheckBox16.Checked then dm.Configur.FieldByName('chk_13').AsBoolean := True else dm.Configur.FieldByName('chk_13').AsBoolean := False;
      if CheckBox17.Checked then dm.Configur.FieldByName('chk_14').AsBoolean := True else dm.Configur.FieldByName('chk_14').AsBoolean := False;
      if CheckBox20.Checked then dm.Configur.FieldByName('chk_15').AsBoolean := True else dm.Configur.FieldByName('chk_15').AsBoolean := False;
      if CheckBox21.Checked then dm.Configur.FieldByName('chk_17').AsBoolean := True else dm.Configur.FieldByName('chk_17').AsBoolean := False;
      if CheckBox22.Checked then dm.Configur.FieldByName('chk_18').AsBoolean := True else dm.Configur.FieldByName('chk_18').AsBoolean := False;
      if CheckBox23.Checked then dm.Configur.FieldByName('chk_19').AsBoolean := True else dm.Configur.FieldByName('chk_19').AsBoolean := False;
      if CheckBox24.Checked then dm.Configur.FieldByName('chk_20').AsBoolean := True else dm.Configur.FieldByName('chk_20').AsBoolean := False;
      if CheckBox25.Checked then dm.Configur.FieldByName('chk_21').AsBoolean := True else dm.Configur.FieldByName('chk_21').AsBoolean := False;
      if CheckBox30.Checked then dm.Configur.FieldByName('chk_30').AsBoolean := True else dm.Configur.FieldByName('chk_30').AsBoolean := False;

      if CheckBox32.Checked then dm.Configur.FieldByName('chk_32').AsBoolean := True else dm.Configur.FieldByName('chk_32').AsBoolean := False;

      if CheckBox34.Checked then
        dm.Configur.FieldByName('PermiteRecepcaoSemDAJE').AsBoolean := True
      else
      dm.Configur.FieldByName('PermiteRecepcaoSemDAJE').AsBoolean := False;

      if CheckBox38.Checked then
        dm.Configur.FieldByName('desab_lf_cabec').AsBoolean := True
      else
      dm.Configur.FieldByName('desab_lf_cabec').AsBoolean := False;

      if CheckBox26.Checked then dm.Configur.FieldByName('AlteraPartesExames').AsBoolean := True else dm.Configur.FieldByName('AlteraPartesExames').AsBoolean := False;
      if CheckBox27.Checked then dm.Configur.FieldByName('PermiteEdicaoNaturesaExame').AsBoolean := True else dm.Configur.FieldByName('PermiteEdicaoNaturesaExame').AsBoolean := False;
      if CheckBox29.Checked then dm.Configur.FieldByName('ModalidadeAverbacaoCapital').AsBoolean := True else dm.Configur.FieldByName('ModalidadeAverbacaoCapital').AsBoolean := False;
      if CheckBox28.Checked then dm.Configur.FieldByName('PermiteSelecionarFolCert').AsBoolean := True else dm.Configur.FieldByName('PermiteSelecionarFolCert').AsBoolean := False;
      if CheckBox33.Checked then dm.Configur.FieldByName('trab_livro_automat').AsBoolean := True else dm.Configur.FieldByName('trab_livro_automat').AsBoolean := False;

      if CheckBox31.Checked then
        dm.Configur.FieldByName('BuscaExataEmTituloRegEProtoc').AsBoolean := True
      else
      dm.Configur.FieldByName('BuscaExataEmTituloRegEProtoc').AsBoolean := False;

      if CheckBox1.Checked then Dm.Configur.FieldByName('imp_laser').asInteger := 1 else Dm.Configur.FieldByName('imp_laser').asInteger := 0;
        F_Menu.laser.caption := Dm.Configur.FieldByName('imp_laser').asString;
      if CheckBox2.Checked  then dm.Configur.FieldByName('imp_matricial').AsInteger := 1 else dm.Configur.FieldByName('imp_matricial').AsInteger := 0;
      if CheckBox3.Checked  then dm.Configur.FieldByName('imp_bematech').AsInteger  := 1 else dm.Configur.FieldByName('imp_bematech').AsInteger  := 0;
      if CheckBox19.Checked then dm.Configur.FieldByName('imp_laser2').AsInteger    := 1 else dm.Configur.FieldByName('imp_laser2').AsInteger    := 0;
      if CheckBox18.Checked then dm.Configur.FieldByName('imp_bematech2').AsInteger := 1 else dm.Configur.FieldByName('imp_bematech2').AsInteger  := 0;

      dm.Configur.FieldByName('gerarDajeIsento').AsBoolean := CheckBox35.Checked;
      dm.Configur.FieldByName('tcartorio').AsString := F_Menu.Label37.Caption;
      dm.Configur.FieldByName('bematech_porta').AsString := MaskEdit39.Text;

      //E-Selo
      dm.Configur.FieldByName('servidor_proxy').AsString  := trim(MaskEdit57.Text);
      dm.Configur.FieldByName('porta_proxy').AsString     := trim(MaskEdit58.Text);
      dm.configur.FieldByName('usuario_proxy').AsString   := trim(MaskEdit59.Text);
      dm.Configur.FieldByName('senha_proxy').AsString     := Trim(maskedit61.Text);
      DM.Configur.FieldByName('loginclient').AsString     := Trim(MaskEdit63.text);
      dm.Configur.FieldByName('senhaclient').AsString     := Trim(MaskEdit64.Text);
      dm.Configur.FieldByName('id_eselo').AsString        := Trim(MaskEdit68.Text);
      dm.Configur.FieldByName('imagensdaje').AsString     := Trim(MaskEdit69.Text);
      Dm.Configur.FieldByName('caminho_daje_integra').asString:= MaskEdit81.Text;
      Dm.Configur.FieldByName('imgdigregistroantigo').asString:= MaskEdit83.Text;
      Dm.Configur.FieldByName('imgmicrofilme_antigo').asString:= MaskEdit84.Text;
      dm.Configur.FieldByName('dir_CamImagensNotificBMP').AsString := Trim(MkCaminhoNotifBMP.Text);

      Dm.Configur.Post;
      //Gravando Sequências
      Dm.Seq_Bal.Close;
      Dm.Seq_Bal.Sql.Clear;
      Dm.Seq_Bal.Sql.Add('UPDATE seq_bal SET');
      Dm.Seq_Bal.Sql.Add('certifica  = ' + Trim(MaskEdit14.Text) + ',');
      Dm.Seq_Bal.Sql.Add('oficial    = ' + Trim(MaskEdit15.Text) + ',');
      Dm.Seq_Bal.Sql.Add('certidao   = ' + Trim(MaskEdit16.Text) + ',');
      Dm.Seq_Bal.Sql.Add('microfilme = ' + Trim(MaskEdit17.Text) + ',');
      dm.Seq_Bal.sql.add('oficial_c  = ' + Trim(MaskEdit56.Text) + ',');
      Dm.Seq_Bal.Sql.Add('rl_dest_i  = ' + Trim(MaskEdit26.Text) + ',');
      Dm.Seq_Bal.Sql.Add('rl_dest_f  = ' + Trim(MaskEdit27.Text) + ',');
      Dm.Seq_Bal.Sql.Add('pi_dest    = ' + Trim(MaskEdit28.Text) + ',');
      Dm.Seq_Bal.Sql.Add('rl_fest_i  = ' + Trim(MaskEdit29.Text) + ',');
      Dm.Seq_Bal.Sql.Add('rl_fest_f  = ' + Trim(MaskEdit30.Text) + ',');
      Dm.Seq_Bal.Sql.Add('pi_fest    = ' + Trim(MaskEdit31.Text) + ',');
      Dm.Seq_Bal.Sql.Add('rl_dest_a  = ' + Trim(MaskEdit32.Text) + ',');
      Dm.Seq_Bal.Sql.Add('seq_protoc_exame_calc  = ' + Trim(MaskEdit80.Text) + ',');
      Dm.Seq_Bal.Sql.Add('seq_reg_f  = ' + Trim(MaskEdit85.Text) + ',');
      Dm.Seq_Bal.Sql.Add('rl_fest_a  = ' + Trim(MaskEdit33.Text) + ',');
      Dm.Seq_Bal.Sql.Add('rz         = ' + Trim(MaskEdit18.Text));
      dm.Seq_Bal.sql.add('where cartorio = "' + F_Menu.Label37.Caption + '"' );
      Dm.Seq_Bal.ExecSQL;
      Dm.Seq_Bal.Close;
    end;
    Carregar(F_Config);
    TabbedNotebook1.Enabled := False;
    SpeedButton1.Caption    := '&Alterar';
    SpeedButton2.Enabled    := True;
  end;
end;

procedure TF_Config.MaskEdit37KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit60.SetFocus;

end;

procedure TF_Config.MaskEdit60KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit62.SetFocus;

end;

procedure TF_Config.MaskEdit62KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MkCaminhoNotifBMP.SetFocus;  
end;

procedure TF_Config.MaskEdit71KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit48.setfocus;
end;

procedure TF_Config.MaskEdit65KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit67.SetFocus;

end;

procedure TF_Config.MaskEdit67KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit70.SetFocus;

end;

procedure TF_Config.MaskEdit70KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit72.SetFocus;
end;

end.
