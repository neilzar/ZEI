params [
		["_mode", "", [""]],
		["_input", [], [[]]]//,
		//["_setVar", true, [true]]
	];

switch _mode do {
	case "init": {
		_input params [
				["_logic", objNull, [objNull]],
				["_isActivated", true, [true]],
				["_isCuratorPlaced", false, [true]]
			];
		
		// Need to pass logic pos info to GUI somehow?
		ZEI_LastPos = getPos _logic;
		
		// Start Display 1704
		if ((inputAction "lookAround") isEqualTo 1) then {
			// Skip UI and use default values.
			[] call ZEI_fnc_ui_objectFill;
		} else {
			if (_isCuratorPlaced) then { 
				findDisplay 312 createDisplay "Rsc_ZEI_ObjectFill";  // Zeus
			} else {
				if (is3DEN) then {
					findDisplay 313 createDisplay "Rsc_ZEI_ObjectFill"; // Eden
				} else {
					createDialog "Rsc_ZEI_ObjectFill";
				};
			};
		};
		
		// Delete the module to prevent any dependencies.
		if (_logic isKindOf "Logic") then {
			if (is3DEN) then {delete3DENEntities [_logic]} else {deleteVehicle _logic};
		};
	};
};