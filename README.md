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
### 4. Paste the clipboard into your case.sqf file.
![](https://i.imgur.com/5ITRG6C.png)

### 5. Change the case name according to your preference. This way you can add multiple cases.
![](https://i.imgur.com/sRqn8UK.png)

### 6. Paste the following code into your units init field.
```sqf
nul = [player, "base", true, true, true, true, true] execVM "setLoadout.sqf";
```
