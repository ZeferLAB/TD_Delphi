unit RPce;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Printers, ComCtrls, ExtCtrls, jpeg;

type
  TF_RPce = class(TForm)
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel2: TBevel;
    Bevel3: TBevel;
    MaskEdit7: TMaskEdit;
    Label7: TLabel;
    Label1: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RPce: TF_RPce;
  
implementation

uses DMTD, Menu, QkRPce, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RPce.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(Date);
  MaskEdit1.SetFocus;
end;

procedure TF_RPce.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
  if key = 13 then MaskEdit7.SetFocus;
end;

procedure TF_RPce.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_RPce.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RPce.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit7.text := '';
  maskedit1.setfocus;
end;

procedure TF_RPce.BitBtn1Click(Sender: TObject);
var
  arq : String;
begin
  Dm.Certidao.Close;
  Dm.Certidao.RequestLive := False;
  Dm.Certidao.Sql.Clear;
  Dm.Certidao.Sql.Add('SELECT movimento, nr_protoc, apresentan, natureza, deposito,');
  Dm.Certidao.Sql.Add('custas, status, (custas-deposito) diferenca, entrega');
  Dm.Certidao.Sql.Add('FROM certidao');
  Dm.Certidao.Sql.Add('WHERE');
  Dm.Certidao.Sql.Add('    movimento >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.Certidao.Sql.Add('AND movimento <= ' + Chr(39) + ConvData(MaskEdit7.Text) + Chr(39));
  Dm.Certidao.Sql.Add('ORDER BY movimento, nr_protoc');
  Dm.Certidao.Open;
  if (Dm.Certidao.RecordCount = 0) then
  begin
    Dm.Certidao.Close;
    ShowMessage('Movimento não encontrado.');
    Exit;
  end;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'RELCER';
  CriaTabela('RELCER', arq);
  while (not Dm.Certidao.Eof) do
  begin
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
    Dm.ArqAux.Sql.Add('(data, pedido, nome, natureza, deposito, custas, diferenca, status, entrega)');
    Dm.ArqAux.Sql.Add('VALUES(');
    Dm.ArqAux.Sql.Add(Chr(39) + ConvData(Dm.Certidao.FieldByName('movimento').asString) + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Dm.Certidao.FieldByName('nr_protoc').asString + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + Trim(Dm.Certidao.FieldByName('apresentan').asString) + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + Trim(Ver_NatCer(Dm.Certidao.FieldByName('natureza').asString, False)) + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + 'R$' + Trim(StrCurr(Dm.Certidao.FieldByName('deposito').asCurrency, 14, True)) + Chr(39) + ',');
    if (Trim(Dm.Certidao.FieldByName('status').asString) = 'IRREGULAR') OR
       (Trim(Dm.Certidao.FieldByName('status').asString) = 'DEVOLVIDO IRREGULAR') then
    begin
      Dm.ArqAux.Sql.Add('"",');
    end
    else Dm.ArqAux.Sql.Add(Chr(39) + 'R$' + Trim(StrCurr(Dm.Certidao.FieldByName('custas').asCurrency, 14, True)) + Chr(39) + ',');
    if (Copy(Dm.Certidao.FieldByName('diferenca').asString, 1,1) = '-') then
    begin
      Dm.ArqAux.Sql.Add(Chr(39) + 'R$' + Trim(STrCurr(Abs(Dm.Certidao.FieldByName('diferenca').asCurrency), 14, True)) + 'D' + Chr(39) + ',');
    end
    else Dm.ArqAux.Sql.Add(Chr(39) + 'R$' + Trim(STrCurr(Abs(Dm.Certidao.FieldByName('diferenca').asCurrency), 14, True)) + 'R' + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + Trim(Dm.Certidao.FieldByName('status').asString) + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + Dm.Certidao.FieldByName('entrega').asString + Chr(39) + ')');
    Dm.ArqAux.ExecSql;
    Dm.Certidao.Next;
  end;
  Dm.Certidao.Close;
  Dm.Certidao.RequestLive := True;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY data');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    ShowMessage('Problemas para localizar os dados.');
    Exit;
  end;
  QrDestroi;
  Application.CreateForm(TQk_RPce, Qk_RPce);
  Qk_RPce.QrLabel1.Caption := F_Menu.Caption;
  Qk_RPce.QuickRep1.Preview;
  Qk_RPCe.Destroy;
  Qk_Rpce := NIL;
  DestroeTabela(arq);
  Bitbtn3.setfocus;
end;

procedure TF_RPce.MaskEdit1Exit(Sender: TObject);
begin
  MaskEdit7.Text := MaskEdit1.Text; 
end;

procedure TF_RPce.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RPce.MaskEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

end.
