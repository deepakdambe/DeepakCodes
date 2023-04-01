
::@ECHO OFF

set projPath=C:\ccm_wa\git
set SARPath=C:\ccm_wa\sar

 REM JNC Repos
setx jci_base_libs_SARAsset 		    "%projPath%\jci_base_libs\Public"
setx jci_mms_SARAsset 			        "%projPath%\jci_mms\Public"
setx jci_os_api_SARAsset 			      "%projPath%\jci_os_api\Public"
setx jci_ore_SARAsset 				      "%projPath%\jci_ore\Public"
setx jci_ore_features_SARAsset 	    "%projPath%\jci_ore_features\Public"
setx jci_baccomm_SARAsset 			    "%projPath%\jci_baccomm\Public"
setx jci_pointio_SARAsset 			    "%projPath%\jci_pointio\Public"
setx jci_serial_comm_SARAsset 	    "%projPath%\jci_serial_comm"\Public
setx jci_tool_lib_SARAsset 			    "%projPath%\jci_tool_lib\Public"
setx jci_integrations_SARAsset 	    "%projPath%\jci_integrations\Public"
setx jci_unit_testing_SARAsset 	    "%projPath%\jci_unit_testing\Public"
setx jci_msl_SARAsset               "%projPath%\jci_msl\Public"
setx jci_scripts_SARAsset 			    "%projPath%\jci_scripts"

 REM G3 Repos in ccm_wa\git
setx g3_base_SARAsset               "%projPath%\g3_base\Public"
setx g3_integrations_SARAsset       "%projPath%\g3_Integrations\Public"
setx g3_objects_SARAsset            "%projPath%\g3_objects\Public"
setx g3_shared_libraries_SARAsset   "%projPath%\g3_shared_libraries\Public"
setx g3_scripts_SARAsset            "%projPath%\g3_scripts"

:: SAR repos
setx ca_dictionary_SARAsset           "%SARPath%\ca_dictionary" 
setx openssl_SARAsset                 "%SARPath%\openssl"
setx curl_SARAsset                    "%SARPath%\curl" 
setx libwebsockets_SARAsset           "%SARPath%\libwebsocket"
setx thirdparty_lzo                   "%SARPath%\lzo"
setx thirdparty_openssl               "%SARPath%\openssl"
setx g4nc_common_data_model_SARAsset  "%SARPath%\g4nc_common_data_model"
setx jci_lme_SARAsset                 "%SARPath%\jci_lme"
setx jci_sab_SARAsset                 "%SARPath%\jci_sab"
setx jci_se_headers_SARAsset          "%SARPath%\jci_se_headers"
setx jci_se_core_SARAsset             "%SARPath%\jci_se_core"
setx ca_data_model_SARAsset           "%SARPath%\ca_data_model"

setx safeclib_SARRAsset             "%SARPath%\safeclib"
::setx wolfSSL_SARAsset               "%SARPath%\wolfSSL"
::setx safeclib_SARRAsset             "%projPath%\safeclib\Public"
setx wolfSSL_SARAsset               "%projPath%\wolfSSL\Public"

REM setx thirdparty_stunnel             "%SARPath%\stunnel"

:: ENV to build Manage code.
REM setx gfxelems_SARAsset      			  "%SARPath%\ManageSAR\gfxelems"
REM setx metasysgfx_SARAsset      		  "%SARPath%\ManageSAR\metasysgfx_v1.3"
REM setx ca_mng_tool_lib_SARAsset 			"%SARPath%\ManageSAR\ca_mng_tool_lib"
REM setx jci_sna_sh4_wkspc_SARAsset 		"%SARPath%\ManageSAR\jci_sna_sh4_wkspc"
REM setx mmdb_SARAsset            			"%SARPath%\ManageSAR\mmdb"
REM setx mmda_SARAsset            			"%projPath%\mmda\Public"
REM setx PYTHONPATH                     "%projPath%\jci_scripts"

REM setx launcher_SARAsset              "%SARPath%\ManageSAR\launcher\1.7\current\"
REM setx os_wince6_SARAsset      		    "%SARPath%\ManageSAR\os_wince6\2.0.0.42"

REM setx ca_base_libs_SARAsset        "%projPath%\jci_base_libs\Public"
REM setx ca_mms_SARAsset              "%projPath%\jci_mms\Public"
REM setx ca_os_api_SARAsset           "%projPath%\jci_os_api\Public"
REM setx ca_ore_SARAsset              "%projPath%\jci_ore\Public"

timeout /t 111

