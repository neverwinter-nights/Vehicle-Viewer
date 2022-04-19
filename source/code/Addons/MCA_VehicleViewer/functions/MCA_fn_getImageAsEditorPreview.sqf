// MCA_fn_getImageAsEditorPreview.sqf.

params ["_vehClassName", "_config"];

// Absent field as well as empty field is considered as un-available.

private ["_result", "_vehImage", "_mustExit", "_err"];
_result = [false, "", "", ""]; // 1:Success, 2:ImageType, 3:ImagePath, 4:ErrorText.
_mustExit = false;

// Absent field.
if (!(isText (configFile >> _configUsed >> _vehClassName >> "editorPreview"))) exitWith { _result };

_vehImage = getText (configFile >> _configUsed >> _vehClassName >> "editorPreview");

// Empty field.
if (count _vehImage == 0) exitWith { _result };

// Field is set, but the file does not exist.
if (!(fileExists _vehImage)) then
{
	_mustExit = true;
	_err = format ["Image is set as an editor preview, but is not found: %1", _vehImage];
	_result = [false, "editorPreview", _vehImage, _err];
};
if (_mustExit) exitWith { _result };

// Field is set, and the file exists. Finally.
_result = [true, "editorPreview", _vehImage, ""];
_result
