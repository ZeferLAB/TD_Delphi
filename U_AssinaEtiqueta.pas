unit U_AssinaEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, jpeg, ExtCtrls, ComCtrls;

type
  TF_AssinaEtiqueta = class(TForm)
    Label4: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label6: TLabel;
    ControlBar1: TControlBar;
    Label36: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_AssinaEtiqueta: TF_AssinaEtiqueta;

implementation

uses DMTD, Menu, FuncGeral;

{$R *.DFM}

procedure TF_AssinaEtiqueta.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_AssinaEtiqueta.FormDestroy(Sender: TObject);
begin
  Sender:= Nil;
end;

procedure TF_AssinaEtiqueta.FormShow(Sender: TObject);
begin
  Dm.Usuarios.Close;
  Dm.Usuarios.Sql.Clear;
  Dm.Usuarios.Sql.Add('SELECT u_nome,cargo FROM usuarios');
  Dm.Usuarios.Sql.Add('WHERE');
  Dm.Usuarios.Sql.Add('assina = "S"');
  Dm.Usuarios.Open;

  Dm.Usuarios.First;

  if (Dm.Usuarios.RecordCount <> 0) then
  begin
    while (not Dm.Usuarios.Eof) do
    begin
      if (ComboBox1.Text = '') then ComboBox1.Text := UnCript(Dm.Usuarios.FieldByName('u_nome').AsString);
        ComboBox1.Items.Add(UnCript(Dm.Usuarios.FieldByName('u_nome').AsString));

      if (F_Menu.Label45.Caption = 'S') then
      begin
        ComboBox1.Text := F_Menu.Label25.Caption;
      end;
      //if (ComboBox2.Text = '') then
      ComboBox2.Items.Add(Dm.Usuarios.FieldByName('cargo').AsString);
      //ComboBox2.Text := F_Menu.Label46.Caption;
    Dm.Usuarios.Next;
    end;

  End;
end;

procedure TF_AssinaEtiqueta.BitBtn1Click(Sender: TObject);
begin
  sAssinaturaEtiqueta:= ComboBox1.Text;
  sCargoEtiqueta     := ComboBox2.Text;

  Close;
     
end;

end.
