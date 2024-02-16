unit FMX.Route.Contract;

interface

uses
  FMX.Forms,
  FMX.Controls;

type

  TFrameClass = class of TFrame;

  IRoute = interface
    ['{22B84762-2504-4446-957C-10CDA12C265A}']
    function Outlet(AOutlet: TControl): IRoute;
    function Path(APath: string): IRoute;
    function Component(AComponent: TFrameClass): IRoute;
  end;

  IRouteHack = interface
    ['{84C2A171-E9F5-493B-B525-C2D93040E516}']
    function GetOutlet(out AOutlet: TControl): IRouteHack;
    function GetPath(out APath: string): IRouteHack;
    function GetComponent(out AComponent: TFrameClass): IRouteHack;
  end;

implementation

end.
