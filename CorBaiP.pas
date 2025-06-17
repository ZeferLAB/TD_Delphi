unit CorBaiP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, ToolEdit, CurrEdit, DBCtrls, Menus,
  Grids, DBGrids, ComCtrls;

type
  TF_CorBaiP = class(TForm)
    Panel1: TPanel;
    Label8: TLabel;
    MaskEdit8: TMaskEdit;
    BitBtn3: TBitBtn;
    Label24: TLabel;
    DBText1: TDBText;
    MaskEdit15: TMaskEdit;
    ComboBox1: TComboBox;
    Label21: TLabel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    ComboBox2: TComboBox;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    MaskEdit7: TMaskEdit;
    ComboBox3: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    BitBtn1: TBitBtn;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    PopupMenu1: TPopupMenu;
    Corrigir1: TMenuItem;
    Excluir1: TMenuItem;
    DBGrid1: TDBGrid;
    Label19: TLabel;
    Label20: TLabel;
    MaskEdit12: TMaskEdit;
    Label22: TLabel;
    Label23: TLabel;
    MaskEdit14: TMaskEdit;
    ComboBox4: TComboBox;
    Label25: TLabel;
    Label27: TLabel;
    StatusBar1: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Corrigir1Click(Sender: TObject);
    Procedure BuscaTextoCombo(Sender : TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit14Exit(Sender: TObject);
    procedure MaskEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4Enter(Sender: TObject);
    procedure ComboBox4Exit(Sender: TObject);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CorBaiP: TF_CorBaiP;
  n_prot : string;

implementation

uses DMTD, Menu, Pesq, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_CorBaiP.FormActivate(Sender: TObject);
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  {Dm.ArqAux.Sql.Add('SELECT parcelas, parc2, parc3, parc4, parc5, parc6,');
  Dm.ArqAux.Sql.Add('val_parc, val_parc2, val_parc3, val_parc4, val_parc5, val_parc6,');
  Dm.ArqAux.Sql.Add('ven_parc, ven_parc2, ven_parc3, ven_parc4, ven_parc5, ven_parc6,');
  Dm.ArqAux.Sql.Add('grupo, cota'); }
  Dm.ArqAux.Sql.Add('SELECT anotacao, rl, data_prov1, sit_prov1, cod_prov1, obs_prov1,');
  Dm.ArqAux.Sql.Add('data_prov2, sit_prov2, cod_prov2, obs_prov2,');
  Dm.ArqAux.Sql.Add('data_prov3, sit_prov3, cod_prov3, obs_prov3');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
//  Dm.ArqAux.Sql.Add('p_auxiliar = ' + F_Pesq.Label16.Caption);
  Dm.ArqAux.Sql.Add('protocolo = ' + Dm.Td_Cert.FieldByName('protocolo').asString);
  Dm.ArqAux.Open;

   if (Dm.ArqAux.RecordCount = 0) then
    begin
      ShowMessage('ATENÇÃO - Problemas para localizar as Baixas do protocolo');
      Dm.ArqAux.Close;
      Exit;
    end;

  //Referente a 1ª Data de Retorno da Notificação
  MaskEdit8.Text      := Dm.ArqAux.FieldByName('data_prov1').asString;
  MaskEdit15.Text     := Dm.ArqAux.FieldByName('cod_prov1').asString;
  if Dm.ArqAux.FieldByName('cod_prov1').asString <> ''then
  ComboBox1.text      := Dm.ArqAux.FieldByName('cod_prov1').asString + ' - ' + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_prov1').asString);

 { if Dm.ArqAux.FieldByname('sit_not1').asString = 'P' then
   MaskEdit9.Text      := 'POSITIVA';
  if Dm.ArqAux.FieldByname('sit_not1').asString = 'N' then
   MaskEdit9.Text      := 'NEGATIVA'; }


  //Referente a 2ª Data de Retorno da Notificação
  MaskEdit1.Text      := Dm.ArqAux.FieldByName('data_prov2').asString;
  MaskEdit4.Text      := Dm.ArqAux.FieldByName('cod_prov2').asString;
  if Dm.ArqAux.FieldByName('cod_prov2').asString <> ''then
  ComboBox2.text      := Dm.ArqAux.FieldByName('cod_prov2').asString + ' - ' + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_prov2').asString);

 { if Dm.ArqAux.FieldByname('sit_not2').asString = 'P' then
   MaskEdit10.Text      := 'POSITIVA';
  if Dm.ArqAux.FieldByname('sit_not2').asString = 'N' then
   MaskEdit10.Text      := 'NEGATIVA'; }


  //Referente a 3ª Data de Retorno da Notificação
  MaskEdit5.Text      := Dm.ArqAux.FieldByName('data_prov3').asString;
  MaskEdit7.Text      := Dm.ArqAux.FieldByName('cod_prov3').asString;
  if Dm.ArqAux.FieldByName('cod_prov3').asString <> ''then
  ComboBox3.text      := Dm.ArqAux.FieldByName('cod_prov3').asString + ' - ' + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_prov3').asString);

 { if Dm.ArqAux.FieldByname('sit_not3').asString = 'P' then
   MaskEdit11.Text      := 'POSITIVA';
  if Dm.ArqAux.FieldByname('sit_not3').asString = 'N' then
   MaskEdit11.Text      := 'NEGATIVA'; }

 // Dm.ArqAux.Close;
  n_prot := Dm.Td_Cert.FieldByName('protocolo').asString;
  BitBtn1.Enabled := False;
  BitBtn3.SetFocus;
end;

Procedure TF_CorBaiP.BuscaTextoCombo(Sender : TObject);
var
  x : Integer;
begin
  x := 0;
  while x <= (ComboBox4.Items.Count - 1) do
  begin
    if (Copy(ComboBox4.Items.Strings[x], 1, 5) = MaskEdit14.Text) then
    begin
      ComboBox4.Text := ComboBox4.Items.Strings[x];
      x := ComboBox4.Items.Count;
    end;
    x := x + 1;
  end;
  UpdateWindow(Handle);
end;

procedure TF_CorBaiP.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CorBaiP.Corrigir1Click(Sender: TObject);
var
  campo1, campo2, campo3, campo4 : String;
begin
  Label19.Caption := '0';
 // while (StrToInt(Label19.Caption) <= 0) do
 // begin
    Label19.Caption := InputBox('BAIXA DE NOTIFICAÇÕES ', 'Corrigir a baixa número : ', '0');
    if (not ValidNumero(Label19.Caption)) then
    begin
      Label19.Caption := '0';
    end
    else
    begin
      if (StrToInt(Label19.Caption) > 3) or (StrToInt(Label19.Caption) <=0) then
      begin
        ShowMessage('Diligência inválida.');
        Label19.Caption := '0';
      end;
    end;
 // end;
  if (StrToInt(Label19.Caption) >= 1) AND (StrToInt(Label19.Caption) <= 3) then
  begin 
    campo1 := 'data_prov' + Label19.Caption;
    campo2 := 'cod_prov'  + Label19.Caption;
    campo3 := 'sit_prov'  + Label19.Caption;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT ' + campo1 + ',' + campo2 + ',' + campo3);
    Dm.ArqAux.Sql.Add('FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('protocolo = ' + Dm.Td_Cert.FieldByName('protocolo').asString);
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      ShowMessage('ATENÇÃO - Problemas para localizar o protocolo');
      Dm.ArqAux.Close;
      Exit;
    end;
    MaskEdit12.Text  := Dm.ArqAux.FieldByName(campo1).asString;
    MaskEdit14.Text  := Dm.ArqAux.FieldByName(campo2).asString;
    if Dm.ArqAux.FieldByName(campo2).asString <> ''then
    ComboBox4.Text  := Dm.ArqAux.FieldByName(campo2).asString + ' - ' + Ver_Ocorrencia(Dm.ArqAux.FieldByName(campo2).asString);
    Dm.ArqAux.Close;
    BitBtn1.Enabled := True;
    BitBtn1.Caption := '&Gravar';
    MaskEdit12.SetFocus;
  end;
end;

procedure TF_CorBaiP.Excluir1Click(Sender: TObject);
var
  campo1, campo2, campo3, campo4, campo5 : String;
begin
  Label19.Caption := '0';
  //while (StrToInt(Label19.Caption) <= 0) do
 // begin
    Label19.Caption := InputBox('BAIXA DE NOTIFICAÇÕES', 'Excluir a baixa número : ', '0');
    if (not ValidNumero(Label19.Caption)) then
    begin
      Label19.Caption := '0';
    end
    else
    begin
      if (StrToInt(Label19.Caption) > 3) then
      begin
        ShowMessage('Diligência inválida.');
        Label19.Caption := '0';
      end;
    end;
 // end;
  if (StrToInt(Label19.Caption) >= 1) AND (StrToInt(Label19.Caption) <= 3) then
  begin 
    if (MessageBox(Handle, PChar('Excluir a baixa nº ' + Label19.Caption + '?'), 'EXCLUSÃO DE BAIXA DE NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
    begin
      campo1 := '';
      campo2 := '';
      campo3 := '';
      campo4 := '';

      campo1 := 'data_prov' + Label19.Caption;
      campo2 := 'sit_prov'  + Label19.Caption;
      campo3 := 'cod_prov'  + Label19.Caption;
      campo4 := 'obs_prov'  + Label19.Caption;
      Dm.ArqAux2.Close;
      Dm.ArqAux2.Sql.Clear;
      Dm.ArqAux2.Sql.Add('UPDATE td SET');
      Dm.ArqAux2.Sql.Add(campo1 + ' = NULL,');
      Dm.ArqAux2.Sql.Add(campo2 + ' = NULL,');
      Dm.ArqAux2.Sql.Add(campo3 + ' = NULL,');
      Dm.ArqAux2.Sql.Add(campo4 + ' = NULL');
      Dm.ArqAux2.Sql.Add('WHERE');
     // Dm.ArqAux2.Sql.Add('    registro = ' + Label7.Caption);
      Dm.ArqAux2.Sql.Add('protocolo = ' + Dm.Td_Cert.FieldByName('protocolo').asString);
      Dm.ArqAux2.ExecSQL;
    end;

    ShowMessage('Exclusão Efetuada com  Sucesso!');
    MaskEdit12.Text  := ''; 
    MaskEdit14.Text  := '0';
    ComboBox4.Text   := '';
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT anotacao, rl, data_prov1, sit_prov1, cod_prov1, obs_prov1,');
    Dm.ArqAux.Sql.Add('data_prov2, sit_prov2, cod_prov2, obs_prov2,');
    Dm.ArqAux.Sql.Add('data_prov3, sit_prov3, cod_prov3, obs_prov3');
    Dm.ArqAux.Sql.Add('FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('protocolo = ' + Dm.Td_Cert.FieldByName('protocolo').asString);
    Dm.ArqAux.Open;
   // Dm.ArqAux.Refresh;

    //Referente a 1ª Data de Retorno da Notificação
    MaskEdit8.Text      := Dm.ArqAux.FieldByName('data_prov1').asString;
    MaskEdit15.Text     := Dm.ArqAux.FieldByName('cod_prov1').asString;
    if F_CorBaiP.MaskEdit15.text <> ''then
    ComboBox1.text      := Dm.ArqAux.FieldByName('cod_prov1').asString + ' - ' + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_prov1').asString)
    else
    ComboBox1.text      := '';

    //Referente a 2ª Data de Retorno da Notificação
    MaskEdit1.Text      := Dm.ArqAux.FieldByName('data_prov2').asString;
    MaskEdit4.Text      := Dm.ArqAux.FieldByName('cod_prov2').asString;
    if F_CorBaiP.MaskEdit4.text <> ''then
    ComboBox2.text      := Dm.ArqAux.FieldByName('cod_prov2').asString + ' - ' + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_prov2').asString)
    else
    ComboBox2.text      := '';

    //Referente a 3ª Data de Retorno da Notificação
    MaskEdit5.Text      := Dm.ArqAux.FieldByName('data_prov3').asString;
    MaskEdit7.Text      := Dm.ArqAux.FieldByName('cod_prov3').asString;
    if F_CorBaiP.MaskEdit7.text <> ''then
    ComboBox3.text      := Dm.ArqAux.FieldByName('cod_prov3').asString + ' - ' + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_prov3').asString)
    else
    ComboBox3.text      := '';

    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Exclusão da ' + Label19.Caption + 'ª Baixa Provisória em ' +  DateToStr(date),Trim(n_prot));
    BitBtn3.SetFocus;
  end;

end;

procedure TF_CorBaiP.BitBtn1Click(Sender: TObject);
var
  campo1, campo2, campo3, campo4, campo5 : String;
begin
 if (F_CorBaiP.MaskEdit12.text <> '  /  /    ') then
  begin
  if (MessageBox(Handle, PChar('Gravar correção da Baixa?'), 'BAIXA DA NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
    begin
      campo1 := 'data_prov' + Label19.Caption;
      campo2 := 'cod_prov'  + Label19.Caption;
      campo3 := 'obs_prov'  + Label19.Caption;
      campo4 := 'sit_prov'  + Label19.Caption;
      Dm.ArqAux.Close;
      Dm.ArqAux.RequestLive := True;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT ' + campo1 + ',' + campo2 + ',' + campo3 + ',' + campo4);
      Dm.ArqAux.Sql.Add('FROM td');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('protocolo = ' + Dm.Td_Cert.FieldByName('protocolo').asString);
      Dm.ArqAux.Open;
      if (Dm.ArqAux.RecordCount = 0) then
      begin
        Dm.ArqAux.Close;
        Dm.ArqAux.RequestLive := False;
        ShowMessage('Protocolo não localizado !');
        Exit;
      end;
      while (not Dm.ArqAux.Eof) do
      begin
        Dm.ArqAux.Edit;
        Dm.ArqAux.FieldByName(campo1).asString := MaskEdit12.Text;
        Dm.ArqAux.FieldByName(campo2).asString := MaskEdit14.Text;

        if (StrToInt(MaskEdit14.Text) = 1) then
        begin
          Dm.ArqAux.FieldByname(campo4).asString  := 'P';
        end
        else
        begin
          Dm.ArqAux.FieldByname(campo4).asString  := 'N';
        end;

        Dm.ArqAux.Post;
       // Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Notificação baixada como ' + Ver_TipoBaixaNotificacao(Label5.Caption) + ' em ' + MaskEdit3.Text + ' pelo motivo ' + Copy(ComboBox1.Text, 7, 120), Label4.Caption);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Realizada correção na ' + Label19.Caption + 'ª Baixa Provisória em ' +  DateToStr(date),Trim(n_prot));
        Dm.ArqAux.Next;
      end;
      Dm.ArqAux.Close;
      Dm.ArqAux.RequestLive := False;
    end;
    ShowMessage('Gravação Efetuada com  Sucesso!');

    MaskEdit12.Text  := '';    
    MaskEdit14.Text  := '0';
    ComboBox4.Text   := '';
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT anotacao, rl, data_prov1, sit_prov1, cod_prov1, obs_prov1,');
    Dm.ArqAux.Sql.Add('data_prov2, sit_prov2, cod_prov2, obs_prov2,');
    Dm.ArqAux.Sql.Add('data_prov3, sit_prov3, cod_prov3, obs_prov3');
    Dm.ArqAux.Sql.Add('FROM td');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('protocolo = ' + Dm.Td_Cert.FieldByName('protocolo').asString);
    Dm.ArqAux.Open;

    //Referente a 1ª Data de Retorno da Notificação
    MaskEdit8.Text      := Dm.ArqAux.FieldByName('data_prov1').asString;
    MaskEdit15.Text     := Dm.ArqAux.FieldByName('cod_prov1').asString;
    if Dm.ArqAux.FieldByName('cod_prov1').asString <> ''then
    ComboBox1.text      := Dm.ArqAux.FieldByName('cod_prov1').asString + ' - ' + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_prov1').asString);

    //Referente a 2ª Data de Retorno da Notificação
    MaskEdit1.Text      := Dm.ArqAux.FieldByName('data_prov2').asString;
    MaskEdit4.Text      := Dm.ArqAux.FieldByName('cod_prov2').asString;
    if Dm.ArqAux.FieldByName('cod_prov2').asString <> ''then
    ComboBox2.text      := Dm.ArqAux.FieldByName('cod_prov2').asString + ' - ' + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_prov2').asString);

    //Referente a 3ª Data de Retorno da Notificação
    MaskEdit5.Text      := Dm.ArqAux.FieldByName('data_prov3').asString;
    MaskEdit7.Text      := Dm.ArqAux.FieldByName('cod_prov3').asString;
    if Dm.ArqAux.FieldByName('cod_prov3').asString <> ''then
    ComboBox3.text      := Dm.ArqAux.FieldByName('cod_prov3').asString + ' - ' + Ver_Ocorrencia(Dm.ArqAux.FieldByName('cod_prov3').asString);

    BitBtn3.SetFocus;
    BitBtn1.Enabled := False;
 end
 else
  begin
   ShowMessage('Dados Inválidos!');
   Exit;
  end;
end;

procedure TF_CorBaiP.MaskEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then MaskEdit14.SetFocus;
end;

procedure TF_CorBaiP.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit14.SetFocus;
end;

procedure TF_CorBaiP.MaskEdit14Exit(Sender: TObject);
begin
 if (Not ValidNumero(MaskEdit14.Text)) OR
     (StrToInt(MaskEdit14.Text) = 0)    then
  begin
    MaskEdit14.Text := '0';
    ComboBox4.SetFocus;
  end
  else
  begin
    MaskEdit14.Text := StrZero(Trim(MaskEdit14.Text), 5);
    BuscaTextoCombo(F_CorBaiP);
  end;
end;

procedure TF_CorBaiP.MaskEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = 13 then ComboBox4.SetFocus;
end;

procedure TF_CorBaiP.ComboBox4Enter(Sender: TObject);
begin
  SendMessage(ComboBox4.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_CorBaiP.ComboBox4Exit(Sender: TObject);
begin
   if ((Trim(MaskEdit14.Text) = '') OR (Trim(MaskEdit14.Text) = '0')) AND (Trim(ComboBox4.Text) <> '') then MaskEdit14.Text := Copy(ComboBox4.Text, 1,5);
end;

procedure TF_CorBaiP.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

end.


