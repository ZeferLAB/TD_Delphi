unit RPA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, Printers, ComCtrls, jpeg;

type
  TF_RPA = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    ComboBox1: TComboBox;
    MaskEdit5: TMaskEdit;
    Label7: TLabel;
    ComboBox2: TComboBox;
    ControlBar1: TControlBar;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RPA: TF_RPA;

implementation

uses DMTD, Menu, QkRpa, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RPA.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RPA.BitBtn2Click(Sender: TObject);
begin
  maskedit1.text := '';
  maskedit3.text := '';
  maskedit4.text := '';
  maskedit1.setfocus;
end;

procedure TF_RPA.BitBtn1Click(Sender: TObject);
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('Data inválida.'), 'PROTOCOLO OFICIAL', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT p_auxiliar, a_nome, ext_nat, lancamento, deposito,');
  Dm.ArqAux.Sql.Add('data_e, data_d, data_r, data_p, protocolo, status, contato');
  Dm.ArqAux.Sql.Add('FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('data_r = ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  Dm.ArqAux.Sql.Add('ORDER BY p_auxiliar');
  Dm.ArqAux.Open;

  Application.CreateForm(TQk_Rpa, Qk_Rpa);
  Qk_Rpa.Label4.Caption := 'COM MOV';

  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Qk_Rpa.Label4.Caption := 'SEM MOV';
    MessageBox(Handle, PChar('Movimento não encontrado.'), 'PROTOCOLO OFICIAL', MB_OK + MB_ICONINFORMATION);
    //Dm.ArqAux.Close;
    //Exit;
  end;
  Qk_Rpa.QrLabel1.Caption  := F_Menu.Label9.Caption;
//  Qk_Rpa.QrLabel3.Caption  := F_Menu.Label5.Caption;
//  Qk_Rpa.QrLabel4.Caption  := F_Menu.Label13.Caption;
  Qk_Rpa.QrLabel5.Caption  := 'PROTOCOLO AUXILIAR';
  Qk_Rpa.Label1.Caption    := Trim(MaskEdit3.Text);
  Qk_Rpa.Label2.Caption    := Trim(MaskEdit5.Text);
  Qk_Rpa.Label3.Caption    := IntToStr(StrToInt(MaskEdit4.Text) - 1);
  Qk_Rpa.Label5.Caption    := MaskEdit1.Text;
  Qk_Rpa.QuickRep1.Preview;
  Qk_Rpa.Destroy;
  Qk_Rpa := NIL;
//  Statusbar1.SimpleText := 'Fim do Relatório';
//  Statusbar1.UpDate;
  BitBtn3.SetFocus;

{  dia := '  ' + inttostr(strtoint(copy(maskedit1.text,1,2)));
  dia := copy(dia, length(dia) - 1, 2);
  mes := '  ' + inttostr(strtoint(copy(maskedit1.text,4,2)));
  mes := copy(mes, length(mes) - 1, 2);
  ano := copy(maskedit1.text,7,4);
  Funcoes.Abre_TDClick(Funcoes);
  tabela.td.setorder(4);
  if not tabela.td.seek(ano + mes + dia) then
  begin
    Funcoes.Fecha_TDClick(Funcoes);
    showmessage('Movimento não localizado');
    F_RPA.maskedit1.setfocus;
    exit;
  end;
  livro := strtoint(F_Rpa.Maskedit3.text);
  folha := strtoint(F_Rpa.Maskedit4.text);
  serie := F_Rpa.Maskedit5.text;
  if messagedlg('Impressora Ok ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    Funcoes.Fecha_TDClick(Funcoes);
    exit;
  end;
  Screen.cursor := crhourglass;
  statusbar1.simpletext := 'Imprimindo...';
  statusbar1.update;
  col := 100;
  lin := 100;
  pulo := 60;
  pag := 0;
  q := 0;
  n1 := 0;
  n2 := 0;
  Printer.Orientation := poLandscape;
  Printer.BeginDoc;
  old_font := printer.canvas.font.Name;
  while (not tabela.td.eof) and (tabela.td.fieldbyname('data_r').asstring = F_Rpa.Maskedit1.Text) do
  begin
    cabec;
    while (not tabela.td.eof) and (tabela.td.fieldbyname('data_r').asstring = F_Rpa.Maskedit1.Text) and (lin < 3100) do
    begin
      if tabela.td.fieldbyname('data_e').asstring = '' then exa := '  /  /    ' else exa := tabela.td.fieldbyname('data_e').asstring;
      if tabela.td.fieldbyname('data_d').asstring = '' then dev := '  /  /    ' else dev := tabela.td.fieldbyname('data_d').asstring;
      if tabela.td.fieldbyname('data_p').asstring = '' then reg := '  /  /    ' else reg := tabela.td.fieldbyname('data_p').asstring;
      linha := alinha('D', '6', tabela.td.fieldbyname('p_auxiliar').asstring);
      linha := linha + ' ' + copy(tabela.td.fieldbyname('a_nome').asstring + '                                  ',1,30);
      linha := linha + ' ' + copy(def_nat(tabela.td.fieldbyname('natureza').asstring) + '                               ',1,20);
      linha := linha + ' ' + copy(def_lan(tabela.td.fieldbyname('lancamento').asstring) + '                 ',1,10);
      linha := linha + ' ' + alinha('D', '14', formatcurr('###,###,##0.00', tabela.td.fieldbyname('deposito').ascurrency));
      linha := linha + ' ' + exa;
      linha := linha + ' ' + dev;
      linha := linha + ' ' + reg;
      linha := linha + ' ' + alinha('D', '6', tabela.td.fieldbyname('protocolo').asstring);
      linha := linha + ' ' + tabela.td.fieldbyname('status').asstring;
      Printer.Canvas.TextOut(col, lin, linha);
      if n1 = 0 then n1 := tabela.td.fieldbyname('p_auxiliar').asinteger;
      n2 := tabela.td.fieldbyname('p_auxiliar').asinteger;
      q := q + 1;
      lin := lin + pulo;
      tabela.td.next;
    end;
    if lin >= 3100 then
    begin
      Printer.NewPage;
      lin := 100;
      folha := folha + 1;
      if folha >= 300 then
      begin
        folha := 2;
        livro := livro + 1;
      end;
    end;
  end;
  Printer.Canvas.Font.Name := old_font;
  Printer.Canvas.Font.Size := 8;
  Printer.Canvas.Rectangle(col, lin, col + 2400 , lin + 1);
  lin := lin + pulo;
  if q > 0 then
  begin
    printer.canvas.textout(col, lin, 'Certifico que encerrei o expediente de hoje, na hora regulamentar, recepcionando ' + inttostr(q) + ' título(s) numerado(s) de ' + inttostr(n1) + ' a ' + inttostr(n2) + '.');
  end
  else
  begin
    printer.canvas.textout(col, lin, 'Certifico que encerrei o expediente de hoje, na hora regulamentar, não tendo recepcionado nenhum título.');
  end;
  lin := lin + pulo;
  printer.canvas.textout(col, lin, 'Diadema, ' + formatdatetime('dd "de" mmmm "de" yyyy', Strtodate(F_RPA.Maskedit1.text)) + '. ' + F_RPA.Combobox1.text + ' ___________________________________ .');
  Printer.EndDoc;
  Funcoes.Fecha_TDClick(Funcoes); }
//  statusbar1.simpletext := 'Fim do Relatório';
//  statusbar1.update;
  Screen.cursor := crdefault;
  bitbtn3.setfocus;
end;

procedure TF_RPA.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then close;
  if key = 13 then maskedit3.setfocus;
end;

procedure TF_RPA.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit4.setfocus;
end;

procedure TF_RPA.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit4.setfocus;
end;

procedure TF_RPA.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then COMBOBOX1.setfocus;
end;

procedure TF_RPA.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then ComboBox2.setfocus;
end;

procedure TF_RPA.MaskEdit3Exit(Sender: TObject);
begin
  if (Trim(MaskEdit3.Text) = '') then MaskEdit3.Text := '0';
end;

procedure TF_RPA.MaskEdit4Exit(Sender: TObject);
begin
  if (Trim(MaskEdit4.Text) = '') then MaskEdit4.Text := '0';
end;

procedure TF_RPA.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
end;

procedure TF_RPA.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

end.
