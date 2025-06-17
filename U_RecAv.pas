unit U_RecAv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolEdit, StdCtrls, ComCtrls, CurrEdit, Mask, ExtCtrls, Buttons, ValorPor,
  NcsAlignment;

type
  TF_Recib2 = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Bevel2: TBevel;
    Label3: TLabel;
    RichEdit1: TRichEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ValorPorExtenso1: TValorPorExtenso;
    Label5: TLabel;
    FormataTexto: TNcsAlignment;
    Label6: TLabel;
    MaskEdit5: TMaskEdit;
    BitBtn3: TBitBtn;
    Label7: TLabel;
    ComboBox1: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox2: TComboBox;
    Bevel3: TBevel;
    BitBtn4: TBitBtn;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Recib2: TF_Recib2;
  vez, impport : String;
  y : Integer;

implementation

uses Menu, DMTD, FuncGeral, ProcGeral, TRecep, Func, RecepR;

{$R *.DFM}

procedure TF_Recib2.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_Recib2.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Maskedit5.SetFocus;
end;

procedure TF_Recib2.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Recib2.BitBtn1Click(Sender: TObject);
var
  num_rec : integer;
  val_di, val_dp, val_ch : Currency;
begin
  If NOT ValidNumero(Label7.Caption) then
  Begin
    num_rec        := F_RecepR.Gera_Recibo;
    Label7.Caption := strzero(inttostr(num_rec),6);
  End;

  val_di := 0.00;
  val_dp := 0.00;
  val_ch := 0.00;
  If Trim(ComboBox2.Text) = 'DI' then val_di := CurrencyEdit1.Value;
  If Trim(ComboBox2.Text) = 'CH' then val_ch := CurrencyEdit1.Value;
  If Trim(ComboBox2.Text) = 'DP' then val_dp := CurrencyEdit1.Value;

  if (not Atualiza_Caixa(MaskEdit5.Text, '10', 'E', 'TÍTULO PARA REGISTRO', Label7.Caption, '', F_Menu.Label1.Caption, Trim(MaskEdit1.Text),
                         CurrencyEdit1.Value, val_di, val_dp, val_ch, 0.00)) then
  begin
    ShowMessage('Problemas para atualizar o caixa.');
  end;

  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('insert into rec_tit (data, recibo, apresentante, vr_emol, ');
  Dm.ArqAux.Sql.Add('tp_pgt, tp_recibo, descr_recibo) ');
  Dm.ArqAux.Sql.Add('Values ( ');
  Dm.ArqAux.Sql.Add(QuotedStr(ConvData(MaskEdit5.Text)));
  Dm.ArqAux.Sql.Add(', ' + Label7.Caption);
  Dm.ArqAux.Sql.Add(', ' + QuotedStr(MaskEdit1.Text));
  Dm.ArqAux.Sql.Add(', ' + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit1.Value)));
  Dm.ArqAux.Sql.Add(', ' + QuotedStr(ComboBox2.Text));
  Dm.ArqAux.Sql.Add(', ' + QuotedStr(ComboBox1.Text));
  Dm.ArqAux.Sql.Add(', ' + QuotedStr(RichEdit1.Text));
  Dm.ArqAux.Sql.Add(') ');
  Try
    Dm.ArqAux.ExecSql;
  Except
    ShowMessage('Problemas para guardar recibo.');
  End;
  
  Application.CreateForm(TF_TelaRecep, F_TelaRecep);
  F_TelaRecep.Label1.Caption := 'Gerar impressão quantas vezes ?';
  F_TelaRecep.ShowModal;
  vez := F_TelaRecep.MaskEdit1.Text;
  F_TelaRecep.Destroy;
  F_TelaRecep := NIL;

  for y := 1 to strtoint(vez) do
  begin
    impport := Bematech_porta;
    ReciboRecBem(Funcoes, True, MaskEdit5.Text, '',
                 Label7.Caption,
                 Trim(MaskEdit1.Text), '',
                 Trim(RichEdit1.Text),
                 '',
                 '',
                 '',
                 '',
                 'AV',
                 '',
                 '',
                 '',
                 '',
                 '',
                 impport,
                 '',
                 F_Menu.Label1.Caption,
                 CurrencyEdit1.Value,
                 CurrencyEdit1.Value,
                 CurrencyEdit1.Value,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00,
                 0.00);
                 
  end;

  Bitbtn3.Setfocus;
end;

procedure TF_Recib2.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then RichEdit1.SetFocus;
end;

procedure TF_Recib2.BitBtn3Click(Sender: TObject);
begin
  F_Recib2.MaskEdit1.Text      := '';
  F_Recib2.CurrencyEdit1.Value := 0;
  F_Recib2.RichEdit1.Lines.Clear;
  F_Recib2.MaskEdit1.Setfocus;
  Label7.Caption := '000000A';
end;

procedure TF_Recib2.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if key = 13 then RichEdit1.Setfocus;
  if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_Recib2.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  Begin
    RichEdit1.Lines.Add(ComboBox1.Text);
    RichEdit1.SetFocus;
  End;
end;

procedure TF_Recib2.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_Recib2.BitBtn4Click(Sender: TObject);
var
  n_rec : String;
begin
  n_rec := InputBox('Pesquisa de Recibo', 'N. Recibo ','0');
  If Validnumero(n_rec) then
  Begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('select * from rec_tit where recibo = ' + n_rec);
    Dm.ArqAux.Open;
    If Dm.ArqAux.RecordCount <> 0 then
    Begin
      Label7.Caption := Dm.ArqAux.FieldByname('recibo').AsString;
      MaskEdit1.Text := Dm.ArqAux.FieldByname('apresentante').AsString;
      MaskEdit5.Text := Dm.ArqAux.FieldByname('data').AsString;
      CurrencyEdit1.Value := Dm.ArqAux.FieldByname('vr_emol').AsCurrency;
      ComboBox1.Text := Dm.ArqAux.FieldByname('tp_recibo').AsString;
      ComboBox2.Text := Dm.ArqAux.FieldByname('tp_pgt').AsString;
      RichEdit1.Text := Dm.ArqAux.FieldByname('descr_recibo').AsString;

      Application.CreateForm(TF_TelaRecep, F_TelaRecep);
      F_TelaRecep.Label1.Caption := 'Gerar impressão quantas vezes ?';
      F_TelaRecep.ShowModal;
      vez := F_TelaRecep.MaskEdit1.Text;
      F_TelaRecep.Destroy;
      F_TelaRecep := NIL;

      for y := 1 to strtoint(vez) do
      begin
        impport := Bematech_porta;
        ReciboRecBem(Funcoes, True, MaskEdit5.Text, '',
                     Label7.Caption,
                     Trim(MaskEdit1.Text), '',
                     Trim(RichEdit1.Text),
                     '',
                     '',
                     '',
                     '',
                     'AV',
                     '',
                     '',
                     '',
                     '',
                     '',
                     impport,
                     '',
                     F_Menu.Label1.Caption,
                     CurrencyEdit1.Value,
                     CurrencyEdit1.Value,
                     CurrencyEdit1.Value,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00,
                     0.00);

      end;
    End
    Else ShowMessage('Recibo não localizado.');
  End;
end;

end.
