unit unit2;

interface

uses Sockets, SysUtils, Classes, Dialogs, Windows, Forms, WinSock;

type

  TControlOperation = (coSet, coRead, coReset);

  TButtonState = (bsOn, bsOff, bsNone, bsRefresh);

  TSendData = record
     btOperation : TControlOperation;
     btDestination : byte;
     btState : TButtonState;
  end;

  TDataSender = class (TObject)
  private
    FCurrentController : string;
    FServer : TTCPServer;
    FDataStream : TMemoryStream;
    FLock: TRTLCriticalSection;
    FControllersList: TStringList;
    procedure TcpServer1Accept(Sender: TObject;
                ClientSocket: TCustomIpClient);
    procedure ClientReceive (ClientThread : TCustomIpClient);


  public
    constructor Create (Server : TTCPServer);
    destructor Destroy (); override;

    procedure Lock ();
    procedure Unlock ();

    procedure StartServer ();
    function CheckConnection : boolean;
    function SendData (Data : TSendData; pClient : TTcpClient) : boolean;
    function GetData () : TSendData;
    property CurrentControllers : TStringList read FControllersList;
  end;

implementation

uses Unit1;

{ Sender }

function TDataSender.CheckConnection: boolean;
begin

  Result := True;
  try

    StartServer ();

  except
    Result := False;
  end;

end;

constructor TDataSender.Create (Server : TTCPServer);
begin

  FServer := Server;
  FServer.OnAccept := TcpServer1Accept;

  FCurrentController := '(нет)';

  FControllersList := TStringList.Create ();

  FDataStream := TMemoryStream.Create ();

  InitializeCriticalSection(FLock);
  CheckConnection ();

end;

destructor TDataSender.Destroy;
var i, cnt : integer;
begin

  inherited Destroy ();

  FServer.Active := False;

  FDataStream.Free ();

  cnt := FControllersList.Count - 1;

  Lock ();
  try
    for i := 0 to cnt do begin

      TTCPClient(FControllersList.Objects[i]).Close;
      FControllersList.Objects[i].Free;

    end;
  finally
    Unlock ();
  end;

  FControllersList.Free ();

  DeleteCriticalSection(FLock);

end;

function TDataSender.GetData: TSendData;
var
  recData : TSendData;
  i : integer;
begin

  Lock ();
  try

    FDataStream.Position := 0;
    i := FDataStream.Size;

    while i > 0 do begin

      FDataStream.Read(recData, sizeof (recData));
      PostMessage (Application.Handle, _WM_SET_BUTTON, Byte(recData.btDestination), Byte(recData.btState));

      Dec (i, sizeof (recData));

    end;

    FDataStream.Clear ();

  finally
    Unlock ();
  end;

end;

function TDataSender.SendData(Data: TSendData; pClient : TTcpClient): boolean;
begin

  try

    pClient.Active := True;
    Result := pClient.SendBuf(Data, sizeof(TSendData)) = sizeof(TSendData);

  finally
    pClient.Active := False;
  end;
  
end;

procedure TDataSender.StartServer;
begin

  FServer.Active := False;

  FServer.LocalHost := _DefaultIP;
  FServer.LocalPort := IntToStr(_DefaultPort);

  FServer.Active := True;

end;

procedure TDataSender.TcpServer1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);
var sHost: string;
    pClient : TTcpClient;
begin

  sHost := ClientSocket.RemoteHost;
  if FCurrentController = '' then
    FCurrentController := sHost;

  Lock ();
  try
     if FControllersList.IndexOf(sHost) < 0 then begin
       pClient := TTcpClient.Create (ClientSocket.Owner);
       pClient.RemoteHost := sHost;
       pClient.RemotePort := IntToStr (_DefaultPort);
       FControllersList.InsertObject (0, sHost, pClient);
       PostMessage (Application.Handle, _WM_SET_BUTTON, 0, Byte (bsRefresh));
     end;
  finally
     Unlock ();
  end;

  while ClientSocket.Connected do begin

    if ClientSocket.WaitForData() then
      ClientReceive (ClientSocket);

    Sleep (10);

  end;

end;

procedure TDataSender.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TDataSender.Unlock;
begin
  LeaveCriticalSection(FLock);
end;

procedure TDataSender.ClientReceive(ClientThread: TCustomIpClient);
var Data : TSendData;
begin

  while ClientThread.Connected and ( ClientThread.PeekBuf(Data, sizeof(Data)) = sizeof(TSendData) ) do begin

    Lock ();
    try
      ClientThread.ReceiveBuf(Data, sizeof(Data));
      FDataStream.WriteBuffer(Data, sizeof(Data));
    finally
      Unlock ();
      GetData ();
    end;
    
  end;

end;

end.
 