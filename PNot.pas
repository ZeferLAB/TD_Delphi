unit PNot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, ComCtrls, Buttons, Grids, DBGrids, jpeg;

type
  TF_PNotifica = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox1: TGroupBox;
    RichEdit1: TRichEdit;
    Label17: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label18: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    DBGrid1: TDBGrid;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Procedure Limpa_Label(Sender : TOBject);
    Procedure Carrega(Sender : TOBject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PNotifica: TF_PNotifica;

implementation

uses DMTD, Menu, Funcgeral;

{$R *.DFM}

Procedure TF_PNotifica.Carrega(Sender : TOBject);
var
  linha : String;
  VrDepR, VrDepA, VrCusR, VrCusA  : Currency;
begin
  VrDepR  := 0.00;
  VrDepA  := 0.00;
  VrCusR  := 0.00;
  VrCusA  := 0.00;
  RichEdit1.Lines.Clear;
  //buscando dados do registro
  if (Dm.Notifica.FieldByName('pauxiliar1').asInteger > 0) then
  begin
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT data_not1, sit_not1, cod_ir1');
    Dm.Td.Sql.Add('FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('p_auxiliar = ' + Dm.Notifica.FieldByName('pauxiliar1').asString);
    Dm.Td.Open;
    if (Dm.Td.RecordCount <> 0) then
    begin
      if (Dm.Td.FieldByName('data_not1').asDateTime <> 0) then
      begin
        linha := '';
        linha := '1ª Diligência realizada em ' + Dm.Td.FieldByName('data_not1').asString;
        if (Dm.Td.FieldByName('sit_not1').asInteger = 1) OR (Dm.Td.FieldByName('sit_not1').asInteger = 2) then
        begin
          if (Dm.Td.FieldByName('cod_ir1').asInteger <> 0) then
          begin
            linha := linha + ' Não Entregue - ' + Def_CodIrNot(Dm.Td.FieldByName('cod_ir1').asInteger) + '.';
          end
          else
          begin
            linha := linha + ' Não Entregue - ' + Trim(Dm.Td.FieldByName('obs_not1').asString) + '.';
          end;
        end
        else
        begin
          linha := linha + ' Entregue.';
        end;
        RichEdit1.Lines.Add(linha);
      end;
      if (Dm.Td.FieldByName('data_not2').asDateTime <> 0) then
      begin
        linha := '';
        linha := '2ª Diligência realizada em ' + Dm.Td.FieldByName('data_not2').asString;
        if (Dm.Td.FieldByName('sit_not2').asInteger = 1) OR (Dm.Td.FieldByName('sit_not2').asInteger = 2) then
        begin
          if (Dm.Td.FieldByName('cod_ir2').asInteger <> 0) then
          begin
            linha := linha + ' Não Entregue - ' + Def_CodIrNot(Dm.Td.FieldByName('cod_ir2').asInteger) + '.';
          end
          else
          begin
            linha := linha + ' Não Entregue - ' + Trim(Dm.Td.FieldByName('obs_not2').asString) + '.';
          end;
        end
        else
        begin
          linha := linha + ' Entregue.';
        end;
        RichEdit1.Lines.Add(linha);
      end;
      if (Dm.Td.FieldByName('data_not3').asDateTime <> 0) then
      begin
        linha := '';
        linha := '3ª Diligência realizada em ' + Dm.Td.FieldByName('data_not3').asString;
        if (Dm.Td.FieldByName('sit_not3').asInteger = 1) OR (Dm.Td.FieldByName('sit_not3').asInteger = 2) then
        begin
          if (Dm.Td.FieldByName('cod_ir3').asInteger <> 0) then
          begin
            linha := linha + ' Não Entregue - ' + Def_CodIrNot(Dm.Td.FieldByName('cod_ir3').asInteger) + '.';
          end
          else
          begin
            linha := linha + ' Não Entregue - ' + Trim(Dm.Td.FieldByName('obs_not3').asString) + '.';
          end;
        end
        else
        begin
          linha := linha + ' Entregue.';
        end;
        RichEdit1.Lines.Add(linha);
      end;
      VrDepR := Dm.TD.FieldByName('deposito').asCurrency;
      VrCusR := Dm.TD.FieldByName('custas').asCurrency;
    end;
    Dm.Td.Close;  
  end;
  //buscando dados da averbação
  if (Dm.Notifica.FieldByName('pauxiliar2').asInteger > 0) then
  begin
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT data_not1, sit_not1, cod_ir1');
    Dm.Td.Sql.Add('FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('p_auxiliar = ' + Dm.Notifica.FieldByName('pauxiliar2').asString);
    Dm.Td.Open;
    if (Dm.Td.RecordCount <> 0) then
    begin
      VrDepA := Dm.TD.FieldByName('deposito').asCurrency;
      VrCusA := Dm.TD.FieldByName('custas').asCurrency;
    end;
    Dm.Td.Close;
  end;    
  //carregando labels.
  if ((VrDepR + VrDepA) > (VrCusR + VrCusA)) then
  begin
    Label17.Caption := 'Valor a Restituir R$ ' + StrCurr(((VrDepR + VrDepA) - (VrCusR + VrCusA)), 14, True);
  end
  else
  begin
    Label17.Caption := 'Valor a Receber R$ ' + StrCurr(((VrCusR + VrCusA) - (VrDepR + VrDepA)), 14, True);
  end;
  Label4.Caption   := StrZero(Dm.Notifica.FieldByName('pauxiliar1').asString, 6);
  Label6.Caption   := StrZero(Dm.Notifica.FieldByName('protocolo1').asString, 6);
  Label8.Caption   := StrZero(Dm.Notifica.FieldByName('pauxiliar2').asString, 6);
  Label10.Caption  := StrZero(Dm.Notifica.FieldByName('protocolo2').asString, 6);
  Label12.Caption  := StrZero(Dm.Notifica.FieldByName('reg_cart').asString, 6);
  Label14.Caption  := Dm.Notifica.FieldByName('nom_cart').asString;
  Label16.Caption  := Dm.Notifica.FieldByName('end_cart').asString;
  Label18.Caption  := Dm.Notifica.FieldByName('status').asString;
  Label22.Caption  := Dm.Notifica.FieldByName('n_oficio').asString;
  Label24.Caption  := Dm.Notifica.FieldByName('data_of').asString;
  Label26.Caption  := Dm.Notifica.FieldByName('ac_nome').asString;
  Label28.Caption  := Dm.Notifica.FieldByName('data_post').asString;  
end;

Procedure TF_PNotifica.Limpa_Label(Sender : TOBject);
begin
  Dm.Notifica.Close;
  RichEdit1.Lines.Clear;
  Label4.Caption   := '';
  Label6.Caption   := '';
  Label8.Caption   := '';
  Label10.Caption  := '';
  Label12.Caption  := '';
  Label14.Caption  := '';
  Label16.Caption  := '';
  Label17.Caption  := '';
  Label18.Caption  := '';
  Label22.Caption  := '';
  Label24.Caption  := '';
  Label26.Caption  := '';
  Label28.Caption  := '';
  Panel2.Visible   := False;
  Panel1.Enabled   := True;
  MaskEdit1.Text   := '';
end;

procedure TF_PNotifica.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_PNotifica.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cod  : Integer;
  argu : String;  
begin
  if key = 13 then
  begin
    cod := (StrToInt(Copy(ComboBox1.Text, 1,2)));
    if (not ValidNumero(Copy(ComboBox1.Text, 1,2))) OR
       (cod > 6) OR (cod <= 0) then
    begin
      MessageBox(Handle, PChar('Opção de pesquisa inválida !'), 'ERRO', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
      MessageBox(Handle, PChar('Favor optar por uma opção válida !'), 'ERRO', MB_OK + MB_ICONWARNING);
      ComboBox1.SetFocus;
      Exit;
    end;
    if (Trim(MaskEdit1.Text) = '') then
    begin
      MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MessageBox(Handle, PChar('Você deve digitar algum dado para realizar a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    argu := '';
    if (cod > 0) AND (cod <= 5)  then
    begin
      RadioButton1.Checked := True;
      argu := Trim(MaskEdit1.Text);
    end
    else
    begin
      if (RadioButton1.Checked) then argu := Chr(39) + Trim(MaskEdit1.Text) + Chr(39);
      if (RadioButton2.Checked) then argu := Chr(39) + Trim(MaskEdit1.Text) + '%' + Chr(39);
      if (RadioButton3.Checked) then argu := Chr(39) + '%' + Trim(MaskEdit1.Text) + '%' + Chr(39);
      if (RadioButton4.Checked) then argu := 'Soundex(' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39) + ')';
    end;
    Dm.Notifica.Close;
    Dm.Notifica.RequestLive := False;
    Dm.Notifica.Sql.Clear;
    Dm.Notifica.Sql.Add('SELECT * FROM notifica');
    Dm.Notifica.Sql.Add('WHERE');
    if (cod = 1) then Dm.Notifica.Sql.Add('pauxiliar1 = '+ argu);
    if (cod = 2) then Dm.Notifica.Sql.Add('protocolo1  = '+ argu);
    if (cod = 3) then Dm.Notifica.Sql.Add('pauxiliar2 = '+ argu);
    if (cod = 4) then Dm.Notifica.Sql.Add('protocolo2  = '+ argu);
    if (cod = 5) then Dm.Notifica.Sql.Add('reg_cart    = '+ argu);
    if (cod = 6) then
    begin
      if (RadioButton1.Checked) then
      begin
        Dm.Notifica.Sql.Add('nom_cart = '+ argu);
      end
      else
      begin
        if (RadioButton4.Checked) then
        begin
          Dm.Notifica.Sql.Add('soundex(nom_cart) = '+ argu);
        end
        else Dm.Notifica.Sql.Add('nom_cart like '+ argu);
      end;
    end;
    Dm.Notifica.Sql.Add('ORDER BY nom_cart');
    Dm.Notifica.Open;
    if (Dm.Notifica.RecordCount = 0) then
    begin
      Dm.Notifica.Close;
      MessageBox(Handle, PChar('Dados não encontrados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
      MaskEdit1.SetFocus;
      Exit;
    end;
    Carrega(F_PNotifica);
    Panel2.Visible := True;
    Panel1.Enabled := False;
    DbGrid1.SetFocus;
  end;
end;

procedure TF_PNotifica.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_PNotifica.BitBtn1Click(Sender: TObject);
begin
  Limpa_Label(F_PNotifica);
  ComboBox1.SetFocus;
end;

procedure TF_PNotifica.FormDestroy(Sender: TObject);
begin
  Dm.Notifica.Close;
end;

end.
