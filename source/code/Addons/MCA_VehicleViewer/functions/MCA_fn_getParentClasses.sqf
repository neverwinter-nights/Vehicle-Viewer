// MCA_fn_getParentClasses.sqf.

// This function returns a chain of parent classes.

params ["_currentVehicleClass"];

private ["_parents"];
_parents = [];

if (!(isClass (configFile >> "CfgVehicles" >> _currentVehicleClass))) exitWith { _parents };

private ["_class"];
_class = (configFile >> "CfgVehicles" >> _currentVehicleClass);
while { !(isNull _class) } do
{
	_parents pushBack (configName _class);
	_class = inheritsFrom _class;
};
reverse _parents;
_parents
