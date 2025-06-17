unit ImportaPostBX;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, jpeg;

type
  TF_ImportaPostBX = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn5: TBitBtn;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    ListBox2: TListBox;
    OpenDialog1: TOpenDialog;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Bevel1: TBevel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure VerificarArquivo(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure BaixaRetorno(Sender : TObject; NumBaixa : Integer);    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ImportaPostBX: TF_ImportaPostBX;
  F  : TextFile;
  S, nCodBarra : String;
  NumRL, NumCert, ItemBusca   : String;  

implementation

uses DMTD, ChecaB, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

Function PegaCodSistema(fCodCorreio : Integer) : Integer;
begin
  Dm.Cad_Ir.Close;
  Dm.Cad_Ir.Sql.Clear;
  Dm.Cad_Ir.Sql.Add('SELECT CODIGO FROM cad_ir');
  Dm.Cad_Ir.Sql.Add('WHERE');
  Dm.Cad_Ir.Sql.Add('CODCORREIO = ' + IntToStr(fCodCorreio));
  Dm.Cad_Ir.Open;
  Result := Dm.Cad_Ir.FieldByName('codigo').asInteger;
  Dm.Cad_Ir.Close; 
end;

Procedure TF_ImportaPostBX.BaixaRetorno(Sender : TObject; NumBaixa : Integer);
var
  cdata, csit, ccod, chora, tpSit, dtBX, data_oco : String;
  cod_ocor : Integer;
begin
  NumRL    := '';
  NumCert  := '';
  NumRL    := Dm.BxRet.FieldByName('rl').asString;
  NumCert  := Dm.BxRet.FieldByName('anotacao').asString;
  dtBX     := Copy(S, 18, 4) + '/' + Copy(S, 22, 2) + '/' + Copy(S, 24, 2);
  cdata    := 'data_not' + IntToStr(NumBaixa);
  csit     := 'sit_not'  + IntToStr(NumBaixa);
  ccod     := 'cod_ir'   + IntToStr(NumBaixa);
  chora    := 'hora_not' + IntToStr(NumBaixa);
  cod_ocor := 0;
  cod_ocor := StrToInt(Copy(S, 26, 2));
  cod_ocor := PegaCodSistema(cod_ocor);

  tpSit := '';
 { Dm.BxRet.Edit;
  Dm.BxRet.FieldByName(cdata).asString        := Copy(S, 24, 2) + '/' + Copy(S, 22, 2) + '/' + Copy(S, 18, 4);
  tpSit := '';
  if (Cod_Ocor = 0) then
  begin
    Dm.BxRet.FieldByName(csit).asString    := 'P';
    tpSit                                  := 'P';
  end
  else
  begin
    Dm.BxRet.FieldByName(csit).asString    := 'N';
    tpSit                                  := 'N';
  end;
  Dm.BxRet.FieldByName(ccod).asInteger        := cod_ocor;
  Dm.BxRet.FieldByName(chora).asString        := Copy(TimeToStr(Time), 1,5);
  if (StrToInt(NumRl) > Dm.BxRet.FieldByName('rl').asInteger) then
  begin
    Dm.BxRet.FieldByName('rlcertid').asString   := NumRL;
  end
  else Dm.BxRet.FieldByName('rlcertid').asString   := Dm.BxRet.FieldByName('rl').asString;
  Dm.BxRet.FieldByName('certcertif').asString := NumCert;
  Dm.BxRet.FieldByName('bxcorreio').asString  := 'CORREIO';
  Dm.BxRet.Post;}
  data_oco := '';
  data_oco := Copy(S, 18, 8);
  if data_oco = '00000000' then
   data_oco := Copy(S, 96, 8);

  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('UPDATE td SET');
  Dm.ArqAux1.Sql.Add(cdata + '= '+Chr(39)+ data_oco +Chr(39)+',');
  if (Cod_Ocor = 1) then
  begin
   Dm.ArqAux1.Sql.Add(csit + '= '+Chr(39)+'P'+Chr(39)+',');
   tpSit := 'P';
  end
  else
  begin
   Dm.ArqAux1.Sql.Add(csit + '= '+Chr(39)+'N'+Chr(39)+',');
   tpSit                                  := 'N';
  end;
  Dm.ArqAux1.Sql.Add(ccod     + '= '+Chr(39)+ inttostr(cod_ocor)+Chr(39)+',');
  Dm.ArqAux1.Sql.Add('rlcertid   ='+Chr(39)+ NumRl+Chr(39)+',');
  if NumCert <> '' then
       Dm.ArqAux1.Sql.Add('certcertif ='+Chr(39)+ NumCert+Chr(39)+',')
  else Dm.ArqAux1.Sql.Add('certcertif ="",');
  Dm.ArqAux1.Sql.Add('bxcorreio  = '+Chr(39)+ 'CORREIO'+Chr(39));
  Dm.ArqAux1.Sql.Add('where registro = ' + ItemBusca);
  Dm.ArqAux1.Sql.Add('AND natureza = 197');
  Dm.ArqAux1.Sql.savetofile('c:\teste.txt');
  Dm.ArqAux1.ExecSql;



  AtualizaTabela('td_cert', Dm.BxRet.FieldByName('p_auxiliar').asString,
                 (cdata + ',' + csit + ',' + ccod + ',rl' ),
                 (dtBX + ',' + tpSit + ',' + IntToStr(cod_ocor) + ',' + Dm.BxRet.FieldByName('rl').asString));
  if (TpSit = 'N') then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Notificação baixada como ' + Ver_TipoBaixaNotificacao(tpSit) + ' em ' + Dm.BxRet.FieldByName(cdata).asString + ' pelo motivo ' + Trim(Copy(S, 28, Length(S))), Dm.BxRet.FieldByName('p_auxiliar').asString);
  end
  else Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Notificação baixada como ' + Ver_TipoBaixaNotificacao(tpSit) + ' em ' + Dm.BxRet.FieldByName(cdata).asString, Dm.BxRet.FieldByName('p_auxiliar').asString);
  ListBox2.Items.Add(FormataRL(NumRL));
end;

Function LocalizaCodBarraNoList(nnNroPriv : String) : Boolean;
var
  x : Integer;
begin
  Result := False;
  x := 0;
  while (x <= F_ImportaPostBX.ListBox1.Items.Count - 1) do
  begin
    if (F_ImportaPostBX.ListBox1.Items.Strings[x] = nnNroPriv) then
    begin
      Result := True;
      Exit;
    end;
    x := x + 1;
  end;
end;

procedure TF_ImportaPostBX.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  ListBox1.Clear;
  ListBox2.Clear;
end;

procedure TF_ImportaPostBX.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ImportaPostBX.VerificarArquivo(Sender: TObject);
var
 Arq : String;
begin
  if (Trim(MaskEdit1.Text) <> '') then
  begin
    ListBox1.Items.Clear;
    ListBox2.Items.Clear;
    Label3.Caption := '0';
    AssignFile(F, Trim(MaskEdit1.Text));
    Reset(F);
    while (not EOF(F)) do
    begin
      Readln(F, S);
      nCodBarra := '';
      nCodBarra := Copy(S, 1,9);
      ListBox1.Items.Add(FormataRL(StrZero(nCodBarra, 9)));
      Label3.Caption := IntToStr(StrToInt(Label3.Caption) + 1);
    end;
    CloseFile(F);   
  end;
end;

procedure TF_ImportaPostBX.BitBtn5Click(Sender: TObject);
begin
  if (OpenDialog1.Execute) then
  begin
    MaskEdit1.Text := OpenDialog1.FileName;
    if (Trim(MaskEdit1.Text) <> '') then
    begin
      VerificarArquivo(Sender);
      BitBtn1.Enabled := True;
      BitBtn1.SetFocus;
    end;   
  end;
end;

procedure TF_ImportaPostBX.BitBtn1Click(Sender: TObject);
begin
  if (ListBox1.Items.Count = 0) then
  begin
    ShowMessage('Não Há ARs para realizar a importação.');
    BitBtn2.SetFocus;
    Exit;
  end;
  AssignFile(F, Trim(MaskEdit1.Text));
  Reset(F);
  while (not EOF(F)) do
  begin
    ReadLN(F, S);
    nCodBarra := '';
    nCodBarra := FormataRL(Copy(S, 1,9));
    if (LocalizaCodBarraNoList(nCodBarra)) then
    begin
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT numreg, codigo_barra, numcerti FROM acertifi');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('codigo_barra = ' + QuotedStr(TirarTudo(nCodBarra, '.', '-', '')));
      Dm.ArqAux.Open;
      if Dm.ArqAux.recordCount <> 0 then
      begin
        ItemBusca := Dm.ArqAux.FieldByName('numreg').asString;
        NumRL     := Dm.ArqAux.FieldByName('codigo_barra').asString;
        NumCert   := Dm.ArqAux.FieldByName('numcerti').asString;
        Dm.ArqAux.Close;
//Executando rotina de baixa - é a mesma rotina da baixa manual.
        Dm.BxRet.Close;
        Dm.BxRet.Sql.Clear;
        Dm.BxRet.Sql.Add('SELECT p_auxiliar, rl, anotacao, rlcertid, certcertif,');
        Dm.BxRet.Sql.Add('data_not1, cod_ir1, sit_not1, hora_not1,');
        Dm.BxRet.Sql.Add('data_not2, cod_ir2, sit_not2, hora_not2,');
        Dm.BxRet.Sql.Add('data_not3, cod_ir3, sit_not3, hora_not3, bxcorreio');
        Dm.BxRet.Sql.Add('FROM td');
        Dm.BxRet.Sql.Add('WHERE');
        Dm.BxRet.Sql.Add('registro = ' + ItemBusca);
        Dm.BxRet.Sql.Add('AND natureza = 197');
        Dm.BxRet.Open;
        if (Dm.BxRet.RecordCount = 0) then
        begin
          Dm.BxRet.Close;
          ShowMessage('ATENÇÃO - N. REGISTRO NÃO ENCONTRADO !');
          UpDateWindow(Handle);
          Exit;
        end;
        if (Trim(Dm.BxRet.FieldByName('sit_not3').asString) = '') AND
           (Trim(Dm.BxRet.FieldByName('sit_not2').asString) = '') AND
           (Trim(Dm.BxRet.FieldByName('sit_not1').asString) = '') then
        begin
          // Verificando se já existe uma baixa.
          if (Trim(Dm.BxRet.FieldByName('sit_not3').asString) <> '') then
          begin
            Dm.BxRet.Close;
            ShowMessage('ATENÇÃO - NÃO HÁ MAIS POSSIBILIDADES DE EFETUAR O RETORNO DA NOTIFICAÇÃO.');
            Exit;
          end;
          // Verificando se já existe uma baixa.
          if (Trim(Dm.BxRet.FieldByName('sit_not2').asString) <> '') AND
             (Trim(Dm.BxRet.FieldByName('sit_not2').asString) <> 'L') then
          begin
            if (MessageBox(Handle, PChar('ATENÇÃO - ESTE TÍTULO JÁ POSSUI A BAIXA DE ' + Ver_TipoBaixaNotificacao(Dm.BxRet.FieldByName('sit_not2').asString) + ' EM ' + Dm.BxRet.FieldByName('data_not2').asString + '. DESEJA REALIZAR NOVA BAIXA ?'), 'ATENÇÃO - BAIXA JÁ ENCONTRADA.', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
            begin
              BaixaRetorno(Sender, 3);
            end;
          end
          else
          begin
            // Verificando se já existe uma baixa.
            if (Trim(Dm.BxRet.FieldByName('sit_not1').asString) <> '') AND
               (Trim(Dm.BxRet.FieldByName('sit_not1').asString) <> 'L') then
            begin
              if (MessageBox(Handle, PChar('ATENÇÃO - ESTE TÍTULO JÁ POSSUI A BAIXA DE ' + Ver_TipoBaixaNotificacao(Dm.BxRet.FieldByName('sit_not1').asString) + ' EM ' + Dm.BxRet.FieldByName('data_not1').asString + '. DESEJA REALIZAR NOVA BAIXA ?'), 'ATENÇÃO - BAIXA JÁ ENCONTRADA.', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
              begin
                BaixaRetorno(Sender, 2);
              end;
            end
            else
            begin
              BaixaRetorno(Sender, 1);
            end;
          end;
        end
        else
        begin
          // Verificando se já existe uma baixa.
          if (Trim(Dm.BxRet.FieldByName('sit_not3').asString) <> '') then
          begin
            Dm.BxRet.Close;
            ShowMessage('ATENÇÃO - NÃO HÁ MAIS POSSIBILIDADES DE EFETUAR O RETORNO DA NOTIFICAÇÃO.');
            Exit;
          end;
          // Verificando se já existe uma baixa.
          if (Trim(Dm.BxRet.FieldByName('sit_not2').asString) <> '') AND
             (Trim(Dm.BxRet.FieldByName('sit_not2').asString) <> 'L') then
          begin
            if (MessageBox(Handle, PChar('ATENÇÃO - ESTE TÍTULO JÁ POSSUI A BAIXA DE ' + Ver_TipoBaixaNotificacao(Dm.BxRet.FieldByName('sit_not2').asString) + ' EM ' + Dm.BxRet.FieldByName('data_not2').asString + '. DESEJA REALIZAR NOVA BAIXA ?'), 'ATENÇÃO - BAIXA JÁ ENCONTRADA.', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
            begin
              BaixaRetorno(Sender, 3);
            end;
          end
          else
          begin
            // Verificando se já existe uma baixa.
            if (Trim(Dm.BxRet.FieldByName('sit_not1').asString) <> '') AND
               (Trim(Dm.BxRet.FieldByName('sit_not1').asString) <> 'L') then
            begin
              if (MessageBox(Handle, PChar('ATENÇÃO - ESTE TÍTULO JÁ POSSUI A BAIXA DE ' + Ver_TipoBaixaNotificacao(Dm.BxRet.FieldByName('sit_not1').asString) + ' EM ' + Dm.BxRet.FieldByName('data_not1').asString + '. DESEJA REALIZAR NOVA BAIXA ?'), 'ATENÇÃO - BAIXA JÁ ENCONTRADA.', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IdYes) then
              begin
                BaixaRetorno(Sender, 2);
              end;
            end
            else
            begin
              if (Trim(Dm.BxRet.FieldByName('sit_not1').asString) = '') then
              begin
                BaixaRetorno(Sender, 1);
              end
              else BaixaRetorno(Sender, 2);
            end;
          end;
        end;
      end;
      Dm.ArqAux.Close;
    end;
  end;
  CloseFile(F);
  ShowMessage('Processo Concluído !');
end;

end.
