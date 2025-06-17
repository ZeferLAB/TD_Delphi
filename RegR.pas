unit RegR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask, WPDefs, WPPrint, WpWinCtr,
  WPRich, jpeg;

type
  TF_RegR = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit2: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    ProgressBar1: TProgressBar;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    WPRichText1: TWPRichText;
    Label25: TLabel;
    MaskEdit6: TMaskEdit;
    Label26: TLabel;
    MaskEdit9: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RegR: TF_RegR;

implementation

uses Menu, DMTD, FuncGeral, ProcGeral;

{$R *.DFM}


Function TrimChar(Texto: String; DelChar: Char): String;
Var S: String;
begin
  // Removendo espaços/caracteres de uma string
  S := Texto;
  While Pos(DelChar,S) > 0 do
    Delete(S,Pos(DelChar,S),1);
  Result := Trim(S);
end;


procedure TF_RegR.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RegR.BitBtn2Click(Sender: TObject);
begin
  maskedit1.setfocus;
end;

procedure TF_RegR.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RegR.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_RegR.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Maskedit1.setfocus;;
  if key = 13 then MaskEdit6.setfocus;
end;

procedure TF_RegR.BitBtn1Click(Sender: TObject);
var
  qde : Integer;
  paux, situ, n_arq1 : string;
  data_not, cod_ir, seqq, prot, prott, valparc, seq, q_lin, portador, linha, branco,cus,cod_oc,data_oc, dd1 : String;
  q_linhas, y, q_l, q_n, seqc1 : Integer;
  sair : Boolean;
  protocolooficial, microfilme, certifica, rl1, custasv, dest : String;
  fora : boolean;
begin
  if (not ValidNumero(MaskEdit1.Text)) OR (MaskEdit1.Text = '0') then
  begin
    ShowMessage('Protocolo Auxiliar Inicial Inválido !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  if (not ValidNumero(MaskEdit3.Text)) OR (MaskEdit3.Text = '0') then
  begin
    ShowMessage('Protocolo Auxiliar Final Inválido !');
    MaskEdit3.SetFocus;
    Exit;
  end;
  if (not ValidData(MaskEdit2.Text)) then
  begin
    ShowMessage('Data Inválida !');
    Exit;
  end;

  //contando quantos serão baixados
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT count(*) quantidade FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('    (p_auxiliar >= ' + Trim(MaskEdit1.Text));
  Dm.ArqAux.Sql.Add('AND p_auxiliar <= ' + Trim(MaskEdit3.Text));
  Dm.ArqAux.Sql.Add('AND status      = "RECEPCAO")');
  Dm.ArqAux.Sql.Add('OR  (p_auxiliar >= ' + Trim(MaskEdit1.Text));
  Dm.ArqAux.Sql.Add('AND p_auxiliar <= ' + Trim(MaskEdit3.Text));
  Dm.ArqAux.Sql.Add('AND status      = "EXAME")');
  dm.ArqAux.sql.add('and cartorio = "' + F_Menu.Label37.Caption + '"');
  Dm.ArqAux.Open;
  qde := Dm.ArqAux.FieldByName('quantidade').asInteger;
  Dm.ArqAux.Close;
  ///************************
  Dm.Td.Close;
  Dm.Td.Sql.Clear;
  Dm.Td.Sql.Add('SELECT * FROM td');
  Dm.Td.Sql.Add('WHERE');
  Dm.Td.Sql.Add('    (p_auxiliar >= ' + Trim(MaskEdit1.Text));
  Dm.Td.Sql.Add('AND p_auxiliar <= ' + Trim(MaskEdit3.Text));
  Dm.Td.Sql.Add('AND status      = "RECEPCAO")');
  Dm.Td.Sql.Add('OR  (p_auxiliar >= ' + Trim(MaskEdit1.Text));
  Dm.Td.Sql.Add('AND p_auxiliar <= ' + Trim(MaskEdit3.Text));
  Dm.Td.Sql.Add('AND status      = "EXAME")');
  dm.td.sql.add('and cartorio = " ' + F_Menu.Label37.Caption + '"');
  Dm.Td.Sql.Add('ORDER BY p_auxiliar');
  Dm.Td.Open;
  if (Dm.Td.RecordCount = 0) then
  begin
    Dm.Td.Close;
    MessageBox(Handle, PChar('Movimento não encontrado !'), 'BAIXA NORMAL', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  ProgressBar1.Min      := 1;
  ProgressBar1.Max      := qde;
  ProgressBar1.Position := 1;
  n_arq1 := '';
  ColocaTrava('S');
  while (not Dm.Td.Eof) do
  begin
    protocolooficial := '';
    microfilme       := '';
    certifica        := '';
    rl1              := '';
    fora             := false;
    if (Dm.Td.fieldbyname('registro').asInteger = 0) then
    begin
      //Verificando qual região do cep
      if (Dm.Td.FieldByName('natureza').asInteger = 197)or (Dm.Td.FieldByName('natureza').asInteger = 300) then
      begin
        {situ := 'D';
        paux := Dm.Td.fieldbyname('p_auxiliar').asstring;
        Dm.Td_pesso.Close;
        Dm.Td_pesso.Sql.Clear;
        Dm.Td_pesso.Sql.Add('SELECT cep FROM td_pesso');
        Dm.Td_pesso.Sql.Add('WHERE p_auxiliar = ' + Dm.Td.FieldByName('p_auxiliar').asString);
        Dm.Td_Pesso.Sql.Add('AND situacao     = "D"');
        Dm.Td_pesso.Open;
        if Dm.Td_pesso.recordcount <> 0 then
        begin
          if (Trim(Dm.Td_Pesso.FieldByName('cep').asString) <> '') then
          begin
            if strtoint(copy(Dm.Td_pesso.fieldbyname('cep').asstring,1,1)) < 2 then fora := false else fora := true;
          end
          else Fora := False;
        end
        else
        begin
          Dm.Td_Pesso.Close;
          Dm.Td.Close;
          ShowMessage('ATENÇÃO - DESTINATÁRIO NÃO ENCONTRADO !');
          Exit;
        end;
        Dm.Td_pesso.Close; }
        GerarSequencias(True, Fora, False, True, False, False, 0);
        rl1              := digi(NRL);
        certifica        := NCert;
        microfilme       := NMicro;
        protocolooficial := NMicro;
      end
      else
      begin
        if (Dm.Td.FieldByName('natureza').asInteger = 96) then
        begin
          GerarSequencias(False, Fora, True, True, False, False, 0);
          microfilme       := NMicro;
          certifica        := NCert;
          protocolooficial := NMicro;
        end
        else
        begin
          if (dm.td.FieldByName('tabela').AsString = '1003A') or (dm.td.FieldByName('tabela').AsString = '1003B') then
            GerarSequencias(False, Fora, False, True, True, False, 0)
          else
            GerarSequencias(False, Fora, False, True, False, False, 0);
          microfilme       := NMicro;
          protocolooficial := NMicro;
        end;
      end;
    end
    else
    begin
      protocolooficial := Dm.Td.fieldbyname('protocolo').asstring;
      rl1              := Dm.Td.FieldByName('rl').asString;
      certifica        := Dm.Td.FieldByName('anotacao').asString;
      microfilme       := Dm.Td.FieldByName('registro').asString;
    end;
    if n_arq1 = '' then n_arq1 := Dm.Td.fieldbyname('arquivo').asstring;
    BaixaProt(Dm.Td.FieldByName('data_r').asString, Dm.Td.FieldByName('p_auxiliar').asString, 'T', 'PRONTO', MaskEdit2.Text, protocolooficial, microfilme, rl1, '',certifica,Trim(MaskEdit9.Text), Trim(MaskEdit6.Text), trim(MaskEdit2.Text), trim(MaskEdit3.Text),'','', '','','','','','','');
    if (Trim(rl1) <> '') then AppendaCodigoRL(rl1, microfilme, certifica, ConvData(MaskEdit2.Text), '11');
    RichEdit1.Lines.Add('Protocolo Oficial n. ' + protocolooficial + ' -> ' +
                        'Microfilme n. ' + microfilme + ' -> ' +
                        'Certificado n. ' + certifica + ' -> ' +
                        F_Menu.Label34.Caption + rl1 + ' BR');
//                      'RC ' + rl1 + ' BR');
    ProgressBar1.Position := ProgressBar1.Position + 1;
    Dm.Td.Next;
  end;
  Dm.Td.Close;
  ColocaTrava('N');
  ShowMessage('Fim do Processo !!!!');
  ///Inicio do arquivo Confirmação
  ///Pegando numero de sequencia de confirmação
{  Dm.SeqConf.Close;
  Dm.SeqConf.Sql.Clear;
  Dm.SeqConf.Sql.Add('SELECT * FROM seq_conf');
  Dm.SeqConf.Sql.Add('WHERE');
  Dm.SeqConf.Sql.Add('data = ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.SeqConf.Open;
  if (Dm.SeqConf.RecordCount <> 0) then
  begin
    Dm.SeqConf.Edit;
    Dm.SeqConf.FieldByName('seq').asInteger := (Dm.SeqConf.FieldByName('seq').asInteger + 1);
    Dm.SeqConf.Post;
    SeqC1 := Dm.SeqConf.FieldByName('seq').asInteger;
  end
  else
  begin
    Dm.SeqConf.Append;
    Dm.SeqConf.FieldByName('data').asString := MaskEdit2.Text;
    Dm.SeqConf.FieldByName('seq').asInteger := 1;
    Dm.SeqConf.Post;
    SeqC1 := 1;
  end;
  branco := '                                                                                                       ';
  linha := '';
  Dm.TD.Close;
  Dm.TD.Sql.Clear;
  Dm.TD.Sql.Add('SELECT * FROM td');
  Dm.Td.Sql.Add('WHERE');
  Dm.Td.Sql.Add('    data_p      = ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.Td.Sql.Add('AND p_auxiliar >= ' + Trim(MaskEdit1.Text));
  Dm.Td.Sql.Add('AND p_auxiliar <= ' + Trim(MaskEdit3.Text));
  Dm.TD.Open;
  if (Dm.Td.RecordCount = 0) then
  begin
    Dm.TD.Close;
    showmessage('Movimento não localizado');
    maskedit1.setfocus;
    exit;
  end;
  Screen.cursor := crhourglass;
  richedit2.clear;
  statusbar1.simpletext := 'Gerando Arquivo Confirmação...';
  statusbar1.update;
  seq := '000000' + seq;
  seq := copy(seq, length(seq) - 5, 6);
  portador := Dm.td.fieldbyname('nom_port').asstring;
  q_l := 0;
  q_n := 0;
  dest:= 'D';
  WpRichText1.lines.Clear;
  //header
  WpRichText1.lines.add('0'+formatdatetime('ddmmyyyy',Dm.td.fieldbyname('data_r').asdatetime)+formatdatetime('hh:mm',time)+'REGISTRO DE TIT DOC E PESSOAS JURIDICAS - SANTO ANDRÉ'+copy(stringofchar(' ',60),1,60-length('REGISTRO DE TIT DOC E PESSOAS JURIDICAS - SANTO ANDRÉ'))+formatdatetime('ddmmyyyy',date));
  // detalhes
  WpRichText1.font.name := 'courier new';
  WpRichText1.font.size := 8;
  while (not Dm.td.Eof) do
  begin
    Dm.TD_pesso.Close;
    Dm.TD_pesso.Sql.Clear;
    Dm.TD_pesso.Sql.Add('select * from td_pesso where p_auxiliar = "'+Dm.td.fieldbyname('p_auxiliar').asstring+'" and situacao = "'+dest+'"');
    Dm.TD_pesso.Open;
    q_n := q_n + 1;
    custasv := trimchar(formatcurr('000000000.00',Dm.td.fieldbyname('custas').ascurrency),',');
    wprichtext1.lines.add('1'+trim(Dm.td.fieldbyname('lote').asstring)+copy('          ',1,10 - length(Dm.td.fieldbyname('lote').asstring))+copy('00000',1,5 - length(Dm.td.fieldbyname('versao').asstring))+trim(Dm.td.fieldbyname('versao').asstring)+trim(Dm.td_pesso.fieldbyname('doc1').asstring)+copy('               ',1,15 - length(Dm.td_pesso.fieldbyname('doc1').asstring))+'     '+trim(Dm.td.fieldbyname('contrato').asstring)+copy('                    ',1,20 - length(Dm.td.fieldbyname('contrato').asstring))+
    trim(Dm.td.fieldbyname('parcelas').asstring)+copy('       ',1,7 - length(Dm.td.fieldbyname('parcelas').asstring))+Dm.td.fieldbyname('pr1').asstring+trim(Dm.td_pesso.fieldbyname('nome').asstring)+copy(stringofchar(' ',60),1,60 - length(Dm.td_pesso.fieldbyname('nome').asstring))+copy(stringofchar('0',20),1,20 - length(Dm.td.fieldbyname('rl').asstring))+trim(Dm.td.fieldbyname('rl').asstring)+copy('00000000',1,8 - length(Dm.td.fieldbyname('protocolo').asstring))+trim(Dm.td.fieldbyname('protocolo').asstring)+
    copy('0000000000',1,10- length(Dm.td.fieldbyname('registro').asstring))+trim(Dm.td.fieldbyname('registro').asstring)+custasv+stringofchar(' ',627));
    Dm.td.next;
  end;
  // trailler

  WpRichText1.lines.add('9'+trim(StrZero(inttostr((q_n)),6)+copy('      ',1,6-length(trim(inttostr(q_n)))))+ stringofchar(' ',792));
  ///Gravando arquivo de Confirmação
  WpRichText1.Lines.SaveToFile(F_Menu.Label32.Caption + '\CTO' + copy(maskedit2.text,1,2)+copy(maskedit2.text,4,2)+ copy('00000',1,5-length(inttostr(seqc1)))+ trim(inttostr(seqc1)) + '.CFN');
  Dm.TD.Close;
  Dm.TD_pesso.Close; }
  Screen.cursor := crdefault;
//  StatusBar1.SimpleText := 'Fim de Geração...';
//  StatusBar1.UpDate;
  ////Fim do Arquivo Confirmação
end;

procedure TF_RegR.MaskEdit1Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then MaskEdit1.Text := '0';
end;

procedure TF_RegR.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure TF_RegR.FormActivate(Sender: TObject);
begin
  MaskEdit2.Text := DateToStr(date);
end;

procedure TF_RegR.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit9.SetFocus;
end;

procedure TF_RegR.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;;
  if key = 13 then bitbtn1.setfocus;
end;

end.
