#include <process.h>

//TODO: implement setters and getters

CProcess::CProcess(/*arguments*/)
{
	//getting arguments from list
	//working dir, etc
}

void CProcess::SetArguments()
{
	//is this required?..
	//after-constructor argument changing
}

int CProcess::Run(char *argv[])
{
	//runs a process with a given arguments and restrictions
	//probably returns children program return code
	return 0;
}
CProcess::~CProcess()
{
	//kills processif it is running
}