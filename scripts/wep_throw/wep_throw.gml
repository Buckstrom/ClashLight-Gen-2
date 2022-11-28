// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wep_throw(attack){
	useLureKB = true;
	useCombo = true;
	//1.3 Change: Mark is basekit, 1 Turn
	var _markFactor = 1.10
	var _markDuration = 1
	var _enemy = ds_list_find_value(targetRow, attack.target)
	switch (check_for_prestige(attack.attacker, attack.trackname)) {
		default:
		break;
		//Legacy Prestige 1.3: Apply stackable Mark
		case 2:
		var _markFactor = 1.08
		var _markAdd = 0.04
		var _markDuration = 1
		//check if already marked
		switch (ds_map_exists(_enemy.debuffs, "marked")) {
			case true:
			if (_enemy.debuffs[? "marked"][debuff_properties.duration] = _markDuration) {
			}
			break;
			case false:
			debuff_target(attack, "marked", _markDuration, _markFactor, 0)
			break;
		}
		break;
		//Legacy Prestige 1.2: 15% damage bonus
		case 3:
		attack.damage = ceil(1.15 * attack.damage)
		break;
	}
	//Apply Mark
	debuff_target(attack, "marked", _markDuration, _markFactor, 0)
	
	//Apply Damage
	damage_target(attack, comboBase)
}