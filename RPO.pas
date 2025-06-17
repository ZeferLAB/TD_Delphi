unit RPO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Printers, Grids, DBGrids,
  jpeg, dSignPDFInt_TLB, FileCtrl, ExportPack;

type
  TF_RPO = class(TForm)
    Label1: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    MaskEdit5: TMaskEdit;
    Label2: TLabel;
    ComboBox2: TComboBox;
    MaskEdit2: TMaskEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    Label7: TLabel;
    MaskEdit6: TMaskEdit;
    Label8: TLabel;
    chkAssinatura: TCheckBox;
    EXQR1: TExportQR;
    CheckBox1: TCheckBox;

    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure ProtCanvas(Sender : TObject);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RPO: TF_RPO;
  livro_a, folha_a : integer;
  protfim, protini, data_imp : String;
  qtde_prot, pulo, coluna, linha, livro, folha : Integer;
  entrou, encerrou : Boolean;

implementation

uses Menu, DMTD, QkRpo, QkRpoNew, UQk_RpoNew1, QkRpoOF2, FuncGeral, ProcGeral,
  Qk_RpoA4, UQK_LVASJM, UQK_LVASAQ, URpo_A4;

{$R *.DFM}

Procedure Letra(Tipo : String; Estilo : TFontStyles; Tamanho : Integer);
begin
  Printer.Canvas.Font.Name  := tipo;
  Printer.Canvas.Font.Style := estilo;
  Printer.Canvas.Font.Size  := tamanho;
end;

procedure Cabecalho;
var
  data : String;
begin
  linha  := (200*2);
  coluna := (200*2);
  pulo   := (50*2);
  pag := pag + 1;
  letra('Arial',[],16);
  Printer.Canvas.TextOut(coluna + (800*2), linha, F_Menu.Label29.Caption);
  letra('Arial',[],10);
  linha := linha + (pulo * 2);
  Printer.Canvas.textOut(coluna + (800*2), linha, F_Menu.Label5.Caption);
  linha := linha + (pulo * 1);
  Printer.Canvas.textOut(coluna + (700*2), linha, 'REGISTRO DE TITULOS E DOCUMENTOS');
  linha := linha + (pulo * 2);
  letra('Arial',[fsBold],12);
  Printer.Canvas.TextOut(coluna + (800*2), linha, 'LIVRO A - PROTOCOLO');
  letra('Arial',[],10);
  Printer.Canvas.textOut(coluna + (1800*2), linha, 'Livro nº ' + StrZero(IntToStr(livro),3) + ' Folha nº ' + StrZero(IntToStr(folha),3));
  linha := linha + (pulo * 2);
  letra('Arial',[FsBold],9);

  Printer.Canvas.textOut(coluna, linha, DataExtenso(dm.ArqAux.FieldByName('data_p').AsString, False, ''));

//Printer.Canvas.textOut(coluna, linha, DataExtenso(dm.ArqAux.FieldByName('data_p').AsString, False, '') + ' Livro nº ' + StrZero(IntToStr(livro),3) + ' Folha nº ' + StrZero(IntToStr(folha),3)););


  letra('Arial',[],10);
  linha := linha + (pulo * 2);
  Printer.Canvas.Rectangle(coluna, linha, coluna + (2800*2), linha + 1);
  letra('Arial',[FsBold],9);
  Printer.Canvas.textOut(coluna, linha, 'Ordem');
  Printer.Canvas.textOut(coluna + (120*2),  linha, ' Data');
  Printer.Canvas.textOut(coluna + (300*2),  linha, 'Natureza');
  Printer.Canvas.textOut(coluna + (850*2),  linha, 'Apresentante');
  Printer.Canvas.textOut(coluna + (1400*2), linha, '   Lançamento');
  Printer.Canvas.textOut(coluna + (1680*2), linha, 'Livro/Folha');
  Printer.Canvas.textOut(coluna + (1900*2), linha, 'Anot./Averb.');
  linha := linha + (pulo * 1);
  Printer.Canvas.Rectangle(coluna, linha, coluna + (2800*2), linha + 1);
  letra('Arial',[],7);
end;

procedure CabecalhoMov;
var
  data : String;
begin
  If (NOT encerrou) then
  Begin
    letra('Arial',[],9);
    Printer.Canvas.TextOut(coluna, linha, 'Certifico que encerrei o expediente na hora regulamentar, com ' + StrZero(IntToStr(qtde_prot),3) + ' título(s) protocolado(s) de ' + protini + ' a ' + protfim + '. O Oficial ________________.');
    linha := linha + (pulo * 2);
  End;
  letra('Arial',[FSBold],9);
  Printer.Canvas.textOut(coluna, linha, DataExtenso(dm.ArqAux.FieldByName('data_p').AsString, False, ''));
  linha := linha + (pulo * 1);
  Printer.Canvas.Rectangle(coluna, linha, coluna + (2800*2), linha + 1);
  Printer.Canvas.textOut(coluna, linha, 'Ordem');
  Printer.Canvas.textOut(coluna + (120*2),  linha, ' Data');
  Printer.Canvas.textOut(coluna + (300*2),  linha, 'Natureza');
  Printer.Canvas.textOut(coluna + (850*2),  linha, 'Apresentante');
  Printer.Canvas.textOut(coluna + (1400*2), linha, '   Lançamento');
  Printer.Canvas.textOut(coluna + (1680*2), linha, 'Livro/Folha');
  Printer.Canvas.textOut(coluna + (1900*2), linha, 'Anot./Averb.');
  Printer.Canvas.Rectangle(coluna, linha, coluna + (2800*2), linha + 1);
  letra('Arial',[],7);
  linha := linha + (pulo * 1);
end;

Procedure TF_RPO.ProtCanvas(Sender : TObject);
var
  linha_livro : String;
Begin
  if messagedlg('Impressora OK ?', mtconfirmation, [MbYes, MbNo], 0) = MrYes then
  begin
    Printer.Orientation := poPortrait;
    Printer.Copies := 1;
    Printer.BeginDoc;
    livro := StrToInt(MaskEdit3.Text);
    folha := (StrToInt(MaskEdit4.Text) + 1);
    cabecalho;
    while (not Dm.ArqAux.Eof) do
    begin
      qtde_prot := 0;
      data_imp  := Dm.ArqAux.FieldByName('data_p').AsString;
      protini   := Dm.ArqAux.FieldByName('protocolo').asString;
      encerrou := False;
      while (not Dm.ArqAux.Eof) and (data_imp = Dm.ArqAux.FieldByName('data_p').AsString) do
      begin
//      while (not Dm.ArqAux.Eof) and (linha <= (3300*2)) do
//      begin
          if (trim(dm.ArqAux.FieldByName('livro_b').AsString) <> '') and (trim(dm.ArqAux.FieldByNAme('folha_b').AsString) <> '') then
          begin
            linha_livro := 'B   -  ' + dm.ArqAux.FieldByName('livro_b').AsString + '  /   ' + dm.ArqAux.FieldByNAme('folha_b').AsString;
          end;
          if (trim(dm.ArqAux.FieldByName('livro_c').AsString) <> '') and (trim(dm.ArqAux.FieldByNAme('folha_c').AsString) <> '') then
          begin
            linha_livro := 'C   -  ' + dm.ArqAux.FieldByName('livro_c').AsString + '  /   ' + dm.ArqAux.FieldByNAme('folha_c').AsString;
          end;
          Printer.Canvas.textOut(coluna, linha, Dm.ArqAux.FieldByName('protocolo').AsString);
          Printer.Canvas.textOut(coluna + (120*2),  linha, ' ' + Dm.ArqAux.FieldByName('data_p').AsString);
          letra('Arial',[],6);
          Printer.Canvas.textOut(coluna + (300*2),  linha, Dm.ArqAux.FieldByName('ext_nat').AsString);
          Printer.Canvas.textOut(coluna + (850*2),  linha, Trim(Dm.ArqAux.FieldByName('a_nome').asString));
          letra('Arial',[],7);
          Printer.Canvas.textOut(coluna + (1400*2), linha, '   R. INTEGRAL');
          Printer.Canvas.textOut(coluna + (1680*2), linha, linha_livro);
          Printer.Canvas.textOut(coluna + (1900*2), linha, Trim(Dm.ArqAux.FieldByName('anotacao').asString));
          linha := linha + (pulo * 1);
        { Gravando a pagina no banco de dados. }
          dm.TD.close;
          dm.TD.sql.Clear;
          dm.TD.sql.add('select recno, livro_a, folha_a from td where p_auxiliar = ' + dm.ArqAux.FieldByName('p_auxiliar').AsString);
          dm.td.open;
          if dm.td.RecordCount <> 0 then
          begin
            Dm.ArqAux1.close;
            Dm.ArqAux1.Sql.Clear;
            Dm.ArqAux1.Sql.Add('update td set livro_a = ' + inttostr(livro) + ', folha_a = ' + inttostr(folha));
            Dm.ArqAux1.Sql.Add(' where recno = ' + Dm.Td.FieldByName('recno').ASString);
            Try
              Dm.ArqAux1.ExecSql;
            Except
              ShowMessage('Problemas para gerar o Livro');
            End;
          end;
          dm.TD.close;
          qtde_prot := qtde_prot + 1;
          protfim := Dm.ArqAux.FieldByName('protocolo').asString;
          Dm.ArqAux.Next;
          if linha > (3300*2) then
          Begin
            If (data_imp <> Dm.ArqAux.FieldByName('data_p').AsString) then
            Begin
              encerrou := True;
              letra('Arial',[],9);
              Printer.Canvas.TextOut(coluna, linha, 'Certifico que encerrei o expediente na hora regulamentar, com ' + StrZero(IntToStr(qtde_prot),3) + ' título(s) protocolado(s) de ' + protini + ' a ' + protfim + '. O Oficial ________________.');
              If folha >= 300 then
              Begin
                livro := livro + 1;
                folha := 1;
                Printer.NewPage;
              End Else
              Begin
                folha := (folha + 1);
                Printer.NewPage;
              End;
            End
            Else
            Begin
              Printer.NewPage;
              folha := (folha + 1);
            End;
            cabecalho;
          End;
//      End;
//      Printer.NewPage;
//      cabecalho;
      end;
      if linha > (3300*2) then
      Begin
        Printer.NewPage;
        folha := (folha + 1);
        If folha > 300 then
        Begin
          livro := livro + 1;
          folha := 1;
        End;
        cabecalho;
        letra('Arial',[],9);
        Printer.Canvas.TextOut(coluna, linha, 'Certifico que encerrei o expediente na hora regulamentar, com ' + StrZero(IntToStr(qtde_prot),3) + ' título(s) protocolado(s) de ' + protini + ' a ' + protfim + '. O Oficial ________________.');
      End
      Else
      Begin
        If (NOT Dm.ArqAux.Eof) then
          CabecalhoMov
        Else
        Begin
          letra('Arial',[],9);
          Printer.Canvas.TextOut(coluna, linha, 'Certifico que encerrei o expediente na hora regulamentar, com ' + StrZero(IntToStr(qtde_prot),3) + ' título(s) protocolado(s) de ' + protini + ' a ' + protfim + '. O Oficial ________________.');
        End;
      End;
    end;
  end;
  Printer.EndDoc;
  Printer.Orientation := poPortrait;
  ShowMessage('Fim da Impressão');
End;

procedure TF_RPO.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RPO.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Text := '';
  MaskEdit3.Text := '';
  MaskEdit4.Text := '';
  MaskEdit5.Text := '';
  MaskEdit1.SetFocus;
end;

procedure TF_RPO.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RPO.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then MaskEdit1.SetFocus;
  if key = 13 then MaskEdit5.SetFocus;
end;

procedure TF_RPO.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then MaskEdit6.setfocus;
end;

procedure TF_RPO.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then ComboBox2.setfocus;
end;

procedure TF_RPO.BitBtn1Click(Sender: TObject);
var
  sign         : SisSign;
  certif       : Certificados;
  erros        : WideString;
  nome_arquivo,
  dir: String;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    MessageBox(Handle, PChar('Data inválida !'), 'PROTOCOLO OFICIAL', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT checkduvida, sequencia_averbacao, averba, livro, folha, p_auxiliar, protocolo, registro, a_nome, ext_nat, anotacao, data_r, data_p, tabela,');
  Dm.ArqAux.Sql.Add(' data_i, data_du, data_ca, contato, livro_b, folha_b, livro_c, folha_c, status, lva, lvb, lvc, lvd, lva_reg, lvb_reg, lvc_reg, lvd_reg, livro_reg, folha_reg, custas, lvf');
  Dm.ArqAux.Sql.Add(' FROM td WHERE');
  Dm.ArqAux.Sql.Add(' lva = "X"');
  Dm.ArqAux.Sql.Add(' AND data_r >= ' + QuotedStr(ConvData(MaskEdit1.Text)));
  dm.ArqAux.sql.add(' AND data_r <= ' + QuotedStr(ConvData(MaskEdit2.Text)));
  Dm.ArqAux.Sql.Add(' ORDER BY data_r, p_auxiliar');
  Dm.ArqAux.Open;

  if (a_implva1) then
  begin
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      MessageBox(Handle, PChar('Movimento não encontrado !'), 'PROTOCOLO OFICIAL', MB_OK + MB_ICONINFORMATION);
      // Gerando sem movimento
      Application.CreateForm(TQk_RpoNew1, Qk_RpoNew1);
      Qk_RpoNew1.QrLabel1.Caption   := F_Menu.Label29.Caption; //F_Menu.Label2.Caption;
      Qk_RpoNew1.QRLabel3.Caption   := email;  //f_menu.Label11.Caption + ' ' + F_Menu.Label7.Caption + ' ' + F_Menu.Label6.Caption;
      Qk_RpoNew1.QRLabel4.Caption   := F_Menu.Label13.Caption + ' - ' + F_Menu.Label5.Caption;
      Qk_RpoNew1.ContaDetalhes      := 0;
      Qk_RpoNew1.QRLabel11.Caption  := 'REGISTRO DE TÍTULOS E DOCUMENTOS';
      Qk_RpoNew1.QrLabel5.Caption   := 'Livro A - PROTOCOLO';
      Qk_RpoNew1.QrLabel18.Caption  := DataExtenso(MaskEdit1.Text, False, '');
      Qk_RpoNew1.Label1.Caption     := Trim(MaskEdit3.Text);
      Qk_RpoNew1.Label2.Caption     := Trim(MaskEdit3.Text);
      Qk_RpoNew1.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) - 1);
      Qk_RpoNew1.Label4.Caption     := 'SEM MOV';
      Qk_RpoNew1.Label5.Caption     := MaskEdit1.Text;
      Qk_RpoNew1.QuickRep1.Preview;
      Qk_RpoNew1.Destroy;
      Qk_RpoNew1 := NIL;
      Dm.ArqAux.Close;
      Exit;
    end;
    Application.CreateForm(TQk_RpoNew1, Qk_RpoNew1);
    Qk_RpoNew1.QrLabel1.Caption   := F_Menu.Label29.Caption; //F_Menu.Label2.Caption;
    Qk_RpoNew1.QRLabel3.Caption   := email;  //f_menu.Label11.Caption + ' ' + F_Menu.Label7.Caption + ' ' + F_Menu.Label6.Caption;
    Qk_RpoNew1.QRLabel4.Caption   := F_Menu.Label13.Caption + ' - ' + F_Menu.Label5.Caption;
    Qk_RpoNew1.QRLabel11.Caption  := 'REGISTRO DE TÍTULOS E DOCUMENTOS';
    Qk_RpoNew1.QrLabel5.Caption   := 'Livro A - PROTOCOLO';
    Qk_RpoNew1.ContaDetalhes      := 0;
    Qk_RpoNew1.Label1.Caption     := Trim(MaskEdit3.Text);
    Qk_RpoNew1.Label2.Caption     := Trim(MaskEdit3.Text);
    Qk_RpoNew1.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) + 1);
    Qk_RpoNew1.Label4.Caption     := 'COM MOV';
    Qk_RpoNew1.Label5.Caption     := MaskEdit1.Text;

    //Qk_RpoNew.QrLabel14.Caption := DataExtenso(MaskEdit1.Text, True, '') + ' ' + ComboBox1.Text + ' - ' + ComboBox2.Text + '________________________________.';
    Qk_RpoNew1.QuickRep1.Preview;
    Qk_RpoNew1.Destroy;
    Qk_RpoNew1 := NIL;
  end
  else if (a_implva2) then
  begin
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      MessageBox(Handle, PChar('Movimento não encontrado.'), 'PROTOCOLO OFICIAL', MB_OK + MB_ICONINFORMATION);
      // Gerando sem movimento
      Application.CreateForm(TQk_RpoNew, Qk_RpoNew);
      Qk_RpoNew.QrLabel1.Caption   := F_Menu.Label29.Caption; //F_Menu.Label2.Caption;
      Qk_RpoNew.QRLabel3.Caption   := email;  //f_menu.Label11.Caption + ' ' + F_Menu.Label7.Caption + ' ' + F_Menu.Label6.Caption;
      Qk_RpoNew.QRLabel4.Caption   := F_Menu.Label13.Caption + ' - ' + F_Menu.Label5.Caption;
      Qk_RpoNew.ContaDetalhes     := 0;
      Qk_RpoNew.QRLabel11.Caption  := 'REGISTRO DE TÍTULOS E DOCUMENTOS';
      Qk_RpoNew.QrLabel5.Caption   := 'Livro A - PROTOCOLO';
      Qk_RpoNew.QrLabel18.Caption  := DataExtenso(MaskEdit1.Text, False, '');
      Qk_RpoNew.Label1.Caption     := Trim(MaskEdit3.Text);
      Qk_RpoNew.Label2.Caption     := Trim(MaskEdit3.Text);
      Qk_RpoNew.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) - 1);
      Qk_RpoNew.Label4.Caption     := 'SEM MOV';
      Qk_RpoNew.Label5.Caption     := MaskEdit1.Text;
      //Qk_RpoNew.QrLabel14.Caption  := DataExtenso(MaskEdit1.Text, True, '') + ' ' + ComboBox1.Text + ' - ' + ComboBox2.Text + '________________________________.';
      Qk_RpoNew.QuickRep1.Preview;
      Qk_RpoNew.Destroy;
      Qk_RpoNew := NIL;
      Dm.ArqAux.Close;
      Exit;
    end;
    Application.CreateForm(TQk_RpoNew, Qk_RpoNew);
    Qk_RpoNew.QrLabel1.Caption   := F_Menu.Label29.Caption; //F_Menu.Label2.Caption;
    Qk_RpoNew.QRLabel3.Caption   := email;  //f_menu.Label11.Caption + ' ' + F_Menu.Label7.Caption + ' ' + F_Menu.Label6.Caption;
    Qk_RpoNew.ContaDetalhes     := 0;
    Qk_RpoNew.QRLabel4.Caption   := F_Menu.Label13.Caption + ' - ' + F_Menu.Label5.Caption;
    Qk_RpoNew.QRLabel11.Caption  := 'REGISTRO DE TÍTULOS E DOCUMENTOS';
    Qk_RpoNew.QrLabel5.Caption   := 'Livro A - PROTOCOLO';
    Qk_RpoNew.Label1.Caption     := Trim(MaskEdit3.Text);
    Qk_RpoNew.Label2.Caption     := Trim(MaskEdit3.Text);
    Qk_RpoNew.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) + 1);
    Qk_RpoNew.Label4.Caption     := 'COM MOV';
    Qk_RpoNew.Label5.Caption     := MaskEdit1.Text;

    //Qk_RpoNew.QrLabel14.Caption := DataExtenso(MaskEdit1.Text, True, '') + ' ' + ComboBox1.Text + ' - ' + ComboBox2.Text + '________________________________.';
    Qk_RpoNew.QuickRep1.Preview;
    Qk_RpoNew.Destroy;
    Qk_RpoNew := NIL;
  end
  else if (a_implva3) then
  begin
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      MessageBox(Handle, PChar('Movimento não encontrado.'), 'PROTOCOLO OFICIAL', MB_OK + MB_ICONINFORMATION);
      // Gerando sem movimento
      Application.CreateForm(TF_Qk_RpoA4, F_Qk_RpoA4);
      F_Qk_RpoA4.QrLabel1.Caption   := F_Menu.Label29.Caption; //F_Menu.Label2.Caption;
      F_Qk_RpoA4.QRLabel3.Caption   := email;  //f_menu.Label11.Caption + ' ' + F_Menu.Label7.Caption + ' ' + F_Menu.Label6.Caption;
      F_Qk_RpoA4.QRLabel4.Caption   := F_Menu.Label13.Caption + ' - ' + F_Menu.Label5.Caption;
      F_Qk_RpoA4.QRLabel11.Caption  := 'REGISTRO DE TÍTULOS E DOCUMENTOS';
      F_Qk_RpoA4.QrLabel5.Caption   := 'Livro A - PROTOCOLO';
      F_Qk_RpoA4.ContaDetalhes      := 0;
      F_Qk_RpoA4.QrLabel18.Caption  := DataExtenso(MaskEdit1.Text, False, '');
      F_Qk_RpoA4.Label1.Caption     := Trim(MaskEdit3.Text);
      F_Qk_RpoA4.Label2.Caption     := Trim(MaskEdit3.Text);
      F_Qk_RpoA4.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) - 1);
      F_Qk_RpoA4.Label4.Caption     := 'SEM MOV';
      F_Qk_RpoA4.Label5.Caption     := MaskEdit1.Text;
      //F_Qk_RpoA4.QrLabel14.Caption  := DataExtenso(MaskEdit1.Text, True, '') + ' ' + ComboBox1.Text + ' - ' + ComboBox2.Text + '________________________________.';
      F_Qk_RpoA4.QuickRep1.Preview;
      F_Qk_RpoA4.Destroy;
      F_Qk_RpoA4 := NIL;
      Dm.ArqAux.Close;
      Exit;
    end;
    Application.CreateForm(TF_Qk_RpoA4, F_Qk_RpoA4);
    F_Qk_RpoA4.QrLabel1.Caption   := F_Menu.Label29.Caption; //F_Menu.Label2.Caption;
    F_Qk_RpoA4.QRLabel3.Caption   := email;  //f_menu.Label11.Caption + ' ' + F_Menu.Label7.Caption + ' ' + F_Menu.Label6.Caption;
    F_Qk_RpoA4.QRLabel4.Caption   := F_Menu.Label13.Caption + ' - ' + F_Menu.Label5.Caption;
    F_Qk_RpoA4.QRLabel11.Caption  := 'REGISTRO DE TÍTULOS E DOCUMENTOS';
    F_Qk_RpoA4.QrLabel5.Caption   := 'Livro A - PROTOCOLO';
    F_Qk_RpoA4.ContaDetalhes      := 0;
    F_Qk_RpoA4.Label1.Caption     := Trim(MaskEdit3.Text);
    F_Qk_RpoA4.Label2.Caption     := Trim(MaskEdit3.Text);
    F_Qk_RpoA4.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) + 1);
    F_Qk_RpoA4.Label4.Caption     := 'COM MOV';
    F_Qk_RpoA4.Label5.Caption     := MaskEdit1.Text;

    //F_Qk_RpoA4.QrLabel14.Caption := DataExtenso(MaskEdit1.Text, True, '') + ' ' + ComboBox1.Text + ' - ' + ComboBox2.Text + '________________________________.';
    F_Qk_RpoA4.QuickRep1.Preview;
    F_Qk_RpoA4.Destroy;
    F_Qk_RpoA4 := NIL;
  end
  else if (a_implva4) then
  begin
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      MessageBox(Handle, PChar('Movimento não encontrado.'), 'PROTOCOLO OFICIAL', MB_OK + MB_ICONINFORMATION);
      // Gerando sem movimento
      Application.CreateForm(TF_QkRpoOF2, F_QkRpoOF2);
      F_QkRpoOF2.QrLabel1.Caption   := F_Menu.Label29.Caption; //F_Menu.Label2.Caption;
      F_QkRpoOF2.QRLabel3.Caption   := email;  //f_menu.Label11.Caption + ' ' + F_Menu.Label7.Caption + ' ' + F_Menu.Label6.Caption;
      F_QkRpoOF2.QRLabel4.Caption   := F_Menu.Label13.Caption + ' - ' + F_Menu.Label5.Caption;
      F_QkRpoOF2.QRLabel11.Caption  := 'REGISTRO DE TÍTULOS E DOCUMENTOS';
      F_QkRpoOF2.QrLabel5.Caption   := 'Livro A - PROTOCOLO';
      F_QkRpoOF2.ContaDetalhes      := 0;
      F_QkRpoOF2.QrLabel18.Caption  := DataExtenso(MaskEdit1.Text, False, '');
      F_QkRpoOF2.Label1.Caption     := Trim(MaskEdit3.Text);
      F_QkRpoOF2.Label2.Caption     := Trim(MaskEdit3.Text);
      F_QkRpoOF2.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) - 1);
      F_QkRpoOF2.Label4.Caption     := 'SEM MOV';
      F_QkRpoOF2.Label5.Caption     := MaskEdit1.Text;
      //Qk_RpoNew.QrLabel14.Caption  := DataExtenso(MaskEdit1.Text, True, '') + ' ' + ComboBox1.Text + ' - ' + ComboBox2.Text + '________________________________.';
      F_QkRpoOF2.QuickRep1.Preview;
      F_QkRpoOF2.Destroy;
      F_QkRpoOF2 := NIL;
      Dm.ArqAux.Close;
      Exit;
    end;
    Application.CreateForm(TF_QkRpoOF2, F_QkRpoOF2);
    F_QkRpoOF2.QrLabel1.Caption   := F_Menu.Label29.Caption; //F_Menu.Label2.Caption;
    F_QkRpoOF2.QRLabel3.Caption   := email;  //f_menu.Label11.Caption + ' ' + F_Menu.Label7.Caption + ' ' + F_Menu.Label6.Caption;
    F_QkRpoOF2.QRLabel4.Caption   := F_Menu.Label13.Caption + ' - ' + F_Menu.Label5.Caption;
    F_QkRpoOF2.QRLabel11.Caption  := 'REGISTRO DE TÍTULOS E DOCUMENTOS';
    F_QkRpoOF2.QrLabel5.Caption   := 'Livro A - PROTOCOLO';
    F_QkRpoOF2.ContaDetalhes      := 0;
    F_QkRpoOF2.Label1.Caption     := Trim(MaskEdit3.Text);
    F_QkRpoOF2.Label2.Caption     := Trim(MaskEdit3.Text);
    F_QkRpoOF2.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) + 1);
    F_QkRpoOF2.Label4.Caption     := 'COM MOV';
    F_QkRpoOF2.Label5.Caption     := MaskEdit1.Text;

    //F_QkRpoOF2.QrLabel14.Caption := DataExtenso(MaskEdit1.Text, True, '') + ' ' + ComboBox1.Text + ' - ' + ComboBox2.Text + '________________________________.';
    F_QkRpoOF2.QuickRep1.Preview;
    F_QkRpoOF2.Destroy;
    F_QkRpoOF2 := NIL;
  end
  else if (a_chk11) then
  begin
    if (Dm.ArqAux.RecordCount = 0) then
    begin
      MessageBox(Handle, PChar('Movimento não encontrado.'), 'PROTOCOLO OFICIAL', MB_OK + MB_ICONINFORMATION);
      // Gerando sem movimento
      Application.CreateForm(TF_QkRpoOF3, F_QkRpoOF3);
      F_QkRpoOF3.QrLabel1.Caption   := F_Menu.Label29.Caption; //F_Menu.Label2.Caption;
      F_QkRpoOF3.QRLabel3.Caption   := email;  //f_menu.Label11.Caption + ' ' + F_Menu.Label7.Caption + ' ' + F_Menu.Label6.Caption;
      F_QkRpoOF3.QRLabel4.Caption   := F_Menu.Label13.Caption + ' - ' + F_Menu.Label5.Caption;
      F_QkRpoOF3.QRLabel11.Caption  := 'REGISTRO DE TÍTULOS E DOCUMENTOS';
      F_QkRpoOF3.QrLabel5.Caption   := 'Livro Protocolo - ' + MaskEdit5.Text + ' ' + MaskEdit3.Text;
      F_QkRpoOF3.QrLabel18.Caption  := DataExtenso(MaskEdit1.Text, False, '');
      F_QkRpoOF3.Label1.Caption     := Trim(MaskEdit3.Text);
      F_QkRpoOF3.Label2.Caption     := Trim(MaskEdit3.Text);
      F_QkRpoOF3.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) - 1);
      F_QkRpoOF3.Label4.Caption     := 'SEM MOV';
      F_QkRpoOF3.Label5.Caption     := MaskEdit1.Text;
      //Qk_RpoNew.QrLabel14.Caption  := DataExtenso(MaskEdit1.Text, True, '') + ' ' + ComboBox1.Text + ' - ' + ComboBox2.Text + '________________________________.';
      F_QkRpoOF3.QuickRep1.Preview;
      F_QkRpoOF3.Destroy;
      F_QkRpoOF3 := NIL;
      Dm.ArqAux.Close;
      Exit;
    end;
    Application.CreateForm(TF_QkRpoOF3, F_QkRpoOF3);
    F_QkRpoOF3.QrLabel1.Caption   := F_Menu.Label29.Caption; //F_Menu.Label2.Caption;
    F_QkRpoOF3.QRLabel3.Caption   := email;  //f_menu.Label11.Caption + ' ' + F_Menu.Label7.Caption + ' ' + F_Menu.Label6.Caption;
    F_QkRpoOF3.QRLabel4.Caption   := F_Menu.Label13.Caption + ' - ' + F_Menu.Label5.Caption;
    F_QkRpoOF3.QRLabel11.Caption  := 'REGISTRO DE TÍTULOS E DOCUMENTOS';
    F_QkRpoOF3.QrLabel5.Caption   := 'Livro Protocolo - ' + MaskEdit5.Text + ' ' + MaskEdit3.Text;
    F_QkRpoOF3.Label1.Caption     := Trim(MaskEdit3.Text);
    F_QkRpoOF3.Label2.Caption     := Trim(MaskEdit3.Text);
    F_QkRpoOF3.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) + 1);
    F_QkRpoOF3.Label4.Caption     := 'COM MOV';
    F_QkRpoOF3.Label5.Caption     := MaskEdit1.Text;

    //F_QkRpoOF2.QrLabel14.Caption := DataExtenso(MaskEdit1.Text, True, '') + ' ' + ComboBox1.Text + ' - ' + ComboBox2.Text + '________________________________.';
    F_QkRpoOF3.QuickRep1.Preview;
    F_QkRpoOF3.Destroy;
    F_QkRpoOF3 := NIL;
  end
  else if (a_chk12) then
  begin
    if (NOT v_chk_15) then  { Impressao oficio 2 }
    begin
      if (Dm.ArqAux.RecordCount = 0) then
      begin
        MessageBox(Handle, PChar('Movimento não encontrado.'), 'PROTOCOLO OFICIAL', MB_OK + MB_ICONINFORMATION);
        // Gerando sem movimento
        Application.CreateForm(TF_QkRpoOF4, F_QkRpoOF4);
        F_QkRpoOF4.QrLabel1.Caption   := 'LIVRO DE PROTOCOLO';
        If CheckBox1.Checked then F_QkRpoOF4.QrLabel1.Caption   := 'LIVRO AUXILIAR DE PROTOCOLOS EM ANDAMENTO';

        IF ((F_menu.LbCnpj.Caption = '15.258.382/0001-25') OR (F_menu.LbCnpj.Caption = '15258382000125')) THEN
          F_QkRpoOF4.QRLabel3.caption:= '1º '+F_QkRpoOF4.QRLabel3.caption+ ' - SIMÕES FILHO BA';

        IF ((F_menu.LbCnpj.Caption = '27.072.837/0001-00') OR (F_menu.LbCnpj.Caption = '27072837000100')) THEN
          F_QkRpoOF4.QRLabel3.caption:= F_QkRpoOF4.QRLabel3.caption+ ' - IBIRAPUA - BA';

        IF ((F_menu.LbCnpj.Caption = '28.666.922/0001-51') OR (F_menu.LbCnpj.Caption = '28666922000151')) THEN
          F_QkRpoOF4.QRLabel3.caption:= F_QkRpoOF4.QRLabel3.caption+ ' - MEDEIROS NETO - BA';

        F_QkRpoOF4.Label1.Caption     := Trim(MaskEdit3.Text);
        F_QkRpoOF4.Label2.Caption     := Trim(MaskEdit3.Text);
        F_QkRpoOF4.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) - 1);
        F_QkRpoOF4.Label4.Caption     := 'SEM MOV';
        F_QkRpoOF4.Label5.Caption     := MaskEdit1.Text;
        F_QkRpoOF4.QrLabel18.Caption  := DataExtenso(MaskEdit1.Text, False, '');
        F_QkRpoOF4.QrLabel34.Caption     := '';

        if chkAssinatura.Checked then  //Na unit ExportPack comentar as linhas que fizer referencia a: //Prg   : TFPrgrs; pois da erro ao destruir da memoria
        Begin
          Application.MessageBox('ATENÇÃO: Verifique se o cartão esta inserido no leitor!', 'Protocolo Oficial - Eletrônico', MB_IconInformation);

          if Application.MessageBox('Prosseguir com a operação?', 'Protocolo Oficial', Mb_IconQuestion + Mb_YesNo) = Id_No then
          begin
            MaskEdit1.SetFocus;
            Exit;
          end;

          certif := CoCertificados.Create;
          if (not certif.getCertificado) then
          begin
            Application.MessageBox('ATENÇÃO: Certificado não Selecionado.', 'Protocolo Oficial', MB_IconInformation);
            MaskEdit1.SetFocus;
            Exit;
          End;

          nome_arquivo := '';
          nome_arquivo := 'LIVRO_PROT_' + FormatDateTime('dd-mm-yyyy', StrToDate(MaskEdit1.Text)) + '_' + MaskEdit3.Text;

          dir := F_Menu.Label51.Caption+'PDF_ASSINADO_DIGITAL\PRO\'+MaskEdit3.Text+'\';





          if not DirectoryExists(dir) then
            ForceDirectories(dir);
          F_QkRpoOF4.QrLabel34.Caption     := ComboBox1.Text;

          F_QkRpoOF4.QRAssinadoDigitalmente.Enabled := true;
          F_QkRpoOF4.QuickRep1.Prepare;
          EXQR1.Report := F_QkRpoOF4.QuickRep1;
          EXQR1.ExportQRPDF(dir + nome_arquivo, True, False);

          sign := CoSisSign.Create;
          sign.ArquivoEntrada  := dir + nome_arquivo + '.pdf';
          sign.ArquivoSaida    := dir + nome_arquivo + '.pdf.p7s';
          sign.LocalAssinatura := enmLocalAssinatura_enmInterno;
          sign.TipoAssinatura  := enmTipoAssinatura_enmBinario;
          sign.Certificado     := certif.Certificado;

          if sign.SignFile then
          begin
            Application.MessageBox(Pchar('Arquivo assinado corretamente e gerado no diretorio: '+dir + nome_arquivo+'.pdf.p7s'), 'Protocolo Oficial - Eletrônico', MB_IconInformation);
          end
          else
          Application.MessageBox(Pchar(erros), 'Protocolo Oficial - Eletrônico', MB_IconInformation);

          sign := nil;
        End;

        F_QkRpoOF4.QuickRep1.Preview;
        F_QkRpoOF4.Destroy;
        F_QkRpoOF4 := NIL;
        Dm.ArqAux.Close;
        Exit;
      end;
      Application.CreateForm(TF_QkRpoOF4, F_QkRpoOF4);
      F_QkRpoOF4.QrLabel1.Caption   := 'LIVRO DE PROTOCOLO';
      If CheckBox1.Checked then F_QkRpoOF4.QrLabel1.Caption   := 'LIVRO AUXILIAR DE PROTOCOLOS EM ANDAMENTO';
      F_QkRpoOF4.QrLabel15.Caption  := MaskEdit5.Text + '-' + MaskEdit3.Text;

      IF ((F_menu.LbCnpj.Caption = '15.258.382/0001-25') OR (F_menu.LbCnpj.Caption = '15258382000125')) THEN
        F_QkRpoOF4.QRLabel3.caption:= '1º '+F_QkRpoOF4.QRLabel3.caption+ ' - SIMÕES FILHO BA';

      IF ((F_menu.LbCnpj.Caption = '27.072.837/0001-00') OR (F_menu.LbCnpj.Caption = '27072837000100')) THEN
        F_QkRpoOF4.QRLabel3.caption:= F_QkRpoOF4.QRLabel3.caption+ ' - IBIRAPUA - BA';


      IF ((F_menu.LbCnpj.Caption = '28.666.922/0001-51') OR (F_menu.LbCnpj.Caption = '28666922000151')) THEN
        F_QkRpoOF4.QRLabel3.caption:= F_QkRpoOF4.QRLabel3.caption+ ' - MEDEIROS NETO - BA';

      F_QkRpoOF4.ContaDetalhes:= 0;
      F_QkRpoOF4.Label1.Caption     := Trim(MaskEdit3.Text);
      F_QkRpoOF4.Label2.Caption     := Trim(MaskEdit3.Text);
      F_QkRpoOF4.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) + 1);
      F_QkRpoOF4.Label4.Caption     := 'COM MOV';
      F_QkRpoOF4.Label5.Caption     := MaskEdit1.Text;
      F_QkRpoOF4.QrLabel34.Caption     := '';

      if chkAssinatura.Checked then  //Na unit ExportPack comentar as linhas que fizer referencia a: //Prg   : TFPrgrs; pois da erro ao destruir da memoria
      Begin
        Application.MessageBox('ATENÇÃO: Verifique se o cartão esta inserido no leitor!', 'Protocolo Oficial - Eletrônico', MB_IconInformation);

        if Application.MessageBox('Prosseguir com a operação?', 'Protocolo Oficial', Mb_IconQuestion + Mb_YesNo) = Id_No then
        begin
          MaskEdit1.SetFocus;
          Exit;
        end;

        certif := CoCertificados.Create;
        if (not certif.getCertificado) then
        begin
          Application.MessageBox('ATENÇÃO: Certificado não Selecionado.', 'Protocolo Oficial', MB_IconInformation);
          MaskEdit1.SetFocus;
          Exit;
        End;

        nome_arquivo := '';
        nome_arquivo := 'LIVRO_PROT_' + FormatDateTime('dd-mm-yyyy', StrToDate(MaskEdit1.Text)) + '_' + MaskEdit3.Text;

        dir := F_Menu.Label51.Caption+'PDF_ASSINADO_DIGITAL\PRO\'+MaskEdit3.Text+'\';

        if not DirectoryExists(dir) then
          ForceDirectories(dir);

        F_QkRpoOF4.QrLabel34.Caption     := ComboBox1.Text;

        F_QkRpoOF4.QRAssinadoDigitalmente.Enabled := true;
        F_QkRpoOF4.QuickRep1.Prepare;
        EXQR1.Report := F_QkRpoOF4.QuickRep1;
        EXQR1.ExportQRPDF(dir + nome_arquivo, True, False);

        sign := CoSisSign.Create;
        sign.ArquivoEntrada  := dir + nome_arquivo + '.pdf';
        sign.ArquivoSaida    := dir + nome_arquivo + '.pdf.p7s';
        sign.LocalAssinatura := enmLocalAssinatura_enmInterno;
        sign.TipoAssinatura  := enmTipoAssinatura_enmBinario;
        sign.Certificado     := certif.Certificado;

        if sign.SignFile then
        begin
          Application.MessageBox(Pchar('Arquivo assinado corretamente e gerado no diretorio: '+dir + nome_arquivo+'.pdf.p7s'), 'Protocolo Oficial - Eletrônico', MB_IconInformation);
        end
        else
        Application.MessageBox(Pchar(erros), 'Protocolo Oficial - Eletrônico', MB_IconInformation);

        sign := nil;
      End;

      F_QkRpoOF4.QuickRep1.Preview;
      F_QkRpoOF4.Destroy;
      F_QkRpoOF4 := NIL;
    End
    Else
    Begin
      if (Dm.ArqAux.RecordCount = 0) then
      begin
        MessageBox(Handle, PChar('Movimento não encontrado.'), 'PROTOCOLO OFICIAL', MB_OK + MB_ICONINFORMATION);
        // Gerando sem movimento
        Application.CreateForm(TF_QkRpoOFA4, F_QkRpoOFA4);
        F_QkRpoOFA4.QrLabel1.Caption   := 'LIVRO DE PROTOCOLO';
        If CheckBox1.Checked then F_QkRpoOFA4.QrLabel1.Caption   := 'LIVRO AUXILIAR DE PROTOCOLOS EM ANDAMENTO';
        F_QkRpoOFA4.Label1.Caption     := Trim(MaskEdit3.Text);
        F_QkRpoOFA4.Label2.Caption     := Trim(MaskEdit3.Text);
        F_QkRpoOFA4.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) - 1);
        F_QkRpoOFA4.Label4.Caption     := 'SEM MOV';
        F_QkRpoOFA4.Label5.Caption     := MaskEdit1.Text;
        F_QkRpoOFA4.QrLabel18.Caption  := DataExtenso(MaskEdit1.Text, False, '');

        if chkAssinatura.Checked then  //Na unit ExportPack comentar as linhas que fizer referencia a: //Prg   : TFPrgrs; pois da erro ao destruir da memoria
        Begin
          Application.MessageBox('ATENÇÃO: Verifique se o cartão esta inserido no leitor!', 'Protocolo Oficial - Eletrônico', MB_IconInformation);

          if Application.MessageBox('Prosseguir com a operação?', 'Protocolo Oficial', Mb_IconQuestion + Mb_YesNo) = Id_No then
          begin
            MaskEdit1.SetFocus;
            Exit;
          end;

          certif := CoCertificados.Create;
          if (not certif.getCertificado) then
          begin
            Application.MessageBox('ATENÇÃO: Certificado não Selecionado.', 'Protocolo Oficial', MB_IconInformation);
            MaskEdit1.SetFocus;
            Exit;
          End;

          nome_arquivo := '';
          nome_arquivo := 'LIVRO_PROT_' + FormatDateTime('dd-mm-yyyy', StrToDate(MaskEdit1.Text)) + '_' + MaskEdit3.Text;

          dir := F_Menu.Label51.Caption+'PDF_ASSINADO_DIGITAL\PRO\'+MaskEdit3.Text+'\';

          if not DirectoryExists(dir) then
            ForceDirectories(dir);
//          F_QkRpoOF4.QrLabel34.Caption     := ComboBox1.Text;

          F_QkRpoOFA4.QRAssinadoDigitalmente.Enabled := true;

          F_QkRpoOFA4.QuickRep1.Prepare;
          EXQR1.Report := F_QkRpoOFA4.QuickRep1;
          EXQR1.ExportQRPDF(dir + nome_arquivo, True, False);

          sign := CoSisSign.Create;
          sign.ArquivoEntrada  := dir + nome_arquivo + '.pdf';
          sign.ArquivoSaida    := dir + nome_arquivo + '.pdf.p7s';
          sign.LocalAssinatura := enmLocalAssinatura_enmInterno;
          sign.TipoAssinatura  := enmTipoAssinatura_enmBinario;
          sign.Certificado     := certif.Certificado;

          if sign.SignFile then
          begin
            Application.MessageBox(Pchar('Arquivo assinado corretamente e gerado no diretorio: '+dir + nome_arquivo+'.pdf.p7s'), 'Protocolo Oficial - Eletrônico', MB_IconInformation);
          end
          else
          Application.MessageBox(Pchar(erros), 'Protocolo Oficial - Eletrônico', MB_IconInformation);

          sign := nil;
        End;


        F_QkRpoOFA4.QuickRep1.Preview;
        F_QkRpoOFA4.Destroy;
        F_QkRpoOFA4 := NIL;
        Dm.ArqAux.Close;
        Exit;
      end;
      Application.CreateForm(TF_QkRpoOFA4, F_QkRpoOFA4);
      F_QkRpoOFA4.QrLabel1.Caption   := 'LIVRO DE PROTOCOLO';
      If CheckBox1.Checked then F_QkRpoOFA4.QrLabel1.Caption   := 'LIVRO AUXILIAR DE PROTOCOLOS EM ANDAMENTO';
      F_QkRpoOFA4.QrLabel15.Caption  := MaskEdit5.Text + '-' + MaskEdit3.Text;
      F_QkRpoOFA4.Label1.Caption     := Trim(MaskEdit3.Text);
      F_QkRpoOFA4.Label2.Caption     := Trim(MaskEdit3.Text);
      F_QkRpoOFA4.Label3.Caption     := IntToStr(StrToInt(MaskEdit4.Text) + 1);
      F_QkRpoOFA4.Label4.Caption     := 'COM MOV';
      F_QkRpoOFA4.Label5.Caption     := MaskEdit1.Text;


      if chkAssinatura.Checked then  //Na unit ExportPack comentar as linhas que fizer referencia a: //Prg   : TFPrgrs; pois da erro ao destruir da memoria
      Begin
        Application.MessageBox('ATENÇÃO: Verifique se o cartão esta inserido no leitor!', 'Protocolo Oficial - Eletrônico', MB_IconInformation);

        if Application.MessageBox('Prosseguir com a operação?', 'Protocolo Oficial', Mb_IconQuestion + Mb_YesNo) = Id_No then
        begin
          MaskEdit1.SetFocus;
          Exit;
        end;

        certif := CoCertificados.Create;
        if (not certif.getCertificado) then
        begin
          Application.MessageBox('ATENÇÃO: Certificado não Selecionado.', 'Protocolo Oficial', MB_IconInformation);
          MaskEdit1.SetFocus;
          Exit;
        End;

        nome_arquivo := '';
        nome_arquivo := 'LIVRO_PROT_' + FormatDateTime('dd-mm-yyyy', StrToDate(MaskEdit1.Text)) + '_' + MaskEdit3.Text;

        dir := F_Menu.Label51.Caption+'PDF_ASSINADO_DIGITAL\PRO\'+MaskEdit3.Text+'\';

        if not DirectoryExists(dir) then
          ForceDirectories(dir);

//        F_QkRpoOFA4.QrLabel34.Caption     := ComboBox1.Text;


        F_QkRpoOFA4.QRAssinadoDigitalmente.Enabled := true;
        F_QkRpoOFA4.QuickRep1.Prepare;
        EXQR1.Report := F_QkRpoOFA4.QuickRep1;
        EXQR1.ExportQRPDF(dir + nome_arquivo, True, False);

        sign := CoSisSign.Create;
        sign.ArquivoEntrada  := dir + nome_arquivo + '.pdf';
        sign.ArquivoSaida    := dir + nome_arquivo + '.pdf.p7s';
        sign.LocalAssinatura := enmLocalAssinatura_enmInterno;
        sign.TipoAssinatura  := enmTipoAssinatura_enmBinario;
        sign.Certificado     := certif.Certificado;

        if sign.SignFile then
        begin
          Application.MessageBox(Pchar('Arquivo assinado corretamente e gerado no diretorio: '+dir + nome_arquivo+'.pdf.p7s'), 'Protocolo Oficial - Eletrônico', MB_IconInformation);
        end
        else
        Application.MessageBox(Pchar(erros), 'Protocolo Oficial - Eletrônico', MB_IconInformation);

        sign := nil;
      End;


      F_QkRpoOFA4.QuickRep1.Preview;
      F_QkRpoOFA4.Destroy;
      F_QkRpoOFA4 := NIL;
    End;
  End;

  //Statusbar1.SimpleText := 'Fim do Relatório';
  //Statusbar1.UpDate;

  BitBtn3.SetFocus;
end;

procedure TF_RPO.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then maskedit1.setfocus;
  if key = 13 then maskedit4.setfocus;
end;

procedure TF_RPO.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
  maskedit2.Text := DateToStr(date);
  //Comentado OS 693
  {//Localiza ultimo Livro e Folha
  dm.td.close;
  dm.td.RequestLive := False;
  dm.td.sql.Clear;
  dm.td.sql.add('select max(livro_a) as livro, max(folha_a) as folha from td');
  dm.td.open;
  dm.td.RequestLive := True;
  if dm.td.FieldByName('livro').AsString = '' then
  begin
    livro_a := 1;
    folha_a := 1;
  end
  else
  begin
    livro_a := dm.td.FieldByName('livro').AsInteger;
    folha_a := dm.td.FieldByName('folha').AsInteger;
  end;
    MaskEdit3.Text := IntToStr(livro_a);
    MaskEdit4.Text := IntToStr(folha_a);}

  MaskEdit1.SetFocus;
  Combobox2.text := 'Oficial';
  MaskEdit6.Text := '18:00';
end;

procedure TF_RPO.MaskEdit3Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit3.Text)) then MaskEdit3.Text := '0';
end;

procedure TF_RPO.MaskEdit4Exit(Sender: TObject);
begin
  if (not ValidNumero(MaskEdit4.Text)) then MaskEdit4.Text := '0';
end;

procedure TF_RPO.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RPO.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_RPO.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RPO.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

procedure TF_RPO.FormShow(Sender: TObject);
begin
  dm.qryGenerico_Auxiliar2.Close;
  dm.qryGenerico_Auxiliar2.SQL.Clear;
  dm.qryGenerico_Auxiliar2.SQL.Add('select livrop, folhap, livro_lva_p, folha_lva_p from configur where id_eselo = :id_selo');
  dm.qryGenerico_Auxiliar2.ParamByName('id_selo').Value:= id_eselo;
  dm.qryGenerico_Auxiliar2.Open;
  if ((F_Menu.Label39.Caption <> '27.282.471/0001-96') and (F_Menu.Label39.Caption <> '27282471000196')) Then // Palmas de monte alto
  Begin
    MaskEdit3.Text:= dm.qryGenerico_Auxiliar2.FieldByName('livro_lva_p').AsString;
    MaskEdit4.Text:= dm.qryGenerico_Auxiliar2.FieldByName('folha_lva_p').AsString;
  End
  Else
  Begin
    MaskEdit3.Text:= dm.qryGenerico_Auxiliar2.FieldByName('livro_lva_p').AsString;
    MaskEdit4.Text:= dm.qryGenerico_Auxiliar2.FieldByName('folha_lva_p').AsString;
  End;
end;

end.
