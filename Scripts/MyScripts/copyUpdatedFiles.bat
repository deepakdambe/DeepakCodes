
@echo off

set srcPath=C:\ccm_wa\git

for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
     set day=%%k
     set year=%%l
)
set datestr=%month%-%day%-%year%

set destPath=C:\ccm_wa\backup\%datestr%

echo %destPath%

REM goto END
REM pause

mkdir %destPath%

REM for %%G in (
  REM g3_base
  REM myScripts
  REM g3_metasys_core
REM ) do (
  REM XCOPY   %srcPath%\%%G     %destPath%\%%G\     /S /C /Y /V /F /D:%datestr% /EXCLUDE:xcopyExclude.txt
  REM echo.
  REM echo %%G Copied.....
  REM echo.
REM )

XCOPY   %srcPath%     %destPath%\     /S /C /Y /V /F /D:%datestr% /EXCLUDE:xcopyExclude.txt

:: /T can be used to create directory structure

echo $$$$$$$$$$ All Updated files copied .... $$$$$$$$$$
::timeout /t 111

::pause
goto END

:END


