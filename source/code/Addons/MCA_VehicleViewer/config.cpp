// UI.
#include "ui\styles.hpp"
#include "ui\dialogs\vehicle_viewer.hpp"

// Main Properties of the Modification (Mod).
class CfgPatches
{
	class MCA_VehicleViewer
	{
			// Meta information for editor.
			name = "Vehicle Viewer";
			author = "McArcher";

			// Minimum compatible version.
			requiredVersion = 2.08;

			// Required addons, used for loading order.
			requiredAddons[] =
			{
				"A3_Data_F"
			};

			// List of objects (CfgVehicles classes) contained in the Mod.
			// Important also for Zeus content (units and groups) unlocking.
			units[] = {};

			// List of weapons (CfgWeapons classes) contained in the addon.
			weapons[] = {};
	};
};

class CfgFunctions
{
	class MCA // Tag.
	{
		class VehicleViewer // Category.
		{
			// MCA_fn_initVehicleViewer.
			class initVehicleViewer // Function name.
			{
				// Source file path will be: "<ROOT>\<file>".
				file = "MCA_VehicleViewer\functions\MCA_fn_initVehicleViewer.sqf";

				// The postInit attribute can be set to 1 to call the function
				// upon mission start, after objects are initialized. Passed
				// arguments are ["postInit", didJIP]. The function is run in
				// a scheduled environment so suspension is allowed, but any
				// long term suspension will halt the mission loading until
				// suspension is done.
				postInit = 1;
			};
		};
	};
};
