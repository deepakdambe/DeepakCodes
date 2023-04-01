
#ifndef FILELOGUNIX
#define FILELOGUNIX

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <time.h>

#define MAX_TRACE_STRING2 444

static const char *fileName = "/opt/metasys/tmp/myLog.log";

static void OSLogToFileNew(char* strMsg)
{
  FILE *fp;
  int strLen = 0;
  time_t curtime;
  char strDateTime[111] = "";

  curtime = time (NULL);
  char *ctm = ctime(&curtime);
  strcpy(strDateTime, ctm);

  // remove year and new line char from end
  strLen = strlen(strDateTime);
  if (strLen < 6 || NULL == strMsg)
    return;

  strDateTime[strLen - 6] = 0;

  fp=fopen (fileName, "a");

  fprintf(fp, "%s : %s\n", strDateTime, strMsg);

  fclose(fp);
}

static void OSTraceNew(const char *str, ...)
{
  char outString[MAX_TRACE_STRING2 + 1] = {0};
  va_list vl;

  // start variable inputs
  va_start(vl, str);

  // format input string - limit size to max trace size
  // and send to output
  vsprintf(outString, str, vl);

  OSLogToFileNew(outString);

  va_end(vl);
}


#endif      // FILELOGUNIX

