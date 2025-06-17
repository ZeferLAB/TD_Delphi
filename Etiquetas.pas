unit Etiquetas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave, Db, DbTables;

type
  TF_Etiquetas = class(TForm)
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Bevel2: TBevel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Qry1: TQuery;
    Qry2: TQuery;
    CheckBox2: TCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DateEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Etiquetas: TF_Etiquetas;
  qtde_mat, qtde_atos, qtde_dajes : Integer;

implementation

{$R *.DFM}

uses Menu, FuncGeral, DMTD;


    // Copiar a DLL para a pasta c:\windows\system
    // Instalar o Driver da Impressora e Deixar como padrão
    function  A_Set_Darkness ( darkness:integer):integer;stdcall;external 'WINPPLA.DLL'; // Seta funcao de Intensidade da impressao
    function  A_CreatePrn    ( selection:integer;FileName:pchar):integer;stdcall;external 'WINPPLA.DLL';   // Inicia Operacao da Impressora 
    function  A_Print_Out    ( width,height,copies,amount:integer):integer;stdcall;external 'WINPPLA.DLL';  // Qtade de etiquetas
    function  A_Prn_Text     ( x,y,ori,font,typee,hor_factor,ver_factor:integer;mode:char;numeric:integer;data:pchar):integer;stdcall;external 'WINPPLA.DLL'; // conteudo que vai ser impresso
    function  A_Prn_Barcode  ( x,y,ori:integer;typee:char;narrow,width,height:integer;mode:char;numeric:integer;data:pchar):integer;stdcall;external 'WINPPLA.DLL';
    function  A_Prn_Text_TrueType ( x,y,FSize:integer;FType:pchar;Fspin,FWeight,FItalic,FUnline,FStrikeOut:integer;id_name,data:pchar;mem_mode:integer):integer;stdcall;external 'WINPPLA.DLL';
    function  A_Get_Graphic  ( x,y,mem_mode:integer;format:char;filename:pchar):integer;stdcall;external 'WINPPLA.DLL';
    function  A_Draw_Box     ( mode, x, y, width, height, top, side:integer):integer;stdcall;external 'WINPPLA.DLL';
    function  A_Draw_Line    (mode, x, y, width, height:integer):integer;stdcall;external 'WINPPLA.DLL';
    Procedure A_ClosePrn     ();stdcall;external 'WINPPLA.DLL';

procedure TF_Etiquetas.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Etiquetas.BitBtn2Click(Sender: TObject);
begin
  DateEdit1.SetFocus;
end;

procedure TF_Etiquetas.FormActivate(Sender: TObject);
begin
  If (F_Menu.Label7.Caption = 'LAURO DE FREITAS') or (F_Menu.Label7.Caption = 'TEIXEIRA DE FREITAS') then
  Begin
    CheckBox2.Checked := True;
    Label5.Caption := 'Quantidade';
    ComboBox1.Text := '1';
  End  
  Else Label5.Caption := 'Posição';


  DateEdit1.Date := now;
  DateEdit2.Date := now;
  DateEdit1.SetFocus;
end;

procedure TF_Etiquetas.DateEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then DateEdit2.SetFocus;
end;

procedure TF_Etiquetas.DateEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_Etiquetas.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

function trocar_virg_ponto(valor : currency):string;
var
  valor_string : string;
begin
  valor_string := FormatCurr('########0.00',valor);
  Result := StringReplace(valor_string,'.','',[rfreplaceall]);
  Result := StringReplace(valor_string,',','.',[rfreplaceall]);
end;

function formata_data(data : TDateTime):string;
begin
  Result := FormatDateTime('yyyymmdd',data);
end;

Function PegaSelo(protocolo : String) : String;
begin
  Result := '';
  dm.Selos.Close;
  dm.Selos.sql.Clear;
  dm.selos.sql.add('select * from selos where recibo = ' + protocolo);
  dm.Selos.Open;
  if dm.Selos.RecordCount <> 0 then
    Result := dm.Selos.FieldByName('selo_serie').AsString + '/' + dm.Selos.FieldByName('selo_numero').AsString + ', ' ;
  dm.Selos.Close;
end;


procedure TF_Etiquetas.BitBtn1Click(Sender: TObject);
var
  tam_lin_mat, tam_lin_atos, tam_lin_daje, posicao, x, qtde_etq : integer;
  sai, foi : Boolean;
  lin_mat, lin_mat2, lin_atos, lin_dajes, lin_atos2, lin_dajes2 : String;
  tam_fonte : Integer;
  cabec_argox, livro, folhas, numero, cidade, cargo, emol : String;
begin
  try
    posicao := StrToInt(ComboBox1.Text);
  Except
    posicao := 0;
  End;

  qtde_etq := StrToInt(ComboBox1.Text);
  posicao  := 1;

  foi := false;
  Qry1.close;
  Qry1.sql.Clear;
  Qry1.sql.Add('SELECT p_auxiliar, data_r, protocolo, data_p, ext_nat, daje, v_emolumentos, v_tribunal, lvf ');
  Qry1.sql.Add(' FROM td  WHERE');
  Qry1.sql.Add(' data_p BETWEEN ' + FormatDateTime('yyyymmdd',DateEdit1.Date) + ' and ' + FormatDateTime('yyyymmdd',DateEdit2.Date));
  if MaskEdit1.Text <> '' then
    Qry1.sql.Add(' and protocolo BETWEEN ' + MaskEdit1.Text + ' and ' + MaskEdit2.Text);
  Qry1.sql.Add(' ORDER BY protocolo');
  Qry1.open;
  if (Qry1.IsEmpty) then
  begin
    ShowMessage('Não existem protocolos registrados com esta data');
    exit;
  end;
  Qry2.close;
  Qry2.sql.Clear;
  Qry2.sql.Add('truncate table etiquetas');
  Qry2.ExecSQL;
  while (not Qry1.eof) do
  try
    if (posicao>1) and (foi=false) then
    begin
      for x := 1 to (posicao-1) do
      begin
        Qry2.close;
        Qry2.sql.Clear;
        Qry2.sql.Add('insert into etiquetas (protocolo,data_r) values (');
        Qry2.sql.Add(Qry1.fieldbyname('p_auxiliar').AsString + ',');
        Qry2.sql.Add(formata_data(Qry1.fieldbyname('data_r').AsDateTime) + ')');
        Qry2.ExecSQL;
        foi := true;
      end;
    end
    else
    begin
      Qry2.close;
      Qry2.sql.Clear;
      Qry2.sql.Add('insert into etiquetas (protocolo, data_r, registro, data_p, natureza, daje, emolumentos, taxas) values(');
      Qry2.sql.Add(QuotedStr(Qry1.fieldbyname('p_auxiliar').AsString) + ',');
      Qry2.sql.Add(QuotedStr(ConvData(Qry1.fieldbyname('data_r').AsString)) + ',');
      Qry2.sql.Add(QuotedStr(Qry1.fieldbyname('protocolo').AsString) + ',');
      Qry2.sql.Add(QuotedStr(ConvData(Qry1.fieldbyname('data_p').AsString)) + ',');

      If Qry1.fieldbyname('lvf').AsString = 'X' then
        Qry2.sql.Add(QuotedStr(Qry1.fieldbyname('lvf').AsString) + ',')   //ext_nat CAMPO ANTIGO
      Else Qry2.sql.Add(QuotedStr(Qry1.fieldbyname('ext_nat').AsString) + ',');

      Qry2.sql.Add(QuotedStr(Qry1.fieldbyname('daje').AsString) + ',');
      Qry2.sql.Add(StringReplace(FloatToStr(Qry1.fieldbyname('v_emolumentos').Value), ',', '.', [rfReplaceAll]) + ',');
      Qry2.sql.Add(StringReplace(FloatToStr(Qry1.fieldbyname('v_tribunal').Value), ',', '.', [rfReplaceAll]));
      Qry2.sql.Add(')');
      Qry2.ExecSQL;
      Qry1.Next;
    end;
  except
    ShowMessage('Problemas para gerar as etiquetas!!');
    exit;
  end;
  Qry2.close;
  Qry2.sql.Clear;
  Qry2.sql.Add('select * from etiquetas order by protocolo');
  Qry2.open;

  if CheckBox2.Checked then
  begin
    tam_fonte := 9;
    cabec_argox := '';
    For x:= 1 to qtde_etq do
    Begin
      qry2.FindFirst;
      while (NOT qry2.Eof) Do
      begin
        A_CreatePrn(1, 'LPT1'); // Inicia Operacao da Impressora
        A_Set_Darkness(12);

        if (F_Menu.Label7.Caption = 'TEIXEIRA DE FREITAS') then
        begin
          A_Prn_Text(320, 155,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Oficial/Autorizado._________________________________________'));
          A_Prn_Text(320, 137,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Taxas        : R$ ' + StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True)));
          A_Prn_Text(320, 125,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Emolumentos  : R$ ' + StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True)));
          A_Prn_Text(320, 113,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar('DAJE         : ' + qry2.fieldByname('daje').AsString));
          A_Prn_Text(320, 101,  3, tam_fonte, 2, 1, 1, 'n', 2, pchar(F_Menu.Label7.Caption + ' -BA ' + qry2.fieldByname('data_p').AsString + '  /  Selo ' + PegaSelo(qry2.fieldByname('protocolo').AsString)));
          A_Prn_Text(320, 89,   3, tam_fonte, 2, 1, 1, 'n', 2, pchar('de Titulos e Documentos sob o n: ' + qry2.fieldByname('registro').AsString));

          If qry2.fieldByname('natureza').AsString = 'X' then
            A_Prn_Text(320, 77,   3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Registrado e digitalizado hoje no Livro F '))
          Else
            A_Prn_Text(320, 77,   3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Registrado e digitalizado hoje no Livro B '));

          A_Prn_Text(320, 65,   3, tam_fonte, 2, 1, 1, 'n', 2, pchar('Prenotado sob o n: ' + qry2.fieldByname('protocolo').AsString + ' em ' + qry2.fieldByname('data_r').AsString));
        end
        else
        begin
          A_Prn_Text(320, 155,  3, tam_fonte, 0, 1, 1, 'n', 2, pchar('Oficial/Autorizado._________________________________________'));
          A_Prn_Text(320, 137,  3, tam_fonte, 0, 1, 1, 'n', 2, pchar('Taxas        : R$ ' + StrCurr(qry2.fieldByname('taxas').AsCurrency, 10, True)));
          A_Prn_Text(320, 125,  3, tam_fonte, 0, 1, 1, 'n', 2, pchar('Emolumentos  : R$ ' + StrCurr(qry2.fieldByname('emolumentos').AsCurrency, 10, True)));
          A_Prn_Text(320, 113,  3, tam_fonte, 0, 1, 1, 'n', 2, pchar('DAJE         : ' + qry2.fieldByname('daje').AsString));
          A_Prn_Text(320, 101,  3, tam_fonte, 0, 1, 1, 'n', 2, pchar(F_Menu.Label7.Caption + ' -BA ' + qry2.fieldByname('data_p').AsString + '  /  Selo ' + PegaSelo(qry2.fieldByname('protocolo').AsString)));
          A_Prn_Text(320, 89,   3, tam_fonte, 0, 1, 1, 'n', 2, pchar('de Titulos e Documentos sob o n: ' + qry2.fieldByname('registro').AsString));

          If qry2.fieldByname('natureza').AsString = 'X' then
            A_Prn_Text(320, 77,   3, tam_fonte, 0, 1, 1, 'n', 2, pchar('Registrado e digitalizado hoje no Livro F '))
          Else
            A_Prn_Text(320, 77,   3, tam_fonte, 0, 1, 1, 'n', 2, pchar('Registrado e digitalizado hoje no Livro B '));

          A_Prn_Text(320, 65,   3, tam_fonte, 0, 1, 1, 'n', 2, pchar('Prenotado sob o n: ' + qry2.fieldByname('protocolo').AsString + ' em ' + qry2.fieldByname('data_r').AsString));
        end;
        qry2.Next;
      end;
    end;
  end
  else
  begin
    RvDataSetConnection1.DataSet := Qry2;
    RvProject1.SetParam('cartorio', F_Menu.Label9.Caption);
    RvProject1.SetParam('cidade', F_Menu.Label7.Caption + '-BA');
    RvProject1.Execute;
  end;
  Qry1.close;
  Qry2.close;

  A_Print_Out(1, 1, 1, 1);
  A_ClosePrn;
end;

procedure TF_Etiquetas.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_Etiquetas.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_Etiquetas.DateEdit1Exit(Sender: TObject);
begin
  DateEdit2.Text := DateEdit1.Text;
end;

end.
