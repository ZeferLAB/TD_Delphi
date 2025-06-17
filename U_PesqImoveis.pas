unit U_PesqImoveis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, jpeg, ExtCtrls, Buttons, Grids, DBGrids;

type
  TF_PesqImoveis = class(TForm)
    ControlBar1: TControlBar;
    Label36: TLabel;
    DBGrid1: TDBGrid;
    BitBtn8: TBitBtn;
    cbCampoPesquisa: TComboBox;
    EdNome: TEdit;
    Label24: TLabel;
    spbPesquisa: TSpeedButton;
    procedure BitBtn8Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbCampoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PesqImoveis: TF_PesqImoveis;

implementation

uses DMTD, U_CadImoveis;

{$R *.DFM}

procedure TF_PesqImoveis.BitBtn8Click(Sender: TObject);
begin
  Close;
end;

procedure TF_PesqImoveis.DBGrid1DblClick(Sender: TObject);
begin
  F_CadImoveis.Carregar(F_CadImoveis);;

  Close;

end;

procedure TF_PesqImoveis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //F_CadImoveis.Atualizar(Nil, False);
end;

procedure TF_PesqImoveis.spbPesquisaClick(Sender: TObject);
begin
  if cbCampoPesquisa.Text = '' Then
  Begin
    Application.MessageBox('Selecione um campo para realizar o filtro e logo em seguida digite o valor da pesquisa!' , 'Mensagem do Sistema', mb_ok);
    Abort;
  End;

  if EdNome.Text = '' Then
  Begin
    Application.MessageBox('Selecione um campo para realizar o filtro e logo em seguida digite o valor da pesquisa!' , 'Mensagem do Sistema', mb_ok);
    Abort;
  End;

  Dm.qryCadImoveis.Close;
  Dm.qryCadImoveis.SQL.Clear;
  Dm.qryCadImoveis.SQL.Add('SELECT * FROM imoveis WHERE ' +cbCampoPesquisa.Text+ ' like '+QuotedStr('%'+EdNome.Text+'%')+' ');
  Dm.qryCadImoveis.Open;
end;

procedure TF_PesqImoveis.FormCreate(Sender: TObject);
begin  
  If Dm.sNumeroProcoloDOI <> '' Then
  Begin
    Dm.qryCadImoveis.Close;
    Dm.qryCadImoveis.SQL.Clear;
    Dm.qryCadImoveis.SQL.Add('SELECT * FROM imoveis WHERE codprotocolo = '+QuotedStr(Dm.sNumeroProcoloDOI)+'');
    Dm.qryCadImoveis.Open;
  End; 
end;

procedure TF_PesqImoveis.cbCampoPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    EdNome.SetFocus;
end;

procedure TF_PesqImoveis.EdNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    spbPesquisa.Click;

end;

procedure TF_PesqImoveis.FormShow(Sender: TObject);
begin
  cbCampoPesquisa.SetFocus;
end;

end.
