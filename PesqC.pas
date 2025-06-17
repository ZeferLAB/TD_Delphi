unit PesqC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, Grids, DBGrids, DBCtrls, Menus, jpeg,
  ComCtrls;

type
  TF_PesqC = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label9: TLabel;
    DBText7: TDBText;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    MaskEdit1: TMaskEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText2: TDBText;
    Label6: TLabel;
    DBText3: TDBText;
    DBText8: TDBText;
    Label12: TLabel;
    DBText9: TDBText;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBText10: TDBText;
    DBRichEdit1: TDBRichEdit;
    Label8: TLabel;
    Label10: TLabel;
    DBText1: TDBText;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    Procedure Carregar(Sender : TOBject);
    procedure RadioButton1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioButton4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PesqC: TF_PesqC;

implementation

Uses DMTD, Menu, FuncGeral;

{$R *.DFM}

Procedure TF_PesqC.Carregar(Sender : TOBject);
begin
  Label4.Caption  := 'R$ 0,00';
  Label14.Caption := 'R$ 0,00';
  Label16.Caption := 'R$ 0,00';

  Label4.Caption  := 'R$ ' + StrCurr(Dm.Certidao.FieldByName('deposito').asCurrency, 10, True);
  Label14.Caption := 'R$ ' + StrCurr(Dm.Certidao.FieldByName('vl_certid').asCurrency, 10, True);
  if (Dm.Certidao.FieldByName('deposito').asCurrency > Dm.Certidao.FieldByName('vl_certid').asCurrency) then
  begin
    Label16.Caption := 'R$ ' + StrCurr((Dm.Certidao.FieldByName('deposito').asCurrency - Dm.Certidao.FieldByName('vl_certid').asCurrency), 10, True) + '(DEV)';
  end
  else
  begin
    Label16.Caption := 'R$ ' + StrCurr((Dm.Certidao.FieldByName('vl_certid').asCurrency - Dm.Certidao.FieldByName('deposito').asCurrency), 10, True) + '(REC)';
  end; 
end;

procedure TF_PesqC.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit1.setfocus;
  if key = 27 then close;
end;

procedure TF_PesqC.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_PesqC.SpeedButton1Click(F_PesqC);
end;

procedure TF_PesqC.BitBtn3Click(Sender: TObject);
begin
  panel2.visible := false;;
  panel1.enabled := true;
  combobox1.setfocus;
  maskedit1.text := '';
end;

procedure TF_PesqC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if panel2.visible then
  begin
    panel2.visible := false;;
    panel1.enabled := true;
    combobox1.text := '';
    maskedit1.text := '';
  end;
end;

procedure TF_PesqC.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_PesqC.BitBtn3Click(F_PesqC);
end;

procedure TF_PesqC.BitBtn4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_PesqC.BitBtn3Click(F_PesqC);
end;

procedure TF_PesqC.SpeedButton1Click(Sender: TObject);
var
  argu : String;
  cod : Integer;
begin
  cod := (StrToInt(Copy(ComboBox1.Text, 1,2)));
  if (not ValidNumero(Copy(ComboBox1.Text, 1,2))) OR
     (cod > 3) OR (cod <= 0) then
  begin
    MessageBox(Handle, PChar('Opção de pesquisa inválida !'), 'ERRO', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    MessageBox(Handle, PChar('Favor optar por uma opção válida !'), 'ERRO', MB_OK + MB_ICONWARNING);
    ComboBox1.SetFocus;
    Exit;
  end;
  if (Trim(MaskEdit1.Text) = '') then
  begin
    MessageBox(Handle, PChar('Item a ser pesquisado inválido !'), 'ERRO', MB_OK + MB_ICONWARNING);
    MessageBox(Handle, PChar('Você deve digitar algum dado para realizar a pesquisa !'), 'ERRO', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  argu := '';  
  if (cod > 0) AND (cod <= 1)  then
  begin
    RadioButton1.Checked := True;
    argu := Trim(MaskEdit1.Text);
  end
  else
  begin
    if (RadioButton1.Checked) then argu := Chr(39) + Trim(MaskEdit1.Text) + Chr(39);
    if (RadioButton2.Checked) then argu := Chr(39) + Trim(MaskEdit1.Text) + '%' + Chr(39);
    if (RadioButton3.Checked) then argu := Chr(39) + '%' + Trim(MaskEdit1.Text) + '%' + Chr(39);
    if (RadioButton4.Checked) then argu := 'Soundex(' + Chr(39) + Trim(MaskEdit1.Text) + Chr(39) + ')';
  end;
  Dm.Certidao.Close;
  Dm.Certidao.RequestLive := False;
  Dm.Certidao.Sql.Clear;
  Dm.Certidao.Sql.Add('SELECT * FROM certidao');
  Dm.Certidao.Sql.Add('WHERE');
  if (cod = 1) then Dm.Certidao.Sql.Add('nr_protoc  = '+ argu);
  if (cod = 2) then
  begin
    if (RadioButton1.Checked) then
    begin
      Dm.Certidao.Sql.Add('apresentan = '+ argu);
    end
    else
    begin
      if (RadioButton4.Checked) then
      begin
        Dm.Certidao.Sql.Add('soundex(apresentan) = '+ argu);
      end
      else Dm.Certidao.Sql.Add('apresentan like '+ argu);
    end;
  end;
  if (cod = 3) then
  begin
    if (RadioButton1.Checked) then
    begin
      Dm.Certidao.Sql.Add('propriet = '+ argu);
    end
    else
    begin
      if (RadioButton4.Checked) then
      begin
        Dm.Certidao.Sql.Add('soundex(propriet) = '+ argu);
      end
      else Dm.Certidao.Sql.Add('propriet like '+ argu);
    end;
  end;
  Dm.Certidao.Sql.Add('ORDER BY apresentan');
  Dm.Certidao.Open;
  if (Dm.Certidao.RecordCount = 0) then
  begin
    Dm.Certidao.Close;
    MessageBox(Handle, PChar('Dados não encontrados !'), 'PESQUISA', MB_OK + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;    
  end;
  //Panel2.Visible := True;
  //Panel1.Enabled := False;
  Label8.Caption := Ver_NatCer(Dm.Certidao.FieldByName('natureza').asString, False);
  Label8.Visible := True;
  //DbGrid1.SetFocus;
end;

procedure TF_PesqC.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_PesqC.RadioButton1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_PesqC.RadioButton2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_PesqC.RadioButton3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_PesqC.RadioButton4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_PesqC.FormDestroy(Sender: TObject);
begin
  Dm.Certidao.Close;
  Dm.Certidao.RequestLive := True;
end;

procedure TF_PesqC.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

end.

