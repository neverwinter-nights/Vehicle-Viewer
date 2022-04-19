// vehicle_viewer.hpp.

// Documentation:
// https://community.bistudio.com/wiki/Arma:_GUI_Configuration

class MCA_VehicleViewerDialog
{
    idd = 9002;

	movingEnable = "true";
	enableSimulation = "true";

	onLoad = "";
	onUnload = "_this call MCA_fn_finVehicleViewerDialog;";

	class ControlsBackground
	{
	    class DialogBG: IGUIBack
        {
            idc = 900;
            moving = "true";
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 25 * GUI_GRID_H;

            colorBackground[] = {0.5,0.5,0.5,0.5};
        };
	};


	class Controls
	{
	    // Top Header.
	    // Dialog Title and Cancel Button.
	    class DialogTitle: RscText
        {
            idc = 901;
            moving = "true";
            text = "VEHICLE VIEWER";
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
        };
        class QuitButton: RscButton
        {
            idc = 2; // 2 = Cancel.
            text = "QUIT";
            moving = "true";
            x = 35 * GUI_GRID_W + GUI_GRID_X;
            y = 1 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;

            colorText[] =				{1.0, 1.0, 1.0, 1.0};
			colorBackground[] =			{1.0, 0.1, 0.1, 0.5};
			colorFocused[] =			{1.0, 0.1, 0.1, 0.7};
			colorBackgroundActive[] =	{1.0, 0.1, 0.1, 1.0};
			tooltip = "Press this button to exit the dialog window";
        };


        // Filters.
        class FilterButton: RscButton
        {
            idc = 902;
            moving = "true";
            text = "FILTER";
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 3.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;

            colorBackground[] =			{0.1, 1.0, 0.1, 0.5};
			colorFocused[] =			{0.1, 1.0, 0.1, 0.7};
			colorBackgroundActive[] =	{0.1, 1.0, 0.1, 1.0};
            // 1 = Filter Button.
            onButtonClick = "[1, _this] call MCA_fn_refreshVehicleViewerDialog;";
        };
        class KindTitle: RscText
        {
            idc = 903;
            moving = "true";
            text = "KIND =";
            x = 5 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 3 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;

            tooltip = "Class Kind. Examples: All, Land, Ship, Air, ...";
        };
        class KindFilter: RscEdit
        {
            idc = 904;
            moving = "true";
            text = "";
            x = 8 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;

            colorBackground[] = {0,0,0,0.5};
        };
        class PrefixTitle: RscText
        {
            idc = 905;
            moving = "true";
            text = "PREFIX =";
            x = 14.5 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;

            tooltip = "Class Name Prefix. Can filter add-on classes. Examples: CUP_, RHS_, ...";
        };
        class PrefixFilter: RscEdit
        {
            idc = 906;
            moving = "true";
            text = "";
            x = 18.5 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;

            colorBackground[] = {0,0,0,0.5};
        };
        class ClassTitle: RscText
        {
            idc = 907;
            moving = "true";
            text = "FILTER =";
            x = 23 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 3.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;

            tooltip = "Class Name Filter Text. If the class name includes this text, it will be shown. Set it empty to disable.";
        };
        class ClassFilter: RscEdit
        {
            idc = 908;
            moving = "true";
            text = "";
            x = 27 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;

            colorBackground[] = {0,0,0,0.5};
        };
        class BaseTitle: RscText
        {
            idc = 909;
            moving = "true";
            text = "BASE =";
            x = 34.75 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 3 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;

            tooltip = "Enable it to show virtual base classes. They don't have images and normally should not be shown.";
        };
        class BaseFilter: RscCheckbox
        {
            idc = 910;
            moving = "true";
            x = 38 * GUI_GRID_W + GUI_GRID_X;
            y = 3 * GUI_GRID_H + GUI_GRID_Y;
            w = 1 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };


        // Left List of filtered classes.
        class VehicleClasses: RscListbox
        {
            idc = 911;
            moving = "true";
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 5 * GUI_GRID_H + GUI_GRID_Y;
            w = 18 * GUI_GRID_W;
            h = 19 * GUI_GRID_H;

            colorBackground[] = {0,0,0,0.5};
            // 2 = Class List Selection.
            onLBSelChanged = "[2, _this] call MCA_fn_refreshVehicleViewerDialog;";
        };


        // Right Section.
        // Vehicle Name, Chain of Parent Classes, Vehicle Image, Spawn Button.
        class VehicleName: RscText
        {
            idc = 912;
            moving = "true";
            text = "";
            x = 20 * GUI_GRID_W + GUI_GRID_X;
            y = 5 * GUI_GRID_H + GUI_GRID_Y;
            w = 19 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
        };
        class ParentClasses: RscEdit
        {
            idc = 913;
            moving = "true";
            text = "";
            x = 20 * GUI_GRID_W + GUI_GRID_X;
            y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 19 * GUI_GRID_W;
            h = 3 * GUI_GRID_H;

            colorBackground[] = {0,0,0,0.5};
            style = ST_MULTI;   // Multi-line Style.
            canModify = 0;      // Read Only.
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)"; // Font Size.
        };

        class VehicleImage: RscPictureKeepAspect
        {
            idc = 914;
            moving = "true";
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 20 * GUI_GRID_W + GUI_GRID_X;
            y = 10 * GUI_GRID_H + GUI_GRID_Y;
            w = 19 * GUI_GRID_W;
            h = 9.5 * GUI_GRID_H;
        };
        class Description: RscEdit
        {
            idc = 915;
            moving = "true";
            text = "";
            x = 20 * GUI_GRID_W + GUI_GRID_X;
            y = 20 * GUI_GRID_H + GUI_GRID_Y;
            w = 19 * GUI_GRID_W;
            h = 2.5 * GUI_GRID_H;

            colorBackground[] = {0,0,0,0.5};
            style = ST_MULTI;   // Multi-line Style.
            canModify = 0;      // Read Only.
            sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)"; // Font Size.
        };
        class SpawnVehicle: RscButton
        {
            idc = 916;
            moving = "true";
            text = "SPAWN THE VEHICLE";
            x = 20 * GUI_GRID_W + GUI_GRID_X;
            y = 23 * GUI_GRID_H + GUI_GRID_Y;
            w = 19 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;

            colorBackground[] =			{0.1, 0.1, 1.0, 0.5};
			colorFocused[] =			{0.1, 0.1, 1.0, 0.7};
			colorBackgroundActive[] =	{0.1, 0.1, 1.0, 1.0};
            onButtonClick = "(_this select 0) ctrlEnable false; [player, _this] call MCA_fn_onSpawnVehicleButtonClick;";
        };
	};
};
