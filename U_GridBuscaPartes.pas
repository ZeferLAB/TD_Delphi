unit U_GridBuscaPartes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls, Db, DBTables, Grids, DBGrids;

type
  TF_GridBuscaPartes = class(TForm)
    DBGrid1: TDBGrid;
    qryBuscaPartes: TQuery;
    Dts_BuscaDajes: TDataSource;
    StatusBar1: TStatusBar;
    Label12: TLabel;
    MaskEdit17: TMaskEdit;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit17Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure MaskEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_GridBuscaPartes: TF_GridBuscaPartes;

implementation

uses Exame, FuncGeral, DMTD;

{$R *.DFM}

procedure TF_GridBuscaPartes.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_GridBuscaPartes.MaskEdit17Change(Sender: TObject);
begin
  if MaskEdit17.Text <> '' Then
  Begin
    qryBuscaPartes.Close;
    qryBuscaPartes.SQL.Clear;
    qryBuscaPartes.SQL.Add('select p_auxiliar, tip_doc1, doc1, nome, tip_doc2, doc2, endereco, numero,  '+
                          'bairro, cidade, estado, profissao, nacionalidade, estcivil, cep,'+
                          'complem, situacao  from td_pesso where nome like '+QuotedStr(MaskEdit17.Text+'%')+' group by nome');
    qryBuscaPartes.Open;
  End
  Else
  Begin
    qryBuscaPartes.Close;
    qryBuscaPartes.SQL.Clear;
    qryBuscaPartes.SQL.Add('select p_auxiliar, tip_doc1, doc1, nome, tip_doc2, doc2, endereco, numero,  '+
                          'bairro, cidade, estado, profissao, nacionalidade, estcivil, cep,'+
                          'complem, situacao  from td_pesso where recno = '+QuotedStr('0')+'');
    qryBuscaPartes.Open;
  End;
end;

procedure TF_GridBuscaPartes.DBGrid1DblClick(Sender: TObject);
begin
  F_Exame.MaskEdit17.Text:= qryBuscaPartes.FieldByName('nome').AsString;

  F_Exame.MaskEdit27.EditMask := '';
  F_Exame.MaskEdit27.Text := qryBuscaPartes.FieldByName('doc1').AsString;
  if (qryBuscaPartes.FieldByName('tip_doc1').AsString = 'CPF') then
    F_Exame.MaskEdit27.EditMask := '###.###.###-##'
  else
  F_Exame.MaskEdit27.EditMask := '##.###.###/####-##';

  F_Exame.ComboBox2.Text  := qryBuscaPartes.FieldByName('tip_doc2').asString;
  F_Exame.MaskEdit28.Text := qryBuscaPartes.FieldByName('doc2').asString;
  F_Exame.MaskEdit18.Text := qryBuscaPartes.FieldByName('endereco').asString;
  F_Exame.MaskEdit3.Text  := qryBuscaPartes.FieldByName('numero').asString;
  F_Exame.MaskEdit19.Text := qryBuscaPartes.FieldByName('bairro').asString;
  F_Exame.MaskEdit20.Text := qryBuscaPartes.FieldByName('cidade').asString;
  F_Exame.MaskEdit21.Text := qryBuscaPartes.FieldByName('estado').asString;
  F_Exame.MaskEdit36.Text := qryBuscaPartes.FieldByName('profissao').asString;
  F_Exame.MaskEdit37.Text := qryBuscaPartes.FieldByName('nacionalidade').asString;
  F_Exame.ComboBox9.Text  := qryBuscaPartes.FieldByName('estcivil').asString;
  F_Exame.MaskEdit22.EditMask := '';
  F_Exame.MaskEdit22.Text := qryBuscaPartes.FieldByName('cep').asString;
  F_Exame.MaskEdit22.EditMask := '#####-###';
  F_Exame.MaskEdit25.Text := qryBuscaPartes.FieldByName('complem').asString;
  F_Exame.ComboBox7.Text  := Ver_Situacao(qryBuscaPartes.FieldByName('situacao').asString, True);
  Close;
end;

procedure TF_GridBuscaPartes.MaskEdit17KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
  Begin
    F_Exame.MaskEdit17.Text:= qryBuscaPartes.FieldByName('nome').AsString;

    F_Exame.MaskEdit27.EditMask := '';
    F_Exame.MaskEdit27.Text := qryBuscaPartes.FieldByName('doc1').AsString;
    if (qryBuscaPartes.FieldByName('tip_doc1').AsString = 'CPF') then
      F_Exame.MaskEdit27.EditMask := '###.###.###-##'
    else
    F_Exame.MaskEdit27.EditMask := '##.###.###/####-##';

    F_Exame.ComboBox2.Text  := qryBuscaPartes.FieldByName('tip_doc2').asString;
    F_Exame.MaskEdit28.Text := qryBuscaPartes.FieldByName('doc2').asString;
    F_Exame.MaskEdit18.Text := qryBuscaPartes.FieldByName('endereco').asString;
    F_Exame.MaskEdit3.Text  := qryBuscaPartes.FieldByName('numero').asString;
    F_Exame.MaskEdit19.Text := qryBuscaPartes.FieldByName('bairro').asString;
    F_Exame.MaskEdit20.Text := qryBuscaPartes.FieldByName('cidade').asString;
    F_Exame.MaskEdit21.Text := qryBuscaPartes.FieldByName('estado').asString;
    F_Exame.MaskEdit36.Text := qryBuscaPartes.FieldByName('profissao').asString;
    F_Exame.MaskEdit37.Text := qryBuscaPartes.FieldByName('nacionalidade').asString;
    F_Exame.ComboBox9.Text  := qryBuscaPartes.FieldByName('estcivil').asString;
    F_Exame.MaskEdit22.EditMask := '';
    F_Exame.MaskEdit22.Text := qryBuscaPartes.FieldByName('cep').asString;
    F_Exame.MaskEdit22.EditMask := '#####-###';
    F_Exame.MaskEdit25.Text := qryBuscaPartes.FieldByName('complem').asString;
    F_Exame.ComboBox7.Text  := Ver_Situacao(qryBuscaPartes.FieldByName('situacao').asString, True);

    Close;
  End;
end;

procedure TF_GridBuscaPartes.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
  begin
    F_Exame.MaskEdit17.Text:= qryBuscaPartes.FieldByName('nome').AsString;

    F_Exame.MaskEdit27.EditMask := '';
    F_Exame.MaskEdit27.Text := qryBuscaPartes.FieldByName('doc1').AsString;
    if (qryBuscaPartes.FieldByName('tip_doc1').AsString = 'CPF') then
      F_Exame.MaskEdit27.EditMask := '###.###.###-##'
    else
    F_Exame.MaskEdit27.EditMask := '##.###.###/####-##';

    F_Exame.ComboBox2.Text  := qryBuscaPartes.FieldByName('tip_doc2').asString;
    F_Exame.MaskEdit28.Text := qryBuscaPartes.FieldByName('doc2').asString;
    F_Exame.MaskEdit18.Text := qryBuscaPartes.FieldByName('endereco').asString;
    F_Exame.MaskEdit3.Text  := qryBuscaPartes.FieldByName('numero').asString;
    F_Exame.MaskEdit19.Text := qryBuscaPartes.FieldByName('bairro').asString;
    F_Exame.MaskEdit20.Text := qryBuscaPartes.FieldByName('cidade').asString;
    F_Exame.MaskEdit21.Text := qryBuscaPartes.FieldByName('estado').asString;
    F_Exame.MaskEdit36.Text := qryBuscaPartes.FieldByName('profissao').asString;
    F_Exame.MaskEdit37.Text := qryBuscaPartes.FieldByName('nacionalidade').asString;
    F_Exame.ComboBox9.Text  := qryBuscaPartes.FieldByName('estcivil').asString;
    F_Exame.MaskEdit22.EditMask := '';
    F_Exame.MaskEdit22.Text := qryBuscaPartes.FieldByName('cep').asString;
    F_Exame.MaskEdit22.EditMask := '#####-###';
    F_Exame.MaskEdit25.Text := qryBuscaPartes.FieldByName('complem').asString;
    F_Exame.ComboBox7.Text  := Ver_Situacao(qryBuscaPartes.FieldByName('situacao').asString, True);
    F_Exame.MaskEdit37.SetFocus;
    Close;
  end

end;

end.
