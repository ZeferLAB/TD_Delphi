unit CadEmol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, jpeg, ToolEdit, CurrEdit, Mask, Grids,
  DBGrids;

type
  TF_CadEmol = class(TForm)
    ControlBar1: TControlBar;
    Label36: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    CurrencyEdit1: TCurrencyEdit;
    Label8: TLabel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ComboBox1: TComboBox;
    SpeedButton5: TSpeedButton;
    Label86: TLabel;
    CkPrazoEntrega: TCheckBox;
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure CurrencyEdit3Exit(Sender: TObject);
    procedure CurrencyEdit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadEmol: TF_CadEmol;
  Sub_Tot, Vtrib, Vdefe, Vproc, Vmutu, Vacot, Vdist, Tot_Geral : Currency;

implementation

uses Menu, DMTD, FuncGeral, ProcGeral;


{$R *.DFM}

Procedure Abre_TabAtos2;
begin
  DM.Tab_Ato2.Close;
  DM.Tab_Ato2.Sql.Clear;
  DM.Tab_Ato2.Sql.Add('SELECT * FROM tab_ato2');
  DM.Tab_Ato2.Sql.Add('ORDER BY data, tabela, item_tab');
  DM.Tab_Ato2.Open;
  DM.Tab_Ato2.FindLast;
end;

Procedure Carrega_item;
begin
  with F_CadEmol do
  begin
    DM.ArqAux1.Close;
    DM.ArqAux1.Sql.Clear;
    DM.ArqAux1.Sql.Add('SELECT  * FROM tab_ato2  WHERE id = ' + DM.tab_ato2.fieldbyname('id').AsString);
    DM.ArqAux1.Open;

    DM.ArqAux1.FindFirst;

    MaskEdit1.Text := DM.Tab_Ato2.FieldByName('data').asString;
    MaskEdit3.Text := DM.Tab_Ato2.FieldByName('descricao').asString;
    MaskEdit4.Text := DM.Tab_Ato2.FieldByName('tabela').AsString;
    MaskEdit5.Text := DM.Tab_Ato2.FieldByName('item_tab').AsString;
    MaskEdit6.Text := DM.Tab_Ato2.FieldByName('subitem').AsString;
    ComboBox1.Text := DM.Tab_Ato2.FieldByName('tipo').AsString;

    CurrencyEdit1.Value := DM.Tab_Ato2.FieldByName('de').AsCurrency;
    CurrencyEdit2.Value := DM.Tab_Ato2.FieldByName('ate').AsCurrency;
    CurrencyEdit3.Value := DM.Tab_Ato2.FieldByName('valor_tab').AsCurrency;
    CurrencyEdit4.Value := DM.Tab_Ato2.FieldByName('taxa').AsCurrency;
    CurrencyEdit5.Value := DM.Tab_Ato2.FieldByName('total').AsCurrency;

    If DM.Tab_Ato2.FieldByName('exibir_prazo_recibo_protocolo').AsBoolean = True Then
      CkPrazoEntrega.Checked:= True
    Else
    CkPrazoEntrega.Checked:= False;

  end;
end;

Procedure Limpar_Campos;
begin
  with F_CadEmol do
  begin
    MaskEdit1.Clear;
    MaskEdit3.Clear;
    MaskEdit4.Clear;
    MaskEdit5.Clear;
    MaskEdit6.Clear;
    ComboBox1.Clear;

    CurrencyEdit1.Value  := 0;
    CurrencyEdit2.Value  := 0;
    CurrencyEdit3.Value  := 0;
    CurrencyEdit4.Value  := 0;
    CurrencyEdit5.Value  := 0;
  end;
end;

procedure TF_CadEmol.SpeedButton8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CadEmol.FormActivate(Sender: TObject);
begin
  Abre_TabAtos2;

  DM.Tab_atoemol.Close;
  DM.Tab_atoemol.Sql.Clear;
  DM.Tab_atoemol.Sql.Add('SELECT * FROM cad_tabdemais');
  DM.Tab_atoemol.Sql.Add('ORDER BY data DESC');
  DM.Tab_atoemol.Open; 
end;

procedure TF_CadEmol.SpeedButton1Click(Sender: TObject);
begin
  if SpeedButton1.Caption = '&Incluir' then
  begin
    SpeedButton1.Caption := '&Gravar';
    SpeedButton2.Enabled := False;
    SpeedButton3.Enabled := False;
    SpeedButton4.Enabled := False;
    SpeedButton5.Enabled := False;
    SpeedButton8.Enabled := False;
    Panel2.Enabled  := True;
  end
  else
  begin
    if (MessageBox(Handle, PChar('Salvar Dados ?'), 'INCLUS�O', MB_YESNO + MB_ICONQUESTION) = IDYes) then
    begin
      Dm.tab_ato2.Close;
      Dm.tab_ato2.Sql.Clear;
      Dm.tab_ato2.SQL.Add('INSERT INTO tab_ato2 (data, descricao, tabela, item_tab, subitem, tipo, de, ate, valor_tab, taxa, total, exibir_prazo_recibo_protocolo)');
      Dm.tab_ato2.SQL.Add(' VALUES(');

      if TirarTudo(MaskEdit1.Text, '-','.','/') <> '' then Dm.tab_ato2.Sql.Add(QuotedStr(ConvData(MaskEdit1.Text))  + ', ') else Dm.tab_ato2.Sql.Add('NULL, ');

      Dm.tab_ato2.SQL.Add(QuotedStr(MaskEdit3.Text) + ', ');
      Dm.tab_ato2.SQL.Add(QuotedStr(MaskEdit4.Text) + ', ');
      Dm.tab_ato2.SQL.Add(QuotedStr(MaskEdit5.Text) + ', ');
      Dm.tab_ato2.SQL.Add(QuotedStr(MaskEdit6.Text) + ', ');
      Dm.tab_ato2.SQL.Add(QuotedStr(ComboBox1.Text) + ', ');
      Dm.tab_ato2.Sql.Add(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit1.Value)) + ', ');
      Dm.tab_ato2.Sql.Add(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit2.Value)) + ', ');
      Dm.tab_ato2.Sql.Add(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit3.Value)) + ', ');
      Dm.tab_ato2.Sql.Add(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit4.Value)) + ', ');
      Dm.tab_ato2.Sql.Add(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit5.Value)) + ', ');
      if CkPrazoEntrega.Checked Then
        Dm.tab_ato2.Sql.Add('"T")')
      else
      Dm.tab_ato2.Sql.Add('"F")');

      Dm.tab_ato2.ExecSQL;
    end
    else
    ShowMessage('Inclus�o n�o realizada !');
    Abre_TabAtos2;
    SpeedButton1.Caption  := '&Incluir';
    SpeedButton2.Enabled  := True;
    SpeedButton3.Enabled  := True;
    SpeedButton4.Enabled  := True;
    SpeedButton5.Enabled  := True;
    SpeedButton8.Enabled  := True;
    Panel2.Enabled        := False;
  end;
end;  

procedure TF_CadEmol.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    Carrega_item;
  end;
end;

procedure TF_CadEmol.DBGrid1DblClick(Sender: TObject);
begin
  Carrega_item;
end;

procedure TF_CadEmol.SpeedButton2Click(Sender: TObject);
begin
  if SpeedButton2.Caption = '&Corrigir' then
  begin
    SpeedButton2.Caption := '&Gravar';
    SpeedButton1.Enabled := False;
    SpeedButton3.Enabled := False;
    SpeedButton4.Enabled := False;
    SpeedButton5.Enabled := False;
    SpeedButton8.Enabled := False;
    Panel2.Enabled   := True;
    MaskEdit1.SetFocus;
  end
  else
  begin
    if messagedlg('Dados Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM.ArqAux.Active := False;
      DM.ArqAux.Sql.Clear;
      DM.ArqAux.Sql.Add('UPDATE tab_ato2 SET');

      if TirarTudo(MaskEdit1.Text, '-','.','/') <> '' then DM.ArqAux.Sql.Add(' data = ' + QuotedStr(ConvData(MaskEdit1.Text)) + ',') else DM.ArqAux.Sql.Add(' data = NULL,');

      DM.ArqAux.Sql.Add(' descricao = ' + QuotedStr(MaskEdit3.Text) + ',');
      DM.ArqAux.Sql.Add(' tabela = '    + QuotedStr(MaskEdit4.Text) + ',');
      DM.ArqAux.Sql.Add(' item_tab = '  + QuotedStr(MaskEdit5.Text) + ',');
      DM.ArqAux.Sql.Add(' subitem = '   + QuotedStr(MaskEdit6.Text) + ',');
      DM.ArqAux.Sql.Add(' tipo = '      + QuotedStr(ComboBox1.Text) + ',');

      DM.ArqAux.Sql.Add(' de = '        + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit1.Value)) + ',');
      DM.ArqAux.Sql.Add(' ate = '       + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit2.Value)) + ',');
      DM.ArqAux.Sql.Add(' valor_tab = ' + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit3.Value)) + ',');

      if CkPrazoEntrega.Checked Then
        DM.ArqAux.Sql.Add(' exibir_prazo_recibo_protocolo = "T",')
      else
      DM.ArqAux.Sql.Add(' exibir_prazo_recibo_protocolo = "F",');


      DM.ArqAux.Sql.Add(' taxa = '      + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit4.Value)) + ',');
      DM.ArqAux.Sql.Add(' total = '     + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit5.Value)));
      DM.ArqAux.Sql.Add(' WHERE id =  ' + DM.tab_ato2.fieldbyname('id').AsString);

      Dm.ArqAux.ExecSQL;
    end
    else
    ShowMessage('Corre��o n�o realizada !');
    SpeedButton2.Caption := '&Corrigir';
    Abre_TabAtos2;
    SpeedButton1.Enabled := True;
    SpeedButton3.Enabled := True;
    SpeedButton4.Enabled := True;
    SpeedButton5.Enabled := True;
    SpeedButton8.Enabled := True;
    Panel2.Enabled       := False;
  end;
end;

procedure TF_CadEmol.SpeedButton3Click(Sender: TObject);
var
  id : String;
begin
  if messagedlg('Deseja excluir este item ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    id := inttostr(DM.tab_ato2.fieldbyname('id').AsInteger);
    DM.Tab_ato2.delete;
    DM.Tab_ato2.close;
    DM.Tab_ato2.open;
    if id < '1' then DM.Tab_ato2.FindFirst else
    begin
      DM.Tab_ato2.FindFirst;
      if not DM.Tab_ato2.locate('id', id, []) then DM.Tab_ato2.findlast;
    end;
  end;

end;

procedure TF_CadEmol.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Carrega_item;
end;

procedure TF_CadEmol.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_CadEmol.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_CadEmol.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_CadEmol.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_CadEmol.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_CadEmol.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_CadEmol.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_CadEmol.CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    if (SpeedButton1.Enabled) then SpeedButton1Click(Sender) else SpeedButton2Click(Sender);
end;

procedure TF_CadEmol.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit1.SetFocus;
end;

procedure TF_CadEmol.CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit3.SetFocus;
end;

procedure TF_CadEmol.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit2.SetFocus;
end;

procedure TF_CadEmol.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit4.SetFocus;
end;

procedure TF_CadEmol.CurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit5.SetFocus;
end;

procedure TF_CadEmol.SpeedButton5Click(Sender: TObject);
begin
  DM.Tab_Ato2.Next;

  MaskEdit1.Text := DM.Tab_Ato2.FieldByName('data').asString;
  MaskEdit3.Text := DM.Tab_Ato2.FieldByName('descricao').asString;
  MaskEdit4.Text := DM.Tab_Ato2.FieldByName('tabela').AsString;
  MaskEdit5.Text := DM.Tab_Ato2.FieldByName('item_tab').AsString;
  MaskEdit6.Text := DM.Tab_Ato2.FieldByName('subitem').AsString;
  ComboBox1.Text := DM.Tab_Ato2.FieldByName('tipo').AsString;

  CurrencyEdit1.Value := DM.Tab_Ato2.FieldByName('de').AsCurrency;
  CurrencyEdit2.Value := DM.Tab_Ato2.FieldByName('ate').AsCurrency;
  CurrencyEdit3.Value := DM.Tab_Ato2.FieldByName('valor_tab').AsCurrency;
  CurrencyEdit4.Value := DM.Tab_Ato2.FieldByName('taxa').AsCurrency;
  CurrencyEdit5.Value := DM.Tab_Ato2.FieldByName('total').AsCurrency;

  If DM.Tab_Ato2.FieldByName('exibir_prazo_recibo_protocolo').AsBoolean = True Then
    CkPrazoEntrega.Checked:= True
  Else
  CkPrazoEntrega.Checked:= False;

end;

procedure TF_CadEmol.SpeedButton4Click(Sender: TObject);
begin
  DM.Tab_Ato2.Prior;

  MaskEdit1.Text := DM.Tab_Ato2.FieldByName('data').asString;
  MaskEdit3.Text := DM.Tab_Ato2.FieldByName('descricao').asString;
  MaskEdit4.Text := DM.Tab_Ato2.FieldByName('tabela').AsString;
  MaskEdit5.Text := DM.Tab_Ato2.FieldByName('item_tab').AsString;
  MaskEdit6.Text := DM.Tab_Ato2.FieldByName('subitem').AsString;
  ComboBox1.Text := DM.Tab_Ato2.FieldByName('tipo').AsString;

  CurrencyEdit1.Value := DM.Tab_Ato2.FieldByName('de').AsCurrency;
  CurrencyEdit2.Value := DM.Tab_Ato2.FieldByName('ate').AsCurrency;
  CurrencyEdit3.Value := DM.Tab_Ato2.FieldByName('valor_tab').AsCurrency;
  CurrencyEdit4.Value := DM.Tab_Ato2.FieldByName('taxa').AsCurrency;
  CurrencyEdit5.Value := DM.Tab_Ato2.FieldByName('total').AsCurrency;
  If DM.Tab_Ato2.FieldByName('exibir_prazo_recibo_protocolo').AsBoolean = True Then
    CkPrazoEntrega.Checked:= True
  Else
  CkPrazoEntrega.Checked:= False;


end;

procedure TF_CadEmol.CurrencyEdit3Exit(Sender: TObject);
var
  taxa : Currency;
begin
  taxa := (CurrencyEdit3.Value * DM.Tab_atoemol.FieldByName('tribunal').AsInteger) /100;
  CurrencyEdit4.Value := TruncaArre(taxa);
end;

procedure TF_CadEmol.CurrencyEdit4Exit(Sender: TObject);
begin
  CurrencyEdit5.Value := CurrencyEdit3.Value + CurrencyEdit4.Value;
end;

end.
