unit Anot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TF_Anot = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Panel2: TPanel;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    MaskEdit3: TMaskEdit;
    Bevel1: TBevel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure Limpa_Tela(Sender : TOBject);      
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Anot: TF_Anot;

implementation

uses DMTD, Menu;

{$R *.DFM}

Procedure TF_Anot.Limpa_Tela(Sender : TOBject);
begin
  Label7.Caption    := '';
  Label8.Caption    := '';
  Label9.caption    := '';
  Label10.Caption   := '';
  MaskEdit1.Enabled := True;
  MaskEdit1.Text    := '';
end;

procedure TF_Anot.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Anot.BitBtn3Click(Sender: TObject);
begin
  Limpa_Tela(F_Anot);
  MaskEdit1.SetFocus;
  if (Label13.Caption = 'PESQ') then Close;
end;

procedure TF_Anot.BitBtn2Click(Sender: TObject);
var
  prot : String;
begin
  if (Trim(MaskEdit1.Text) = '') then
  begin
    MaskEdit1.SetFocus;
    exit;
  end;
  Dm.ArqAux.Close;
  Dm.ArqAux.Sql.Clear;
  Dm.ArqAux.Sql.Add('SELECT * FROM td');
  Dm.ArqAux.Sql.Add('WHERE');
  Dm.ArqAux.Sql.Add('protocolo = ' + Trim(MaskEdit1.Text));
  Dm.ArqAux.Open;
  if (Dm.ArqAux.RecordCount = 0) then
  begin
    Dm.ArqAux.Close;
    MessageBox(Handle, PChar('Protocolo oficial não encontrado !'), 'PESQUISA', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
    MaskEdit1.SetFocus;
    Exit;
  end;
  MaskEdit1.Enabled := False;
  Label12.Caption   := Dm.ArqAux.FieldByName('tabela').asString;
  MaskEdit2.Text    := Dm.ArqAux.FieldByName('anotacao').asString;
  MaskEdit3.Text    := Dm.ArqAux.FieldByName('data_anot').asString;
  Label7.Caption    := Dm.ArqAux.FieldByName('p_auxiliar').asstring + ' do dia ' + Dm.ArqAux.FieldByName('data_r').asString;
  Label8.Caption    := Dm.ArqAux.FieldByName('a_nome').asstring;
  Label9.Caption    := Dm.ArqAux.FieldByName('natureza').asstring + ' - ' + Dm.ArqAux.FieldByName('ext_nat').asString;
  Label10.Caption   := Dm.ArqAux.FieldByName('data_p').asstring;
  if Dm.ArqAux.FieldByName('pos_cert').asstring = 'P' then
    radiobutton1.checked := True
  else
  begin
    if Dm.ArqAux.FieldByName('pos_cert').asstring = 'N' then
     radiobutton2.checked := True
    else radiobutton2.checked := False;
  end;
  Dm.ArqAux.Close;
  if (Label13.Caption = 'PESQ') then Panel2.Enabled := False else MaskEdit2.SetFocus;
end;

procedure TF_Anot.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key =13 then bitbtn2.setfocus;
  if key = 27 then close;
end;

procedure TF_Anot.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then maskedit3.setfocus;
  if key = 27 then F_Anot.BitBtn3Click(F_Anot);
end;

procedure TF_Anot.BitBtn1Click(Sender: TObject);
begin
  if (Radiobutton1.Checked) OR (RadioButton2.Checked) OR (Trim(Label12.Caption) <> '03') then
  begin
    if (Trim(MaskEdit2.Text) <> '') then
    begin
      if (MessageBox(Handle, PChar('Gravar esta anotação à margem do protocolo nº ' + Trim(MaskEdit1.Text) + ' ?'), 'ANOTAÇÕES', MB_YESNO	+ MB_ICONQUESTION) = IDYes) then
      begin
        // Gravando no td
        Dm.ArqAux.Close;
        Dm.ArqAux.Sql.Clear;
        Dm.ArqAux.Sql.Add('UPDATE td SET');
        Dm.ArqAux.Sql.Add('anotacao  = ' + Chr(39) + Trim(MaskEdit2.Text) + Chr(39) + ',');
        if (ValidData(MaskEdit3.Text)) then Dm.ArqAux.Sql.Add('data_anot = ' + Chr(39) + ConvData(MaskEdit3.Text) + Chr(39) + ',');
        if (RadioButton1.Checked) then Dm.ArqAux.Sql.Add('pos_cert = "P"');
        if (RadioButton2.Checked) then Dm.ArqAux.Sql.Add('pos_cert = "N"');
        Dm.ArqAux.Sql.Add('WHERE');
        Dm.ArqAux.Sql.Add('protocolo = ' + Trim(MaskEdit1.Text));
        try
          Dm.ArqAux.ExecSql;
          // Gravando no td_cert
          Dm.ArqAux.Close;
          Dm.ArqAux.Sql.Clear;
          Dm.ArqAux.Sql.Add('UPDATE td_cert SET');
          Dm.ArqAux.Sql.Add('anotacao  = ' + Chr(39) + Trim(MaskEdit2.Text) + Chr(39) + ',');
          if (ValidData(MaskEdit3.Text)) then Dm.ArqAux.Sql.Add('data_anot = ' + Chr(39) + ConvData(MaskEdit3.Text) + Chr(39) + ',');
          if (RadioButton1.Checked) then Dm.ArqAux.Sql.Add('pos_cert = "P"');
          if (RadioButton2.Checked) then Dm.ArqAux.Sql.Add('pos_cert = "N"');
          Dm.ArqAux.Sql.Add('WHERE');
          Dm.ArqAux.Sql.Add('protocolo = ' + Trim(MaskEdit1.Text));
          Dm.ArqAux.ExecSql;
          if (Label13.Caption = 'PESQ') then
          begin
            BitBtn3.Enabled := True;          
            Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Gravada anotação à margem (' + Trim(MaskEdit2.Text) + ' NA DATA DE ' + Trim(MaskEdit3.Text) + ') no protocolo oficial nº ' + Trim(MaskEdit1.Text) + '(TELA DE PESQUISA)', MaskEdit1.Text);
          end
          else Atualiza_His(DateToStr(Date), TimeToStr(Time), 'T', F_Menu.Label1.Caption, 'Gravada anotação à margem (' + Trim(MaskEdit2.Text) + ' NA DATA DE ' + Trim(MaskEdit3.Text) + ') no protocolo oficial nº ' + Trim(MaskEdit1.Text) + '(MENU)', MaskEdit1.Text);
          Showmessage('Gravação Ok !');
        except
          Showmessage('Problemas para efetuar a gravação !');
        end;
        if (Label14.Caption = 'LOCAL') then F_Anot.BitBtn3Click(F_Anot) else F_Anot.BitBtn4Click(F_Anot);
      end;
    end;  
  end
  else MessageBox(Handle, PChar('Obrigatório o lançamento de opção negativa/positiva.'), 'PESQUISA', MB_OK + MB_ICONWARNING + MB_ICONWARNING);
end;

procedure TF_Anot.FormActivate(Sender: TObject);
begin
  if (MaskEdit1.Text <> '') then
  begin
    BitBtn2.Enabled     := False;
    BitBtn3.Enabled     := False;
    F_Anot.BitBtn2Click(F_Anot);
  end
  else
  begin
    Limpa_Tela(F_Anot);
    MaskEdit1.SetFocus;
  end;  
end;

procedure TF_Anot.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then bitbtn1.setfocus;
  if key = 27 then maskedit2.setfocus;
end;

end.
