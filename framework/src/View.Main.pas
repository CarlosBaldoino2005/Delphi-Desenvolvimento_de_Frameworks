unit View.Main;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Router.Contract,
  FMX.Router, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TMainView = class(TForm)
    LayoutMainOutlet: TLayout;
    Layout1: TLayout;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FRouter: IRouter;
  public
    { Public declarations }
  end;

var
  MainView: TMainView;

implementation

uses
  View.Home,
  View.Auth,
  FMX.Route;

{$R *.fmx}


procedure TMainView.Button1Click(Sender: TObject);
begin
  FRouter.Navigate('');
end;

procedure TMainView.Button2Click(Sender: TObject);
begin
  FRouter.Navigate('auth');
end;

procedure TMainView.FormCreate(Sender: TObject);
begin
  FRouter := TRouter.New;
end;

procedure TMainView.FormShow(Sender: TObject);
begin
  FRouter.Routes(
    [

    TRoute.New
    .Path('')
    .Outlet(LayoutMainOutlet)
    .Component(THomeView),

    TRoute.New
    .Path('auth')
    .Outlet(LayoutMainOutlet)
    .Component(TAuthView)

    ]

    ).Init;
end;

end.
