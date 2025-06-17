unit DevC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, ToolEdit, CurrEdit, jpeg;

type
  TF_DevC = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit13: TMaskEdit;
    CurrencyEdit1: TCurrencyEdit;
    ComboBox3: TComboBox;
    Label3: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    ControlBar1: TControlBar;
    Label34: TLabel;
    Panel1: TPanel;
    Label16: TLabel;
    Label21: TLabel;
    Label12: TLabel;
    MaskEdit9: TMaskEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    BitBtn5: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Limpar(Sender : TOBject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  F_DevC: TF_DevC;

implementation

uses Menu, Dep1, DMTD, FuncGeral, ProcGeral, U_ReciboDevolucaoCertidao;

{$R *.DFM}

Procedure TF_DevC.Limpar(Sender : TOBject);
Begin
  BitBtn4.Enabled     := False;
  MaskEdit1.Enabled   := True;
  MaskEdit1.Text      := '';
  MaskEdit13.Text     := '';
  ComboBox3.Text      := '';
  CurrencyEdit1.Value := 0.00;
  MaskEdit3.Text      := '';
  MaskEdit4.Text      := '';
  MaskEdit5.Text      := '';
  MaskEdit6.Text      := '';
  MaskEdit7.Text      := '';
  MaskEdit8.Text      := '';
  CurrencyEdit4.Value := 0.00;
  CurrencyEdit2.Value := 0.00;
  MaskEdit1.Enabled   := True;
  Label16.Visible     := False;
  Label21.Visible     := False;
  CurrencyEdit4.Value := 0.00;
  CurrencyEdit5.Value := 0.00;
  CurrencyEdit6.Value := 0.00;
  CurrencyEdit7.Value := 0.00;
  CurrencyEdit8.Value := 0.00;
  Label22.Caption     := '';
  Label23.Caption     := '';
  Label24.Caption     := '';
  MaskEdit9.Text      := '';
end;

procedure TF_DevC.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_DevC.BitBtn2Click(Sender: TObject);
begin
  Limpar(F_DevC);
  MaskEdit1.SetFocus;
end;

procedure TF_DevC.BitBtn1Click(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    ShowMessage('Protocolo Auxiliar inválido !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  MaskEdit1.Enabled := False;
  Dm.Certidao.Close;
  Dm.Certidao.Sql.Clear;
  Dm.Certidao.Sql.Add('SELECT * FROM certidao');
  Dm.Certidao.Sql.Add('WHERE');
  Dm.Certidao.Sql.Add('nr_protoc = ' + MaskEdit1.Text);
  Dm.Certidao.Open;
  if (Dm.Certidao.RecordCount = 0) then
  begin
    Dm.Certidao.Close;
    ShowMessage('Pedido não localizado !');
    Exit;
  end;
  MaskEdit13.Text     := Dm.Certidao.FieldByName('movimento').asString;
  MaskEdit9.Text      := Dm.Certidao.FieldByName('Retirante').asString;
  ComboBox3.Text      := Ver_Natureza(Dm.Certidao.FieldByName('natureza').asString, True);
  CurrencyEdit1.Value := Dm.Certidao.FieldByName('deposito').asCurrency;
  MaskEdit3.Text      := Dm.Certidao.FieldByName('apresentan').asString;
  MaskEdit4.Text      := Dm.Certidao.FieldByName('telefone').asString;
  MaskEdit5.Text      := Dm.Certidao.FieldByName('propriet').asString;
  MaskEdit6.Text      := Dm.Certidao.FieldByName('imovel1').asString;
  MaskEdit7.Text      := Dm.Certidao.FieldByName('imovel2').asString;
  MaskEdit8.Text      := Dm.Certidao.FieldByName('imovel3').asString;
//  CurrencyEdit2.Value := Dm.Certidao.FieldByName('vl_certid').asCurrency;
  CurrencyEdit2.Value := Dm.Certidao.FieldByName('custas').asCurrency;
  Label16.Visible     := True;
  Label16.Caption     := Dm.Certidao.FieldByName('status').asString + ' EM ' + Dm.Certidao.FieldByName('stat_data').asString;
  MaskEdit9.Enabled   := True;
  if (Dm.Certidao.FieldByName('status').asString = 'PRONTO') OR
     (Dm.Certidao.FieldByName('status').asString = 'IRREGULAR') then BitBtn4.Enabled := True;
  if (Trim(Dm.Certidao.FieldByName('status').asString) = 'IRREGULAR') then
  begin
    Label21.Visible := True;
    Label21.Caption     := 'Diferença a ser DEVOLVIDA R$ ' + StrCurr(Dm.Certidao.fieldbyname('deposito').ascurrency, 14, True);
    Label22.Caption     := 'S';
    Label23.Caption     := 'DEVOLUÇÃO INTEGRAL DO DEPÓSITO';
    CurrencyEdit4.Value := Dm.Certidao.FieldByName('deposito').asCurrency;
  end;
  if (Trim(Dm.Certidao.FieldByName('status').asString) = 'PRONTO') then
  begin
    if (Dm.Certidao.FieldByName('custas').asCurrency > Dm.Certidao.FieldByName('deposito').asCurrency) then
    begin
      Label21.Visible     := True;
      Label21.Caption     := 'Diferença a ser COBRADA R$ ' + StrCurr((Dm.Certidao.FieldByName('custas').asCurrency - Dm.Certidao.FieldByName('deposito').asCurrency), 14, True);
      Label22.Caption     := 'E';
      Label23.Caption     := 'DEVOLUÇÃO COM SALDO A RECEBER';
      CurrencyEdit4.Value := Abs(Dm.Certidao.FieldByName('custas').asCurrency - Dm.Certidao.FieldByName('deposito').asCurrency);
    end
    else
    begin
      if (Dm.Certidao.FieldByName('custas').asCurrency < Dm.Certidao.FieldByName('deposito').asCurrency) then
      begin
        Label21.Visible     := True;
        Label21.Caption     := 'Diferença a ser DEVOLVIDA R$ ' + StrCurr((Dm.Certidao.fieldbyname('deposito').ascurrency - Dm.Certidao.FieldByName('vl_certid').asCurrency), 14, True);
        Label22.Caption     := 'S';
        Label23.Caption     := 'DEVOLUÇÃO COM SALDO A DEVOLVER';
        CurrencyEdit4.Value := Abs(Dm.Certidao.FieldByName('deposito').asCurrency - Dm.Certidao.FieldByName('custas').asCurrency);
      end
      else
      begin
        Label21.Visible     := True;
        Label21.Caption     := 'Diferença a ser COBRADA R$ 0,00';
        Label22.Caption     := 'S';
        Label23.Caption     := 'DEVOLUÇÃO SEM DIFERENÇA DE VALOR';
        CurrencyEdit4.Value := 0.00;
      end;
    end;
  end;
  Dm.Certidao.Close;
  if (BitBtn4.Enabled) then BitBtn4.SetFocus else BitBtn2.SetFocus; 
end;

procedure TF_DevC.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit2.setfocus;
end;

procedure TF_DevC.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_DevC.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

procedure TF_DevC.BitBtn4Click(Sender: TObject);
var
  tpbx : string;
begin
  if (MessageBox(Handle, PChar('Confirma devolução do pedido de certidão ?'), 'DEVOLUÇÃO DE TÍTULO', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = Id_Yes) then
  begin
    Label24.Caption := '';
    if (CurrencyEdit4.Value > 0) then
    begin
      Application.CreateForm(TF_Dep1, F_Dep1);
      F_Dep1.ShowModal;
      CurrencyEdit5.Value        := F_Dep1.CurrencyEdit1.Value;
      CurrencyEdit6.Value        := F_Dep1.CurrencyEdit2.Value;
      CurrencyEdit7.Value        := F_Dep1.CurrencyEdit3.Value;
      Label24.Caption            := F_Dep1.MaskEdit1.Text;
      F_Dep1.Destroy;
      F_Dep1 := NIL;
    end;
    Dm.Certidao.Close;
    Dm.Certidao.Sql.Clear;
    Dm.Certidao.Sql.Add('SELECT entrega, status, devolvido, stat_data, identific2, Retirante FROM certidao');
    Dm.Certidao.Sql.Add('WHERE');
    Dm.Certidao.Sql.Add('nr_protoc = ' + MaskEdit1.Text);
    Dm.Certidao.Open;
    if (Dm.Certidao.RecordCount = 0) then
    begin
      Dm.Certidao.Close;
      ShowMessage('Problemas para localizar o protocolo auxiliar !');
      ShowMessage('Favor verificar !');
      BitBtn2Click(F_DevC);
      Exit;
    end;
    Dm.Certidao.Edit;
    Dm.Certidao.FieldByName('entrega').asstring    := maskedit2.text;
    Dm.Certidao.FieldByName('devolvido').asstring  := 'S';
//    Dm.Certidao.FieldByName('data_dev').asstring   := DateToStr(date);
    Dm.Certidao.FieldByName('identific2').asstring := F_Menu.Label1.Caption;
    Dm.Certidao.FieldByName('Retirante').asString := MaskEdit9.Text;
    Dm.Certidao.FieldByName('stat_data').asString:= MaskEdit2.Text;    
    if (Trim(Dm.Certidao.FieldByName('status').asString) = 'IRREGULAR') then Dm.Certidao.FieldByName('status').asString := 'DEVOLVIDO IRREGULAR';
    if (Trim(Dm.Certidao.FieldByName('status').asString) = 'PRONTO')    then Dm.Certidao.FieldByName('status').asString := 'DEVOLVIDO PRONTO';
    tpbx := '';
    tpbx := Dm.Certidao.FieldByName('status').asString;
    Dm.Certidao.Post;
    Dm.Certidao.Close;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), 'C', F_Menu.Label1.Caption, 'Baixa de ' + tpbx + ' em ' + MaskEdit2.Text + '.', MaskEdit1.Text);
    if (not Atualiza_Caixa(MaskEdit2.Text, '14', Label22.Caption, Label23.Caption, MaskEdit1.Text, Label24.Caption, F_Menu.Label1.Caption, Trim(MaskEdit3.Text), CurrencyEdit4.Value, CurrencyEdit5.Value, CurrencyEdit7.Value, CurrencyEdit6.Value, CurrencyEdit3.Value)) then
    begin
      ShowMessage('Problemas para atualiza o caixa.');
    end;
    ShowMessage('Devolução efetuada com sucesso !');
    BitBtn2Click(F_DevC);
  end;
end;

procedure TF_DevC.FormActivate(Sender: TObject);
begin
  MaskEdit2.Text := DateToStr(Date);
end;

procedure TF_DevC.BitBtn5Click(Sender: TObject);
begin
  F_ReciboDevolucaoCertidao:= TF_ReciboDevolucaoCertidao.Create(Nil);
  F_ReciboDevolucaoCertidao.Mk_Protocolo.Text:= MaskEdit1.Text;
  F_ReciboDevolucaoCertidao.ShowModal;
  F_ReciboDevolucaoCertidao := NIL;
end;

end.

