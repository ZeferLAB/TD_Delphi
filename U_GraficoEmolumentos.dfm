�
 TF_GRAFICOEMOLUMENTOS 0  TPF0TF_GraficoEmolumentosF_GraficoEmolumentosLeft�TopeWidth�Height�CaptionGr�ficoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPixelsPerInch`
TextHeight TLabelLabel1LeftTop$Width8HeightCaption
Exerc�cio:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TLabelLabel2Left� Top4Width� HeightCaption)Total Geral dos Emolumentos do Cart�rio: Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFont  TPanelPanel10Left Top Width�Height
BevelOuterbvNoneColor
clGrayTextTabOrder  TLabelLabel37LeftTopWidthCHeightCaption&Gr�fico de Emolumentos por Compet�nciaColorclWhiteFont.CharsetANSI_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameArial
Font.StylefsBold ParentColor
ParentFontTransparent	   
TStatusBar
StatusBar1Left TopHWidth�HeightPanels SimplePanel  TDBChartDBChart1Left Top:Width�Height� AllowPanningpmNone	AllowZoomBackWall.Brush.StylebsClearBackWall.Pen.VisibleTitle.Text.Strings  AxisVisible
ClipPointsFrame.VisibleView3DOptions.Elevation;View3DOptions.OrthogonalView3DOptions.RotationhView3DWallsTabOrder 
TPieSeriesSeries1Marks.ArrowLengthMarks.Visible	
DataSource
qryGraficoXLabelsSourceCompetenciaOtherSlice.TextOtherPieValues.DateTimePieValues.NamePiePieValues.Multiplier       ��?PieValues.OrderloNonePieValues.ValueSourceTotal_Emolumento   TBitBtnBitBtn1Left� TopWidthHeightTabOrderOnClickBitBtn1Click
Glyph.Data
:  6  BM6      6   (                                  ���������������������������������������������������������������ww���������������������������������������zU�UU�Uz���������������������������������~Y�YY�YY�YY�Y~����������������������������^�^^�^��^�^^�^����������������������"�"d�dd�d��"�""�"��d�dd�d"�"������������������(�(k�k��(�(������(�(��k�kk�k(�(���������������-�-��-�-������������-�-��r�rr�r-�-������������3�33�3������������������3�3��y�yy�y3�3����������Λ������������������������8�8����8�8������������������������������������=�=��=�=���������������������������������������A�A��A�A������������������������������������������D�DD�D��������������������������������������������Сԡ���������������������������������������������������������������������������������������������������  TEditEdAnoLeft@Top WidthyHeightFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTabOrder	OnKeyDownEdAnoKeyDown  TDBChartDBChart2Left Top1Width�Height� BackWall.Brush.StylebsClearTitle.Text.Strings  View3DOptions.Elevation;View3DOptions.OrthogonalView3DOptions.RotationhTabOrder 
TBarSeriesSeries2Marks.ArrowLengthMarks.Visible	
DataSource
qryGraficoXLabelsSourceCompetenciaSeriesColorclGreenXValues.DateTimeXValues.NameXXValues.Multiplier       ��?XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ��?YValues.OrderloNoneYValues.ValueSourceTotal_Emolumento   TQuery
qryGraficoDatabaseNameDBTDSQL.Strings+select Sum(emol_daje) as Total_Emolumento, )       CASE EXTRACT(month FROM data_emi) 			 WHEN 1 THEN 'Janeiro' 			 WHEN 2 THEN 'Fevereiro' 			 WHEN 3 THEN 'Mar�o' 			 WHEN 4 THEN 'Abril' 			 WHEN 5 THEN 'Maio' 			 WHEN 6 THEN 'Junho' 			 WHEN 7 THEN 'Julho'         WHEN 8 THEN 'Agosto' 			        WHEN 9 THEN 'Setembro'        WHEN 10 THEN 'Outubro'        WHEN 11 THEN 'Novembro'        WHEN 12 THEN 'Dezembro' 			 END as Competenciaafrom daje where EXTRACT(YEAR FROM data_emi) = :ano and status in ('Pago', 'Liberado Manualmente')%group by EXTRACT(month FROM data_emi) Left`Top 	ParamDataDataType	ftUnknownNameano	ParamType	ptUnknown    TDataSource
Ds_GraficoDataSet
qryGraficoLeftPTop   TQueryqryTotalGeralDatabaseNameDBTDSQL.Strings)select Sum(emol_daje) as Total_Emolumentobfrom daje where EXTRACT(YEAR FROM data_emi) =  :ano and status in ('Pago', 'Liberado Manualmente')  Left�Top 	ParamDataDataType	ftUnknownNameano	ParamType	ptUnknown     