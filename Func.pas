unit Func;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ValorPor, NcsAlignment, RDprint, Buttons;

type
  TFuncoes = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    RDprint1: TRDprint;
    Alinha: TNcsAlignment;
    RDprint2: TRDprint;
    Extenso: TValorPorExtenso;
    Label4: TLabel;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    RichEdit4: TRichEdit;
    RichEdit5: TRichEdit;
    Procedure ReciboTitulos(Funcoes : TOBject; Visualizar : Boolean;
                                     data, protocolo, apresentante, endereco, natureza, datadev, hora, contato, autenticacao : String;
                                     deposito, emolumento, emoladicional, v_pag, via_excedente, microfilme, digitalizacao,
                                     informatica, graveletronica, conferencia, distribuicao, infodistrib, graveletrdistrib,
                                     nomesexc, tribunal, procuradoria, defensoria, mutua, acoterj, subtotal, total : Currency);

    Procedure ReciboCertidao(Funcoes : TOBject; Visualizar : Boolean;
                                     data, protocolo, apresentante, interessado, telefone, natureza, datadev, hora,
                                     documento, pjuridica, observacao : String;
                                     deposito, emolumento, busca, desarquivamento, informatica, subtotal, tribunal,
                                 defensoria, procuradoria, custas : Currency);
  Procedure FechamentoIndividual(Funcoes : TOBject; Visualizar : Boolean;
                                          data, usuario, dinheiro, cheque, moeda, subtotal, despesas, cheques_can, total, fundo, arisp, observacao : String);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Abre_FeriadosClick(Sender: TObject);
    procedure Fecha_FeriadosClick(Sender: TObject);
  end;

var
  Funcoes: TFuncoes;

implementation

uses Menu, FuncGeral, ProcGeral, DMTD;

{$R *.DFM}

Procedure TFuncoes.ReciboTitulos(Funcoes : TOBject; Visualizar : Boolean;
                                 data, protocolo, apresentante, endereco, natureza, datadev, hora, contato, autenticacao : String;
                                 deposito, emolumento, emoladicional, v_pag, via_excedente, microfilme, digitalizacao,
                                 informatica, graveletronica, conferencia, distribuicao, infodistrib, graveletrdistrib,
                                 nomesexc, tribunal, procuradoria, defensoria, mutua, acoterj, subtotal, total : Currency);
var
  lin, x : Integer;
  alin : TAlignment;
begin

  BuscaPartesRec(protocolo);
  Alinha.Alignment    := taCenter;
  Alinha.Width        := 40;
  lin := 1;
  RdPrint1.OpcoesPreview.Preview := Visualizar;
  RdPrint1.Abrir;
  RichEdit4.Font.Size  := 16;
  RichEdit4.Font.Style := [fsBold];
  RichEdit4.Lines.Clear;
  RichEdit4.Lines.Add(Maiusculo(F_Menu.Caption));
  Alinha.Text := RichEdit4.Lines.Strings[0];
  RdPrint1.ImpF(lin, 01, Alinha.Result, [negrito, normal]);
  lin := lin + 1;
  Alinha.Text := RichEdit4.Lines.Strings[1];
  RdPrint1.ImpF(lin, 01, Alinha.Result, [negrito, normal]);
  Alinha.Width        := 80;
  lin := lin + 1;
  RichEdit1.Font.Size  := 10;
  RichEdit1.Font.Style := [];
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.Add(F_Menu.Label11.Caption);
  RichEdit1.Lines.Add(F_Menu.Label5.Caption + ' - ' + F_Menu.Label13.Caption);
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    Alinha.Text := RichEdit1.Lines.Strings[x];
    RdPrint1.ImpF(lin, 01, Alinha.Result, [normal]);
    lin := lin + 1;
  end;
  RichEdit1.Font.Size  := 10;
  RichEdit1.Font.Style := [];
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.Add(F_Menu.Label22.Caption);
  Alinha.Text := RichEdit1.Lines.Strings[0];
  RdPrint1.ImpF(lin, 01, Alinha.Result, [negrito, normal]);
  lin := lin + 2;
  RdPrint1.ImpF(lin, 10, 'Protocolado em Títulos e Documentos sob o n. ', [normal]);
  RdPrint1.ImpF(lin, 56, Copy(StrBranco(protocolo, 6, 'D'), 1,3) + '.' + Copy(StrBranco(protocolo, 6, 'D'), 4,3), [expandido, negrito]);
  lin := lin + 2;
  RdPrint1.ImpF(lin, 01, 'Natureza......: ' + natureza, [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'Apresentante..: ' + apresentante, [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'Telefone......: ' + endereco, [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'Contato.......: ' + contato, [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'Contrat./Parte: ' + Label2.Caption, [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'Depósito.....: R$ ' + Trim(StrCurr(deposito, 14, True)), [normal]);
  lin := lin + 1;
  lin := lin + 1;

  if (DM.Config_Adm.FieldByName('chk_08').AsBoolean) then
  begin
    Dm.ArqAux2.Close;
    Dm.ArqAux2.Sql.Clear;
    Dm.ArqAux2.Sql.Add('SELECT * FROM td_pedid');
    Dm.ArqAux2.Sql.Add('WHERE');
    Dm.ArqAux2.Sql.Add('p_auxiliar = ' + protocolo + ' AND tipo_prot = "T"');
    Dm.ArqAux2.Open;
    DM.ArqAux2.FindFirst;


    while not DM.ArqAux2.Eof do
    begin
      RDprint1.ImpF(lin, 01, DM.ArqAux2.fieldbyname('tabela').AsString + '.' + DM.ArqAux2.fieldbyname('item').AsString + ' ' + DM.ArqAux2.fieldbyname('subitem').AsString, [comp17]);
      RDprint1.ImpF(lin, 08, DM.ArqAux2.fieldbyname('descricao').AsString, [comp17]);
      RDprint1.ImpF(lin, 60, DM.ArqAux2.fieldbyname('qtde').AsString + ' x', [comp17]);
      RDprint1.ImpF(lin, 63, FormatCurr('###,##0.00', DM.ArqAux2.fieldbyname('valor_calc').AsCurrency), [comp17]);
      lin := lin + 1;
      DM.ArqAux2.Next;
    end;
  end
  else
  begin
    RDprint1.ImpF(lin, 01, 'Emolumentos....: R$ ' + Trim(StrCurr(emolumento, 14, True)), [comp17]);
    RDprint1.ImpF(lin, 20, 'Adicional......: R$ ' + Trim(StrCurr(emoladicional, 14, True)), [comp17]);
    RDprint1.ImpF(lin, 40, 'Pag.Adicional..: R$ ' + Trim(StrCurr(v_pag, 14, True)), [comp17]);
    RDprint1.ImpF(lin, 60, 'Via Excedente..: R$ ' + Trim(StrCurr(via_excedente, 14, True)), [comp17]);
    lin := lin + 1;
    RDprint1.ImpF(lin, 01, 'Microfilme.....: R$ ' + Trim(StrCurr(microfilme, 14, True)), [comp17]);
    RDprint1.ImpF(lin, 20, 'Digitalizacao..: R$ ' + Trim(StrCurr(digitalizacao, 14, True)), [comp17]);
    RDprint1.ImpF(lin, 40, 'Informatica....: R$ ' + Trim(StrCurr(informatica, 14, True)), [comp17]);
    RDprint1.ImpF(lin, 60, 'Grav Eletronica: R$ ' + Trim(StrCurr(graveletronica, 14, True)), [comp17]);
    lin := lin + 1;
    RDprint1.ImpF(lin, 01, 'Conferencia....: R$ ' + Trim(StrCurr(conferencia, 14, True)), [comp17]);
    RDprint1.ImpF(lin, 20, 'Nomes Exced....: R$ ' + Trim(StrCurr(nomesexc, 14, True)), [comp17]);
    RDprint1.ImpF(lin, 40, 'Distribuicao...: R$ ' + Trim(StrCurr(distribuicao, 14, True)), [comp17]);
    RDprint1.ImpF(lin, 60, 'Info Distrib...: R$ ' + Trim(StrCurr(infodistrib, 14, True)), [comp17]);
    lin := lin + 1;
    RDprint1.ImpF(lin, 01, 'Grav.Elet.Dist.: R$ ' + Trim(StrCurr(graveletrdistrib, 14, True)), [comp17]);
  end;

  lin := lin + 1;
  RDprint1.ImpF(lin, 01, 'SubTotal.......: R$ ' + Trim(StrCurr(subtotal, 14, True)), [comp17]);
  RDprint1.ImpF(lin, 20, 'Lei 3217/99....: R$ ' + Trim(StrCurr(tribunal, 14, True)), [comp17]);
  RDprint1.ImpF(lin, 40, 'Lei 4664/05....: R$ ' + Trim(StrCurr(procuradoria, 14, True)), [comp17]);
  RDprint1.ImpF(lin, 60, 'Lei 111/06.....: R$ ' + Trim(StrCurr(defensoria, 14, True)), [comp17]);
  lin := lin + 1;
  RDprint1.ImpF(lin, 01, 'Lei 3716/02....: R$ ' + Trim(StrCurr(mutua, 14, True)), [comp17]);
  RDprint1.ImpF(lin, 20, 'Lei 590/82.....: R$ ' + Trim(StrCurr(acoterj, 14, True)), [comp17]);
  RDprint1.ImpF(lin, 40, 'Distrib........: R$ ' + Trim(StrCurr(VrDistrib, 14, True)), [comp17]);
  RDprint1.ImpF(lin, 60, 'Total..........: R$ ' + Trim(StrCurr(total, 14, True)), [comp17]);
  lin := lin + 1;
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'Data prevista para devolução : ', [normal]);
  RdPrint1.ImpF(lin, 32, datadev, [expandido, negrito]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'O presente título foi protocolado no livro A sob o n. acima nesta data.', [normal]);
  lin := lin + 2;
  RdPrint1.ImpF(lin, 01, 'HORÁRIO DE RETIRADA DO TÍTULO : ', [normal, negrito]);
  RdPrint1.ImpF(lin, 33, F_Menu.Label23.Caption, [normal, negrito]);
  lin := lin + 2;
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.Add(DataExtenso(data, True, hora));
  Alinha.Alignment := TaCenter;
  Alinha.Text := RichEdit1.Lines.Strings[0];
  RdPrint1.ImpF(lin, 01, Alinha.Result, [normal]);
  lin := lin + 3;
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.Add(StringOfChar('-', Length(F_Menu.Label25.Caption)));
  RichEdit1.Lines.Add(F_Menu.Label25.Caption);
  RichEdit1.Lines.Add('RECEPÇÃO');
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    Alinha.Text := RichEdit1.Lines.Strings[x];
    RdPrint1.ImpF(lin, 01, Alinha.Result, [normal]);
    lin := lin + 1;
  end;
  RdPrint1.ImpF(lin, 01, '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -', [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, F_Menu.Label20.Caption, [normal, negrito]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, F_Menu.Label21.Caption, [normal]);
  RdPrint1.ImpF(lin, 53, autenticacao, [comp20]);
  RdPrint1.Fechar;


{ if (Trim(Label3.Caption) <> '') then
  begin
    RdPrint1.ImpF(lin, 01, Label3.Caption, [normal]);
    lin := lin + 1;
  end;
  if (Trim(Label2.Caption) <> '') then
  begin
    RdPrint1.ImpF(lin, 01, Label2.Caption, [normal]);
    lin := lin + 1;
  end; }
end;

procedure TFuncoes.Abre_FeriadosClick(Sender: TObject);
begin
  With DM do
  begin
    if Feriados.Active then Funcoes.Fecha_FeriadosClick(Funcoes);
    Feriados.Open;
  end;
end;

procedure TFuncoes.Fecha_FeriadosClick(Sender: TObject);
begin
  With DM do
  begin
    Feriados.Close;
    Feriados.Sql.Clear;
    Feriados.Sql.Add('select * from feriados order by data');
  end;
end;

Procedure TFuncoes.ReciboCertidao(Funcoes : TOBject; Visualizar : Boolean;
                                 data, protocolo, apresentante, interessado, telefone, natureza, datadev, hora,
                                 documento, pjuridica, observacao : String;
                                 deposito, emolumento, busca, desarquivamento, informatica, subtotal, tribunal,
                                 defensoria, procuradoria, custas : Currency);
var
  lin, x, y : Integer;
begin


  RichEdit5.Clear;
  RichEdit5.Lines.Add(documento);
  Alinha.Alignment    := taCenter;
  Alinha.Width        := 40;
  lin := 1;
  RdPrint1.OpcoesPreview.Preview := Visualizar;
  RdPrint1.Abrir;
  RichEdit4.Font.Size  := 16;
  RichEdit4.Font.Style := [fsBold];
  RichEdit4.Lines.Clear;
  RichEdit4.Lines.Add(Maiusculo(F_Menu.Caption));
  Alinha.Text := RichEdit4.Lines.Strings[0];
  RdPrint1.ImpF(lin, 01, Alinha.Result, [negrito, EXPANDIDO]);
  lin := lin + 1;
  Alinha.Text := RichEdit4.Lines.Strings[1];
  RdPrint1.ImpF(lin, 01, Alinha.Result, [negrito, EXPANDIDO]);
  Alinha.Width        := 80;
  lin := lin + 1;
  RichEdit1.Font.Size  := 10;
  RichEdit1.Font.Style := [];
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.Add(F_Menu.Label11.Caption);
  RichEdit1.Lines.Add(F_Menu.Label5.Caption + ' - ' + F_Menu.Label13.Caption);
  y := 0;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    Alinha.Text := RichEdit1.Lines.Strings[x];
    RdPrint1.ImpF(lin, 01, Alinha.Result, [normal]);
    lin := lin + 1;
  end;
  RichEdit1.Font.Size  := 10;
  RichEdit1.Font.Style := [];
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.Add(F_Menu.Label22.Caption);
  Alinha.Text := RichEdit1.Lines.Strings[0];
  RdPrint1.ImpF(lin, 01, Alinha.Result, [negrito, normal]);
  lin := lin + 2;
  RichEdit1.Font.Size := 10;
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.Add('PEDIDO DE CERTIDÃO N. ' + protocolo + '-(TD)');
  Alinha.Width := 40;
  Alinha.Text  := RichEdit1.Lines.Strings[0];
  RdPrint1.ImpF(lin, 01, Alinha.Result, [expandido]);
  Alinha.Width := 80;
  lin := lin + 2;
  RdPrint1.ImpF(lin, 01, 'Natureza.....: ' + natureza, [normal]);
  lin := lin + 2;
  RdPrint1.ImpF(lin, 01, 'Apresentante : ' + apresentante, [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'Telefone.....: ' + telefone + ' - Contato : ' + interessado, [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'Depósito.....: R$ ' + Trim(StrCurr(deposito, 14, True)), [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'Data prevista para devolução : ', [normal]);
  RdPrint1.ImpF(lin, 32, datadev, [expandido, negrito]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'HORÁRIO DE RETIRADA DA CERTIDÃO : ', [normal, negrito]);
  RdPrint1.ImpF(lin, 35, F_Menu.Label28.Caption, [normal, negrito]);
  lin := lin + 1;
  lin := lin + 1;

  if (DM.Config_Adm.FieldByName('chk_08').AsBoolean) then
  begin
    Dm.ArqAux2.Close;
    Dm.ArqAux2.Sql.Clear;
    Dm.ArqAux2.Sql.Add('SELECT * FROM td_pedid');
    Dm.ArqAux2.Sql.Add('WHERE');
    Dm.ArqAux2.Sql.Add('p_auxiliar = ' + protocolo + ' AND tipo_prot = "C"');
    Dm.ArqAux2.Open;
    DM.ArqAux2.FindFirst;


    while not DM.ArqAux2.Eof do
    begin
      RDprint1.ImpF(lin, 01, DM.ArqAux2.fieldbyname('tabela').AsString + '.' + DM.ArqAux2.fieldbyname('item').AsString + ' ' + DM.ArqAux2.fieldbyname('subitem').AsString, [comp17]);
      RDprint1.ImpF(lin, 08, DM.ArqAux2.fieldbyname('descricao').AsString, [comp17]);
      RDprint1.ImpF(lin, 70, DM.ArqAux2.fieldbyname('qtde').AsString + ' x', [comp17]);
      RDprint1.ImpF(lin, 73, FormatCurr('###,##0.00', DM.ArqAux2.fieldbyname('valor_calc').AsCurrency), [comp17]);
      lin := lin + 1;
      DM.ArqAux2.Next;
    end;
  end
  else
  begin
    RDprint1.ImpF(lin, 01, 'Emolumentos....: R$ ' + Trim(StrCurr(emolumento, 14, True)), [comp17]);
    RDprint1.impf(lin, 20, 'Busca..........: R$ ' + Trim(StrCurr(busca, 14, True)), [comp17]);
    RDprint1.impf(lin, 40, 'Desarquivamento: R$ ' + Trim(StrCurr(desarquivamento, 14, True)), [comp17]);
    RDprint1.impf(lin, 60, 'Informatica....: R$ ' + Trim(StrCurr(informatica, 14, True)), [comp17]);
    lin := lin + 1;
  end;

  lin := lin + 1;
  RDprint1.impf(lin, 01, 'SubTotal.......: R$ ' + Trim(StrCurr(subtotal, 14, True)), [comp17]);
  RDprint1.ImpF(lin, 20, 'Lei 3217/99....: R$ ' + Trim(StrCurr(tribunal, 14, True)), [comp17]);
  RDprint1.ImpF(lin, 40, 'Lei 4664/05....: R$ ' + Trim(StrCurr(procuradoria, 14, True)), [comp17]);
  RDprint1.ImpF(lin, 60, 'Lei 111/06.....: R$ ' + Trim(StrCurr(defensoria, 14, True)), [comp17]);
  lin := lin + 1;
  RDprint1.ImpF(lin, 01, 'Total..........: R$ ' + Trim(StrCurr(custas, 14, True)), [comp17]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'DESCRIÇÃO', [normal, negrito]);
  lin := lin + 1;
  lin := lin + 1;
  y := 0;
  for x := 0 to (RichEdit5.Lines.Count - 1) do
  begin
    RdPrint1.ImpF(lin, 01, RichEdit5.Lines.Strings[x], [normal]);
    lin := lin + 1;
    y   := y + 1;
  end;
  if ((6 - y) > 0) then for x := 1 to (6 - y) do lin := lin + 1;
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, DataExtenso(data, True, hora), [normal]);
  RdPrint1.ImpF(lin, 50, StringOfChar('-', Length(F_Menu.Label25.Caption)), [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 50, F_Menu.Label25.Caption, [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -', [normal]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, F_Menu.Label20.Caption, [normal, negrito]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'Certidões não reclamadas serão inutilizadas após 30 dias do pedido. O fornecimento errado do n. do Registro ou a inversão de dados, por V.Sa, acarretara  na', [comp20]);
  lin := lin + 1;
  RdPrint1.ImpF(lin, 01, 'reformulação do prazo para entrega da certidão. Este documento só tera valor com a autenticação mecânica : ' + pjuridica + '.', [comp20]);
  RdPrint1.Fechar;
end;

Procedure TFuncoes.FechamentoIndividual(Funcoes : TOBject; Visualizar : Boolean;
                                        data, usuario, dinheiro, cheque, moeda, subtotal, despesas, cheques_can, total, fundo, arisp, observacao : String);
var
  lin, x, y : Integer;
begin
  lin := 5;
  RdPrint2.OpcoesPreview.Preview := Visualizar;
  RdPrint2.Abrir;
  RdPrint2.ImpF(lin, 01, 'Resumo referente ao caixa de ' + usuario + ' do dia ' + data + '.', [NORMAL]);
  lin := lin + 3;
  RdPrint2.ImpF(lin, 01, 'Em dinheiro     : ' + dinheiro, [normal]);
  lin := lin + 1;
  RdPrint2.ImpF(lin, 01, 'Em cheques      : ' + cheque, [normal]);
  lin := lin + 1;
  RdPrint2.ImpF(lin, 01, 'Em moedas       : ' + moeda, [normal]);
  lin := lin + 1;
  RdPrint2.ImpF(lin, 01, '                   -----------------', [normal]);
  RdPrint2.ImpF(lin, 40, 'Fundo de Caixa : ' + fundo, [normal]);
  lin := lin + 1;
  RdPrint2.ImpF(lin, 01, 'Sub-Total       : ' + subtotal, [normal]);
  lin := lin + 1;
  RdPrint2.ImpF(lin, 01, 'Despesas        : ' + despesas, [normal]);
  lin := lin + 1;
  RdPrint2.ImpF(lin, 01, 'Cheques cancel. : ' + cheques_can, [normal]);
  lin := lin + 1;
  RdPrint2.ImpF(lin, 01, '                   -----------------', [normal]);
  RdPrint2.ImpF(lin, 40, 'Arisp          : ' + arisp, [normal]);
  lin := lin + 1;
  RdPrint2.ImpF(lin, 01, 'Total Geral     : ' + total, [normal]);
  lin := lin + 2;  
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.Add(observacao);
  for x := 0 to (RichEdit1.Lines.Count -1) do
  begin
    RdPrint2.ImpF(lin, 01, RichEdit1.Lines.Strings[x], [normal]);
    lin := lin + 1;
  end;
  lin := lin + 4;
  RichEdit1.Lines.Clear;
  RichEdit1.Lines.Add('------------------------------');
  RichEdit1.Lines.Add(usuario);
  Alinha.Alignment    := taCenter;
  for x := 0 to (RichEdit1.Lines.Count - 1) do
  begin
    Alinha.Text := RichEdit1.Lines.Strings[x];
    RdPrint2.ImpF(lin, 01, Alinha.Result, [normal]);
    lin := lin + 1;    
  end;
  RdPrint2.Fechar;
end;

end.


