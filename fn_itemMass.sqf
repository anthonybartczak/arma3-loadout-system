params ["_item"];

if (isClass (configFile>>"CfgWeapons">> _item >> "ItemInfo")) exitWith {
     getNumber(configFile>>"CfgWeapons">> _item >> "ItemInfo" >> "Mass");
};
if (isClass (configFile>>"CfgWeapons">> _item >> "WeaponSlotsInfo")) exitWith {
     getNumber(configFile>>"CfgWeapons">> _item >> "WeaponSlotsInfo" >> "Mass")
};
if (isClass (configFile>>"CfgMagazines">> _item)) exitWith {
     getNumber(configFile>>"CfgMagazines">> _item >> "Mass");
};
if (isClass (configFile>>"CfgVehicles">> _item)) exitWith  {
     getNumber(configFile>>"CfgVehicles">> _item >> "Mass");
};
if (isClass (configFile>>"CfgGlasses">> _item)) exitWith  {
     getNumber(configFile>>"CfgGlasses">> _item >> "Mass");
};