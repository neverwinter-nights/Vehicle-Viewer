// MCA_fn_initVehicleViewerDialog.sqf.

params ["_callerPlayer", "_dialog"];

// Input Controls.
private ["_ctrlKindFilter", "_ctrlPrefixFilter", "_ctrlClassFilter", "_ctrlBaseFilter"];

// Output Controls.
private ["_ctrlVehicleClasses", "_ctrlVehicleName", "_ctrlParentClasses", "_ctrlVehicleImage", "_ctrlDescription"];

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

// Try to load the settings.
private ["_settings"];
_settings = _callerPlayer call MCA_fn_loadSettings;

// Set the values.
if ((_settings select 0) == true) then
{
    _ctrlKindFilter ctrlSetText (_settings select 1);
    _ctrlPrefixFilter ctrlSetText (_settings select 2);
    _ctrlClassFilter ctrlSetText (_settings select 3);

    _ctrlVehicleName ctrlSetText "";
    _ctrlParentClasses ctrlSetText "";
    _ctrlVehicleImage ctrlSetText "#(argb,8,8,3)color(1,1,1,1)";
    _ctrlDescription ctrlSetText "";
}
else
{
    _ctrlKindFilter ctrlSetText MCA_VehicleViewer_DefaultClassKind;
    _ctrlPrefixFilter ctrlSetText "";
    _ctrlClassFilter ctrlSetText "";

    _ctrlVehicleName ctrlSetText "";
    _ctrlParentClasses ctrlSetText "";
    _ctrlVehicleImage ctrlSetText "#(argb,8,8,3)color(1,1,1,1)";
    _ctrlDescription ctrlSetText "";
};
