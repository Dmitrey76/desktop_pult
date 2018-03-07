unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Sockets, Unit2, IdBaseComponent,
  IdComponent, IdTCPServer;

const

  _Floor1_Seni     = $A1;
  _Floor1_Holl     = $A2;
  _Floor1_Kitchen  = $A3;
  _Floor1_Bathroom = $A4;
  _Floor1_Straits  = $A4;
  _Floor1_Living   = $A5;
  _Floor2_SleepRoom= $B1;
  _Floor2_Cabinet  = $B2;
  _Floor2_Child    = $B3;
  _Floor2_Balcony  = $B4;
  _Floor2_Straits  = $B5;

  _ButtonPref      = 'Set_Button_';

  _DefaultIP       = '192.168.1.177';
  _DefaultPort     = 738;

  _WM_SET_BUTTON   = WM_USER + 1;

type

  TfrmMain = class(TForm)
    Button1: TPanel;
    Button2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Set_Button_1: TPanel;
    Set_Button_2: TPanel;
    Set_Button_3: TPanel;
    Set_Button_4: TPanel;
    Set_Button_6: TPanel;
    Set_Button_5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Set_Button_7: TPanel;
    Set_Button_11: TPanel;
    Set_Button_8: TPanel;
    Set_Button_9: TPanel;
    Set_Button_10: TPanel;
    Button14: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    TcpServer: TTcpServer;
    Label5: TLabel;
    cbControllers: TComboBox;
    Button3: TButton;
    lbTime: TLabel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FDataSender : TDataSender;
    procedure RefreshControls;
    function SetButton (Index : byte; State : TButtonState): boolean;
    procedure AppOnMessage(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormShow(Sender: TObject);
begin

  Self.Left := 0;
  Self.Top := 0;
  Self.Width := Screen.Width;
  Self.Height := Screen.Height;

  RefreshControls ();

end;

procedure TfrmMain.Panel1Click(Sender: TObject);
var Data : TSendData;
begin

  Data.btOperation := coSet;
  Data.btDestination := TComponent(Sender).Tag;

  if cbControllers.Items.Count > 0 then
    FDataSender.SendData(Data, TTcpClient(cbControllers.Items.Objects[0]));

end;

procedure TfrmMain.RefreshControls;
var i, iCnt : integer;
    recData : TSendData;
begin

  iCnt := frmMain.ComponentCount - 1;

  for i := 0 to iCnt do

    if Pos(_ButtonPref, frmMain.Components[i].Name) > 0 then begin

      recData.btOperation := coRead;
      recData.btDestination := frmMain.Components[i].Tag;

      if cbControllers.Items.Count > 0 then
        FDataSender.SendData(recData, TTcpClient(cbControllers.Items.Objects[0]));

    end;

  FDataSender.GetData ();

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

  FDataSender := TDataSender.Create(TcpServer);
  Application.OnMessage := AppOnMessage;

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin

  FDataSender.Free ();

end;


procedure TfrmMain.AppOnMessage(var Msg: TMsg; var Handled: Boolean);
begin

  Handled:=False;

  if Msg.Message = _WM_SET_BUTTON then
    Handled := SetButton (Msg.wParam, TButtonState(Msg.lParam));

end;

function TfrmMain.SetButton(Index : byte; State : TButtonState): boolean;
var i, iCnt : integer;
    pnlCurrent : TPanel;
begin

  Result := False;

  iCnt := frmMain.ComponentCount - 1;

  case State of

      bsRefresh: begin

        FDataSender.Lock ();
        try
           cbControllers.Clear;
           cbControllers.Items.AddStrings (FDataSender.CurrentControllers);
           if cbControllers.Items.Count > 0 then
             cbControllers.ItemIndex := 0;
           Result := True;
        finally
           FDataSender.Unlock ();
        end;

    end;
    else
      for i := 0 to iCnt do

        if (Pos(_ButtonPref, frmMain.Components[i].Name) > 0) and (frmMain.Components[i].Tag = Index) then begin

          pnlCurrent := TPanel (frmMain.Components[i]);

          case State of

            bsOn: begin

                pnlCurrent.BevelInner := bvLowered;
                pnlCurrent.BevelOuter := bvLowered;
                pnlCurrent.Color := clRed;
                pnlCurrent.Font.Color := clYellow;

            end;

            bsOff: begin

                pnlCurrent.BevelInner := bvRaised;
                pnlCurrent.BevelOuter := bvRaised;
                pnlCurrent.Color := clBtnFace;
                pnlCurrent.Font.Color := clBlack;

            end;

            bsNone: begin

                pnlCurrent.BevelInner := bvRaised;
                pnlCurrent.BevelOuter := bvLowered;
                pnlCurrent.Color := clCream;
                pnlCurrent.Font.Color := clGray;

            end;

          end;

          Result := True;
          Break;

        end;

  end

end;


procedure TfrmMain.Button3Click(Sender: TObject);
begin
  PostMessage (Application.Handle, _WM_SET_BUTTON, 0, Byte (bsRefresh));
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
   lbTime.Caption := FormatDateTime ('hh:nn:ss'+#13#10+'dd mmm yyyy', Now());
end;

end.
