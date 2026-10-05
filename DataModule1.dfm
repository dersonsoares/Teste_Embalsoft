object Datamodelo1: TDatamodelo1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object Conexao: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      #39'Database:= BDCANDIDATO.db;'
      'Database=C:\Projetos\Testes\Teste_Embalsoft\BDCANDIDATO.db')
    LoginPrompt = False
    BeforeConnect = ConexaoBeforeConnect
    Left = 160
    Top = 176
  end
  object qryClientes: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'Select *, CASE WHEN NatJuridica = '#39'J'#39' THEN '#39'Pessoa Juridica'#39' ELS' +
        'E '#39'Pessoa F'#237'sica'#39' END as dsNatJuridica '
      'from tbClientes')
    Left = 288
    Top = 224
    object qryClientesIdCliente: TFDAutoIncField
      FieldName = 'IdCliente'
      Origin = 'IdCliente'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryClientesNomeReduzido: TStringField
      FieldName = 'NomeReduzido'
      Origin = 'NomeReduzido'
      Required = True
    end
    object qryClientesRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Origin = 'RazaoSocial'
      Required = True
      Size = 60
    end
    object qryClientesNatJuridica: TStringField
      FieldName = 'NatJuridica'
      Origin = 'NatJuridica'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryClientesCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Origin = 'CPFCNPJ'
      Required = True
      Size = 14
    end
    object qryClientesDtNascimento: TDateTimeField
      FieldName = 'DtNascimento'
      Origin = 'DtNascimento'
    end
    object qryClientesDtTmCadastro: TDateTimeField
      FieldName = 'DtTmCadastro'
      Origin = 'DtTmCadastro'
    end
    object qryClientesdsNatJuridica: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dsNatJuridica'
      Origin = 'dsNatJuridica'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 352
    Top = 224
  end
  object qryContatos: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'Select c.* from tbContatos c'
      'where c.IdCliente = :IdCliente')
    Left = 280
    Top = 304
    ParamData = <
      item
        Name = 'IDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryContatosIdContato: TFDAutoIncField
      FieldName = 'IdContato'
      Origin = 'IdContato'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryContatosIdCliente: TIntegerField
      FieldName = 'IdCliente'
      Origin = 'IdCliente'
      Required = True
    end
    object qryContatosNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 60
    end
    object qryContatosEmail: TStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 90
    end
  end
  object dsContatos: TDataSource
    DataSet = qryContatos
    Left = 344
    Top = 304
  end
end
