unit View.Cadastro.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Mask, Utils,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Controller, Models;

type
  TfrmCadClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edtNome: TEdit;
    edtRazaoSocial: TEdit;
    edtCPFCNPJ: TMaskEdit;
    rgpNatJuridica: TRadioGroup;
    GroupBox4: TGroupBox;
    edtDtNascimento: TDateTimePicker;
    procedure rgpNatJuridicaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FTipoOperacao: TTipoOperacao;
    FCliente: TCliente;
    FDataSetClientes: TDataSet;

    procedure ModelToScreen;
    procedure ScreenToModel;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; pTpOperacao: TTipoOperacao; ADataSet: TDataSet);

    property TipoOperacao: TTipoOperacao read FTipoOperacao write FTipoOperacao;
    property DataSetClientes: TDataSet read FDataSetClientes write FDataSetClientes;
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation


{$R *.dfm}

procedure TfrmCadClientes.BitBtn5Click(Sender: TObject);
begin
  ScreenToModel;
  try
    TController.Action(FCliente, FTipoOperacao);
    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao salvar o cliente: ' + E.Message);
      ModalResult := mrNone;
    end;
  end;
end;

constructor TfrmCadClientes.Create(AOwner: TComponent; pTpOperacao: TTipoOperacao; ADataSet: TDataSet);
begin
  inherited Create(AOwner);
  FTipoOperacao:= pTpOperacao;
  FDataSetClientes:= ADataSet;
end;

procedure TfrmCadClientes.FormCreate(Sender: TObject);
begin
  FCliente := TCliente.Create;
end;

procedure TfrmCadClientes.FormDestroy(Sender: TObject);
begin
  FCliente.Free;
end;

procedure TfrmCadClientes.FormShow(Sender: TObject);
begin
  if Assigned(FDataSetClientes) and not FDataSetClientes.IsEmpty then
    FCliente.LoadFromDataSet(FDataSetClientes);

  if FTipoOperacao = opInsert then
  begin
    FCliente.DtTmCadastro := Now;
    edtDtNascimento.Date := Date;
    rgpNatJuridica.ItemIndex := 0; // Pessoa Física por padrão
    rgpNatJuridicaClick(rgpNatJuridica);
  end
  else if FTipoOperacao = opUpdate then
  begin
    ModelToScreen;
  end;
end;

procedure TfrmCadClientes.ModelToScreen;
begin
  edtNome.Text        := FCliente.NomeReduzido;
  edtRazaoSocial.Text := FCliente.RazaoSocial;

  if FCliente.NatJuridica = 'J' then
    rgpNatJuridica.ItemIndex := 1
  else
    rgpNatJuridica.ItemIndex := 0;

  rgpNatJuridicaClick(rgpNatJuridica);

  edtCPFCNPJ.Text := FCliente.CPFCNPJ;

  if FCliente.DtNascimento > 0 then
    edtDtNascimento.Date := FCliente.DtNascimento;
end;

procedure TfrmCadClientes.rgpNatJuridicaClick(Sender: TObject);
begin
  if rgpNatJuridica.ItemIndex = 1 then
    edtCPFCNPJ.EditMask:= '99.999.999/9999-99;1;_'
  else
    edtCPFCNPJ.EditMask:= '999.999.999-99;1;_';
end;

procedure TfrmCadClientes.ScreenToModel;
begin
  FCliente.NomeReduzido := edtNome.Text;
  FCliente.RazaoSocial  := edtRazaoSocial.Text;

  if rgpNatJuridica.ItemIndex = 1 then
    FCliente.NatJuridica := 'J'
  else
    FCliente.NatJuridica := 'F';

  FCliente.CPFCNPJ      := SomenteNumeros(edtCPFCNPJ.Text);
  FCliente.DtNascimento := edtDtNascimento.Date;

  if FTipoOperacao = opInsert then
    FCliente.DtTmCadastro := Now;
end;

end.
