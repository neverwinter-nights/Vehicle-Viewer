// MCA_fn_finVehicleViewerDialog.sqf.

params ["_ctrlResponse"];

// Input Controls.
private ["_ctrlKindFilter", "_ctrlPrefixFilter", "_ctrlClassFilter", "_ctrlBaseFilter"];

// Output Controls.
private ["_ctrlVehicleClasses", "_ctrlVehicleName", "_ctrlParentClasses", "_ctrlVehicleImage", "_ctrlDescription"];

// Get the control objects.
private ["_dialog"];
_dialog = _ctrlResponse;
_ctrlKindFilter = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_KindFilter;
_ctrlPrefixFilter = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_PrefixFilter;
_ctrlClassFilter = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_ClassFilter;
_ctrlBaseFilter = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_BaseFilter;
_ctrlVehicleClasses = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_VehicleClasses;
_ctrlVehicleName = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_VehicleName;
_ctrlParentClasses = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_ParentClasses;
_ctrlVehicleImage = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_VehicleImage;
_ctrlDescription = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_Description;

// Save the settings.
[
	player, 
	ctrlText _ctrlKindFilter,
	ctrlText _ctrlPrefixFilter, 
	ctrlText _ctrlClassFilter
] call MCA_fn_saveSettings;
