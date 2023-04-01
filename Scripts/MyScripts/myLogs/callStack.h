/*
 * callStack.h
 *
 *  Created on: 08-Aug-2018
 *      Author: deepak
 */

// To use this function you need to compile code with -rdynamic linker flag.
 

#ifndef CALLSTACK_H_
#define CALLSTACK_H_

#ifndef WIN32   // this file is only for Linux systems.

#include <execinfo.h>

#define CALL_STACK_SIZE 11

static void printFunction(char const *funcName)
{
#if IS_JNC_N50_CODE 
  #if MY_OWN_LOG_FILE
    OSTraceNew(" %s", funcName);
  #else
    OSTrace(" %s", funcName);
  #endif
#else
  #if MY_OWN_LOG_FILE
    OSTraceNew(" %s", funcName);
  #else
    printf ("\n %s", funcName);
  #endif
#endif
}

static void printCallStack()
{
	int i = 0;
	int size = 0;
	char **funcNames;
	char sizeMsg[111] = "";
	void *funcions[CALL_STACK_SIZE];

	size = backtrace (funcions, CALL_STACK_SIZE);
	funcNames = backtrace_symbols (funcions, size);

  printFunction(" *******************  Printing Call Stack  ***************************");
  sprintf(sizeMsg, "No of functions found : (%d)", size - 1); // Skip current function.
  printFunction(sizeMsg);
	for (i = 1; i < size; ++i)
		printFunction(funcNames[i]);

	printFunction("\n");

	free (funcNames);
}

/*

void testCallStack()
{
	printCallStack();
}

*/

#else
  static void printCallStack(){}
#endif  // if no windows

#endif /* CALLSTACK_H_ */
