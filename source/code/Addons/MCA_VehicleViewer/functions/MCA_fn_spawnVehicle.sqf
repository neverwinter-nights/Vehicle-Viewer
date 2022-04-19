// MCA_fn_spawnVehicle.sqf.

params ["_caller", "_vehClassName"];

// To spawn a vehicle we must get its dimensions.
// To get vehicle's dimensions, we need to spawn the vehicle.
// Wait, what ?

// Get the mesurements.
private ["_callerPos", "_vehPos", "_vehDiagonal"];
_callerPos = position _caller;
_vehPos = [_callerPos select 0, _callerPos select 1, (_callerPos select 2) + 5000 + (random 2000)];
_veh = createVehicle [_vehClassName, _vehPos, [], 0, "FLY"];
_veh allowDamage false;
_vehDiagonal = _veh call MCA_fn_getObjectDiagonal;
_vehPos = (position _caller) vectorAdd ((vectorDir _caller) vectorMultiply  (_vehDiagonal));
deleteVehicle _veh;

// Place the object.
_veh = createVehicle [_vehClassName, _vehPos, [], 0, "NONE"];
_veh allowDamage false;
systemChat format ["Vehcile has been created. Please wait %1 seconds.", MCA_VehicleViewer_VehicleSpawnEnableDamageDelay];
sleep MCA_VehicleViewer_VehicleSpawnEnableDamageDelay;
_veh allowDamage true;
systemChat format ["Vehcile is ready to use."];
