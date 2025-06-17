unit Duplicp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls, Grids, DBGrids, Menus;

type
  TF_Duplicp = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Modificou_a: TLabel;
    Modificou_p: TLabel;
    Modificou_r: TLabel;
    Tem_Filtro: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    Label3: TLabel;
    MaskEdit4: TMaskEdit;
    Label4: TLabel;
    MaskEdit5: TMaskEdit;
    Label5: TLabel;
    MaskEdit6: TMaskEdit;
    Label6: TLabel;
    MaskEdit7: TMaskEdit;
    Label7: TLabel;
    ProgressBar1: TProgressBar;
    PopupMenu1: TPopupMenu;
    Marcar1: TMenuItem;
    DesmarcarTodos1: TMenuItem;
    Label8: TLabel;
    Label9: TLabel;
    StringGrid1: TStringGrid;
    MarcarSelecionado1: TMenuItem;
    DesmarcarSelecionado1: TMenuItem;
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure Marcar1Click(Sender: TObject);
    procedure DesmarcarTodos1Click(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MarcarSelecionado1Click(Sender: TObject);
    procedure DesmarcarSelecionado1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Duplicp: TF_Duplicp;
  filtro : String;
  mesmoprot : Boolean;

implementation

uses exame, Func, {RMemo,} {situacao,} DMTD;

{$R *.DFM}

Procedure Cabec_Grid;
begin
  With F_Duplicp do
  begin
    F_Duplicp.StringGrid1.Cells[0,0]  := 'M';
    F_Duplicp.StringGrid1.Cells[1,0]  := 'Nome';
    F_Duplicp.StringGrid1.Cells[2,0]  := 'Protocolo';
    F_Duplicp.StringGrid1.Cells[3,0]  := 'Tp_Prot';
    F_Duplicp.StringGrid1.Cells[4,0]  := 'N_Ato';
    F_Duplicp.StringGrid1.Cells[5,0]  := 'Sequência';
    F_Duplicp.StringGrid1.Cells[6,0]  := 'Status';
    F_Duplicp.StringGrid1.Cells[7,0]  := 'Data Ato';
    F_Duplicp.StringGrid1.Cells[8,0]  := 'Hora Ato';
    F_Duplicp.StringGrid1.Cells[9,0]  := 'Datap';
    F_Duplicp.StringGrid1.Cells[10,0] := 'doc1';
    F_Duplicp.StringGrid1.Cells[11,0] := 'RG';
    F_Duplicp.StringGrid1.Cells[12,0] := 'Filiação';
    F_Duplicp.StringGrid1.Cells[13,0] := 'Situação';
    F_Duplicp.StringGrid1.Cells[14,0] := 'Tipo';
    F_Duplicp.StringGrid1.Cells[15,0] := 'Matrícula';
    F_Duplicp.StringGrid1.Cells[16,0] := 'Ato';
    F_Duplicp.StringGrid1.Cells[17,0] := 'Cod_Nat';
    F_Duplicp.StringGrid1.Cells[18,0] := 'PO';
    F_Duplicp.StringGrid1.Cells[19,0] := 'Endereço';
    F_Duplicp.StringGrid1.Cells[20,0] := 'Est_civ';
    F_Duplicp.StringGrid1.Cells[21,0] := 'Nacional';
    F_Duplicp.StringGrid1.Cells[22,0] := 'Profissao';
    F_Duplicp.StringGrid1.Cells[23,0] := 'id_ifp';
    F_Duplicp.StringGrid1.Cells[24,0] := 'dt_emiss_ifp';
    F_Duplicp.StringGrid1.Cells[25,0] := 'bairro';
    F_Duplicp.StringGrid1.Cells[26,0] := 'municipio';
    F_Duplicp.StringGrid1.Cells[27,0] := 'uf';
    F_Duplicp.StringGrid1.Cells[28,0] := 'org_emiss';
  end;
end;

Procedure Limpa_Grid;
var
  x : Integer;
begin
  With F_DuplicP do
  begin
    for x := 1 to (F_Duplicp.StringGrid1.RowCount - 1) do
    begin
      F_Duplicp.StringGrid1.Cells[0,x] := '';
      F_Duplicp.StringGrid1.Cells[1,x] := '';
      F_Duplicp.StringGrid1.Cells[2,x] := '';
      F_Duplicp.StringGrid1.Cells[3,x] := '';
      F_Duplicp.StringGrid1.Cells[4,x] := '';
      F_Duplicp.StringGrid1.Cells[5,x] := '';
      F_Duplicp.StringGrid1.Cells[6,x] := '';
      F_Duplicp.StringGrid1.Cells[7,x] := '';
      F_Duplicp.StringGrid1.Cells[8,x] := '';
      F_Duplicp.StringGrid1.Cells[9,x] := '';
      F_Duplicp.StringGrid1.Cells[10,x] := '';
      F_Duplicp.StringGrid1.Cells[11,x] := '';
      F_Duplicp.StringGrid1.Cells[12,x] := '';
      F_Duplicp.StringGrid1.Cells[13,x] := '';
      F_Duplicp.StringGrid1.Cells[14,x] := '';
      F_Duplicp.StringGrid1.Cells[15,x] := '';
      F_Duplicp.StringGrid1.Cells[16,x] := '';
      F_Duplicp.StringGrid1.Cells[17,x] := '';
      F_Duplicp.StringGrid1.Cells[18,x] := '';
      F_Duplicp.StringGrid1.Cells[19,x] := '';
      F_Duplicp.StringGrid1.Cells[20,x] := '';
      F_Duplicp.StringGrid1.Cells[21,x] := '';
      F_Duplicp.StringGrid1.Cells[22,x] := '';
      F_Duplicp.StringGrid1.Cells[23,x] := '';
      F_Duplicp.StringGrid1.Cells[24,x] := '';
      F_Duplicp.StringGrid1.Cells[25,x] := '';
      F_Duplicp.StringGrid1.Cells[26,x] := '';
      F_Duplicp.StringGrid1.Cells[27,x] := '';
      F_Duplicp.StringGrid1.Cells[28,x] := '';
      F_Duplicp.StringGrid1.Cells[29,x] := '';
    end;
    F_Duplicp.StringGrid1.RowCount := 2;
    Cabec_Grid;
  end;
end;

procedure TF_Duplicp.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_Duplicp.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then MaskEdit4.SetFocus;
end;

procedure TF_Duplicp.FormActivate(Sender: TObject);
begin
  Cabec_Grid;
  maskedit1.setfocus;
  ProgressBar1.Position := 0;
end;

procedure TF_Duplicp.BitBtn2Click(Sender: TObject);
begin
  Maskedit1.text := '';
  Maskedit2.text := '';
//  filtrar('Pessoal');
  Screen.Cursor := crDefault;
  close;
end;

procedure TF_Duplicp.BitBtn1Click(Sender: TObject);
var
  total_Duplicados : Integer;
  x : Integer;
begin
  With F_Exame do
  begin
    { Pessoal }
    if true then
    Begin
      if (maskedit1.Text = F_Duplicp.MaskEdit1.text) and (Label59.Caption = F_Duplicp.MaskEdit2.Text) then
      Begin
        Showmessage('Não é possível Duplicar um ato para ele mesmo');
        exit;
      end;
      F_Duplicp.ProgressBar1.Min := 0;
      F_Duplicp.ProgressBar1.Max := StrToInt(F_Duplicp.MaskEdit4.Text);
      dm.Pessoal.open;
      for x := 1 to (F_Duplicp.StringGrid1.RowCount) do
      begin
        for Total_Duplicados := 1 to StrToInt(F_Duplicp.MaskEdit4.Text) do
        begin
          if (F_Duplicp.StringGrid1.Cells[0,x] = 'X') then
          begin
            F_Duplicp.Modificou_P.Caption := 'S';


            dm.Pessoal.Append;
            dm.Pessoal.FieldByName('data').asString      := F_Duplicp.StringGrid1.Cells[9,x];
            dm.Pessoal.FieldByName('p_auxiliar').asString  := F_Duplicp.StringGrid1.Cells[2,x];
           // dm.Pessoal.FieldByName('tp_prot').asString    := F_Duplicp.StringGrid1.Cells[3,x];
           // dm.Pessoal.FieldByName('n_ato').asString      := F_Duplicp.StringGrid1.Cells[4,x];
            //dm.Pessoal.FieldByName('seq').asString        := F_Duplicp.StringGrid1.Cells[5,x];
            {
            dm.qryGenerico.Close;
            dm.qryGenerico.SQL.Clear;
            dm.qryGenerico.SQL.Add('select status_c from reg_cab where protocolo = '+QuotedStr(dm.pessoal.fieldbyname('p_auxiliar').AsString)+'');
            dm.qryGenerico.Open;

            if (dm.qryGenerico.Fieldbyname('status_c').AsString <> 'D') and (dm.qryGenerico.Fieldbyname('status_c').AsString <> 'I') Then
            Begin
              if (dm.Pessoal.Fieldbyname('status_p').asstring <> 'I') and
                (dm.Pessoal.fieldbyname('status_p').asstring <> 'R') and
                (dm.Pessoal.fieldbyname('status_p').asstring <> 'D') and
                (dm.Pessoal.fieldbyname('status_p').asstring <> 'C') and
                (dm.Pessoal.fieldbyname('status_p').asstring <> '1') and
                (dm.Pessoal.fieldbyname('status_p').asstring <> '2') then
                begin
                  dm.Pessoal.FieldByName('status_p').asstring   := 'E';
                end;
            End
            Else
            Begin
              dm.Pessoal.FieldByName('status_p').asstring   := 'R';
            End; }

            //dm.Pessoal.FieldByName('status_p').asString   := F_Duplicp.StringGrid1.Cells[6,x];


           // dm.Pessoal.FieldByName('dt_st_p').asString    := F_Duplicp.StringGrid1.Cells[7,x];
            //dm.Pessoal.FieldByName('ho_st_p').asString    := F_Duplicp.StringGrid1.Cells[8,x];
            dm.Pessoal.FieldByName('nome').asString       := F_Duplicp.StringGrid1.Cells[1,x];
            dm.Pessoal.FieldByName('doc1').asString    := F_Duplicp.StringGrid1.Cells[10,x];
            dm.Pessoal.FieldByName('doc2').asString         := F_Duplicp.StringGrid1.Cells[11,x];
            //dm.Pessoal.FieldByName('filiacao').asString   := F_Duplicp.StringGrid1.Cells[12,x];
            dm.Pessoal.FieldByName('situacao').asString   := F_Duplicp.StringGrid1.Cells[13,x];
           // dm.Pessoal.FieldByName('tipo_matr').asInteger := StrToInt(F_Duplicp.StringGrid1.Cells[14,x]);
            dm.Pessoal.FieldByName('registro').asInteger    := StrToInt(F_Duplicp.StringGrid1.Cells[15,x]);
           // dm.Pessoal.FieldByName('ato').asInteger       := StrToInt(F_Duplicp.StringGrid1.Cells[16,x]);
           // dm.Pessoal.FieldByName('cod_nat').asString    := F_Duplicp.StringGrid1.Cells[17,x];
           // dm.Pessoal.FieldByName('po').asString         := F_Duplicp.StringGrid1.Cells[18,x];
            dm.Pessoal.FieldByName('endereco').asString   := F_Duplicp.StringGrid1.Cells[19,x];
            //dm.Pessoal.FieldByName('est_civ').asString    := F_Duplicp.StringGrid1.Cells[20,x];
            //dm.Pessoal.FieldByName('nacional').asString   := F_Duplicp.StringGrid1.Cells[21,x];
            dm.Pessoal.FieldByName('profissao').asString  := F_Duplicp.StringGrid1.Cells[22,x];
           // dm.Pessoal.FieldByName('id_ifp').asString        := F_Duplicp.StringGrid1.Cells[23,x];
            //dm.Pessoal.FieldByName('dt_emiss_ifp').asString  := F_Duplicp.StringGrid1.Cells[24,x];
            dm.Pessoal.FieldByName('bairro').asString        := F_Duplicp.StringGrid1.Cells[25,x];
            //dm.Pessoal.FieldByName('municipio').asString     := F_Duplicp.StringGrid1.Cells[26,x];
            //dm.Pessoal.FieldByName('uf').asString            := F_Duplicp.StringGrid1.Cells[27,x];
            //dm.Pessoal.FieldByName('org_emiss').asString     := F_Duplicp.StringGrid1.Cells[28,x];
            //dm.Pessoal.FieldByName('pess_xml').asString      := F_Duplicp.StringGrid1.Cells[29,x];

            //dm.Pessoal.fieldbyname('observa').asString    := F_Duplicp.StringGrid1.Cells[30,x];
           // dm.Pessoal.fieldbyname('particip').asString   := F_Duplicp.StringGrid1.Cells[31,x];
            //dm.Pessoal.fieldbyname('cpf_proc').asString   := F_Duplicp.StringGrid1.Cells[32,x];
            //dm.Pessoal.fieldbyname('pess_distr').asString := F_Duplicp.StringGrid1.Cells[33,x];

            //dm.Pessoal.FieldByName('dataexpedicaorg').AsString := F_Duplicp.StringGrid1.Cells[34,x];

            //dm.Pessoal.FieldByName('datanascimento').AsString := F_Duplicp.StringGrid1.Cells[35,x];

            {if F_Duplicp.StringGrid1.Cells[36,x] = '1 - Comunhão parcial de bens' Then
              dm.Pessoal.fieldbyname('regime_bens').asstring := '1'
            else
            if F_Duplicp.StringGrid1.Cells[36,x] = '2 - Comunhão universal de bens' Then
              dm.Pessoal.fieldbyname('regime_bens').asstring := '2'
            else
            if F_Duplicp.StringGrid1.Cells[36,x] = '3 - Separação total de bens' Then
              dm.Pessoal.fieldbyname('regime_bens').asstring := '3'
            else
            if F_Duplicp.StringGrid1.Cells[36,x] = '4 - Participação final nos aquestos' Then
              dm.Pessoal.fieldbyname('regime_bens').asstring := '4'
            else
            F_Duplicp.StringGrid1.Cells[36,x] := '';   }

           { if F_Duplicp.StringGrid1.Cells[37,x] = '1 - Não' Then
              dm.Pessoal.fieldbyname('anuencia').asstring:= '0'
            else
            dm.Pessoal.fieldbyname('anuencia').asstring:= '1';  }

            {dm.Pessoal.fieldbyname('nome_mae').asstring:= F_Duplicp.StringGrid1.Cells[38,x];
            dm.Pessoal.fieldbyname('nome_pai').asstring:= F_Duplicp.StringGrid1.Cells[39,x];
            dm.Pessoal.fieldbyname('email').asstring   := F_Duplicp.StringGrid1.Cells[40,x]; }
            dm.Pessoal.fieldbyname('tip_doc1').asString:=F_Duplicp.StringGrid1.Cells[41,x];

            dm.Pessoal.Post;
            F_Duplicp.ProgressBar1.Position := total_duplicados;
          end;
        end;
      end;
    end;
   F_Exame.Carrega_Pessoal(F_Exame, True);
    Screen.Cursor := crDefault;
  end;
  close;
end;

procedure TF_Duplicp.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then F_Duplicp.StringGrid1.SetFocus;
end;

procedure TF_Duplicp.MaskEdit2Exit(Sender: TObject);
var
  x : Integer;
begin
  limpa_grid;
  if (MaskEdit2.Text <> '') and (MaskEdit2.Text <> '0') then
  Begin
    { Aqui Busca Reais de um Único ato do mesmo protocolo }
    dm.ArqAux_Pessoal.Sql.Clear;
    dm.ArqAux_Pessoal.Close;
    dm.ArqAux_Pessoal.Sql.Add('Select * From td_pesso Where p_auxiliar = ' + #39 + MaskEdit1.Text + #39);
    {if F_Exame.rbPrenotado.Checked then
      dm.ArqAux_Pessoal.Sql.Add(' AND tp_prot = ' + #39 + 'P' + #39)
    else
      dm.ArqAux_Pessoal.Sql.Add(' AND tp_prot = ' + #39 + 'O' + #39); }
   // dm.ArqAux_Pessoal.Sql.Add(' AND n_ato = "' + MaskEdit2.Text + '"');
    dm.ArqAux_Pessoal.Open;
  end
  else
  begin
    dm.ArqAux_Pessoal.Sql.Clear;
    dm.ArqAux_Pessoal.Close;
    dm.ArqAux_Pessoal.Sql.Add('Select * From td_pesso Where p_auxiliar = "' + MaskEdit1.Text + '"');
   { if F_Exame.rbPrenotado.Checked then
      dm.ArqAux_Pessoal.Sql.Add(' AND tp_prot = ' + #39 + 'P' + #39)
    else
      dm.ArqAux_Pessoal.Sql.Add(' AND tp_prot = ' + #39 + 'O' + #39);    }
    dm.ArqAux_Pessoal.Open;
  end;
  if (dm.ArqAux_Pessoal.RecordCount <> 0) then
  begin
    x := 1;
    dm.ArqAux_Pessoal.FindFirst;
    While (not dm.ArqAux_Pessoal.Eof) do
    begin
      if (x > 1) then F_Duplicp.StringGrid1.RowCount := F_Duplicp.StringGrid1.RowCount + 1;
      F_Duplicp.StringGrid1.Cells[0,x]  := '';
      F_Duplicp.StringGrid1.Cells[1,x]  := dm.ArqAux_Pessoal.FieldByName('nome').asString;
      F_Duplicp.StringGrid1.Cells[2,x]  :=  F_Exame.MaskEdit1.text; // dm.ArqAux_Pessoal.FieldByName('p_auxiliar').asString;
     // F_Duplicp.StringGrid1.Cells[3,x]  := dm.Ato.FieldByName('tp_prot').asString;
      F_Duplicp.StringGrid1.Cells[4,x]  := F_Exame.Label59.Caption;
      F_Duplicp.StringGrid1.Cells[5,x]  := MaskEdit6.Text;
      F_Duplicp.StringGrid1.Cells[6,x]  := 'E';
      F_Duplicp.StringGrid1.Cells[7,x]  := datetostr(date);
      F_Duplicp.StringGrid1.Cells[8,x]  := timetostr(time);
      F_Duplicp.StringGrid1.Cells[9,x]  := dm.ArqAux_Pessoal.FieldByName('data').asString;
      F_Duplicp.StringGrid1.Cells[10,x] := dm.ArqAux_Pessoal.FieldByName('doc1').asString;
      F_Duplicp.StringGrid1.Cells[11,x] := dm.ArqAux_Pessoal.fieldbyname('doc2').asString;
      //F_Duplicp.StringGrid1.Cells[12,x] := dm.ArqAux_Pessoal.fieldbyname('filiacao').asString;
      F_Duplicp.StringGrid1.Cells[13,x] := dm.ArqAux_Pessoal.fieldbyname('situacao').asString;
     // F_Duplicp.StringGrid1.Cells[14,x] := Copy(F_Exame.ComboBox2.text,1,2);
      F_Duplicp.StringGrid1.Cells[15,x] := dm.ArqAux_Pessoal.fieldbyname('registro').asString;
      //F_Duplicp.StringGrid1.Cells[16,x] := Copy(dm.Ato.FieldByName('ato').asString,1,2);
     // F_Duplicp.StringGrid1.Cells[17,x] := Copy('000' + F_Exame.MaskEdit29.Text, length('000' + F_Exame.MaskEdit29.Text) - 2, 3);
      //F_Duplicp.StringGrid1.Cells[18,x] := dm.ArqAux_Pessoal.fieldbyname('po').asString;
      F_Duplicp.StringGrid1.Cells[19,x] := dm.ArqAux_Pessoal.fieldbyname('endereco').asString;
      //F_Duplicp.StringGrid1.Cells[20,x] := dm.ArqAux_Pessoal.FieldByName('est_civ').asString;
      //F_Duplicp.StringGrid1.Cells[21,x] := dm.ArqAux_Pessoal.FieldByName('nacional').asString;
      F_Duplicp.StringGrid1.Cells[22,x] := dm.ArqAux_Pessoal.FieldByName('profissao').asString;
      //F_Duplicp.StringGrid1.Cells[23,x] := dm.ArqAux_Pessoal.FieldByName('id_ifp').asString;
      //F_Duplicp.StringGrid1.Cells[24,x] := dm.ArqAux_Pessoal.FieldByName('dt_emiss_ifp').asString;
      F_Duplicp.StringGrid1.Cells[25,x] := dm.ArqAux_Pessoal.FieldByName('bairro').asString;
      //F_Duplicp.StringGrid1.Cells[26,x] := dm.ArqAux_Pessoal.FieldByName('municipio').asString;
      //F_Duplicp.StringGrid1.Cells[27,x] := dm.ArqAux_Pessoal.FieldByName('uf').asString;
      //F_Duplicp.StringGrid1.Cells[28,x] := dm.ArqAux_Pessoal.FieldByName('org_emiss').asString;
      //F_Duplicp.StringGrid1.Cells[29,x] := dm.ArqAux_Pessoal.FieldByName('pess_xml').asString;

      //F_Duplicp.StringGrid1.Cells[30,x] := dm.ArqAux_Pessoal.fieldbyname('observa').asString;
      //F_Duplicp.StringGrid1.Cells[31,x] := dm.ArqAux_Pessoal.fieldbyname('particip').asString;
      //F_Duplicp.StringGrid1.Cells[32,x] := dm.ArqAux_Pessoal.fieldbyname('cpf_proc').asString;
      //F_Duplicp.StringGrid1.Cells[33,x] := dm.ArqAux_Pessoal.fieldbyname('pess_distr').asString;

      //F_Duplicp.StringGrid1.Cells[34,x] := dm.ArqAux_Pessoal.FieldByName('dataexpedicaorg').AsString;
      //F_Duplicp.StringGrid1.Cells[35,x] := dm.ArqAux_Pessoal.FieldByName('datanascimento').AsString;

    {  if dm.ArqAux_Pessoal.fieldbyname('regime_bens').asstring = '1' Then
        F_Duplicp.StringGrid1.Cells[36,x] := '1 - Comunhão parcial de bens'
      else
      if dm.ArqAux_Pessoal.fieldbyname('regime_bens').asstring = '2' Then
       F_Duplicp.StringGrid1.Cells[36,x] := '2 - Comunhão universal de bens'
      else
      if dm.ArqAux_Pessoal.fieldbyname('regime_bens').asstring = '3' Then
        F_Duplicp.StringGrid1.Cells[36,x] := '3 - Separação total de bens'
      else
      if dm.ArqAux_Pessoal.fieldbyname('regime_bens').asstring = '4' Then
        F_Duplicp.StringGrid1.Cells[36,x] := '4 - Participação final nos aquestos'
      else
      F_Duplicp.StringGrid1.Cells[36,x] := '';      }

     { if dm.ArqAux_Pessoal.fieldbyname('anuencia').asstring = '0' then
        F_Duplicp.StringGrid1.Cells[37,x]:= '1 - Não'
      else
      F_Duplicp.StringGrid1.Cells[37,x]:= '2 - Sim';  }

     { F_Duplicp.StringGrid1.Cells[38,x] := dm.ArqAux_Pessoal.fieldbyname('nome_mae').asString;
      F_Duplicp.StringGrid1.Cells[39,x] := dm.ArqAux_Pessoal.fieldbyname('nome_pai').asString;
      F_Duplicp.StringGrid1.Cells[40,x] := dm.ArqAux_Pessoal.fieldbyname('email').asString; }
      F_Duplicp.StringGrid1.Cells[41,x] := dm.ArqAux_Pessoal.fieldbyname('tip_doc1').asString;
      x := x + 1;
      dm.ArqAux_Pessoal.Next;
    end;
  end
  else
  begin
    ShowMessage('Indicador Pessoal Não Encontrado !');
  end;
end;

procedure TF_Duplicp.Marcar1Click(Sender: TObject);
var
 x : Integer;
begin
//  F_Situacao.ShowModal;
  for x := 1 to (dm.ArqAux_Pessoal.RecordCount) do
  begin
    F_Duplicp.StringGrid1.Cells[0,x]  := 'X';
    if F_Duplicp.Label9.Caption = 'Sim' then F_DuplicP.StringGrid1.Cells[13,x] := F_Duplicp.Label8.Caption;
  end;
end;

procedure TF_Duplicp.DesmarcarTodos1Click(Sender: TObject);
var
  x : Integer;
begin
  for x := 1 to (dm.ArqAux_Pessoal.RecordCount) do
  begin
    F_Duplicp.StringGrid1.Cells[0,x]  := ' ';
  end;
end;

Procedure Marca;
begin
  //F_Situacao.ShowModal;
  F_DuplicP.StringGrid1.Cells[0,F_DuplicP.StringGrid1.Row] := 'X';
  if F_Duplicp.Label9.Caption = 'Sim' then F_DuplicP.StringGrid1.Cells[13,F_DuplicP.StringGrid1.Row] := F_Duplicp.Label8.Caption;
  F_Duplicp.Label8.Caption := 'Situação';
  F_Duplicp.Label9.Caption := 'Alterar Situação';
end;

Procedure Desmarca;
begin
  F_DuplicP.StringGrid1.Cells[0,F_DuplicP.StringGrid1.Row] := ' ';
end;

procedure TF_Duplicp.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 77 then Marca;
  if key = 68 then Desmarca;
  if key = 13 then BitBtn1.SetFocus;
end;

procedure TF_Duplicp.MarcarSelecionado1Click(Sender: TObject);
begin
  Marca;
end;

procedure TF_Duplicp.DesmarcarSelecionado1Click(Sender: TObject);
begin
  Desmarca;
end;

end.
