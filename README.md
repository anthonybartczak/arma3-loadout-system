# How to:

### 1. Download and unpack the script in your scenario directory.
![](https://i.imgur.com/wJcTnCE.png)


### 2. Create and apply your loadout via ACE Arsenal.


### 3. Enter developer console (ctrl + d), paste in the code below and execute.
```sqf
private _caseName = "base"; 
private _unitGear = str(getUnitLoadout player); 
private _br = toString [13,10];  
private _gearText = format ['case "%1": { _data = ', _caseName] + _unitGear + _br;  
_gearText = _gearText + format ["};"] + _br + _br;  
copyToClipboard _gearText;
```


### 4. Paste the clipboard into your ```cn_caseList.sqf``` file.
```sqf
case "base": { _data = [["Tier1_SR16_CQB_Mod2_IMOD_Black","Tier1_KAC_556_QDC_CQB_Black","Tier1_URX4_NGAL_M603V","Tier1_EXPS3_2_3xMag_Black_Up",["Tier1_30Rnd_556x45_Mk318Mod0_EMag",30],[],"Tier1_AFG_MLOK_Black"],["rhs_weap_m72a7","","","",[],[],""],["Tier1_Glock19_Urban","","Tier1_X300U","",["Tier1_15Rnd_9x19_JHP",15],[],""],["Project_BJC_Shirt_Cut_Jean2",[["ACE_fieldDressing",2],["ACE_elasticBandage",2],["ACE_packingBandage",2],["ACE_quikclot",2],["ACE_tourniquet",2],["ACE_morphine",2],["kat_chestSeal",2],["ACE_MapTools",1],["ACE_microDAGR",1],["ACE_Flashlight_XL50",1],["ACE_CableTie",2]]],["milgp_v_mmac_assaulter_belt_MC",[["Tier1_30Rnd_556x45_Mk318Mod0_EMag",8,30],["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",2,1],["ACE_M84",2,1],["B_IR_Grenade",3,1]]],["milgp_bp_hydration_mc",[]],"opscoretc","",["ACE_Vector","","","",[],[],""],["ItemMap","","TFAR_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]]
};
```


### 5. Change the case name according to your preference. This way you can add multiple cases.
```sqf
case "base": { _data = [["Tier1_SR16_CQB_Mod2_IMOD_Black","Tier1_KAC_556_QDC_CQB_Black","Tier1_URX4_NGAL_M603V","Tier1_EXPS3_2_3xMag_Black_Up",["Tier1_30Rnd_556x45_Mk318Mod0_EMag",30],[],"Tier1_AFG_MLOK_Black"],["rhs_weap_m72a7","","","",[],[],""],["Tier1_Glock19_Urban","","Tier1_X300U","",["Tier1_15Rnd_9x19_JHP",15],[],""],["Project_BJC_Shirt_Cut_Jean2",[["ACE_fieldDressing",2],["ACE_elasticBandage",2],["ACE_packingBandage",2],["ACE_quikclot",2],["ACE_tourniquet",2],["ACE_morphine",2],["kat_chestSeal",2],["ACE_MapTools",1],["ACE_microDAGR",1],["ACE_Flashlight_XL50",1],["ACE_CableTie",2]]],["milgp_v_mmac_assaulter_belt_MC",[["Tier1_30Rnd_556x45_Mk318Mod0_EMag",8,30],["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",2,1],["ACE_M84",2,1],["B_IR_Grenade",3,1]]],["milgp_bp_hydration_mc",[]],"opscoretc","",["ACE_Vector","","","",[],[],""],["ItemMap","","TFAR_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]]
};

case "medic": { _data = [["Tier1_SR16_CQB_Mod2_IMOD_Black","Tier1_KAC_556_QDC_CQB_Black","Tier1_URX4_NGAL_M603V","Tier1_EXPS3_2_3xMag_Black_Up",["Tier1_30Rnd_556x45_Mk318Mod0_EMag",30],[],"Tier1_AFG_MLOK_Black"],[],["Tier1_Glock19_Urban","","Tier1_X300U","",["Tier1_15Rnd_9x19_JHP",15],[],""],["Project_BJC_Shirt_Cut_Jean2",[["ACE_fieldDressing",2],["ACE_elasticBandage",2],["ACE_packingBandage",2],["ACE_quikclot",2],["ACE_tourniquet",2],["ACE_morphine",2],["kat_chestSeal",2],["ACE_MapTools",1],["ACE_microDAGR",1],["ACE_Flashlight_XL50",1],["ACE_CableTie",2]]],["milgp_v_mmac_assaulter_belt_MC",[["Tier1_30Rnd_556x45_Mk318Mod0_EMag",8,30],["rhs_mag_an_m8hc",2,1],["rhs_mag_m67",2,1],["ACE_M84",2,1],["B_IR_Grenade",3,1]]],["B_Kitbag_mcamo",[["ACE_fieldDressing",15],["ACE_elasticBandage",15],["ACE_quikclot",15],["ACE_tourniquet",10],["ACE_packingBandage",15],["ACE_splint",4],["kat_chestSeal",2],["kat_Pulseoximeter",2],["kat_larynx",6],["kat_accuvac",1],["kat_aatKit",5],["ACE_epinephrine",5],["ACE_morphine",5],["ACE_salineIV_500",8],["kat_AED",1],["kat_Painkiller",10,10]]],"opscoretc","",["ACE_Vector","","","",[],[],""],["ItemMap","","TFAR_anprc152","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]]
};
```


### 6. Paste the execVM code into your units init field.
```sqf
nul = [this, "base", true, true, true, true, true] execVM "setLoadout.sqf";
```

### 8. Modify the parameters.
```sqf
nul = [

  this, // Refers to player's character
  "base", // Case name
  true, // Randomize primary weapon
  true, // Randomize secondary weapon
  true, // Randomize uniform
  true, // Randomize helmet
  true // Randomize backpack
  
] execVM "cn_setLoadout.sqf";
```


### 7. Tweak the ```cn_itemList.sqf``` to use proper randomized classnames.
