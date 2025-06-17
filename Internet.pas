unit Internet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls, Db, convXLS_TLB, ExtCtrls, DBTables,
  Grids, DBGrids, WPDefs, WPPrint, WpWinCtr, WPRich, jpeg;

type
  Importacao = ^TImporta;
  TImporta = record
      cliente    : string;
      contrato   : string;
      grupo      : string;
      cota       : string;
      nome       : string;
      endereco   : string;
      bairro     : string;
      cidade     : string;
      cep        : string;
      uf         : string;
      valor1     : string;
      data1      : string;
      valor2     : string;
      data2      : string;
      valor3     : string;
      data3      : string;
      valor4     : string;
      data4      : string;
      valor5     : string;
      data5      : string;
      valor6     : string;
      data6      : string;
      valor7     : string;
      data7      : string;
      valor8     : string;
      data8      : string;
      valor9     : string;
      data9      : string;
      valor10    : string;
      data10     : string;
      valor11    : string;
      data11     : string;
      valor12    : string;
      data12     : string;
      valor13    : string;
      data13     : string;
      valor14    : string;
      data14     : string;
      valor15    : string;
      data15     : string;
      valor16    : string;
      data16     : string;
      valorTotal : string;
  end;


type
  TF_Inter = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    OpenDialog1: TOpenDialog;
    BitBtn5: TBitBtn;
    Bevel1: TBevel;
    Memo1: TMemo;
    SaveDialog1: TSaveDialog;
    MaskEdit3: TMaskEdit;
    Label17: TLabel;
    Bevel2: TBevel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    Label4: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    RichEdit3: TRichEdit;
    ControlBar1: TControlBar;
    Label36: TLabel;
    StatusBar1: TStatusBar;
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    Procedure Carrega_Mercabenco(Sender : TOBJect);
    Procedure Carrega_Lideranca(Sender : TOBJect);
    Procedure Carrega_Secundino(Sender : TOBJect);
    Procedure Carrega_Ernandes(Sender : TOBJect);
    Procedure Carrega_WOCosta(Sender : TOBJect);
    Procedure Carrega_Scania(Sender : TOBJect);
    Procedure Carrega_Empenho(Sender : TOBJect);
    Procedure Carrega_AdvMoraes(Sender : TOBJect);
//    Procedure CarregaSIMCRED(Sender : TOBJect);
    Procedure Gravar(Sender : TOBject);
    Procedure TriarTitulos(Sender : TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Importa : Importacao;
    ListImportacao : TList;
    function BuscaNomeCliente(CodCli : Integer) : string;
    function GravaImportacao(Tabela : string) : Boolean;
  public
    { Public declarations }
  end;

var
  F_Inter: TF_Inter;
  F1        : TextFile;
  erro      : Boolean;
  arq_lendo, n_arq, narq : String;
  CodCli    : Integer;
  nomepo, endpo, cidpo, estpo, baipo, ceppo, codpo, codfil, nomeag, protocolo, docpo,tipdoc1 : String;
  pi, pf, workdir,cedente, codpo2 : String;
  q_reg : Integer;
  qcartorio : String;

implementation

uses Menu, DMTD, QkLogEr, FuncGeral, ProcGeral;

{$R *.DFM}

Procedure TF_Inter.TriarTitulos(Sender : TObject);
var
  cepp : String;
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq_lendo);
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    while (not Dm.ArqAux.Eof) do
    begin
      //Verificando endereço
      if (Trim(Dm.ArqAux.FieldByName('endereco').asString) = '') then
         Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Endereço não encontrado na linha ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
      if (Trim(Dm.ArqAux.FieldByName('bairro').asString) = '') then
         Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Bairro não encontrado na linha ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
      if (Trim(Dm.ArqAux.FieldByName('cidade').asString) = '') then
         Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Cidade não encontrada na linha ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
      if (Trim(Dm.ArqAux.FieldByName('estado').asString) = '') then
         Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Unidade Fiscal não encontrada na linha ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
      if (Trim(Dm.ArqAux.FieldByName('cep').asString) = '') then
         Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'CEP não encontrado na linha ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli)
      else
      begin
        cepp := '';
        cepp := TirarTudo(Trim(Dm.ArqAux.FieldByName('cep').asString), '-', '','');
        if (ContaZeros(cepp) < 7) then
        begin
          Dm.Cep.Close;
          Dm.Cep.Sql.Clear;
          Dm.Cep.Sql.Add('SELECT estado, cidade FROM cep');
          Dm.Cep.Sql.Add('WHERE');
          Dm.Cep.Sql.Add('cep = ' + Chr(39) + cepp + Chr(39));
          Dm.Cep.Open;
          if (Dm.Cep.RecordCount = 0) then
             Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'CEP da linha ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5) + ' não encontrado no cadastro de ceps.', CodCli)
          else
          begin
            if (Dm.Cep.FieldByName('estado').asString <> Trim(Dm.ArqAux.FieldByName('estado').asString)) then
               Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Unidade Fiscal(' + Trim(Dm.ArqAux.FieldByName('estado').asString) + ') da linha ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5) + ' diferente com a encontrada no cadastro de CEP(' + Dm.Cep.FieldByName('estado').asString + ').', CodCli);
            if (UpperCase(RetiraAcentos(Trim(Dm.Cep.FieldByName('cidade').asString))) <> Trim(Dm.ArqAux.FieldByName('cidade').asString)) then
               Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Cidade(' + Trim(Dm.ArqAux.FieldByName('cidade').asString) + ') da linha ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5) + ' diferente com a encontrada no cadastro de CEP(' + UpperCase(RetiraAcentos(Trim(Dm.Cep.FieldByName('cidade').asString))) + ').', CodCli);
          end;
          Dm.Cep.Close;
        end
        else
           Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'CEP da linha ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5) + ' inválido(' + cepp + ').', CodCli);
      end;
      if (Trim(Dm.ArqAux.FieldByName('contrato').asString) = '') then
      begin
        Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Nº de contrado em branco na linha ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
      end;
      if (CodCli = 3) then
      begin
        if (Trim(Dm.ArqAux.FieldByName('parcelas').asString) = '') then
           Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Parcela não encontrada ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
        if (Dm.ArqAux.FieldByName('data_parc').asDateTime = 0) then
           Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Data de parcela não encontrada ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
        // Data 1ª parcela
        if (Dm.ArqAux.FieldByName('data_parc').asDateTime > 0) then
           if (not ValidData(Dm.ArqAux.FieldByName('data_parc').asString)) then
              Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Data da 1ª parcela com problemas ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
        //Data 2ª parcela
        if (Dm.ArqAux.FieldByName('data_parc1').asDateTime > 0) then
           if (not ValidData(Dm.ArqAux.FieldByName('data_parc1').asString)) then
              Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Data da 2ª parcela com problemas ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
        if (Dm.ArqAux.FieldByName('data_parc2').asDateTime > 0) then
           if (not ValidData(Dm.ArqAux.FieldByName('data_parc2').asString)) then
              Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Data da 3ª parcela com problemas ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
        if (Dm.ArqAux.FieldByName('data_parc3').asDateTime > 0) then
           if (not ValidData(Dm.ArqAux.FieldByName('data_parc3').asString)) then
              Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Data da 4ª parcela com problemas ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
        if (Dm.ArqAux.FieldByName('data_parc4').asDateTime > 0) then
           if (not ValidData(Dm.ArqAux.FieldByName('data_parc4').asString)) then
              Atualiza_LogErro(Trim(Label4.Caption), Label3.Caption, 'Data da 5ª parcela com problemas ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
      end;
      Dm.ArqAux.Next;
    end;
  end;
  Dm.ArqAux.Close;
end;

Procedure Grava_linha(linha : String);
begin
  WriteLn(F1, linha);
end;

Function Tiraponto( valor : string ): string;
var
 x: integer;
begin
  valor  := trim(valor);
  result := '';
  for x := 1 to length(valor) do
    begin
      if (copy(valor,x,1) <> '.') and (copy(valor,x,1) <> '/') and (copy(valor,x,1) <> ',') then result := result + copy(valor,x,1);
    end;
end;

Function BuscaPortador(Filial : String; Cliente, CodAgencia : Integer) : Boolean;
begin
  Result := False;
  Dm.Escrit.Close;
  Dm.Escrit.Sql.Clear;
  Dm.Escrit.Sql.Add('SELECT * FROM escrit');
  Dm.Escrit.Sql.Add('WHERE');
  if (Trim(Filial) <> '') then
  begin
    Dm.Escrit.Sql.Add('    agencia  = ' + Chr(39) + Filial + Chr(39));
    Dm.Escrit.Sql.Add('AND ncliente = ' + IntToStr(Cliente));
  end
  else
  begin
    Dm.Escrit.Sql.Add('    cod_ag   = ' + IntToStr(CodAgencia));
    Dm.Escrit.Sql.Add('AND ncliente = ' + IntToStr(Cliente));
  end;
  Dm.Escrit.Open;
  if (Dm.Escrit.RecordCount <> 0) then
  begin
    Result    := True;

    if (CodCli <> 6) and (CodCli <> 7) and (CodCli <> 11) then
     begin
      nomepo    := Dm.Escrit.FieldByName('escritorio').asString;
      endpo     := Dm.Escrit.FieldByName('endereco').asString;
      cidpo     := Dm.Escrit.FieldByName('cidade').asString;
      estpo     := Dm.Escrit.FieldByName('estado').asString;
      baipo     := Dm.Escrit.FieldByName('bairro').asString;
      ceppo     := Dm.Escrit.FieldByName('cep').asString;
      codpo     := Dm.Escrit.FieldByName('codigo').asString;
      codfil    := Dm.Escrit.FieldByName('cod_ag').asString;
      nomeag    := Dm.Escrit.FieldByName('agencia').asString;
     end;

    if (CodCli = 6)then
    begin
      nomepo    := Dm.ArqAux.FieldByName('cliente').asString;
      endpo     := Dm.ArqAux.FieldByName('end_cli').asString;
      cidpo     := Dm.ArqAux.FieldByName('cid_cli').asString;
      estpo     := Dm.ArqAux.FieldByName('est_cli').asString;
      baipo     := Dm.ArqAux.FieldByName('bai_cli').asString;
      ceppo     := Dm.ArqAux.FieldByName('cep_cli').asString;
      codpo     := Dm.Escrit.FieldByName('codigo').asString;
      codfil    := Dm.Escrit.FieldByName('cod_ag').asString;
      nomeag    := Dm.Escrit.FieldByName('agencia').asString;
      tipdoc1   := 'CNPJ';
      docpo     := Dm.ArqAux.FieldByName('doc_cli').asString;
    end;

    if (CodCli = 11) then
     begin

      if (Dm.ArqAux.FieldByName('cep').asinteger >= 14500000)and
         (Dm.ArqAux.FieldByName('cep').asinteger <= 16999999)then
       begin
        nomeag    := 'W.O.Costa- S.J. do Rio Preto-SP';
        nomepo    := 'W.O.Costa- S.J. do Rio Preto-SP';//W.O.Costa Advocacia';
        endpo     := 'Rua: Marechal Deodoro, 3131 - 4º andar - sala 43';
        cidpo     := 'São José do Rio Preto';
        estpo     := 'SP';
        baipo     := 'Centro';
        ceppo     := '15010070';
        codpo     := Dm.Escrit.FieldByName('codigo').asString;
        codfil    := '1';
       end;

      if (Dm.ArqAux.FieldByName('cep').asinteger >= 19000000)and
         (Dm.ArqAux.FieldByName('cep').asinteger <= 19999999)then
       begin
        nomeag    := 'W.O.Costa- Presidente Prudente-SP';
        nomepo    := 'W.O.Costa- Presidente Prudente-SP';//'W.O.Costa Advocacia';
        endpo     := 'Rua Siqueira CamPos, 699 - 7º andar - sala 74';
        cidpo     := 'Presidente Prudente';
        estpo     := 'SP';
        baipo     := 'Centro';
        ceppo     := '19010061';
        codpo     := Dm.Escrit.FieldByName('codigo').asString;
        codfil    := '2';
       end;


      if (Dm.ArqAux.FieldByName('cep').asinteger >= 77000000)and
         (Dm.ArqAux.FieldByName('cep').asinteger <= 77999999)then
       begin
        nomeag    := 'W.O.Costa- Palmas-TO';
        nomepo    := 'W.O.Costa- Palmas-TO';//'W.O.Costa Advocacia';
        endpo     := 'Rua Juscelino Kubitschek, 106 - Sul - Lote 10 - Sobreloja- sala4';
        cidpo     := 'Palmas';
        estpo     := 'TO';
        baipo     := '';
        ceppo     := '77020040';
        codpo     := Dm.Escrit.FieldByName('codigo').asString;
        codfil    := '3';
       end;

     end;


    if (CodCli = 7) then
     begin
      if(Dm.ArqAux.FieldByName('financeira').asstring = '01') and (DM.ArqAux.FieldByName('produto').asstring = 'C') then
       nomepo   := 'UNIBANCO S/A';
      if(DM.ArqAux.FieldByName('financeira').asstring = '01') and (DM.ArqAux.FieldByName('produto').asstring = 'L') then
       nomepo   := 'UNIBANCO S/A ARRENDAMENTO MERCANTIL';
      if(DM.ArqAux.FieldByName('financeira').asstring = '02') and (DM.ArqAux.FieldByName('produto').asstring = 'C') then
       nomepo   := 'UNIBANCO S/A';
      if(DM.ArqAux.FieldByName('financeira').asstring = '02') and (DM.ArqAux.FieldByName('produto').asstring = 'L') then
       nomepo   := 'UNIBANCO S/A ARRENDAMENTO MERCANTIL';
      if(DM.ArqAux.FieldByName('financeira').asstring = '03') and (DM.ArqAux.FieldByName('produto').asstring = 'C') then
       nomepo   := 'BANCO DIBENS S/A';
      if(DM.ArqAux.FieldByName('financeira').asstring = '03') and (DM.ArqAux.FieldByName('produto').asstring = 'L') then
       nomepo   := 'BANCO DIBENS  LEASING';
      if(DM.ArqAux.FieldByName('financeira').asstring = '04') and (DM.ArqAux.FieldByName('produto').asstring = 'L') then
       nomepo   := 'BANCO CONTINENTAL LEASING S/A';
      if(DM.ArqAux.FieldByName('financeira').asstring = '05') then
       nomepo   := 'PONTUAL';
      if(DM.ArqAux.FieldByName('financeira').asstring = '06') then
       nomepo   := 'MARTINELLI';
      if(DM.ArqAux.FieldByName('financeira').asstring = '07') then
       nomepo   := 'PONTUAL LEASING';
      if(DM.ArqAux.FieldByName('financeira').asstring = '08') and (DM.ArqAux.FieldByName('produto').asstring = 'C') then
       nomepo   := 'BANCO ITAU S/A';
      if(DM.ArqAux.FieldByName('financeira').asstring = '08') and (DM.ArqAux.FieldByName('produto').asstring = 'L') then
       nomepo   := 'CIA ITAU LEASING DE ARRENDAMENTO MERCANTIL S/A';
      if(DM.ArqAux.FieldByName('financeira').asstring = '09') then
       nomepo   := 'CIFRA S/A CRÉDITO, FINANCIAMENTO E INVESTIMENTO';
      if(DM.ArqAux.FieldByName('financeira').asstring = '10') then
       nomepo   := 'BANDEIRANTES';
      if(DM.ArqAux.FieldByName('financeira').asstring = '11') then
       nomepo   := 'BMSP';
      if(DM.ArqAux.FieldByName('financeira').asstring = '12') then
       nomepo   := 'FINASA LEASING';
      if(DM.ArqAux.FieldByName('financeira').asstring = '13') then
       nomepo   := 'FINASA ADMINISTRADORA';
      if(DM.ArqAux.FieldByName('financeira').asstring = '23') then
       nomepo   := 'BANCO FORD S/A';
      if(DM.ArqAux.FieldByName('financeira').asstring = '24') then
       nomepo   := 'BANCO MERCANTIL DE SÃO PAULO';
      if(DM.ArqAux.FieldByName('financeira').asstring = '30') then
       nomepo   := 'BV FINANCEIRA S/A CFI';
      if(DM.ArqAux.FieldByName('financeira').asstring = '33') and (DM.ArqAux.FieldByName('produto').asstring = 'C') then
       nomepo   := 'BANCO ITAUCRED FINANCIAMENTOS S.A.';
      if(DM.ArqAux.FieldByName('financeira').asstring = '33') and (DM.ArqAux.FieldByName('produto').asstring = 'L') then
       nomepo   := 'FINAUSTRIA ARRENDAMENTO MERCANTIL';
      if(DM.ArqAux.FieldByName('financeira').asstring = '36') and (DM.ArqAux.FieldByName('produto').asstring = 'C') then
       nomepo   := 'BANCO FIAT S/A';
      if(DM.ArqAux.FieldByName('financeira').asstring = '36') and (DM.ArqAux.FieldByName('produto').asstring = 'L') then
       nomepo   := 'FIAT LEASING ARRENDAMENTO MERCANTIL';
      if(DM.ArqAux.FieldByName('financeira').asstring = '36') and (DM.ArqAux.FieldByName('produto').asstring = 'S') then
       nomepo   := 'FIAT ADMINISTRADORA DE CONSORCIOS LTDA';
      if(DM.ArqAux.FieldByName('financeira').asstring = '37') and (DM.ArqAux.FieldByName('produto').asstring = 'C') then
       nomepo   := 'BANCO FIAT S/A';
      if(DM.ArqAux.FieldByName('financeira').asstring = '37') and (DM.ArqAux.FieldByName('produto').asstring = 'L') then
       nomepo   := 'CIA ITAU LEASING DE ARRENDAMENTO MERCANTIL';
      if(DM.ArqAux.FieldByName('financeira').asstring = '37') and (DM.ArqAux.FieldByName('produto').asstring = 'S') then
       nomepo   := 'FIAT ADMINISTRADORA DE CONSORCIOS LTDA';


      endpo     := Dm.Escrit.FieldByName('endereco').asString;
      cidpo     := Dm.Escrit.FieldByName('cidade').asString;
      estpo     := Dm.Escrit.FieldByName('estado').asString;
      baipo     := Dm.Escrit.FieldByName('bairro').asString;
      ceppo     := Dm.Escrit.FieldByName('cep').asString;
      codpo     := Dm.Escrit.FieldByName('codigo').asString;
      codfil    := Dm.Escrit.FieldByName('cod_ag').asString;
      nomeag    := Dm.Escrit.FieldByName('agencia').asString;
      cedente   := Dm.Escrit.FieldByName('escritorio').asString;
     end;

   { if (CodCli = 11) then
     begin
      if (copy(Dm.ArqAux.FieldByName('financeira').asstring,1,3) = 'BAN')then
       nomepo   := 'BANCO ITAU S.A.';
      if (copy(Dm.ArqAux.FieldByName('financeira').asstring,1,3) = 'CIA')then
       nomepo   := 'CIA. ITAU LEASING DE ARREND. MERCANTIL';
      if (copy(Dm.ArqAux.FieldByName('financeira').asstring,1,3) = 'FIN')then
       nomepo   := 'FINAUSTRIA - CFI';

      endpo     := Dm.Escrit.FieldByName('endereco').asString;
      cidpo     := Dm.Escrit.FieldByName('cidade').asString;
      estpo     := Dm.Escrit.FieldByName('estado').asString;
      baipo     := Dm.Escrit.FieldByName('bairro').asString;
      ceppo     := Dm.Escrit.FieldByName('cep').asString;
      codpo     := Dm.Escrit.FieldByName('codigo').asString;
      codfil    := Dm.Escrit.FieldByName('cod_ag').asString;
      nomeag    := Dm.Escrit.FieldByName('agencia').asString;
      cedente   := Dm.Escrit.FieldByName('escritorio').asString;
     end;  }
   End;
  Dm.Escrit.Close;
end;

Procedure GerarProtocolo;
Begin

  Dm.Seq_Bal.Close;
  Dm.Seq_Bal.Sql.Clear;
  Dm.Seq_Bal.Sql.Add('SELECT * FROM seq_bal where cartorio ="' + qcartorio + '"');
  Dm.Seq_Bal.Open;
  dm.Seq_Bal.Edit;
  dm.Seq_Bal.fieldbyname('oficial').asinteger   := dm.Seq_Bal.fieldbyname('oficial').asinteger + 1;
  dm.Seq_Bal.Post;
  protocolo := dm.Seq_Bal.fieldbyname('oficial').asstring;
  dm.Seq_Bal.Close;
  if pi = '' then pi := protocolo;
  pf := protocolo;
  
end;


Procedure TF_Inter.Gravar(Sender : TOBject);
var
  nom      : String;
  x, grupo : Integer;
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq_lendo);
  Dm.ArqAux.Sql.Add('ORDER BY recno');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    // abrindo TD;
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT * FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('recno = 0');
    Dm.Td.Open;
    //Abrindo TD_Pesso
    Dm.Td_Pesso.Close;
    Dm.Td_Pesso.Sql.Clear;
    Dm.Td_Pesso.Sql.Add('SELECT * FROM td_pesso');
    Dm.Td_Pesso.Sql.Add('WHERE');
    Dm.Td_Pesso.Sql.Add('recno = 0');
    Dm.Td_Pesso.Open;


    RichEdit3.Lines.Clear;

    //pegando os valores de cálculo
    CalculoGeral(MaskEdit1.Text, '1006', 0.00, 1, 0, 1, 0, 5, 0,'N',True);
    while (not Dm.ArqAux.Eof) do
    begin
      protocolo := '';
      nomepo    := '';
      endpo     := '';
      cidpo     := '';
      baipo     := '';
      estpo     := '';
      ceppo     := '';
      codpo     := '0';
      codfil    := '0';
      if F_Menu.Label37.Caption = 'D' then
      begin
        //Distribuição para qual cartório
        dm.qrmenor.ParamByName('PARTABELA').Value := '1006';
        DM.qrMenor.active := True;
        qcartorio := dm.qrmenor.FieldByName('codigo').asstring;
        dm.qrMenor.Active := False;
      end;
      GerarProtocolo;
      StatusBar1.SimpleText := 'Recepção automática em andamento...Protocolando ' + protocolo;
      StatusBar1.UpDate;
      if (CodCli = 1) then
      begin
         if (not BuscaPortador('', CodCli, 1)) then
            Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'DADOS DO PORTADOR NÃO ENCONTRADO NO PROTOCOLO ' + protocolo, CodCli);
      end
      else if (CodCli = 3) then
      begin
         if (not BuscaPortador('', CodCli, Dm.ArqAux.FieldByName('codigocli').asInteger)) then
            Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'DADOS DO PORTADOR NÃO ENCONTRADO NO PROTOCOLO ' + protocolo, CodCli);
      end
      else if (CodCli = 6) then
      begin
         if (not BuscaPortador('', CodCli, 6)) then
            Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'DADOS DO PORTADOR NÃO ENCONTRADO NO PROTOCOLO ' + protocolo, CodCli);
      end
      else if (CodCli = 7) then
      begin
         if (not BuscaPortador('', CodCli, 1)) then
            Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'DADOS DO PORTADOR NÃO ENCONTRADO NO PROTOCOLO ' + protocolo, CodCli);
      end
      else if (CodCli = 11) then
      begin
//        if (not BuscaPortador('', CodCli, Dm.ArqAux.FieldByName('codigocli').asInteger)) then Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'DADOS DO PORTADOR NÃO ENCONTRADO NO PROTOCOLO ' + protocolo, CodCli);
         if (not BuscaPortador('', CodCli, 1)) then
            Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'DADOS DO PORTADOR NÃO ENCONTRADO NO PROTOCOLO ' + protocolo, CodCli);
      end
      else if (CodCli = 18) then
      begin
         if (not BuscaPortador('', CodCli, 1)) then
            Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'DADOS DO PORTADOR NÃO ENCONTRADO NO PROTOCOLO ' + protocolo, CodCli);
      end
      else if (CodCli = 19) then
      begin
         if (not BuscaPortador('', CodCli, Dm.ArqAux.FieldByName('codigocli').asInteger)) then
            Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'DADOS DO PORTADOR NÃO ENCONTRADO NO PROTOCOLO ' + protocolo, CodCli);
      end
      else if (CodCli = 51) then
      begin
         if (not BuscaPortador('', CodCli, 51)) then
//            Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'DADOS DO PORTADOR NÃO ENCONTRADO NO PROTOCOLO ' + protocolo, CodCli);
      end
      else if (CodCli = 22) then
      begin
         if (not BuscaPortador('', CodCli, Dm.ArqAux.FieldByName('codigocli').asInteger)) then
            Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'DADOS DO PORTADOR NÃO ENCONTRADO NO PROTOCOLO ' + protocolo, CodCli);
      end;

      // incluindo dados do td

      for x := 1 to 2 do
      begin
        Dm.Td_Pesso.Append;
        Dm.Td_Pesso.FieldByName('data').asString          := MaskEdit1.Text;
        Dm.Td_Pesso.FieldByName('p_auxiliar').asString    := protocolo;
        Dm.Td_Pesso.FieldByName('tipo').asString          := 'N';
        if (x = 1) then
        begin
            if (CodCli = 23) or (CodCli = 51) then
               Dm.Td_Pesso.FieldByName('nome').asString     := BuscaNomeCliente(CodCli)
            else
               Dm.Td_Pesso.FieldByName('nome').asString     := Dm.ArqAux.FieldByName('cliente').asString;
            if (CodCli = 18) then Dm.Td_Pesso.FieldByName('nome').asString  := nomepo;

            Dm.Td_Pesso.FieldByName('endereco').asString    := endpo;
            Dm.Td_Pesso.FieldByName('bairro').asString      := baipo;
            Dm.Td_Pesso.FieldByName('cidade').asString      := cidpo;
            Dm.Td_Pesso.FieldByName('estado').asString      := estpo;
            Dm.Td_pesso.FieldByName('cep').asString         := ceppo;
            if (CodCli = 6)then
             begin
              Dm.Td_pesso.FieldByName('tip_doc1').asString  := tipdoc1;
              Dm.Td_pesso.FieldByName('doc1').asString      := docpo;
             end;
            Dm.Td_Pesso.FieldByName('situacao').asString    := 'R';
        end;
        if (x = 2) then
        begin
          Dm.Td_Pesso.FieldByName('nome').asString        := Dm.ArqAux.FieldByName('nome').asString;
          Dm.Td_Pesso.FieldByName('endereco').asString    := Dm.ArqAux.FieldByName('endereco').asString;
          Dm.Td_Pesso.FieldByName('numero').asString      := Dm.ArqAux.FieldByName('numero').asString;
          Dm.Td_Pesso.FieldByName('bairro').asString      := Dm.ArqAux.FieldByName('bairro').asString;;
          Dm.Td_Pesso.FieldByName('complem').asString     := Dm.ArqAux.FieldByName('complemento').asString;;
          Dm.Td_Pesso.FieldByName('cidade').asString      := Dm.ArqAux.FieldByName('cidade').asString;;
          Dm.Td_Pesso.FieldByName('estado').asString      := Dm.ArqAux.FieldByName('estado').asString;;
          Dm.Td_pesso.FieldByName('cep').asString         := Dm.ArqAux.FieldByName('cep').asString;
          Dm.Td_Pesso.FieldByName('cxPostal').asString    := Dm.ArqAux.FieldByName('cxPostal').asString;
          Dm.Td_Pesso.FieldByName('situacao').asString    := 'D';
          if (CodCli = 6) and (length(Dm.ArqAux.FieldByName('doc').asstring) = 14) then
          begin
             Dm.Td_Pesso.FieldByName('tip_doc1').asString    := 'CNPJ';
             Dm.Td_pesso.FieldByName('doc1').asString        := Dm.ArqAux.FieldByName('doc').asString;
          end;
          if (CodCli = 6) and (length(Dm.ArqAux.FieldByName('doc').asstring) < 14) then
          begin
             Dm.Td_Pesso.FieldByName('tip_doc1').asString    := 'CPF';
             Dm.Td_pesso.FieldByName('doc1').asString        := Dm.ArqAux.FieldByName('doc').asString;
          end;
          if (CodCli = 11) and (Dm.ArqAux.FieldByName('tip_doc').asString = 'F') then
          begin
             Dm.Td_Pesso.FieldByName('tip_doc1').asString    := 'CPF';
             Dm.Td_pesso.FieldByName('doc1').asString        := copy(Dm.ArqAux.FieldByName('doc').asString,4,14);
          end;
          if (CodCli = 11) and (Dm.ArqAux.FieldByName('tip_doc').asString = 'J') then
          begin
             Dm.Td_Pesso.FieldByName('tip_doc1').asString    := 'CNPJ';
             Dm.Td_pesso.FieldByName('doc1').asString        := copy(Dm.ArqAux.FieldByName('doc').asString,1,14);
          end;
          if (CodCli <> 11) and (CodCli <> 6) then
          begin
             Dm.Td_pesso.FieldByName('tip_doc1').asString    := Dm.ArqAux.FieldByName('tip_doc').asString;
             Dm.Td_pesso.FieldByName('doc1').asString        := Dm.ArqAux.FieldByName('doc').asString;
          end;
        end;
        Dm.Td_Pesso.Post;
      end;
      // dados do TD
      Dm.Td.Append;
      Dm.Td.FieldByName('data_r').asString              := MaskEdit1.Text;
      Dm.Td.FieldByName('p_auxiliar').asString          := protocolo;
      if CodCli = 23 then
      begin
         Dm.Td.FieldByName('a_nome').asString           := Dm.ArqAux.FieldByName('cliente').asString;
         Dm.Td.FieldByName('contato').asString          := BuscaNomeCliente(CodCli)
      end
      else
      begin
         Dm.Td.FieldByName('a_nome').asString           := nomepo;
         Dm.Td.FieldByName('contato').asString          := Dm.ArqAux.FieldByName('cliente').asString;
      end;
      if (CodCli = 18) then Dm.Td.FieldByName('contato').asString := nomepo;

      Dm.Td.FieldByName('a_endereco').asString          := endpo;
      Dm.Td.FieldByName('a_cidade').asString            := cidpo;
      Dm.Td.FieldByName('a_estado').asString            := estpo;
      if (CodCli = 1) then
        Dm.Td.FieldByName('agencia').asString := Dm.ArqAux.FieldByName('agencia').asString
      else if ((CodCli = 3) or (CodCli = 11) or (CodCli = 22)) then
        Dm.Td.FieldByName('agencia').asString := nomeag;
      Dm.Td.FieldByName('cedente').asString   := cedente;
      codpo2 := '000' + codpo;
      codpo2 := copy(codpo2, length(codpo2) - 2, 3);
      Dm.Td.FieldByName('cod_port').asString     := codpo2;
      Dm.Td.FieldByName('cod_cli').asString      := codfil;
      Dm.Td.FieldByName('ncliente').asInteger    := CodCli;
      //If ValidNumero(Dm.ArqAux.FieldByName('cod_cli').asString) then
      //  Dm.Td.FieldByName('cliente').asString    := Dm.ArqAux.FieldByName('cliente').asString;
      Dm.Td.FieldByName('tipo').asstring         := 'N';
      Dm.Td.FieldByName('status').asstring       := 'RECEPCAO';
      Dm.Td.FieldByName('natureza').asstring     := '2';
      Dm.Td.FieldByName('ext_nat').asstring      := 'NOTIFICACAO AR';
      Dm.Td.FieldByName('data_entr').asstring    := DateToStr(Ver_DiaUtil(StrToDate(MaskEdit1.Text) + 30));
      Dm.Td.FieldByName('identifica').asstring   := F_Menu.Label1.caption;
      Dm.Td.FieldByName('contrato').asString     := Dm.ArqAux.FieldByName('contrato').asString;
      // calculo
      CalculoGeral(MaskEdit1.Text, '1006 ', 0.00, 1, 0, 1, 0, 1, 0,'N', True);

      Dm.Td.FieldByName('tabela').asstring       := '1006';
      Dm.Td.FieldByName('divisor').asstring      := '01';

      Dm.Td.FieldByName('microfilme').asInteger          := 1;
      Dm.Td.FieldByName('pag_adic').asInteger            := 0;
      Dm.Td.FieldByName('vias_adc').asInteger            := 0;
      Dm.Td.FieldByName('qtde_nome').asInteger           := 1;
      Dm.Td.FieldByName('v_total').asCurrency            := VrTotG;
      Dm.Td.FieldByName('v_pag').asCurrency              := VrPag;
      Dm.Td.FieldByName('v_mic').asCurrency              := VrMicrofilme;
      Dm.td.FieldByName('v_viaexc').AsCurrency           := VrViasExcedente;
      dm.td.FieldByName('v_emolumentos').AsCurrency      := VrEmolumentos;
      dm.TD.FieldByName('v_emoladicional').AsCurrency    := VrEmolAdicional;
      dm.td.fieldByName('v_digitalizacao').AsCurrency    := VrDigitalizacao;
      dm.td.FieldByName('v_informatica').AsCurrency      := VrInformatica;
      dm.td.FieldByName('v_graveletr').AsCurrency        := VrGravEletronica;
      dm.td.FieldByName('v_conferencia').AsCurrency      := VrConferencia;
      dm.td.FieldByName('v_nome').AsCurrency             := VrNomeExc;
      dm.td.FieldByName('v_tribunal').AsCurrency         := VrTribunal;
      dm.td.FieldByName('v_procuradoria').AsCurrency     := VrProcuradoria;
      dm.td.FieldByName('v_defensoria').AsCurrency       := VrDefensoria;
      dm.td.FieldByName('v_mutua').AsCurrency            := VrMutua;
      dm.td.FieldByName('v_acoterj').AsCurrency          := VrAcoterj;
      dm.td.FieldByName('v_distrib').AsCurrency          := VrDistrib;
      dm.td.FieldByName('v_infodistrib').AsCurrency      := VrInfoDistrib;
      dm.td.FieldByName('v_gravEletrDistrib').AsCurrency := VrGravEletrDistrib;
      dm.td.FieldByName('v_subtotal').AsCurrency         := VrSubTotal;
      Dm.Td.FieldByName('custas').asCurrency             := VrTotG;
//      Dm.Td.FieldByName('valor_base').asCurrency         := CurrencyEdit1.Value;
//      Dm.Td.FieldByName('deposito').asCurrency           := CurrencyEdit3.Value;
//    Dm.Td.FieldByName('v_ar').asCurrency               := CurrencyEdit7.Value;
//      Dm.Td.FieldByName('v_cus_ter').asCurrency          := CurrencyEdit8.Value;
      if F_Menu.Label37.Caption = 'D' then
        //Distribuicao para qual cartório
      dm.td.FieldByName('cartorio').AsString             := qcartorio
      else
      dm.td.FieldByName('cartorio').AsString             := F_Menu.Label37.Caption;

      Dm.Td.FieldByName('dePosito').asCurrency   := 0.00;

      Dm.Td.FieldByName('qtde_eti').asInteger     := 2;
      Dm.Td.FieldByName('mod_eti').asInteger      := 1;
      Dm.Td.FieldByName('arquivo').asString       := Label4.Caption; // Dm.arqAux.FieldByName('arquivo').asString;
      Dm.Td.FieldByName('parcelas').asString      := Dm.ArqAux.FieldByName('parcelas').asString;
      Dm.Td.FieldByName('val_parc').asCurrency    := Dm.ArqAux.FieldByName('valor').asCurrency;
      Dm.Td.FieldByName('valor_extenso').asString := Dm.ArqAux.FieldByName('valor_extenso').asString;
      Dm.Td.FieldByName('data_atraso1').asString  := Dm.ArqAux.FieldByName('data_atrasoult').asString;
      Dm.Td.FieldByName('data_atraso2').asString  := Dm.ArqAux.FieldByName('data_atrasoini').asString;
      Dm.Td.FieldByName('grupo').asString         := Dm.ArqAux.FieldByName('grupo').asString;
      Dm.Td.FieldByName('cota').asString          := Dm.ArqAux.FieldByName('cota').asString;
      Dm.Td.FieldByName('porcentagem').asString   := Dm.ArqAux.FieldByName('porcentagem').asString;
      Dm.Td.FieldByName('produto').asString       := Copy(Dm.ArqAux.FieldByName('produto').asString, 1,1);
      Dm.Td.FieldByName('ven_parc').asString      := Dm.ArqAux.FieldByName('data_parc').asString;
      Dm.Td.FieldByName('parcelas').asString      := Dm.ArqAux.FieldByName('parcelas').asString;
     // Dm.Td.FieldByName('val_parc').ascurrency    := Dm.ArqAux.FieldByName('val_parc').asCurrency;
      Dm.Td.FieldByName('ven_parc2').asString     := Dm.ArqAux.FieldByName('data_parc1').asString;
      Dm.Td.FieldByName('parc2').asString         := Dm.ArqAux.FieldByName('parcela1').asString;
      Dm.Td.FieldByName('val_parc2').ascurrency   := Dm.ArqAux.FieldByName('val_parc1').asCurrency;
      Dm.Td.FieldByName('ven_parc3').asString     := Dm.ArqAux.FieldByName('data_parc2').asString;
      Dm.Td.FieldByName('parc3').asString         := Dm.ArqAux.FieldByName('parcela2').asString;
      Dm.Td.FieldByName('val_parc3').ascurrency   := Dm.ArqAux.FieldByName('val_parc2').asCurrency;
      Dm.Td.FieldByName('ven_parc4').asString     := Dm.ArqAux.FieldByName('data_parc3').asString;
      Dm.Td.FieldByName('parc4').asString         := Dm.ArqAux.FieldByName('parcela3').asString;
      Dm.Td.FieldByName('val_parc4').ascurrency   := Dm.ArqAux.FieldByName('val_parc3').asCurrency;
      Dm.Td.FieldByName('ven_parc5').asString     := Dm.ArqAux.FieldByName('data_parc4').asString;
      Dm.Td.FieldByName('parc5').asString         := Dm.ArqAux.FieldByName('parcela4').asString;
      Dm.Td.FieldByName('val_parc5').ascurrency   := Dm.ArqAux.FieldByName('val_parc4').asCurrency;
      Dm.Td.FieldByName('ven_parc6').asString     := Dm.ArqAux.FieldByName('data_parc5').asString;
      Dm.Td.FieldByName('parc6').asString         := Dm.ArqAux.FieldByName('parcela5').asString;
      Dm.Td.FieldByName('val_parc6').ascurrency   := Dm.ArqAux.FieldByName('val_parc5').asCurrency;
      Dm.Td.FieldByName('ven_parc7').asString     := Dm.ArqAux.FieldByName('data_parc6').asString;
      Dm.Td.FieldByName('parc7').asString         := Dm.ArqAux.FieldByName('parcela6').asString;
      Dm.Td.FieldByName('val_parc7').ascurrency   := Dm.ArqAux.FieldByName('val_parc6').asCurrency;
      Dm.Td.FieldByName('ven_parc8').asString     := Dm.ArqAux.FieldByName('data_parc7').asString;
      Dm.Td.FieldByName('parc8').asString         := Dm.ArqAux.FieldByName('parcela7').asString;
      Dm.Td.FieldByName('val_parc8').ascurrency   := Dm.ArqAux.FieldByName('val_parc7').asCurrency;
      Dm.Td.FieldByName('ven_parc9').asString     := Dm.ArqAux.FieldByName('data_parc8').asString;
      Dm.Td.FieldByName('parc9').asString         := Dm.ArqAux.FieldByName('parcela8').asString;
      Dm.Td.FieldByName('val_parc9').ascurrency   := Dm.ArqAux.FieldByName('val_parc8').asCurrency;
      Dm.Td.FieldByName('ven_parc10').asString    := Dm.ArqAux.FieldByName('data_parc9').asString;
      Dm.Td.FieldByName('parc10').asString        := Dm.ArqAux.FieldByName('parcela9').asString;
      Dm.Td.FieldByName('val_parc10').ascurrency  := Dm.ArqAux.FieldByName('val_parc9').asCurrency;
      Dm.Td.FieldByName('ven_parc11').asString    := Dm.ArqAux.FieldByName('data_parc10').asString;
      Dm.Td.FieldByName('parc11').asString        := Dm.ArqAux.FieldByName('parcela10').asString;
      Dm.Td.FieldByName('val_parc11').ascurrency  := Dm.ArqAux.FieldByName('val_parc10').asCurrency;
      Dm.Td.FieldByName('ven_parc12').asString    := Dm.ArqAux.FieldByName('data_parc11').asString;
      Dm.Td.FieldByName('parc12').asString        := Dm.ArqAux.FieldByName('parcela11').asString;
      Dm.Td.FieldByName('val_parc12').ascurrency  := Dm.ArqAux.FieldByName('val_parc11').asCurrency;
      Dm.Td.FieldByName('ven_parc13').asString    := Dm.ArqAux.FieldByName('data_parc12').asString;
      Dm.Td.FieldByName('parc13').asString        := Dm.ArqAux.FieldByName('parcela12').asString;
      Dm.Td.FieldByName('val_parc13').ascurrency  := Dm.ArqAux.FieldByName('val_parc12').asCurrency;
      Dm.Td.FieldByName('ven_parc14').asString    := Dm.ArqAux.FieldByName('data_parc13').asString;
      Dm.Td.FieldByName('parc14').asString        := Dm.ArqAux.FieldByName('parcela13').asString;
      Dm.Td.FieldByName('val_parc14').ascurrency  := Dm.ArqAux.FieldByName('val_parc13').asCurrency;
      Dm.Td.FieldByName('ven_parc15').asString    := Dm.ArqAux.FieldByName('data_parc14').asString;
      Dm.Td.FieldByName('parc15').asString        := Dm.ArqAux.FieldByName('parcela14').asString;
      Dm.Td.FieldByName('val_parc15').ascurrency  := Dm.ArqAux.FieldByName('val_parc14').asCurrency;
      Dm.Td.FieldByName('ven_parc16').asString    := Dm.ArqAux.FieldByName('data_parc15').asString;
      Dm.Td.FieldByName('val_parc16').ascurrency  := Dm.ArqAux.FieldByName('val_parc15').asCurrency;
      Dm.Td.FieldByName('ven_parc17').asString    := Dm.ArqAux.FieldByName('data_parc16').asString;
      Dm.Td.FieldByName('val_parc17').ascurrency  := Dm.ArqAux.FieldByName('val_parc16').asCurrency;
      Dm.Td.FieldByName('tot_parcela').ascurrency  := Dm.ArqAux.FieldByName('tot_parcela').asCurrency;
      //Dm.Td.FieldByName('ven_parc6').asString    := Dm.ArqAux.FieldByName('data_parc5').asString;
     // Dm.Td.FieldByName('parc6').asString        := Dm.ArqAux.FieldByName('parcela5').asString;
      Dm.Td.FieldByName('data_apuracao').asString := Dm.ArqAux.FieldByName('data_apuracao').asString;
      Dm.Td.FieldByName('financeira').asString    := Dm.ArqAux.FieldByName('financeira').asString;
      Dm.Td.FieldByName('venc_bol').asString      := Dm.ArqAux.FieldByName('vencimento').asString;
      Dm.Td.FieldByName('ag_conta').asString      := Dm.ArqAux.FieldByName('agconta').asString;
      Dm.Td.FieldByName('especie').asString       := Dm.ArqAux.FieldByName('especie').asString;
      Dm.Td.FieldByName('aceite').asString        := Dm.ArqAux.FieldByName('aceite').asString;
      Dm.Td.FieldByName('nu_barras').asString     := Dm.ArqAux.FieldByName('rcodbarras').asString;
      Dm.Td.FieldByName('barras').asString        := Dm.ArqAux.FieldByName('codbarras').asString;
      Dm.Td.FieldByName('dt_mov').asString        := Dm.ArqAux.FieldByName('datamov').asString;
      Dm.Td.FieldByName('nossonum').asString      := Dm.ArqAux.FieldByName('nossonumero').asString;
      Dm.Td.FieldByName('mensa1').asString        := Dm.ArqAux.FieldByName('msg1').asString;
      Dm.Td.FieldByName('mensa2').asString        := Dm.ArqAux.FieldByName('msg2').asString;
      Dm.Td.FieldByName('mensa3').asString        := Dm.ArqAux.FieldByName('msg3').asString;
      Dm.Td.FieldByName('mensa4').asString        := Dm.ArqAux.FieldByName('msg4').asString;
      Dm.Td.FieldByName('mensa5').asString        := Dm.ArqAux.FieldByName('msg5').asString;
      Dm.Td.FieldByName('modelo').asString        := Dm.ArqAux.FieldByName('tip_not').asString;
      Dm.Td.FieldByName('banco').asString         := Dm.ArqAux.FieldByName('banco').asString;
      Dm.Td.FieldByName('cod_empresa').asString   := Dm.ArqAux.FieldByName('cod_empresa').asString;
      Dm.Td.FieldByName('cod_banco').asString     := Dm.ArqAux.FieldByName('cod_banco').asString;
      Dm.Td.FieldByName('escritorio').asString    := Dm.ArqAux.FieldByName('escritorio').asString;
      Dm.Td.FieldByName('nr_doc').asString        := Dm.ArqAux.FieldByName('nr_doc').asString;
      Dm.Td.FieldByName('valor1').ascurrency      := Dm.ArqAux.FieldByName('valor1').ascurrency;
      Dm.Td.FieldByName('loc_pag').asString       := Dm.ArqAux.FieldByName('loc_pag').asString;
      Dm.Td.FieldByName('dt_proc_doc').asString   := Dm.ArqAux.FieldByName('dt_proc_doc').asString;
      Dm.Td.FieldByName('nr_doc2').asString       := Dm.ArqAux.FieldByName('nr_doc2').asString;
      Dm.Td.FieldByName('obs').asString           := Dm.ArqAux.FieldByName('obs').asString;
      Dm.Td.FieldByName('escritorio').asString    := Dm.ArqAux.FieldByName('escritorio').asString;
      Dm.Td.FieldByName('carteira').asString      := Dm.ArqAux.FieldByName('carteira').asString;
      Dm.Td.FieldByName('modelo').asString        := Dm.ArqAux.FieldByName('tip_not').asString;
      Dm.Td.FieldByName('valor_banco').ascurrency := Dm.ArqAux.FieldByName('valor_banco').ascurrency;
      Dm.Td.FieldByName('dt_contr').asString      := Dm.ArqAux.FieldByName('dt_contr').asString;
      Dm.Td.FieldByName('qtd_nr').asString        := Dm.ArqAux.FieldByName('qtd_nr').asString;
      Dm.Td.FieldByName('nr_notific').asString    := Dm.ArqAux.FieldByName('nr_notific').asString;
      Dm.Td.Post;
      if F_Menu.Label37.Caption = 'D' then
      begin
        if (not Guarda_Mov(qcartorio, MaskEdit1.text, protocolo, '1006 ', '2', VrTotG)) then
        ShowMessage('Problemas para atualiza a Distribuicao.');
      end;
      //Aqui
      RichEdit3.Lines.add('Cart - ' + qcartorio + '  Recibo - ' + protocolo);

      Dm.ArqAux.Next;
    end;

//      Dm.Td.FieldByName('data_cel').asString            := Dm.ArqAux.FieldByName('data').asString;
//      Dm.Td.FieldByName('pr1').asString                 := Dm.ArqAux.FieldByName('tpcont').asString;
//      Dm.Td.FieldByName('moeda').asString        := Dm.ArqAux.FieldByName('moeda').asString;
//      Dm.Td.FieldByName('ven_parc').asString     := Dm.ArqAux.FieldByName('vencimento').asString;
//        end
//        else if (Trim(Dm.Td.FieldByName('parc2').asString) = '') then
//        begin
//          Dm.Td.FieldByName('parc2').asString       := Dm.ArqAux.FieldByName('parcela').asString;
//          Dm.Td.FieldByName('val_parc2').asCurrency := Dm.ArqAux.FieldByName('valor').asCurrency;
//          Dm.Td.FieldByName('ven_parc2').asString   := Dm.ArqAux.FieldByName('vencimento').asString;
//        end
//        else if (Trim(Dm.Td.FieldByName('parc3').asString) = '') then
//        begin
//          Dm.Td.FieldByName('parc3').asString       := Dm.ArqAux.FieldByName('parcela').asString;
//          Dm.Td.FieldByName('val_parc3').asCurrency := Dm.ArqAux.FieldByName('valor').asCurrency;
//          Dm.Td.FieldByName('ven_parc3').asString   := Dm.ArqAux.FieldByName('vencimento').asString;
//        end
 //       else if (Trim(Dm.Td.FieldByName('parc4').asString) = '') then
//        begin
//          Dm.Td.FieldByName('parc4').asString       := Dm.ArqAux.FieldByName('parcela').asString;
//          Dm.Td.FieldByName('val_parc4').asCurrency := Dm.ArqAux.FieldByName('valor').asCurrency;
//          Dm.Td.FieldByName('ven_parc4').asString   := Dm.ArqAux.FieldByName('vencimento').asString;
//        end
//        else if (Trim(Dm.Td.FieldByName('parc5').asString) = '') then
//        begin
//          Dm.Td.FieldByName('parc5').asString       := Dm.ArqAux.FieldByName('parcela').asString;
 //         Dm.Td.FieldByName('val_parc5').asCurrency := Dm.ArqAux.FieldByName('valor').asCurrency;
//          Dm.Td.FieldByName('ven_parc5').asString   := Dm.ArqAux.FieldByName('vencimento').asString;
//        end
//        else if (Trim(Dm.Td.FieldByName('parc6').asString) = '') then
 //       begin
//          Dm.Td.FieldByName('parc6').asString       := Dm.ArqAux.FieldByName('parcela').asString;
//          Dm.Td.FieldByName('val_parc6').asCurrency := Dm.ArqAux.FieldByName('valor').asCurrency;
//          Dm.Td.FieldByName('ven_parc6').asString   := Dm.ArqAux.FieldByName('vencimento').asString;
//        end;
//        Dm.ArqAux.Next;
//      end;
//    end;
    Dm.Td.Close;
    Dm.Td_Pesso.Close;

  end;
  Dm.ArqAux.Close;
  DestroeTabela(arq_lendo);
end;

Procedure TF_Inter.Carrega_Mercabenco(Sender : TOBJect);
var
  nom : String;
  x, y : Integer;
  Texto, Texto2 : TStrings;
  erro : Boolean;
begin
  arq_lendo  := '';
  arq_lendo  := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ONLINE';
  narq       := '';
  narq       := Trim(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 11, 20));
  CriaTabela('ONLINE', arq_lendo);
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.LoadFromFile(MaskEdit2.Text);
  RichEdit1.Refresh;
  // importando arquivo para tabela temporária
  Texto  := TStringList.Create;
  y      := 0;
  q_reg  := 0;
  Label4.Caption := narq;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    q_reg := q_reg + 1;
    Texto.Clear;
    Texto.Add('INSERT INTO ' + arq_lendo);
    Texto.Add('(indexador, nome, endereco, bairro, cidade,');
    Texto.Add('estado, cep, grupo, contrato, data_atrasoult,');
    Texto.Add('valor, valor_extenso, data_atrasoini, parcelas)');
    Texto.Add('VALUES(');
    //indexador
    Texto.Add(IntToStr(q_reg) + ',');
    // nome
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 1, 60))) + Chr(39) + ',');
    // endereco
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 61, 60))) + Chr(39) + ',');
    // bairro
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 121, 25))) + Chr(39) + ',');
    // cidade
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 146, 15)))  + Chr(39) + ',');
    //UF
    Texto.Add(Chr(39) + Maiusculo(TirarTudo(Copy(RichEdit1.Lines.Strings[x], 161, 2), Chr(39), '', ''))  + Chr(39) + ',');
    //cep
    Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 163, 9), Chr(39), '-', '') + Chr(39) + ',');
    //grupo/cota
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 172, 10)) + Chr(39) + ',');
    //nº contrato
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 182, 7)) + Chr(39) + ',');
    // data em atraso(Posição Atual)
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 189, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 193, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 195, 2)) + Chr(39) + ',');
    // valor
    Texto.Add(Chr(39) + StrCurrPesq(StrToCurr(Trim(Copy(RichEdit1.Lines.Strings[x], 197, 10)))) + Chr(39) + ',');
    //Valor por extenso
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 207, 100)) + Chr(39) + ',');
    //data em atraso(Desde de quando está em atraso)
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 189, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 193, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 195, 2)) + Chr(39) + ',');
    //parcela - Atenção no arquivo são 02 camPos realizando a soma dos 02 e colocando em apenas 01 campo
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 315, 3)) + '/' + Trim(Copy(RichEdit1.Lines.Strings[x], 318, 3)) + Chr(39) + ')');
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.AddStrings(Texto);
    Dm.ArqAux.ExecSQL;
  end;
  Texto.Free;
end;

Procedure TF_Inter.Carrega_Lideranca(Sender : TOBJect);
var
  nom : String;
  x, y : Integer;
  Texto, Texto2 : TStrings;
  erro : Boolean;
begin
  arq_lendo  := '';
  arq_lendo  := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ONLINE';
  narq       := '';
  narq       := Trim(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20));
  CriaTabela('ONLINE', arq_lendo);
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.LoadFromFile(MaskEdit2.Text);
  RichEdit1.Refresh;
  // importando arquivo para tabela temporária
  Texto  := TStringList.Create;
  y      := 0;
  q_reg  := 0;
  Label4.Caption := narq;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    if (Trim(Copy(RichEdit1.Lines.Strings[x], 1, 1)) <> '') then
    begin
      q_reg := q_reg + 1;
      Texto.Clear;
      Texto.Add('INSERT INTO ' + arq_lendo);
      Texto.Add('(indexador, nome, endereco, bairro, cidade, estado, cep,');
      Texto.Add('produto, codigocli, parcelas, data_parc, parcela1, data_parc1,');
      Texto.Add('parcela2, data_parc2, parcela3, data_parc3, parcela4, data_parc4,');
      Texto.Add('contrato)');
      Texto.Add('VALUES(');
      //indexador
      Texto.Add(IntToStr(q_reg) + ',');
      // nome
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 40, 45))) + Chr(39) + ',');
      // endereco
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 85, 60))) + Chr(39) + ',');
      // bairro
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 145, 20))) + Chr(39) + ',');
      // cidade
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 165, 20)))  + Chr(39) + ',');
      //UF
      Texto.Add(Chr(39) + Maiusculo(Copy(RichEdit1.Lines.Strings[x], 185, 2))  + Chr(39) + ',');
      //cep
      Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 187, 8) + Chr(39) + ',');
      // produto
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 2, 26)) + Chr(39) + ',');
      //código do cliente
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 1, 1)) + Chr(39) + ',');
      //1ª parcela - 1ª data de vencimento da parcela
      if (Trim(Copy(RichEdit1.Lines.Strings[x], 203, 2)) <> '') then
      begin
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 203, 2)) + Chr(39) + ',');
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 209, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 207, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 205, 2)) + Chr(39) + ',');
      end
      else
      begin
        Texto.Add('NULL,');
        Texto.Add('NULL,');
      end;
      //2ª parcela - 2ª data de vencimento da parcela
      if (Trim(Copy(RichEdit1.Lines.Strings[x], 213, 2)) <> '') then
      begin
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 213, 2)) + Chr(39) + ',');
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 219, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 217, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 215, 2)) + Chr(39) + ',');
      end
      else
      begin
        Texto.Add('NULL,');
        Texto.Add('NULL,');
      end;
      //3ª parcela - 3ª data de vencimento da parcela
      if (Trim(Copy(RichEdit1.Lines.Strings[x], 223, 2)) <> '') then
      begin
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 223, 2)) + Chr(39) + ',');
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 229, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 227, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 225, 2)) + Chr(39) + ',');
      end
      else
      begin
        Texto.Add('NULL,');
        Texto.Add('NULL,');
      end;
      //4ª parcela - 4ª data de vencimento da parcela
      if (Trim(Copy(RichEdit1.Lines.Strings[x], 233, 2)) <> '') then
      begin
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 233, 2)) + Chr(39) + ',');
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 239, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 237, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 235, 2)) + Chr(39) + ',');
      end
      else
      begin
        Texto.Add('NULL,');
        Texto.Add('NULL,');
      end;
      //5ª parcela - 5ª data de vencimento da parcela
      if (Trim(Copy(RichEdit1.Lines.Strings[x], 243, 2)) <> '') then
      begin
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 243, 2)) + Chr(39) + ',');
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 249, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 247, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 245, 2)) + Chr(39) + ',');
      end
      else
      begin
        Texto.Add('NULL,');
        Texto.Add('NULL,');
      end;
      //nº contrato
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 28, 12)) + Chr(39) + ')');
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.AddStrings(Texto);
      Dm.ArqAux.ExecSQL;
    end;
  end;
  Texto.Free;
end;

Procedure TF_Inter.Carrega_Secundino(Sender : TOBJect);
var
  nom : String;
  x, y : Integer;
  Texto, Texto2 : TStrings;
  erro : Boolean;
begin
  arq_lendo  := '';
  arq_lendo  := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ONLINE';
  narq       := '';
  narq       := Trim(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20));
  CriaTabela('ONLINE', arq_lendo);
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.LoadFromFile(MaskEdit2.Text);
  RichEdit1.Refresh;
  // importando arquivo para tabela temporária
  Texto  := TStringList.Create;
  y      := 0;
  q_reg  := 0;
  Label4.Caption := narq;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    q_reg := q_reg + 1;
    Texto.Clear;
    Texto.Add('INSERT INTO ' + arq_lendo);
    Texto.Add('(indexador, grupo, cota, contrato, nome,');
    Texto.Add('doc, endereco, bairro, cidade, estado, cep, parcelas,');
    Texto.Add('valor, valor_extenso, porcentagem, data_apuracao, cliente,');
    Texto.Add('doc_cli, end_cli, bai_cli, cid_cli, est_cli, cep_cli)');
    Texto.Add('VALUES(');
    //indexador
    Texto.Add(IntToStr(q_reg) + ',');
    // grupo
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 1, 4)) + Chr(39) + ',');
    // cota
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 5, 4)) + Chr(39) + ',');
    // contrato
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 9, 8)) + Chr(39) + ',');
    // nome
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 17, 50))) + Chr(39) + ',');
    //doc
    Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 67, 18), '.', '/', '-') + Chr(39) + ',');
    //endereco
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 85, 60))) + Chr(39) + ',');
    //bairro
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 145, 30))) + Chr(39) + ',');
    //cidade
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 175, 30))) + Chr(39) + ',');
    //UF
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 205, 2))) + Chr(39) + ',');
    //cep
    Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 207, 9), Chr(39), '-', '') + Chr(39) + ',');
    //parc_atraso
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 216, 6)) + Chr(39) + ',');
    // valor débito
    Texto.Add(Chr(39) + StrCurrPesq(StrToCurr(Trim(TirarTudo(Copy(RichEdit1.Lines.Strings[x], 222, 21),Chr(39),'R','$')))) + Chr(39) + ',');
    //Valor por extenso
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 243, 100)) + Chr(39) + ',');
    //Porcentagem
    Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 343, 9), Chr(39), '%', '') + Chr(39) + ',');
    //Data Apuração
    Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 356, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 354, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 352, 2)) + Chr(39) + ',');
    //Cliente
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 360, 42))) + Chr(39) + ',');
    //doc_cli
    Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 402, 18),'.', '/', '-') + Chr(39) + ',');
    //end_cli
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 420, 51))) + Chr(39) + ',');
    //bai_cli
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 471, 14))) + Chr(39) + ',');
    //cid_cli
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(TirarTudo(Copy(RichEdit1.Lines.Strings[x], 485, 14),'.', '/', '-'))) + Chr(39) + ',');
    // UF_cli
    Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 499, 2))) + Chr(39) + ',');
    //cep_cli
    Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 501, 9), Chr(39), '-', '') + Chr(39) + ')');

    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.AddStrings(Texto);
    Dm.ArqAux.ExecSQL;
  end;
  Texto.Free;
end;


Procedure TF_Inter.Carrega_Ernandes(Sender : TOBJect);
var
  nom : String;
  x, y : Integer;
  Texto, Texto2 : TStrings;
  erro : Boolean;
begin
  arq_lendo  := '';
  arq_lendo  := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ONLINE';
  narq       := '';
  narq       := Trim(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20));
  CriaTabela('ONLINE', arq_lendo);
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.LoadFromFile(MaskEdit2.Text);
  RichEdit1.Refresh;
  // importando arquivo para tabela temporária
  Texto  := TStringList.Create;
  y      := 0;
  q_reg  := 0;
  Label4.Caption := narq;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    if (Trim(Copy(RichEdit1.Lines.Strings[x], 1, 1)) = '1') then
    begin
      q_reg := q_reg + 1;
      Texto.Clear;
      Texto.Add('INSERT INTO ' + arq_lendo);
      Texto.Add('(indexador, financeira, produto, contrato, nome, endereco, numero,');
      Texto.Add('complemento, bairro, cidade, cep, estado, vencimento, valor, agconta,');
      Texto.Add('especie, aceite, rcodbarras, codbarras, datamov, nossonumero, msg1,');
      Texto.Add('msg2, msg3, msg4, msg5, parcelas, data_parc, tip_not)');
      Texto.Add('VALUES(');
      //indexador
      Texto.Add(IntToStr(q_reg) + ',');
      // financeira
      Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 2, 2) + Chr(39) + ',');
      // produto
      Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 4, 1) + Chr(39) + ',');
      // contrato
      Texto.Add(Chr(39) + Maiusculo(Copy(RichEdit1.Lines.Strings[x], 5, 20)) + Chr(39) + ',');
      // nome
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 25, 50)))  + Chr(39) + ',');
      //endereço
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Trim(Copy(RichEdit1.Lines.Strings[x], 75, 40)))) + Chr(39) + ',');
      //número
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 115, 10), Chr(39), '-', '/') + Chr(39) + ',');
      // complemento
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Trim(Copy(RichEdit1.Lines.Strings[x], 125, 10))))  + Chr(39) + ',');
      //bairro
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 135, 40)))  + Chr(39) + ',');
      //cidade
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 175, 30)))  + Chr(39) + ',');
      //cep
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 205, 8), Chr(39), '-', '') + Chr(39) + ',');
      //estado
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 213, 2)))  + Chr(39) + ',');
      //vencimento
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 221, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 218, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 215, 2)) + Chr(39) + ',');
      //valor
      if Trim(Copy(RichEdit1.Lines.Strings[x], 225, 18)) = '' then
       Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 225, 18) + Chr(39) + ',')
      else
       Texto.Add(Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 225, 18)),Chr(39), '.', ''))) + Chr(39) + ',');
      //Ag Conta
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 243, 12)) + Chr(39) + ',');
      //Especie
      Texto.Add(Chr(39) + Maiusculo(Copy(RichEdit1.Lines.Strings[x], 255, 2))  + Chr(39) + ',');
      //Aceite
      Texto.Add(Chr(39) + Maiusculo(Copy(RichEdit1.Lines.Strings[x], 257, 1))  + Chr(39) + ',');
      //Representação Numérica do Código de Barras
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 258, 47), Chr(39), '-', '') + Chr(39) + ',');
      //Código de Barras
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 305, 44)) + Chr(39) + ',');
      //Data Movimento
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 355, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 352, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 349, 2)) + Chr(39) + ',');
      //NossoNúmero
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 359, 15)) + Chr(39) + ',');
      //Msg1
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 374, 50)))  + Chr(39) + ',');
      //Msg2
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 424, 50)))  + Chr(39) + ',');
      //Msg3
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 474, 50)))  + Chr(39) + ',');
      //Msg4
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 524, 50)))  + Chr(39) + ',');
      //Msg5
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 574, 50)))  + Chr(39) + ',');
      //Parcela
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 624, 2)) + Chr(39) + ',');
      //Vencimento_Parcela
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 632, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 629, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 626, 2)) + Chr(39) + ',');
      //Tipo_Notificação
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 637, 1)) + Chr(39) + ')');
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.AddStrings(Texto);
      Dm.ArqAux.ExecSQL;
    end;
  end;
  Texto.Free;
end;

Procedure TF_Inter.Carrega_WOCosta(Sender : TOBJect);
var
  nom : String;
  x, y : Integer;
  Texto, Texto2 : TStrings;
  erro : Boolean;
begin
  arq_lendo  := '';
  arq_lendo  := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ONLINE';
  narq       := '';
  narq       := Trim(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20));
  CriaTabela('ONLINE', arq_lendo);
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.LoadFromFile(MaskEdit2.Text);
  RichEdit1.Refresh;
  // importando arquivo para tabela temporária
  Texto  := TStringList.Create;
  y      := 0;
  q_reg  := 0;
  Label4.Caption := narq;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    if (Trim(Copy(RichEdit1.Lines.Strings[x], 1, 1)) = '2') then
    begin
      q_reg := q_reg + 1;
      Texto.Clear;
      Texto.Add('INSERT INTO ' + arq_lendo);
      Texto.Add('(indexador, cod_empresa, datamov, nome, endereco, numero, complemento, bairro, cidade, estado, cep,');
      Texto.Add('doc, contrato, financeira, banco, cod_banco, escritorio, vencimento, nr_doc, valor1, loc_pag, agconta, dt_proc_doc,');
      Texto.Add('nr_doc2, especie, aceite, obs, carteira, qtd_nr, valor_banco, msg1, msg2, msg3, msg4, msg5, data_parc, parcelas,');
      Texto.Add('dt_contr, tip_doc)');
      Texto.Add('VALUES(');
      //indexador
      Texto.Add(IntToStr(q_reg) + ',');
      // Código da Empresa
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 2, 5))) + Chr(39) + ',');
      // data_noti
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 11, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 9, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 7, 2)) + Chr(39) + ',');
      // nome
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 15, 50))) + Chr(39) + ',');
      // endereco
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 65, 30))) + Chr(39) + ',');
      //número
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 95, 6), Chr(39), '-', '/') + Chr(39) + ',');
      // complemento
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Trim(Copy(RichEdit1.Lines.Strings[x], 101, 20))))  + Chr(39) + ',');
      // bairro
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 121, 25))) + Chr(39) + ',');
      // cidade
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 146, 30)))  + Chr(39) + ',');
      //UF
      Texto.Add(Chr(39) + Maiusculo(Copy(RichEdit1.Lines.Strings[x], 176, 2))  + Chr(39) + ',');
      //cep
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 178, 8), Chr(39), '-', '') + Chr(39) + ',');
      //doc
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 186, 14),'.', '/', '-') + Chr(39) + ',');
      //nº contrato
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 200, 19)) + Chr(39) + ',');
      // financeira
      Texto.Add(Chr(39) + Maiusculo(RetiraAcentos(TirarTudo(Copy(RichEdit1.Lines.Strings[x], 219, 60), '-', '/', '.'))) + Chr(39) + ',');
      // nome do Banco
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 279, 20))) + Chr(39) + ',');
      // código do banco
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 299, 5), Chr(39), '-', '') + Chr(39) + ',');
      // nome do Escritorio
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 304, 50))) + Chr(39) + ',');
      // vencimento
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 358, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 356, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 354, 2)) + Chr(39) + ',');
      // número do docuemnto
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 362, 10), Chr(39), '-', '/') + Chr(39) + ',');
      // valor do documento
      if Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)) = '' then
       Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 372, 17) + Chr(39) + ',')
      else
       Texto.Add(Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39) + ',');
      // local de pagamento
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 389, 50))) + Chr(39) + ',');
      // código da Agência
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 439, 15), Chr(39), '-', '') + Chr(39) + ',');
      // dt_proc_doc
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 458, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 456, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 454, 2)) + Chr(39) + ',');
      // número do documento  2
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 462, 15), Chr(39), '-', '/') + Chr(39) + ',');
      //Especie
      Texto.Add(Chr(39) + Maiusculo(Copy(RichEdit1.Lines.Strings[x], 477, 2))  + Chr(39) + ',');
      //Aceite
      Texto.Add(Chr(39) + Maiusculo(Copy(RichEdit1.Lines.Strings[x], 479, 20))  + Chr(39) + ',');
      // Obs
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 499, 50))) + Chr(39) + ',');
      // carteira
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 549, 03), Chr(39), '-', '/') + Chr(39) + ',');
      //qtde número
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 552, 10), Chr(39), '-', '/') + Chr(39) + ',');
      // valor banco
      if Trim(Copy(RichEdit1.Lines.Strings[x], 562, 17)) = '' then
       Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 562, 17) + Chr(39) + ',')
      else
       Texto.Add(Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 562, 17)),Chr(39), '.', ''))) + Chr(39) + ',');
      //Msg1
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 579, 50)))  + Chr(39) + ',');
      //Msg2
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 629, 50)))  + Chr(39) + ',');
      //Msg3
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 679, 50)))  + Chr(39) + ',');
      //Msg4
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 729, 50)))  + Chr(39) + ',');
      //Msg5
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 779, 50)))  + Chr(39) + ',');
      // dt_venc_parc
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 833, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 831, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 829, 2)) + Chr(39) + ',');
      // número do parcela
      Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 837, 4), Chr(39), '-', '/') + Chr(39) + ',');
      // dt_contrato
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 845, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 843, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 841, 2)) + Chr(39) + ',');
      //tip_doc
      Texto.Add(Chr(39) + Maiusculo(Copy(RichEdit1.Lines.Strings[x], 878, 1))  + Chr(39) + ')');

      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.AddStrings(Texto);
      Dm.ArqAux.ExecSQL;
    end;
  end;
  Texto.Free;
end;

{Procedure TF_Inter.Carrega_Scania(Sender : TOBJect);
var
  nom, nr_notific, valor_banco, valor_parc : String;
  x, y, qparc     : Integer;
  Texto, Texto2   : TStrings;
  erro            : Boolean;
begin
  nr_notific := '';
  arq_lendo  := '';
  arq_lendo  := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ONLINE';
  narq       := '';
  narq       := Trim(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20));
  CriaTabela('ONLINE', arq_lendo);
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.LoadFromFile(MaskEdit2.Text);
  RichEdit1.Refresh;
  // importando arquivo para tabela temporária
  Texto  := TStringList.Create;
  y      := 0;
  q_reg  := 0;
  Label4.Caption := narq;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    valor_parc := '';
    valor_banco:= '';
    if (Trim(Copy(RichEdit1.Lines.Strings[x], 1, 1)) <> '') then
    begin
      if Trim(Copy(RichEdit1.Lines.Strings[x], 1, 5)) <> nr_notific then
       begin
        qparc      := 1;
        nr_notific := Trim(Copy(RichEdit1.Lines.Strings[x], 1, 5));
        Texto.Clear;
        Texto.Add('INSERT INTO ' + arq_lendo);
        Texto.Add('(indexador, nr_notific, nome, grupo, cota, endereco, complemento, numero,');
        Texto.Add('bairro, cidade, estado, cep, cxPostal, valor1, valor_extenso,');
        Texto.Add('parcelas, data_parc, valor)');
        Texto.Add('VALUES(');
        q_reg := q_reg + 1;
        //indexador
        Texto.Add(IntToStr(q_reg) + ',');
        //Número da Notificação
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 1, 5)) + Chr(39) + ',');
        // Cliente
        Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 6, 50))) + Chr(39) + ',');
        // grupo
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 56, 4)) + Chr(39) + ',');
        // cota
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 60, 3)) + Chr(39) + ',');
        // endereco
        Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 63, 50))) + Chr(39) + ',');
        // complemento
        Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Trim(Copy(RichEdit1.Lines.Strings[x], 113, 50))))  + Chr(39) + ',');
        //número
        Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 163, 5), Chr(39), '-', '/') + Chr(39) + ',');
        // bairro
        Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 168, 50))) + Chr(39) + ',');
        // cidade
        Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 218, 50)))  + Chr(39) + ',');
        //UF
        Texto.Add(Chr(39) + Maiusculo(Copy(RichEdit1.Lines.Strings[x], 268, 2))  + Chr(39) + ',');
        //cep
        Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 270, 8) + Chr(39) + ',');
        // cxPostal
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 278, 15)) + Chr(39) + ',');
        // valor banco
        if Trim(Copy(RichEdit1.Lines.Strings[x], 293, 11)) = '' then
         Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 293, 11) + Chr(39) + ',')
        else
         begin
          valor_banco := Copy(RichEdit1.Lines.Strings[x], 293, 9)+','+copy(RichEdit1.Lines.Strings[x],302, 2);
          Texto.Add(Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(valor_banco),Chr(39), '.', ''))) + Chr(39) + ',');
         end;
        //Valor por extenso
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 304, 100)) + Chr(39) + ',');

        //1ª parcela - 1ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '') then
         begin
          //número parcela
          //Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          //vencimento da parcela
          //Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
          Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
          //valor da parcela
          if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39)+')')
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add(Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39) + ')');
           end;
         end;
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.AddStrings(Texto);
        Dm.ArqAux.ExecSQL;
       end
      else
     // begin
    // if (Trim(Copy(RichEdit1.Lines.Strings[x], 1, 5)) = nr_notific) and (qparc>=1) then
       begin
        qparc := qparc + 1;
        Texto.Clear;
        Texto.Add('UPDATE ' + arq_lendo + ' set');

        //2ª parcela - 2ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '') and (qparc = 2) then
        begin
          Texto.Add('parcela1 = '+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc1 = '+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
          //Texto.Add('val_parc1 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
          if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc1 = '+ Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc1 = '+ Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;
        //3ª parcela - 3ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 3) then
        begin
          Texto.Add('parcela2 =' +Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc2 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc2 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc2 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
           valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
           Texto.Add('val_parc2 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;

        end;
        //4ª parcela - 4ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 4) then
        begin
          Texto.Add('parcela3 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc3 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc3 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc3 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
           valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
           Texto.Add('val_parc3 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;

        end;
        //5ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 5) then
        begin
          Texto.Add('parcela4 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc4 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc4 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

        //6ª parcela - 6ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 6) then
        begin
          Texto.Add('parcela5 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc5 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc5 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc5 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

        //7ª parcela - 7ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 7) then
        begin
          Texto.Add('parcela6 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc6 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc6 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc6 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //8ª parcela - 8ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 8) then
        begin
          Texto.Add('parcela7 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc7 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc7 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc7 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //9ª parcela - 9ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 9) then
        begin
          Texto.Add('parcela8 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc8 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc8 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc8 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //10ª parcela - 10ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 10) then
        begin
          Texto.Add('parcela9 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc9 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc9 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc9 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //11ª parcela - 11ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 11) then
        begin
          Texto.Add('parcela10 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc10 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc10 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc10 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //12ª parcela - 12ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 12) then
        begin
          Texto.Add('parcela11 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc11 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc11 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc11 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //13ª parcela - 13ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 13) then
        begin
          Texto.Add('parcela12 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc12 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc12 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc12 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //14ª parcela - 14ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 14) then
        begin
          Texto.Add('parcela13 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc13 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc13 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc13 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //15ª parcela - 15ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) <> '')and (qparc = 15) then
        begin
          Texto.Add('parcela14 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 3)) + Chr(39) + ',');
          Texto.Add('data_parc14 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 413, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 410, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 407, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 417, 11)) = '' then
           Texto.Add('val_parc14 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 417, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 417, 9)+','+copy(RichEdit1.Lines.Strings[x],426, 2);
            Texto.Add('val_parc14 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;


        Texto.Add('where nr_notific = '+ Chr(39)+ nr_notific +Chr(39));
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.AddStrings(Texto);
        Dm.ArqAux.ExecSQL;
       end;
     end;
    end;
  Texto.Free;
end;  }

Procedure TF_Inter.Carrega_Scania(Sender : TOBJect);
var
  nom, nr_notific, valor_banco, valor_parc : String;
  x, y, qparc     : Integer;
  Texto, Texto2   : TStrings;
  erro            : Boolean;
begin
  nr_notific := '';
  arq_lendo  := '';
  arq_lendo  := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ONLINE';
  narq       := '';
  narq       := Trim(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20));
  CriaTabela('ONLINE', arq_lendo);
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.LoadFromFile(MaskEdit2.Text);
  RichEdit1.Refresh;
  // importando arquivo para tabela temporária
  Texto  := TStringList.Create;
  y      := 0;
  q_reg  := 0;
  Label4.Caption := narq;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    valor_parc := '';
    valor_banco:= '';
    if (Trim(Copy(RichEdit1.Lines.Strings[x], 1, 1)) <> '') then
    begin
      if Trim(Copy(RichEdit1.Lines.Strings[x], 1, 5)) <> nr_notific then
       begin
        qparc      := 1;
        nr_notific := Trim(Copy(RichEdit1.Lines.Strings[x], 1, 5));
        Texto.Clear;
        Texto.Add('INSERT INTO ' + arq_lendo);
        Texto.Add('(indexador, nr_notific, nome, grupo, cota, endereco, complemento, numero,');
        Texto.Add('bairro, cidade, estado, cep, cxPostal, valor1, valor_extenso,');
        Texto.Add('parcelas, data_parc, valor)');
        Texto.Add('VALUES(');
        q_reg := q_reg + 1;
        //indexador
        Texto.Add(IntToStr(q_reg) + ',');
        //Número da Notificação
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 1, 5)) + Chr(39) + ',');
        // Cliente
        Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 6, 50))) + Chr(39) + ',');
        // grupo
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 56, 4)) + Chr(39) + ',');
        // cota
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 60, 3)) + Chr(39) + ',');
        // endereco
        Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 63, 50))) + Chr(39) + ',');
        // complemento
        Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Trim(Copy(RichEdit1.Lines.Strings[x], 113, 50))))  + Chr(39) + ',');
        //número
        Texto.Add(Chr(39) + TirarTudo(Copy(RichEdit1.Lines.Strings[x], 163, 5), Chr(39), '-', '/') + Chr(39) + ',');
        // bairro
        Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 168, 50))) + Chr(39) + ',');
        // cidade
        Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 218, 50)))  + Chr(39) + ',');
        //UF
        Texto.Add(Chr(39) + Maiusculo(Copy(RichEdit1.Lines.Strings[x], 268, 2))  + Chr(39) + ',');
        //cep
        Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 270, 8) + Chr(39) + ',');
        // cxPostal
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 278, 15)) + Chr(39) + ',');
        // valor banco
        if Trim(Copy(RichEdit1.Lines.Strings[x], 293, 11)) = '' then
         Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 293, 11) + Chr(39) + ',')
        else
         begin
          valor_banco := Copy(RichEdit1.Lines.Strings[x], 293, 9)+','+copy(RichEdit1.Lines.Strings[x],302, 2);
          Texto.Add(Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(valor_banco),Chr(39), '.', ''))) + Chr(39) + ',');
         end;
        //Valor por extenso
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 304, 100)) + Chr(39) + ',');

        //1ª parcela - 1ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '') then
         begin
          //número parcela
          Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          //vencimento da parcela
          Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
          //valor da parcela
          if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39)+')')
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add(Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39) + ')');
           end;
         end;
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.AddStrings(Texto);
        Dm.ArqAux.ExecSQL;
       end
      else
     // begin
    // if (Trim(Copy(RichEdit1.Lines.Strings[x], 1, 5)) = nr_notific) and (qparc>=1) then
       begin
        qparc := qparc + 1;
        Texto.Clear;
        Texto.Add('UPDATE ' + arq_lendo + ' set');

        //2ª parcela - 2ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '') and (qparc = 2) then
        begin
          Texto.Add('parcela1 = '+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc1 = '+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
          //Texto.Add('val_parc1 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
          if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc1 = '+ Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc1 = '+ Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;
        //3ª parcela - 3ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 3) then
        begin
          Texto.Add('parcela2 =' +Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc2 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc2 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc2 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
           valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
           Texto.Add('val_parc2 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;

        end;
        //4ª parcela - 4ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 4) then
        begin
          Texto.Add('parcela3 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc3 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc3 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc3 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
           valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
           Texto.Add('val_parc3 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;

        end;
        //5ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 5) then
        begin
          Texto.Add('parcela4 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc4 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc4 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

        //6ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 6) then
        begin
          Texto.Add('parcela5 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc5 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc5 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc5 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

        //7ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 7) then
        begin
          Texto.Add('parcela6 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc6 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc6 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc6 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //8ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 8) then
        begin
          Texto.Add('parcela7 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc7 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc7 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc7 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //9ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 9) then
        begin
          Texto.Add('parcela8 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc8 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc8 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc8 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //10ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 10) then
        begin
          Texto.Add('parcela9 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc9 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc9 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc9 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //11ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 11) then
        begin
          Texto.Add('parcela10 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc10 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc10 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc10 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //12ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 12) then
        begin
          Texto.Add('parcela11 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc11 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc11 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc11 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //13ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 13) then
        begin
          Texto.Add('parcela12 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc12 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc12 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc12 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //14ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 14) then
        begin
          Texto.Add('parcela13 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc13 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc13 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc13 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

         //15ª parcela - 5ª data de vencimento da parcela
        if (Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) <> '')and (qparc = 15) then
        begin
          Texto.Add('parcela14 ='+ Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 404, 2)) + Chr(39) + ',');
          Texto.Add('data_parc14 ='+Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 412, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 409, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 406, 2)) + Chr(39) + ',');
         // Texto.Add('val_parc4 = '+Chr(39) + StrCurrPesq(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 372, 17)),Chr(39), '.', ''))) + Chr(39));
         if Trim(Copy(RichEdit1.Lines.Strings[x], 416, 11)) = '' then
           Texto.Add('val_parc14 = '+Chr(39) + Copy(RichEdit1.Lines.Strings[x], 416, 11) + Chr(39))
          else
           begin
            valor_parc := Copy(RichEdit1.Lines.Strings[x], 416, 9)+','+copy(RichEdit1.Lines.Strings[x],425, 2);
            Texto.Add('val_parc14 = '+Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(valor_parc),Chr(39), '.', ''))) + Chr(39));
           end;
        end;

        Texto.Add('where nr_notific = '+ Chr(39)+ nr_notific +Chr(39));
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.AddStrings(Texto);
        Dm.ArqAux.ExecSQL;
       end;
     end;
    end;

  Texto.Free;
end;

Procedure TF_Inter.Carrega_Empenho(Sender : TOBJect);
var
  nom : String;
  x, y : Integer;
  Texto, Texto2 : TStrings;
  erro : Boolean;
begin
  arq_lendo  := '';
  arq_lendo  := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ONLINE';
  narq       := '';
  narq       := Trim(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20));
  CriaTabela('ONLINE', arq_lendo);
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.LoadFromFile(MaskEdit2.Text);
  RichEdit1.Refresh;
  // importando arquivo para tabela temporária
  Texto  := TStringList.Create;
  y      := 0;
  q_reg  := 0;
  Label4.Caption := narq;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    if (Trim(Copy(RichEdit1.Lines.Strings[x], 1, 1)) <> '') then
    begin
      q_reg := q_reg + 1;
      Texto.Clear;
      Texto.Add('INSERT INTO ' + arq_lendo);
      Texto.Add('(indexador, codigocli, produto, contrato, nome, endereco, bairro, cidade, estado, cep,');
      Texto.Add('dt_proc_doc, parcelas, data_parc, parcela1, data_parc1,');
      Texto.Add('parcela2, data_parc2, parcela3, data_parc3, parcela4, data_parc4)');
      Texto.Add('VALUES(');
      //indexador
      Texto.Add(IntToStr(q_reg) + ',');
      //código do cliente
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 1, 1)) + Chr(39) + ',');
      // produto
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 2, 26)) + Chr(39) + ',');
      //nº contrato
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 28, 12)) + Chr(39) + ',');
      // nome
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 40, 45))) + Chr(39) + ',');
      // endereco
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 85, 60))) + Chr(39) + ',');
      // bairro
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 145, 20))) + Chr(39) + ',');
      // cidade
      Texto.Add(Chr(39) + Maiusculo(TirarAPostrofe(Copy(RichEdit1.Lines.Strings[x], 165, 20)))  + Chr(39) + ',');
      //UF
      Texto.Add(Chr(39) + Maiusculo(Copy(RichEdit1.Lines.Strings[x], 185, 2))  + Chr(39) + ',');
      //cep
      Texto.Add(Chr(39) + Copy(RichEdit1.Lines.Strings[x], 187, 8) + Chr(39) + ',');
      //Data de Geração do Arquivo
      Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 199, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 197, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 195, 2)) + Chr(39) + ',');
      //1ª parcela - 1ª data de vencimento da parcela
      if (Trim(Copy(RichEdit1.Lines.Strings[x], 203, 2)) <> '') then
      begin
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 203, 2)) + Chr(39) + ',');
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 209, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 207, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 205, 2)) + Chr(39) + ',');
      end
      else
      begin
        Texto.Add('NULL,');
        Texto.Add('NULL,');
      end;
      //2ª parcela - 2ª data de vencimento da parcela
      if (Trim(Copy(RichEdit1.Lines.Strings[x], 213, 2)) <> '') then
      begin
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 213, 2)) + Chr(39) + ',');
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 219, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 217, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 215, 2)) + Chr(39) + ',');
      end
      else
      begin
        Texto.Add('NULL,');
        Texto.Add('NULL,');
      end;
      //3ª parcela - 3ª data de vencimento da parcela
      if (Trim(Copy(RichEdit1.Lines.Strings[x], 223, 2)) <> '') then
      begin
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 223, 2)) + Chr(39) + ',');
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 229, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 227, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 225, 2)) + Chr(39) + ',');
      end
      else
      begin
        Texto.Add('NULL,');
        Texto.Add('NULL,');
      end;
      //4ª parcela - 4ª data de vencimento da parcela
      if (Trim(Copy(RichEdit1.Lines.Strings[x], 233, 2)) <> '') then
      begin
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 233, 2)) + Chr(39) + ',');
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 239, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 237, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 235, 2)) + Chr(39) + ',');
      end
      else
      begin
        Texto.Add('NULL,');
        Texto.Add('NULL,');
      end;
      //5ª parcela - 5ª data de vencimento da parcela
      if (Trim(Copy(RichEdit1.Lines.Strings[x], 243, 2)) <> '') then
      begin
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 243, 2)) + Chr(39) + ',');
        Texto.Add(Chr(39) + Trim(Copy(RichEdit1.Lines.Strings[x], 249, 4)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 247, 2)) + '-' + Trim(Copy(RichEdit1.Lines.Strings[x], 245, 2)) + Chr(39) + ')');
      end
      else
      begin
        Texto.Add('NULL,');
        Texto.Add('NULL)');
      end;

      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      Dm.ArqAux.Sql.AddStrings(Texto);
      Dm.ArqAux.ExecSQL;
    end;
  end;
  Texto.Free;
end;



{Procedure TF_Inter.Grava_SIMCRED(Sender : TOBject);
var
  nom : String;
  x, codag : Integer;
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM SIMCRED');
  Dm.ArqAux.Sql.Add('ORDER BY recno');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    // abrindo TD;
    Dm.Td.Close;
    Dm.Td.Sql.Clear;
    Dm.Td.Sql.Add('SELECT * FROM td');
    Dm.Td.Sql.Add('WHERE');
    Dm.Td.Sql.Add('recno = 0');
    Dm.Td.Open;
    //Abrindo TD_Pesso
    Dm.Td_Pesso.Close;
    Dm.Td_Pesso.Sql.Clear;
    Dm.Td_Pesso.Sql.Add('SELECT * FROM td_pesso');
    Dm.Td_Pesso.Sql.Add('WHERE');
    Dm.Td_Pesso.Sql.Add('recno = 0');
    Dm.Td_Pesso.Open;
    //pegando os valores de cálculo
    CalculoGeral(MaskEdit1.Text, '03', 0.00, 1, 0, 1, 0, 8, 0,'N');
    while (not Dm.ArqAux.Eof) do
    begin
      protocolo := '';
      nomeag    := '';
      nomepo    := '';
      endpo     := '';
      cidpo     := '';
      baipo     := '';
      estpo     := '';
      ceppo     := '';
      codpo     := '0';
      codfil    := '0';
      GerarProtocolo;
      StatusBar1.SimpleText := 'Recepção automática em andamento...Protocolando ' + protocolo;
      StatusBar1.UpDate;
      if (Copy(Label4.Caption, 1,3) = 'UNI') AND
         (Dm.ArqAux.FieldByName('tipo_not').asString = 'B') then
      begin
        codag := 1;
      end
      else
      begin
        if (Copy(Label4.Caption, 1,3) = 'UNI') AND
          (Dm.ArqAux.FieldByName('tipo_not').asString = 'L') then
        begin
          codag := 2;
        end;
      end;
      //código na tabela escritorio dos clientes da andrada e negeiros
      if (Copy(Label4.Caption, 1,3) = 'DIB') AND
         (Dm.ArqAux.FieldByName('tipo_not').asString = 'B') then
      begin
        codag := 3;
      end
      else
      begin
        if (Copy(Label4.Caption, 1,3) = 'DIB') AND
           (Dm.ArqAux.FieldByName('tipo_not').asString = 'L') then
        begin
          codag := 4;
        end;
      end;

      begin
        //Showmessage(Copy(narq, 2,4));
        if (Copy(narq, 1,4) = 'SUNI') then
        Begin
          if (Dm.ArqAux.FieldByName('produto').asString = 'CDC')     then codag := 1;
          if (Dm.ArqAux.FieldByName('produto').asString = 'LEASING') then codag := 2;
        end;
      end;

      begin
        if (Copy(narq, 1,4) = 'SDIB') then
        Begin
          if (Dm.ArqAux.FieldByName('produto').asString = 'CDC')     then codag := 3;
          if (Dm.ArqAux.FieldByName('produto').asString = 'LEASING') then codag := 4;
        end;
      end;


      if (not BuscaPortador('', CodCli, CodAg)) then Atualiza_LogErro(narq, Label3.Caption, 'DADOS DO PORTADOR NÃO ENCONTRADO NO PROTOCOLO ' + protocolo, CodCli);
      nom  := Trim(Dm.ArqAux.FieldByName('nomecliente').asString);
      // incluindo dados do td_pesso
      for x := 1 to 2 do
      begin
        Dm.Td_Pesso.Append;
        Dm.Td_Pesso.FieldByName('data').asString          := MaskEdit1.Text;
        Dm.Td_Pesso.FieldByName('p_auxiliar').asString    := protocolo;
        Dm.Td_Pesso.FieldByName('protocolo').asString     := protocolo;
        Dm.Td_Pesso.FieldByName('tipo').asString          := 'N';
        if (x = 1) then
        begin
          Dm.Td_Pesso.FieldByName('nome').asString        := nomepo;
          Dm.Td_Pesso.FieldByName('endereco').asString    := endpo;
          Dm.Td_Pesso.FieldByName('bairro').asString      := baipo;
          Dm.Td_Pesso.FieldByName('cidade').asString      := cidpo;
          Dm.Td_Pesso.FieldByName('estado').asString      := estpo;
          Dm.Td_pesso.FieldByName('cep').asString         := ceppo;
          Dm.Td_Pesso.FieldByName('situacao').asString    := 'R';
        end;
        //Ignorado - Coutinho
        if (x = 4) then
        begin
          Dm.Td_Pesso.FieldByName('nome').asString        := nomeag;
          Dm.Td_Pesso.FieldByName('endereco').asString    := endpo;
          Dm.Td_Pesso.FieldByName('bairro').asString      := baipo;
          Dm.Td_Pesso.FieldByName('cidade').asString      := cidpo;
          Dm.Td_Pesso.FieldByName('estado').asString      := estpo;
          Dm.Td_pesso.FieldByName('cep').asString         := ceppo;
          Dm.Td_Pesso.FieldByName('situacao').asString    := 'R';
        end;
        if (x = 2) then
        begin
          Dm.Td_Pesso.FieldByName('nome').asString        := Trim(Uppercase(Dm.ArqAux.FieldByName('nomecliente').asString));
          Dm.Td_Pesso.FieldByName('endereco').asString    := Trim(Uppercase(Dm.ArqAux.FieldByName('endereco').asString));
          Dm.Td_Pesso.FieldByName('bairro').asString      := Trim(Uppercase(Dm.ArqAux.FieldByName('bairro').asString));
          Dm.Td_Pesso.FieldByName('numero').asString      := Trim(Uppercase(Dm.ArqAux.FieldByName('numero').asString));
          Dm.Td_Pesso.FieldByName('complem').asString     := Trim(Uppercase(Dm.ArqAux.FieldByName('complemento').asString));
          Dm.Td_Pesso.FieldByName('cidade').asString      := Trim(Uppercase(Dm.ArqAux.FieldByName('cidade').asString));
          Dm.Td_Pesso.FieldByName('estado').asString      := Trim(Uppercase(Dm.ArqAux.FieldByName('uf').asString));
          Dm.Td_pesso.FieldByName('cep').asString         := trim(trimchar(Dm.ArqAux.FieldByName('cep').asString,'-'));
          Dm.Td_Pesso.FieldByName('situacao').asString    := 'D';
        end;
        Dm.Td_Pesso.Post;
      end;
      // dados do TD
      Dm.Td.Append;
      Dm.Td.FieldByName('data_r').asString              := MaskEdit1.Text;
      Dm.Td.FieldByName('p_auxiliar').asString          := protocolo;
      Dm.Td.FieldByName('protocolo').asString           := protocolo;
      Dm.Td.FieldByName('a_nome').asString              := nomepo;
      Dm.Td.FieldByName('a_endereco').asString          := endpo;
      Dm.Td.FieldByName('a_cidade').asString            := nomeag;
      Dm.Td.FieldByName('agencia').asString             := nomeag;
      Dm.Td.FieldByName('cod_port').asString            := codpo;
      Dm.Td.FieldByName('cod_cli').asString             := codfil;
      Dm.Td.FieldByName('ncliente').asInteger           := CodCli;
      Dm.Td.FieldByName('tipo').asstring                := 'N';
      Dm.Td.FieldByName('status').asstring              := 'RECEPCAO';
      Dm.Td.FieldByName('natureza').asstring            := '180';
      Dm.Td.FieldByName('ext_nat').asstring             := 'NOTIFICACAO AR';
      Dm.Td.FieldByName('data_entr').asstring           := DateToStr(Ver_DiaUtil(StrToDate(MaskEdit1.Text) + 30));
      Dm.Td.FieldByName('identifica').asstring          := F_Menu.Label1.caption;
      Dm.Td.FieldByName('contrato').asString            := Dm.ArqAux.FieldByName('contrato').asString;
      Dm.Td.FieldByName('produto').asString             := Dm.ArqAux.FieldByName('produto').asString;
      Dm.Td.FieldByName('parcelas').asString            := Dm.ArqAux.FieldByName('parcela').asString + '/' + Dm.ArqAux.FieldByName('plano').asString ;
      Dm.Td.FieldByName('ven_parc').asString            := Copy(Trim(Dm.ArqAux.FieldByName('vencto').asString),1,10);
      Dm.Td.FieldByName('op_dat').asString               := Dm.ArqAux.FieldByName('datanotif').asString;
      //Dm.Td.FieldByName('obs_not2').asString            := Dm.ArqAux.FieldByName('retnotif').asString;
      //Dm.Td.FieldByName('obs_not3').asString            := Dm.ArqAux.FieldByName('status').asString;

      Dm.Td.FieldByName('qtde_eti').asInteger           := 2;
      Dm.Td.FieldByName('mod_eti').asInteger            := 1;
      // calculo
      Dm.Td.FieldByName('tabela').asstring       := '03';
      Dm.Td.FieldByName('divisor').asstring      := '01';
      Dm.Td.FieldByName('microfilme').asInteger  := 1;
      Dm.Td.FieldByName('pag_adic').asInteger    := 0;
      Dm.Td.FieldByName('vias_adc').asInteger    := 0;
      Dm.Td.FieldByName('cod_local').asInteger   := 8;
      Dm.Td.FieldByName('v_cartorio').asCurrency := VrOfiG;
      Dm.Td.FieldByName('v_estado').asCurrency   := VrEstG;
      Dm.Td.FieldByName('v_ipesp').asCurrency    := VrIpeG;
      Dm.Td.FieldByName('v_sinoreg').asCurrency  := VrSinG;
      Dm.Td.FieldByName('v_tribunal').asCurrency := VrTriG;
      Dm.Td.FieldByName('v_conducao').asCurrency := VrCond;
      Dm.Td.FieldByName('v_total').asCurrency    := VrTotG;
      Dm.Td.FieldByName('vo_pag').asCurrency     := VrOfiPagG;
      Dm.Td.FieldByName('ve_pag').asCurrency     := VrEstPagG;
      Dm.Td.FieldByName('vi_pag').asCurrency     := VrIpePagG;
      Dm.Td.FieldByName('vs_pag').asCurrency     := VrSinPagG;
      Dm.Td.FieldByName('vt_pag').asCurrency     := VrTriPagG;
      Dm.Td.FieldByName('v_pag').asCurrency      := VrTotPagG;
      Dm.Td.FieldByName('vo_mic').asCurrency     := VrOfiMicG;
      Dm.Td.FieldByName('ve_mic').asCurrency     := VrEstMicG;
      Dm.Td.FieldByName('vi_mic').asCurrency     := VrIpeMicG;
      Dm.Td.FieldByName('vs_mic').asCurrency     := VrSinMicG;
      Dm.Td.FieldByName('vt_mic').asCurrency     := VrTriMicG;
      Dm.Td.FieldByName('v_mic').asCurrency      := VrTotMicG;
      Dm.Td.FieldByName('vo_adc').asCurrency     := VrOfiAdcG;
      Dm.Td.FieldByName('ve_adc').asCurrency     := VrEstAdcG;
      Dm.Td.FieldByName('vi_adc').asCurrency     := VrIpeAdcG;
      Dm.Td.FieldByName('vs_adc').asCurrency     := VrSinAdcG;
      Dm.Td.FieldByName('vt_adc').asCurrency     := VrTriAdcG;
      Dm.Td.FieldByName('v_adc').asCurrency      := VrTotAdcG;
      Dm.Td.FieldByName('custas').asCurrency     := (VrTotG + VrTotPagG + VrTotMicG + VrTotAdcG + VrCond);
      Dm.Td.FieldByName('arquivo').asString      := narq;
      Dm.Td.Post;
      Dm.ArqAux.Next;
    end;
    Dm.Td.Close;
    Dm.Td_Pesso.Close;
  end;
  Dm.ArqAux.Close;
  //DestroeTabela(arq);
end; }

{Procedure TF_Inter.Carrega_SINCRED(Sender : TOBJect);
var
  Texto, arqconv, arqconv2 : String;
  ori, dest, plan : WideString;
  x, y, Posi : Integer;
  portador, devedor, contrato, endereco1, bairro1, cidade1, cep1, uf1, tipo_not : String;
begin

  if (FileExists(F_Menu.Label31.Caption + 'DM.Simcred.TXT')) then DeleteFile(F_Menu.Label31.Caption + 'DM.Simcred.TXT');
  ///Conversão do arquivo para de xls para txt
  objXLS := CoclsMain.Create;
  arqconv:= copy(MaskEdit2.Text, Length(MaskEdit2.Text)-12,13);
  ori    := arqconv;
  dest   := 'DM.Simcred.TXT';
  plan   := 'plan1$';
  if objXLS.XLStoTXT_2000(F_Menu.Label31.Caption,ori,dest,plan) = True Then
//  if objXLS.XLStoTXT_2000('c:\work\fonte td',ori,dest,plan) = True Then
   messagedlg('Arquivo Convertido com Sucesso!',mtInformation,[mbok],0)
  else messagedlg('Problema na Conversão.',mtWarning,[mbok],0);
  ///Pegando nome do arquivo
  narq := copy(MaskEdit2.Text, Length(MaskEdit2.Text)-12,13);
  arqconv2 := F_Menu.Label31.Caption + 'SINCRED.TXT';
//  arqconv2 := 'c:\work\fonte td\ANDRADA.TXT';
  //
  arq  := '';
  arq  := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'SIMCREDTMP';
  narq := '';
  narq := Trim(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 12, 20));
  Label4.Caption := narq;
  CriaTabela('SIMCREDTMP', arq);
  // importando arquivo para tabela temporária
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.LoadFromFile(arqconv2);
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    q_reg     := q_reg + 1;
    y         := 0;
    portador  := '';
    devedor   := '';
    contrato  := '';
    endereco1 := '';
    bairro1   := '';
    cidade1   := '';
    uf1       := '';
    cep1      := '';
    tipo_not  := '';
    Posi      := 1;
    Texto     := '';
    Texto     := RichEdit1.Lines.Strings[x];
    while (Posi > 0) do
    begin
      Posi    := Pos(';', Texto);
      if (Trim(portador) = '') then
      begin
        Portador := Copy(RichEdit1.Lines.Strings[x], 1, (Posi - 1));
      end
      else if (Trim(devedor) = '') then
      begin
        Devedor := Maiusculo(TirarAPostrofe(Copy(Texto, 1, (Posi-1))));
      end
      else if (Trim(contrato) = '') then
      begin
        contrato := Trim(Copy(Texto, 1, (Posi-1)));
      end
      else if (Trim(endereco1) = '') then
      begin
        endereco1 := Maiusculo(TirarAPostrofe(Copy(Texto, 1, (Posi-1))));
      end
      else if (Trim(bairro1) = '') then
      begin
        Bairro1 := Maiusculo(TirarAPostrofe(Copy(Texto, 1, (Posi-1))));
      end
      else if (Trim(cidade1) = '') then
      begin
        cidade1 := Maiusculo(TirarAPostrofe(Copy(Texto, 1, (Posi-1))));
      end
      else if (Trim(uf1) = '') then
      begin
        uf1 := Maiusculo(Trim(Copy(Texto, 1, (Posi-1))));
      end
      else if (Trim(cep1) = '') then
      begin
        cep1 := Maiusculo(TirarTudo(Copy(Texto, 1, (Posi-1)), Chr(39), '-', ''));
      end
      else if (Trim(tipo_not) = '') then
      begin
        Tipo_Not := Maiusculo(Trim(Copy(Texto, 1, (Posi-1))));
      end;
      Texto := Copy(Texto, (Posi+1), Length(Texto));
    end;
    Dm.ArqAux.Close;
    Dm.ArqAux.Sql.Clear;
    Dm.ArqAux.Sql.Add('INSERT INTO ' + arq);
    Dm.ArqAux.Sql.Add('(portador, nomedev, contrato, endereco1, bairro1, cidade1, uf1, cep1, tipo_not, arquivo, indexador)');
    Dm.ArqAux.Sql.Add('VALUES(');
    Dm.ArqAux.Sql.Add(Chr(39) + portador + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + devedor + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + contrato + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + endereco1 + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + bairro1 + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + cidade1 + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + uf1 + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + cep1 + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + tipo_not + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + narq + Chr(39) + ',');
    Dm.ArqAux.Sql.Add(Chr(39) + IntToStr(x) + Chr(39) + ')');
    Dm.ArqAux.ExecSQL;
  end;
  // Realizando verificação no arquivo
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY recno');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount <> 0) then
  begin
    erro := False;
    while (not Dm.ArqAux.Eof) do
    begin
      if (Trim(Dm.ArqAux.FieldByName('contrato').asString) = '') then
      begin
        erro := True;
        Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'FALTA O Nº DO CONTRADO NA LINHA ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
      end;
      if (Trim(Dm.ArqAux.FieldByName('uf1').asString) = '') then
      begin
        erro := True;
        Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'FALTA UNIDADE FISCAL NA LINHA ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
      end;
      if (Trim(Dm.ArqAux.FieldByName('endereco1').asString) = '') then
      begin
        erro := True;
        Atualiza_LogErro(Dm.ArqAux.FieldByName('arquivo').asString, Label3.Caption, 'FALTA ENDEREÇO RESIDENCIAL NA LINHA ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
      end;
      //Verificando o CEP
      if (Trim(Dm.ArqAux.FieldByName('cep1').asString) = '') then
      begin
        Atualiza_LogErro(Trim(Dm.ArqAux.FieldByName('arquivo').asString), Label3.Caption, 'CEP não encontrado na linha ' +  StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5), CodCli);
      end
      else
      begin
        if (ContaZeros(Trim(Dm.ArqAux.FieldByName('cep1').asString)) < 7) then
        begin
          Dm.Cep.Close;
          Dm.Cep.Sql.Clear;
          Dm.Cep.Sql.Add('SELECT estado, cidade FROM cep');
          Dm.Cep.Sql.Add('WHERE');
          Dm.Cep.Sql.Add('cep = ' + Chr(39) + Trim(Dm.ArqAux.FieldByName('cep1').asString) + Chr(39));
          Dm.Cep.Open;
          if (Dm.Cep.RecordCount = 0) then
          begin
            Atualiza_LogErro(Trim(Dm.ArqAux.FieldByName('arquivo').asString), Label3.Caption, 'CEP da linha ' +  StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5) + ' não encontrado no cadastro de ceps.', CodCli);
          end
          else
          begin
            if (Dm.Cep.FieldByName('estado').asString <> Trim(Dm.ArqAux.FieldByName('uf1').asString))     then Atualiza_LogErro(Trim(Dm.ArqAux.FieldByName('arquivo').asString), Label3.Caption, 'Unidade Fiscal(' + uf + ') da linha ' + StrZero(DM.ArqAux.FieldByName('indexador').asString, 5) + ' diferente com a encontrada no cadastro de CEP(' + Dm.Cep.FieldByName('estado').asString + ').', CodCli);
            if (UpperCase(RetiraAcentos(Trim(Dm.Cep.FieldByName('cidade').asString))) <> UpperCase(RetiraAcentos(Trim(Dm.ArqAux.FieldByName('cidade1').asString)))) then Atualiza_LogErro(Trim(Dm.ArqAux.FieldByName('arquivo').asString), Label3.Caption, 'Cidade(' + Trim(Dm.ArqAux.FieldByName('cidade1').asString) + ') da linha ' + StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5) + ' diferente com a encontrada no cadastro de CEP(' + UpperCase(RetiraAcentos(Trim(Dm.Cep.FieldByName('cidade').asString))) + ').', CodCli);
          end;
          Dm.Cep.Close;
        end
        else
        begin
          Atualiza_LogErro(Trim(Dm.ArqAux.FieldByName('arquivo').asString), Label3.Caption, 'CEP da linha ' +  StrZero(Dm.ArqAux.FieldByName('indexador').asString, 5) + ' inválido(' + Trim(Dm.ArqAux.FieldByName('cep1').asString) + ').', CodCli);
        end;
        Dm.ArqAux.Next;
      end;
    end;
  end;
  Dm.ArqAux.Close;
end; }

{Procedure TF_Inter.CarregaSIMCRED(Sender : TOBJect);
var
  Texto : String;
  ori, dest, plan : WideString;
  x, y, Posi : Integer;
  portador, devedor, contrato, endereco1, bairro1, cidade1, cep1, uf1, tipo_not, diretorio : String;
  SR: TSearchRec;
  I: integer;
begin
  diretorio := '';
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('delete FROM simcred');
  Dm.ArqAux.ExecSql;
  narq := '';
  narq := Trim(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 11, 20));


  CopyFile(PChar(f_inter.maskedit2.text),PChar(F_menu.importcsv.caption + narq),True);

  diretorio := copy(F_Menu.label31.caption,1,2) + '\' + copy(F_Menu.label31.caption,3,60) + '\' + narq;
  //diretorio := copy(maskedit2.text,1,2) + '\' + copy(maskedit2.text,3,60);
  //Coutinho 11/01/2005
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('LOAD DATA INFILE ' + chr(39) + '\' + narq + chr(39) + ' INTO TABLE simcred fields terminated by ";"');
  //Dm.ArqAux.Sql.savetofile('c:\teste.txt');
  Dm.ArqAux.ExecSql;

  //Apagando arquivos CSV **Temporário
  I := FindFirst(F_menu.importcsv.caption + '*.csv', faAnyFile, SR);
  while I = 0 do
  begin
  if (SR.Attr and faDirectory) <> faDirectory then
  if not DeleteFile(F_menu.importcsv.caption + SR.Name) then
  ShowMessage('Exclusão não concluída ' + SR.Name);
  I := FindNext(SR);
  end;
  //arq  := '';
  //arq  := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'BACHTMP';

  //CopyFile(PChar(maskedit2.text),PChar('\\linuxtd\'),True)

  DM.Simcred.open;
  DM.Simcred.findfirst;
  if (DM.Simcred.RecordCount <> 0) then
  begin
    erro := False;
    while (not DM.Simcred.Eof) do
    begin
      if (Trim(DM.Simcred.FieldByName('regional').asString) = '') then
      begin
        erro := True;
        Atualiza_LogErro(narq, Label3.Caption, 'FALTA REGIONAL NA LINHA ' + StrZero(DM.Simcred.FieldByName('recno').asString, 5), CodCli);
      end;
      if (Trim(DM.Simcred.FieldByName('contrato').asString) = '') then
      begin
        erro := True;
        Atualiza_LogErro(narq, Label3.Caption, 'FALTA CONTRATO NA LINHA ' + StrZero(DM.Simcred.FieldByName('recno').asString, 5), CodCli);
      end;
      if (Trim(DM.Simcred.FieldByName('cif').asString) = '') then
      begin
        erro := True;
        Atualiza_LogErro(narq, Label3.Caption, 'FALTA CIF NA LINHA ' + StrZero(DM.Simcred.FieldByName('recno').asString, 5), CodCli);
      end;
      //Verificando nome do cliente
      if (Trim(DM.Simcred.FieldByName('nomecliente').asString) = '') then
      begin
        Atualiza_LogErro(Trim(narq), Label3.Caption, 'FALTA NOME DO CLIENTE NA LINHA ' +  StrZero(DM.Simcred.FieldByName('recno').asString, 5), CodCli);
      end;
      //Verificando endereco
      if (Trim(DM.Simcred.FieldByName('endereco').asString) = '') then
      begin
        Atualiza_LogErro(Trim(narq), Label3.Caption, 'FALTA ENDEREÇO NA LINHA ' +  StrZero(DM.Simcred.FieldByName('recno').asString, 5), CodCli);
      end;

      //Verificando Produto
      if (Trim(DM.Simcred.FieldByName('produto').asString) = '') then
      begin
        Atualiza_LogErro(Trim(narq), Label3.Caption, 'FALTA PRODUTO NA LINHA ' +  StrZero(DM.Simcred.FieldByName('recno').asString, 5), CodCli);
      end;


      //Verificando o CEP
            if trimchar(Trim(DM.Simcred.FieldByName('cep').asString),'-') = '' then
      begin
        Atualiza_LogErro(Trim(narq), Label3.Caption, 'FALTA NOME DO CLIENTE NA LINHA ' +  StrZero(DM.Simcred.FieldByName('recno').asString, 5), CodCli);
      end
      else
      begin
        if (ContaZeros(trimchar(Trim(DM.Simcred.FieldByName('cep').asString),'-')) < 7) then
        begin
          Dm.Cep.Close;
          Dm.Cep.Sql.Clear;
          Dm.Cep.Sql.Add('SELECT estado, cidade FROM cep');
          Dm.Cep.Sql.Add('WHERE');
          Dm.Cep.Sql.Add('cep = ' + Chr(39) + trimchar(Trim(DM.Simcred.FieldByName('cep').asString),'-') + Chr(39));
          Dm.Cep.Open;
          if (Dm.Cep.RecordCount = 0) then
          begin
            Atualiza_LogErro(Trim(narq), Label3.Caption, 'CEP da linha ' +  StrZero(DM.Simcred.FieldByName('recno').asString, 5) + ' não encontrado no cadastro de ceps.', CodCli);
          end
          else
          begin
//            if (Dm.Cep.FieldByName('estado').asString <> Trim(DM.Simcred.FieldByName('uf').asString))     then Atualiza_LogErro(Trim(narq), Label3.Caption, 'Unidade Fiscal(' + uf + ') da linha ' + StrZero(DM.Simcred.FieldByName('recno').asString, 5) + ' diferente com a encontrada no cadastro de CEP(' + Dm.Cep.FieldByName('estado').asString + ').', CodCli);
            if (UpperCase(RetiraAcentos(Trim(Dm.Cep.FieldByName('cidade').asString))) <> UpperCase(RetiraAcentos(Trim(DM.Simcred.FieldByName('cidade').asString)))) then Atualiza_LogErro(Trim(narq), Label3.Caption, 'Cidade(' + Trim(DM.Simcred.FieldByName('cidade').asString) + ') da linha ' + StrZero(DM.Simcred.FieldByName('recno').asString, 5) + ' diferente com a encontrada no cadastro de CEP(' + UpperCase(RetiraAcentos(Trim(Dm.Cep.FieldByName('cidade').asString))) + ').', CodCli);
          end;
          Dm.Cep.Close;
        end
        else
        begin
          Atualiza_LogErro(Trim(narq), Label3.Caption, 'CEP da linha ' +  StrZero(DM.Simcred.FieldByName('recno').asString, 5) + ' inválido(' + Trim(DM.Simcred.FieldByName('cep1').asString) + ').', CodCli);
        end;

      end;
      DM.Simcred.Next;
    end;
  end;
  //DM.Simcred.Close;
end;
 }
Function TrimChar(Texto: String; DelChar: Char): String;
Var S: String;
begin
  // Removendo espaços/caracteres de uma string
  S := Texto;
  While Pos(DelChar,S) > 0 do
    Delete(S,Pos(DelChar,S),1);
  Result := Trim(S);
end;

function Adapta(Valor : STring) : String;
var
  w : Integer;
begin
  result := '';
  for w := 1 to length(valor) do
  begin
    if (copy(valor,w,1) <> ',') and (copy(valor,w,1) <> '.') and (copy(valor,w,1) <> '-') then result := result + copy(valor,w,1);
  end;
  result := '0000000000' + result;
  result := copy(result, length(result) - 9, 10);
end;

Procedure Gravar_Caixa;
begin
  Dm.Caixa.Close;
  Dm.Caixa.Sql.Clear;
  Dm.Caixa.Sql.Add('SELECT * FROM caixa where 1 = 2');
  Dm.Caixa.open;
  Dm.caixa.Append;
  Dm.caixa.fieldbyname('data').asstring := F_Inter.Maskedit1.text;
  Dm.caixa.fieldbyname('codc').asstring := '10';
  Dm.caixa.fieldbyname('operacao').asstring := 'E';
  Dm.caixa.fieldbyname('historico').asstring := 'TÍTULO PARA REGISTRO - N.E.';
  Dm.caixa.fieldbyname('protocolo').asstring := protocolo;
  Dm.caixa.fieldbyname('valor').ascurrency := 0;
  Dm.caixa.fieldbyname('valor_di').ascurrency := 0;
  Dm.caixa.fieldbyname('val_dep').ascurrency := 0;
  Dm.caixa.fieldbyname('valor_ch').ascurrency := 0;
  Dm.caixa.fieldbyname('identifica').asstring := F_Menu.Label1.Caption;
  Dm.caixa.Post;
  Dm.Caixa.Close;
end;

Function TransLau(Valor : String) : Currency;
var
  carac, novo : String;
  x : Integer;
begin

  if length(valor) < 4 then
  begin
    result := 0;
    exit;
  end;
  novo := '';
  for x := 1 to length(valor) do
  begin
    carac := copy(valor,x,1);
    if (carac <> '.') and (carac <> ',') then novo := novo + carac;
  end;
  novo := copy(novo,1,length(novo) - 2) + ',' + copy(novo,length(novo) - 1,2);
  result := strtocurr(novo);
end;

procedure TF_Inter.BitBtn4Click(Sender: TObject);
begin
  close;
end;


procedure TF_Inter.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn5.setfocus;
  if key = 27 then close;
end;

procedure TF_Inter.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
  if key = 27 then close;
end;

procedure TF_Inter.BitBtn1Click(Sender: TObject);
var
  teste : string;
begin
  erro := False;
  if not FileExists(MaskEdit2.Text) then
  begin
    showmessage('Arquivo inexistente');
    maskedit2.setfocus;
    exit;
  end;
  statusbar1.SimpleText := 'Carregando arquivo ...';
  statusbar1.update;
  statusbar1.SimpleText := 'Verificando integridade do arquivo ...';
  statusbar1.update;
  F_Menu.Vezes.Caption := '1';
  q_reg  := 0;
  CodCli := 0;
  Label4.Caption := '';
  Label3.Caption := '';
  Label3.Caption := Copy(TimeToStr(time), 1,5);
  //MERCABENCO  - Anderson : 13/01/2005 -  12:17 Hs.
  if (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 11, 4)) = 'MERC') then
  begin
    n_arq          := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 11, 20)));
    Label4.Caption := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 11, 20)));
    CodCli         := 1;
    Carrega_Mercabenco(F_Inter);
  end;
  if (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 3)) = 'LID') then
  begin
    n_arq          := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    Label4.Caption := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    CodCli         := 3;
    Carrega_Lideranca(F_Inter);
  end;
  //Secundino & Moura - Adiléia: 10/03/2005
  if (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 3)) = 'SEC') then
  begin
    n_arq          := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    Label4.Caption := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    CodCli         := 6;
    Carrega_Secundino(F_Inter);
  end;

  //Ernandes M. Silva Advogados Associados - Adiléia: 28/03/2005
  if (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 3)) = 'ERN') then
  begin
    n_arq          := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    Label4.Caption := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    CodCli         := 51;
    Carrega_Ernandes(F_Inter);
  end;

  // W.O.Costa
  if ((Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 3)) = 'WOS') or
      (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 3)) = 'WOP') or
      (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 3)) = 'WOT'))then
  begin
    n_arq          := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    Label4.Caption := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    CodCli         := 11;
    Carrega_WOCosta(F_Inter);
  end;

  //Scania Adm. de Consórcios Ltda - Adiléia 03/10/2005
  if (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 3)) = 'SCA') then
  begin
    n_arq          := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    Label4.Caption := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    CodCli         := 18;
    Carrega_Scania(F_Inter);
  end;

  //Empenho Empresa de Cobrança - EPP - Adiléia 05/05/2006
  if (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 3)) = 'EMP') then
  begin
    n_arq          := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    Label4.Caption := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20)));
    CodCli         := 22;
    Carrega_Empenho(F_Inter);
  end;

  //modelo de importação de arquivo XLS.
  if (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 18, 3)) = 'ADV') then
  begin
    n_arq          := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 18, 15)));
    Label4.Caption := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 18, 15)));
    CodCli         := 23;
    Carrega_AdvMoraes(F_Inter);
  end;
 {
  //modelo de importação de arquivo XLS.
 if (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 11, 4)) = 'SUNI') OR (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 11, 4)) = 'SDIB') then
  begin
    Label4.Caption := (Maiusculo(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 12, 3)));
    CodCli         := 20;
    CarregaSIMCRED(F_Inter);
  end;
  }
  StatusBar1.SimpleText := 'Foram encontrados ' + IntToStr(q_reg) + ' registro(s)';
  statusBar1.UpDate;
  TriarTitulos(F_Inter);
  //Verificando a existência de erro no arquivo importado
  //Retirada a exibição da triagem, a pedido da Sra. Valeska em 05/02/2007 por Adiléia
 { Dm.Log_Erro.Close;
  Dm.Log_Erro.Sql.Clear;
  Dm.Log_Erro.Sql.Add('SELECT * FROM log_erro');
  Dm.Log_Erro.Sql.Add('WHERE');
  Dm.Log_Erro.Sql.Add('    data    = ' + Chr(39) + ConvData(DateToStr(Date)) + Chr(39));
  Dm.Log_Erro.Sql.Add('AND arquivo = ' + Chr(39) + Label4.Caption + Chr(39));
  Dm.Log_Erro.Sql.Add('AND hora    = ' + Chr(39) + Label3.Caption + Chr(39));
  Dm.Log_Erro.Open;
  if (Dm.Log_Erro.RecordCount <> 0) then
  begin
    Application.CreateForm(TQk_LogErro, Qk_LogErro);
    Qk_LogErro.QrLabel1.Caption := F_Menu.Caption;
    Qk_LogErro.QrLabel2.Caption := 'TRIAGEM DAS NOTIFICAÇÕES RECEPCIONADAS NO DIA ' + Dm.Log_Erro.FieldByName('data').asString + ' - Arquivo : ' + Dm.Log_Erro.FieldByName('arquivo').asString;
    Qk_LogErro.QuickRep1.Preview;
    Qk_LogErro.Destroy;
    Qk_LogErro := NIL;
  end;
  Dm.Log_Erro.Close;  }
  //**********************
  if (not Erro) then
  begin
    Bitbtn1.enabled := false;
    Bitbtn2.enabled := true;
    Bitbtn2.setfocus;
  end
  else MaskEdit1.SetFocus;
end;

procedure TF_Inter.BitBtn2Click(Sender: TObject);
var
  arqq : String;
  arqand, cam : String;
begin
  //*****************
  bitbtn1.enabled       := false;
  bitbtn2.enabled       := false;
  statusbar1.simpletext := 'Recepção automatica em andamento...';
  statusbar1.update;
  Screen.cursor         := crhourglass;
  pi                    := '';
  pf                    := '';
  ColocaTrava('S');
  Gravar(F_Inter);
  ColocaTrava('N');
  Screen.cursor := crdefault;
  StatusBar1.SimpleText := 'Protocolos gerados de ' + pi + ' até ' + pf + '. Fim da recepção automática !';
  StatusBar1.UpDate;
  BitBtn3.setfocus;
end;

procedure TF_Inter.BitBtn3Click(Sender: TObject);
begin
  statusbar1.simpletext := '';
  statusbar1.update;
  bitbtn1.enabled := true;
  bitbtn2.enabled := false;
  maskedit2.text := '';
  richedit1.clear;
  richedit2.clear;
  RichEdit3.Clear;
//  BitBtn6.Enabled := False;
//  Label16.Visible := False;
  maskedit1.setfocus;
  DM.Simcred.Close;
end;

procedure TF_Inter.BitBtn5Click(Sender: TObject);
begin
 // Opendialog1.InitialDir := 'S:\td\online\';
  Opendialog1.InitialDir := 'C:\td\online\';
  if not Opendialog1.Execute then
     Exit;
  maskedit2.text := OpenDialog1.FileName;
  maskedit2.setfocus;
  chdir(workdir);
end;

procedure TF_Inter.FormCreate(Sender: TObject);
begin
  getdir(0, workdir);
end;

procedure TF_Inter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Simcred.Close;
  chdir(workdir);
end;

procedure TF_Inter.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn5.setfocus;
  if key = 27 then close;
end;

procedure TF_Inter.FormActivate(Sender: TObject);
 Var
 SR: TSearchRec;
 I: integer;
begin

  //Apagando arquivos CSV **Temporário
  I := FindFirst(F_menu.label31.caption + '*.csv', faAnyFile, SR);
  while I = 0 do
  begin
     if (SR.Attr and faDirectory) <> faDirectory then
        if not DeleteFile(F_menu.label31.caption + SR.Name) then
           ShowMessage('Exclusão não concluída ' + SR.Name);
     I := FindNext(SR);
  end;
  //Apagando arquivos txt **Temporário
  I := FindFirst(F_menu.label31.caption + '*.txt', faAnyFile, SR);
  while I = 0 do
  begin
     if (SR.Attr and faDirectory) <> faDirectory then
        if not DeleteFile(F_menu.label31.caption + SR.Name) then
           ShowMessage('Exclusão não concluída ' + SR.Name);
     I := FindNext(SR);
  end;
  //Apagando arquivos XLS **Temporário
  I := FindFirst(F_menu.label31.caption + '*.xls', faAnyFile, SR);
  while I = 0 do
  begin
     if (SR.Attr and faDirectory) <> faDirectory then
         if not DeleteFile(F_menu.label31.caption + SR.Name) then
            ShowMessage('Exclusão não concluída ' + SR.Name);
     I := FindNext(SR);
  end;

  if F_Menu.Label37.Caption  = 'D' then
  begin
     DBGrid1.Width   := 577;
     RichEdit1.Width := 577;
  end;

end;

procedure TF_Inter.Carrega_AdvMoraes(Sender: TOBJect);
var
  Arquivo : TextFile;
  Dados : TStringList;
  ContLinha : Integer;
  Linha : string;
begin
   if MessageDlg('Confirma importação ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      q_reg      := 0;
      arq_lendo  := '';
      arq_lendo  := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'ONLINE';
      narq       := '';
      narq       := Trim(Copy(MaskEdit2.Text, Length(MaskEdit2.Text) - 10, 20));
      CriaTabela('ONLINE', arq_lendo);
      {$I+}
      AssignFile(Arquivo, Trim(MaskEdit2.Text));
      Reset(Arquivo);
      ListImportacao := TList.Create;

      if IOResult <> 0 then
         MessageDlg('Falha na abertura do arquivo!', mtError, [mbOk], 0)
      else
      begin
         ContLinha := 0;
         while not Eof(Arquivo) do
         begin
            Inc(ContLinha);
            if ContLinha > 1 then
            begin
               Inc(q_reg);
               ReadLn(Arquivo, Linha);
               New(Importa);
               Importa^.cliente := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
               Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));

               if Pos(';', Linha) > 0 then
               begin
                  Importa^.contrato := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.grupo := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.cota := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.nome := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.endereco := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.bairro := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.cidade := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.cep := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.uf := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor1 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data1 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor2 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data2 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor3 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data3 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor4 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data4 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor5 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data5 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor6 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data6 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor7 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data7 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor8 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data8 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor9 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data9 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor10 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data10 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor11 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data11 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor12 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data12 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor13 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data13 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor14 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data14 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor15 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data15 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.valor16 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Linha := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));
                  Importa^.data16 := Trim(Copy(Linha, 1, Pos(';', Linha) - 1));
                  Importa^.valorTotal := Copy(Linha, Pos(';', Linha) + 1, Length(Linha));

                  ListImportacao.Add(Importa);
               end;
            end;
         end;

         GravaImportacao(Arq_Lendo);
      end;
   end;
end;

function TF_Inter.GravaImportacao(Tabela: string): Boolean;
var
  QryImporta : TQuery;
  i : Integer;
begin
   QryImporta := TQuery.Create(Application);
   QryImporta.DatabaseName := DM.DBTD.DatabaseName;

   try
     with QryImporta do
     begin
        for i := 0 to ListImportacao.Count - 1 do
        begin
           Importa := ListImportacao.Items[i];
           Close;
           SQL.Clear;
           SQL.Add('INSERT INTO ' + Tabela + ' (');
           SQL.Add('  indexador                 ');
           SQL.Add(', cliente                   ');
           SQL.Add(', contrato                  ');
           SQL.Add(', grupo                     ');
           SQL.Add(', cota                      ');
           SQL.Add(', nome                      ');
           SQL.Add(', endereco                  ');
           SQL.Add(', bairro                    ');
           SQL.Add(', cidade                    ');
           SQL.Add(', cep                       ');
           SQL.Add(', estado                    ');
           SQL.Add(', data_parc1                ');
           SQL.Add(', val_parc1                 ');
           SQL.Add(', data_parc2                ');
           SQL.Add(', val_parc2                 ');
           SQL.Add(', data_parc3                ');
           SQL.Add(', val_parc3                 ');
           SQL.Add(', data_parc4                ');
           SQL.Add(', val_parc4                 ');
           SQL.Add(', data_parc5                ');
           SQL.Add(', val_parc5                 ');
           SQL.Add(', data_parc6                ');
           SQL.Add(', val_parc6                 ');
           SQL.Add(', data_parc7                ');
           SQL.Add(', val_parc7                 ');
           SQL.Add(', data_parc8                ');
           SQL.Add(', val_parc8                 ');
           SQL.Add(', data_parc9                ');
           SQL.Add(', val_parc9                 ');
           SQL.Add(', data_parc10               ');
           SQL.Add(', val_parc10                ');
           SQL.Add(', data_parc11               ');
           SQL.Add(', val_parc11                ');
           SQL.Add(', data_parc12               ');
           SQL.Add(', val_parc12                ');
           SQL.Add(', data_parc13               ');
           SQL.Add(', val_parc13                ');
           SQL.Add(', data_parc14               ');
           SQL.Add(', val_parc14                ');
           SQL.Add(', data_parc15               ');
           SQL.Add(', val_parc15                ');
           SQL.Add(', data_parc16               ');
           SQL.Add(', val_parc16                ');
           SQL.Add(', tot_parcela              )');
           SQL.Add('VALUES (');
           SQL.Add(IntToStr(i + 1));
           SQL.Add(',' + QuotedStr(Importa^.cliente));
           SQL.Add(',' + QuotedStr(Importa^.contrato));
           SQL.Add(',' + QuotedStr(Importa^.grupo));
           SQL.Add(',' + QuotedStr(Importa^.cota));
           SQL.Add(',' + QuotedStr(Importa^.nome));
           SQL.Add(',' + QuotedStr(Importa^.endereco));
           SQL.Add(',' + QuotedStr(Importa^.bairro));
           SQL.Add(',' + QuotedStr(Importa^.cidade));
           //SQL.Add(',' + QuotedStr(Importa^.cep));
           SQL.Add(',' + QuotedStr(copy(Importa^.cep,1,5)+'-'+copy(Importa^.cep,6,3)));
           SQL.Add(',' + QuotedStr(Importa^.uf));
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data1))));
             SQL.Add(',' + StringReplace(Importa^.valor1, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data2))));
             SQL.Add(',' + StringReplace(Importa^.valor2, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data3))));
             SQL.Add(',' + StringReplace(Importa^.valor3, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data4))));
             SQL.Add(',' + StringReplace(Importa^.valor4, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data5))));
             SQL.Add(',' + StringReplace(Importa^.valor5, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data6))));
             SQL.Add(',' + StringReplace(Importa^.valor6, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data7))));
             SQL.Add(',' + StringReplace(Importa^.valor7, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data8))));
             SQL.Add(',' + StringReplace(Importa^.valor8, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data9))));
             SQL.Add(',' + StringReplace(Importa^.valor9, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data10))));
             SQL.Add(',' + StringReplace(Importa^.valor10, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data11))));
             SQL.Add(',' + StringReplace(Importa^.valor11, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data12))));
             SQL.Add(',' + StringReplace(Importa^.valor12, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data13))));
             SQL.Add(',' + StringReplace(Importa^.valor13, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data14))));
             SQL.Add(',' + StringReplace(Importa^.valor14, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data15))));
             SQL.Add(',' + StringReplace(Importa^.valor15, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           try
             SQL.Add(',' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Importa^.data16))));
             SQL.Add(',' + StringReplace(Importa^.valor16, ',', '.', [rfReplaceAll]));
           except
             SQL.Add(', NULL');
             SQL.Add(', 0.00');
           end;
           SQL.Add(',' + StringReplace(Importa^.valorTotal, ',', '.', [rfReplaceAll]));
           SQL.Add(')');
           try
             ExecSQL;
             Result := True;
           except
             on E : Exception do
             begin
                Application.MessageBox(Pchar('Erro ' + E.Message + ' ao gravar a importação...'), 'Atenção', MB_OK + MB_ICONINFORMATION);
                Result := False;
                Exit;
             end;
           end;
        end;
     end;
   finally
     QryImporta := nil;
     QryImporta.Free;
     ListImportacao := nil;
     ListImportacao.Free;
   end;
end;

function TF_Inter.BuscaNomeCliente(CodCli: Integer): string;
var
  QryCliente : TQuery;
begin
   QryCliente := TQuery.Create(Application);
   QryCliente.DatabaseName := DM.DBTD.DatabaseName;

   try
     with QryCliente do
     begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT cliente FROM clientes WHERE codigo = ' + IntToStr(CodCli));
        Open;

        Result := FieldByName('cliente').AsString;
     end;
   finally
     QryCliente := nil;
     QryCliente.Free;
   end;
end;

end.

// Texto.Add(Chr(39) + StrCurrPesq2(StrToCurr(tirartudo(Trim(Copy(RichEdit1.Lines.Strings[x], 293, 11)),Chr(39), '.', ''))) + Chr(39) + ')');
