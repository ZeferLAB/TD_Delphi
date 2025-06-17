unit U_ImgLivros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, AxCtrls, OleCtrls, ImgeditLibCtl_TLB,
  Menus, DbOleCtl, jpeg, Grids, DBGrids, ComCtrls, TWNPRO4Lib_TLB,
  ImagXpr7_TLB, Db, DBTables;

type
  TF_ImgLivros = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel2: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    MaskEdit2: TMaskEdit;
    Panel2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    StatusBar1: TStatusBar;
    Edit1: TEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    OpenDialog1: TOpenDialog;
    Xpress1: TImagXpress;
    TwainPRO1: TTwainPRO;
    Xpress2: TImagXpress;
    Label5: TLabel;
    Panel3: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    StatusBar2: TStatusBar;
    Edit2: TEdit;
    BitBtn11: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    qry: TQuery;
    Ds_qry: TDataSource;
    qrymatric: TIntegerField;
    qrynome: TStringField;
    qrytip_doc1: TStringField;
    qrydoc1: TStringField;
    qrysituacao: TStringField;
    qrydata_p: TDateField;
    DBGrid3: TDBGrid;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure ImgEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ImgEdit1DblClick(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Contar(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Xpress1DblClick(Sender: TObject);
    procedure Xpress1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    procedure CarregaPessoal;
    { Private declarations }
  public
    sLivro: String;
    { Public declarations }
  end;

var
  F_ImgLivros: TF_ImgLivros;
  cam1, img, arq, sub, f_ini : string;
  bInclusao: boolean;
implementation

uses Menu, FuncGeral, DMTD, U_Ampliar;

{$R *.DFM}

procedure TF_ImgLivros.BitBtn8Click(Sender: TObject);
begin
  close;
end;

procedure TF_ImgLivros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  label2.caption := '000';
  label4.caption := '000';
  Bitbtn2.enabled := False;
  Bitbtn3.enabled := False;
  //Bitbtn4.enabled := False;
  Bitbtn7.enabled := False;
  Xpress1.FileName := '';
  Xpress1.Paint;
end;

procedure TF_ImgLivros.Contar(Sender: TObject);
begin
  Dm.Join.FindLast;
  Label4.Caption := StrZero(Dm.Join.FieldByName('folha').AsString,3);
  Label4.Update;
end;

procedure TF_ImgLivros.BitBtn1Click(Sender: TObject);
begin
  Dm.Join.Close;
  Dm.Join.SQL.Clear;
  Dm.Join.SQL.Add('select * from livro where');
  Dm.Join.SQL.Add('tipo = ' + QuotedStr(ComboBox1.Text));
  if (MaskEdit1.Text <> '') and (ValidNumero(MaskEdit1.Text)) then
    Dm.Join.SQL.Add('and folha = ' + QuotedStr(MaskEdit1.Text));
  if ValidNumero(MaskEdit2.Text) and (Label1.Caption = 'Matrículas') then
    Dm.Join.SQL.Add('and ordem = ' + QuotedStr(MaskEdit2.Text));
  Dm.Join.SQL.Add('order by folha, ordem, imagem');
  Dm.Join.Open;
  if (Dm.Join.RecordCount <> 0) then
  begin
    f_ini := '0';

    Contar(Self);

    Dm.Join.FindFirst;
    f_ini := Dm.Join.FieldByName('folha').AsString;

    cam1  := F_Menu.Label17.Caption + 'livros\' + ComboBox1.Text + '\';

    if copy(cam1, length(cam1),1) <> '\' then
      cam1 := cam1 + '\';

    img := cam1 + Dm.Join.FieldByName('imagem').AsString;

    if not fileexists(img) then
    begin
      showmessage('Imagem não localizada ' + img);
      maskedit1.setfocus;
      exit;
    end;
    Xpress1.FileName := img;
    Xpress1.Paint;
    XPress1.Zoom(0.8);

    CarregaPessoal;

    //ImgEdit1.Image := img;
    //ImgEdit1.Display;
    //ImgEdit1.FitTo(1, True);

    Label2.Caption := '001';
    Label2.Update;

    //ImgEdit1.Enabled := True;
    DBGrid1.Enabled  := True;
    BitBtn2.Enabled  := True;
    BitBtn3.Enabled  := True;
    //BitBtn4.Enabled  := True;
    BitBtn7.Enabled  := True;
  end;
end;

procedure TF_ImgLivros.BitBtn7Click(Sender: TObject);
begin
  Dm.Join.Close;

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select registro as matric, nome, tip_doc1, doc1, descricao as situacao, data_p from td_cert tc');
  qry.SQL.Add('join cad_sit st on (tc.situacao = st.codigo)');
  qry.SQL.Add('where tc.recno = "0"');
  qry.Open;

  Label2.Caption  := '000';
  Label4.Caption  := '000';
  BitBtn2.Enabled := False;
  BitBtn3.Enabled := False;
  //BitBtn4.Enabled := False;
  BitBtn7.Enabled := False;
  DBGrid1.Enabled := False;
  MaskEdit1.Clear;
  MaskEdit2.Clear;
  ComboBox1.ItemIndex := -1;
  //ImgEdit1.ClearDisplay;
  //ImgEdit1.Enabled    := False;

  Xpress1.FileName := '';
  Xpress1.Paint;

  ComboBox1.SetFocus;
end;

procedure TF_ImgLivros.ImgEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if Key = 107 then XPress1.Zoom((0.5) + 0.1);
    if Key = 109 then XPress1.Zoom((0.5) - 0.1);
  except;
  end;
end;

procedure TF_ImgLivros.BitBtn4Click(Sender: TObject);
begin
  {Application.CreateForm(TF_Imprimir, F_Imprimir);
  F_Imprimir.ini   := f_ini;
  F_Imprimir.atual := IntToStr(StrToInt(Label2.Caption));
  F_Imprimir.ult   := IntToStr(StrToInt(Label4.Caption));
  F_Imprimir.ShowModal;
  F_Imprimir.Destroy;
  F_Imprimir := nil;}
end;

procedure TF_ImgLivros.FormActivate(Sender: TObject);
begin
  Dm.ArqAux1.Close;
  Dm.ArqAux1.SQL.Clear;
  Dm.ArqAux1.SQL.Add('select tipo from livro');
  Dm.ArqAux1.SQL.Add('group by tipo');
  Dm.ArqAux1.SQL.Add('order by tipo');
  Dm.ArqAux1.Open;
  if (Dm.ArqAux1.RecordCount <> 0) then
  begin
    while not (Dm.ArqAux1.Eof) do
    begin
      ComboBox1.Items.Add(Dm.ArqAux1.FieldByName('tipo').AsString);
      Dm.ArqAux1.Next;
    end;
  end;
end;

procedure TF_ImgLivros.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then MaskEdit1.SetFocus;
end;

procedure TF_ImgLivros.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then MaskEdit2.SetFocus;
end;

procedure TF_ImgLivros.DBGrid1CellClick(Column: TColumn);
begin
  cam1 := F_Menu.Label17.Caption + 'livros\' + ComboBox1.Text + '\';

  if copy(cam1, length(cam1),1) <> '\' then
    cam1 := cam1 + '\';

  img := cam1 + Dm.Join.FieldByName('imagem').AsString;
  Label2.Caption := StrZero(Dm.Join.FieldByName('folha').AsString,3);
  Label2.Refresh;

  //ImgEdit1.Image := img;
  //ImgEdit1.Display;
  //ImgEdit1.FitTo(1, True);

  Xpress1.FileName := img;
  Xpress1.Paint;
  XPress1.Zoom(0.8);
end;

procedure TF_ImgLivros.BitBtn2Click(Sender: TObject);
begin
  Dm.Join.Next;

  cam1 := F_Menu.Label17.Caption + 'livros\' + ComboBox1.Text + '\';

  if copy(cam1, length(cam1),1) <> '\' then
    cam1 := cam1 + '\';

  img := cam1 + Dm.Join.FieldByName('imagem').AsString;
  Label2.Caption := StrZero(Dm.Join.FieldByName('folha').AsString,3);
  Label2.Refresh;

  //ImgEdit1.Image := img;
  //ImgEdit1.Display;
  //ImgEdit1.FitTo(1, True);

  Xpress1.FileName := img;
  Xpress1.Paint;
  XPress1.Zoom(0.8);

  CarregaPessoal;

end;

procedure TF_ImgLivros.BitBtn3Click(Sender: TObject);
begin
  Dm.Join.Prior;

  cam1 := F_Menu.Label17.Caption + 'livros\' + ComboBox1.Text + '\';

  if copy(cam1, length(cam1),1) <> '\' then
    cam1 := cam1 + '\';

  img := cam1 + Dm.Join.FieldByName('imagem').AsString;
  Label2.Caption := StrZero(Dm.Join.FieldByName('folha').AsString,3);
  Label2.Refresh;

  //ImgEdit1.Image := img;
  //ImgEdit1.Display;
  //ImgEdit1.FitTo(1, True);

  Xpress1.FileName := img;
  Xpress1.Paint;
  XPress1.Zoom(0.8);

  CarregaPessoal;  
end;

procedure TF_ImgLivros.ImgEdit1DblClick(Sender: TObject);
begin
  Application.CreateForm(TF_Ampliar, F_Ampliar);
  F_Ampliar.ImgEdit1.image := img;
  F_Ampliar.ShowModal;
  F_Ampliar.Destroy;
end;

procedure TF_ImgLivros.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then BitBtn1.SetFocus;
end;

procedure TF_ImgLivros.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  cam1 := F_Menu.Label17.Caption + 'livros\' + ComboBox1.Text + '\';

  if copy(cam1, length(cam1),1) <> '\' then
    cam1 := cam1 + '\';

  img := cam1 + Dm.Join.FieldByName('imagem').AsString;
  Label2.Caption := StrZero(Dm.Join.FieldByName('folha').AsString,3);
  Label2.Refresh;

  Xpress1.FileName := img;
  Xpress1.Paint;
  XPress1.Zoom(0.8);

  CarregaPessoal;
end;

procedure TF_ImgLivros.BitBtn10Click(Sender: TObject);
begin
  Panel3.Visible:= False;
  bInclusao:= False;
end;

procedure TF_ImgLivros.BitBtn12Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  Edit1.Text:= OpenDialog1.FileName;
end;

procedure TF_ImgLivros.BitBtn9Click(Sender: TObject);
var
  sOrigem,
  sDestino,
  sArquivo: String;
  TamanhoStr: Integer;
begin
  sOrigem := Edit1.Text;
  sDestino:= cam1;
  TamanhoStr:= (length(Dm.Join.FieldByName('imagem').AsString)) - (length(ExtractFileExt(Dm.Join.FieldByName('imagem').AsString)));
  sArquivo:= Copy(Dm.Join.FieldByName('imagem').AsString, 1, TamanhoStr);

  if (Not(bInclusao)) Then
  Begin
    if Application.MessageBox('Deseja realmente atualizar o registro?', 'Imagens dos Livros', MB_ICONQUESTION + MB_YESNO) = ID_Yes then
    begin

      if CopyFile(PChar(Edit1.Text), PChar(sDestino + sArquivo + '.Tiff'), False) then
      begin

        ShowMessage('Arquivo copiado com sucesso!');

        dm.qryGenerico.Close;
        dm.qryGenerico.SQL.Clear;
        dm.qryGenerico.SQL.Add('UPDATE livro SET imagem_alterada = "S", usuario = '+QuotedStr(F_Menu.Label1.Caption)+', dt_status = '+QuotedStr(FormatDateTime('yyyy-mm-dd', Now))+' WHERE id = '+QuotedStr(Dm.Join.FieldByName('id').AsString)+' ');
        dm.qryGenerico.ExecSQL;

      End
      else
      Begin
        ShowMessage('Problema ao copiar o arquivo!');
      End;
    End;
    Xpress1.FileName := img;
    Xpress1.Paint;
  End
  Else
  Begin
    if Application.MessageBox('Deseja realmente incluir o registro?', 'Imagens dos Livros', MB_ICONQUESTION + MB_YESNO) = ID_Yes then
    begin

      dm.qryGenerico.Close;
      dm.qryGenerico.SQL.Clear;
      dm.qryGenerico.SQL.Add('select count(imagem) as imagem from livro where folha = '+QuotedStr(MaskEdit1.Text)+' ');
      dm.qryGenerico.SQL.Add('and tipo = '+QuotedStr(ComboBox1.Text)+' and ordem = '+QuotedStr(MaskEdit2.Text)+' ');
      dm.qryGenerico.Open;

      if dm.qryGenerico.FieldByName('imagem').AsInteger > 1 Then
      Begin
        if Application.MessageBox('Já existem páginas com este número de folha. Deseja prosseguir?', PChar('Imagens dos Livros'), MB_ICONQUESTION + MB_YESNO) = ID_no then
        begin
          Abort;
        end;
      End;

      dm.qryGenerico.Close;
      dm.qryGenerico.SQL.Clear;
      dm.qryGenerico.SQL.Add('select count(imagem) + 1 as imagem from livro');
      dm.qryGenerico.Open;

      sArquivo:= Strzero(dm.qryGenerico.FieldByName('imagem').AsString, 4) + '.Tiff';

      dm.qryGenerico.Close;
      dm.qryGenerico.SQL.Clear;
      dm.qryGenerico.SQL.Add('insert into livro(folha, tipo, ordem, imagem, imagem_alterada, dt_status)');
      dm.qryGenerico.SQL.Add('values('+QuotedStr(MaskEdit1.Text)+', '+QuotedStr(ComboBox1.Text)+', ');
      dm.qryGenerico.SQL.Add(QuotedStr(MaskEdit2.Text)+', '+QuotedStr(sArquivo)+', ');
      dm.qryGenerico.SQL.Add('"S", '+QuotedStr(FormatDateTime('yyyy-mm-dd', Now))+')');
      dm.qryGenerico.ExecSQL;

      if CopyFile(PChar(Edit1.Text), PChar(sDestino + sArquivo), False) then
      begin

        ShowMessage('Arquivo incluído com sucesso!');

        dm.qryGenerico.Close;
        dm.qryGenerico.SQL.Clear;
        dm.qryGenerico.SQL.Add('UPDATE livro SET imagem_alterada = "S", usuario = '+QuotedStr(F_Menu.Label1.Caption)+', dt_status = '+QuotedStr(FormatDateTime('yyyy-mm-dd', Now))+' ');
        dm.qryGenerico.SQL.Add('WHERE folha = '+QuotedStr(MaskEdit1.Text)+' and tipo = '+QuotedStr(ComboBox1.Text)+' and ordem = '+QuotedStr(ComboBox1.Text)+'');

        dm.qryGenerico.ExecSQL;

      End
      else
      Begin
        ShowMessage('Problema ao incluir o arquivo!');
      End;
    End;
    Xpress1.FileName := img;
    Xpress1.Paint;
  End;


end;

procedure TF_ImgLivros.Xpress1DblClick(Sender: TObject);
begin
  Application.CreateForm(TF_Ampliar, F_Ampliar);
  F_Ampliar.ImgEdit1.image := Xpress1.FileName;
  F_Ampliar.ShowModal;
  F_Ampliar.Destroy;

end;

procedure TF_ImgLivros.Xpress1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if Key = 107 then XPress1.Zoom((0.5) + 0.1);
    if Key = 109 then XPress1.Zoom((0.5) - 0.1);
  except;
  end;
end;

procedure TF_ImgLivros.BitBtn5Click(Sender: TObject);
begin
  bInclusao:= True;
  Panel3.Visible:= True;
end;

procedure TF_ImgLivros.BitBtn6Click(Sender: TObject);
begin
  bInclusao:= False;
  Panel3.Visible:= True;
end;

procedure TF_ImgLivros.CarregaPessoal;
begin
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select registro as matric, nome, tip_doc1, doc1, descricao as situacao, data_p from td_cert tc');
  qry.SQL.Add('join cad_sit st on (tc.situacao = st.codigo)');
  qry.SQL.Add('where livro = ' + QuotedStr(dm.Join.FieldByName('tipo').AsString));
  qry.SQL.Add('and registro  = ' + QuotedStr(dm.Join.FieldByName('ordem').AsString));
  qry.Open;
end;

end.
