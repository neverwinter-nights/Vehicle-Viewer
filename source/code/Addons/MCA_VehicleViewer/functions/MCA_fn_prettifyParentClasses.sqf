// MCA_fn_prettifyParentClasses.sqf.

params ["_classes"];

private ["_len"];
_len = count _classes;

// No classes in the list.
if (_len < 1) exitWith { "" };

// One class in the list.
private ["_s"];
_s = _classes select 0;
if (_len == 1) exitWith { _s };

// Two or more classes in the list.
for "_i" from 1 to (_len - 1) do 
{
	_s = _s + " >> " + (_classes select _i);
};

_s
