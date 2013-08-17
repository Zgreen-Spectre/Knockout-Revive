// animHealed.sqf
_array = _this; //_this select 0;
_unit = _array select 0;
_medic = _array select 1;

_isDead = _unit getVariable["USEC_isDead",false];
_Bamount = 1050;
if (local _unit) then {_unit setCaptive false};

if (!_isDead) then {
	_Bamount = 1050;
	_unit switchMove "AmovPpneMstpSnonWnonDnon_healed";
	//no need to public broadcast the variables since this runs on every peer
	_unit setVariable ["NORRN_unconscious", false, false];
	_unit setVariable ["USEC_isCardiac",false, false];
	_unit setVariable["USEC_BloodQty",r_player_blood,true];
	if (_unit == player) then {
		r_player_unconscious = false;
		disableUserInput false;
		r_player_cardiac = false;
		r_player_handler1 = false;
		r_player_blood = _Bamount;
	};

	if (isServer) then {
		_unit setVariable["medForceUpdate",true];
	};
};