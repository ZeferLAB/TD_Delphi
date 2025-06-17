unit RCertNot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_RCertNot = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    ComboBox3: TComboBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Exit(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RCertNot: TF_RCertNot;
  tpbx    : String;

implementation

uses DMTD, Menu, QkCpos, QkCpar, QkCNeg, FuncGeral, ProcGeral;

{$R *.DFM}

procedure TF_RCertNot.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TF_RCertNot.BitBtn2Click(Sender: TObject);
begin
  MaskEdit1.Clear;
  MaskEdit1.Text := DateToStr(date);
  MaskEdit1.SetFocus;
end;

procedure TF_RCertNot.BitBtn1Click(Sender: TObject);
var
  arq : String;
  ende, compl, linha, contrato : String;
  reg : Integer;
begin
  if (not ValidData(MaskEdit1.Text)) then
  begin
    ShowMessage('Data inválida !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  Dm.Join.Close;
  Dm.Join.Sql.Clear;
  Dm.Join.Sql.Add('SELECT a.a_nome, a.p_auxiliar, a.registro, a.certcertif, a.rlcertid, a.ncliente, a.arquivo,');
  Dm.Join.Sql.Add('a.contrato, a.parcelas, a.parc2, a.parc3, a.parc4, a.parc5, a.parc6,');
  Dm.Join.Sql.Add('a.data_not1, a.data_not2, a.data_not3,');
  Dm.Join.Sql.Add('a.sit_not1, a.sit_not2, a.sit_not3, a.cod_ir1, a.cod_ir2, a.cod_ir3, a.bxcorreio,');
  Dm.Join.Sql.Add('b.nome, b.endereco, b.numero, b.bairro, b.cidade, b.cep, b.complem, b.estado');
  Dm.Join.Sql.Add('FROM td a INNER JOIN td_pesso b');
  Dm.Join.Sql.Add('ON (a.p_auxiliar = b.p_auxiliar)');
  Dm.Join.Sql.Add('WHERE');
  Dm.Join.Sql.Add('    (a.data_not1  = ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  if (StrToInt(MaskEdit2.Text) > 0) AND (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.Join.Sql.Add('AND a.registro >= ' + Trim(MaskEdit2.Text));
    Dm.Join.Sql.Add('AND a.registro <= ' + Trim(MaskEdit3.Text));
  end;
  Dm.Join.Sql.Add('AND  a.sit_not1   = ' + Chr(39) + tpbx + Chr(39));
//Dm.Join.Sql.Add('AND  (a.natureza   = 197)');
  Dm.Join.Sql.Add('AND  (a.natureza   = 197 or a.natureza   = 300)');
  Dm.Join.Sql.Add('AND  b.endereco <> ""');
  Dm.Join.Sql.Add('AND  b.situacao   = "D")');
  Dm.Join.Sql.Add('OR  (a.data_not2 = ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  if (StrToInt(MaskEdit2.Text) > 0) AND (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.Join.Sql.Add('AND a.registro >= ' + Trim(MaskEdit2.Text));
    Dm.Join.Sql.Add('AND a.registro <= ' + Trim(MaskEdit3.Text));
  end;
  Dm.Join.Sql.Add('AND  a.sit_not2   = ' + Chr(39) + tpbx + Chr(39));
//Dm.Join.Sql.Add('AND  (a.natureza   = 197)');
  Dm.Join.Sql.Add('AND  (a.natureza   = 197 or a.natureza   = 300)');
  Dm.Join.Sql.Add('AND  b.endereco <> ""');
  Dm.Join.Sql.Add('AND  b.situacao = "D")');
  Dm.Join.Sql.Add('OR  (a.data_not3 = ' + Chr(39) + ConvData(MaskEdit1.Text)            + Chr(39));
  if (StrToInt(MaskEdit2.Text) > 0) AND (StrToInt(MaskEdit3.Text) > 0) then
  begin
    Dm.Join.Sql.Add('AND a.registro >= ' + Trim(MaskEdit2.Text));
    Dm.Join.Sql.Add('AND a.registro <= ' + Trim(MaskEdit3.Text));
  end;
  Dm.Join.Sql.Add('AND  a.sit_not3   = ' + Chr(39) + tpbx + Chr(39));
//Dm.Join.Sql.Add('AND  (a.natureza   = 197)');
  Dm.Join.Sql.Add('AND  (a.natureza   = 197 or a.natureza   = 300)');
  Dm.Join.Sql.Add('AND  b.endereco <> ""');
  Dm.Join.Sql.Add('AND  b.situacao = "D")');
  Dm.Join.Sql.Add('ORDER BY a.registro, b.recno');
  Dm.Join.Open;
  if (Dm.Join.RecordCount = 0) then
  begin
    Dm.Join.Close;
    ShowMessage('Movimento não encontrado !');
    Exit;
  end;
  arq := '';
  arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'CERTNOT';
  CriaTabela('CERTNOT', arq);
  Dm.ArqAux.Close;
  Dm.ArqAux.RequestLive := True;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Open;
  reg := 0;
  while (not Dm.Join.Eof) do
  begin
    if (reg <> Dm.Join.FieldByName('registro').asInteger) then
    begin
      ende  := '';
      compl := '';
      contrato := '';      
      ende  := Dm.Join.FieldByName('endereco').asString;
      if (Trim(Dm.Join.FieldByName('numero').asString) <> '') then
      begin
        ende := ende + ' Nº ' + Dm.Join.FieldByName('numero').asString;
      end;
      if (Trim(Dm.Join.FieldByName('complem').asString) <> '') then
      begin
        ende := ende + ' ' + Trim(Dm.Join.FieldByName('complem').asString);
      end;  
      if (Trim(Dm.Join.FieldByName('bairro').asString) <> '') then
      begin
        ende := Trim(ende) + ' ' + Dm.Join.FieldByName('bairro').asString;
      end;
      if (Trim(Dm.Join.FieldByName('cidade').asString) <> '') then
      begin
        compl := Trim(Dm.Join.FieldByName('cidade').asString) + ' - ' + Trim(Dm.Join.FieldByName('estado').asString); 
      end;
      contrato := Dm.Join.FieldByName('contrato').asString;
      if (Trim(contrato) = '') then contrato := Busca_Contrato(Dm.Join.FieldByName('registro').asString);
      Dm.ArqAux.Append;
      Dm.ArqAux.FieldByName('indexador').asInteger   := Dm.Join.FieldByName('registro').asInteger;
      Dm.ArqAux.FieldByName('anotacao').asString     := Dm.Join.FieldByName('certcertif').asString;
      Dm.ArqAux.FieldByName('p_auxiliar').asString   := Dm.Join.FieldByName('p_auxiliar').asString;
      Dm.ArqAux.FieldByName('empresa').asString      := Busca_NomePessoal(Dm.Join.FieldByName('p_auxiliar').asString, 'R');
      Dm.ArqAux.FieldByName('nome').asString         := Dm.Join.FieldByName('nome').asString;
      Dm.ArqAux.FieldByName('endereco').asString     := ende;
      Dm.ArqAux.FieldByName('bairro').asString       := compl;
      Dm.ArqAux.FieldByName('cep').asString          := FormataCep(Dm.Join.FieldByName('cep').asString);
     // Dm.ArqAux.FieldByName('rl').asString           := 'RZ ' + Trim(Dm.Join.FieldByName('rlcertid').asString) + ' BR';
//    Dm.ArqAux.FieldByName('rl').asString           := 'RC ' + Trim(Dm.Join.FieldByName('rlcertid').asString) + ' BR';
      Dm.ArqAux.FieldByName('rl').asString           := F_Menu.Label34.Caption + Trim(Dm.Join.FieldByName('rlcertid').asString) + ' BR';
      Dm.ArqAux.FieldByName('contrato').asString     := contrato;
      if (Trim(Dm.Join.FieldByName('parcelas').asString) <> '') AND
         (Trim(Dm.Join.FieldByName('parcelas').asString) <> '0') then
      begin
        if (Dm.Join.FieldByName('ncliente').asInteger = 6) then
        begin
          if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
          begin
            Dm.ArqAux.FieldByName('parcela1').asString := Copy(Dm.Join.FieldByName('parcelas').asString, 1,3) + '/' + Copy(Dm.Join.FieldByName('parcelas').asString, 4,3);
          end
          else Dm.ArqAux.FieldByName('parcela1').asString := Dm.Join.FieldByName('parcelas').asString;
        end
        else Dm.ArqAux.FieldByName('parcela1').asString := Dm.Join.FieldByName('parcelas').asString;
      end;
      if (Trim(Dm.Join.FieldByName('parc2').asString) <> '') AND
         (Trim(Dm.Join.FieldByName('parc2').asString) <> '0') then
      begin
        if (Dm.Join.FieldByName('ncliente').asInteger = 6) then
        begin
          if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
          begin
            Dm.ArqAux.FieldByName('parcela2').asString := Copy(Dm.Join.FieldByName('parc2').asString, 1,3) + '/' + Copy(Dm.Join.FieldByName('parc2').asString, 4,3);
          end
          else Dm.ArqAux.FieldByName('parcela2').asString := Dm.Join.FieldByName('parc2').asString;
        end
        else Dm.ArqAux.FieldByName('parcela2').asString     := Dm.Join.FieldByName('parc2').asString;
      end;
      if (Trim(Dm.Join.FieldByName('parc3').asString) <> '') AND
         (Trim(Dm.Join.FieldByName('parc3').asString) <> '0') then
      begin
        if (Dm.Join.FieldByName('ncliente').asInteger = 6) then
        begin
          if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
          begin
            Dm.ArqAux.FieldByName('parcela3').asString := Copy(Dm.Join.FieldByName('parc3').asString, 1,3) + '/' + Copy(Dm.Join.FieldByName('parc3').asString, 4,3);
          end
          else Dm.ArqAux.FieldByName('parcela3').asString := Dm.Join.FieldByName('parc3').asString;
        end
        else Dm.ArqAux.FieldByName('parcela3').asString     := Dm.Join.FieldByName('parc3').asString;
      end;
      if (Trim(Dm.Join.FieldByName('parc4').asString) <> '') AND
         (Trim(Dm.Join.FieldByName('parc4').asString) <> '0') then
      begin
        if (Dm.Join.FieldByName('ncliente').asInteger = 6) then
        begin
          if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
          begin
            Dm.ArqAux.FieldByName('parcela4').asString := Copy(Dm.Join.FieldByName('parc4').asString, 1,3) + '/' + Copy(Dm.Join.FieldByName('parc4').asString, 4,3);
          end
          else Dm.ArqAux.FieldByName('parcela4').asString := Dm.Join.FieldByName('parc4').asString;
        end
        else Dm.ArqAux.FieldByName('parcela4').asString     := Dm.Join.FieldByName('parc4').asString;
      end;
      if (Trim(Dm.Join.FieldByName('parc5').asString) <> '') AND
         (Trim(Dm.Join.FieldByName('parc5').asString) <> '0') then
      begin
        if (Dm.Join.FieldByName('ncliente').asInteger = 6) then
        begin
          if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
          begin
            Dm.ArqAux.FieldByName('parcela5').asString := Copy(Dm.Join.FieldByName('parc5').asString, 1,3) + '/' + Copy(Dm.Join.FieldByName('parc5').asString, 4,3);
          end
          else Dm.ArqAux.FieldByName('parcela5').asString := Dm.Join.FieldByName('parc5').asString;
        end
        else Dm.ArqAux.FieldByName('parcela5').asString     := Dm.Join.FieldByName('parc5').asString;
      end;
      if (Trim(Dm.Join.FieldByName('parc6').asString) <> '') AND
         (Trim(Dm.Join.FieldByName('parc6').asString) <> '0') then
      begin
        if (Dm.Join.FieldByName('ncliente').asInteger = 6) then
        begin
          if (Trim(Dm.Join.FieldByName('arquivo').asString) <> '') then
          begin
            Dm.ArqAux.FieldByName('parcela6').asString := Copy(Dm.Join.FieldByName('parc6').asString, 1,3) + '/' + Copy(Dm.Join.FieldByName('parc6').asString, 4,3);
          end
          else Dm.ArqAux.FieldByName('parcela6').asString := Dm.Join.FieldByName('parc6').asString;
        end
        else Dm.ArqAux.FieldByName('parcela6').asString     := Dm.Join.FieldByName('parc6').asString;
      end;
      if (Dm.Join.FieldByName('data_not3').asDateTime = StrToDate(MaskEdit1.Text)) then
      begin
        if (Dm.Join.FieldByName('sit_not3').asString = 'P') then
        begin
          Dm.ArqAux.FieldbyName('ocorrencia').asString := 'POSITIVA';
        end
        else
        begin
          if (Dm.Join.FieldByName('sit_not3').asString = 'L') then
          begin
            Dm.ArqAux.FieldbyName('ocorrencia').asString := 'NÃO HOUVE RETORNO DO AR ATÉ A PRESENTA DATA';
          end
          else
          begin
            if (Dm.Join.FieldByName('sit_not3').asString = 'N') then
            begin
             //if (Dm.Join.FieldByName('bxcorreio').asString = '') then
               Dm.ArqAux.FieldByName('ocorrencia').asString := Ver_Ocorrencia(Dm.Join.FieldByName('cod_ir3').asString)
            // else
            //   Dm.ArqAux.FieldByName('ocorrencia').asString := Ver_Ocorrencia2(Dm.Join.FieldByName('cod_ir3').asString);
            end;
          end;
        end;
      end
      else
      begin
        if (Dm.Join.FieldByName('data_not2').asDateTime = StrToDate(MaskEdit1.Text)) then
        begin
          if (Dm.Join.FieldByName('sit_not2').asString = 'P') then
          begin
            Dm.ArqAux.FieldbyName('ocorrencia').asString := 'POSITIVA';
          end
          else
          begin
            if (Dm.Join.FieldByName('sit_not2').asString = 'L') then
            begin
              Dm.ArqAux.FieldbyName('ocorrencia').asString := 'NÃO HOUVE RETORNO DO AR ATÉ A PRESENTA DATA';
            end
            else
            begin
              if (Dm.Join.FieldByName('sit_not2').asString = 'N') then
              begin
               //if (Dm.Join.FieldByName('bxcorreio').asString = '') then
                Dm.ArqAux.FieldByName('ocorrencia').asString := Ver_Ocorrencia(Dm.Join.FieldByName('cod_ir2').asString);
               //  else
               // Dm.ArqAux.FieldByName('ocorrencia').asString := Ver_Ocorrencia2(Dm.Join.FieldByName('cod_ir2').asString);
              end;
            end;
          end;
        end
        else
        begin
          if (Dm.Join.FieldByName('data_not1').asDateTime = StrToDate(MaskEdit1.Text)) then
          begin
            if (Dm.Join.FieldByName('sit_not1').asString = 'P') then
            begin
              Dm.ArqAux.FieldbyName('ocorrencia').asString := 'POSITIVA';
            end
            else
            begin
              if (Dm.Join.FieldByName('sit_not1').asString = 'L') then
              begin
                Dm.ArqAux.FieldbyName('ocorrencia').asString := 'NÃO HOUVE RETORNO DO AR ATÉ A PRESENTA DATA';
              end
              else
              begin
                if (Dm.Join.FieldByName('sit_not1').asString = 'N') then
                begin
                 //if (Dm.Join.FieldByName('bxcorreio').asString = '') then
                  Dm.ArqAux.FieldByName('ocorrencia').asString := Ver_Ocorrencia(Dm.Join.FieldByName('cod_ir1').asString);
                 //else
                 // Dm.ArqAux.FieldByName('ocorrencia').asString := Ver_Ocorrencia2(Dm.Join.FieldByName('cod_ir1').asString);
                end;
              end;
            end;
          end;
        end;
      end;
      Dm.ArqAux.Post;
    end;
    reg := Dm.Join.FieldByName('registro').asInteger;  
    Dm.Join.Next;
  end;
  Dm.Join.Close;
  Dm.ArqAux.Close;
  Dm.ArqAux.RequestLive := False;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM ' + arq);
  Dm.ArqAux.Sql.Add('ORDER BY indexador');
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    ShowMessage('Movimento não encontrado !');
    MaskEdit1.SetFocus;
    Exit;
  end;
  QrDestroi;
  if (TpBx = 'P') then
  begin
    Application.CreateForm(TQk_CPos, Qk_CPos);
    Qk_CPos.QrLabel1.Caption  := F_Menu.Label29.Caption;
    Qk_CPos.QrLabel30.Caption := F_Menu.Label11.Caption;
    Qk_CPos.QrLabel2.Caption  := F_Menu.Label5.Caption;
    Qk_CPos.QrLabel3.Caption  := F_Menu.Label13.Caption;
    Qk_Cpos.QrLabel26.Caption := DataExtenso(MaskEdit1.Text, True, '');

   {if ComboBox1.text = uppercase('Valdomiro Montes Junior') then
    Qk_CPos.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\assinatura1.jpg')
   else if ComboBox1.text = uppercase('Vivian Montes') then
    Qk_CPos.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\assinatura2.jpg')
   else if ComboBox1.text = uppercase('Dirceu Alves de Oliveira') then
    Qk_CPos.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\assinatura3.jpg')
   else
    Qk_CPos.QrImage1.Picture.LoadFromFile(''); }



    if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
     Qk_CPos.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
    else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
     Qk_CPos.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
    else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
     Qk_CPos.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
    else
     Qk_CPos.QrImage1.Picture.LoadFromFile('');

    Qk_Cpos.QrLabel28.Caption := ComboBox1.Text;
    Qk_Cpos.QrLabel29.Caption := ComboBox3.Text;
    Qk_CPos.QuickRep1.Preview;
    Qk_CPos.Destroy;
    Qk_Cpos := NIL;
  end;
  if (TpBx = 'N') then
  begin
    Application.CreateForm(TQk_Cneg, Qk_Cneg);
    Qk_Cneg.QrLabel1.Caption  := F_Menu.Label29.Caption;
    Qk_CNeg.QrLabel13.Caption := F_Menu.Label11.Caption;
    Qk_Cneg.QrLabel2.Caption  := F_Menu.Label5.Caption;
    Qk_Cneg.QrLabel3.Caption  := F_Menu.Label13.Caption;
    Qk_Cneg.QrLabel26.Caption := DataExtenso(MaskEdit1.Text, True, '');

  { if ComboBox1.text = uppercase('Valdomiro Montes Junior') then
    Qk_CNeg.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\assinatura1.jpg')
   else if ComboBox1.text = uppercase('Vivian Montes') then
    Qk_CNeg.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\assinatura2.jpg')
   else if ComboBox1.text = uppercase('Dirceu Alves de Oliveira') then
    Qk_CNeg.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\assinatura3.jpg')
   else
    Qk_CNeg.QrImage1.Picture.LoadFromFile(''); }

  if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
   Qk_CNeg.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
  else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
   Qk_CNeg.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
  else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
   Qk_CNeg.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
  else
   Qk_CNeg.QrImage1.Picture.LoadFromFile('');



    Qk_Cneg.QrLabel28.Caption := ComboBox1.Text;
    Qk_Cneg.QrLabel29.Caption := ComboBox3.Text;
    Qk_Cneg.QuickRep1.Preview;
    Qk_Cneg.Destroy;
    Qk_Cneg := NIL;
  end;
  if (TpBx = 'L') then
  begin
    Application.CreateForm(TQk_CPar, Qk_CPar);
    Qk_CPar.QrLabel1.Caption  := F_Menu.Label29.Caption;
    Qk_CPar.QrLabel30.Caption := F_Menu.Label11.Caption;    
    Qk_CPar.QrLabel2.Caption  := F_Menu.Label5.Caption;
    Qk_CPar.QrLabel3.Caption  := F_Menu.Label13.Caption;
    Qk_Cpar.QrLabel26.Caption := DataExtenso(MaskEdit1.Text, True, '');

  { if ComboBox1.text = uppercase('Valdomiro Montes Junior') then
    Qk_CPar.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\assinatura1.jpg')
   else if ComboBox1.text = uppercase('Vivian Montes') then
    Qk_CPar.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\assinatura2.jpg')
   else if ComboBox1.text = uppercase('Dirceu Alves de Oliveira') then
    Qk_CPar.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\assinatura3.jpg')
   else
    Qk_CPar.QrImage1.Picture.LoadFromFile('');}


  if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'VALDOMIRO MONTES JUNIOR' then
   Qk_CPar.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_VALDOMIRO_MONTES_JUNIOR.jpg')
  else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'DOURIVAL DE OLIVEIRA SILVA' then
   Qk_CPar.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_DORIVAL_DE_OLIVEIRA_SILVA.jpg')
  else if ComboBox1.Items.Strings[ComboBox1.ItemIndex] = 'SILVIA MARKEVICIUS' then
   Qk_CPar.QrImage1.Picture.LoadFromFile(F_Menu.Label8.Caption + '\ass_cart\ass_SILVIA_MARKEVICIUS.jpg')
  else
   Qk_CPar.QrImage1.Picture.LoadFromFile('');


    Qk_Cpar.QrLabel28.Caption := ComboBox1.Text;
    Qk_Cpar.QrLabel29.Caption := ComboBox3.Text;
    Qk_CPar.QuickRep1.Preview;
    Qk_CPar.Destroy;
    Qk_Cpar := NIL;
  end;
  Dm.ArqAux.Close;
  DestroeTabela(arq);
end;

procedure TF_RCertNot.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_RCertNot.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox3.SetFocus;
end;

procedure TF_RCertNot.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox1.SetFocus;
end;

procedure TF_RCertNot.ComboBox2Exit(Sender: TObject);
begin
  TpBx := 'P';
  TpBx := Copy(ComboBox2.Text, 1,1);  
end;

procedure TF_RCertNot.ComboBox2Enter(Sender: TObject);
begin
  SendMessage(ComboBox2.handle, CB_SHOWDROPDOWN, Integer(True), 0);
end;

procedure TF_RCertNot.FormActivate(Sender: TObject);
begin
  MaskEdit1.Text := DateToStr(date);
end;

procedure TF_RCertNot.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then ComboBox2.SetFocus;
end;

procedure TF_RCertNot.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_RCertNot.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_RCertNot.ComboBox1Change(Sender: TObject);
begin
  ComboBox3.Text:= RetornaCargo(ComboBox1.ItemIndex);
end;

end.
