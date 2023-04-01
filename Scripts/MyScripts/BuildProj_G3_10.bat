
:: JCI Projects Build
@echo off

REM debug, release

echo Please confirm following points before start building
echo Your Env variables are set to this folder.
echo Update projects from Git.
::pause

SET errorcount = 0
SET logDir=C:\ccm_wa\git\logs

REM call "C:\Program Files (x86)\Microsoft Visual Studio 9.0\VC\bin\vcvars32.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Auxiliary\Build\vcvars32.bat"

set Build_query=0
if %Build_query% == 1 (set BuildType=Rebuild) else (set BuildType=Build)
echo %BuildType%

echo " " >> %logDir%\winBuilds.log
echo $$$$$$$$$$ All G3 projects started building .... $$$$$$$$$$ >> %logDir%\winBuilds.log
echo " " >> %logDir%\winBuilds.log

set g3Path=C:\ccm_wa\git

set vs2017devenvPath="C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv"

set Build_Config=release

call :BuildG3Code g3_base base_win32_VS15.sln
REM call :BuildG3Code g3_objects g3_objects_WIN32_VS15.sln
REM call :BuildG3Code g3_shared_libraries g3_shared_libraries_WIN32_VS15.sln
REM call :BuildG3Code g3_integrations g3_integrations_win32_VS15.sln
call :BuildG3Code g3_metasys_core g3_product_n50\g3_product_n50_WIN32_VS15.sln
call :BuildG3Code g3_metasys_core g3_product_server\g3_product_ods_WIN32_VS15.sln

call :WriteInFileAndConsole "."
call :WriteInFileAndConsole "=============== Searching for Failed builds  ==============="
findstr /I /N /C:"Build failed" %logDir%\winBuilds.log
findstr /I /N /C:"Build failed" %logDir%\winBuilds.log >> %logDir%\winBuilds.log 2>&1
call :WriteInFileAndConsole "============================================================"
findstr /I /N /C:"========== Build:" %logDir%\winBuilds.log
findstr /I /N /C:"========== Build:" %logDir%\winBuilds.log >> %logDir%\winBuilds.log 2>&1
findstr /I /N /C:"========== Rebuild All:" %logDir%\winBuilds.log
findstr /I /N /C:"========== Rebuild All:" %logDir%\winBuilds.log >> %logDir%\winBuilds.log 2>&1
call :WriteInFileAndConsole "=============== Complete Searching for Failed builds  ==============="

REM call :WriteInFileAndConsole findstr /I /N /C:"Build failed" %logDir%\winBuilds.log
REM call :WriteInFileAndConsole findstr /I /N /C:"========== Build:" %logDir%\winBuilds.log
REM findstr /I /N /C:"Build failed" %logDir%\winBuilds.log
REM call :WriteInFileAndConsole "============================================================"
REM findstr /I /N /C:"========== Build:" %logDir%\winBuilds.log

REM call :BuildG3Code g3_metasys_core g3_product_nis\g3_product_nis_WIN32_VS15.sln

REM %notepadPath% %logDir%\winBuilds.log

REM ======================================================================================

REM debug_Big_OID, release_Big_OID

REM set Build_Config=release_Big_OID

REM call :BuildG3Code g3_base               base_win32_VS15.sln
REM call :BuildG3Code g3_objects            g3_objects_WIN32_VS15.sln
REM call :BuildG3Code g3_shared_libraries   g3_shared_libraries_WIN32_VS15.sln
REM call :BuildG3Code g3_integrations       g3_integrations_win32_VS15.sln
REM call :BuildG3Code g3_metasys_core       g3_product_n50\g3_product_n50_WIN32_VS15.sln
REM call :BuildG3Code g3_metasys_core       g3_product_server\g3_product_ods_WIN32_VS15.sln


%notepadPath% %logDir%\winBuilds.log

timeout /t 111
REM pause
exit /b

REM ==================================================  FUNCTIONS  ==================================================


:BuildG3Code 
  call :WriteInFileAndConsole "."
  call :WriteInFileAndConsole "=============== Started building %Build_Config%  %~1\%~2  ==============="
  set solutionPath="%g3Path%\%~1\%~2"

  REM echo %vs2017devenvPath% /%BuildType% "%Build_Config%|Win32" %solutionPath% /Out %logDir%\winBuilds.log
  call %vs2017devenvPath% /%BuildType% "%Build_Config%|Win32" %solutionPath% /Out %logDir%\winBuilds.log

  tail -2 %logDir%\winBuilds.log
  call :WriteInFileAndConsole "===============  Finished building %Build_Config%  %~1\%~2  ==============="
  call :WriteInFileAndConsole "."
exit /b 0 

REM ======================================================================================

:WriteInFileAndConsole
  echo %~1
  echo %~1 >> %logDir%\winBuilds.log 2>&1
exit /b 0 

REM ======================================================================================



REM "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv" /Build "release|Win32" "C:\ccm_wa\git\g3_base\base_win32_VS15.sln" /Out C:\ccm_wa\git\logs\winBuilds.log

REM "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv" /Build "release|Win32" "C:\ccm_wa\git\g3_objects\g3_objects_WIN32_VS15.sln" /Out C:\ccm_wa\git\logs\winBuilds.log

REM "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv" /Build "release|Win32" "C:\ccm_wa\git\g3_shared_libraries\g3_shared_libraries_WIN32_VS15.sln" /Out C:\ccm_wa\git\logs\winBuilds.log

REM "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv" /Build "release|Win32" "C:\ccm_wa\git\g3_integrations\g3_integrations_win32_VS15.sln" /Out C:\ccm_wa\git\logs\winBuilds.log

REM "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv" /Build "release|Win32" "C:\ccm_wa\git\g3_metasys_core\g3_product_n50\g3_product_n50_WIN32_VS15.sln" /Out C:\ccm_wa\git\logs\winBuilds.log

REM "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv" /Build "release|Win32" "C:\ccm_wa\git\g3_metasys_core\g3_product_server\g3_product_ods_WIN32_VS15.sln" /Out C:\ccm_wa\git\logs\winBuilds.log

REM "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv" /Build "release|Win32" "C:\ccm_wa\git\g3_metasys_core\g3_product_nis\g3_product_nis_WIN32_VS15.sln" /Out C:\ccm_wa\git\logs\winBuilds.log

REM "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv" /Build "release|Win32" "C:\ccm_wa\git\g3_metasys_core\g3_server\g3_product_server_WIN32_VS15.sln" /Out C:\ccm_wa\git\logs\winBuilds.log

