program framework_base;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Main in 'src\View.Main.pas' {MainView},
  View.Home in 'src\views\View.Home.pas' {HomeView: TFrame},
  FMX.Route.Contract in 'src\router\FMX.Route.Contract.pas',
  FMX.Route in 'src\router\FMX.Route.pas',
  View.Auth in 'src\views\View.Auth.pas' {AuthView: TFrame},
  FMX.Router.Contract in 'src\router\FMX.Router.Contract.pas',
  FMX.Router in 'src\router\FMX.Router.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.
