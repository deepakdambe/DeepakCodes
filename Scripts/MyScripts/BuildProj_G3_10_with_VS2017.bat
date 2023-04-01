
:: JCI Projects Build
@echo off

set g3Base=		  1
set g3Shared=	  1
set g3Objects=	1
set g3Integrtn=	1
set g3Product=	1
set g3ProductServer=	1
set g3ProductNIS=	1

REM debug, debug_Big_OID, release, release_Big_OID
set Build_Config=release

echo Please confirm following points before start building
echo Your Env variables are set to this folder.
echo Update projects from Git.
::pause

SET errorcount = 0
SET logDir=C:\ccm_wa\git\logs
set notepadPath="C:\Program Files\Notepad++\notepad++.exe"

REM call "C:\Program Files (x86)\Microsoft Visual Studio 9.0\VC\bin\vcvars32.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Auxiliary\Build\vcvars32.bat"

set Build_query=0
if %Build_query% == 1 (set BuildType=Rebuild) else (set BuildType=Build)
echo %BuildType%

echo " " >> %logDir%\winBuilds.log
echo $$$$$$$$$$ All G3 projects started building .... $$$$$$$$$$ >> %logDir%\winBuilds.log
echo " " >> %logDir%\winBuilds.log

%notepadPath% %logDir%\winBuilds.log


::=============================================== Solution Path ===================================

set g3Path=C:\ccm_wa\git

set G3_BASE_SOLUTION_PATH="%g3Path%\g3_base\base_win32_VS15.sln"

set G3_OBJECTS_SOLUTION_PATH="%g3Path%\g3_objects\g3_objects_WIN32_VS15.sln"

set G3_SHARED_LIBRARIES_SOLUTION_PATH="%g3Path%\g3_shared_libraries\g3_shared_libraries_WIN32_VS15.sln"

set G3_INTEGRATIONS_SOLUTION_PATH="%g3Path%\g3_integrations\g3_integrations_win32_VS15.sln"

set G3_PRODUCT_N50_SOLUTION_PATH="%g3Path%\g3_metasys_core\g3_product_n50\g3_product_n50_WIN32_VS15.sln"

set G3_PRODUCT_SERVER_SOLUTION_PATH="%g3Path%\g3_metasys_core\g3_product_server\g3_product_ods_WIN32_VS15.sln"

set G3_PRODUCT_NIS_SOLUTION_PATH="%g3Path%\g3_metasys_core\g3_product_nis\g3_product_nis_WIN32_VS15.sln"

::=============================================== 1. g3_base ======================================
:: Re-build the project

if %g3Base%==0 (
	goto g3Base_done
)

echo $$$$$$$$$$ Building "g3_base".... $$$$$$$$$$
echo $$$$$$$$$$ Building "g3_base".... $$$$$$$$$$ >> %logDir%\winBuilds.log
::%notepadPath% %logDir%\winBuilds.log


call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe" /%BuildType% "%Build_Config%|Win32" %G3_BASE_SOLUTION_PATH% /Out %logDir%\winBuilds.log
echo ****************************************************************************************************************

echo $$$$$$$$$$ "g3_base" is rebuilded successfully.... $$$$$$$$$$

timeout /t 2

IF %ERRORLEVEL% NEQ 0 (
  SET /a errorcount = 1
  goto STOP_BUILD
)

:g3Base_done

::=============================================== 2. g3_objects ===================================
:: Re-build the project

if %g3Objects%==0 (
	goto g3Objects_done
)

echo.
echo $$$$$$$$$$ Building "g3_objects".... $$$$$$$$$$
echo $$$$$$$$$$ Building "g3_objects".... $$$$$$$$$$ >> %logDir%\winBuilds.log
::%notepadPath% %logDir%\winBuilds.log

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe" /%BuildType% "%Build_Config%|Win32" %G3_OBJECTS_SOLUTION_PATH% /Out %logDir%\winBuilds.log
echo ****************************************************************************************************************

timeout /t 2

IF %ERRORLEVEL% NEQ 0 (
  SET /a errorcount = 2
  goto STOP_BUILD
)

:g3Objects_done

::=============================================== 3. g3_shared_libraries ===========================
:: Re-build the project

if %g3Shared%==0 (
	goto g3Shared_done
)

echo.
echo $$$$$$$$$$ Building "g3_shared_libraries".... $$$$$$$$$$
echo $$$$$$$$$$ Building "g3_shared_libraries".... $$$$$$$$$$ >> %logDir%\winBuilds.log
::%notepadPath% %logDir%\winBuilds.log

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe" /%BuildType% "%Build_Config%|Win32" %G3_SHARED_LIBRARIES_SOLUTION_PATH% /Out %logDir%\winBuilds.log
echo ****************************************************************************************************************

timeout /t 2

IF %ERRORLEVEL% NEQ 0 (
  SET /a errorcount = 3
  goto STOP_BUILD
)

:g3Shared_done

::=============================================== 4. g3_integrations ==============================
:: Re-build the project

if %g3Integrtn%==0 (
	goto g3Integrtn_done
)

echo.
echo $$$$$$$$$$ Building "g3_integrations".... $$$$$$$$$$
echo $$$$$$$$$$ Building "g3_integrations".... $$$$$$$$$$ >> %logDir%\winBuilds.log
::%notepadPath% %logDir%\winBuilds.log

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe" /%BuildType% "%Build_Config%|Win32" %G3_INTEGRATIONS_SOLUTION_PATH% /Out %logDir%\winBuilds.log
echo ****************************************************************************************************************

timeout /t 2

IF %ERRORLEVEL% NEQ 0 (
  SET /a errorcount = 4
  goto STOP_BUILD
)

:g3Integrtn_done

::=============================================== 5. g3_product_n50 ===============================
::=================================================================================================
:: Re-build the project

if %g3Product%==0 (
	goto g3Product_done
)

echo.
echo $$$$$$$$$$ Building "g3_product_n50".... $$$$$$$$$$
echo $$$$$$$$$$ Building "g3_product_n50".... $$$$$$$$$$ >> %logDir%\winBuilds.log
%notepadPath% %logDir%\winBuilds.log

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe" /%BuildType% "%Build_Config%|Win32" %G3_PRODUCT_N50_SOLUTION_PATH% /Out %logDir%\winBuilds.log
type %logDir%\winBuilds.log
echo ******************************************************************************************

echo Project is rebuilded successfully....

:g3Product_done


::=============================================== 5. g3_product_Server ===============================
::=================================================================================================
:: Re-build the project

if %g3ProductServer%==0 (
	goto g3ProductServer_done
)

echo.
echo $$$$$$$$$$ Building "g3_product_Server".... $$$$$$$$$$
echo $$$$$$$$$$ Building "g3_product_Server".... $$$$$$$$$$ >> %logDir%\winBuilds.log
%notepadPath% %logDir%\winBuilds.log

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe" /%BuildType% "%Build_Config%|Win32" %G3_PRODUCT_SERVER_SOLUTION_PATH% /Out %logDir%\winBuilds.log
type %logDir%\winBuilds.log
echo ******************************************************************************************

echo Project is rebuilded successfully....

:g3ProductServer_done

::=============================================== 5. g3_product_NIS ===============================
::=================================================================================================
:: Re-build the project

if %g3ProductNIS%==0 (
	goto g3ProductNIS_done
)

echo.
echo $$$$$$$$$$ Building "g3_product_NIS".... $$$$$$$$$$
echo $$$$$$$$$$ Building "g3_product_NIS".... $$$$$$$$$$ >> %logDir%\winBuilds.log
%notepadPath% %logDir%\winBuilds.log

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe" /%BuildType% "%Build_Config%|Win32" %G3_PRODUCT_NIS_SOLUTION_PATH% /Out %logDir%\winBuilds.log
type %logDir%\winBuilds.log
echo ******************************************************************************************

echo Project is rebuilded successfully....

:g3ProductNIS_done

echo ====================================
echo.
echo All JNC core assests projects build successfully....
echo.
echo =====================================
::pause


:DONE
echo $$$$$$$$$$ All G3 projects is builded successfully.... $$$$$$$$$$
timeout /t 111

::C:\ccm_wa\git\scripts\StopServicesAndCopy_Product_N50_Dlls.bat


:STOP_BUILD
ECHO FAILED!
ECHO Error copying %errorcount% file
::pause




