// private _caseName = "base"; 
// private _unitGear = str(getUnitLoadout player); 
// private _br = toString [13,10];  
// private _gearText = format ['case "%1": { _data = ', _caseName] + _unitGear + _br;  
// _gearText = _gearText + format ["};"] + _br + _br;  
// copyToClipboard _gearText;

//nul = [player, "base", true, true, true, true, true] execVM "cn_setLoadout.sqf";

#include "cn_itemList.sqf";

//________________ RANDOMIZATION VARIABLES ________________

private _unit = _this select 0;
private _data = _this select 1;

private _randomizePrimary = _this select 2;
private _randomizeSecondary = _this select 3;

private _randomizeUniform = _this select 4;
private _randomizeHelmet = _this select 5;
private _randomizeBackpack = _this select 6;

//________________ CLEAR INVENTORY ________________

removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeUniform _unit;

if (!isNil "_uniform") then {
  clearMagazineCargoGlobal (uniformContainer _unit);
  clearItemCargoGlobal (uniformContainer _unit);
  clearWeaponCargoGlobal (uniformContainer _unit);
};

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

//________________ SET UNIT LOADOUT ________________

_unit setUnitLoadout _data;