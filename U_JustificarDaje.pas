unit U_JustificarDaje;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TF_JustificarDaje = class(TForm)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    id_daje, emis, serie, numero : integer;
    { Public declarations }
  end;

var
  F_JustificarDaje: TF_JustificarDaje;
  codigo, descricao : string;

implementation

{$R *.DFM}

uses U_Daje, U_ConsDaje;

procedure TF_JustificarDaje.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_JustificarDaje.FormActivate(Sender: TObject);
var
 texto : widestring;
begin
  Memo1.Clear;
  Memo1.Text := CodJustificativas;

  while (Pos('<id>', Memo1.Text) > 0) do
  begin
    descricao  := Copy(Memo1.Text, Pos('<descricao>', Memo1.Text) + 11, Pos('</descricao>', Memo1.Text) - Pos('<descricao>', Memo1.Text) - 11);
    codigo     := Copy(Memo1.Text, Pos('<id>', Memo1.Text) + 4, Pos('</id>', Memo1.Text) - Pos('<id>', Memo1.Text) - 4);
    Memo1.Text := Copy(Memo1.Text, Pos('</id>', Memo1.Text) + 5, Length(Memo1.Text) - Pos('</id>', Memo1.Text) - 5);
    ComboBox1.Items.Add(codigo + ' - ' + descricao);
  end;
end;

procedure TF_JustificarDaje.BitBtn1Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex = -1 then
  begin
    Application.Messagebox('Informe a justificativa!', 'Justificar Daje', Mb_IconInformation);
    ComboBox1.SetFocus;
    Exit;
  end;

  if Application.MessageBox('Justificar Daje?', 'Justificar Daje', Mb_IconQuestion + Mb_YesNo) = Id_Yes then
  begin
    if JustificarDaje(emis, serie, numero, StrToInt(codigo)) then
    begin
      try
         //LogDaje(DateToStr(Date), TimeToStr(time), IntToStr(id_daje), Configur.usuario, 'Daje Justificado');
      except
         Application.MessageBox('Falha ao gravar log do Daje', 'Justificar Daje', Mb_IconInformation);
      end;
    end;
    
    F_ConsDaje.BitBtn1.OnClick(Self);
  end;
end;

end.
