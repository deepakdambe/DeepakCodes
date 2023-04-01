export ROOT=/C/ccm_wa/git
export updMsg=" *******  Showing branches of "

echo "$updMsg jci_base_libs"
cd $ROOT/jci_base_libs/ && git branch
echo ""
echo ""

echo "$updMsg jci_mms"
cd $ROOT/jci_mms/ && git branch
echo ""
echo ""

echo "$updMsg jci_os_api"
cd $ROOT/jci_os_api/ && git branch
echo ""
echo ""

echo "$updMsg jci_ore"
cd $ROOT/jci_ore/ && git branch
echo ""
echo ""

echo "$updMsg jci_ore_features"
cd $ROOT/jci_ore_features/ && git branch
echo ""
echo ""

sleep 5s

echo "$updMsg jci_baccomm"
cd $ROOT/jci_baccomm/ && git branch
echo ""
echo ""

echo "$updMsg jci_pointio"
cd $ROOT/jci_pointio/ && git branch
echo ""
echo ""

echo "$updMsg jci_tool_lib"
cd $ROOT/jci_tool_lib/ && git branch
echo ""
echo ""

echo "$updMsg jci_serial_comm"
cd $ROOT/jci_serial_comm/ && git branch
echo ""
echo ""

echo "$updMsg jci_integrations"
cd $ROOT/jci_integrations/ && git branch
echo ""

echo "$updMsg jci_scripts"
cd $ROOT/jci_scripts/ && git branch
echo ""
echo ""

echo "$updMsg jci_msl"
cd $ROOT/jci_msl/ && git branch
echo ""
echo ""

sleep 5s

# ***************************************************************************************

export G3_ROOT=$ROOT

echo "$updMsg g3_base"
cd $G3_ROOT/g3_base/ && git branch 
echo ""
echo ""

echo "$updMsg g3_objects"
cd $G3_ROOT/g3_objects/ && git branch
echo ""
echo ""

echo "$updMsg g3_shared_libraries"
cd $G3_ROOT/g3_shared_libraries/ && git branch 
echo ""
echo ""

echo "$updMsg g3_integrations"
cd $G3_ROOT/g3_integrations/ && git branch 
echo ""
echo ""

echo "$updMsg g3_metasys_core"
cd $G3_ROOT/g3_metasys_core/ && git branch 
echo ""
echo ""

echo "$updMsg g3_scripts"
cd $G3_ROOT/g3_scripts/ && git branch 
echo ""
echo ""

#echo "$updMsg g3_managed"
#cd $G3_ROOT/g3_managed/ && git branch 
#echo ""
#echo ""

read -p "Finished with showing all branches, Press any key to continue" -t 22

