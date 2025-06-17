unit RTER;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers, ValorPor, jpeg;

type
  TF_RTer = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    Label5: TLabel;
    MaskEdit1: TMaskEdit;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit3: TMaskEdit;
    ValorPorExtenso1: TValorPorExtenso;
    Label2: TLabel;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label6: TLabel;
    MaskEdit4: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RTer: TF_RTer;
  col, lin, pulo : Integer;
  old_font : String;

implementation

uses Menu, Func, u_editor, DMTD;

{$R *.DFM}
Function Strzero(Numero : String;Casas : Integer) : String;
var
  zeros : String;
Begin
  zeros := '00000000000000000000000000000000000000000';
  result := copy(zeros,1,casas) + numero;
  result := copy(result, length(result) - (casas - 1), casas);
end;

procedure TF_RTer.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TF_RTer.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then
    begin
      try
        strtodate(maskedit1.text);
      except
        showmessage('Data inválida !!!');
        maskedit1.setfocus;
        exit;
      end;
      maskedit3.setfocus;
    end;
end;

procedure TF_RTer.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then Maskedit2.setfocus;
end;

procedure TF_RTer.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_RTer.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit3.text := '';
  maskedit1.setfocus;
end;

procedure TF_RTer.BitBtn1Click(Sender: TObject);
begin
  try
    strtodate(maskedit1.text);
  except
    showmessage('Data inválida !!!');
    maskedit1.setfocus;
    exit;
  end;

  if trim(maskedit3.text) = '' then
  Begin
    showmessage('Número do Livro não especificado');
    maskedit3.setfocus;
    exit;
  end;
  if trim(combobox1.text) = '' then
  Begin
    showmessage('Tipo Livro não especificado');
    combobox1.setfocus;
    exit;
  end;
  if messagedlg('Impressora Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then exit;
  Screen.cursor := crhourglass;
  statusbar1.simpletext := 'Imprimindo...';
  statusbar1.update;

  // Carregando Modelo
  f_editor.WPRichText1.Clear;
//  getdir(0,cam);

  arq_modelo := combobox2.items.strings[combobox1.itemindex];
//  cam2 := cam + '\modelos\' + arq_modelo;
//  cam2 := caminho + '\modelos\' + arq_modelo;
  caminho2 := F_Menu.Label16.Caption + arq_modelo;
//  chdir(cam);
//  chdir(caminho);
  //
//  f_editor.wprichtext1.loadfromfile(cam2);
  f_editor.wprichtext1.loadfromfile(caminho2);
  // Iniciando as trocas
  troca('<livro>',maskedit3.text + '-' + maskedit2.text);
  troca('<folha>',maskedit4.text);
  troca('<data>',F_Menu.Label7.Caption + ', ' + FormatDateTime('dd " de " mmmm " de " yyyy', StrToDate(MaskEdit1.Text)));
  f_editor.wprichtext1.print;
  //
  statusbar1.simpletext := 'Fim do Relatório';
  statusbar1.update;
  Screen.cursor := crdefault;
  bitbtn3.setfocus;
end;

procedure TF_RTer.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit4.setfocus;
end;

procedure TF_RTer.FormActivate(Sender: TObject);
begin
  combobox1.Items.clear;
  combobox2.Items.clear;
  Dm.Modelos.Close;
  Dm.Modelos.Sql.Clear;
  Dm.Modelos.Sql.Add('Select * From modelos');
  Dm.Modelos.Sql.Add('Where tipo = ' + CHR(39) + 'TERMO' + CHR(39));
  Dm.Modelos.Sql.Add(' order by tipo, nome');
  Dm.Modelos.Open;
  if (Dm.Modelos.RecordCount <> 0) then
  begin
    while (not Dm.modelos.eof) do
    begin
      combobox1.items.add(Dm.modelos.fieldbyname('nome').asstring);
      combobox2.items.add(Dm.modelos.fieldbyname('arquivo').asstring);
      Dm.modelos.next;
    end;
  Dm.Modelos.Close;
  end;
end;

procedure TF_RTer.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then combobox1.setfocus;
end;

end.
