// MCA_fn_getClassNamesOfKind.sqf.

// This function returns a list of classes of the specified kind and config type.
// If the config type is empty, vehicle classes are used.

params ["_vehicleKind", "_configType"];

if (_configType == "") then
{
	_configType = "CfgVehicles";
};

private ["_vehicles"];
_vehicles = [];
if (count _vehicleKind == 0) exitWith { _vehicles };

private ["_allVehicles"];
_allVehicles = (configfile >> _configType) call BIS_fnc_getCfgSubClasses;

{
    if (_x isKindOf _vehicleKind) then 
	{
		_vehicles pushBack _x; 
	};
} forEach _allVehicles;

_vehicles
