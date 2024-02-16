unit FMX.Router.Contract;

interface

uses

  FMX.Route.Contract;

type

  IRouter = interface
    ['{934C3557-D76D-4393-8043-4C6E82BE717D}']
    function Routes(ARoutes: TArray<IRoute>): IRouter;
    function Navigate(APath: string): IRouter;
    procedure Init;
  end;

implementation

end.
