unit unit2;

interface

uses Sockets, SysUtils, Classes, Dialogs;

implementation

uses Unit1;

type

  DataSender = class (TObject)
  private
    FIPAddress : string;
    FPort : byte;
    FServer : TTCPServer;
    FClient : TTCPClient;
    FDataStream : TMemoryStream;
    procedure TcpServer1Accept(Sender: TObject;
                ClientSocket: TCustomIpClient);
    procedure TcpClientReceive(Sender: TObject; Buf: PAnsiChar;
                var DataLen: Integer);

  public
    constructor Create (IPAddress : string; Port : byte);
    destructor Destroy (); override;
    procedure StartServer ();
    procedure StartClient ();
    function CheckConnection : boolean;
    function SendData (Data : TSendData) : boolean;
    function GetData () : TSendData;
  end;

{ Sender }

function DataSender.CheckConnection: boolean;
begin

  Result := True;
  try

    StartServer ();
    StartClient ();
    
  except
    Result := False;
  end;

end;

constructor DataSender.Create (IPAddress : string; Port : byte);
begin

  FIPAddress := IPAddress ;
  FPort := Port;
  FServer := TTCPServer.Create (frmMain);
  FServer.OnAccept := TcpServer1Accept;
  FClient := TTCPClient.Create (frmMain);
  FClient.OnReceive := TcpClientReceive;
  FDataStream := TMemoryStream.Create ();

end;

destructor DataSender.Destroy;
begin

  inherited Destroy ();

  FServer.Active := False;
  FClient.Active := False;

  FServer.Free ();
  FClient.Free ();
  FDataStream.Free ();

end;

function DataSender.GetData: TSendData;
begin

  ShowMessage (IntToStr(FDataStream.Size));

end;

function DataSender.SendData(Data: TSendData): boolean;
begin

  Result := (FClient.SendBuf(Data, sizeof(TSendData)) = sizeof(TSendData));

end;

procedure DataSender.StartClient;
begin

  FClient.Active := False;
  FClient.RemoteHost := FIPAddress;
  FClient.RemotePort := IntToStr(FPort);
  FClient.Active := True;
  
end;

procedure DataSender.StartServer;
begin

  FServer.Active := False;
  FServer.LocalHost := '127.0.0.1';
  FServer.LocalPort := IntToStr(FPort);
  FServer.Active := True;
  
end;

procedure DataSender.TcpServer1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);
begin

  ClientSocket.OnReceive := TcpClientReceive;

end;

procedure DataSender.TcpClientReceive(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
begin

  FDataStream.WriteBuffer(Buf^, DataLen);

end;

end.
 