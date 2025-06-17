unit Confirma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Db, jpeg;

type
  TF_Con = class(TForm)
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    BitBtn5: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit3: TMaskEdit;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    ControlBar1: TControlBar;
    Label34: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Con: TF_Con;
  dia, mes, ano,workdir : String;

implementation

uses Func, DMTD;

{$R *.DFM}
Function Adapta(Valor : STring) : String;
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
Function Adapta2(Valor : STring) : String;
var
  w : Integer;
begin
  result := '';
  for w := 1 to length(valor) do
  begin
    if (copy(valor,w,1) <> ',') and (copy(valor,w,1) <> '.') and (copy(valor,w,1) <> '-') then result := result + copy(valor,w,1);
  end;
  result := '00000000000' + result;
  result := copy(result, length(result) - 10, 11);
end;
procedure TF_Con.BitBtn1Click(Sender: TObject);
var
  data_not, cod_ir, seqq, prot, prott, valparc, seq, q_lin, portador, linha, branco,cus,cod_oc,data_oc : String;
  q_linhas,y,q_l : Integer;
  sair : Boolean;
  custas: string;
begin
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT custas, p_auxiliar, protocolo, data_p FROM td WHERE arquivo = '+ Chr(39) + copy(combobox1.text,14,11)+Chr(39)+ 'order by p_auxiliar');
  Dm.ArqAux.Open;

 // custas := adapta(currtostr(Dm.ArqAux.FieldByName('custas').ascurrency));
  custas := Dm.ArqAux.FieldByName('custas').asstring;

  branco := '                                                                                                       ';
  linha := '';
  Label4.visible := true;
//  Label4.Caption := copy(combobox1.text,14,3)+ copy(maskedit1.text,1,2) + copy(maskedit1.text,4,2) + 'C.TXT';
  Label4.Caption := copy(combobox1.text,14,7)+ 'C.TXT';
  if messagedlg('Iniciar Processo ?', mtconfirmation, [mbYes, mbNo], 0) = mrNo then
   begin
    exit;
   end;
  Screen.cursor := crhourglass;

  F_Con.memo1.clear;
  F_con.memo1.Lines.LoadFromFile(combobox1.text);
  q_linhas := memo1.lines.count - 1;
//  statusbar1.simpletext := 'Gerando Arquivo Confirmação...';
//  statusbar1.update;


  q_l := 0;

  // header
   if copy(memo1.lines.strings[0],1,1) = '0' then
//   memo1.lines.strings[0] := (copy(memo1.lines.strings[0],1,81) + copy(branco,1,85)+'2º CARTORIO DE TITULOS E DOCUMENTOS DE SANTO ANDRE '+copy(branco,1,100)+copy(branco,1,100)+copy(branco,1,100)+copy(branco,1,100)+copy(branco,1,100)+copy(branco,1,100)+copy(branco,1,68)+'AUXILIAR'+'  REGISTRO');
    memo1.lines.strings[0] := '2º CARTORIO DE TITULOS E DOCUMENTOS DE SANTO ANDRE ';
    q_l := q_l + 1;
    y := 1;
  while (not Dm.ArqAux.Eof) do
   begin
     for y := 1 to (q_linhas - 1) do
      begin
       if copy(memo1.lines.strings[y],1,1) = '2' then
        begin
         q_l := q_l + 1;
        // memo1.lines.strings[y] := (copy(memo1.lines.strings[y],1,878) + ' '+custas);
       // memo1.lines.strings[y] := (copy(memo1.lines.strings[y],1,878) + ' '+Dm.ArqAux.FieldByName('custas').asstring + ' '+Dm.ArqAux.FieldByName('p_auxiliar').asstring +'    '+Dm.ArqAux.FieldByName('registro').asstring );
         memo1.lines.strings[y] :=(copy(memo1.lines.strings[y],200,19) + '  '+
                                   copy(memo1.lines.Strings[y],837,4) + '  '+
                                   Dm.ArqAux.FieldByName('data_p').asstring + '  '+
                                   Dm.ArqAux.FieldByName('protocolo').asstring + '  '+
                                   Dm.ArqAux.FieldByName('custas').asstring+ '  '+
                                   Copy(memo1.lines.Strings[y], 15, 50));
        end;
        Dm.ArqAux.Next;
      end;
    end;
  // trailler
   if copy(memo1.lines.strings[q_linhas-1],1,1) = '9' then
    memo1.lines.strings[q_linhas-1] := ''; 

 // gravação
    F_Con.savedialog1.filename := copy(combobox1.text,14,7)+ 'C.TXT';


   if f_con.savedialog1.execute then memo1.lines.SaveToFile(F_Con.savedialog1.filename);


//   statusbar1.simpletext := 'Fim da Geração !';
//   statusbar1.update;
   Screen.cursor := crdefault;
   bitbtn3.setfocus;
end;

procedure TF_Con.BitBtn2Click(Sender: TObject);
begin
  Label4.Visible        := False;
  Label4.Caption        := '';
  MaskEdit1.Text        := '';
  MaskEdit3.Text        := '';
  Combobox1.Text        := '';
//  statusbar1.simpletext := '';
  MaskEdit1.SetFocus;
end;

procedure TF_Con.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit3.setfocus;
  if key = 27 then close;
end;

procedure TF_Con.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit3.setfocus;
  if key = 27 then maskedit1.setfocus;
end;

procedure TF_Con.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn5.setfocus;
  if key = 27 then maskedit1.setfocus;
end;

procedure TF_Con.BitBtn3Click(Sender: TObject);
begin
  close;
end;


procedure TF_Con.BitBtn5Click(Sender: TObject);
begin
  Opendialog1.InitialDir := workdir;
  if not Opendialog1.Execute then exit;
  ComboBox1.text := OpenDialog1.FileName;
  BitBtn1.setfocus;
  chdir(workdir); 
end;

procedure TF_Con.FormCreate(Sender: TObject);
begin
  getdir(0, workdir);
end;

procedure TF_Con.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  chdir(workdir);
end;

procedure TF_Con.FormActivate(Sender: TObject);
begin
  F_Con.MaskEdit1.SetFocus;
  F_Con.MaskEdit1.text  := datetostr(date);
  F_Con.MaskEdit3.text  := datetostr(date);
  F_Con.ComboBox1.text  := '';
  Label4.Visible        := False;
  Label4.Caption        := '';
//  statusbar1.simpletext := '';
end;

end.


