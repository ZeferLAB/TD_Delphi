unit Anot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids, jpeg, ComCtrls;

type
  TF_Anot = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    RichEdit1: TRichEdit;
    Bevel1: TBevel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Limpa_Tela(Sender : TOBject);
    Procedure Carrega_Pessoal(Sender : TObject; Pesquisa : Boolean);      
  private
    { Private declarations }
  public
    { Public declarations }
    chamada_externa: Boolean;
    tela: String;
  end;

var
  F_Anot: TF_Anot;

implementation

uses DMTD, Menu, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Anot.Limpa_Tela(Sender : TOBject);
begin
  BitBtn1.Enabled   := False;
  Label7.Caption    := '';
  Label8.Caption    := '';
  Label9.caption    := '';
  Label10.Caption   := '';
  MaskEdit1.Enabled := True;
  MaskEdit1.Text    := '';
  RichEdit1.Clear;
  //Dm.PessAux.Close;
end;

procedure TF_Anot.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Anot.BitBtn3Click(Sender: TObject);
begin
  Limpa_Tela(F_Anot);
  MaskEdit1.SetFocus;
end;

procedure TF_Anot.BitBtn2Click(Sender: TObject);
var
  prot : String;
  retro: Boolean;
begin
  retro := False;
  if (Trim(MaskEdit1.Text) = '') then
  begin
    MaskEdit1.SetFocus;
    exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  if tela = 'retroativo' then
    Dm.ArqAux.Sql.Add('SELECT anotacao, p_auxiliar, data_r, a_nome, natureza, ext_nat, data_p, registro FROM td_cert')
  else
    Dm.ArqAux.Sql.Add('SELECT anotacao, p_auxiliar, data_r, a_nome, natureza, ext_nat, data_p, registro FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('registro = ' + Trim(MaskEdit1.Text));
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) or (MaskEdit1.Text = '0') then
  begin
    Dm.ArqAux.Close;
    if (tela <> 'retroativo') and (MessageBox(Handle, PChar('Registro n�o encontrado! Deseja buscar retroativo?'), 'ANOTA��ES', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('SELECT anotacao, p_auxiliar, data_r, nome as a_nome, natureza, ext_nat, data_p, registro FROM td_cert');
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('registro = ' + Trim(MaskEdit1.Text));
      Dm.ArqAux.Sql.Add('limit 1'); //Pegando apenas o 1� no caso de mais de um registro com o mesmo n�mero
      Dm.ArqAux.Open;

      if (Dm.ArqAux.RecordCount = 0) then
      begin
        Dm.ArqAux.Close;
        MessageBox(Handle, PChar('Registro n�o encontrado !'), 'PESQUISA', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
        MaskEdit1.SetFocus;
        Exit;
      end
      else
        retro := True;
    end
    else
    begin
      MaskEdit1.SetFocus;
      if tela = 'retroativo' then
        MessageBox(Handle, PChar('Registro n�o encontrado !'), 'PESQUISA', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
      Exit;
    end;
  end;
  MaskEdit1.Enabled := False;
  RichEdit1.Text    := Dm.ArqAux.FieldByName('anotacao').asString;
  Label7.Caption    := Dm.ArqAux.FieldByName('p_auxiliar').asstring + ' do dia ' + Dm.ArqAux.FieldByName('data_r').asString;
  Label8.Caption    := Dm.ArqAux.FieldByName('a_nome').asstring;
  Label9.Caption    := Dm.ArqAux.FieldByName('natureza').asstring + ' - ' + Dm.ArqAux.FieldByName('ext_nat').asString;
  Label10.Caption   := Dm.ArqAux.FieldByName('data_p').asstring;
  Dm.ArqAux.Close;
  {Dm.PessAux.Close;
  Dm.PessAux.Sql.Clear;
  Dm.PessAux.Sql.Add('SELECT situacao, nome');
  if (retro) or (tela = 'retroativo') then
    Dm.PessAux.Sql.Add('FROM td_cert')
  else
    Dm.PessAux.Sql.Add('FROM td_pesso');
  Dm.PessAux.Sql.Add('WHERE');
  Dm.PessAux.Sql.Add('registro = ' + Trim(MaskEdit1.Text));
  Dm.PessAux.Open;}
  BitBtn1.Enabled   := True;
  RichEdit1.SetFocus;
end;

procedure TF_Anot.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key =13 then bitbtn2.setfocus;
  if key = 27 then close;
end;

procedure TF_Anot.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then F_Anot.BitBtn3Click(F_Anot);
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_Anot.BitBtn1Click(Sender: TObject);
begin
  if (Trim(RichEdit1.Text) <> '') then
  begin
    if (MessageBox(Handle, PChar('Gravar esta anota��o � margem do registro n� ' + Trim(MaskEdit1.Text) + ' ?'), 'ANOTA��ES', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
    begin
      if (tela <> 'retroativo') then
      begin
      // Gravando no td
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.Add('UPDATE td SET');
      Dm.ArqAux.Sql.Add('anotacao  = ' + Chr(39) + Trim(RichEdit1.Text) + Chr(39));
      Dm.ArqAux.Sql.Add('WHERE');
      Dm.ArqAux.Sql.Add('registro = ' + Trim(MaskEdit1.Text));
      try
        Dm.ArqAux.ExecSql;
        // Gravando no td_cert
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('UPDATE td_cert SET');
        Dm.ArqAux.Sql.Add('anotacao  = ' + Chr(39) + Trim(RichEdit1.Text) + Chr(39));
        Dm.ArqAux.Sql.Add('WHERE');
        Dm.ArqAux.Sql.Add('registro = ' + Trim(MaskEdit1.Text));
        Dm.ArqAux.ExecSql;
        Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Gravada anota��o � margem ', MaskEdit1.Text);
        Showmessage('Grava��o Ok !');
      except
        Showmessage('Problemas para efetuar a grava��o !');
      end;
      BitBtn3Click(F_Anot);
      end
      else
      begin
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('UPDATE td_cert SET');
        Dm.ArqAux.Sql.Add('anotacao  = ' + Chr(39) + Trim(RichEdit1.Text) + Chr(39));
        Dm.ArqAux.Sql.Add('WHERE');
        Dm.ArqAux.Sql.Add('registro = ' + Trim(MaskEdit1.Text));
        try
          Dm.ArqAux.ExecSql;
        finally
          Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Gravada anota��o � margem ', MaskEdit1.Text);
          Showmessage('Grava��o Ok !');
        end;  
      end;
    end;
  end;
end;

procedure TF_Anot.FormActivate(Sender: TObject);
begin
  if (MaskEdit1.Text <> '') then
    if not chamada_externa then
    begin
      BitBtn2.Enabled     := False;
      BitBtn3.Enabled     := False;
      F_Anot.BitBtn2Click(F_Anot);
    end
    else
    begin
      BitBtn2.Enabled     := True;
      BitBtn3.Enabled     := True;
      F_Anot.BitBtn2Click(F_Anot);
    end
  else
  begin
    Limpa_Tela(F_Anot);
    MaskEdit1.SetFocus;
  end;  
end;

procedure TF_Anot.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
  if key = 27 then RichEdit1.setfocus;
end;

procedure TF_Anot.Carrega_Pessoal(Sender: TObject; Pesquisa: Boolean);
begin
  if (Pesquisa) then
  begin
    Dm.PessAux.Close;
    Dm.PessAux.Sql.Clear;
    Dm.PessAux.Sql.Add('SELECT situacao, nome');
    Dm.PessAux.Sql.Add('FROM td_pesso');
    Dm.PessAux.Sql.Add('WHERE');
    Dm.PessAux.Sql.Add('registro = ' + Trim(MaskEdit1.Text));
    Dm.PessAux.Open;
  end;
end;

end.
