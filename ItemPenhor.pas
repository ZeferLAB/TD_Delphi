unit ItemPenhor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, ComCtrls, ToolEdit,
  CurrEdit;

type
  TfrmItemPenhor = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    RichEdit1: TRichEdit;
    lblLocal: TLabel;
    StatusBar1: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItemPenhor: TfrmItemPenhor;

implementation

uses Func,Menu, DMTD, Exame, FuncGeral, ProcGeral;

{$R *.DFM}


Function TirarPonto(texto : String) : String;
var
  Posi : Integer;
begin
  Result := '';
  Result := Trim(Texto);
  Posi   := 0;
  Posi   := Pos('.', texto);
  Result := Trim(Copy(Texto, 1, (Posi - 1)) + '' + Copy(Texto, (Posi + 1), Length(Texto)));
end;

Function TrocaVirgulaporPonto(texto : String) : String;
var
  Posi : Integer;
begin
  Result := '';
  Result := Trim(Texto);
  Posi   := 0;
  Posi   := Pos(',', texto);
  if posi > 0 then
  Result := Trim(Copy(Texto, 1, (Posi - 1)) + '.' + Copy(Texto, (Posi + 1), Length(Texto)));
end;

procedure TfrmItemPenhor.FormActivate(Sender: TObject);
begin
  DM.qryPenhor.Close;
  DM.qryPenhor.Sql.Clear;
  DM.qryPenhor.Sql.Add('SELECT * FROM penhor WHERE protocolo = ' + #39 + F_Exame.MaskEdit1.Text + #39);
  DM.qryPenhor.Open;
  DM.qryPenhor.FindFirst;
  CurrencyEdit1.Value := DM.qryPenhor.FieldByname('vr_credito').AsCurrency;
  MaskEdit1.Text      := DM.qryPenhor.FieldByname('dt_emissao').AsString;
  MaskEdit2.Text      := DM.qryPenhor.FieldByname('dt_vencimento').AsString;
  RichEdit1.Text      := DM.qryPenhor.FieldByname('bens_garantia').AsString;
  BitBtn1.SetFocus;
end;

procedure TfrmItemPenhor.BitBtn1Click(Sender: TObject);
begin
  If BitBtn1.Caption = '&Incluir' then
  Begin
    Bitbtn1.Caption := '&Gravar';
    BitBtn2.Enabled := False;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    Panel1.Enabled  := True;
    CurrencyEdit1.SetFocus;
  End
  Else
  Begin
    if messageDlg('Dados Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      DM.qryPenhor.Close;
      DM.qryPenhor.Sql.Clear;
      DM.qryPenhor.Sql.Add('INSERT INTO penhor (data, protocolo, vr_credito, dt_emissao, dt_vencimento, bens_garantia)');
      DM.qryPenhor.Sql.Add(' VALUES (');
      DM.qryPenhor.Sql.Add(QuotedStr(ConvData(DateToStr(now))) + ',');
      DM.qryPenhor.Sql.Add(F_Exame.MaskEdit1.Text + ',');
      DM.qryPenhor.Sql.Add(chr(39) + TrocavirgulaporPonto(TirarPonto(FormatCurr('########0.00',CurrencyEdit1.Value))) + chr(39) + ', ');

      if (ValidData(MaskEdit1.Text)) then
        DM.qryPenhor.Sql.Add(QuotedStr(ConvData(MaskEdit1.Text)) + ',')
      else
      DM.qryPenhor.Sql.Add('null,');

      if (ValidData(MaskEdit2.Text)) then
        DM.qryPenhor.Sql.Add(QuotedStr(ConvData(MaskEdit2.Text))+ ',')
      else
      DM.qryPenhor.Sql.Add('null,');

      DM.qryPenhor.Sql.Add(QuotedStr(RichEdit1.Text));
      DM.qryPenhor.Sql.Add(')');
      Try
        DM.qryPenhor.ExecSQL;
      Except
        ShowMessage('Problemas para gravar os dados.');
      End;
    End;
    Bitbtn1.Caption := '&Incluir';
    BitBtn2.Enabled := True;
    BitBtn3.Enabled := True;
    BitBtn4.Enabled := True;
    Panel1.Enabled  := False;

    DM.qryPenhor.Close;
    DM.qryPenhor.Sql.Clear;
    DM.qryPenhor.Sql.Add('SELECT * FROM penhor WHERE protocolo = ' + #39 + F_Exame.MaskEdit1.Text + #39);
    DM.qryPenhor.Open;
    DM.qryPenhor.FindFirst;
  End;
end;

procedure TfrmItemPenhor.BitBtn2Click(Sender: TObject);
var
  rec : String;
begin
  If BitBtn2.Caption = '&Corrigir' then
  Begin
    Bitbtn2.Caption := '&Gravar';
    BitBtn1.Enabled := False;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    Panel1.Enabled  := True;
    CurrencyEdit1.SetFocus;
  End
  Else
  Begin
    if messageDlg('Dados Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      DM.ArqAux.Close;
      DM.ArqAux.Sql.Clear;
      DM.ArqAux.Sql.Add('UPDATE penhor SET ');
      //DM.ArqAux.Sql.Add(' data = ' + QuotedStr(ConvData(F_Exame.MaskEdit1.Text,'ANO')) + ',');
      DM.ArqAux.Sql.Add(' protocolo = ' + F_Exame.MaskEdit1.Text + ',');
      DM.ArqAux.Sql.Add(' vr_credito = ' + QuotedStr(TrocavirgulaporPonto(TirarPonto(FormatCurr('########0.00',CurrencyEdit1.Value)))) + ',');
      if ValidData(MaskEdit1.Text) then
        DM.ArqAux.Sql.Add(' dt_emissao = ' + QuotedStr(ConvData(MaskEdit1.Text)) + ',')
      else
        DM.ArqAux.Sql.Add(' dt_emissao = Null,');
      if ValidData(MaskEdit2.Text) then
        DM.ArqAux.Sql.Add(' dt_vencimento = ' + QuotedStr(ConvData(MaskEdit2.Text)) + ',')
      else
        DM.ArqAux.Sql.Add(' dt_vencimento = Null,');
      DM.ArqAux.Sql.Add(' bens_garantia = ' + QuotedStr(RichEdit1.Text));
      DM.ArqAux.Sql.Add(' WHERE recno = ' + DM.qryPenhor.FieldByName('recno').AsString);
      Try
        DM.ArqAux.ExecSql;
      Except
        ShowMessage('Problemas para corrigir os dados.');
      End;
    End;
    Bitbtn2.Caption := '&Corrigir';
    BitBtn1.Enabled := True;
    BitBtn3.Enabled := True;
    BitBtn4.Enabled := True;
    Panel1.Enabled  := False;

    DM.qryPenhor.Close;
    DM.qryPenhor.Sql.Clear;
    DM.qryPenhor.Sql.Add('SELECT * FROM penhor WHERE protocolo = ' + #39 + F_Exame.MaskEdit1.Text + #39);
    DM.qryPenhor.Open;
    DM.qryPenhor.FindFirst;
  End;
end;

procedure TfrmItemPenhor.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then MaskEdit2.SetFocus;
end;

procedure TfrmItemPenhor.BitBtn3Click(Sender: TObject);
var
  rec : String;
begin
  if messageDlg('Deseja efetuar Exclusão ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('DELETE FROM penhor WHERE recno = ' + Dm.qryPenhor.FieldByName('recno').AsString);
    Try
      Dm.ArqAux.ExecSql;
    Except
      ShowMessage('Problemas para excluir os dados.');
    End;
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('SELECT * FROM penhor WHERE protocolo = ' + #39 + F_Exame.MaskEdit1.Text + #39);
    DM.ArqAux.Open;

    DM.qryPenhor.Close;
    DM.qryPenhor.Sql.Clear;
    DM.qryPenhor.Sql.Add('SELECT * FROM penhor WHERE protocolo = ' + #39 + F_Exame.MaskEdit1.Text + #39);
    DM.qryPenhor.Open;

    CurrencyEdit1.Value := DM.qryPenhor.FieldByname('vr_credito').AsCurrency;
    MaskEdit1.Text      := DM.qryPenhor.FieldByname('dt_emissao').AsString;
    MaskEdit2.Text      := DM.qryPenhor.FieldByname('dt_vencimento').AsString;
    RichEdit1.Text      := DM.qryPenhor.FieldByname('bens_garantia').AsString;

  End;
end;

procedure TfrmItemPenhor.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmItemPenhor.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then RichEdit1.SetFocus;
end;

procedure TfrmItemPenhor.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CurrencyEdit1.Value := DM.qryPenhor.FieldByname('vr_credito').AsCurrency;
  MaskEdit1.Text      := DM.qryPenhor.FieldByname('dt_emissao').AsString;
  MaskEdit2.Text      := DM.qryPenhor.FieldByname('dt_vencimento').AsString;
  RichEdit1.Text      := DM.qryPenhor.FieldByname('bens_garantia').AsString;
end;

procedure TfrmItemPenhor.DBGrid1CellClick(Column: TColumn);
begin
  CurrencyEdit1.Value := DM.qryPenhor.FieldByname('vr_credito').AsCurrency;
  MaskEdit1.Text      := DM.qryPenhor.FieldByname('dt_emissao').AsString;
  MaskEdit2.Text      := DM.qryPenhor.FieldByname('dt_vencimento').AsString;
  RichEdit1.Text      := DM.qryPenhor.FieldByname('bens_garantia').AsString;
end;

procedure TfrmItemPenhor.DBGrid1DblClick(Sender: TObject);
begin
  CurrencyEdit1.Value := DM.qryPenhor.FieldByname('vr_credito').AsCurrency;
  MaskEdit1.Text      := DM.qryPenhor.FieldByname('dt_emissao').AsString;
  MaskEdit2.Text      := DM.qryPenhor.FieldByname('dt_vencimento').AsString;
  RichEdit1.Text      := DM.qryPenhor.FieldByname('bens_garantia').AsString;
end;

procedure TfrmItemPenhor.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

end.
