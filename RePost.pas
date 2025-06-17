unit RePost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, jpeg;

type
  TF_RePost = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    BitBtn2: TBitBtn;
    MaskEdit2: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RePost: TF_RePost;

implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RePost.MaskEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ende : String;  
begin
   if key = 13 then
   begin
      if (not ValidNumero(MaskEdit1.Text)) then
      begin
         ShowMessage('Nº de registro inválido.');
         MaskEdit1.SetFocus;
         Exit;
      end;
      MaskEdit1.Enabled := False;
      Dm.Join.Close;
      Dm.Join.Sql.Clear;
      Dm.Join.Sql.Add('SELECT a.protocolo, a.p_auxiliar, a.data_r, a.data_p, a.natureza, a.rl, a.anotacao,');
      Dm.Join.Sql.Add('b.nome, b.endereco, b.numero, b.complem, b.bairro, b.cidade, b.estado, b.cep');
      Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
      Dm.Join.Sql.Add('ON (a.protocolo = b.protocolo)');
      Dm.Join.Sql.Add('WHERE');
      Dm.Join.Sql.Add('    a.registro = ' + Trim(MaskEdit1.Text));
      Dm.Join.Sql.Add('AND (a.natureza  = "' + '197' + '" ');
      Dm.Join.Sql.Add('OR a.natureza   = "' + '300' + '") ');
//      Dm.Join.Sql.Add('AND a.natureza = 197');
      Dm.Join.Sql.Add('AND b.situacao = "D"');
      Dm.Join.Open;
      if (Dm.Join.RecordCount = 0) then
      begin
         Dm.Join.Close;
         ShowMessage('Registro não encontrado !');
         Exit;
      end;
      // Carregando Dados Na Tela.
      Label15.Caption := '';
      Label16.Caption := '';
      Label15.Caption := Dm.Join.FieldByName('estado').asString;
      Label16.Caption := Dm.Join.FieldByName('anotacao').asString;
      Label3.Caption  := Dm.Join.FieldByName('nome').asString;
      Label6.Caption  := Dm.Join.FieldByName('protocolo').asString + ' - Recepcionado em : ' + Dm.Join.FieldByName('data_r').asString;
      Label8.Caption  := Dm.Join.FieldByName('data_p').asString;
      Label10.Caption := Ver_Natureza(Dm.Join.FieldByName('natureza').asString, False);
   // Label13.Caption := 'RC ' + Dm.Join.FieldByName('rl').asString + ' BR';
      Label13.Caption := F_Menu.Label34.Caption + ' ' + Dm.Join.FieldByName('rl').asString + ' BR';
      Label4.Caption  := FormataEndereco(Trim(Dm.Join.FieldByName('endereco').asString), Trim(Dm.Join.FieldByName('numero').asString),
                                         Trim(Dm.Join.FieldByName('complem').asString),  Trim(Dm.Join.FieldByName('bairro').asString),
                                         Trim(Dm.Join.FieldByName('cidade').asString),   Trim(Dm.Join.FieldByName('estado').asString),
                                         Trim(Dm.Join.FieldByName('cep').asString));
      Dm.Join.Close;
      Label3.Visible  := True;
      Label4.Visible  := True;
      Label6.Visible  := True;
      Label8.Visible  := True;
      Label10.Visible := True;
      Label13.Visible := True;
      BitBtn1.SetFocus;
   end;
end;

procedure TF_RePost.BitBtn3Click(Sender: TObject);
begin
   Label3.Visible  := False;
   Label4.Visible  := False;
   Label6.Visible  := False;
   Label8.Visible  := False;
   Label10.Visible := False;
   Label13.Visible := False;
   Label14.Visible := False;
   MaskEdit1.Enabled := True;
   MaskEdit1.Text    := '';
   MaskEdit1.SetFocus;
end;

procedure TF_RePost.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RePost.BitBtn1Click(Sender: TObject);
var
  codRL : String;
begin
   if (not ValidNumero(MaskEdit1.Text)) or (StrToInt(MaskEdit1.Text) = 0)    then
   begin
      ShowMessage('Nº de registro inválido !');
      BitBtn3Click(F_RePost);
      Exit;
   end;
   codRL := '';
   codRL := GerarCodigoRL(Label15.Caption);
   codRl := digi(codRl);
   Label14.Caption := F_Menu.Label34.Caption + ' ' + codRL + ' BR';
   //Label14.Caption := 'RC ' + codRL + ' BR';
   Label14.Visible := True;
   //Atualizando TD
   Dm.Td.Close;
   Dm.Td.Sql.Clear;
   Dm.Td.Sql.Add('UPDATE td SET');
   Dm.Td.Sql.Add('rl          = ' + Chr(39) + codRL + Chr(39) + ',');
   Dm.Td.Sql.Add('data_repost = ' + Chr(39) + ConvData(DateToStr(Date)) + Chr(39));
   Dm.Td.Sql.Add('WHERE');
   Dm.Td.Sql.Add('registro = ' + MaskEdit1.Text);
   Dm.Td.ExecSQL;
   //Incluindo dentro do acertifi
   AppendaCodigoRL(codRL, MaskEdit1.Text, Label16.Caption, ConvData(DateToStr(date)), '1000');
   BitBtn3.SetFocus;
end;

procedure TF_RePost.MaskEdit1Exit(Sender: TObject);
begin
   MaskEdit1.Text := Trim(MaskEdit1.Text);
end;

procedure TF_RePost.MaskEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
 RL : String;
begin
   if key = 13 then
   Begin
    Dm.Join.Close;
    Dm.Join.Sql.Clear;
    Dm.Join.Sql.Add('SELECT rl, recno from td where rl = ' + Chr(39) + maskedit2.text + Chr(39));
//    Dm.Join.Sql.Savetofile('c:\teste.txt');
    Dm.Join.OPen;

    if Dm.Join.recordCount <> 0 then
    begin
       if length(Dm.Join.fieldbyname('rl').AsString) < 9  then
       begin
          RL := digi(Dm.Join.fieldbyname('rl').AsString);

          if Dm.Join.recordcount <> 0 then
          begin
             Dm.td.Close;
             Dm.td.Sql.Clear;
             Dm.td.Sql.Add('update td set rl = ' + Chr(39) + RL + Chr(39) + ' where recno = ' + Dm.Join.fieldbyname('recno').AsString);
//             Dm.td.Sql.Savetofile('c:\teste.txt');
             Dm.td.ExecSql;

             if Dm.td.RowsAffected <> 0 then Showmessage(RL);

             if Dm.td.RowsAffected = 0 then Showmessage('Falha na operação');
          end
       end;
    end
    else
      Showmessage('RL não encontrada');
    BitBtn2.SetFocus;
   end;
end;

procedure TF_RePost.BitBtn2Click(Sender: TObject);
begin
   MaskEdit2.SetFocus;
end;

end.
