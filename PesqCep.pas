unit PesqCep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, Menus, jpeg;

type
  TF_PesqCep = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    PopupMenu1: TPopupMenu;
    Incluir1: TMenuItem;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Incluir1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_PesqCep: TF_PesqCep;

implementation

uses DMTD, Menu, Exame, FuncGeral;

{$R *.DFM}

procedure TF_PesqCep.BitBtn2Click(Sender: TObject);
begin
 RadioGroup1.ItemIndex := 0;
 MaskEdit1.Clear;
 maskedit2.Clear;
 maskedit3.Clear;
 combobox1.setfocus;

end;

procedure TF_PesqCep.BitBtn3Click(Sender: TObject);
begin
 DM.Cep.Close;
 close;
end;

procedure TF_PesqCep.BitBtn1Click(Sender: TObject);
 var
 tipo, a, b, order, pesquisa : String;
begin
 //Item de Pesquisa
 if RadioGroup1.ItemIndex = 0 then
 Begin
   tipo := ' like ';
   a    := '';
   b    := '%';
 end;
 if RadioGroup1.ItemIndex = 1 then
 Begin
   tipo := ' like ';
   a    := '%';
   b    := '%';
 end;
 if RadioGroup1.ItemIndex = 2 then
 Begin
  tipo := ' = ';
   a    := '';
   b    := '';
 end;
 if copy(ComboBox1.Text,1,2) = '01' then
 Begin
  order := '';
  pesquisa := ' where endereco <> "" and bairro <> "" and cep <> "" and cidade <> "" and estado <> "" and endereco ' + tipo +  Chr(39)+ a + trim(maskedit1.text) + b + Chr(39) + order;
 end;
 if copy(ComboBox1.Text,1,2) = '02' then
 Begin
  order := '';
  pesquisa := ' where endereco <> "" and bairro <> "" and cep <> "" and cidade <> "" and estado <> "" and cep ' + tipo + Chr(39)+ a + Trimchar(maskedit1.text,'-') + b + Chr(39) + order;
 end;
 if copy(ComboBox1.Text,1,2) = '03' then
 Begin
  order := '';
  pesquisa := ' where endereco <> "" and bairro <> "" and cep <> "" and cidade <> "" and estado <> "" and bairro ' + tipo + Chr(39)+ a + trim(maskedit1.text) + b + Chr(39) + order;
 end;
 if copy(ComboBox1.Text,1,2) = '04' then
 Begin
  order := '';
  pesquisa := ' where endereco <> "" and bairro <> "" and cep <> "" and cidade <> "" and estado <> "" and endereco ' + tipo + Chr(39)+ a + trim(maskedit1.text) + b + Chr(39) + ' and cidade ' + tipo + Chr(39) + a + trim(maskedit2.text) + b + Chr(39) + ' and estado ' + tipo + Chr(39) + a + trim(maskedit3.text) + b + Chr(39) + order;
 end;
 DM.Cep.close;
 DM.Cep.Sql.Clear;

 DM.Cep.Sql.Add('select endereco, bairro, cep, cidade, estado from td_pesso ' + pesquisa);
 DM.Cep.Sql.savetofile('c:\teste.txt');
 DM.Cep.Open;

 if DM.Cep.RecordCount = 0 then
 Begin
  Showmessage('CEP não localizado');
  bitbtn2.Click;
 end;
end;

procedure TF_PesqCep.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
   maskedit1.setfocus;
end;

procedure TF_PesqCep.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 Begin
   if (copy(combobox1.text,1,2) = '04') then maskedit2.setfocus else bitbtn1.setfocus;
   //if (copy(combobox1.text,1,2) = '01') and (copy(combobox1.text,1,2) <> '04') then maskedit2.setfocus else bitbtn2.setfocus;
 end;
end;

procedure TF_PesqCep.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
 Begin
  if copy(combobox1.text,1,2) = '04' then maskedit3.setfocus else bitbtn1.setfocus;
 end;

end;

procedure TF_PesqCep.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then bitbtn1.setfocus;
end;

procedure TF_PesqCep.Incluir1Click(Sender: TObject);
var
 cep : String;
begin
 if F_exame = nil then
 Begin
   Showmessage('Você precisa estar na tela de exame para usar esta opção');
   exit
 end;

 cep := '';
 cep := Copy(DM.Cep.fieldbyname('cep').AsString,1,5) + '-' + Copy(DM.Cep.fieldbyname('cep').AsString,6,8);
 F_Exame.maskedit18.text := DM.Cep.fieldbyname('endereco').AsString;
 F_Exame.maskedit22.text := DM.Cep.fieldbyname('cep').AsString; //cep;//DM.Cep.fieldbyname('cep').AsString;
 F_Exame.maskedit19.text := DM.Cep.fieldbyname('bairro').AsString;
 F_Exame.maskedit20.text := DM.Cep.fieldbyname('cidade').AsString;
 F_Exame.maskedit21.text := DM.Cep.fieldbyname('estado').AsString;
 DM.Cep.Close;
 close;
end;

procedure TF_PesqCep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if DM.Cep.active then DM.Cep.Close;
end;

procedure TF_PesqCep.FormActivate(Sender: TObject);
begin
 ComboBox1.ItemIndex := 0;
end;

procedure TF_PesqCep.DBGrid1DblClick(Sender: TObject);
var
 cep : String;
begin
 if F_exame = nil then
 Begin
   Showmessage('Você precisa estar na tela de exame para usar esta opção');
   exit
 end;

 cep := '';
 cep := Copy(DM.Cep.fieldbyname('cep').AsString,1,5) + '-' + Copy(DM.Cep.fieldbyname('cep').AsString,6,8);
 F_Exame.maskedit18.text := DM.Cep.fieldbyname('endereco').AsString;
 F_Exame.maskedit22.text := DM.Cep.fieldbyname('cep').AsString; //cep;//DM.Cep.fieldbyname('cep').AsString;
 F_Exame.maskedit19.text := DM.Cep.fieldbyname('bairro').AsString;
 F_Exame.maskedit20.text := DM.Cep.fieldbyname('cidade').AsString;
 F_Exame.maskedit21.text := DM.Cep.fieldbyname('estado').AsString;
 DM.Cep.Close;
 close;
end;
end.

