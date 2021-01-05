// private _caseName = "base"; 
// private _unitGear = str(getUnitLoadout player); 
// private _br = toString [13,10];  
// private _gearText = format ['case "%1": { _data = ', _caseName] + _unitGear + _br;  
// _gearText = _gearText + format ["};"] + _br + _br;  
// copyToClipboard _gearText;

//nul = [player, "medic", true, true, true, true, true] execVM "setLoadout.sqf";

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

//________________ DEFINE ITEM LISTS ________________

primaryWeaponsBase = [
  "Tier1_SR16_CQB_Mod2_CTR_Black",
  "Tier1_SR16_CQB_Mod2_CTR_FDE",
  "Tier1_SR16_Carbine_Mod2_CTR_Black",
  "Tier1_SR16_Carbine_Mod2_CTR_FDE",
  "Tier1_SR16_Carbine_Mod2_MFT_Black"
];

uniformBody = [
  "Project_BJC_Cargo12",
  "Project_BJC_Cargo15",
  "Project_BJC_Shirt_Cut_Cargo9",
  "Project_BJC_Shirt_Cut_Cargo6",
  "Project_BJC_Shirt_Cargo3",
  "Project_BJC_Shirt_Cargo19",
  "Project_BJC_Shirt_Cut_Cargo1",
  "Project_BJC_Shirt_Jean3",
  "Project_BJC_PCU_Jean_blk3",
  "Project_BJC_PCU_Jean_blk4",
  "Project_BJC_PCU_Jean_blk1"
];

uniformBackpack = [
  ["milgp_bp_Breacher_mc", []],
  ["milgp_bp_hydration_mc", []],
  ["milgp_bp_Pointman_mc", []],
  ["milgp_bp_Tomahawk_mc", []]
];

uniformHelmet = [
  "rhsusf_opscore_rg_cover_pelt",
  "rhsusf_opscore_ut_pelt_nsw_cam",
  "rhsusf_opscore_paint_pelt_nsw_cam",
  "rhsusf_opscore_mc_cover_pelt_cam",
  "rhsusf_opscore_fg_pelt_nsw",
  "rhsusf_opscore_coy_cover_pelt"
];

weaponOptics = [
  "tier1_microt2_leap_g33_black_up",
  "tier1_microt1_leap_3xmag_black_up",
  "tier1_exps3_2_3xmag_black_up",
  "tier1_razor_gen2_16",
  "tier1_eotech553_3xmag_black_up"
];

weaponBipod = [
  "tier1_rvg_mlok_black",
  "tier1_afg_mlok_black",
  "tier1_dd_mlok_vfg_black"
];

weaponAttachment = [
  "tier1_urx4_ngal_m603v",
  "tier1_urx4_ngal_m300c_black",
  "tier1_urx4_la5_m300c_black"
];

primarySilencer = [
  "Tier1_KAC_556_QDC_CQB_Black"
];

handgunBase = [
  "Tier1_Glock19_WAR",
  "Tier1_Glock19_Urban_TB",
  "Tier1_Glock19_WAR_TB"
];

private _magazinePrimary = ["Tier1_30Rnd_556x45_Mk318Mod0_EMag", 30];

//________________ INCLUDE CASE ________________

switch (_data) do 
{
	#include "case.sqf"
};

//________________ CHECK FOR RANDOMIZATION VARIABLES ________________

if (_randomizePrimary == true) then {
  [_data, [0, 0], selectRandom primaryWeaponsBase] call BIS_fnc_setNestedElement;
  [_data, [0, 1], selectRandom primarySilencer] call BIS_fnc_setNestedElement;
  [_data, [0, 2], selectRandom weaponAttachment] call BIS_fnc_setNestedElement;
  [_data, [0, 3], selectRandom weaponOptics] call BIS_fnc_setNestedElement;
  [_data, [0, 4], _magazinePrimary] call BIS_fnc_setNestedElement;};
  [_data, [0, 6], selectRandom weaponBipod] call BIS_fnc_setNestedElement;

if (_randomizeSecondary == true) then {[_data, [2, 0], selectRandom handgunBase] call BIS_fnc_setNestedElement;};

if (_randomizeUniform == true) then {[_data, [3, 0], selectRandom uniformBody] call BIS_fnc_setNestedElement};
if (_randomizeHelmet == true) then {[_data, [6], selectRandom uniformHelmet] call BIS_fnc_setNestedElement};
if (_randomizeBackpack == true) then {[_data, [5], selectRandom uniformBackpack] call BIS_fnc_setNestedElement};

//________________ SET UNIT LOADOUT ________________

_unit setUnitLoadout _data;