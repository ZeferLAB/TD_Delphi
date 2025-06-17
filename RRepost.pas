unit RRepost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_RRPost = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    ComboBox1: TComboBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RRPost: TF_RRPost;
  tpbx    : String;

implementation

uses DMTD, Menu, QkRPos, FuncGeral;

{$R *.DFM}


procedure TF_RRPost.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RRPost.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit1.SetFocus;
end;

procedure TF_RRPost.BitBtn1Click(Sender: TObject);
var
  arq : String;
  ende, compl, linha : String;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT a.p_auxiliar, a.registro, a.data_p, a.rl, ');
  Dm.Join.Sql.Add('b.nome, b.endereco, b.numero, b.bairro, b.cidade, b.cep, b.complem, b.estado');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b ON (a.p_auxiliar = b.p_auxiliar)');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('    a.data_repost = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.Join.Sql.Add('    AND b.situacao    = "D"');
  if (Trim(ComboBox1.Text) = 'SÃO PAULO') then
  begin
    Dm.Join.Sql.Add('AND b.estado = "SP"');
  end
  else Dm.Join.Sql.Add('AND b.estado <> "SP"');
  Dm.Join.Sql.Add('group BY a.registro');
  //Dm.Join.Sql.savetofile('c:\teste.txt');
  Dm.Join.Open;
  if (Dm.Join.RecordCount = 0) then
  begin
    Dm.Join.Close;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;
  Application.CreateForm(TQk_RPos, Qk_RPos);
  Qk_RPos.QrLabel1.Caption := F_Menu.Label29.Caption;
  Qk_RPos.QrLabel5.Caption := 'LISTAGEM DE REPOSTAGEM ENVIADOS PARA O CORREIO EM ' + MaskEdit1.Text;
  Qk_RPos.QuickRep1.Preview;
  Qk_RPos.Destroy;
  Qk_RPos := NIL;
end;

procedure TF_RRPost.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RRPost.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
end;

procedure TF_RRPost.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RRPost.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RRPost.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RRPost.ComboBox1Enter(Sender: TObject);
begin
  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

end.
