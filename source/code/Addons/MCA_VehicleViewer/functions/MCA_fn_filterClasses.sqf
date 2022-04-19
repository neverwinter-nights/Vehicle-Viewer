// MCA_fn_filterClasses.sqf.

// This function filters class names.
// Filters that are applied:
//	- Prefix;
//	- Search text;
//	- Base classes.

params ["_classNames", "_prefix", "_searchText", "_isBaseClassNeeded"];

private ["_filteredClassNames", "_ok", "_lx", "_lPrefix", "_lSearchText"];
_filteredClassNames = [];
_lPrefix = toLower _prefix;
_lSearchText = toLower _searchText;

{
	_lx = toLower _x;
	
	// AFAIK, nested IF statements do not support loop breaking.
	// So, we are using a small helping flag here.
	_ok = true;
	
	// 1. Prefix Check.
	if (count _prefix > 0) then 
	{
		if (([_lx, _lPrefix] call MCA_fn_strHasPrefix) == false) then { _ok = false };
	};
	if (!(_ok)) then { continue };
	
	// 2. Search Text.
	if (count _searchText > 0) then 
	{
		if ((_lx find [_lSearchText, 0]) < 0) then { _ok = false };
	};
	if (!(_ok)) then { continue };
	
	// 3. Base Class Check.
	if (_isBaseClassNeeded == false) then 
	{
		if ((_lx find ["_base", 0]) >= 0) then { _ok = false };
	};
	if (!(_ok)) then { continue };
	
	if (_ok) then 
	{
		_filteredClassNames pushBack _x;
	};
} forEach _classNames;

_filteredClassNames
