unit U_CadLivroE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TF_CadLivroE = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Memo2: TMemo;
    Label5: TLabel;
    Memo3: TMemo;
    Label6: TLabel;
    Memo4: TMemo;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_CadLivroE: TF_CadLivroE;

implementation

uses DMTD, Exame;


{$R *.DFM}

procedure TF_CadLivroE.FormActivate(Sender: TObject);
begin

  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  Memo3.Lines.Clear;
  Memo4.Lines.Clear;

  Label2.Caption := F_Exame.MaskEdit1.Text;

  DM.Qry_td_livroe.Close;
  DM.Qry_td_livroe.Sql.Clear;
  DM.Qry_td_livroe.Sql.Add('SELECT * FROM td_livroe WHERE protocolo = ' + #39 + F_Exame.MaskEdit1.Text + #39);
  DM.Qry_td_livroe.Open;
  DM.Qry_td_livroe.FindFirst;

  Memo1.Lines.Add(DM.Qry_td_livroe.FieldByname('identific').AsString);
  Memo2.Lines.Add(DM.Qry_td_livroe.FieldByname('marca').AsString);
  Memo3.Lines.Add(DM.Qry_td_livroe.FieldByname('anotacao').AsString);
  Memo4.Lines.Add(DM.Qry_td_livroe.FieldByname('onus').AsString);

  Panel1.Enabled := False;

  BitBtn1.SetFocus;
end;

procedure TF_CadLivroE.DBGrid1CellClick(Column: TColumn);
begin

  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  Memo3.Lines.Clear;
  Memo4.Lines.Clear;

  Memo1.Lines.Add(DM.Qry_td_livroe.FieldByname('identific').AsString);
  Memo2.Lines.Add(DM.Qry_td_livroe.FieldByname('marca').AsString);
  Memo3.Lines.Add(DM.Qry_td_livroe.FieldByname('anotacao').AsString);
  Memo4.Lines.Add(DM.Qry_td_livroe.FieldByname('onus').AsString);
end;

procedure TF_CadLivroE.BitBtn1Click(Sender: TObject);
begin
  If BitBtn1.Caption = '&Incluir' then
  Begin
    Bitbtn1.Caption := '&Gravar';
    BitBtn2.Enabled := False;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    Panel1.Enabled  := True;

    Memo1.Lines.Clear;
    Memo2.Lines.Clear;
    Memo3.Lines.Clear;
    Memo4.Lines.Clear;

    Memo1.SetFocus;
  End
  Else
  Begin
    if messageDlg('Dados Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      DM.Qry_td_livroe.Close;
      DM.Qry_td_livroe.Sql.Clear;
      DM.Qry_td_livroe.Sql.Add('INSERT INTO td_livroe (protocolo, identific, marca, anotacao, onus)');
      DM.Qry_td_livroe.Sql.Add(' VALUES (');
      DM.Qry_td_livroe.Sql.Add(QuotedStr(Label2.Caption) + ',');
      DM.Qry_td_livroe.Sql.Add(QuotedStr(Trim(Memo1.Text)) + ',');
      DM.Qry_td_livroe.Sql.Add(QuotedStr(Trim(Memo2.Text)) + ',');
      DM.Qry_td_livroe.Sql.Add(QuotedStr(Trim(Memo3.Text)) + ',');
      DM.Qry_td_livroe.Sql.Add(QuotedStr(Trim(Memo4.Text)) + ' ');
      DM.Qry_td_livroe.Sql.Add(')');
      Try
        DM.Qry_td_livroe.ExecSQL;
      Except
        ShowMessage('Problemas para gravar os dados.');
      End;
    End;
    Bitbtn1.Caption := '&Incluir';
    BitBtn2.Enabled := True;
    BitBtn3.Enabled := True;
    BitBtn4.Enabled := True;
    Panel1.Enabled  := False;

    DM.Qry_td_livroe.Close;
    DM.Qry_td_livroe.Sql.Clear;
    DM.Qry_td_livroe.Sql.Add('SELECT * FROM td_livroe WHERE protocolo = ' + #39 + F_Exame.MaskEdit1.Text + #39);
    DM.Qry_td_livroe.Open;
    DM.Qry_td_livroe.FindFirst;

    Memo1.Lines.Clear;
    Memo2.Lines.Clear;
    Memo3.Lines.Clear;
    Memo4.Lines.Clear;

    Memo1.Lines.Add(DM.Qry_td_livroe.FieldByname('identific').AsString);
    Memo2.Lines.Add(DM.Qry_td_livroe.FieldByname('marca').AsString);
    Memo3.Lines.Add(DM.Qry_td_livroe.FieldByname('anotacao').AsString);
    Memo4.Lines.Add(DM.Qry_td_livroe.FieldByname('onus').AsString);
  End;
end;

procedure TF_CadLivroE.BitBtn2Click(Sender: TObject);
begin
  If BitBtn2.Caption = '&Corrigir' then
  Begin
    Bitbtn2.Caption := '&Gravar';
    BitBtn1.Enabled := False;
    BitBtn3.Enabled := False;
    BitBtn4.Enabled := False;
    Panel1.Enabled  := True;
    Memo1.SetFocus;
  End
  Else
  Begin
    if messageDlg('Dados Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    Begin
      DM.ArqAux.Close;
      DM.ArqAux.Sql.Clear;
      DM.ArqAux.Sql.Add('UPDATE td_livroe SET ');
      DM.ArqAux.Sql.Add(' protocolo = ' + QuotedStr(Label2.Caption) + ',');
      DM.ArqAux.Sql.Add(' identific = ' + QuotedStr(Trim(Memo1.Text)) + ',');
      DM.ArqAux.Sql.Add(' marca     = ' + QuotedStr(Trim(Memo2.Text)) + ',');
      DM.ArqAux.Sql.Add(' anotacao  = ' + QuotedStr(Trim(Memo3.Text)) + ',');
      DM.ArqAux.Sql.Add(' onus      = ' + QuotedStr(Trim(Memo4.Text)) + ' ');

      DM.ArqAux.Sql.Add(' WHERE id = ' + DM.Qry_td_livroe.FieldByName('id').AsString);
      Try
        DM.ArqAux.ExecSql;
      Except
        ShowMessage('Problemas para corrigir os dados.');
      End;
    End;
    Bitbtn2.Caption := '&Corrigir';
    BitBtn1.Enabled := True;
    BitBtn3.Enabled := True;
    BitBtn4.Enabled := True;
    Panel1.Enabled  := False;

    DM.Qry_td_livroe.Close;
    DM.Qry_td_livroe.Sql.Clear;
    DM.Qry_td_livroe.Sql.Add('SELECT * FROM td_livroe WHERE protocolo = ' + #39 + F_Exame.MaskEdit1.Text + #39);
    DM.Qry_td_livroe.Open;
    DM.Qry_td_livroe.FindFirst;

    Memo1.Lines.Clear;
    Memo2.Lines.Clear;
    Memo3.Lines.Clear;
    Memo4.Lines.Clear;

    Memo1.Lines.Add(DM.Qry_td_livroe.FieldByname('identific').AsString);
    Memo2.Lines.Add(DM.Qry_td_livroe.FieldByname('marca').AsString);
    Memo3.Lines.Add(DM.Qry_td_livroe.FieldByname('anotacao').AsString);
    Memo4.Lines.Add(DM.Qry_td_livroe.FieldByname('onus').AsString);
  End;
end;

procedure TF_CadLivroE.BitBtn3Click(Sender: TObject);
begin
  if messageDlg('Deseja efetuar Exclusão ?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('DELETE FROM td_livroe WHERE id = ' + DM.Qry_td_livroe.FieldByName('id').AsString);
    Try
      Dm.ArqAux.ExecSql;
    Except
      ShowMessage('Problemas para excluir os dados.');
    End;
    DM.ArqAux.Close;
    DM.ArqAux.Sql.Clear;
    DM.ArqAux.Sql.Add('SELECT * FROM td_livroe WHERE protocolo = ' + #39 + F_Exame.MaskEdit1.Text + #39);
    DM.ArqAux.Open;

    DM.Qry_td_livroe.Close;
    DM.Qry_td_livroe.Sql.Clear;
    DM.Qry_td_livroe.Sql.Add('SELECT * FROM td_livroe WHERE protocolo = ' + #39 + F_Exame.MaskEdit1.Text + #39);
    DM.Qry_td_livroe.Open;
    DM.Qry_td_livroe.FindFirst;

    Memo1.Lines.Clear;
    Memo2.Lines.Clear;
    Memo3.Lines.Clear;
    Memo4.Lines.Clear;

    Memo1.Lines.Add(DM.Qry_td_livroe.FieldByname('identific').AsString);
    Memo2.Lines.Add(DM.Qry_td_livroe.FieldByname('marca').AsString);
    Memo3.Lines.Add(DM.Qry_td_livroe.FieldByname('anotacao').AsString);
    Memo4.Lines.Add(DM.Qry_td_livroe.FieldByname('onus').AsString);
  End;
end;

procedure TF_CadLivroE.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

end.
