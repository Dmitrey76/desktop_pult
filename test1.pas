unit test1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Sockets, StdCtrls, IdBaseComponent, IdComponent, IdTCPServer,
  ExtCtrls;

type
  TForm1 = class(TForm)
    TcpClient1: TTcpClient;
    Button1: TButton;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    procedure TcpClient1Receive(Sender: TObject; Buf: PAnsiChar;
      var DataLen: Integer);
    procedure TcpClient1Send(Sender: TObject; Buf: PAnsiChar;
      var DataLen: Integer);
    procedure Button1Click(Sender: TObject);
    procedure TcpClient1Connect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TcpServer1Accept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TControlOperation = (coSet, coRead, coReset);

  TButtonState = (bsOn, bsOff, bsNone);

  TSendData = record
     btOperation : TControlOperation;
     btDestination : byte;
     btState : TButtonState;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.TcpClient1Receive(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
var Data : TSendData;
begin

  Move (Buf, Data, DataLen);
  Edit1.Text := IntToStr (Data.btDestination);
  CheckBox1.Checked := (Data.btState = bsOn);

end;

procedure TForm1.TcpClient1Send(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
begin
  ;
end;

procedure TForm1.Button1Click(Sender: TObject);
var Data : TSendData;
begin

   Data.btDestination := StrToInt (Edit1.Text);

   if not TcpClient1.Active then
     TcpClient1.Active := True;

   if CheckBox1.Checked then
     Data.btState := bsOn
   else
     Data.btState := bsOff;

   TcpClient1.SendBuf(Data, sizeof (TSendData));

end;

procedure TForm1.TcpClient1Connect(Sender: TObject);
begin

  Label1.Caption := 'Connected!';

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  TcpClient1.Active := True;

end;

procedure TForm1.TcpServer1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);
begin
  ShowMessage ('1');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var Data : TSendData;
begin

  if  TcpClient1.Connected and ( TcpClient1.WaitForData()) then begin

    TcpClient1.ReceiveBuf(Data, sizeof(TSendData));
    Label2.caption := IntToStr (Data.btDestination);
    CheckBox1.Checked := (Data.btState = bsOn);
    Application.ProcessMessages;

  end;


end;

end.
