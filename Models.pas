unit Models;

interface

uses
  System.SysUtils, Data.DB;

type
  TModel = class
  public
    class function GetInsertSQL: string; virtual; abstract;
    class function GetUpdateSQL: string; virtual; abstract;
    class function GetDeleteSQL: string; virtual; abstract;
  end;

  TCliente = class(TModel)
  private
    FIdCliente: Integer;
    FNomeReduzido: string;
    FRazaoSocial: string;
    FNatJuridica: Char;
    FCPFCNPJ: string;
    FDtNascimento: TDateTime;
    FDtTmCadastro: TDateTime;
  public
    class function GetInsertSQL: string; override;
    class function GetUpdateSQL: string; override;
    class function GetDeleteSQL: string; override;

    procedure LoadFromDataSet(ADataSet: TDataSet);

    property IdCliente:    Integer   read FIdCliente    write FIdCliente;
    property NomeReduzido: string    read FNomeReduzido write FNomeReduzido;
    property RazaoSocial:  string    read FRazaoSocial  write FRazaoSocial;
    property NatJuridica:  Char      read FNatJuridica  write FNatJuridica;
    property CPFCNPJ:      string    read FCPFCNPJ      write FCPFCNPJ;
    property DtNascimento: TDateTime read FDtNascimento write FDtNascimento;
    property DtTmCadastro: TDateTime read FDtTmCadastro write FDtTmCadastro;
  end;

  TContato = class(TModel)
  private
    FIdContato: Integer;
    FIdCliente: Integer;
    FNome: string;
    FEmail: string;
  public
    class function GetInsertSQL: string; override;
    class function GetUpdateSQL: string; override;
    class function GetDeleteSQL: string; override;

    procedure LoadFromDataSet(ADataSet: TDataSet);

    property IdContato: Integer read FIdContato write FIdContato;
    property IdCliente: Integer read FIdCliente write FIdCliente;
    property Nome:      string  read FNome      write FNome;
    property Email:     string  read FEmail     write FEmail;
  end;

implementation

{ TCliente }

class function TCliente.GetInsertSQL: string;
begin
  Result :=
    'INSERT INTO TbClientes ' +
    '(NomeReduzido, RazaoSocial, NatJuridica, CPFCNPJ, ' +
    'DtNascimento, DtTmCadastro) ' +
    'VALUES (:NomeReduzido, :RazaoSocial, :NatJuridica, :CPFCNPJ, ' +
    ':DtNascimento, :DtTmCadastro)';
end;

class function TCliente.GetUpdateSQL: string;
begin
  Result :=
    'UPDATE TbClientes SET ' +
    'NomeReduzido = :NomeReduzido, ' +
    'RazaoSocial = :RazaoSocial, ' +
    'NatJuridica = :NatJuridica, ' +
    'CPFCNPJ = :CPFCNPJ, ' +
    'DtNascimento = :DtNascimento ' +
    'WHERE IdCliente = :IdCliente';
end;

procedure TCliente.LoadFromDataSet(ADataSet: TDataSet);
begin
  if ADataSet.IsEmpty then
    Exit;

  IdCliente    := ADataSet.FieldByName('IdCliente').AsInteger;
  NomeReduzido := ADataSet.FieldByName('NomeReduzido').AsString;
  RazaoSocial  := ADataSet.FieldByName('RazaoSocial').AsString;

  if not ADataSet.FieldByName('NatJuridica').IsNull then
    NatJuridica := ADataSet.FieldByName('NatJuridica').AsString[1]
  else
    NatJuridica := 'F';

  CPFCNPJ      := ADataSet.FieldByName('CPFCNPJ').AsString;
  DtNascimento := ADataSet.FieldByName('DtNascimento').AsDateTime;
  DtTmCadastro := ADataSet.FieldByName('DtTmCadastro').AsDateTime;
end;

class function TCliente.GetDeleteSQL: string;
begin
  Result :=
    'DELETE FROM TbClientes ' +
    'WHERE IdCliente = :IdCliente';
end;

{ TContato }

class function TContato.GetInsertSQL: string;
begin
  Result :=
    'INSERT INTO TbContatos ' +
    '(IdCliente, Nome, Email) ' +
    'VALUES (:IdCliente, :Nome, :Email)';
end;

class function TContato.GetUpdateSQL: string;
begin
  Result :=
    'UPDATE TbContatos SET ' +
    'Nome = :Nome, ' +
    'Email = :Email ' +
    'WHERE IdContato = :IdContato';
end;

procedure TContato.LoadFromDataSet(ADataSet: TDataSet);
begin
  if ADataSet.IsEmpty then
    Exit;

  FIdCliente := ADataSet.FieldByName('IdCliente').AsInteger;
  FIdContato := ADataSet.FieldByName('IdContato').AsInteger;
  FNome      := ADataSet.FieldByName('Nome').AsString;
  FEmail     := ADataSet.FieldByName('Email').AsString;
end;

class function TContato.GetDeleteSQL: string;
begin
  Result :=
    'DELETE FROM TbContatos ' +
    'WHERE IdContato = :IdContato';
end;

end.
