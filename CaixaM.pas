unit CaixaM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Printers,
  Menus, jpeg;

type
  TF_CaixaM = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    PopupMenu1: TPopupMenu;
    Carregar1: TMenuItem;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure DBEdit8Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Carregar1Click(Sender: TObject);
    procedure DBEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CaixaM: TF_CaixaM;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_CaixaM.DBEdit8Exit(Sender: TObject);
begin
  Dm.Caixa.FieldByName('valor').ascurrency := Dm.Caixa.FieldByName('valor_ch').ascurrency + Dm.Caixa.FieldByName('valor_di').ascurrency + Dm.Caixa.FieldByName('valor_fat').ascurrency;
end;

procedure TF_CaixaM.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption = '&Incluir' then
  begin
    BitBtn1.Caption := '&Salvar';
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn8.Enabled := false;
    Panel2.enabled := true;
    Dm.Caixa.Append;
    DbEdit1.SetFocus;   
  end
  else
  Begin
    if MessageDlg('Confirma Inclusão de Dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Dm.Caixa.FieldByName('valor').ascurrency := Dm.Caixa.FieldByName('valor_ch').ascurrency + Dm.Caixa.FieldByName('valor_di').ascurrency;
      Dm.Caixa.Post;
    end
    else
    begin
      Dm.Caixa.Cancel;
      ShowMessage('Os dados não foram incluídos');
    end;
    Panel2.enabled := false;
    BitBtn1.Caption := '&Incluir';
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := true;
    BitBtn4.Enabled := true;
    BitBtn5.Enabled := true;
    BitBtn6.Enabled := true;
    BitBtn8.Enabled := true;
    BitBtn1.SetFocus;
  end;
end;

procedure TF_CaixaM.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then dbedit2.setfocus;
end;

procedure TF_CaixaM.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then dbedit4.setfocus;
end;

procedure TF_CaixaM.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then dbedit3.setfocus;
end;

procedure TF_CaixaM.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then dbedit5.setfocus;
end;

procedure TF_CaixaM.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then dbedit9.setfocus;
end;

procedure TF_CaixaM.DBEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then dbedit12.setfocus;
end;

procedure TF_CaixaM.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then dbedit6.setfocus;
end;

procedure TF_CaixaM.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then dbedit11.setfocus;
end;

procedure TF_CaixaM.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then if bitbtn1.enabled then bitbtn1.setfocus else bitbtn3.setfocus;
end;

procedure TF_CaixaM.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_CaixaM.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir os dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then Dm.Caixa.Delete;
end;

procedure TF_CaixaM.BitBtn3Click(Sender: TObject);
begin
  if BitBtn3.Caption = '&Corrigir' then
  begin
    BitBtn3.Caption := '&Salvar';
    BitBtn2.Enabled := false;
    BitBtn1.Enabled := False;
    BitBtn4.Enabled := False;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    BitBtn8.Enabled := false;
    Panel2.enabled := true;
    Dm.caixa.Edit;
    DbEdit1.SetFocus;
  end
  else
  Begin
    if MessageDlg('Confirma Correção dos Dados ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Dm.Caixa.FieldByName('valor').ascurrency := Dm.Caixa.FieldByName('valor_ch').ascurrency + Dm.Caixa.FieldByName('valor_di').ascurrency + Dm.Caixa.FieldByName('valor_fat').ascurrency;
      Dm.Caixa.Post;
    end
    else
    begin
      Dm.Caixa.Cancel;
      ShowMessage('Os dados não foram corrigidos');
    end;
    Panel2.enabled := false;
    BitBtn3.Caption := '&Corrigir';
    BitBtn2.Enabled := true;
    BitBtn1.Enabled := true;
    BitBtn4.Enabled := true;
    BitBtn5.Enabled := true;
    BitBtn6.Enabled := true;
    BitBtn8.Enabled := true;
    BitBtn3.SetFocus;
  end;
end;

procedure TF_CaixaM.BitBtn5Click(Sender: TObject);
begin
  Dm.caixa.Next;
end;

procedure TF_CaixaM.BitBtn6Click(Sender: TObject);
begin
  Dm.caixa.prior;
end;

procedure TF_CaixaM.BitBtn4Click(Sender: TObject);
var
  protocolo : String;
begin
  protocolo := '';
  protocolo := InputBox('PESQUISA DO CAIXA', 'Número do Protocolo : ', ('0'));
  begin
    Dm.Caixa.Close;
    Dm.Caixa.Sql.Clear;
    Dm.Caixa.Sql.Add('SELECT * FROM caixa');
    Dm.Caixa.Sql.Add('WHERE');
    Dm.Caixa.Sql.Add('protocolo = ' + Chr(39) + protocolo + Chr(39));
    Dm.Caixa.Sql.Add('ORDER BY protocolo');
    Dm.Caixa.Open;
    if (Dm.Caixa.RecordCount = 0) then ShowMessage('Movimento não localizado !');
  end;
end;

procedure TF_CaixaM.DBEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then dbedit8.setfocus; 
end;

procedure TF_CaixaM.FormActivate(Sender: TObject);
var
  datmov : String;
begin
  datmov := '';
  datmov := InputBox('PESQUISA DO CAIXA', 'Data do movimento : ', DateToStr(date));
  if (ValidData(datmov)) then
  begin
    Dm.Caixa.Close;
    Dm.Caixa.Sql.Clear;
    Dm.Caixa.Sql.Add('SELECT * FROM caixa');
    Dm.Caixa.Sql.Add('WHERE');
    Dm.Caixa.Sql.Add('data = ' + Chr(39) + ConvData(datmov) + Chr(39));
    Dm.Caixa.Sql.Add('ORDER BY protocolo');
    Dm.Caixa.Open;
    if (Dm.Caixa.RecordCount = 0) then ShowMessage('Movimento não localizado !');
  end;
end;

procedure TF_CaixaM.FormDestroy(Sender: TObject);
begin
  Dm.Caixa.Close;
end;

procedure TF_CaixaM.Carregar1Click(Sender: TObject);
begin
 F_CaixaM.FormActivate(F_CaixaM);
end;

procedure TF_CaixaM.DBEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DBEdit7.SetFocus;
end;

end.
