unit RAV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers, Grids, DBGrids;

type
  TF_RAV = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit3: TMaskEdit;
    GroupBox2: TGroupBox;
    RadioButton6: TRadioButton;
    BitBtn4: TBitBtn;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    RadioButton2: TRadioButton;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label5: TLabel;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure ImprimeRelAdv;
    procedure ImprimeRelAdvA4;
  public
    { Public declarations }
  end;

var
  F_RAV: TF_RAV;
  col1, col, lin, pulo : Integer;
  dia, mes, ano, prot, prot1 : String;
  old_font : String;
  q_lab : String;

implementation

uses Menu, DMTD, QkMerca, QkMercA4, QkLider, QkLidA4, QkSim, QkSimA4,
  QkSecun, QkSecA4, QkErn, QkErnB2, QkErnB, QkErnA4, QkErnBA4, QKWOCos,
  QkWocA4, QKScan, QkScaA4, QkEmp, QkEmpA4, QKAdvMores, QKAdvMoresA4, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RAV.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RAV.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_RAV.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RAV.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit2.text := '';
  maskedit3.text := '';
  maskedit1.setfocus;
end;

procedure TF_RAV.BitBtn4Click(Sender: TObject);
begin
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.p_auxiliar, a.protocolo, a.registro, a.rl, a.data_apuracao,');
  Dm.Join.Sql.Add('a.grupo, a.parcelas, a.contrato, a.val_parc, a.arquivo, a.a_nome, a.produto, a.cota, a.porcentagem,');
  Dm.Join.Sql.Add('a.ven_parc, a.parc2, a.ven_parc2, a.parc3, a.ven_parc3, a.parc4, a.ven_parc4, a.parc5, a.ven_parc5,');
  Dm.Join.Sql.Add('a.parc6, a.ven_parc6, a.parc7, a.ven_parc7, a.parc8, a.ven_parc8, a.parc9, a.ven_parc9,');
  Dm.Join.Sql.Add('a.parc10, a.ven_parc10, a.parc11, a.ven_parc11, a.parc12, a.ven_parc12, a.parc13, a.ven_parc13,');
  Dm.Join.Sql.Add('a.parc14, a.ven_parc14, a.parc15, a.ven_parc15,');
  Dm.Join.Sql.Add('a.val_parc, a.val_parc2, a.val_parc3, a.val_parc4, a.val_parc5, a.nr_notific,');
  Dm.Join.Sql.Add('a.val_parc6, a.val_parc7, a.val_parc8, a.val_parc9, a.val_parc10,');
  Dm.Join.Sql.Add('a.val_parc11, a.val_parc12, a.val_parc13, a.val_parc14, a.val_parc15,');
  Dm.Join.Sql.Add('v_cartorio, v_estado, v_ipesp, v_sinoreg, v_tribunal, v_mic, v_conducao, custas,');
  Dm.Join.Sql.Add('vo_mic, ve_mic, vi_mic, vs_mic, vt_mic, v_mic, v_conducao, custas,');
  Dm.Join.Sql.Add('a.barras, a.nu_barras, a.especie, a.aceite, a.financeira, a.ag_conta, a.venc_bol, a.dt_mov,');
  Dm.Join.Sql.Add('a.mensa1, a.mensa2, a.mensa3, a.mensa4, a.mensa5, a.nossonum, a.val_parc, a.cedente, a.cod_cli,');
  Dm.Join.Sql.Add('a.dt_contr,a.agencia,');
  Dm.Join.Sql.Add('b.nome, b.situacao, b.endereco, b.bairro, b.cidade, b.estado, b.cep, b.numero, b.complem,');
  Dm.Join.Sql.Add('b.doc1, b.cxpostal');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
  Dm.Join.Sql.Add('ON (a.data_r = b.data AND a.p_auxiliar = b.p_auxiliar)');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  if (ValidNumero(MaskEdit3.Text)) and (ValidNumero(MaskEdit2.Text)) then
  begin
    Dm.Join.Sql.Add('AND a.p_auxiliar >= ' + Trim(MaskEdit3.Text));
    Dm.Join.Sql.Add('AND a.p_auxiliar <= ' + Trim(MaskEdit2.Text));
  end;
  Dm.Join.Sql.Add('AND a.natureza = 197');
  Dm.Join.Sql.Add('AND b.situacao = "D"');
  Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
  Dm.Join.Open;
  if (Dm.Join.RecordCount = 0) then
  begin
    Dm.Join.Close;
    ShowMessage('Movimento não encontrado !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  QRDestroi;
//arq := '';
//arq := TirarTudo(F_Menu.Label1.Caption, ' ','','') + 'IMPNOT';
//CriaTabela('IMPNOT', arq);
  if (not RadioButton2.Checked) then
  begin
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,4)) = 'MERC') then
    begin
      Application.CreateForm(TQk_Merca, Qk_Merca);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Merca.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Merca.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Merca.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Merca.QrImage2.Picture.LoadFromFile('');

      Qk_Merca.QuickRep1.Preview;
      Qk_Merca := NIL;
      Qk_Merca.Free;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'LID') then
    begin
      Application.CreateForm(TQk_Lider, Qk_Lider);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Lider.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Lider.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Lider.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Lider.QrImage4.Picture.LoadFromFile('');

      Qk_Lider.QuickRep1.Preview;
      Qk_Lider.Destroy;
      Qk_Lider := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SIM') then
    begin
      Application.CreateForm(TQk_Sim, Qk_Sim);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Sim.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Sim.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Sim.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Sim.QrImage4.Picture.LoadFromFile('');

      Qk_Sim.QuickRep1.Preview;
      Qk_Sim.Destroy;
      Qk_Sim := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SEC') then
    begin
      Application.CreateForm(TQk_Secun, Qk_Secun);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Secun.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Secun.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Secun.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Secun.QrImage3.Picture.LoadFromFile('');

      Qk_Secun.QuickRep1.Preview;
   // Qk_Secun.QuickRep1.QRPrinter.Save('adileia');
      Qk_Secun := NIL;
      Qk_Secun.Free;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOS')or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOP')or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOT')or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOC') then
    begin
      Application.CreateForm(TQk_WOCos, Qk_WOCos);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_WOCos.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_WOCos.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_WOCos.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_WOCos.QrImage2.Picture.LoadFromFile('');

      Qk_WOCos.QuickRep1.Preview;
      Qk_WOCos := NIL;
      Qk_WOCos.Free;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SCA') then
    begin
      Application.CreateForm(TQk_Scan, Qk_Scan);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Scan.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Scan.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Scan.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Scan.QrImage2.Picture.LoadFromFile('');

      Qk_Scan.QuickRep1.Preview;
      Qk_Scan := NIL;
      Qk_Scan.Free;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'EMP') then
    begin
      Application.CreateForm(TQk_Emp, Qk_Emp);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Emp.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Emp.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Emp.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Emp.QrImage4.Picture.LoadFromFile('');

      Qk_Emp.QuickRep1.Preview;
      Qk_Emp := NIL;
      Qk_Emp.Free;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'ADV') then
    begin
       ImprimeRelAdv;
       QK_AdvMorais.QuickRep1.Preview;
       Exit;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'ERN') then
     begin
        Dm.Join.Close;
        Dm.Join.Sql.Clear;
        Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.p_auxiliar, a.protocolo, a.registro, a.rl, a.data_apuracao,');
        Dm.Join.Sql.Add('a.grupo, a.parcelas, a.contrato, a.val_parc, a.arquivo, a.a_nome, a.produto, a.cota, a.porcentagem,');
        Dm.Join.Sql.Add('a.ven_parc, a.parc2, a.ven_parc2, a.parc3, a.ven_parc3, a.parc4, a.ven_parc4, a.parc5, a.ven_parc5,');
        Dm.Join.Sql.Add('v_cartorio, v_estado, v_ipesp, v_sinoreg, v_tribunal, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('vo_mic, ve_mic, vi_mic, vs_mic, vt_mic, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('a.barras, a.nu_barras, a.especie, a.aceite, a.financeira, a.ag_conta, a.venc_bol, a.dt_mov,');
        Dm.Join.Sql.Add('a.mensa1, a.mensa2, a.mensa3, a.mensa4, a.mensa5, a.nossonum, a.val_parc, a.cedente,a.agencia,');
        Dm.Join.Sql.Add('b.nome, b.situacao, b.endereco, b.bairro, b.cidade, b.estado, b.cep, b.numero, b.complem,');
        Dm.Join.Sql.Add('b.doc1');
        Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
        Dm.Join.Sql.Add('ON (a.data_r = b.data AND a.p_auxiliar = b.p_auxiliar)');
        Dm.Join.Sql.Add('WHERE');
        Dm.Join.Sql.Add('a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
        if (ValidNumero(MaskEdit3.Text)) and (ValidNumero(MaskEdit2.Text)) then
        begin
          Dm.Join.Sql.Add('AND a.p_auxiliar >= ' + Trim(MaskEdit3.Text));
          Dm.Join.Sql.Add('AND a.p_auxiliar <= ' + Trim(MaskEdit2.Text));
        end;
        Dm.Join.Sql.Add('AND a.natureza = 197');
        Dm.Join.Sql.Add('AND b.situacao = "D"');
        Dm.Join.Sql.Add('AND a.barras = ""');
        Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
        Dm.Join.Open;
        if DM.Join.RecordCount <> 0 then
        Begin
          Application.CreateForm(TQk_Ern, Qk_Ern);

          if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
             Qk_Ern.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
          else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
             Qk_Ern.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
          else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
             Qk_Ern.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
          else
             Qk_Ern.QrImage2.Picture.LoadFromFile('');

          Qk_Ern.QuickRep1.Preview;
          QK_Ern := NIL;
          Qk_Ern.Free;
        end;

        Dm.Join.Close;
        Dm.Join.Sql.Clear;
        Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.p_auxiliar, a.protocolo, a.registro, a.rl, a.data_apuracao,');
        Dm.Join.Sql.Add('a.grupo, a.parcelas, a.contrato, a.val_parc, a.arquivo, a.a_nome, a.produto, a.cota, a.porcentagem,');
        Dm.Join.Sql.Add('a.ven_parc, a.parc2, a.ven_parc2, a.parc3, a.ven_parc3, a.parc4, a.ven_parc4, a.parc5, a.ven_parc5,');
        Dm.Join.Sql.Add('v_cartorio, v_estado, v_ipesp, v_sinoreg, v_tribunal, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('vo_mic, ve_mic, vi_mic, vs_mic, vt_mic, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('a.barras, a.nu_barras, a.especie, a.aceite, a.financeira, a.ag_conta, a.venc_bol, a.dt_mov,');
        Dm.Join.Sql.Add('a.mensa1, a.mensa2, a.mensa3, a.mensa4, a.mensa5, a.nossonum, a.val_parc, a.cedente,');
        Dm.Join.Sql.Add('b.nome, b.situacao, b.endereco, b.bairro, b.cidade, b.estado, b.cep, b.numero, b.complem,');
        Dm.Join.Sql.Add('b.doc1');
        Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
        Dm.Join.Sql.Add('ON (a.data_r = b.data AND a.p_auxiliar = b.p_auxiliar)');
        Dm.Join.Sql.Add('WHERE');
        Dm.Join.Sql.Add('a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
        if (ValidNumero(MaskEdit3.Text)) and (ValidNumero(MaskEdit2.Text)) then
        begin
          Dm.Join.Sql.Add('AND a.p_auxiliar >= ' + Trim(MaskEdit3.Text));
          Dm.Join.Sql.Add('AND a.p_auxiliar <= ' + Trim(MaskEdit2.Text));
        end;
        Dm.Join.Sql.Add('AND a.natureza = 197');
        Dm.Join.Sql.Add('AND b.situacao = "D"');
        Dm.Join.Sql.Add('AND a.barras <> ""');
        Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
        Dm.Join.Open;
        if DM.Join.RecordCount <> 0 then
        Begin
         Application.CreateForm(TQk_ErnB, Qk_ErnB);
         Qk_ErnB.QuickRep1.Preview;
         Qk_ErnB.Destroy;
         QK_ErnB := NIL;
        end;
     end;
    end
  else
  begin
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,4)) = 'MERC') then
    begin
      Application.CreateForm(TQk_MercA4, Qk_MercA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_MercA4.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_MercA4.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_MercA4.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_MercA4.QrImage2.Picture.LoadFromFile('');

      Qk_MercA4.QuickRep1.Preview;
      Qk_MercA4.Destroy;
      Qk_MercA4 := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'LID') then
    begin
      Application.CreateForm(TQk_LidA4, Qk_LidA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_LidA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_LidA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_LidA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_LidA4.QrImage4.Picture.LoadFromFile('');

      Qk_LidA4.QuickRep1.Preview;
      Qk_LidA4.Destroy;
      Qk_LidA4 := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SIM') then
    begin
      Application.CreateForm(TQk_SimA4, Qk_SimA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_SimA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_SimA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_SimA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_SimA4.QrImage4.Picture.LoadFromFile('');

      Qk_SimA4.QuickRep1.Preview;
      Qk_SimA4.Destroy;
      Qk_SimA4 := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SEC') then
    begin
      Application.CreateForm(TQk_SecA4, Qk_SecA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_SecA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_SecA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_SecA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_SecA4.QrImage4.Picture.LoadFromFile('');

      Qk_SecA4.QuickRep1.Preview;
      Qk_SecA4.Destroy;
      Qk_SecA4 := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOS') or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOP') or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOT') or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOC') then
    begin
      Application.CreateForm(TQk_WocA4, Qk_WocA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_WocA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_WocA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_WocA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_WocA4.QrImage4.Picture.LoadFromFile('');

      Qk_WocA4.QuickRep1.Preview;
      Qk_WocA4.Destroy;
      Qk_WocA4 := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SCA') then
    begin
      Application.CreateForm(TQk_ScaA4, Qk_ScaA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_ScaA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_ScaA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_ScaA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_ScaA4.QrImage4.Picture.LoadFromFile('');

      Qk_ScaA4.QuickRep1.Preview;
      Qk_ScaA4.Destroy;
      Qk_ScaA4 := NIL;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'ADV') then
    begin
       ImprimeRelAdvA4;
       QK_AdvMoraisA4.QuickRep1.Preview;
       Exit;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'EMP') then
    begin
      Application.CreateForm(TQk_EmpA4, Qk_EmpA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_EmpA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_EmpA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_EmpA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_EmpA4.QrImage4.Picture.LoadFromFile('');

      Qk_EmpA4.QuickRep1.Preview;
      Qk_EmpA4.Destroy;
      Qk_EmpA4 := NIL;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'ERN') then
    begin
        Dm.Join.Close;
        Dm.Join.Sql.Clear;
        Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.p_auxiliar, a.protocolo, a.registro, a.rl, a.data_apuracao,');
        Dm.Join.Sql.Add('a.grupo, a.parcelas, a.contrato, a.val_parc, a.arquivo, a.a_nome, a.produto, a.cota, a.porcentagem,');
        Dm.Join.Sql.Add('a.ven_parc, a.parc2, a.ven_parc2, a.parc3, a.ven_parc3, a.parc4, a.ven_parc4, a.parc5, a.ven_parc5,');
        Dm.Join.Sql.Add('v_cartorio, v_estado, v_ipesp, v_sinoreg, v_tribunal, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('vo_mic, ve_mic, vi_mic, vs_mic, vt_mic, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('a.barras, a.nu_barras, a.especie, a.aceite, a.financeira, a.ag_conta, a.venc_bol, a.dt_mov,');
        Dm.Join.Sql.Add('a.mensa1, a.mensa2, a.mensa3, a.mensa4, a.mensa5, a.nossonum, a.val_parc, a.cedente,');
        Dm.Join.Sql.Add('b.nome, b.situacao, b.endereco, b.bairro, b.cidade, b.estado, b.cep, b.numero, b.complem,');
        Dm.Join.Sql.Add('b.doc1');
        Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
        Dm.Join.Sql.Add('ON (a.data_r = b.data AND a.p_auxiliar = b.p_auxiliar)');
        Dm.Join.Sql.Add('WHERE');
        Dm.Join.Sql.Add('a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
        if (ValidNumero(MaskEdit3.Text)) and (ValidNumero(MaskEdit2.Text)) then
        begin
          Dm.Join.Sql.Add('AND a.p_auxiliar >= ' + Trim(MaskEdit3.Text));
          Dm.Join.Sql.Add('AND a.p_auxiliar <= ' + Trim(MaskEdit2.Text));
        end;
        Dm.Join.Sql.Add('AND a.natureza = 197');
        Dm.Join.Sql.Add('AND b.situacao = "D"');
        Dm.Join.Sql.Add('AND a.barras = ""');
        Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
        Dm.Join.Open;
        if DM.Join.RecordCount <> 0 then
        Begin
          Application.CreateForm(TQk_ErnA4, Qk_ErnA4);

          if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
             Qk_ErnA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
          else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
             Qk_ErnA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
          else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
             Qk_ErnA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
          else
             Qk_ErnA4.QrImage4.Picture.LoadFromFile('');

          Qk_ErnA4.QuickRep1.Preview;
          Qk_ErnA4.Destroy;
          QK_ErnA4 := NIL;
        end;

        Dm.Join.Close;
        Dm.Join.Sql.Clear;
        Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.p_auxiliar, a.protocolo, a.registro, a.rl, a.data_apuracao,');
        Dm.Join.Sql.Add('a.grupo, a.parcelas, a.contrato, a.val_parc, a.arquivo, a.a_nome, a.produto, a.cota, a.porcentagem,');
        Dm.Join.Sql.Add('a.ven_parc, a.parc2, a.ven_parc2, a.parc3, a.ven_parc3, a.parc4, a.ven_parc4, a.parc5, a.ven_parc5,');
        Dm.Join.Sql.Add('v_cartorio, v_estado, v_ipesp, v_sinoreg, v_tribunal, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('vo_mic, ve_mic, vi_mic, vs_mic, vt_mic, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('a.barras, a.nu_barras, a.especie, a.aceite, a.financeira, a.ag_conta, a.venc_bol, a.dt_mov,');
        Dm.Join.Sql.Add('a.mensa1, a.mensa2, a.mensa3, a.mensa4, a.mensa5, a.nossonum, a.val_parc, a.cedente,');
        Dm.Join.Sql.Add('b.nome, b.situacao, b.endereco, b.bairro, b.cidade, b.estado, b.cep, b.numero, b.complem,');
        Dm.Join.Sql.Add('b.doc1');
        Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
        Dm.Join.Sql.Add('ON (a.data_r = b.data AND a.p_auxiliar = b.p_auxiliar)');
        Dm.Join.Sql.Add('WHERE');
        Dm.Join.Sql.Add('a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
        if (ValidNumero(MaskEdit3.Text)) and (ValidNumero(MaskEdit2.Text)) then
        begin
           Dm.Join.Sql.Add('AND a.p_auxiliar >= ' + Trim(MaskEdit3.Text));
           Dm.Join.Sql.Add('AND a.p_auxiliar <= ' + Trim(MaskEdit2.Text));
        end;
        Dm.Join.Sql.Add('AND a.natureza = 197');
        Dm.Join.Sql.Add('AND b.situacao = "D"');
        Dm.Join.Sql.Add('AND a.barras <> ""');
        Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
        Dm.Join.Open;
        if DM.Join.RecordCount <> 0 then
        begin
           Application.CreateForm(TQk_ErnBA4, Qk_ErnBA4);
           Qk_ErnBA4.QuickRep1.Preview;
           Qk_ErnBA4.Destroy;
           QK_ErnBA4 := NIL;
        end;
     end;
   end;
  Dm.Join.Close;
end;

procedure TF_RAV.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then MaskEdit1.SetFocus;
  if Key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RAV.FormActivate(Sender: TObject);
begin
   MaskEdit1.Text := DatetimetoStr(date);
end;

procedure TF_RAV.BitBtn1Click(Sender: TObject);
begin
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.p_auxiliar, a.protocolo, a.registro, a.rl, a.data_apuracao,');
  Dm.Join.Sql.Add('a.grupo, a.parcelas, a.contrato, a.val_parc, a.arquivo, a.a_nome, a.produto, a.cota, a.porcentagem,');
  Dm.Join.Sql.Add('a.ven_parc, a.parc2, a.ven_parc2, a.parc3, a.ven_parc3, a.parc4, a.ven_parc4, a.parc5, a.ven_parc5,');
  Dm.Join.Sql.Add('a.val_parc, a.val_parc2, a.val_parc3, a.val_parc4, a.val_parc5, a.nr_notific,');
  Dm.Join.Sql.Add('v_cartorio, v_estado, v_ipesp, v_sinoreg, v_tribunal, v_mic, v_conducao, custas,');
  Dm.Join.Sql.Add('vo_mic, ve_mic, vi_mic, vs_mic, vt_mic, v_mic, v_conducao, custas,');
  Dm.Join.Sql.Add('a.barras, a.nu_barras, a.especie, a.aceite, a.financeira, a.ag_conta, a.venc_bol, a.dt_mov,');
  Dm.Join.Sql.Add('a.mensa1, a.mensa2, a.mensa3, a.mensa4, a.mensa5, a.nossonum, a.val_parc, a.cedente,');
  Dm.Join.Sql.Add('a.dt_contr,a.agencia, a.cod_cli,');
  Dm.Join.Sql.Add('b.nome, b.situacao, b.endereco, b.bairro, b.cidade, b.estado, b.cep, b.numero, b.complem,');
  Dm.Join.Sql.Add('b.doc1, b.cxpostal');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
  Dm.Join.Sql.Add('ON (a.data_r = b.data AND a.p_auxiliar = b.p_auxiliar)');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  if (ValidNumero(MaskEdit3.Text)) and (ValidNumero(MaskEdit2.Text)) then
  begin
    Dm.Join.Sql.Add('AND a.p_auxiliar >= ' + Trim(MaskEdit3.Text));
    Dm.Join.Sql.Add('AND a.p_auxiliar <= ' + Trim(MaskEdit2.Text));
  end;
  Dm.Join.Sql.Add('AND a.natureza = 197');
  Dm.Join.Sql.Add('AND b.situacao = "D"');
  Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
  Dm.Join.Open;
  if (Dm.Join.RecordCount = 0) then
  begin
    Dm.Join.Close;
    ShowMessage('Movimento não encontrado !');
    MaskEdit1.SetFocus;
    Exit;
  end;
//  arq := '';
//  arq := TirarTudo(F_Menu.Label1.Caption, ' ','','') + 'IMPNOT';
//  CriaTabela('IMPNOT', arq);
  QRDestroi;
  if (not RadioButton2.Checked) then
  begin
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,4)) = 'MERC') then
    begin
      Application.CreateForm(TQk_Merca, Qk_Merca);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Merca.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Merca.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Merca.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Merca.QrImage2.Picture.LoadFromFile('');

      Qk_Merca.QuickRep1.Print;
      Qk_Merca.Destroy;
      Qk_Merca := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'LID') then
    begin
      Application.CreateForm(TQk_Lider, Qk_Lider);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Lider.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Lider.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Lider.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Lider.QrImage4.Picture.LoadFromFile('');

      Qk_Lider.QuickRep1.Print;
      Qk_Lider.Destroy;
      Qk_Lider := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SIM') then
    begin
      Application.CreateForm(TQk_Sim, Qk_Sim);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Sim.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Sim.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Sim.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Sim.QrImage4.Picture.LoadFromFile('');

      Qk_Sim.QuickRep1.Print;
      Qk_Sim.Destroy;
      Qk_Sim := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SEC') then
    begin
      Application.CreateForm(TQk_Secun, Qk_Secun);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Secun.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Secun.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Secun.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Secun.QrImage3.Picture.LoadFromFile('');

      Qk_Secun.QuickRep1.Print;
      Qk_Secun.Destroy;
      Qk_Secun := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOS')or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOP')or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOT')or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOC') then
    begin
      Application.CreateForm(TQk_WOCos, Qk_WOCos);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_WOCos.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_WOCos.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_WOCos.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_WOCos.QrImage2.Picture.LoadFromFile('');

      Qk_WOCos.QuickRep1.Print;
      Qk_WOCos.Destroy;
      Qk_WOCos := NIL;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SCA') then
    begin
      Application.CreateForm(TQk_Scan, Qk_Scan);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Scan.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Scan.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Scan.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Scan.QrImage2.Picture.LoadFromFile('');

      Qk_Scan.QuickRep1.Print;
      Qk_Scan.Destroy;
      Qk_Scan := NIL;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'ADV') then
    begin
       ImprimeRelAdvA4;
       QK_AdvMorais.QuickRep1.Print;
       Exit;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'EMP') then
    begin
      Application.CreateForm(TQk_Emp, Qk_Emp);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_Emp.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_Emp.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_Emp.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_Emp.QrImage4.Picture.LoadFromFile('');

      Qk_Emp.QuickRep1.Print;
      Qk_Emp.Destroy;
      Qk_Emp := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'ERN') then
     begin
        Dm.Join.Close;
        Dm.Join.Sql.Clear;
        Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.p_auxiliar, a.protocolo, a.registro, a.rl, a.data_apuracao,');
        Dm.Join.Sql.Add('a.grupo, a.parcelas, a.contrato, a.val_parc, a.arquivo, a.a_nome, a.produto, a.cota, a.porcentagem,');
        Dm.Join.Sql.Add('a.ven_parc, a.parc2, a.ven_parc2, a.parc3, a.ven_parc3, a.parc4, a.ven_parc4, a.parc5, a.ven_parc5,');
        Dm.Join.Sql.Add('v_cartorio, v_estado, v_ipesp, v_sinoreg, v_tribunal, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('vo_mic, ve_mic, vi_mic, vs_mic, vt_mic, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('a.barras, a.nu_barras, a.especie, a.aceite, a.financeira, a.ag_conta, a.venc_bol, a.dt_mov,');
        Dm.Join.Sql.Add('a.mensa1, a.mensa2, a.mensa3, a.mensa4, a.mensa5, a.nossonum, a.val_parc, a.cedente, a.agencia,');
        Dm.Join.Sql.Add('b.nome, b.situacao, b.endereco, b.bairro, b.cidade, b.estado, b.cep, b.numero, b.complem,');
        Dm.Join.Sql.Add('b.doc1');
        Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
        Dm.Join.Sql.Add('ON (a.data_r = b.data AND a.p_auxiliar = b.p_auxiliar)');
        Dm.Join.Sql.Add('WHERE');
        Dm.Join.Sql.Add('a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
        if (ValidNumero(MaskEdit3.Text)) and (ValidNumero(MaskEdit2.Text)) then
        begin
          Dm.Join.Sql.Add('AND a.p_auxiliar >= ' + Trim(MaskEdit3.Text));
          Dm.Join.Sql.Add('AND a.p_auxiliar <= ' + Trim(MaskEdit2.Text));
        end;
        Dm.Join.Sql.Add('AND a.natureza = 197');
        Dm.Join.Sql.Add('AND b.situacao = "D"');
        Dm.Join.Sql.Add('AND a.barras = ""');
        Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
        Dm.Join.Open;
        if DM.Join.RecordCount <> 0 then
        Begin
          Application.CreateForm(TQk_Ern, Qk_Ern);

          if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
             Qk_Ern.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
          else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
             Qk_Ern.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
          else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
             Qk_Ern.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
          else
             Qk_Ern.QrImage2.Picture.LoadFromFile('');

          Qk_Ern.QuickRep1.Print;
          Qk_Ern.Destroy;
          QK_Ern := NIL;
        end;

        Dm.Join.Close;
        Dm.Join.Sql.Clear;
        Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.p_auxiliar, a.protocolo, a.registro, a.rl, a.data_apuracao,');
        Dm.Join.Sql.Add('a.grupo, a.parcelas, a.contrato, a.val_parc, a.arquivo, a.a_nome, a.produto, a.cota, a.porcentagem,');
        Dm.Join.Sql.Add('a.ven_parc, a.parc2, a.ven_parc2, a.parc3, a.ven_parc3, a.parc4, a.ven_parc4, a.parc5, a.ven_parc5,');
        Dm.Join.Sql.Add('v_cartorio, v_estado, v_ipesp, v_sinoreg, v_tribunal, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('vo_mic, ve_mic, vi_mic, vs_mic, vt_mic, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('a.barras, a.nu_barras, a.especie, a.aceite, a.financeira, a.ag_conta, a.venc_bol, a.dt_mov,');
        Dm.Join.Sql.Add('a.mensa1, a.mensa2, a.mensa3, a.mensa4, a.mensa5, a.nossonum, a.val_parc, a.cedente,');
        Dm.Join.Sql.Add('b.nome, b.situacao, b.endereco, b.bairro, b.cidade, b.estado, b.cep, b.numero, b.complem,');
        Dm.Join.Sql.Add('b.doc1');
        Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
        Dm.Join.Sql.Add('ON (a.data_r = b.data AND a.p_auxiliar = b.p_auxiliar)');
        Dm.Join.Sql.Add('WHERE');
        Dm.Join.Sql.Add('a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
        if (ValidNumero(MaskEdit3.Text)) and (ValidNumero(MaskEdit2.Text)) then
        begin
          Dm.Join.Sql.Add('AND a.p_auxiliar >= ' + Trim(MaskEdit3.Text));
          Dm.Join.Sql.Add('AND a.p_auxiliar <= ' + Trim(MaskEdit2.Text));
        end;
        Dm.Join.Sql.Add('AND a.natureza = 197');
        Dm.Join.Sql.Add('AND b.situacao = "D"');
        Dm.Join.Sql.Add('AND a.barras <> ""');
        Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
        Dm.Join.Open;
        if DM.Join.RecordCount <> 0 then
        Begin
         Application.CreateForm(TQk_ErnB, Qk_ErnB);
         Qk_ErnB.QuickRep1.Print;
         Qk_ErnB.Destroy;
         QK_ErnB := NIL;
        end;
     end;
  end
  else
  begin
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,4)) = 'MERC') then
    begin
      Application.CreateForm(TQk_MercA4, Qk_MercA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_MercA4.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_MercA4.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_MercA4.QrImage2.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_MercA4.QrImage2.Picture.LoadFromFile('');

      Qk_MercA4.QuickRep1.Print;
      Qk_MercA4.Destroy;
      Qk_MercA4 := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'LID') then
    begin
      Application.CreateForm(TQk_LidA4, Qk_LidA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_LidA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_LidA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_LidA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_LidA4.QrImage4.Picture.LoadFromFile('');

      Qk_LidA4.QuickRep1.Print;
      Qk_LidA4.Destroy;
      Qk_LidA4 := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SIM') then
    begin
      Application.CreateForm(TQk_SimA4, Qk_SimA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_SimA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_SimA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_SimA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_SimA4.QrImage4.Picture.LoadFromFile('');

      Qk_SimA4.QuickRep1.Print;
      Qk_SimA4.Destroy;
      Qk_SimA4 := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SEC') then
    begin
      Application.CreateForm(TQk_SecA4, Qk_SecA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_SecA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_SecA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_SecA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_SecA4.QrImage4.Picture.LoadFromFile('');

      Qk_SecA4.QuickRep1.Print;
      Qk_SecA4.Destroy;
      Qk_SecA4 := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOS')or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOP')or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOT')or
       (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'WOC') then
    begin
      Application.CreateForm(TQk_WocA4, Qk_WocA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_WocA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_WocA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_WocA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_WocA4.QrImage4.Picture.LoadFromFile('');

      Qk_Secun.QuickRep1.Preview;
      Qk_Secun.Destroy;
      Qk_WocA4 := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'SCA') then
    begin
      Application.CreateForm(TQk_ScaA4, Qk_ScaA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_ScaA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_ScaA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_ScaA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_ScaA4.QrImage4.Picture.LoadFromFile('');

      Qk_ScaA4.QuickRep1.Preview;
      Qk_ScaA4.Destroy;
      Qk_ScaA4 := NIL;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'ADV') then
    begin
       ImprimeRelAdv;
       QK_AdvMorais.QuickRep1.Print;
       Exit;
    end;

    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'EMP') then
    begin
      Application.CreateForm(TQk_EmpA4, Qk_EmpA4);

      if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
         Qk_EmpA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
         Qk_EmpA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
      else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
         Qk_EmpA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
      else
         Qk_EmpA4.QrImage4.Picture.LoadFromFile('');

      Qk_EmpA4.QuickRep1.Print;
      Qk_EmpA4.Destroy;
      Qk_EmpA4 := NIL;
    end;
    if (Maiusculo(Copy(Dm.Join.FieldByName('arquivo').asString, 1,3)) = 'ERN') then
    begin
        Dm.Join.Close;
        Dm.Join.Sql.Clear;
        Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.p_auxiliar, a.protocolo, a.registro, a.rl, a.data_apuracao,');
        Dm.Join.Sql.Add('a.grupo, a.parcelas, a.contrato, a.val_parc, a.arquivo, a.a_nome, a.produto, a.cota, a.porcentagem,');
        Dm.Join.Sql.Add('a.ven_parc, a.parc2, a.ven_parc2, a.parc3, a.ven_parc3, a.parc4, a.ven_parc4, a.parc5, a.ven_parc5,');
        Dm.Join.Sql.Add('v_cartorio, v_estado, v_ipesp, v_sinoreg, v_tribunal, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('vo_mic, ve_mic, vi_mic, vs_mic, vt_mic, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('a.barras, a.nu_barras, a.especie, a.aceite, a.financeira, a.ag_conta, a.venc_bol, a.dt_mov,');
        Dm.Join.Sql.Add('a.mensa1, a.mensa2, a.mensa3, a.mensa4, a.mensa5, a.nossonum, a.val_parc, a.cedente,');
        Dm.Join.Sql.Add('b.nome, b.situacao, b.endereco, b.bairro, b.cidade, b.estado, b.cep, b.numero, b.complem,');
        Dm.Join.Sql.Add('b.doc1');
        Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
        Dm.Join.Sql.Add('ON (a.data_r = b.data AND a.p_auxiliar = b.p_auxiliar)');
        Dm.Join.Sql.Add('WHERE');
        Dm.Join.Sql.Add('a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
        if (ValidNumero(MaskEdit3.Text)) and (ValidNumero(MaskEdit2.Text)) then
        begin
          Dm.Join.Sql.Add('AND a.p_auxiliar >= ' + Trim(MaskEdit3.Text));
          Dm.Join.Sql.Add('AND a.p_auxiliar <= ' + Trim(MaskEdit2.Text));
        end;
        Dm.Join.Sql.Add('AND a.natureza = 197');
        Dm.Join.Sql.Add('AND b.situacao = "D"');
        Dm.Join.Sql.Add('AND a.barras = ""');
        Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
        Dm.Join.Open;
        if DM.Join.RecordCount <> 0 then
        Begin
          Application.CreateForm(TQk_ErnA4, Qk_ErnA4);

          if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
             Qk_ErnA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
          else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
             Qk_ErnA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
          else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
             Qk_ErnA4.QrImage4.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
          else
             Qk_ErnA4.QrImage4.Picture.LoadFromFile('');

          Qk_ErnA4.QuickRep1.Print;
          Qk_ErnA4.Destroy;
          QK_ErnA4 := NIL;
        end;

        Dm.Join.Close;
        Dm.Join.Sql.Clear;
        Dm.Join.Sql.Add('SELECT a.data_r, a.data_p, a.p_auxiliar, a.protocolo, a.registro, a.rl, a.data_apuracao,');
        Dm.Join.Sql.Add('a.grupo, a.parcelas, a.contrato, a.val_parc, a.arquivo, a.a_nome, a.produto, a.cota, a.porcentagem,');
        Dm.Join.Sql.Add('a.ven_parc, a.parc2, a.ven_parc2, a.parc3, a.ven_parc3, a.parc4, a.ven_parc4, a.parc5, a.ven_parc5,');
        Dm.Join.Sql.Add('v_cartorio, v_estado, v_ipesp, v_sinoreg, v_tribunal, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('vo_mic, ve_mic, vi_mic, vs_mic, vt_mic, v_mic, v_conducao, custas,');
        Dm.Join.Sql.Add('a.barras, a.nu_barras, a.especie, a.aceite, a.financeira, a.ag_conta, a.venc_bol, a.dt_mov,');
        Dm.Join.Sql.Add('a.mensa1, a.mensa2, a.mensa3, a.mensa4, a.mensa5, a.nossonum, a.val_parc, a.cedente,');
        Dm.Join.Sql.Add('b.nome, b.situacao, b.endereco, b.bairro, b.cidade, b.estado, b.cep, b.numero, b.complem,');
        Dm.Join.Sql.Add('b.doc1');
        Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
        Dm.Join.Sql.Add('ON (a.data_r = b.data AND a.p_auxiliar = b.p_auxiliar)');
        Dm.Join.Sql.Add('WHERE');
        Dm.Join.Sql.Add('a.data_p = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
        if (ValidNumero(MaskEdit3.Text)) and (ValidNumero(MaskEdit2.Text)) then
        begin
          Dm.Join.Sql.Add('AND a.p_auxiliar >= ' + Trim(MaskEdit3.Text));
          Dm.Join.Sql.Add('AND a.p_auxiliar <= ' + Trim(MaskEdit2.Text));
        end;
        Dm.Join.Sql.Add('AND a.natureza = 197');
        Dm.Join.Sql.Add('AND b.situacao = "D"');
        Dm.Join.Sql.Add('AND a.barras <> ""');
        Dm.Join.Sql.Add('ORDER BY a.p_auxiliar');
        Dm.Join.Open;
        if DM.Join.RecordCount <> 0 then
        Begin
         Application.CreateForm(TQk_ErnBA4, Qk_ErnBA4);
         Qk_ErnBA4.QuickRep1.Print;
         Qk_ErnBA4.Destroy;
         QK_ErnBA4 := NIL;
        end;
     end;
   end;
  Dm.Join.Close;
end;

procedure TF_RAV.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then BitBtn4.SetFocus;
end;

procedure TF_RAV.ImprimeRelAdv;
begin
   DM.Join.Close;
   DM.Join.Sql.Clear;
   DM.Join.Sql.Add('SELECT t.registro   ');
   DM.Join.Sql.Add(', t.data_r          ');
   DM.Join.Sql.Add(', t.p_auxiliar      ');
   DM.Join.Sql.Add(', t.protocolo       ');
   DM.Join.Sql.Add(', t.rl              ');
   DM.Join.Sql.Add(', t.a_nome          ');
   DM.Join.Sql.Add(', tp.nome           ');
	 DM.Join.Sql.Add(',	t.contrato        ');
	 DM.Join.Sql.Add(',	tp.endereco       ');
   DM.Join.Sql.Add(', tp.numero         ');
   DM.Join.Sql.Add(', tp.complem        ');
	 DM.Join.Sql.Add(',	tp.bairro         ');
	 DM.Join.Sql.Add(',	tp.cidade         ');
	 DM.Join.Sql.Add(',	tp.estado         ');
	 DM.Join.Sql.Add(',	tp.cep            ');
	 DM.Join.Sql.Add(',	t.ven_parc2       ');
	 DM.Join.Sql.Add(',	t.ven_parc3       ');
	 DM.Join.Sql.Add(',	t.ven_parc4       ');
	 DM.Join.Sql.Add(',	t.ven_parc5       ');
	 DM.Join.Sql.Add(',	t.ven_parc6       ');
	 DM.Join.Sql.Add(',	t.ven_parc7       ');
	 DM.Join.Sql.Add(',	t.ven_parc8       ');
	 DM.Join.Sql.Add(',	t.ven_parc9       ');
	 DM.Join.Sql.Add(',	t.ven_parc10      ');
	 DM.Join.Sql.Add(',	t.ven_parc11      ');
   DM.Join.Sql.Add(',	t.ven_parc12      ');
   DM.Join.Sql.Add(',	t.ven_parc13      ');
   DM.Join.Sql.Add(',	t.ven_parc14      ');
   DM.Join.Sql.Add(',	t.ven_parc15      ');
   DM.Join.Sql.Add(',	t.ven_parc16      ');
   DM.Join.Sql.Add(',	t.ven_parc17      ');
	 DM.Join.Sql.Add(',	t.val_parc2       ');
	 DM.Join.Sql.Add(',	t.val_parc3       ');
	 DM.Join.Sql.Add(',	t.val_parc4       ');
	 DM.Join.Sql.Add(',	t.val_parc5       ');
	 DM.Join.Sql.Add(',	t.val_parc6       ');
	 DM.Join.Sql.Add(',	t.val_parc7       ');
	 DM.Join.Sql.Add(',	t.val_parc8       ');
	 DM.Join.Sql.Add(',	t.val_parc9       ');
	 DM.Join.Sql.Add(',	t.val_parc10      ');
	 DM.Join.Sql.Add(',	t.val_parc11      ');
   DM.Join.Sql.Add(',	t.val_parc12      ');
   DM.Join.Sql.Add(',	t.val_parc13      ');
   DM.Join.Sql.Add(',	t.val_parc14      ');
   DM.Join.Sql.Add(',	t.val_parc15      ');
   DM.Join.Sql.Add(',	t.val_parc16      ');
   DM.Join.Sql.Add(',	t.val_parc17      ');
	 DM.Join.Sql.Add(',	t.tot_parcela     ');
   DM.Join.Sql.Add(',	t.custas          ');
   DM.Join.Sql.Add(',	t.v_cartorio      ');
   DM.Join.Sql.Add(',	t.v_tribunal      ');
   DM.Join.Sql.Add(',	t.v_ipesp         ');
   DM.Join.Sql.Add(',	t.v_estado        ');
   DM.Join.Sql.Add(',	t.v_sinoreg       ');
   DM.Join.Sql.Add(',	t.v_conducao      ');
   DM.Join.Sql.Add(',	t.vo_mic          ');
   DM.Join.Sql.Add(',	t.ve_mic          ');
   DM.Join.Sql.Add(',	t.vi_mic          ');
   DM.Join.Sql.Add(',	t.vs_mic          ');
   DM.Join.Sql.Add(',	t.vt_mic          ');
   DM.Join.Sql.Add('FROM                ');
	 DM.Join.Sql.Add('		td t inner join td_pesso tp on (t.p_auxiliar = tp.p_auxiliar) ');
   DM.Join.Sql.Add('WHERE tp.situacao      = ''D'' ');
	 DM.Join.Sql.Add('   		AND t.data_r     = ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit1.Text))));
   DM.Join.Sql.Add('      AND t.p_auxiliar BETWEEN ' + Trim(MaskEdit3.Text) + ' AND ' + Trim(MaskEdit2.Text));
   DM.Join.Open;
   DM.Join.First;

   if (DM.Join.RecordCount = 0) then
   begin
      DM.Join.Close;
      Application.MessageBox('Movimento não encontrado !', 'Atenção', MB_OK + MB_ICONINFORMATION);
      Exit;
   end;
   QK_AdvMorais := TQK_AdvMorais.Create(Application);

   if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
      QK_AdvMorais.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
   else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
      QK_AdvMorais.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
   else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
      QK_AdvMorais.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
   else
      QK_AdvMorais.QrImage3.Picture.LoadFromFile('');

   QK_AdvMorais.QuickRep1.DataSet := DM.Join;
end;

procedure TF_RAV.ImprimeRelAdvA4;
begin
   DM.Join.Close;
   DM.Join.Sql.Clear;
   DM.Join.Sql.Add('SELECT t.registro   ');
   DM.Join.Sql.Add(', t.data_r          ');
   DM.Join.Sql.Add(', t.p_auxiliar      ');
   DM.Join.Sql.Add(', t.protocolo       ');
   DM.Join.Sql.Add(', t.rl              ');
   DM.Join.Sql.Add(', t.a_nome          ');
   DM.Join.Sql.Add(', tp.nome           ');
	 DM.Join.Sql.Add(',	t.contrato        ');
	 DM.Join.Sql.Add(',	tp.endereco       ');
   DM.Join.Sql.Add(', tp.numero         ');
   DM.Join.Sql.Add(', tp.complem        ');
	 DM.Join.Sql.Add(',	tp.bairro         ');
	 DM.Join.Sql.Add(',	tp.cidade         ');
	 DM.Join.Sql.Add(',	tp.estado         ');
	 DM.Join.Sql.Add(',	tp.cep            ');
	 DM.Join.Sql.Add(',	t.ven_parc2       ');
	 DM.Join.Sql.Add(',	t.ven_parc3       ');
	 DM.Join.Sql.Add(',	t.ven_parc4       ');
	 DM.Join.Sql.Add(',	t.ven_parc5       ');
	 DM.Join.Sql.Add(',	t.ven_parc6       ');
	 DM.Join.Sql.Add(',	t.ven_parc7       ');
	 DM.Join.Sql.Add(',	t.ven_parc8       ');
	 DM.Join.Sql.Add(',	t.ven_parc9       ');
	 DM.Join.Sql.Add(',	t.ven_parc10      ');
	 DM.Join.Sql.Add(',	t.ven_parc11      ');
   DM.Join.Sql.Add(',	t.ven_parc12      ');
   DM.Join.Sql.Add(',	t.ven_parc13      ');
   DM.Join.Sql.Add(',	t.ven_parc14      ');
   DM.Join.Sql.Add(',	t.ven_parc15      ');
   DM.Join.Sql.Add(',	t.ven_parc16      ');
   DM.Join.Sql.Add(',	t.ven_parc17      ');
	 DM.Join.Sql.Add(',	t.val_parc2       ');
	 DM.Join.Sql.Add(',	t.val_parc3       ');
	 DM.Join.Sql.Add(',	t.val_parc4       ');
	 DM.Join.Sql.Add(',	t.val_parc5       ');
	 DM.Join.Sql.Add(',	t.val_parc6       ');
	 DM.Join.Sql.Add(',	t.val_parc7       ');
	 DM.Join.Sql.Add(',	t.val_parc8       ');
	 DM.Join.Sql.Add(',	t.val_parc9       ');
	 DM.Join.Sql.Add(',	t.val_parc10      ');
	 DM.Join.Sql.Add(',	t.val_parc11      ');
   DM.Join.Sql.Add(',	t.val_parc12      ');
   DM.Join.Sql.Add(',	t.val_parc13      ');
   DM.Join.Sql.Add(',	t.val_parc14      ');
   DM.Join.Sql.Add(',	t.val_parc15      ');
   DM.Join.Sql.Add(',	t.val_parc16      ');
   DM.Join.Sql.Add(',	t.val_parc17      ');
	 DM.Join.Sql.Add(',	t.tot_parcela     ');
   DM.Join.Sql.Add(',	t.custas          ');
   DM.Join.Sql.Add(',	t.v_cartorio      ');
   DM.Join.Sql.Add(',	t.v_tribunal      ');
   DM.Join.Sql.Add(',	t.v_ipesp         ');
   DM.Join.Sql.Add(',	t.v_estado        ');
   DM.Join.Sql.Add(',	t.v_sinoreg       ');
   DM.Join.Sql.Add(',	t.v_conducao      ');
   DM.Join.Sql.Add(',	t.vo_mic          ');
   DM.Join.Sql.Add(',	t.ve_mic          ');
   DM.Join.Sql.Add(',	t.vi_mic          ');
   DM.Join.Sql.Add(',	t.vs_mic          ');
   DM.Join.Sql.Add(',	t.vt_mic          ');
   DM.Join.Sql.Add('FROM                ');
	 DM.Join.Sql.Add('		td t inner join td_pesso tp on (t.p_auxiliar = tp.p_auxiliar) ');
   DM.Join.Sql.Add('WHERE tp.situacao      = ''D'' ');
	 DM.Join.Sql.Add('   		AND t.data_r     = ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit1.Text))));
   DM.Join.Sql.Add('      AND t.p_auxiliar BETWEEN ' + Trim(MaskEdit3.Text) + ' AND ' + Trim(MaskEdit2.Text));
   DM.Join.Open;
   DM.Join.First;

   if (DM.Join.RecordCount = 0) then
   begin
      DM.Join.Close;
      Application.MessageBox('Movimento não encontrado !', 'Atenção', MB_OK + MB_ICONINFORMATION);
      Exit;
   end;
   QK_AdvMoraisA4 := TQK_AdvMoraisA4.Create(Application);

   if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
      QK_AdvMoraisA4.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
   else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
      QK_AdvMoraisA4.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
   else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
      QK_AdvMoraisA4.QrImage3.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
   else
      QK_AdvMoraisA4.QrImage3.Picture.LoadFromFile('');

   QK_AdvMoraisA4.QuickRep1.DataSet := DM.Join;
end;

end.



