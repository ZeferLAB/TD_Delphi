unit RelNot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask;

type
  TF_RelNot = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    ComboBox1: TComboBox;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CheckBox3: TCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    Procedure Carrega_Movimento(Sender : TOBject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RelNot  : TF_RelNot;
  arq       : String;

implementation

uses Menu, DMTD, QkRelNot, QkRecFat, AuxRFat, QkFatDet, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_RelNot.Carrega_Movimento(Sender : TOBject);
var
  dtp : TDate;
  emp, age : String;
  protini, protfim : String;
  val_uni, val_tot : Currency;
  qde, num : Integer;
begin
  num := 0;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '', '') + 'RECFAT';
  CriaTabela('RECFAT', arq);
  while (not Dm.ArqAux.Eof) do
  begin
    num     := num + 1;
    protini := '';
    protfim := '';
    val_uni := 0.00;
    val_tot := 0.00;
    dtp := 0;
    qde := 0;
    emp := '';
    age := '';
    dtp := Dm.ArqAux.FieldByName('data_p').asDateTime;
    emp := Dm.ArqAux.FieldByName('a_nome').asString;
    age := Dm.ArqAux.FieldByName('agencia').asString;
    while (not Dm.ArqAux.Eof) AND
          (Trim(Dm.ArqAux.FieldByName('a_nome').asString)  = emp) AND
          (Trim(Dm.ArqAux.FieldByName('agencia').asString) = age) AND
          (Dm.ArqAux.FieldByName('data_p').asDateTime = dtp)      do
    begin
      qde     := 0;
      val_uni := 0.00;
      val_tot := 0.00;
      while (not Dm.ArqAux.Eof) AND
            (Dm.ArqAux.FieldByName('data_p').asDateTime = dtp)      do
      begin
        qde     := qde + 1;
        val_uni := Dm.ArqAux.FieldByName('custas').asCurrency;
        val_tot := val_tot + Dm.ArqAux.FieldByName('custas').asCurrency;
        if (Trim(protini) = '') then protini := Dm.ArqAux.FieldByName('protocolo').asString;
        protfim := Dm.ArqAux.FieldByName('protocolo').asString;
        Dm.ArqAux.Next;
      end;
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('INSERT INTO ' + arq);
      Dm.ArqAux1.Sql.Add('(indexador, empresa, protocolos, recepcao, quantidade, valor_uni, despesa, total)');
      Dm.ArqAux1.Sql.Add('Values(');
      Dm.ArqAux1.Sql.Add(IntToStr(num) + ',');
      if (Trim(age) <> '') then
      begin
        Dm.ArqAux1.Sql.Add(Chr(39) + emp + ' - ' + age + Chr(39) + ',');
      end
      else Dm.ArqAux1.Sql.Add(Chr(39) + emp + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + protini + ' - ' + protfim + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(Chr(39) + DateToStr(dtp) + Chr(39) + ',');
      Dm.ArqAux1.Sql.Add(IntToStr(qde) + ',');
      Dm.ArqAux1.Sql.Add(StrCurrPesq(val_uni) + ',');
      Dm.ArqAux1.Sql.Add('0.00,');
      Dm.ArqAux1.Sql.Add(StrCurrPesq(val_tot) + ')');
      Dm.ArqAux1.ExecSql;
      
      dtp := Dm.ArqAux.FieldByName('data_p').asDateTime;
      emp := Dm.ArqAux.FieldByName('a_nome').asString;
      age := Dm.ArqAux.FieldByName('agencia').asString;
      protini := '';
    end;
  end;
end;

procedure TF_RelNot.BitBtn3Click(Sender: TObject);
begin
 Close;
end;

procedure TF_RelNot.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_RelNot.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RelNot.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_RelNot.BitBtn1Click(Sender: TObject);
 var
 cliente : String;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  if ((not CheckBox2.Checked) and (not CheckBox3.Checked)) then
  begin
    Dm.ArqAux.Sql.Add('SELECT a_nome, a.protocolo, a.p_auxiliar, a.data_p, agencia, ncliente, COUNT(*) qde, SUM(v_cartorio+vo_mic) oficial, SUM(custas) valor');
  end
  else Dm.ArqAux.Sql.Add('SELECT a.a_nome, a.protocolo, a.p_auxiliar, a.data_p, a.data_r, a.agencia, a.ncliente, a.custas, a.contrato, b.nome');
 // Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('FROM td a INNER JOIN td_pesso b');
  Dm.ArqAux.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('a.data_r >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('AND a.data_r <= ' + Chr(39) + ConvData(MaskEdit4.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('AND (a.protocolo < 77419 or a.protocolo > 77461)');
  Dm.ArqAux.Sql.Add('AND (a.protocolo <> 77530 and a.protocolo <> 77532 and a.protocolo <> 77533');
  Dm.ArqAux.Sql.Add('AND  a.protocolo <> 77536 and a.protocolo <> 77541 and a.protocolo <> 77542');
  Dm.ArqAux.Sql.Add('AND  a.protocolo <> 77517 and a.protocolo <> 77520 and a.protocolo <> 77522');
  Dm.ArqAux.Sql.Add('AND  a.protocolo <> 77523 and a.protocolo <> 77526 and a.protocolo <> 77527');
  Dm.ArqAux.Sql.Add('AND  a.protocolo <> 77528 and a.protocolo <> 77605 and a.protocolo <> 77592');
  Dm.ArqAux.Sql.Add('AND  a.protocolo <> 77593 and a.protocolo <> 77595 and a.protocolo <> 77598');
  Dm.ArqAux.Sql.Add('AND  a.protocolo <> 77599 and a.protocolo <> 77600 and a.protocolo <> 77604');
  Dm.ArqAux.Sql.Add('AND  a.protocolo <> 77543 and a.protocolo <> 77544 and a.protocolo <> 77565)');
  Dm.ArqAux.Sql.Add('AND  a.ncliente = ' + IntToStr(StrToInt(Trim(Copy(ComboBox1.Text, 1,3)))));
  Dm.ArqAux.Sql.Add('AND (a.natureza = 197 or a.natureza = 96)');
  Dm.ArqAux.Sql.Add('AND b.situacao = "D"');
  if (StrToInt(MaskEdit2.Text) > 0) AND (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.ArqAux.Sql.Add('AND a.protocolo >= ' + Trim(MaskEdit2.Text));
    Dm.ArqAux.Sql.Add('AND a.protocolo <= ' + Trim(MaskEdit3.Text));
  end;
  if ((not CheckBox2.Checked) AND (not CheckBox3.Checked))  then
  begin
    Dm.ArqAux.Sql.Add('GROUP BY a.a_nome, a.agencia, a.ncliente');
    Dm.ArqAux.Sql.Add('ORDER BY a.a_nome, a.agencia');
  end
  else Dm.ArqAux.Sql.Add('ORDER BY a.a_nome, a.agencia, a.data_p, a.protocolo');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
   // Dm.ArqAux.RequestLive := False;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;

  if (CheckBox3.Checked) then  //Impressão da Fatura Detalhada
   begin
    Application.CreateForm(TQk_FatDet, Qk_FatDet);
    Qk_FatDet.QrLabel1.Caption  := F_Menu.Label30.Caption;
    Qk_FatDet.QrLabel25.Caption := F_Menu.Label11.Caption;
    Qk_FatDet.QrLabel26.Caption := 'CNPJ 05.668.377/0001-37';
    //Qk_FatDet.QrLabel2.Caption  := F_Menu.Label11.Caption;
    Qk_FatDet.QrLabel13.Caption := 'Fatura do Mês de ' + Trim(Ver_Mes(Copy(MaskEdit1.Text, 4,2))) + ' do ano de ' + Copy(MaskEdit1.Text, 7,4);
    Qk_FatDet.QrLabel14.Caption := 'Vencimento: ' + Label7.Caption;
    Qk_FatDet.QrLabel16.Caption := Label6.Caption;
    Qk_FatDet.QrLabel18.Caption := Label8.Caption;
    Qk_FatDet.QrLabel11.Caption := F_Menu.Label5.Caption + ' - ' + F_Menu.Label13.Caption;
    Qk_FatDet.QuickRep1.Preview;
    Qk_FatDet.Destroy;
    Qk_FatDet := NIL;

    QrDestroi;
    if (MessageBox(Handle, PChar('Confirma o NÚMERO DA FATURA?'), 'CONFIRMA/FATURA', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    Begin
     cliente := '';
     cliente := InttoStr(StrtoInt(copy(F_RelNot.combobox1.text,1,3)));
     DM.ArqAux.Close;
     DM.ArqAux.Sql.Clear;
     DM.ArqAux.Sql.Add('update escrit set fatura = fatura + 1 where ncliente = ' + cliente);
     DM.ArqAux.ExecSql; 
     if DM.ArqAux.RowsAffected = 0 then Showmessage('Problemas para atualizar o número de fatura');
    end; 
   end
  else
  if (not CheckBox2.Checked) then
  begin
    Application.CreateForm(TQk_RelNot, Qk_RelNot);
    Qk_RelNot.QrLabel1.Caption  := F_Menu.Caption;
    Qk_RelNot.QrLabel12.Caption := F_Menu.Label11.Caption;
    Qk_RelNot.QrLabel13.Caption := 'CNPJ 05.668.377/0001-37';

    if (StrToDate(MaskEdit1.Text) = StrToDate(MaskEdit4.Text)) then
    begin
      Qk_RelNot.QrLabel2.Caption := 'RELATÓRIO DE NOTIFICAÇÕES RECEPCIONADAS EM ' + MaskEdit1.Text + '.';
    end
    else Qk_RelNot.QrLabel2.Caption := 'RELATÓRIO DE NOTIFICAÇÕES RECEPCIONADAS EM ' + MaskEdit1.Text + ' ATÉ ' + MaskEdit4.Text + '.';
    if (CheckBox1.Checked) then
    begin
      Qk_RelNot.QrLabel10.Enabled := True;
      Qk_RelNot.QrDbText5.Enabled := True;
      Qk_RelNot.QrLabel11.Enabled := True;
      Qk_RelNot.QrShape8.Enabled  := True;
      Qk_RelNot.QrShape9.Enabled  := True;
      Qk_RelNot.QrShape10.Enabled := True;
    end;
    Qk_RelNot.QuickRep1.Preview;
    Qk_RelNot.Destroy;
    Qk_RelNot := NIL;
  end
  else
  begin
    Carrega_Movimento(F_RelNot);
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
    Dm.ArqAux.Sql.Add('ORDER BY recno');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      ShowMessage('Movimento não localizado !');    
      Dm.ArqAux.Close;
      DestroeTabela(arq);
      Exit;
    end;
  //  if (CheckBox2.Checked) then    //Impressão da Fatura
 //    begin
      Application.CreateForm(TQk_RecFat, Qk_RecFat);
      Qk_RecFat.QrLabel1.Caption  := F_Menu.Label30.Caption;
      Qk_RecFat.QrLabel25.Caption := F_Menu.Label11.Caption;
      Qk_RecFat.QrLabel26.Caption := 'CNPJ 05.668.377/0001-37';
      //Qk_RecFat.QrLabel2.Caption  := F_Menu.Label11.Caption;
      Qk_RecFat.QrLabel13.Caption := 'Fatura do Mês de ' + Trim(Ver_Mes(Copy(MaskEdit1.Text, 4,2))) + ' do ano de ' + Copy(MaskEdit1.Text, 7,4);
      Qk_RecFat.QrLabel14.Caption := 'Vencimento: ' + Label7.Caption;
      Qk_RecFat.QrLabel16.Caption := Label6.Caption;
      Qk_RecFat.QrLabel18.Caption := Label8.Caption;
      Qk_RecFat.QrLabel11.Caption := F_Menu.Label5.Caption + ' - ' + F_Menu.Label13.Caption;
      Qk_RecFat.QuickRep1.Preview;
      Qk_RecFat.Destroy;
      Qk_RecFat := NIL;
  //   end;



    QrDestroi;
    DestroeTabela(arq);
    if (MessageBox(Handle, PChar('Confirma o NÚMERO DA FATURA?'), 'CONFIRMA/FATURA', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    Begin
     cliente := '';
     cliente := InttoStr(StrtoInt(copy(F_RelNot.combobox1.text,1,3)));
     DM.ArqAux.Close;
     DM.ArqAux.Sql.Clear;
     DM.ArqAux.Sql.Add('update escrit set fatura = fatura + 1 where ncliente = ' + cliente);
     DM.ArqAux.ExecSql;
     if DM.ArqAux.RowsAffected = 0 then Showmessage('Problemas para atualizar o número de fatura');
    end;      
  end;
  Dm.ArqAux.Close;
  //Dm.ArqAux.RequestLive := False;
end;

procedure TF_RelNot.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  MaskEdit3.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit1.SetFocus;
end;

procedure TF_RelNot.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RelNot.MaskEdit2Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit2.Text)) then MaskEdit2.Text := '0';
end;

procedure TF_RelNot.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure TF_RelNot.ComboBox1Enter(Sender: TObject);
begin
  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RelNot.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    if (not ValidData(MaskEdit1.Text)) then
    begin
      ShowMessage('Data inválida ');
      MaskEdit1.SetFocus;
      Exit;
    end;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT ncliente FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    data_r >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux.Sql.add('AND data_r <= ' + Chr(39) + ConvData(MaskEdit4.Text) + Chr(39));
    Dm.ArqAux.Sql.Add('GROUP BY ncliente');
    Dm.ArqAux.Sql.Add('ORDER BY ncliente');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      Dm.ArqAux.Close;
      ShowMessage('Movimento não encontrado !');
      Exit;
    end;
    ComboBox1.Clear;
    while (not Dm.ArqAux.Eof) do
    begin
      ComboBox1.Items.Add(StrZero(Dm.ArqAux.FieldByName('ncliente').asString, 3) + ' - ' + BuscaNomeEmpresa(Dm.ArqAux.FieldByName('ncliente').asString, False));
      Dm.ArqAux.Next;
    end;
    Dm.ArqAux.Close;
    ComboBox1.SetFocus;
  end;
end;

procedure TF_RelNot.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit4.Text := MaskEdit1.Text;
end;

procedure TF_RelNot.CheckBox2Click(Sender: TObject);
begin
  if (CheckBox2.Checked)  then
  begin
    Label6.Caption := '';
    Label7.Caption := '';
    Label8.Caption := '';
    Application.CreateForm(TF_AuxRFat, F_AuxRFat);
    F_AuxRFat.ShowModal;
    Label6.Caption := F_AuxRFat.MaskEdit1.Text;
    Label7.Caption := F_AuxRFat.MaskEdit2.Text;
    Label8.Caption := F_AuxRFat.MaskEdit3.Text;
    F_AuxRFat.Destroy;
    F_AuxRFat := NIL;
    BitBtn1.SetFocus;
  end;
end;

procedure TF_RelNot.CheckBox3Click(Sender: TObject);
begin
 if (CheckBox3.Checked)  then
  begin
    Label6.Caption := '';
    Label7.Caption := '';
    Label8.Caption := '';
    Application.CreateForm(TF_AuxRFat, F_AuxRFat);
    F_AuxRFat.ShowModal;
    Label6.Caption := F_AuxRFat.MaskEdit1.Text;
    Label7.Caption := F_AuxRFat.MaskEdit2.Text;
    Label8.Caption := F_AuxRFat.MaskEdit3.Text;
    F_AuxRFat.Destroy;
    F_AuxRFat := NIL;
    BitBtn1.SetFocus;
  end;
end;

end.


