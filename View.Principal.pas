unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls, DataModule1,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmMenuPrincipal = class(TForm)
    stbPrincipal: TStatusBar;
    pgcTelas: TPageControl;
    mmnPrincipal: TMainMenu;
    miCadastros: TMenuItem;
    miClientes: TMenuItem;
    miAjuda: TMenuItem;
    miSobre: TMenuItem;
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnFecharTabClick(Sender: TObject);
  private
    { Private declarations }
    procedure AjustesTela;
    procedure ConfigurarMenus(AMenu: TMainMenu);
    procedure ConfigurarSubMenus(AMenu: TMenuItem);
    procedure AbrirMenu(Sender: TObject);

    function GetMenu(pCodigoForm: Integer): TForm;
  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

uses
  Utils, View.Geral.Clientes;

{$R *.dfm}

procedure TfrmMenuPrincipal.AbrirMenu(Sender: TObject);
var
  oForm: TForm;
  oTabSheet: TTabSheet;
  PanelTop: TPanel;
  BtnFechar: TButton;
begin
  try
    oForm:= GetMenu(TMenuItem(Sender).Tag);

    if Assigned(oForm) then
    begin
      oForm.BorderStyle := bsNone;
      oForm.FormStyle := fsNormal;
      oForm.Visible := False;

      if pgcTelas.Height < oForm.ClientHeight then
        pgcTelas.Height := oForm.ClientHeight;

      oTabSheet := TTabSheet.Create(pgcTelas);
      oTabSheet.PageControl := pgcTelas;
      oTabSheet.Caption := oForm.Caption;

      PanelTop := TPanel.Create(oTabSheet);
      PanelTop.Parent := oTabSheet;
      PanelTop.Align := alTop;
      PanelTop.Height := 32;
      PanelTop.BevelOuter := bvNone;
      PanelTop.Caption := '';

      BtnFechar := TButton.Create(PanelTop);
      BtnFechar.Parent := PanelTop;
      BtnFechar.Left := 5;
      BtnFechar.Top := 4;
      BtnFechar.Caption := 'Fechar';
      BtnFechar.OnClick := BtnFecharTabClick;
      BtnFechar.Tag := NativeInt(oTabSheet);

      oForm.Parent := oTabSheet;
      oForm.Align := alClient;
      oForm.Show;
    end;
  except
    on oErro: Exception do
    begin
      MsgErro(oErro.Message);
    end;
  end;
end;

procedure TfrmMenuPrincipal.AjustesTela;
begin
  stbPrincipal.Panels[0].Width:= Round(stbPrincipal.ClientWidth * 0.30);
  stbPrincipal.Panels[1].Width:= Round(stbPrincipal.ClientWidth * 0.50);
  stbPrincipal.Panels[2].Width:= Round(stbPrincipal.ClientWidth * 0.20)
end;

procedure TfrmMenuPrincipal.BtnFecharTabClick(Sender: TObject);
var
  Tab: TTabSheet;
  i: Integer;
  Form: TForm;
begin
  // The button's Parent is PanelTop, PanelTop.Parent is Tab
  if Sender is TButton then
    Tab := TTabSheet(TButton(Sender).Parent.Parent)
  else if Sender is TSpeedButton then
    Tab := TTabSheet(TSpeedButton(Sender).Parent.Parent)
  else
    Exit;

  // Find embedded form
  Form := nil;
  for i := 0 to Tab.ControlCount - 1 do
    if Tab.Controls[i] is TForm then
    begin
      Form := TForm(Tab.Controls[i]);
      Break;
    end;

  if Assigned(Form) then
    Form.Free;  // or Form.Close; if you configured CloseAction=caFree

  Tab.Free;
end;

procedure TfrmMenuPrincipal.ConfigurarMenus(AMenu: TMainMenu);
var
  I: Integer;
  Item: TMenuItem;
begin
  for I := 0 to AMenu.Items.Count - 1 do
  begin
    Item := AMenu.Items[I];

    if Item.Tag > 0 then
      Item.OnClick := AbrirMenu;

    if Item.Count > 0 then
      ConfigurarSubMenus(Item);
  end;
end;

procedure TfrmMenuPrincipal.ConfigurarSubMenus(AMenu: TMenuItem);
var
  I: Integer;
  Item: TMenuItem;
begin
  for I := 0 to AMenu.Count - 1 do
  begin
    Item := AMenu.Items[I];

    if Item.Tag > 0 then
      Item.OnClick := AbrirMenu;

    if Item.Count > 0 then
      ConfigurarSubMenus(Item);
  end;
end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
begin
  ConfigurarMenus(mmnPrincipal);
end;

procedure TfrmMenuPrincipal.FormResize(Sender: TObject);
begin
  AjustesTela;
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin
  AjustesTela;
end;

function TfrmMenuPrincipal.GetMenu(pCodigoForm: Integer): TForm;
begin
  if pCodigoForm > 0 then
  begin
    case pCodigoForm of
      cFORMCLIENTES:
        begin
          frmClientesGeral:= TfrmClientesGeral.Create(Self);
          Result:= frmClientesGeral;
        end;
    end;
  end;
end;

procedure TfrmMenuPrincipal.Timer1Timer(Sender: TObject);
begin
  stbPrincipal.Panels[2].Text:= FormatDateTime('DD/MM/YYYY HH:NN:SS', NOW);
end;

end.
