
#pragma once

/*

#ifdef WIN32
  #include "C:\ccm_wa\git\myLogs\myLogs.h"
#else
  #include "/mnt/c/ccm_wa/git/myLogs/myLogs.h"
#endif

funCalled();
printCallStack();
funFinished();

funCalledMsg("Legacy function called...");
printCallStack();
funFinished();

OSTrace(msgPrefix _T(""), msgPrefixValues, );


*/

//#define IS_JNC_N50_CODE       0
#define MY_OWN_LOG_FILE       1

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

#if MY_OWN_LOG_FILE
  #ifdef WIN32
    #include "fileLogWindows.h"
  #else
    #include "fileLogUnix.h"
  #endif // WIN32
#else
  #include "baseos.h"
#endif
#include "callStack.h"

#if 0
#define OSTrace wprintf
#endif

#if MY_OWN_LOG_FILE
  #define OSTrace1 OSTraceNew
#else
  #define OSTrace1 OSTrace
#endif

#ifdef WIN32
  #include <tchar.h>
  #include <windows.h>

  #define __STR2WSTR(str) L##str
  #define _STR2WSTR(str) __STR2WSTR(str)
  #define funcc _STR2WSTR(__FUNCTION__)

  #define strFS _T("%S")
#else
  #define _T(x) x
  #define funcc __func__
  #define GetCurrentThreadId() 0

  #define strFS "%s"
  #define sprintf_s(a,b,...) sprintf(a,__VA_ARGS__)
#endif

#define msgPrefix         _T("@@@ (%22s)(%04u)(%05u) = ")
#define msgPrefixValues   funcc, __LINE__, GetCurrentThreadId()

#define funCalled()             OSTrace1(msgPrefix _T(" Called"), msgPrefixValues)
#define funCalledInt(logIVal)   OSTrace1(msgPrefix _T(" Called, ") strFS _T(" (%d)"), msgPrefixValues, #logIVal, logIVal)
#define funCalledStr(logStr)    OSTrace1(msgPrefix _T(" Called, ") strFS _T(" (%s)"), msgPrefixValues, #logStr, logStr)
#define printCalledMsg(strMsg)  OSTrace1(msgPrefix _T(" Called, ") strFS _T(""), msgPrefixValues, strMsg)
#define funCalledMsg(...)       { char strMsg[1111] = ""; sprintf_s(strMsg, 1111, __VA_ARGS__); printCalledMsg(strMsg);}

#define logInt(logIVal)         OSTrace1(msgPrefix strFS _T(" (%d)"), msgPrefixValues, #logIVal, logIVal)
#define logUInt(logUIVal)       OSTrace1(msgPrefix strFS _T(" (%u)"), msgPrefixValues, #logUIVal, logUIVal)
#define logString(logStr)       OSTrace1(msgPrefix strFS _T(" (%s)"), msgPrefixValues, #logStr, logStr)
#define logAddr(logAddr)        OSTrace1(msgPrefix strFS _T(" (0x%08X)"), msgPrefixValues, #logAddr, logAddr)

#define printMsg(strMsg)        OSTrace1(msgPrefix strFS _T(""), msgPrefixValues, strMsg)
#define logMessage(...)         { char strMsg[1111] = ""; sprintf_s(strMsg, 1111, __VA_ARGS__); printMsg(strMsg);}
//#ifdef WIN32
//  #define logMessage(...)         { char strMsg[1111] = ""; sprintf_s(strMsg, 1111, __VA_ARGS__); printMsg(strMsg);}
//#else
//  #define logMessage(...)         { char strMsg[1111] = ""; sprintf(strMsg, __VA_ARGS__); printMsg(strMsg);}
//#endif // WIN32

#define funFinished()             OSTrace1(msgPrefix _T(" Finished"), msgPrefixValues)
#define funFinishedInt(logIVal)   OSTrace1(msgPrefix _T(" Finished, ") strFS _T(" (%d)"), msgPrefixValues, #logIVal, logIVal)
#define funFinishedStr(logStr)    OSTrace1(msgPrefix _T(" Finished, ") strFS _T(" (%s)"), msgPrefixValues, #logStr, logStr)

/*

OSTrace1(msgPrefix _T(""), msgPrefixValues, );

funCalled;
printCallStack();
funFinished;


*/

