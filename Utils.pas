unit Utils;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Winapi.Windows, System.Variants, System.Math, System.DateUtils,
  System.StrUtils, Winapi.Messages,Vcl.Printers, Vcl.Dialogs, System.UITypes, System.NetConsts, Vcl.Themes,
  System.Rtti, System.Generics.Collections, Soap.SOAPHTTPTrans, Vcl.Graphics, System.RegularExpressions,
  Vcl.Controls;


type
  TTipoOperacao = (opInsert, opUpdate, opDelete);

  procedure MsgAviso(const psMensagem: String);
  function MsgConfirmacao(const psMensagem: String; const pbFocoBotaoSim: Boolean = True): Boolean;
  function MsgConfirmacaoCancelar(const psMensagem: String; const pbFocoBotaoOK: Boolean = True): Boolean;
  procedure MsgErro(const psMensagem: String);
  procedure MsgExcecao(const psMensagem: String);

  function SomenteNumeros(const ATexto: string): string;

const
  cFORMCLIENTES = 1;

implementation

procedure MsgAviso(const psMensagem: String);
begin
  TThread.Synchronize(TThread.CurrentThread,
      procedure
      begin
        TStyleManager.SystemHooks := TStyleManager.SystemHooks - [shDialogs];
        try
          Vcl.Dialogs.UseLatestCommonDialogs := False;
          try
            //Application.MessageBox(PWideChar(psMensagem), 'Aviso', MB_ICONINFORMATION or MB_OK);
            MessageDlg(psMensagem, mtInformation, [mbOK], 0);
          finally
            Vcl.Dialogs.UseLatestCommonDialogs := True;
          end;
        finally
          TStyleManager.SystemHooks := TStyleManager.SystemHooks + [shDialogs];
        end;
      end);
end;
function MsgConfirmacao(const psMensagem: String; const pbFocoBotaoSim: Boolean = True): Boolean;
var
  BotaoFocado: TMsgDlgBtn;
  bSim: Boolean;
begin
  bSim := False;

  if pbFocoBotaoSim then
    BotaoFocado := mbYes
  else
    BotaoFocado := mbNo;

  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      TStyleManager.SystemHooks := TStyleManager.SystemHooks - [shDialogs];
      try
        Vcl.Dialogs.UseLatestCommonDialogs := False;
        try
          bSim := MessageDlg(psMensagem, mtConfirmation, [mbYes, mbNo], 0, BotaoFocado) = mrYes;
        finally
          Vcl.Dialogs.UseLatestCommonDialogs := True;
        end;

      finally
        TStyleManager.SystemHooks := TStyleManager.SystemHooks + [shDialogs];
      end;
    end);

  Result := bSim;
end;

function MsgConfirmacaoCancelar(const psMensagem: String; const pbFocoBotaoOK: Boolean = True): Boolean;
var
  BotaoFocado: TMsgDlgBtn;
  bOK: Boolean;
begin
  bOK := False;

  if pbFocoBotaoOK then
    BotaoFocado := mbOK
  else
    BotaoFocado := mbCancel;

  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      Vcl.Dialogs.UseLatestCommonDialogs := False;
      try
        {Result := (Application.MessageBox(PWideChar(psMensagem), 'Confirmação', MB_ICONQUESTION or
          MB_OKCANCEL or iBotaoFocado) = IDOK);}

        bOK := MessageDlg(psMensagem, mtConfirmation, [mbOK, mbCancel], 0, BotaoFocado) = mrOk;
      finally
        Vcl.Dialogs.UseLatestCommonDialogs := True;
      end;
    end);

  Result := bOK;
end;

procedure MsgErro(const psMensagem: String);
begin
  TThread.Synchronize(TThread.CurrentThread,
      procedure
      begin
        TStyleManager.SystemHooks := TStyleManager.SystemHooks - [shDialogs];
        try
          Vcl.Dialogs.UseLatestCommonDialogs := False;
          try
            //Application.MessageBox(PWideChar(psMensagem), 'Atenção', MB_ICONEXCLAMATION or MB_OK);
            MessageDlg(psMensagem, mtWarning, [mbOK], 0);
          finally
            Vcl.Dialogs.UseLatestCommonDialogs := True;
          end;
        finally
          TStyleManager.SystemHooks := TStyleManager.SystemHooks + [shDialogs];
        end;
      end);
end;

procedure MsgExcecao(const psMensagem: String);
begin
  TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      Vcl.Dialogs.UseLatestCommonDialogs := False;
      try
        MessageDlg(psMensagem, mtError, [mbOK], 0);
      finally
        Vcl.Dialogs.UseLatestCommonDialogs := True;
      end;
    end);
end;

function SomenteNumeros(const ATexto: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(ATexto) do
  begin
    if CharInSet(ATexto[I], ['0'..'9']) then
      Result := Result + ATexto[I];
  end;
end;

end.
