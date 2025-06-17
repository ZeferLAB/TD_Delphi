unit U_ConsDaje;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Grids, DBGrids, Buttons, Menus, UnMath,
  ComCtrls,DB,DBTables;

type
  TF_ConsDaje = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    CancelarSelo1: TMenuItem;
    MaskEdit4: TMaskEdit;
    Label1: TLabel;
    ComboBox2: TComboBox;
    MaskEdit3: TMaskEdit;
    BitBtn4: TBitBtn;
    DesbloquearDaje1: TMenuItem;
    JustificarDaje1: TMenuItem;
    BitBtn6: TBitBtn;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    CheckBox6: TCheckBox;
    Label2: TLabel;
    LbMenssagem: TLabel;
    BitBtn7: TBitBtn;
    Label4: TLabel;
    cbUsuario: TComboBox;
    StatusBar1: TStatusBar;
    LbTotal: TLabel;
    MaskEdit7: TMaskEdit;
    lbNome: TLabel;
    Button1: TButton;
    DeletarDaje1: TMenuItem;
    Vis1: TMenuItem;
    Label5: TLabel;
    MaskEdit8: TMaskEdit;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelarSelo1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DesbloquearDaje1Click(Sender: TObject);
    procedure JustificarDaje1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox6Click(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure cbUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure DeletarDaje1Click(Sender: TObject);
    procedure Vis1Click(Sender: TObject);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    procedure CorrigiUsuarioDAJE(sUsuario: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ConsDaje: TF_ConsDaje;

implementation

uses DMTD, Menu, U_Daje, ImagemDaje, FuncGeral, U_AjustaSeloDAJE,
  U_JustificarDaje;

{$R *.DFM}

procedure TF_ConsDaje.ComboBox1Change(Sender: TObject);
begin
  If (ComboBox1.ItemIndex = 1) then //Data da Emissão
  Begin
    MaskEdit1.Clear;
    MaskEdit1.EditMask  := '';
    MaskEdit1.EditMask  := '!99/99/9999;1;_';
    MaskEdit1.Width     := 117;
    MaskEdit2.Visible   := False;
    MaskEdit7.Visible   := True;
    lbNome.Visible      := True;
  End
  Else
  Begin
    MaskEdit1.EditMask := '';
    MaskEdit1.Width    := 40;
    MaskEdit2.Visible  := True;
    MaskEdit7.Visible   := False;
    lbNome.Visible      := False;    
  End;
end;

procedure TF_ConsDaje.FormActivate(Sender: TObject);
begin
  ComboBox1.ItemIndex := 0;
  MaskEdit1.SetFocus;
end;

procedure TF_ConsDaje.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_ConsDaje.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
  Begin
    If ComboBox1.ItemIndex = 0 then
      MaskEdit2.SetFocus
    Else
    if MaskEdit7.Visible then
      MaskEdit7.SetFocus
    Else
    BitBtn1.SetFocus;
  End;
end;

procedure TF_ConsDaje.BitBtn1Click(Sender: TObject);
var
   sDataEmissao,
   sDataVencimento,
   sHora: String;
   VrDaje_1, EmolDaje_1, TaxaFiscalDaje_1, FecomDaje_1, DefPublicaDaje_1, fmmpba_1: currency;
   iPos: Integer;
   emissor,
   TipoDaje: String;
begin
  LbMenssagem.Visible:= False;

  TipoDaje:= '';

  if MaskEdit8.Text <> '' then
  begin
    emissor:= MaskEdit8.Text;
  end
  else
  begin
    emissor:= MaskEdit4.Text;
  end;

  IF cbUsuario.Text = '' Then
  Begin
    if (Not(Dm.ExistirDaje(MaskEdit1.Text, MaskEdit2.Text))) AND (ComboBox1.ItemIndex = 0) Then
    begin
      If ConsultarDaje(emissor, MaskEdit1.Text,MaskEdit2.Text, emissor) then
      begin


        if (_CodigoAtoDaje = '22010') or (_CodigoAtoDaje = '22012') or (_CodigoAtoDaje = '22101') or (_CodigoAtoDaje = '23027') or
          (_CodigoAtoDaje = '22010') or (_CodigoAtoDaje = '22012') or (_CodigoAtoDaje = '22101') or (_CodigoAtoDaje = '23027') Then
        Begin
          Application.MessageBox('O Daje informado não é de Títulos e Documentos!', 'Baixa de Títulos', Mb_IconInformation);
          Exit;
        End;

        if (_CodigoAtoDaje = '24040') or (_CodigoAtoDaje = '24031') or (_CodigoAtoDaje = '24015') or (_CodigoAtoDaje = '24041') or (_CodigoAtoDaje = '24018') Then
          TipoDaje:= 'CERTIDÃO'
        else
        if (_CodigoAtoDaje = '23035') OR (_CodigoAtoDaje = '24020') Then
          TipoDaje:= 'NOTIFICAÇÃO EXTRAJUDICIAL'
        else
        if (_CodigoAtoDaje = '19011') Then
          TipoDaje:= 'CANCELAMENTO'
        else
        if (_CodigoAtoDaje = '23027') Then
          TipoDaje:= 'AVERBAÇÃO'
        else
        if (_CodigoAtoDaje = '24050') Then
          TipoDaje:= 'LIVROS FISCAIS OU CONTABEIS'
        else
        TipoDaje:= 'REGISTRO';



        Dm.ArqAux.Close;
        Dm.ArqAux.SQL.Clear;
        Dm.ArqAux.SQL.Add(' select * from  daje where ');
        Dm.ArqAux.SQL.Add(' serie_daje ='+QuotedStr(StrZero(MaskEdit1.Text,3)));
        Dm.ArqAux.SQL.Add(' and numero_daje ='+QuotedStr(MaskEdit2.Text));
        Dm.ArqAux.open;
        if (Dm.ArqAux.isempty) then
        begin

          sDataEmissao   := Copy(_DataEmissaoDaje, 1, 10);
          sHora          := Copy(_DataEmissaoDaje, 12, 8);
          sDataVencimento:= Copy(_DataVencimentoDaje, 1, 10);

          Dm.ArqAux2.Close;
          Dm.ArqAux2.SQL.Clear;
          Dm.ArqAux2.SQL.Add('insert into daje (data_emi, data_ven, cod_ato, atribuicao, qtd, contribuinte,   ');                                                           //_EmolImp;  2017
          Dm.ArqAux2.SQL.Add('tipo_doc, doc, serie_daje, numero_daje, usuario, vr_daje, vr_declarado, status, iddaje_tj, emol_daje, tx_fisca_daje, fecom_daje, def_pub_daje, vr_pge, fmmpba) ');
          Dm.ArqAux2.SQL.Add('values (');
          Dm.ArqAux2.SQL.Add(       QuotedStr( FormatDateTime('yyyy-mm-dd',  StrToDate(sDataEmissao)) ));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr( FormatDateTime('yyyy-mm-dd',  StrToDate(sDataVencimento)) ));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(_CodigoAtoDaje));
          Dm.ArqAux2.SQL.Add(', '+QuotedStr(TipoDaje)+'');                   
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(IntToStr(_QtdeDaje)));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(Trim(_ContribuinteDaje)));
          if ( Length(_CpfCnpjContribuinteDaje) > 11) then
            Dm.ArqAux2.SQL.Add(', ' + QuotedStr('CNPJ'))
          else
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr('CPF'));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(_CpfCnpjContribuinteDaje));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(StrZero(MaskEdit1.Text,3)));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(MaskEdit2.Text));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(F_Menu.Label25.Caption));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(StringReplace(FloatToStr(_ValorDaje), ',', '.', [rfReplaceAll])));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(StringReplace(FloatToStr(_ValorAtoPraticadoDaje), ',', '.', [rfReplaceAll])));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(_StatusDaje));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(emissor));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(StringReplace(FloatToStr(_EmolDaje), ',', '.', [rfReplaceAll])));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(StringReplace(FloatToStr(_TaxaFiscalDaje), ',', '.', [rfReplaceAll])));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(StringReplace(FloatToStr(_FecomDaje), ',', '.', [rfReplaceAll])));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(StringReplace(FloatToStr(_DefPublicaDaje), ',', '.', [rfReplaceAll])));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(StringReplace(FloatToStr(_PGE), ',', '.', [rfReplaceAll])));
          Dm.ArqAux2.SQL.Add(', ' + QuotedStr(StringReplace(FloatToStr(_FMMPBA), ',', '.', [rfReplaceAll])));
          Dm.ArqAux2.SQL.Add(') ');
          Try
            Dm.ArqAux2.ExecSql;

            if (_EmolDaje <= 0) Then
            Begin
              VrDaje_1          := _ValorDaje;
              EmolDaje_1        := RoundTo(((VrDaje_1 * emol_daje)/100),    -2);
              TaxaFiscalDaje_1  := RoundTo(((VrDaje_1 * tx_fisc_daje)/100), -2);
              FecomDaje_1       := RoundTo(((VrDaje_1 * fecom_daje)/100),   -2);
              DefPublicaDaje_1  := RoundTo(((VrDaje_1 * def_pub_daje)/100), -2);
              fmmpba_1          := RoundTo(((VrDaje_1 * fmmpba)/100), -2);

              Dm.qryGenerico_Auxiliar3.Close;
              Dm.qryGenerico_Auxiliar3.SQL.Clear;
              Dm.qryGenerico_Auxiliar3.SQL.Add('update daje set');
              Dm.qryGenerico_Auxiliar3.SQL.Add('emol_daje      = ' + QuotedStr(StringReplace(FloatToStr(EmolDaje_1), ',', '.', [rfReplaceAll])));
              Dm.qryGenerico_Auxiliar3.SQL.Add(',tx_fisca_daje = ' + QuotedStr(StringReplace(FloatToStr(TaxaFiscalDaje_1), ',', '.', [rfReplaceAll])));
              Dm.qryGenerico_Auxiliar3.SQL.Add(',fecom_daje    = ' + QuotedStr(StringReplace(FloatToStr(FecomDaje_1), ',', '.', [rfReplaceAll])));
              Dm.qryGenerico_Auxiliar3.SQL.Add(',def_pub_daje  = ' + QuotedStr(StringReplace(FloatToStr(DefPublicaDaje_1), ',', '.', [rfReplaceAll])));
              Dm.qryGenerico_Auxiliar3.SQL.Add(',fmmpba        = ' + QuotedStr(StringReplace(FloatToStr(fmmpba_1), ',', '.', [rfReplaceAll])));
              Dm.qryGenerico_Auxiliar3.SQL.Add('where serie_daje = ' + StrZero(MaskEdit1.Text,3)+' and numero_daje = '+QuotedStr(MaskEdit2.Text)+'' );
              Dm.qryGenerico_Auxiliar3.ExecSQL;
            End;

          Except
          End;
          if (_EmolDaje <=0) or (_TaxaFiscalDaje <= 0) Then
          begin
            ShowMessage('Daje incluso com sucesso, porém, a importação do tribunal não retornou o valor dos emolumentos. '+
                        'Por favor, entre no menu URILITÁRIOS, e clique na opção AJUSTAR DAJE. Preencha então os emolumentos conforme impresso nos DAJES.');
            BitBtn1.OnClick(Self);
          end
          else
          begin
            ShowMessage('Daje incluso com sucesso.');
            BitBtn1.OnClick(Self);
          end
        end
        else
        ShowMessage('Daje já existe.');
      end;
    end
    Else
    Begin  
      if MaskEdit1.Text = '  /  /    ' Then
      Begin
        ShowMessage('Campo data de emissão deve ser preenchido!');
        MaskEdit1.SetFocus;
        Abort;
      End;

      if MaskEdit7.Visible then
      begin
        if MaskEdit7.Text = '  /  /    ' Then
        Begin
          ShowMessage('Campo data de emissão deve ser preenchido!');
          MaskEdit7.SetFocus;
          Abort;
        End;
      End;

      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('select * from daje where ');
      If ComboBox1.ItemIndex = 0 then
        Dm.ArqAux.Sql.Add(' serie_daje = ' + QuotedStr(StrZero(MasKedit1.Text,3)) + ' AND numero_daje = ' + MaskEdit2.Text)
      Else
      Dm.ArqAux.Sql.Add(' data_emi >= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit1.Text))) + ' ');

      if MaskEdit7.Visible then
        Dm.ArqAux.Sql.Add('and data_emi <= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit7.Text))) + ' ');

      Dm.ArqAux.Sql.Add(' order by serie_daje, numero_daje');
      Dm.ArqAux.Open;


      If Dm.ArqAux.RecordCount <> 0 then
      begin
        BitBtn2.Enabled := True;
        BitBtn5.Enabled := True;
      end
      Else
      ShowMessage('Dados não Localizados.');
    End;
  End
  Else
  Begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('select * from daje where ');
    Dm.ArqAux.Sql.Add(' usuario = ' + QuotedStr(cbUsuario.Text)+'');

    If ComboBox1.ItemIndex = 1 then
    Begin
      if MaskEdit1.Text = '  /  /    ' Then
      Begin
        ShowMessage('Campo data de emissão deve ser preenchido!');
        MaskEdit1.SetFocus;
        Abort;
      End;

      if MaskEdit7.Text = '  /  /    ' Then
      Begin
        ShowMessage('Campo data de emissão deve ser preenchido!');
        MaskEdit7.SetFocus;
        Abort;
      End;  

      Dm.ArqAux.Sql.Add(' and data_emi >= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit1.Text))) + ' ');
      Dm.ArqAux.Sql.Add('and data_emi <= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit7.Text))) + ' ');
    End;

    Dm.ArqAux.Sql.Add(' order by serie_daje, numero_daje');
    Dm.ArqAux.Open;

    Dm.qryGenerico.Close;
    Dm.qryGenerico.Sql.Clear;
    Dm.qryGenerico.Sql.Add('select count(*) as QTD from daje where ');
    Dm.qryGenerico.Sql.Add(' usuario = ' + QuotedStr(cbUsuario.Text)+' ');

    If ComboBox1.ItemIndex = 1 then
    Begin
      if MaskEdit1.Text = '  /  /    ' Then
      Begin
        ShowMessage('Campo data de emissão deve ser preenchido!');
        MaskEdit1.SetFocus;
        Abort;
      End;

      if MaskEdit7.Text = '  /  /    ' Then
      Begin
        ShowMessage('Campo data de emissão deve ser preenchido!');
        MaskEdit7.SetFocus;
        Abort;
      End;
      
      Dm.qryGenerico.Sql.Add(' and data_emi >= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit1.Text))) + ' ');
      Dm.qryGenerico.Sql.Add('and data_emi <= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit7.Text))) + ' ');
    End;

    Dm.qryGenerico.Sql.Add(' order by serie_daje, numero_daje');
    Dm.qryGenerico.Open;

    LbTotal.Caption := 'Quant. de Dajes Emitidos:  '+Dm.qryGenerico.FieldByName('QTD').AsString;


    if Dm.ArqAux.RecordCount <> 0 then
    begin
      BitBtn2.Enabled := True;
      BitBtn5.Enabled := True;
    end
    Else
    ShowMessage('Dados não Localizados.');
  End

end;

procedure TF_ConsDaje.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ConsDaje.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
  Begin
    if MaskEdit7.Visible then
      MaskEdit7.SetFocus
    else  
    BitBtn1.SetFocus;
  End;
end;

procedure TF_ConsDaje.BitBtn2Click(Sender: TObject);
var
 emissor: String;
begin

  if MaskEdit8.Text <> '' then
  begin
    emissor:= MaskEdit8.Text;
  end
  else
  begin
    emissor:= MaskEdit4.Text;
  end;

  if application.messagebox(pchar('iniciar Atualização dos DAJE´s ?'),'Confirmação',mb_iconquestion + mb_yesno) = id_yes then
  Begin
    Dm.ArqAux.FindFirst;
    While (NOT Dm.ArqAux.Eof) Do
    Begin
      If ConsultarDaje(emissor, Dm.ArqAux.FieldByName('serie_daje').AsString, Dm.ArqAux.FieldByName('numero_daje').AsString, emissor) then
      Begin
        If (_StatusDaje = 'Pago') or (_StatusDaje = 'Isento') then
        Begin
          Dm.ArqAux2.Close;
          Dm.ArqAux2.Sql.Clear;
          Dm.ArqAux2.Sql.Add('update daje set status = ' + QuotedStr(_StatusDaje) + ' where id = ' + Dm.ArqAux.FieldByname('id').AsString);
          Try
            Dm.ArqAux2.ExecSql;
          Except
          End;
        End;
      End;
      Dm.ArqAux.Next;
    End;
    ShowMessage('Fim do Processo.');
    BitBtn1.OnClick(Self);
  End;

end;

procedure TF_ConsDaje.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Dm.ArqAux.FieldByName('status').AsString = 'Liberado Manualmente' then
  begin
    dbgrid1.Canvas.Font.Color := clBlue;
    dbgrid1.Canvas.Font.Style :=[fsBold];
    dbgrid1.Canvas.FillRect(Rect);
    dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  Else if (Dm.ArqAux.FieldByName('status').AsString = 'Pago') or (Dm.ArqAux.FieldByName('status').AsString = 'Isento') then
  begin
    dbgrid1.Canvas.Font.Color := clGreen;
    dbgrid1.Canvas.Font.Style :=[fsBold];
    dbgrid1.Canvas.FillRect(Rect);
    dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  begin
    dbgrid1.Canvas.Font.Color:= clRed;
    dbgrid1.Canvas.FillRect(Rect);
    dbgrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if Dm.ArqAux.RecordCount > 0 Then
  Begin
    BitBtn6.Enabled:= True;
  End
  Else
  Begin
    BitBtn6.Enabled:= False;
  End;

end;

procedure TF_ConsDaje.DBGrid1DblClick(Sender: TObject);
var
  {dir_daje,} img_daje : String;
  s : WordBool;
begin
  //dir_daje := F_Menu.Label5.Caption + '\img_daje\';
  if (Dm.ArqAux.FieldByName('isento').AsString <> 'S') then
  begin
    img_daje := StrZero(Dm.ArqAux.FieldByName('serie_daje').AsString,3) + '_' + StrZero(Dm.ArqAux.FieldByName('numero_daje').AsString,6) + '.pdf';
    FrmImagemDaje:= TFrmImagemDaje.Create(Nil);
    FrmImagemDaje.AcroPDF1.LoadFile(dir_daje + 'Recep\' + img_daje, s);
    FrmImagemDaje.ShowModal;
    //FrmImagemDaje.Destroy;
    FrmImagemDaje := Nil;
  end
  else ShowMessage('DAJE Isento. Não pode ser impresso!');
end;

procedure TF_ConsDaje.BitBtn5Click(Sender: TObject);
var
 emissor: String;
begin
  if (not Permissao('acesso072')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÕES', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  if MaskEdit8.Text <> '' then
  begin
    emissor:= MaskEdit8.Text;
  end
  else
  begin
    emissor:= MaskEdit4.Text;
  end;

  if application.messagebox(pchar('Liberar DAJE manualmente ?'),'Confirmação',mb_iconquestion + mb_yesno) = id_yes then
  Begin
    {Dm.ArqAux.FindFirst;
    While (NOT Dm.ArqAux.Eof) Do
    Begin}
      //ver qual a chamada da liberação
      If PagarDajeManual(emissor, Dm.ArqAux.FieldByName('serie_daje').AsString, Dm.ArqAux.FieldByName('numero_daje').AsString, emissor) then
      Begin
        {If _StatusDaje = 'Pago' then
        Begin}
          Dm.ArqAux2.Close;
          Dm.ArqAux2.Sql.Clear;
          Dm.ArqAux2.Sql.Add('update daje set status = "Liberado Manualmente", usuario_liberou = ' + QuotedStr(F_Menu.Label25.Caption) + ' where id = ' + Dm.ArqAux.FieldByname('id').AsString);
          Try
            Dm.ArqAux2.ExecSql;
          Except
          End;
        //End;
      End;
      {Dm.ArqAux.Next;
    End; }
    ShowMessage('Liberação efetuada com sucesso!');
    BitBtn1.OnClick(Self);
  End;
end;

procedure TF_ConsDaje.MaskEdit1Exit(Sender: TObject);
begin
  if (trim(copy(MaskEdit1.Text,1,3)) <> '') then
    MaskEdit1.Text := StrZero(Trim(MaskEdit1.Text), 3);
end;

procedure TF_ConsDaje.MaskEdit2Exit(Sender: TObject);
begin
  if (trim(copy(MaskEdit2.Text,1,6)) <> '') then
    MaskEdit2.Text := StrZero(Trim(MaskEdit2.Text), 6);
end;

procedure TF_ConsDaje.FormCreate(Sender: TObject);
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('select * from daje where data_emi <= "2000-01-01"');
  Dm.ArqAux.Open;

  Dm.qryGenerico.Close;
  Dm.qryGenerico.SQL.Clear;
  Dm.qryGenerico.SQL.Add('SELECT * FROM configur');
  Dm.qryGenerico.Open;

  MaskEdit4.Text:= Dm.qryGenerico.FieldByName('id_eselo').AsString;

  if F_Menu.Label25.Caption = 'SISCART' Then
    Button1.Visible:= True;

  dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('select u_apel from usuarios where u_apel <> '+QuotedStr('SISCART')+' group by u_apel order by u_apel');
  dm.qryGenerico.Open;

  cbUsuario.Clear;

  dm.qryGenerico.First;

  cbUsuario.Items.Add('');

  while not dm.qryGenerico.eof do
  begin
    cbUsuario.Items.Add(dm.qryGenerico.FieldByName('u_apel').AsString);
    dm.qryGenerico.Next;
  end;  

end;

procedure TF_ConsDaje.CancelarSelo1Click(Sender: TObject);
begin
  if CancelarSelo(id_eselo, TirarTudo(Dm.ArqAux.FieldByName('numero_selo').AsString, '.', '-', '/'), '1') then
  begin
    Dm.ArqAux2.Close;
    Dm.ArqAux2.Sql.Clear;
    Dm.ArqAux2.Sql.Add('update daje set numero_selo_canc = numero_selo, cod_validacao_canc = cod_validacao, usuario_selo_canc = ' + QuotedStr(F_Menu.Label25.Caption) + ' where id = ' + Dm.ArqAux.FieldByname('id').AsString);
    Try
      Dm.ArqAux2.ExecSql;
      Dm.ArqAux2.Close;
      Dm.ArqAux2.Sql.Clear;
      Dm.ArqAux2.Sql.Add('update daje set numero_selo = null, cod_validacao = null, usuario_selo = null where id = ' + Dm.ArqAux.FieldByname('id').AsString);
      Try
        Dm.ArqAux2.ExecSql;
      Except
      End;
    Except
    End;
  end;
end;

procedure TF_ConsDaje.PopupMenu1Popup(Sender: TObject);
var
  ndaje, sdaje : String;
begin
  ndaje := StrZero(MaskEdit2.Text,6);
  sdaje := StrZero(MaskEdit1.Text,3);
  if (Trim(Dm.ArqAux.FieldByname('numero_selo').AsString) <> '') then
  begin
    DM.ArqAux2.Close;
    DM.ArqAux2.Sql.Clear;
    DM.ArqAux2.Sql.Add('SELECT daje, p_auxiliar FROM td WHERE (daje = ' + QuotedStr(ndaje));
    DM.ArqAux2.Sql.Add(' and serie_daje = ' + QuotedStr(sdaje) + ') or (dajepost = ' + QuotedStr(sdaje+ndaje));
    DM.ArqAux2.Sql.Add(') or (dajevias = ' + QuotedStr(sdaje+ndaje) + ')');
    DM.ArqAux2.Open;
    if (DM.ArqAux2.RecordCount <> 0) then
    begin
      DM.ArqAux1.Close;
      DM.ArqAux1.Sql.Clear;
      DM.ArqAux1.Sql.Add('SELECT * FROM td_cert WHERE p_auxiliar = ' + QuotedStr(DM.ArqAux2.FieldByName('p_auxiliar').AsString));
      DM.ArqAux1.Open;
      if (DM.ArqAux1.RecordCount <> 0) then
      begin
        CancelarSelo1.Enabled := False;
        ShowMessage('Favor retornar o status do protocolo ' + DM.ArqAux2.FieldByName('p_auxiliar').AsString + ' para exame.');
      end
      else
      begin  //terminar aqui...
        DM.ArqAux1.Close;
        DM.ArqAux1.Sql.Clear;
        DM.ArqAux1.Sql.Add('SELECT daje FROM certidao WHERE daje = ' + QuotedStr(ndaje));
        DM.ArqAux1.Sql.Add(' and serie_daje = ' + QuotedStr(sdaje));
        DM.ArqAux1.Open;
      end;
    End;
    CancelarSelo1.Enabled := True;
  end
  else
    CancelarSelo1.Enabled := False;
end;

procedure TF_ConsDaje.BitBtn4Click(Sender: TObject);
var
  qry : Tquery;
begin
    if (ComboBox2.Text = '') and (MaskEdit3.Text = '') Then
    Begin
      ShowMessage('Informe o tipo de vínculo que será realizado!');
      Abort;
    End;
  qry:= Tquery.create(nil);
  qry.databasename:=Dm.qryGenerico.databasename;
  qry.Close;
  qry.sql.Add('select * from daje where serie_daje = '+ QuotedStr(MaskEdit1.text));
  qry.sql.add(' '+'and numero_daje ='+QuotedStr(MaskEdit2.text));
  qry.open;
  qry.last;
  if qry.RecordCount > 0 then
  begin
    If ComboBox2.Text = 'Protocolo' Then
    Begin
      If ValidNumero(MaskEdit3.Text) then
      Begin
        Dm.qryGenerico.Close;
        Dm.qryGenerico.SQL.Clear;
        Dm.qryGenerico.SQL.Add('SELECT protocolo FROM td WHERE protocolo = ' + QuotedStr(MaskEdit3.Text));
        Dm.qryGenerico.Open;

        if (Not(Dm.qryGenerico.IsEmpty)) Then
        Begin
          if Application.MessageBox( Pchar('Deseja vincular o protocolo ao daje informado?'),'Vincular Protocolo',MB_ICONQUESTION + MB_YESNO ) = Id_no then
            Abort;
        End;

        Dm.qryGenerico.Close;
        Dm.qryGenerico.SQL.Clear;
        Dm.qryGenerico.SQL.Add('SELECT * FROM td WHERE daje = ' + QuotedStr(MaskEdit2.Text));
        Dm.qryGenerico.SQL.Add('AND serie_daje = ' + QuotedStr(StrZero(MaskEdit1.Text,3)));
        Dm.qryGenerico.SQL.Add('AND selo is not null ');
        Dm.qryGenerico.Open;

        if (Not(Dm.qryGenerico.IsEmpty)) Then
        Begin
          ShowMessage('Não é permitido vincular um daje a um protocolo ja selado!');
          sProtocoloVinculado:= '';
          Abort;
        End;

        Dm.ArqAux2.Close;
        Dm.ArqAux2.Sql.Clear;
        Dm.ArqAux2.Sql.Add('update td set ');
        Dm.ArqAux2.Sql.Add('  daje = ' + QuotedStr(MaskEdit2.Text));
        Dm.ArqAux2.Sql.Add(', serie_daje = ' + QuotedStr(StrZero(MaskEdit1.Text,3)));
        Dm.ArqAux2.Sql.Add(' where p_auxiliar = ' + MaskEdit3.Text);
        Dm.ArqAux2.ExecSql;
        sProtocoloVinculado:= MaskEdit3.Text;

        ShowMessage('Daje vinculado com sucesso!');
      End;
    End
    Else
    If ComboBox2.Text = 'Certidão' Then
    Begin
      If ValidNumero(MaskEdit3.Text) then
      Begin

        Dm.qryGenerico.Close;
        Dm.qryGenerico.SQL.Clear;
        Dm.qryGenerico.SQL.Add('SELECT nr_protoc FROM certidao WHERE nr_protoc = ' + QuotedStr(MaskEdit3.Text));
        Dm.qryGenerico.Open;

        if (Not(Dm.qryGenerico.IsEmpty)) Then
        Begin
          if Application.MessageBox( Pchar('Deseja vincular o protocolo ao daje informado?'),'Vincular Certidão',MB_ICONQUESTION + MB_YESNO ) = Id_no then
            Abort;
        End;

        Dm.qryGenerico.Close;
        Dm.qryGenerico.SQL.Clear;
        Dm.qryGenerico.SQL.Add('SELECT * FROM certidao WHERE daje = ' + QuotedStr(MaskEdit2.Text));
        Dm.qryGenerico.SQL.Add('AND serie_daje = ' + QuotedStr(StrZero(MaskEdit1.Text,3)));
        Dm.qryGenerico.SQL.Add('AND selo is not null ');
        Dm.qryGenerico.Open;

        if (Not(Dm.qryGenerico.IsEmpty)) Then
        Begin
          ShowMessage('Não é permitido vincular um daje a uma certidão ja selada!');
          sProtocoloVinculado:= '';
          Abort;
        End;


        Dm.ArqAux2.Close;
        Dm.ArqAux2.Sql.Clear;
        Dm.ArqAux2.Sql.Add('update certidao set ');
        Dm.ArqAux2.Sql.Add('  daje = ' + QuotedStr(MaskEdit2.Text));
        Dm.ArqAux2.Sql.Add(', serie_daje = ' + QuotedStr(StrZero(MaskEdit1.Text,3)));
        Dm.ArqAux2.Sql.Add(' where nr_protoc = ' + MaskEdit3.Text);
        Dm.ArqAux2.ExecSql;
        sProtocoloVinculado:= MaskEdit3.Text;
        ShowMessage('Daje vinculado com sucesso!');
      End;
    End;
   end
   else
   begin
     showmessage('Favor consultar o Daje');
     exit;
   end;
end;

procedure TF_ConsDaje.DesbloquearDaje1Click(Sender: TObject);
var
 emissor: String;
begin
  if (Not(dm.ArqAux.IsEmpty)) Then
  Begin
    if (MaskEdit4.Text = '') Then
    Begin
      Application.MessageBox(PChar('Campo: Emissor, deve ser preenchido!'), 'Notas',MB_OK+MB_ICONEXCLAMATION);
      Abort;
    End;

    if (dm.ArqAux.FieldByName('numero_daje').isNull) Then
    Begin
      Application.MessageBox(PChar('Campo: Número do Daje, deve ser preenchido!'), 'Notas',MB_OK+MB_ICONEXCLAMATION);
      Abort;
    End;

    if (dm.ArqAux.FieldByName('serie_daje').isNull) Then
    Begin
      Application.MessageBox(PChar('Campo: Série, deve ser preenchido!'), 'Notas',MB_OK+MB_ICONEXCLAMATION);
      Abort;
    End;

    if MaskEdit8.Text <> '' then
    begin
      emissor:= MaskEdit8.Text;
    end
    else
    begin
      emissor:= MaskEdit4.Text;
    end;

    DesbloquearDaje(emissor, dm.ArqAux.FieldByName('serie_daje').AsString, dm.ArqAux.FieldByName('numero_daje').AsString);

  End;

end;

procedure TF_ConsDaje.JustificarDaje1Click(Sender: TObject);
var
  cod_emissor: String;
  emissor: String;
begin

  if MaskEdit8.Text <> '' then
  begin
    emissor:= MaskEdit8.Text;
  end
  else
  begin
    emissor:= MaskEdit4.Text;
  end;


  if (ComboBox1.Text = 'Daje') then
  begin
    if VerificarDajeJustificado(StrToInt(emissor), StrToInt(Dm.ArqAux.FieldByName('serie_daje').AsString), StrToInt(Dm.ArqAux.FieldByName('numero_daje').AsString)) = 600 then
    begin
      LbMenssagem.Visible := True;
    end;

    //cod_emissor := MaskEdit4.Text;

    If LbMenssagem.Visible Then
    Begin
      Application.CreateForm(TF_JustificarDaje, F_JustificarDaje);
      F_JustificarDaje.emis    := StrToInt(emissor);
      F_JustificarDaje.serie   := Dm.ArqAux.FieldbyName('serie_daje').AsInteger;
      F_JustificarDaje.numero  := Dm.ArqAux.FieldbyName('numero_daje').AsInteger;
      F_JustificarDaje.ShowModal;
      F_JustificarDaje.Destroy;
      F_JustificarDaje := nil;
    End;
  end;
end;

procedure TF_ConsDaje.BitBtn6Click(Sender: TObject);
begin
  if (not Permissao('acesso112')) then
  begin
    MessageBox(Handle, PChar('ACESSO NEGADO !'), 'PERMISSÃO', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  Application.CreateForm(TF_AjustaSeloDAJE, F_AjustaSeloDAJE);
  F_AjustaSeloDAJE.sNumeroDaje:= dm.ArqAux.FieldByName('numero_daje').AsString;
  F_AjustaSeloDAJE.sSerieDaje := dm.ArqAux.FieldByName('serie_daje').AsString;
  F_AjustaSeloDAJE.sId        := dm.ArqAux.FieldByName('id').AsString;
  F_AjustaSeloDAJE.ShowModal;
  F_AjustaSeloDAJE.Destroy;
  F_AjustaSeloDAJE := NIl;
end;

procedure TF_ConsDaje.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
  Begin
    MaskEdit6.SetFocus;
  End;
end;

procedure TF_ConsDaje.CheckBox6Click(Sender: TObject);
begin
  if CheckBox6.Checked Then
  Begin
    Label2.Visible:= True;
    MaskEdit5.Visible:= True;
    MaskEdit6.Visible:= True;
    BitBtn7.Enabled := True;
  End
  Else
  Begin
    Label2.Visible:= False;
    MaskEdit5.Visible:= False;
    MaskEdit6.Visible:= False;
    BitBtn7.Enabled := False;
  End;
end;

procedure TF_ConsDaje.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
  Begin
     MaskEdit1.SetFocus;
  End;
end;

procedure TF_ConsDaje.BitBtn7Click(Sender: TObject);
var
  qry2 : Tquery;
begin
    If CheckBox6.Checked Then
    Begin
      if (Not(Dm.ExistirDaje(MaskEdit5.Text, MaskEdit6.Text))) Then
      Begin
        Application.MessageBox('Daje complementar não encontrado na tabela daje!', 'Mensagem do Sistema', mb_ok);
        Exit;
      End;

      if MaskEdit5.Text = '' Then
      Begin
        Application.MessageBox('Campo: Série, deve ser informado !', 'Mensagem do Sistema', mb_ok);
        Exit;
      End;

      if MaskEdit6.Text = '' Then
      Begin
        Application.MessageBox('Campo: Nº do Daje, deve ser informado !', 'Mensagem do Sistema', mb_ok);
        Exit;
      End;

      qry2:= Tquery.create(nil);
      qry2.databasename:=Dm.qryGenerico.databasename;
      qry2.Close;
      qry2.sql.clear;
      qry2.sql.Add('select * from daje where serie_daje = '+ QuotedStr(MaskEdit1.text));
      qry2.sql.add(' '+'and numero_daje ='+QuotedStr(MaskEdit2.text));
      qry2.open;
      qry2.last;
      if qry2.RecordCount > 0 then
      begin
        qry2.Close;
        qry2.sql.clear;
        qry2.sql.Add('select * from daje where serie_daje = '+ QuotedStr(MaskEdit5.text));
        qry2.sql.add(' '+'and numero_daje ='+QuotedStr(MaskEdit6.text));
        qry2.open;
        qry2.last;
        if qry2.RecordCount > 0 then
        begin
          Dm.qryGenerico.Close;
          Dm.qryGenerico.SQL.Clear;
          Dm.qryGenerico.SQL.Add('UPDATE daje SET serie_daje_complementar = :serie_daje_complementar, numero_daje_complementar = :numero_daje_complementar ');
          Dm.qryGenerico.SQL.Add('WHERE numero_daje = :numero_daje AND serie_daje = :serie_daje ');
          Dm.qryGenerico.ParamByName('numero_daje_complementar').AsString := MaskEdit2.Text;
          Dm.qryGenerico.ParamByName('serie_daje_complementar').AsString  := MaskEdit1.Text;
          Dm.qryGenerico.ParamByName('numero_daje').AsString := MaskEdit6.Text;
          Dm.qryGenerico.ParamByName('serie_daje').AsString  := MaskEdit5.Text;
          Dm.qryGenerico.ExecSQL;

          Dm.qryGenerico.Close;
          Dm.qryGenerico.SQL.Clear;
          Dm.qryGenerico.SQL.Add('UPDATE daje SET serie_daje_complementar = :serie_daje_complementar, numero_daje_complementar = :numero_daje_complementar ');
          Dm.qryGenerico.SQL.Add('WHERE numero_daje = :numero_daje AND serie_daje = :serie_daje ');
          Dm.qryGenerico.ParamByName('numero_daje_complementar').AsString :=  MaskEdit6.Text;
          Dm.qryGenerico.ParamByName('serie_daje_complementar').AsString  :=  MaskEdit5.Text;
          Dm.qryGenerico.ParamByName('numero_daje').AsString :=   MaskEdit2.Text;
          Dm.qryGenerico.ParamByName('serie_daje').AsString  :=   MaskEdit1.Text;
          Dm.qryGenerico.ExecSQL;



          Application.MessageBox('Daje complementar vinculado com sucesso!', 'Consultar Daje', mb_ok);
        end else
        begin
          showmessage('Favor consultar o Daje');
          qry2.free;
          qry2:=nil;
          exit;
        end;
      end else
      begin
        showmessage('Favor consultar o Daje');
        qry2.free;
        qry2:=nil;
        exit;
      end;
      qry2.free;
      qry2:=nil;
    End;
end;

procedure TF_ConsDaje.cbUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
  Begin
    BitBtn1.SetFocus;
  End;
end;

procedure TF_ConsDaje.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
    BitBtn1.SetFocus;
end;

procedure TF_ConsDaje.CorrigiUsuarioDAJE(sUsuario: String);
var
  iPos: Integer;
begin
  iPos := Pos(' ', sUsuario);
  if iPos > 0 then
  begin
    //ShowMessage('Primeira Palavra: ' + Copy(sUsuario, 1, iPos));
    dm.qryGenerico.Close;
    dm.qryGenerico.SQL.Clear;
    dm.qryGenerico.SQL.Add('UPDATE daje SET usuario = '+QuotedStr(Copy(sUsuario, 1, iPos))+' where usuario = '+QuotedStr(sUsuario)+'');
    dm.qryGenerico.ExecSQL;

  End;
end;

procedure TF_ConsDaje.Button1Click(Sender: TObject);
begin
  dm.qryGenerico_Aux.Close;
  dm.qryGenerico_Aux.SQL.CLEAR;
  dm.qryGenerico_Aux.sql.add('select * from daje group by usuario');
  dm.qryGenerico_Aux.Open;
  
  dm.qryGenerico_Aux.First;
  while (not(dm.qryGenerico_Aux.eof)) do
  begin
    CorrigiUsuarioDAJE(dm.qryGenerico_Aux.FieldByName('usuario').AsString);
    dm.qryGenerico_Aux.next;
  end
end;

procedure TF_ConsDaje.DeletarDaje1Click(Sender: TObject);
begin
  if Application.MessageBox( Pchar('Deseja deletar o daje informado?'),'Consulta Dajse',MB_ICONQUESTION + MB_YESNO ) = Id_no then
    Abort;
  Dm.qryGenerico.Close;
  Dm.qryGenerico.Sql.Clear;
  Dm.qryGenerico.Sql.Add('delete from daje where ');
  Dm.qryGenerico.Sql.Add('serie_daje = ' + QuotedStr(StrZero(DM.ArqAux.FieldByName('serie_daje').AsString,3)) + ' AND numero_daje = ' + DM.ArqAux.FieldByName('numero_daje').AsString);
  Dm.qryGenerico.ExecSQL;

  Dm.ArqAux.Close;
  Dm.ArqAux.SQL.Clear;
  Dm.ArqAux.SQL.Add(' select * from  daje where ');
  Dm.ArqAux.SQL.Add(' id = "0" ');
  Dm.ArqAux.open;

  Application.MessageBox( Pchar('Daje deletado com sucesso'),'Consulta Dajse',MB_ICONEXCLAMATION);
end;

procedure TF_ConsDaje.Vis1Click(Sender: TObject);
begin
  if Dm.ArqAux.FieldByName('iddaje_tj').AsString = '' Then
  Begin
    _CodigoEmissorDaje:= StrToInt(id_eselo);
    _CodigoDestinoDaje:= StrToInt(id_eselo);
  end
  else
  if Dm.ArqAux.FieldByName('iddaje_tj').AsString = '9999' Then
  Begin
    _CodigoEmissorDaje:= StrToInt('9999');
    _CodigoDestinoDaje:= StrToInt('9999');
  End
  else
  if Dm.ArqAux.FieldByName('iddaje_tj').AsString = '9998' Then
  Begin
    _CodigoEmissorDaje:= StrToInt('9998');
    _CodigoDestinoDaje:= StrToInt('9998');
  End;

  If (Dm.ArqAux.FieldByName('iddaje_tj').AsString = '9999') Then
  begin
    Application.MessageBox('Não é permitido re-impressão de um DAJE emitido pelo tribunal!', 'Visualizar Daje ', Mb_IconInformation);
    Abort;
  end;

  _SerieDaje                := Dm.ArqAux.FieldByName('serie_daje').AsInteger;
  _NumeroDaje               := Dm.ArqAux.FieldByName('numero_daje').AsInteger;
  _DataVencimentoDaje       := Dm.ArqAux.FieldByName('data_ven').AsString;
  _ContribuinteDaje         := Dm.ArqAux.FieldByName('contribuinte').AsString;
  _DataEmissaoDaje          := Dm.ArqAux.FieldByName('data_emi').AsString;

  dm.qryGenerico.Close;
  dm.qryGenerico.SQL.Clear;
  dm.qryGenerico.SQL.Add('select endereco, cidade from daje where numero_daje = :numero_daje and serie_daje = :serie_daje ');
  dm.qryGenerico.ParamByName('numero_daje').AsString:= Dm.ArqAux.FieldByName('numero_daje').AsString;
  dm.qryGenerico.ParamByName('serie_daje').AsString:= Dm.ArqAux.FieldByName('serie_daje').AsString;
  dm.qryGenerico.Open;

  _EnderecoContribuinteDaje := dm.qryGenerico.FieldByName('endereco').AsString;
  _CidadeContribuinteDaje   := dm.qryGenerico.FieldByName('cidade').AsString;

  _CodigoAtoDaje            := Dm.ArqAux.FieldByName('cod_ato').AsString;
  _QtdeDaje                 := Dm.ArqAux.FieldByName('qtd').AsInteger;
  _CpfCnpjContribuinteDaje  := Dm.ArqAux.FieldByName('doc').AsString;
  _ObservacaoDaje           := Dm.ArqAux.FieldByName('obs').AsString;
  _ValorDaje                := Dm.ArqAux.FieldByName('vr_daje').AsCurrency;

  _ValorAtoPraticadoDaje    := Dm.ArqAux.FieldByName('vr_declarado').AsCurrency;
  _EmolumentosDaje          := Dm.ArqAux.FieldByName('emol_daje').AsCurrency;
  _TaxaFiscalDaje           := Dm.ArqAux.FieldByName('tx_fisca_daje').AsCurrency;
  _FecomDaje                := Dm.ArqAux.FieldByName('fecom_daje').AsCurrency;
  _DefPublicaDaje           := Dm.ArqAux.FieldByName('def_pub_daje').AsCurrency;
  _ValorDaje_WS             := Dm.ArqAux.FieldByName('vr_daje').AsCurrency;
  _PGE                      := Dm.ArqAux.FieldByName('vr_pge').AsCurrency;

  if Dm.ArqAux.FieldByName('Status').AsString = 'Isento' Then
    ImprimirDaje(0, _DataVencimentoDaje, _ContribuinteDaje, _DataEmissaoDaje, _EnderecoContribuinteDaje, _CidadeContribuinteDaje,                                              //F_Menu.Label13.Caption
                 F_Menu.Label9.Caption, 'X', '', _CodigoAtoDaje, IntToStr(_QtdeDaje), Dm.ArqAux.FieldByName('Atribuicao').AsString, _CpfCnpjContribuinteDaje, _ObservacaoDaje, '')
  else
    ImprimirDaje(_ValorDaje, _DataVencimentoDaje, _ContribuinteDaje, _DataEmissaoDaje, _EnderecoContribuinteDaje, _CidadeContribuinteDaje,
               F_Menu.Label9.Caption, 'X', '', _CodigoAtoDaje, IntToStr(_QtdeDaje), Dm.ArqAux.FieldByName('Atribuicao').AsString, _CpfCnpjContribuinteDaje, _ObservacaoDaje, F_Menu.Label13.Caption);

  _ValorDaje_WS := 0;

end;

procedure TF_ConsDaje.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
    BitBtn1.SetFocus;
end;

end.
