unit U_Autent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, RXCtrls, ExtCtrls, RDprint, Printers;

type
  TF_Autent = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    Bevel1: TBevel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    RDprint1: TRDprint;
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Autent: TF_Autent;
  cont_autentic : Integer;

implementation

Uses Menu, FuncGeral;

{$R *.DFM}

procedure TF_Autent.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TF_Autent.FormClose(Sender: TObject; var Action: TCloseAction);
Var
  texto1 : String;
  F : TextFile;
  Valor : Extended;
  t : Integer;
begin
  AssignFile(F,'COM1');
  Rewrite(F);
  WriteLn(F, chr(27) + Chr(86));
  Writeln(F,'RTD ' +
            Copy(StrZero(RxLabel11.Caption, 6), 1,3) + '.' + Copy(StrZero(RxLabel11.Caption, 6), 4,3) + ' ' +
            DateToStr(Date)  + ' ' +
            RxLabel9.Caption + ' ' +
            'TD C');
  CloseFile(F);
  Timer1.Enabled := false;
end;

procedure TF_Autent.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TF_Autent.Timer1Timer(Sender: TObject);
begin
  if label1.caption = 'S' then
  Begin
    rxlabel2.caption := 'Insira o documento na autenticadora e pressione <ALT+A>';
    Label1.caption := 'N';
  end
  else
  Begin
    rxlabel2.caption := '';
    Label1.caption := 'S';
  end;
end;

end.
