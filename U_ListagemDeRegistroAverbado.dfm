�
 TF_LISTAGEMDEREGISTROAVERBADO 03  TPF0TF_ListagemDeRegistroAverbadoF_ListagemDeRegistroAverbadoLeft�TopNWidth�Height� CaptionListagem de Registros AverbadosColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoDesktopCenterPixelsPerInch`
TextHeight TLabelLabel5LeftTopXWidthPHeightCaptionData de  Inicial:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TLabelLabel2Left� TopXWidth6HeightCaptionData Final:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TLabelLabel1LeftTop8WidthQHeightCaptionN� do Registro:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  	TMaskEdit	MaskEdit3LeftlTopTWidthYHeightEditMask!99/99/9999;1;_	MaxLength
TabOrderText
  /  /    	OnKeyDownMaskEdit3KeyDown  	TMaskEdit	MaskEdit4LeftTopTWidthYHeightEditMask!99/99/9999;1;_	MaxLength
TabOrderText
  /  /    	OnKeyDownMaskEdit4KeyDown  TRadioButtonRd_DataRecepcaoLeftTopWidthrHeightCaptionData de Recep��oFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder  TRadioButtonRd_DataBaixaLeft� TopWidthgHeightCaptionData de BaixaChecked	Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrderTabStop	  TBitBtnBitBtn1Left� TopqWidthaHeightCaption	&ImprimirFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrderOnClickBitBtn1Click
Glyph.Data
:  6  BM6      6   (                                  � �� �� �� �� �� ����� �� �� ����������� �� �� �� �� �� �� ���������і��;9:TRS��������Ղ��� �� �� �� ���������������՞��DCE545gfg������� ������������������ɟ�����������dcc<;= " !trs� ���������彻����������������������������kjj���� ������������������������������ĭ��������������� ���������������������ϡ����������������Ŷ������ �� ���������������Ƶ���ѧ�ļŧ����������������� �� �� ������������������������������̴������ �� �� �� �� ���������˝����������������Ư��� �� �� �� �� �� �� ��������ɽ�ǽ��������̕��� �� �� �� �� �� �� �� �Ο�����Ͻ�į������� �� �� �� �� �� �� �� �� �� �Ο�����̼�°������� �� �� �� �� �� �� �� �� �� �Ο�����̼�°������� �� �� �� �� �� �� �� �� �Ο��������ν�Ʊ������� �� �� �� �� �� �� �� �� �Ο�Ο�Ο�Ο���� �� �� �� �� �� �� �  TBitBtnBitBtn3LeftTopqWidthaHeightCaption&SairFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrderOnClickBitBtn3Click
Glyph.Data
:  6  BM6      6   (                                  � �� �� �� �� �� �� ��ffi34� �� �� �� �� �� �� �� �� �� �� ��ff�ff�ff�hhi34� �� �� �� �� �� �� �� �� ��ff�ff�jk�jk�hi�hii34�ff�ff�ff�ff�ff�ff� �� �� ��ff�st�pq�op�mn�jmi34��������������ƚff� �� �� ��ff�wx�uv�tu�rs�nqi349�e%�c)�c�[��ƚff� �� �� ��ff�}~�z{�yz�wx�rui34B�h0�g3�g$�`��ƚff� �� �� ��ffꂃ���}~态�tvi34=�d)�c/�d �^��ƚff� �� �� ��ff���遂얗���؈�i34��k܉]ՀF�s��ƚff� �� �� ��ff�������ڈ�i34��������������ƚff� �� �� ��ff��������i34��������������ƚff� �� �� ��ff���������������i34��������������ƚff� �� �� ��ff������������㈉i34��������������ƚff� �� �� ��ff������������猍i34��������������ƚff� �� �� ��ff�ff鎏������돐i34��������������ƚff� �� �� �� �� ��ff�qr׆�ڈ�i34�ff�ff�ff�ff�ff�ff� �� �� �� �� �� �� ��ff�ffi34� �� �� �� �� �� �� �  
TStatusBar
StatusBar1Left Top� Width�HeightPanels SimplePanel  TRadioButtonRd_RegistroLeftTopWidthgHeightCaptionN� de RegistroFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder  	TMaskEdit	MaskEdit1LeftlTop4WidthYHeightTabOrder 	OnKeyDownMaskEdit1KeyDown  TQueryqryRelatorioDatabaseNameDBTDSQL.Strings�select MID(nome_parte,1, 80) as nome_parte, protocolo , registro, averbacao, data_recepcao, data_baixa, cod_natureza, nome_parte, nome_apresentante from HistoricoRegistro LeftTop	ParamData   TDataSourceDsRelatorioDataSetqryRelatorioLeft'Top	   