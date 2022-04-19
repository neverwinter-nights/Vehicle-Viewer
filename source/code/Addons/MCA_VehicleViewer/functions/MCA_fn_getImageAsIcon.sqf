// MCA_fn_getImageAsIcon.sqf.

params ["_vehClassName", "_config"];

private ["_result"];
_result = [_vehClassName, _config, "icon"] call MCA_fn_getImageAsClassParameter;
_result
