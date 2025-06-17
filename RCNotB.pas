unit RCNotB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls;

type
  TF_RCNotB = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    ComboBox3: TComboBox;
    RichEdit1: TRichEdit;
    Label4: TLabel;
    ComboBox2: TComboBox;
    Label7: TLabel;
    ComboBox4: TComboBox;
    Label8: TLabel;
    MaskEdit4: TMaskEdit;
    Label9: TLabel;
    MaskEdit5: TMaskEdit;
    CheckBox1: TCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RCNotB: TF_RCNotB;
  tpbx    : String;

implementation

uses DMTD, Menu, QkCNotB, QkCNotB2, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RCNotB.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RCNotB.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit1.SetFocus;
end;

procedure TF_RCNotB.BitBtn1Click(Sender: TObject);
var
  arq : String;
  ende, compl, texto3, texto2, texto1 : String;
  x : Integer;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT * FROM td_pesso');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('    (data_not1  = ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  if (StrToInt(MaskEdit2.Text) > 0) AND (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.Join.Sql.Add('AND protocolo >= ' + Trim(MaskEdit2.Text));
    Dm.Join.Sql.Add('AND protocolo <= ' + Trim(MaskEdit3.Text));
  end;
  Dm.Join.Sql.Add('AND enc_not = "S")');
  Dm.Join.Sql.Add('OR  (data_not2 = ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  if (StrToInt(MaskEdit2.Text) > 0) AND (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.Join.Sql.Add('AND protocolo >= ' + Trim(MaskEdit2.Text));
    Dm.Join.Sql.Add('AND protocolo <= ' + Trim(MaskEdit3.Text));
  end;
  Dm.Join.Sql.Add('AND enc_not = "S")');
  Dm.Join.Sql.Add('OR  (data_not3 = ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  if (StrToInt(MaskEdit2.Text) > 0) AND (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.Join.Sql.Add('AND protocolo >= ' + Trim(MaskEdit2.Text));
    Dm.Join.Sql.Add('AND protocolo <= ' + Trim(MaskEdit3.Text));
  end;
  Dm.Join.Sql.Add('AND enc_not = "S")');
  Dm.Join.Sql.Add('ORDER BY protocolo');   
  Dm.Join.Open;
  if (Dm.Join.RecordCount = 0) then
  begin
    Dm.Join.Close;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'CERTNOT';
  CriaTabela('CERTNOT', arq);
  Dm.ArqAux.Close;
  Dm.ArqAux.RequestLive := True;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Open;
  while (not Dm.Join.Eof) do
  begin
    ende  := '';
    compl := '';
    ende  := Dm.Join.FieldByName('endereco').asString;
    if (Trim(Dm.Join.FieldByName('numero').asString) <> '') then
    begin
      ende := ende + ' Nº ' + Dm.Join.FieldByName('numero').asString;
    end;
    if (Trim(Dm.Join.FieldByName('complem').asString) <> '') then
    begin
      ende := ende + ' ' + Dm.Join.FieldByName('complem').asString + ' ';
    end;
    if (Trim(Dm.Join.FieldByName('bairro').asString) <> '') then
    begin
      ende := Trim(ende) + ' ' + Dm.Join.FieldByName('bairro').asString;
    end;
    if (Trim(Dm.Join.FieldByName('cidade').asString) <> '') then
    begin
      compl := Trim(Dm.Join.FieldByName('cidade').asString) + ' - ' + Trim(Dm.Join.FieldByName('estado').asString); 
    end;
    for x := 1 to strtoInt(maskedit4.text) do
    begin
      Dm.ArqAux.Append;
      Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.Join.FieldByName('registro').asInteger;
      Dm.ArqAux.FieldByName('p_auxiliar').asString   := Dm.Join.FieldByName('p_auxiliar').asString;
      Dm.ArqAux.FieldByName('empresa').asString      := Busca_NomePessoal(Dm.Join.FieldByName('p_auxiliar').asString, 'R');
      Dm.ArqAux.FieldByName('nome').asString         := Dm.Join.FieldByName('nome').asString;
      Dm.ArqAux.FieldByName('endereco').asString     := ende;
      Dm.ArqAux.FieldByName('bairro').asString       := compl;
      Dm.ArqAux.FieldByName('cep').asString          := FormataCep(Dm.Join.FieldByName('cep').asString);
      RichEdit1.Lines.Clear;
      if (Dm.Join.FieldByName('data_not1').asDateTime > 0) then
      begin
        if (Dm.Join.FieldByName('sit_not1').asString = 'N') then Dm.ArqAux.FieldByName('situacao').asString := 'NEGATIVA' else Dm.ArqAux.FieldByName('situacao').asString := 'POSITIVA';
        RichEdit1.Lines.Add('Data   : ' + Dm.Join.FieldByName('data_not1').asString + ' às ' + Dm.Join.FieldByName('hora_not1').asString + ' horas.');
        RichEdit1.Lines.Add(Trim(Dm.Join.FieldByName('obs_not1').asString));
        RichEdit1.Lines.Add('');
      end;
      if (Dm.Join.FieldByName('data_not2').asDateTime > 0) then
      begin
        if (Dm.Join.FieldByName('sit_not2').asString = 'N') then Dm.ArqAux.FieldByName('situacao').asString := 'NEGATIVA' else Dm.ArqAux.FieldByName('situacao').asString := 'POSITIVA';
        RichEdit1.Lines.Add('Data   : ' + Dm.Join.FieldByName('data_not2').asString + ' às ' + Dm.Join.FieldByName('hora_not2').asString + ' horas.');
        RichEdit1.Lines.Add(Trim(Dm.Join.FieldByName('obs_not2').asString));
        RichEdit1.Lines.Add('');
      end;
      if (Dm.Join.FieldByName('data_not3').asDateTime > 0) then
      begin
        if (Dm.Join.FieldByName('sit_not3').asString = 'N') then Dm.ArqAux.FieldByName('situacao').asString := 'NEGATIVA' else Dm.ArqAux.FieldByName('situacao').asString := 'POSITIVA';
        RichEdit1.Lines.Add('Data   : ' + Dm.Join.FieldByName('data_not3').asString + ' às ' + Dm.Join.FieldByName('hora_not3').asString + ' horas.');
        RichEdit1.Lines.Add(Trim(Dm.Join.FieldByName('obs_not3').asString));
      end;
      Dm.ArqAux.FieldByName('observacao').asString := RichEdit1.Lines.Text;
      Dm.ArqAux.FieldByName('anotacao').asString   := BuscaDado('td', 'anotacao', Dm.Join.FieldByName('protocolo').asString);
      Dm.ArqAux.FieldByName('cod_local').asString  := BuscaDado('td', 'cod_local', Dm.Join.FieldByName('protocolo').asString);
      Dm.ArqAux.Post;
    end;
    Dm.Join.Next;
  end;
  Dm.Join.Close;
  Dm.ArqAux.Close;
  Dm.ArqAux.RequestLive := False;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY indexador'); //indexador
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    ShowMessage('Movimento não encontrado !');
    MaskEdit1.SetFocus;
    Exit;
  end;

  if F_RCNotB.CheckBox1.Checked then
   begin
    Application.CreateForm(TQk_CNotB2, Qk_CNotB2);
    Qk_CNotB2.QrLabel1.Caption  := F_Menu.Label29.Caption;
    Qk_CNotB2.QrLabel30.Caption := F_Menu.Label11.Caption;
    Qk_CNotB2.QrLabel2.Caption  := F_Menu.Label5.Caption;
    Qk_CNotB2.QrLabel3.Caption  := F_Menu.Label13.Caption;
    Qk_CNotB2.QrLabel26.Caption := DataExtenso(MaskEdit5.Text, True, '');
    //Qk_CNotB2.QuickRep1.PrinterSettings.Copies := StrtoInt(maskedit4.text);
    Qk_CNotB2.QuickRep1.Preview;
    Qk_CNotB2.Destroy;
    Qk_CNotB2 := NIL;
   end
   else
   begin
    Application.CreateForm(TQk_CNotB, Qk_CNotB);
    Qk_CNotB.QrLabel1.Caption  := F_Menu.Label29.Caption;
    Qk_CNotB.QrLabel30.Caption := F_Menu.Label11.Caption;
    Qk_CNotB.QrLabel2.Caption  := F_Menu.Label5.Caption;
    Qk_CNotB.QrLabel3.Caption  := F_Menu.Label13.Caption;
    Qk_CNotB.QrLabel26.Caption := DataExtenso(MaskEdit5.Text, True, '');
    //Qk_CNotB.QuickRep1.PrinterSettings.Copies := StrtoInt(maskedit4.text);
    Qk_CNotB.QuickRep1.Preview;
    Qk_CNotB.Destroy;
    Qk_CNotB := NIL;
   end;
  Dm.ArqAux.Close;
  DestroeTabela(arq);
end;

procedure TF_RCNotB.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_RCNotB.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox3.SetFocus;
end;

procedure TF_RCNotB.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox4.SetFocus;
end;

procedure TF_RCNotB.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
end;

procedure TF_RCNotB.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RCNotB.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_RCNotB.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_RCNotB.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_RCNotB.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RCNotB.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RCNotB.ComboBox1Change(Sender: TObject);
begin
  ComboBox3.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

procedure TF_RCNotB.ComboBox2Change(Sender: TObject);
begin
  ComboBox4.Text:= RetornaCargoSecundario(ComboBox2.ItemIndex);
end;

end.
