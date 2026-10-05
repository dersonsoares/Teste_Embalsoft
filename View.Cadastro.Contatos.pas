unit View.Cadastro.Contatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Utils, MOdels, Vcl.StdCtrls, Controller,
  Vcl.Buttons, Vcl.ExtCtrls, Data.Db;

type
  TfrmCadContatos = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtNome: TEdit;
    GroupBox2: TGroupBox;
    edtEmail: TEdit;
    Panel2: TPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    FTipoOperacao: TTipoOperacao;
    FContato: TContato;
    FDataSetContatos: TDataSet;
    FIDCliente: Integer;

    procedure ModelToScreen;
    procedure ScreenToModel;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; pTpOperacao: TTipoOperacao; ADataSet: TDataSet; pIdCliente: Integer);

    property TipoOperacao: TTipoOperacao read FTipoOperacao write FTipoOperacao;
    property DataSetContatos: TDataSet read FDataSetContatos write FDataSetContatos;
  end;

var
  frmCadContatos: TfrmCadContatos;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmCadContatos.BitBtn5Click(Sender: TObject);
begin
  ScreenToModel;
  try
    TController.Action(FContato, FTipoOperacao);
    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao salvar o contato: ' + E.Message);
      ModalResult := mrNone;
    end;
  end;
end;

constructor TfrmCadContatos.Create(AOwner: TComponent; pTpOperacao: TTipoOperacao;
  ADataSet: TDataSet; pIdCliente: Integer);
begin
  inherited Create(AOwner);
  FTipoOperacao:= pTpOperacao;
  FDataSetContatos:= ADataSet;
  FIdCliente:= pIdCliente;
end;

procedure TfrmCadContatos.FormCreate(Sender: TObject);
begin
  FContato := TContato.Create;
end;

procedure TfrmCadContatos.FormDestroy(Sender: TObject);
begin
  FContato.Free;
end;

procedure TfrmCadContatos.FormShow(Sender: TObject);
begin
  if Assigned(FDataSetContatos) and not FDataSetContatos.IsEmpty then
    FContato.LoadFromDataSet(FDataSetContatos);

  if FTipoOperacao = opInsert then
    FContato.IdCliente := FIDCliente
  else if FTipoOperacao = opUpdate then
  begin
    ModelToScreen;
  end;
end;

procedure TfrmCadContatos.ModelToScreen;
begin
  edtNome.Text    := FContato.Nome;
  edtEmail.Text   := FContato.Email;
end;

procedure TfrmCadContatos.ScreenToModel;
begin
  FContato.Nome := edtNome.Text;
  FContato.Email:= edtEmail.Text;
end;

end.
