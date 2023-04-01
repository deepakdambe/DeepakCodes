// ServerCode.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
using namespace std;

#include <process.h>

#include "CSocket.h"

#pragma comment (lib, "ws2_32.lib")

unsigned __stdcall  handle_socket(void* sock)
{
  char buff[4096] = "";
  CClientSocket *clientSocket = (CClientSocket *)sock;
  cout << "\n client " << clientSocket->getSocket() << " connected on thread " << GetCurrentThreadId() << endl;
  do
  {
    memset(buff, 0, 4096);
    int bytesRecv = clientSocket->recvData(buff, 4096, 0);
    if (SOCKET_ERROR == bytesRecv || 0 == bytesRecv)
    {
      break;
    }

    cout << "Message from client - " << clientSocket->getSocket() << " : " << buff << endl;

  } while (buff[0] = '0' || buff[0] == 0);

  cout << "client " << clientSocket->getSocket() << " disconnected on thread " << GetCurrentThreadId() << endl;
  return 0;
}

int main()
{
  cout << "Server main started" << endl;

  // Initialize WinSock library
  WSADATA wsaData;

  int wsOk = WSAStartup(0x202, &wsaData);
  if (0 != wsOk)
  {
    cout << "WSAStartup failed" << endl;
    return 0;
  }

  // Create Socket (Server)
  CServerSocket listeningSocket1;

  // Bind the IP address and port to socket.
  sockaddr_in addr;
  addr.sin_family = AF_INET;
  addr.sin_port = htons(22000);
  addr.sin_addr.S_un.S_addr = INADDR_ANY;

  listeningSocket1.bindSocket((sockaddr *)&addr, sizeof(addr));

  // Tell WinSock that socket is listening
  listeningSocket1.listenSocket(SOMAXCONN);

  // wait for connection
  sockaddr_in client;
  int clientSize = sizeof(client);

  const int clientCount = 7;
  CClientSocket clientSocket[clientCount];
  HANDLE hThread[clientCount];
  unsigned threadID[clientCount];
  for (size_t i = 0; i < clientCount; i++)
  {
    cout << "Waiting for new connection. active connection available " << clientCount - i << endl;
    clientSocket[i].setSocket(listeningSocket1.acceptSocket((sockaddr *)&client, &clientSize));

    hThread[i] = (HANDLE)_beginthreadex(NULL, 0, handle_socket, &clientSocket[i], 0, &threadID[i]);
  }

  // Cleanup WinSock.
  Sleep(9999);
  cout << "Server main finished" << endl;
  cin.get();
  WSACleanup();
  return 0;
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
