unit FMX.Router;

interface

uses
  System.Generics.Collections,
  FMX.Forms,
  FMX.Controls,
  FMX.Router.Contract,
  FMX.Types,
  FMX.Route.Contract;

type

  TRouter = class(TInterfacedObject, IRouter)
  private
    { private declarations }
    FRoutes: TArray<IRoute>;
    FStack: TStack<TPair<IRoute, TFrame>>;
  protected
    { protected declarations }
    function CreateFrameInstance(AFrameClass: TFrameClass; AOutlet: TControl; ARoot: IRoot): TFrame;
    procedure InternalNavigate(APath: string);
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
    function Routes(ARoutes: TArray<IRoute>): IRouter;
    procedure Init;
    function Navigate(APath: string): IRouter;
    class function New: IRouter;
  end;

implementation

uses
  System.Hash,
  System.SysUtils;

{ TRouter }

constructor TRouter.Create;
begin
  FStack := TStack < TPair < IRoute, TFrame >>.Create;
end;

function TRouter.CreateFrameInstance(AFrameClass: TFrameClass; AOutlet: TControl; ARoot: IRoot): TFrame;
var
  LInstance: TFrame;
begin
  LInstance := TFrame(AFrameClass.NewInstance);
  LInstance.Create(TForm(ARoot));
  LInstance.Name := LInstance.Name + '_' + FormatDateTime('yyyy_dd_mm_hh_nn_ss_zzz', Now()) + '_' + Random(100).ToString + Random(100).ToString;
  TForm(ARoot).InsertComponent(LInstance);
  LInstance.Parent := AOutlet;
  LInstance.RecalcSize;
  Result := LInstance;
end;

destructor TRouter.Destroy;
begin
  FStack.Free;
  inherited;
end;

procedure TRouter.Init;
begin
  InternalNavigate('');
end;

procedure TRouter.InternalNavigate(APath: string);
var
  I: Integer;
  LRouteHack: IRouteHack;
  LPath: string;
  LOutlet: TControl;
  LComponent: TFrameClass;
  LFrame: TFrame;
  LPair: TPair<IRoute, TFrame>;
begin
  for I := Low(FRoutes) to High(FRoutes) do
  begin
    if Supports(FRoutes[I], IRouteHack, LRouteHack) then
    begin
      LRouteHack
        .GetPath(LPath)
        .GetOutlet(LOutlet)
        .GetComponent(LComponent);
      if LPath = APath then
      begin
        LFrame := CreateFrameInstance(LComponent, LOutlet, LOutlet.Root);
        LPair := TPair<IRoute, TFrame>.Create(FRoutes[I], LFrame);
        if FStack.Count > 0 then
          FStack.Peek.Value.Parent := nil;
        FStack.Push(LPair);
        Break;
      end;
    end;
  end;

end;

function TRouter.Navigate(APath: string): IRouter;
begin
  Result := Self;
  InternalNavigate(APath);
end;

class function TRouter.New: IRouter;
begin
  Result := TRouter.Create;
end;

function TRouter.Routes(ARoutes: TArray<IRoute>): IRouter;
begin
  Result := Self;
  FRoutes := FRoutes + ARoutes;
end;

end.
