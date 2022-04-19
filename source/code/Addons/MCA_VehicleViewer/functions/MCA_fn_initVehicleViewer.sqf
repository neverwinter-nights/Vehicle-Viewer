// MCA_fn_initVehicleViewer.sqf.

// This function is started automatically while it is described as a library
// function in "config.cpp" file. While it is started as "postInit", passed
// arguments are [String:"postInit", Boolean:didJIP].

// Constants.
MCA_VehicleViewer_ActionText = "Vehicle Viewer";
MCA_VehicleViewer_DefaultClassKind = "All";
MCA_VehicleViewer_VehicleSpawnEnableDamageDelay = 15;
// Altitude for temporary vehicles.
// For more information see the 'MCA_fn_getVehicleParameters.sqf' file.
MCA_VehicleViewer_TempVehicleSpawnAltitudeMin = 100 * 1000;
MCA_VehicleViewer_TempVehicleSpawnAltitudeDeltaRange = 50 * 1000;

// Dialog Control IDs.
// These IDs are hard-coded in UI, see the 'ui\vehicle_viewer.hpp' file.
MCA_VehicleViewerDialogCtrlId_KindFilter = 904;
MCA_VehicleViewerDialogCtrlId_PrefixFilter = 906;
MCA_VehicleViewerDialogCtrlId_ClassFilter = 908;
MCA_VehicleViewerDialogCtrlId_BaseFilter = 910;
//
MCA_VehicleViewerDialogCtrlId_VehicleClasses = 911;
MCA_VehicleViewerDialogCtrlId_VehicleName = 912;
MCA_VehicleViewerDialogCtrlId_ParentClasses = 913;
MCA_VehicleViewerDialogCtrlId_VehicleImage = 914;
MCA_VehicleViewerDialogCtrlId_Description = 915;

// Variable names.
MCA_VehicleViewer_VarName_LastSettings = "MCA_VV_LastSettings";

// Functions.
MCA_fn_initPlayer = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_initPlayer.sqf";
MCA_fn_openVehicleViewerDialog = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_openVehicleViewerDialog.sqf";
MCA_fn_initVehicleViewerDialog = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_initVehicleViewerDialog.sqf";
MCA_fn_refreshVehicleViewerDialog = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_refreshVehicleViewerDialog.sqf";
MCA_fn_getClassNamesOfKind = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_getClassNamesOfKind.sqf";
MCA_fn_getParentClasses = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_getParentClasses.sqf";
MCA_fn_prettifyParentClasses = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_prettifyParentClasses.sqf";
MCA_fn_getClassImage = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_getClassImage.sqf";
MCA_fn_getImageAsEditorPreview = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_getImageAsEditorPreview.sqf";
MCA_fn_getImageAsPicture = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_getImageAsPicture.sqf";
MCA_fn_getImageAsIcon = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_getImageAsIcon.sqf";
MCA_fn_getImageAsClassParameter = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_getImageAsClassParameter.sqf";
MCA_fn_filterClasses = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_filterClasses.sqf";
MCA_fn_strHasPrefix = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_strHasPrefix.sqf";
MCA_fn_getClassDescription = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_getClassDescription.sqf";
MCA_fn_getVehicleParameters = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_getVehicleParameters.sqf";
MCA_fn_getObjectDimensions = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_getObjectDimensions.sqf";
MCA_fn_getObjectDiagonal = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_getObjectDiagonal.sqf";
MCA_fn_onSpawnVehicleButtonClick = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_onSpawnVehicleButtonClick.sqf";
MCA_fn_spawnVehicle = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_spawnVehicle.sqf";
MCA_fn_saveSettings = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_saveSettings.sqf";
MCA_fn_loadSettings = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_loadSettings.sqf";
MCA_fn_finVehicleViewerDialog = compile preprocessFileLineNumbers "MCA_VehicleViewer\functions\MCA_fn_finVehicleViewerDialog.sqf";

// Work.
call MCA_fn_initPlayer;
