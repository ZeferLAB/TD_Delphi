unit CadPI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, Grids, DBGrids, jpeg;

type
  TF_CadPI = class(TForm)
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
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    Label3: TLabel;
    MaskEdit4: TMaskEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label39: TLabel;
    Label32: TLabel;
    MaskEdit6: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit7: TMaskEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    Panel3: TPanel;
    Label5: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label6: TLabel;
    MaskEdit12: TMaskEdit;
    Label7: TLabel;
    MaskEdit13: TMaskEdit;
    DBGrid1: TDBGrid;
    Label8: TLabel;
    MaskEdit14: TMaskEdit;
    Label9: TLabel;
    MaskEdit15: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
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
    procedure MaskEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Carrega(Sender : TOBject; Pesquisa : Boolean);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    Procedure Gravar(Sender : TOBject; Modo : Integer);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    Procedure Limpar(Sender : TOBject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadPI: TF_CadPI;

implementation

uses DMTD, Menu, RPI, PCadPI, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_CadPI.Limpar(Sender : TOBject);
begin
  MaskEdit1.Text  := '';
  MaskEdit2.Text  := '';
  MaskEdit3.Text  := '';
  MaskEdit4.Text  := '';
  MaskEdit5.Text  := '';
  MaskEdit6.Text  := '';
  MaskEdit7.Text  := '';
  MaskEdit8.Text  := '';
  MaskEdit9.Text  := '';
  MaskEdit10.Text := '';
  MaskEdit11.Text := '';
  MaskEdit12.Text := '';
  MaskEdit13.Text := '';
  MaskEdit14.Text := '';
  MaskEdit15.Text := '';
end;

Procedure TF_CadPI.Gravar(Sender : TOBject; Modo : Integer);
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data do pedido inválida.');
    MaskEdit1.SetFocus;
    Exit;
  end;
  if (modo = 0) then
  begin
    Dm.CadPI.Append;
  end
  else Dm.CadPi.Edit;
  if (ValidData(MaskEdit1.Text)) then Dm.CadPi.FieldByName('dataped').asString := MaskEdit1.Text;
  Dm.CadPi.FieldByName('numped').asString    := Trim(MaskEdit2.Text);
  Dm.CadPi.FieldByName('rl').asString        := Trim(MaskEdit3.Text);
  Dm.CadPi.FieldByName('nome').asString      := Trim(MaskEdit4.Text);
  Dm.CadPi.FieldByName('cep').asString       := TirarTudo(MaskEdit5.Text, '-','','');
  Dm.CadPi.FieldByName('endereco').asString  := Trim(MaskEdit6.Text);
  Dm.CadPi.FieldByName('numero').asString    := Trim(MaskEdit7.Text);
  Dm.CadPi.FieldByName('complem').asString   := Trim(MaskEdit8.Text);
  Dm.CadPi.FieldByName('bairro').asString    := Trim(MaskEdit9.Text);
  Dm.CadPi.FieldByName('cidade').asString    := Trim(MaskEdit10.Text);
  Dm.CadPi.FieldByName('estado').asString    := Trim(MaskEdit11.Text);
  if (ValidData(MaskEdit12.Text)) then Dm.CadPi.FieldByName('entregue').asString := MaskEdit12.Text;
  Dm.CadPi.FieldByName('descricao').asString := Trim(MaskEdit13.Text);
  Dm.CadPi.FieldByName('protocolo').asString := Trim(MaskEdit14.Text);
  Dm.CadPi.FieldByName('data_p').asString    := Trim(MaskEdit15.Text);
  Dm.CadPi.Post;
  if (modo = 0) then
  begin
    Atualiza_His(MaskEdit1.Text, TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'INCLUSÃO DE SOLICITAÇÃO DE INFORMAÇÃO AO CORREIO(PI) Nº ' + Trim(MaskEdit2.Text), Trim(MaskEdit14.Text));
    Carrega(F_CadPI, True);
  end
  else Atualiza_His(MaskEdit1.Text, TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'CORREÇÃO NA SOLICITAÇÃO DE INFORMAÇÃO AO CORREIO(PI) Nº ' + Trim(MaskEdit2.Text), Trim(MaskEdit14.Text));
end;

Procedure TF_CadPI.Carrega(Sender : TOBject; Pesquisa : Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.CadPI.Close;
    Dm.CadPI.Sql.Clear;
    Dm.CadPI.Sql.Add('SELECT * FROM cadpi');
    Dm.CadPI.Sql.Add('ORDER BY numped DESC');
    Dm.CadPI.Open;
  end;
  MaskEdit1.Text     := Dm.CadPi.FieldByName('dataped').asString;
  MaskEdit2.Text     := StrZero(Dm.CadPi.FieldByName('numped').asString, 6);
  MaskEdit3.Text     := Dm.CadPi.FieldByName('rl').asString;
  MaskEdit4.Text     := Dm.CadPi.FieldByName('nome').asString;
  MaskEdit5.EditMask := '';
  MaskEdit5.Text     := Dm.CadPi.FieldByName('cep').asString;
  MaskEdit5.EditMask := '99999-999';
  MaskEdit6.Text     := Dm.CadPi.FieldByName('endereco').asString;
  MaskEdit7.Text     := Dm.CadPi.FieldByName('numero').asString;
  MaskEdit8.Text     := Dm.CadPi.FieldByName('complem').asString;
  MaskEdit9.Text     := Dm.CadPi.FieldByName('bairro').asString;
  MaskEdit10.Text    := Dm.CadPi.FieldByName('cidade').asString;
  MaskEdit11.Text    := Dm.CadPi.FieldByName('estado').asString;
  MaskEdit12.Text    := Dm.CadPi.FieldByName('entregue').asString;
  MaskEdit13.Text    := Dm.CadPi.FieldByName('descricao').asString;
  if (Dm.CadPi.FieldByName('entregue').asDateTime > 0) then
  begin
    RadioButton1.Checked := True;
    Label6.Visible       := True;
    MaskEdit12.Visible   := True;
    Label7.Caption       := 'Para : ';
  end
  else
  begin
    RadioButton2.Checked := True;
    Label6.Visible       := False;
    MaskEdit12.Visible   := False;
    Label7.Caption       := 'Motivo : ';
  end;
end;

procedure TF_CadPI.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption = '&Incluir' then
  begin
    Limpar(F_CadPI);
    BitBtn1.Caption := '&Salvar';
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    Panel2.Enabled  := True;
    MaskEdit2.Text  := StrZero(Busca_Codigo('cadpi', 'numped'), 6);
    MaskEdit1.Text  := DateToStr(date);
    MaskEdit1.SetFocus;
  end
  else
  begin
    if BitBtn1.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma Inclusão de Dados ?'), 'INCLUSÃO', MB_YESNO + MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_CadPI, 0);
      end
      else
      begin
        MessageBox(Handle, PChar('Os dados não foram incluídos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da inclusão da PI.', '0');        
        Carrega(F_CadPI, False);        
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

procedure TF_CadPI.MaskEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit13.SetFocus;
end;

procedure TF_CadPI.MaskEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if (BitBtn1.Enabled) then BitBtn1.SetFocus else BitBtn3.SetFocus;
end;

procedure TF_CadPI.RadioButton1Click(Sender: TObject);
begin
  if (Panel2.Enabled) then
  begin
    Label6.Visible     := True;
    MaskEdit12.Visible := True;
    Label7.Caption     := 'Para : ';
    MaskEdit12.SetFocus;
  end;  
end;

procedure TF_CadPI.RadioButton2Click(Sender: TObject);
begin
  if (Panel2.Enabled) then
  begin
    Label6.Visible     := False;
    MaskEdit12.Visible := False;
    Label7.Caption     := 'Motivo : ';
    MaskEdit13.SetFocus;
  end;  
end;

procedure TF_CadPI.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_CadPI.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_CadPI.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_CadPI.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_CadPI.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit6.SetFocus;
end;

procedure TF_CadPI.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_CadPI.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit8.SetFocus;
end;

procedure TF_CadPI.MaskEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit9.SetFocus;
end;

procedure TF_CadPI.MaskEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit10.SetFocus;
end;

procedure TF_CadPI.MaskEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit11.SetFocus;
end;

procedure TF_CadPI.MaskEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then RadioButton1.SetFocus;
end;

procedure TF_CadPI.FormActivate(Sender: TObject);
begin
  Carrega(F_CadPI, True);
  BitBtn1.SetFocus;
end;

procedure TF_CadPI.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CadPI.MaskEdit3Exit(Sender: TObject);
var
  numreg : String;
begin
  if (BitBtn1.Enabled) then
  begin
    if (Trim(MaskEdit3.Text) <> '') then
    begin
      numreg := '';
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT numreg FROM acertifi');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('codigo_barra = ' + Chr(39) + Trim(MaskEdit3.Text) + Chr(39));
      Dm.ArqAux.Open;
      if (Dm.ArqAux.RecordCount = 0) then
      begin
        Dm.ArqAux.Close;
        ShowMessage('Código do RL não encontrado !');
        Exit;
      end;
      numreg := Dm.ArqAux.FieldByName('numreg').asString;
      Dm.ArqAux.Close;
      //Carregando dados do td_pesso
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT a.data_p, a.protocolo,');
      Dm.ArqAux.Sql.Add('b.nome, b.endereco, b.numero, b.complem, b.bairro, b.cidade, b.cep, b.estado');
      Dm.ArqAux.Sql.Add('FROM td a INNER JOIN td_pesso b');
      Dm.ArqAux.Sql.Add('ON (a.registro = b.registro)');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('    a.registro = ' + numreg);
      Dm.ArqAux.Sql.Add('AND b.situacao = "D"');
      Dm.ArqAux.Open;
      if (Dm.ArqAux.RecordCount = 0) then
      begin
        Dm.ArqAux.Close;
        ShowMessage('Nº de registro não encontrado !');
        Exit;
      end;
      MaskEdit4.Text     := Dm.ArqAux.FieldByName('nome').asString;
      MaskEdit5.EditMask := '';
      MaskEdit5.Text     := Dm.ArqAux.FieldByName('cep').asString;
      MaskEdit5.EditMask := '99999-999';
      MaskEdit6.Text     := Dm.ArqAux.FieldByName('endereco').asString;
      MaskEdit7.Text     := Dm.ArqAux.FieldByName('numero').asString;
      MaskEdit8.Text     := Dm.ArqAux.FieldByName('complem').asString;
      MaskEdit9.Text     := Dm.ArqAux.FieldByName('bairro').asString;
      MaskEdit10.Text    := Dm.ArqAux.FieldByName('cidade').asString;
      MaskEdit11.Text    := Dm.ArqAux.FieldByName('estado').asString;
      MaskEdit14.Text    := Dm.ArqAux.FieldByName('protocolo').asString;
      MaskEdit15.Text    := Dm.ArqAux.FieldByName('data_p').asString;      
    end;
  end;
end;

procedure TF_CadPI.BitBtn5Click(Sender: TObject);
begin
  Dm.CadPI.Next;
  Carrega(F_CadPI, False);
end;

procedure TF_CadPI.BitBtn6Click(Sender: TObject);
begin
  Dm.CadPI.Prior;
  Carrega(F_CadPI, False);
end;

procedure TF_CadPI.BitBtn7Click(Sender: TObject);
begin
  Application.CreateForm(TF_RPI, F_RPI);
  F_RPI.ShowModal;
  F_RPI.Destroy;
  F_RPI := NIL;
  Carrega(F_CadPi, True); 
end;

procedure TF_CadPI.BitBtn2Click(Sender: TObject);
begin
  if (MessageBox(Handle, PChar('Deseja excluir os dados ?'), 'EXCLUSÃO', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
  begin
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Exclusão do pedido de informação do protocolo ' + Trim(MaskEdit14.Text), '0');
    Dm.CadPI.Delete;
    Carrega(F_CadPI, False);
  end
  else
  begin
    MessageBox(Handle, PChar('Os dados não foram excluídos'), 'DESISTÊNCIA DA EXCLUSÃO', MB_OK + MB_ICONWARNING);
    Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da exclusão do pedido de informação do protocolo ' + Trim(MaskEdit14.Text), '0');
    BitBtn1.SetFocus;
  end;
end;

procedure TF_CadPI.BitBtn3Click(Sender: TObject);
begin
  if BitBtn3.Caption = '&Corrigir' then
  begin
    BitBtn3.Caption := '&Salvar';
    BitBtn2.Enabled := false;
    BitBtn1.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn8.Enabled := false;
    Panel2.Enabled  := True;
    MaskEdit1.SetFocus;
  end
  else
  begin
    if BitBtn3.Caption = '&Salvar' then
    begin
      if (MessageBox(Handle, PChar('Confirma correção dos dados ?'), 'INCLUSÃO', MB_YESNO + MB_ICONQUESTION) = IDYes) then
      begin
        Gravar(F_CadPI, 1);
      end
      else
      begin
        MessageBox(Handle, PChar('Os dados não foram corrigidos'), 'DESISTÊNCIA DA INCLUSÃO', MB_OK + MB_ICONWARNING);
        Atualiza_His(DateToStr(Date), TimeToStr(Time), '', F_Menu.Label1.Caption, 'Desistência da correção da PI N. ' + MaskEdit2.Text, '0');        
        Carrega(F_CadPI, False);        
      end;
      Panel2.enabled := false;
      BitBtn3.Caption := '&Corrigir';
      BitBtn2.Enabled := true;
      BitBtn1.Enabled := true;
      BitBtn4.Enabled := true;
      BitBtn5.Enabled := true;
      BitBtn6.Enabled := true;
      BitBtn7.Enabled := true;
      BitBtn8.Enabled := true;
      BitBtn1.SetFocus;
    end;
  end;
end;

procedure TF_CadPI.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(TF_PCadPI, F_PCadPi);
  F_PCadPI.ShowModal;
  F_PCadPI.Destroy;
  F_PCadPI := NIL;
  if (Dm.CadPI.Active) then
  begin
    Carrega(F_CadPI, False);
  end
  else Carrega(F_CadPI, True);
end;

procedure TF_CadPI.DBGrid1DblClick(Sender: TObject);
begin
  Carrega(F_CadPI, True);
end;

end.

