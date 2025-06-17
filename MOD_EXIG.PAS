unit Mod_Exig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, WPTbar, WPDefs, WPPanel, WPPrint,
  WpWinCtr, WPRich, Db, FileCtrl, DBCtrls, WPRuler, Grids, DBGrids,
  jpeg;

type
  TF_ModExig = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    WPRuler1: TWPRuler;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    WPToolBar1: TWPToolBar;
    WPVertRuler1: TWPVertRuler;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    WPRichText1: TWPRichText;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ListBox2: TListBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    Procedure Gravar(Sender : TOBject; Modo : Integer);
    Procedure Atualizar(Sender : TOBject; Clique : Boolean);
    Procedure Carregar(Sender : TOBject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ListBox2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ModExig: TF_ModExig;
  desant   : String;

implementation

uses DMTD, Menu, PModExig, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_ModExig.Gravar(Sender : TOBject; Modo : Integer);
begin
  if (Trim(MaskEdit2.Text) = '') then
  begin
    MessageBox(Handle, PChar('ATENÇÃO - COLOQUE TÍTULO NO MODELO DE EXIGÊNCIA !'), 'INCLUSÃO', MB_OK + MB_ICONWARNING);
    MaskEdit2.SetFocus;
    Exit;
  end;
  if (Modo = 0) then
  begin
    Dm.Mod_Exig.Close;
    Dm.Mod_Exig.Sql.Clear;
    Dm.Mod_Exig.Sql.Add('SELECT * FROM mod_exig');
    Dm.Mod_Exig.Sql.Add('WHERE');
    Dm.Mod_Exig.Sql.Add('descricao = ' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39));
    Dm.Mod_Exig.Open;
    if (Dm.Mod_Exig.RecordCount <> 0) then
    begin
      MessageBox(Handle, PChar('ATENÇÃO - MODELO DE EXIGÊNCIA NÃO ENCONTRADO !'), 'INCLUSÃO', MB_OK + MB_ICONWARNING);
      Carregar(F_ModExig);
      Exit;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Inclusa a mod_exig ' + Trim(MaskEdit2.Text), '0');
    Dm.Mod_Exig.Append;
  end
  else
    Dm.Mod_Exig.Edit;
  Dm.Mod_Exig.FieldByName('cod').asInteger      := StrToInt(MaskEdit1.Text);
  Dm.Mod_Exig.FieldByName('descricao').asString := Trim(MaskEdit2.Text);
  Dm.Mod_Exig.FieldByName('tipo').asString := Trim(ComboBox1.Text);

  Dm.Mod_Exig.Post;
  WpRichText1.SaveToFile(F_Menu.Label16.Caption + StrZero(MaskEdit1.Text, 7) + '.RTF');
  if (modo = 0) then Atualizar(F_ModExig, False);
end;

Procedure TF_ModExig.Atualizar(Sender : TObject; Clique : Boolean);
begin
  Dm.Mod_Exig.Close;
  Dm.Mod_Exig.Sql.Clear;
  Dm.Mod_Exig.Sql.Add('SELECT * FROM mod_exig');
  Dm.Mod_Exig.Sql.Add('ORDER BY cod DESC');
  Dm.Mod_Exig.Open;
  if (Clique) then DbGrid1.ShowHint := False;  
  Carregar(F_ModExig);
end;

Procedure TF_ModExig.Carregar(Sender : TObject);
begin
  MaskEdit1.Text := Dm.Mod_Exig.FieldByName('cod').asString;
  MaskEdit2.Text := Dm.Mod_Exig.FieldByName('descricao').asString;
  ComboBox1.Text := Dm.Mod_Exig.FieldByName('tipo').asString;
  
  if (not ValidNumero(MaskEdit1.Text)) then
  begin
    WpRichText1.Clear;
    WpRichText1.LoadFromFile(F_Menu.Label16.Caption + 'Branco.RTF');
  end
  else
  begin
    WpRichText1.Clear;
    WpRichText1.LoadFromFile(F_Menu.Label16.Caption + StrZero(MaskEdit1.Text, 7) + '.RTF');
  end;
  WpRichText1.Refresh;
end;

procedure TF_ModExig.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption = '&Incluir' then
  begin
    BitBtn1.Caption      := '&Salvar';
    BitBtn2.Enabled      := False;
    BitBtn3.Enabled      := False;
    BitBtn4.Enabled      := False;
    BitBtn5.Enabled      := False;
    BitBtn6.Enabled      := False;
    BitBtn7.Enabled      := False;
    BitBtn8.Enabled      := False;
    Panel2.Enabled       := True;
    WpRichText1.ReadOnly := False;
    WpRichText1.Lines.Clear;
    MaskEdit1.Text  := Busca_Codigo('mod_exig', 'cod');
    MaskEdit2.SetFocus; 
  end
  else
  begin
    if BitBtn1.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma inclusão de dados ?'), 'INCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_ModExig, 0);
      end
      else
      begin
        MessageBox(Handle, PChar('Os dados não foram incluídos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da inclusão do modelo de exigência ' + Trim(MaskEdit2.Text), '0');        
        Atualizar(F_ModExig, False);        
      end;
      Panel2.enabled       := False;
      WpRichText1.ReadOnly := True;      
      BitBtn1.Caption      := '&Incluir';
      BitBtn2.Enabled      := True;
      BitBtn3.Enabled      := True;
      BitBtn4.Enabled      := True;
      BitBtn5.Enabled      := True;
      BitBtn6.Enabled      := True;
      BitBtn7.Enabled      := True;
      BitBtn8.Enabled      := True;
      BitBtn1.SetFocus;
    end;
  end; 
end;

procedure TF_ModExig.BitBtn6Click(Sender: TObject);
begin
  Dm.Mod_Exig.Prior;
  Carregar(F_ModExig);
end;

procedure TF_ModExig.FormActivate(Sender: TObject);
begin
  Atualizar(F_ModExig, False);
  BitBtn1.SetFocus;
end;

procedure TF_ModExig.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PModExig, F_PModExig);
  F_PModExig.ShowModal;
  F_PModExig.Destroy;
  F_PModExig := NIL;
  if (Dm.Mod_Exig.Active) then
  begin
    DbGrid1.ShowHint := True;
    Carregar(F_ModExig);
  end
  else Atualizar(F_ModExig, False);
end;

procedure TF_ModExig.BitBtn7Click(Sender: TObject);
begin
  WpRichText1.PrintDialog;
end;

procedure TF_ModExig.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir este modelo de exigência ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão do modelo da exigência ' + Trim(MaskEdit2.Text), '0');
    Dm.Mod_Exig.Delete;
    Carregar(F_ModExig);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);  
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão do modelo de exigência ' + Trim(MaskEdit2.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_ModExig.BitBtn5Click(Sender: TObject);
begin
  Dm.Mod_Exig.Next;
  Carregar(F_ModExig);
end;

procedure TF_ModExig.BitBtn3Click(Sender: TObject);
begin
  if BitBtn3.Caption = '&Correção' then
  begin
    BitBtn3.Caption := '&Salvar';
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := false;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    Panel2.enabled := true;
    desant := '';
    desant := MaskEdit2.Text;
    WpRichText1.ReadOnly := False;       
    MaskEdit2.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma correção dos dados ?'), 'CORREÇÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_ModExig, 1);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Alterado o modelo de exigência de ' + desant + ' para ' + Trim(MaskEdit2.Text), '0');
      end
      else
      begin
        MessageBox(Handle, PChar('Dados não alterados'), 'DESISTÊNCIA DA CORREÇÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da alteração do modelo de exigência ' + desant + ' para ' + Trim(MaskEdit2.Text), '0');
        Atualizar(F_ModExig, False);
      end;
      Panel2.enabled  := False;
      BitBtn3.Caption := '&Correção';
      BitBtn1.Enabled := True;
      BitBtn2.Enabled := True;
      BitBtn4.Enabled := True;
      BitBtn5.Enabled := True;
      BitBtn6.Enabled := True;
      BitBtn7.Enabled := True;
      BitBtn8.Enabled := True;
      BitBtn3.SetFocus;
    end;
  end;
end;

procedure TF_ModExig.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ModExig.FormDestroy(Sender: TObject);
begin
  Dm.Mod_Exig.Close;
end;

procedure TF_ModExig.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then WpRichText1.SetFocus;
end;

procedure TF_ModExig.DBGrid1DblClick(Sender: TObject);
begin
  if (DbGrid1.ShowHint) then Atualizar(F_ModExig, True); 
end;

procedure TF_ModExig.ListBox2DblClick(Sender: TObject);
begin
  WPRichText1.InputString(ListBox2.Items[ListBox2.itemindex]);
  WPRichText1.SetFocus;
end;

end.

