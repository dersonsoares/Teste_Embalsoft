object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste - Embalsoft'
  ClientHeight = 558
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmnPrincipal
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 288
    Top = 256
    Width = 23
    Height = 22
  end
  object stbPrincipal: TStatusBar
    Left = 0
    Top = 539
    Width = 906
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 50
      end>
    ExplicitTop = 545
  end
  object pgcTelas: TPageControl
    Left = 0
    Top = 0
    Width = 906
    Height = 539
    Align = alClient
    TabOrder = 1
    ExplicitTop = -6
  end
  object mmnPrincipal: TMainMenu
    Left = 200
    Top = 32
    object miCadastros: TMenuItem
      Caption = 'Cadastros'
      object miClientes: TMenuItem
        Tag = 1
        Caption = 'Clientes'
      end
    end
    object miAjuda: TMenuItem
      Caption = 'Ajuda'
      object miSobre: TMenuItem
        Caption = 'Sobre o Sistema'
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 496
    Top = 160
  end
end
