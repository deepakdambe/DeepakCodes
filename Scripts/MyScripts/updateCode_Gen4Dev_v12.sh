export ROOT=/C/ccm_wa/git
export updMsg=" *******  Updating "

sh branchShow_JNC_G3.sh

read -p "\n This script will update all local repos, Press any key to continue, or ctrl+C to exit. \n" -t 22

updateJNC=1
if [ $updateJNC = 1 ]; then

  echo "$updMsg jci_scripts"
  cd $ROOT/jci_scripts/ && git pull origin master
  echo ""
  echo ""

  echo "$updMsg jci_msl"
  cd $ROOT/jci_msl/ && git pull origin master
  echo ""
  echo ""
  
  echo "$updMsg jci_base_libs"
  cd $ROOT/jci_base_libs/ && git pull origin master
  echo ""
  echo ""

  echo "$updMsg jci_mms"
  cd $ROOT/jci_mms/ && git pull origin master
  echo ""
  echo ""

  echo "$updMsg jci_os_api"
  cd $ROOT/jci_os_api/ && git pull origin master
  echo ""
  echo ""

  echo "$updMsg jci_ore"
  cd $ROOT/jci_ore/ && git pull origin master
  echo ""
  echo ""

  echo "$updMsg jci_ore_features"
  cd $ROOT/jci_ore_features/ && git pull origin master
  echo ""
  echo ""

  echo "$updMsg jci_baccomm"
  cd $ROOT/jci_baccomm/ && git pull origin master
  echo ""
  echo ""

  echo "$updMsg jci_pointio"
  cd $ROOT/jci_pointio/ && git pull origin master
  echo ""
  echo ""

  echo "$updMsg jci_tool_lib"
  cd $ROOT/jci_tool_lib/ && git pull origin master
  echo ""
  echo ""

  echo "$updMsg jci_serial_comm"
  cd $ROOT/jci_serial_comm/ && git pull origin master
  echo ""
  echo ""

  echo "$updMsg jci_integrations"
  cd $ROOT/jci_integrations/ && git pull origin master
  echo ""

  read -p "\n All JNC Update Done, Press any key to continue, or ctrl+C to exit. \n" -t 12

fi
# ***************************************************************************************

export G3_ROOT=$ROOT

echo "$updMsg g3_base"
cd $G3_ROOT/g3_base/ && git pull origin 12.0
echo ""
echo ""

echo "$updMsg g3_objects"
cd $G3_ROOT/g3_objects/ && git pull origin 12.0
echo ""
echo ""

echo "$updMsg g3_shared_libraries"
cd $G3_ROOT/g3_shared_libraries/ && git pull origin 12.0
echo ""
echo ""

echo "$updMsg g3_integrations"
cd $G3_ROOT/g3_integrations/ && git pull origin 12.0
echo ""
echo ""

echo "$updMsg g3_metasys_core"
cd $G3_ROOT/g3_metasys_core/ && git pull origin 12.0
echo ""
echo ""

echo "$updMsg nae_product"
cd $ROOT/nae_product/ && git pull origin 12.0
echo ""
echo ""

echo "$updMsg snx_product"
cd $ROOT/snx_product/ && git pull origin 12.0
echo ""
echo ""

echo "$updMsg g3_scripts"
cd $G3_ROOT/g3_scripts/ && git pull origin master
echo ""
echo ""

echo "$updMsg g3_managed"
cd $G3_ROOT/g3_managed/ && git pull origin 12.0
echo ""
echo ""

# echo "$updMsg mmda"
# cd $G3_ROOT/mmda/ && git pull origin master
# echo ""
# echo ""

read -p "All Update Done, Press any key to continue" -t 777

