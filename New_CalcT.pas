unit New_CalcT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, jpeg, Buttons, Grids,
  DBGrids, Db, DBTables, Menus;

type
  TF_NewCalcT = class(TForm)
    Panel1: TPanel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    Label28: TLabel;
    Label29: TLabel;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    Label30: TLabel;
    SpeedButton2: TSpeedButton;
    MaskEdit12: TMaskEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit9: TCurrencyEdit;
    CurrencyEdit10: TCurrencyEdit;
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    DS_AuxCalc: TDataSource;
    Aux_Calc: TQuery;
    MaskEdit1: TMaskEdit;
    PopupMenu1: TPopupMenu;
    Incluir1: TMenuItem;
    Corrigir1: TMenuItem;
    Excluir1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label5: TLabel;
    CurrencyEdit11: TCurrencyEdit;
    Label6: TLabel;
    MaskEdit6: TMaskEdit;
    DBGrid2: TDBGrid;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DS_AuxCalc2: TDataSource;
    Aux_Calc2: TQuery;
    Label7: TLabel;
    SpeedButton5: TSpeedButton;
    CurrencyEdit12: TCurrencyEdit;
    Label8: TLabel;
    MaskEdit7: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    CurrencyEdit13: TCurrencyEdit;
    Panel3: TPanel;
    DBGrid3: TDBGrid;
    CalcAtos: TQuery;
    DS_CalcAtos: TDataSource;
    CurrencyEdit14: TCurrencyEdit;
    Label11: TLabel;
    Label12: TLabel;
    Panel4: TPanel;
    Label13: TLabel;
    CurrencyEdit15: TCurrencyEdit;
    Label14: TLabel;
    CurrencyEdit16: TCurrencyEdit;
    Label15: TLabel;
    CurrencyEdit17: TCurrencyEdit;
    Label16: TLabel;
    CurrencyEdit18: TCurrencyEdit;
    Label31: TLabel;
    CurrencyEdit19: TCurrencyEdit;
    Label32: TLabel;
    MaskEdit11: TMaskEdit;
    Label33: TLabel;
    CurrencyEdit20: TCurrencyEdit;
    Label34: TLabel;
    MaskEdit13: TMaskEdit;
    Label35: TLabel;
    CurrencyEdit21: TCurrencyEdit;
    CurrencyEdit22: TCurrencyEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    CurrencyEdit23: TCurrencyEdit;
    Label27: TLabel;
    Panel5: TPanel;
    Label37: TLabel;
    CurrencyEdit24: TCurrencyEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure Incluir1Click(Sender: TObject);
    procedure Corrigir1Click(Sender: TObject);
    procedure Panel2DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure MaskEdit6Exit(Sender: TObject);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit8Exit(Sender: TObject);
    procedure MaskEdit9Exit(Sender: TObject);
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure MaskEdit14Exit(Sender: TObject);
    procedure MaskEdit15Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CurrencyEdit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    arq, Arq_Temp : String;
  end;

var
  F_NewCalcT: TF_NewCalcT;
  Sub_Tot, Tot_Geral : Currency;
  dt_tab : String;
  qtde, recno : String;
  datnovo : String;
  calc_menu : Boolean;
implementation

uses DMTD, Menu, FuncGeral, RecepR, RecepC, ProcGeral;

{$R *.DFM}
Procedure Carrega_CadTab;
begin
  With F_NewCalcT do
  begin
    MaskEdit2.Text       := Dm.Cad_Tab2.fieldbyname('tabela').AsString;
    MaskEdit3.Text       := Dm.Cad_Tab2.fieldbyname('item').AsString;
    MaskEdit4.Text       := Dm.Cad_Tab2.fieldbyname('subitem').AsString;
    MaskEdit5.Text       := Dm.Cad_Tab2.fieldbyname('descricao').AsString;
    CurrencyEdit11.Value := Dm.Cad_Tab2.fieldbyname('valor').AsCurrency;
    CurrencyEdit14.Value := Dm.Cad_Tab2.fieldbyname('valor').AsCurrency;
  end;
end;

Procedure Carrega_TabAtos2;
begin
  With F_NewCalcT do
  begin
    MaskEdit2.Text       := Aux_Calc.fieldbyname('tabela').AsString;
    MaskEdit3.Text       := Aux_Calc.fieldbyname('item_tab').AsString;
    MaskEdit4.Text       := Aux_Calc.fieldbyname('subitem').AsString;
    MaskEdit5.Text       := Aux_Calc.fieldbyname('descr_tab').AsString;
    CurrencyEdit11.Value := Aux_Calc.fieldbyname('valor_tab').AsCurrency;
    CurrencyEdit14.Value := Aux_Calc.fieldbyname('valor_tab').AsCurrency;
    MaskEdit6.Text       := Aux_Calc.fieldbyname('vl_qtd').AsString;
  end;
end;

Function Ver_LAE(Cod : String) : String;
Begin
  DM.Tab_atos.Close;
  DM.Tab_atos.Sql.Clear;
  DM.Tab_atos.Sql.Add('SELECT * FROM tab_atos');
  DM.Tab_atos.Open;
  DM.Tab_atos.FindFirst;
  if DM.Tab_atos.Locate('cd_ato', cod, []) then Result := DM.Tab_atos.FieldbyName('descricao').AsString else Result := '';
end;

Procedure Abre_CadTab;
begin
  Dm.Cad_Tab2.RequestLive := False;
  Dm.Cad_Tab2.Close;
  Dm.Cad_Tab2.Sql.Clear;
  Dm.Cad_Tab2.Sql.Add('SELECT * FROM cad_tab where year(data) = ' + QuotedStr(Copy(datnovo,7,4)) + ' order by tabela, item, subitem');
  Dm.Cad_Tab2.Open;
  Dm.Cad_Tab2.FindFirst;
  Dm.Cad_Tab2.RequestLive := True;
end;

Procedure Abre_TabAto2;
begin
  DM.Tab_atos.RequestLive := False;
  DM.Tab_atos.Close;
  DM.Tab_atos.Sql.Clear;
  DM.Tab_atos.Sql.Add('SELECT * FROM tab_ato2 where year(data) = ' + QuotedStr(Copy(datnovo,7,4)) + 'order by codigo');
  DM.Tab_atos.Open;
  DM.Tab_atos.FindFirst;
  DM.Tab_atos.RequestLive := True;
end;

procedure TF_NewCalcT.SpeedButton1Click(Sender: TObject);
begin
  Close;
  if Assigned (F_RecepR) then
  Begin
    qtd_pg := 0;
    F_RecepR.CurrencyEdit2.Value := CurrencyEdit7.Value;
    If ValidNumero(MaskEdit9.Text) then qtd_pg := StrToInt(MaskEdit9.Text);
  End
  Else if Assigned (F_RecepC) then F_RecepC.CurrencyEdit5.Value := CurrencyEdit15.Value;
end;

procedure TF_NewCalcT.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vr_tabnew : Currency;
  vr_calc_fim, ufir_min, ufir_max : Currency;

begin
  if key = 13 then
  begin
    Aux_Calc.RequestLive := False;
    Aux_Calc.Close;
    Aux_Calc.Sql.Clear;
    Aux_Calc.Sql.Add('SELECT * FROM tab_ato2 WHERE codigo = ' + MaskEdit1.Text + ' AND year(data) = ' + QuotedStr(Copy(datnovo,7,4)));
    Aux_Calc.Open;
    Aux_Calc.RequestLive := True;
    MaskEdit7.Text := Aux_Calc.fieldbyname('data').AsString;

    if Assigned (F_RecepR) then
    begin
      F_RecepR.Label40.Caption := '';
      Arq_Temp := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'CALCATOS';
      DestroeTabela(arq_temp);
      CriaTabela('CALCATOS', arq_temp);
      F_RecepR.Label40.Caption := Arq_Temp;
    end;

    if Assigned (F_RecepC) then
    begin
      F_RecepC.Label20.Caption := '';
      Arq_Temp := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'CALCATOS';
      DestroeTabela(arq_temp);
      CriaTabela('CALCATOS', arq_temp);
      F_RecepC.Label20.Caption := Arq_Temp;
    end;

    If calc_menu then
    Begin
      Arq_Temp := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'CALCATOS';
      DestroeTabela(arq_temp);
      CriaTabela('CALCATOS', arq_temp);

      vr_calc_fim := 0.00;
      ufir_min    := 0.00;
      ufir_max    := 0.00;
      If (MaskEdit1.Text = '6001') OR (MaskEdit1.Text = '6003') then
      Begin
        dm.TabDemais.close;
        dm.TabDemais.sql.Clear;
        dm.TabDemais.sql.Add('select ufir_min, ufir_max from cad_tabdemais');
        dm.TabDemais.sql.add('order by data');
        dm.TabDemais.Open;
        dm.TabDemais.FindLast;
        ufir_min := (dm.TabDemais.FieldByName('ufir_min').AsCurrency * 100);
        ufir_max := (dm.TabDemais.FieldByName('ufir_max').AsCurrency * 100);
        If CurrencyEdit24.Value <= ufir_min then
          vr_calc_fim := dm.TabDemais.FieldByName('ufir_min').AsCurrency
        Else If CurrencyEdit24.Value >= ufir_max then
          vr_calc_fim := dm.TabDemais.FieldByName('ufir_max').AsCurrency
        Else
          vr_calc_fim := TruncaV(((CurrencyEdit24.Value * 1) / 100));
         If (MaskEdit1.Text = '6003') then
          vr_calc_fim := TruncaV(vr_calc_fim / 2);
        CurrencyEdit22.Value := vr_calc_fim;
      End;
    End;

    Aux_Calc.FindFirst;
    while not Aux_Calc.Eof do
    begin
      vr_tabnew := Aux_Calc.fieldbyname('valor_tab').AsCurrency;
      If (Aux_Calc.fieldbyname('codigo').AsString = '6001') AND
         (Aux_Calc.fieldbyname('tabela').AsString = '10')   AND
         (Aux_Calc.fieldbyname('item_tab').AsString = '1')  AND
         (Aux_Calc.fieldbyname('subitem').AsString = '1')   then
        vr_tabnew := CurrencyEdit22.Value;

      If (Aux_Calc.fieldbyname('codigo').AsString = '6003') AND
         (Aux_Calc.fieldbyname('tabela').AsString = '10')   AND
         (Aux_Calc.fieldbyname('item_tab').AsString = '3')  AND
         (Aux_Calc.fieldbyname('subitem').AsString = '1')   then
        vr_tabnew := CurrencyEdit22.Value;

      CalcAtos.Close;
      CalcAtos.Sql.Clear;
      CalcAtos.Sql.Add('INSERT INTO ' + Arq_Temp);
      CalcAtos.Sql.Add('(data, codigo, descricao, tabela, item_tab, subitem, descr_tab, valor_unit, qtde, valor_calc)');
      CalcAtos.Sql.Add(' VALUES(');
      CalcAtos.Sql.Add(QuotedStr(ConvData(Aux_Calc.fieldbyname('data').AsString)) + ', ');
      CalcAtos.Sql.Add(Trim(Aux_Calc.fieldbyname('codigo').AsString)              + ', ');
      CalcAtos.Sql.Add(QuotedStr(Aux_Calc.fieldbyname('descricao').AsString)      + ', ');
      CalcAtos.Sql.Add(QuotedStr(Aux_Calc.fieldbyname('tabela').AsString)         + ', ');
      CalcAtos.Sql.Add(QuotedStr(Aux_Calc.fieldbyname('item_tab').AsString)       + ', ');
      CalcAtos.Sql.Add(QuotedStr(Aux_Calc.fieldbyname('subitem').AsString)        + ', ');
      CalcAtos.Sql.Add(QuotedStr(Aux_Calc.fieldbyname('descr_tab').AsString)      + ', ');
      CalcAtos.Sql.Add(TrocaVirgulaporPonto(CurrToStr(vr_tabnew)) + ', ');
      CalcAtos.Sql.Add(QuotedStr(Aux_Calc.fieldbyname('vl_qtd').AsString) + ', ');
      CalcAtos.Sql.Add(TrocaVirgulaporPonto(CurrToStr(vr_tabnew)) + ')');
      CalcAtos.ExecSQL;
      Aux_Calc.Next;
    end;
    CalcAtos.Close;
    CalcAtos.Sql.Clear;
    CalcAtos.Sql.Add('SELECT * FROM ' + Arq_Temp + ' WHERE codigo = ' + MaskEdit1.Text);
    CalcAtos.Open;

    MaskEdit14.Text := '1';
    MaskEdit15.Text := '1';
    If (a_chk11) then
      MaskEdit8.Text  := '2'
    Else
      MaskEdit8.Text  := '1';
    F_NewCalcT.SpeedButton5Click(F_NewCalcT);
  end;
end;

procedure TF_NewCalcT.MaskEdit1Exit(Sender: TObject);
begin
  if (maskedit1.text <> '') or (maskedit1.text <> '0') then maskedit12.text := Ver_LAE(maskedit1.text);
end;

procedure TF_NewCalcT.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit12.SetFocus;
end;

procedure TF_NewCalcT.FormActivate(Sender: TObject);
begin
  Panel4.Visible := False;
  Panel5.Visible := False;
  calc_menu      := True;
  if Assigned (F_RecepR) then Panel4.Visible := False;
  if Assigned (F_RecepC) then Panel4.Visible := True;

  if Assigned (F_RecepR) then calc_menu      := False;
  if Assigned (F_RecepC) then calc_menu      := False;

  If calc_menu then
  begin
    Panel5.Visible := True;
    CurrencyEdit24.SetFocus;
  End
  Else MaskEdit1.SetFocus;


end;

procedure TF_NewCalcT.Incluir1Click(Sender: TObject);
begin
  Abre_CadTab;
  Panel2.Visible       := True;
  SpeedButton1.Enabled := False;
  SpeedButton5.Enabled := False;
  Label7.Caption       := 'incluir';
  DBGrid2.SetFocus;
end;

procedure TF_NewCalcT.Corrigir1Click(Sender: TObject);
var
  vr_old, vr_new : Currency;
  codc, tabc, itemc, subitemc : String;
  vritemc : Currency;
begin
  qtde     := InputBox('Altere o valor da quantidade do ato','Qtde.:','1');
  recno    := CalcAtos.FieldByname('recno').AsString;
  vr_old   := CalcAtos.FieldByname('valor_unit').AsCurrency;

  codc     := CalcAtos.FieldByname('codigo').AsString;
  tabc     := CalcAtos.FieldByname('tabela').AsString;
  itemc    := CalcAtos.FieldByname('item_tab').AsString;
  subitemc := CalcAtos.FieldByname('subitem').AsString;
  vritemc  := 0.00;

  if (MessageBox(Handle, PChar('Confirma Correção do ato ?'), 'CORREÇÃO', MB_YESNO + MB_ICONQUESTION) = IDYes) then
  begin
    If (NOT ValidNumero(qtde)) OR (qtde = '0') then qtde := '1';

    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('select * from tab_ato2 where codigo = ' + codc + ' AND tabela = ' + tabc);
    DM.ArqAux.Sql.Add('AND item_tab = ' + itemc);
    If Trim(subitemc) <> '' then
      DM.ArqAux.Sql.Add(' AND subitem = ' + subitemc);

    DM.ArqAux.Sql.Add(' AND year(data) = ' + QuotedStr(Copy(datnovo,7,4)));

    DM.ArqAux.Open;
    DM.ArqAux.FindLast;
    If DM.ArqAux.RecordCount <> 0 then vritemc := DM.ArqAux.FieldByname('valor_tab').AsCurrency;
    DM.ArqAux.Close;
    vr_old := vritemc;

    vr_new := (vr_old * StrToInt(qtde));

    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('update ' + Arq_Temp);
    DM.ArqAux.Sql.Add(' set qtde = ' + qtde);
    DM.ArqAux.Sql.Add(' , valor_unit  = ' + StringReplace(FloatToStr(vr_old), ',', '.', [rfReplaceAll]));
    DM.ArqAux.Sql.Add(' , valor_calc  = ' + StringReplace(FloatToStr(vr_new), ',', '.', [rfReplaceAll]));
    DM.ArqAux.Sql.Add(' where recno = ' + recno);
    Try
      DM.ArqAux.ExecSql;
    Except
      ShowMessage('Problemas para corrigir o ato !');
    End;
  End;

  CalcAtos.Close;
  CalcAtos.Sql.Clear;
  CalcAtos.Sql.Add('SELECT * FROM ' + Arq_Temp + ' WHERE codigo = ' + MaskEdit1.Text);
  CalcAtos.Open;
  F_NewCalcT.SpeedButton5Click(F_NewCalcT);

{ Abre_CadTab;
  Panel2.Visible       := True;
  SpeedButton1.Enabled := False;
  SpeedButton5.Enabled := False;
  Label7.Caption       := 'corrigir';
  DBGrid2.SetFocus;
  Carrega_TabAtos2;}
end;

procedure TF_NewCalcT.Panel2DblClick(Sender: TObject);
begin
  close;
end;

procedure TF_NewCalcT.DBGrid2DblClick(Sender: TObject);
begin
  Carrega_CadTab;
end;

procedure TF_NewCalcT.SpeedButton3Click(Sender: TObject);
begin
  if Label7.Caption = 'incluir' then
  begin
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('INSERT INTO ' + arq_temp + '(data, codigo, descricao, tabela, item_tab, subitem, descr_tab, valor_unit, qtde, valor_calc)');
    DM.ArqAux.Sql.Add(' VALUES(');
    DM.ArqAux.Sql.Add(QuotedStr(ConvData(MaskEdit1.Text)) + ', ');
    DM.ArqAux.Sql.Add(Trim(MaskEdit1.Text)       + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit12.Text) + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit2.Text)  + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit3.Text)  + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit4.Text)  + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit5.Text)  + ', ');
    DM.ArqAux.Sql.Add(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit11.Value)) + ', ');
    DM.ArqAux.Sql.Add(QuotedStr(MaskEdit6.Text)  + ', ');
    DM.ArqAux.Sql.Add(TrocaVirgulaporPonto(CurrToStr(CurrencyEdit14.Value)) + ')');
    DM.ArqAux.ExecSQL;

    ShowMessage('Item incluído !');
  end;

  if Label7.Caption = 'corrigir' then
  begin
    if messagedlg('Dados Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM.ArqAux.Active := False;
      DM.ArqAux.Sql.Clear;
      DM.ArqAux.Sql.Add('UPDATE ' + arq_temp + ' SET');
      DM.ArqAux.Sql.Add(' data = '       + QuotedStr(ConvData(MaskEdit1.Text))  + ',');
      DM.ArqAux.Sql.Add(' codigo = '     + QuotedStr(MaskEdit1.Text)  + ',');
      DM.ArqAux.Sql.Add(' descricao = '  + QuotedStr(MaskEdit12.Text) + ',');
      DM.ArqAux.Sql.Add(' tabela = '     + QuotedStr(MaskEdit2.Text)  + ',');
      DM.ArqAux.Sql.Add(' item_tab = '   + QuotedStr(MaskEdit3.Text)  + ',');
      DM.ArqAux.Sql.Add(' subitem = '    + QuotedStr(MaskEdit4.Text)  + ',');
      DM.ArqAux.Sql.Add(' descr_tab = '  + QuotedStr(MaskEdit5.Text)  + ',');
      DM.ArqAux.Sql.Add(' valor_unit = ' + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit11.Value)) + ',');
      DM.ArqAux.Sql.Add(' qtde = '       + QuotedStr(MaskEdit6.Text)  + ',');
      DM.ArqAux.Sql.Add(' valor_calc = ' + TrocaVirgulaporPonto(CurrToStr(CurrencyEdit14.Value)));
      DM.ArqAux.Sql.Add(' WHERE recno = '+ CalcAtos.fieldbyname('recno').AsString);
      Dm.ArqAux.ExecSQL;
    end
    else
    ShowMessage('Correção não realizada !');
  end;
  F_NewCalcT.SpeedButton4Click(F_NewCalcT);
end;

procedure TF_NewCalcT.DBGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Carrega_CadTab;
end;

procedure TF_NewCalcT.SpeedButton4Click(Sender: TObject);
begin
  CalcAtos.Close;
  CalcAtos.Sql.Clear;
  CalcAtos.Sql.Add('SELECT * FROM ' + arq_temp + ' WHERE codigo = ' + MaskEdit1.Text);
  CalcAtos.Open;

  Panel2.Visible       := False;
  SpeedButton1.Enabled := True;
  SpeedButton5.Enabled := True;
end;

procedure TF_NewCalcT.Excluir1Click(Sender: TObject);
var
  id : String;
begin
  if messagedlg('Deseja excluir este item ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    id := inttostr(CalcAtos.fieldbyname('recno').AsInteger);
    CalcAtos.delete;
    CalcAtos.close;
    CalcAtos.open;
    if id < '1' then CalcAtos.FindFirst else
    begin
      CalcAtos.FindFirst;
      if not CalcAtos.locate('recno', id, []) then CalcAtos.findlast;
    end;
  end;
  CalcAtos.Close;
  CalcAtos.Sql.Clear;
  CalcAtos.Sql.Add('SELECT * FROM ' + Arq_Temp + ' WHERE codigo = ' + MaskEdit1.Text);
  CalcAtos.Open;
end;

procedure TF_NewCalcT.SpeedButton5Click(Sender: TObject);
begin
  qtd_pg         := 0;
  v_qtd_pg       := 0;
  qtd_nom        := 0;
  v_qtd_nom      := 0;
  valorbase      := 0;

  VrTotG         := 0;
  VrSubTotal     := 0;
  VrTribunal     := 0;
  VrDefensoria   := 0;
  VrProcuradoria := 0;
  VrMutua        := 0;
  VrAcoterj      := 0;
  VrDistrib      := 0;

  qtd_pag_cert := 0;
  qtd_fol_cert := 0;
  VrTribCert   := 0;
  VrDefeCert   := 0;
  VrProcCert   := 0;
  vl_pag_cert  := 0;
  vl_fol_cert  := 0;
  VrPagCert    := 0;
  VrFolCert    := 0;

  VrTrib_nom  := 0;
  VrDefen_nom := 0;
  VrProcu_nom := 0;
  tot_nomexc  := 0;
  nome_dist   := 0;
  v_nome      := 0;

  VrEmolAdicional := 0;
  VrTotG          := 0;
  VrSubTotal      := 0;

  VrTrib_DIST  := 0.00;
  VrDefen_DIST := 0.00;
  VrProcu_DIST := 0.00;

  dt_tab := MaskEdit7.Text;

  //Calculo de Títulos
  if (Assigned (F_RecepR)) OR (calc_menu) then
  begin
    If NOT calc_menu then
      valorbase := F_RecepR.CurrencyEdit1.Value
    Else valorbase := 0.00;

{   DM.Tab_atoemol.Close;
    DM.Tab_atoemol.sql.Clear;
    DM.Tab_atoemol.sql.Add('SELECT * from tab_atoemol');
    DM.Tab_atoemol.sql.Add('where');
    DM.Tab_atoemol.sql.Add('data = ' + QuotedStr(ConvData(dt_tab)));
    DM.Tab_atoemol.open;
    if (DM.Tab_atoemol.RecordCount = 0) then
    begin
      DM.Tab_atoemol.Close;
      MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA CADASTRADA !'), 'CALCULO', MB_OK + MB_ICONSTOP);
      Exit;
    end;}

    DM.TabDemais.Close;
    DM.TabDemais.sql.Clear;
    DM.TabDemais.sql.Add('SELECT * from cad_tabdemais');
    DM.TabDemais.sql.Add('where');
    DM.TabDemais.sql.Add('data = ' + QuotedStr(ConvData(dt_tab)));
    DM.TabDemais.open;
    if (DM.TabDemais.RecordCount = 0) then
    begin
      DM.TabDemais.Close;
      MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR DEMAIS TABELAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
      Exit;
    end;

{   DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('UPDATE ' + Arq_Temp + ' SET valor_unit = 0.00, valor_calc = 0.00');
    DM.ArqAux.Sql.Add(' WHERE codigo = ' + MaskEdit1.Text + ' AND (tabela = 10 and item_tab = 1 and subitem = 1)');
    DM.ArqAux.ExecSQL;}

    DM.ArqAux2.Close;
    DM.ArqAux2.Sql.Clear;
    DM.ArqAux2.Sql.Add('SELECT SUM(valor_calc) as subtotal FROM ' + Arq_Temp + ' WHERE codigo = ' + MaskEdit1.Text);
    DM.ArqAux2.Open;

{   if (valorbase > 0) and (F_RecepR.MaskEdit4.Text <> '225')then
    begin
      //Valor adicional
      VrEmolAdicional := truncav((valorbase * dm.tabdemais.FieldByName('registro').ascurrency) / 100);
      if vrEmolAdicional < dm.tabdemais.FieldByName('ufir_max').ascurrency then vrEmolAdicional := truncav(dm.tabdemais.FieldByName('ufir_min').ascurrency);
      if vrEmolAdicional > dm.tabdemais.FieldByName('ufir_min').ascurrency then vrEmolAdicional := truncav(dm.tabdemais.FieldByName('ufir_max').ascurrency);
    end;

    if (MaskEdit1.Text = '6003') or (MaskEdit1.Text = '6004') then
    begin
      VrEmolAdicional := TruncaV(VrEmolAdicional / 2);
    end;

    CurrencyEdit13.Value := VrEmolAdicional;}

{   if (VrEmolAdicional <> 0) then
    begin
      DM.ArqAux.Close;
      DM.ArqAux.Sql.Clear;
      DM.ArqAux.Sql.Add('UPDATE ' + Arq_Temp + ' SET valor_unit = ' + TrocaVirgulaporPonto(CurrToStr(VrEmolAdicional)) + ', valor_calc = ' + TrocaVirgulaporPonto(CurrToStr(VrEmolAdicional)));
      DM.ArqAux.Sql.Add(' WHERE codigo = ' + MaskEdit1.Text + ' AND (tabela = 10 and item_tab = 1 and subitem = 1)');
      DM.ArqAux.ExecSQL;
    end;}

    if (MaskEdit9.Text <> '0') then
    begin
      //Qtde Paginas
      if StrToInt(MaskEdit9.Text) > StrToInt(DM.TabDemais.FieldByName('qtd_pag').AsString) then
      begin
        qtd_pg   := StrToInt(MaskEdit9.Text) - (StrToInt(DM.TabDemais.FieldByName('qtd_pag').AsString));
        v_qtd_pg := DM.TabDemais.fieldbyname('pag_ate').asCurrency + (qtd_pg * DM.TabDemais.fieldbyname('pag_exc').asCurrency);
      end
      else v_qtd_pg := DM.TabDemais.fieldbyname('pag_ate').asCurrency;
    end;
    CurrencyEdit9.Value := v_qtd_pg;
    qtd_pg := StrToInt(MaskEdit9.Text);

    VrSubTotal := (VrEmolAdicional +
                   DM.ArqAux2.fieldbyname('subtotal').AsCurrency);// +
//                   v_qtd_pg);

    VrTribunal     := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('tribunal').AsCurrency) / 100);
    VrDefensoria   := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
    VrProcuradoria := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);
    VrMutua        := (DM.TabDemais.FieldByName('mutua').AsCurrency   * StrToInt(MaskEdit14.Text));
    VrAcoterj      := (DM.TabDemais.FieldByName('acoterj').AsCurrency * StrToInt(MaskEdit15.Text));

    If (NOT v_chk_07) then { Calculo desmenbrado do Distribuidor + os Nomes Excedentes. }
    begin
      if (MaskEdit8.Text <> '0') then
      begin
        //Qtde Nomes
        if StrToInt(MaskEdit8.Text) > StrToInt(DM.TabDemais.FieldByName('qtd_nomes').AsString) then
        begin
          qtd_nom   := StrToInt(MaskEdit8.Text) - (StrToInt(DM.TabDemais.FieldByName('qtd_nomes').AsString));
          v_qtd_nom := DM.TabDemais.fieldbyname('nomes_ate').asCurrency + (qtd_nom * DM.TabDemais.fieldbyname('nomes').asCurrency);
          VrNomeExc := v_qtd_nom;
        end
        else VrNomeExc := DM.TabDemais.fieldbyname('nomes_ate').asCurrency;
        //Tribunal
        VrTrib_nom  := ((VrNomeExc * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
  //    VrTrib_nom  := TruncaV((VrNomeExc * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
        //Defensoria
        VrDefen_nom := TruncaV((VrNomeExc * dm.tabdemais.FieldByName('defensoria').ascurrency) / 100);
        //Procuradoria
        VrProcu_nom := TruncaV((VrNomeExc * dm.tabdemais.FieldByName('procuradoria').ascurrency) / 100);
        tot_nomexc :=  VrNomeExc + VrTrib_nom + VrDefen_nom + VrProcu_nom;
        tot_nomexc :=  VrNomeExc; // + VrTrib_nom + VrDefen_nom + VrProcu_nom;
        CurrencyEdit8.Value := tot_nomexc;
        qtd_nom := StrToInt(MaskEdit8.Text);
      end;
      VrDistrib      := DM.TabDemais.FieldByName('distribuicao').AsCurrency;
      VrTrib_DIST    := TruncaV((VrDistrib * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
      VrDefen_DIST   := TruncaV((VrDistrib * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
      VrProcu_DIST   := TruncaV((VrDistrib * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);
    End
    Else
    Begin
      if (MaskEdit8.Text <> '0') then
      begin
        //Qtde Nomes
        if StrToInt(MaskEdit8.Text) > StrToInt(DM.TabDemais.FieldByName('qtd_nomes').AsString) then
        begin
          qtd_nom   := StrToInt(MaskEdit8.Text) - (StrToInt(DM.TabDemais.FieldByName('qtd_nomes').AsString));
          v_qtd_nom := DM.TabDemais.fieldbyname('nomes_ate').asCurrency + (qtd_nom * DM.TabDemais.fieldbyname('nomes').asCurrency);
          VrNomeExc := v_qtd_nom;
        end
        else VrNomeExc := DM.TabDemais.fieldbyname('nomes_ate').asCurrency;
        //Tribunal
{       VrTrib_nom  := ((VrNomeExc * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
        //Defensoria
        VrDefen_nom := TruncaV((VrNomeExc * dm.tabdemais.FieldByName('defensoria').ascurrency) / 100);
        //Procuradoria
        VrProcu_nom := TruncaV((VrNomeExc * dm.tabdemais.FieldByName('procuradoria').ascurrency) / 100);}
        tot_nomexc :=  VrNomeExc; // + VrTrib_nom + VrDefen_nom + VrProcu_nom;
        tot_nomexc :=  VrNomeExc; // + VrTrib_nom + VrDefen_nom + VrProcu_nom;
        CurrencyEdit8.Value := tot_nomexc;
        qtd_nom := StrToInt(MaskEdit8.Text);
      end;

      VrDistrib      := DM.TabDemais.FieldByName('distribuicao').AsCurrency;
      VrDistribNew   := DM.TabDemais.FieldByName('distribuicao').AsCurrency + VrNomeExc;
      VrTrib_DIST    := TruncaV((VrDistribNew * dm.tabdemais.FieldByName('tribunal').ascurrency) / 100);
      VrDefen_DIST   := TruncaV((VrDistribNew * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
      VrProcu_DIST   := TruncaV((VrDistribNew * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);
    End;

    VrTotG := VrSubTotal + VrTribunal + VrDefensoria + VrProcuradoria + VrMutua + VrAcoterj + VrDistrib + tot_nomexc +
              VrTrib_DIST + VrDefen_DIST + VrProcu_DIST +
              VrTrib_nom + VrDefen_nom + VrProcu_nom;

    CurrencyEdit2.Value  := VrTribunal;
    CurrencyEdit3.Value  := VrDefensoria;
    CurrencyEdit4.Value  := VrProcuradoria;
    CurrencyEdit5.Value  := VrMutua;
    CurrencyEdit6.Value  := VrAcoterj;
    CurrencyEdit1.Value  := VrSubTotal;
    CurrencyEdit12.Value := VrDistrib;
    CurrencyEdit23.Value := VrTrib_DIST + VrDefen_DIST + VrProcu_DIST + VrTrib_nom + VrDefen_nom + VrProcu_nom;

    CurrencyEdit7.Value  := VrTotG;
  end;

  // Calculo de Certidões
  if Assigned (F_RecepC) then
  begin
   {DM.Tab_atoemol.Close;
    DM.Tab_atoemol.sql.Clear;
    DM.Tab_atoemol.sql.Add('SELECT * from tab_atoemol');
    DM.Tab_atoemol.sql.Add('where');
    DM.Tab_atoemol.sql.Add('data = ' + QuotedStr(ConvData(dt_tab)));
    DM.Tab_atoemol.open;
    if (DM.Tab_atoemol.RecordCount = 0) then
    begin
      DM.Tab_atoemol.Close;
      MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR TABELA CADASTRADA !'), 'CALCULO', MB_OK + MB_ICONSTOP);
      Exit;
    end;}

    DM.TabDemais.Close;
    DM.TabDemais.sql.Clear;
    DM.TabDemais.sql.Add('SELECT * from cad_tabdemais');
    DM.TabDemais.sql.Add('where');
    DM.TabDemais.sql.Add('data = ' + QuotedStr(ConvData(dt_tab)));
    DM.TabDemais.open;
    if (DM.TabDemais.RecordCount = 0) then
    begin
      DM.TabDemais.Close;
      MessageBox(0, PChar('PROBLEMAS PARA LOCALIZAR DEMAIS TABELAS !'), 'CALCULO GERAL', MB_OK + MB_ICONSTOP);
      Exit;
    end;

    DM.ArqAux2.Close;
    DM.ArqAux2.Sql.Clear;
    DM.ArqAux2.Sql.Add('SELECT SUM(valor_calc) as subtotal FROM ' + Arq_Temp + ' WHERE codigo = ' + MaskEdit1.Text);
    DM.ArqAux2.Open;

    VrSubTotal := DM.ArqAux2.fieldbyname('subtotal').AsCurrency;

    VrTribunal     := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('tribunal').AsCurrency) / 100);
    VrDefensoria   := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
    VrProcuradoria := TruncaV((VrSubTotal * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);

    if (MaskEdit13.Text <> '0') then
    begin
      VrTribCert  := 0;
      VrDefeCert  := 0;
      VrProcCert  := 0;

      vl_pag_cert := (StrToInt(MaskEdit13.Text) * DM.TabDemais.fieldbyname('vl_pag_cert').AsCurrency);

      VrTribCert := TruncaV((vl_pag_cert * DM.TabDemais.FieldByName('tribunal').AsCurrency) / 100);
      VrDefeCert := TruncaV((vl_pag_cert * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
      VrProcCert := TruncaV((vl_pag_cert * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);

      VrPagCert    := vl_pag_cert + VrTribCert + VrDefeCert + VrProcCert;
      qtd_pag_cert := StrToInt(MaskEdit13.Text);
    end;

    if (MaskEdit11.Text <> '0') then
    begin
      VrTribCert  := 0;
      VrDefeCert  := 0;
      VrProcCert  := 0;

      vl_fol_cert := (StrToInt(MaskEdit11.Text) * DM.TabDemais.fieldbyname('vl_fol_cert').AsCurrency);

      VrTribCert := TruncaV((vl_fol_cert * DM.TabDemais.FieldByName('tribunal').AsCurrency) / 100);
      VrDefeCert := TruncaV((vl_fol_cert * DM.TabDemais.FieldByName('defensoria').AsCurrency) / 100);
      VrProcCert := TruncaV((vl_fol_cert * DM.TabDemais.FieldByName('procuradoria').AsCurrency) / 100);

      VrFolCert    := vl_pag_cert + VrTribCert + VrDefeCert + VrProcCert;
      qtd_fol_cert := StrToInt(MaskEdit11.Text);
    end;

    VrTotG := VrSubTotal + VrTribunal + VrDefensoria + VrProcuradoria + VrPagCert + VrFolCert;


    CurrencyEdit21.Value  := VrPagCert;
    CurrencyEdit20.Value  := VrFolCert;
    CurrencyEdit18.Value  := VrTribunal;
    CurrencyEdit17.Value  := VrDefensoria;
    CurrencyEdit16.Value  := VrProcuradoria;
    CurrencyEdit19.Value  := VrSubTotal;
    CurrencyEdit15.Value  := VrTotG;
  end;
end;

procedure TF_NewCalcT.MaskEdit6Exit(Sender: TObject);
var
  Multip : Currency;
begin
  Multip := 0;
  Multip := (StrToInt(MaskEdit6.Text) * CurrencyEdit11.Value);
  CurrencyEdit14.Value := Multip;
end;

procedure TF_NewCalcT.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit11.SetFocus;
end;

procedure TF_NewCalcT.MaskEdit8Exit(Sender: TObject);
begin
  if MaskEdit8.Text = '0' then CurrencyEdit8.Value := 0.00;
end;

procedure TF_NewCalcT.MaskEdit9Exit(Sender: TObject);
begin
  if NOT ValidNumero(MaskEdit9.Text) then MaskEdit9.Text := '0';
end;

procedure TF_NewCalcT.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_NewCalcT.SpeedButton5Click(F_NewCalcT);
//MaskEdit9.SetFocus;
end;

procedure TF_NewCalcT.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qtd_pag1, qtd_pag2, qtd_pag3 : Integer;
  vr_item, vr_itemoriginal, vr_item20 : Currency;
begin
  if key = 13 then
  Begin
    qtd_pag1 := 0;
    qtd_pag2 := 0;
    qtd_pag3 := 0;
    vr_item  := 0.00;
    vr_itemoriginal := 0.00;

    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('delete from ' + arq_temp);
    DM.ArqAux.Sql.Add('where tabela = 10 AND item_tab = 2 AND subitem = 2');
    DM.ArqAux.ExecSql;

    dm.TabDemais.close;
    dm.TabDemais.sql.Clear;
    dm.TabDemais.sql.Add('select qtd_pag from cad_tabdemais');
    dm.TabDemais.sql.add('order by data');
    dm.TabDemais.Open;
    dm.TabDemais.FindLast;
    qtd_pag1 := dm.TabDemais.FieldByname('qtd_pag').ASInteger;
    dm.TabDemais.Close;

    If (MaskEdit1.Text = '6002') OR (MaskEdit1.Text = '6014') then
      qtd_pag1 := 1;

    If (MaskEdit1.Text = '6007') then
      qtd_pag1 := 2;

    qtd_pag2 := StrToInt(MaskEdit9.Text);
    If qtd_pag2 > qtd_pag1 then
      qtd_pag3 := (qtd_pag2 - qtd_pag1);

  //If MaskEdit1.Text = '6002' then qtd_pag3 := qtd_pag2;

    If qtd_pag3 > 0 then
    Begin
      Dm.Cad_Tab2.RequestLive := False;
      Dm.Cad_Tab2.Close;
      Dm.Cad_Tab2.Sql.Clear;
      Dm.Cad_Tab2.Sql.Add('SELECT * FROM cad_tab where tabela = 10 AND item = 2 AND subitem = 2 AND year(data) = ' + QuotedStr(Copy(datnovo,7,4)));
      Dm.Cad_Tab2.Open;
      Dm.Cad_Tab2.FindFirst;
      Dm.Cad_Tab2.RequestLive := True;
      If Dm.Cad_Tab2.RecordCount <> 0 then
      Begin
        If (MaskEdit1.Text = '6003') then
        Begin
          vr_item         := (Dm.Cad_Tab2.FieldByname('valor').AsCurrency/2) * qtd_pag3;
          vr_itemoriginal := (Dm.Cad_Tab2.FieldByname('valor').AsCurrency/2);
        End
        Else If (MaskEdit1.Text = '6007') then
        Begin
          vr_item20       := TruncaV((Dm.Cad_Tab2.FieldByname('valor').AsCurrency * 20) /100);
          vr_item         := (Dm.Cad_Tab2.FieldByname('valor').AsCurrency+vr_item20) * qtd_pag3;
          vr_itemoriginal := (Dm.Cad_Tab2.FieldByname('valor').AsCurrency+vr_item20);
        End
        Else
        Begin
          vr_item         := Dm.Cad_Tab2.FieldByname('valor').AsCurrency * qtd_pag3;
          vr_itemoriginal := Dm.Cad_Tab2.FieldByname('valor').AsCurrency;
        End;
        DM.ArqAux.Close;
        DM.ArqAux.Sql.Clear;
        DM.ArqAux.Sql.Add('INSERT INTO ' + arq_temp + '(data, codigo, descricao, tabela, item_tab, subitem, descr_tab, valor_unit, qtde, valor_calc)');
        DM.ArqAux.Sql.Add(' VALUES(');
        DM.ArqAux.Sql.Add(QuotedStr(ConvData(Dm.Cad_Tab2.FieldByname('data').AsString)) + ', ');
        DM.ArqAux.Sql.Add(Trim(MaskEdit1.Text)       + ', ');
        DM.ArqAux.Sql.Add(QuotedStr(Dm.Cad_Tab2.FieldByname('descricao').AsString) + ', ');
        DM.ArqAux.Sql.Add(QuotedStr(Dm.Cad_Tab2.FieldByname('tabela').AsString)  + ', ');
        DM.ArqAux.Sql.Add(QuotedStr(Dm.Cad_Tab2.FieldByname('item').AsString)  + ', ');
        DM.ArqAux.Sql.Add(QuotedStr(Dm.Cad_Tab2.FieldByname('subitem').AsString)  + ', ');
        DM.ArqAux.Sql.Add(QuotedStr(Dm.Cad_Tab2.FieldByname('descricao').AsString)  + ', ');
        DM.ArqAux.Sql.Add(TrocaVirgulaporPonto(CurrToStr(vr_itemoriginal)) + ', ');
        DM.ArqAux.Sql.Add(QuotedStr(IntToStr(qtd_pag3))  + ', ');
        DM.ArqAux.Sql.Add(TrocaVirgulaporPonto(CurrToStr(vr_item)) + ')');
        Try
          DM.ArqAux.ExecSQL;
        Except
          ShowMessage('Problemas para adicionar Paginas.');
        End;
      End;
    End;
    CalcAtos.Close;
    CalcAtos.Sql.Clear;
    CalcAtos.Sql.Add('SELECT * FROM ' + Arq_Temp + ' WHERE codigo = ' + MaskEdit1.Text);
    CalcAtos.Open;
    F_NewCalcT.SpeedButton5Click(F_NewCalcT);
  End;
end;

procedure TF_NewCalcT.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then CurrencyEdit13.SetFocus;
end;

procedure TF_NewCalcT.CurrencyEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_NewCalcT.SpeedButton5Click(F_NewCalcT);
end;

procedure TF_NewCalcT.SpeedButton2Click(Sender: TObject);
begin
  Panel3.Visible := True;
  DBGrid3.SetFocus;
end;

procedure TF_NewCalcT.DBGrid3DblClick(Sender: TObject);
begin
  MaskEdit1.Text := DM.Tab_atos.fieldbyname('cd_ato').AsString;
  MaskEdit12.Text := DM.Tab_atos.fieldbyname('descricao').AsString;
  MaskEdit12.SetFocus;
  Panel3.Visible := False;
end;

procedure TF_NewCalcT.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Panel3.Visible := False;

  if key = 13 then
  begin
    MaskEdit1.Text := DM.Tab_atos.fieldbyname('cd_ato').AsString;
    MaskEdit12.Text := DM.Tab_atos.fieldbyname('descricao').AsString;
    MaskEdit12.SetFocus;
    Panel3.Visible := False;
  end;
end;

procedure TF_NewCalcT.DBGrid1DblClick(Sender: TObject);
begin
  Corrigir1.OnClick(Self);
end;

procedure TF_NewCalcT.MaskEdit14Exit(Sender: TObject);
begin
  If NOT ValidNumero(MaskEdit14.Text) then MaskEdit14.Text := '1';
end;

procedure TF_NewCalcT.MaskEdit15Exit(Sender: TObject);
begin
  If NOT ValidNumero(MaskEdit15.Text) then MaskEdit15.Text := '1';
end;

procedure TF_NewCalcT.FormCreate(Sender: TObject);
begin
  datnovo := DateToStr(date);
end;

procedure TF_NewCalcT.CurrencyEdit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then
  Begin
    If Currencyedit24.Value > 0 then MaskEdit1.Text := '6001'
    Else MaskEdit1.Text := '6002';
    Panel5.Visible := False;
    MaskEdit1.SetFocus;
  End;
end;

end.
