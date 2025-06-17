unit Baixa1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, jpeg;

type
  TF_Baixa1 = class(TForm)
    ControlBar1: TControlBar;
    Label36: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    MaskEdit1: TMaskEdit;
    Bevel2: TBevel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    RadioButton5: TRadioButton;
    Label18: TLabel;
    Label19: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    tipo_reg: string;
  end;

var
  F_Baixa1: TF_Baixa1;

implementation

uses DMTD, Menu, PIrr, FuncGeral, ProcGeral, Exame, AReg;

{$R *.DFM}

procedure TF_Baixa1.BitBtn2Click(Sender: TObject);
begin
  Label2.caption := '';
  Close;
end;

procedure TF_Baixa1.BitBtn1Click(Sender: TObject);
var
  devolvido : Boolean;
  msg : String;
  protocolooficial, microfilme, certifica, rl1, n_vias, folha_ini, nlivrob, averbacao : String;
  fora : boolean;
begin
  if (MessageBox(Handle, PChar('Confirma baixa do título ?'), 'BAIXA', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IdYes) then
  begin
    if (RadioButton1.Checked) then
    begin
      if BaixaProt(Label12.Caption, Label3.Caption, 'T', 'EXAME', MaskEdit1.Text,'','','','','','','','','','','','','','','','') then
      begin
        MessageBox(Handle, PChar('Volta de status realizada com sucesso.'), 'BAIXA DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    end;
    if (RadioButton2.Checked) then
    begin
      protocolooficial := Label3.Caption;
      n_vias           := Label15.Caption;
      microfilme       := '';
      certifica        := '';
      rl1              := '';
      fora             := false;
      If StrToInt(Label16.Caption) > 0 then
      Begin
        folha_ini := Label16.Caption;
        nlivrob   := Label17.Caption;
      End
      Else
      Begin
        folha_ini := '0';
        nlivrob   := '0';
      End;

      if (StrToInt(Label5.Caption) = 0) then
      begin
        //Verificando qual região do cep
       { Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('SELECT cep FROM td_pesso');
        Dm.ArqAux.Sql.Add('WHERE p_auxiliar = ' + Label3.Caption);
        Dm.ArqAux.Sql.Add('AND situacao     = "D"');
        Dm.ArqAux.Open;
        if Dm.ArqAux.recordcount <> 0 then
        begin
          if strtoint(copy(Dm.ArqAux.fieldbyname('cep').asstring,1,1)) < 2 then fora := false else fora := true;
        end;
        Dm.ArqAux.Close; }

//      if (Label11.Caption = '197')or (Label11.Caption = '300') then

        if (tipo_reg = 'Av.') then  {Solicita digitação do registro no caso de averbação}
        begin
{          If (Label20.Caption = '4.1') or (Label20.Caption = '4.2') or (Label20.Caption = '4.6') or (Label20.Caption = '4.7') then
          Begin}
            if IDYES = Application.MessageBox(PChar('Inserir número do Registro referente à averbação ?'),
               PChar('Baixa'),MB_YESNO + MB_ICONQUESTION) then
            begin
              Application.CreateForm(TF_AReg, F_AReg);
              F_Areg.Maskedit1.Text := '';
              F_AReg.ShowModal;
              microfilme       := F_AReg.Maskedit1.Text;
              protocolooficial := F_AReg.Maskedit1.Text;
              averbacao        := F_AReg.Maskedit2.Text;

              { Verificar se já existe o registro }
              Dm.ArqAux.Close;
              Dm.ArqAux.Sql.Clear;
              Dm.ArqAux.Sql.Add('SELECT registro FROM td');
              Dm.ArqAux.Sql.Add(' WHERE registro = ' + QuotedStr(microfilme));
              Dm.ArqAux.Sql.Add(' AND averba = ' + QuotedStr(averbacao));

              if F_Exame.CheckBox3.Checked then
                Dm.ArqAux.Sql.Add(' AND lvc = "X"')
              else
                Dm.ArqAux.Sql.Add(' AND lvb = "X"');

              Dm.ArqAux.Open;
              if Dm.ArqAux.recordcount <> 0 then
              begin
                MessageBox(Handle, PChar('Por favor, verifique a sequencia do registro, DUPLICIDADE.'), 'BAIXA DE TÍTULOS', MB_OK + MB_ICONWARNING);
                Application.CreateForm(TF_AReg, F_AReg);
                F_Areg.Maskedit1.Text := '';

                F_AReg.Maskedit1.Text := microfilme;
                F_AReg.Maskedit2.Text := averbacao;

                F_AReg.ShowModal;

                microfilme       := F_AReg.Maskedit1.Text;
                protocolooficial := F_AReg.Maskedit1.Text;
                averbacao        := F_AReg.Maskedit2.Text;
                F_AReg.Destroy;
                F_AReg := Nil;
                //BitBtn1.Enabled := False;
                //BitBtn2.SetFocus;
                //Exit;
              end;

              Dm.ArqAux.Close;
            end ;

        end
        else
        begin

          if False then
          begin
            GerarSequencias(True, Fora, False, False, False);
            rl1              := digi(NRL);
            certifica        := NCert;
            microfilme       := NMicro;
            protocolooficial := NMicro;
          end
          else
          begin
  //        if (Label11.Caption = '2') then
            if False then
            begin
              GerarSequencias(False, Fora, True, False, False);
              microfilme       := NMicro;
              certifica        := NCert;
              protocolooficial := NMicro;
            end
            else
            begin
              //If Label18.Caption = '6003' then
              if F_Exame.CheckBox3.Checked and v_chk_20 then
                GerarSequencias(False, Fora, False, False, True)
              Else
                GerarSequencias(False, Fora, False, False, False);
              microfilme       := NMicro;
              protocolooficial := NMicro;
              certifica        := '';
            end;
          end;
        end;
      end
      else
      begin
        protocolooficial := Label5.Caption;
        rl1              := Label10.Caption;
        certifica        := Label9.Caption;
        microfilme       := Label5.Caption;
        n_vias           := Label15.Caption;
      end;
      if BaixaProt(Label12.Caption, Label3.Caption, 'T', 'PRONTO', MaskEdit1.Text, protocolooficial, microfilme, rl1, '', certifica, '', '', MaskEdit2.Text, MaskEdit3.Text, n_vias,nlivrob,folha_ini,n_vias,Label18.Caption,Label19.Caption, averbacao) then
      begin
        MessageBox(Handle, PChar('Baixa de REGISTRO realizada com sucesso.'), 'BAIXA DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
        BitBtn1.Enabled := False;
        BitBtn2.SetFocus;
        Exit;
      end;
    end;
    if (RadioButton3.Checked) then
    begin
      if BaixaProt(Label12.Caption, Label3.Caption, 'T', 'IRREGULAR', MaskEdit1.Text,'','','','','','','','','','','','','','','','') then
      begin
        AtualizaTabela('td', Label3.Caption, 'sit_not1,cod_ir1,data_not1', (Label6.Caption + ',' + Label7.Caption + ',' + ConvData(Label8.Caption)));
        MessageBox(Handle, PChar('Baixa de IRREGULAR realizada com sucesso.'), 'BAIXA DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    end;
    if (RadioButton4.Checked) then
    begin
      if BaixaProt(Label12.Caption, Label3.Caption, 'T', 'DÚVIDA', MaskEdit1.Text,'','','','','','','','','','','','','','','','') then
      begin
        MessageBox(Handle, PChar('Baixa de DÚVIDA realizada com sucesso.'), 'BAIXA DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    end;
    if (RadioButton5.Checked) then
    begin
      if BaixaProt(Label12.Caption, Label3.Caption, 'T', 'CANCELADO', MaskEdit1.Text,'','','','','','','','','','','','','','','','') then
      begin
        MessageBox(Handle, PChar('Baixa de CANCELAMENTO realizada com sucesso.'), 'BAIXA DE TÍTULOS', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
    end;
    F_Baixa1.BitBtn2Click(F_Baixa1);
  end
  else F_Baixa1.BitBtn2Click(F_Baixa1);
end;

procedure TF_Baixa1.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_Baixa1.FormActivate(Sender: TObject);
begin
  if RadioButton2.Checked then
  begin
    GroupBox2.Enabled := True;
    MaskEdit2.SetFocus;
  end
  else
  begin
    GroupBox2.Enabled := False;
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Baixa1.RadioButton3Click(Sender: TObject);
begin
{  Label6.Caption := '';
  Label7.Caption := '';
  Label8.Caption := '';
  Application.CreateForm(TF_PIRR, F_PIRR);
  F_PIRR.ShowModal;
  Label6.Caption := '1';
  Label7.Caption := Dm.Cad_Ir.FieldByName('codigo').asString;
  Label8.Caption := MaskEdit1.Text;
  F_PIRR.Destroy;
  F_PIRR := NIL;
  BitBtn1.SetFocus; }
end;

procedure TF_Baixa1.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_Baixa1.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

end.
