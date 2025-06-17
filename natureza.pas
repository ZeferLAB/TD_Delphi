unit natureza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Db, Grids, DBGrids, Printers,
  DBCtrls, jpeg;

type
  TF_Natureza = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    ComboBox2: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox3: TComboBox;
    ControlBar1: TControlBar;
    Label36: TLabel;
    ComboBox4: TComboBox;
    Label7: TLabel;
    procedure BitBtn8Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormOnKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Gravar(Sender : TOBject; Modo : Integer);
    Procedure Atualizar(Sender : TOBject; Clique : Boolean);
    Procedure Carregar(Sender : TOBject);    
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3Exit(Sender: TObject);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Natureza: TF_Natureza;
  natant    : String;

implementation

uses PesqNat, DMTD, Menu, QkNat, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Natureza.Gravar(Sender : TOBject; Modo : Integer);
begin
  if (Modo = 0) then
  begin
    Dm.Natureza.Close;
    Dm.Natureza.Sql.Clear;
    Dm.Natureza.Sql.Add('SELECT * FROM natureza');
    Dm.Natureza.Sql.Add('WHERE');
    Dm.Natureza.Sql.Add('natureza = ' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39));
    Dm.Natureza.Open;
    if (Dm.Natureza.RecordCount <> 0) then
    begin
      MessageBox(Handle, PChar('ATEN��O - NATUREZA ENCONTRADA !'), 'INCLUS�O', MB_OK + MB_ICONWARNING);
      Carregar(F_Natureza);
      Exit;
    end;
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Inclusa a natureza ' + Trim(MaskEdit2.Text), '0');
    Dm.Natureza.Append;
  end
  else Dm.Natureza.Edit;
  Dm.Natureza.FieldByName('cod').asInteger       := StrToInt(MaskEdit1.Text);
  Dm.Natureza.FieldByName('natureza').asString   := Trim(MaskEdit2.Text);
  Dm.Natureza.FieldByName('prazo').asInteger     := StrToInt(ComboBox1.Text);
  Dm.Natureza.FieldByName('uteis').asString      := Trim(ComboBox2.Text);
  Dm.Natureza.FieldByName('cod_local').asInteger := StrToInt(ComboBox3.Text);

  If (ComboBox4.Text = '') then
    Dm.Natureza.FieldByName('cod_transacao_doi').AsString := ''
  Else
  Dm.Natureza.FieldByName('cod_transacao_doi').AsString := Copy(ComboBox4.Text,1,2);


  if (Dm.Natureza.FieldByName('cod_local').asInteger > 0) then
  begin
    Dm.Natureza.FieldByName('tipo').asString       := 'N';
  end
  else Dm.Natureza.FieldByName('tipo').asString       := 'T';  
  Dm.Natureza.Post;
  if (modo = 0) then Atualizar(F_Natureza, False);
end;

Procedure TF_Natureza.Atualizar(Sender : TObject; Clique : Boolean);
begin
  Dm.Natureza.Close;
  Dm.Natureza.Sql.Clear;
  Dm.Natureza.Sql.Add('SELECT * FROM natureza');
  Dm.Natureza.Sql.Add('ORDER BY natureza');
  Dm.Natureza.Open;
  if (Clique) then DbGrid1.ShowHint := False;  
  Carregar(F_Natureza);
end;

Procedure TF_Natureza.Carregar(Sender : TObject);
begin
  MaskEdit1.Text := Dm.Natureza.FieldByName('cod').asString;
  MaskEdit2.Text := Dm.Natureza.FieldByName('natureza').asString;
  ComboBox1.Text := Dm.Natureza.FieldByName('prazo').asString;
  ComboBox2.Text := Dm.Natureza.FieldByName('uteis').asString;
  ComboBox3.Text := StrZero(Dm.Natureza.FieldByName('cod_local').asString, 2);

    Case (dm.Natureza.FieldByName('cod_transacao_doi').AsInteger) Of
      0  : ComboBox4.Text := '';
      15 : ComboBox4.Text := '15 - Adjudica��o';
      41 : ComboBox4.Text := '41 - Arremata��o em Hasta P�blica';
      37 : ComboBox4.Text := '37 - Cess�o de Direitos';
      11 : ComboBox4.Text := '11 - Compra e Venda';
      19 : ComboBox4.Text := '19 - Da��o em Pagamento';
      25 : ComboBox4.Text := '25 - Desapropria��o';
      43 : ComboBox4.Text := '43 - Dissolu��o de Sociedade';
      21 : ComboBox4.Text := '21 - Distrato de Neg�cio';
      53 : ComboBox4.Text := '53 - Doa��o';
      55 : ComboBox4.Text := '55 - Doa��o em adiantamento da leg�tima';
      27 : ComboBox4.Text := '27 - Heran�a, Legado ou Mea��o (adjudica��o)';
      45 : ComboBox4.Text := '45 - Incorpora��o e loteamento';
      47 : ComboBox4.Text := '47 - Integraliza��o/Subscri��o de capital';
      49 : ComboBox4.Text := '49 - Partilha amig�vel ou litigiosa';
      13 : ComboBox4.Text := '13 - Permuta';
      31 : ComboBox4.Text := '31 - Procura��o em Causa Pr�pria';
      35 : ComboBox4.Text := '35 - Promessa de Cess�o de Direitos';
      33 : ComboBox4.Text := '33 - Promessa de Compra e Venda';
      51 : ComboBox4.Text := '51 - Retorno de Capital pr�prio';
      39 : ComboBox4.Text := '39 - Outros';
    End;

end;

procedure TF_Natureza.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Natureza.FormActivate(Sender: TObject);
begin
  Atualizar(F_Natureza, False);
  BitBtn1.SetFocus;
end;

procedure TF_Natureza.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption = '&Incluir' then
  begin
    BitBtn1.Caption := '&Salvar';
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    Panel2.Enabled  := True;
    MaskEdit1.Text  := Busca_Codigo('natureza', 'cod');
    ComboBox1.SetFocus; 
  end
  else
  begin
    if BitBtn1.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Inclus�o de Dados ?'), 'INCLUS�O', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_Natureza, 0);
      end
      else
      begin
        MessageBox(Handle, PChar('Os dados n�o foram inclu�dos'), 'DESIST�NCIA DA INCLUS�O', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desist�ncia da inclus�o da natureza ' + Trim(MaskEdit2.Text), '0');        
        Atualizar(F_Natureza, False);        
      end;
      Panel2.enabled := false;
      BitBtn1.Caption := '&Incluir';
      BitBtn2.Enabled := true;
      BitBtn3.Enabled := true;
      BitBtn4.Enabled := true;
      BitBtn5.Enabled := true;
      BitBtn6.Enabled := true;
      BitBtn7.Enabled := true;
      BitBtn8.Enabled := true;
      BitBtn1.SetFocus;
    end;
  end;  
end;

procedure TF_Natureza.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir os dados ?'), 'EXCLUS�O', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclus�o da natureza ' + Trim(MaskEdit2.Text), '0');
    Dm.Natureza.Delete;
    Carregar(F_Natureza);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados n�o foram exclu�dos'), 'DESIST�NCIA DA EXCLUS�O', MB_OK + MB_ICONWARNING);  
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desist�ncia da exclus�o da natureza ' + Trim(MaskEdit2.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_Natureza.BitBtn3Click(Sender: TObject);
begin
  if BitBtn3.Caption = '&Corre��o' then
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
    natant := '';
    natant := MaskEdit2.Text;   
    ComboBox1.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Corre��o dos Dados ?'), 'CORRE��O', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_Natureza, 1);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Alterada a natureza de ' + natant + ' para ' + Trim(MaskEdit2.Text), '0');
      end
      else
      begin
        MessageBox(Handle, PChar('Dados n�o alterados'), 'DESIST�NCIA DA CORRE��O', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desist�ncia da altera��o da natureza ' + natant + ' para ' + Trim(MaskEdit2.Text), '0');
        Atualizar(F_Natureza, False);
      end;
      Panel2.enabled  := False;
      BitBtn3.Caption := '&Corre��o';
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

procedure TF_Natureza.BitBtn5Click(Sender: TObject);
begin
  Dm.Natureza.Next;
  Carregar(F_Natureza);
end;

procedure TF_Natureza.BitBtn6Click(Sender: TObject);
begin
  Dm.Natureza.Prior;
  Carregar(F_Natureza);
end;

procedure TF_Natureza.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PesqNat, F_PesqNat);
  F_PesqNat.ShowModal;
  F_PesqNat.Destroy;
  F_PesqNat := NIL;
  if (Dm.Natureza.Active) then
  begin
    DbGrid1.ShowHint := True;
    Carregar(F_Natureza);
  end
  else Atualizar(F_Natureza, False);
end;

procedure TF_Natureza.FormOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [SSALT]) or (key = Vk_F4) then key:= Vk_Clear;
end;

procedure TF_Natureza.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then Combobox4.SetFocus;
end;

procedure TF_Natureza.BitBtn7Click(Sender: TObject);
begin
  Dm.Natureza.FindFirst;
  Application.CreateForm(TQk_Nat, Qk_Nat);
  Qk_Nat.QrLabel1.Caption := F_Menu.Label9.Caption;
  Qk_Nat.QrLabel2.Caption := F_Menu.Label11.Caption; 
  Qk_Nat.QrLabel3.Caption := F_Menu.Label5.Caption;
  Qk_Nat.QrLabel4.Caption := F_Menu.Label13.Caption;
  Qk_Nat.QrLabel5.Caption := 'RELAT�RIO DAS NATUREZAS';
  Qk_Nat.QuickRep1.Preview;
  Qk_Nat.Destroy;
  Qk_Nat := NIL;
end;

procedure TF_Natureza.FormDestroy(Sender: TObject);
begin
  Dm.Natureza.Close;
end;

procedure TF_Natureza.DBGrid1DblClick(Sender: TObject);
begin
  if (DbGrid1.ShowHint) then Atualizar(F_Natureza, True);
end;

procedure TF_Natureza.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_Natureza.ComboBox1Exit(Sender: TObject);
begin
  if (not ValidNumero(ComboBox1.Text)) then ComboBox1.Text := '0';
end;

procedure TF_Natureza.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox3.SetFocus;
end;

procedure TF_Natureza.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_Natureza.ComboBox3Exit(Sender: TObject);
begin
  if (not ValidNumero(ComboBox3.Text)) then ComboBox3.Text := '00';
end;

procedure TF_Natureza.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if BitBtn1.Enabled then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

end.
