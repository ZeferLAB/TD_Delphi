unit DMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDM_IMG = class(TDataModule)
    IMAGEM: TDatabase;
    TQ_LOG_CER: TQuery;
    TQ_DIG_USU: TQuery;
    TQ_CX_CER: TQuery;
    TQ_SEQ_C: TQuery;
    TQ_ORDEM: TQuery;
    TQ_REG_CAB: TQuery;
    TQ_REG_ATO: TQuery;
    TQ_CERTIDAO: TQuery;
    TQ_MAT_MOD: TQuery;
    DS_Mat_MOD: TDataSource;
    TQ_LOG_DIG: TQuery;
    DS_SEQ_C: TDataSource;
    DS_DIG_USU: TDataSource;
    TQ_FERIADOS: TQuery;
    TQ_CAIXA: TQuery;
    TQ_USUARIOS: TQuery;
    Query1: TQuery;
    TQ_CONFIG_IMG: TQuery;
    TQ_DIG_ASS: TQuery;
    DS_DIG_ASS: TDataSource;
    ArqAux: TQuery;
    qryCertificados: TQuery;
    dsCertificados: TDataSource;
    qryAuxCertificados: TQuery;
    qryAuxCgiArisp: TQuery;
    qryGenerico: TQuery;
    qryGenerico_Auxiliar: TQuery;
    qryGenerico_Auxiliar_1: TQuery;
    Qry_CadImp: TQuery;
    configpt: TQuery;
  private
    { Private declarations }
  public
    Function RemovePonto(vStr:AnsiString):String;
    procedure ValidaVersaoBancoEExecutavel(sVersaoDB: String);
    { Public declarations }
  end;

var
  DM_IMG: TDM_IMG;
  caminho_imgselo: String;
  TrabalhaComQRCode: Boolean;

const
  VersaoDoExecutavel = '1.0.6.8';
  VersaoExecutavelComBanco = '1.0.0.0'; // Informa que este executável so roda com o banco desta versão
  VersaoBateRegister = '04/02/2019 - Online';


implementation

{$R *.DFM}

{ TDM_IMG }

function TDM_IMG.RemovePonto(vStr: AnsiString): String;
begin
 Result:=vStr;
  While Pos('.',Result)>0 Do
    Delete(REsult,Pos('.',Result),1);
  While Pos(',',Result)>0 Do
    Delete(REsult,Pos(',',Result),1);
  While Pos('-',Result)>0 Do
    Delete(REsult,Pos('-',Result),1);
  While Pos('/',Result)>0 Do
    Delete(REsult,Pos('/',Result),1);
end;

procedure TDM_IMG.ValidaVersaoBancoEExecutavel(sVersaoDB: String);
begin
  {Indica com qual banco este executável pode trabalhar
   lembrando que este controle faz referencia apenas ao banco}

  IF ((RemovePonto(sVersaoDB)) < (RemovePonto(VersaoExecutavelComBanco))) or (sVersaoDB = '') Then
  Begin
    Application.MessageBox(PChar('Este executável não é compatível com o banco de dados atual: '+Copy(sVersaoDB,1,1) + '.' + Copy(sVersaoDB,2,1) + '.' + Copy(sVersaoDB,3,1) + '.' + Copy(sVersaoDB,4,1)+', '+
                                 'por favor, verifique o gerenciador de versões e execute os respectivos updates!'), 'Certidão',MB_OK+MB_ICONEXCLAMATION);
    Application.Terminate;
  End;

end;

end.
