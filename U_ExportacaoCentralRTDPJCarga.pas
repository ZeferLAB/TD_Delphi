unit U_ExportacaoCentralRTDPJCarga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask;

type
  TF_ExportacaoCentralRTDPJCarga = class(TForm)
    StatusBar1: TStatusBar;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ExportacaoCentralRTDPJCarga: TF_ExportacaoCentralRTDPJCarga;

implementation

{$R *.DFM}

procedure TF_ExportacaoCentralRTDPJCarga.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TF_ExportacaoCentralRTDPJCarga.BitBtn1Click(Sender: TObject);
begin
  //protocolo:584
end;

end.
