
@echo off


net session > nul 2>&1
if NOT %errorLevel% == 0 (
  echo Please run this script as admin.
  pause
  exit
)

for /f "tokens=1-3 delims=:." %%A in ("%time%") do (
set HH=%%A
set MM=%%B
set SS=%%C)

echo %MM%

call :Stop_Services

timeout 5

rename C:\logs\myLog.log myLog%MM%.log

move /Y C:\logs\MSEA_Supv.dll "c:\Program Files (x86)\Johnson Controls\MetasysIII\WS\bin"
move /Y C:\logs\MSEA_Supv.pdb "c:\Program Files (x86)\Johnson Controls\MetasysIII\WS\bin"
move /Y C:\logs\MSEA_Supv.map "c:\Program Files (x86)\Johnson Controls\MetasysIII\WS\bin"
move /Y C:\logs\MseaDebug.exe "c:\Program Files (x86)\Johnson Controls\MetasysIII\WS\bin"
move /Y C:\logs\Objset.dat    "c:\Program Files (x86)\Johnson Controls\MetasysIII\WS\bin"

move /Y C:\logs\ARCHIVE.moi   "C:\ProgramData\Johnson Controls\MetasysIII\N50"
move /Y C:\logs\ARCHIVE.xml   "C:\ProgramData\Johnson Controls\MetasysIII\N50"

timeout 5

echo.
echo " ***** Restarting IIS service *****"
iisreset

REM Try one more time if it fails.
if NOT %errorLevel% == 0 (
  iisreset
)

timeout 5
REM pause

echo.
echo " ***** Restarting Device Manager service *****"
net start miiidm


timeout 55
REM net pause miiidm
REM timeout 55

EXIT /B 0

REM ==================================================  FUNCTIONS  ==================================================

:Stop_Services 

  echo Stopping services...

  REM Killing running services...
  TASKKILL /F /IM DeviceManager*
  TASKKILL /F /IM w3wp*
  TASKKILL /F /IM javaw*

  timeout 2
  TASKKILL /F /IM w3wp*

  iisreset /stop

  REM Try one more time if it fails.
  if NOT %errorLevel% == 0 (
    iisreset /stop
  )

  echo All services are stopped...
EXIT /B 0

