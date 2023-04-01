
@echo off

cd C:\ccm_wa\git\jci_scripts
SET logDir=C:\ccm_wa\git\logs
set is_Local_PC=1
set notepadPath="C:\Program Files\Notepad++\notepad++.exe"

echo $$$$$$$$$$ All JNC projects started building, plz refer file "logs\winBuilds.log" .... $$$$$$$$$$
echo $$$$$$$$$$ All JNC projects started building .... $$$$$$$$$$ > %logDir%\winBuilds.log

%notepadPath% %logDir%\winBuilds.log

::call jnc-build.bat all build debug NAE-supervisor-family Win32 > %logDir%\winBuilds.log

REM debug, release
set Build_Config=release

REM call .\win32-batch\Win32build.bat   C:\ccm_wa\git\wolfSSL\Private\Win32_Make\ C:\ccm_wa\git\wolfSSL  %Build_Config% C:\ccm_wa\git\jci_scripts\cmake\targets\NAE-supervisor-family.cmake >> %logDir%\winBuilds.log 2>&1

REM Build CURL library
REM call C:\ccm_wa\git\curl\build.bat >> %logDir%\winBuilds.log 2>&1

REM call .\win32-batch\Win32clean.bat   C:\ccm_wa\git\jci_msl\Private\Win32_Make\
REM call .\win32-batch\Win32build.bat   C:\ccm_wa\git\jci_msl\Private\Win32_Make\ C:\ccm_wa\git\jci_msl  %Build_Config% C:\ccm_wa\git\jci_scripts\cmake\targets\NAE-supervisor-family.cmake >> %logDir%\winBuilds.log 2>&1

echo. >> %logDir%\winBuilds.log 2>&1
REM pause

call :BuildRepoWithMsea jci_base_libs
call :BuildRepoWithMsea jci_mms
call :BuildRepoWithMsea jci_os_api
call :BuildRepoWithMsea jci_ore
call :BuildRepoWithMsea jci_baccomm
call :BuildRepoWithMsea jci_ore_features
call :BuildRepoWithMsea jci_pointio
call :BuildRepoWithMsea jci_serial_comm
call :BuildRepoWithMsea jci_tool_lib
call :BuildRepoWithMsea jci_integrations

REM ==========  Build with Big_OID config  ==========

REM call :BuildRepoWithBigOid jci_base_libs
REM call :BuildRepoWithBigOid jci_mms
REM call :BuildRepoWithBigOid jci_os_api
REM call :BuildRepoWithBigOid jci_ore
REM call :BuildRepoWithBigOid jci_baccomm
REM call :BuildRepoWithBigOid jci_ore_features
REM call :BuildRepoWithBigOid jci_pointio
REM call :BuildRepoWithBigOid jci_serial_comm
REM call :BuildRepoWithBigOid jci_tool_lib
REM call :BuildRepoWithBigOid jci_integrations

%notepadPath% %logDir%\winBuilds.log

echo $$$$$$$$$$ All JNC projects is builded successfully.... $$$$$$$$$$
timeout /t 5

REM timeout /t 55
REM exit

REM cd ..
REM C:\ccm_wa\myCodes\Deepak_CPP_Projects\MyScripts\BuildProj_G3_10.bat
C:\ccm_wa\myCodes\Deepak_CPP_Projects\MyScripts\build_g3_repos.bat

pause
exit

echo $$$$$$$$$$ All G3 projects is builded successfully.... $$$$$$$$$$
timeout /t 111
exit

REM ==================================================  FUNCTIONS  ==================================================

:BuildRepoWithMsea
  call :WriteInFileAndConsole "."
  call :WriteInFileAndConsole "=========================  Started building  %~1  ========================="
  call jnc-build.bat %~1      build %Build_Config% NAE-supervisor-family Win32 >> %logDir%\winBuilds.log 2>&1
  REM call jnc-build.bat %~1      build %Build_Config% smart-equipment-family Win32 >> %logDir%\winBuilds.log 2>&1
  tail -2 %logDir%\winBuilds.log
  call :WriteInFileAndConsole "=========================  Finished building  %~1  ========================="
  call :WriteInFileAndConsole "."
  call :WriteInFileAndConsole "."
exit /b 0 

REM ======================================================================================

:BuildRepoWithBigOid
  call :WriteInFileAndConsole "."
  call :WriteInFileAndConsole "=========================  Started building  %~1 For Big_OID ========================="
  call jnc-build.bat %~1      build %Build_Config% NAE-supervisor-family Win32 none Big_OID >> %logDir%\winBuilds.log 2>&1
  tail -2 %logDir%\winBuilds.log
  call :WriteInFileAndConsole "=========================  Finished building  %~1 For Big_OID  ========================="
  call :WriteInFileAndConsole "."
  call :WriteInFileAndConsole "."
exit /b 0 

REM ======================================================================================

:WriteInFileAndConsole
  echo %~1
  echo %~1 >> %logDir%\winBuilds.log 2>&1
exit /b 0 

