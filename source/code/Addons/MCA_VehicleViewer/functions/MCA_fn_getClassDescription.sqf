// MCA_fn_getClassDescription.sqf.

params ["_vehClassName", "_config"];

private ["_configUsed", "_descriptionText", "_n", "_tmp", "_dimensions", "_seats"];
if (_config == "") then { _configUsed = "CfgVehicles" } else { _configUsed = _config };
_descriptionText = "";

// Wheels Count.
if (isNumber (configFile >> _configUsed >> _vehClassName >> "numberPhysicalWheels")) then 
{
	_n = getNumber (configFile >> _configUsed >> _vehClassName >> "numberPhysicalWheels");
	if (_n > 0) then
	{
		_descriptionText = _descriptionText + format ["%1 Wheels. ", _n];
	};
};

// Mass (or weight) is not visible in the class config.

// Fuel Capacity.
if (isNumber (configFile >> _configUsed >> _vehClassName >> "fuelCapacity")) then 
{
	_n = getNumber (configFile >> _configUsed >> _vehClassName >> "fuelCapacity");
	if (_n > 0) then
	{
		_descriptionText = _descriptionText + format ["Fuel Capacity: %1. ", round _n];
	};
};

// Fuel Consumption Rate.
if (isNumber (configFile >> _configUsed >> _vehClassName >> "fuelConsumptionRate")) then 
{
	_n = getNumber (configFile >> _configUsed >> _vehClassName >> "fuelConsumptionRate");
	if (_n > 0) then
	{
		_descriptionText = _descriptionText + format ["Fuel Consumtion Rate: %1. ", _n];
	};
};

// Engine Max. RPM.
if (isNumber (configFile >> _configUsed >> _vehClassName >> "redRpm")) then 
{
	_n = getNumber (configFile >> _configUsed >> _vehClassName >> "redRpm");
	if (_n > 0) then
	{
		_descriptionText = _descriptionText + format ["Engine Max. RPM: %1. ", round _n];
	};
};

// Engine Peak Torque.
if (isNumber (configFile >> _configUsed >> _vehClassName >> "peakTorque")) then 
{
	_n = getNumber (configFile >> _configUsed >> _vehClassName >> "peakTorque");
	if (_n > 0) then
	{
		_descriptionText = _descriptionText + format ["Engine Peak Torque: %1. ", round _n];
	};
};

// Parameters: Mass & Dimensions ...
_tmp = [player, _vehClassName] call MCA_fn_getVehicleParameters;

// 1. Maximum dimension.
_dimensions = _tmp select 1;
_n = ((_dimensions select 0) max (_dimensions select 1)) max (_dimensions select 2);
if (_n > 0) then
{
	// Round the dimension to 0.1.
	_n = round (_n * 10) / 10;
	
	_descriptionText = _descriptionText + format ["Maximum Dimension: %1. ", _n];
};

// 2. Seats.
_seats = _tmp select 2;
_n = count _seats;
if (_n > 0) then
{
	_descriptionText = _descriptionText + format ["Seats: %1. ", _n];
};

// 3. Mass.
_n = _tmp select 0;
if (_n > 0) then
{
	_descriptionText = _descriptionText + format ["Mass: %1. ", round _n];
};

// Maximum Sling Load Mass.
if (isNumber (configFile >> _configUsed >> _vehClassName >> "slingLoadMaxCargoMass")) then 
{
	_n = getNumber (configFile >> _configUsed >> _vehClassName >> "slingLoadMaxCargoMass");
	if (_n > 0) then
	{
		_descriptionText = _descriptionText + format ["Max. Sling Load Mass: %1. ", round _n];
	};
};

_descriptionText
