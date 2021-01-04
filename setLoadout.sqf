private _unit = _this select 0;
private _class = _this select 1;


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

handgunBase = [
  "Tier1_Glock19_WAR",
  "Tier1_Glock19_Urban_TB",
  "Tier1_Glock19_WAR_TB"
];

//________________ DEFINE VARIABLES ________________

private _vest = [];
private _helmet = selectRandom uniformHelmet;
private _uniform = selectRandom uniformBody;
private _backpack = selectRandom uniformBackpack;
private _binos = ["ACE_Vector", "", "", "", [],[], ""];

private _gun = selectRandom primaryWeaponsBase;
private _handgun = selectRandom handgunBase;
private _launcher = "";

private _optics = selectRandom weaponOptics;
private _bipod = selectRandom weaponBipod;
private _attachment = selectRandom weaponAttachment;
private _silencer = "";

private _magazinePrimary = ["Tier1_30Rnd_556x45_Mk318Mod0_EMag", 30];
private _magazineSecondary = ["Tier1_15Rnd_9x19_JHP", 15];
private _magazineLauncher = "";

//________________ SWITCH FOR DIFFERENT CLASSES ________________

switch _class do {
  case "base": {
    _silencer = "Tier1_KAC_556_QDC_CQB_Black";
    _vest = ["milgp_v_mmac_assaulter_belt_MC", [["rhs_mag_an_m8hc", 2, 1],["rhs_mag_m67", 2, 1],["ACE_M84", 2, 1],["B_IR_Grenade", 3, 1],["Tier1_30Rnd_556x45_Mk318Mod0_EMag", 8, 30]]];
  };

  case "tl": {
    _vest = ["milgp_v_mmac_teamleader_belt_MC", [["rhs_mag_an_m8hc", 2, 1],["rhs_mag_m67", 2, 1],["ACE_M84", 2, 1],["B_IR_Grenade", 3, 1],["Tier1_30Rnd_556x45_Mk318Mod0_EMag", 8, 30]]];
    _launcher = "rhs_weap_m72a7";
  };

  case "ar": {
    _gun = "Tier1_MK46_Mod1";
    _silencer = "Tier1_KAC_556_QDC_CQB_Black";
    _attachment = "Tier1_Mk46Mod1_LA5_M600V_Black_FL";
    _optics = "Tier1_Elcan_156_C1_Black";
    _bipod = "Tier1_DD_VFG_Black";
    _magazinePrimary = ["rhsusf_200rnd_556x45_mixed_box", 200];
    _vest = ["milgp_v_mmac_hgunner_belt_MC", [["rhs_mag_an_m8hc", 2, 1],["rhs_mag_m67", 2, 1],["B_IR_Grenade", 3, 1],["ACE_M84", 2, 1],["rhsusf_200rnd_556x45_mixed_box", 2, 200]]];
  };

  case "medic": {
    _vest = ["milgp_v_mmac_medic_belt_MC", [["rhs_mag_an_m8hc", 2, 1],["rhs_mag_m67", 2, 1],["ACE_M84", 2, 1],["B_IR_Grenade", 3, 1],["Tier1_30Rnd_556x45_Mk318Mod0_EMag", 8, 30]]];
    _backpack = ["B_Kitbag_mcamo", [
    ["ACE_fieldDressing", 15],
    ["ACE_elasticBandage", 15],
    ["ACE_quikclot", 15],
    ["ACE_tourniquet", 10],
    ["ACE_packingBandage", 15],
    ["ACE_splint", 4],
    ["kat_chestSeal", 2],
    ["kat_Pulseoximeter", 2],
    ["kat_larynx", 6],
    ["kat_accuvac", 1],
    ["kat_aatKit", 5],
    ["ACE_epinephrine", 5],
    ["ACE_morphine", 5],
    ["ACE_salineIV_500", 8],
    ["kat_AED", 1],
    ["kat_Painkiller", 10, 10]]];
  };

  case "dmr": {
    _gun = "Tier1_M110k5";
    _silencer = "Tier1_SandmanS_Desert";
    _attachment = "Tier1_URX4_NGAL_M600V_alt_FL";
    _optics = "Tier1_Shortdot_Geissele_Docter_Tan";
    _magazinePrimary = ["Tier1_20Rnd_762x51_Mk316Mod0_SR25_Mag", 20];
    _bipod = "Tier1_Harris_Bipod_RVG_MLOK_Tan";
    _vest = ["milgp_v_mmac_marksman_belt_MC", [["ACE_Kestrel4500", 1],["ACE_RangeCard", 1],["Tier1_20Rnd_762x51_Mk316Mod0_SR25_Mag", 8, 20],["B_IR_Grenade", 3, 1],["rhs_mag_an_m8hc", 2, 1],["rhs_mag_m67", 2, 1]]];
  };
};

//________________ SET UNIT LOADOUT ________________

_unit setUnitLoadout [
  [_gun, _silencer, _attachment, _optics, _magazinePrimary, [], _bipod], // Primary weapon
  [_launcher, "", "", "", _magazineLauncher, [], ""], // Launcher
  [_handgun, "", "", "", _magazineSecondary, [], ""], // Handgun
  [_uniform, [ // Uniform
    ["ACE_fieldDressing", 2],
    ["ACE_elasticBandage", 2],
    ["ACE_packingBandage", 2],
    ["ACE_quikclot", 2],
    ["ACE_tourniquet", 2],
    ["ACE_morphine", 2],
    ["kat_chestSeal", 2],
    ["ACE_MapTools", 1],
    ["ACE_microDAGR", 1],
    ["ACE_Flashlight_XL50", 1],
    ["ACE_CableTie", 2]
  ]],
  _vest, // Vest
  _backpack, // Backpack
  _helmet, // Helmet
  "", _binos,
  ["ItemMap", "", "TFAR_anprc152", "ItemCompass", "TFAR_microdagr", "rhsusf_ANPVS_15"]
];