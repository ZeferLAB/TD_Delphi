unit U_IncluiImagemEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask;

type
  TF_IncluiImagemEditor = class(TForm)
    Label1: TLabel;
    MkNumero: TMaskEdit;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    lbMsg: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MkNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_IncluiImagemEditor: TF_IncluiImagemEditor;

implementation

uses u_editor, DMTD;

{$R *.DFM}

procedure TF_IncluiImagemEditor.BitBtn1Click(Sender: TObject);
begin
  if MkNumero.Text = '' Then
  Begin
    Application.messagebox(pchar('Informe o número do registro para prosseguir!'),'ATENÇÃO', MB_ICONINFORMATION);
    Abort;
  End
  Else
  Begin
    lbMsg.Caption:= 'Processando as imagens, por favor, aguarde ...';
    F_IncluiImagemEditor.Refresh;
    F_editor.VerificaArquivosBMP(Dm.Dir_CamImagensNotificBMP, MkNumero.Text);
  End;

end;

procedure TF_IncluiImagemEditor.FormDestroy(Sender: TObject);
begin
  Sender:= Nil;
end;

procedure TF_IncluiImagemEditor.MkNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then
    bitbtn1.onClick(Sender);
                 
end;

end.
