unit RelAdv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_RelAdv = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Enter(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RelAdv: TF_RelAdv;
  tpbx              : String;
  F1                : TextFile;
  tot_pos, tot_neg, fim_de_semana,x,dias_uteis, dias_uteis2  : integer;
  dt                : TDateTime;
   

implementation

uses DMTD, Menu, QkRelPr2, QKAdvMores, FuncGeral;

{$R *.DFM}

Procedure Grava_linha(linha : String);
begin
  WriteLn(F1, linha);
end;

procedure TF_RelAdv.BitBtn3Click(Sender: TObject);
begin
   Close;
end;

procedure TF_RelAdv.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit2.Clear;
  MaskEdit2.Text := DateToStr(date);
end;

procedure TF_RelAdv.BitBtn1Click(Sender: TObject);
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  DM.Join.Close;
  DM.Join.Sql.Clear;
  DM.Join.Sql.Add('SELECT t.registro    ');
  DM.Join.Sql.Add(',  t.cliente         ');
  DM.Join.Sql.Add(',  tp.nome           ');
	DM.Join.Sql.Add(',	t.contrato        ');
	DM.Join.Sql.Add(',	tp.endereco       ');
	DM.Join.Sql.Add(',	tp.bairro         ');
	DM.Join.Sql.Add(',	tp.cidade         ');
	DM.Join.Sql.Add(',	tp.estado         ');
	DM.Join.Sql.Add(',	tp.cep            ');
	DM.Join.Sql.Add(',	t.ven_parc2       ');
	DM.Join.Sql.Add(',	t.ven_parc3       ');
	DM.Join.Sql.Add(',	t.ven_parc4       ');
	DM.Join.Sql.Add(',	t.ven_parc5       ');
	DM.Join.Sql.Add(',	t.ven_parc6       ');
	DM.Join.Sql.Add(',	t.ven_parc7       ');
	DM.Join.Sql.Add(',	t.ven_parc8       ');
	DM.Join.Sql.Add(',	t.ven_parc9       ');
	DM.Join.Sql.Add(',	t.ven_parc10      ');
	DM.Join.Sql.Add(',	t.ven_parc11      ');
	DM.Join.Sql.Add(',	t.val_parc2       ');
	DM.Join.Sql.Add(',	t.val_parc3       ');
	DM.Join.Sql.Add(',	t.val_parc4       ');
	DM.Join.Sql.Add(',	t.val_parc5       ');
	DM.Join.Sql.Add(',	t.val_parc6       ');
	DM.Join.Sql.Add(',	t.val_parc7       ');
	DM.Join.Sql.Add(',	t.val_parc8       ');
	DM.Join.Sql.Add(',	t.val_parc9       ');
	DM.Join.Sql.Add(',	t.val_parc10      ');
	DM.Join.Sql.Add(',	t.val_parc11      ');
	DM.Join.Sql.Add(',	t.tot_parcela     ');
  DM.Join.Sql.Add(',	t.v_cartorio      ');
  DM.Join.Sql.Add(',	t.v_tribunal      ');
  DM.Join.Sql.Add(',	t.v_ipesp         ');
  DM.Join.Sql.Add(',	t.v_estado        ');
  DM.Join.Sql.Add(',	t.v_sinoreg       ');
  DM.Join.Sql.Add(',	t.v_conducao      ');
  DM.Join.Sql.Add('FROM                 ');
	DM.Join.Sql.Add('		td t inner join td_pesso tp on (t.p_auxiliar = tp.p_auxiliar) ');
  DM.Join.Sql.Add('WHERE  tp.situacao = ''D'' ');
	DM.Join.Sql.Add('   		and t.data_r BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit1.Text)))
                                       + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit2.Text))));
  DM.Join.Open;

  if (DM.Join.RecordCount = 0) then
  begin
     DM.Join.Close;
     Application.MessageBox('Movimento não encontrado !', 'Atenção', MB_OK + MB_ICONINFORMATION);
     Exit;
  end;
  try
    QK_AdvMorais := TQK_AdvMorais.Create(Application);
    QK_AdvMorais.QuickRep1.DataSet := DM.Join;
    QK_AdvMorais.QuickRep1.Preview;
  finally
    QK_AdvMorais := nil;
    QK_AdvMorais.Free;
  end;
end;

procedure TF_RelAdv.MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if key = 13 then Maskedit2.SetFocus;
end;

procedure TF_RelAdv.MaskEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if key = 13 then
   begin
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT ncliente FROM td');
      Dm.ArqAux.Sql.Add('WHERE data_r BETWEEN ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit1.Text)))
                                      + ' AND ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit2.Text))));
      Dm.ArqAux.Sql.Add('GROUP BY ncliente');
      Dm.ArqAux.Sql.Add('ORDER BY ncliente');
      Dm.ArqAux.Open;
      if (Dm.ArqAux.RecordCount = 0) then
      begin
         Dm.ArqAux.Close;
         ShowMessage('Movimento não encontrado !');
         MaskEdit1.SetFocus;
         Exit;
      end;
      ComboBox1.Clear;
      while (not Dm.ArqAux.Eof) do
      begin
         ComboBox1.Items.Add(StrZero(Dm.ArqAux.FieldByName('ncliente').asString, 3) + ' - ' + BuscaNomeEmpresa(Dm.ArqAux.FieldByName('ncliente').asString, False));
         Dm.ArqAux.Next;
      end;
      Dm.ArqAux.Close;
      ComboBox1.SetFocus;
   end;
end;

procedure TF_RelAdv.ComboBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 // if key = 13 then ComboBox2.SetFocus;
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RelAdv.ComboBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RelAdv.ComboBox1Enter(Sender: TObject);
begin
  SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RelAdv.MaskEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if key = 13 then MaskEdit1.SetFocus;
end;

end.
