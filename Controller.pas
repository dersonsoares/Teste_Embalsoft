unit Controller;

interface

uses
  System.SysUtils, System.Rtti, System.TypInfo, Data.DB, Data.SqlExpr, Models,
  DataModule1, Utils,FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TController = class
  public
    class procedure Action(AObject: TModel; AAction: TTipoOperacao);
  private
    class procedure SetParameters(AQuery: TFDQuery; AModel: TModel);
  end;

implementation


{ TController }

class procedure TController.Action(AObject: TModel; AAction: TTipoOperacao);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Datamodelo1.Conexao;

    case AAction of
      opInsert : Query.SQL.Text := AObject.GetInsertSQL;
      opUpdate : Query.SQL.Text := AObject.GetUpdateSQL;
      opDelete : Query.SQL.Text := AObject.GetDeleteSQL;
    end;

    SetParameters(Query, AObject);

    if not Datamodelo1.Conexao.InTransaction then
      Datamodelo1.Conexao.StartTransaction;
    try
      Query.ExecSQL;
      Datamodelo1.Conexao.Commit;
    except
      Datamodelo1.Conexao.Rollback;
      raise;
    end;

  finally
    Query.Free;
  end;
end;

class procedure TController.SetParameters(AQuery: TFDQuery; AModel: TModel);
var
  Context: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
  Param: TFDParam;
  Value: TValue;
  I: Integer;
  RttiPropertyType: TRttiType;
begin
  Context := TRttiContext.Create;
  try
    RttiType := Context.GetType(AModel.ClassType);
    for I := 0 to AQuery.Params.Count - 1 do
    begin
      Param := AQuery.Params[I];
      RttiProperty := RttiType.GetProperty(Param.Name);
      if not Assigned(RttiProperty) then
        Continue;

      Value := RttiProperty.GetValue(AModel);

      if Value.IsEmpty then
      begin
        Param.Clear;
        Param.DataType := ftUnknown;
        Continue;
      end;

      case RttiProperty.PropertyType.TypeKind of
        tkInteger, tkInt64:
          Param.AsLargeInt := Value.AsInt64;
        tkString, tkLString, tkWString, tkUString, tkChar, tkWChar:
          Param.AsString := Value.AsString;
        tkFloat:
          begin
            if RttiProperty.PropertyType.Handle = TypeInfo(TDateTime) then
              Param.AsDateTime := Value.AsType<TDateTime>
            else
              Param.AsFloat := Value.AsExtended;
          end;
        tkEnumeration:
          if RttiProperty.PropertyType.Handle = TypeInfo(Boolean) then
            Param.AsInteger := Value.AsOrdinal
      else
        raise Exception.CreateFmt('Tipo não tratado para a propriedade %s.', [RttiProperty.Name]);
      end;
    end;
  finally
    Context.Free;
  end;
end;


end.

