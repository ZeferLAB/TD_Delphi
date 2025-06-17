unit baixan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, ComCtrls, Grids, DBGrids,
  Menus, jpeg, Db, DBTables;

type
  TF_BaixaN = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label11: TLabel;
    ComboBox1: TComboBox;
    MaskEdit3: TMaskEdit;
    Label12: TLabel;
    MaskEdit4: TMaskEdit;
    Label13: TLabel;
    RichEdit1: TRichEdit;
    BitBtn1: TBitBtn;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    Corrigir1: TMenuItem;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Excluir1: TMenuItem;
    ComboBox2: TComboBox;
    Label20: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label21: TLabel;
    Qry_GridTentativas: TQuery;
    Ds_GridTentativas: TDataSource;
    Panel3: TPanel;
    Label22: TLabel;
    MaskEdit5: TMaskEdit;
    Label23: TLabel;
    MaskEdit6: TMaskEdit;
    RichEdit2: TRichEdit;
    Label24: TLabel;
    Label25: TLabel;
    MaskEdit7: TMaskEdit;
    Label26: TLabel;
    MaskEdit8: TMaskEdit;
    Label27: TLabel;
    RichEdit3: TRichEdit;
    Label28: TLabel;
    MaskEdit9: TMaskEdit;
    Label29: TLabel;
    MaskEdit10: TMaskEdit;
    Label30: TLabel;
    RichEdit4: TRichEdit;
    BitBtn5: TBitBtn;
    ComboBox3: TComboBox;
    Label31: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure BuscaTextoCombo(Sender : TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    Procedure Carrega(Sender : TOBject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Corrigir1Click(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Carrega_Notificador(sender : TObject);
    procedure BitBtn5Click(Sender: TObject);
    function AlimentaIndiceTipoBaixa: String;
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    procedure AtualizaGridDeTentativasEntrega(sProtocolo: String);
    procedure RestaurarInformacaoDaTela;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_BaixaN: TF_BaixaN;
  mensagem : String;
  naosenha : Boolean;
  tipon : String;
implementation

uses DMTD, Menu, Senha, FuncGeral, ProcGeral, UModeloCertidaoNotificacao,
  Pesq;

{$R *.DFM}

Function verdatanot(protocolo,data : String) : Boolean;
 var
 data_venc : String;
Begin
 result := false;
 Dm.ArqAux.Close;
 Dm.ArqAux.Sql.Clear;
 Dm.ArqAux.Sql.Add('select * from td_pesso where protocolo = ' + Chr(39) + protocolo + Chr(39) + ' and situacao = "D"');
 Dm.ArqAux.Open;
 mensagem := '';
 if (Dm.ArqAux.FieldByName('data_not1').AsString = '') then
 Begin
  Dm.ArqAux.FieldByName('data').AsString;
  if StrtoDate(F_BaixaN.maskedit2.text) >= (Dm.ArqAux.FieldByName('data').AsDatetime + 11) then
  Begin
    result := true;
    mensagem := 'Prazo esgotado (1ª Diligência)';
  end;
 end else
  if (Dm.ArqAux.FieldByName('data_not2').AsString = '') then
  Begin
   if StrtoDate(F_BaixaN.maskedit2.text) >= (Dm.ArqAux.FieldByName('data').AsDatetime + 21) then
   Begin
     result := true;
     mensagem := 'Prazo esgotado (2ª Diligência)';
   end;
  end
   else
   if (Dm.ArqAux.FieldByName('data_not3').AsString = '') then
    Begin
     //showmessage(DatetimetoStr(Dm.ArqAux.FieldByName('data').AsDatetime + 31));
     if StrtoDate(F_BaixaN.maskedit2.text) >= (Dm.ArqAux.FieldByName('data').AsDatetime + 31) then
     Begin
      result := true;
      mensagem := 'Prazo esgotado (3ª Diligência)';
     end;
    end;

 if (Dm.ArqAux.FieldByName('data_not3').AsString <> '') then
 Begin
  result := true;
  mensagem := 'Número máximo de Diligências excedido (03)';
 end;
 Dm.ArqAux.close;

end;

procedure TF_BaixaN.Carrega_Notificador(sender : TObject);
begin
  dm.cad_not.close;
  dm.cad_not.sql.clear;
  dm.cad_not.sql.add('select * from cad_not');
  dm.cad_not.open;
  ComboBox2.Clear;
  while not dm.cad_not.eof do
  begin
    ComboBox2.Items.add(dm.cad_not.FieldByName('nome').AsString);
    dm.cad_not.Next;
  end;

end;

Procedure TF_BaixaN.BuscaTextoCombo(Sender : TObject);
var
  x : Integer;
begin
  x := 0;
  while x <= (ComboBox1.Items.Count - 1) do
  begin
    if (Copy(ComboBox1.Items.Strings[x], 1, 5) = MaskEdit3.Text) then
    begin
      ComboBox1.Text := ComboBox1.Items.Strings[x];
      x := ComboBox1.Items.Count;
      dm.Cad_Ir.close;
      dm.cad_ir.sql.clear;
      dm.cad_ir.sql.add('select * from cad_ir where codigo = ' + MaskEdit3.Text);
      dm.Cad_Ir.open;
      tipon := dm.cad_ir.FieldByName('tipo').AsString;
    end;
    x := x + 1;
  end;
  UpdateWindow(Handle);
end;

Procedure TF_BaixaN.Carrega(Sender : TOBject);
begin
  Label7.Visible  := True;
  Label8.Visible  := True;
  Label9.Visible  := True;
  Label10.Visible := True;

  Label7.Caption  := Dm.ArqAux1.FieldByName('registro').asString;
  Label8.Caption  := Dm.ArqAux1.FieldByName('contato').asString;
  Label9.Caption  := Ver_Natureza(Dm.ArqAux1.FieldByName('natureza').asString, False);
  Label10.Caption := Dm.ArqAux1.FieldByName('data_p').asString;
  Label16.Caption := Dm.ArqAux1.FieldByName('data_r').asString;
  ComboBox2.Text := dm.ArqAux1.FieldByName('notificador').AsString;
  if (Dm.ArqAux1.FieldByName('data_not3').asDateTime > 0) then Label14.Caption := 'S';

end;

procedure TF_BaixaN.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TF_BaixaN.BitBtn2Click(Sender: TObject);
begin
  Panel2.Visible := False;
  if (Trim(MaskEdit1.Text) = '') then
  begin
    MaskEdit1.SetFocus;
    Exit;
  end;

  if ComboBox3.Text = '' Then
  Begin
    MessageBox(Handle, PChar('Campo: Pesquisa por, deve ser preenchido!'), 'BAIXA DE NOTIFICAÇÕES', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    Abort;
  End;

  if (ComboBox3.ItemIndex = 0) or (ComboBox3.Text = '') Then
  Begin
    Dm.ArqAux1.Close;
    Dm.ArqAux1.Sql.Clear;
    Dm.ArqAux1.Sql.Add('SELECT COUNT(*) qtde');
    Dm.ArqAux1.Sql.Add('FROM td a INNER JOIN td_pesso b');
    Dm.ArqAux1.Sql.Add('ON (a.protocolo = b.protocolo)');
    Dm.ArqAux1.Sql.Add('WHERE');
    Dm.ArqAux1.Sql.Add('    a.protocolo  = ' + Trim(MaskEdit1.Text));
    //Dm.ArqAux1.Sql.Add('AND ((a.natureza = 2) or (a.natureza = 232) or (a.natureza = 180) or (a.natureza = 108) or (a.natureza = 109) or (a.natureza = 107) or (a.natureza = 110))');
    //Dm.ArqAux1.Sql.Add('AND b.situacao   = "2"');
    Dm.ArqAux1.Open;
    Label19.Caption := Dm.ArqAux1.FieldByName('qtde').asString;
    Dm.ArqAux1.Close;
    // **************************
    Dm.ArqAux1.Close;
    Dm.ArqAux1.Sql.Clear;
    Dm.ArqAux1.Sql.Add('SELECT a.contato, a.data_r, a.natureza, a.a_nome, a.data_p,');
    Dm.ArqAux1.Sql.Add('b.registro, b.nome, b.situacao, a.data_not3, b.notificador');
    Dm.ArqAux1.Sql.Add('FROM td a INNER JOIN td_pesso b');
    Dm.ArqAux1.Sql.Add('ON (a.protocolo = b.protocolo)');
    Dm.ArqAux1.Sql.Add('WHERE');
    Dm.ArqAux1.Sql.Add('    a.protocolo  = ' + Trim(MaskEdit1.Text));
    //Dm.ArqAux1.Sql.Add('AND ((a.natureza = 2) or (a.natureza = 232) or (a.natureza = 180) or (a.natureza = 108) or (a.natureza = 109) or (a.natureza = 107) or (a.natureza = 110))');
    //Dm.ArqAux1.Sql.Add('AND b.situacao   = "2"');
    Dm.ArqAux1.Open;
  End
  Else
  Begin
    Dm.ArqAux1.Close;
    Dm.ArqAux1.Sql.Clear;
    Dm.ArqAux1.Sql.Add('SELECT COUNT(*) qtde');
    Dm.ArqAux1.Sql.Add('FROM td a INNER JOIN td_pesso b');
    Dm.ArqAux1.Sql.Add('ON (a.protocolo = b.protocolo)');
    Dm.ArqAux1.Sql.Add('WHERE');
    Dm.ArqAux1.Sql.Add('    a.p_auxiliar  = ' + Trim(MaskEdit1.Text));
    //Dm.ArqAux1.Sql.Add('AND ((a.natureza = 2) or (a.natureza = 232) or (a.natureza = 180) or (a.natureza = 108) or (a.natureza = 109) or (a.natureza = 107) or (a.natureza = 110))');
    //Dm.ArqAux1.Sql.Add('AND b.situacao   = "2"');
    Dm.ArqAux1.Open;
    Label19.Caption := Dm.ArqAux1.FieldByName('qtde').asString;
    Dm.ArqAux1.Close;
    // **************************
    Dm.ArqAux1.Close;
    Dm.ArqAux1.Sql.Clear;
    Dm.ArqAux1.Sql.Add('SELECT a.contato, a.data_r, a.natureza, a.a_nome, a.data_p,');
    Dm.ArqAux1.Sql.Add('b.registro, b.nome, b.situacao, a.data_not3, b.notificador');
    Dm.ArqAux1.Sql.Add('FROM td a INNER JOIN td_pesso b');
    Dm.ArqAux1.Sql.Add('ON (a.protocolo = b.protocolo)');
    Dm.ArqAux1.Sql.Add('WHERE');
    Dm.ArqAux1.Sql.Add('    a.p_auxiliar  = ' + Trim(MaskEdit1.Text));
    //Dm.ArqAux1.Sql.Add('AND ((a.natureza = 2) or (a.natureza = 232) or (a.natureza = 180) or (a.natureza = 108) or (a.natureza = 109) or (a.natureza = 107) or (a.natureza = 110))');
    //Dm.ArqAux1.Sql.Add('AND b.situacao   = "2"');
    Dm.ArqAux1.Open;
  End;

  if (Dm.ArqAux1.RecordCount > 0) Then
  Begin
      BitBtn5.Enabled:= True;
  End
  Else
  BitBtn5.Enabled:= False;

  if (Dm.ArqAux1.RecordCount = 0) then
  begin
    Dm.ArqAux1.Close;
    MessageBox(Handle, PChar('Protocolo auxiliar não encontrado !'), 'BAIXA DE NOTIFICAÇÕES', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    if F_Pesq = Nil Then
      MaskEdit1.SetFocus;
    Exit;
  end;
  Label14.Caption   := 'N';
  MaskEdit1.Enabled := False;
  BitBtn2.Enabled   := False;
  Carrega(F_BaixaN);
  //AtualizaGridDeTentativasEntrega(MaskEdit1.Text);
  Panel2.Visible     := True;
  AtualizaGridDeTentativasEntrega(Label7.Caption);
  if (Label14.Caption = 'S') then
  begin
    Showmessage('Diligências já efetuadas , consultar histórico');
    if F_Pesq = Nil Then
      BitBtn3.SetFocus;
  end;
end;

procedure TF_BaixaN.BitBtn3Click(Sender: TObject);
begin
  Dm.ArqAux1.Close;
  Label18.Caption   := '0';
  Label19.Caption   := '0';
  Label17.Caption   := 'I';
  MaskEdit3.Text    := '0';
  ComboBox1.Text    := '';
  MaskEdit2.Text    := '';
  MaskEdit4.Text    := '';
  RichEdit1.Text    := '';
  Label7.Visible    := False;
  Label8.Visible    := False;
  Label9.Visible    := False;
  Label10.Visible   := False;
  BitBtn1.Caption   := '&Baixa';
  BitBtn2.Enabled   := True;
  MaskEdit1.Enabled := True;
  MaskEdit2.Text    := DateToStr(Date);
  DbGrid1.Enabled   := True;
  if F_Pesq = Nil Then
  Begin
    MaskEdit1.Clear;
    MaskEdit1.SetFocus;
  End
  Else
  Begin
    BitBtn2.OnClick(Nil);
  End;

  AtualizaGridDeTentativasEntrega('0');
end;

procedure TF_BaixaN.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_BaixaN.MaskEdit3Exit(Sender: TObject);
begin

  if (Not ValidNumero(MaskEdit3.Text)) OR
     (StrToInt(MaskEdit3.Text) = 0)    then
  begin
    MaskEdit3.Text := '1';
    ComboBox1.SetFocus;
  end
  else
  begin
    MaskEdit3.Text := StrZero(Trim(MaskEdit3.Text), 5);
    RichEdit1.Lines.Clear;
    BuscaTextoCombo(F_BaixaN);
    if (Label17.Caption <> 'C') then
    begin
      //if (StrToInt(MaskEdit3.Text) <> 1) then
        RichEdit1.Lines.Add(Copy(ComboBox1.Text, 9, 100));
      //else
      //RichEdit1.Lines.Clear;
    end;
  end;
end;

procedure TF_BaixaN.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_BaixaN.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then RichEdit1.SetFocus;
end;

procedure TF_BaixaN.BitBtn1Click(Sender: TObject);
var
  campo1, campo2, campo3, campo4, campo5 : String;
  DesejoEncerrar: Boolean;
begin
  naosenha := true;

  if ComboBox1.Text = '' Then
  Begin
    Application.MessageBox('Campo: Tipo de Baixa, deve ser preenchido', 'Mensagem de Sistema', mb_ok);
    Abort;
  End;

  if MaskEdit2.Text = '  /  /    ' Then
  Begin
    Application.MessageBox('Campo: Data, deve ser preenchido', 'Mensagem de Sistema', mb_ok);
    Abort;
  End;

  if MaskEdit4.Text = '  :  ' Then
  Begin
    Application.MessageBox('Campo: Hora, deve ser preenchido', 'Mensagem de Sistema', mb_ok);
    Abort;
  End;

  {if ComboBox2.Text = '' Then
  Begin
    if (MessageBox(Handle, PChar('Campo: Notificador, não esta preenchido e esta informação pode ser necessária para emissão de relatórios. Deseja prosseguir  ?'), 'ANDAMENTO DA NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdNo) then
      Abort;
  End;}

  if (trim(ComboBox2.Text) <> '') and (Trim(ComboBox1.Text) = '') then
  begin
      Dm.ArqAux.Close;
      Dm.ArqAux.RequestLive := True;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT dt_desig, notificador');
      Dm.ArqAux.Sql.Add('FROM td_pesso');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('    protocolo = ' + Trim(Label7.Caption));
      //Dm.ArqAux.Sql.Add('AND (situacao  = "107" or situacao = "38")');
      dm.ArqAux.open;

      if dm.ArqAux.RecordCount = 0 then
      begin
          Dm.ArqAux.Close;
          Dm.ArqAux.RequestLive := False;
          Application.MessageBox('Erro no cadastro de NOTIFICADO E/OU DESTINATÁRIO!!! Favor verificar situações !', 'Mensagem de Sistema', mb_ok);
          //Application.MessageBox('Protocolo Não Localizado', 'Mensagem de Sistema', mb_ok);
          Exit;
      end;

      if dm.ArqAux.FieldByName('dt_desig').AsString <> MaskEdit2.Text Then
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Campo: Data, foi alterado de: '+dm.ArqAux.FieldByName('dt_desig').AsString+' para '+MaskEdit2.Text ,MaskEdit1.Text);

      if dm.ArqAux.FieldByName('notificador').AsString <> ComboBox2.Text Then
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Campo: Notificador, foi alterado de: '+dm.ArqAux.FieldByName('notificador').AsString+' para '+ComboBox2.Text ,MaskEdit1.Text);

      dm.ArqAux.Edit;
      dm.ArqAux.FieldByName('dt_desig').AsString := MaskEdit2.Text;
      dm.ArqAux.FieldByName('notificador').AsString := ComboBox2.Text;
      dm.ArqAux.Post;


  end
  else
  begin
    if (Label17.Caption = 'C') then
    begin
      if (MessageBox(Handle, PChar('Gravar correção do andamento ?'), 'ANDAMENTO DA NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
      begin
        campo1 := 'data_not' + Label18.Caption;
        campo2 := 'hora_not' + Label18.Caption;
        campo3 := 'cod_not'  + Label18.Caption;
        campo4 := 'obs_not'  + Label18.Caption;
        campo5 := 'sit_not'  + Label18.Caption;
        Dm.ArqAux.Close;        
        Dm.ArqAux.RequestLive := True;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('SELECT dt_desig,notificador ,enc_not,' + campo1 + ',' + campo2 + ',' + campo3 + ',' + campo4 + ',' + campo5);
        Dm.ArqAux.Sql.Add('FROM td_pesso');
        Dm.ArqAux.Sql.Add('WHERE');
        if (StrToInt(Label19.Caption) > 1) then
        begin
          if (MessageBox(Handle, PChar('Gravar andamento em todos os nomes?'), 'ANDAMENTO DA NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdNo) then
          begin
            Dm.ArqAux.Sql.Add('    protocolo = ' + Trim(Label7.Caption));
            Dm.ArqAux.Sql.Add('AND nome      = ' + Chr(39) + Trim(Dm.ArqAux1.FieldByName('nome').asString) + Chr(39));
          end
          else
          begin
            Dm.ArqAux.Sql.Add('    protocolo = ' + Trim(Label7.Caption));
            //Dm.ArqAux.Sql.Add('AND (situacao  = "107" or situacao = "38")');
          end;

          if (MessageBox(Handle, PChar('Encerrar andamento da notificação ?'), 'ANDAMENTO DA NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
            DesejoEncerrar:= True
          else
          DesejoEncerrar:= False;

        end
        else
        begin
          Dm.ArqAux.Sql.Add('protocolo = ' + Trim(Label7.Caption));
          //Dm.ArqAux.Sql.Add('AND (situacao  = "107" or situacao = "38")');
        end;
        Dm.ArqAux.Open;
        if (Dm.ArqAux.RecordCount = 0) then
        begin
          Dm.ArqAux.Close;
          Dm.ArqAux.RequestLive := False;
          //ShowMessage('Protocolo não localizado !');
          ShowMessage('Erro no cadastro de NOTIFICADO E/OU DESTINATÁRIO!!! Favor verificar situações !');
          Exit;
        end;
        while (not Dm.ArqAux.Eof) do
        begin
          if dm.ArqAux.FieldByName('dt_desig').AsString <> MaskEdit2.Text Then
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Campo: Data, foi alterado de: '+dm.ArqAux.FieldByName('dt_desig').AsString+' para '+MaskEdit2.Text ,MaskEdit1.Text);

          if dm.ArqAux.FieldByName(campo2).AsString <> MaskEdit2.Text Then
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Campo: '+campo2+', foi alterado de: '+dm.ArqAux.FieldByName(campo2).AsString+' para '+Trim(MaskEdit4.Text) ,MaskEdit1.Text);

          if dm.ArqAux.FieldByName(campo3).AsString <> MaskEdit2.Text Then
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Campo: '+campo3+', foi alterado de: '+dm.ArqAux.FieldByName(campo3).AsString+' para '+Trim(MaskEdit3.Text) ,MaskEdit1.Text);

          if dm.ArqAux.FieldByName('notificador').AsString <> ComboBox2.Text Then
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Campo: Notificador, foi alterado de: '+dm.ArqAux.FieldByName('notificador').AsString+' para '+ComboBox2.Text ,MaskEdit1.Text);

          Dm.ArqAux.Edit;
          if dm.ArqAux.FieldByName('dt_desig').AsDateTime = 0 then
            dm.ArqAux.FieldByName('dt_desig').AsString := MaskEdit2.Text;
          Dm.ArqAux.FieldByName(campo1).asString := MaskEdit2.Text;
          Dm.ArqAux.FieldByName(campo3).asString := Trim(MaskEdit3.Text);
          Dm.ArqAux.FieldByName(campo2).asString := Trim(MaskEdit4.Text);
          dm.ArqAux.FieldByName('notificador').AsString := trim(ComboBox2.text);
          if (tipon = 'P') then
          begin
            if dm.ArqAux.FieldByName(campo5).AsString <> 'P' Then
              Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Campo: '+campo5+', foi alterado de: '+dm.ArqAux.FieldByName(campo5).AsString+' para "P"' ,MaskEdit1.Text);

            Dm.ArqAux.FieldByname(campo5).asString  := 'P';

            if dm.ArqAux.FieldByName('enc_not').AsString <> 'S' Then
              Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Campo: '+campo5+', foi alterado de: '+dm.ArqAux.FieldByName('enc_not').AsString+' para "S"' ,MaskEdit1.Text);

            Dm.ArqAux.FieldByName('enc_not').asString   := 'S';
          end
          else
          begin
            Dm.ArqAux.FieldByname(campo5).asString  := 'N';
            if DesejoEncerrar then
            begin
              Dm.ArqAux.FieldByName('enc_not').asString := 'S';
              if dm.ArqAux.FieldByName('enc_not').AsString <> 'S' Then
                Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Campo: '+campo5+', foi alterado de: '+dm.ArqAux.FieldByName('enc_not').AsString+' para "S"' ,MaskEdit1.Text);

            end;
          end;
          Dm.ArqAux.FieldByName(campo4).asString := Trim(RichEdit1.Lines.Text);
          Dm.ArqAux.Post;
          Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Realizada correção no ' + Label18.Caption + 'º andamento em ' +  DateToStr(date), Trim(Label7.Caption));
          Dm.ArqAux.Next;
        end;
        Dm.ArqAux.Close;
        Dm.ArqAux.RequestLive := False;
      end;
    end
    else
    begin
      Dm.ArqAux.Close;
      Dm.ArqAux.RequestLive := True;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT dt_desig, notificador, enc_not,');
      Dm.ArqAux.Sql.Add('data_not1, sit_not1, cod_not1, hora_not1, obs_not1,');
      Dm.ArqAux.Sql.Add('data_not2, sit_not2, cod_not2, hora_not2, obs_not2,');
      Dm.ArqAux.Sql.Add('data_not3, sit_not3, cod_not3, hora_not3, obs_not3');
      Dm.ArqAux.Sql.Add('FROM td_pesso');
      Dm.ArqAux.Sql.Add('WHERE');
      if (StrToInt(Label19.Caption) > 1) then
      begin
        if (MessageBox(Handle, PChar('Gravar andamento em todos os nomes ?'), 'ANDAMENTO DA NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdNo) then
        begin
          Dm.ArqAux.Sql.Add('    protocolo = ' + Trim(Label7.Caption));
          Dm.ArqAux.Sql.Add('AND nome      = ' + Chr(39) + Trim(Dm.ArqAux1.FieldByName('nome').asString) + Chr(39));
        end
        else
        begin
          Dm.ArqAux.Sql.Add('    protocolo = ' + Trim(Label7.Caption));
          //Dm.ArqAux.Sql.Add('AND (situacao  = "107" or situacao = "38")');
        end;
        if (MessageBox(Handle, PChar('Encerrar andamento da notificação ?'), 'ANDAMENTO DA NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
          DesejoEncerrar:= True
        else
        DesejoEncerrar:= False;

      end


      else
      begin
        Dm.ArqAux.Sql.Add('protocolo = ' + Trim(Label7.Caption));
        //Dm.ArqAux.Sql.Add('AND (situacao  = "107" or situacao = "38")');
      end;
      Dm.ArqAux.Open;
      if (Dm.ArqAux.RecordCount = 0) then
      begin
        Dm.ArqAux.Close;
        Dm.ArqAux.RequestLive := False;
        ShowMessage('Erro no cadastro de NOTIFICADO E/OU DESTINATÁRIO!!! Favor verificar situações !');
        //ShowMessage('Protocolo não localizado !');
        Exit;
      end;
      if (Dm.ArqAux.FieldByName('data_not1').asDateTime = 0) or (Dm.ArqAux.FieldByName('data_not1').asDateTime > 0) and (Dm.ArqAux.FieldByName('obs_not1').asString = '') then
      begin
        //if (StrToDate(MaskEdit2.Text) > Ver_Feriado(StrToDate(Label16.Caption), 10)) then
  {      if F_menu.senha.caption = 'N' then
        Begin
         if verdatanot(maskedit1.text,maskedit2.text) then
         begin
           //ShowMessage('Impossível realizar esta baixa.');
           //ShowMessage('A primeira visita deverá ser realizada até 10 dias úteis a contar da data de entrada da notificação.');
           Showmessage(mensagem);
           Application.CreateForm(TF_Senha, F_Senha);
           F_Senha.ShowModal;
           if (not F_Senha.Senha_Ok) then
           begin
             F_Senha.Destroy;
             ShowMessage('Baixa Cancelada !');
             BitBtn3Click(F_BaixaN);
             Exit;
           end;
        end;
        end; }
        while (not Dm.ArqAux.Eof) do
        begin



        
          Dm.ArqAux.Edit;
          if dm.ArqAux.FieldByName('dt_desig').AsDateTime = 0 then
           dm.ArqAux.FieldByName('dt_desig').AsString := MaskEdit2.Text;
          dm.ArqAux.FieldByName('notificador').AsString := ComboBox2.Text;
          Dm.ArqAux.FieldByName('data_not1').asString := MaskEdit2.Text;
          Dm.ArqAux.FieldByName('cod_not1').asString   := Trim(MaskEdit3.Text);
          Dm.ArqAux.FieldByName('hora_not1').asString := Trim(MaskEdit4.Text);
          if RichEdit2.Lines.Count <= 0 Then                                    
            Dm.ArqAux.FieldByName('obs_not1').asString := RichEdit1.Text;

          if  tipon = 'P' then  //(StrToInt(MaskEdit3.Text) = 1) then
          begin
            Dm.ArqAux.FieldByname('sit_not1').asString  := 'P';
            if DesejoEncerrar Then
              Dm.ArqAux.FieldByName('enc_not').asString   := 'S'
          end
          else
          begin
            Dm.ArqAux.FieldByname('sit_not1').asString  := 'N';
            if DesejoEncerrar Then
            begin
              Dm.ArqAux.FieldByName('enc_not').asString := 'S';
            end;
          end;
          if RichEdit2.Lines.Count <= 0 Then
            Dm.ArqAux.FieldByName('obs_not1').asString := Trim(RichEdit1.Lines.Text);
          Dm.ArqAux.Post;
          if (Dm.ArqAux.FieldByName('sit_not1').asString = 'P') then
          begin
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Baixa no andamento da notificação como POSITIVA em ' + MaskEdit2.Text + ' às ' + MaskEdit4.Text, Trim(Label7.Caption));
          end
          else
          begin
            if (Dm.ArqAux.FieldByName('enc_not').asString = 'S') then
            begin
              Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Baixa no andamento da notificação como NEGATIVA em ' + MaskEdit2.Text + ' às ' + MaskEdit4.Text + Trim(ComboBox1.Text) + '(ENCERRADO)', Trim(Label7.Caption));
            end
            else Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Baixa no andamento da notificação como NEGATIVA em ' + MaskEdit2.Text + ' às ' + MaskEdit4.Text + Trim(ComboBox1.Text) + '(NÃO ENCERRADO)', Trim(Label7.Caption));
          end;
          Dm.ArqAux.Next;
        end;
      end
      else if (Dm.ArqAux.FieldByName('data_not2').asDateTime = 0) or (Dm.ArqAux.FieldByName('data_not2').asDateTime > 0) and (Dm.ArqAux.FieldByName('obs_not2').asString = '') then
      begin
        while (not Dm.ArqAux.Eof) do
        begin
          Dm.ArqAux.Edit;
          if dm.ArqAux.FieldByName('dt_desig').AsDateTime = 0 then
           dm.ArqAux.FieldByName('dt_desig').AsString := MaskEdit2.Text;
          dm.ArqAux.FieldByName('notificador').AsString := ComboBox2.Text;
          Dm.ArqAux.FieldByName('data_not2').asString := MaskEdit2.Text;
          Dm.ArqAux.FieldByName('cod_not2').asString   := Trim(MaskEdit3.Text);
          Dm.ArqAux.FieldByName('hora_not2').asString := Trim(MaskEdit4.Text);
          if RichEdit3.Lines.Count <= 0 Then
            Dm.ArqAux.FieldByName('obs_not2').asString := RichEdit1.Text;
          if tipon = 'P' then
          begin
            Dm.ArqAux.FieldByname('sit_not2').asString  := 'P';
          end
          else
          begin
            Dm.ArqAux.FieldByname('sit_not2').asString  := 'N';
            if DesejoEncerrar Then
            begin
              Dm.ArqAux.FieldByName('enc_not').asString := 'S';
            end;
          end;
          //Dm.ArqAux.FieldByName('obs_not2').asString := Trim(RichEdit1.Lines.Text);
          //if (MessageBox(Handle, PChar('Encerrar andamento da notificação ?'), 'ANDAMENTO DA NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
          //begin
          //  Dm.ArqAux.FieldByName('enc_not').asString := 'S';
          //end;
          Dm.ArqAux.Post;
          if (Dm.ArqAux.FieldByName('sit_not2').asString = 'P') then
          begin
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Baixa no andamento da notificação como POSITIVA em ' + MaskEdit2.Text + ' às ' + MaskEdit4.Text, Trim(Label7.Caption));
          end
          else
          begin
            if (Dm.ArqAux.FieldByName('enc_not').asString = 'S') then
            begin
              Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Baixa no andamento da notificação como NEGATIVA em ' + MaskEdit2.Text + ' às ' + MaskEdit4.Text + Trim(ComboBox1.Text) + '(ENCERRADO)', Trim(Label7.Caption));
            end
            else Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Baixa no andamento da notificação como NEGATIVA em ' + MaskEdit2.Text + ' às ' + MaskEdit4.Text + Trim(ComboBox1.Text) + '(NÃO ENCERRADO)', Trim(Label7.Caption));
          end;
          Dm.ArqAux.Next;
        end;
      end
      else if (Dm.ArqAux.FieldByName('data_not3').asDateTime = 0) or (Dm.ArqAux.FieldByName('data_not3').asDateTime >0) and (Dm.ArqAux.FieldByName('obs_not3').asString = '') then
      begin
        while (not Dm.ArqAux.Eof) do
        begin
          Dm.ArqAux.Edit;
          if dm.ArqAux.FieldByName('dt_desig').AsDateTime = 0 then
           dm.ArqAux.FieldByName('dt_desig').AsString := MaskEdit2.Text;
          dm.ArqAux.FieldByName('notificador').AsString := ComboBox2.Text;
          Dm.ArqAux.FieldByName('data_not3').asString := MaskEdit2.Text;
          Dm.ArqAux.FieldByName('cod_not3').asString   := Trim(MaskEdit3.Text);
          Dm.ArqAux.FieldByName('hora_not3').asString := Trim(MaskEdit4.Text);
          if RichEdit4.Lines.Count <= 0 Then
            Dm.ArqAux.FieldByName('obs_not3').asString := RichEdit1.Text;;

          if (tipon = 'P') then
          begin
            Dm.ArqAux.FieldByname('sit_not3').asString     := 'P';
          end
          else Dm.ArqAux.FieldByname('sit_not3').asString  := 'N';
          Dm.ArqAux.FieldByName('obs_not3').asString       := Trim(RichEdit1.Lines.Text);

          if DesejoEncerrar Then
            Dm.ArqAux.FieldByName('enc_not').asString        := 'S';

          Dm.ArqAux.Post;
          if (Dm.ArqAux.FieldByName('sit_not3').asString = 'P') then
          begin
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Baixa no andamento da notificação como POSITIVA em ' + MaskEdit2.Text + ' às ' + MaskEdit4.Text, Trim(Label7.Caption));
          end
          else
          begin
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Baixa no andamento da notificação como NEGATIVA em ' + MaskEdit2.Text + ' às ' + MaskEdit4.Text + Trim(ComboBox1.Text) + '(ENCERRADO)', Trim(Label7.Caption));
          end;
          Dm.ArqAux.Next;
        end;
      end;
      if DesejoEncerrar Then
      Begin
        Dm.ArqAux.Edit;
        Dm.ArqAux.FieldByName('enc_not').asString        := 'S';
        Dm.ArqAux.Post;
      End;
      Dm.ArqAux.Close;
      Dm.ArqAux.RequestLive := False;
    end;
  end;
  BitBtn3Click(F_BaixaN);
end;

procedure TF_BaixaN.MaskEdit2Exit(Sender: TObject);
 var
 resultado : String;
begin
  if (not ValidData(MaskEdit2.Text)) then
  begin
    ShowMessage('Data Inválida');
    MaskEdit2.SetFocus;
    Exit;
  end;

{  if verdatanot(maskedit1.text,maskedit2.text) then
  begin
      if mensagem = 'Número máximo de Diligências excedido (03)' then
      Begin
        ShowMessage(mensagem);
        bitbtn3.click;
        exit;
      end;
      ShowMessage(mensagem);
      Application.CreateForm(TF_Senha, F_Senha);
      F_Senha.ShowModal;
      if (not F_Senha.Senha_Ok) then
      begin
        F_Senha.Destroy;
        ShowMessage('Baixa Cancelada !');
        BitBtn3Click(F_BaixaN);
        Exit;
      end;
    end;


  {exit;


  if (StrToDate(Label16.Caption) > StrToDate('22/11/2004')) then
  begin
    //showmessage(Datetimetostr(date - 1));
    if ((Date - 1) > StrToDate(MaskEdit2.Text)) then
    begin
      ShowMessage('Impossível efetuar o andamento nesta data.');
      Application.CreateForm(TF_Senha, F_Senha);
      F_Senha.ShowModal;
      if (not F_Senha.Senha_Ok) then
      begin
        F_Senha.Destroy;
        ShowMessage('Baixa Cancelada !');
        BitBtn3Click(F_BaixaN);
        Exit;
      end;
    end;
  end;}
end;

procedure TF_BaixaN.FormActivate(Sender: TObject);
begin
  Carrega_Notificador(sender);
  BitBtn3Click(F_BaixaN);
end;

procedure TF_BaixaN.ComboBox1Enter(Sender: TObject);
begin
//  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_BaixaN.ComboBox1Exit(Sender: TObject);
begin
  if (Label17.Caption <> 'C') then
  begin
    //if ((Trim(MaskEdit3.Text) = '') OR (Trim(MaskEdit3.Text) = '0') or (Trim(MaskEdit3.Text) = '00000')) AND (Trim(ComboBox1.Text) <> '') then
      MaskEdit3.Text := Copy(ComboBox1.Text, 1,5);
      RichEdit1.Lines.Clear;
    //if (StrToInt(MaskEdit3.Text) > 1) then
      RichEdit1.Lines.Add(Copy(ComboBox1.Text, 9, 100));
    //else
    //RichEdit1.Lines.Clear;
  end;  
end;

procedure TF_BaixaN.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  Begin
    if ComboBox3.ItemIndex = 0 Then
    Begin
      Label1.Caption:= 'Registro Nº:';
      MaskEdit1.Enabled:= True;
      BitBtn2.Enabled:= True;
    End
    Else
    if ComboBox3.ItemIndex = 1 Then
    Begin
      Label1.Caption:= 'Protocolo Nº:';
      MaskEdit1.Enabled:= True;
      BitBtn2.Enabled:= True;
    End;
    MaskEdit1.Enabled:= True;
    MaskEdit2.SetFocus;
  End;
end;

procedure TF_BaixaN.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn2.SetFocus;
end;

procedure TF_BaixaN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.ArqAux1.Close;
end;

procedure TF_BaixaN.Corrigir1Click(Sender: TObject);
var
  campo1, campo2, campo3, campo4, campo5 : String;
begin
  Label18.Caption := '0';
  while (StrToInt(Label18.Caption) <= 0) do
  begin
    Label18.Caption := InputBox('ANDAMENTO DE NOTIFICAÇÕES', 'Corrigir a diligência número : ', '0');
    if (not ValidNumero(Label18.Caption)) then
    begin
      Label18.Caption := '0';
    end
    else
    begin
      if (StrToInt(Label18.Caption) > 3) then
      begin
        ShowMessage('Diligência inválida.');
        Label18.Caption := '0';
      end;
    end;
  end;
  if (StrToInt(Label18.Caption) >= 1) AND (StrToInt(Label18.Caption) <= 3) then
  begin
    campo1 := 'data_not' + Label18.Caption;
    campo2 := 'hora_not' + Label18.Caption;
    campo3 := 'cod_not'  + Label18.Caption;
    campo4 := 'obs_not'  + Label18.Caption;
    campo5 := 'sit_not'  + Label18.Caption;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT ' + campo1 + ',' + campo2 + ',' + campo3 + ',' + campo4 + ',' + campo5);
    Dm.ArqAux.Sql.Add('FROM td_pesso');
    Dm.ArqAux.Sql.Add('WHERE');
    Dm.ArqAux.Sql.Add('    protocolo = ' + Trim(Label7.Caption));
    Dm.ArqAux.Sql.Add('AND nome      = ' + Chr(39) + Trim(Dm.ArqAux1.FieldByName('nome').asString) + Chr(39));
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      ShowMessage('ATENÇÃO - Problemas para localizar o nome.');
      Dm.ArqAux.Close;
      Exit;
    end;
    MaskEdit3.Text := StrZero(Dm.ArqAux.FieldByname(campo3).asString, 5);
    ComboBox1.Text := MaskEdit3.Text + ' - ' + Ver_Ocorrencia(Dm.ArqAux.FieldByname(campo3).asString);
    MaskEdit2.Text := Dm.ArqAux.FieldByName(campo1).asString;
    MaskEdit4.Text := Dm.ArqAux.FieldByName(campo2).asString;
    RichEdit1.Lines.Add(Dm.ArqAux.FieldByName(campo4).asString);
    Dm.ArqAux.Close;
    BitBtn1.Caption := '&Gravar correção';
    Label17.Caption := 'C';
  end;
end;

procedure TF_BaixaN.DBGrid1Exit(Sender: TObject);
begin
  DbGrid1.Enabled := False;
end;

procedure TF_BaixaN.Excluir1Click(Sender: TObject);
var
  campo1, campo2, campo3, campo4, campo5 : String;
begin
  Label18.Caption := '0';
  while (StrToInt(Label18.Caption) <= 0) do
  begin
    Label18.Caption := InputBox('ANDAMENTO DE NOTIFICAÇÕES', 'Excluir a diligência número : ', '0');
    if (not ValidNumero(Label18.Caption)) then
    begin
      Label18.Caption := '0';
    end
    else
    begin
      if (StrToInt(Label18.Caption) > 3) then
      begin
        ShowMessage('Diligência inválida.');
        Label18.Caption := '0';
      end;
    end;
  end;
  if (StrToInt(Label18.Caption) >= 1) AND (StrToInt(Label18.Caption) <= 3) then
  begin 
    if (MessageBox(Handle, PChar('Excluir a baixa nº ' + Label18.Caption + '?'), 'EXCLUSÃO DE BAIXA DE NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
    begin
      campo1 := '';
      campo2 := '';
      campo3 := '';
      campo4 := '';
      campo5 := '';
      campo1 := 'data_not' + Label18.Caption;
      campo2 := 'hora_not' + Label18.Caption;
      campo3 := 'sit_not'  + Label18.Caption;
      campo4 := 'cod_not'  + Label18.Caption;
      campo5 := 'obs_not'  + Label18.Caption;
      Dm.ArqAux2.Close;
      Dm.ArqAux2.Sql.Clear;
      Dm.ArqAux2.Sql.Add('UPDATE td_pesso SET');
      Dm.ArqAux2.Sql.Add(campo1 + ' = NULL,');
      Dm.ArqAux2.Sql.Add(campo2 + ' = NULL,');
      Dm.ArqAux2.Sql.Add(campo3 + ' = NULL,');
      Dm.ArqAux2.Sql.Add(campo4 + ' = NULL,');
      Dm.ArqAux2.Sql.Add(campo5 + ' = NULL');
      Dm.ArqAux2.Sql.Add('WHERE');
      Dm.ArqAux2.Sql.Add('    registro = ' + Label7.Caption);
      Dm.ArqAux2.Sql.Add('AND nome     = ' + Chr(39) + Trim(Dm.ArqAux1.FieldByName('nome').asString) + Chr(39));
      Dm.ArqAux2.ExecSQL;
    end;                 
  end;
end;

procedure TF_BaixaN.AtualizaGridDeTentativasEntrega(sProtocolo: String);
begin
  if (ComboBox3.ItemIndex = 0) or (ComboBox3.Text = '') Then
  begin
    Qry_GridTentativas.Close;
    Qry_GridTentativas.Sql.Clear;
    Qry_GridTentativas.Sql.Add('SELECT cod_not1, cod_not2, cod_not3, b.data_not1, b.hora_not1, b.obs_not1, b.data_not2, ');
    Qry_GridTentativas.Sql.Add('b.hora_not2, b.obs_not2, b.data_not3, b.hora_not3, b.obs_not3 ');
    Qry_GridTentativas.Sql.Add('FROM td a INNER JOIN td_pesso b ');
    Qry_GridTentativas.Sql.Add('ON (a.protocolo = b.protocolo) WHERE a.protocolo = ' + Trim(sProtocolo));
    Qry_GridTentativas.Sql.Add('AND (b.data_not1 <> "") ');
    Qry_GridTentativas.Open;
  End
  Else
  Begin
    Qry_GridTentativas.Close;
    Qry_GridTentativas.Sql.Clear;
    Qry_GridTentativas.Sql.Add('SELECT cod_not1, cod_not2, cod_not3, b.data_not1, b.hora_not1, b.obs_not1, b.data_not2, ');
    Qry_GridTentativas.Sql.Add('b.hora_not2, b.obs_not2, b.data_not3, b.hora_not3, b.obs_not3 ');
    Qry_GridTentativas.Sql.Add('FROM td a INNER JOIN td_pesso b ');
    Qry_GridTentativas.Sql.Add('ON (a.protocolo = b.protocolo) WHERE b.registro = ' + Trim(sProtocolo));
    Qry_GridTentativas.Sql.Add('AND (b.data_not1 <> "") ');
    Qry_GridTentativas.Open;
  End;

  if (Qry_GridTentativas.FieldByName('cod_not1').AsString <> '') and (Qry_GridTentativas.FieldByName('cod_not1').AsString <> '0') Then
  Begin
    MaskEdit3.Text:=  StrZero(Trim(Qry_GridTentativas.FieldByName('cod_not1').AsString), 5);
    BuscaTextoCombo(Nil);
  End;

  if (Qry_GridTentativas.FieldByName('cod_not2').AsString <> '') and (Qry_GridTentativas.FieldByName('cod_not2').AsString <> '0') Then
  Begin
    MaskEdit3.Text:=  StrZero(Trim(Qry_GridTentativas.FieldByName('cod_not2').AsString), 5);
    BuscaTextoCombo(Nil);
  End;

  if (Qry_GridTentativas.FieldByName('cod_not3').AsString <> '') and (Qry_GridTentativas.FieldByName('cod_not3').AsString <> '0') Then
  Begin
    MaskEdit3.Text:=  StrZero(Trim(Qry_GridTentativas.FieldByName('cod_not3').AsString), 5);
    BuscaTextoCombo(Nil);
  End;
  MaskEdit2.Text:= DateToStr(Qry_GridTentativas.FieldByName('data_not1').AsDateTime);
  MaskEdit4.Text:= (Qry_GridTentativas.FieldByName('hora_not1').AsString);
  RichEdit3.Text:=  Qry_GridTentativas.FieldByName('obs_not1').AsString;

  MaskEdit5.Text:=  DateToStr(Qry_GridTentativas.FieldByName('data_not1').AsDateTime);

  if Qry_GridTentativas.FieldByName('data_not1').IsNull then
    MaskEdit5.Text:=  '';
  if Qry_GridTentativas.FieldByName('data_not1').IsNull then
    MaskEdit2.Text:=  '';

  MaskEdit6.Text:=  Qry_GridTentativas.FieldByName('hora_not1').AsString;
  RichEdit2.Text:=  Qry_GridTentativas.FieldByName('obs_not1').AsString;

  MaskEdit7.Text:=  DateToStr(Qry_GridTentativas.FieldByName('data_not2').AsDateTime);

  if Qry_GridTentativas.FieldByName('data_not2').IsNull then
    MaskEdit7.Text:=  '';

  MaskEdit8.Text:=  Qry_GridTentativas.FieldByName('hora_not2').AsString;
  RichEdit3.Text:=  Qry_GridTentativas.FieldByName('obs_not2').AsString;

  MaskEdit9.Text:=  DateToStr(Qry_GridTentativas.FieldByName('data_not3').AsDateTime);

  if Qry_GridTentativas.FieldByName('data_not3').IsNull then
    MaskEdit9.Text:=  '';

  MaskEdit10.Text:=  Qry_GridTentativas.FieldByName('hora_not3').AsString;
  RichEdit4.Text:=  Qry_GridTentativas.FieldByName('obs_not3').AsString;

  if MaskEdit1.Text <> '' Then
  Begin
    Dm.qryGenerico.Close;
    Dm.qryGenerico.Sql.Clear;
    Dm.qryGenerico.Sql.Add('SELECT enc_not FROM td_pesso WHERE protocolo = '+Trim(QuotedStr(Label7.Caption))+'');
    Dm.qryGenerico.SQL.Text;
    Dm.qryGenerico.Open;

    if Dm.qryGenerico.FieldByName('enc_not').asString = 'S' Then
    Begin
     { MaskEdit5.Enabled:= False;
      MaskEdit6.Enabled:= False;
      RichEdit2.Enabled:= False;

      MaskEdit7.Enabled:= False;
      MaskEdit8.Enabled:= False;
      RichEdit3.Enabled:= False;

      MaskEdit9.Enabled:= False;
      MaskEdit10.Enabled:= False;
      RichEdit4.Enabled:= False;}

      Panel2.Enabled:= False;
    End
    Else
    Panel2.Enabled:= True;
  End;
end;

procedure TF_BaixaN.BitBtn5Click(Sender: TObject);
begin
  Application.CreateForm(TF_ModeloCertidaoNotificacao, F_ModeloCertidaoNotificacao);
  F_ModeloCertidaoNotificacao.Showmodal;
  F_ModeloCertidaoNotificacao.Destroy;
  F_ModeloCertidaoNotificacao := NIL;
end;

function TF_BaixaN.AlimentaIndiceTipoBaixa: String;
var
  x : Integer;
begin
  dm.Cad_Ir.close;
  dm.cad_ir.sql.clear;
  dm.cad_ir.sql.add('select * from cad_ir where codigo = ' + MaskEdit3.Text);
  dm.Cad_Ir.open;
  result:= dm.Cad_Ir.FieldByName('motivo').AsString;
  UpdateWindow(Handle);
end;

procedure TF_BaixaN.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_BaixaN.ComboBox3Change(Sender: TObject);
begin
  if ComboBox3.ItemIndex = 0 Then
  Begin
    Label1.Caption:= 'Registro Nº:';
    MaskEdit1.Enabled:= True;
    BitBtn2.Enabled:= True;
  End
  Else
  if ComboBox3.ItemIndex = 1 Then
  Begin
    Label1.Caption:= 'Protocolo Nº:';
    MaskEdit1.Enabled:= True;
    BitBtn2.Enabled:= True;
  End;

end;

procedure TF_BaixaN.FormShow(Sender: TObject);
begin
  ComboBox3.ItemIndex:= 0;
end;

procedure TF_BaixaN.BitBtn6Click(Sender: TObject);
begin

  if (not Permissao('acesso115')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  Dm.qryGenerico_Auxiliar3.Close;
  Dm.qryGenerico_Auxiliar3.RequestLive := True;
  Dm.qryGenerico_Auxiliar3.Sql.Clear;
  Dm.qryGenerico_Auxiliar3.Sql.Add('UPDATE td_pesso SET enc_not = '+QuotedStr('N')+' ');
  Dm.qryGenerico_Auxiliar3.Sql.Add('WHERE');
  if (StrToInt(Label19.Caption) > 1) then
  begin
    if (MessageBox(Handle, PChar('Reabrir notificação?'), 'REABRIR NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
    begin

      if ComboBox3.ItemIndex = 0 Then
        Dm.qryGenerico_Auxiliar3.Sql.Add(' protocolo = ' + Trim(MaskEdit1.Text))
      else
      Dm.qryGenerico_Auxiliar3.Sql.Add(' p_auxiliar = ' + Trim(MaskEdit1.Text));

      Dm.qryGenerico_Auxiliar3.ExecSQL;

      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Notificação de protocolo: '+Label7.Caption+', foi reaberto' ,MaskEdit1.Text);

      MessageBox(Handle, PChar('Reabertura executada com sucesso!'), 'REABRIR NOTIFICAÇÃO', MB_OK);
      RestaurarInformacaoDaTela;
    end
    else
    MessageBox(Handle, PChar('Reabertura não executada!'), 'REABRIR NOTIFICAÇÃO', MB_OK);
  End;
end;

procedure TF_BaixaN.BitBtn7Click(Sender: TObject);
begin

  Dm.qryGenerico_Auxiliar3.Close;
  Dm.qryGenerico_Auxiliar3.RequestLive := True;
  Dm.qryGenerico_Auxiliar3.Sql.Clear;
  Dm.qryGenerico_Auxiliar3.Sql.Add('UPDATE td_pesso SET data_not1 = null, cod_not1 = "", hora_not1 = "", obs_not1 = "" ');
  Dm.qryGenerico_Auxiliar3.Sql.Add('WHERE');
  if (StrToInt(Label19.Caption) > 1) then
  begin
    if (MessageBox(Handle, PChar('Deseja limpar o registro de notificação?'), 'REABRIR NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
    begin

      if ComboBox3.ItemIndex = 0 Then
        Dm.qryGenerico_Auxiliar3.Sql.Add(' protocolo = ' + Trim(MaskEdit1.Text))
      else
      Dm.qryGenerico_Auxiliar3.Sql.Add(' p_auxiliar = ' + Trim(MaskEdit1.Text));

      Dm.qryGenerico_Auxiliar3.ExecSQL;


      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Notificação de protocolo: '+Label7.Caption+', foi reaberto' ,MaskEdit1.Text);

      RestaurarInformacaoDaTela;

      MessageBox(Handle, PChar('Rotina executada com sucesso!'), 'REABRIR NOTIFICAÇÃO', MB_OK);
    end
    else
    MessageBox(Handle, PChar('Rotina não executada!'), 'REABRIR NOTIFICAÇÃO', MB_OK);
  End;
end;

procedure TF_BaixaN.BitBtn8Click(Sender: TObject);
begin
  Dm.qryGenerico_Auxiliar3.Close;
  Dm.qryGenerico_Auxiliar3.RequestLive := True;
  Dm.qryGenerico_Auxiliar3.Sql.Clear;
  Dm.qryGenerico_Auxiliar3.Sql.Add('UPDATE td_pesso SET data_not2 = null, cod_not2 = "", hora_not2 = "", obs_not2 = "" ');
  Dm.qryGenerico_Auxiliar3.Sql.Add('WHERE');
  if (StrToInt(Label19.Caption) > 1) then
  begin
    if (MessageBox(Handle, PChar('Deseja limpar o registro de notificação?'), 'REABRIR NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
    begin

      if ComboBox3.ItemIndex = 0 Then
        Dm.qryGenerico_Auxiliar3.Sql.Add(' protocolo = ' + Trim(MaskEdit1.Text))
      else
      Dm.qryGenerico_Auxiliar3.Sql.Add(' p_auxiliar = ' + Trim(MaskEdit1.Text));

      Dm.qryGenerico_Auxiliar3.ExecSQL;

      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Notificação de protocolo: '+Label7.Caption+', foi reaberto' ,MaskEdit1.Text);

      RestaurarInformacaoDaTela;

      MessageBox(Handle, PChar('Rotina executada com sucesso!'), 'REABRIR NOTIFICAÇÃO', MB_OK);
    end
    else
    MessageBox(Handle, PChar('Rotina não executada!'), 'REABRIR NOTIFICAÇÃO', MB_OK);
  End;
end;

procedure TF_BaixaN.BitBtn9Click(Sender: TObject);
begin
  Dm.qryGenerico_Auxiliar3.Close;
  Dm.qryGenerico_Auxiliar3.RequestLive := True;
  Dm.qryGenerico_Auxiliar3.Sql.Clear;
  Dm.qryGenerico_Auxiliar3.Sql.Add('UPDATE td_pesso SET data_not3 = null, cod_not3 = "", hora_not3 = "", obs_not3 = "" ');
  Dm.qryGenerico_Auxiliar3.Sql.Add('WHERE');
  if (StrToInt(Label19.Caption) > 1) then
  begin
    if (MessageBox(Handle, PChar('Deseja limpar o registro de notificação?'), 'REABRIR NOTIFICAÇÃO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
    begin

      if ComboBox3.ItemIndex = 0 Then
        Dm.qryGenerico_Auxiliar3.Sql.Add(' protocolo = ' + Trim(MaskEdit1.Text))
      else
      Dm.qryGenerico_Auxiliar3.Sql.Add(' p_auxiliar = ' + Trim(MaskEdit1.Text));

      Dm.qryGenerico_Auxiliar3.ExecSQL;

      Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Notificação de protocolo: '+Label7.Caption+', foi reaberto' ,MaskEdit1.Text);

      RestaurarInformacaoDaTela;

      MessageBox(Handle, PChar('Rotina executada com sucesso!'), 'REABRIR NOTIFICAÇÃO', MB_OK);
    end
    else
    MessageBox(Handle, PChar('Rotina não executada!'), 'REABRIR NOTIFICAÇÃO', MB_OK);
  End;
end;

procedure TF_BaixaN.RestaurarInformacaoDaTela;
var
  posicao  :Integer;
  protocolo:String;
begin
  posicao  := ComboBox3.ItemIndex;
  protocolo:= MaskEdit1.Text;
  BitBtn3.Click;
  ComboBox3.ItemIndex:= posicao;
  MaskEdit1.Text     := protocolo;
  BitBtn2.Click;
end;

end.



