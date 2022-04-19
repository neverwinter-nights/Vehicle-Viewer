// MCA_fn_getImageAsClassParameter.sqf.

params ["_vehClassName", "_config", "_classParameter"];

// Absent field as well as empty field is considered as un-available.

private ["_result", "_vehImage", "_mustExit", "_err"];
_result = [false, "", "", ""]; // 1:Success, 2:ImageType, 3:ImagePath, 4:ErrorText.
_mustExit = false;

// Absent field.
if (!(isText (configFile >> _configUsed >> _vehClassName >> _classParameter))) exitWith { _result };

_vehImage = getText (configFile >> _configUsed >> _vehClassName >> _classParameter);

// Empty field.
if ((count _vehImage) == 0) exitWith { _result };

// Field is set, and the file exists.
if (fileExists _vehImage) then
{
	_mustExit = true;
	_result = [true, _classParameter, _vehImage, ""];
};
if (_mustExit) exitWith { _result };

// Field is set, but the file does not exist ...

// Try searching in CfgVehicleIcons.
private ["_picturePath"];
if (isText (configFile >> "CfgVehicleIcons" >> _vehImage)) then
{
	_picturePath = getText (configFile >> "CfgVehicleIcons" >> _vehImage);
	if ((count _picturePath) > 0) then
	{
		if (fileExists _picturePath) then
		{
			// Picture is set in CfgVehicleIcons and is found.
			_mustExit = true;
			_result = [true, _classParameter, _picturePath, ""];
		}
		else
		{
			// Picture is set in CfgVehicleIcons but is not found.
			_mustExit = true;
			_err = format ["Image is registered in CfgVehicleIcons, but is not found: %1", _picturePath];
			_result = [false, _classParameter, _picturePath, _err];
		};
	};
};
if (_mustExit) exitWith { _result };

// Some additional searches.
//TODO.

_result
