unit RAviso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_RAviso = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    CheckBox1: TCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RAviso: TF_RAviso;
  tpbx    : String;

implementation

uses DMTD, Menu, QkCpos, QkCpar, QkCNeg, QkAviso, QkCerP, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RAviso.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RAviso.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit1.SetFocus;
end;

procedure TF_RAviso.BitBtn1Click(Sender: TObject);
var
  arq : String;
  ende, compl, linha : String;
  x : Integer;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT a.p_auxiliar, a.registro, a.anotacao,');
  Dm.Join.Sql.Add('b.nome, b.endereco, b.numero, b.bairro, b.cidade, b.cep, b.complem, b.estado');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
  Dm.Join.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('    (a.data_p  = ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  if (StrToInt(MaskEdit2.Text) > 0) AND (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.Join.Sql.Add('AND a.registro >= ' + Trim(MaskEdit2.Text));
    Dm.Join.Sql.Add('AND a.registro <= ' + Trim(MaskEdit3.Text));
  end;
  Dm.Join.Sql.Add('AND  a.natureza   = 96');
  Dm.Join.Sql.Add('AND  b.situacao   = "D")');
  Dm.Join.Sql.Add('ORDER BY a.registro');
  Dm.Join.Open;
  if (Dm.Join.RecordCount = 0) then
  begin
    Dm.Join.Close;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;
  if (not CheckBox1.Checked) then
  begin
    Application.CreateForm(TQk_Aviso, Qk_Aviso);
    Qk_Aviso.QrLabel1.Caption  := F_Menu.Label29.Caption;
    Qk_Aviso.QrLabel16.Caption  := F_Menu.Label11.Caption;
    Qk_Aviso.QuickRep1.Preview;
    Qk_Aviso.Destroy;
    Qk_Aviso := NIL;
  end
  else
  begin
    arq := '';
    arq := TirarTudo(F_Menu.Label1.Caption, ' ', '', '') + 'CERTPOS';
    CriaTabela('CERTPOS', arq);
    while (not Dm.Join.Eof) do
    begin
      for x := 1 to 2 do
      begin
        ende := '';
        ende := Dm.Join.FieldByName('endereco').asString;
        if (Trim(Dm.Join.FieldByName('numero').asString) <> '') then
        begin
          ende := ende + ' Nº ' + Dm.Join.FieldByName('numero').asString;
        end;
        ende := Trim(ende) + ' ' + Trim(Dm.Join.FieldByName('complem').asString) + ' ';
        if (Trim(Dm.Join.FieldByName('bairro').asString) <> '') then
        begin
          ende := Trim(ende) + ' ' + Trim(Dm.Join.FieldByName('bairro').asString);
        end;
        //
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
        Dm.ArqAux.Sql.Add('(p_auxiliar, protocolo, certificado, nome, endereco, cidade)');
        Dm.ArqAux.Sql.Add('VALUES(');
        Dm.ArqAux.Sql.Add(Chr(39) + Copy(StrZero(Dm.Join.FieldByName('p_auxiliar').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.Join.FieldByName('p_auxiliar').asString, 6), 4,3) + Chr(39) + ',');
        Dm.ArqAux.Sql.Add(Chr(39) + Copy(StrZero(Dm.Join.FieldByName('registro').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.Join.FieldByName('registro').asString, 6), 4,3) + Chr(39) + ',');
        if (Trim(Dm.Join.FieldByName('anotacao').asString) <> '') then
        begin
          Dm.ArqAux.Sql.Add(Chr(39) + Copy(StrZero(Dm.Join.FieldByName('anotacao').asString, 6), 1,3) + '.' + Copy(StrZero(Dm.Join.FieldByName('anotacao').asString, 6), 4,3) + Chr(39) + ',');
        end
        else Dm.ArqAux.Sql.Add('"",');
        Dm.ArqAux.Sql.Add(Chr(39) + Trim(Dm.Join.FieldByName('nome').asString) + Chr(39) + ',');
        Dm.ArqAux.Sql.Add(Chr(39) + ende + Chr(39) + ',');
        Dm.ArqAux.Sql.Add(Chr(39) + 'CEP : ' + FormataCep(Dm.Join.FieldByName('cep').asString) + ' - ' + Trim(Dm.Join.FieldByName('cidade').asString) + ' / ' + Trim(Dm.Join.FieldByName('estado').asString) + Chr(39) + ')');
        Dm.ArqAux.ExecSql;
      end;
      Dm.Join.Next;
    end;
    Dm.Join.Close;
    //
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
    Dm.ArqAux.Sql.Add('ORDER BY recno');
    Dm.ArqAux.Open;
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      ShowMessage('Problemas para carregar movimento !');
      Dm.ArqAux.Close;
      Exit;
    end;      
    Application.CreateForm(TQk_CerP, Qk_CerP);
    Qk_CerP.QrLabel1.Caption  := F_Menu.Label29.Caption;
    Qk_CerP.QrLabel30.Caption := F_Menu.Label11.Caption;
    Qk_CerP.QrLabel2.Caption  := F_Menu.Label5.Caption;
    Qk_CerP.QrLabel3.Caption  := F_Menu.Label13.Caption;
    Qk_CerP.QuickRep1.Preview;
    Qk_CerP.Destroy;
    Qk_CerP := NIL;
    DestroeTabela(arq);
  end;
end;

procedure TF_RAviso.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RAviso.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
end;

procedure TF_RAviso.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RAviso.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_RAviso.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

end.
