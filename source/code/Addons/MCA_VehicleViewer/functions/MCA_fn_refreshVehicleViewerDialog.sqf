// MCA_fn_refreshVehicleViewerDialog.sqf.

params ["_actionId", "_ctrlResponse"];

// This function is called by the dialog window.
// It refreshes the dialog's contents.

// ActionIDs:
// 1 = Filter button is pressed.
// 2 = Class List Selection is made.

private ["_dialog", "_selectedIndex"];
_dialog = ctrlParent (_ctrlResponse select 0);
_selectedIndex = _ctrlResponse select 1;

// Input Controls.
private ["_ctrlKindFilter", "_ctrlPrefixFilter", "_ctrlClassFilter", "_ctrlBaseFilter"];

// Input Data.
private ["_kindFilter", "_prefixFilter", "_classFilter", "_baseFilter"];

// Output Controls.
private ["_ctrlVehicleClasses", "_ctrlVehicleName", "_ctrlParentClasses", "_ctrlVehicleImage", "_ctrlDescription"];

// Output Data.
private ["_vehicleClasses", "_vehicleName", "_parentClasses", "_vehicleImage"];

// Get the control objects.
_ctrlKindFilter = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_KindFilter;
_ctrlPrefixFilter = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_PrefixFilter;
_ctrlClassFilter = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_ClassFilter;
_ctrlBaseFilter = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_BaseFilter;
_ctrlVehicleClasses = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_VehicleClasses;
_ctrlVehicleName = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_VehicleName;
_ctrlParentClasses = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_ParentClasses;
_ctrlVehicleImage = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_VehicleImage;
_ctrlDescription = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_Description;

// Read the input data of the filter.
_kindFilter = ctrlText _ctrlKindFilter;
_prefixFilter = ctrlText _ctrlPrefixFilter;
_classFilter = ctrlText _ctrlClassFilter;
_baseFilter = cbChecked _ctrlBaseFilter;

private ["_mustExit"];
_mustExit = false;

// Filter button is pressed.
if (_actionId == 1) then
{
	// Get the list of filtered classes.
	_vehicleClasses = [_kindFilter, ""] call MCA_fn_getClassNamesOfKind;
	_vehicleClasses = [_vehicleClasses, _prefixFilter, _classFilter, _baseFilter] call MCA_fn_filterClasses;

    // Refresh the vehicle classes list.
    lbClear _ctrlVehicleClasses;
    {
        _ctrlVehicleClasses lbAdd _x;
    } forEach _vehicleClasses;

    // Clear the selected vehicle data, as no class is selected.
    _ctrlVehicleClasses lbSetCurSel -1;
    _ctrlVehicleName ctrlSetText "";
    _ctrlParentClasses ctrlSetText "";
    _ctrlVehicleImage ctrlSetText "#(argb,8,8,3)color(1,1,1,1)";
    _ctrlDescription ctrlSetText "";

    _mustExit = true;
};
if (_mustExit) exitWith {};

// Class List Selection is made.
if ((_actionId == 2) and (_selectedIndex >= 0)) then
{
	private ["_currentVehicleClass", "_currentVehicleImageType", "_tmp", "_description"];

    // Get the selected class.
    _currentVehicleClass = _ctrlVehicleClasses lbText (lbCurSel _ctrlVehicleClasses);

	// Get the vehicle name, parent classes, description.
	_vehicleName = getText (configFile >> "CfgVehicles" >> _currentVehicleClass >> "displayName");
    _parentClasses = [_currentVehicleClass call MCA_fn_getParentClasses] call MCA_fn_prettifyParentClasses;
    _description = [_currentVehicleClass, ""] call MCA_fn_getClassDescription;

    // Get the class image.
    _tmp = [_currentVehicleClass, ""] call MCA_fn_getClassImage;
    _vehicleImage = _tmp select 0;
    _currentVehicleImageType = _tmp select 1;

     // Change the selected vehicle data in GUI.
    _ctrlVehicleName ctrlSetText _vehicleName;
    _ctrlParentClasses ctrlSetText _parentClasses;
    _ctrlVehicleImage ctrlSetText _vehicleImage;
    _ctrlDescription ctrlSetText _description;

    _mustExit = true;
};
if (_mustExit) exitWith {};
