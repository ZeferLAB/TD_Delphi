unit Status;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, jpeg, FileCtrl;

type
  TF_Stat = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BitBtn5: TBitBtn;
    Label10: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Limpa_Tela(Sender : TOBject);
    procedure BitBtn5Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Stat: TF_Stat;

implementation

uses DMTD, Menu, FuncGeral, U_Daje;

{$R *.DFM}

Procedure TF_Stat.Limpa_Tela(Sender : TOBject);
begin
  Label3.Caption  := '';
  Label5.Caption  := '';
  Label7.Caption  := '';
  Label9.Caption  := '';
  MaskEdit1.Text  := '';
  BitBtn5.Enabled := False;
end;

procedure TF_Stat.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Stat.BitBtn2Click(Sender: TObject);
begin
  Limpa_Tela(F_Stat);
  MaskEdit1.Enabled := True;
  MaskEdit1.SetFocus;
end;

procedure TF_Stat.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('Nº do protocolo auxiliar inválido.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  MaskEdit1.Enabled := False;
  Dm.Td.Close;
  Dm.Td.Sql.Clear;
  Dm.Td.Sql.Add('SELECT * FROM td');
  Dm.Td.Sql.Add('WHERE');
  Dm.Td.Sql.Add('p_auxiliar = ' + Trim(MaskEdit1.Text));
  Dm.Td.Open;
  if (Dm.Td.RecordCount = 0) then
  begin
    Dm.Td.Close;
    MessageBox(Handle, PChar('Protocolo auxiliar não localizado.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONWARNING);
    BitBtn2Click(F_Stat);
    Exit;
  end;
  if (Dm.Td.FieldByName('status').asString = 'RECEPCAO') OR
     (Dm.Td.FieldByName('status').asString = 'EXAME')    then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - ESTE PROTOCOLO ESTÁ EM SITUAÇÃO DE ' + Dm.Td.FieldByName('status').asString + '.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONWARNING);
    MessageBox(Handle, PChar('FAVOR UTILIZAR A OPÇÃO DE BAIXA.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONWARNING);
    Dm.Td.Close;
    BitBtn2Click(F_Stat);
    Exit;
  end;
  Label3.Caption  := Dm.Td.FieldByName('status').asstring;
  Label5.Caption  := Dm.Td.FieldByName('data_r').asstring;
  Label7.Caption  := Dm.Td.FieldByName('a_nome').asstring;
  Label9.Caption  := Dm.Td.FieldByName('natureza').asstring;
  Label10.Caption := Dm.Td.FieldByName('registro').asString;
  //Dm.Td.Close;
  BitBtn5.Enabled := True;
  BitBtn5.SetFocus;
end;

procedure TF_Stat.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_Stat.BitBtn5Click(Sender: TObject);
var
  selo: String;
  _origem, _destino, _cod_emissor_ : String;
  achouultimo: Boolean;
  i: Integer;
begin
  if (MessageBox(Handle, PChar('Confirma volta do status ?'), 'STATUS DE TÍTULOS', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin

    If Label3.Caption <> 'PRONTO' then
    Begin
      if BaixaProt(Label5.Caption, MaskEdit1.Text, 'T', 'EXAME', DateToStr(Date), Label10.Caption,'','','','','','','','','','','','','','','','','') then
      begin
        Label3.Caption := 'EXAME';
        MessageBox(Handle, PChar('Volta de status realizada com sucesso.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
        BitBtn2Click(F_Stat);
        Exit;
      end
      else
      begin
        MessageBox(Handle, PChar('Problemas para efetuar a volta de status.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
        BitBtn2Click(F_Stat);
        Exit;
      end;
    End;

    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('select * from daje where ');
    Dm.ArqAux.Sql.Add(' serie_daje = ' + QuotedStr(StrZero(Dm.Td.FieldByName('serie_daje').asString, 3)) + ' AND numero_daje = ' + Dm.Td.FieldByName('daje').asString);
    Dm.ArqAux.Open;
    If Dm.ArqAux.RecordCount <> 0 then
    begin
      selo := Dm.ArqAux.FieldByName('numero_selo').asString;
      _cod_emissor_ := id_eselo;
      If Dm.ArqAux.FieldByname('iddaje_tj').AsString = '9999' then _cod_emissor_ := '9999';
      if ((selo <> '') and (selo <> '0')) or ((Dm.Td.FieldByName('selo_serie').asString <> '') and (Dm.Td.FieldByName('selo_numero').asString <> '')) then
      begin
        if BaixaProt(Label5.Caption, MaskEdit1.Text, 'T', 'EXAME', DateToStr(Date), Label10.Caption,'','','','','','','','',selo,'','','','','','','','') then
        begin
          if ((selo <> '') and (selo <> '0')) then
          begin
            //if CancelarSelo(_cod_emissor_, TirarTudo(Dm.ArqAux.FieldByName('numero_selo').AsString, '.', '-', '/'), '1') then
            begin
              Dm.ArqAux2.Close;
              Dm.ArqAux2.Sql.Clear;
              Dm.ArqAux2.Sql.Add('update daje set numero_selo_canc = numero_selo, cod_validacao_canc = cod_validacao, usuario_selo_canc = ' + QuotedStr(F_Menu.Label25.Caption) + ' where id = ' + Dm.ArqAux.FieldByname('id').AsString);
              Try
                Dm.ArqAux2.ExecSql;

                Dm.qryGenerico.Close;
                Dm.qryGenerico.Sql.Clear;
                Dm.qryGenerico.Sql.Add('update certidao set selo = null, selo_validador = null where nr_protoc = ' + Trim(MaskEdit1.Text)+' ');
                Dm.qryGenerico.ExecSql;

                //if (Dm.Td.FieldByName('serie_vias').asString <> '') and (Dm.Td.FieldByName('dajevias').asString <> '') Then
                Begin
                  {Dm.qryGenerico.Close;
                  Dm.qryGenerico.Sql.Clear;
                  Dm.qryGenerico.Sql.Add('select * from daje where serie_daje = ' + QuotedStr(StrZero(Dm.Td.FieldByName('serie_vias').asString, 3)));
                  Dm.qryGenerico.Sql.Add('AND numero_daje = ' + Dm.Td.FieldByName('dajevias').asString);
                  Dm.qryGenerico.Open;
                  if Dm.qryGenerico.RecordCount > 0 Then
                  Begin
                    Dm.qryGenerico.Close;
                    Dm.qryGenerico.Sql.Clear;
                    Dm.qryGenerico.Sql.Add('update daje set numero_selo = null, cod_validacao = null, usuario_selo = null where serie_daje = ' + QuotedStr(StrZero(Dm.Td.FieldByName('serie_vias').asString, 3)));
                    Dm.qryGenerico.Sql.Add('AND numero_daje = ' + Dm.Td.FieldByName('dajevias').asString);
                    Dm.qryGenerico.ExecSql;
                  End; }

                  //inicio aqui 
                  Dm.qryGenerico.Close;
                  Dm.qryGenerico.SQL.Clear;
                  Dm.qryGenerico.SQL.Add('select * from selos where recibo = '+QuotedStr(Trim(MaskEdit1.Text))+'');
                  Dm.qryGenerico.Open;

                  if Dm.qryGenerico.RecordCount > 0 Then
                  Begin
                    Dm.qryGenerico.First;
                    while not Dm.qryGenerico.eof do
                    Begin
                      Dm.qryGenerico_Aux.Close;
                      Dm.qryGenerico_Aux.Sql.Clear;
                      Dm.qryGenerico_Aux.Sql.Add('SELECT * FROM daje');
                      Dm.qryGenerico_Aux.Sql.Add('WHERE serie_daje = ' + QuotedStr(Strzero(Dm.qryGenerico.FieldByName('serie_daje').AsString, 3)));
                      Dm.qryGenerico_Aux.Sql.Add('and numero_daje = ' + QuotedStr(Strzero(Dm.qryGenerico.FieldByName('daje').AsString, 6)));
                      Dm.qryGenerico_Aux.Open;
                      if ((Dm.qryGenerico_Aux.FieldByName('numero_selo').AsString <> '') or (Not(Dm.qryGenerico_Aux.FieldByName('numero_selo').isNull))) Then
                      Begin
                          CancelarSelo(_cod_emissor_ , TirarTudo(Dm.qryGenerico_Aux.FieldByName('numero_selo').AsString, '.', '-', '/'), '1');
                          Dm.ArqAux2.Close;
                          Dm.ArqAux2.Sql.Clear;
                          Dm.ArqAux2.Sql.Add('update daje set numero_selo = null, cod_validacao = null, usuario_selo = null where id = ' + Dm.qryGenerico_Aux.FieldByname('id').AsString);
                          Dm.ArqAux2.ExecSql;
                      End;
                    Dm.qryGenerico.Next;
                    End;
                  End;
                  
                End;

                Dm.ArqAux2.Close;
                Dm.ArqAux2.Sql.Clear;
                Dm.ArqAux2.Sql.Add('update daje set numero_selo = null, cod_validacao = null, usuario_selo = null where id = ' + Dm.ArqAux.FieldByname('id').AsString);
                Try
                  Dm.ArqAux2.ExecSql;
                Except
                End;
              Except
                MessageBox(Handle, PChar('Problemas para cancelar selo junto ao TJBA.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
              End;

              _origem := dir_daje + 'Atos\REC_' + Dm.Td.FieldByName('protocolo').AsString + '.PDF';
              If NOT FileExists(_origem) then showmessage('Não existe o arquivo ' + _origem)
              else
              begin
                if not DirectoryExists(dir_daje + 'AtosCanc\') then
                begin
                  ForceDirectories(dir_daje + 'AtosCanc\');
                  if not DirectoryExists(dir_daje + 'AtosCanc\') then
                  begin
                    showmessage('Problemas para criar diretorio ' + dir_daje + 'AtosCanc\');
                    exit;
                  end;
                end;
                achouultimo := False;
                _destino := dir_daje + 'AtosCanc\REC_' + Dm.Td.FieldByName('protocolo').AsString + '.PDF';
                If FileExists(_destino) then
                begin
                  i := 1;
                  while not achouultimo do
                  begin
                    _destino := dir_daje + 'AtosCanc\REC_' + Dm.Td.FieldByName('protocolo').AsString + '-' + IntToStr(i) + '.PDF';
                    If NOT FileExists(_destino) then achouultimo := True else i := i + 1;
                  end;
                end;
                CopyFile(PChar(_origem), PChar(_destino), true);
                If NOT FileExists(_destino) then CopyFile(PChar(_origem), PChar(_destino), true)
                else If NOT FileExists(_destino) then showmessage('Não foi possível criar o arquivo ' + _destino)
                else
                begin
                  DeleteFile(PChar(_origem));
                  If FileExists(_origem) then DeleteFile(PChar(_origem))
                  else If FileExists(_origem) then showmessage('Não foi possível apagar o arquivo ' + _origem);
                end;
              end;

              Dm.ArqAux2.Close;
            end;
          end;
          Label3.Caption := 'EXAME';
          MessageBox(Handle, PChar('Volta de status realizada com sucesso.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
          BitBtn2Click(F_Stat);
          Exit;
        end
        else
        begin
          MessageBox(Handle, PChar('Problemas para efetuar a volta de status.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
          BitBtn2Click(F_Stat);
          Exit;
        end;
      end
      else
      begin
        MessageBox(Handle, PChar('Problemas para efetuar a volta de status. Recibo não selado.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
        BitBtn2Click(F_Stat);
        Exit;
      end;
    end;
    Dm.ArqAux.Close;
  end
  else BitBtn2Click(F_Stat);
end;

procedure TF_Stat.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

procedure TF_Stat.FormActivate(Sender: TObject);
begin
  Limpa_Tela(F_Stat);
  MaskEdit1.SetFocus;
end;

end.
