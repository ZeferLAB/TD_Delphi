unit pcontrat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  Tf_pcont = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    Bevel1: TBevel;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_pcont: Tf_pcont;

implementation

uses Tabelas, Func;

{$R *.DFM}

procedure Tf_pcont.FormActivate(Sender: TObject);
begin
  MaskEdit1.SetFocus;
end;

procedure Tf_pcont.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then
   begin
    Funcoes.Abre_TDClick(Funcoes);
    Tabela.Td.SetOrder(7);
    if (Tabela.Td.Seek(MaskEdit1.Text) = true) and (tabela.td.fieldbyname('contrato').asstring = maskedit1.text) then
     begin
       MaskEdit2.Text := Tabela.td.fieldbyname('p_auxiliar').AsString;
       MaskEdit3.Text := Tabela.td.fieldbyname('protocolo').AsString;
       MaskEdit4.Text := Tabela.td.fieldbyname('registro').AsString;
       MaskEdit5.Text := Tabela.td.fieldbyname('data_p').AsString;
       BitBtn1.SetFocus;
     end
    else ShowMessage(' Contrato não localizado ');
   end;
end;

procedure Tf_pcont.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tf_pcont.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Funcoes.Fecha_TDClick(Funcoes);
end;

end.
