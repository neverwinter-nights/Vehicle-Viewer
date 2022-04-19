// MCA_fn_getVehicleParameters.sqf.

////////////////////////////////////////////////////////////////////////////////
//
// This function tries to get the mass of a vehicle and some other parameters.
// This is a hack, it may not work every time.
//
////////////////////////////////////////////////////////////////////////////////
//
// Disclaimer.
//
////////////////////////////////////////////////////////////////////////////////
//
// While the Bohemia Interactive Studios do not want to implement a normal
// usable API, I have to do following "hacks" to get vehicle's mass and other
// parameters. I hope that developers of this game will hear the community some
// day. I will not collect all the statistics at the game start and store it in
// a "special" object somewhere on an inhabited island in the middle of nowhere.
// It is not my job to make the game engine. I have no access to the engine of
// this game. Making the game engine good and usable is the job of the game
// developers.
//
////////////////////////////////////////////////////////////////////////////////

params ["_caller", "_vehClassName"];

if (!(isClass (configFile >> "CfgVehicles" >> _vehClassName))) exitWith { [0.0, [0, 0, 0], []] };

// Create a vehicle in the sky.
private ["_callerPos", "_vehPos", "_veh", "_mass", "_dimensions", "_seats"];
_callerPos = position _caller;
_vehPos =
[
    _callerPos select 0,
    _callerPos select 1,
    (_callerPos select 2) + MCA_VehicleViewer_TempVehicleSpawnAltitudeMin +
        (random MCA_VehicleViewer_TempVehicleSpawnAltitudeDeltaRange)
];
_veh = createVehicle [_vehClassName, _vehPos, [], 0, "FLY"];
_veh allowDamage false;

// Get the parameters.
_mass = getMass _veh;
_dimensions = _veh call MCA_fn_getObjectDimensions;
_seats = fullCrew [_veh, "", true];
_veh allowDamage true;

// Delete the vehicle.
// Weapon holders are the special feature of the game engine.
private ["_wh"];
_wh = objectParent _veh;
if (isNull _wh) then { deleteVehicle _veh; } else { deleteVehicle _wh; };

[_mass, _dimensions, _seats]
