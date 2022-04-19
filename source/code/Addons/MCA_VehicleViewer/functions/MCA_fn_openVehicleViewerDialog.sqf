// MCA_fn_openVehicleViewerDialog.sqf.

params ["_callerPlayer"];

// Open the dialog.
private ["_dialog"];
_dialog = createDialog ["MCA_VehicleViewerDialog", true];
[player, _dialog] call MCA_fn_initVehicleViewerDialog;
