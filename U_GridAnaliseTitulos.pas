unit U_GridAnaliseTitulos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, Grids, DBGrids, DBTables, MemTable,
  Mask, ToolEdit;

type
  TF_GridAnaliseTitulos = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    tbTitulos: TMemoryTable;
    tbTitulosprotocolo: TStringField;
    tbTitulosdata_pr: TDateField;
    tbTitulosdescricao: TStringField;
    tbTitulosdtprzreg: TDateField;
    tbTitulosstatus_extenso: TStringField;
    qryPesquisa: TQuery;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    BitBtn1: TBitBtn;
    Label50: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Button1: TButton;
    tbTitulosdatap: TDateField;
    tbTitulosdtprzir: TDateField;
    tbTitulosrecno: TIntegerField;
    tbTitulostp_prot: TStringField;
    tbTitulosstatus_c: TStringField;
    tbTitulosdtprzanal: TDateField;
    tbTitulosletra_cor: TStringField;
    tbTitulosPrazo_AlertaPassaQuinseDias: TStringField;
    tbTitulosPrazo_AlertaDoseDias: TStringField;
    tbTitulosPrazo_AlertaVinteSeteDias: TStringField;
    tbTitulosPrazo_AlertaAcimaVinteSeteDias: TStringField;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DateEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    function DaysBetween(const ANow, AThen: TDateTime): Integer;
    function DaySpan(const ANow, AThen: TDateTime): Double;
    function SpanOfNowAndThen(const ANow, AThen: TDateTime): TDateTime;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_GridAnaliseTitulos: TF_GridAnaliseTitulos;

implementation

uses Menu, Titulo, Exame, Senha, Calc, info, DMTD, U_RelPrazosTitulos;

{$R *.DFM}

procedure TF_GridAnaliseTitulos.BitBtn2Click(Sender: TObject);
begin
  Close;
end;


procedure TF_GridAnaliseTitulos.BitBtn1Click(Sender: TObject);
var
  registros,
  Diaatraso: Integer;
begin 
  Diaatraso:= 0;
  tbTitulos.Close;
  tbTitulos.Open;

  qryPesquisa.Close;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add(' select data_r, data_entr, td.recno, td.data_p, td.protocolo, curdate() as cur, n.natureza, td.status ');
  qryPesquisa.SQL.Add(' from td left join natureza n on (n.cod = td.natureza) ');
  qryPesquisa.SQL.Add(' where status in ("EXAME") ');
  qryPesquisa.SQL.Add(' and data_r >= '+QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(DateEdit1.Text)))+' and data_r <='+QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(DateEdit2.Text)))+' ');
  qryPesquisa.SQL.Add(' group by protocolo order by data_r ');
  qryPesquisa.SQL.SaveToFile('c:\\ss.txt');
  qryPesquisa.Open;

  //Label3.Caption:= 'Existem: '+ inttostr(0) +' Títulos com prazo limite de análise para vencer!';
  //Label4.Caption:= 'Existem: '+ inttostr(0) +' Títulos com prazo limite ultrapassado para análise!';
  Label53.Caption:= 'Existem: '+ inttostr(0) +' Títulos com prazo limite de registro para vencer!';
  //Label52.Caption:= 'Existem: '+ inttostr(0) +' Títulos com prazo limite ultrapassado para registro!';

  {Títulos no limite do vencimento baseado na tela de configuração}
  {registros:= 0;
  qryPesquisa.First;
  while not qryPesquisa.eof do
  begin
    if ((DaysBetween(qryPesquisa.FieldByName('data_r').AsDateTime, Now)) <=  (15 - f_menu.PrazoLimite)) then //15-3
    begin
      tbTitulos.Insert;
      tbTitulosprotocolo.AsString     := qryPesquisa.FieldByName('protocolo').AsString;
      //tbTitulosdata_pr.AsString       := qryPesquisa.FieldByName('data_pr').AsString;
      tbTitulosdescricao.AsString     := qryPesquisa.FieldByName('natureza').AsString;
      //tbTitulosdtprzreg.AsString      := qryPesquisa.FieldByName('dtprzreg').AsString;
      //tbTitulosdtprzanal.AsString     := qryPesquisa.FieldByName('dtprzanal').AsString;
      tbTitulosdatap.AsString         := qryPesquisa.FieldByName('data_p').AsString;
      //tbTitulosdtprzir.AsString       := qryPesquisa.FieldByName('dtprzir').AsString;
      tbTitulosstatus_extenso.AsString:= qryPesquisa.FieldByName('status').AsString;
      tbTitulosrecno.AsString         := qryPesquisa.FieldByName('recno').AsString;
      //tbTitulostp_prot.AsString       := qryPesquisa.FieldByName('tp_prot').AsString;
      //tbTitulosstatus_c.AsString      := qryPesquisa.FieldByName('status_c').AsString;
      tbTitulosletra_cor.AsString     := 'M'; //Marrom
      tbTitulosPrazo_AlertaDoseDias.AsString  := 'S';
      tbTitulosPrazo_AlertaPassaQuinseDias.AsString  := 'N';
      tbTitulosPrazo_AlertaVinteSeteDias.AsString  := 'N';
      tbTitulosPrazo_AlertaAcimaVinteSeteDias.AsString  := 'N';

      tbTitulos.Post;
      registros := registros + 1;

      Label3.Caption:= 'Existem: '+ inttostr(registros) +' Títulos com prazo limite de análise para vencer!';
    end;
    qryPesquisa.Next;
  end;}

  {Títulos acima do limite do vencimento baseado na tela de configuração}
  {registros:= 0;
  qryPesquisa.First;
  while not qryPesquisa.eof do
  begin
    if ((DaysBetween(qryPesquisa.FieldByName('data_p').AsDateTime, Now)) >  15) and  //15-3 = 12
      ((DaysBetween(qryPesquisa.FieldByName('data_p').AsDateTime, Now)) < (30 - f_menu.PrazoLimite)) then
    begin
      tbTitulos.Insert;
      tbTitulosprotocolo.AsString     := qryPesquisa.FieldByName('protocolo').AsString;
      //tbTitulosdata_pr.AsString       := qryPesquisa.FieldByName('data_pr').AsString;
      tbTitulosdescricao.AsString     := qryPesquisa.FieldByName('natureza').AsString;
      //tbTitulosdtprzreg.AsString      := qryPesquisa.FieldByName('dtprzreg').AsString;
      //tbTitulosdtprzanal.AsString     := qryPesquisa.FieldByName('dtprzanal').AsString;
      tbTitulosdatap.AsString         := qryPesquisa.FieldByName('data_p').AsString;
      //tbTitulosdtprzir.AsString       := qryPesquisa.FieldByName('dtprzir').AsString;
      tbTitulosstatus_extenso.AsString:= qryPesquisa.FieldByName('status').AsString;
      tbTitulosrecno.AsString         := qryPesquisa.FieldByName('recno').AsString;
      //tbTitulostp_prot.AsString       := qryPesquisa.FieldByName('tp_prot').AsString;
      //tbTitulostp_prot.AsString       := qryPesquisa.FieldByName('tp_prot').AsString;
      tbTitulosstatus_c.AsString      := qryPesquisa.FieldByName('status_c').AsString;
      tbTitulosletra_cor.AsString     := 'A'; //Azul
      tbTitulosPrazo_AlertaPassaQuinseDias.AsString  := 'S';
      tbTitulosPrazo_AlertaDoseDias.AsString  := 'N';
      tbTitulosPrazo_AlertaVinteSeteDias.AsString  := 'N';
      tbTitulosPrazo_AlertaAcimaVinteSeteDias.AsString  := 'N';
      tbTitulos.Post;
      registros := registros + 1;
      Label4.Caption:= 'Existem: '+ inttostr(registros) +' Títulos com prazo limite ultrapassado para análise!';
    end;
    qryPesquisa.Next;
  end; }


  {Títulos no limite do vencimento baseado na tela de configuração}
  registros:= 0;
  qryPesquisa.First;
  while not qryPesquisa.eof do
  begin
    {if ((DaysBetween(qryPesquisa.FieldByName('dtprzreg').AsDateTime, Now) - 30) <  f_menu.PrazoLimite) or
      ((DaysBetween(qryPesquisa.FieldByName('dtprzreg').AsDateTime, Now) - 30) > 0) and}
    if ((DaysBetween(qryPesquisa.FieldByName('data_r').AsDateTime, Now)) >=  (30 - f_menu.PrazoLimite)) and
      ((DaysBetween(qryPesquisa.FieldByName('data_r').AsDateTime, Now)) < 30) then
    begin
      tbTitulos.Insert;
      tbTitulosprotocolo.AsString     := qryPesquisa.FieldByName('protocolo').AsString;
      //tbTitulosdata_pr.AsString       := qryPesquisa.FieldByName('data_pr').AsString;
      tbTitulosdescricao.AsString     := qryPesquisa.FieldByName('natureza').AsString;
      //tbTitulosdtprzreg.AsString      := qryPesquisa.FieldByName('dtprzreg').AsString;
      //tbTitulosdtprzanal.AsString     := qryPesquisa.FieldByName('dtprzanal').AsString;
      tbTitulosdatap.AsString         := qryPesquisa.FieldByName('data_p').AsString;
      //tbTitulosdtprzir.AsString       := qryPesquisa.FieldByName('dtprzir').AsString;
      tbTitulosstatus_extenso.AsString:= qryPesquisa.FieldByName('status').AsString;
      tbTitulosrecno.AsString         := qryPesquisa.FieldByName('recno').AsString;
      //tbTitulostp_prot.AsString       := qryPesquisa.FieldByName('tp_prot').AsString;
      //tbTitulosstatus_c.AsString      := qryPesquisa.FieldByName('status_c').AsString;
      tbTitulosletra_cor.AsString     := 'O'; //Oliva
      tbTitulosPrazo_AlertaPassaQuinseDias.AsString  := 'N';
      tbTitulosPrazo_AlertaDoseDias.AsString  := 'N';
      tbTitulosPrazo_AlertaVinteSeteDias.AsString  := 'S';
      tbTitulosPrazo_AlertaAcimaVinteSeteDias.AsString  := 'N';

      tbTitulos.Post;
      registros := registros + 1;

      Label53.Caption:= 'Existem: '+ inttostr(registros) +' Títulos com prazo limite de registro para vencer!';
    end;
    qryPesquisa.Next;
  end;

  {Títulos acima do limite do vencimento baseado na tela de configuração}
  {registros:= 0;
  qryPesquisa.First;
  while not qryPesquisa.eof do
  begin
    if ((DaysBetween(qryPesquisa.FieldByName('data_p').AsDateTime, Now)) > 30) then
    begin
      tbTitulos.Insert;
      tbTitulosprotocolo.AsString     := qryPesquisa.FieldByName('protocolo').AsString;
      //tbTitulosdata_pr.AsString       := qryPesquisa.FieldByName('data_pr').AsString;
      tbTitulosdescricao.AsString     := qryPesquisa.FieldByName('natureza').AsString;
      //tbTitulosdtprzreg.AsString      := qryPesquisa.FieldByName('dtprzreg').AsString;
      //tbTitulosdtprzanal.AsString     := qryPesquisa.FieldByName('dtprzanal').AsString;
      tbTitulosdatap.AsString         := qryPesquisa.FieldByName('data_p').AsString;
      //tbTitulosdtprzir.AsString       := qryPesquisa.FieldByName('dtprzir').AsString;
      tbTitulosstatus_extenso.AsString:= qryPesquisa.FieldByName('status').AsString;
      tbTitulosrecno.AsString         := qryPesquisa.FieldByName('recno').AsString;
      //tbTitulostp_prot.AsString       := qryPesquisa.FieldByName('tp_prot').AsString;
      //tbTitulosstatus_c.AsString      := qryPesquisa.FieldByName('status_c').AsString;
      tbTitulosletra_cor.AsString     := 'V'; //Vermelho
      tbTitulosPrazo_AlertaPassaQuinseDias.AsString  := 'N';
      tbTitulosPrazo_AlertaDoseDias.AsString  := 'N';
      tbTitulosPrazo_AlertaVinteSeteDias.AsString  := 'N';
      tbTitulosPrazo_AlertaAcimaVinteSeteDias.AsString  := 'S';

      tbTitulos.Post;
      registros := registros + 1;

      Label52.Caption:= 'Existem: '+ inttostr(registros) +' Títulos com prazo limite ultrapassado para registro!';
    end;
    qryPesquisa.Next;
  end;}
end;

procedure TF_GridAnaliseTitulos.DateEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 Then
    DateEdit2.SetFocus;
end;

procedure TF_GridAnaliseTitulos.DateEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 Then
    BitBtn1.SetFocus;
end;

function TF_GridAnaliseTitulos.SpanOfNowAndThen(const ANow, AThen: TDateTime): TDateTime;
begin
  if ANow < AThen then
    Result := AThen - ANow
  else
    Result := ANow - AThen;
end;

function TF_GridAnaliseTitulos.DaySpan(const ANow, AThen: TDateTime): Double;
begin
  Result := SpanOfNowAndThen(ANow, AThen);
end;


function TF_GridAnaliseTitulos.DaysBetween(const ANow,
  AThen: TDateTime): Integer;
begin
  Result := Trunc(DaySpan(ANow, AThen));
end;


procedure TF_GridAnaliseTitulos.Button1Click(Sender: TObject);
begin


  ShowMessage('Data de Recepção: '+DateToStr(tbTitulos.FieldByName('datap').AsDateTime));
  ShowMessage('Data de Prazo Registro:'+DateToStr(tbTitulos.FieldByName('dtprzreg').AsDateTime));
  ShowMessage('Data de Prazo Irregular:'+DateToStr(tbTitulos.FieldByName('dtprzir').AsDateTime));


  Showmessage(inttostr(DaysBetween(tbTitulos.FieldByName('dtprzir').AsDateTime, tbTitulos.FieldByName('datap').AsDateTime)));

    {if ((DaysBetween(qryPesquisa.FieldByName('dtprzreg').AsDateTime, qryPesquisa.FieldByName('datap').AsDateTime) - 30) <=  f_menu.PrazoLimite) or
      ((DaysBetween(qryPesquisa.FieldByName('dtprzreg').AsDateTime, qryPesquisa.FieldByName('datap').AsDateTime) - 30) >= 0) then
    begin
      if tbTitulosstatus_extenso.AsString <> 'Irregular' then
        ShowMessage('Titulo a vencer '+ inttostr((DaysBetween(qryPesquisa.FieldByName('dtprzreg').AsDateTime, qryPesquisa.FieldByName('datap').AsDateTime) - 30))+', Dias');
    end;}


    {if ((DaysBetween(qryPesquisa.FieldByName('dtprzreg').AsDateTime, qryPesquisa.FieldByName('datap').AsDateTime) - 30) <  f_menu.PrazoLimite) then
    begin
      if tbTitulosstatus_extenso.AsString <> 'Irregular' then
        ShowMessage('Titulo vencido a '+ inttostr(DaysBetween(tbTitulos.FieldByName('dtprzreg').AsDateTime, tbTitulos.FieldByName('datap').AsDateTime))+', Dias');
    end;}

    {if ((DaysBetween(qryPesquisa.FieldByName('dtprzir').AsDateTime, qryPesquisa.FieldByName('datap').AsDateTime) - 15) <=  f_menu.PrazoLimite) or
      ((DaysBetween(qryPesquisa.FieldByName('dtprzir').AsDateTime, qryPesquisa.FieldByName('datap').AsDateTime) - 15) >= 0) then
    begin
      if tbTitulosstatus_extenso.AsString = 'Irregular' then
        ShowMessage('Titulo vencido a '+ inttostr((DaysBetween(tbTitulos.FieldByName('dtprzir').AsDateTime, tbTitulos.FieldByName('datap').AsDateTime)- 15))+', Dias');
    end;}

  //Showmessage(inttostr(DaysBetween(tbTitulos.FieldByName('dtprzreg').AsDateTime, tbTitulos.FieldByName('datap').AsDateTime) - f_menu.PrazoLimite));
end;

procedure TF_GridAnaliseTitulos.DBGrid1DblClick(Sender: TObject);
var
 key: word;
begin
  Key := VK_RETURN;

  //Application.CreateForm(TF_RMemo, F_RMemo);
  //Application.CreateForm(TF_Situacao, F_Situacao);
  //Application.CreateForm(TF_Info, F_Info);
  //Application.CreateForm(TF_Calc, F_Calc);
  //Application.CreateForm(TF_Contra, F_Contra);
  //Application.CreateForm(TF_Titulo, F_Titulo);
  //Application.CreateForm(TF_Exame, F_Exame);
  //Application.CreateForm(TF_Senha, F_Senha);

  F_exame.Caption := 'Exame de Títulos Prenotados';
  //F_exame.rbPrenotado.Checked := True;
  //F_exame.rbPrenotado.Enabled := False;
  //F_exame.rbExame.Enabled     := False;

  {if (tbTitulostp_prot.AsString = 'O') then
    F_Exame.rbExame.Checked:= True
  else
    F_Exame.rbPrenotado.Checked:= True;
  }
  //F_Exame.Bitbtn11.visible := true;

  Application.CreateForm(TF_Exame, F_Exame);
  //F_Exame.Edit29.Text := tbTitulosprotocolo.AsString;
  F_Exame.MaskEdit1.Text := tbTitulosprotocolo.AsString;
  F_Exame.FormActivate(Sender);
  F_Exame.BitBtn1Click(Self);

  //F_Exame.Edit29.OnKeyDown(Sender, Key, [ssShift]);
  //F_Exame.Tela_Ato;

  F_Exame.ShowModal;

  {F_Senha.destroy;
  F_Contra.destroy;
  F_Calc.destroy;
  F_Info.destroy;
  F_Titulo.destroy;
  F_Situacao.destroy;
  F_RMemo.destroy;
  F_Exame.destroy;
  F_Senha := nil;
  F_Contra := nil;
  F_Calc := nil;
  F_Info := nil;
  F_Titulo := nil;
  F_Situacao := nil;
  F_RMemo := nil;}
  F_Exame := nil;

end;

procedure TF_GridAnaliseTitulos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  If tbTitulosletra_cor.AsString = 'O' then // Recepção
    Dbgrid1.Canvas.Font.Color:= clOlive; // coloque aqui a cor desejada

  If tbTitulosletra_cor.AsString = 'V' then // Exame
    Dbgrid1.Canvas.Font.Color:= clRed; // coloque aqui a cor desejada

  If tbTitulosletra_cor.AsString = 'M' then // Exame
    Dbgrid1.Canvas.Font.Color:= clMaroon; // coloque aqui a cor desejada

  If tbTitulosletra_cor.AsString = 'A' then // Exame
    Dbgrid1.Canvas.Font.Color:= clBlue; // coloque aqui a cor desejada

  Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TF_GridAnaliseTitulos.FormShow(Sender: TObject);
begin
  //Label3.Caption:= 'Existem: '+ inttostr(0) +' Títulos com prazo limite de análise para vencer!';
  //Label4.Caption:= 'Existem: '+ inttostr(0) +' Títulos com prazo limite ultrapassado para análise!';
  Label53.Caption:= 'Existem: '+ inttostr(0) +' Títulos com prazo limite de registro para vencer!';
  //Label52.Caption:= 'Existem: '+ inttostr(0) +' Títulos com prazo limite ultrapassado para registro!';

end;

procedure TF_GridAnaliseTitulos.BitBtn3Click(Sender: TObject);
begin
  if (Not(dm.Configur.Active)) Then
    dm.Configur.Open;
  Application.CreateForm(TF_RelPrazosTitulos, F_RelPrazosTitulos);
  F_RelPrazosTitulos.QrLabel1.Caption  := F_Menu.Label13.Caption; // + ' de ' + F_Menu.Label14.Caption + '-' + F_Menu.Label23.Caption;
  F_RelPrazosTitulos.QrLabel4.Caption  := F_Menu.Label20.Caption;
  F_RelPrazosTitulos.QrLabel5.Caption  := F_Menu.Label21.Caption;
  F_RelPrazosTitulos.QuickRep1.preview;
  F_RelPrazosTitulos:= Nil;

end;

end.
