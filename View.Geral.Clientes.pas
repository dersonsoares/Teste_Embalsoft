unit View.Geral.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids, DataModule1,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Utils, Models,
  Data.FMTBcd, Data.SqlExpr, Controller;

type
  TfrmClientesGeral = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1Localizar: TLabel;
    Edit1Localizar: TEdit;
    Btn_ProcurarSelecionar: TBitBtn;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel266666666: TPanel;
    PNL_PExcluir: TPanel;
    BTN_Excluir: TBitBtn;
    PNL_PInclusao: TPanel;
    BTN_Incluir: TBitBtn;
    PNL_PEdicao: TPanel;
    BTN_Editar: TBitBtn;
    pnl_relatorios: TPanel;
    DBNavigator1: TDBNavigator;
    PageControl1: TPageControl;
    Page_clientes: TTabSheet;
    grdClientes: TDBGrid;
    Panel8: TPanel;
    Panel10: TPanel;
    Label1: TLabel;
    page_contatos: TTabSheet;
    Panel11: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    grdContatos: TDBGrid;
    Panel4: TPanel;
    Panel9: TPanel;
    Label4: TLabel;
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTN_IncluirClick(Sender: TObject);
    procedure BTN_EditarClick(Sender: TObject);
    procedure BTN_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirCliente(pTpOperacao: TTipoOperacao);
    procedure AbrirContato(pTpOperacao: TTipoOperacao);
    procedure QryAfterOpen(DataSet: TDataSet);
    procedure QryContatosAfterOpen(DataSet: TDataSet);
  public
    { Public declarations }
  end;

var
  frmClientesGeral: TfrmClientesGeral;

implementation

uses
  View.Cadastro.Clientes, view.Cadastro.Contatos;

{$R *.dfm}

procedure TfrmClientesGeral.AbrirCliente(pTpOperacao: TTipoOperacao);
var
  Frm: TfrmCadClientes;
   vCliente: TCliente;
begin
  if pTpOperacao = opDelete then
  begin
    if MsgConfirmacao('Deseja Excluir o Cliente?') then
    begin
      try
        vCliente:= TCliente.Create;
        vCliente.LoadFromDataSet(Datamodelo1.qryClientes);
        TController.Action(vCliente, pTpOperacao);
      finally
        FreeAndNil(vCliente);
      end;
    end;
  end
  else
  begin
    Frm := TfrmCadClientes.Create(Self, pTpOperacao, Datamodelo1.qryClientes);
    try
      if Frm.ShowModal = mrOk then
        Datamodelo1.qryClientes.Refresh;
    finally
      Frm.Free;
    end;
  end;
end;

procedure TfrmClientesGeral.AbrirContato(pTpOperacao: TTipoOperacao);
var
  Frm: TfrmCadContatos;
  vContato: TContato;
begin
  if pTpOperacao = opDelete then
  begin
    if MsgConfirmacao('Deseja Excluir o Contato?') then
    begin
      try
        vContato:= TContato.Create;
        vContato.LoadFromDataSet(Datamodelo1.qryContatos);
        TController.Action(vContato, pTpOperacao);
      finally
        FreeAndNil(vContato);
      end;
    end;
  end
  else
  begin
    Frm := TfrmCadContatos.Create(Self, pTpOperacao, Datamodelo1.qryContatos, Datamodelo1.qryClientes.FieldByName('IdCliente').AsInteger);
    try
      if Frm.ShowModal = mrOk then
        Datamodelo1.qryContatos.Refresh;
    finally
      Frm.Free;
    end;
  end;
end;

procedure TfrmClientesGeral.BTN_EditarClick(Sender: TObject);
begin
  if PageControl1.ActivePage = Page_clientes then
    AbrirCliente(opUpdate)
  else
    AbrirContato(opUpdate);
end;

procedure TfrmClientesGeral.BTN_ExcluirClick(Sender: TObject);
begin
  if PageControl1.ActivePage = Page_clientes then
    AbrirCliente(opDelete)
  else
    AbrirContato(opDelete);
end;

procedure TfrmClientesGeral.BTN_IncluirClick(Sender: TObject);
begin
  if PageControl1.ActivePage = Page_clientes then
    AbrirCliente(opInsert)
  else
    AbrirContato(opInsert);
end;

procedure TfrmClientesGeral.FormShow(Sender: TObject);
begin
  Datamodelo1.qryClientes.Close;
  Datamodelo1.qryClientes.AfterOpen:= QryAfterOpen;
  Datamodelo1.qryClientes.Open;
end;

procedure TfrmClientesGeral.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = Page_clientes then
  begin
    Datamodelo1.qryClientes.Close;
    Datamodelo1.qryClientes.AfterOpen:= QryAfterOpen;
    Datamodelo1.qryClientes.Open;
  end
  else if PageControl1.ActivePage = page_contatos then
  begin
    Datamodelo1.qryContatos.Close;
    Datamodelo1.qryContatos.AfterOpen:= QryContatosAfterOpen;
    Datamodelo1.qryContatos.ParamByName('IdCliente').Value:= Datamodelo1.qryClientes.FieldByName('IdCliente').Value;
    Datamodelo1.qryContatos.Open;
  end;
end;

procedure TfrmClientesGeral.QryAfterOpen(DataSet: TDataSet);
begin
  label1.Caption:= IntToStr(DataSet.RecordCount) + ' Registros encontrados.';
end;

procedure TfrmClientesGeral.QryContatosAfterOpen(DataSet: TDataSet);
begin
  label4.Caption:= IntToStr(DataSet.RecordCount) + ' Registros encontrados.';
end;

end.
