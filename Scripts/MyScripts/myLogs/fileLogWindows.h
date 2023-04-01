
#ifndef FILELOGWINDOWS
#define FILELOGWINDOWS

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <time.h>
#include <tchar.h>

#define MAX_TRACE_STRING2 444

#define INCLUDE_OSTRACE
#ifdef INCLUDE_OSTRACE
  #include "baseos.h"
#endif

static const char *fileName = "c:\\logs\\myLog.log";

static void OSLogToFileNew(TCHAR* strMsg)
{
  FILE *fp;
  int strLen = 0;
  time_t curtime;
  TCHAR strDateTime[111] = _T("");

  curtime = time (NULL);
  TCHAR ctm[111];
  _tctime_s(ctm, 111, &curtime);
  _tcscpy_s(strDateTime, 111, ctm);

  // remove year and new line char from end
  strLen = _tcslen(strDateTime);
  if (strLen < 6 || NULL == strMsg)
    return;

  strDateTime[strLen - 6] = 0;

  fopen_s (&fp, fileName, "a");

  _ftprintf(fp, _T("%s : %s\n"), strDateTime, strMsg);

  fclose(fp);
}

static void OSTraceNew(const TCHAR *str, ...)
{
  TCHAR outString[MAX_TRACE_STRING2 + 1] = {0};
  va_list vl;

  // start variable inputs
  va_start(vl, str);

  // format input string - limit size to max trace size
  // and send to output
  _vstprintf_s(outString, MAX_TRACE_STRING2, str, vl);

  OSLogToFileNew(outString);
  
  #ifdef INCLUDE_OSTRACE
    OSTrace(outString);
  #endif

  va_end(vl);
}


#endif      // FILELOGWINDOWS
