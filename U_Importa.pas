unit U_Importa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls, WPDefs,
  WPPrint, WpWinCtr, WPRich, jpeg;

type
  TF_importa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn5: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    RichEdit1: TRichEdit;
    Animate1: TAnimate;
    ProgressBar1: TProgressBar;
    StatusBar1: TStatusBar;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_importa: TF_importa;

implementation


  uses Menus, dmtd , FuncGeral, Menu, ProcGeral;
{$R *.DFM}

procedure TF_importa.BitBtn5Click(Sender: TObject);
begin
  if not Opendialog1.Execute then
     Exit;
  maskedit2.text := OpenDialog1.FileName;
  maskedit2.setfocus;
  //chdir(workdir);
end;

procedure TF_importa.BitBtn1Click(Sender: TObject);
var
  Txt : TStrings;
  x , xy , y : integer;
begin

  if not FileExists(MaskEdit2.Text) then
  begin
    showmessage('Arquivo inexistente');
    maskedit2.setfocus;
    exit;
  end;

  statusbar1.SimpleText := 'Carregando arquivo ...';
  statusbar1.update;
  statusbar1.SimpleText := 'Verificando integridade do arquivo ...';
  statusbar1.update;

  RichEdit1.Lines.Clear;
  RichEdit1.Lines.LoadFromFile(MaskEdit2.Text);
  RichEdit1.Refresh;

  dm.td_temp.close;
  dm.td_temp.sql.clear;
  dm.td_temp.sql.add('truncate td_temp');
  dm.td_temp.ExecSQL;

  dm.tdp_temp.close;
  dm.tdp_temp.SQL.clear;
  dm.tdp_temp.SQL.add('truncate tdp_temp');
  dm.tdp_temp.ExecSQL;


  txt := TStringList.Create;
  Animate1.Visible := true;
  Animate1.Active := True;
  x := 0;
  while x <= (RichEdit1.Lines.Count) do
  begin

    txt.Clear;
    txt.Add('insert into td_temp(');
    txt.Add('data_r, data_p, data_e, data_d, data_i, data_du, data_anot, p_auxiliar, protocolo, registro, tipo,');
    txt.Add('tabela, lancamento, natureza, ext_nat, certidoes, microfilme, proc_dados, qtde_nome, pag_adic,');
    txt.Add('divisor, cod_local, anotacao, custas, deposito, valor_base, hora_p, hora_p1, cod_ir1, cod_ir2,');
    txt.Add('status, v_emolumentos, v_emoladicional, v_pd, v_mic, v_cert, v_pag, v_viaexc, v_digitalizacao,');
    txt.Add('v_informatica, v_graveletr, v_conferencia, v_nome, v_tribunal, v_procuradoria, v_defensoria, v_mutua,');
    txt.Add('v_acoterj, v_distrib, v_infodistrib, v_microdistrib, v_gravEletrDistrib, v_subtotal, v_total, identifica,');
    txt.Add('identific1, identific2, identific3, a_nome, a_cpff, a_rgg, a_endereco, a_bairro, a_cidade, a_estado,');
    txt.Add('a_cep, a_telefone, ctrlcont, dta, contrato, aaa, data_cel, parc2, valor2, cliente, parc3, parc4, parc5,');
    txt.Add('parc6, parc7, parc8, parc9, parc10, parc11, parc12, parc13, parc14, parc15, valor3, valor4, valor5, valor6,');
    txt.Add('cod_ir3, rz, complreg, empresa, p_v_mora, dia, data_cert, data_imp, nossonum2, nossonum3, agencia,');
    txt.Add('nom_port, remessa, versao, lote, arquivo, destina, data_entr, data_not1, data_not2, data_not3, rl,');
    txt.Add('local, tipo_reg, qtde_diligencia, doi, v_procest, v_leis_dist, v_doi, v_doi_info, v_guia, v_guia_info, v_not_pd,');
    txt.add('parcelas, ven_parc, val_parc, data_re, data_re1, data_re2, pos_cert, vias_adc, sit_not1, sit_not2,');
    txt.Add('sit_not3, obs_not1, obs_not2, obs_not3, val_abert, a_num,');
    txt.Add('a_fax, op_num, op_nom, nosso, op_dat, moeda, cod_port, cod_cart, data_mov, pr1, pr2, qtde_eti, mod_eti,');
    txt.Add('cod_ag, contato, tip_doc, doc, ncliente, ven_parc2, ven_parc3, ven_parc4, ven_parc5, ven_parc6, ven_parc7,');
    txt.Add('ven_parc8, ven_parc9, ven_parc10, ven_parc11, ven_parc12, ven_parc13, ven_parc14, ven_parc15, ven_parc16,');
    txt.Add('ven_parc17, val_parc2, val_parc3, val_parc4, data_podre, parc_podre, codificacao, grupo, seq, cota,');
    txt.Add('dt_vc_prazo, hora_not1, hora_not2, hora_not3, val_parc5, val_parc6, val_parc7, val_parc8, val_parc9,');
    txt.Add('val_parc10, val_parc11, val_parc12, val_parc13, val_parc14, val_parc15, val_parc16, val_parc17, tot_parcela,');
    txt.Add('cod_cli, rlcertid, certcertif, carta, ag_conta, especie, aceite, nu_barras, barras, dt_mov, nossonum,');
    txt.Add('mensa1, mensa2, mensa3, mensa4, mensa5, produto, regional, financeira, venc_bol, modelo, contacc,');
    txt.Add('valparc_cor, valparc_pri, data_repost, hora_p2, obs_not4, obs_not5, cheque, hora_p3, data_irr, hora1,');
    txt.Add('hora2, S, n_des, motivo1, motivo2, motivo3, motivo4, motivo5, t, motivo6, sit_not5, motivo7, data_not4,');
    txt.Add('data_not5, sit_not4, motivo8, motivo9, motivo10, q_ar, motivo11, q_cond, v_ar, data_atraso1, data_atraso2,');
    txt.Add('valor_extenso, v_cus_ter, porcentagem, data_apuracao, cedente, banco, cod_empresa, cod_banco, escritorio,');
    txt.Add('nr_doc, valor1, loc_pag, dt_proc_doc, nr_doc2, obs, carteira, valor_banco, dt_contr, qtd_nr, data_prov1,');
    txt.Add('cod_prov1, sit_prov1, obs_prov1, data_prov2, cod_prov2, sit_prov2, obs_prov2, data_prov3, cod_prov3,');
    txt.Add('sit_prov3, obs_prov3, data_impr, data_reti, nr_notific, bxcorreio, portal, selo_serie, selo_numero, cartorio)');
    txt.add('VALUES(');
  //  MessageBox(0, PChar(inttostr(x)), 'Mensagem', MB_OK + MB_ICONSTOP);

    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2, 8), 'D') + ',');        //    data_r,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 10, 8), 'D') + ',');       //    data_p,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 18, 8), 'D') + ',');       //    data_e,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 26, 8), 'D') + ',');       //    data_d,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 34, 8), 'D') + ',');       //    data_i,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 42, 8), 'D') + ',');       //    data_du,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 50, 8), 'D') + ',');       //    data_anot,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 58, 10), 'N') + ',');      //    p_auxiliar,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 68, 10), 'N') + ',');      //    protocolo,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 78, 10), 'N') + ',');      //    registro,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 88, 1), 'C') + ',');       //    tipo,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 89, 5), 'C') + ',');       //    tabela,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 94, 10), 'N') + ',');      //    lancamento,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 104, 10), 'N') + ',');     //    natureza,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 114, 60), 'C') + ',');     //    ext_nat,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 174, 10), 'N') + ',');     //    certidoes,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 184, 10), 'N') + ',');     //    microfilme,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 194, 10), 'N') + ',');     //    proc_dados,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 204, 10), 'N') + ',');     //    qtde_nome,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 214, 10), 'N') + ',');     //    pag_adic,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 224, 10), 'N') + ',');     //    divisor,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 234, 10), 'N') + ',');     //    cod_local,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 244, 50), 'C') + ',');     //    anotacao,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 294, 14), 'M') + ',');     //    custas,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 308, 14), 'M') + ',');     //    deposito,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 322, 14), 'M') + ',');     //    valor_base,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 336, 8), 'C') + ',');      //    hora_p,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 344, 8), 'C') + ',');      //    hora_p1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 352, 10), 'N') + ',');     //    cod_ir1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 362, 10), 'D') + ',');     //    cod_ir2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 372, 30), 'C') + ',');     //    status,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 402, 14), 'M') + ',');     //    v_emolumentos,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 416, 14), 'M') + ',');     //    v_emoladicional,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 430, 14), 'M') + ',');     //    v_pd,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 444, 14), 'M') + ',');     //    v_mic,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 458, 14), 'M') + ',');     //    v_cert,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 472, 14), 'M') + ',');     //    v_pag,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 486, 14), 'M') + ',');     //    v_viaexc,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 500, 14), 'M') + ',');     //    v_digitalizacao,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 514, 14), 'M') + ',');     //    v_informatica,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 528, 14), 'M') + ',');     //    v_graveletr,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 542, 14), 'M') + ',');     //    v_conferencia,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 556, 14), 'M') + ',');     //    v_nome,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 570, 14), 'M') + ',');     //    v_tribunal,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 584, 14), 'M') + ',');     //    v_procuradoria,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 598, 14), 'M') + ',');     //    v_defensoria,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 612, 14), 'M') + ',');     //    v_mutua,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 626, 14), 'M') + ',');     //    v_acoterj,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 640, 14), 'M') + ',');     //    v_distrib,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 654, 14), 'M') + ',');     //    v_infodistrib,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 668, 14), 'M') + ',');     //    v_microdistrib,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 682, 14), 'M') + ',');     //    v_gravEletrDistrib,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 696, 14), 'M') + ',');     //    v_subtotal,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 710, 14), 'M') + ',');     //    v_total,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 724, 15), 'C') + ',');     //    identifica,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 739, 15), 'C') + ',');     //    identific1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 754, 15), 'C') + ',');     //    identific2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 769, 15), 'C') + ',');     //    identific3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 784, 200), 'C') + ',');    //    a_nome,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 984, 20), 'C') + ',');     //    a_cpff,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1004, 25), 'C') + ',');    //    a_rgg,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1029, 130), 'C') + ',');   //    a_endereco,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1159, 60), 'C') + ',');    //    a_bairro,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1219, 50), 'C') + ',');    //    a_cidade,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1269, 2), 'C') + ',');     //    a_estado,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1271, 9), 'C') + ',');     //    a_cep,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1280, 30), 'C') + ',');    //    a_telefone,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1310, 1), 'C') + ',');     //    ctrlcont,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1311, 8), 'D') + ',');     //    dta,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1319, 200), 'C') + ',');   //    contrato,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1519, 60), 'C') + ',');    //    aaa,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1579, 8), 'D') + ',');     //    data_cel,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1587, 15), 'C') + ',');    //    parc2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1602, 14), 'M') + ',');    //    valor2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1616, 10), 'N') + ',');    //    cliente,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1626, 15), 'C') + ',');    //    parc3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1641, 15), 'C') + ',');    //    parc4,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1656, 15), 'C') + ',');    //    parc5,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1671, 15), 'C') + ',');    //    parc6,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1686, 15), 'C') + ',');    //    parc7,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1701, 15), 'C') + ',');    //    parc8,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1716, 15), 'C') + ',');    //    parc9,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1739, 15), 'C') + ',');    //    parc10,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1746, 15), 'C') + ',');    //    parc11,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1761, 15), 'C') + ',');    //    parc12,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1776, 15), 'C') + ',');    //    parc13,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1791, 15), 'C') + ',');    //    parc14,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1806, 15), 'C') + ',');    //    parc15,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1821, 14), 'M') + ',');    //    valor3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1835, 14), 'M') + ',');    //    valor4,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1849, 14), 'M') + ',');    //    valor5,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1863, 14), 'M') + ',');    //    valor6,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1877, 10), 'N') + ',');    //    cod_ir3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1887, 10), 'N') + ',');    //    rz,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1897, 1), 'C') + ',');     //    complreg,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1898, 100), 'C') + ',');   //    empresa,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1998, 5), 'C') + ',');     //    p_v_mora,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2003, 8), 'D') + ',');     //    dia,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2001, 8), 'D') + ',');     //    data_cert,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2019, 8), 'D') + ',');     //    data_imp,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2027, 12), 'C') + ',');    //    nossonum2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2039, 12), 'C') + ',');    //    nossonum3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2051, 80), 'C') + ',');    //    agencia,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2131, 4), 'C') + ',');     //    nom_port,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2135, 6), 'C') + ',');     //    remessa,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2141, 10), 'N') + ',');    //    versao,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2151, 10), 'C') + ',');    //    lote,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2161, 30), 'C') + ',');    //    arquivo,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2191, 60), 'C') + ',');    //    destina,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2251, 8), 'D') + ',');     //    data_entr,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2259, 8), 'D') + ',');     //    data_not1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2267, 8), 'D') + ',');     //    data_not2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2275, 8), 'D') + ',');     //    data_not3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2283, 30), 'C') + ',');    //    rl,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2313, 100), 'C') + ',');   //    local,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2416, 4), 'C') + ',');     //    tipo_reg,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2420, 11), 'N') + ',');    //    qtde_diligencia
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2431, 1), 'C') + ',');     //    Doi
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2432, 14), 'M') + ',');    //    v_procest
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2446, 14), 'M') + ',');    //    V_LEIS_DIST
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2460, 14), 'M') + ',');    //    v_doi
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2474, 14), 'M') + ',');    //    v_doi_info
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2488, 14), 'M') + ',');    //    v_guia
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2503, 14), 'M') + ',');    //    v_guia_info
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2516, 14), 'M') + ',');    //    v_not_pd
    // MessageBox(0, PChar(inttostr(x)), 'Mensagem', MB_OK + MB_ICONSTOP);

    x := x + 1;

    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2, 15), 'C') + ',');       //  parcelas,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 17, 8), 'D') + ',');       //   ven_parc,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 25, 14), 'M') + ',');      //   val_parc,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 39, 8), 'D') + ',');       //   data_re,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 47, 8), 'D') + ',');       //   data_re1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 55, 8), 'D') + ',');       //   data_re2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 63, 1), 'C') + ',');       //   pos_cert,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 64, 10), 'N') + ',');      //   vias_adc,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 74, 1), 'C') + ',');       //   sit_not1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 75, 1), 'C') + ',');       //   sit_not2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 76, 1), 'D') + ',');       //   sit_not3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 77, 250), 'C') + ',');     //   obs_not1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 327, 250), 'C') + ',');    //   obs_not2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 577, 250), 'C') + ',');    //   obs_not3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 827, 14), 'M') + ',');     //   val_abert,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 846, 6), 'C') + ',');      //   a_num,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 847, 60), 'C') + ',');     //   a_fax,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 907, 5), 'C') + ',');      //   op_num,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 912, 50), 'C') + ',');     //   op_nom,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 962, 12), 'C') + ',');     //   nosso,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 974, 8), 'D') + ',');      //   op_dat,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 982, 3), 'C') + ',');      //   moeda,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 985, 3), 'C') + ',');      //   cod_port,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 988, 3), 'C') + ',');      //   cod_cart,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 991, 8), 'D') + ',');      //   data_mov,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 999, 1), 'C') + ',');      //   pr1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1000, 1), 'C') + ',');     //   pr2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1001, 6), 'N') + ',');     //   qtde_eti,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1007, 1), 'N') + ',');     //   mod_eti,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1008, 10), 'N') + ',');    //   cod_ag,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1018, 60), 'C') + ',');    //   contato,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1078, 4), 'C') + ',');     //   tip_doc,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1082, 20), 'C') + ',');    //   doc,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1102, 3), 'N') + ',');     //   ncliente,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1105, 8), 'D') + ',');     //   ven_parc2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1113, 8), 'D') + ',');     //   ven_parc3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1121, 8), 'D') + ',');     //   ven_parc4,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1129, 8), 'D') + ',');     //   ven_parc5,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1137, 8), 'D') + ',');     //   ven_parc6,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1145, 8), 'D') + ',');     //   ven_parc7,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1153, 8), 'D') + ',');     //   ven_parc8,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1161, 8), 'D') + ',');     //   ven_parc9,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1169, 8), 'D') + ',');     //   ven_parc10,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1177, 8), 'D') + ',');     //   ven_parc11,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1185, 8), 'D') + ',');     //   ven_parc12,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1193, 8), 'D') + ',');     //   ven_parc13,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1201, 8), 'D') + ',');     //   ven_parc14,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1209, 8), 'D') + ',');     //   ven_parc15,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1217, 8), 'D') + ',');     //   ven_parc16,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1225, 8), 'D') + ',');     //   ven_parc17,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1233, 14), 'M') + ',');    //   val_parc2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1247, 14), 'M') + ',');    //   val_parc3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1261, 14), 'M') + ',');    //   val_parc4,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1275, 8), 'D') + ',');     //   data_podre,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1283, 100), 'C') + ',');   //   parc_podre,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1383, 100), 'D') + ',');   //   codificacao,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1423, 10), 'C') + ',');    //   grupo,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1433, 10), 'C') + ',');    //   seq,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1443, 10), 'C') + ',');    //   cota,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1453, 8), 'D') + ',');     //   dt_vc_prazo,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1461, 8), 'C') + ',');     //   hora_not1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1469, 8), 'C') + ',');     //   hora_not2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1477, 8), 'C') + ',');     //   hora_not3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1485, 14), 'M') + ',');    //   val_parc5,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1499, 14), 'M') + ',');    //   val_parc6,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1513, 14), 'M') + ',');    //   val_parc7,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1527, 14), 'M') + ',');    //   val_parc8,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1541, 14), 'M') + ',');    //   val_parc9,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1555, 14), 'M') + ',');    //   val_parc10,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1569, 14), 'M') + ',');    //   val_parc11,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1583, 14), 'M') + ',');    //   val_parc12,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1597, 14), 'M') + ',');    //   val_parc13,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1611, 14), 'M') + ',');    //   val_parc14,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1625, 14), 'M') + ',');    //   val_parc15,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1639, 14), 'M') + ',');    //   val_parc16,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1653, 14), 'M') + ',');    //   val_parc17,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1667, 14), 'M') + ',');    //   tot_parcela,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1681, 10), 'N') + ',');    //   cod_cli,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1691, 30), 'C') + ',');    //   rlcertid,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1721, 10), 'C') + ',');    //   certcertif,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1731, 10), 'C') + ',');    //   carta,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1741, 12), 'C') + ',');    //   ag_conta,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1753, 23), 'C') + ',');    //   especie,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1776, 1), 'C') + ',');     //   aceite,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1777, 47), 'C') + ',');    //   nu_barras,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1824, 44), 'C') + ',');    //   barras,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1868, 8), 'D') + ',');     //   dt_mov,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1876, 15), 'C') + ',');    //   nossonum,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1891, 50), 'C') + ',');    //   mensa1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1941, 50), 'C') + ',');    //   mensa2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1991, 50), 'C') + ',');    //   mensa3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2041, 50), 'C') + ',');    //   mensa4,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2091, 50), 'C') + ',');    //   mensa5,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2141, 1), 'C') + ',');     //   produto,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2142, 10), 'C') + ',');    //   regional,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2152, 60), 'C') + ',');    //   financeira,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2212, 8), 'D') + ',');     //   venc_bol,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2220, 2), 'C') + ',');     //   modelo,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2222, 9), 'C') + ',');     //   contacc,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2231, 14), 'M') + ',');    //   valparc_cor,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2245, 14), 'M') + ',');    //   valparc_pri,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2259, 8), 'D') + ',');     //   data_repost,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2267, 8), 'C') + ',');     //   hora_p2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2275, 100), 'C') + ',');   //   obs_not4,

   // MessageBox(0, PChar(inttostr(x)), 'Mensagem', MB_OK + MB_ICONSTOP);

    x := x + 1;

    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2, 100), 'C') + ',');      //   obs_not5,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 102, 10), 'C') + ',');     //   cheque,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 112, 8), 'C') + ',');      //   hora_p3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 120, 8), 'D') + ',');      //   data_irr,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 128, 8), 'C') + ',');      //   hora1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 136, 8), 'C') + ',');      //   hora2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 144, 1), 'C') + ',');      //   S,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 145, 10), 'N') + ',');     //   n_des,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 165, 65), 'C') + ',');     //   motivo1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 220, 65), 'C') + ',');     //   motivo2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 285, 65), 'C') + ',');     //   motivo3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 350, 65), 'C') + ',');     //   motivo4,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 415, 65), 'C') + ',');     //   motivo5,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 480, 1), 'C') + ',');      //   t,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 481, 65), 'C') + ',');     //   motivo6,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 546, 1), 'C') + ',');      //   sit_not5,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 547, 65), 'C') + ',');     //   motivo7,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 612, 8), 'D') + ',');      //   data_not4,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 620, 8), 'D') + ',');      //   data_not5,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 628, 1), 'C') + ',');      //   sit_not4,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 629, 65), 'C') + ',');     //   motivo8,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 694, 65), 'C') + ',');     //   motivo9,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 759, 65), 'C') + ',');     //   motivo10,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 824, 10), 'N') + ',');     //   q_ar,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 834, 65), 'C') + ',');     //   motivo11,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 899, 10), 'N') + ',');     //   q_cond,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 909, 14), 'M') + ',');     //   v_ar,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 923, 8), 'D') + ',');      //   data_atraso1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 931, 8), 'D') + ',');      //   data_atraso2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 939, 250), 'C') + ',');    //   valor_extenso,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1189, 14), 'M') + ',');    //   v_cus_ter,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1203, 9), 'C') + ',');     //   porcentagem,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1212, 8), 'D') + ',');     //   data_apuracao,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1220, 60), 'C') + ',');    //   cedente,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1280, 60), 'C') + ',');    //   banco,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1340, 5), 'C') + ',');     //   cod_empresa,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1345, 5), 'C') + ',');     //   cod_banco,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1350, 50), 'C') + ',');    //   escritorio,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1400, 15), 'C') + ',');    //   nr_doc,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1415, 14), 'M') + ',');    //   valor1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1429, 50), 'C') + ',');    //   loc_pag,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1479, 8), 'D') + ',');     //   dt_proc_doc,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1487, 15), 'C') + ',');    //   nr_doc2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1502, 50), 'C') + ',');    //   obs,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1552, 3), 'C') + ',');     //   carteira,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1555, 14), 'M') + ',');    //   valor_banco,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1569, 8), 'D') + ',');     //   dt_contr,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1577, 10), 'C') + ',');    //   qtd_nr,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1587, 8), 'D') + ',');     //   data_prov1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1595, 10), 'N') + ',');    //   cod_prov1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1605, 1), 'C') + ',');     //   sit_prov1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1606, 250), 'C') + ',');   //   obs_prov1,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1856, 8), 'D') + ',');     //   data_prov2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1864, 10), 'N') + ',');    //   cod_prov2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1874, 1), 'C') + ',');     //   sit_prov2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1875, 250), 'C') + ',');   //   obs_prov2,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2125, 8), 'D') + ',');     //   data_prov3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2133, 10), 'N') + ',');    //   cod_prov3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2143, 1), 'C') + ',');     //   sit_prov3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2144, 250), 'C') + ',');   //   obs_prov3,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2394, 8), 'D') + ',');     //   data_impr,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2402, 8), 'D') + ',');     //   data_reti,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2410, 5), 'C') + ',');     //   nr_notific,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2415, 10), 'C') + ',');    //   bxcorreio,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2425, 10), 'N') + ',');    //   portal,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2435, 4), 'C') + ',');     //   selo_serie,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2439, 5), 'C') + ',');     //   selo_numero,
    txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2444, 2), 'C') + ')');     //   cartorio)


    dm.td_temp.close;
    dm.td_temp.sql.clear;
    dm.td_temp.sql.add(txt.Text);
    dm.td_temp.ExecSQL;


    x := x + 1;

    while True do
    begin
      Txt.Clear;
      txt.Add('insert into tdp_temp(');
      txt.Add('data, p_auxiliar, protocolo, registro, tipo, nome, endereco, bairro, cidade, estado, cep, endere2,');
      txt.Add('bairro2, cidade2, estado2, cep2, situacao, qtde_part, nome2, tip_doc1, doc1, tip_doc2, doc2, d_e1,');
      txt.Add('d_e2, destina, rl, e_mail, tip_cpf, ag_cc, model, cartao, seq, numero, complem, data_not1, hora_not1,');
      txt.Add('sit_not1, cod_not1, obs_not1, enc_not, data_not2, hora_not2, sit_not2, cod_not2, obs_not2, data_not3,');
      txt.Add('hora_not3, sit_not3, cod_not3, obs_not3, atualizado, numero2, nome3, data_tra, datad1, datad2, datad3,');
      txt.Add('hora1, hora2, hora3, dedouro, dia, h, tra_tra, dt_ent_db, dt_ent_ret, dt_ent_rt, tramit, dt_nent_rt,');
      txt.Add('dt_nent_db, dat_tra, cxpostal, cartorio)');
      txt.add('VALUES(');
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x],  2,     8), 'D') + ',');   //data
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 10,    10), 'N') + ',');   //p_auxiliar
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 20,    10), 'N') + ',');   //protocolo
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 30,    10), 'N') + ',');   //registro
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 40,     1), 'C') + ',');    //tipo
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 41,   200), 'C') + ',');  //nome
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 241,  120), 'C') + ',');  //endereco
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 361,   60), 'C') + ',');  //bairro
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 421,   60), 'C') + ',');  //cidade
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 481,    2), 'C') + ',');   //estado
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 483,    9), 'C') + ',');   //cep
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 492,   60), 'C') + ',');  //endere2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 552,   20), 'C') + ',');  //bairro2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 572,   30), 'C') + ',');  //cidade2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 602,    2), 'C') + ',');   //estado2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 604,    9), 'C') + ',');   //cep2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 613,    3), 'C') + ',');   //situacao
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 616,   10), 'N') + ',');  //qtde_part
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 626,  100), 'C') + ',');  //nome2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 726,    4), 'C') + ',');   //tip_doc1
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 730,   20), 'C') + ',');  //doc1
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 750,    3), 'C') + ',');   //tip_doc2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 753,   20), 'C') + ',');  //doc2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 773,    1), 'C') + ',');   //d_e1
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 774,    1), 'C') + ',');   //d_e2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 775,   60), 'C') + ',');  //destina
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 835,   30), 'C') + ',');  //rl
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 865,   60), 'C') + ',');  //e_mail
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 925,    3), 'C') + ',');   //tip_cpf
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 928,   12), 'C') + ',');  //ag_cc
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 940,    5), 'C') + ',');   //model
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 945,   16), 'C') + ',');  //cartao
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 961,    4), 'C') + ',');   //seq
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 965,   10), 'C') + ',');  //numero
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 975,   50), 'C') + ',');  //complem
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1025,   8), 'D') + ',');  //data_not1
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1033,   8), 'C') + ',');  //hora_not1
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1041,   1), 'C') + ',');  //sit_not1
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1042,  10), 'N') + ',');  //cod_not1
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1052, 250), 'C') + ',');  //obs_not1
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1302,   1), 'C') + ',');  //enc_not
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1303,   8), 'D') + ',');  //data_not2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1311,   8), 'C') + ',');  //hora_not2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1319,   1), 'C') + ',');  //sit_not2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1320,  10), 'N') + ',');  //cod_not2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1330, 250), 'C') + ',');  //obs_not2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1580,   8), 'D') + ',');  //data_not3
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1588,   8), 'C') + ',');  //hora_not3
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1596,   1), 'C') + ',');  //sit_not3
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1597,  10), 'N') + ',');  //cod_not3
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1607, 250), 'C') + ',');  //obs_not3)
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1857,   1), 'C') + ',');  //atualizado
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1858,  10), 'C') + ',');  //numero2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 1868, 200), 'C') + ',');  //nome3)
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2068,   8), 'D') + ',');  //data_tra
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2076,   8), 'D') + ',');  //datad1
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2084,   8), 'D') + ',');  //datad2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2092,   8), 'D') + ',');  //datad3
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2100,   8), 'C') + ',');  //hora1
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2108,   8), 'C') + ',');  //hora2
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2116,   8), 'C') + ',');  //hora3
      Txt.Add(ValidaCampo(copy(RichEdit1.Lines[x], 2114,  15), 'C') + ',');  //dedouro
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2139, 8), 'D') + ',');  //dia
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2147,   5), 'C') + ',');  //h
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2152,  15), 'C') + ',');  //tra_tra
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2167,   8), 'D') + ',');  //dt_ent_db
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2175,   8), 'D') + ',');  //dt_ent_ret
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2183,   8), 'D') + ',');  //dt_ent_rt
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2191,  10), 'N') + ',');  //tramit;
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2201,   8), 'D') + ',');  //dt_nent_rt
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2209,   8), 'D') + ',');  //dt_nent_db
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2217,   8), 'D') + ',');  //dat_tra
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2225,  15), 'C') + ',');  //cxpostal
      txt.add(ValidaCampo(copy(RichEdit1.Lines[x], 2240,   2), 'C') + ')');  //cartorio

      dm.tdp_temp.close;
      dm.tdp_temp.SQL.Clear;
      dm.tdp_temp.sql.add(txt.Text);
      dm.tdp_temp.ExecSQL;

      if copy(RichEdit1.Lines[x + 1], 1, 1) = '4' then x := x + 1 else Break;

    end;

    x := x + 1;
    if copy(RichEdit1.Lines[x], 1, 1) <> '1' then break;

  end;

  dm.td_temp.close;
  dm.td_temp.SQL.clear;
  dm.td_temp.SQL.add('select * from td_temp');
  dm.td_temp.open;

  dm.tdp_temp.close;
  dm.tdp_temp.SQL.clear;
  dm.tdp_temp.SQL.add('select * from tdp_temp');
  dm.tdp_temp.open;


  BitBtn2.Enabled := True;
  Animate1.Visible := False;
  Animate1.Active := False;
  BitBtn2.setfocus;
end;

procedure TF_importa.BitBtn3Click(Sender: TObject);
begin

  MaskEdit1.Text := '';
  MaskEdit2.Text := '';
  BitBtn2.Enabled := False;
  dm.td_temp.close;
  dm.td_temp.SQL.clear;
  dm.td_temp.SQL.add('truncate td_temp');
  dm.td_temp.ExecSQL;

  dm.tdp_temp.close;
  dm.tdp_temp.SQL.clear;
  dm.tdp_temp.SQL.add('truncate tdp_temp');
  dm.tdp_temp.ExecSQL;
 
  MaskEdit1.SetFocus;
end;

procedure TF_importa.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TF_importa.BitBtn2Click(Sender: TObject);
var
  Txt : TStrings;
  x , xy , y : integer;
  valor : String;
begin
  ProgressBar1.min := 0;
  dm.td_temp.Last;
  dm.tdp_temp.last;
  ProgressBar1.Max:= dm.td_temp.RecordCount + dm.tdp_temp.RecordCount;
  DM.td_temp.First;
  xy := 0;
  txt := TStringList.Create;
  Animate1.Visible := true;
  Animate1.Active := True;

  while not dm.td_temp.Eof do
  begin
    Txt.Clear;
    Txt.Add('insert into td(');
    Txt.Add('data_r, data_p, data_e, data_d, data_i, data_du, data_anot, p_auxiliar, protocolo, registro, tipo,');
    Txt.Add('tabela, lancamento, natureza, ext_nat, certidoes, microfilme, proc_dados, qtde_nome, pag_adic,');
    Txt.Add('divisor, cod_local, anotacao, custas, deposito, valor_base, hora_p, hora_p1, cod_ir1, cod_ir2,');
    Txt.Add('status, v_emolumentos, v_emoladicional, v_pd, v_mic, v_cert, v_pag, v_viaexc, v_digitalizacao,');
    Txt.Add('v_informatica, v_graveletr, v_conferencia, v_nome, v_tribunal, v_procuradoria, v_defensoria, v_mutua,');
    Txt.Add('v_acoterj, v_distrib, v_infodistrib, v_microdistrib, v_gravEletrDistrib, v_subtotal, v_total, identifica,');
    Txt.Add('identific1, identific2, identific3, a_nome, a_cpff, a_rgg, a_endereco, a_bairro, a_cidade, a_estado,');
    Txt.Add('a_cep, a_telefone, ctrlcont, dta, contrato, aaa, data_cel, parc2, valor2, cliente, parc3, parc4, parc5,');
    Txt.Add('parc6, parc7, parc8, parc9, parc10, parc11, parc12, parc13, parc14, parc15, valor3, valor4, valor5, valor6,');
    Txt.Add('cod_ir3, rz, complreg, empresa, p_v_mora, dia, data_cert, data_imp, nossonum2, nossonum3, agencia,');
    Txt.Add('nom_port, remessa, versao, lote, arquivo, destina, data_entr, data_not1, data_not2, data_not3, rl,');
    Txt.Add('local, tipo_reg, qtde_diligencia, doi, v_procest, v_leis_dist, v_doi, v_doi_info, v_guia, v_guia_info, v_not_pd,');

    Txt.Add('parcelas, ven_parc, val_parc, data_re, data_re1, data_re2, pos_cert, vias_adc, sit_not1, sit_not2,');
    Txt.Add('sit_not3, obs_not1, obs_not2, obs_not3, val_abert, a_num,');
    Txt.Add('a_fax, op_num, op_nom, nosso, op_dat, moeda, cod_port, cod_cart, data_mov, pr1, pr2, qtde_eti, mod_eti,');
    Txt.Add('cod_ag, contato, tip_doc, doc, ncliente, ven_parc2, ven_parc3, ven_parc4, ven_parc5, ven_parc6, ven_parc7,');
    Txt.Add('ven_parc8, ven_parc9, ven_parc10, ven_parc11, ven_parc12, ven_parc13, ven_parc14, ven_parc15, ven_parc16,');
    Txt.Add('ven_parc17, val_parc2, val_parc3, val_parc4, data_podre, parc_podre, codificacao, grupo, seq, cota,');
    Txt.Add('dt_vc_prazo, hora_not1, hora_not2, hora_not3, val_parc5, val_parc6, val_parc7, val_parc8, val_parc9,');
    txt.Add('val_parc10, val_parc11, val_parc12, val_parc13, val_parc14, val_parc15, val_parc16, val_parc17, tot_parcela,');
    txt.Add('cod_cli, rlcertid, certcertif, carta, ag_conta, especie, aceite, nu_barras, barras, dt_mov, nossonum,');
    txt.Add('mensa1, mensa2, mensa3, mensa4, mensa5, produto, regional, financeira, venc_bol, modelo, contacc,');
    txt.Add('valparc_cor, valparc_pri, data_repost, hora_p2, obs_not4, obs_not5, cheque, hora_p3, data_irr, hora1,');
    txt.Add('hora2, S, n_des, motivo1, motivo2, motivo3, motivo4, motivo5, t, motivo6, sit_not5, motivo7, data_not4,');
    txt.Add('data_not5, sit_not4, motivo8, motivo9, motivo10, q_ar, motivo11, q_cond, v_ar, data_atraso1, data_atraso2,');
    txt.Add('valor_extenso, v_cus_ter, porcentagem, data_apuracao, cedente, banco, cod_empresa, cod_banco, escritorio,');
    txt.Add('nr_doc, valor1, loc_pag, dt_proc_doc, nr_doc2, obs, carteira, valor_banco, dt_contr, qtd_nr, data_prov1,');
    txt.Add('cod_prov1, sit_prov1, obs_prov1, data_prov2, cod_prov2, sit_prov2, obs_prov2, data_prov3, cod_prov3,');
    txt.Add('sit_prov3, obs_prov3, data_impr, data_reti, nr_notific, bxcorreio, portal, selo_serie, selo_numero, cartorio)');
    txt.add('VALUES(');
  //  MessageBox(0, PChar(inttostr(x)), 'Mensagem', MB_OK + MB_ICONSTOP);

    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_r').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_r').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_r').AsString , 7, 4) , 'D') + ',');        //    data_r,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_p').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_p').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_p').AsString , 7, 4), 'D') + ',');       //    data_p,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_e').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_e').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_e').AsString , 7, 4), 'D') + ',');       //    data_e,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_d').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_d').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_d').AsString , 7, 4), 'D') + ',');       //    data_d,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_i').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_i').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_i').AsString , 7, 4), 'D') + ',');       //    data_i,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_du').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_du').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_du').AsString , 7, 4), 'D') + ',');       //    data_du,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_anot').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_anot').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_anot').AsString , 7, 4), 'D') + ',');       //    data_anot,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('p_auxiliar').AsString , 'N') + ',');     //    p_auxiliar,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('protocolo').AsString, 'N') + ',');       //    protocolo,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('registro').AsString, 'N') + ',');        //    registro,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('tipo').AsString, 'C') + ',');                  //    tipo,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('tabela').AsString, 'C') + ',');          //    tabela,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('lancamento').AsString, 'N') + ',');      //    lancamento,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('natureza').AsString, 'C') + ',');     //    natureza,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('ext_nat').AsString, 'C') + ',');     //    ext_nat,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('certidoes').AsString, 'C') + ',');     //    certidoes,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('microfilme').AsString, 'N') + ',');     //    microfilme,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('proc_dados').AsString, 'N') + ',');     //    proc_dados,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('qtde_nome').AsString, 'N') + ',');     //    qtde_nome,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('pag_adic').AsString, 'N') + ',');     //    pag_adic,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('divisor').AsString, 'N') + ',');     //    divisor,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_local').AsString, 'N') + ',');     //    cod_local,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('anotacao').AsString, 'C') + ',');     //    anotacao,

    txt.add(FormataMonetario(dm.td_temp.FieldByName('custas').AsString)  + ',');     //    custas,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('deposito').AsString) + ',');     //    deposito,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('valor_base').AsString) + ',');     //    valor_base,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('hora_p').AsString, 'C') + ',');      //    hora_p,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('hora_p1').AsString, 'C') + ',');      //    hora_p1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_ir1').AsString, 'N') + ',');     //    cod_ir1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_ir2').AsString, 'C') + ',');     //    cod_ir2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('status').asstring, 'C') + ',');     //    status,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_emolumentos').AsString) + ',');     //    v_emolumentos,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_emoladicional').AsString) + ',');     //    v_emoladicional,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_pd').AsString) + ',');     //    v_pd,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_mic').AsString) + ',');     //    v_mic,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_cert').AsString) + ',');     //    v_cert,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_pag').AsString) + ',');     //    v_pag,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_viaexc').AsString) + ',');     //    v_viaexc,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_digitalizacao').AsString) + ',');     //    v_digitalizacao,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_informatica').AsString) + ',');     //    v_informatica,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_graveletr').AsString) + ',');     //    v_graveletr,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_conferencia').AsString) + ',');     //    v_conferencia,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_nome').AsString) + ',');     //    v_nome,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_tribunal').AsString) + ',');     //    v_tribunal,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_procuradoria').AsString) + ',');     //    v_procuradoria,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_defensoria').AsString) + ',');     //    v_defensoria,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_mutua').AsString) + ',');     //    v_mutua,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_acoterj').AsString) + ',');     //    v_acoterj,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_distrib').AsString) + ',');     //    v_distrib,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_infodistrib').AsString) + ',');     //    v_infodistrib,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_microdistrib').AsString) + ',');     //    v_microdistrib,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_graveletrdistrib').AsString) + ',');     //    v_gravEletrDistrib,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_subtotal').AsString) + ',');     //    v_subtotal,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_total').AsString) + ',');     //    v_total,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('identifica').AsString, 'C') + ',');     //    identifica,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('identific1').AsString, 'C') + ',');     //    identific1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('identific2').AsString, 'C') + ',');     //    identific2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('identific3').AsString, 'C') + ',');     //    identific3,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('a_nome').AsString, 'C') + ',');    //    a_nome,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('a_cpff').AsString, 'C') + ',');     //    a_cpff,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('a_rgg').AsString, 'C') + ',');    //    a_rgg,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('a_endereco').AsString, 'C') + ',');   //    a_endereco,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('a_bairro').AsString, 'C') + ',');    //    a_bairro,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('a_cidade').AsString, 'C') + ',');    //    a_cidade,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('a_estado').AsString, 'C') + ',');     //    a_estado,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('a_cep').AsString, 'C') + ',');     //    a_cep,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('a_telefone').AsString, 'C') + ',');    //    a_telefone,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('ctrlcont').AsString, 'C') + ',');     //    ctrlcont,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('dta').AsString , 1, 2) + copy(dm.td_temp.FieldByName('dta').AsString , 4, 2) + copy(dm.td_temp.FieldByName('dta').AsString , 7, 4), 'D') + ',');     //    dta,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('contrato').AsString, 'C') + ',');   //    contrato,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('aaa').AsString, 'C') + ',');    //    aaa,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_cel').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_cel').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_cel').AsString , 7, 4), 'D') + ',');     //    data_cel,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc2').AsString, 'C') + ',');    //    parc2,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('valor2').AsString) + ',');    //    valor2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cliente').AsString, 'N') + ',');    //    cliente,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc3').AsString, 'C') + ',');    //    parc3,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc4').AsString, 'C') + ',');    //    parc4,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc5').AsString, 'C') + ',');    //    parc5,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc6').AsString, 'C') + ',');    //    parc6,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc7').AsString, 'C') + ',');    //    parc7,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc8').AsString, 'C') + ',');    //    parc8,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc9').AsString, 'C') + ',');    //    parc9,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc10').AsString, 'C') + ',');    //    parc10,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc11').AsString, 'C') + ',');    //    parc11,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc12').AsString, 'C') + ',');    //    parc12,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc13').AsString, 'C') + ',');    //    parc13,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc14').AsString, 'C') + ',');    //    parc14,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc15').AsString, 'C') + ',');    //    parc15,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('valor3').AsString) + ',');    //    valor3,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('valor4').AsString) + ',');    //    valor4,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('valor5').AsString) + ',');    //    valor5,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('valor6').AsString) + ',');    //    valor6,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_ir3').AsString, 'N') + ',');    //    cod_ir3,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('rz').AsString, 'N') + ',');    //    rz,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('complreg').AsString, 'C') + ',');     //    complreg,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('empresa').AsString, 'C') + ',');   //    empresa,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('p_v_mora').AsString, 'C') + ',');     //    p_v_mora,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('dia').AsString , 1, 2) + copy(dm.td_temp.FieldByName('dia').AsString , 4, 2) + copy(dm.td_temp.FieldByName('dia').AsString , 7, 4), 'D') + ',');     //    dia,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_cert').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_cert').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_cert').AsString , 7, 4), 'D') + ',');     //    data_cert,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_imp').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_imp').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_imp').AsString , 7, 4), 'D') + ',');     //    data_imp,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('nossonum2').AsString, 'C') + ',');    //    nossonum2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('nossonum3').AsString, 'C') + ',');    //    nossonum3,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('agencia').AsString, 'C') + ',');    //    agencia,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('nom_port').AsString, 'C') + ',');     //    nom_port,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('remessa').AsString, 'C') + ',');     //    remessa,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('versao').AsString, 'N') + ',');    //    versao,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('lote').AsString, 'C') + ',');    //    lote,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('arquivo').AsString, 'C') + ',');    //    arquivo,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('destina').AsString, 'C') + ',');    //    destina,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_entr').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_entr').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_entr').AsString , 7, 4), 'D') + ',');     //    data_entr,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_not1').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_not1').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_not1').AsString , 7, 4), 'D') + ',');     //    data_not1,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_not2').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_not2').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_not2').AsString , 7, 4), 'D') + ',');     //    data_not2,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_not3').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_not3').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_not3').AsString , 7, 4), 'D') + ',');     //    data_not3,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('rl').AsString, 'C') + ',');    //    rl,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('local').AsString, 'C') + ',');   //    local,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('tipo_reg').AsString, 'C') + ',');
    txt.add(ValidaCampo(dm.td_temp.FieldByName('qtde_diligencia').AsString, 'N') + ',');
    txt.add(ValidaCampo(dm.td_temp.FieldByName('doi').AsString, 'C') + ',');
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_procest').AsString) + ',');
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_leis_dist').AsString) + ',');
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_doi').AsString) + ',');
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_doi_info').AsString) + ',');
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_guia').AsString) + ',');
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_guia_info').AsString) + ',');
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_not_pd').AsString) + ',');

    txt.add(ValidaCampo(dm.td_temp.FieldByName('parcelas').AsString, 'C') + ',');       //  parcelas,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc').AsString , 7, 4), 'D') + ',');       //   ven_parc,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc').AsString) + ',');      //   val_parc,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_re').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_re').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_re').AsString , 7, 4), 'D') + ',');       //   data_re,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_re1').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_re1').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_re1').AsString , 7, 4), 'D') + ',');       //   data_re1,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_re2').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_re2').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_re2').AsString , 7, 4), 'D') + ',');       //   data_re2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('pos_cert').AsString, 'C') + ',');       //   pos_cert,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('vias_adc').AsString, 'N') + ',');      //   vias_adc,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('sit_not1').AsString, 'C') + ',');       //   sit_not1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('sit_not2').AsString, 'C') + ',');       //   sit_not2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('sit_not3').AsString, 'C') + ',');       //   sit_not3,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('obs_not1').AsString, 'C') + ',');     //   obs_not1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('obs_not2').AsString, 'C') + ',');    //   obs_not2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('obs_not3').AsString, 'C') + ',');    //   obs_not3,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_abert').AsString) + ',');     //   val_abert,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('a_num').AsString, 'C') + ',');      //   a_num,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('a_fax').AsString, 'C') + ',');     //   a_fax,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('op_num').AsString, 'C') + ',');      //   op_num,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('op_nom').AsString, 'C') + ',');     //   op_nom,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('nosso').AsString, 'C') + ',');     //   nosso,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('op_dat').AsString , 1, 2) + copy(dm.td_temp.FieldByName('op_dat').AsString , 4, 2) + copy(dm.td_temp.FieldByName('op_dat').AsString , 7, 4), 'D') + ',');      //   op_dat,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('moeda').AsString, 'C') + ',');      //   moeda,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_port').AsString, 'C') + ',');      //   cod_port,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_cart').AsString, 'C') + ',');      //   cod_cart,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_mov').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_mov').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_mov').AsString , 7, 4), 'D') + ',');      //   data_mov,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('pr1').AsString, 'C') + ',');      //   pr1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('pr2').AsString, 'C') + ',');     //   pr2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('qtde_eti').AsString, 'N') + ',');     //   qtde_eti,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('mod_eti').AsString, 'N') + ',');     //   mod_eti,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_ag').AsString, 'N') + ',');    //   cod_ag,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('contato').AsString, 'C') + ',');    //   contato,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('tip_doc').AsString, 'C') + ',');     //   tip_doc,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('doc').AsString, 'C') + ',');    //   doc,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('ncliente').AsString, 'N') + ',');     //   ncliente,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc2').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc2').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc2').AsString , 7, 4), 'D') + ',');     //   ven_parc2,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc3').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc3').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc3').AsString , 7, 4), 'D') + ',');     //   ven_parc3,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc4').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc4').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc4').AsString , 7, 4), 'D') + ',');     //   ven_parc4,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc5').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc5').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc5').AsString , 7, 4), 'D') + ',');     //   ven_parc5,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc6').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc6').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc6').AsString , 7, 4), 'D') + ',');     //   ven_parc6,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc7').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc7').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc7').AsString , 7, 4), 'D') + ',');     //   ven_parc7,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc8').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc8').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc8').AsString , 7, 4), 'D') + ',');     //   ven_parc8,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc9').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc9').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc9').AsString , 7, 4), 'D') + ',');     //   ven_parc9,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc10').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc10').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc10').AsString , 7, 4), 'D') + ',');     //   ven_parc10,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc11').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc11').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc11').AsString , 7, 4), 'D') + ',');     //   ven_parc11,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc12').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc12').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc12').AsString , 7, 4), 'D') + ',');     //   ven_parc12,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc13').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc13').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc13').AsString , 7, 4), 'D') + ',');     //   ven_parc13,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc14').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc14').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc14').AsString , 7, 4), 'D') + ',');     //   ven_parc14,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc15').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc15').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc15').AsString , 7, 4), 'D') + ',');     //   ven_parc15,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc16').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc16').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc16').AsString , 7, 4), 'D') + ',');     //   ven_parc16,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('ven_parc17').AsString , 1, 2) + copy(dm.td_temp.FieldByName('ven_parc17').AsString , 4, 2) + copy(dm.td_temp.FieldByName('ven_parc17').AsString , 7, 4), 'D') + ',');     //   ven_parc17,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc2').AsString) + ',');    //   val_parc2,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc3').AsString) + ',');    //   val_parc3,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc4').AsString) + ',');    //   val_parc4,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_podre').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_podre').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_podre').AsString , 7, 4), 'D') + ',');     //   data_podre,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('parc_podre').AsString, 'C') + ',');   //   parc_podre,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('codificacao').AsString , 1, 2) + copy(dm.td_temp.FieldByName('codificacao').AsString , 4, 2) + copy(dm.td_temp.FieldByName('codificacao').AsString , 7, 4), 'D') + ',');   //   codificacao,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('grupo').AsString, 'C') + ',');         //   grupo,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('seq').AsString, 'C') + ',');           //   seq,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cota').AsString, 'C') + ',');          //   cota,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('dt_vc_prazo').AsString , 1, 2) + copy(dm.td_temp.FieldByName('dt_vc_prazo').AsString , 4, 2) + copy(dm.td_temp.FieldByName('dt_vc_prazo').AsString , 7, 4), 'D') + ',');     //   dt_vc_prazo,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('hora_not1').AsString, 'C') + ',');     //   hora_not1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('hora_not2').AsString, 'C') + ',');     //   hora_not2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('hora_not3').AsString, 'C') + ',');     //   hora_not3,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc5').AsString) + ',');     //   val_parc5,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc6').AsString) + ',');     //   val_parc6,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc7').AsString) + ',');     //   val_parc7,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc8').AsString) + ',');     //   val_parc8,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc9').AsString) + ',');     //   val_parc9,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc10').AsString) + ',');    //   val_parc10,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc11').AsString) + ',');    //   val_parc11,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc12').AsString) + ',');    //   val_parc12,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc13').AsString) + ',');    //   val_parc13,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc14').AsString) + ',');    //   val_parc14,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc15').AsString) + ',');    //   val_parc15,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc16').AsString) + ',');    //   val_parc16,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('val_parc17').AsString) + ',');    //   val_parc17,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('tot_parcela').AsString) + ',');   //   tot_parcela,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_cli').AsString, 'N') + ',');       //   cod_cli,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('rlcertid').AsString, 'C') + ',');      //   rlcertid,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('certcertif').AsString, 'C') + ',');    //   certcertif,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('carta').AsString, 'C') + ',');         //   carta,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('ag_conta').AsString, 'C') + ',');      //   ag_conta,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('especie').AsString, 'C') + ',');       //   especie,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('aceite').AsString, 'C') + ',');        //   aceite,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('nu_barras').AsString, 'C') + ',');     //   nu_barras,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('barras').AsString, 'C') + ',');        //   barras,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('dt_mov').AsString , 1, 2) + copy(dm.td_temp.FieldByName('dt_mov').AsString , 4, 2) + copy(dm.td_temp.FieldByName('dt_mov').AsString , 7, 4), 'D') + ',');     //   dt_mov,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('nossonum').AsString, 'C') + ',');      //   nossonum,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('mensa1').AsString, 'C') + ',');        //   mensa1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('mensa2').AsString, 'C') + ',');        //   mensa2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('mensa3').AsString, 'C') + ',');        //   mensa3,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('mensa4').AsString, 'C') + ',');        //   mensa4,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('mensa5').AsString, 'C') + ',');        //   mensa5,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('produto').AsString, 'C') + ',');       //   produto,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('regional').AsString, 'C') + ',');      //   regional,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('financeira').AsString, 'C') + ',');    //   financeira,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('venc_bol').AsString , 1, 2) + copy(dm.td_temp.FieldByName('venc_bol').AsString , 4, 2) + copy(dm.td_temp.FieldByName('venc_bol').AsString , 7, 4), 'D') + ',');     //   venc_bol,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('modelo').AsString, 'C') + ',');        //   modelo,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('contacc').AsString, 'C') + ',');       //   contacc,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('valparc_cor').AsString) + ',');   //   valparc_cor,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('valparc_pri').AsString) + ',');   //   valparc_pri,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_repost').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_repost').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_repost').AsString , 7, 4), 'D') + ',');     //   data_repost,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('hora_p2').AsString, 'C') + ',');       //   hora_p2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('obs_not4').AsString, 'C') + ',');      //   obs_not4,

    txt.add(ValidaCampo(dm.td_temp.FieldByName('obs_not5').AsString, 'C') + ',');      //   obs_not5,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cheque').AsString, 'C') + ',');        //   cheque,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('hora_p3').AsString, 'C') + ',');       //   hora_p3,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_irr').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_irr').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_irr').AsString , 7, 4), 'D') + ',');      //   data_irr,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('hora1').AsString, 'C') + ',');          //   hora1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('hora2').AsString, 'C') + ',');          //   hora2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('s').AsString, 'C') + ',');              //   S,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('n_des').AsString, 'N') + ',');          //   n_des,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('motivo1').AsString, 'C') + ',');        //   motivo1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('motivo2').AsString, 'C') + ',');        //   motivo2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('motivo3').AsString, 'C') + ',');        //   motivo3,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('motivo4').AsString, 'C') + ',');        //   motivo4,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('motivo5').AsString, 'C') + ',');        //   motivo5,
//  txt.add(ValidaCampo(dm.td_temp.FieldByName('t').AsString, 'C') + ',');              //   t,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('motivo6').AsString, 'C') + ',');        //   motivo6,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('sit_not5').AsString, 'C') + ',');       //   sit_not5,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('motivo7').AsString, 'C') + ',');        //   motivo7,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_not4').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_not4').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_not4').AsString , 7, 4), 'D') + ',');      //   data_not4,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_not5').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_not5').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_not5').AsString , 7, 4), 'D') + ',');      //   data_not5,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('sit_not4').AsString, 'C') + ',');       //   sit_not4,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('motivo8').AsString, 'C') + ',');        //   motivo8,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('motivo9').AsString, 'C') + ',');        //   motivo9,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('motivo10').AsString, 'C') + ',');       //   motivo10,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('q_ar').AsString, 'N') + ',');           //   q_ar,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('motivo11').AsString, 'C') + ',');       //   motivo11,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('q_cond').AsString, 'N') + ',');         //   q_cond,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_ar').AsString) + ',');           //   v_ar,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_atraso1').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_atraso1').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_atraso1').AsString , 7, 4), 'D') + ',');      //   data_atraso1,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_atraso2').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_atraso2').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_atraso2').AsString , 7, 4), 'D') + ',');      //   data_atraso2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('valor_extenso').AsString, 'C') + ',');  //   valor_extenso,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('v_cus_ter').AsString) + ',');      //   v_cus_ter,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('porcentagem').AsString, 'C') + ',');    //   porcentagem,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_apuracao').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_apuracao').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_apuracao').AsString , 7, 4), 'D') + ',');     //   data_apuracao,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cedente').AsString, 'C') + ',');        //   cedente,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('banco').AsString, 'C') + ',');          //   banco,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_empresa').AsString, 'C') + ',');    //   cod_empresa,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_banco').AsString, 'C') + ',');      //   cod_banco,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('escritorio').AsString, 'C') + ',');     //   escritorio,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('nr_doc').AsString, 'C') + ',');         //   nr_doc,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('valor1').AsString) + ',');         //   valor1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('loc_pag').AsString, 'C') + ',');        //   loc_pag,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('dt_proc_doc').AsString , 1, 2) + copy(dm.td_temp.FieldByName('dt_proc_doc').AsString , 4, 2) + copy(dm.td_temp.FieldByName('dt_proc_doc').AsString , 7, 4), 'D') + ',');     //   dt_proc_doc,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('nr_doc2').AsString, 'C') + ',');        //   nr_doc2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('obs').AsString, 'C') + ',');            //   obs,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('carteira').AsString, 'C') + ',');       //   carteira,
    txt.add(FormataMonetario(dm.td_temp.FieldByName('valor_banco').AsString) + ',');    //   valor_banco,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('dt_contr').AsString , 1, 2) + copy(dm.td_temp.FieldByName('dt_contr').AsString , 4, 2) + copy(dm.td_temp.FieldByName('dt_contr').AsString , 7, 4), 'D') + ',');     //   dt_contr,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('qtd_nr').AsString, 'C') + ',');         //   qtd_nr,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_prov1').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_prov1').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_prov1').AsString , 7, 4), 'D') + ',');     //   data_prov1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_prov1').AsString, 'N') + ',');      //   cod_prov1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('sit_prov1').AsString, 'C') + ',');      //   sit_prov1,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('obs_prov1').AsString, 'C') + ',');      //   obs_prov1,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_prov2').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_prov2').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_prov2').AsString , 7, 4), 'D') + ',');     //   data_prov2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_prov2').AsString, 'N') + ',');      //   cod_prov2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('sit_prov2').AsString, 'C') + ',');      //   sit_prov2,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('obs_prov2').AsString, 'C') + ',');      //   obs_prov2,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_prov3').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_prov3').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_prov3').AsString , 7, 4), 'D') + ',');     //   data_prov3,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cod_prov3').AsString, 'N') + ',');      //   cod_prov3,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('sit_prov3').AsString, 'C') + ',');      //   sit_prov3,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('obs_prov3').AsString, 'C') + ',');      //   obs_prov3,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_impr').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_impr').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_impr').AsString , 7, 4), 'D') + ',');     //   data_impr,
    txt.add(ValidaCampo(copy(dm.td_temp.FieldByName('data_reti').AsString , 1, 2) + copy(dm.td_temp.FieldByName('data_reti').AsString , 4, 2) + copy(dm.td_temp.FieldByName('data_reti').AsString , 7, 4), 'D') + ',');     //   data_reti,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('nr_notific').AsString, 'C') + ',');     //   nr_notific,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('bxcorreio').AsString, 'C') + ',');      //   bxcorreio,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('portal').AsString, 'N') + ',');         //   portal,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('selo_serie').AsString, 'C') + ',');     //   selo_serie,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('selo_numero').AsString, 'C') + ',');    //   selo_numero,
    txt.add(ValidaCampo(dm.td_temp.FieldByName('cartorio').AsString, 'C') + ')');       //   cartorio)

    dm.td.Close;
    dm.td.SQL.Clear;
    dm.td.SQL.add(txt.Text);
    dm.td.ExecSQL;

    dm.td_temp.next;
    xy := xy + 1;
    ProgressBar1.Position := xy;
    ProgressBar1.Refresh;
  end;



    DM.tdp_temp.First;

    while not dm.tdp_temp.Eof do
    begin
      Txt.Clear;
      Txt.Add('insert into td_pesso(');
      Txt.Add('data, p_auxiliar, protocolo, registro, tipo, nome, endereco, bairro, cidade, estado, cep, endere2,');
      Txt.Add('bairro2, cidade2, estado2, cep2, situacao, qtde_part, nome2, tip_doc1, doc1, tip_doc2, doc2, d_e1,');
      Txt.Add('d_e2, destina, rl, e_mail, tip_cpf, ag_cc, model, cartao, seq, numero, complem, data_not1, hora_not1,');
      Txt.Add('sit_not1, cod_not1, obs_not1, enc_not, data_not2, hora_not2, sit_not2, cod_not2, obs_not2, data_not3,');
      Txt.Add('hora_not3, sit_not3, cod_not3, obs_not3, atualizado, numero2, nome3, data_tra, datad1, datad2, datad3,');
      Txt.Add('hora1, hora2, hora3, dedouro, dia, h, tra_tra, dt_ent_db, dt_ent_ret, dt_ent_rt, tramit, dt_nent_rt,');
      Txt.Add('dt_nent_db, dat_tra, cxpostal, cartorio)');
      Txt.add('VALUES(');
      Txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('data').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('data').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('data').AsString , 7, 4), 'D') + ',');   //data
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('p_auxiliar').AsString, 'N') + ',');   //p_auxiliar
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('protocolo').AsString, 'N') + ',');   //protocolo
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('registro').AsString, 'N') + ',');   //registro
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('tipo').AsString, 'C') + ',');    //tipo
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('nome').AsString, 'C') + ',');  //nome
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('endereco').AsString, 'C') + ',');  //endereco
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('bairro').AsString, 'C') + ',');  //bairro
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('cidade').AsString, 'C') + ',');  //cidade
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('estado').AsString, 'C') + ',');   //estado
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('cep').AsString, 'C') + ',');   //cep
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('endere2').AsString, 'C') + ',');  //endere2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('bairro2').AsString, 'C') + ',');  //bairro2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('cidade2').AsString, 'C') + ',');  //cidade2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('estado2').AsString, 'C') + ',');   //estado2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('cep2').AsString, 'C') + ',');   //cep2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('situacao').AsString, 'C') + ',');   //situacao
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('qtde_part').AsString, 'N') + ',');  //qtde_part
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('nome2').AsString, 'C') + ',');  //nome2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('tip_doc1').AsString, 'C') + ',');   //tip_doc1
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('doc1').AsString, 'C') + ',');  //doc1
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('tip_doc2').AsString, 'C') + ',');   //tip_doc2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('doc2').AsString, 'C') + ',');  //doc2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('d_e1').AsString, 'C') + ',');   //d_e1
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('d_e2').AsString, 'C') + ',');   //d_e2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('destina').AsString, 'C') + ',');  //destina
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('rl').AsString, 'C') + ',');  //rl
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('e_mail').AsString, 'C') + ',');  //e_mail
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('tip_cpf').AsString, 'C') + ',');   //tip_cpf
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('ag_cc').AsString, 'C') + ',');  //ag_cc
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('model').AsString, 'C') + ',');   //model
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('cartao').AsString, 'C') + ',');  //cartao
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('seq').AsString, 'C') + ',');   //seq
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('numero').AsString, 'C') + ',');  //numero
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('complem').AsString, 'C') + ',');  //complem
      Txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('data_not1').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('data_not1').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('data_not1').AsString , 7, 4), 'D') + ',');  //data_not1
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('hora_not1').AsString, 'C') + ',');  //hora_not1
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('sit_not1').AsString, 'C') + ',');  //sit_not1
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('cod_not1').AsString, 'N') + ',');  //cod_not1
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('obs_not1').AsString, 'C') + ',');  //obs_not1
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('enc_not').AsString, 'C') + ',');  //enc_not
      Txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('data_not2').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('data_not2').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('data_not2').AsString , 7, 4), 'D') + ',');  //data_not2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('hora_not2').AsString, 'C') + ',');  //hora_not2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('sit_not2').AsString, 'C') + ',');  //sit_not2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('cod_not2').AsString, 'N') + ',');  //cod_not2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('obs_not2').AsString, 'C') + ',');  //obs_not2
      Txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('data_not3').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('data_not3').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('data_not3').AsString , 7, 4), 'D') + ',');  //data_not3
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('hora_not3').AsString, 'C') + ',');  //hora_not3
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('sit_not3').AsString, 'C') + ',');  //sit_not3
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('cod_not3').AsString, 'N') + ',');  //cod_not3
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('obs_not3').AsString, 'C') + ',');  //obs_not3)
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('atualizado').AsString, 'C') + ',');  //atualizado
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('numero2').AsString, 'C') + ',');  //numero2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('nome3').AsString, 'C') + ',');  //nome3)
      Txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('data_tra').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('data_tra').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('data_tra').AsString , 7, 4), 'D') + ',');  //data_tra
      Txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('datad1').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('datad1').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('datad1').AsString , 7, 4), 'D') + ',');  //datad1
      Txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('datad2').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('datad2').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('datad2').AsString , 7, 4), 'D') + ',');  //datad2
      Txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('datad3').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('datad3').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('datad3').AsString , 7, 4), 'D') + ',');  //datad3
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('hora1').AsString, 'C') + ',');  //hora1
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('hora2').AsString, 'C') + ',');  //hora2
      Txt.add(ValidaCampo(dm.tdp_temp.FieldByName('hora3').AsString, 'C') + ',');  //hora3
      Txt.Add(ValidaCampo(dm.tdp_temp.FieldByName('dedouro').AsString, 'C') + ',');  //dedouro
      txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('dia').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('dia').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('dia').AsString , 7, 4), 'D') + ',');  //dia
      txt.add(ValidaCampo(dm.tdp_temp.FieldByName('h').AsString, 'C') + ',');  //h
      txt.add(ValidaCampo(dm.tdp_temp.FieldByName('tra_tra').AsString, 'C') + ',');  //tra_tra
      txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('dt_ent_db').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('dt_ent_db').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('dt_ent_db').AsString , 7, 4), 'D') + ',');  //dt_ent_db
      txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('dt_ent_ret').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('dt_ent_ret').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('dt_ent_ret').AsString , 7, 4), 'D') + ',');  //dt_ent_ret
      txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('dt_ent_rt').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('dt_ent_rt').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('dt_ent_rt').AsString , 7, 4), 'D') + ',');  //dt_ent_rt
      txt.add(ValidaCampo(dm.tdp_temp.FieldByName('tramit').AsString, 'N') + ',');  //tramit;
      txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('dt_nent_rt').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('dt_nent_rt').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('dt_nent_rt').AsString , 7, 4), 'D') + ',');  //dt_nent_rt
      txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('dt_nent_db').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('dt_nent_db').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('dt_nent_db').AsString , 7, 4), 'D') + ',');  //dt_nent_db
      txt.add(ValidaCampo(copy(dm.tdp_temp.FieldByName('dat_tra').AsString , 1, 2) + copy(dm.tdp_temp.FieldByName('dat_tra').AsString , 4, 2) + copy(dm.tdp_temp.FieldByName('dat_tra').AsString , 7, 4), 'D') + ',');  //dat_tra
      txt.add(ValidaCampo(dm.tdp_temp.FieldByName('cxpostal').AsString, 'C') + ',');  //cxpostal
      txt.add(ValidaCampo(dm.tdp_temp.FieldByName('cartorio').AsString, 'C') + ')');  //cartorio

      dm.Td_Pesso.close;
      dm.Td_Pesso.SQL.Clear;
      dm.Td_Pesso.sql.add(txt.Text);
      dm.Td_Pesso.ExecSQL;


      dm.tdp_temp.Next;
      xy := xy + 1;
      ProgressBar1.Position := xy;
      ProgressBar1.Refresh;
    end;

   dm.td_temp.First;
   while not dm.td_temp.Eof do
   begin
      //Gravando registros no td_cert
      Atualiza_TdCert(dm.td_temp.FieldByName('data_r').AsString, dm.td_temp.FieldByName('p_auxiliar').AsString);
      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'REGISTRADO em ' + dm.td_temp.FieldByName('data_r').AsString + '.', dm.td_temp.FieldByName('p_auxiliar').AsString);
      dm.td_temp.Next;
    end;

   Animate1.Active := False;
   Animate1.Visible := False;
   Application.MessageBox('Fim da Importação!', 'Mensagem do Sistema', mb_ok);
   ProgressBar1.Position := 0;
   BitBtn3Click(sender);
end;

procedure TF_importa.MaskEdit1Exit(Sender: TObject);
begin
  if ValidData(MaskEdit1.Text) then
  begin
    dm.td.Close;
    dm.td.sql.Clear;
    dm.td.sql.add('select data_p from td where data_p = "' + ConvData(MaskEdit1.Text) + '"');
    dm.td.open;

    if dm.TD.RecordCount <> 0 then
    begin
      Application.MessageBox('Movimento ja importado!', 'Mensagem do Sistema', mb_ok);
      BitBtn3Click(sender);
      exit;
    end;
  end;
end;

end.


