// MCA_fn_getImageAsPicture.sqf.

params ["_vehClassName", "_config"];

private ["_result"];
_result = [_vehClassName, _config, "picture"] call MCA_fn_getImageAsClassParameter;
_result
