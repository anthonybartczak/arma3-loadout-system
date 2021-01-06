// private _caseName = "base"; 
// private _unitGear = str(getUnitLoadout player); 
// private _br = toString [13,10];  
// private _gearText = format ['case "%1": { _data = ', _caseName] + _unitGear + _br;  
// _gearText = _gearText + format ["};"] + _br + _br;  
// copyToClipboard _gearText;

//nul = [player, "base", true, true, true, true, true] execVM "cn_setLoadout.sqf";

#include "cn_itemList.sqf";

//________________ RANDOMIZATION VARIABLES ________________

private ["_unit", "_data", "_randomizePrimary", "_randomizeSecondary", "_randomizeUniform", "_randomizeHelmet", "_randomizeBackpack"];

_unit = _this select 0;
_data = _this select 1;

_randomizePrimary = _this select 2;
_randomizeSecondary = _this select 3;

_randomizeUniform = _this select 4;
_randomizeHelmet = _this select 5;
_randomizeBackpack = _this select 6;

//________________ CLEAR INVENTORY ________________

if (!isNil "_uniform") then {
  clearMagazineCargoGlobal (uniformContainer _unit);
  clearItemCargoGlobal (uniformContainer _unit);
  clearWeaponCargoGlobal (uniformContainer _unit);
};

removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeUniform _unit;

//________________ INCLUDE CASE ________________

switch (_data) do 
{
	#include "cn_caseList.sqf";
};

//________________ CHECK FOR RANDOMIZATION VARIABLES ________________

if (_randomizePrimary == true) then {
  [_data, [0, 0], selectRandom _primaryWeapons] call BIS_fnc_setNestedElement;
  [_data, [0, 1], selectRandom _primarySilencer] call BIS_fnc_setNestedElement;
  [_data, [0, 2], selectRandom _primaryAttachment] call BIS_fnc_setNestedElement;
  [_data, [0, 3], selectRandom _primaryOptics] call BIS_fnc_setNestedElement;
  [_data, [0, 6], selectRandom _primaryBipod] call BIS_fnc_setNestedElement;
};

if (_randomizeSecondary == true) then {[_data, [2, 0], selectRandom _secondaryWeapons] call BIS_fnc_setNestedElement;};

if (_randomizeUniform == true) then {[_data, [3, 0], selectRandom _uniformBody] call BIS_fnc_setNestedElement};
if (_randomizeHelmet == true) then {[_data, [6], selectRandom _uniformHelmet] call BIS_fnc_setNestedElement};
if (_randomizeBackpack == true) then {[_data, [5, 0], selectRandom _uniformBackpack] call BIS_fnc_setNestedElement};

//________________ PERFORM CONTAINER LOAD CHECKS ________________

private ["_maxLoadUniform", "_maxLoadVest", "_maxLoadBackpack", "_currentUniformItems", "_currentVestItems", "_currentBackpackItems", "_massTotalBackpack", "_massTotalVest", "_massTotalUniform"];

_maxLoadUniform = getContainerMaxLoad ([_data, [3, 0]] call BIS_fnc_returnNestedElement);
_maxLoadVest = getContainerMaxLoad ([_data, [4, 0]] call BIS_fnc_returnNestedElement);
_maxLoadBackpack = getContainerMaxLoad ([_data, [5, 0]] call BIS_fnc_returnNestedElement);

_currentUniformItems = [_data, [3, 1]] call BIS_fnc_returnNestedElement;
_currentVestItems = [_data, [4, 1]] call BIS_fnc_returnNestedElement;
_currentBackpackItems = [_data, [5, 1]] call BIS_fnc_returnNestedElement;

_massTotalBackpack = 0;
_massTotalVest = 0;
_massTotalUniform = 0;

{
  _massTotalBackpack = _massTotalBackpack + (_x select 1) * ([_x select 0] call cn_fnc_itemMass);
} forEach _currentBackpackItems;

{
  _massTotalVest = _massTotalVest + (_x select 1) * ([_x select 0] call cn_fnc_itemMass);
} forEach _currentVestItems;

{
  _massTotalUniform = _massTotalUniform + (_x select 1) * ([_x select 0] call cn_fnc_itemMass);
} forEach _currentUniformItems;

if ((_maxLoadBackpack < _massTotalBackpack) || (_maxLoadVest < _massTotalVest) || (_maxLoadUniform < _massTotalUniform)) then {hint format["Unit %1 exceeded container load limit.", _unit];};

//________________ SET UNIT LOADOUT ________________

_unit setUnitLoadout _data;