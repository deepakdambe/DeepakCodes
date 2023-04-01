
@echo OFF

echo "This script will close all running programs, do you wish to continue ?"
pause

TASKKILL /IM devenv.exe
TASKKILL /IM chrome.exe
TASKKILL /IM iexplore.exe
TASKKILL /IM EXCEL.EXE
TASKKILL /IM outlook.exe
TASKKILL /IM lync.exe
TASKKILL /IM WINWORD*
TASKKILL /IM AcroRd32.exe
TASKKILL /IM wmplayer.exe
TASKKILL /IM javaw.exe
TASKKILL /IM mintty.exe
TASKKILL /IM powerpnt.exe
TASKKILL /F /IM iexplore.exe /T
TASKKILL /IM fdm.exe
TASKKILL /IM notepad.exe
TASKKILL /IM putty.exe
TASKKILL /IM calc.exe
TASKKILL /IM vlc.exe
TASKKILL /IM launcher.exe
TASKKILL /IM SnippingTool.exe

TASKKILL /IM notepad++.exe
TASKKILL /IM taskmgr.exe
TASKKILL /IM NICTool.exe
TASKKILL /IM depends.exe
TASKKILL /IM winmergeu.exe
TASKKILL /IM Teams.exe

echo "If u are going to shutdown machine then press enter, else close this window..."
pause
timeout /t 22

TASKKILL /F /IM lync*
TASKKILL /F /IM dropbox*

echo "press enter to restart window..."
pause
shutdown /r /t 22
