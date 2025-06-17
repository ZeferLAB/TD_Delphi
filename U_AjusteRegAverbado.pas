unit U_AjusteRegAverbado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, jpeg, ExtCtrls, Db, DBTables, Grids, DBGrids, Mask,
  DBCtrls, Buttons;

type
  TF_AjusteRegAverbado = class(TForm)
    ControlBar1: TControlBar;
    Label34: TLabel;
    qryTitulo: TQuery;
    Ds_Titulo: TDataSource;
    qryTitulorecno: TIntegerField;
    qryTituloregistro: TIntegerField;
    qryTituloaverba: TStringField;
    qryTitulop_auxiliar: TIntegerField;
    qryTitulosequencia_averbacao: TIntegerField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    StatusBar2: TStatusBar;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    qryTituloa_nome: TStringField;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    BitBtn7: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    qryTitulodata_p: TDateField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_AjusteRegAverbado: TF_AjusteRegAverbado;

implementation

uses DMTD, Menu;

{$R *.DFM}

procedure TF_AjusteRegAverbado.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePage:= TabSheet1;
end;

procedure TF_AjusteRegAverbado.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' Then
  Begin
    qryTitulo.Close;
    qryTitulo.SQL.Clear;
    qryTitulo.SQL.Add(' Select recno, data_p, a_nome, registro, averba, p_auxiliar, sequencia_averbacao From td where tipo_reg = '+QuotedStr('Av.')+' and p_auxiliar like '+QuotedStr(Edit1.Text+'%')+' order by p_auxiliar asc');
    qryTitulo.Open;
  End;
                      
end;

procedure TF_AjusteRegAverbado.BitBtn7Click(Sender: TObject);
begin
  if BitBtn7.Caption <> 'Gravar' Then
  Begin
    BitBtn7.Caption := 'Gravar';
    DBEdit3.ReadOnly:= False;
    qryTitulo.Edit;
  End
  Else
  if BitBtn7.Caption = 'Gravar' Then
  Begin

    if DBEdit2.Text = '' Then
    Begin
      ShowMessage('Campo: Protocolo, deve ser preenchido!');
      Abort;
    End;


    if DBEdit1.Text = '' Then
    Begin
      ShowMessage('Campo: Registro, deve ser preenchido!');
      Abort;
    End;

    if DBEdit3.Text = '' Then
    Begin
      ShowMessage('Campo: Seq. Averbação, deve ser preenchido!');
      Abort;
    End;

    qryTitulo .Post;
    Application.MessageBox('Registro salvo com sucesso!', 'Ajuste', Mb_IconInformation);
    BitBtn2.OnClick(Nil);
  End;

end;

procedure TF_AjusteRegAverbado.BitBtn2Click(Sender: TObject);
begin
  BitBtn7.Caption := 'Alterar';
  DBEdit3.ReadOnly:= True;
  qryTitulo.Cancel;
end;

procedure TF_AjusteRegAverbado.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TF_AjusteRegAverbado.DBEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    perform(wm_nextdlgctl,0,0);
  end;
end;

procedure TF_AjusteRegAverbado.FormShow(Sender: TObject);
begin
  if F_Menu.Label56.Caption = 'T' Then
  Begin
    DBEdit3.DataField:= 'sequencia_averbacao';
  End
  Else
  Begin
    DBEdit3.DataField:= 'averba';
  End;
end;

end.
