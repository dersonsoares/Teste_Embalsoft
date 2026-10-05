program Teste_Embalsoft;

uses
  Vcl.Forms,
  DataModule1 in 'DataModule1.pas' {Datamodelo1: TDataModule},
  Controller in 'Controller.pas',
  Models in 'Models.pas',
  Utils in 'Utils.pas',
  View.Principal in 'View.Principal.pas' {frmMenuPrincipal},
  View.Geral.Clientes in 'View.Geral.Clientes.pas' {frmClientesGeral},
  View.Cadastro.Clientes in 'View.Cadastro.Clientes.pas' {frmCadClientes},
  View.Cadastro.Contatos in 'View.Cadastro.Contatos.pas' {frmCadContatos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.CreateForm(TDatamodelo1, Datamodelo1);
  Application.CreateForm(TfrmCadContatos, frmCadContatos);
  Application.Run;
end.
