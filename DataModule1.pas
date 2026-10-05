unit DataModule1;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr,
  Vcl.Dialogs, Vcl.Forms, Data.DbxSqlite, Data.FMTBcd, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDatamodelo1 = class(TDataModule)
    Conexao: TFDConnection;
    qryClientes: TFDQuery;
    qryClientesIdCliente: TFDAutoIncField;
    qryClientesNomeReduzido: TStringField;
    qryClientesRazaoSocial: TStringField;
    qryClientesNatJuridica: TStringField;
    qryClientesCPFCNPJ: TStringField;
    qryClientesDtNascimento: TDateTimeField;
    qryClientesDtTmCadastro: TDateTimeField;
    dsClientes: TDataSource;
    qryClientesdsNatJuridica: TWideStringField;
    qryContatos: TFDQuery;
    dsContatos: TDataSource;
    qryContatosIdContato: TFDAutoIncField;
    qryContatosIdCliente: TIntegerField;
    qryContatosNome: TStringField;
    qryContatosEmail: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ConexaoBeforeConnect(Sender: TObject);
  private
    procedure SetupConnection;

    procedure AbrirCliente;
  public
    // As queries permanecem acessíveis para a camada Model
  end;

var
  Datamodelo1: TDatamodelo1;

implementation

{$R *.dfm}

procedure TDatamodelo1.AbrirCliente;
begin

end;

procedure TDatamodelo1.ConexaoBeforeConnect(Sender: TObject);
begin
  Conexao.Params.Values['BusyTimeout'] := '10000';
  Conexao.Params.Values['LockingMode'] := 'Normal';
end;

procedure TDatamodelo1.DataModuleCreate(Sender: TObject);
begin
  try
    SetupConnection;
  except
    on E: Exception do
    begin
      MessageDlg('Erro ao inicializar banco de dados: ' + E.Message, mtError, [mbOK], 0);
      Application.Terminate;
    end;
  end;
end;

procedure TDatamodelo1.DataModuleDestroy(Sender: TObject);
begin
  //SQLTransaction1.Active := False;
  Conexao.Close;
end;

procedure TDatamodelo1.SetupConnection;
begin
  Conexao.Connected:= False;
  Conexao.DriverName := 'Sqlite';
  Conexao.LoginPrompt := False;
  Conexao.Connected:= True;
end;



end.

