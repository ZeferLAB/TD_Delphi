unit RCERT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, Mask, Printers, jpeg;

type
  TF_RCert = class(TForm)
    MaskEdit1: TMaskEdit;
    MaskEdit3: TMaskEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label6: TLabel;
    ComboBox2: TComboBox;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RCert: TF_RCert;
  col, lin, pag, pulo : Integer;
  dia, mes, ano, prot : String;

implementation

uses Func, Menu, DMTD, FuncGeral, ProcGeral;

{$R *.DFM}

procedure cabec_talao;
begin
  Printer.Canvas.Font.Size := 13;
  Printer.Canvas.TextOut(col + 200, lin, Trim(F_Menu.Label9.Caption));

  Printer.Canvas.Font.Size := 9;
  lin := lin + pulo + 50;
  Printer.Canvas.TextOut(col + 200, lin, Trim(F_Menu.Label11.Caption));

  lin := lin + pulo + 50;
  Printer.Canvas.TextOut(col + 200, lin, 'C.N.P.J. ' + Trim(F_Menu.Label39.Caption));

  lin := lin + pulo + 50;
  Printer.Canvas.Font.Size := 12;
  Printer.Canvas.TextOut(col + 200, lin, Trim(F_Menu.Label5.Caption));
  lin := lin + pulo + 50;
  Printer.Canvas.TextOut(col + 200,lin, Trim(F_menu.Label13.Caption));
  lin := lin + (pulo * 2);
  Printer.Canvas.TextOut(col + 1900, lin, 'R E C I B O');
  lin := lin + (pulo * 4);

end;

procedure TF_RCert.BitBtn3Click(Sender: TObject);
begin
   Close;
end;

procedure TF_RCert.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit3.text := '';
  maskedit1.setfocus;
end;

procedure TF_RCert.BitBtn1Click(Sender: TObject);
var
  ok : boolean;
  dif : currency;
  texto, old_font : String;
begin
  if maskedit3.text = '' then
  Begin
    showmessage('Protocolo inválido !');
    maskedit3.setfocus;
    exit;
  end;
  Dm.Certidao.Close;
  Dm.Certidao.Sql.Clear;
  Dm.Certidao.Sql.Add('SELECT * FROM certidao');
  Dm.Certidao.Sql.Add('WHERE');
  Dm.Certidao.Sql.Add('nr_protoc = ' + MaskEdit3.Text);
  Dm.Certidao.Open;
  if (Dm.Certidao.RecordCount = 0) then
  begin
    Dm.Certidao.Close;
    ShowMessage('Movimento não encontrado.');
    Exit;
  end;

  Screen.cursor := crhourglass;
//  statusbar1.simpletext := 'Imprimindo...';
//  statusbar1.update;
  col := 100;
  lin := 100;
  pulo := 60;
  pag := 0;
  Printer.Orientation := poPortrait;
  Printer.BeginDoc;
  old_font := printer.canvas.font.Name;
  Printer.Canvas.Font.Name := old_font;

  cabec_talao;

  Printer.Canvas.Font.Size := 11;
  Printer.Canvas.Font.Name := 'Courier New';
  Printer.Canvas.TextOut(col + 100, lin, 'Recebi de ' +  Dm.certidao.fieldbyname('apresentan').asstring);
  lin := lin + (pulo * 3);
  Printer.Canvas.TextOut(col + 100, lin, 'sob número ');
  Printer.Canvas.Font.Size  := 14;
  Printer.Canvas.Font.Style := [fsbold];
  Printer.Canvas.TextOut(800, lin - 20, copy('000000',1,6-length(Dm.certidao.fieldbyname('nr_protoc').asstring)) + Dm.certidao.fieldbyname('nr_protoc').asstring);
  Printer.Canvas.Font.Size := 11;
  Printer.Canvas.Font.Style := [];
  Printer.Canvas.TextOut(1160, lin, ', referente à certidão :' + Ver_NatCer(Dm.certidao.fieldbyname('natureza').asstring, False));
  lin := lin + (pulo * 3);
  Printer.Canvas.TextOut(col + 100, lin, 'Para maior clareza, firmo o presente recibo.');
  lin := lin + (pulo * 3);
  Printer.Canvas.TextOut(col + 100, lin, 'TOTAL......................: ' + formatcurr('###,###,##0.00', Dm.certidao.fieldbyname('custas').ascurrency));
  lin := lin + (pulo * 4);
  Printer.Canvas.TextOut(col + 100, lin, Trim(F_Menu.Label7.Caption) + ', ' + formatdatetime('dd "de" mmmm "de" yyyy', strtodate(F_RCert.Maskedit1.text)));
  lin := lin + (pulo * 2);
  Printer.Canvas.TextOut(col + 100, lin, '______________________________');
  Printer.Canvas.TextOut(col + 100, lin+100, F_RCert.ComboBox1.Text);
  lin := lin + (pulo + 20);
  Printer.Canvas.TextOut(col + 100, lin+100, F_RCert.ComboBox2.Text);
  lin := lin + (pulo * 2);
  Printer.Canvas.Font.Size := 10;
  Printer.Canvas.Font.Style := [fsbold];
  lin := lin + (pulo * 2);
  Printer.Canvas.TextOut(col, lin, 'Declaro que nesta data recebi a 1ª via deste recibo, com os atos devidamente formalizados.');
  lin := lin + (pulo * 2);
  Printer.Canvas.TextOut(col, lin, Trim(F_Menu.Label7.Caption) + ', _______/_______/__________');
  lin := lin + (pulo * 2);
  Printer.Canvas.TextOut(col, lin, 'Assinatura ______________________________________________________________');
  lin := lin + (pulo * 2);
  Printer.Canvas.TextOut(col, lin, 'Nome ____________________________________________________________________');
  lin := lin + (pulo * 2);
  Printer.Canvas.TextOut(col, lin, 'Endereço ________________________________________________________________');
  lin := lin + (pulo * 2);
  Printer.Canvas.Font.Name := old_font;
  Printer.EndDoc;
  
//  statusbar1.simpletext := 'Fim do Relatório';
//  statusbar1.update;
  Screen.cursor := crdefault;
  bitbtn3.setfocus;
end;

procedure TF_RCert.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RCert.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RCert.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then combobox1.setfocus;
end;

procedure TF_RCert.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then combobox2.setfocus; 
end;

procedure TF_RCert.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then bitbtn1.setfocus;
end;





procedure TF_RCert.FormActivate(Sender: TObject);
begin
    if (F_Menu.Label45.Caption = 'S') then
    begin
      ComboBox1.Text := F_Menu.Label25.Caption;
    end;
end;

procedure TF_RCert.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

end.
