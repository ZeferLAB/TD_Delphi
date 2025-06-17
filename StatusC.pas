unit StatusC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, jpeg;

type
  TF_StatC = class(TForm)
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
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Limpa_Tela(Sender : TOBject);
    procedure BitBtn5Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_StatC: TF_StatC;

implementation

uses DMTD, Menu, FuncGeral, U_Daje, ExameC, ProcGeral;

{$R *.DFM}

Procedure TF_StatC.Limpa_Tela(Sender : TOBject);
begin
  If (F_ExameC = Nil) Then
  Begin
    Label3.Caption  := '';
    Label5.Caption  := '';
    Label7.Caption  := '';
    Label9.Caption  := '';
    MaskEdit1.Text  := '';
    BitBtn5.Enabled := False;
  End;  
end;

procedure TF_StatC.BitBtn3Click(Sender: TObject);
begin
  sPedidoEstorno:= '';
  Close;
end;

procedure TF_StatC.BitBtn2Click(Sender: TObject);
begin
  Limpa_Tela(F_StatC);
  MaskEdit1.Enabled := True;
  MaskEdit1.SetFocus;
end;

procedure TF_StatC.BitBtn1Click(Sender: TObject);
begin
  if (Trim(MaskEdit1.Text) = '') then
  begin
    MessageBox(Handle, PChar('Nº do pedido de certidão inválido.'), 'TROCA DE TÍTULOS', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  MaskEdit1.Enabled := False;
  Dm.Certidao.Close;
  Dm.Certidao.Sql.Clear;
  Dm.Certidao.Sql.Add('SELECT * FROM certidao');
  Dm.Certidao.Sql.Add('WHERE');
  Dm.Certidao.Sql.Add('nr_protoc = ' + Trim(MaskEdit1.Text));
  Dm.Certidao.Open;
  if (Dm.Certidao.RecordCount = 0) then
  begin
    Dm.Certidao.Close;
    MessageBox(Handle, PChar('Pedido de certidão não localizado.'), 'STATUS DE CERTIDÃO', MB_OK + MB_ICONWARNING);
    BitBtn2Click(F_StatC);
    Exit;
  end;
  if (Dm.Certidao.FieldByName('status').asString = 'EM PROCESSO') then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - ESTE PROTOCOLO ESTÁ EM SITUAÇÃO DE ' + Dm.Certidao.FieldByName('status').asString + '.'), 'STATUS DE CERTIDÃO', MB_OK + MB_ICONWARNING);
    MessageBox(Handle, PChar('FAVOR REALIZAR A BAIXA DO PEDIDO.'), 'STATUS DE CERTIDÃO', MB_OK + MB_ICONWARNING);
    Dm.Certidao.Close;
    BitBtn2Click(F_StatC);
    Exit;
  end; 
  Label3.Caption := Dm.Certidao.FieldByName('status').asstring;
  Label5.Caption := Dm.Certidao.FieldByName('movimento').asstring;
  Label7.Caption := Dm.Certidao.FieldByName('apresentan').asstring;
  Label9.Caption := Dm.Certidao.FieldByName('natureza').asstring;

  Label11.Caption := Dm.Certidao.FieldByName('serie_daje').asstring;
  Label12.Caption := Dm.Certidao.FieldByName('daje').asstring;

  Dm.Certidao.Close;
  BitBtn5.Enabled := True;
  BitBtn5.SetFocus;

end;

procedure TF_StatC.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_StatC.BitBtn5Click(Sender: TObject);
var
  selo, dir_ato, nome_pdf, _caminho: String;
begin
  if (MessageBox(Handle, PChar('Confirma volta do status ?'), 'STATUS DA CERTIDÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('select * from daje where ');
    Dm.ArqAux.Sql.Add(' serie_daje = ' + QuotedStr(StrZero(Label11.Caption, 3)) + ' AND numero_daje = ' + Label12.Caption);
    Dm.ArqAux.Open;
    If Dm.ArqAux.RecordCount <> 0 then
    begin
      selo := Dm.ArqAux.FieldByName('numero_selo').asString;

      if (Dm.ArqAux.FieldByname('iddaje_tj').AsString = '9999') then
        id_eselo := '9999';

      if (Dm.ArqAux.FieldByname('iddaje_tj').AsString <> '') then
        id_eselo := Dm.ArqAux.FieldByname('iddaje_tj').AsString;

      BaixaProt(Label5.Caption, MaskEdit1.Text, 'C', 'EXAME', DateToStr(date),'','', '', '','','','','','','','','','','','','','','');

      if ((selo <> '') and (selo <> '0')) then
      begin
        if BaixaProt(Label5.Caption, MaskEdit1.Text, 'C', 'EXAME', DateToStr(date),'','', '', '','','','','','','','','','','','','','','') then
        begin
          if ((selo <> '') and (selo <> '0')) then
          begin

            if not(CancelarSelo(id_eselo, TirarTudo(Dm.ArqAux.FieldByName('numero_selo').AsString, '.', '-', '/'), '1')) Then
            begin
              Dm.ArqAux2.Close;
              Dm.ArqAux2.Sql.Clear;
              Dm.ArqAux2.Sql.Add('update daje set numero_selo_canc = numero_selo, cod_validacao_canc = cod_validacao, usuario_selo_canc = ' + QuotedStr(F_Menu.Label25.Caption) + ' where id = ' + Dm.ArqAux.FieldByname('id').AsString);
              Try

                Dm.ArqAux2.ExecSql;

                Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Numero do selo do daje: '+Label12.Caption+' '+StrZero(Label11.Caption, 3)+', foi cancelado', MaskEdit1.Text);

                Dm.qryGenerico.Close;
                Dm.qryGenerico.Sql.Clear;
                Dm.qryGenerico.Sql.Add('update certidao set selo = null, selo_validador = null where nr_protoc = ' + Trim(MaskEdit1.Text)+' ');
                Dm.qryGenerico.ExecSql;

                Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O Status da certidão Nº: '+MaskEdit1.Text+', foi retornado', MaskEdit1.Text);

                Dm.ArqAux2.Close;
                Dm.ArqAux2.Sql.Clear;
                Dm.ArqAux2.Sql.Add('update daje set numero_selo = null, cod_validacao = null, usuario_selo = null where id = ' + Dm.ArqAux.FieldByname('id').AsString);
                Try
                  Dm.ArqAux2.ExecSql;
                  dir_ato  := dir_daje + 'Atos\';
                  Nome_PDF := 'CER_' + Maskedit1.text + '.' + 'PDF';
                  _caminho := dir_ato + Nome_PDF;

                  if FileExists(_caminho) Then
                    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'O arquivo: '+_caminho+', foi excluído por conta do estorno da certidão', MaskEdit1.Text);

                  DeleteFile(_caminho);   
                Except
                End;
              Except
                MessageBox(Handle, PChar('Problemas para cancelar selo junto ao TJBA.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
              End;
              Dm.ArqAux2.Close;
            end;
          end;
          MessageBox(Handle, PChar('Volta de status realizada com sucesso.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
          BitBtn2Click(F_StatC);
          Exit;
        end
        else
        begin
          MessageBox(Handle, PChar('Problemas para efetuar a volta de status.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
          BitBtn2Click(F_StatC);
          Exit;
        end;
      end
      else
      begin
        MessageBox(Handle, PChar('Problemas para efetuar a volta de status. Recibo não selado.'), 'STATUS DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
        BitBtn2Click(F_StatC);
        Exit;
      end;
    end;
    Dm.ArqAux.Close;
  end
  else BitBtn2Click(F_StatC);
end;

procedure TF_StatC.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

procedure TF_StatC.FormActivate(Sender: TObject);
begin
  Limpa_Tela(F_StatC);
  If (F_ExameC = Nil) Then
    MaskEdit1.SetFocus;
end;

procedure TF_StatC.FormShow(Sender: TObject);
begin
  If (F_ExameC <> Nil) Then
  Begin
    MaskEdit1.Text:= sPedidoEstorno;
    BitBtn1.Click;
  End;  
end;

end.
