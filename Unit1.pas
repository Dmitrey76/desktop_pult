unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TControlOrder = (coLed, coPower, coNone);

  TPanelButton = class (TPanel)
    private
      FControlType : integer;
      FControlOrder : TControlOrder;
  end;

  TForm1 = class(TForm)
    Button1: TPanel;
    Button2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button3: TPanel;
    Button4: TPanel;
    Button5: TPanel;
    Button6: TPanel;
    Button7: TPanel;
    Button8: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button9: TPanel;
    Button10: TPanel;
    Button11: TPanel;
    Button12: TPanel;
    Button13: TPanel;
    Button14: TPanel;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin

  Self.Left := 0;
  Self.Top := 0;
  Self.Width := Screen.Width;
  Self.Height := Screen.Height;
  button1.Brush.Color := clGreen;

end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

  if TPanel(Sender).BevelInner = bvRaised then begin

    TPanel(Sender).BevelInner := bvLowered;
    TPanel(Sender).BevelOuter := bvLowered;
    TPanel(Sender).Color := clRed;
    TPanel(Sender).Font.Color := clYellow;

  end
  else begin

    TPanel(Sender).BevelInner := bvRaised;
    TPanel(Sender).BevelOuter := bvRaised;
    TPanel(Sender).Color := clBtnFace;
    TPanel(Sender).Font.Color := clBlack;
    
  end;


end;

end.
