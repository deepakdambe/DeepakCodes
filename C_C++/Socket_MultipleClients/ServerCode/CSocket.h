#pragma once

#if _WIN32
  #include<WinSock2.h>
#endif // _WIN32


class CSocket
{
public:
  CSocket(int af = AF_INET, int type = SOCK_STREAM, int protocol = 0)
  {
    m_socket = socket(af, type, protocol);
  }

  virtual ~CSocket()
  {
    cout << "calling CSocket DEST" << endl;
    closesocket(m_socket);
  }

protected:
  SOCKET m_socket;
};




class CClientSocket : public CSocket
{
public:
  CClientSocket(int af = AF_INET, int type = SOCK_STREAM, int protocol = 0) : CSocket(af, type, protocol) {}

  CClientSocket(SOCKET socket)  // TODO : how to initialize with list.
  {
    m_socket =socket;
  }

  int connectSocket(struct sockaddr *pServer, int serverSize)
  {
    return connect(m_socket, pServer, serverSize);
  }

  int sendData(const char * pBuffer, int buffLen, int flags)
  {
    return send(m_socket, pBuffer, buffLen, flags);
  }

  int recvData(char * pBuffer, int buffLen, int flags)
  {
    return recv(m_socket, pBuffer, buffLen, flags);
  }

  SOCKET getSocket()
  {
    return m_socket;
  }

  void setSocket(SOCKET soc)
  {
    m_socket = soc;
  }
};




class CServerSocket : public CSocket
{
public:
  CServerSocket(int af = AF_INET, int type = SOCK_STREAM, int protocol = 0) : CSocket(af, type, protocol) {}

  int bindSocket(const struct sockaddr * pName, int namelen)
  {
    return bind(m_socket, pName, namelen);
  }

  virtual int listenSocket(int backlog)
  {
    return listen(m_socket, backlog);
  }

  SOCKET acceptSocket(sockaddr *pClient, int *pClientSize)
  {
    return accept(m_socket, pClient, pClientSize);
  }

  CClientSocket acceptCSocket(sockaddr *pClient, int *pClientSize)
  {
    return accept(m_socket, pClient, pClientSize);
  }

private:

};


class myDerived : public CServerSocket
{
public:
  int listenSocket(int backlog) override {}
};

class CWinService
{
public:
  CWinService(CServerSocket &ref) {}
};

