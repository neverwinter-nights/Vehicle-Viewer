// MCA_fn_saveSettings.sqf.

params ["_player", "_classKind", "_classPrefix", "_classFilter"];

_player setVariable [MCA_VehicleViewer_VarName_LastSettings, [_classKind, _classPrefix, _classFilter]];
