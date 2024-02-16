unit FMX.Route;

interface

uses
  FMX.Controls,
  FMX.Route.Contract;

type

  TRoute = class(TInterfacedObject, IRoute, IRouteHack)
  private
    { private declarations }
    FOutlet: TControl;
    FComponent: TFrameClass;
    FPath: string;
  protected
    { protected declarations }
  public
    { public declarations }
    function Outlet(AOutlet: TControl): IRoute;
    function Path(APath: string): IRoute;
    function Component(AComponent: TFrameClass): IRoute;
    function GetOutlet(out AOutlet: TControl): IRouteHack;
    function GetPath(out APath: string): IRouteHack;
    function GetComponent(out AComponent: TFrameClass): IRouteHack;
    class function New: IRoute;
  end;

implementation

{ TRoute }

function TRoute.Component(AComponent: TFrameClass): IRoute;
begin
  Result := Self;
  FComponent := AComponent;
end;

function TRoute.GetComponent(out AComponent: TFrameClass): IRouteHack;
begin
  Result := Self;
  AComponent := FComponent;
end;

function TRoute.GetOutlet(out AOutlet: TControl): IRouteHack;
begin
  Result := Self;
  AOutlet := FOutlet;
end;

function TRoute.GetPath(out APath: string): IRouteHack;
begin
  Result := Self;
  APath := FPath;
end;

class function TRoute.New: IRoute;
begin
  Result := TRoute.Create;
end;

function TRoute.Outlet(AOutlet: TControl): IRoute;
begin
  Result := Self;
  FOutlet := AOutlet;
end;

function TRoute.Path(APath: string): IRoute;
begin
  Result := Self;
  FPath := APath;
end;

end.
