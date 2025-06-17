unit U_DajeEmitidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_DajeEmitidos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    Shape1: TShape;
    Label4: TLabel;
    ComboBox2: TComboBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_DajeEmitidos: TF_DajeEmitidos;

implementation

uses Menu, DM, U_ImpDajeEmitidos;

{$R *.DFM}

procedure TF_DajeEmitidos.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_DajeEmitidos.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_DajeEmitidos.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then ComboBox2.SetFocus;
end;

procedure TF_DajeEmitidos.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  ComboBox1.Clear;
  ComboBox2.Clear;
  MaskEdit1.SetFocus;
end;

procedure TF_DajeEmitidos.BitBtn1Click(Sender: TObject);
begin
  If Not ValidData(MaskEdit1.Text) then
  Begin
    Application.MessageBox('Data Inicial Inválida!', 'DAJE Emitidos', Mb_IconWarning);
    MaskEdit1.SetFocus;
    Exit;
  End;

  If Not ValidData(MaskEdit2.Text) then
  Begin
    Application.MessageBox('Data Final Inválida!', 'DAJE Emitidos', Mb_IconWarning);
    MaskEdit2.SetFocus;
    Exit;
  End;

  If StrToDate(MaskEdit1.Text) > StrToDate(MaskEdit2.Text) then
  Begin
    Application.MessageBox('Data Inicial Maior que a Data Final!', 'DAJE Emitidos', Mb_IconWarning);
    MaskEdit1.SetFocus;
    Exit;
  End;

  If (ComboBox1.Text = '') then
  Begin
    Application.MessageBox('Usuário Inválido!', 'DAJE Emitidos', Mb_IconWarning);
    ComboBox1.SetFocus;
    Exit;
  End;

  Dm_Notas.Aux2.Close;
  Dm_Notas.Aux2.SQL.Clear;
  Dm_Notas.Aux2.SQL.Add('select * from log_daje');
  Dm_Notas.Aux2.SQL.Add('where data_emi between ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(MaskEdit1.Text))));
  Dm_Notas.Aux2.SQL.Add('and ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(MaskEdit2.Text))));

  If (ComboBox1.Text <> 'GERAL') then
    Dm_Notas.Aux2.SQL.Add('and usuario = ' + QuotedStr(ComboBox1.Text));

  If (ComboBox2.Text <> 'TODOS') then
    Dm_Notas.Aux2.SQL.Add('and atribuicao = ' + QuotedStr(ComboBox2.Text));

  Dm_Notas.Aux2.SQL.Add('order by serie_daje, numero_daje');
  Dm_Notas.Aux2.Open;

  If (Dm_Notas.Aux2.RecordCount = 0) then
  Begin
    Application.MessageBox('Movimento não Encontrado!', 'DAJE Emitidos', Mb_IconInformation);
    Exit;
  End;

  Application.CreateForm(TF_ImpDajeEmitidos, F_ImpDajeEmitidos);

  If (ComboBox2.Text = 'TODOS') then
    F_ImpDajeEmitidos.QRLabel2.Caption  := 'Relatório de DAJE Emitidos - GERAL'
  Else
    F_ImpDajeEmitidos.QRLabel2.Caption  := 'Relatório de DAJE Emitidos ' + ComboBox2.Text; 

  F_ImpDajeEmitidos.QRLabel1.Caption  := F_Menu.Label9.Caption;
  F_ImpDajeEmitidos.QRLabel41.Caption := DateToStr(Date) + ' ' + TimeToStr(Time);
  F_ImpDajeEmitidos.QRLabel3.Caption  := 'Período de: ' + MaskEdit1.Text + ' a ' + MaskEdit2.Text;
  F_ImpDajeEmitidos.QuickRep1.Preview;
  F_ImpDajeEmitidos.Destroy;
  F_ImpDajeEmitidos := Nil;
end;

procedure TF_DajeEmitidos.MaskEdit2Exit(Sender: TObject);
begin
  If Not ValidData(MaskEdit1.Text) then
  Begin
    Application.MessageBox('Data Inicial Inválida!', 'DAJE Emitidos', Mb_IconWarning);
    MaskEdit1.SetFocus;
    Exit;
  End;

  If Not ValidData(MaskEdit2.Text) then
  Begin
    Application.MessageBox('Data Final Inválida!', 'DAJE Emitidos', Mb_IconWarning);
    MaskEdit2.SetFocus;
    Exit;
  End;

  If StrToDate(MaskEdit1.Text) > StrToDate(MaskEdit2.Text) then
  Begin
    Application.MessageBox('Data Inicial Maior que a Data Final!', 'DAJE Emitidos', Mb_IconWarning);
    MaskEdit1.SetFocus;
    Exit;
  End;

  ComboBox1.Clear;

  Dm_Notas.Aux.Close;
  Dm_Notas.Aux.SQL.Clear;
  Dm_Notas.Aux.SQL.Add('select usuario from log_daje');
  Dm_Notas.Aux.SQL.Add('where data_emi between ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(MaskEdit1.Text))));
  Dm_Notas.Aux.SQL.Add('and ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(MaskEdit2.Text))));
  Dm_Notas.Aux.SQL.Add('group by usuario');
  Dm_Notas.Aux.SQL.Add('order by usuario');
  Dm_Notas.Aux.Open;
  If (Dm_Notas.Aux.RecordCount <> 0) then
  Begin
    ComboBox1.Items.Add('GERAL');
    While (Not Dm_Notas.Aux.Eof) Do
    Begin
      ComboBox1.Items.Add(Dm_Notas.Aux.FieldByName('usuario').AsString);
      Dm_Notas.Aux.Next;
    End;
    ComboBox1.Text := 'GERAL';
  End;

  Dm_Notas.Aux.Close;
  Dm_Notas.Aux.SQL.Clear;
  Dm_Notas.Aux.SQL.Add('select atribuicao from log_daje');
  Dm_Notas.Aux.SQL.Add('where data_emi between ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(MaskEdit1.Text))));
  Dm_Notas.Aux.SQL.Add('and ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(MaskEdit2.Text))));
  Dm_Notas.Aux.SQL.Add('group by atribuicao');
  Dm_Notas.Aux.SQL.Add('order by atribuicao');
  Dm_Notas.Aux.Open;
  If (Dm_Notas.Aux.RecordCount <> 0) then
  Begin
    ComboBox2.Items.Add('TODOS');
    While (Not Dm_Notas.Aux.Eof) Do
    Begin
      ComboBox2.Items.Add(Dm_Notas.Aux.FieldByName('atribuicao').AsString);
      Dm_Notas.Aux.Next;
    End;
    ComboBox2.Text := 'TODOS';
  End;
end;

procedure TF_DajeEmitidos.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then ComboBox1.SetFocus;
end;

procedure TF_DajeEmitidos.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit2.Text := MaskEdit1.Text;
end;

procedure TF_DajeEmitidos.ComboBox1KeyPress(Sender: TObject; var Key: Char);
var
  Found: boolean;
  i,SelSt: Integer;
  TmpStr: string;
begin
  if Key in ['a'..'z'] then Dec(Key,32);
  with (Sender as TComboBox) do
  begin
    SelSt := SelStart;
    if (Key = Chr(vk_Back)) and (SelLength <> 0) then
     TmpStr := Copy(Text,1,SelStart)+Copy(Text,SelLength+SelStart+1,255)

    else if Key = Chr(vk_Back) then
     TmpStr := Copy(Text,1,SelStart-1)+Copy(Text,SelStart+1,255)
    else
     TmpStr := Copy(Text,1,SelStart)+Key+Copy(Text,SelLength+SelStart+1,255);
    if TmpStr = '' then Exit;

    if (Key = Chr(vk_Back)) and (SelSt > 0) then Dec(SelSt)

    else if Key <> Chr(vk_Back) then Inc(SelSt);
    Key := #0;
    if SelSt = 0 then
    begin
      Text:= '';
      Exit;
    end;

    Found := False;
    for i := 1 to Items.Count do
      if UpperCase(Copy(Items[i-1],1,Length(TmpStr))) = UpperCase(TmpStr) then
      begin
        Text := Items[i-1];
        ItemIndex := i-1;
        Found := True;
        Break;
      end;
    if Found then
    begin
      SelStart := SelSt;
      SelLength := Length(Text)-SelSt;
    end
    else Beep;
  end;
end;

procedure TF_DajeEmitidos.ComboBox2KeyPress(Sender: TObject; var Key: Char);
  var
  Found: boolean;
  i,SelSt: Integer;
  TmpStr: string;
begin
  if Key in ['a'..'z'] then Dec(Key,32);
  with (Sender as TComboBox) do
  begin
    SelSt := SelStart;
    if (Key = Chr(vk_Back)) and (SelLength <> 0) then
     TmpStr := Copy(Text,1,SelStart)+Copy(Text,SelLength+SelStart+1,255)

    else if Key = Chr(vk_Back) then
     TmpStr := Copy(Text,1,SelStart-1)+Copy(Text,SelStart+1,255)
    else
     TmpStr := Copy(Text,1,SelStart)+Key+Copy(Text,SelLength+SelStart+1,255);
    if TmpStr = '' then Exit;

    if (Key = Chr(vk_Back)) and (SelSt > 0) then Dec(SelSt)

    else if Key <> Chr(vk_Back) then Inc(SelSt);
    Key := #0;
    if SelSt = 0 then
    begin
      Text:= '';
      Exit;
    end;

    Found := False;
    for i := 1 to Items.Count do
      if UpperCase(Copy(Items[i-1],1,Length(TmpStr))) = UpperCase(TmpStr) then
      begin
        Text := Items[i-1];
        ItemIndex := i-1;
        Found := True;
        Break;
      end;
    if Found then
    begin
      SelStart := SelSt;
      SelLength := Length(Text)-SelSt;
    end
    else Beep;
  end;
end;

procedure TF_DajeEmitidos.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 then BitBtn1.SetFocus;
end;

end.
