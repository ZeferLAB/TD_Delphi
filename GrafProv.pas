unit GrafProv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, Buttons, TeEngine, Series, TeeProcs, Chart,
  Grids, DBGrids;

type
  TF_GrafProv = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label22: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    GroupBox2: TGroupBox;
    Chart1: TChart;
    Series1: TPieSeries;
    GroupBox3: TGroupBox;
    Chart2: TChart;
    Series2: TBarSeries;
    ListBox1: TListBox;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    function RetNumDias(sitNot, data_p, tipo: String; data_prov: TDateTime): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  function RightCopy(doc : string ; n : integer): String;

var
  F_GrafProv: TF_GrafProv;
  Positivas, Negativas, Andamento, Total, Total_Pos_Neg : Real;
  arq: String;

implementation

uses Menu, DMTD, qkGraf, qkEstatBx, FuncGeral, ProcGeral;

{$R *.DFM}

procedure Insert_td_not_1;
begin
  Dm.td_not.Close;
  Dm.td_not.Sql.Clear;
  Dm.td_not.Sql.Add('INSERT INTO td_not (recno, data_p, p_auxiliar, protocolo, natureza, sit_not, cod_ir, a_nome, cod_port)');
  Dm.td_not.Sql.Add('VALUES (NULL, '+Chr(39)+ConvData(Dm.ArqAux1.FieldByName('data_p').AsString)+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('p_auxiliar').AsString+Chr(39)+', '+Chr(39)+Dm.ArqAux1.FieldByName('protocolo').AsString+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('natureza').AsString+Chr(39)+', '  +Chr(39)+Dm.ArqAux1.FieldByName('sit_prov1').AsString+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('cod_prov1').AsString+Chr(39)+', '   +Chr(39)+Dm.ArqAux1.FieldByName('a_nome').AsString+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('cod_port').AsString+Chr(39)+')');
  Dm.td_not.ExecSQL;
end;

procedure Insert_td_not_2;
begin
  Dm.td_not.Close;
  Dm.td_not.Sql.Clear;
  Dm.td_not.Sql.Add('INSERT INTO td_not (recno, data_p, p_auxiliar, protocolo, natureza, sit_not, cod_ir, a_nome, cod_port)');
  Dm.td_not.Sql.Add('VALUES (NULL, '+Chr(39)+ConvData(Dm.ArqAux1.FieldByName('data_p').AsString)+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('p_auxiliar').AsString+Chr(39)+', '+Chr(39)+Dm.ArqAux1.FieldByName('protocolo').AsString+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('natureza').AsString+Chr(39)+', '  +Chr(39)+Dm.ArqAux1.FieldByName('sit_prov2').AsString+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('cod_prov2').AsString+Chr(39)+', '   +Chr(39)+Dm.ArqAux1.FieldByName('a_nome').AsString+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('cod_port').AsString+Chr(39)+')');
  Dm.td_not.ExecSQL;
end;

procedure Insert_td_not_3;
begin
  Dm.td_not.Close;
  Dm.td_not.Sql.Clear;
  Dm.td_not.Sql.Add('INSERT INTO td_not (recno, data_p, p_auxiliar, protocolo, natureza, sit_not, cod_ir, a_nome, cod_port)');
  Dm.td_not.Sql.Add('VALUES (NULL, '+Chr(39)+ConvData(Dm.ArqAux1.FieldByName('data_p').AsString)+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('p_auxiliar').AsString+Chr(39)+', '+Chr(39)+Dm.ArqAux1.FieldByName('protocolo').AsString+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('natureza').AsString+Chr(39)+', '  +Chr(39)+Dm.ArqAux1.FieldByName('sit_prov3').AsString+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('cod_prov3').AsString+Chr(39)+', '   +Chr(39)+Dm.ArqAux1.FieldByName('a_nome').AsString+Chr(39)+', '+
                             Chr(39)+Dm.ArqAux1.FieldByName('cod_port').AsString+Chr(39)+')');
  Dm.td_not.ExecSQL;
end;

function RightCopy(doc : string ; n : integer): String;
begin
  result := copy(doc,Length(doc)+1-n,Length(doc));
end;

procedure TF_GrafProv.BitBtn1Click(Sender: TObject);
var
  x     : integer;
  texto, Ocorrencia : string;
  cor   : Tcolor;
  cor_r : integer;
begin
  // limpa tabela temporária
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('delete from td_not');
  Dm.ArqAux1.ExecSQL;

  // Insere na tabela temporária
  //// POSITIVAS ////
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('select * from td');
  Dm.ArqAux1.Sql.Add('where');
  if checkBox1.Checked = true then
  begin
    Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  end
  else
  begin
    Dm.ArqAux1.Sql.Add('    data_impr >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux1.Sql.Add('AND data_impr <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  end;
  Dm.ArqAux1.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND (protocolo < 77419 or protocolo > 77461)');
  Dm.ArqAux1.Sql.Add('AND (natureza = 197 or natureza = 96)');
  Dm.ArqAux1.Sql.Add('and sit_prov3 =' +Chr(39)+'P'+Chr(39)); // Positivas
  Dm.ArqAux1.Open;
  if (Dm.ArqAux1.RecordCount <> 0) then
  begin
    while not (Dm.ArqAux1.Eof) do
    begin
      Insert_td_not_3;
      Dm.ArqAux1.Next;
    end;
  end;
 // else
  //  begin
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('select * from td');
      Dm.ArqAux1.Sql.Add('where');
       if checkBox1.Checked = true then
        begin
         Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
         Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
        end
        else
         begin
          Dm.ArqAux1.Sql.Add('    data_impr >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
          Dm.ArqAux1.Sql.Add('AND data_impr <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
         end;
      //Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
      //Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
      Dm.ArqAux1.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
      Dm.ArqAux1.Sql.Add('AND (protocolo < 77419 or protocolo > 77461)');
      Dm.ArqAux1.Sql.Add('AND (natureza = 197 or natureza = 96)');
      Dm.ArqAux1.Sql.Add('and sit_prov2 =' +Chr(39)+'P'+Chr(39)); // Positivas
      Dm.ArqAux1.Open;
      if (Dm.ArqAux1.RecordCount <> 0) then
        begin
          while not (Dm.ArqAux1.Eof) do
            begin
              Insert_td_not_2;
              Dm.ArqAux1.Next;
            end;
        end;
   //   else
    //    begin
          Dm.ArqAux1.Close;
          Dm.ArqAux1.Sql.Clear;
          Dm.ArqAux1.Sql.Add('select * from td');
          Dm.ArqAux1.Sql.Add('where');
          if checkBox1.Checked = true then
          begin
           Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
           Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
          end
          else
           begin
           Dm.ArqAux1.Sql.Add('    data_impr >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
           Dm.ArqAux1.Sql.Add('AND data_impr <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
          end;
         // Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
         // Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
          Dm.ArqAux1.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
          Dm.ArqAux1.Sql.Add('AND (protocolo < 77419 or protocolo > 77461)');
          Dm.ArqAux1.Sql.Add('AND (natureza = 197 or natureza = 96)');
          Dm.ArqAux1.Sql.Add('and sit_prov1 =' +Chr(39)+'P'+Chr(39)); // Positivas
          Dm.ArqAux1.Open;
          if (Dm.ArqAux1.RecordCount <> 0) then
            begin
              while not (Dm.ArqAux1.Eof) do
                begin
                  Insert_td_not_1;
                  Dm.ArqAux1.Next;
                end;
            end;
       // end;
   // end;

  //// NEGATIVAS ////
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('select * from td');
  Dm.ArqAux1.Sql.Add('where');
   if checkBox1.Checked = true then
   begin
    Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
   end
    else
     begin
      Dm.ArqAux1.Sql.Add('    data_impr >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
      Dm.ArqAux1.Sql.Add('AND data_impr <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
     end;
 // Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
 // Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND (protocolo < 77419 or protocolo > 77461)');
  Dm.ArqAux1.Sql.Add('AND (natureza = 197 or natureza = 96)');
  Dm.ArqAux1.Sql.Add('and sit_prov3 =' +Chr(39)+'N'+Chr(39)); // Negativas

  Dm.ArqAux1.Sql.SaveToFile('c:\not3.sql');

  Dm.ArqAux1.Open;
  if (Dm.ArqAux1.RecordCount <> 0) then
    begin
      while not (Dm.ArqAux1.Eof) do
        begin
          Dm.td_not.Close;
          Dm.td_not.Sql.Clear;
          Dm.td_not.Sql.Add('select * from td_not');
          Dm.td_not.Sql.Add('where');
          Dm.td_not.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
          Dm.td_not.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
          Dm.td_not.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
          Dm.td_not.Sql.Add('AND (natureza = 197 or natureza = 96)');
          Dm.td_not.Sql.Add('and protocolo = '+Dm.ArqAux1.FieldByName('protocolo').AsString);
          Dm.td_not.Open;
          if (Dm.td_not.RecordCount = 0) then
            begin
              Insert_td_not_3;
            end
          else
            begin
              Dm.td_not.Edit;
              Dm.td_not.FieldByName('sit_not').AsString := Dm.ArqAux1.FieldByName('sit_prov3').AsString;
              Dm.td_not.FieldByName('cod_ir').AsInteger := Dm.ArqAux1.FieldByName('cod_prov3').AsInteger;
              Dm.td_not.Post;
            end;
          Dm.ArqAux1.Next;
        end;
    end;
 // else
//    begin
      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('select * from td');
      Dm.ArqAux1.Sql.Add('where');
      if checkBox1.Checked = true then
      begin
       Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
       Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
      end
      else
       begin
        Dm.ArqAux1.Sql.Add('    data_impr >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
        Dm.ArqAux1.Sql.Add('AND data_impr <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
       end;
     // Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    //  Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
      Dm.ArqAux1.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3)+ Chr(39));
      Dm.ArqAux1.Sql.Add('AND (protocolo < 77419 or protocolo > 77461)');
      Dm.ArqAux1.Sql.Add('AND (natureza = 197 or natureza = 96)');
      Dm.ArqAux1.Sql.Add('and sit_prov2 =' +Chr(39)+'N'+Chr(39)); // Negativas

      Dm.ArqAux1.Sql.SaveToFile('c:\not2.sql');

      Dm.ArqAux1.Open;
      if (Dm.ArqAux1.RecordCount <> 0) then
        begin
          while not (Dm.ArqAux1.Eof) do
            begin
              Dm.td_not.Close;
              Dm.td_not.Sql.Clear;
              Dm.td_not.Sql.Add('select * from td_not');
              Dm.td_not.Sql.Add('where');
              Dm.td_not.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
              Dm.td_not.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
              Dm.td_not.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
              Dm.td_not.Sql.Add('AND (natureza = 197 or natureza = 96)');
              Dm.td_not.Sql.Add('and protocolo = '+Dm.ArqAux1.FieldByName('protocolo').AsString);
              Dm.td_not.Open;
              if (Dm.td_not.RecordCount = 0) then
                begin
                  Insert_td_not_2;
                end
              else
                begin
                  Dm.td_not.Edit;
                  Dm.td_not.FieldByName('sit_not').AsString := Dm.ArqAux1.FieldByName('sit_prov2').AsString;
                  Dm.td_not.FieldByName('cod_ir').AsInteger := Dm.ArqAux1.FieldByName('cod_prov2').AsInteger;
                  Dm.td_not.Post;
                end;

              Dm.ArqAux1.Next;
            end;
        end;
    //  else
    //    begin
          Dm.ArqAux1.Close;
          Dm.ArqAux1.Sql.Clear;
          Dm.ArqAux1.Sql.Add('select * from td');
          Dm.ArqAux1.Sql.Add('where');
           if checkBox1.Checked = true then
           begin
            Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
            Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
           end
            else
             begin
              Dm.ArqAux1.Sql.Add('    data_impr >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
              Dm.ArqAux1.Sql.Add('AND data_impr <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
             end;
          //Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
         // Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
          Dm.ArqAux1.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
          Dm.ArqAux1.Sql.Add('AND (protocolo < 77419 or protocolo > 77461)');
          Dm.ArqAux1.Sql.Add('AND (natureza = 197 or natureza = 96)');
          Dm.ArqAux1.Sql.Add('and sit_prov1 =' +Chr(39)+'N'+Chr(39)); // Negativas

          Dm.ArqAux1.Sql.SaveToFile('c:\not1.sql');

          Dm.ArqAux1.Open;
          if (Dm.ArqAux1.RecordCount <> 0) then
            begin
              while not (Dm.ArqAux1.Eof) do
                begin
                  Dm.td_not.Close;
                  Dm.td_not.Sql.Clear;
                  Dm.td_not.Sql.Add('select * from td_not');
                  Dm.td_not.Sql.Add('where');
                  Dm.td_not.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
                  Dm.td_not.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
                  Dm.td_not.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
                  Dm.td_not.Sql.Add('AND (natureza = 197 or natureza = 96)');
                  Dm.td_not.Sql.Add('and protocolo = '+Dm.ArqAux1.FieldByName('protocolo').AsString);
                  Dm.td_not.Open;
                  if (Dm.td_not.RecordCount = 0) then
                    begin
                      Insert_td_not_1;
                    end
                  else
                    begin
                      Dm.td_not.Edit;
                      Dm.td_not.FieldByName('sit_not').AsString := Dm.ArqAux1.FieldByName('sit_prov1').AsString;
                      Dm.td_not.FieldByName('cod_ir').AsInteger := Dm.ArqAux1.FieldByName('cod_prov1').AsInteger;
                      Dm.td_not.Post;
                    end;

                  Dm.ArqAux1.Next;
                end;
            end;
   //     end;
   //  end;

  // Soma da tabela temporária
  for x := 1 to 4 do
    begin
      if (x = 1) then texto := 'and sit_not =' +Chr(39)+'P'+Chr(39); // Positivas
      if (x = 2) then texto := 'and sit_not =' +Chr(39)+'N'+Chr(39); // Negativas
   //   if (x = 3) then texto := 'and sit_not =' +Chr(39)+''+Chr(39);  // em Andamento
   //   if (x = 4) then texto := ''; // Total

      Dm.ArqAux1.Close;
      Dm.ArqAux1.Sql.Clear;
      Dm.ArqAux1.Sql.Add('select count(*) as SOMA from td_not');
      Dm.ArqAux1.Sql.Add('where');
      Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
      Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
      Dm.ArqAux1.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
      Dm.ArqAux1.Sql.Add('AND (natureza = 197 or natureza = 96)');
      Dm.ArqAux1.Sql.Add(texto);
      Dm.ArqAux1.Open;

      if (x = 1) then // Positivas
        begin
          Positivas := Dm.ArqAux1.FieldByName('SOMA').AsFloat;
          Label4.Caption := FloatToStr(Positivas);
        end;
      if (x = 2) then // Negativas
        begin
          Negativas := Dm.ArqAux1.FieldByName('SOMA').asFloat;
          Label5.Caption := FloatToStr(Negativas);
        end;

      {if (x = 3) then // em Andamento
        begin
          Andamento := Dm.ArqAux1.FieldByName('SOMA').asFloat;
          Label10.Caption := FloatToStr(Andamento);
        end;}
      {if (x = 4) then // Total
        begin
          Total := Dm.ArqAux1.FieldByName('SOMA').asFloat;
          Label13.Caption := FloatToStr(Total);
        end;}
    end;

  //// Total ////
  Dm.ArqAux1.Close;
  Dm.ArqAux1.Sql.Clear;
  Dm.ArqAux1.Sql.Add('select count(*) as SOMA from td');
  Dm.ArqAux1.Sql.Add('where');
  if checkBox1.Checked = true then
   begin
    Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
   end
    else
     begin
      Dm.ArqAux1.Sql.Add('    data_impr >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
      Dm.ArqAux1.Sql.Add('AND data_impr <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
     end;
  //Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
  //Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
  Dm.ArqAux1.Sql.Add('AND (protocolo < 77419 or protocolo > 77461)');
  Dm.ArqAux1.Sql.Add('AND (natureza = 197 or natureza = 96)');
  Dm.ArqAux1.Open;

  Total := Dm.ArqAux1.FieldByName('SOMA').asInteger;
  Total_Pos_Neg := Positivas + Negativas;
  Andamento := Total - Total_Pos_Neg;

  if Positivas <> 0 then
    Label8.Caption  := FormatFloat('#,##0.00', (Positivas / Total_Pos_Neg) * 100 ) + '%'
  else
    Label8.Caption := '00,00%';

  if Negativas <> 0 then
    Label9.Caption  := FormatFloat('#,##0.00', (Negativas / Total_Pos_Neg) * 100 ) + '%'
  else
    Label9.Caption := '00,00%';


  Label10.Caption := FloatToStr(Andamento);
  Label13.Caption := FloatToStr(Total);

  // Gráfico de Notificações Positivas e Negativas
    With Series1 do
      Begin
        Clear ;
        AddPie( Negativas, 'Negativas', clRed ) ;
        AddPie( Positivas, 'Positivas', clBlue ) ;
      end;

    // Gráfico das Ocorrências Negativas
    Dm.ArqAux1.Close;
    Dm.ArqAux1.Sql.Clear;
    Dm.ArqAux1.Sql.Add('select * from td_not');
    Dm.ArqAux1.Sql.Add('where');
    Dm.ArqAux1.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Dm.ArqAux1.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
    Dm.ArqAux1.Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
    Dm.ArqAux1.Sql.Add('AND (natureza = 197 or natureza = 96) AND sit_not =' +Chr(39)+'N'+Chr(39) );
    Dm.ArqAux1.Sql.Add('group by cod_ir order by cod_ir');
    Dm.ArqAux1.Open;

    ListBox1.Clear;  // ----------------------------------------  00,00     000
    ListBox1.Items.Add('Ocorrências Negativas:                   Porcent.   QTD');
  //ListBox1.Items.Add('-------------------------------------------------------');
    ListBox1.Items.Add('_______________________________________________________');

    With Series2 do
      Begin
        Clear;

        while not (Dm.ArqAux1.Eof) do
          begin
            Dm.ArqAux2.Close;
            Dm.ArqAux2.Sql.Clear;
            Dm.ArqAux2.Sql.Add('select count(*) as QtdOcorNeg from td_not');
            Dm.ArqAux2.Sql.Add('where');
            Dm.ArqAux2.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
            Dm.ArqAux2.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
            Dm.ArqAux2.Sql.Add('AND cod_port = ' + Chr(39)+ Copy(ComboBox1.Text,1,3) + Chr(39));
            Dm.ArqAux2.Sql.Add('AND (natureza = 197 or natureza = 96) AND sit_not =' +Chr(39)+'N'+Chr(39) );
            Dm.ArqAux2.Sql.Add('AND cod_ir = ' + Dm.ArqAux1.FieldByName('cod_ir').asString);
            Dm.ArqAux2.Open;
            Ocorrencia := Ver_Ocorrencia(Dm.ArqAux1.FieldByName('cod_ir').asString);

            if (Negativas <> 0) then
              begin
                ListBox1.Items.Add( Copy(Ocorrencia + StringOfChar(' ',40),1,40) + '  '
                                                    + FormatFloat('#,##00.00', (Dm.ArqAux2.FieldByName('QtdOcorNeg').asFloat/Negativas)*100 ) + '     '
                                                    + RightCopy( '   ' + Dm.ArqAux2.FieldByName('QtdOcorNeg').asString,3));
              end;
            Dm.ArqAux1.Next;

            // Insere Barras
            cor_r := cor_r + 1;
            if cor_r =  1 then cor := clRed;
            if cor_r =  2 then cor := clGreen;
            if cor_r =  3 then cor := clYellow;
            if cor_r =  4 then cor := clBlue;
            if cor_r =  5 then cor := clWhite;
            if cor_r =  6 then cor := clGray;
            if cor_r =  7 then cor := clAqua;
            if cor_r =  8 then cor := clNavy;
            if cor_r =  9 then cor_r := 1;
            AddBar(Dm.ArqAux2.FieldByName('QtdOcorNeg').asInteger, Copy(Ocorrencia,1,10) + '.', cor );
          end;
      end;
  BitBtn4.SetFocus;
end;

procedure TF_GrafProv.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    begin
      MaskEdit2.Setfocus;
      MaskEdit2.Text := MaskEdit1.Text;
    end;
end;

procedure TF_GrafProv.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    begin
      Dm.ArqAux.Close;
      Dm.ArqAux.Sql.Clear;
      {Dm.ArqAux.Sql.Add('select * from TD');        Dm.ArqAux.Sql.Add('where');
      Dm.ArqAux.Sql.Add('    data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
      Dm.ArqAux.Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
      Dm.ArqAux.Sql.Add('AND natureza = 197');       Dm.ArqAux.Sql.Add('group by a_nome');}
      Dm.ArqAux.Sql.Add('select td.recno, td.data_p, td.protocolo, td.p_auxiliar, td.cod_port, td.a_nome, clientes.codigo, clientes.cliente');
      Dm.ArqAux.Sql.Add('from td, clientes where (td.cod_port = clientes.codigo)');
      if checkBox1.Checked = true then
       begin
        Dm.ArqAux1.Sql.Add('AND td.data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
        Dm.ArqAux1.Sql.Add('AND td.data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
       end
        else
         begin
          Dm.ArqAux1.Sql.Add('AND td.data_impr >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
          Dm.ArqAux1.Sql.Add('AND td.data_impr <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
         end;
     // Dm.ArqAux.Sql.Add('AND td.data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
     // Dm.ArqAux.Sql.Add('AND td.data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
      Dm.ArqAux.Sql.Add('AND (td.protocolo < 77419 or td.protocolo > 77461)');
      Dm.ArqAux.Sql.Add('AND (td.natureza = 197 or td.natureza = 96)');
      Dm.ArqAux.Sql.Add('group by td.cod_port');
      Dm.ArqAux.Open;
      if Dm.ArqAux.RecordCount = 0 then
        MessageBox(Handle, PChar('Dados Não Encontrados!'), 'PESQUISA', MB_OK + MB_ICONWARNING)
      else
        begin
          ComboBox1.Text := RightCopy('000' + Dm.ArqAux.FieldByname('codigo').AsString,3) +' - '+ Dm.ArqAux.FieldByname('cliente').AsString;
          while not(Dm.ArqAux.Eof) do
            begin
              ComboBox1.Items.Add(RightCopy('000' + Dm.ArqAux.FieldByname('codigo').AsString,3) +' - '+ Dm.ArqAux.FieldByname('cliente').AsString);
              Dm.ArqAux.Next;
            end;
          ComboBox1.Setfocus;
        end;
    end;
end;

procedure TF_GrafProv.BitBtn2Click(Sender: TObject);
begin
  Dm.ArqAux.Close;
  Close;
end;

procedure TF_GrafProv.BitBtn3Click(Sender: TObject);
begin
  MaskEdit1.Text  := '';
  MaskEdit2.Text  := '';
  ComboBox1.Text  := '';
  ComboBox1.Clear;

  Label4.Caption := '00';
  Label5.Caption := '00';
  Label8.Caption := '00,00%';
  Label9.Caption := '00,00%';
  Label10.Caption := '00';
  Label13.Caption := '00';

  Series1.Clear;
  Series2.Clear;

  ListBox1.Clear;

  MaskEdit1.SetFocus;
  Dm.ArqAux.Close;
  Dm.ArqAux1.Close;
end;

procedure TF_GrafProv.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then BitBtn1.Setfocus;
end;

procedure TF_GrafProv.BitBtn4Click(Sender: TObject);
var
  arq1, arq2 : string;
  x : integer;
begin
//Gravar Gráfico
  arq1 := 'c:\tmp_gr1.wmf';
  arq2 := 'c:\tmp_gr2.wmf';
  Chart1.SaveToMetafile(arq1);
  Chart2.SaveToMetafile(arq2);
  Application.CreateForm(Tqk_Graf, qk_Graf);
  qk_Graf.QrLabel1.Caption := F_Menu.Label9.Caption;
  qk_Graf.QrLabel2.Caption := F_Menu.Label11.Caption;
  qk_Graf.QrLabel3.Caption := F_Menu.Label5.Caption;
  qk_Graf.QrLabel4.Caption := F_Menu.Label13.Caption;
  qk_Graf.QrLabel5.Caption := 'Gráficos - Notificações Baixadas Provisoriamente';

  qk_Graf.QrLabel20.Caption := ComboBox1.Text;
  qk_Graf.QrLabel22.Caption := MaskEdit1.Text + '  a  ' + MaskEdit2.Text + '.';

  qk_Graf.QrLabel9.Caption  := FloatToStr(Positivas);
  qk_Graf.QrLabel12.Caption := FloatToStr(Negativas);
  qk_Graf.QrLabel15.Caption := FloatToStr(Andamento);
  qk_Graf.QrLabel17.Caption := FloatToStr(Total);

  qk_Graf.QrLabel11.Caption := Label8.Caption;
  qk_Graf.QrLabel14.Caption := Label9.Caption;

  qk_Graf.QrLabel6.Caption := '';
  for x := 0 to ListBox1.items.Count -1 do
    begin
      qk_Graf.QrLabel6.Caption := qk_Graf.QrLabel6.Caption + ListBox1.Items.Strings[x] + ' ';
    end;

  qk_Graf.QRImage1.Picture.LoadFromFile(arq1);
  qk_Graf.QRImage2.Picture.LoadFromFile(arq2);
  qk_Graf.QuickRep1.Preview;
  qk_Graf.Destroy;
  qk_Graf := NIL;

  if FileExists(arq1) then DeleteFile(arq1);
  if FileExists(arq2) then DeleteFile(arq2);

  BitBtn3.SetFocus;
end;

procedure TF_GrafProv.BitBtn5Click(Sender: TObject);
var
  dias, dia_ant: Integer;
  comMov: Boolean;
  arq2: String;
begin
  if Not ValidData(MaskEdit1.Text) then
  begin
    Application.MessageBox(PChar('Data inválida!'),PChar('Gráficos'),MB_OK + MB_ICONERROR);
    MaskEdit1.SetFocus;
    Exit;
  end;

  if Not ValidData(MaskEdit2.Text) then
  begin
    Application.MessageBox(PChar('Data inválida!'),PChar('Gráficos'),MB_OK + MB_ICONERROR);
    MaskEdit2.SetFocus;
    Exit;
  end;

  if StrToDate(MaskEdit1.Text) > StrToDate(MaskEdit2.Text) then
  begin
    Application.MessageBox(PChar('Período inválido!'),PChar('Gráficos'),MB_OK + MB_ICONERROR);
    MaskEdit1.SetFocus;
    Exit;
  end;

  comMov := False;

  with Dm.ArqAux do
  begin
    // Totais de Positivas no período
    Close;
    Sql.Clear;
    Sql.Add('SELECT data_p, cod_prov1, sit_prov1, data_prov1, ');
    Sql.Add('cod_prov2, sit_prov2, data_prov2, cod_prov3, sit_prov3, data_prov3');
    Sql.Add('FROM td WHERE');
    Sql.Add('natureza IN(96, 197)');
    Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
    Sql.Add('AND (protocolo < 77419 or protocolo > 77461)');
    Sql.Add('AND  data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Sql.Add('AND  data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
    Sql.Add('AND (sit_prov1 = "P" OR sit_prov2 = "P" OR sit_prov3 = "P")');
    Open;

    arq := '';
    arq := TirarTudo(F_Menu.Label1.Caption, ' ', '','') + 'BXNOT';
    CriaTabela('BXNOT', arq);

    while not Eof do
    begin
      dias  := 0;
      comMov := True;

      dias := dias + RetNumDias(FieldByName('sit_prov1').AsString,
                                  FieldByName('data_p').AsString, 'P',
                                  FieldByName('data_prov1').AsDateTime);

      dias := dias + RetNumDias(FieldByName('sit_prov2').AsString,
                                  FieldByName('data_p').AsString, 'P',
                                  FieldByName('data_prov2').AsDateTime);

      dias := dias + RetNumDias(FieldByName('sit_prov3').AsString,
                                  FieldByName('data_p').AsString, 'P',
                                  FieldByName('data_prov3').AsDateTime);
      if dias > 0 then
      begin
        Dm.ArqAux2.Close;
        Dm.ArqAux2.Sql.Clear;
        Dm.ArqAux2.Sql.Add('INSERT INTO ' + arq + ' (dias, ocorrencia) VALUES ("' + IntToStr(dias) + '", "POSITIVA")');
        Dm.ArqAux2.ExecSQL;
      end;

      Next;
    end;

    // Totais de Negativas no período
    Close;
    Sql.Clear;
    Sql.Add('SELECT data_p, cod_prov1, sit_prov1, data_prov1, ');
    Sql.Add('cod_prov2, sit_prov2, data_prov2, cod_prov3, sit_prov3, data_prov3');
    Sql.Add('FROM td WHERE');
    Sql.Add('natureza IN(96, 197)');
    Sql.Add('AND cod_port = ' + Chr(39) + Copy(ComboBox1.Text,1,3) + Chr(39));
    Sql.Add('AND (protocolo < 77419 or protocolo > 77461)');
    Sql.Add('AND data_p >= ' + Chr(39) + ConvData(MaskEdit1.Text) + Chr(39));
    Sql.Add('AND data_p <= ' + Chr(39) + ConvData(MaskEdit2.Text) + Chr(39));
    Sql.Add('AND (sit_prov1 = "N" OR sit_prov2 = "N" OR sit_prov3 = "N")');
    Open;

    while not Eof do
    begin

      comMov := True;

      dias := RetNumDias(FieldByName('sit_prov1').AsString,
                         FieldByName('data_p').AsString, 'N',
                         FieldByName('data_prov1').AsDateTime);
      if dias > 0 then
      begin
        Dm.ArqAux2.Close;
        Dm.ArqAux2.Sql.Clear;
        Dm.ArqAux2.Sql.Add('INSERT INTO ' + arq + ' (dias, ocorrencia) VALUES ("' + IntToStr(dias) + '", "' + Ver_Ocorrencia(FieldByName('cod_prov1').AsString) + '")');
        Dm.ArqAux2.ExecSQL;
      end;

      dias := RetNumDias(FieldByName('sit_prov2').AsString,
                         FieldByName('data_p').AsString, 'N',
                         FieldByName('data_prov2').AsDateTime);
      if dias > 0 then
      begin
        Dm.ArqAux2.Close;
        Dm.ArqAux2.Sql.Clear;
        Dm.ArqAux2.Sql.Add('INSERT INTO ' + arq + ' (dias, ocorrencia) VALUES ("' + IntToStr(dias) + '", "' + Ver_Ocorrencia(FieldByName('cod_prov2').AsString) + '")');
        Dm.ArqAux2.ExecSQL;
      end;

      dias := RetNumDias(FieldByName('sit_prov3').AsString,
                         FieldByName('data_p').AsString, 'N',
                         FieldByName('data_prov3').AsDateTime);
      if dias > 0 then
      begin
        Dm.ArqAux2.Close;
        Dm.ArqAux2.Sql.Clear;
        Dm.ArqAux2.Sql.Add('INSERT INTO ' + arq + ' (dias, ocorrencia) VALUES ("' + IntToStr(dias) + '", "' + Ver_Ocorrencia(FieldByName('cod_prov3').AsString) + '")');
        Dm.ArqAux2.ExecSQL;
      end;

      Next;
    end;

    if comMov then
    begin
      Dm.ArqAux2.Close;
      Dm.ArqAux2.Sql.Clear;
      Dm.ArqAux2.Sql.Add('SELECT dias, COUNT(*) numocor, ocorrencia FROM ' + arq);
      Dm.ArqAux2.Sql.Add('GROUP BY DIAS, ocorrencia');
      Dm.ArqAux2.Open;

      QRDestroi;
      Application.CreateForm(TQk_EstatBx, Qk_EstatBx);
      Qk_EstatBx.QRLabel1.Caption := Maiusculo(F_Menu.Caption);
      Qk_EstatBx.QRLabel2.Caption := F_Menu.Label11.Caption;
      Qk_EstatBx.QRLabel4.Caption := F_Menu.Label5.Caption;
      Qk_EstatBx.QRLabel5.Caption := F_Menu.Label13.Caption;
      Qk_EstatBx.QRLabel6.Caption := 'NOTIFICAÇÕES BAIXADAS PROVISORIAMENTE NO PERÍODO DE ' + MaskEdit1.Text + ' À ' + MaskEdit2.Text;
      Qk_EstatBx.QRLabel7.Caption := 'CLIENTE: ' + Maiusculo(Copy(ComboBox1.Text, 5, Length(ComboBox1.Text) - 3));
      Qk_EstatBx.QuickRep1.Preview;
      Qk_EstatBx.QuickRep1.Destroy;
      Qk_EstatBx.Destroy;
      Qk_EstatBx := Nil;
    end
    else
      Application.MessageBox(PChar('Não foram encontradas notificações no período informado!'),
                  PChar('Nots. Baixadas Provisoriamente'), MB_OK + MB_ICONWARNING);
  end;
end;

procedure TF_GrafProv.CheckBox1Click(Sender: TObject);
begin
  CheckBox2.Checked := not CheckBox1.Checked;
end;

procedure TF_GrafProv.CheckBox2Click(Sender: TObject);
begin
  CheckBox1.Checked := not CheckBox2.Checked;
end;

function TF_GrafProv.RetNumDias(sitNot, data_p, tipo: String; data_prov: TDateTime): Integer;
var
  dias, i: Integer;
  dt_aux: TDateTime;
begin
  dias := 0;
  if (Trim(data_p) <> '') AND (sitNot  = tipo) then
  begin
    dias := DateDiff(StrToDate(data_p), data_prov);
    for i := 1 to dias do
    begin
       dt_aux := StrToDate(data_p) + i;
       Dm.Feriados.Close;
       Dm.Feriados.Sql.Clear;
       Dm.Feriados.Sql.Add('SELECT * FROM feriados');
       Dm.Feriados.Sql.Add('WHERE data = "' + ConvData(DateToStr(dt_aux)) + '"');
       Dm.Feriados.Open;
       if (not Dm.Feriados.Eof) OR (DayOfWeek(dt_aux) IN[1, 7]) then Dec(dias);
    end;
  end;
  Result := dias;
end;

end.
