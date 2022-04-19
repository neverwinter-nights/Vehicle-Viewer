// MCA_fn_getClassImage.sqf.

params ["_vehClassName", "_config"];

private ["_configUsed", "_mustExit", "_result"];
if (_config == "") then { _configUsed = "CfgVehicles" } else { _configUsed = _config };
_mustExit = false;
_result = ["", ""]; // 1:ImagePath, 2:ImageType.

private ["_checkerFuncs"];
_checkerFuncs = [MCA_fn_getImageAsEditorPreview, MCA_fn_getImageAsPicture, MCA_fn_getImageAsIcon];

{
    _result = [_vehClassName, _configUsed] call _x;

    if ((_result select 0) == true) then
    {
        _mustExit = true;
        _result = [_result select 2, _result select 1];
    }
    else
    {
        // Show an error if we have it.
        if (count (_result select 3) > 0) then
        {
            systemChat (_result select 3);
        };
    };
    if (_mustExit) then { break };
} forEach _checkerFuncs;
if (_mustExit) exitWith { _result };

// We have got a ghost vehicle without any picture.
_result = ["#(argb,8,8,3)color(1,0.4313,0.7058,1)", "colour"];
_result
