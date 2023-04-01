
gitLocation=/c/ccm_wa/git
userID=jdambed
streamName=dipak

masterRepo=(
  # "jci_base_libs"
  # "jci_msl"
  # "jci_mms"
  # "jci_os_api"
  # "jci_ore"
  # "jci_ore_features"
  # "jci_baccomm"
  # "jci_pointio"
  # "jci_serial_comm"
  # "jci_tool_lib"
  # "jci_integrations"
  # "jci_scripts"

  #jci_unison5.2
  # jci_lme
  #g4nc_common_data_model
  #jci_data_model
  #jci_config_comms
  #jci_app_shared
  # jci_sab
  #jci_fc_shared
  #jci_unison5.4
  #mercury
  )

for element in ${masterRepo[@]}
do
    cd ${gitLocation}
    echo -e "\n Cloning " ${element}
    git clone https://github.jci.com/JCI-Native-Components/${element}.git
    cd ${element}
    git remote add ${streamName} https://github.jci.com/${userID}/${element}.git
    git remote -v
    echo -e "\n"
    cd ..
done

################### G3 Repos with 12 branch ###################

g3_12_Repo=(
  # "g3_base"
  # "g3_objects"
  # "g3_integrations"
  # "g3_shared_libraries"
  # "g3_metasys_core"
  # "g3_managed"
  # "nae_product"
  # "java_ui"
  # "snx_product"
  # SCT-PS-Database
  )

for element in ${g3_12_Repo[@]}
do
    cd ${gitLocation}
    echo -e "\n Cloning " ${element}
    git clone https://github.jci.com/g3-metasys/${element}.git -b 12.0
    cd ${element}
    git remote add ${streamName} https://github.jci.com/${userID}/${element}.git
    git remote -v
    echo -e "\n"
    cd ..
done

g3_12_Repo_Master=(
    # "g3_scripts"
    )

for element in ${g3_12_Repo_Master[@]}
do
    echo -e "\n Cloning " ${element}
    git clone https://github.jci.com/g3-metasys/${element}.git
    cd ${element}
    git remote add ${streamName} https://github.jci.com/${userID}/${element}.git
    git remote -v
    echo -e "\n"
    cd ..
done

################### Third party Repos with master branch ###################

ThirdParty_Master=(
    # "wolfSSL"
    # "safeclib"
    # curl
    )

for element in ${ThirdParty_Master[@]}
do
    cd ${gitLocation}
    echo -e "\n Cloning " ${element}
    git clone https://github.jci.com/third-party/${element}.git
    cd ${element}
    git remote add ${streamName} https://github.jci.com/${userID}/${element}.git
    git remote -v
    echo -e "\n"
    cd ..
done

# element=sct_product
# cd ${gitLocation}
# echo -e "\n Cloning " ${element}
# git clone https://github.jci.com/Tools/${element}.git
# cd ${element}
# git remote add ${streamName} https://github.jci.com/${userID}/${element}.git
# git remote -v
# echo -e "\n"
# cd ..

# element=ca_mng_tool_lib
# cd ${gitLocation}
# echo -e "\n Cloning " ${element}
# git clone https://github.jci.com/Tools/${element}.git
# cd ${element}
# git remote add ${streamName} https://github.jci.com/${userID}/${element}.git
# git remote -v
# echo -e "\n"
# cd ..

read -p "Cloning is done, Press any key to continue" -t 777
