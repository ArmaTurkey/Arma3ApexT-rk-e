//เขียนโดย superogira - fb.com/superogira , catgg.com/arma3dev , fb.com/groups/arma3devthailand

//_killfeed = true;

//if (_killfeed) then {
	//while {true} do {
addMissionEventHandler ["EntityKilled", 
{
			_killerName = "";
			_victimName = "";
	
			_victim = _this select 0;
			_killer = _this select 1;
			
			if (!(_victim isKindOf "AllVehicles")) exitWith {};
			
			if (!(isplayer _killer)) then {
				_killerName = getText (configFile >> "CfgVehicles" >> format["%1",typeOf _killer] >> "Displayname");
				//_killerName = name _killer;
				//_killerName = format ["%1 (=AI=)",name _killer];
				if(vehicle _killer != _killer) then {_killerName = getText (configFile >> "CfgVehicles" >> format["%1 crew",typeof vehicle _killer] >> "Displayname")};
			}else{_killerName = name _killer;};

			if (!(isplayer _victim)) then {
				_victimName = getText (configFile >> "CfgVehicles" >> format["%1",typeOf _victim] >> "Displayname");
				//_victimName = name _victim;
				//_victimName = format ["%1 (=AI=)",name _victim];
				if(vehicle _victim != _victim) then {_victimName = getText (configFile >> "CfgVehicles" >> format["%1 crew",typeof vehicle _victim] >> "Displayname")};
			}else{_victimName = name _victim;};
	
			_weapon = currentWeapon _killer;
			_txt = gettext (configFile >> "cfgWeapons" >> _weapon >> "displayName");
			_pic = gettext (configFile >> "cfgWeapons" >> _weapon >> "picture");
			if (_pic == "") then {
				_weapon = typeOf (vehicle _killer);
				_pic = (getText (configFile >> "cfgVehicles" >> _weapon >> "picture"));
			};
			_dist = round (_victim distance _killer);
			if (_killer == _victim) exitWith{};
		
			catgivegames_kill_feed = [_killerName, _victimName, _txt, _dist, _pic];
			//[catgivegames_kill_feed] call catgg_fnc_killfeed;
			[catgivegames_kill_feed] remoteExec ["catgg_fnc_killfeed",0,false];
			/*publicVariable "catgivegames_kill_feed";
			"catgivegames_kill_feed" remoteExec ["publicVariable"];
			_killeruid = getPlayerUID _killer;
			_victimuid = getPlayerUID _victim;
			_diaglogkill = format["%1 (http://steamcommunity.com/profiles/%2 ) kill %3 (http://steamcommunity.com/profiles/%4 ) - with %5 - distance %6 m.",_killerName, _killeruid, _victimName, _victimuid, _txt, _dist];
			[_diaglogkill] remoteExec ["catgg_fnc_diaglogkill",0,false];
			[_killerName,_victimName,_txt,_dist] remoteExec ["catgg_fnc_killsystemchat",0,false];*/
}];
/*
		{
			_id = "";
			_id = _x addMPEventHandler ["mpkilled", {

			_killerName = "";
			_victimName = "";
	
			_victim = _this select 0;
			_killer = _this select 1;
			
			if (!(isplayer _killer)) then {
				//_killerName = getText (configFile >> "CfgVehicles" >> format["%1",typeOf _killer] >> "Displayname");
				//_killerName = name _killer;
				_killerName = format ["%1 (=AI=)",name _killer];
				if(vehicle _killer != _killer) then {_killerName = getText (configFile >> "CfgVehicles" >> format["%1 crew",typeof vehicle _killer] >> "Displayname")};
			}else{_killerName = name _killer;};

			if (!(isplayer _victim)) then {
				//_victimName = getText (configFile >> "CfgVehicles" >> format["%1",typeOf _victim] >> "Displayname");
				//_victimName = name _victim;
				_victimName = format ["%1 (=AI=)",name _victim];
				if(vehicle _victim != _victim) then {_victimName = getText (configFile >> "CfgVehicles" >> format["%1 crew",typeof vehicle _victim] >> "Displayname")};
			}else{_victimName = name _victim;};
	
			_weapon = currentWeapon _killer;
			_txt = gettext (configFile >> "cfgWeapons" >> _weapon >> "displayName");
			_pic = gettext (configFile >> "cfgWeapons" >> _weapon >> "picture");
			if (_pic == "") then {
				_weapon = typeOf (vehicle _killer);
				_pic = (getText (configFile >> "cfgVehicles" >> _weapon >> "picture"));
			};
			_dist = round (_victim distance _killer);
			if (_killer == _victim) exitWith{};
			
			catgivegames_kill_feed = [_killerName, _victimName, _txt, _dist, _pic];
			publicVariable "catgivegames_kill_feed";
			"catgivegames_kill_feed" remoteExec ["publicVariable"];
			_killeruid = getPlayerUID _killer;
			_victimuid = getPlayerUID _victim;
			_diaglogkill = format["%1 (http://steamcommunity.com/profiles/%2 ) kill %3 (http://steamcommunity.com/profiles/%4 ) - with %5 - distance %6 m.",_killerName, _killeruid, _victimName, _victimuid, _txt, _dist];
			[_diaglogkill] remoteExec ["catgg_fnc_diaglogkill",0,false];
			[_killerName,_victimName,_txt,_dist] remoteExec ["catgg_fnc_killsystemchat",0,false];
			}];
		} foreach playableUnits; 
//	sleep 20;
//	};
//};