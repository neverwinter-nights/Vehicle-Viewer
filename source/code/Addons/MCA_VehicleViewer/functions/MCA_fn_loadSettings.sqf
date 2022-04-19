// MCA_fn_loadSettings.sqf.

params ["_player"];

private ["_data"];
_data = _player getVariable MCA_VehicleViewer_VarName_LastSettings;
if (isNil "_data") exitWith { [false, "", "", ""] };

[true, _data select 0, _data select 1, _data select 2]
