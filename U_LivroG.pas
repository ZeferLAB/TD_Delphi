unit U_LivroG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExportPack, StdCtrls, Buttons, Mask, ExtCtrls, dSignPDFInt_TLB;

type
  TF_LivroG = class(TForm)
    Bevel2: TBevel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    chkAssinatura: TCheckBox;
    EXQR: TExportQR;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_LivroG: TF_LivroG;

implementation

uses DMTD, menu, FuncGeral, ProcGeral, UQk_LivroG;

{$R *.DFM}

procedure TF_LivroG.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_LivroG.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If key = 13 then BitBtn1.SetFocus;
end;

procedure TF_LivroG.BitBtn1Click(Sender: TObject);
var
  sign        : SisSign;
  certif      : Certificados;
  erros       : WideString;
  nome_arquivo, dir: String;

begin
  if not ValidData(MaskEdit1.Text) then
  begin
    Application.MessageBox('Data Inicial Invalida!', 'Mensagem do Sistema', mb_ok);
    MaskEdit1.SetFocus;
    exit;
  end;
  if not ValidData(MaskEdit2.Text) then
  begin
    Application.MessageBox('Data Inicial Invalida!', 'Mensagem do Sistema', mb_ok);
    MaskEdit2.SetFocus;
    exit;
  end;

  dm.ArqAux.close;
  dm.ArqAux.sql.Clear;
  dm.ArqAux.sql.add(' select a.data_p, a.protocolo, a.p_auxiliar, a.registro, a.contato, b.nome, b.tip_doc1, b.doc1, c.descricao');
  dm.ArqAux.sql.add(' from td a inner join td_pesso b  on(a.p_auxiliar = b.p_auxiliar and a.contato = b.nome)');
  dm.ArqAux.sql.add('  inner join cad_sit c on(b.situacao = c.codigo)');
  dm.ArqAux.sql.add(' WHERE  a.lvf = "X" AND a.data_p between ' + QuotedStr(ConvData(MaskEdit1.Text)) + ' AND ' + QuotedStr(ConvData(MaskEdit2.Text)));
  dm.ArqAux.sql.add(' GROUP BY a.p_auxiliar ');
  dm.ArqAux.sql.add(' ORDER BY a.registro, b.nome');
  dm.ArqAux.Open;
  if dm.ArqAux.RecordCount <> 0 then
  begin
    Application.CreateForm(TFQk_LivroG, FQk_LivroG);
    FQk_LivroG.Label4.Caption     := 'COM MOV';
    FQk_LivroG.Label5.Caption     := MaskEdit1.Text;
    FQk_LivroG.QrLabel18.Caption  := DataExtenso(MaskEdit1.Text, False, '') + ' a ' + DataExtenso(MaskEdit2.Text, False, '');

   {if chkAssinatura.Checked then  //Na unit ExportPack comentar as linhas que fizer referencia a: //Prg   : TFPrgrs; pois da erro ao destruir da memoria
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
      nome_arquivo := 'LIVRO_PROT_' + FormatDateTime('dd-mm-yyyy', StrToDate(MaskEdit1.Text)) + '_' + MaskEdit3.Text;
      dir := F_Menu.Label51.Caption+'PDF_ASSINADO_DIGITAL\REG\'+MaskEdit3.Text+'\';
      if not DirectoryExists(dir) then
        ForceDirectories(dir);

      F_QkRpoOFA5.QRAssinadoDigitalmente.Enabled := true;
      F_QkRpoOFA5.QuickRep1.Prepare;
      EXQR.Report := F_QkRpoOFA5.QuickRep1;
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
    end;}

    FQk_LivroG.QuickRep1.Preview;
    FQk_LivroG.Destroy;
    FQk_LivroG := NIL;
  End
  Else
  Begin
    ShowMessage('Movimento não encontrado.');
  End;
end;

procedure TF_LivroG.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.
