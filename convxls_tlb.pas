unit convXLS_TLB;

// ************************************************************************ //
// WARNING                                                                  //
// -------                                                                  //
// The types declared in this file were generated from data read from a     //
// Type Library. If this type library is explicitly or indirectly (via      //
// another type library referring to this type library) re-imported, or the //
// 'Refresh' command of the Type Library Editor activated while editing the //
// Type Library, the contents of this file will be regenerated and all      //
// manual modifications will be lost.                                       //
// ************************************************************************ //

// PASTLWTR : $Revision:1.0$
// File generated on 10/11/2004 08:41:30 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\WINDOWS\convXLS.dll
// IID\LCID: {042EAE9A-5DFD-4628-9DF6-9295DDB64104}\0
// Helpfile: 
// HelpString: 
// Version:    3.0
// ************************************************************************ //

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:      //
//   Type Libraries     : LIBID_xxxx                                    //
//   CoClasses          : CLASS_xxxx                                    //
//   DISPInterfaces     : DIID_xxxx                                     //
//   Non-DISP interfaces: IID_xxxx                                      //
// *********************************************************************//
const
  LIBID_convXLS: TGUID = '{042EAE9A-5DFD-4628-9DF6-9295DDB64104}';
  IID__clsMain: TGUID = '{92E89C71-8E06-4B93-9E14-E03B2F94BACC}';
  CLASS_clsMain: TGUID = '{740A2773-ADBF-4808-9769-73ECF724B65B}';
type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  _clsMain = interface;
  _clsMainDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  clsMain = _clsMain;


// *********************************************************************//
// Interface: _clsMain
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {92E89C71-8E06-4B93-9E14-E03B2F94BACC}
// *********************************************************************//
  _clsMain = interface(IDispatch)
    ['{92E89C71-8E06-4B93-9E14-E03B2F94BACC}']
    function XLStoTXT_2000(const strPasta: WideString; const strXLS: WideString; 
                           var strToTXT: WideString; var strNomePlanilha: WideString): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  _clsMainDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {92E89C71-8E06-4B93-9E14-E03B2F94BACC}
// *********************************************************************//
  _clsMainDisp = dispinterface
    ['{92E89C71-8E06-4B93-9E14-E03B2F94BACC}']
    function XLStoTXT_2000(const strPasta: WideString; const strXLS: WideString; 
                           var strToTXT: WideString; var strNomePlanilha: WideString): WordBool; dispid 1610809344;
  end;

  CoclsMain = class
    class function Create: _clsMain;
    class function CreateRemote(const MachineName: string): _clsMain;
  end;

implementation

uses ComObj;

class function CoclsMain.Create: _clsMain;
begin
  Result := CreateComObject(CLASS_clsMain) as _clsMain;
end;

class function CoclsMain.CreateRemote(const MachineName: string): _clsMain;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_clsMain) as _clsMain;
end;

end.
