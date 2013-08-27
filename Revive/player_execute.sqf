private ["_uncon","_hasKnife","_Blood","_isBandit","_isHero"];
_uncon = cursorTarget getVariable ["NORRN_unconscious", false];
_hasKnife = "ItemKnife" in items player;
_Blood = cursorTarget getVariable ["USEC_BloodQty", 0];
_isBandit = (cursortarget getVariable["humanity",0]) <= -2500;
_isHero = (cursortarget getVariable["humanity",0]) >= 5000;

_rnum = random 100;

if (_uncon && _hasKnife && (_Blood < 100)) then {
	player playActionNow "Medic";	
	sleep 8;
	cursortarget setdamage 1;
	if (_isBandit) then {
		[player,+250] call player_humanityChange;
		_id = dayzHumanity spawn player_humanityChange;
		cutText ["You've executed a bandit, +250 humanity.", "PLAIN DOWN"];
	};
	if (!_isHero and !_isBandit) then {
		[player,-500] call player_humanityChange;
		_id = dayzHumanity spawn player_humanityChange;
		cutText ["You've executed a survivor, -500 humanity.", "PLAIN DOWN"];
	};
	if (_isHero) then {
		[player,-1000] call player_humanityChange;
		_id = dayzHumanity spawn player_humanityChange;
		cutText ["You've executed a hero, -1000 humanity.", "PLAIN DOWN"];
	};
};
player removeAction s_player_execute;
s_player_execute = -1;

//Thanks to Shelby for his tireless assistance with testing, only a true friend will let you execute him hundreds of times. :) //
//Thanks to Matt L for assistance.//