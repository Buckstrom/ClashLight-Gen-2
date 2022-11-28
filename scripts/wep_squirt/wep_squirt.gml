// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wep_squirt(attack){
	useLureKB = true;
	useCombo = true;
	var _splashFactor = 0.25
	//prestige check
	switch (check_for_prestige(attack.attacker, attack.trackname)) {
		default:
		break;
		case 1:
		_splashFactor = 0.5
		break;
		//Legacy Prestige 1.3: Soak adjacent enemies (if possible)
		case 3:
		for (var i = attack.target - 1; i <= attack.target + 1; ++i) {
			var _soakTarget = targetRow[| i];
			if (!is_undefined(_soakTarget)) {
				debuff_single(i, "soaked", attack.factor + 1, 0, 0)
			}
		}
		break;
	}
	//AoE splash basekit
	var _splashDamage = ceil(attack.damage * _splashFactor)
	for (var i = attack.target - 1; i <= attack.target + 1; ++i) {
		var _soakTarget = targetRow[| i];
		if (!is_undefined(_soakTarget)) {
			debuff_single(i, "soaked", attack.factor, 0, 0)
			if i = attack.target {
				//Apply damage
				damage_target(attack, comboBase);
			}
			else {
				takeDamage(ds_list_find_value(targetRow, i), _splashDamage, true)
			}
		}
	}
}