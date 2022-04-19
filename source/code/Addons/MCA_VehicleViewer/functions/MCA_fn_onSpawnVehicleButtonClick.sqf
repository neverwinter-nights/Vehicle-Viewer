// MCA_fn_onSpawnVehicleButtonClick.sqf.

params ["_callerPlayer", "_ctrl"];

private ["_dialog", "_ctrlVehicleClasses", "_vehClassName"];
_dialog = ctrlParent (_ctrl select 0); // For some reason control is passed as an array.

// Get the current (selected) class name.
_ctrlVehicleClasses = _dialog displayCtrl MCA_VehicleViewerDialogCtrlId_VehicleClasses;
_vehClassName = _ctrlVehicleClasses lbText (lbCurSel _ctrlVehicleClasses);
 
_dialog closeDisplay 1;

// We must use sleep in the called code, so we go to the scheduler.
[_callerPlayer, _vehClassName] spawn 
{
	params ["_caller", "_vehClass"];
	
	[_caller, _vehClass] call MCA_fn_spawnVehicle;
};
