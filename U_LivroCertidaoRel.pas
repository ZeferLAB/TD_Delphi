unit U_LivroCertidaoRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Db, DBTables, StdCtrls, Buttons, Mask, ExportPack, dSignPDFInt_TLB, FileCtrl,
  ExtCtrls;

type
  TF_LivroCertidaoRel = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit3: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Ds_RelAtosGrafigo: TDataSource;
    Certidao: TQuery;
    StatusBar1: TStatusBar;
    chkAssinarDigitalmente: TCheckBox;
    EXQR: TExportQR;
    Rad_ModImp: TRadioGroup;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    Label5: TLabel;
    MaskEdit4: TMaskEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function ConvData2(data, formato : String) : String;
    Function StrZero2( ValorInteiro, Tamanho : Integer) : String;
  end;

var
  F_LivroCertidaoRel: TF_LivroCertidaoRel;

implementation

uses DMTD, U_F_RetratoLivroDeCertidaoPreviewNew, Menu,
  U_LivroDeCertidaoPreviewNew;

{$R *.DFM}
Function TF_LivroCertidaoRel.ConvData2(data, formato : String) : String;
begin
  Result := '';
  try
    if (UpperCase(formato) = 'ANO') then
      Result := FormatDateTime('yyyy-mm-dd', StrToDate(data));
  except
     // showmessage('Os Parametros data = '+data+' e formato = '+formato+ ' ao passar pelo metodo Function ConvData ' );
  end;
end;

Function TF_LivroCertidaoRel.StrZero2( ValorInteiro, Tamanho : Integer) : String;
begin
  if tamanho > 20 then ShowMessage('Tamanho máximo de 20 caracteres');
  result := '00000000000000000000' + IntToStr(ValorInteiro);
  result := Copy(result, length(result) - (tamanho - 1), tamanho);
end;

procedure TF_LivroCertidaoRel.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_LivroCertidaoRel.BitBtn1Click(Sender: TObject);
var
  sign: SisSign;
  certif: Certificados;
  nome_arquivo, dir, erros: String;
begin
  if Rad_ModImp.ItemIndex = 1 then //Paisagem
  begin
    Certidao.Close;
    Certidao.RequestLive := False;
    Certidao.Sql.Clear;
    Certidao.Sql.Add('SELECT movimento, nr_protoc as protocolo, apresentan as contribuinte, ext_nat as atribuicao, ');
    Certidao.Sql.Add('status, stat_data, CONCAT(daje, serie_daje) as numero_daje, selo as numero_selo');
    Certidao.Sql.Add('FROM certidao');
    Certidao.Sql.Add('WHERE');
    Certidao.Sql.Add('    movimento >= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit1.Text))));
    Certidao.SQL.Add('and movimento <= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit3.Text))));
    Certidao.Sql.Add('ORDER BY movimento, nr_protoc');
    Certidao.Open;
    //if (Certidao.RecordCount = 0) then
    //begin
      //Certidao.Close;
      //ShowMessage('Movimento não encontrado.');
      //Exit;
    //end;

    if (Not(Dm.Configur.Active)) then
      Dm.Configur.Open;
    Application.CreateForm(TF_LivroDeCertidaoPreviewNew, F_LivroDeCertidaoPreviewNew);
    F_LivroDeCertidaoPreviewNew.QrLabel1.Caption  := F_Menu.Label13.Caption; // + ' de ' + F_Menu.Label14.Caption + '-' + F_Menu.Label23.Caption;
    F_LivroDeCertidaoPreviewNew.QrLabel4.Caption  := F_Menu.Label20.Caption;
    F_LivroDeCertidaoPreviewNew.QrLabel5.Caption  := F_Menu.Label21.Caption;
    F_LivroDeCertidaoPreviewNew.QrLabel32.Caption := MaskEdit1.Text + ' a ' + MaskEdit3.Text;

    IF ((F_menu.LbCnpj.Caption = '27.072.837/0001-00') OR (F_menu.LbCnpj.Caption = '27072837000100')) THEN
      F_LivroDeCertidaoPreviewNew.QRLabel2.caption:= F_LivroDeCertidaoPreviewNew.QRLabel2.caption+ ' - IBIRAPUA - BA';

    IF ((F_menu.LbCnpj.Caption = '28.666.922/0001-51') OR (F_menu.LbCnpj.Caption = '28666922000151')) THEN
      F_LivroDeCertidaoPreviewNew.QRLabel2.caption:= F_LivroDeCertidaoPreviewNew.QRLabel2.caption+ ' - MEDEIROS NETO - BA';

    if chkAssinarDigitalmente.Checked then
    begin
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
      end;
      nome_arquivo := '';
      nome_arquivo := 'LIVRO_PROT_' + FormatDateTime('dd-mm-yyyy', StrToDate(MaskEdit1.Text)) + '_';  // + MaskEdit3.Text;
      dir := F_Menu.Label51.Caption+'PDF_ASSINADO_DIGITAL\REG\';  //+MaskEdit3.Text+'\';
      if not DirectoryExists(dir) then
        ForceDirectories(dir);

//      F_LivroDeCertidaoPreviewNew.QRAssinatura.Enabled := true;
      F_LivroDeCertidaoPreviewNew.QuickRep2.Prepare;
      EXQR.Report := F_LivroDeCertidaoPreviewNew.QuickRep2;
      EXQR.ExportQRPDF(dir + nome_arquivo, True, False);
      sign := CoSisSign.Create;
      sign.ArquivoEntrada  := dir + nome_arquivo + '.pdf';
      sign.ArquivoSaida    := dir + nome_arquivo + '.pdf.p7s';
      sign.LocalAssinatura := enmLocalAssinatura_enmInterno;
      sign.TipoAssinatura  := enmTipoAssinatura_enmBinario;
      sign.Certificado     := certif.Certificado;
      if sign.SignFile then
        Application.MessageBox(Pchar('Arquivo assinado corretamente e gerado no diretorio: '+dir + nome_arquivo+'.pdf.p7s'), 'Protocolo Oficial - Eletrônico', MB_IconInformation)
      else
        Application.MessageBox(Pchar(erros), 'Protocolo Oficial - Eletrônico', MB_IconInformation);
      sign := nil;
    end;
    F_LivroDeCertidaoPreviewNew.QuickRep2.preview;
    F_LivroDeCertidaoPreviewNew:= Nil;
  end
  else
  begin
    Certidao.Close;
    Certidao.RequestLive := False;
    Certidao.Sql.Clear;
    Certidao.Sql.Add('SELECT movimento, nr_protoc as protocolo, apresentan as contribuinte, ext_nat as atribuicao, ');
    Certidao.Sql.Add('status, stat_data, CONCAT(daje, serie_daje) as numero_daje, selo as numero_selo');
    Certidao.Sql.Add('FROM certidao');
    Certidao.Sql.Add('WHERE');
    Certidao.Sql.Add('    movimento >= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit1.Text))));
    Certidao.SQL.Add('and movimento <= ' + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(MaskEdit3.Text))));
    Certidao.Sql.Add('ORDER BY movimento, nr_protoc');
    Certidao.Open;
    //if (Certidao.RecordCount = 0) then
    //begin
      //Certidao.Close;
      //ShowMessage('Movimento não encontrado.');
      //Exit;
    //end;

    if (Not(Dm.Configur.Active)) then
      Dm.Configur.Open;
    Application.CreateForm(TF_RetratoLivroDeCertidaoPreviewNew2,F_RetratoLivroDeCertidaoPreviewNew2);
    F_RetratoLivroDeCertidaoPreviewNew2.QrLabel1.Caption := F_menu.Label29.Caption;  //F_Menu.Label13.Caption; // + ' de ' + F_Menu.Label14.Caption + '-' + F_Menu.Label23.Caption;
    F_RetratoLivroDeCertidaoPreviewNew2.QrLabel4.Caption := F_Menu.LbNomeTitular.Caption;
    F_RetratoLivroDeCertidaoPreviewNew2.QrLabel5.Caption := F_Menu.Label13.Caption;
    F_RetratoLivroDeCertidaoPreviewNew2.QRLabel7.Caption := F_RetratoLivroDeCertidaoPreviewNew2.QRLabel7.Caption  + MaskEdit1.Text + ' a ' + MaskEdit3.Text;
    F_RetratoLivroDeCertidaoPreviewNew2.QRLabel2.Caption := '  LIVRO DE CERTIDÃO - ' + MaskEdit2.Text;

    IF ((F_menu.LbCnpj.Caption = '27.072.837/0001-00') OR (F_menu.LbCnpj.Caption = '27072837000100')) THEN
      F_RetratoLivroDeCertidaoPreviewNew2.QrLabel5.Caption:= F_RetratoLivroDeCertidaoPreviewNew2.QrLabel5.Caption+ ' - IBIRAPUA - BA';

    IF ((F_menu.LbCnpj.Caption = '28.666.922/0001-51') OR (F_menu.LbCnpj.Caption = '28666922000151')) THEN
      F_RetratoLivroDeCertidaoPreviewNew2.QrLabel5.Caption:= F_RetratoLivroDeCertidaoPreviewNew2.QrLabel5.Caption+ ' - MEDEIROS NETO - BA';

    if chkAssinarDigitalmente.Checked then
    begin
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
      end;
      nome_arquivo := '';
      nome_arquivo := 'LIVRO_PROT_' + FormatDateTime('dd-mm-yyyy', StrToDate(MaskEdit1.Text)) + '_';  // + MaskEdit3.Text;
      dir := F_Menu.Label51.Caption+'PDF_ASSINADO_DIGITAL\REG\';  //+MaskEdit3.Text+'\';
      if not DirectoryExists(dir) then
        ForceDirectories(dir);

      F_RetratoLivroDeCertidaoPreviewNew2.QRLblAssinado.Enabled := true;
      F_RetratoLivroDeCertidaoPreviewNew2.QuickRep1.Prepare;
      EXQR.Report := F_RetratoLivroDeCertidaoPreviewNew2.QuickRep1;
      EXQR.ExportQRPDF(dir + nome_arquivo, True, False);
      sign := CoSisSign.Create;
      sign.ArquivoEntrada  := dir + nome_arquivo + '.pdf';
      sign.ArquivoSaida    := dir + nome_arquivo + '.pdf.p7s';
      sign.LocalAssinatura := enmLocalAssinatura_enmInterno;
      sign.TipoAssinatura  := enmTipoAssinatura_enmBinario;
      sign.Certificado     := certif.Certificado;
      if sign.SignFile then
        Application.MessageBox(Pchar('Arquivo assinado corretamente e gerado no diretorio: '+dir + nome_arquivo+'.pdf.p7s'), 'Protocolo Oficial - Eletrônico', MB_IconInformation)
      else
        Application.MessageBox(Pchar(erros), 'Protocolo Oficial - Eletrônico', MB_IconInformation);
      sign := nil;
    end;
     F_RetratoLivroDeCertidaoPreviewNew2.QuickRep1.preview;
     F_RetratoLivroDeCertidaoPreviewNew2:= Nil;
    end;
end;

procedure TF_LivroCertidaoRel.MaskEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then MaskEdit3.SetFocus;
end;

procedure TF_LivroCertidaoRel.MaskEdit3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_LivroCertidaoRel.FormShow(Sender: TObject);
begin
  {DM.assina.Close;
  DM.assina.Open;
  DM.assina.First;
  cbAssinatura.Clear;
  while not DM.assina.Eof do
  begin
    cbAssinatura.Items.Add(DM.assina.fieldbyname('nome').asString);
    DM.assina.Next;
  end;}
end;

end.
