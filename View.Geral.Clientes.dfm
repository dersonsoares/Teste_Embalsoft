object frmClientesGeral: TfrmClientesGeral
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 398
  ClientWidth = 969
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 969
    Height = 34
    Align = alTop
    TabOrder = 0
    object Label1Localizar: TLabel
      Left = 9
      Top = 8
      Width = 59
      Height = 18
      Caption = 'Localizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1Localizar: TEdit
      Left = 75
      Top = 5
      Width = 391
      Height = 21
      TabOrder = 0
    end
    object Btn_ProcurarSelecionar: TBitBtn
      Left = 472
      Top = 3
      Width = 113
      Height = 26
      Caption = '&Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFD1D1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9898980000
        00D2D2D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A5000000999999FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF999999000000A6A6A6FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4EAEAEAFFFFFF
        FFFFFFFFFFFF9E9E9E000000999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF535353000000000000000000000000ABABABA7
        A7A70000009E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF5F5F5000000000000A8A8A8DFDFDFD4D4D47E7E7E000000000000A6A6
        A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A
        2A2A0A0A0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D4000000B4B4B4FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D8D8000000E6E6
        E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF878787000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888880B0B0BFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D6000000EAEAEAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878191919FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE5E5E5000000E3E3E3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFB6B6B6000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFB2B2B2000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000696969FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF080808414141FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFB9B9B9000000686868FFFFFFFFFFFFFFFFFFF4F4F411111100
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFB8B8B80000000000001919190F0F0F0000001D1D1DEFEFEFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFB4B4B47474747F7F7FCBCBCBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 34
    Width = 969
    Height = 332
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 240
    ExplicitTop = 184
    ExplicitWidth = 185
    ExplicitHeight = 41
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 967
      Height = 330
      ActivePage = page_contatos
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      HotTrack = True
      MultiLine = True
      ParentFont = False
      TabOrder = 0
      OnChange = PageControl1Change
      ExplicitHeight = 323
      object Page_clientes: TTabSheet
        Caption = 'Clientes'
        ExplicitHeight = 278
        object grdClientes: TDBGrid
          Left = 0
          Top = 0
          Width = 959
          Height = 285
          Align = alClient
          Color = clWhite
          DataSource = Datamodelo1.dsClientes
          FixedColor = 14898176
          GradientEndColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'NomeReduzido'
              Title.Caption = 'Nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RazaoSocial'
              Title.Caption = 'Raz'#227'o Social'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dsNatJuridica'
              Title.Caption = 'Nat. Jur'#237'dica'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPFCNPJ'
              Title.Caption = 'CPF/CNPJ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DtNascimento'
              Title.Caption = 'Dt. Nascimento'
              Width = 150
              Visible = True
            end>
        end
        object Panel8: TPanel
          Left = 0
          Top = 285
          Width = 959
          Height = 17
          Align = alBottom
          BevelInner = bvLowered
          BorderWidth = 1
          TabOrder = 1
          ExplicitTop = 261
          object Panel10: TPanel
            Left = 748
            Top = 3
            Width = 208
            Height = 11
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 0
              Top = -2
              Width = 208
              Height = 13
              Align = alBottom
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Registros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
      object page_contatos: TTabSheet
        Caption = 'Contatos'
        ImageIndex = 1
        ExplicitHeight = 278
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 959
          Height = 24
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = 14898176
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          object Label3: TLabel
            Left = 4
            Top = 2
            Width = 100
            Height = 18
            AutoSize = False
            Caption = 'Raz'#227'o Social:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText1: TDBText
            Left = 110
            Top = 2
            Width = 361
            Height = 19
            Color = clSilver
            DataField = 'RazaoSocial'
            DataSource = Datamodelo1.dsClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
        object grdContatos: TDBGrid
          Left = 0
          Top = 24
          Width = 959
          Height = 261
          Align = alClient
          Color = clWhite
          Ctl3D = True
          DataSource = Datamodelo1.dsContatos
          FixedColor = 16767425
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'Nome'
              Width = 364
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Email'
              Title.Caption = 'E-mail'
              Width = 388
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 0
          Top = 285
          Width = 959
          Height = 17
          Align = alBottom
          BevelInner = bvLowered
          BorderWidth = 1
          TabOrder = 2
          ExplicitTop = 303
          ExplicitWidth = 831
          object Panel9: TPanel
            Left = 748
            Top = 3
            Width = 208
            Height = 11
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object Label4: TLabel
              Left = 0
              Top = -2
              Width = 208
              Height = 13
              Align = alBottom
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Registros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 366
    Width = 969
    Height = 32
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 267
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 967
      Height = 30
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 1
      TabOrder = 0
      ExplicitLeft = 111
      ExplicitTop = 3
      ExplicitWidth = 738
      ExplicitHeight = 29
      object Panel7: TPanel
        Left = 137
        Top = 2
        Width = 828
        Height = 26
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 281
        ExplicitWidth = 595
        ExplicitHeight = 35
        object Panel266666666: TPanel
          Left = 567
          Top = 0
          Width = 261
          Height = 26
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitLeft = 334
          ExplicitHeight = 35
          object PNL_PExcluir: TPanel
            Left = 175
            Top = 0
            Width = 86
            Height = 26
            Align = alRight
            TabOrder = 0
            ExplicitHeight = 35
            object BTN_Excluir: TBitBtn
              Left = 0
              Top = 0
              Width = 87
              Height = 26
              Caption = 'E&xcluir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              Glyph.Data = {
                E6040000424DE604000000000000360000002800000014000000140000000100
                180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0
                F0777777767676777777777777777777777777777777777777767676777777F1
                F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1C1C040404
                2323231F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F232323030303242424FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000A3A3A3FFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A2000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF020202959595FFFFFFCFCFCF8A8A
                8AFFFFFFFFFFFF8A8A8ACFCFCFFFFFFF959595030303FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF020202959595FFFFFF949494000000FFFFFF
                FFFFFF000000949494FFFFFF959595030303FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF020202959595FFFFFF9A9A9A0A0A0AFFFFFFFFFFFF0A
                0A0A9A9A9AFFFFFF959595030303FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFF020202959595FFFFFF9A9A9A0A0A0AFFFFFFFFFFFF0A0A0A9A9A
                9AFFFFFF959595030303FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF020202959595FFFFFF9A9A9A0A0A0AFFFFFFFFFFFF0A0A0A9A9A9AFFFFFF
                959595030303FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0202
                02959595FFFFFF9A9A9A0A0A0AFFFFFFFFFFFF0A0A0A9A9A9AFFFFFF95959503
                0303FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF020202959595
                FFFFFF9A9A9A0A0A0AFFFFFFFFFFFF0A0A0A9A9A9AFFFFFF959595030303FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF020202959595FFFFFF98
                9898050505FFFFFFFFFFFF050505989898FFFFFF959595030303FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF020202959595FFFFFFA6A6A62929
                29FFFFFFFFFFFF292929A6A6A6FFFFFF959595030303FFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFF0303039C9C9CFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFF9C9C9C050505FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFCDCDCD0000005C5C5CAAAAAAA6A6A6A8A8A8A7A7A7A7A7A7A8
                A8A8A6A6A6AAAAAA5C5C5C000000CDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFF4D4D4D0A0A0A0B0B0B0606060000000000000000000000000000000000
                000606060B0B0B0A0A0A4D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFA2A2A27B7B7B7F7F7F7F7F7F7B7B7BA2A2A2FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF}
              ParentFont = False
              TabOrder = 0
              OnClick = BTN_ExcluirClick
            end
          end
          object PNL_PInclusao: TPanel
            Left = 3
            Top = 0
            Width = 86
            Height = 26
            Align = alRight
            TabOrder = 1
            ExplicitHeight = 35
            object BTN_Incluir: TBitBtn
              Left = 0
              Top = 0
              Width = 87
              Height = 26
              Caption = '&Incluir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              Glyph.Data = {
                E6040000424DE604000000000000360000002800000014000000140000000100
                180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF5B5B5B5B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF474747474747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4B4B
                4B4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4B4B4B4B4BFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF525252525252FFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF5B5B5B4848484B4B4B4B4B4B5252521414141414145252524B4B4B4B4B4B
                4848485C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C
                5C4848484B4B4B4B4B4B5353531414141414145353534B4B4B4B4B4B4848485C
                5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFF525252525252FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFF4B4B4B4B4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FF4B4B4B4B4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF474747
                474747FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B5B5B5BFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF}
              ParentFont = False
              TabOrder = 0
              OnClick = BTN_IncluirClick
            end
          end
          object PNL_PEdicao: TPanel
            Left = 89
            Top = 0
            Width = 86
            Height = 26
            Align = alRight
            TabOrder = 2
            ExplicitHeight = 35
            object BTN_Editar: TBitBtn
              Left = 0
              Top = 0
              Width = 87
              Height = 26
              Caption = '&Editar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              Glyph.Data = {
                E6040000424DE604000000000000360000002800000014000000140000000100
                180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF7575756F6F
                6FD9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7676760000001D1D1D000000
                D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7070701D1D1DFFFFFF525252000000E2
                E2E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFD9D9D9000000535353FFFFFF606060000000DADA
                DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFD8D8D8000000606060FFFFFF5A5A5A000000DADADA
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFE2E2E20000005B5B5BFFFFFF5B5B5B000000E2E2E2FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFDADADA0000005B5B5BFFFFFF606060000000D7D7D7FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFDADADA000000606060FFFFFF525252000000E2E2E2FFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFE2E2E2000000535353FFFFFF606060000000DADADAFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFD8D8D8000000606060FFFFFF5A5A5A000000DADADAFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFE2E2E20000005B5B5BFFFFFF666666000000D4D4D4FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFDADADA000000676767838383000000CACACAFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFDADADA000000000000D7D7D7FFFFFF060606DBDBDBFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFD5D5D5CACACAFFFFFF000000000000242424FFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFF060606000000000000A4A4A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                D7D7D7202020A5A5A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF}
              ParentFont = False
              TabOrder = 0
              OnClick = BTN_EditarClick
            end
          end
        end
      end
      object pnl_relatorios: TPanel
        Left = 2
        Top = 2
        Width = 135
        Height = 26
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 35
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 0
          Width = 135
          Height = 26
          DataSource = Datamodelo1.dsClientes
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alClient
          Flat = True
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          ExplicitLeft = 5
          ExplicitTop = 5
          ExplicitWidth = 98
          ExplicitHeight = 19
        end
      end
    end
  end
end
